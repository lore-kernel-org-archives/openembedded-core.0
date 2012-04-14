Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <nitin.a.kamble@intel.com>) id 1SIvET-0001cu-Hj
	for openembedded-core@lists.openembedded.org;
	Sat, 14 Apr 2012 07:09:09 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 13 Apr 2012 21:59:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="153517550"
Received: from nbuild0.sc.intel.com ([172.25.110.36])
	by fmsmga002.fm.intel.com with ESMTP; 13 Apr 2012 21:59:46 -0700
From: nitin.a.kamble@intel.com
To: openembedded-core@lists.openembedded.org
Date: Fri, 13 Apr 2012 21:59:45 -0700
Message-Id: <cc42b191a00486231e93e86e2a74309697ce14c1.1334379293.git.nitin.a.kamble@intel.com>
X-Mailer: git-send-email 1.7.6.5
In-Reply-To: <faa747203f561dbd8c74f1797b7db3a6117661f3.1334379293.git.nitin.a.kamble@intel.com>
References: <faa747203f561dbd8c74f1797b7db3a6117661f3.1334379293.git.nitin.a.kamble@intel.com>
In-Reply-To: <cover.1334379293.git.nitin.a.kamble@intel.com>
References: <cover.1334379293.git.nitin.a.kamble@intel.com>
Subject: [PATCH 3/3] eglibc: fix builds on fedora 17 alpha
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
X-List-Received-Date: Sat, 14 Apr 2012 05:09:09 -0000

From: Nitin A Kamble <nitin.a.kamble@intel.com>

Generally distros keep perl at /sur/bin/perl
Fedora 17 alpha also has /bin/perl

this causes eglibc build on such distros to put perl interpreter path in
the perl scripts as /bin/perl

But we set perl location for target as /usr/bin/perl

This mismatch of perl path causes failure of rootfs image creation
like this:

| error: Failed dependencies:
|       /bin/perl is needed by eglibc-utils-2.13-r23+svnr15508.i586
NOTE: package core-image-sato-1.0-r0: task do_rootfs: Failed
ERROR: Task 8
(/home/nitin/prj/poky.git/meta/recipes-sato/images/core-image-sato.bb,
do_rootfs) failed with exit code '1'

This Fixes bug : [YOCTO #2286]

Signed-off-by: Nitin A Kamble <nitin.a.kamble@intel.com>
---
 meta/recipes-core/eglibc/eglibc-package.inc |    5 +++++
 meta/recipes-core/eglibc/eglibc_2.13.bb     |    2 +-
 meta/recipes-core/eglibc/eglibc_2.15.bb     |    2 +-
 3 files changed, 7 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/eglibc/eglibc-package.inc b/meta/recipes-core/eglibc/eglibc-package.inc
index 9e45fc1..d13cb35 100644
--- a/meta/recipes-core/eglibc/eglibc-package.inc
+++ b/meta/recipes-core/eglibc/eglibc-package.inc
@@ -76,6 +76,11 @@ do_install_append () {
 	rm -f ${D}${sysconfdir}/localtime
 
 	oe_multilib_header bits/syscall.h
+	
+	if [ -f ${D}${bindir}/mtrace ]
+	then
+		sed -e "s# /bin/perl# ${bindir}/perl#" -i ${D}${bindir}/mtrace 
+	fi
 }
 
 do_install_locale () {
diff --git a/meta/recipes-core/eglibc/eglibc_2.13.bb b/meta/recipes-core/eglibc/eglibc_2.13.bb
index ec06261..d8a41dc 100644
--- a/meta/recipes-core/eglibc/eglibc_2.13.bb
+++ b/meta/recipes-core/eglibc/eglibc_2.13.bb
@@ -3,7 +3,7 @@ require eglibc.inc
 SRCREV = "15508"
 
 DEPENDS += "gperf-native"
-PR = "r25"
+PR = "r26"
 PR_append = "+svnr${SRCPV}"
 
 EGLIBC_BRANCH="eglibc-2_13"
diff --git a/meta/recipes-core/eglibc/eglibc_2.15.bb b/meta/recipes-core/eglibc/eglibc_2.15.bb
index caed9e9..713efc3 100644
--- a/meta/recipes-core/eglibc/eglibc_2.15.bb
+++ b/meta/recipes-core/eglibc/eglibc_2.15.bb
@@ -3,7 +3,7 @@ require eglibc.inc
 SRCREV = "17386"
 
 DEPENDS += "gperf-native"
-PR = "r5"
+PR = "r6"
 PR_append = "+svnr${SRCPV}"
 
 EGLIBC_BRANCH="eglibc-2_15"
-- 
1.7.7



