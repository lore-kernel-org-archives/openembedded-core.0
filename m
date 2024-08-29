Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5CBBDC83F0A
	for <webhook@archiver.kernel.org>; Thu, 29 Aug 2024 11:59:24 +0000 (UTC)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.web10.11632.1724932756795981545
 for <openembedded-core@lists.openembedded.org>;
 Thu, 29 Aug 2024 04:59:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=FmXwK852;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.49, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-3718c176ed7so380548f8f.2
        for <openembedded-core@lists.openembedded.org>; Thu, 29 Aug 2024 04:59:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1724932755; x=1725537555; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PS3fcl4PSGvkOsO96XR5Iplu0GWz9o78cy6RopBafgc=;
        b=FmXwK852IIACJWcqFEKoxhxG6HPP3VrZmEkFQQ4zibuYEBMR5Ylj/4XGoVek2b0TND
         4lKYDiyDOLdgu7b1kx1NJm4LVfN3oRDaGiPxDYQ2Rte2f4lLJ5Cr+YJvYQIb1Lvt8ifd
         eUnfuJXmQ6KGaVlDgkjgaRfVyfWfgQDiyck28=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724932755; x=1725537555;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PS3fcl4PSGvkOsO96XR5Iplu0GWz9o78cy6RopBafgc=;
        b=DhSdv2J3hUrOnhyqhm+iNMNWvj4BtrRb3ODAWCOU+DhQrfMwhSeEwH4AERSb5V3Ytl
         80kK/St/cGdo3rOVNISgcASZvrLODrV2VuAP81ObrrcWr4T03G1+r9f3IeUEcwJxi7II
         tr9PEO+bI3ThVEGBJPrcVy5hb34yg/w/MdRZ7X4uDacy/ItsXe1AtBPcpLlZxAfwiyjA
         TJa7CwGGObW5JmfhX32dzXNrPaX/HD/+uwrg0O1uvbDZ6pbRvqmumkI0/ToU7BsVW4Fb
         b4Ddzclt8SjJ7Oa60ybOrlqRq+nubyjB3vVzxy2f1OAvrNPDWuopnpBUqN2NefqolpUc
         aRVg==
X-Gm-Message-State: AOJu0YxvirL8G/i8Gax8DCQngREgWUbVxcTHKzMVCZovWSg3MrjRqnze
	F6Y0uqjaQ/lWCsKECkmQ2yeecn4aEaA9ZarXwPDsaP+sB/+LwqbvID5PnhZFOBcDxfzAEdIejR4
	M
X-Google-Smtp-Source: AGHT+IF+Dz4v1+4t16cvAKWKB7N6qVL66BDQsEc2yCY1rtj1nh7hQ50A5fZiH1RV8tlphDVpkabcww==
X-Received: by 2002:a05:6000:1802:b0:371:a844:d326 with SMTP id ffacd0b85a97d-3749b57febemr1723022f8f.43.1724932754641;
        Thu, 29 Aug 2024 04:59:14 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:19db:d42a:7902:cfcf])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3749ef7ea91sm1227664f8f.78.2024.08.29.04.59.13
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Aug 2024 04:59:14 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/2] buildhistory: Simplify intercept call sites and drop SSTATEPOSTINSTFUNC usage
Date: Thu, 29 Aug 2024 12:59:12 +0100
Message-ID: <20240829115912.4000512-2-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240829115912.4000512-1-richard.purdie@linuxfoundation.org>
References: <20240829115912.4000512-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 29 Aug 2024 11:59:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203915

We planned to drop SSTATEPOSTINSTFUNC some time ago with the introduction of
postfuncs. Finally get around to doing that which should make the buildhistory
code a little more readable.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/buildhistory.bbclass | 39 +++++++++++++++----------------
 1 file changed, 19 insertions(+), 20 deletions(-)

diff --git a/meta/classes/buildhistory.bbclass b/meta/classes/buildhistory.bbclass
index bac2abdab0f..ce3abaa69d4 100644
--- a/meta/classes/buildhistory.bbclass
+++ b/meta/classes/buildhistory.bbclass
@@ -47,11 +47,18 @@ BUILDHISTORY_PUSH_REPO ?= ""
 BUILDHISTORY_TAG ?= "build"
 BUILDHISTORY_PATH_PREFIX_STRIP ?= ""
 
-SSTATEPOSTINSTFUNCS:append = " buildhistory_emit_pkghistory"
-# We want to avoid influencing the signatures of sstate tasks - first the function itself:
-sstate_install[vardepsexclude] += "buildhistory_emit_pkghistory"
-# then the value added to SSTATEPOSTINSTFUNCS:
-SSTATEPOSTINSTFUNCS[vardepvalueexclude] .= "| buildhistory_emit_pkghistory"
+# We want to avoid influencing the signatures of the task so use vardepsexclude
+do_populate_sysroot[postfuncs] += "buildhistory_emit_sysroot"
+do_populate_sysroot_setscene[postfuncs] += "buildhistory_emit_sysroot"
+do_populate_sysroot[vardepsexclude] += "buildhistory_emit_sysroot"
+
+do_package[postfuncs] += "buildhistory_list_pkg_files"
+do_package_setscene[postfuncs] += "buildhistory_list_pkg_files"
+do_package[vardepsexclude] += "buildhistory_list_pkg_files"
+
+do_packagedata[postfuncs] += "buildhistory_emit_pkghistory"
+do_packagedata_setscene[postfuncs] += "buildhistory_emit_pkghistory"
+do_packagedata[vardepsexclude] += "buildhistory_emit_pkghistory"
 
 # Similarly for our function that gets the output signatures
 SSTATEPOSTUNPACKFUNCS:append = " buildhistory_emit_outputsigs"
@@ -91,27 +98,15 @@ buildhistory_emit_sysroot() {
 # Write out metadata about this package for comparison when writing future packages
 #
 python buildhistory_emit_pkghistory() {
-    if d.getVar('BB_CURRENTTASK') in ['populate_sysroot', 'populate_sysroot_setscene']:
-        bb.build.exec_func("buildhistory_emit_sysroot", d)
-        return 0
-
-    if not "package" in (d.getVar('BUILDHISTORY_FEATURES') or "").split():
-        return 0
-
-    if d.getVar('BB_CURRENTTASK') in ['package', 'package_setscene']:
-        # Create files-in-<package-name>.txt files containing a list of files of each recipe's package
-        bb.build.exec_func("buildhistory_list_pkg_files", d)
-        return 0
-
-    if not d.getVar('BB_CURRENTTASK') in ['packagedata', 'packagedata_setscene']:
-        return 0
-
     import re
     import json
     import shlex
     import errno
     import shutil
 
+    if not "package" in (d.getVar('BUILDHISTORY_FEATURES') or "").split():
+        return 0
+
     pkghistdir = d.getVar('BUILDHISTORY_DIR_PACKAGE')
     oldpkghistdir = d.getVar('BUILDHISTORY_OLD_DIR_PACKAGE')
 
@@ -621,6 +616,10 @@ buildhistory_list_files_no_owners() {
 }
 
 buildhistory_list_pkg_files() {
+	if [ "${@bb.utils.contains('BUILDHISTORY_FEATURES', 'package', '1', '0', d)}" = "0" ] ; then
+		return
+	fi
+
 	# Create individual files-in-package for each recipe's package
 	pkgdirlist=$(find ${PKGDEST}/* -maxdepth 0 -type d)
 	for pkgdir in $pkgdirlist; do

