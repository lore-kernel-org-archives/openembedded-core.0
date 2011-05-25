Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QP9h2-0002Mz-CZ
	for openembedded-core@lists.openembedded.org;
	Wed, 25 May 2011 10:43:53 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 25 May 2011 01:40:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,266,1304319600"; 
   d="scan'208";a="1223537"
Received: from unknown (HELO swold-MOBL.bigsur.com) ([10.255.12.133])
	by azsmga001.ch.intel.com with ESMTP; 25 May 2011 01:40:47 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 25 May 2011 01:40:24 -0700
Message-Id: <87cf2da6373676293f2fdaaebbacc6890235368d.1306312621.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <cover.1306312621.git.sgw@linux.intel.com>
References: <cover.1306312621.git.sgw@linux.intel.com>
In-Reply-To: <cover.1306312621.git.sgw@linux.intel.com>
References: <cover.1306312621.git.sgw@linux.intel.com>
Subject: [Updated Consolidated Pull 02/19] update-alternatives-dpkg: Update to dpkg base 1.15.8.7
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
X-List-Received-Date: Wed, 25 May 2011 08:43:53 -0000

[YOCTO #1062]

Due to failing fetch updated recipe and SRC_URI to use .bz2,

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 .../update-alternatives-dpkg.inc                   |   12 ++++++++++--
 .../update-alternatives-dpkg_1.13.22.bb            |    7 -------
 .../update-alternatives-dpkg_1.15.8.7.bb           |    8 ++++++++
 3 files changed, 18 insertions(+), 9 deletions(-)
 delete mode 100644 meta/recipes-devtools/update-alternatives/update-alternatives-dpkg_1.13.22.bb
 create mode 100644 meta/recipes-devtools/update-alternatives/update-alternatives-dpkg_1.15.8.7.bb

diff --git a/meta/recipes-devtools/update-alternatives/update-alternatives-dpkg.inc b/meta/recipes-devtools/update-alternatives/update-alternatives-dpkg.inc
index 9b53df8..f7f9ae9 100644
--- a/meta/recipes-devtools/update-alternatives/update-alternatives-dpkg.inc
+++ b/meta/recipes-devtools/update-alternatives/update-alternatives-dpkg.inc
@@ -5,10 +5,12 @@ programs fulfilling the same or similar functions and how they can be installed
 time."
 LICENSE = "GPL"
 SECTION = "base"
-SRC_URI = "${DEBIAN_MIRROR}/main/d/dpkg/dpkg_${PV}.tar.gz"
+SRC_URI = "${DEBIAN_MIRROR}/main/d/dpkg/dpkg_${PV}.tar.bz2"
 S = "${WORKDIR}/dpkg-${PV}"
 PACKAGE_ARCH = "all"
-PR = "r2"
+INC_PR = "r2"
+
+inherit gettext
 
 do_patch () {
     cat ${S}/scripts/update-alternatives.pl | \
@@ -32,4 +34,10 @@ do_install () {
     install -m 0755 scripts/update-alternatives ${D}${sbindir}/update-alternatives
 }
 
+PROVIDES += "virtual/update-alternatives"
+RPROVIDES_${PN} += "update-alternatives"
+EXTRA_RDEPENDS = "perl dpkg"
+EXTRA_RDEPENDS_virtclass-native = ""
+RDEPENDS_${PN} += "${EXTRA_RDEPENDS}"
+
 BBCLASSEXTEND = "native"
diff --git a/meta/recipes-devtools/update-alternatives/update-alternatives-dpkg_1.13.22.bb b/meta/recipes-devtools/update-alternatives/update-alternatives-dpkg_1.13.22.bb
deleted file mode 100644
index 5d38d5d..0000000
--- a/meta/recipes-devtools/update-alternatives/update-alternatives-dpkg_1.13.22.bb
+++ /dev/null
@@ -1,7 +0,0 @@
-require update-alternatives-dpkg.inc
-
-PROVIDES += "virtual/update-alternatives"
-RPROVIDES_${PN} += "update-alternatives"
-EXTRA_RDEPENDS = "perl dpkg"
-EXTRA_RDEPENDS_virtclass-native = ""
-RDEPENDS_${PN} += "${EXTRA_RDEPENDS}"
diff --git a/meta/recipes-devtools/update-alternatives/update-alternatives-dpkg_1.15.8.7.bb b/meta/recipes-devtools/update-alternatives/update-alternatives-dpkg_1.15.8.7.bb
new file mode 100644
index 0000000..5443122
--- /dev/null
+++ b/meta/recipes-devtools/update-alternatives/update-alternatives-dpkg_1.15.8.7.bb
@@ -0,0 +1,8 @@
+require update-alternatives-dpkg.inc
+
+PR = "${INC_PR}.0"
+
+LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
+
+SRC_URI[md5sum] = "d1731d4147c1ea3b537a4d094519a6dc"
+SRC_URI[sha256sum] = "1ec1376471b04717a4497e5d7a27cd545248c92116898ce0c53ced8ea94267b5"
-- 
1.7.3.4



