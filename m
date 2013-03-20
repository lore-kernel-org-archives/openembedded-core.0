Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1UIMyB-0000hs-41
	for openembedded-core@lists.openembedded.org;
	Wed, 20 Mar 2013 18:38:39 +0100
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 20 Mar 2013 10:21:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,880,1355126400"; d="scan'208";a="217011166"
Received: from unknown (HELO swold-linux.bigsur.com) ([10.255.13.175])
	by AZSMGA002.ch.intel.com with ESMTP; 20 Mar 2013 10:21:28 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 20 Mar 2013 10:21:26 -0700
Message-Id: <1363800087-29768-2-git-send-email-sgw@linux.intel.com>
X-Mailer: git-send-email 1.8.0.2
In-Reply-To: <1363800087-29768-1-git-send-email-sgw@linux.intel.com>
References: <1363800087-29768-1-git-send-email-sgw@linux.intel.com>
Cc: Alexandru DAMIAN <alexandru.damian@intel.com>
Subject: [PATCH 1/2] grep: Always use locale.h
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
X-List-Received-Date: Wed, 20 Mar 2013 17:38:41 -0000

From: Alexandru DAMIAN <alexandru.damian@intel.com>

The changes in the grep 2.5 configuration always leave out
HAVE_LOCALE_H - it has been removed from other files, but
not from everywhere.

This leads to a crash in certain configurations where the
size of int is not the size of pointer; this happens because
setlocale() is used while being undeclared.

[YOCTO #3959]

Signed-off-by: Alexandru DAMIAN <alexandru.damian@intel.com>
Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 .../grep/grep-2.5.1a/fix64-int-to-pointer.patch         | 17 +++++++++++++++++
 meta/recipes-extended/grep/grep_2.5.1a.bb               |  1 +
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
1.8.0.2



