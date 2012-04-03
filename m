Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1SF4Bc-0007mD-2K
	for openembedded-core@lists.openembedded.org;
	Tue, 03 Apr 2012 15:54:17 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 03 Apr 2012 06:44:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="126549047"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.120.14])
	by azsmga001.ch.intel.com with ESMTP; 03 Apr 2012 06:44:43 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  3 Apr 2012 14:44:40 +0100
Message-Id: <f0dc600fd3f7638b0cd378f3fbdc4bc47da5aab9.1333460617.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <cover.1333460617.git.paul.eggleton@linux.intel.com>
References: <cover.1333460617.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1333460617.git.paul.eggleton@linux.intel.com>
References: <cover.1333460617.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 1/1] elfutils: disable lzma (and bzip2 for native)
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
X-List-Received-Date: Tue, 03 Apr 2012 13:54:17 -0000

Fix some library dependency issues:
* Disable lzma as xz-native is unstated in DEPENDS
* Disable bzip2 for native as it is in ASSUME_PROVIDED and thus isn't
  available when elfutils-native is normally built, but if it gets
  rebuilt the link will be made; plus we don't need it.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/recipes-devtools/elfutils/elfutils_0.148.bb |    5 +++--
 1 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/elfutils/elfutils_0.148.bb b/meta/recipes-devtools/elfutils/elfutils_0.148.bb
index dca89b1..225627b 100644
--- a/meta/recipes-devtools/elfutils/elfutils_0.148.bb
+++ b/meta/recipes-devtools/elfutils/elfutils_0.148.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=0636e73ff0215e8d672dc4c32c317bb3\
                     file://EXCEPTION;md5=570adcb0c1218ab57f2249c67d0ce417"
 DEPENDS = "libtool bzip2 zlib"
 
-PR = "r6"
+PR = "r7"
 
 SRC_URI = "https://fedorahosted.org/releases/e/l/elfutils/elfutils-${PV}.tar.bz2"
 
@@ -45,7 +45,8 @@ SRC_URI += "\
 "
 inherit autotools gettext
 
-EXTRA_OECONF = "--program-prefix=eu-"
+EXTRA_OECONF = "--program-prefix=eu- --without-lzma"
+EXTRA_OECONF_append_virtclass-native = " --without-bzlib"
 EXTRA_OECONF_append_libc-uclibc = " ${@['', '--enable-uclibc']['${PN}' == '${BPN}']}"
 
 do_configure_prepend() {
-- 
1.7.5.4



