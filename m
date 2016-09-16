Return-Path: <armccurdy@gmail.com>
Received: from mail-pa0-f65.google.com (mail-pa0-f65.google.com
	[209.85.220.65])
	by mail.openembedded.org (Postfix) with ESMTP id 6A1C4731BA
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Sep 2016 22:52:35 +0000 (UTC)
Received: by mail-pa0-f65.google.com with SMTP id my20so961808pab.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Sep 2016 15:52:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=o6FoNjac8vgPVIU83/avtp5mTjpE8TVrKTsArmMtVrc=;
	b=eZNevydnbxfHnBvUDd+cQzDykAy0jmQAfwfkBvL5SEZ9mkfhF6jyky6ct9dU1bty1c
	fmgeUTdoO8inG994BKunCRd5A1AIe0kQ82SGnI8QLV/LvGS/GIVHygK2+eLJJvAi4eTF
	ByKfCFQuRREJx8vVoJvvzIIEu+rGdY8W7B5wiO70CLxSUoA9RctdOkF+BgtRpogOA2J3
	oopXLynXkP3BdoMgGB+bhKW4De1zPDSpZu/eCw20svKzOjrumc+KtxbccrAN2yo+UdS8
	wMxJEsn52rycEnbiChF55YW2iX87KjEHytY+RcmAmoxKtKbjSANFRt9+XqffUlTtbvbX
	0bwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=o6FoNjac8vgPVIU83/avtp5mTjpE8TVrKTsArmMtVrc=;
	b=GsEhNgbR3pdBg9FzT+7elpp0cj+2cpYKBjYW/XDwu3+vwb7J2J7XtukAyu9oZAhdKK
	KltwHenEGinXCXzo62VvLIlTPQy1546c5CKS4gCVWk2FgBtjRWG/0ckRzx4E7hcycy3p
	DZlybxgorTKvQi7NNmbkHO1P1Fmd8xMlmYSv7u3F2o8QoE98mg5YvpEgc3VtDzx0/g3x
	SZfFPEf9mrJiOHDuGWGZZKd5tgOszQd7kb3wMpvGeIRv7sl2u5z4uQrFB9ZtkgaThhrU
	Q+1EE1IIES5htI+tVt6kH4KEj3lp5r8jztv61eo4eeJY1CUiQjL+NRtgmmFEmOGWKE2W
	XD7A==
X-Gm-Message-State: AE9vXwNVQ4SkyDHYR65BvFFMWOenpAPWGhaX9tWCOau28CA3iFaorKhy+IpbmCO0FiPskg==
X-Received: by 10.66.138.74 with SMTP id qo10mr26651591pab.135.1474066356588; 
	Fri, 16 Sep 2016 15:52:36 -0700 (PDT)
Received: from e6520.adbgroup.pl
	(50-204-102-64-static.hfc.comcastbusiness.net. [50.204.102.64])
	by smtp.gmail.com with ESMTPSA id
	m5sm14396788paw.40.2016.09.16.15.52.35
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 16 Sep 2016 15:52:35 -0700 (PDT)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 16 Sep 2016 15:52:29 -0700
Message-Id: <1474066349-22082-1-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH] kernel.bbclass: assign INITRAMFS_BASE_NAME using ?=
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
X-List-Received-Date: Fri, 16 Sep 2016 22:52:37 -0000

Default values for KERNEL_IMAGE_BASE_NAME and MODULE_IMAGE_BASE_NAME
are already assigned using ?= and anyone wanting to over-ride one is
likely to want to over-ride them all. Make the three consistent with
each other.

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 meta/classes/kernel.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
index a6112e8..bfb7350 100644
--- a/meta/classes/kernel.bbclass
+++ b/meta/classes/kernel.bbclass
@@ -200,7 +200,7 @@ copy_initramfs() {
 	echo "Finished copy of initramfs into ./usr"
 }
 
-INITRAMFS_BASE_NAME = "initramfs-${PV}-${PR}-${MACHINE}-${DATETIME}"
+INITRAMFS_BASE_NAME ?= "initramfs-${PV}-${PR}-${MACHINE}-${DATETIME}"
 INITRAMFS_BASE_NAME[vardepsexclude] = "DATETIME"
 do_bundle_initramfs () {
 	if [ ! -z "${INITRAMFS_IMAGE}" -a x"${INITRAMFS_IMAGE_BUNDLE}" = x1 ]; then
-- 
1.9.1


