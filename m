Return-Path: <raj.khem@gmail.com>
Received: from mail-pg1-f195.google.com (mail-pg1-f195.google.com
	[209.85.215.195])
	by mail.openembedded.org (Postfix) with ESMTP id 10B4774A25
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Sep 2018 13:54:03 +0000 (UTC)
Received: by mail-pg1-f195.google.com with SMTP id n31-v6so2022654pgm.7
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Sep 2018 06:54:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=eO11gfj0CrPC7IT5+IT6XtGQesJlrJ0esoVUVYh1TNI=;
	b=l5yvzJRLcOeuWCANGSiE54mE6i0EEU3ZfxzRv5X2GilF/m2iEuDTXKIu4xfMK29WEB
	ksjCE2mzcm8l+mWn6NHCt8iOe7RrUm/+20QjJY3fCTiOp2ydNpVsratnWBPLtWDG0skd
	an8/9NSC8+bd/T6j+KeuKuDlvYi7U9FxtNujPydBrlMIwUgWks5UKLdm8hqSKRXuuVJr
	+QAPuMkQVDp8yv1L9QwmZnTyiKJSzXXI5Imyq97X/XTd6Og3g67/8/UPYHhYa/beIl3L
	e2XV0IJCfGwHV3DJtfjZmivV+zm15TPe+dJ8zs63fKn+xPd9b/k81utAJw/ARbC9ZQg5
	2U5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=eO11gfj0CrPC7IT5+IT6XtGQesJlrJ0esoVUVYh1TNI=;
	b=ovceKtF6JRjQ3TSadmPIDzEINYdS2R36mu4gMZYbmve+oGesyllYvbiJ1x1jawcnXI
	QBQ0waBqT7mlRbD+p8PV0zlYelXLcTftYakyYjCbi7qA9fbPjqt1sNhCtreZOjCNbooT
	R4wYK1dGq8vBIFLN37lGTvba3siiq+++COoZ2fhxULqedT1N4BbkJkz9QaU5DeOLhoEj
	87fnN6gKP5d9IL2Y8FJ/J1qqfK3On7Wz14NeylESgFDiDhW+6fyWJFrXZAM4Jpghe71D
	5XFVNI6bnlVG2RE1Ncap37YNWVK9AHFAnwyvNFTc+7V5blX6U5OuhOaU4Y5WrdDSMG3Z
	P8xA==
X-Gm-Message-State: ABuFfoj1gxVE+6mn6IPtPOXKlk/mgyKyVrIdlYjOEmnspLY1DYTKotUl
	Qqi+rqyhTW2kgBkMTzn20/6nvm9d
X-Google-Smtp-Source: ACcGV62qgsr7HgXJluC4TA+SZDimI1m7j7zcqv1vXGA/x8Z+zmNGu1sHPrOYCl/4gYSMpDHqDCWc2w==
X-Received: by 2002:a63:c84c:: with SMTP id
	l12-v6mr10148013pgi.77.1538056444597; 
	Thu, 27 Sep 2018 06:54:04 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:877f:9499::b1b1])
	by smtp.gmail.com with ESMTPSA id
	h4-v6sm3357861pfe.49.2018.09.27.06.54.03
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 27 Sep 2018 06:54:04 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org,
	akuster808@gmail.com
Date: Thu, 27 Sep 2018 06:53:55 -0700
Message-Id: <20180927135355.28172-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.19.0
MIME-Version: 1.0
Subject: [sumo][PATCH] security_flags: disable static PIE in glibc
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
X-List-Received-Date: Thu, 27 Sep 2018 13:54:04 -0000
Content-Transfer-Encoding: 8bit

From: Ross Burton <ross.burton@intel.com>

Static PIE doesn't work entirely right in GCC 7, for example ldconfig on ARM
with the flags enabled will something segfault during initialisation.

To mitigate this until we have GCC 8 integrated, don't enable static PIE.

Signed-off-by: Ross Burton <ross.burton@intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/conf/distro/include/security_flags.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/conf/distro/include/security_flags.inc b/meta/conf/distro/include/security_flags.inc
index d66dd57649..aaeca6991b 100644
--- a/meta/conf/distro/include/security_flags.inc
+++ b/meta/conf/distro/include/security_flags.inc
@@ -6,7 +6,7 @@
 # in the DISTRO="poky-lsb" configuration.
 
 GCCPIE ?= "--enable-default-pie"
-GLIBCPIE ?= "--enable-static-pie"
+# If static PIE is known to work well, GLIBCPIE="--enable-static-pie" can be set
 
 # _FORTIFY_SOURCE requires -O1 or higher, so disable in debug builds as they use
 # -O0 which then results in a compiler warning.
-- 
2.19.0


