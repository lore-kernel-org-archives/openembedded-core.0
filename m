Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ddalex@intel.com>) id 1UFMDG-0004Yf-EL
	for openembedded-core@lists.openembedded.org;
	Tue, 12 Mar 2013 11:13:46 +0100
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 12 Mar 2013 02:54:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,829,1355126400"; d="scan'208";a="299912900"
Received: from adamian-desktop.rb.intel.com ([10.237.105.51])
	by orsmga002.jf.intel.com with ESMTP; 12 Mar 2013 02:55:57 -0700
Received: by adamian-desktop.rb.intel.com (Postfix, from userid 1000)
	id F1FA4560ADA; Tue, 12 Mar 2013 11:56:07 +0200 (EET)
From: Alex DAMIAN <alexandru.damian@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 12 Mar 2013 11:56:02 +0200
Message-Id: <1363082162-22911-3-git-send-email-alexandru.damian@intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1363082162-22911-1-git-send-email-alexandru.damian@intel.com>
References: <1363082162-22911-1-git-send-email-alexandru.damian@intel.com>
Cc: Alexandru DAMIAN <alexandru.damian@intel.com>
Subject: [Patch V3] grep: Always use locale.h
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
X-List-Received-Date: Tue, 12 Mar 2013 10:13:56 -0000
X-List-Received-Date: Tue, 12 Mar 2013 10:13:56 -0000

From: Alexandru DAMIAN <alexandru.damian@intel.com>

The changes in the grep 2.5 configuration always leave out
HAVE_LOCALE_H - it has been removed from other files, but
not from everywhere.

This leads to a crash in certain configurations where the
size of int is not the size of pointer; this happens because
setlocale() is used while being undeclared.

[YOCTO #3959]

Signed-off-by: Alexandru DAMIAN <alexandru.damian@intel.com>
---
 .../grep/grep-2.5.1a/fix64-int-to-pointer.patch       |   17 +++++++++++++++++
 meta/recipes-extended/grep/grep_2.5.1a.bb             |    1 +
 2 files changed, 18 insertions(+)
 create mode 100644 meta/recipes-extended/grep/grep-2.5.1a/fix64-int-to-pointer.patch

diff --git a/meta/recipes-extended/grep/grep-2.5.1a/fix64-int-to-pointer.patch b/meta/recipes-extended/grep/grep-2.5.1a/fix64-int-to-pointer.patch
new file mode 100644
index 0000000..3b91520
--- /dev/null
+++ b/meta/recipes-extended/grep/grep-2.5.1a/fix64-int-to-pointer.patch
@@ -0,0 +1,17 @@
+Always use locale.h as HAVE_LOCALE_H is no longer handled by ./configure
+Upstream-Status: Inappropriate [ old version that will not be maintained ]
+Signed-off-by: Alex DAMIAN <alexandru.damian@intel.com>
+
+diff --recursive --unified grep-2.5.1a-orig/lib/hard-locale.c grep-2.5.1a/lib/hard-locale.c
+--- grep-2.5.1a-orig/lib/hard-locale.c	2001-03-04 07:33:12.000000000 +0200
++++ grep-2.5.1a/lib/hard-locale.c	2013-03-11 17:05:52.086444891 +0200
+@@ -38,9 +38,7 @@
+ # endif
+ #endif
+ 
+-#if HAVE_LOCALE_H
+ # include <locale.h>
+-#endif
+ 
+ #if HAVE_STRING_H
+ # include <string.h>
diff --git a/meta/recipes-extended/grep/grep_2.5.1a.bb b/meta/recipes-extended/grep/grep_2.5.1a.bb
index ebcbe23..d6386ed 100644
--- a/meta/recipes-extended/grep/grep_2.5.1a.bb
+++ b/meta/recipes-extended/grep/grep_2.5.1a.bb
@@ -11,6 +11,7 @@ SRC_URI = "${GNU_MIRROR}/grep/grep-${PV}.tar.bz2 \
            file://uclibc-fix.patch \
            file://grep_fix_for_automake-1.12.patch \
            file://gettext.patch \
+           file://fix64-int-to-pointer.patch \
            file://Makevars \
            "
 
-- 
1.7.10.4



