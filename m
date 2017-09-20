Return-Path: <andre.draszik@gmail.com>
Received: from mail-wr0-f194.google.com (mail-wr0-f194.google.com
	[209.85.128.194])
	by mail.openembedded.org (Postfix) with ESMTP id 2C091719F7
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Sep 2017 09:42:00 +0000 (UTC)
Received: by mail-wr0-f194.google.com with SMTP id p37so1160237wrb.5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Sep 2017 02:42:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=4oaTagLOFubmDfOTs7aa319ZFOwdVEg+pQpHi1cS7r8=;
	b=eXnP0utChZ2qHxd92emL5YapresM1fNqCWwAvCkq6L6vRgzIz1mVDgvtNWH/cTdXV3
	VShce2ENbL/LWK6+9+E+vRAfEMAByS26vPOxvnkV1nBwq+Al5xogPmiQmYsqf8HUc5Pz
	0p10El/2/GreTCzzRGzyal8s29RLAsUy8AHPfTVYHUW4MPb7KruVIHG6g7hCESf6bh56
	v81kWBPvLzQTYjt1+6egr0yN0i7Vd1J/C9PLjMvcWwy68lwLYNs+EyG0k0U/zdnJYIMX
	027kCjZZBtGC5aSnbg0oRWTgh2OuhKo4Kd+qaEuVuF4gtm2ZR8SEahoHxMiq7bZpmcq0
	bv2A==
X-Gm-Message-State: AHPjjUiWQhn+HBHkBy5VJX1A7m2CpVcECg3DVy+d0q2lEv+YkM8rs2It
	PAzASTyVSSEs0h21PSYDmSeuzx7R
X-Google-Smtp-Source: AOwi7QB/YS8uwvXKphIN/huRgOI8zKIzUmqDPH45s6zCfeIo8K5BQY7rN0oZDCSfKPTYg74QrYqc2w==
X-Received: by 10.223.134.248 with SMTP id 53mr1550957wry.57.1505900521478;
	Wed, 20 Sep 2017 02:42:01 -0700 (PDT)
Received: from tfsielt31850.tycofs.com ([77.107.218.170])
	by smtp.gmail.com with ESMTPSA id
	k52sm1467558wrf.62.2017.09.20.02.42.00
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 20 Sep 2017 02:42:00 -0700 (PDT)
From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <git@andred.net>
To: openembedded-core@lists.openembedded.org
Date: Wed, 20 Sep 2017 10:41:55 +0100
Message-Id: <20170920094157.11340-3-git@andred.net>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <20170920094157.11340-1-git@andred.net>
References: <20170920094157.11340-1-git@andred.net>
MIME-Version: 1.0
Subject: [PATCH 3/5] kernel-uimage: optimise UBOOT_ENTRYSYMBOL support
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
X-List-Received-Date: Wed, 20 Sep 2017 09:42:01 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: André Draszik <adraszik@tycoint.com>

This is the remaining local change to a fix similar to
commit e0b4f018d1c2 ("kernel-uimage.bbclass: Fix up
generation of uImage from vmlinux"):

Make awk exit on match to save a few CPU cycles so as
to make this similar to kernel-fitimage.bbclass

Signed-off-by: André Draszik <adraszik@tycoint.com>
---
 meta/classes/kernel-uimage.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/kernel-uimage.bbclass b/meta/classes/kernel-uimage.bbclass
index 7c026abf0b..1d8656e76e 100644
--- a/meta/classes/kernel-uimage.bbclass
+++ b/meta/classes/kernel-uimage.bbclass
@@ -27,7 +27,7 @@ do_uboot_mkimage() {
 	ENTRYPOINT=${UBOOT_ENTRYPOINT}
 	if [ -n "${UBOOT_ENTRYSYMBOL}" ]; then
 		ENTRYPOINT=`${HOST_PREFIX}nm ${B}/vmlinux | \
-			awk '$3=="${UBOOT_ENTRYSYMBOL}" {print $1}'`
+			awk '$3=="${UBOOT_ENTRYSYMBOL}" {print "0x"$1;exit}'`
 	fi
 
 	uboot-mkimage -A ${UBOOT_ARCH} -O linux -T kernel -C "${linux_comp}" -a ${UBOOT_LOADADDRESS} -e $ENTRYPOINT -n "${DISTRO_NAME}/${PV}/${MACHINE}" -d linux.bin ${B}/arch/${ARCH}/boot/uImage
-- 
2.14.1


