Return-Path: <jason.wessel@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 9D6496B389
	for <Openembedded-core@lists.openembedded.org>;
	Tue, 17 Sep 2013 13:32:27 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r8HDWTmm028334
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 17 Sep 2013 06:32:29 -0700 (PDT)
Received: from splat.wrs.com (128.224.60.28) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.2.347.0;
	Tue, 17 Sep 2013 06:32:28 -0700
From: Jason Wessel <jason.wessel@windriver.com>
To: <Openembedded-core@lists.openembedded.org>
Date: Tue, 17 Sep 2013 08:32:11 -0500
Message-ID: <1379424738-16798-3-git-send-email-jason.wessel@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1379424738-16798-1-git-send-email-jason.wessel@windriver.com>
References: <1379424738-16798-1-git-send-email-jason.wessel@windriver.com>
MIME-Version: 1.0
Cc: dvhart@linux.intel.com
Subject: [v3 PATCH 2/9] cdrtools-native: Update from 3.00 to 3.01a17
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 17 Sep 2013 13:32:28 -0000
Content-Type: text/plain

The update is needed to support generation of EFI boot images that
work with optical media.  Specifically the "-eltorito-platform efi"
capability for mkisofs is needed.

[YOCTO #4100]

Signed-off-by: Jason Wessel <jason.wessel@windriver.com>
Reviewed-by: Darren Hart <dvhart@linux.intel.com>
---
 ...s-native_3.00.bb => cdrtools-native_3.01a17.bb} |   22 +++++++-------------
 1 file changed, 8 insertions(+), 14 deletions(-)
 rename meta/recipes-devtools/cdrtools/{cdrtools-native_3.00.bb => cdrtools-native_3.01a17.bb} (47%)

diff --git a/meta/recipes-devtools/cdrtools/cdrtools-native_3.00.bb b/meta/recipes-devtools/cdrtools/cdrtools-native_3.01a17.bb
similarity index 47%
rename from meta/recipes-devtools/cdrtools/cdrtools-native_3.00.bb
rename to meta/recipes-devtools/cdrtools/cdrtools-native_3.01a17.bb
index 7e4c381..2ae3f4a 100644
--- a/meta/recipes-devtools/cdrtools/cdrtools-native_3.00.bb
+++ b/meta/recipes-devtools/cdrtools/cdrtools-native_3.01a17.bb
@@ -5,26 +5,20 @@ SUMMARY = "A set of tools for CD recording, including cdrecord"
 DESCRIPTION = "A set of tools for CD recording, including cdrecord"
 HOMEPAGE = "http://cdrecord.berlios.de/private/cdrecord.html"
 SECTION = "console/utils"
-LICENSE = "GPLv2"
-LIC_FILES_CHKSUM = "file://COPYING;md5=8d16123ffd39e649a5e4a6bc1de60e6d"
-PR = "r0"
+LICENSE = "GPLv2 & CDDL-1.0 & LGPLv2.1+"
+LIC_FILES_CHKSUM = "file://COPYING;md5=32f68170be424c2cd64804337726b312"
 
-SRC_URI = "ftp://ftp.berlios.de/pub/cdrecord/cdrtools-${PV}.tar.bz2 \
-           file://no_usr_src.patch"
+SRC_URI = "ftp://ftp.berlios.de/pub/cdrecord/alpha/cdrtools-${PV}.tar.bz2"
 
-SRC_URI[md5sum] = "f9fbab08fbd458b0d2312976d8c5f558"
-SRC_URI[sha256sum] = "7f9cb64820055573b880f77b2f16662a512518336ba95ab49228a1617973423d"
+SRC_URI[md5sum] = "4cef9db0cf15a770c52d65b00bbee2db"
+SRC_URI[sha256sum] = "3d613965b213ad83e4be0ba2535e784901839ea4d11a20a2beb6765f0eb76dfa"
 
-inherit native
+S = "${WORKDIR}/cdrtools-3.01"
 
-STAGE_TEMP = "${WORKDIR}/image-temp"
+inherit native
 
 FILESPATH = "${FILE_DIRNAME}/cdrtools-native/"
 
 do_install() {
-	install -d ${STAGE_TEMP}
-	make install INS_BASE=${STAGE_TEMP}
-
-	install -d ${D}${bindir}/
-	install ${STAGE_TEMP}/bin/* ${D}${bindir}/
+	make install GMAKE_NOWARN=true INS_BASE=${prefix} DESTDIR=${D}
 }
-- 
1.7.9.5


