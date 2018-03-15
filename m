Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 14C236FF80
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Mar 2018 11:33:52 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	15 Mar 2018 04:33:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.48,310,1517904000"; d="scan'208";a="35229971"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by orsmga003.jf.intel.com with ESMTP; 15 Mar 2018 04:33:52 -0700
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 15 Mar 2018 13:27:06 +0200
Message-Id: <20180315112706.18183-1-alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.16.1
Subject: [PATCH] ca-certificates: run postinst script only for -target package
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
X-List-Received-Date: Thu, 15 Mar 2018 11:33:53 -0000

Nativesdk package has a special arrangement where the same thing is done
in do_install(). It was assumed (in the comment) that postinsts don't run when
installing nativesdk packages, but this was incorrect: they are run, but
any failures were previously silently ignored. Now this missing failure reporting has
been fixed, and so we get to see the failures.

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 meta/recipes-support/ca-certificates/ca-certificates_20170717.bb | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-support/ca-certificates/ca-certificates_20170717.bb b/meta/recipes-support/ca-certificates/ca-certificates_20170717.bb
index 52a1a07f68c..51af72e79a3 100644
--- a/meta/recipes-support/ca-certificates/ca-certificates_20170717.bb
+++ b/meta/recipes-support/ca-certificates/ca-certificates_20170717.bb
@@ -64,13 +64,14 @@ do_install_append_class-target () {
         ${D}${mandir}/man8/update-ca-certificates.8
 }
 
-pkg_postinst_${PN} () {
+pkg_postinst_${PN}_class-target () {
     SYSROOT="$D" $D${sbindir}/update-ca-certificates
 }
 
 CONFFILES_${PN} += "${sysconfdir}/ca-certificates.conf"
 
-# Postinsts don't seem to be run for nativesdk packages when populating SDKs.
+# Rather than make a postinst script that works for both target and nativesdk,
+# we just run update-ca-certificate from do_install() for nativesdk.
 CONFFILES_${PN}_append_class-nativesdk = " ${sysconfdir}/ssl/certs/ca-certificates.crt"
 do_install_append_class-nativesdk () {
     SYSROOT="${D}${SDKPATHNATIVE}" ${D}${sbindir}/update-ca-certificates
-- 
2.16.1


