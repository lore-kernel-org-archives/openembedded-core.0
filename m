Return-Path: <bogdan.a.marinescu@intel.com>
Received: from mga14.intel.com (mga14.intel.com [143.182.124.37])
	by mail.openembedded.org (Postfix) with ESMTP id EE7766A592
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 May 2013 13:40:20 +0000 (UTC)
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 29 May 2013 06:40:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,764,1363158000"; d="scan'208";a="309517626"
Received: from bogdanm.rb.intel.com ([10.237.105.166])
	by azsmga001.ch.intel.com with ESMTP; 29 May 2013 06:40:20 -0700
From: Bogdan Marinescu <bogdan.a.marinescu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 29 May 2013 16:40:10 +0300
Message-Id: <1369834810-18927-1-git-send-email-bogdan.a.marinescu@intel.com>
X-Mailer: git-send-email 1.7.10.4
Subject: [PATCH v3] guile: added runtime dependency on glibc-gconv-iso8859-1
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
X-List-Received-Date: Wed, 29 May 2013 13:40:21 -0000

guile needs to be able to convert strings from ISO-8859-1 in order
to work properly. This patch adds a runtime dependency to the required
convert package, but only when glibc is used. The fix for uClibc depends
on another bug (#4530).

[YOCTO #4019]

Signed-off-by: Bogdan Marinescu <bogdan.a.marinescu@intel.com>
---
 meta/recipes-devtools/guile/guile_2.0.9.bb |    5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/guile/guile_2.0.9.bb b/meta/recipes-devtools/guile/guile_2.0.9.bb
index 617f7ce..8ba7afc 100644
--- a/meta/recipes-devtools/guile/guile_2.0.9.bb
+++ b/meta/recipes-devtools/guile/guile_2.0.9.bb
@@ -27,7 +27,7 @@ SRC_URI = "${GNU_MIRROR}/guile/guile-${PV}.tar.xz \
 SRC_URI[md5sum] = "a69b575d4a633bdd9118f3a4a1e97766"
 SRC_URI[sha256sum] = "f70a38c8d9751f442679bfe61852bba8545af4d4355d037630997c2f37f2895b"
 
-PR = "r0"
+PR = "r1"
 
 inherit autotools gettext
 BBCLASSEXTEND = "native"
@@ -36,6 +36,9 @@ DEPENDS = "libunistring bdwgc gmp libtool libffi"
 # add guile-native only to the target recipe's DEPENDS
 DEPENDS += "${@['guile-native libatomics-ops', ''][d.getVar('PN', True) != 'guile']}"
 
+RDEPENDS_${PN}_append_libc-glibc_class-target = "glibc-gconv-iso8859-1"
+RDEPENDS_${PN}_class-native = ""
+
 EXTRA_OECONF += "${@['--without-libltdl-prefix --without-libgmp-prefix', ''][bb.data.inherits_class('native',d)]}"
 
 do_configure_prepend() {
-- 
1.7.10.4


