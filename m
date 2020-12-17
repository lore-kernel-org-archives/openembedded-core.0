Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
 by mx.groups.io with SMTP id smtpd.web11.2603.1608173537015729619
 for <openembedded-core@lists.openembedded.org>;
 Wed, 16 Dec 2020 18:52:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linux.microsoft.com header.s=default header.b=mfCEumgZ;
 spf=pass (domain: linux.microsoft.com, ip: 13.77.154.182, mailfrom: pauleg@linux.microsoft.com)
Received: by linux.microsoft.com (Postfix, from userid 1054)
	id 9409C20B7189; Wed, 16 Dec 2020 18:52:16 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 9409C20B7189
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1608173536;
	bh=HuqWm/EJ0TIpQgKCKlOY3F6VVeX4nFLOn2pjmKWoRFs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=mfCEumgZbPQKboAltzdsEFQr09pyq7W6W+jj3q/+LbDngw2CWvIQ8tfJAnFVewW7s
	 iQQMlQrdC5AOYMuE6uGLXQGgdIES6S2g6xGJeefKXnBdzKJnuSb4P4wYQDUY1w9zmG
	 cLey/xFinhOXtZDcvSLfKvL6h2ug+VExx0Hz5MBU=
From: "Paul Eggleton" <paul.eggleton@linux.microsoft.com>
To: openembedded-core@lists.openembedded.org
Cc: Usama Arif <usama.arif@arm.com>
Subject: [PATCH 4/8] classes/kernel-fitimage: add ability to add additional signing options
Date: Wed, 16 Dec 2020 18:51:38 -0800
Message-Id: <e585ba2241f4bd04eef1264fe149411257cc04eb.1608173226.git.paul.eggleton@linux.microsoft.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <cover.1608173226.git.paul.eggleton@linux.microsoft.com>
References: <cover.1608173226.git.paul.eggleton@linux.microsoft.com>

From: Paul Eggleton <paul.eggleton@microsoft.com>

Add a UBOOT_MKIMAGE_SIGN_ARGS variable to enable passing additional
options to uboot-mkimage when it is run the second time to perform
signing.

Signed-off-by: Paul Eggleton <paul.eggleton@microsoft.com>
---
 meta/classes/kernel-fitimage.bbclass | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/meta/classes/kernel-fitimage.bbclass b/meta/classes/kernel-fitimage.bbclass
index 08b5db2..9661b4f 100644
--- a/meta/classes/kernel-fitimage.bbclass
+++ b/meta/classes/kernel-fitimage.bbclass
@@ -79,6 +79,9 @@ FIT_DESC ?= "U-Boot fitImage for ${DISTRO_NAME}/${PV}/${MACHINE}"
 UBOOT_MKIMAGE ?= "uboot-mkimage"
 UBOOT_MKIMAGE_SIGN ?= "${UBOOT_MKIMAGE}"
 
+# Arguments passed to mkimage for signing
+UBOOT_MKIMAGE_SIGN_ARGS ?= ""
+
 #
 # Emit the fitImage ITS header
 #
@@ -529,7 +532,8 @@ fitimage_assemble() {
 			${@'-D "${UBOOT_MKIMAGE_DTCOPTS}"' if len('${UBOOT_MKIMAGE_DTCOPTS}') else ''} \
 			-F -k "${UBOOT_SIGN_KEYDIR}" \
 			$add_key_to_u_boot \
-			-r arch/${ARCH}/boot/${2}
+			-r arch/${ARCH}/boot/${2} \
+			${UBOOT_MKIMAGE_SIGN_ARGS}
 	fi
 }
 
-- 
1.8.3.1

