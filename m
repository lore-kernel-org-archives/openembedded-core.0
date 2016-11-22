Return-Path: <ricardo.ribalda@gmail.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id 2110871978
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Nov 2016 09:49:05 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id u144so2480818wmu.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Nov 2016 01:49:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=/hB543zk9+Uwg9KX46vq/doerfjFrs0U0+6Eioz7dx8=;
	b=SLAnXt028r9ruUBnNzYnYm7eE3Y0HTCTjIt8aCthS3onM6C14ve9v4r5NUxulCl3XJ
	trA30QN46S1PYhkBhWUiA1Fpe2SEOhLP3TpNtbBwtbQsKHS9o/uA/6NPSVljFvjkAXl8
	tFj6Us8SWXXIH2enPCwbRgmhAnwbgnRlTuM6QTwTeFzyh7Xjhs+q3eFmqcS9IZBIoZjK
	Pk838zZ3xZdR5K6ZF5AVXe6ceD3sh2lz2cg2QGbR8QdU1adq4vpgq/Q3HJlX9k0Ve4lZ
	CJ5uHkYqcTMPaaptRthZp0k1PbPdrR+Iubn03GLqal1yhKXBpufRNfskngA4rwwB/vxw
	IGjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=/hB543zk9+Uwg9KX46vq/doerfjFrs0U0+6Eioz7dx8=;
	b=c7v/5aE6wPtx8F2v9vckzO28XA6Dv6aCXCt3iCG1b7lP4yXKcoHVyUcNuec3z4ZcV9
	DqI9xftmrqsNi6WOaWxJGFzUiTaX//KKBMF0XpguvdS7Z8mbnR0uT730EaSTH6wNzaeW
	h0OOCVO3h0RzhILnhc2TqausTiNtLiiM1x6H334tq8OdD71nYSHDyMXlJ8myC+3bxaEW
	Lj90BTPPBL3FYzfR4bYQ+91MaUZ5lFaoVcvrZs3NrRv7OYQGooXiOCjMKWReqDVocZtH
	tbClCN2kHq5HoyvM+peuk1k/arlvusP0sMlS7M3keNlEStggjJZZbHqigfvcDc89HYMJ
	sIHg==
X-Gm-Message-State: AKaTC01y7rtzh6TFGwBT+nz97aWEFHMn+rSGPRBHnM/YL88qTo4vtPPCXe4SRmzQfPVzBQ==
X-Received: by 10.28.95.85 with SMTP id t82mr1468674wmb.56.1479808146027;
	Tue, 22 Nov 2016 01:49:06 -0800 (PST)
Received: from neopili.qtec.com
	(cpe.xe-3-0-1-778.vbrnqe10.dk.customer.tdc.net. [80.197.57.18])
	by smtp.gmail.com with ESMTPSA id
	m145sm1993375wma.3.2016.11.22.01.49.04
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 22 Nov 2016 01:49:05 -0800 (PST)
From: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
To: openembedded-core@lists.openembedded.org, oss.burton@intel.com,
	william.c.randle@intel.com
Date: Tue, 22 Nov 2016 10:49:02 +0100
Message-Id: <20161122094902.28965-1-ricardo.ribalda@gmail.com>
X-Mailer: git-send-email 2.10.2
Subject: [PATCH] grub-efi: Force no-pie build
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
X-List-Received-Date: Tue, 22 Nov 2016 09:49:06 -0000

PIE is enabled by default on the latest Debian LD. Disable it for
grub-efi. Otherwise:

| /usr/bin/ld: -r and -pie may not be used together
| collect2: error: ld returned 1 exit status
| Makefile:61382: recipe for target 'trig.module' failed
| make[3]: *** [trig.module] Error 1

Signed-off-by: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
---
 meta/recipes-bsp/grub/grub-efi_2.00.bb | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-bsp/grub/grub-efi_2.00.bb b/meta/recipes-bsp/grub/grub-efi_2.00.bb
index 5a0dc954a3bf..9d07a31de7ce 100644
--- a/meta/recipes-bsp/grub/grub-efi_2.00.bb
+++ b/meta/recipes-bsp/grub/grub-efi_2.00.bb
@@ -2,12 +2,14 @@ require grub2.inc
 
 DEPENDS_class-target = "grub-efi-native"
 RDEPENDS_${PN}_class-target = "diffutils freetype"
-PR = "r3"
+PE = "1"
 
 SRC_URI += " \
            file://cfg \
           "
 
+BUILD_LDFLAGS += "-no-pie"
+
 S = "${WORKDIR}/grub-${PV}"
 
 # Determine the target arch for the grub modules
-- 
2.10.2


