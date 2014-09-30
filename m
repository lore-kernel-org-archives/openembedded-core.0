Return-Path: <sgw@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 9C6BF7170C
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Sep 2014 17:17:04 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 30 Sep 2014 10:17:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.04,628,1406617200"; d="scan'208";a="607677675"
Received: from gmacartn-mobl.ger.corp.intel.com (HELO
	swold-linux.amr.corp.intel.com) ([10.255.13.44])
	by fmsmga002.fm.intel.com with ESMTP; 30 Sep 2014 10:16:56 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 30 Sep 2014 10:16:51 -0700
Message-Id: <1b25798216a8d613421d16cf5cd8419e7d7d5b37.1412095567.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <cover.1412095567.git.sgw@linux.intel.com>
References: <cover.1412095567.git.sgw@linux.intel.com>
In-Reply-To: <cover.1412095567.git.sgw@linux.intel.com>
References: <cover.1412095567.git.sgw@linux.intel.com>
Subject: [PATCH 1/5] nss: nss.pc is not target specific
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
X-List-Received-Date: Tue, 30 Sep 2014 17:17:09 -0000

RPM4 requires an nss-native component

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/recipes-support/nss/nss.inc | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-support/nss/nss.inc b/meta/recipes-support/nss/nss.inc
index d706c43..716245d 100644
--- a/meta/recipes-support/nss/nss.inc
+++ b/meta/recipes-support/nss/nss.inc
@@ -24,7 +24,7 @@ SRC_URI = "\
     file://nss-CVE-2013-5606.patch \
     file://nss-CVE-2014-1544.patch \
 "
-SRC_URI_append_class-target = "\
+SRC_URI_append = "\
     file://nss.pc.in \
     file://signlibs.sh \
 "
@@ -153,7 +153,7 @@ do_install() {
     done
 }
 
-do_install_append_class-target() {
+do_install_append() {
     # Create empty .chk files for the NSS libraries at build time. They could
     # be regenerated at target's boot time.
     for file in libsoftokn3.chk libfreebl3.chk libnssdbm3.chk; do
@@ -168,7 +168,9 @@ do_install_append_class-target() {
     sed -i s:OEEXECPREFIX:${exec_prefix}:g ${D}${libdir}/pkgconfig/nss.pc
     sed -i s:OELIBDIR:${libdir}:g ${D}${libdir}/pkgconfig/nss.pc
     sed -i s:OEINCDIR:${includedir}/nss3:g ${D}${libdir}/pkgconfig/nss.pc
+}
 
+do_install_append_class-target() {
     # Create a blank certificate
     mkdir -p ${D}${sysconfdir}/pki/nssdb/
     touch ./empty_password
-- 
1.8.3.1


