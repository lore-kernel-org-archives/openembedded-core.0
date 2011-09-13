Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <edwin.zhai@intel.com>) id 1R3TPl-0006PZ-7Y
	for openembedded-core@lists.openembedded.org;
	Tue, 13 Sep 2011 15:52:41 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 13 Sep 2011 06:47:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.68,374,1312182000"; d="scan'208";a="50769877"
Received: from yocto-build3.sh.intel.com ([10.239.48.58])
	by fmsmga001.fm.intel.com with ESMTP; 13 Sep 2011 06:47:24 -0700
From: edwin.zhai@intel.com
To: openembedded-core@lists.openembedded.org
Date: Tue, 13 Sep 2011 21:43:31 +0800
Message-Id: <3c9ecbba125ebd7f2945ffe8d11f0ebc545e88e7.1315920902.git.edwin.zhai@intel.com>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <cover.1315920902.git.edwin.zhai@intel.com>
References: <cover.1315920902.git.edwin.zhai@intel.com>
In-Reply-To: <cover.1315920902.git.edwin.zhai@intel.com>
References: <cover.1315920902.git.edwin.zhai@intel.com>
Subject: [PATCH 1/1] opensp: Fix hard path in native nsgmls.
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
X-List-Received-Date: Tue, 13 Sep 2011 13:52:41 -0000

From: Zhai Edwin <edwin.zhai@intel.com>

This relocation issues caused following bug and introduce one partial fix bb024d:
[YOCTO #1440]

But the environment val hacking is not working all the time, as nsgmsl may
append wrong path in some case. This fix use search directory "-D" as solution.
And more important, change the iputils' way to make doc: Use the sysid in
current directory instead of parent directory, as "../" is also appended to the
search directory then lead searching failure.

Signed-off-by: Zhai Edwin <edwin.zhai@intel.com>
CC: Saul Would <sgw@linux.intel.com>
---
 meta/recipes-devtools/opensp/opensp_1.5.bb         |    4 +-
 .../iputils/files/nsgmls-path-fix.patch            |   27 ++++++++++++++++++++
 meta/recipes-extended/iputils/iputils_s20101006.bb |    1 +
 3 files changed, 30 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-extended/iputils/files/nsgmls-path-fix.patch

diff --git a/meta/recipes-devtools/opensp/opensp_1.5.bb b/meta/recipes-devtools/opensp/opensp_1.5.bb
index 0269c87..d692137 100644
--- a/meta/recipes-devtools/opensp/opensp_1.5.bb
+++ b/meta/recipes-devtools/opensp/opensp_1.5.bb
@@ -44,8 +44,8 @@ do_install_append() {
 
 do_install_append_virtclass-native() {
 	for util in nsgmls sgmlnorm spam spcat spent sx; do
-		create_wrapper ${D}/${bindir}/$util \
-		    SGML_CATALOG_FILES=${sysconfdir}/sgml/catalog 
+		create_cmdline_wrapper ${D}/${bindir}/$util \
+		    -D ${sysconfdir}/sgml
 	done
 }
 
diff --git a/meta/recipes-extended/iputils/files/nsgmls-path-fix.patch b/meta/recipes-extended/iputils/files/nsgmls-path-fix.patch
new file mode 100644
index 0000000..92bf946
--- /dev/null
+++ b/meta/recipes-extended/iputils/files/nsgmls-path-fix.patch
@@ -0,0 +1,27 @@
+Fix nsgmls path issue
+
+Upstream-Status: Pending
+
+Signed-off-by: Zhai Edwin <edwin.zhai@intel.com>
+
+Index: iputils-s20101006/doc/Makefile
+===================================================================
+--- iputils-s20101006.orig/doc/Makefile	2011-09-13 20:42:27.000000000 +0800
++++ iputils-s20101006/doc/Makefile	2011-09-13 21:01:52.000000000 +0800
+@@ -27,10 +27,15 @@
+ # docbook2man produces utterly ugly output and I did not find
+ # any way to customize this but hacking backend perl script a little.
+ # Well, hence...
++# nsgmls seems append path to search directory according to the sysid path.
++# e.g. if input ../index.db, it would search $search_directory/../ rather than
++# $search_directory, which leads searching failure. Fixing nsgmls probably
++# introduce some side effects, so use this ugly hack: running nsgmls in current
++# directory, and running docbook2man in tmp directory.
+ 
+ $(MANFILES): index.db
+ 	@-mkdir tmp.db2man
+-	@set -e; cd tmp.db2man; nsgmls ../$< | sgmlspl ../docbook2man-spec.pl ;	mv $@ ..
++	@set -e; nsgmls $< >tmp.db2man/output; cd tmp.db2man; cat output | sgmlspl ../docbook2man-spec.pl ;	mv $@ ..
+ 	@-rm -rf tmp.db2man
+ 
+ clean:
diff --git a/meta/recipes-extended/iputils/iputils_s20101006.bb b/meta/recipes-extended/iputils/iputils_s20101006.bb
index c97fce7..5216c10 100644
--- a/meta/recipes-extended/iputils/iputils_s20101006.bb
+++ b/meta/recipes-extended/iputils/iputils_s20101006.bb
@@ -21,6 +21,7 @@ SRC_URI = "http://www.skbuff.net/iputils/${BPN}-${PV}.tar.bz2 \
            file://debian/use_gethostbyname2.diff \
            file://debian/targets.diff \
            file://debian/fix-arping-timeouts.diff \
+           file://nsgmls-path-fix.patch \
           "
 
 SRC_URI[md5sum] = "a36c25e9ec17e48be514dc0485e7376c"
-- 
1.7.1



