Return-Path: <Guojian.Zhou@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id BD2B67731E
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Feb 2016 11:47:45 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u1NBliwi000760
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Feb 2016 03:47:45 -0800
Received: from pek-lpgtest4.wrs.com (128.224.153.84) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.248.2; Tue, 23 Feb 2016 03:47:44 -0800
From: <guojian.zhou@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 23 Feb 2016 19:47:41 +0800
Message-ID: <1456228061-17206-2-git-send-email-guojian.zhou@windriver.com>
X-Mailer: git-send-email 1.7.12.4
In-Reply-To: <1456228061-17206-1-git-send-email-guojian.zhou@windriver.com>
References: <1456228061-17206-1-git-send-email-guojian.zhou@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 2/2] oe-core: Update alternatives of info pages
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
X-List-Received-Date: Tue, 23 Feb 2016 11:47:46 -0000
Content-Type: text/plain

From: Guojian Zhou <guojian.zhou@windriver.com>

Update alternatives of info pages in several packages.

Signed-off-by: Guojian Zhou <guojian.zhou@windriver.com>
---
 meta/recipes-devtools/autoconf/autoconf.inc | 6 +++++-
 meta/recipes-devtools/binutils/binutils.inc | 7 +++++++
 meta/recipes-devtools/gdb/gdb.inc           | 8 ++++++++
 3 files changed, 20 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/autoconf/autoconf.inc b/meta/recipes-devtools/autoconf/autoconf.inc
index b4e3356..31c8223 100644
--- a/meta/recipes-devtools/autoconf/autoconf.inc
+++ b/meta/recipes-devtools/autoconf/autoconf.inc
@@ -31,10 +31,14 @@ RDEPENDS_${PN}_class-native = "m4-native gnu-config-native"
 SRC_URI = "${GNU_MIRROR}/autoconf/autoconf-${PV}.tar.gz \
 	   file://program_prefix.patch"
 
-inherit autotools texinfo
+inherit autotools texinfo update-alternatives
 
 CACHED_CONFIGUREVARS += "ac_cv_path_PERL=${USRBINPATH}/perl"
 
+ALTERNATIVE_PRIORITY_${PN}-doc = "300"
+ALTERNATIVE_${PN}-doc = "standards.info"
+ALTERNATIVE_LINK_NAME[standards.info] = "${infodir}/standards.info"
+
 do_configure() {
 	oe_runconf
 }
diff --git a/meta/recipes-devtools/binutils/binutils.inc b/meta/recipes-devtools/binutils/binutils.inc
index 43e2aa2..7dbe478 100644
--- a/meta/recipes-devtools/binutils/binutils.inc
+++ b/meta/recipes-devtools/binutils/binutils.inc
@@ -160,3 +160,10 @@ inherit update-alternatives
 ALTERNATIVE_PRIORITY = "100"
 
 ALTERNATIVE_${PN}_class-target = "${USE_ALTERNATIVES_FOR}"
+
+ALTERNATIVE_PRIORITY_${PN}-doc = "100"
+ALTERNATIVE_${PN}-doc = "bfd.info configure.info standards.info"
+
+ALTERNATIVE_LINK_NAME[bfd.info] = "${infodir}/bfd.info"
+ALTERNATIVE_LINK_NAME[configure.info] = "${infodir}/configure.info"
+ALTERNATIVE_LINK_NAME[standards.info] = "${infodir}/standards.info"
diff --git a/meta/recipes-devtools/gdb/gdb.inc b/meta/recipes-devtools/gdb/gdb.inc
index 1dd6551..6016530 100644
--- a/meta/recipes-devtools/gdb/gdb.inc
+++ b/meta/recipes-devtools/gdb/gdb.inc
@@ -14,3 +14,11 @@ SRC_URI += "file://0002-Change-order-of-CFLAGS.patch \
 # cross-canadian must not see this
 PACKAGES =+ "gdbserver"
 FILES_gdbserver = "${bindir}/gdbserver"
+
+inherit update-alternatives
+ALTERNATIVE_PRIORITY_${PN}-doc = "200"
+ALTERNATIVE_${PN}-doc = "bfd.info configure.info standards.info"
+
+ALTERNATIVE_LINK_NAME[bfd.info] = "${infodir}/bfd.info"
+ALTERNATIVE_LINK_NAME[configure.info] = "${infodir}/configure.info"
+ALTERNATIVE_LINK_NAME[standards.info] = "${infodir}/standards.info"
-- 
1.7.12.4


