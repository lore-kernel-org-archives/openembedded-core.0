Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1T8U8J-0004wr-AS
	for openembedded-core@lists.openembedded.org;
	Mon, 03 Sep 2012 12:43:55 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 03 Sep 2012 03:31:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,359,1344236400"; d="scan'208";a="217497251"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.121.155])
	by fmsmga001.fm.intel.com with ESMTP; 03 Sep 2012 03:31:27 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  3 Sep 2012 11:30:46 +0100
Message-Id: <9028424710e5412aa26a58d27aeab5f41b8abcf7.1346668109.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1346668109.git.paul.eggleton@linux.intel.com>
References: <cover.1346668109.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1346668109.git.paul.eggleton@linux.intel.com>
References: <cover.1346668109.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 26/28] packagegroup-core-lsb: rework
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
X-List-Received-Date: Mon, 03 Sep 2012 10:43:57 -0000

Create package groups covering the Core, Desktop, Runtime Languages
sections of the LSB specification 4.1. Most of the packages were just
moved around or copied in from packagegroup-core-basic (which is
currently included in LSB images anyway) with the eventual aim of
having the LSB package groups be completely independent as well as
following the specification as closely as possible.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 .../packagegroups/packagegroup-core-lsb.bb         |  110 ++++++++++++++------
 1 file changed, 77 insertions(+), 33 deletions(-)

diff --git a/meta/recipes-extended/packagegroups/packagegroup-core-lsb.bb b/meta/recipes-extended/packagegroups/packagegroup-core-lsb.bb
index b8031e5..707ccc1 100644
--- a/meta/recipes-extended/packagegroups/packagegroup-core-lsb.bb
+++ b/meta/recipes-extended/packagegroups/packagegroup-core-lsb.bb
@@ -13,43 +13,39 @@ PACKAGES = "\
     packagegroup-core-lsb \
     packagegroup-core-sys-extended \
     packagegroup-core-db \
-    packagegroup-core-misc \
     packagegroup-core-perl \
     packagegroup-core-python \
     packagegroup-core-tcl \
-    packagegroup-core-lsb-perl-add \
-    packagegroup-core-lsb-python-add \
-    packagegroup-core-lsb-graphic-add \
+    packagegroup-core-lsb-misc \
+    packagegroup-core-lsb-core \
+    packagegroup-core-lsb-perl \
+    packagegroup-core-lsb-python \
+    packagegroup-core-lsb-desktop \
     packagegroup-core-lsb-runtime-add \
-    packagegroup-core-lsb-command-add \
     "
 
 
 RDEPENDS_packagegroup-core-lsb = "\
     packagegroup-core-sys-extended \
     packagegroup-core-db \
-    packagegroup-core-misc \
     packagegroup-core-perl \
     packagegroup-core-python \
     packagegroup-core-tcl \
-    packagegroup-core-lsb-perl-add \
-    packagegroup-core-lsb-python-add \
-    packagegroup-core-lsb-graphic-add \
+    packagegroup-core-lsb-misc \
+    packagegroup-core-lsb-core \
+    packagegroup-core-lsb-perl \
+    packagegroup-core-lsb-python \
+    packagegroup-core-lsb-desktop \
     packagegroup-core-lsb-runtime-add \
-    packagegroup-core-lsb-command-add \
     "
 
+
 RDEPENDS_packagegroup-core-sys-extended = "\
-    binutils \
-    binutils-symlinks \
-    chkconfig \
     curl \
     dhcp-client \
-    diffutils \
     gamin \
     hdparm \
     libaio \
-    libxml2 \
     lrzsz \
     lzo \
     mc \
@@ -67,7 +63,6 @@ RDEPENDS_packagegroup-core-sys-extended = "\
     which \
     xinetd \
     zip \
-    lsbinitscripts \
     "
 
 RDEPENDS_packagegroup-core-db = "\
@@ -97,48 +92,98 @@ RDEPENDS_packagegroup-core-tcl = "\
     tcl \
     "
 
-RDEPENDS_packagegroup-core-misc = "\
-    elfutils \
+# Miscellaneous packages required by LSB (or LSB tests)
+RDEPENDS_packagegroup-core-lsb-misc = "\
+    chkconfig \
     gettext \
     gettext-runtime \
     groff \
-    lsb \
+    lsbinitscripts \
     lsbsetup \
     lsbtest \
     lsof \
-    man \
-    man-pages \
-    ncurses \
     strace \
     libusb1 \
     usbutils \
-    zlib \
+    rpm \
     "
 
-RDEPENDS_packagegroup-core-lsb-command-add = "\
-    localedef \
+SUMMARY_packagegroup-core-lsb-core = "LSB Core"
+DESCRIPTION_packagegroup-core-lsb-core = "Packages required to support commands/libraries \
+    specified in the LSB Core specification"
+RDEPENDS_packagegroup-core-lsb-core = "\
+    at \
+    bash \
+    bc \
+    binutils \
+    binutils-symlinks \
+    coreutils \
+    cpio \
+    cronie \
+    cups \
+    diffutils \
+    ed \
+    eglibc-utils \
+    elfutils \
+    file \
+    findutils \
     fontconfig-utils \
+    foomatic-filters \
+    gawk \
+    ghostscript \
+    grep \
+    gzip \
+    localedef \
+    lsb \
+    m4 \
     mailx \
+    make \
+    man \
+    man-pages \
+    mktemp \
     msmtp \
-    chkconfig \
+    patch \
+    pax \
+    procps \
+    psmisc \
+    sed \
+    shadow \
+    tar \
+    time \
+    util-linux \
     xdg-utils \
-    foomatic-filters \
-    cups \
-    ghostscript \
+    \
+    eglibc \
+    libgcc \
+    libpam \
+    libxml2 \
+    ncurses \
+    zlib \
 "
 
-RDEPENDS_packagegroup-core-lsb-perl-add = "\
+SUMMARY_packagegroup-core-lsb-perl = "LSB Runtime Languages (Perl)"
+DESCRIPTION_packagegroup-core-lsb-perl = "Packages required to support libraries \
+    specified in the LSB Runtime languages specification (Perl parts)"
+RDEPENDS_packagegroup-core-lsb-perl = "\
+    perl \
     perl-modules \
     perl-misc \
     perl-pod \
 "
 
-RDEPENDS_packagegroup-core-lsb-python-add = "\
+SUMMARY_packagegroup-core-lsb-python = "LSB Runtime Languages (Python)"
+DESCRIPTION_packagegroup-core-lsb-python = "Packages required to support libraries \
+    specified in the LSB Runtime languages specification (Python parts)"
+RDEPENDS_packagegroup-core-lsb-python = "\
+    python \
     python-modules \
     python-misc \
 "
 
-RDEPENDS_packagegroup-core-lsb-graphic-add = "\
+SUMMARY_packagegroup-core-lsb-desktop = "LSB Desktop"
+DESCRIPTION_packagegroup-core-lsb-desktop = "Packages required to support libraries \
+    specified in the LSB Desktop specification"
+RDEPENDS_packagegroup-core-lsb-desktop = "\
     libqtcore4 \
     libqtgui4 \
     libqtsql4 \
@@ -181,7 +226,6 @@ RDEPENDS_packagegroup-core-lsb-runtime-add = "\
     eglibc-localedata-posix \
     eglibc-extra-nss \
     eglibc-pcprofile \
-    eglibc-utils \
 "
 
 PTH = "pth"
-- 
1.7.9.5



