Return-Path: <akuster808@gmail.com>
Received: from mail-pf1-f196.google.com (mail-pf1-f196.google.com
	[209.85.210.196])
	by mail.openembedded.org (Postfix) with ESMTP id 1B1127F331
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Sep 2019 04:48:38 +0000 (UTC)
Received: by mail-pf1-f196.google.com with SMTP id q12so4854956pff.9
	for <openembedded-core@lists.openembedded.org>;
	Sun, 29 Sep 2019 21:48:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=dNU4cD0SREI49TumNuxBvcYYG2q3bEhovr/fQqlivAc=;
	b=cI4+VXvpwQ0pAyuOzpdL7KTW0YoxyzI6PWmDUrcW2bC5MjWxnh4+7jYGaSmZRbjSok
	vlC8/rH9l0axm1QerOUS0W7r7Yn/7LztUCfxK56bmmMDaz5azgA0vMw7lvm2q/TOfGJm
	H60ONSAWAVYAV+LDOO/iUhK3fBkZaYSAB1t1iFSNoYh1ga1m/3AWUiGA6x8Ju3Dgb7v3
	SaR1z0UpzkqhanB+P+yskmyWC/mYCe4b+4vyQcYvaK6Rshz/SKaHe4evA8CYUrEO6OjK
	6KVNM1dUcXzGuDoATJLvAyxOaRX8TH1AsTPNh0nmdeD0cDNmLA7NCFs4tBoQwaNOuzrY
	T0Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=dNU4cD0SREI49TumNuxBvcYYG2q3bEhovr/fQqlivAc=;
	b=eYrdVeyjzmS4PbI/Y89LihbSjI25gbXVs8W7VdS44bvtFbpqPc21rS0agsgHK0pOc2
	0v+LXzdUqrkbmaQNkB0rTkhf3NTebgxXHWbE4kkUqpGnTzPAcYgOzjc7PKivUm1a/2Wo
	ajZ4mQr7J6ONm2oLcM2wNWRL6y8XXFtsY1/AziWQJHy3PCVGNxuNY5E1dLQf/bFuAbLS
	b6orW6Y6chEEEKvszZmqBHVwB3sFKxQbZlpxSn922fPzSk1osGDkQlhHVXqGSATg3ULy
	zh2cGu8CRBbnwVefzeHF+FKLl4jr4H9hmoKsoSoCTY9QRp4wCnuqo4fhyP0VKXhNdwnA
	YmvA==
X-Gm-Message-State: APjAAAVoUssXqIzXB7XYNp6XU29I15w3EegkojaBaCZUPEkpzbH741kt
	5x6y+OfJZZQ13J9e+FwtPLfXW3/ikwk=
X-Google-Smtp-Source: APXvYqwN8BGpCLvgx0scMPuJIjrpCwKuO2LTOTYSqxYMkRu4QwMVXMII/Kpcu/YlIGe4fvzbqWIagQ==
X-Received: by 2002:a17:90a:33e7:: with SMTP id
	n94mr25206741pjb.15.1569818919869; 
	Sun, 29 Sep 2019 21:48:39 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4180:a5c0:edf9:811d:ad92:85c2])
	by smtp.gmail.com with ESMTPSA id
	h15sm18888493pgn.76.2019.09.29.21.48.38
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 29 Sep 2019 21:48:39 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 29 Sep 2019 21:47:40 -0700
Message-Id: <9a271cf62d7fc7f2f15c3287831383c2cb3b5dd5.1569818533.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1569818533.git.akuster808@gmail.com>
References: <cover.1569818533.git.akuster808@gmail.com>
Subject: [warrior-next 45/54] libxcrypt: Fix the build with -Os
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
X-List-Received-Date: Mon, 30 Sep 2019 04:48:39 -0000

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


