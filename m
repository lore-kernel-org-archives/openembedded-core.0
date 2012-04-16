Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1SJpAH-0001Gy-OV
	for openembedded-core@lists.openembedded.org;
	Mon, 16 Apr 2012 18:52:33 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 16 Apr 2012 09:43:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="131525091"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.120.96])
	by azsmga001.ch.intel.com with ESMTP; 16 Apr 2012 09:43:05 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 16 Apr 2012 17:43:02 +0100
Message-Id: <d019790ba99d06f2f520d26b0f0a862c77353645.1334594354.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <cover.1334594354.git.paul.eggleton@linux.intel.com>
References: <cover.1334594354.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1334594354.git.paul.eggleton@linux.intel.com>
References: <cover.1334594354.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 1/1] perl: fix re-execution of patch/configure
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
X-List-Received-Date: Mon, 16 Apr 2012 16:52:34 -0000

The perl recipe's do_configure() does some manual sed replacements over
the entire WORKDIR. Fix the following issues with this:

* Skip patches, which fixes re-execution of do_patch after do_configure
  has run once
* Ensure that the replacement operation does nothing if do_configure is
  re-executed
* Avoid unnecessarily modifying /usr/include paths within documentation
  that will end up being packaged
* Fix a quoting issue in the expression used in the grep command that
  ended up causing files that did not contain .*\.h after /usr/include
  to be matched and modified.

The files modified during do_configure have been compared before and
after this patch to ensure there are no unexpected changes. Some
/usr/include paths that are not within documentation are no longer
being substituted however these are all within comments or scripts for
other Unix operating systems that are not applicable.

[YOCTO #2194]

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/recipes-devtools/perl/perl_5.14.2.bb |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-devtools/perl/perl_5.14.2.bb b/meta/recipes-devtools/perl/perl_5.14.2.bb
index 8f3ad25..ecb2262 100644
--- a/meta/recipes-devtools/perl/perl_5.14.2.bb
+++ b/meta/recipes-devtools/perl/perl_5.14.2.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://Copying;md5=2b4c6ffbcfcbdee469f02565f253d81a \
 # We need gnugrep (for -I)
 DEPENDS = "virtual/db grep-native"
 DEPENDS += "gdbm zlib"
-PR = "r5"
+PR = "r6"
 
 # 5.10.1 has Module::Build built-in
 PROVIDES += "libmodule-build-perl"
@@ -163,9 +163,9 @@ do_configure() {
 			;;
 	esac
         # These are strewn all over the source tree
-        for foo in `grep -I -m1 \/usr\/include\/.*\\.h ${WORKDIR}/* -r | cut -f 1 -d ":"` ; do
+        for foo in `grep -I --exclude="*.patch" --exclude="*.diff" --exclude="*.pod" --exclude="README*" -m1 "/usr/include/.*\.h" ${WORKDIR}/* -r -l` ${S}/utils/h2xs.PL ; do
             echo Fixing: $foo
-            sed -e "s%/usr/include/%${STAGING_INCDIR}/%g" -i $foo
+            sed -e 's|\([ "^'\''I]\+\)/usr/include/|\1${STAGING_INCDIR}/|g' -i $foo
         done
 
         rm -f config
-- 
1.7.5.4



