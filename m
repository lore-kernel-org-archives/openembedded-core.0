Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96E8EC64ED6
	for <webhook@archiver.kernel.org>; Sun, 26 Feb 2023 17:02:36 +0000 (UTC)
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
 by mx.groups.io with SMTP id smtpd.web10.69574.1677430952976534025
 for <openembedded-core@lists.openembedded.org>;
 Sun, 26 Feb 2023 09:02:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=fdkInvvs;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.53, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f53.google.com with SMTP id y15-20020a17090aa40f00b00237ad8ee3a0so3968605pjp.2
        for <openembedded-core@lists.openembedded.org>; Sun, 26 Feb 2023 09:02:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MbxNph0IvfjM1WJj7qsLFjIGk6zc/w9uODRqNjVkd/k=;
        b=fdkInvvsn6eU0hqMT1v00cuAAcqI/erPmPZslYlxEjS6/OkeL4bFI6nR34vqnVhTEo
         eJE3saRTxbjOz5ei0/nVW2kcdQtl/NG/8eBxGc7QD+WM11FOIF4MZbUzciwv15XEtqfl
         MOsZ4/sNJ7kgDjBQGjl9SD5QH0XU+NxDeHTLXUlZhOOz4xdPKaGMZTV2RndynBC4w7r3
         92hL8DQCtmciq9Y46ZGJ1+4liDga00Fh8CM00U0EflZfgYRohDXD+dqS3gAERCdErR08
         DNeZPcQ5ZMIU2+2Q+kCMKuSV/MPfpUXQ3fPDzmnrpgNCDV8SuH+iWCWSJqwjZ+Sjal9d
         Pefg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MbxNph0IvfjM1WJj7qsLFjIGk6zc/w9uODRqNjVkd/k=;
        b=tHai8AdA1b4cM42ilWr4c8FbFUXgz+LM0E9tJ9PHpUt4RUX4syXNQgrxbETL+HM46g
         opAtxnzNdgHqYbxt1ksX05nDIXwqcIVVQ3OFJ28vseVb2p2TK8FPEF1SiZQ44ldWKect
         qrDY3KmPFlj0c1piBKHFZMHsPYjP56Qe05Ze/Qq+veNr1H45SrK95UQY2eYBwuCeGGja
         Zw4H3PFkAIgyHbUlvUZXgXEoY5d0u8T4hiNuNy0qqWt3rI3nwWpLJelFayeMarr4db7V
         BpkxgHpbpGcPwA8pAnXnMo2Y7Ozq2dg7FAC6Mwu7vleVRYv+ORSZhptwFDwOPYvL3tia
         00Yw==
X-Gm-Message-State: AO0yUKUsbGE6+KvShlmGPJqZ0Xcbl7nTk5wyPXd1QRXNjOH4kLwyyVjq
	8te0wv8ZQx+WW9X7GhePQIqHdFTufAbszibievE=
X-Google-Smtp-Source: AK7set8q6zBQTht2HQQYvrmIjIVGY/nfzyrxiOqQY2DV2JjgTTsdANcWL6Z/wFclt/dA4S2E+dFRUg==
X-Received: by 2002:a17:90b:1d82:b0:234:dc4:2006 with SMTP id pf2-20020a17090b1d8200b002340dc42006mr26961571pjb.4.1677430952021;
        Sun, 26 Feb 2023 09:02:32 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-4-112.hawaiiantel.net. [72.253.4.112])
        by smtp.gmail.com with ESMTPSA id s25-20020a63af59000000b004f1cb6ffe81sm2500856pgo.64.2023.02.26.09.02.31
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Feb 2023 09:02:31 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][langdale 01/28] less: backport the fix for CVE-2022-46663
Date: Sun, 26 Feb 2023 07:01:57 -1000
Message-Id: <78c44993a190a706a775e70fa59fd4664b20c9cb.1677430770.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1677430770.git.steve@sakoman.com>
References: <cover.1677430770.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 26 Feb 2023 17:02:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177739

From: Ross Burton <ross.burton@arm.com>

Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
(cherry picked from commit 56d31067a34bc1942c7eb4940a41ecfc81110e58)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../less/files/CVE-2022-46663.patch           | 28 +++++++++++++++++++
 meta/recipes-extended/less/less_608.bb        |  1 +
 2 files changed, 29 insertions(+)
 create mode 100644 meta/recipes-extended/less/files/CVE-2022-46663.patch

diff --git a/meta/recipes-extended/less/files/CVE-2022-46663.patch b/meta/recipes-extended/less/files/CVE-2022-46663.patch
new file mode 100644
index 0000000000..20f9d89ed8
--- /dev/null
+++ b/meta/recipes-extended/less/files/CVE-2022-46663.patch
@@ -0,0 +1,28 @@
+CVE: CVE-2022-46663
+Upstream-Status: Backport
+Signed-off-by: Ross Burton <ross.burton@arm.com>
+
+From a78e1351113cef564d790a730d657a321624d79c Mon Sep 17 00:00:00 2001
+From: Mark Nudelman <markn@greenwoodsoftware.com>
+Date: Fri, 7 Oct 2022 19:25:46 -0700
+Subject: [PATCH] End OSC8 hyperlink on invalid embedded escape sequence.
+
+---
+ line.c | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/line.c b/line.c
+index 236c49ae..cba7bdd1 100644
+--- a/line.c
++++ b/line.c
+@@ -633,8 +633,8 @@ ansi_step(pansi, ch)
+ 		/* Hyperlink ends with \7 or ESC-backslash. */
+ 		if (ch == '\7')
+ 			return ANSI_END;
+-		if (pansi->prev_esc && ch == '\\')
+-			return ANSI_END;
++		if (pansi->prev_esc)
++            return (ch == '\\') ? ANSI_END : ANSI_ERR;
+ 		pansi->prev_esc = (ch == ESC);
+ 		return ANSI_MID;
+ 	}
diff --git a/meta/recipes-extended/less/less_608.bb b/meta/recipes-extended/less/less_608.bb
index f411a8fb53..f907a8159c 100644
--- a/meta/recipes-extended/less/less_608.bb
+++ b/meta/recipes-extended/less/less_608.bb
@@ -26,6 +26,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=1ebbd3e34237af26da5dc08a4e440464 \
 DEPENDS = "ncurses"
 
 SRC_URI = "http://www.greenwoodsoftware.com/${BPN}/${BPN}-${PV}.tar.gz \
+           file://CVE-2022-46663.patch \
 	  "
 
 SRC_URI[sha256sum] = "a69abe2e0a126777e021d3b73aa3222e1b261f10e64624d41ec079685a6ac209"
-- 
2.34.1


