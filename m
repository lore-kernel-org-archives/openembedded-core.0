Return-Path: <akuster808@gmail.com>
Received: from mail-pg1-f195.google.com (mail-pg1-f195.google.com
	[209.85.215.195])
	by mail.openembedded.org (Postfix) with ESMTP id 392FE7E14B
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 May 2019 01:43:33 +0000 (UTC)
Received: by mail-pg1-f195.google.com with SMTP id f25so1128517pgv.10
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 May 2019 18:43:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=pw45CV8pxnAnfRE9KXEqnyQhozka4Eqfq6ObdWYoPkk=;
	b=jjTJ6GpYGSg6INBxSmu696PJ4dzo5bDMNiMPJKZCW2HXwed9WDTb6FMz+CeAKg6x6B
	KItmRgfO3zxmusSKC9noUReEAXvwa+WK6yGwAAPiF5RD4VoMG848fsBgUtK12PfDHIGj
	T1rkJlucuVY/Ve2OtaCsG1AdG+rCKTX1+WMydDBsA25L5JTrHxE+zlAlZFRLkjVhVpDV
	9WqOwvbm81fTEUitEHy8kchnvQmfd1ucYffZR0yiuUdcPH0TfjD8B5Sud5vo22zCx8DG
	PmVF1kYxES/Rr/wfcf5Uef6Dh/v2cv9U/0AhGbnnVGBnPOW9sn7Ef8R1sbEOsjcG2jB/
	NPpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=pw45CV8pxnAnfRE9KXEqnyQhozka4Eqfq6ObdWYoPkk=;
	b=YL8iC4ISVQX6BG28cSea/hUovrRd1gLl51qCg2BpOLJmkLikvQ13WO6aT21PiwPdkR
	nzm2FD2MMdLLFptUpn0aV27v5pJ0sRq7mpo2/21VfCHQD5v8HHUicFPc02mgHQxwcKbx
	eVuWl1K5/ShEIrJcD/5kwSC/fH7J0ZsB+STef7o/49rt5NvB7laTo1aqvEyO5VRySpPV
	DgH3uimb6/ZxbvfC5VAxD3C8s9WKVF4amYlRK7ucay9pSKB3oU0gfA4dmvoTxuwNNNex
	8g4BvEpT261KhKv6BSR8hHo4Pqp9hm4R+nJmbdP4VOHPo6iGfdeG5sTZbXxF5f5QuuDk
	HJ+A==
X-Gm-Message-State: APjAAAX8RdjZIBa16/HeSpX6igUIvucu+dNHH53xrSZkKr2QqptC5ehL
	PZvHvfmBSrGjYg2G+oAYU3Xkr9Cv
X-Google-Smtp-Source: APXvYqzIGfJxoQzjB9L7TgGNx5hoFD5J3DEW61X4uQ9QyRDP1CYLto4/si/hX/QECLv3PlbFHShnVQ==
X-Received: by 2002:a63:5f42:: with SMTP id t63mr78093565pgb.275.1558403014289;
	Mon, 20 May 2019 18:43:34 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:c33:503:adbf:6ea3:61d2])
	by smtp.gmail.com with ESMTPSA id
	q5sm23079547pfb.51.2019.05.20.18.43.33
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 20 May 2019 18:43:33 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 20 May 2019 18:43:16 -0700
Message-Id: <c973c049a60c6557c25dc168db6bde82a4a04712.1558402534.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1558402534.git.akuster808@gmail.com>
References: <cover.1558402534.git.akuster808@gmail.com>
Subject: [PATCH 14/15] core-image-sato-sdk-ptest: Tweak size to stay within 4GB limit
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
X-List-Received-Date: Tue, 21 May 2019 01:43:33 -0000

From: Richard Purdie <richard.purdie@linuxfoundation.org>

Adding the valgrind debug symbol information caused the genericx86-64 image to
overflow the 4GB boundary. Tweak the sizes to avoid autobuilder failures yet
leave enough space all the tests still run successfully.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/recipes-sato/images/core-image-sato-sdk-ptest.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-sato/images/core-image-sato-sdk-ptest.bb b/meta/recipes-sato/images/core-image-sato-sdk-ptest.bb
index 5739599..22df057 100644
--- a/meta/recipes-sato/images/core-image-sato-sdk-ptest.bb
+++ b/meta/recipes-sato/images/core-image-sato-sdk-ptest.bb
@@ -6,10 +6,10 @@ IMAGE_FEATURES += "ptest-pkgs"
 
 # This image is sufficiently large (~1.8GB) that we need to be careful that it fits in a live
 # image (which has a 4GB limit), so nullify the overhead factor (1.3x out of the
-# box) and explicitly add just 1300MB.
+# box) and explicitly add just 1200MB.
 # strace-ptest in particular needs more than 500MB
 IMAGE_OVERHEAD_FACTOR = "1.0"
-IMAGE_ROOTFS_EXTRA_SPACE = "1324288"
+IMAGE_ROOTFS_EXTRA_SPACE = "1224288"
 
 # ptests need more memory than standard to avoid the OOM killer
 QB_MEM = "-m 1024"
-- 
2.7.4


