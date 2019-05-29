Return-Path: <akuster808@gmail.com>
Received: from mail-pg1-f193.google.com (mail-pg1-f193.google.com
	[209.85.215.193])
	by mail.openembedded.org (Postfix) with ESMTP id 4FF9B7E362
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 May 2019 13:50:48 +0000 (UTC)
Received: by mail-pg1-f193.google.com with SMTP id n2so1403428pgp.11
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 May 2019 06:50:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=9oMRnuUufaF8X2ZZWweHWwHqcwhlLq/ZSkS+i6I+Z7g=;
	b=bS+dRxETzZM56i/w3SnkG428af9B0/FuT4izrvETmigdIpwcmscevcL8dpHzs/6E91
	BxflgTxUmoeqkUaqMyaqpKRpsbRcZBsQ+dkuZiSULpaDr8cTVAWZUpvjy+tKFbVEdXRF
	u2bS3WHVNvXkhJhOk06IKqS3hqdPPlVD/4ckZQ5aLIf+FvovBpXDE4uLUmRLIX2uLBxG
	FoakdO6rfw+hcsSDZh08k3QG5QYOdeQ5GGANLBoRiVaxdSFT6Y4tUS39RR88OZVkcCn2
	uajsWRvB6aUqwTrmMjRW8KVXBqA78qszGoJyatmNExjSWm2s93vvYuEgeqhQgG8SQF7A
	VaXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=9oMRnuUufaF8X2ZZWweHWwHqcwhlLq/ZSkS+i6I+Z7g=;
	b=XNd2aweFHZqbDaoWSYfIskVLNlHwn2Sj6HvuhSFRRUO2aHGJujdWWPsd6j56Lpx4K+
	398iYwU7E+qQJRiijfEO2sm3dZDRxBhyi5984w0SY6idq+zp3LQ53l9+isw0qXyoCdEa
	Uoi7ZFqjm8COC5p1BoR+XunrsHgsK9Vtc1edVKQzyGjU8vAS4iG3sJPaUzHuGVPGY0UB
	duQr6Tran+D45Y7UQ7FXK39acGEUhaUZzdLxA/7hgBiBoJsyUR8CKvHZonEfZxjvfoTe
	Ai9rrKLOhhidgYiN79D43pccvhtnVS50wxFQUD+w74aExhj96sGsZRxvKvtJRy581lVd
	eE0A==
X-Gm-Message-State: APjAAAXarX2Ii8Q6CBQBSf7rtgZUCvxn4nKwZdBPXPwoNgdUPq5gwGZS
	6JGKgo44YtrX7N2xCvxQ8NYQHvk3
X-Google-Smtp-Source: APXvYqz+6M9TU4eWPSniOfyGK7lZpduOWdtAdQbb/BHnJU7j4r8ZSJqZD+kHiEAEQLLTSGWA9RypTw==
X-Received: by 2002:a17:90a:db0a:: with SMTP id
	g10mr12447780pjv.43.1559137849252; 
	Wed, 29 May 2019 06:50:49 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4180:c33:4865:9151:ec2:e220])
	by smtp.gmail.com with ESMTPSA id r7sm5976891pjb.8.2019.05.29.06.50.48
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 29 May 2019 06:50:48 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 29 May 2019 06:50:38 -0700
Message-Id: <1559137838-8972-10-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1559137838-8972-1-git-send-email-akuster808@gmail.com>
References: <1559137838-8972-1-git-send-email-akuster808@gmail.com>
Cc: Armin Kuster <akuster@mvista.com>, Adrian Bunk <bunk@stusta.de>
Subject: [thud][PATCH 9/9] nettle: fix the Segmentation fault
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
X-List-Received-Date: Wed, 29 May 2019 13:50:48 -0000

From: Mingli Yu <Mingli.Yu@windriver.com>

The commit[8ac8fa8ee1 nettle: update to 3.4.1]
add CFLAGS_append = " -std=c99" to silence the
below error for native build:
| ../nettle-3.4.1/rsa-sign-tr.c: In function 'sec_equal':
| ../nettle-3.4.1/rsa-sign-tr.c:243:3: error: 'for' loop initial declarations are only allowed in C99 mode
   for (size_t i = 0; i < limbs; i++)
   ^
| ../nettle-3.4.1/rsa-sign-tr.c:243:3: note: use option -std=c99 or -std=gnu99 to compile your code
| Makefile:263: recipe for target 'rsa-sign-tr.o' failed

But the above change will trigger below Segmentation
fault:
 # echo -n passwd| nettle-pbkdf2 -i 1 -l 16 salt
 [65534.886509] nettle-pbkdf2[708]: segfault at 1f594260 ip 00007f3332256998 sp 00007fff60d44410 error 4 in libnettle.so.6.5[7f3332244000+1d00]
 [65534.887525] Code: e8 6d db fe ff 44 01 6d 68 48 83 c4 08 5b 5d 41 5c 41 5d 41 5e 41 5f c3 66 2e 0f 1f 84 00 00 00 00 00 49 89 dc e9 68 ff f
 Segmentation fault

So update the logic to CFLAGS_append = " -std=gnu99"
to fix the issue.

(From OE-Core rev: 91359a91b8c89dc5e1f3a946137204156c47a3af)

Signed-off-by: Mingli Yu <Mingli.Yu@windriver.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Adrian Bunk <bunk@stusta.de>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
Signed-off-by: Armin Kuster <akuster@mvista.com>
---
 meta/recipes-support/nettle/nettle_3.4.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-support/nettle/nettle_3.4.1.bb b/meta/recipes-support/nettle/nettle_3.4.1.bb
index dd49c30..8375fcf 100644
--- a/meta/recipes-support/nettle/nettle_3.4.1.bb
+++ b/meta/recipes-support/nettle/nettle_3.4.1.bb
@@ -30,7 +30,7 @@ inherit autotools ptest multilib_header
 EXTRA_AUTORECONF += "--exclude=aclocal"
 
 EXTRA_OECONF = "--disable-openssl"
-CFLAGS_append = " -std=c99"
+CFLAGS_append = " -std=gnu99"
 
 do_compile_ptest() {
         oe_runmake buildtest
-- 
2.7.4


