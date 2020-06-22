Received: from Galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
 by mx.groups.io with SMTP id smtpd.web10.17625.1592833828383768243
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Jun 2020 06:50:28 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: linutronix.de, ip: 193.142.43.55, mailfrom: torbenh@linutronix.de)
Received: from torbenh by Galois.linutronix.de with local (Exim 4.80)
	(envelope-from <torbenh@linutronix.de>)
	id 1jnMqA-0001e2-0b
	for openembedded-core@lists.openembedded.org; Mon, 22 Jun 2020 15:50:26 +0200
From: "Torben Hohn" <torbenh@linutronix.de>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] kernel-fitimage.bbclass: allow passing UBOOT_SIGN_EXTRA_OPTS to uboot-mkimage
Date: Mon, 22 Jun 2020 15:50:25 +0200
Message-Id: <20200622135025.16141-1-torben.hohn@linutronix.de>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

To use pkcs11, it is necessary to pass "-N pkcs11".
And there are also a few more options, that are useful.

Pass UBOOT_SIGN_EXTRA_OPTS to uboot-mkimage, when signing the fitImage.

Signed-off-by: Torben Hohn <torben.hohn@linutronix.de>
---
 meta/classes/kernel-fitimage.bbclass | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/classes/kernel-fitimage.bbclass b/meta/classes/kernel-fitimage.bbclass
index 72b05ff8d1..afb62f1071 100644
--- a/meta/classes/kernel-fitimage.bbclass
+++ b/meta/classes/kernel-fitimage.bbclass
@@ -474,6 +474,7 @@ fitimage_assemble() {
 			${@'-D "${UBOOT_MKIMAGE_DTCOPTS}"' if len('${UBOOT_MKIMAGE_DTCOPTS}') else ''} \
 			-F -k "${UBOOT_SIGN_KEYDIR}" \
 			$add_key_to_u_boot \
+                        ${UBOOT_SIGN_EXTRA_OPTS} \
 			-r arch/${ARCH}/boot/${2}
 	fi
 }
-- 
2.20.1

