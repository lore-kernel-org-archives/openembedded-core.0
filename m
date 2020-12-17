Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
 by mx.groups.io with SMTP id smtpd.web12.2569.1608173537013652979
 for <openembedded-core@lists.openembedded.org>;
 Wed, 16 Dec 2020 18:52:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linux.microsoft.com header.s=default header.b=kw0wQ3Vx;
 spf=pass (domain: linux.microsoft.com, ip: 13.77.154.182, mailfrom: pauleg@linux.microsoft.com)
Received: by linux.microsoft.com (Postfix, from userid 1054)
	id 890D120B7187; Wed, 16 Dec 2020 18:52:16 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 890D120B7187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1608173536;
	bh=FIYh4+UBOUqO+ZH8tw2+LUd0dWQuwNX1KB3U7FwYasc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=kw0wQ3Vx8C6QtbkSEYjdw6kts07P49uOmWCIfZxsVWMZ/cM2EI6w1zRTrkf63opIQ
	 DD4AIzBezflNYfnUtH1gAiydGpOCoy/EzBgGh3fbvBk07i7js3i2+807x4bqniwsuO
	 4gSovbUusJrAQ9zu8lQde9DZWiKVjFammr2S+X4o=
From: "Paul Eggleton" <paul.eggleton@linux.microsoft.com>
To: openembedded-core@lists.openembedded.org
Cc: Usama Arif <usama.arif@arm.com>
Subject: [PATCH 3/8] classes/kernel-fitimage: allow substituting mkimage command
Date: Wed, 16 Dec 2020 18:51:37 -0800
Message-Id: <f6dcfa11e8fa750e523b21025589962e1767eda5.1608173226.git.paul.eggleton@linux.microsoft.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <cover.1608173226.git.paul.eggleton@linux.microsoft.com>
References: <cover.1608173226.git.paul.eggleton@linux.microsoft.com>

From: Paul Eggleton <paul.eggleton@microsoft.com>

Add a UBOOT_MKIMAGE and UBOOT_MKIMAGE_SIGN variables to allow specifying
an alternative uboot-mkimage executable (or wrapper script/function).

Signed-off-by: Paul Eggleton <paul.eggleton@microsoft.com>
---
 meta/classes/kernel-fitimage.bbclass | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/meta/classes/kernel-fitimage.bbclass b/meta/classes/kernel-fitimage.bbclass
index f3d18e2..08b5db2 100644
--- a/meta/classes/kernel-fitimage.bbclass
+++ b/meta/classes/kernel-fitimage.bbclass
@@ -75,6 +75,10 @@ FIT_KEY_SIGN_PKCS ?= "-x509"
 # Description string
 FIT_DESC ?= "U-Boot fitImage for ${DISTRO_NAME}/${PV}/${MACHINE}"
 
+# mkimage command
+UBOOT_MKIMAGE ?= "uboot-mkimage"
+UBOOT_MKIMAGE_SIGN ?= "${UBOOT_MKIMAGE}"
+
 #
 # Emit the fitImage ITS header
 #
@@ -505,7 +509,7 @@ fitimage_assemble() {
 	#
 	# Step 6: Assemble the image
 	#
-	uboot-mkimage \
+	${UBOOT_MKIMAGE} \
 		${@'-D "${UBOOT_MKIMAGE_DTCOPTS}"' if len('${UBOOT_MKIMAGE_DTCOPTS}') else ''} \
 		-f ${1} \
 		arch/${ARCH}/boot/${2}
@@ -521,7 +525,7 @@ fitimage_assemble() {
 			cp -P ${STAGING_DATADIR}/u-boot*.dtb ${B}
 			add_key_to_u_boot="-K ${B}/${UBOOT_DTB_BINARY}"
 		fi
-		uboot-mkimage \
+		${UBOOT_MKIMAGE_SIGN} \
 			${@'-D "${UBOOT_MKIMAGE_DTCOPTS}"' if len('${UBOOT_MKIMAGE_DTCOPTS}') else ''} \
 			-F -k "${UBOOT_SIGN_KEYDIR}" \
 			$add_key_to_u_boot \
-- 
1.8.3.1

