Return-Path: <pb@pbcl.net>
Received: from hetzner.pbcl.net (mail.pbcl.net [88.198.119.4])
	by mail.openembedded.org (Postfix) with ESMTP id 164146148D
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 May 2013 10:40:07 +0000 (UTC)
Received: from cpc6-cmbg17-2-0-cust487.5-4.cable.virginmedia.com
	([86.30.57.232] helo=[172.30.1.45])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <pb@pbcl.net>) id 1UejzC-0006Wv-RC
	for openembedded-core@lists.openembedded.org;
	Tue, 21 May 2013 12:40:06 +0200
Message-ID: <1369132806.6695.12.camel@phil-desktop.brightsign>
From: Phil Blundell <pb@pbcl.net>
To: openembedded-core@lists.openembedded.org
Date: Tue, 21 May 2013 11:40:06 +0100
X-Mailer: Evolution 3.4.4-1 
Mime-Version: 1.0
Subject: [PATCH] cross: Clear do_populate_sysroot[stamp-extra-info] so that stamps are not MACHINE specific
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
X-List-Received-Date: Tue, 21 May 2013 10:40:07 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Otherwise we will try to run the setscene task once per MACHINE which will lead to
file conflicts in the sysroot for packages like gcc-cross.  The stamps
are already namespaced by TARGET_ARCH which should be sufficient.

Signed-off-by: Phil Blundell <philb@gnu.org>
---
 meta/classes/cross.bbclass |    1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/classes/cross.bbclass b/meta/classes/cross.bbclass
index b57e523..eaba4d1 100644
--- a/meta/classes/cross.bbclass
+++ b/meta/classes/cross.bbclass
@@ -55,6 +55,7 @@ libdir = "${exec_prefix}/lib/${CROSS_TARGET_SYS_DIR}"
 libexecdir = "${exec_prefix}/libexec/${CROSS_TARGET_SYS_DIR}"
 
 do_populate_sysroot[sstate-inputdirs] = "${SYSROOT_DESTDIR}/${STAGING_DIR_NATIVE}/"
+do_populate_sysroot[stamp-extra-info] = ""
 
 python cross_virtclass_handler () {
     if not isinstance(e, bb.event.RecipePreFinalise):
-- 
1.7.10.4




