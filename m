Return-Path: <vanusuri@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9A8EC35274
	for <webhook@archiver.kernel.org>; Mon, 18 Dec 2023 04:48:12 +0000 (UTC)
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
 by mx.groups.io with SMTP id smtpd.web10.35541.1702874890962840850
 for <openembedded-core@lists.openembedded.org>;
 Sun, 17 Dec 2023 20:48:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=Zk6LqOio;
 spf=pass (domain: mvista.com, ip: 209.85.210.173, mailfrom: vanusuri@mvista.com)
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-6d7395ab92cso148974b3a.2
        for <openembedded-core@lists.openembedded.org>; Sun, 17 Dec 2023 20:48:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1702874889; x=1703479689; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=o1wSUkUwAz7pbZSr3Yql6f9XBmobqclBJNEV1gt+Peg=;
        b=Zk6LqOioRby4FVFueR95oil2fP43vDd0i6ynREH4/+Oca0eJPvLnTGYL3XrwxmogoU
         ZiDlfiSYgEFk50SZoFSsUmjQe+Mm+NVPNjvt6hPfFkLiEUF14tSGr2b/txJeKlhJjP/e
         1XphABPvSJj8EiFsu6TPlVADjsz2J5oGA0X4c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702874889; x=1703479689;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=o1wSUkUwAz7pbZSr3Yql6f9XBmobqclBJNEV1gt+Peg=;
        b=eM1HcHBs4Eqgi9dgJtCMeBvseRPc4Z33vsgbTnZ/LcUeKZfOTbgUL0mbc55Qydayit
         +5FVWrgHjYD6KCv2/VRL7T2ss6AclIK9vaD/IvH0NuZW1ti6bieU+ZhM+EddxponV5ge
         FFnRUdoAKRQJrUMezyazdEI4VHfWTWaZoEq9zcFgWMi6NGSijgk5q7o2CWrm3GKqeoRV
         sgy/mWUhr7OX0YtZq6CeKW6wJoQ4ZLR4cWnFSDBzUh0iLWuBWpD4RW61sYLbZEpvFmgc
         dZxLp7hD2KUpvjYuF5tqVyg75iP+WEKaAZeTrbANgvkisj0xvvQRhjd7K6ZQkWB2LPCg
         BvHA==
X-Gm-Message-State: AOJu0YyT6ENHcVBNDHDm9g7mDfJJpWNAxDhCFkNuN3Amh7TMvIqVMk6R
	BjmN2f6iVpeIlr5IDJyUolawRc2WqIWBOPvXjSU=
X-Google-Smtp-Source: AGHT+IGYWaTDPuAac1QK34y6QwgrtUw/9LqAA23HjxhJMi9C0rePy16IHFbZ56zQoBB25jJr7c2ogA==
X-Received: by 2002:a05:6a00:b4d:b0:6cb:b7b7:c04c with SMTP id p13-20020a056a000b4d00b006cbb7b7c04cmr8630182pfo.12.1702874889427;
        Sun, 17 Dec 2023 20:48:09 -0800 (PST)
Received: from MVIN00020.mvista.com ([182.65.249.64])
        by smtp.gmail.com with ESMTPSA id t26-20020a056a00139a00b006d503ee309bsm2029792pfg.121.2023.12.17.20.48.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Dec 2023 20:48:09 -0800 (PST)
From: vanusuri@mvista.com
To: openembedded-core@lists.openembedded.org
Cc: Vijay Anusuri <vanusuri@mvista.com>
Subject: [OE-core][dunfell][PATCH] libxml2: Backport fix for CVE-2021-3516
Date: Mon, 18 Dec 2023 10:15:57 +0530
Message-Id: <20231218044557.890733-1-vanusuri@mvista.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 18 Dec 2023 04:48:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192599

From: Vijay Anusuri <vanusuri@mvista.com>

Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/libxml2/-/commit/1358d157d0bd83be1dfe356a69213df9fac0b539]

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
---
 .../libxml/libxml2/CVE-2021-3516.patch        | 35 +++++++++++++++++++
 meta/recipes-core/libxml/libxml2_2.9.10.bb    |  1 +
 2 files changed, 36 insertions(+)
 create mode 100644 meta/recipes-core/libxml/libxml2/CVE-2021-3516.patch

diff --git a/meta/recipes-core/libxml/libxml2/CVE-2021-3516.patch b/meta/recipes-core/libxml/libxml2/CVE-2021-3516.patch
new file mode 100644
index 0000000000..200f42091e
--- /dev/null
+++ b/meta/recipes-core/libxml/libxml2/CVE-2021-3516.patch
@@ -0,0 +1,35 @@
+From 1358d157d0bd83be1dfe356a69213df9fac0b539 Mon Sep 17 00:00:00 2001
+From: Nick Wellnhofer <wellnhofer@aevum.de>
+Date: Wed, 21 Apr 2021 13:23:27 +0200
+Subject: [PATCH] Fix use-after-free with `xmllint --html --push`
+
+Call htmlCtxtUseOptions to make sure that names aren't stored in
+dictionaries.
+
+Note that this issue only affects xmllint using the HTML push parser.
+
+Fixes #230.
+
+Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/libxml2/-/commit/1358d157d0bd83be1dfe356a69213df9fac0b539]
+CVE: CVE-2021-3516
+Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
+---
+ xmllint.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/xmllint.c b/xmllint.c
+index 6ca1bf54d..dbef273a8 100644
+--- a/xmllint.c
++++ b/xmllint.c
+@@ -2213,7 +2213,7 @@ static void parseAndPrintFile(char *filename, xmlParserCtxtPtr rectxt) {
+             if (res > 0) {
+                 ctxt = htmlCreatePushParserCtxt(NULL, NULL,
+                             chars, res, filename, XML_CHAR_ENCODING_NONE);
+-                xmlCtxtUseOptions(ctxt, options);
++                htmlCtxtUseOptions(ctxt, options);
+                 while ((res = fread(chars, 1, pushsize, f)) > 0) {
+                     htmlParseChunk(ctxt, chars, res, 0);
+                 }
+-- 
+GitLab
+
diff --git a/meta/recipes-core/libxml/libxml2_2.9.10.bb b/meta/recipes-core/libxml/libxml2_2.9.10.bb
index 5eac864098..aa17cd8cca 100644
--- a/meta/recipes-core/libxml/libxml2_2.9.10.bb
+++ b/meta/recipes-core/libxml/libxml2_2.9.10.bb
@@ -41,6 +41,7 @@ SRC_URI += "http://www.w3.org/XML/Test/xmlts20080827.tar.gz;subdir=${BP};name=te
            file://CVE-2023-39615-pre.patch \
            file://CVE-2023-39615-0001.patch \
            file://CVE-2023-39615-0002.patch \
+           file://CVE-2021-3516.patch \
            "
 
 SRC_URI[archive.sha256sum] = "593b7b751dd18c2d6abcd0c4bcb29efc203d0b4373a6df98e3a455ea74ae2813"
-- 
2.25.1


