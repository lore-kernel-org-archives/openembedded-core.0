Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <nitin.a.kamble@intel.com>) id 1SIYVQ-0005Ja-MK
	for openembedded-core@lists.openembedded.org;
	Fri, 13 Apr 2012 06:53:08 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 12 Apr 2012 21:43:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="153106857"
Received: from nbuild0.sc.intel.com ([172.25.110.36])
	by fmsmga002.fm.intel.com with ESMTP; 12 Apr 2012 21:43:46 -0700
From: nitin.a.kamble@intel.com
To: openembedded-core@lists.openembedded.org
Date: Thu, 12 Apr 2012 21:43:44 -0700
Message-Id: <521759489c1e0af1ab878926ea0df290054139eb.1334292091.git.nitin.a.kamble@intel.com>
X-Mailer: git-send-email 1.7.6.5
In-Reply-To: <cover.1334292091.git.nitin.a.kamble@intel.com>
References: <cover.1334292091.git.nitin.a.kamble@intel.com>
Subject: [PATCH 1/2] eglibc: fix perl path in target scripts on fedora 17 alpha
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
X-List-Received-Date: Fri, 13 Apr 2012 04:53:08 -0000

From: Nitin A Kamble <nitin.a.kamble@intel.com>

fedora 17 has /usr/bin/perl as well as /bin/perl, which results in
 the perl path set in thetarget  perl scripts as /bin/perl
While we install perl on target at ${bindir}/perl i.e. /usr/bin/perl
Hence the target perl scripts are broken when build is done on fedora 17.
Work around the issue by providing cached value of perl path to eglibc

This fixes bug [YOCTO #2286]

Signed-off-by: Nitin A Kamble <nitin.a.kamble@intel.com>
---
 meta/recipes-core/eglibc/eglibc.inc     |    2 ++
 meta/recipes-core/eglibc/eglibc_2.13.bb |    2 +-
 meta/recipes-core/eglibc/eglibc_2.15.bb |    2 +-
 3 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/eglibc/eglibc.inc b/meta/recipes-core/eglibc/eglibc.inc
index 8e3fe50..6693447 100644
--- a/meta/recipes-core/eglibc/eglibc.inc
+++ b/meta/recipes-core/eglibc/eglibc.inc
@@ -54,3 +54,5 @@ do_configure_prepend() {
 GLIBC_ADDONS ?= "ports,nptl,libidn"
 SDK_GLIBC_ADDONS ?= "ports,nptl,libidn"
 GLIBC_ADDONS_virtclass-nativesdk = "${SDK_GLIBC_ADDONS}"
+
+CACHED_CONFIGUREVARS = "ac_cv_path_PERL=${bindir}/perl"
diff --git a/meta/recipes-core/eglibc/eglibc_2.13.bb b/meta/recipes-core/eglibc/eglibc_2.13.bb
index 927f72f..fd6b60a 100644
--- a/meta/recipes-core/eglibc/eglibc_2.13.bb
+++ b/meta/recipes-core/eglibc/eglibc_2.13.bb
@@ -3,7 +3,7 @@ require eglibc.inc
 SRCREV = "15508"
 
 DEPENDS += "gperf-native"
-PR = "r23"
+PR = "r24"
 PR_append = "+svnr${SRCPV}"
 
 EGLIBC_BRANCH="eglibc-2_13"
diff --git a/meta/recipes-core/eglibc/eglibc_2.15.bb b/meta/recipes-core/eglibc/eglibc_2.15.bb
index 1575e7f..a9c551a 100644
--- a/meta/recipes-core/eglibc/eglibc_2.15.bb
+++ b/meta/recipes-core/eglibc/eglibc_2.15.bb
@@ -3,7 +3,7 @@ require eglibc.inc
 SRCREV = "17386"
 
 DEPENDS += "gperf-native"
-PR = "r3"
+PR = "r4"
 PR_append = "+svnr${SRCPV}"
 
 EGLIBC_BRANCH="eglibc-2_15"
-- 
1.7.7



