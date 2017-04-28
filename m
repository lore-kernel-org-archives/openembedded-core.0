Return-Path: <obi@opendreambox.org>
Received: from mail.saftware.de (mail.saftware.de [83.141.3.46])
	by mail.openembedded.org (Postfix) with ESMTP id 687A371C70
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Apr 2017 18:31:32 +0000 (UTC)
Received: by p910.zcs.saftware.de (Postfix, from userid 1000)
	id F3958AD01850; Fri, 28 Apr 2017 20:31:29 +0200 (CEST)
From: Andreas Oberritter <obi@opendreambox.org>
To: openembedded-core@lists.openembedded.org
Date: Fri, 28 Apr 2017 20:31:29 +0200
Message-Id: <1493404289-17342-1-git-send-email-obi@opendreambox.org>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH] busybox: make bash a valid login shell if enabled
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
X-List-Received-Date: Fri, 28 Apr 2017 18:31:37 -0000

Add bash to /etc/shells if busybox is built with bash applet anabled
to fix login via dropbear.

Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
---
 meta/recipes-core/busybox/busybox.inc | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/meta/recipes-core/busybox/busybox.inc b/meta/recipes-core/busybox/busybox.inc
index 375632d..adc6e9a 100644
--- a/meta/recipes-core/busybox/busybox.inc
+++ b/meta/recipes-core/busybox/busybox.inc
@@ -398,6 +398,9 @@ pkg_postinst_${PN} () {
 			fi
 		done
 	fi
+	if grep -q "^${base_bindir}/bash$" $D${sysconfdir}/busybox.links*; then
+		grep -q "^${base_bindir}/bash$" $D${sysconfdir}/shells || echo ${base_bindir}/bash >> $D${sysconfdir}/shells
+	fi
 }
 
 pkg_prerm_${PN} () {
@@ -422,6 +425,12 @@ pkg_prerm_${PN} () {
 	export PATH=$PATH:$tmpdir
 }
 
+pkg_postrm_${PN} () {
+	if grep -q "^${base_bindir}/bash$" $D${sysconfdir}/busybox.links* && [ ! -e $D${base_bindir}/bash ]; then
+		printf "$(grep -v "^${base_bindir}/bash$" $D${sysconfdir}/shells)\n" > $D${sysconfdir}/shells
+	fi
+}
+
 pkg_prerm_${PN}-syslog () {
 	# remove syslog
 	if test "x$D" = "x"; then
-- 
2.7.4


