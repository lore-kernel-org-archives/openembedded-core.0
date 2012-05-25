Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SXoPF-0000E6-N7
	for openembedded-core@lists.openembedded.org;
	Fri, 25 May 2012 08:53:49 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 24 May 2012 23:43:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="157115457"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.12.24])
	by fmsmga001.fm.intel.com with ESMTP; 24 May 2012 23:42:32 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 24 May 2012 23:42:13 -0700
Message-Id: <e41f732a6326c790b95fe37c49c86400a32f4580.1337927956.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.7.6
In-Reply-To: <cover.1337927956.git.sgw@linux.intel.com>
References: <cover.1337927956.git.sgw@linux.intel.com>
In-Reply-To: <cover.1337927956.git.sgw@linux.intel.com>
References: <cover.1337927956.git.sgw@linux.intel.com>
Subject: [Consolidated Pull 34/45] gawk-3.1.5: fix build with automake 1.12
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
X-List-Received-Date: Fri, 25 May 2012 06:53:50 -0000

From: Nitin A Kamble <nitin.a.kamble@intel.com>

Signed-off-by: Nitin A Kamble <nitin.a.kamble@intel.com>
---
 .../gawk-3.1.5/gawk_fix_for_automake-1.12.patch    |   41 ++++++++++++++++++++
 meta/recipes-extended/gawk/gawk_3.1.5.bb           |    2 +
 2 files changed, 43 insertions(+), 0 deletions(-)
 create mode 100644 meta/recipes-extended/gawk/gawk-3.1.5/gawk_fix_for_automake-1.12.patch

diff --git a/meta/recipes-extended/gawk/gawk-3.1.5/gawk_fix_for_automake-1.12.patch b/meta/recipes-extended/gawk/gawk-3.1.5/gawk_fix_for_automake-1.12.patch
new file mode 100644
index 0000000..b3e7987
--- /dev/null
+++ b/meta/recipes-extended/gawk/gawk-3.1.5/gawk_fix_for_automake-1.12.patch
@@ -0,0 +1,41 @@
+Upstream-Status: Pending
+
+automake 1.12 has depricated automatic de-ANSI-fication support
+
+this patch avoids these kinds of errors:
+
+| configure.ac:127: error: automatic de-ANSI-fication support has been removed
+| /srv/home/nitin/builds/build-gcc47/tmp/sysroots/x86_64-linux/usr/share/aclocal-1.12/protos.m4:12: AM_C_PROTOTYPES is expanded from...
+| configure.ac:127: the top level
+| autom4te: m4 failed with exit status: 1
+...
+| Makefile.am:27: error: automatic de-ANSI-fication support has been removed
+
+Signed-Off-By: Nitin A Kamble <nitin.a.kamble@intel.com>
+2012/05/04
+
+Index: gawk-3.1.5/configure.ac
+===================================================================
+--- gawk-3.1.5.orig/configure.ac
++++ gawk-3.1.5/configure.ac
+@@ -124,7 +124,6 @@ fi
+ 
+ dnl check for C compiler for automake
+ AM_PROG_CC_STDC
+-AM_C_PROTOTYPES
+ 
+ dnl Cygwin doesn't like to get libs with full paths
+ dnl since that overrides linking against DLLs.
+Index: gawk-3.1.5/Makefile.am
+===================================================================
+--- gawk-3.1.5.orig/Makefile.am
++++ gawk-3.1.5/Makefile.am
+@@ -24,7 +24,7 @@
+ ## process this file with automake to produce Makefile.in
+ 
+ # Automatic de-ANSI-fication if needed, make .bz2 files also.
+-AUTOMAKE_OPTIONS = ansi2knr dist-bzip2
++AUTOMAKE_OPTIONS = dist-bzip2
+ 
+ # This undocumented variable insures that aclocal runs
+ # correctly after changing configure.ac
diff --git a/meta/recipes-extended/gawk/gawk_3.1.5.bb b/meta/recipes-extended/gawk/gawk_3.1.5.bb
index d5d9bea..4c7cdf3 100644
--- a/meta/recipes-extended/gawk/gawk_3.1.5.bb
+++ b/meta/recipes-extended/gawk/gawk_3.1.5.bb
@@ -34,6 +34,8 @@ ALTERNATIVE_PATH = "gawk"
 ALTERNATIVE_LINK = "${bindir}/awk"
 ALTERNATIVE_PRIORITY = "100"
 
+CFLAGS += "-D PROTOTYPES"
+
 do_install_append() {
 	# remove the link since we don't package it
 	rm ${D}${bindir}/awk
-- 
1.7.7.6



