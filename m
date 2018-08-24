Return-Path: <dan.dedrick@gmail.com>
Received: from mail-pl1-f195.google.com (mail-pl1-f195.google.com
	[209.85.214.195])
	by mail.openembedded.org (Postfix) with ESMTP id 77F3B744AE
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Aug 2018 20:47:18 +0000 (UTC)
Received: by mail-pl1-f195.google.com with SMTP id g23-v6so1561704plq.9
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Aug 2018 13:47:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=tEyNnjVWmMqjPZvfJjCzj6o56UVVpoA7P4e2tjEICPQ=;
	b=oxHJ25hTaY6t/F7nqn43p+2Syjr6KMd86r3AEDCYFy6BrJuOAd+L6I8s/1hV++R33i
	JFBuzNjn/gJBrgbKj4YAfFt6Oh4wrCqcSZ/evmFVVHj4xOusEBgaNETtzGTbwjt+1kLK
	K55LTyvmhiVld5QO5EewgOYCR8Xzltsn6SSFv7IdAVZeT/9II1nEzaZ6UuDjlAtxFkZj
	f/I2vQELhQgAckdpXiZl4Sw1eGwBSiaiwOjLlHJXWl7nA1ov+/n2xr6Lyr0LKwvy7ImV
	zZhs+l9Cx8HP63+vTGICBuuuded0a8JOCC+9S6oqWM3k/sSy+ABUAI6xl/q+RV/TUxlG
	Lw5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=tEyNnjVWmMqjPZvfJjCzj6o56UVVpoA7P4e2tjEICPQ=;
	b=DhdlDiRNsiqLtuR9b/jf3kfD2geDK7ZP7BoKmMj2VVPo/VO/WJIz8rDTu5R0x/AqTo
	OWsCeRlOf2F4lU+GIErAs9rIimKeS7f5Q8SGXGlNFN8NhzBcjiRJtah9oq/Ga/F3Oprw
	G8MeYKiJNRX8yKtGeoRg/Dvvb5r/6a6hGC3Tc3Avl3T9TbuOxoYnmUe6b11fri/3BOsr
	Z/ADr0oXVJiFSU9fQXU92NHoWacE63JKvUn9F0u3JWoMm71XG36pQHa/2js/h4NKOf9k
	Gi0gsF5bLm6OiDgNkC1Fxx4pUBDyhak+s4klAK9mg/eTsX1XudVUZeNmthXk0g8q9asv
	2CGg==
X-Gm-Message-State: APzg51AwXKTqmYIICFXTFGGIKmbH04S/cciFmIZBANaaFdUsqSe4z64f
	SvZjRl2kcIV7Jm1N4wQfB3SZrW3P
X-Google-Smtp-Source: ANB0VdagfrWJfM1Aa6HBfMM/Zbj0AQbpaX7NO9bT2drKXQsvgyzflnc/rXp5W+wehkphcLGYUOTFxQ==
X-Received: by 2002:a17:902:e183:: with SMTP id
	cd3-v6mr3031876plb.305.1535143639313; 
	Fri, 24 Aug 2018 13:47:19 -0700 (PDT)
Received: from talyn.lpdev.prtdev.lexmark.com ([192.146.101.90])
	by smtp.gmail.com with ESMTPSA id
	p64-v6sm13130046pfa.47.2018.08.24.13.47.17
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Fri, 24 Aug 2018 13:47:18 -0700 (PDT)
From: Dan Dedrick <dan.dedrick@gmail.com>
X-Google-Original-From: Dan Dedrick <ddedrick@lexmark.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 24 Aug 2018 16:47:08 -0400
Message-Id: <20180824204708.88608-1-ddedrick@lexmark.com>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH] kernel-devicetree: build DTBs in parallel
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
X-List-Received-Date: Fri, 24 Aug 2018 20:47:18 -0000

When building more than one device tree it's inefficient to serially
build them in multiple make calls. It's much faster and efficient to
build them in one call where they can run in parallel.

Signed-off-by: Dan Dedrick <ddedrick@lexmark.com>
---
 meta/classes/kernel-devicetree.bbclass | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/meta/classes/kernel-devicetree.bbclass b/meta/classes/kernel-devicetree.bbclass
index 867b776aa7..83270c4511 100644
--- a/meta/classes/kernel-devicetree.bbclass
+++ b/meta/classes/kernel-devicetree.bbclass
@@ -50,10 +50,14 @@ do_configure_append() {
 }
 
 do_compile_append() {
+	alldtb=""
 	for dtbf in ${KERNEL_DEVICETREE}; do
 		dtb=`normalize_dtb "$dtbf"`
-		oe_runmake $dtb
+		alldtb="${alldtb} ${dtb}"
 	done
+	if [ -n "${alldtb}" ]; then
+		oe_runmake ${alldtb}
+	fi
 }
 
 do_install_append() {
-- 
2.17.1


