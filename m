Return-Path: <armccurdy@gmail.com>
Received: from mail-pl0-f48.google.com (mail-pl0-f48.google.com
	[209.85.160.48])
	by mail.openembedded.org (Postfix) with ESMTP id E263B792B2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Aug 2018 04:43:43 +0000 (UTC)
Received: by mail-pl0-f48.google.com with SMTP id w14-v6so3134815plp.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Aug 2018 21:43:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=31IrPAeP2ZDvprgF1W8oTUzP1gbYROE2iRXA8ZFJ63U=;
	b=UpcyrzW7cXgVft4/g0rETtK6XP8Kyb1gZ6XolGLUd6VyVCYZRuKXuBGeVW2XjR0Zt6
	xVty0ZOmTDSYcxQ2wmujAo5/tvzttK4Iodsh2jy5pB/Giz8vwjsTuAdc+4um2UpYFFWr
	Cnji+uwmlYQZhq/knaHZR+lfmJn+WDA8e6km9wWsL/Vhseb2fTQ288WRTB/rOMjLEKlu
	efWsrPAlxWPExdq3nnz+1VHeZr7+bWpMmnKNqIScOvF3ZOBOJRVH4d1jGlAeAsnWhcFS
	zHl23vrsCuJhEVt94dR5G5dX07VN99V7uNOWGxTeBsY3Neymik3eQ872CVWH1RVAu4KV
	vvRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=31IrPAeP2ZDvprgF1W8oTUzP1gbYROE2iRXA8ZFJ63U=;
	b=BKwTQTKv0u1qeFe/M/E3w0Zq8+R868UkWuYl5jgXVSpmENVRuvtMw8aqI0vCKtz0ri
	jWBxf1+3VEGw5py8dLiJICOqMGEVy7dV0kebyN7Qady67JVHDsrLXHlOECDTBzRVz+1F
	AdrDTCXqKi9eT9BOTR6utPZMqQpZImj4xlPu0Fvx0BYzb5gLyRaBStv9kllCDJ0xYUvx
	vgsP53/ieOh50qneKbdvtoMcgNkV3DF76567jkJ4yQlUSoJr2hSfEv1Y7Hlo2ayXgRo0
	7NHplAidacdHDsNh3U9q+aHsPYZRWYTMClIOt2vdy4w+TGGjVxD1wI9C+BejBfHynDtE
	QISQ==
X-Gm-Message-State: AOUpUlFzg0XcwCRfKu1VlvB6CSfg52i2cDZUdUCn1GgvMB4dAu4kciek
	+EpYMfHaQiCe2DHXO9LnKxb02ffk
X-Google-Smtp-Source: AA+uWPwPYdeBj1gFexI/2C23nfsqmBdVGN2YJIdRAQYnc45DPGP2DU2aSTt1kQHkVfGE2jLjcXVu8Q==
X-Received: by 2002:a17:902:d710:: with SMTP id
	w16-v6mr31797152ply.93.1534481024948; 
	Thu, 16 Aug 2018 21:43:44 -0700 (PDT)
Received: from e6520.guest-wifi.scl.liberty.com ([4.16.80.121])
	by smtp.gmail.com with ESMTPSA id
	r64-v6sm1157526pfk.157.2018.08.16.21.43.44
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 16 Aug 2018 21:43:44 -0700 (PDT)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 16 Aug 2018 21:43:32 -0700
Message-Id: <1534481017-17310-2-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1534481017-17310-1-git-send-email-armccurdy@gmail.com>
References: <1534481017-17310-1-git-send-email-armccurdy@gmail.com>
Subject: [PATCH 2/7] openssl: update 32bit x86 target from linux-elf -> linux-x86
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
X-List-Received-Date: Fri, 17 Aug 2018 04:43:44 -0000

According to comments in Configurations/10-main.conf, the linux-elf
target is "... to be used on older Linux machines where gcc doesn't
understand -m32 and -m64".

The linux-x86 target appears to be the newer replacement (currently
the only difference between the two is that linux-x86 adds -m32 to
cflags).

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 meta/recipes-connectivity/openssl/openssl_1.1.0i.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-connectivity/openssl/openssl_1.1.0i.bb b/meta/recipes-connectivity/openssl/openssl_1.1.0i.bb
index 8a8d928..ab0d264 100644
--- a/meta/recipes-connectivity/openssl/openssl_1.1.0i.bb
+++ b/meta/recipes-connectivity/openssl/openssl_1.1.0i.bb
@@ -58,7 +58,7 @@ do_configure () {
 		target=linux-aarch64
 		;;
 	linux-i?86 | linux-viac3)
-		target=linux-elf
+		target=linux-x86
 		;;
 	linux-gnux32-x86_64 | linux-muslx32-x86_64 )
 		target=linux-x32
-- 
1.9.1


