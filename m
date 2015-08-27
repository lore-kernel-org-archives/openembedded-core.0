Return-Path: <jussi.kukkonen@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 21B8B76ACD
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Aug 2015 13:04:33 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga102.fm.intel.com with ESMTP; 27 Aug 2015 06:04:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.17,422,1437462000"; d="scan'208";a="756484357"
Received: from theory.fi.intel.com ([10.237.72.51])
	by orsmga001.jf.intel.com with ESMTP; 27 Aug 2015 06:04:16 -0700
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 27 Aug 2015 16:06:00 +0300
Message-Id: <2e264abcfc26634f2f9b6768d75091e2156507f2.1440680489.git.jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <ac5380e48da5a3385086887d8a7bd5cf5478112b.1440680489.git.jussi.kukkonen@intel.com>
References: <ac5380e48da5a3385086887d8a7bd5cf5478112b.1440680489.git.jussi.kukkonen@intel.com>
In-Reply-To: <cover.1440680489.git.jussi.kukkonen@intel.com>
References: <cover.1440680489.git.jussi.kukkonen@intel.com>
Subject: [PATCH 3/6] nettle: Add (LGPLv3) version 3.1.1
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
X-List-Received-Date: Thu, 27 Aug 2015 13:04:33 -0000

Newer nettle versions are "LGPLv3+ | GPLv2+". Add 3.1.1 but also
keep version 2.7.1 since it's LGPLv2.1+

Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
---
 meta/recipes-support/nettle/nettle.inc      | 26 ++++++++++++++++++++++++++
 meta/recipes-support/nettle/nettle_2.7.1.bb | 20 ++------------------
 meta/recipes-support/nettle/nettle_3.1.1.bb | 11 +++++++++++
 3 files changed, 39 insertions(+), 18 deletions(-)
 create mode 100644 meta/recipes-support/nettle/nettle.inc
 create mode 100644 meta/recipes-support/nettle/nettle_3.1.1.bb

diff --git a/meta/recipes-support/nettle/nettle.inc b/meta/recipes-support/nettle/nettle.inc
new file mode 100644
index 0000000..0579b6c
--- /dev/null
+++ b/meta/recipes-support/nettle/nettle.inc
@@ -0,0 +1,26 @@
+SUMMARY = "A low level cryptographic library"
+HOMEPAGE = "http://www.lysator.liu.se/~nisse/nettle/"
+SECTION = "libs"
+
+LIC_FILES_CHKSUM = "file://COPYING.LIB;md5=2d5025d4aa3495befef8f17206a5b0a1 \
+                    file://serpent-decrypt.c;beginline=53;endline=67;md5=bcfd4745d53ca57f82907089898e390d \
+                    file://serpent-set-key.c;beginline=56;endline=70;md5=bcfd4745d53ca57f82907089898e390d"
+
+DEPENDS += "gmp"
+
+SRC_URI = "http://www.lysator.liu.se/~nisse/archive/${BP}.tar.gz"
+
+SRC_URI[md5sum] = "003d5147911317931dd453520eb234a5"
+SRC_URI[sha256sum] = "bc71ebd43435537d767799e414fce88e521b7278d48c860651216e1fc6555b40"
+
+EXTRA_OECONF = "--disable-openssl"
+
+do_configure_prepend() {
+       if [ ! -e ${S}/acinclude.m4 -a -e ${S}/aclocal.m4 ]; then
+               cp ${S}/aclocal.m4 ${S}/acinclude.m4
+       fi
+}
+
+inherit autotools
+
+BBCLASSEXTEND = "native nativesdk"
diff --git a/meta/recipes-support/nettle/nettle_2.7.1.bb b/meta/recipes-support/nettle/nettle_2.7.1.bb
index 7823df9..ae2574a 100644
--- a/meta/recipes-support/nettle/nettle_2.7.1.bb
+++ b/meta/recipes-support/nettle/nettle_2.7.1.bb
@@ -1,6 +1,5 @@
-SUMMARY = "A low level cryptographic library"
-HOMEPAGE = "http://www.lysator.liu.se/~nisse/nettle/"
-SECTION = "libs"
+require nettle.inc
+
 LICENSE = "LGPLv2.1 & GPLv2"
 LICENSE_${PN} = "LGPLv2.1+"
 
@@ -8,21 +7,6 @@ LIC_FILES_CHKSUM = "file://COPYING.LIB;md5=2d5025d4aa3495befef8f17206a5b0a1 \
                     file://serpent-decrypt.c;beginline=53;endline=67;md5=bcfd4745d53ca57f82907089898e390d \
                     file://serpent-set-key.c;beginline=56;endline=70;md5=bcfd4745d53ca57f82907089898e390d"
 
-DEPENDS += "gmp"
-
-SRC_URI = "http://www.lysator.liu.se/~nisse/archive/${BP}.tar.gz"
-
 SRC_URI[md5sum] = "003d5147911317931dd453520eb234a5"
 SRC_URI[sha256sum] = "bc71ebd43435537d767799e414fce88e521b7278d48c860651216e1fc6555b40"
 
-EXTRA_OECONF = "--disable-openssl"
-
-do_configure_prepend() {
-       if [ ! -e ${S}/acinclude.m4 -a -e ${S}/aclocal.m4 ]; then
-               cp ${S}/aclocal.m4 ${S}/acinclude.m4
-       fi
-}
-
-inherit autotools
-
-BBCLASSEXTEND = "native nativesdk"
diff --git a/meta/recipes-support/nettle/nettle_3.1.1.bb b/meta/recipes-support/nettle/nettle_3.1.1.bb
new file mode 100644
index 0000000..7d7134f
--- /dev/null
+++ b/meta/recipes-support/nettle/nettle_3.1.1.bb
@@ -0,0 +1,11 @@
+require nettle.inc
+
+LICENSE = "LGPLv3+ | GPLv2+"
+
+LIC_FILES_CHKSUM = "file://COPYING.LESSERv3;md5=6a6a8e020838b23406c81b19c1d46df6 \
+                    file://COPYINGv2;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
+                    file://serpent-decrypt.c;beginline=14;endline=36;md5=ca0d220bc413e1842ecc507690ce416e \
+                    file://serpent-set-key.c;beginline=14;endline=36;md5=ca0d220bc413e1842ecc507690ce416e"
+
+SRC_URI[md5sum] = "b40fa88dc32f37a182b6b42092ebb144"
+SRC_URI[sha256sum] = "5fd4d25d64d8ddcb85d0d897572af73b05b4d163c6cc49438a5bfbb8ff293d4c"
-- 
2.1.4


