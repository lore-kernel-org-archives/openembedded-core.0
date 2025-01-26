Return-Path: <sst@poczta.fm>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF5E6C0218E
	for <webhook@archiver.kernel.org>; Sun, 26 Jan 2025 13:20:43 +0000 (UTC)
Received: from smtpo69.interia.pl (smtpo69.interia.pl [217.74.67.69])
 by mx.groups.io with SMTP id smtpd.web11.29540.1737897633439157347
 for <openembedded-core@lists.openembedded.org>;
 Sun, 26 Jan 2025 05:20:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@poczta.fm header.s=dk header.b=PPtDjQG0;
 spf=pass (domain: poczta.fm, ip: 217.74.67.69, mailfrom: sst@poczta.fm)
Received: from localhost (unknown [80.68.231.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by poczta.interia.pl (INTERIA.PL) with UTF8SMTPSA;
	Sun, 26 Jan 2025 14:20:30 +0100 (CET)
From: Slawomir Stepien <sst@poczta.fm>
To: openembedded-core@lists.openembedded.org
Cc: Slawomir Stepien <sst@poczta.fm>
Subject: [PATCH RESEND] kernel-yocto: fix merge_config.sh flag set when KBUILD_DEFCONFIG is used
Date: Sun, 26 Jan 2025 14:20:05 +0100
Message-ID: <20250126132005.1540374-1-sst@poczta.fm>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-IPL-Priority-Group: 0-0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=poczta.fm; s=dk;
	t=1737897631; bh=ep94psO70R+gbl2W8K1FRE9vKfLnPB6xWSiUqdBKtNs=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=PPtDjQG0dMplce2G1vyDLmYyiXE//PEjESRueI9Ukcjq98xGXb+4AsJm1zMbc66BA
	 VFYQIix8iiV6IrAP7oEIDOqmcdSK03iUYoc6Rr7azKXNKqFHpobIRO4VjzHbUU7kJm
	 DAsebKUgyw/7HvLISgH/eIU3/2Qr1GW8K9Ob5/UY=
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 26 Jan 2025 13:20:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210289

Based on the documentation of KCONFIG_MODE[1], when we use "in-tree"
defconfig (the KBUILD_DEFCONFIG is set), then the alldefconfig mode
should be used with merge_config.sh.

This commit fixes the logic behind setting the flag by checking if the
provided defconfig file exists in the linux source tree.

[1] https://docs.yoctoproject.org/ref-manual/variables.html#term-KCONFIG_MODE

Signed-off-by: Slawomir Stepien <sst@poczta.fm>
---
 meta/classes-recipe/kernel-yocto.bbclass | 18 +++++++++++++++---
 1 file changed, 15 insertions(+), 3 deletions(-)

diff --git a/meta/classes-recipe/kernel-yocto.bbclass b/meta/classes-recipe/kernel-yocto.bbclass
index c45abf6ddc..ffda41ffc9 100644
--- a/meta/classes-recipe/kernel-yocto.bbclass
+++ b/meta/classes-recipe/kernel-yocto.bbclass
@@ -113,6 +113,14 @@ def get_dirs_with_fragments(d):
 
     return " ".join(extrafiles)
 
+kbuild_defconfig_exists() {
+	if [ -f "${S}/arch/${ARCH}/configs/${KBUILD_DEFCONFIG}" ]; then
+		return 0
+	fi
+
+	return 1
+}
+
 do_kernel_metadata() {
 	set +e
 
@@ -155,7 +163,7 @@ do_kernel_metadata() {
 	# precendence.
 	#
 	if [ -n "${KBUILD_DEFCONFIG}" ]; then
-		if [ -f "${S}/arch/${ARCH}/configs/${KBUILD_DEFCONFIG}" ]; then
+		if $(kbuild_defconfig_exists); then
 			if [ -f "${UNPACKDIR}/defconfig" ]; then
 				# If the two defconfig's are different, warn that we overwrote the
 				# one already placed in UNPACKDIR
@@ -478,8 +486,12 @@ do_kernel_configme() {
 			config_flags=""
 			;;
 		*)
-			if [ -f ${UNPACKDIR}/defconfig ]; then
-				config_flags="-n"
+			if $(kbuild_defconfig_exists); then
+				config_flags=""
+			else
+				if [ -f ${UNPACKDIR}/defconfig ]; then
+					config_flags="-n"
+				fi
 			fi
 			;;
 	esac
-- 
2.48.1


