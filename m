Return-Path: <nkela@cisco.com>
X-Greylist: delayed 646 seconds by postgrey-1.34 at layers.openembedded.org;
	Tue, 14 Feb 2017 21:38:37 UTC
Received: from alln-iport-2.cisco.com (alln-iport-2.cisco.com [173.37.142.89])
	by mail.openembedded.org (Postfix) with ESMTP id 54BD9731C2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Feb 2017 21:38:37 +0000 (UTC)
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A0CoAQABdqNY/4UNJK1dGwEBAQMBAQEJA?=
	=?us-ascii?q?QEBg1KBao1hpTeCD4ovPxgBAgEBAQEBAQFiKIVMHSZcAglEiVIBAxWxVwUBHIZ?=
	=?us-ascii?q?4ChknDVWDdIZMh0CCT4R6HwWbODqBf4t8hBkCkQECijWIYB84gQAgFB1phC0eg?=
	=?us-ascii?q?WFANYoHAQEB?=
X-IronPort-AV: E=Sophos;i="5.35,162,1484006400"; d="scan'208";a="384152424"
Received: from alln-core-11.cisco.com ([173.36.13.133])
	by alln-iport-2.cisco.com with ESMTP/TLS/DHE-RSA-AES256-SHA;
	14 Feb 2017 21:27:43 +0000
Received: from sjc-ads-4850.cisco.com (sjc-ads-4850.cisco.com [10.28.39.114])
	by alln-core-11.cisco.com (8.14.5/8.14.5) with ESMTP id
	v1ELRh4h005233; Tue, 14 Feb 2017 21:27:43 GMT
Received: by sjc-ads-4850.cisco.com (Postfix, from userid 323395)
	id 38D50A0E; Tue, 14 Feb 2017 13:27:43 -0800 (PST)
From: Nikunj Kela <nikunj.kela@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 14 Feb 2017 21:27:38 +0000
Message-Id: <1487107658-5214-1-git-send-email-nikunj.kela@gmail.com>
X-Mailer: git-send-email 2.5.0
Subject: [PATCH] kernel-fitimage.bbclass: Allow set/unset load address for FDT
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
X-List-Received-Date: Tue, 14 Feb 2017 21:38:38 -0000

Allow the load address for the FDT segment in the fitImage. This
allows U-Boot to dynamically decide where to load the FDT.

UBOOT_FDT_LOADADDRESS - Specifies the load address used by u-boot
		for the FDT

Signed-off-by: Nikunj Kela <nikunj.kela@gmail.com>
---
 meta/classes/kernel-fitimage.bbclass | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/meta/classes/kernel-fitimage.bbclass b/meta/classes/kernel-fitimage.bbclass
index 1c3b4b7..7f9da49 100644
--- a/meta/classes/kernel-fitimage.bbclass
+++ b/meta/classes/kernel-fitimage.bbclass
@@ -127,6 +127,11 @@ EOF
 fitimage_emit_section_dtb() {
 
 	dtb_csum="sha1"
+	fdt_loadline=""
+
+	if [ -n "${UBOOT_FDT_LOADADDRESS}" ]; then
+		fdt_loadline="load = <${UBOOT_FDT_LOADADDRESS}>;"
+	fi
 
 	cat << EOF >> ${1}
                 fdt@${2} {
@@ -135,6 +140,7 @@ fitimage_emit_section_dtb() {
                         type = "flat_dt";
                         arch = "${UBOOT_ARCH}";
                         compression = "none";
+                        ${fdt_loadline}
                         hash@1 {
                                 algo = "${dtb_csum}";
                         };
-- 
2.5.0


