Return-Path: <vkumbhar@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D192C4332F
	for <webhook@archiver.kernel.org>; Tue, 20 Dec 2022 06:15:41 +0000 (UTC)
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
 by mx.groups.io with SMTP id smtpd.web10.44350.1671516929852183170
 for <openembedded-core@lists.openembedded.org>;
 Mon, 19 Dec 2022 22:15:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=SS/n7q4K;
 spf=pass (domain: mvista.com, ip: 209.85.210.179, mailfrom: vkumbhar@mvista.com)
Received: by mail-pf1-f179.google.com with SMTP id 21so7840536pfw.4
        for <openembedded-core@lists.openembedded.org>; Mon, 19 Dec 2022 22:15:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=errdZUsT1erLB7OYWsALCjUPAAVbHZhIk5Bn5NLSjBs=;
        b=SS/n7q4KNagAuArJwoJW8AEg//wgZ1nIeDKjSfu7sT/zvgf30ZG95Q87AmvAx+BnOp
         HRnjfr1SnnUPJZJLkWjgqCrnJZ2/lh1SO/aa+T6va0edJina8xyYKc4cUlH/Fe9Y/mvS
         9pGPGfZNq859piVbJApSan6p0T08m8DReyPN4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=errdZUsT1erLB7OYWsALCjUPAAVbHZhIk5Bn5NLSjBs=;
        b=iU67h+DI9vcvJba+S0DZmW9t5Cq3nMic3ZkGAtBLYjSVXBUkuWmMq3eWzPUvM6xffE
         8erKHhMPUkjOaVUYtq4j01yU3trQ19CeayOeSC1/FUWbrwGqC3J433eNsL4sahLXK6n6
         5nOOZwuCDZWXl5wZKLZP9jnsp/bY5gnnrL0iC7zJ0+gTEGqg7YE7+sP6STZ/cW9oxrwd
         mMv45jK5cQMMQqudnKi/MWReAiGTi0y2dqHZ6ptAGgJXSueAu1HohrZ8zpENNqSb5CwY
         1qrczvJ5inCWUmTQv1z7gMTWiyQLW7WIPnioIUsUrl6cJYPPBApK+3pRc74J4Xp5RqjN
         CnEw==
X-Gm-Message-State: ANoB5pm2HzgpZzhB+EL/kPLgfBA103JFcZnjxuwGzS0I2WQK6mqsNhjd
	wrPkF5Cu3EiawNvsbMj2G2k5Ib6Ppex8v6x0
X-Google-Smtp-Source: AA0mqf49yJxsrIAu1/DaK3d3vw9n9PuxJrc5mNLdtO5ioYXlqxST/HdH+rEYrJaoMkM4RfJ7VuDudg==
X-Received: by 2002:a05:6a00:1d09:b0:578:128b:3a3f with SMTP id a9-20020a056a001d0900b00578128b3a3fmr46742223pfx.15.1671516928418;
        Mon, 19 Dec 2022 22:15:28 -0800 (PST)
Received: from vkumbhar-latitude3400.mvista.com ([116.74.236.255])
        by smtp.gmail.com with ESMTPSA id c13-20020a056a00008d00b00574ee8d8779sm7708074pfj.65.2022.12.19.22.15.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Dec 2022 22:15:27 -0800 (PST)
From: Vivek Kumbhar <vkumbhar@mvista.com>
X-Google-Original-From: Vivek Kumbhar <vkumbhar@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Vivek Kumbhar <vkumbhar@mvista.com>
Subject: [OE-core][kirkstone][PATCH] sqlite: fix CVE-2022-46908 safe mode authorizer callback allows disallowed UDFs.
Date: Tue, 20 Dec 2022 11:45:12 +0530
Message-Id: <20221220061512.177139-1-vkumbhar@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 20 Dec 2022 06:15:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174841

From: Vivek Kumbhar <vkumbhar@mvista.com>

Signed-off-by: Vivek Kumbhar <vkumbhar@mvista.com>
---
 .../sqlite/files/CVE-2022-46908.patch         | 39 +++++++++++++++++++
 meta/recipes-support/sqlite/sqlite3_3.38.5.bb |  1 +
 2 files changed, 40 insertions(+)
 create mode 100644 meta/recipes-support/sqlite/files/CVE-2022-46908.patch

diff --git a/meta/recipes-support/sqlite/files/CVE-2022-46908.patch b/meta/recipes-support/sqlite/files/CVE-2022-46908.patch
new file mode 100644
index 0000000000..38bd544838
--- /dev/null
+++ b/meta/recipes-support/sqlite/files/CVE-2022-46908.patch
@@ -0,0 +1,39 @@
+From 1b779afa3ed2f35a110e460fc6ed13cba744db85 2022-12-05 02:52:37 UTC
+From: larrybr <larrybr@sqlite.org>
+Date: 2022-12-05 02:52:37 UTC
+Subject: [PATCH] Fix safe mode authorizer callback to reject disallowed UDFs
+
+Fix safe mode authorizer callback to reject disallowed UDFs. Reported at Forum post 07beac8056151b2f.
+
+Upstream-Status: Backport [https://sqlite.org/src/info/cefc032473ac5ad2]
+CVE-2022-46908
+Signed-off-by: Vivek Kumbhar <vkumbhar@mvista.com>
+---
+ shell.c | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/shell.c b/shell.c
+index d104768..0200c0a 100644
+--- a/shell.c
++++ b/shell.c
+@@ -12894,7 +12894,7 @@ static int safeModeAuth(
+     "zipfile",
+     "zipfile_cds",
+   };
+-  UNUSED_PARAMETER(zA2);
++  UNUSED_PARAMETER(zA1);
+   UNUSED_PARAMETER(zA3);
+   UNUSED_PARAMETER(zA4);
+   switch( op ){
+@@ -12905,7 +12905,7 @@ static int safeModeAuth(
+     case SQLITE_FUNCTION: {
+       int i;
+       for(i=0; i<ArraySize(azProhibitedFunctions); i++){
+-        if( sqlite3_stricmp(zA1, azProhibitedFunctions[i])==0 ){
++        if( sqlite3_stricmp(zA2, azProhibitedFunctions[i])==0 ){
+           failIfSafeMode(p, "cannot use the %s() function in safe mode",
+                          azProhibitedFunctions[i]);
+         }
+-- 
+2.30.2
+
diff --git a/meta/recipes-support/sqlite/sqlite3_3.38.5.bb b/meta/recipes-support/sqlite/sqlite3_3.38.5.bb
index 628f630657..313c15dff4 100644
--- a/meta/recipes-support/sqlite/sqlite3_3.38.5.bb
+++ b/meta/recipes-support/sqlite/sqlite3_3.38.5.bb
@@ -5,6 +5,7 @@ LIC_FILES_CHKSUM = "file://sqlite3.h;endline=11;md5=786d3dc581eff03f4fd9e4a77ed0
 
 SRC_URI = "http://www.sqlite.org/2022/sqlite-autoconf-${SQLITE_PV}.tar.gz \
            file://0001-sqlite-Increased-the-size-of-loop-variables-in-the-printf-implementation.patch \
+           file://CVE-2022-46908.patch \
 "
 SRC_URI[sha256sum] = "5af07de982ba658fd91a03170c945f99c971f6955bc79df3266544373e39869c"
 
-- 
2.30.2


