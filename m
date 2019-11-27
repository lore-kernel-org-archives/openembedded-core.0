Return-Path: <ross.burton@intel.com>
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com
	[209.85.128.67])
	by mail.openembedded.org (Postfix) with ESMTP id 71F247FA0A
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Nov 2019 13:30:49 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id g206so7111252wme.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Nov 2019 05:30:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=MXhUizleM+MuEc1+WxJDYiSMRvtK/j1H5LA6VwLNlCU=;
	b=jBh6IzmTFBI0WsitGIDEGrtBdUoolUVT3ijS1iDDok9Sg8Btw4SFGzAkoCeMsxo3GA
	oaRy33zoTWVUOYh6hMxDVdCtj57Azgny9yyzzBROz0VkvZq+KgD61P7z9sFea+tkWwY/
	1bFpKHzO9Cx8OqSHdNqXHyI+StkMxKtnTu+8/dfXCcZfHc/KtZQ9fyPpweemya/Qxp3i
	La7vdrlFwL6sUqZhX/bQZlVnCS/TMKMsGCSwkHj1tlGWVkmsLuELLq1E3bUNEuD+7vCd
	eYRQZrgIxXUhXstN9xhSStapFZSqoYzkhutkxg9vmxIatASX3IF83dY8vEmsCZkiiQUz
	S7vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=MXhUizleM+MuEc1+WxJDYiSMRvtK/j1H5LA6VwLNlCU=;
	b=P+wz/GXCafzYectZJasiVwbJZTFclwH119K2RqiT+iP5pMxnOf9vmO0Pd+fAZst+DO
	MJBCJy0o93JRmlZltzG7g4HoSqIEep74ZG1u8281s+dFetB5vT43+FerjYTZVuTEwinv
	O72Rd7nDGhPWgRo1iQrTIt/zd/qczSclskCv5Jd5dl5mY55YSk80xmt92AQ7ELz3oTxw
	RVtFy/ML45J5qa0NsxjawroW01qUye/vnDEOh3ad2DRgNnrUNLBossgf98BXyQCle48c
	tYphq65ZJ97P35EX3EBnSbw20VEtKZdEtm2/XNXaFIdp8a9Gb0tFeIrYrpUsweLQZRaS
	xN4g==
X-Gm-Message-State: APjAAAU1dyDKJCw1prpYkkumfRlEbZAjWC5a5po2x/2qSuaiQc9woZ3g
	JeBTXcSVT6CYnkoGhbi8aqnsyf2wVrk=
X-Google-Smtp-Source: APXvYqx/z75kRaNXEPa2ueCUEX7Jpvq11ObRUbp9RS7FUj5B/llnSuzw8jSl5Y1uXzAt9skeLWTYhw==
X-Received: by 2002:a05:600c:2549:: with SMTP id
	e9mr4229536wma.177.1574861450073; 
	Wed, 27 Nov 2019 05:30:50 -0800 (PST)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	d9sm17914952wrj.10.2019.11.27.05.30.48
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 27 Nov 2019 05:30:48 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 27 Nov 2019 13:30:47 +0000
Message-Id: <20191127133047.4850-1-ross.burton@intel.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [PATCH] conf/machine/x86-base: use wic instead of live
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
X-List-Received-Date: Wed, 27 Nov 2019 13:30:51 -0000
Content-Transfer-Encoding: 8bit

Use wic instead of the live/hddimg filesystem type for x86 machines, as it
produces better filesystems and doesn't have a hard limit of 4GB.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/conf/machine/include/x86-base.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/conf/machine/include/x86-base.inc b/meta/conf/machine/include/x86-base.inc
index 0227f3c289b..da56cc35740 100644
--- a/meta/conf/machine/include/x86-base.inc
+++ b/meta/conf/machine/include/x86-base.inc
@@ -8,7 +8,7 @@
 MACHINE_FEATURES += "screen keyboard pci usbhost ext2 ext3 x86 \
                      acpi serial usbgadget alsa"
 
-IMAGE_FSTYPES ?= "hddimg"
+IMAGE_FSTYPES ?= "wic"
 
 KERNEL_IMAGETYPE ?= "bzImage"
 
-- 
2.20.1


