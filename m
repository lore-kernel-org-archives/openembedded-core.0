Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <nitin.a.kamble@intel.com>) id 1SIYVR-0005Ja-C8
	for openembedded-core@lists.openembedded.org;
	Fri, 13 Apr 2012 06:53:09 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 12 Apr 2012 21:43:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="153106859"
Received: from nbuild0.sc.intel.com ([172.25.110.36])
	by fmsmga002.fm.intel.com with ESMTP; 12 Apr 2012 21:43:46 -0700
From: nitin.a.kamble@intel.com
To: openembedded-core@lists.openembedded.org
Date: Thu, 12 Apr 2012 21:43:45 -0700
Message-Id: <5f8314f50e2934a055cf6d17da180c89b9740e89.1334292091.git.nitin.a.kamble@intel.com>
X-Mailer: git-send-email 1.7.6.5
In-Reply-To: <521759489c1e0af1ab878926ea0df290054139eb.1334292091.git.nitin.a.kamble@intel.com>
References: <521759489c1e0af1ab878926ea0df290054139eb.1334292091.git.nitin.a.kamble@intel.com>
In-Reply-To: <cover.1334292091.git.nitin.a.kamble@intel.com>
References: <cover.1334292091.git.nitin.a.kamble@intel.com>
Subject: [PATCH 2/2] eglibc: clean up the common code from 2.1[35] versions
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
X-List-Received-Date: Fri, 13 Apr 2012 04:53:09 -0000

From: Nitin A Kamble <nitin.a.kamble@intel.com>

consolidate all the common cached config vars in one location

no PR bump as this does not change the output of the recipe.

Signed-off-by: Nitin A Kamble <nitin.a.kamble@intel.com>
---
 meta/recipes-core/eglibc/eglibc.inc     |    2 +-
 meta/recipes-core/eglibc/eglibc_2.13.bb |    3 ---
 meta/recipes-core/eglibc/eglibc_2.15.bb |    2 --
 3 files changed, 1 insertions(+), 6 deletions(-)

diff --git a/meta/recipes-core/eglibc/eglibc.inc b/meta/recipes-core/eglibc/eglibc.inc
index 6693447..222919e 100644
--- a/meta/recipes-core/eglibc/eglibc.inc
+++ b/meta/recipes-core/eglibc/eglibc.inc
@@ -55,4 +55,4 @@ GLIBC_ADDONS ?= "ports,nptl,libidn"
 SDK_GLIBC_ADDONS ?= "ports,nptl,libidn"
 GLIBC_ADDONS_virtclass-nativesdk = "${SDK_GLIBC_ADDONS}"
 
-CACHED_CONFIGUREVARS = "ac_cv_path_PERL=${bindir}/perl"
+CACHED_CONFIGUREVARS = "libc_cv_slibdir=${base_libdir} ac_cv_path_PERL=${bindir}/perl"
diff --git a/meta/recipes-core/eglibc/eglibc_2.13.bb b/meta/recipes-core/eglibc/eglibc_2.13.bb
index fd6b60a..178fc5d 100644
--- a/meta/recipes-core/eglibc/eglibc_2.13.bb
+++ b/meta/recipes-core/eglibc/eglibc_2.13.bb
@@ -56,9 +56,6 @@ python __anonymous () {
                                    d.getVar('TARGET_OS', True))
 }
 
-export libc_cv_slibdir = "${base_libdir}"
-
-
 EXTRA_OECONF = "--enable-kernel=${OLDEST_KERNEL} \
                 --without-cvs --disable-profile --disable-debug --without-gd \
                 --enable-clocale=gnu \
diff --git a/meta/recipes-core/eglibc/eglibc_2.15.bb b/meta/recipes-core/eglibc/eglibc_2.15.bb
index a9c551a..ea9cb57 100644
--- a/meta/recipes-core/eglibc/eglibc_2.15.bb
+++ b/meta/recipes-core/eglibc/eglibc_2.15.bb
@@ -61,8 +61,6 @@ python __anonymous () {
                                    d.getVar('TARGET_OS', True))
 }
 
-export libc_cv_slibdir = "${base_libdir}"
-
 EXTRA_OECONF = "--enable-kernel=${OLDEST_KERNEL} \
                 --without-cvs --disable-profile --disable-debug --without-gd \
                 --enable-clocale=gnu \
-- 
1.7.7



