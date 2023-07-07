Return-Path: <vanusuri@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33A9DEB64D9
	for <webhook@archiver.kernel.org>; Fri,  7 Jul 2023 06:17:38 +0000 (UTC)
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
 by mx.groups.io with SMTP id smtpd.web11.6852.1688710652704567555
 for <openembedded-core@lists.openembedded.org>;
 Thu, 06 Jul 2023 23:17:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=N0OWMl76;
 spf=pass (domain: mvista.com, ip: 209.85.214.179, mailfrom: vanusuri@mvista.com)
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-1b89d47ffb6so8060405ad.2
        for <openembedded-core@lists.openembedded.org>; Thu, 06 Jul 2023 23:17:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1688710652; x=1691302652;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=4UO0+byqh7T0V/OcHiewTMERLXVFZBFTy5dLO9/R5HM=;
        b=N0OWMl76X17Qr2FiNQ3cGzu/xPWy70EIytMnNhQGmgWuTipGO1lt2YivtRZUHJtbv6
         OA2gL91FzWbs6j9S9C0VIGGCgp3d/jM3yos7yp7yYy7ZTcmhq0jDAuz7KsQ4e0H6hLtS
         rvXXgBTlcy+Kqon5kC99y25EM6zk0qnvbFU+o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688710652; x=1691302652;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4UO0+byqh7T0V/OcHiewTMERLXVFZBFTy5dLO9/R5HM=;
        b=JLm3gbPcFcFqvU3WlJ6/73z5OcCa9bR9WCR7dJ1PjnEs6IN7kxxaxpf0TwuIrdyjzQ
         QbeXhzYNRLiSkYlmSKY37WioomRosWcyMSfe/pIEPd0ARAYMQeujUB/rgyrK9iN/EL8j
         f5jnCJfHNXaXmx3rH5VRxgOkGT7HX6I0xRaHr34CNAVRcw8mDAivBszQuXqW7BdYhKOg
         4Q59cnG4i+sToktMmb7I+tY+8pCJc9VZUMerXhuZO6EfJQfAYI6u9y/fbHvmTymcpTW4
         UQM9ZHuHuP7NCGfGzlctsJ4ZvZgSKmiZGInqvCYwPZ+0iR36ZXYlmTXX7rQUmNbNZoMs
         3oug==
X-Gm-Message-State: ABy/qLZfvDZnD6xBfCx1MhTxMTpJWRHuFcDkvzANt5KEsUpJttL1za2Y
	BxUQwoRimHIA+bdtAqaPNfN06ujawoxIuWfQs6Y=
X-Google-Smtp-Source: APBJJlHhAsiPjhebHw0OrAF1XNxJOMkZgpyYy06ncn0OwybnQ0JL06ytXdreM5IPZ7d67OIzLY79/g==
X-Received: by 2002:a17:902:7447:b0:1b8:5aa1:f287 with SMTP id e7-20020a170902744700b001b85aa1f287mr3167093plt.57.1688710651636;
        Thu, 06 Jul 2023 23:17:31 -0700 (PDT)
Received: from MVIN00020.mvista.com ([122.181.45.87])
        by smtp.gmail.com with ESMTPSA id e16-20020a17090301d000b001a5fccab02dsm2382644plh.177.2023.07.06.23.17.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Jul 2023 23:17:31 -0700 (PDT)
From: vanusuri@mvista.com
To: openembedded-core@lists.openembedded.org
Cc: Vijay Anusuri <vanusuri@mvista.com>
Subject: [OE-core][kirkstone][PATCH] sqlite3: CVE-2023-36191 CLI fault on missing -nonce
Date: Fri,  7 Jul 2023 11:45:11 +0530
Message-Id: <20230707061511.1009700-1-vanusuri@mvista.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 07 Jul 2023 06:17:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184000

From: Vijay Anusuri <vanusuri@mvista.com>

Upstream-Status: Backport [https://sqlite.org/src/info/cd24178bbaad4a1d]

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
---
 .../sqlite/files/CVE-2023-36191.patch         | 37 +++++++++++++++++++
 meta/recipes-support/sqlite/sqlite3_3.38.5.bb |  1 +
 2 files changed, 38 insertions(+)
 create mode 100644 meta/recipes-support/sqlite/files/CVE-2023-36191.patch

diff --git a/meta/recipes-support/sqlite/files/CVE-2023-36191.patch b/meta/recipes-support/sqlite/files/CVE-2023-36191.patch
new file mode 100644
index 0000000000..aca79c334a
--- /dev/null
+++ b/meta/recipes-support/sqlite/files/CVE-2023-36191.patch
@@ -0,0 +1,37 @@
+From 4e8a0eb4e773b808d9e9697af94319599777169a Mon Sep 17 00:00:00 2001
+From: larrybr <larrybr@noemail.net>
+Date: Fri, 2 Jun 2023 12:56:32 +0000
+Subject: [PATCH] Fix CLI fault on missing -nonce reported by [forum:/info/f8c14a1134|forum post f8c14a1134].
+
+FossilOrigin-Name: cd24178bbaad4a1dafc3848e7d74240f90030160b5c43c93e1e0e11b073c2df5
+
+Upstream-Status: Backport [https://sqlite.org/src/info/cd24178bbaad4a1d
+Upstream commit https://github.com/sqlite/sqlite/commit/4e8a0eb4e773b808d9e9697af94319599777169a]
+CVE: CVE-2023-36191
+Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
+---
+ shell.c | 8 ++++++--
+ 1 file changed, 6 insertions(+), 2 deletions(-)
+
+diff --git a/shell.c b/shell.c
+index 0200c0a..fa45d40 100644
+--- a/shell.c
++++ b/shell.c
+@@ -23163,8 +23163,12 @@ int SQLITE_CDECL wmain(int argc, wchar_t **wargv){
+     }else if( strcmp(z,"-bail")==0 ){
+       bail_on_error = 1;
+     }else if( strcmp(z,"-nonce")==0 ){
+-      free(data.zNonce);
+-      data.zNonce = strdup(argv[++i]);
++      if( data.zNonce ) free(data.zNonce);
++      if( i+1 < argc ) data.zNonce = strdup(argv[++i]);
++      else{
++        data.zNonce = 0;
++        break;
++      }
+     }else if( strcmp(z,"-safe")==0 ){
+       /* no-op - catch this on the second pass */
+     }
+-- 
+2.25.1
+
diff --git a/meta/recipes-support/sqlite/sqlite3_3.38.5.bb b/meta/recipes-support/sqlite/sqlite3_3.38.5.bb
index 313c15dff4..55cc514412 100644
--- a/meta/recipes-support/sqlite/sqlite3_3.38.5.bb
+++ b/meta/recipes-support/sqlite/sqlite3_3.38.5.bb
@@ -6,6 +6,7 @@ LIC_FILES_CHKSUM = "file://sqlite3.h;endline=11;md5=786d3dc581eff03f4fd9e4a77ed0
 SRC_URI = "http://www.sqlite.org/2022/sqlite-autoconf-${SQLITE_PV}.tar.gz \
            file://0001-sqlite-Increased-the-size-of-loop-variables-in-the-printf-implementation.patch \
            file://CVE-2022-46908.patch \
+           file://CVE-2023-36191.patch \
 "
 SRC_URI[sha256sum] = "5af07de982ba658fd91a03170c945f99c971f6955bc79df3266544373e39869c"
 
-- 
2.25.1


