Return-Path: <ricardo@foundries.io>
Received: from mail-qk1-f195.google.com (mail-qk1-f195.google.com
	[209.85.222.195])
	by mail.openembedded.org (Postfix) with ESMTP id 701BF7E686
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 Jul 2019 20:06:55 +0000 (UTC)
Received: by mail-qk1-f195.google.com with SMTP id r21so15665375qke.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 Jul 2019 13:06:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=foundries-io.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=PB0Asq6NWbJrvs00ah4ScL9d/XBK7FgEDbU1DbheSxg=;
	b=jvmZxZv/Lg6wanHNmMahrYrizWHWuOaeawj6GyY08f5n8NMFYo5sA6rFTN5qsX6+xv
	6wY2l0RcTyCb5xSAC5vhK5KFR5khCi1g//tvHlqfPP3AgtSP6Uxy9sXTLTM6/5zpF8FG
	Qmr9I7rzrOGJjEmH+lzrTyeYtdUUAG6HbumZoCdc25SK5MxLsN+lDKpFzL3aGX/9T3rA
	DbqHvRdLxgqTAy5BwXF3RqjURK6sKIXq4RGXFMKkaaaPrK/vnrDzgqqcxqAgz+v4FlSX
	2ZXORxJVHAdgTD/b/G7sX4MsjaRIDmDrxMcMp+iHJGw5f9QyDvIBUNg2DTKOqw1zzD6q
	gZ2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=PB0Asq6NWbJrvs00ah4ScL9d/XBK7FgEDbU1DbheSxg=;
	b=F61cGojR1/aiem/gxdOy74QUCsw2B1WzOvEb/ZykSrzwjvbQgmY1YV7DqYzxaWucfC
	dMGndb83sA/aIeJe1nDkEOLrOSDG8AZTafiHBr3rGDKoEhhKV1Du7DDnXpxI0BWDJNml
	E6AKnmtAx9OdvBAsqIviIOnriFqe7lVSmMmCVSUs8WG76uQxZLobOjj6XpagZ30YKI3M
	CnlzEzdp2cLV6HF9EoaM7R74d3wjt7bXfVTNnd8+6PZhE2HVdxZdzHmLi1wO69ABusxE
	9olhtUsBANlisni2/hNpP6/U0d4xaIYrL1utA+a2JPPG8gieffsbiWGEsJaf6ctnqz58
	nh6g==
X-Gm-Message-State: APjAAAWjtS0UkV5mRuISQrJenGeRHCK845EfJItqLPcpeRsyle9EQHpu
	O7zFVLPxeFPAaPE0Ssy3k69f/Rg7/Q==
X-Google-Smtp-Source: APXvYqzBFtUa1D5b8wKtJqYZOQzZmhvdmb5w/jrig+B4m9q4Yq8al1sPNZ90Yi7b+x7j42YU3jYLyA==
X-Received: by 2002:a05:620a:16d6:: with SMTP id
	a22mr23327589qkn.414.1563307615986; 
	Tue, 16 Jul 2019 13:06:55 -0700 (PDT)
Received: from localhost.localdomain ([2804:14d:badc:8c0c:7d37:4713:cf75:be06])
	by smtp.gmail.com with ESMTPSA id
	y42sm15012702qtc.66.2019.07.16.13.06.54
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Tue, 16 Jul 2019 13:06:55 -0700 (PDT)
From: Ricardo Salveti <ricardo@foundries.io>
To: openembedded-core@lists.openembedded.org
Date: Tue, 16 Jul 2019 17:06:40 -0300
Message-Id: <20190716200640.18414-1-ricardo@foundries.io>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
Subject: [PATCH] kernel-fitimage: include overlays with external dtb
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
X-List-Received-Date: Tue, 16 Jul 2019 20:06:55 -0000
Content-Transfer-Encoding: 8bit

As done with the default dtb provider, create fit image sections for
normal device-tree files and device-tree overlays (.dtbo).

Signed-off-by: Ricardo Salveti <ricardo@foundries.io>
---
 meta/classes/kernel-fitimage.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/kernel-fitimage.bbclass b/meta/classes/kernel-fitimage.bbclass
index b51882dce4..17d4d85658 100644
--- a/meta/classes/kernel-fitimage.bbclass
+++ b/meta/classes/kernel-fitimage.bbclass
@@ -406,7 +406,7 @@ fitimage_assemble() {
 
 	if [ -n "${EXTERNAL_KERNEL_DEVICETREE}" ]; then
 		dtbcount=1
-		for DTBFILE in ${EXTERNAL_KERNEL_DEVICETREE}/*.dtb; do
+		for DTBFILE in ${EXTERNAL_KERNEL_DEVICETREE}/*.dtb*; do
 			DTB=`basename ${DTBFILE}`
 			DTB=$(echo "${DTB}" | tr '/' '_')
 			DTBS="${DTBS} ${DTB}"
-- 
2.22.0


