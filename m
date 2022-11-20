Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61E0CC3E8A8
	for <webhook@archiver.kernel.org>; Sun, 20 Nov 2022 13:31:40 +0000 (UTC)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.web11.12307.1668951094635916985
 for <openembedded-core@lists.openembedded.org>;
 Sun, 20 Nov 2022 05:31:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=YE5uNUSk;
 spf=pass (domain: gmail.com, ip: 209.85.221.42, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f42.google.com with SMTP id g12so16198044wrs.10
        for <openembedded-core@lists.openembedded.org>; Sun, 20 Nov 2022 05:31:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tOk+3g3u7RtmBwDjOOIJ0eBSV4+KDMBTtWvXxCI3NFQ=;
        b=YE5uNUSkoITmm1QLAVX7BqfPgIXqsOOiqznCYeB14ODv6sLUkxU7pw/Vmso4alBurZ
         tXe2DmrmBhTMiSOmVYspD2qDxcjvoP/S9KXklel64x/YUD0glxYmOeinr09a0RBbJw1x
         ZKfpOt00DsB2+bElSCRavs3LZrvvL8YeDuLcw7uPl1tq00ltcGCpPdgexXvjzBM9vCb7
         e2E64KQNrZsPo7z3KUsrlSw24AZbCvyZL+01ddJM1rmv4XrANxs/aIroS3S2xoBe58GG
         vtYokJNxgH3pw9aKNWCPLo86MqXpv291ODZoLAj1hgB4L165MgWejKQamcc6dkx9wxwE
         Cjjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tOk+3g3u7RtmBwDjOOIJ0eBSV4+KDMBTtWvXxCI3NFQ=;
        b=kj3Yk7l311F5EY5RiKCcLDmiRnQkdiSW+itvm+5WG4R89GYFV6a5BVlcCeNhHCvqel
         RyhodAnvoNKmKFwCCDgXQ0iSXrIkPtIuj5Sc1qPgUzMR1XrOJxoIiMLyjNR4NvnosmLc
         j6HyYMxBE/OcgcOmDUJlIvcduZG7mnR9wxDgUbA82yqsBxclDFwcClBj4B4zbWm1Iin3
         KcVcLfokhDMFWccKcNAsEEt4DWcec9PD+ZCwFX9CEr5bng4wqgdk4uWhX3TMpRY8s90Y
         Sdg3LL+DRnxzDch2ZE3XO+NMUyV9lkFdq2jmcEmhTDPmMfajSljXGA9mU4DhpBq027ML
         BMow==
X-Gm-Message-State: ANoB5pnX7ekiAf7pkWuzwHivhHB2f97yGDlt/U0iT/heTJzMzTFE6DTK
	Nc1/R5CyJ9NTnr7u/8M0nI7ydw4CoIc=
X-Google-Smtp-Source: AA0mqf6bQu93UlsOVkmL2RFBafsmI3T0gMirUDnOSiCVXhLtodOXhcKgkah1pjNcNoyNRU5PAoEOqQ==
X-Received: by 2002:adf:db81:0:b0:236:5144:f8ce with SMTP id u1-20020adfdb81000000b002365144f8cemr2357058wri.657.1668951099182;
        Sun, 20 Nov 2022 05:31:39 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id k18-20020a05600c1c9200b003b47b80cec3sm16295551wms.42.2022.11.20.05.31.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Nov 2022 05:31:38 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 14/17] icu: update 71.1 -> 72-1
Date: Sun, 20 Nov 2022 14:31:19 +0100
Message-Id: <20221120133122.2464634-14-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20221120133122.2464634-1-alex@linutronix.de>
References: <20221120133122.2464634-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 20 Nov 2022 13:31:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173594

Update the recipe to reflect the change in version separator.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../icu/{icu_71.1.bb => icu_72-1.bb}          | 22 +++++++++++--------
 1 file changed, 13 insertions(+), 9 deletions(-)
 rename meta/recipes-support/icu/{icu_71.1.bb => icu_72-1.bb} (87%)

diff --git a/meta/recipes-support/icu/icu_71.1.bb b/meta/recipes-support/icu/icu_72-1.bb
similarity index 87%
rename from meta/recipes-support/icu/icu_71.1.bb
rename to meta/recipes-support/icu/icu_72-1.bb
index df999dce3b..2b20bdd7b2 100644
--- a/meta/recipes-support/icu/icu_71.1.bb
+++ b/meta/recipes-support/icu/icu_72-1.bb
@@ -15,7 +15,7 @@ S = "${WORKDIR}/icu/source"
 SPDX_S = "${WORKDIR}/icu"
 STAGING_ICU_DIR_NATIVE = "${STAGING_DATADIR_NATIVE}/${BPN}/${PV}"
 
-ICU_MAJOR_VER = "${@d.getVar('PV').split('.')[0]}"
+ICU_MAJOR_VER = "${@d.getVar('PV').split('-')[0]}"
 
 inherit autotools pkgconfig github-releases
 
@@ -54,8 +54,8 @@ do_install:append:class-target() {
     # The native pkgdata can not generate the correct data file.
     # Use icupkg to re-generate it.
     if [ "${SITEINFO_ENDIANNESS}" = "be" ] ; then
-        rm -f ${D}/${datadir}/${BPN}/${PV}/icudt${ICU_MAJOR_VER}b.dat
-        icupkg -tb ${S}/data/in/icudt${ICU_MAJOR_VER}l.dat ${D}/${datadir}/${BPN}/${PV}/icudt${ICU_MAJOR_VER}b.dat
+        rm -f ${D}/${datadir}/${BPN}/${@icu_install_folder(d)}/icudt${ICU_MAJOR_VER}b.dat
+        icupkg -tb ${S}/data/in/icudt${ICU_MAJOR_VER}l.dat ${D}/${datadir}/${BPN}/${@icu_install_folder(d)}/icudt${ICU_MAJOR_VER}b.dat
     fi
 	
 	# Remove build host references...
@@ -63,8 +63,8 @@ do_install:append:class-target() {
 	    -e 's,--sysroot=${STAGING_DIR_TARGET},,g' \
 	    -e 's|${DEBUG_PREFIX_MAP}||g' \
 	    -e 's:${HOSTTOOLS_DIR}/::g' \
-	    ${D}/${libdir}/${BPN}/${PV}/Makefile.inc \
-	    ${D}/${libdir}/${BPN}/${PV}/pkgdata.inc
+	    ${D}/${libdir}/${BPN}/${@icu_install_folder(d)}/Makefile.inc \
+	    ${D}/${libdir}/${BPN}/${@icu_install_folder(d)}/pkgdata.inc
 }
 
 PACKAGES =+ "libicudata libicuuc libicui18n libicutu libicuio"
@@ -82,13 +82,17 @@ BBCLASSEXTEND = "native nativesdk"
 LIC_FILES_CHKSUM = "file://../LICENSE;md5=a89d03060ff9c46552434dbd1fe3ed1f"
 
 def icu_download_version(d):
-    pvsplit = d.getVar('PV').split('.')
+    pvsplit = d.getVar('PV').split('-')
     return pvsplit[0] + "_" + pvsplit[1]
 
 def icu_download_folder(d):
-    pvsplit = d.getVar('PV').split('.')
+    pvsplit = d.getVar('PV').split('-')
     return pvsplit[0] + "-" + pvsplit[1]
 
+def icu_install_folder(d):
+    pvsplit = d.getVar('PV').split('-')
+    return pvsplit[0] + "." + pvsplit[1]
+
 ICU_PV = "${@icu_download_version(d)}"
 ICU_FOLDER = "${@icu_download_folder(d)}"
 
@@ -108,8 +112,8 @@ SRC_URI = "${BASE_SRC_URI};name=code \
 SRC_URI:append:class-target = "\
            file://0001-Disable-LDFLAGSICUDT-for-Linux.patch \
           "
-SRC_URI[code.sha256sum] = "67a7e6e51f61faf1306b6935333e13b2c48abd8da6d2f46ce6adca24b1e21ebf"
-SRC_URI[data.sha256sum] = "e3882b4fece6e5e039f22c3189b7ba224180fd26fdbfa9db284617455b93e804"
+SRC_URI[code.sha256sum] = "a2d2d38217092a7ed56635e34467f92f976b370e20182ad325edea6681a71d68"
+SRC_URI[data.sha256sum] = "ee19f876507d6c23d9e0a2b631096f6b0eaa6fa61728c33a89efdb55e3385dea"
 
 UPSTREAM_CHECK_REGEX = "releases/tag/release-(?P<pver>(?!.+rc).+)"
 GITHUB_BASE_URI = "https://github.com/unicode-org/icu/releases"
-- 
2.30.2


