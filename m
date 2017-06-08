Return-Path: <net147@gmail.com>
Received: from mail-pg0-f66.google.com (mail-pg0-f66.google.com [74.125.83.66])
	by mail.openembedded.org (Postfix) with ESMTP id E9268781CD
	for <openembedded-core@lists.openembedded.org>;
	Thu,  8 Jun 2017 11:07:11 +0000 (UTC)
Received: by mail-pg0-f66.google.com with SMTP id v18so4256268pgb.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 08 Jun 2017 04:07:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=mp8vqRRdeCxPqNwapB8JSUdYJTjjs7C8sHWcAPrF7pA=;
	b=dEltsjs2FbkVwbuHsDBzYZQgL+HhETSS8/dhde8AWKCZAsaDXky4oVEVVJ2O3bhGam
	Hm3hLt4U1UB7nBRBSjUHS3iCMseCrdu2S4C0HDbJmUMtSx6A9CVLMM6+u6C91hJFcMij
	qap/YzVQQph9UvYIlqh1q485fOO0S3nTW8ZAAOSVTnHz7qbe/ZiBIGKpcGiinTtVJ/ef
	68z8BLSRO3z78+8loCvpcipr3qQSVEnd5+hNAaKmCsnKe9FFWpnupQA0qr7xQvug1jhZ
	2ygOX/rFkP7zdPcyUvYWxV864SdHRV8yef2cxlPB1dCyP2dEwZfjvEJbRZ3jYmSTpW/c
	A4ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=mp8vqRRdeCxPqNwapB8JSUdYJTjjs7C8sHWcAPrF7pA=;
	b=jeOfwRp0lmuGDd7MKftNOLzDj2sTkAUfH0JOqWTMOc/T4h+uiGLQm+yeY77aG6SVuT
	1MwDxb4dDIjfKCgbjzzrWOOA6uy7fJH03vkDrVqsfCBtvQx9Wh8CvOCY6iNyPtDfg3cW
	zPw2JvtGj3GVkf79bBi3P2JuCd6yfmbwlO7buryxJFx7cB0oDxFJNcZEX0ksTU+Hu0Da
	DfAdjTvqHXca1Vg8psRl6qdlHosKxSZ4onw8rQSZGwMdcLd7UiwOkYqLLRMVI/VPhKyg
	R9Yd5UwDS6zwdfUO+1QlVHouNiM1FS7RpJ5eee3kHjFQVRe2UVZzp8Eb393SB0fhL+q7
	Jjmg==
X-Gm-Message-State: AODbwcCLKZ5SQfqH3sdfCiQ3VKNauraIhxSqFC0SLEevBtZdyt5XFIJi
	w/6emLPF7JyOHA==
X-Received: by 10.98.28.74 with SMTP id c71mr11317430pfc.154.1496920032877;
	Thu, 08 Jun 2017 04:07:12 -0700 (PDT)
Received: from 60-242-179-244.static.tpgi.com.au
	(60-242-179-244.static.tpgi.com.au. [60.242.179.244])
	by smtp.gmail.com with ESMTPSA id
	t198sm8541589pgc.33.2017.06.08.04.07.11
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 08 Jun 2017 04:07:12 -0700 (PDT)
From: Jonathan Liu <net147@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  8 Jun 2017 21:07:54 +1000
Message-Id: <20170608110754.32445-1-net147@gmail.com>
X-Mailer: git-send-email 2.12.2
Subject: [master][pyro][PATCH] image-vm: Avoid use of fold, tac and paste commands for DISK_SIGNATURE
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
X-List-Received-Date: Thu, 08 Jun 2017 11:07:12 -0000

These commands are not whitelisted by the HOSTTOOLS variable which
silently prevents the MBR disk signature from being written to the
image.

Reported-by: Michael Davis <michael.davis@essvote.com>
Signed-off-by: Jonathan Liu <net147@gmail.com>
---
 meta/classes/image-vm.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/image-vm.bbclass b/meta/classes/image-vm.bbclass
index 35c9244e9b..98bd92000e 100644
--- a/meta/classes/image-vm.bbclass
+++ b/meta/classes/image-vm.bbclass
@@ -93,7 +93,7 @@ build_boot_dd() {
 
 	parted $IMAGE print
 
-	awk "BEGIN { printf \"$(echo ${DISK_SIGNATURE} | fold -w 2 | tac | paste -sd '' | sed 's/\(..\)/\\x&/g')\" }" | \
+	awk "BEGIN { printf \"$(echo ${DISK_SIGNATURE} | sed 's/\(..\)\(..\)\(..\)\(..\)/\\x\4\\x\3\\x\2\\x\1/')\" }" | \
 		dd of=$IMAGE bs=1 seek=440 conv=notrunc
 
 	OFFSET=`expr $END2 / 512`
-- 
2.12.2


