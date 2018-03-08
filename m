Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 68EC1789C4
	for <openembedded-core@lists.openembedded.org>;
	Thu,  8 Mar 2018 18:25:21 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
	by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	08 Mar 2018 10:25:23 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.47,441,1515484800"; d="scan'208";a="24053973"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by orsmga006.jf.intel.com with ESMTP; 08 Mar 2018 10:25:21 -0800
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  8 Mar 2018 20:17:48 +0200
Message-Id: <20180308181804.31261-26-alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.16.1
In-Reply-To: <20180308181804.31261-1-alexander.kanavin@linux.intel.com>
References: <20180308181804.31261-1-alexander.kanavin@linux.intel.com>
Subject: [PATCH 26/42] pam: refresh patches
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 08 Mar 2018 18:25:21 -0000

From: Ross Burton <ross.burton@intel.com>

The patch tool will apply patches by default with "fuzz", which is where if the
hunk context isn't present but what is there is close enough, it will force the
patch in.

Whilst this is useful when there's just whitespace changes, when applied to
source it is possible for a patch applied with fuzz to produce broken code which
still compiles (see #10450).  This is obviously bad.

We'd like to eventually have do_patch() rejecting any fuzz on these grounds. For
that to be realistic the existing patches with fuzz need to be rebased and
reviewed.

Signed-off-by: Ross Burton <ross.burton@intel.com>
Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 .../pam/libpam/libpam-xtests.patch                 | 14 +++++++------
 .../pam-security-abstract-securetty-handling.patch | 23 ++++++++++++----------
 2 files changed, 21 insertions(+), 16 deletions(-)

diff --git a/meta/recipes-extended/pam/libpam/libpam-xtests.patch b/meta/recipes-extended/pam/libpam/libpam-xtests.patch
index be687457f82..7edf66f9153 100644
--- a/meta/recipes-extended/pam/libpam/libpam-xtests.patch
+++ b/meta/recipes-extended/pam/libpam/libpam-xtests.patch
@@ -3,18 +3,20 @@ This patch is used to create a new sub package libpam-xtests to do more checks.
 Upstream-Status: Pending
 
 Signed-off-by: Kang Kai <kai.kang@windriver.com>
---- Linux-PAM-1.1.4/xtests/Makefile.am.orig	2011-07-19 17:00:09.619980001 +0800
-+++ Linux-PAM-1.1.4/xtests/Makefile.am	2011-07-19 16:54:00.229979998 +0800
-@@ -7,7 +7,7 @@
- AM_LDFLAGS = -L$(top_builddir)/libpam -lpam \
- 	-L$(top_builddir)/libpam_misc -lpam_misc
+Index: Linux-PAM-1.3.0/xtests/Makefile.am
+===================================================================
+--- Linux-PAM-1.3.0.orig/xtests/Makefile.am
++++ Linux-PAM-1.3.0/xtests/Makefile.am
+@@ -7,7 +7,7 @@ AM_CFLAGS = -DLIBPAM_COMPILE -I$(top_src
+ LDADD = $(top_builddir)/libpam/libpam.la \
+ 	$(top_builddir)/libpam_misc/libpam_misc.la
  
 -CLEANFILES = *~ $(XTESTS)
 +CLEANFILES = *~
  
  EXTRA_DIST = run-xtests.sh tst-pam_dispatch1.pamd tst-pam_dispatch2.pamd \
  	tst-pam_dispatch3.pamd tst-pam_dispatch4.pamd \
-@@ -51,3 +51,18 @@
+@@ -51,3 +51,18 @@ EXTRA_PROGRAMS = $(XTESTS)
  
  xtests: $(XTESTS) run-xtests.sh
  	"$(srcdir)"/run-xtests.sh "$(srcdir)" ${XTESTS} ${NOSRCTESTS}
diff --git a/meta/recipes-extended/pam/libpam/pam-security-abstract-securetty-handling.patch b/meta/recipes-extended/pam/libpam/pam-security-abstract-securetty-handling.patch
index f1834f6ce34..9b8d4c29751 100644
--- a/meta/recipes-extended/pam/libpam/pam-security-abstract-securetty-handling.patch
+++ b/meta/recipes-extended/pam/libpam/pam-security-abstract-securetty-handling.patch
@@ -5,12 +5,13 @@ Upstream-Status: Pending
 
 Signed-off-by: Ming Liu <ming.liu@windriver.com>
 ===================================================================
-diff -urpN a/modules/pam_securetty/Makefile.am b/modules/pam_securetty/Makefile.am
---- a/modules/pam_securetty/Makefile.am	2013-07-05 11:08:23.224483237 +0800
-+++ b/modules/pam_securetty/Makefile.am	2013-07-05 11:15:21.304486456 +0800
+Index: Linux-PAM-1.3.0/modules/pam_securetty/Makefile.am
+===================================================================
+--- Linux-PAM-1.3.0.orig/modules/pam_securetty/Makefile.am
++++ Linux-PAM-1.3.0/modules/pam_securetty/Makefile.am
 @@ -24,6 +24,10 @@ endif
  securelib_LTLIBRARIES = pam_securetty.la
- pam_securetty_la_LIBADD = -L$(top_builddir)/libpam -lpam
+ pam_securetty_la_LIBADD = $(top_builddir)/libpam/libpam.la
  
 +pam_securetty_la_SOURCES =	\
 +	pam_securetty.c		\
@@ -19,9 +20,10 @@ diff -urpN a/modules/pam_securetty/Makefile.am b/modules/pam_securetty/Makefile.
  if ENABLE_REGENERATE_MAN
  noinst_DATA = README
  README: pam_securetty.8.xml
-diff -urpN a/modules/pam_securetty/pam_securetty.c b/modules/pam_securetty/pam_securetty.c
---- a/modules/pam_securetty/pam_securetty.c	2013-07-05 11:07:50.064483568 +0800
-+++ b/modules/pam_securetty/pam_securetty.c	2013-07-05 11:12:23.994483344 +0800
+Index: Linux-PAM-1.3.0/modules/pam_securetty/pam_securetty.c
+===================================================================
+--- Linux-PAM-1.3.0.orig/modules/pam_securetty/pam_securetty.c
++++ Linux-PAM-1.3.0/modules/pam_securetty/pam_securetty.c
 @@ -1,7 +1,5 @@
  /* pam_securetty module */
  
@@ -104,9 +106,10 @@ diff -urpN a/modules/pam_securetty/pam_securetty.c b/modules/pam_securetty/pam_s
  
      if (retval && !(ctrl & PAM_NOCONSOLE_ARG)) {
          FILE *cmdlinefile;
-diff -urpN a/modules/pam_securetty/tty_secure.c b/modules/pam_securetty/tty_secure.c
---- a/modules/pam_securetty/tty_secure.c	1970-01-01 08:30:00.000000000 +0830
-+++ b/modules/pam_securetty/tty_secure.c	2013-07-05 11:14:21.534482900 +0800
+Index: Linux-PAM-1.3.0/modules/pam_securetty/tty_secure.c
+===================================================================
+--- /dev/null
++++ Linux-PAM-1.3.0/modules/pam_securetty/tty_secure.c
 @@ -0,0 +1,90 @@
 +/*
 + * A function to determine if a particular line is in /etc/securetty
-- 
2.16.1


