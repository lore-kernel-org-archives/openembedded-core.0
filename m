Return-Path: <ohnatiuk@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4EFD7C2BD09
	for <webhook@archiver.kernel.org>; Fri, 12 Jul 2024 18:58:31 +0000 (UTC)
Received: from rcdn-iport-4.cisco.com (rcdn-iport-4.cisco.com [173.37.86.75])
 by mx.groups.io with SMTP id smtpd.web11.3934.1720810704366545759
 for <openembedded-core@lists.openembedded.org>;
 Fri, 12 Jul 2024 11:58:24 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport header.b=Sjd85nIC;
 spf=pass (domain: cisco.com, ip: 173.37.86.75, mailfrom: ohnatiuk@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=2604; q=dns/txt; s=iport;
  t=1720810704; x=1722020304;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=jw0rLlDbqYnqcQyArQi3BWXxVzX/H0CO2UQpmN4RoHM=;
  b=Sjd85nIC6Mg/VXAs8M6up+PGYJ5WKug20xXcG+vOLSKTgUfZ5PbX52oC
   mkz4W59kJDGc1UuH8zqrERaWXIWCQexbXmLEoFAxpsvbGrSXezZWZ+J14
   pMKjbm2bWIZa/ErFEWi/rZsETynOhXmebsW2Ovvw0oTzQQ56mUbix+cyG
   s=;
X-CSE-ConnectionGUID: GTWTLv/kRrKyWxAtsy84OQ==
X-CSE-MsgGUID: Zz+f9kRzTB+dxCOYdXYhxQ==
X-IronPort-AV: E=Sophos;i="6.09,203,1716249600"; 
   d="scan'208";a="230030000"
Received: from rcdn-core-8.cisco.com ([173.37.93.144])
  by rcdn-iport-4.cisco.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jul 2024 18:58:23 +0000
Received: from sjc-ads-3960.cisco.com (sjc-ads-3960.cisco.com [171.68.251.157])
	by rcdn-core-8.cisco.com (8.15.2/8.15.2) with ESMTP id 46CIwNR8029982;
	Fri, 12 Jul 2024 18:58:23 GMT
From: Oleksandr Hnatiuk <ohnatiuk@cisco.com>
To: openembedded-core@lists.openembedded.org
Cc: Oleksiy Obitotskyy <oobitots@cisco.com>
Subject: [PATCH] icu: remove host references in nativesdk to fix reproducibility
Date: Fri, 12 Jul 2024 11:58:21 -0700
Message-Id: <20240712185821.2969201-1-ohnatiuk@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <CANNYZj8K3sBWqV24miv3fYopPARwzKPZ=VV3n6vSwi+ATRxztQ@mail.gmail.com>
References: <CANNYZj8K3sBWqV24miv3fYopPARwzKPZ=VV3n6vSwi+ATRxztQ@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-SMTP-Client: 171.68.251.157, sjc-ads-3960.cisco.com
X-Outbound-Node: rcdn-core-8.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 12 Jul 2024 18:58:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201849

Fix is only done for target. Use same code for nativesdk.

Signed-off-by: Oleksiy Obitotskyy <oobitots@cisco.com>
Signed-off-by: Oleksandr Hnatiuk <ohnatiuk@cisco.com>
---
 meta/recipes-support/icu/icu_75-1.bb | 33 ++++++++++++++++++++--------
 1 file changed, 24 insertions(+), 9 deletions(-)

diff --git a/meta/recipes-support/icu/icu_75-1.bb b/meta/recipes-support/icu/icu_75-1.bb
index 27fe392e4d4e..57c9fc03612a 100644
--- a/meta/recipes-support/icu/icu_75-1.bb
+++ b/meta/recipes-support/icu/icu_75-1.bb
@@ -30,7 +30,7 @@ TARGET_CXXFLAGS:append = "${@oe.utils.conditional('SITEINFO_ENDIANNESS', 'be', '
 
 ASNEEDED = ""
 
-do_compile:prepend:class-target () {
+remove_build_host_references_from_libicutu () {
 	# Make sure certain build host references do not end up being compiled
 	# in the image. This only affects libicutu and icu-dbg
 	sed  \
@@ -39,6 +39,14 @@ do_compile:prepend:class-target () {
 	    -i ${B}/tools/toolutil/Makefile
 }
 
+do_compile:prepend:class-target () {
+	remove_build_host_references_from_libicutu
+}
+
+do_compile:prepend:class-nativesdk () {
+	remove_build_host_references_from_libicutu
+}
+
 PREPROCESS_RELOCATE_DIRS = "${datadir}/${BPN}/${PV}"
 do_install:append:class-native() {
 	mkdir -p ${D}/${STAGING_ICU_DIR_NATIVE}/config
@@ -49,6 +57,15 @@ do_install:append:class-native() {
 	cp -r ${B}/tools ${D}/${STAGING_ICU_DIR_NATIVE}
 }
 
+remove_build_host_references() {
+	sed -i  \
+	    -e 's,--sysroot=${STAGING_DIR_TARGET},,g' \
+	    -e 's|${DEBUG_PREFIX_MAP}||g' \
+	    -e 's:${HOSTTOOLS_DIR}/::g' \
+	    ${D}/${libdir}/${BPN}/${@icu_install_folder(d)}/Makefile.inc \
+	    ${D}/${libdir}/${BPN}/${@icu_install_folder(d)}/pkgdata.inc
+}
+
 do_install:append:class-target() {
     # The native pkgdata can not generate the correct data file.
     # Use icupkg to re-generate it.
@@ -56,14 +73,12 @@ do_install:append:class-target() {
         rm -f ${D}/${datadir}/${BPN}/${@icu_install_folder(d)}/icudt${ICU_MAJOR_VER}b.dat
         icupkg -tb ${S}/data/in/icudt${ICU_MAJOR_VER}l.dat ${D}/${datadir}/${BPN}/${@icu_install_folder(d)}/icudt${ICU_MAJOR_VER}b.dat
     fi
-	
-	# Remove build host references...
-	sed -i  \
-	    -e 's,--sysroot=${STAGING_DIR_TARGET},,g' \
-	    -e 's|${DEBUG_PREFIX_MAP}||g' \
-	    -e 's:${HOSTTOOLS_DIR}/::g' \
-	    ${D}/${libdir}/${BPN}/${@icu_install_folder(d)}/Makefile.inc \
-	    ${D}/${libdir}/${BPN}/${@icu_install_folder(d)}/pkgdata.inc
+
+	remove_build_host_references
+}
+
+do_install:append:class-nativesdk() {
+	remove_build_host_references
 }
 
 PACKAGES =+ "libicudata libicuuc libicui18n libicutu libicuio"
-- 
2.35.6


