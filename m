Return-Path: <grandpaul@gmail.com>
Received: from mail-pg1-f195.google.com (mail-pg1-f195.google.com
	[209.85.215.195])
	by mail.openembedded.org (Postfix) with ESMTP id BBF767D71B
	for <openembedded-core@lists.openembedded.org>;
	Wed,  8 May 2019 10:53:54 +0000 (UTC)
Received: by mail-pg1-f195.google.com with SMTP id c13so9934778pgt.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 08 May 2019 03:53:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=S+BvfSjt0nh3Ek6Zkuuxz348UWbv+2ZjlSAqF9xUv7k=;
	b=NJOCYBoT8EnzsDdREPA5Y4zr7hSn0LFLT1MIsh8M07b+2CTKExTFbi2w66a5b3Mv10
	2i6uJ6HDks1lXQWwiBa92POZs58dk+tb3RX4ryXgDWL56+y1Qz/PXaY/48T8fs5nyWOd
	PbiFYQVOJhIYJk3X95BZTjnkCWyUwHUe9CCJfuE6V4aMeGou5PMfadlEHNjwQrETLEbr
	UNmCvSuY2CUU7kHjGnYmobzqk1kyYteahQqvDSWZK+gcNGpyZPPA6+D8bpNxLZfwhzmm
	aNiXThBwmpyU7cnInessNEz6i6+fV5KMAs8wrNfvt4GxeRJ0cFTKaOle75PDf6qFHChx
	msCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:mime-version:content-transfer-encoding;
	bh=S+BvfSjt0nh3Ek6Zkuuxz348UWbv+2ZjlSAqF9xUv7k=;
	b=eLln2BNtVYdLK4fFL/twOKLfgrVGDtsw+cCU/G4WZz1LLhqZ1LhddMz7rVGlU7Gn/m
	0keQMTSeNFEUosojmX5mS8+OeNRuuQVO7ZA4btQQQnn1ENDxMIou61JHQ2h2S5NNEwil
	Hh2a16RLMMwQAnQwTsixKfcsMpxxNMlr167O3L2bnNKC6FLuhMKXtoXMB6SB6ey5S6sd
	49/3a4NKg6Z329JRYiSRi/mv+REGWjVb6Qco/YdPNQqSNW+N8Sko+cb7eRiOI9yGTQe8
	aqt6UewIu9Ulh64oxlu0pKOqRMT+2gMZcn2qh4+lk+lsHF+mXYfmvQJMDg5SwJs4SOe8
	yEwQ==
X-Gm-Message-State: APjAAAV3AIARrx4K0YqAjv0e4Nxl1tS0HhVh6jxOypbumZvzZRBT8e6P
	pWieJLYVG21VrwfxQPQiM21qmkXJNHo=
X-Google-Smtp-Source: APXvYqwwB1gcJnw58YEBTQu9Laaoz0aVfrAjRlRmEsfKmUn/jmn2z7gMzwF3BzNsAE1KHuG9uipMgA==
X-Received: by 2002:a63:2cc9:: with SMTP id s192mr42019027pgs.24.1557312835434;
	Wed, 08 May 2019 03:53:55 -0700 (PDT)
Received: from freya.lan (123-192-177-76.dynamic.kbronet.com.tw.
	[123.192.177.76]) by smtp.gmail.com with ESMTPSA id
	b18sm17976195pfp.32.2019.05.08.03.53.54
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 08 May 2019 03:53:54 -0700 (PDT)
Sender: PaulLiu <grandpaul@gmail.com>
From: "Ying-Chun Liu (PaulLiu)" <paulliu@debian.org>
To: openembedded-core@lists.openembedded.org
Date: Wed,  8 May 2019 18:53:25 +0800
Message-Id: <20190508105325.12842-1-paulliu@debian.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [PATCH] uboot-sign: Fix u-boot-nodtb symlinks
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
X-List-Received-Date: Wed, 08 May 2019 10:53:54 -0000
Content-Transfer-Encoding: 8bit

When using u-boot-nodtb, the symlink didn't install correctly to the
${DEPLOYDIR}. This commit fixes this bug.

Signed-off-by: Ying-Chun Liu (PaulLiu) <paulliu@debian.org>
---
 meta/classes/uboot-sign.bbclass | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/classes/uboot-sign.bbclass b/meta/classes/uboot-sign.bbclass
index 6385a06c13..8beafff7c0 100644
--- a/meta/classes/uboot-sign.bbclass
+++ b/meta/classes/uboot-sign.bbclass
@@ -53,8 +53,8 @@ concat_dtb_helper() {
 
 	if [ -f "${UBOOT_NODTB_BINARY}" ]; then
 		install ${UBOOT_NODTB_BINARY} ${DEPLOYDIR}/${UBOOT_NODTB_IMAGE}
-		ln -sf ${UBOOT_NODTB_IMAGE} ${UBOOT_NODTB_SYMLINK}
-		ln -sf ${UBOOT_NODTB_IMAGE} ${UBOOT_NODTB_BINARY}
+		ln -sf ${UBOOT_NODTB_IMAGE} ${DEPLOYDIR}/${UBOOT_NODTB_SYMLINK}
+		ln -sf ${UBOOT_NODTB_IMAGE} ${DEPLOYDIR}/${UBOOT_NODTB_BINARY}
 	fi
 
 	# Concatenate U-Boot w/o DTB & DTB with public key
-- 
2.20.1


