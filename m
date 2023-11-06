Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1DF62C4332F
	for <webhook@archiver.kernel.org>; Mon,  6 Nov 2023 17:32:12 +0000 (UTC)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.web11.60435.1699291929157287637
 for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Nov 2023 09:32:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=fnz2RrPd;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.52, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-32da7ac5c4fso2932657f8f.1
        for <openembedded-core@lists.openembedded.org>; Mon, 06 Nov 2023 09:32:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1699291927; x=1699896727; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=rJv1qymiaZlanMQLG6DTNlviy70KVj6r6IK4vlD2KGQ=;
        b=fnz2RrPdMabesTBKRRnuiaM5V7QmAhM3rarqZUXUQG5R9Uov9XmLB6Q55yaS8qflXD
         7gA6e96KsGe4XVA2/J3UXzaqc8xVA8VsKv58LwqpBwTYlQ1mxr0hEcXQ+S33zl1pkQdq
         NaJ2DftT80Og3BRfxf0dbDpivdB6LepU9yON8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699291927; x=1699896727;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rJv1qymiaZlanMQLG6DTNlviy70KVj6r6IK4vlD2KGQ=;
        b=H9nn6sx+r/+u4h8cC1lU050bMcmKnL6bOtSmHNn0qUob4tBWpNxQlTnqbvCBN2MxZC
         8WrrmnIom9543QKJ/Eq/639oTA/tllrtm9nyqt0j6Mfpb+HA+BqBCokzytydGJybpTv+
         aoVjHg/uwbxdEOkppOwC2HYuWLPxM+rjrys11877tulCQBfF9cALOeR69n5sP/YZnRwt
         hMvO1FBrC/RtkzvPrMgyxuNBMm9okehH0qmzjheglfd8jt3lMswUS+nUH0clcU6dxG7X
         LZ9QcJsO4BnVdxYpWwE+eMfs53x7iudZC2lFGDNqWvctmK9TKthxGmik4VFp0aGo0JK3
         wycA==
X-Gm-Message-State: AOJu0Yy7ObC8ovF+nz3Mf6+1wKxnIl0ma1JU4gHCYZYNgZ4puaDJ1wHh
	iX/1ZcJttYXzilZficNpQBx2tNah3z0OyDhu5QE=
X-Google-Smtp-Source: AGHT+IF+bI4uxC4OFuBJ45x9leVujw/G0PDuXMTVDuVAiKMU8GtfFaYtYBwTXb7qODwoh/bMZbGP/g==
X-Received: by 2002:a05:6000:18a4:b0:32f:7d87:bfac with SMTP id b4-20020a05600018a400b0032f7d87bfacmr22767679wri.68.1699291927154;
        Mon, 06 Nov 2023 09:32:07 -0800 (PST)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:1ccc:c310:74c7:1597])
        by smtp.gmail.com with ESMTPSA id o5-20020a056000010500b00327bf4f2f14sm147961wrx.88.2023.11.06.09.32.06
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Nov 2023 09:32:06 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] package/package_write: Improve packagedata code location
Date: Mon,  6 Nov 2023 17:32:05 +0000
Message-Id: <20231106173205.1221068-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 06 Nov 2023 17:32:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190241

Move the do_packagedata dependencies into the package_write codeblocks
themselves. Also drop the dependency for the tar package backend which
was dropped.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes-global/debian.bbclass      |  3 ---
 meta/classes-global/package.bbclass     | 19 -------------------
 meta/classes-global/package_deb.bbclass |  4 ++++
 meta/classes-global/package_ipk.bbclass |  4 ++++
 meta/classes-global/package_rpm.bbclass |  4 ++++
 5 files changed, 12 insertions(+), 22 deletions(-)

diff --git a/meta/classes-global/debian.bbclass b/meta/classes-global/debian.bbclass
index c34e04112c5..e2a129d0288 100644
--- a/meta/classes-global/debian.bbclass
+++ b/meta/classes-global/debian.bbclass
@@ -14,9 +14,6 @@
 #
 # Better expressed as ensure all RDEPENDS package before we package
 # This means we can't have circular RDEPENDS/RRECOMMENDS
-#
-# Logic of processing dependencies moved to a package.bbclass to
-# allow removing inheritance on debian.bbclass
 
 AUTO_LIBNAME_PKGS = "${PACKAGES}"
 
diff --git a/meta/classes-global/package.bbclass b/meta/classes-global/package.bbclass
index 820920eadff..2ad820a81fc 100644
--- a/meta/classes-global/package.bbclass
+++ b/meta/classes-global/package.bbclass
@@ -613,22 +613,3 @@ python do_packagedata_setscene () {
 }
 addtask do_packagedata_setscene
 
-# This part ensures all the runtime packages built by the time
-# dynamic renaming occures, if any.
-# This part moved here from debian.bbclass (see for reference) in
-# order to allow disabling default inheritance on debian package renaming.
-
-PKGRDEP = "do_packagedata"
-do_package_write_ipk[deptask] = "${PKGRDEP}"
-do_package_write_deb[deptask] = "${PKGRDEP}"
-do_package_write_tar[deptask] = "${PKGRDEP}"
-do_package_write_rpm[deptask] = "${PKGRDEP}"
-do_package_write_ipk[rdeptask] = "${PKGRDEP}"
-do_package_write_deb[rdeptask] = "${PKGRDEP}"
-do_package_write_tar[rdeptask] = "${PKGRDEP}"
-do_package_write_rpm[rdeptask] = "${PKGRDEP}"
-
-python () {
-    if not d.getVar("PACKAGES"):
-        d.setVar("PKGRDEP", "")
-}
diff --git a/meta/classes-global/package_deb.bbclass b/meta/classes-global/package_deb.bbclass
index 5aba3837bde..1f10b15a00c 100644
--- a/meta/classes-global/package_deb.bbclass
+++ b/meta/classes-global/package_deb.bbclass
@@ -313,6 +313,10 @@ python () {
         deps = ' dpkg-native:do_populate_sysroot virtual/fakeroot-native:do_populate_sysroot'
         d.appendVarFlag('do_package_write_deb', 'depends', deps)
         d.setVarFlag('do_package_write_deb', 'fakeroot', "1")
+
+        # Needed to ensure PKG_xxx renaming of dependency packages works
+        d.setVarFlag('do_package_write_deb', 'deptask', "do_packagedata")
+        d.setVarFlag('do_package_write_deb', 'rdeptask', "do_packagedata")
 }
 
 python do_package_write_deb () {
diff --git a/meta/classes-global/package_ipk.bbclass b/meta/classes-global/package_ipk.bbclass
index b4b7bc9ac27..1ca1308967c 100644
--- a/meta/classes-global/package_ipk.bbclass
+++ b/meta/classes-global/package_ipk.bbclass
@@ -276,6 +276,10 @@ python () {
         deps = ' opkg-utils-native:do_populate_sysroot virtual/fakeroot-native:do_populate_sysroot xz-native:do_populate_sysroot'
         d.appendVarFlag('do_package_write_ipk', 'depends', deps)
         d.setVarFlag('do_package_write_ipk', 'fakeroot', "1")
+
+        # Needed to ensure PKG_xxx renaming of dependency packages works
+        d.setVarFlag('do_package_write_ipk', 'deptask', "do_packagedata")
+        d.setVarFlag('do_package_write_ipk', 'rdeptask', "do_packagedata")
 }
 
 python do_package_write_ipk () {
diff --git a/meta/classes-global/package_rpm.bbclass b/meta/classes-global/package_rpm.bbclass
index 5d35962affe..2fc18fe98c1 100644
--- a/meta/classes-global/package_rpm.bbclass
+++ b/meta/classes-global/package_rpm.bbclass
@@ -726,6 +726,10 @@ python () {
         deps = ' rpm-native:do_populate_sysroot virtual/fakeroot-native:do_populate_sysroot'
         d.appendVarFlag('do_package_write_rpm', 'depends', deps)
         d.setVarFlag('do_package_write_rpm', 'fakeroot', '1')
+
+        # Needed to ensure PKG_xxx renaming of dependency packages works
+        d.setVarFlag('do_package_write_rpm', 'deptask', "do_packagedata")
+        d.setVarFlag('do_package_write_rpm', 'rdeptask', "do_packagedata")
 }
 
 SSTATETASKS += "do_package_write_rpm"
-- 
2.39.2


