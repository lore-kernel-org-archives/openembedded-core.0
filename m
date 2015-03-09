Return-Path: <naresh.bhat@linaro.org>
Received: from mail-ie0-f171.google.com (mail-ie0-f171.google.com
	[209.85.223.171])
	by mail.openembedded.org (Postfix) with ESMTP id 38AA0739A7
	for <openembedded-core@lists.openembedded.org>;
	Mon,  9 Mar 2015 18:32:06 +0000 (UTC)
Received: by iecrd18 with SMTP id rd18so15028132iec.13
	for <openembedded-core@lists.openembedded.org>;
	Mon, 09 Mar 2015 11:32:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=SzVFzmeiYoMPXvx+KuFYV7/fXk5iPrz4XKVYCsN8Lyc=;
	b=HdJjefNF8woJ9OzreYWRBE2yYcLTxWlmLHLu9TMY9g9eokdtOyI9OlJU33VfVg05N0
	H+y7UDmafqvGN9pue6GcyfIHaqRZkJruD3f1sueD8+M4jxX4R44GJ7e/Z56jlAz9xm29
	81vikksFvUpXux1VOhfTieDEtEDecTGKg3xsGo9juxdg46mKG2fY0hKByLZKp800ssHp
	pFF/ujVyyWlV/9+0C0vLrbLk/dNYBvqJdwUpGiaCEGf6z+Kvh1hpVHnc2C/JZsNQZ+/L
	dFVSfs7grk7YRP/QBWlXDy4yF5LfVVobVHF2We5VZktf7e4ZGSUVAFP5uLtCOi3Th7sM
	VrkA==
X-Gm-Message-State: ALoCoQnBOEYQCaCay6/So/l/f6HjhQr/d5Skp2+rBquwj0WIaqlwZFTP3uckxMJpttITWE5q/rcN
X-Received: by 10.42.118.7 with SMTP id v7mr28692439icq.30.1425925928185;
	Mon, 09 Mar 2015 11:32:08 -0700 (PDT)
Received: from Latitude-E6430.domain.name (64.2.3.194.ptr.us.xo.net.
	[64.2.3.194])
	by mx.google.com with ESMTPSA id w3sm6552503igz.4.2015.03.09.11.32.05
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 09 Mar 2015 11:32:07 -0700 (PDT)
From: Naresh Bhat <naresh.bhat@linaro.org>
To: openembedded-core@lists.openembedded.org
Date: Tue, 10 Mar 2015 00:01:16 +0530
Message-Id: <1425925876-9663-6-git-send-email-naresh.bhat@linaro.org>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1425925876-9663-1-git-send-email-naresh.bhat@linaro.org>
References: <1425925876-9663-1-git-send-email-naresh.bhat@linaro.org>
Subject: [OE-core v1 PATCH 5/5] grub-efi: Add support to install grubaa64 efi
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
X-List-Received-Date: Mon, 09 Mar 2015 18:32:07 -0000

Add support to install grubaa64.efi image.  By default GRUB_IMAGE contains
the bootia32.efi image.  Depending on the architecture type the variable is
being updated to either bootia64.efi or grubaa64.efi

Signed-off-by: Naresh Bhat <naresh.bhat@linaro.org>
---
 meta/classes/grub-efi.bbclass |   17 +++++++++++------
 1 file changed, 11 insertions(+), 6 deletions(-)

diff --git a/meta/classes/grub-efi.bbclass b/meta/classes/grub-efi.bbclass
index 47bd35e..cded1a0 100644
--- a/meta/classes/grub-efi.bbclass
+++ b/meta/classes/grub-efi.bbclass
@@ -31,15 +31,20 @@ efi_populate() {
 	# nested under a top level directory.
 	DEST=$1
 
-	install -d ${DEST}${EFIDIR}
-
 	GRUB_IMAGE="bootia32.efi"
-	if [ "${TARGET_ARCH}" = "x86_64" ]; then
+
+	case ${TARGET_ARCH} in
+		x86_64 )
 		GRUB_IMAGE="bootx64.efi"
-	fi
-	install -m 0644 ${DEPLOY_DIR_IMAGE}/${GRUB_IMAGE} ${DEST}${EFIDIR}
+		;;
+		aarch64 )
+		GRUB_IMAGE="grubaa64.efi"
+		;;
+	esac
+
+	install -m 0644 -D ${DEPLOY_DIR_IMAGE}/${GRUB_IMAGE} ${DEST}${EFIDIR}
 
-	install -m 0644 ${GRUBCFG} ${DEST}${EFIDIR}
+	install -m 0644 -D ${GRUBCFG} ${DEST}${EFIDIR}
 }
 
 efi_iso_populate() {
-- 
1.7.9.5


