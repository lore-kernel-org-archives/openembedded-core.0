Return-Path: <maxin.john@intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id A2065731D4
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Jul 2016 14:06:29 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga103.fm.intel.com with ESMTP; 28 Jul 2016 07:05:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.28,434,1464678000"; d="scan'208";a="740972441"
Received: from linux.intel.com ([10.54.29.200])
	by FMSMGA003.fm.intel.com with ESMTP; 28 Jul 2016 07:05:41 -0700
Received: from mbabyjoh-desk.fi.intel.com (mbabyjoh-desk.fi.intel.com
	[10.237.72.71])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by linux.intel.com (Postfix) with ESMTP id 9DED46A4006;
	Thu, 28 Jul 2016 07:05:29 -0700 (PDT)
From: "Maxin B. John" <maxin.john@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 28 Jul 2016 17:04:40 +0300
Message-Id: <1469714682-31488-11-git-send-email-maxin.john@intel.com>
X-Mailer: git-send-email 2.4.0
In-Reply-To: <1469714682-31488-1-git-send-email-maxin.john@intel.com>
References: <1469714682-31488-1-git-send-email-maxin.john@intel.com>
Subject: [krogoth][PATCH 10/12] dpkg: use snapshot.debian.org for SRC_URI
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
X-List-Received-Date: Thu, 28 Jul 2016 14:06:31 -0000

From: Tim Orling <timothy.t.orling@linux.intel.com>

From Ross Burton (commit 1d39e4c145925e4517dc7fbb6f83767e883bb3c6)

Using ${DEBIAN_MIRROR} for SRC_URI doesn't work very well as that will
only contain releases that are currently in Debian, so currently doesn't
contain 1.18.4 as unstable has moved on to 1.18.9.

So, move all of SRC_URI to the .bb so it can use snapshot.debian.org instead,
and set UPSTREAM_CHECK_URI to ${DEBIAN_MIRROR} so upstream release checking
continues to work.

[YOCTO #10005]

Signed-off-by: Tim Orling <timothy.t.orling@linux.intel.com>
Signed-off-by: Maxin B. John <maxin.john@intel.com>
---
 meta/recipes-devtools/dpkg/dpkg.inc       | 4 ++--
 meta/recipes-devtools/dpkg/dpkg_1.18.4.bb | 5 +++--
 2 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-devtools/dpkg/dpkg.inc b/meta/recipes-devtools/dpkg/dpkg.inc
index 3d9e7e3..440a500 100644
--- a/meta/recipes-devtools/dpkg/dpkg.inc
+++ b/meta/recipes-devtools/dpkg/dpkg.inc
@@ -2,8 +2,6 @@ SUMMARY = "Package maintenance system from Debian"
 LICENSE = "GPLv2.0+"
 SECTION = "base"
 
-SRC_URI = "${DEBIAN_MIRROR}/main/d/dpkg/dpkg_${PV}.tar.xz"
-
 SRC_URI_append_class-native = " file://0001-When-running-do_package_write_deb-we-have-trees-of-h.patch"
 
 DEPENDS = "zlib bzip2 perl ncurses"
@@ -11,6 +9,8 @@ DEPENDS_class-native = "bzip2-replacement-native zlib-native virtual/update-alte
 RDEPENDS_${PN} = "${VIRTUAL-RUNTIME_update-alternatives} xz run-postinsts perl"
 RDEPENDS_${PN}_class-native = "xz-native"
 
+UPSTREAM_CHECK_URI = "${DEBIAN_MIRROR}/main/d/dpkg/"
+
 inherit autotools gettext perlnative pkgconfig systemd
 
 python () {
diff --git a/meta/recipes-devtools/dpkg/dpkg_1.18.4.bb b/meta/recipes-devtools/dpkg/dpkg_1.18.4.bb
index 7876944..5eb42de 100644
--- a/meta/recipes-devtools/dpkg/dpkg_1.18.4.bb
+++ b/meta/recipes-devtools/dpkg/dpkg_1.18.4.bb
@@ -1,8 +1,8 @@
 require dpkg.inc
 LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
 
-SRC_URI_append_class-native =" file://glibc2.5-sync_file_range.patch "
-SRC_URI += "file://noman.patch \
+SRC_URI += "http://snapshot.debian.org/archive/debian/20160509T100042Z/pool/main/d/${BPN}/${BPN}_${PV}.tar.xz \
+            file://noman.patch \
             file://remove-tar-no-timestamp.patch \
             file://fix-abs-redefine.patch \
             file://arch_pm.patch \
@@ -14,6 +14,7 @@ SRC_URI += "file://noman.patch \
 	    file://0005-dpkg-compiler.m4-remove-Wvla.patch \
 	    file://0006-add-musleabi-to-known-target-tripets.patch \
            "
+SRC_URI_append_class-native =" file://glibc2.5-sync_file_range.patch "
 
 SRC_URI[md5sum] = "e95b513c89693f6ec3ab53b6b1c3defd"
 SRC_URI[sha256sum] = "fe89243868888ce715bf45861f26264f767d4e4dbd0d6f1a26ce60bbbbf106da"
-- 
2.4.0


