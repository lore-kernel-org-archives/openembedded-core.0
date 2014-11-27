Return-Path: <michael.jones@matrix-vision.de>
Received: from mail2.matrix-vision.com (mail2.matrix-vision.com
	[81.169.236.229])
	by mail.openembedded.org (Postfix) with ESMTP id CBEF87236B
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Nov 2014 16:33:16 +0000 (UTC)
Received: from polydeuces (g1-2.matrix-vision.com [80.152.153.235])
	(using TLSv1.1 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mail2.matrix-vision.com (Postfix) with ESMTPSA id 13C4446589
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Nov 2014 17:24:10 +0100 (CET)
Received: from drogo (drogo.intern.matrix-vision.de [192.168.10.20])
	by polydeuces (Postfix) with ESMTP id CD43732153
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Nov 2014 17:24:09 +0100 (CET)
Received: from polydeuces (polydeuces.intern.matrix-vision.de [192.168.5.51])
	by thyone.g1.matrix-vision.de (AvMailGate-3.2.1.26) id 1503-5et8Sy; 
	Thu, 27 Nov 2014 16:24:09 -0000
Received: by polydeuces (Postfix, from userid 108)
	id 5AFC43215D; Thu, 27 Nov 2014 17:24:09 +0100 (CET)
Received: from michael-HP.intern.matrix-vision.de
	(host65-101.intern.matrix-vision.de [192.168.65.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
	(No client certificate requested)
	by polydeuces (Postfix) with ESMTPSA id 4C54732153;
	Thu, 27 Nov 2014 17:24:09 +0100 (CET)
From: Michael Jones <michael.jones@matrix-vision.de>
To: openembedded-core@lists.openembedded.org
Date: Thu, 27 Nov 2014 17:21:54 +0100
Message-Id: <1417105314-29318-3-git-send-email-michael.jones@matrix-vision.de>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1417105314-29318-1-git-send-email-michael.jones@matrix-vision.de>
References: <1417105314-29318-1-git-send-email-michael.jones@matrix-vision.de>
X-MV-Disclaimer: true (polydeuces)
X-AntiVirus: checked by Avira MailGate (version: 3.2.1.26; AVE: 8.3.26.26;
	VDF: 7.11.189.40; host: thyone); id=1503-5et8Sy
X-AV-Checked: ClamAV using ClamSMTP (sao)
X-KLMS-Rule-ID: 1
X-KLMS-Message-Action: clean
X-KLMS-AntiSpam-Lua-Profiles: 69870 [Nov 27 2014]
X-KLMS-AntiSpam-Version: 5.5.3
X-KLMS-AntiSpam-Envelope-From: michael.jones@matrix-vision.de
X-KLMS-AntiSpam-Rate: 0
X-KLMS-AntiSpam-Status: not_detected
X-KLMS-AntiSpam-Method: none
X-KLMS-AntiSpam-Moebius-Timestamps: 3238071, 3238111, 0
X-KLMS-AntiSpam-Info: LuaCore: 88 2014-11-27_18-23-14
	e9e3345370e5acf1d8dc237095fbb5e25828eab3
X-KLMS-AntiSpam-Interceptor-Info: scan successful
X-KLMS-AntiPhishing: Clean, 2014/11/27 11:02:47
X-KLMS-AntiVirus: Kaspersky Security 8.0 for Linux Mail Server, version
	8.0.1.705, bases: 2014/11/27 11:08:00 #9998603;
	khse: 2014-03-12 13:55:01
X-KLMS-AntiVirus-Status: Clean, skipped
Subject: [PATCH 3/3] image.bbclass: keep fstab pretty when swapping 'ro' for defaults
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
X-List-Received-Date: Thu, 27 Nov 2014 16:33:23 -0000

Keep the columns in fstab lined up when rootfs is read-only
---
 meta/classes/image.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
index 82e977c..ae1431e 100644
--- a/meta/classes/image.bbclass
+++ b/meta/classes/image.bbclass
@@ -190,7 +190,7 @@ do_rootfs[umask] = "022"
 # A hook function to support read-only-rootfs IMAGE_FEATURES
 read_only_rootfs_hook () {
 	# Tweak the mount option and fs_passno for rootfs in fstab
-	sed -i -e '/^[#[:space:]]*\/dev\/root/{s/defaults/ro/;s/\([[:space:]]*[[:digit:]]\)\([[:space:]]*\)[[:digit:]]$/\1\20/}' ${IMAGE_ROOTFS}/etc/fstab
+	sed -i -e '/^[#[:space:]]*\/dev\/root/{s/defaults/ro      /;s/\([[:space:]]*[[:digit:]]\)\([[:space:]]*\)[[:digit:]]$/\1\20/}' ${IMAGE_ROOTFS}/etc/fstab
 
 	if ${@bb.utils.contains("DISTRO_FEATURES", "sysvinit", "true", "false", d)}; then
 		# Change the value of ROOTFS_READ_ONLY in /etc/default/rcS to yes
-- 
1.9.1


MATRIX VISION GmbH, Talstrasse 16, DE-71570 Oppenweiler
Registergericht: Amtsgericht Stuttgart, HRB 271090
Geschaeftsfuehrer: Uwe Furtner, Erhard Meier

