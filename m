Return-Path: <adrian.ratiu@ni.com>
Received: from ni.com (skprod3.natinst.com [130.164.80.24])
	by mail.openembedded.org (Postfix) with ESMTP id ECA3176420
	for <openembedded-core@lists.openembedded.org>;
	Wed,  2 Mar 2016 14:48:09 +0000 (UTC)
Received: from us-aus-mgwout1.amer.corp.natinst.com (nb-snip2-1338.natinst.com
	[130.164.19.135])
	by us-aus-skprod3.natinst.com (8.15.0.59/8.15.0.59) with ESMTP id
	u22Em9mk004322; Wed, 2 Mar 2016 08:48:09 -0600
Received: from adi-pc-linux.emea.corp.natinst.com ([130.164.14.198])
	by us-aus-mgwout1.amer.corp.natinst.com (Lotus Domino Release 8.5.3FP6
	HF1218) with ESMTP id 2016030208480988-926338 ;
	Wed, 2 Mar 2016 08:48:09 -0600 
From: Ioan-Adrian Ratiu <adrian.ratiu@ni.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 2 Mar 2016 16:47:34 +0200
Message-Id: <6152155bf87d3eacf9097f167f15c0627029d6f9.1456929539.git.adrian.ratiu@ni.com>
X-Mailer: git-send-email 2.7.1
In-Reply-To: <cover.1456929539.git.adrian.ratiu@ni.com>
References: <cover.1456929539.git.adrian.ratiu@ni.com>
X-MIMETrack: Itemize by SMTP Server on US-AUS-MGWOut1/AUS/H/NIC(Release
	8.5.3FP6 HF1218|December 12, 2014) at 03/02/2016 08:48:10 AM,
	Serialize by Router on US-AUS-MGWOut1/AUS/H/NIC(Release 8.5.3FP6
	HF1218|December 12, 2014) at 03/02/2016 08:48:10 AM,
	Serialize complete at 03/02/2016 08:48:10 AM
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
	definitions=2016-03-02_05:, , signatures=0
Subject: [PATCH v7 4/5] signing-keys: create ipk package
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
X-List-Received-Date: Wed, 02 Mar 2016 14:48:10 -0000

Store the ascii armored pubkey generated using gpg_sign.export_pubkey()
in its own package.

Signed-off-by: Ioan-Adrian Ratiu <adrian.ratiu@ni.com>
---
 meta/recipes-core/meta/signing-keys.bb | 15 ++++++++++++++-
 1 file changed, 14 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-core/meta/signing-keys.bb b/meta/recipes-core/meta/signing-keys.bb
index 1d0e834..e843301 100644
--- a/meta/recipes-core/meta/signing-keys.bb
+++ b/meta/recipes-core/meta/signing-keys.bb
@@ -12,9 +12,10 @@ inherit allarch deploy
 EXCLUDE_FROM_WORLD = "1"
 INHIBIT_DEFAULT_DEPS = "1"
 
-PACKAGES =+ "${PN}-rpm ${PN}-packagefeed"
+PACKAGES =+ "${PN}-ipk ${PN}-rpm ${PN}-packagefeed"
 
 FILES_${PN}-rpm = "${sysconfdir}/pki/rpm-gpg"
+FILES_${PN}-ipk = "${sysconfdir}/pki/ipk-gpg"
 FILES_${PN}-packagefeed = "${sysconfdir}/pki/packagefeed-gpg"
 
 python do_get_public_keys () {
@@ -26,6 +27,12 @@ python do_get_public_keys () {
         signer.export_pubkey(os.path.join(d.expand('${B}'), 'rpm-key'),
                              d.getVar('RPM_GPG_NAME', True))
 
+    if d.getVar("IPK_SIGN_PACKAGES", True):
+        # Export public key of the ipk signing key
+        signer = get_signer(d, d.getVar('IPK_GPG_BACKEND', True))
+        signer.export_pubkey(os.path.join(d.expand('${B}'), 'ipk-key'),
+                             d.getVar('IPK_GPG_NAME', True))
+
     if d.getVar('PACKAGE_FEED_SIGN', True) == '1':
         # Export public key of the feed signing key
         signer = get_signer(d, d.getVar('PACKAGE_FEED_GPG_BACKEND', True))
@@ -39,6 +46,9 @@ do_install () {
     if [ -f "${B}/rpm-key" ]; then
         install -D -m 0644 "${B}/rpm-key" "${D}${sysconfdir}/pki/rpm-gpg/RPM-GPG-KEY-${DISTRO_VERSION}"
     fi
+    if [ -f "${B}/ipk-key" ]; then
+        install -D -m 0644 "${B}/ipk-key" "${D}${sysconfdir}/pki/ipk-gpg/IPK-GPG-KEY-${DISTRO_VERSION}"
+    fi
     if [ -f "${B}/pf-key" ]; then
         install -D -m 0644 "${B}/pf-key" "${D}${sysconfdir}/pki/packagefeed-gpg/PACKAGEFEED-GPG-KEY-${DISTRO_VERSION}"
     fi
@@ -52,6 +62,9 @@ do_deploy () {
     if [ -f "${B}/rpm-key" ]; then
         install -D -m 0644 "${B}/rpm-key" "${DEPLOYDIR}/RPM-GPG-KEY-${DISTRO_VERSION}"
     fi
+    if [ -f "${B}/ipk-key" ]; then
+        install -D -m 0644 "${B}/ipk-key" "${DEPLOYDIR}/IPK-GPG-KEY-${DISTRO_VERSION}"
+    fi
     if [ -f "${B}/pf-key" ]; then
         install -D -m 0644 "${B}/pf-key" "${DEPLOYDIR}/PACKAGEFEED-GPG-KEY-${DISTRO_VERSION}"
     fi
-- 
2.7.1


