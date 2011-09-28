Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1R8oIs-00041r-VQ
	for openembedded-core@lists.openembedded.org;
	Wed, 28 Sep 2011 09:11:39 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 28 Sep 2011 00:06:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.68,453,1312182000"; d="scan'208";a="21360941"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.14.219])
	by AZSMGA002.ch.intel.com with ESMTP; 28 Sep 2011 00:06:09 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 28 Sep 2011 00:05:43 -0700
Message-Id: <4f5fdc4dc14d287d301069024ddec9cb65d68f7f.1317193250.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6
In-Reply-To: <cover.1317193250.git.sgw@linux.intel.com>
References: <cover.1317193250.git.sgw@linux.intel.com>
In-Reply-To: <cover.1317193250.git.sgw@linux.intel.com>
References: <cover.1317193250.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 07/29] sqlite3: Fix nativesdk packaging/QA warnings
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 28 Sep 2011 07:11:39 -0000

From: Richard Purdie <richard.purdie@linuxfoundation.org>

When building sqlite3-nativesdk, there was a warning about debug files in the
main package. This was due to the order of items in PACKAGES with -dbg after
the main package which breaks an assumption native.bbclass makes. Changing
the order fixes the packaging problem with no change to the normal target
packaging.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-support/sqlite/sqlite3.inc        |    2 +-
 meta/recipes-support/sqlite/sqlite3_3.7.7.1.bb |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-support/sqlite/sqlite3.inc b/meta/recipes-support/sqlite/sqlite3.inc
index 2a52a44..ece35c5 100644
--- a/meta/recipes-support/sqlite/sqlite3.inc
+++ b/meta/recipes-support/sqlite/sqlite3.inc
@@ -20,7 +20,7 @@ export config_TARGET_LFLAGS = "${LDFLAGS}"
 PKGSUFFIX = ""
 PKGSUFFIX_virtclass-nativesdk = "-nativesdk"
 
-PACKAGES = "lib${BPN}${PKGSUFFIX} lib${BPN}${PKGSUFFIX}-dev lib${BPN}${PKGSUFFIX}-doc ${PN} ${PN}-dbg"
+PACKAGES = "lib${BPN}${PKGSUFFIX} lib${BPN}${PKGSUFFIX}-dev lib${BPN}${PKGSUFFIX}-doc ${PN}-dbg ${PN}"
 FILES_${PN} = "${bindir}/*"
 FILES_lib${BPN}${PKGSUFFIX} = "${libdir}/*.so.*"
 FILES_lib${BPN}${PKGSUFFIX}-dev = "${libdir}/*.a ${libdir}/*.la ${libdir}/*.so \
diff --git a/meta/recipes-support/sqlite/sqlite3_3.7.7.1.bb b/meta/recipes-support/sqlite/sqlite3_3.7.7.1.bb
index 5651c07..fd03780 100644
--- a/meta/recipes-support/sqlite/sqlite3_3.7.7.1.bb
+++ b/meta/recipes-support/sqlite/sqlite3_3.7.7.1.bb
@@ -4,7 +4,7 @@ LIC_FILES_CHKSUM = "file://sqlite3.h;endline=11;md5=65f0a57ca6928710b418c094b357
 
 SRC_URI = "http://www.sqlite.org/sqlite-autoconf-3070701.tar.gz"
 S = "${WORKDIR}/sqlite-autoconf-3070701"
-PR = "r0"
+PR = "r1"
 
 SRC_URI[md5sum] = "554026fe7fac47b1cf61c18d5fe43419"
 SRC_URI[sha256sum] = "7dcc36b25f7bcbe2938d0ea2baea5b706f0af93473d02a3f612d7ab39e386edf"
-- 
1.7.6



