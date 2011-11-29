Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <nitin.a.kamble@intel.com>) id 1RVBn3-0002iA-TD
	for openembedded-core@lists.openembedded.org;
	Tue, 29 Nov 2011 01:43:18 +0100
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 28 Nov 2011 16:36:38 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.69,587,1315206000"; d="scan'208";a="41918016"
Received: from nbuild0.sc.intel.com ([172.25.110.36])
	by AZSMGA002.ch.intel.com with ESMTP; 28 Nov 2011 16:36:38 -0800
From: nitin.a.kamble@intel.com
To: openembedded-core@lists.openembedded.org
Date: Mon, 28 Nov 2011 16:36:34 -0800
Message-Id: <4f8425c0c7856dba2b3765407a97754c7b06aeb5.1322526931.git.nitin.a.kamble@intel.com>
X-Mailer: git-send-email 1.7.6.4
In-Reply-To: <6b7fb8503d66ee4d4c3d43f3c368b8aa2d010add.1322526931.git.nitin.a.kamble@intel.com>
References: <6b7fb8503d66ee4d4c3d43f3c368b8aa2d010add.1322526931.git.nitin.a.kamble@intel.com>
In-Reply-To: <cover.1322526931.git.nitin.a.kamble@intel.com>
References: <cover.1322526931.git.nitin.a.kamble@intel.com>
Subject: [PATCH 3/4] gmp: also generate the libgmpcxx library & package it properly
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
X-List-Received-Date: Tue, 29 Nov 2011 00:43:18 -0000

From: Nitin A Kamble <nitin.a.kamble@intel.com>

configure runs few checks to make sure c++ compiler and runtime are working
as expected with the --enable-cxx=detect option. And it enables building
of libgmpxx library.

Same as earlier the libgmp.so.10.x file is packaged in the libgmp10 package,
and a new package named libgmpxx4 is added for libgmpxx.so.4.x file.

Signed-off-by: Nitin A Kamble <nitin.a.kamble@intel.com>
---
 meta/recipes-support/gmp/gmp.inc      |    6 ++++++
 meta/recipes-support/gmp/gmp_5.0.2.bb |    2 +-
 2 files changed, 7 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-support/gmp/gmp.inc b/meta/recipes-support/gmp/gmp.inc
index 66349e6..14e6cfc 100644
--- a/meta/recipes-support/gmp/gmp.inc
+++ b/meta/recipes-support/gmp/gmp.inc
@@ -14,3 +14,9 @@ ARM_INSTRUCTION_SET = "arm"
 acpaths = ""
 
 BBCLASSEXTEND = "native nativesdk"
+
+EXTRA_OECONF += " --enable-cxx=detect"
+
+PACKAGES =+ "libgmp10 libgmpxx4"
+FILES_libgmp10 = "${libdir}/libgmp.so.10*"
+FILES_libgmpxx4 = "${libdir}/libgmpxx.so.4*"
diff --git a/meta/recipes-support/gmp/gmp_5.0.2.bb b/meta/recipes-support/gmp/gmp_5.0.2.bb
index 16bdcbc..873fc3e 100644
--- a/meta/recipes-support/gmp/gmp_5.0.2.bb
+++ b/meta/recipes-support/gmp/gmp_5.0.2.bb
@@ -2,7 +2,7 @@ require gmp.inc
 LICENSE="LGPLv3&GPLv3"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504 \
 		    file://version.c;endline=18;md5=d8c56b52b9092346b9f93b4da65ef790"
-PR = "r1"
+PR = "r2"
 
 SRC_URI_append += "file://sh4-asmfix.patch \
                    file://use-includedir.patch "
-- 
1.7.6.4



