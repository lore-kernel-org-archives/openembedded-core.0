Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <tom.zanussi@intel.com>) id 1TLkg5-00055e-RN
	for openembedded-core@lists.openembedded.org;
	Wed, 10 Oct 2012 03:01:38 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 09 Oct 2012 17:48:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,562,1344236400"; d="scan'208";a="232754504"
Received: from unknown (HELO localhost) ([10.255.13.229])
	by fmsmga002.fm.intel.com with ESMTP; 09 Oct 2012 17:48:28 -0700
From: tom.zanussi@intel.com
To: openembedded-core@lists.openembedded.org
Date: Tue,  9 Oct 2012 19:48:25 -0500
Message-Id: <2bc985f69847a615429a908aa0e8f972a8be91f9.1349829329.git.tom.zanussi@intel.com>
X-Mailer: git-send-email 1.7.11.4
In-Reply-To: <b574551d9055cfed77428aab0035305f64100e3d.1349829329.git.tom.zanussi@intel.com>
References: <b574551d9055cfed77428aab0035305f64100e3d.1349829329.git.tom.zanussi@intel.com>
In-Reply-To: <cover.1349829329.git.tom.zanussi@intel.com>
References: <cover.1349829329.git.tom.zanussi@intel.com>
Subject: [PATCH 2/2] perl: use archlib_exp config.sh variable
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 10 Oct 2012 01:01:38 -0000

From: Tom Zanussi <tom.zanussi@intel.com>

This patch uses an unmodified version of archlibexp called
archlib_exp, introduced by a previous patch to config.sh, which is
used to generate the correct value of ARCHLIB_EXP into config.h

Fixes [YOCTO #3099].

Signed-off-by: Tom Zanussi <tom.zanussi@intel.com>
---
 .../perl/perl-5.14.2/perl-archlib-exp.patch               | 15 +++++++++++++++
 meta/recipes-devtools/perl/perl_5.14.2.bb                 |  3 ++-
 2 files changed, 17 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-devtools/perl/perl-5.14.2/perl-archlib-exp.patch

diff --git a/meta/recipes-devtools/perl/perl-5.14.2/perl-archlib-exp.patch b/meta/recipes-devtools/perl/perl-5.14.2/perl-archlib-exp.patch
new file mode 100644
index 0000000..1c170ef
--- /dev/null
+++ b/meta/recipes-devtools/perl/perl-5.14.2/perl-archlib-exp.patch
@@ -0,0 +1,15 @@
+Upstream-Status:Inappropriate [embedded specific]
+
+Index: perl-5.14.2/config_h.SH
+===================================================================
+--- perl-5.14.2.orig/config_h.SH
++++ perl-5.14.2/config_h.SH
+@@ -996,7 +996,7 @@ sed <<!GROK!THIS! >$CONFIG_H -e 's!^#und
+  *	in programs that are not prepared to deal with ~ expansion at run-time.
+  */
+ #$d_archlib ARCHLIB "$archlib"		/**/
+-#$d_archlib ARCHLIB_EXP "$archlibexp"		/**/
++#$d_archlib ARCHLIB_EXP "$archlib_exp"		/**/
+ 
+ /* ARCHNAME:
+  *	This symbol holds a string representing the architecture name.
diff --git a/meta/recipes-devtools/perl/perl_5.14.2.bb b/meta/recipes-devtools/perl/perl_5.14.2.bb
index 09b2acb..d9206d8 100644
--- a/meta/recipes-devtools/perl/perl_5.14.2.bb
+++ b/meta/recipes-devtools/perl/perl_5.14.2.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://Copying;md5=2b4c6ffbcfcbdee469f02565f253d81a \
 # We need gnugrep (for -I)
 DEPENDS = "virtual/db grep-native"
 DEPENDS += "gdbm zlib"
-PR = "r10"
+PR = "r11"
 
 # 5.10.1 has Module::Build built-in
 PROVIDES += "libmodule-build-perl"
@@ -66,6 +66,7 @@ SRC_URI = "http://www.cpan.org/src/5.0/perl-${PV}.tar.gz \
         file://cross-generate_uudmap.patch \
 	file://fix_bad_rpath.patch \
 	file://perl-build-in-t-dir.patch \
+	file://perl-archlib-exp.patch \
 	\
         file://config.sh \
         file://config.sh-32 \
-- 
1.7.11.4



