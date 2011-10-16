Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1RFXEp-0003VD-38
	for openembedded-core@lists.openembedded.org;
	Sun, 16 Oct 2011 22:23:15 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 16 Oct 2011 13:17:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.69,354,1315206000"; d="scan'208";a="74375163"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.15.6])
	by fmsmga001.fm.intel.com with ESMTP; 16 Oct 2011 13:17:23 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 16 Oct 2011 13:17:15 -0700
Message-Id: <9aba4829cbc73ba417376a2248ee43c6d34c5f04.1318796061.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6.2
In-Reply-To: <cover.1318796061.git.sgw@linux.intel.com>
References: <cover.1318796061.git.sgw@linux.intel.com>
In-Reply-To: <cover.1318796061.git.sgw@linux.intel.com>
References: <cover.1318796061.git.sgw@linux.intel.com>
Subject: [v2 -CONSOLIDATED PULL 13/14] mktemp: Add patch to fix parallel make install
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
X-List-Received-Date: Sun, 16 Oct 2011 20:23:15 -0000

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 .../mktemp/files/fix-parallel-make.patch           |   23 ++++++++++++++++++++
 meta/recipes-extended/mktemp/mktemp_1.7.bb         |    3 +-
 2 files changed, 25 insertions(+), 1 deletions(-)
 create mode 100644 meta/recipes-extended/mktemp/files/fix-parallel-make.patch

diff --git a/meta/recipes-extended/mktemp/files/fix-parallel-make.patch b/meta/recipes-extended/mktemp/files/fix-parallel-make.patch
new file mode 100644
index 0000000..8c693cc
--- /dev/null
+++ b/meta/recipes-extended/mktemp/files/fix-parallel-make.patch
@@ -0,0 +1,23 @@
+This fixes the parallel make install failure
+
+Upstream-Status: Pending
+
+Signed-off-by: Saul Wold <sgw@linux.intel.com>
+
+Index: mktemp-1.7/Makefile.in
+===================================================================
+--- mktemp-1.7.orig/Makefile.in
++++ mktemp-1.7/Makefile.in
+@@ -94,10 +94,10 @@ install-dirs:
+ 	$(SHELL) $(srcdir)/mkinstalldirs $(DESTDIR)$(bindir) \
+ 	    $(DESTDIR)$(mandir)/man1
+ 
+-install-binaries: $(PROG)
++install-binaries: install-dirs $(PROG)
+ 	$(INSTALL) -m 0555 $(PROG) $(DESTDIR)$(bindir)/$(PROG)
+ 
+-install-man:
++install-man: install-dirs
+ 	$(INSTALL) -m 0444 $(srcdir)/mktemp.$(mantype) \
+ 	    $(DESTDIR)$(mandir)/man1/mktemp.1
+ 
diff --git a/meta/recipes-extended/mktemp/mktemp_1.7.bb b/meta/recipes-extended/mktemp/mktemp_1.7.bb
index d0479ce..65f542e 100644
--- a/meta/recipes-extended/mktemp/mktemp_1.7.bb
+++ b/meta/recipes-extended/mktemp/mktemp_1.7.bb
@@ -5,10 +5,11 @@ SECTION = "console/utils"
 LICENSE = "ISC"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=430680f6322a1eb87199b5e01a82c0d4"
 
-PR = "r0"
+PR = "r1"
 
 SRC_URI = "ftp://ftp.mktemp.org/pub/mktemp/${BPN}-${PV}.tar.gz \
         file://disable-strip.patch \
+        file://fix-parallel-make.patch \
         "
 
 SRC_URI[md5sum] = "787bbed9fa2ee8e7645733c0e8e65172"
-- 
1.7.6.2



