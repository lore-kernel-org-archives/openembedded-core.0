Return-Path: <naresh.bhat@linaro.org>
Received: from mail-yk0-f170.google.com (mail-yk0-f170.google.com
	[209.85.160.170])
	by mail.openembedded.org (Postfix) with ESMTP id 9F68F6013D
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Mar 2015 14:56:13 +0000 (UTC)
Received: by ykp131 with SMTP id 131so10695906ykp.12
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Mar 2015 07:56:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=rnNHA/RL7oxZ+JJkDoG+sUIuC6kVl6HAbL7eLBbnnCg=;
	b=cQcErt8fU0nfswzkGjQqqpyFkA4Q/pvPWOUPSxo+g/OnYZqgoB5jE6ImjwAY/xn/Ug
	Tyei8Uj9DzbXhHZHiZOJ8xmnyAD/114Ea8TbnMV0W4rcmA18Bys3xHIri9RFviVZ0vcD
	f3zxBJCxae5UKG9CIiVOzh2FN2FHDVvVo+cN4AOPBEdBvb9hcuw1ep1JefBARHz1upEl
	yWfPWHVSxmyULCoyM8JWgsyvCYAxHuseIvv8+V6OzDni/kvN0waqJVVbslbhZ/dQrAyU
	PXP6dQAXIawQKv84KIr1AFf8tLh5HGgfBuoN9v9xDewMXHIjAPmWfJniLAgt6yjqWdna
	nmHQ==
X-Gm-Message-State: ALoCoQldR1RIyF/9tywZTIHW24Dx4WKABvgPOrMSO7lsQx+hLJNFu6suLnKOSyCTUvvh4YeSMaxU
X-Received: by 10.236.25.68 with SMTP id y44mr47312882yhy.4.1426258574537;
	Fri, 13 Mar 2015 07:56:14 -0700 (PDT)
Received: from Latitude-E6430.caveonetworks.com ([111.93.218.67])
	by mx.google.com with ESMTPSA id a74sm1773572yhq.31.2015.03.13.07.56.10
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 13 Mar 2015 07:56:13 -0700 (PDT)
From: Naresh Bhat <naresh.bhat@linaro.org>
To: openembedded-core@lists.openembedded.org
Date: Fri, 13 Mar 2015 20:25:27 +0530
Message-Id: <1426258527-2329-6-git-send-email-naresh.bhat@linaro.org>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1426258527-2329-1-git-send-email-naresh.bhat@linaro.org>
References: <1426258527-2329-1-git-send-email-naresh.bhat@linaro.org>
Cc: matt.fleming@intel.com
Subject: [OE-core v1 PATCH 5/5] grub-efi: Add to support to install grubaa64 efi
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
X-List-Received-Date: Fri, 13 Mar 2015 14:56:13 -0000

Add support to install grubaa64 efi image.  By default GRUB_IMAGE contains
the bootia32.efi image.  Depending on the architecture type the variable is
being updated to bootia64.efi or grubaa64.efi

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


