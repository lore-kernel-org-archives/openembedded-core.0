Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QM5ct-0003R0-Jp
	for openembedded-core@lists.openembedded.org;
	Mon, 16 May 2011 23:46:55 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 16 May 2011 14:44:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,221,1304319600"; 
   d="scan'208";a="2999749"
Received: from unknown (HELO localhost) ([10.255.12.119])
	by fmsmga001.fm.intel.com with ESMTP; 16 May 2011 14:44:01 -0700
Message-Id: <b932742b903faa3d2e571870f6d705b8d55d4622.1305580484.git.sgw@linux.intel.com>
In-Reply-To: <cover.1305580484.git.sgw@linux.intel.com>
References: <cover.1305580484.git.sgw@linux.intel.com>
Old-Date: Sat, 14 May 2011 23:47:04 -0700
Date: Mon, 16 May 2011 14:44:01 -0700
To: openembedded-core@lists.openembedded.org
From: Saul Wold <sgw@linux.intel.com>
Subject: [PATCH 02/14] opkg: Bump SRCREV to 609
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
X-List-Received-Date: Mon, 16 May 2011 21:46:55 -0000

From: Khem Raj <raj.khem@gmail.com>

Disable curl gpg ssl sha
Backported from OE

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-devtools/opkg/opkg.inc    |    8 ++++++--
 meta/recipes-devtools/opkg/opkg_svn.bb |    3 ++-
 2 files changed, 8 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-devtools/opkg/opkg.inc b/meta/recipes-devtools/opkg/opkg.inc
index 50f1afc..a649213 100644
--- a/meta/recipes-devtools/opkg/opkg.inc
+++ b/meta/recipes-devtools/opkg/opkg.inc
@@ -7,7 +7,6 @@ BUGTRACKER = "http://code.google.com/p/opkg/issues/list"
 LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f \
                     file://src/opkg-cl.c;beginline=1;endline=20;md5=321f658c3f6b6c832e25c8850b5dffba"
-DEPENDS = "curl gpgme openssl"
 DEPENDS_virtclass-native = "curl-native"
 DEPENDS_virtclass-nativesdk = "curl-nativesdk"
 
@@ -21,9 +20,14 @@ do_configure_prepend() {
 }
 
 inherit autotools pkgconfig
+EXTRA_OECONF += " --disable-gpg \
+                  --disable-openssl \
+                  --disable-ssl-curl \
+                  --disable-curl \
+                  --disable-sha256"
 
 target_localstatedir := "${localstatedir}"
-EXTRA_OECONF = "--with-opkglibdir=${localstatedir}/lib"
+EXTRA_OECONF += "--with-opkglibdir=${localstatedir}/lib"
 EXTRA_OECONF_virtclass-native = "--with-opkglibdir=${target_localstatedir}/lib --disable-gpg --disable-curl --disable-openssl"
 EXTRA_OECONF_virtclass-nativesdk = "--with-opkglibdir=${target_localstatedir}/lib --disable-gpg --disable-curl --disable-openssl"
 
diff --git a/meta/recipes-devtools/opkg/opkg_svn.bb b/meta/recipes-devtools/opkg/opkg_svn.bb
index 5664a09..5964a47 100644
--- a/meta/recipes-devtools/opkg/opkg_svn.bb
+++ b/meta/recipes-devtools/opkg/opkg_svn.bb
@@ -7,6 +7,7 @@ RDEPENDS_${PN} = "${VIRTUAL-RUNTIME_update-alternatives} opkg-config-base"
 RDEPENDS_${PN}_virtclass-native = ""
 RDEPENDS_${PN}_virtclass-nativesdk = ""
 PACKAGE_ARCH_update-alternatives-cworth = "all"
+RREPLACES_${PN} = "opkg-nogpg"
 
 SRC_URI = "svn://opkg.googlecode.com/svn;module=trunk;proto=http \
            file://add_vercmp.patch \
@@ -15,7 +16,7 @@ SRC_URI = "svn://opkg.googlecode.com/svn;module=trunk;proto=http \
 
 S = "${WORKDIR}/trunk"
 
-SRCREV = "596"
+SRCREV = "609"
 PV = "0.1.8+svnr${SRCPV}"
 PR = "r2"
 
-- 
1.7.1.1



