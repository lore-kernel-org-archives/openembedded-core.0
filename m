Return-Path: <akuster808@gmail.com>
Received: from mail-pl1-f194.google.com (mail-pl1-f194.google.com
	[209.85.214.194])
	by mail.openembedded.org (Postfix) with ESMTP id 77CEB7E5FA
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 Sep 2019 02:50:18 +0000 (UTC)
Received: by mail-pl1-f194.google.com with SMTP id f19so282507plr.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Sep 2019 19:50:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=dNU4cD0SREI49TumNuxBvcYYG2q3bEhovr/fQqlivAc=;
	b=RWbjcz0dzxbjwnEGC2Lvk0b8VR41gahnHXr2n272Ku5otouFXBc5K6+z99SXvG8bMJ
	tpzeK3QuX1uxElsqdTTBx3F1c6ch+fbs0f7/LfzDGKc0iWN+7LksmuT8wyThwzq1MNRx
	ZCT9GmMggl9yTHqdG6iBRHmsdcpDtD2mh76DNALncdvZxYzIpscpWOnLEfRm7kpwWUU8
	dL8ps7nctRWj6NFsjmMl15LWDAqpHvZUx4/lA34JjTihPF5i/AWHmH6N87E0ZRbv3Fj/
	pciU/93FKVcKBU8m3bQkyPimhsaju7X2Xa+NNG1B9vhDvSY0M8RlRm9XYVZi2QznmlGb
	cKNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=dNU4cD0SREI49TumNuxBvcYYG2q3bEhovr/fQqlivAc=;
	b=kRSqSkEjCJyTWQAkMjZovL/kF3myUAe+yhUHf/v2RYLRWQOyxvqR6/k+MNNvDB+D0W
	pLrbaYewd01nwy/ewDaNWQd73VoXhRbhZxq+KdYYoujciYo43E4Fjz0h2zhYgeUOuhej
	B86iDqmnBBjzqvcqA6/x2OdOzioRl4z0ygrJeNWilYJ5/ecl3qnA2rfY2Lkidhupmr4k
	D7Gxj4ye612Weo3QeCuVJSAWzs1M46UdTZtv+gadlYkz8nwzuLy8aNchX58SgF/SNWFH
	Q8TQP8fQ8N6T1kfUS5Vywy4PxPQiv5Gf3RORDnyOsbiBlUjUYnaPJ47CbAquao1YjpKF
	c/qA==
X-Gm-Message-State: APjAAAUkJ1uHzN2gxA69Y0Osa8GofPwshw++aNzHKDYJKP7E/90m13cq
	UYERk77+OZy9/tKthL8PIsSfPYr9zMY=
X-Google-Smtp-Source: APXvYqx2OREBStsNdAW/3HY2aN6KcbY65kf56slQvcCVJqH2uKrsrHCIKUuL/r3Kp3KZ23jUzC2vuQ==
X-Received: by 2002:a17:902:850a:: with SMTP id
	bj10mr500020plb.254.1569293419493; 
	Mon, 23 Sep 2019 19:50:19 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:a5c0:ec07:55c0:9c8c:b3de])
	by smtp.gmail.com with ESMTPSA id
	q204sm146791pfc.11.2019.09.23.19.50.18
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 23 Sep 2019 19:50:19 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 23 Sep 2019 19:49:26 -0700
Message-Id: <943211094e49fd42056b0838e8ac98656645a484.1569292053.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1569292053.git.akuster808@gmail.com>
References: <cover.1569292053.git.akuster808@gmail.com>
Subject: [warrior][ 46/50] libxcrypt: Fix the build with -Os
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
X-List-Received-Date: Tue, 24 Sep 2019 02:50:18 -0000

From: Adrian Bunk <bunk@stusta.de>

| In file included from ../git/lib/alg-des.c:66:
| ../git/lib/alg-des.c: In function '_crypt_des_set_key':
| ../git/lib/byteorder.h:24:1: error: inlining failed in call to 'be32_to_cpu': call is unlikely and code size would grow [-Werror=inline]
|  be32_to_cpu (const unsigned char *buf)
|  ^~~~~~~~~~~
| ../git/lib/alg-des.c:81:13: note: called from here
|    rawkey1 = be32_to_cpu (&key[4]);
|              ^~~~~~~~~~~~~~~~~~~~~

Signed-off-by: Adrian Bunk <bunk@stusta.de>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/recipes-core/libxcrypt/libxcrypt.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/libxcrypt/libxcrypt.bb b/meta/recipes-core/libxcrypt/libxcrypt.bb
index 3b9af6d..a712e72 100644
--- a/meta/recipes-core/libxcrypt/libxcrypt.bb
+++ b/meta/recipes-core/libxcrypt/libxcrypt.bb
@@ -24,7 +24,7 @@ FILES_${PN} = "${libdir}/libcrypt*.so.* ${libdir}/libcrypt-*.so ${libdir}/libowc
 S = "${WORKDIR}/git"
 
 BUILD_CPPFLAGS = "-I${STAGING_INCDIR_NATIVE} -std=gnu99"
-TARGET_CPPFLAGS = "-I${STAGING_DIR_TARGET}${includedir} -Wno-error=missing-attributes"
-CPPFLAGS_append_class-nativesdk = " -Wno-error=missing-attributes"
+TARGET_CPPFLAGS = "-I${STAGING_DIR_TARGET}${includedir} -Wno-error"
+CPPFLAGS_append_class-nativesdk = " -Wno-error"
 
 BBCLASSEXTEND = "nativesdk"
-- 
2.7.4


