Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SSFrU-0002jF-OF
	for openembedded-core@lists.openembedded.org;
	Thu, 10 May 2012 01:00:00 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 09 May 2012 15:50:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="142077330"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.12.218])
	by orsmga002.jf.intel.com with ESMTP; 09 May 2012 15:50:05 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  9 May 2012 15:50:03 -0700
Message-Id: <64cd1b752462115994f6ddf2c1eb570f920c4de4.1336603412.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.7.6
In-Reply-To: <cover.1336603412.git.sgw@linux.intel.com>
References: <cover.1336603412.git.sgw@linux.intel.com>
In-Reply-To: <cover.1336603412.git.sgw@linux.intel.com>
References: <cover.1336603412.git.sgw@linux.intel.com>
Subject: [PATCH 1/1] eglibc: Add patch to fix /var installation location
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
X-List-Received-Date: Wed, 09 May 2012 23:00:01 -0000

This address the packaging issues since it's installed in the wrong place
ERROR: For recipe eglibc-nativesdk, the following files/directories were installed but not shipped in any package:
ERROR:   /var
ERROR:   /var/db
ERROR:   /var/db/Makefile

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 ....patch => use-localstatedir-for-vardbdir.patch} |    6 ++++--
 meta/recipes-core/eglibc/eglibc_2.15.bb            |    4 ++--
 2 files changed, 6 insertions(+), 4 deletions(-)
 rename meta/recipes-core/eglibc/eglibc-2.15/{add-prefix-to-var.patch => use-localstatedir-for-vardbdir.patch} (74%)

diff --git a/meta/recipes-core/eglibc/eglibc-2.15/add-prefix-to-var.patch b/meta/recipes-core/eglibc/eglibc-2.15/use-localstatedir-for-vardbdir.patch
similarity index 74%
rename from meta/recipes-core/eglibc/eglibc-2.15/add-prefix-to-var.patch
rename to meta/recipes-core/eglibc/eglibc-2.15/use-localstatedir-for-vardbdir.patch
index 4c83aa2..8392c18 100644
--- a/meta/recipes-core/eglibc/eglibc-2.15/add-prefix-to-var.patch
+++ b/meta/recipes-core/eglibc/eglibc-2.15/use-localstatedir-for-vardbdir.patch
@@ -1,9 +1,11 @@
 
+localstatedir is set to be the /var directory, so use
+it for the base of the vardbdir so it's properly relocatable.
+
 Upstream-Status: Pending
 
 Signed-off-by: Saul Wold <sgw@linux.intel.com>
 
-
 Index: libc/Makeconfig
 ===================================================================
 --- libc.orig/Makeconfig
@@ -13,7 +15,7 @@ Index: libc/Makeconfig
  # Directory for the database files and Makefile for nss_db.
  ifndef vardbdir
 -vardbdir = /var/db
-+vardbdir = $(prefix)/var/db
++vardbdir = $(localstatedir)/db
  endif
  inst_vardbdir = $(install_root)$(vardbdir)
  
diff --git a/meta/recipes-core/eglibc/eglibc_2.15.bb b/meta/recipes-core/eglibc/eglibc_2.15.bb
index e61816d..65ce9d3 100644
--- a/meta/recipes-core/eglibc/eglibc_2.15.bb
+++ b/meta/recipes-core/eglibc/eglibc_2.15.bb
@@ -3,7 +3,7 @@ require eglibc.inc
 SRCREV = "17386"
 
 DEPENDS += "gperf-native"
-PR = "r8"
+PR = "r9"
 PR_append = "+svnr${SRCPV}"
 
 EGLIBC_BRANCH="eglibc-2_15"
@@ -23,7 +23,7 @@ SRC_URI = "svn://www.eglibc.org/svn/branches/;module=${EGLIBC_BRANCH};proto=http
            file://ppc-sqrt_finite.patch \
            file://GLRO_dl_debug_mask.patch \
            file://initgroups_keys.patch \
-           file://add-prefix-to-var.patch \
+           file://use-localstatedir-for-vardbdir.patch \
           "
 LIC_FILES_CHKSUM = "file://LICENSES;md5=98a1128c4b58120182cbea3b1752d8b9 \
       file://COPYING;md5=393a5ca445f6965873eca0259a17f833 \
-- 
1.7.7.6



