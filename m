Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1T3S6I-0007Om-3C
	for openembedded-core@lists.openembedded.org;
	Mon, 20 Aug 2012 15:33:02 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 20 Aug 2012 06:20:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.77,797,1336374000"; d="scan'208";a="136210482"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.121.92])
	by AZSMGA002.ch.intel.com with ESMTP; 20 Aug 2012 06:20:57 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 20 Aug 2012 14:20:41 +0100
Message-Id: <1345468841-12320-1-git-send-email-paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [PATCH] libiconv: skip recipe if using eglibc
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
X-List-Received-Date: Mon, 20 Aug 2012 13:33:02 -0000

libiconv is provided for use with uClibc - if you build it together with
eglibc (which already PROVIDES virtual/libiconv) you can end up with
dependency problems during do_rootfs.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/recipes-support/libiconv/libiconv_1.11.1.bb |    5 +++++
 meta/recipes-support/libiconv/libiconv_1.14.bb   |    5 +++++
 2 files changed, 10 insertions(+)

diff --git a/meta/recipes-support/libiconv/libiconv_1.11.1.bb b/meta/recipes-support/libiconv/libiconv_1.11.1.bb
index 186a5a1..055e20d 100644
--- a/meta/recipes-support/libiconv/libiconv_1.11.1.bb
+++ b/meta/recipes-support/libiconv/libiconv_1.11.1.bb
@@ -20,6 +20,11 @@ S = "${WORKDIR}/libiconv-${PV}"
 
 inherit autotools pkgconfig gettext
 
+python __anonymous() {
+    if d.getVar("TCLIBC", True) == "eglibc":
+        raise bb.parse.SkipPackage("libiconv is provided for use with uClibc only - eglibc already provides iconv")
+}
+
 EXTRA_OECONF += "--enable-shared --enable-static --enable-relocatable"
 
 LEAD_SONAME = "libiconv.so"
diff --git a/meta/recipes-support/libiconv/libiconv_1.14.bb b/meta/recipes-support/libiconv/libiconv_1.14.bb
index af33d6b..6666866 100644
--- a/meta/recipes-support/libiconv/libiconv_1.14.bb
+++ b/meta/recipes-support/libiconv/libiconv_1.14.bb
@@ -21,6 +21,11 @@ S = "${WORKDIR}/libiconv-${PV}"
 
 inherit autotools pkgconfig gettext
 
+python __anonymous() {
+    if d.getVar("TCLIBC", True) == "eglibc":
+        raise bb.parse.SkipPackage("libiconv is provided for use with uClibc only - eglibc already provides iconv")
+}
+
 EXTRA_OECONF += "--enable-shared --enable-static --enable-relocatable"
 
 LEAD_SONAME = "libiconv.so"
-- 
1.7.9.5



