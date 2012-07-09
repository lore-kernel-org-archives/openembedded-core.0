Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <nitin.a.kamble@intel.com>) id 1SoGys-00041S-65
	for Openembedded-core@lists.openembedded.org;
	Mon, 09 Jul 2012 18:38:38 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 09 Jul 2012 09:27:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="175108532"
Received: from yocto-hm1.jf.intel.com ([10.23.232.32])
	by fmsmga001.fm.intel.com with ESMTP; 09 Jul 2012 09:27:29 -0700
From: nitin.a.kamble@intel.com
To: Openembedded-core@lists.openembedded.org
Date: Mon,  9 Jul 2012 09:26:03 -0700
Message-Id: <5223fee3f144dc5de6384dae1e635ae004d9a7bb.1341850982.git.nitin.a.kamble@intel.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <8d1d42a68d5930bc374b9d6126cc1371a22a37db.1341850982.git.nitin.a.kamble@intel.com>
References: <8d1d42a68d5930bc374b9d6126cc1371a22a37db.1341850982.git.nitin.a.kamble@intel.com>
In-Reply-To: <cover.1341850982.git.nitin.a.kamble@intel.com>
References: <cover.1341850982.git.nitin.a.kamble@intel.com>
Subject: [PATCH 02/15] jpeg: fix configure with automake 1.12.1
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
X-List-Received-Date: Mon, 09 Jul 2012 16:38:38 -0000

From: Nitin A Kamble <nitin.a.kamble@intel.com>

Bring back earlier jpeg fix. upstream has removed the fix from earlier release.

The support for automatic de-ANSI-fication has been deprecated in
automake 1.11.2, and will be removed altogether in automake 1.12

This avoids this error:
| configure.ac:24: automatic de-ANSI-fication support is deprecated
| autoreconf: automake failed with exit status: 1
| ERROR: autoreconf execution failed.
NOTE: package jpeg-native-8c-r2: task do_configure: Failed

(From OE-Core rev: 893ce9db79a5c4cca8a6b6ed6a9cec81777aba2f)

Signed-off-by: Nitin A Kamble <nitin.a.kamble@intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../jpeg/jpeg-8d/fix_for_automake_1.12.1.patch     |   44 ++++++++++++++++++++
 meta/recipes-core/jpeg/jpeg_8d.bb                  |    5 +-
 2 files changed, 47 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-core/jpeg/jpeg-8d/fix_for_automake_1.12.1.patch

diff --git a/meta/recipes-core/jpeg/jpeg-8d/fix_for_automake_1.12.1.patch b/meta/recipes-core/jpeg/jpeg-8d/fix_for_automake_1.12.1.patch
new file mode 100644
index 0000000..3a970ea
--- /dev/null
+++ b/meta/recipes-core/jpeg/jpeg-8d/fix_for_automake_1.12.1.patch
@@ -0,0 +1,44 @@
+Upstream-Status: Pending
+
+The support for automatic de-ANSI-fication has been deprecated in
+automake 1.11.2, and will be removed altogether in automake 1.12
+
+This avoids this error:
+| configure.ac:24: automatic de-ANSI-fication support is deprecated
+| autoreconf: automake failed with exit status: 1
+| ERROR: autoreconf execution failed.
+NOTE: package jpeg-native-8c-r2: task do_configure: Failed
+
+Signed-Off-By: Nitin A Kamble <nitin.a.kamble@intel.com>
+2011/12/28
+
+
+Index: jpeg-8d/configure.ac
+===================================================================
+--- jpeg-8d.orig/configure.ac
++++ jpeg-8d/configure.ac
+@@ -21,7 +21,7 @@ AC_CANONICAL_TARGET
+ 
+ # Initialize Automake
+ # Don't require all the GNU mandated files
+-AM_INIT_AUTOMAKE([-Wall -Werror -Wno-obsolete ansi2knr no-dist foreign])
++AM_INIT_AUTOMAKE([-Wall -Werror -Wno-obsolete no-dist foreign])
+ 
+ # Make --enable-silent-rules the default.
+ # To get verbose build output you may configure
+@@ -29,7 +29,14 @@ AM_INIT_AUTOMAKE([-Wall -Werror -Wno-obs
+ AM_SILENT_RULES([yes])
+ 
+ # This is required when using the de-ANSI-fication feature.
+-AM_C_PROTOTYPES
++#AM_C_PROTOTYPES
++# add following to avoid this error:
++#| automake: warnings are treated as errors
++#| /srv/home/nitin/builds2/build0/tmp/sysroots/x86_64-linux/usr/share/automake-1.12/am/ltlibrary.am: warning: 'libjpeg.la': linking libtool libraries using a non-POSIX
++#| /srv/home/nitin/builds2/build0/tmp/sysroots/x86_64-linux/usr/share/automake-1.12/am/ltlibrary.am: archiver requires 'AM_PROG_AR' in 'configure.ac'
++#| Makefile.am:65:   while processing Libtool library 'libjpeg.la'
++#| autoreconf: automake failed with exit status: 1
++AM_PROG_AR
+ 
+ # Add configure option --enable-maintainer-mode which enables
+ # dependency checking and generation useful to package maintainers.
diff --git a/meta/recipes-core/jpeg/jpeg_8d.bb b/meta/recipes-core/jpeg/jpeg_8d.bb
index 61f1c2e..6781619 100644
--- a/meta/recipes-core/jpeg/jpeg_8d.bb
+++ b/meta/recipes-core/jpeg/jpeg_8d.bb
@@ -11,10 +11,11 @@ SECTION = "libs"
 DEPENDS = "libtool-cross"
 DEPENDS_virtclass-native = "libtool-native"
 
-PR = "r0"
+PR = "r1"
 
 SRC_URI = "http://www.ijg.org/files/jpegsrc.v${PV}.tar.gz \
-	   file://debian-libjpeg7_7-1.diff"
+	   file://debian-libjpeg7_7-1.diff \
+           file://fix_for_automake_1.12.1.patch"
 
 SRC_URI[md5sum] = "52654eb3b2e60c35731ea8fc87f1bd29"
 SRC_URI[sha256sum] = "00029b1473f0f0ea72fbca3230e8cb25797fbb27e58ae2e46bb8bf5a806fe0b3"
-- 
1.7.3.4



