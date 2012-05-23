Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <nitin.a.kamble@intel.com>) id 1SWzDK-0006Li-DT
	for openembedded-core@lists.openembedded.org;
	Wed, 23 May 2012 02:14:07 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 22 May 2012 17:03:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="146507186"
Received: from nbuild0.sc.intel.com ([172.25.110.36])
	by azsmga001.ch.intel.com with ESMTP; 22 May 2012 17:03:49 -0700
From: nitin.a.kamble@intel.com
To: openembedded-core@lists.openembedded.org
Date: Tue, 22 May 2012 17:03:43 -0700
Message-Id: <20e7a0b4b4350b755701927d1dc5d7bf08f191b3.1337731367.git.nitin.a.kamble@intel.com>
X-Mailer: git-send-email 1.7.6.5
In-Reply-To: <1f3e6932358a90ba8402191fb495729c873634cb.1337731367.git.nitin.a.kamble@intel.com>
References: <1f3e6932358a90ba8402191fb495729c873634cb.1337731367.git.nitin.a.kamble@intel.com>
In-Reply-To: <cover.1337731367.git.nitin.a.kamble@intel.com>
References: <cover.1337731367.git.nitin.a.kamble@intel.com>
Subject: [PATCH 28/30] gawk-3.1.5: fix build with automake 1.12
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
X-List-Received-Date: Wed, 23 May 2012 00:14:10 -0000

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
1.7.7



