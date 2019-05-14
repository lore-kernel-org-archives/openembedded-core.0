Return-Path: <akuster808@gmail.com>
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com
	[209.85.214.178])
	by mail.openembedded.org (Postfix) with ESMTP id CE81E6C216
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 May 2019 04:54:09 +0000 (UTC)
Received: by mail-pl1-f178.google.com with SMTP id g69so199198plb.7
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 May 2019 21:54:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=n8OEwc3HA/kI8yYqNROmKVS9UXVyVVNxNEznZXTPAgw=;
	b=dfBayTfQWjBN6xsIlhlLHKFjm3h3KkbjR+kbzfOjLq+R0Dv5254/HALBl8BgFHVlVE
	HOXWyb8yaVsFj8JppBffNoAjxCoLXjBs9AdfEVgYVce/JJyhzM/jT0XqHnb9kPmsPc1c
	cqXArXl/O0rpWUlcnHnK8ILGzb33LowBBBq2BSpXESRkmQ3yJ5IpLzvNGdhov7hK5BWt
	3cUIHzjcQKieqJQzYSd55ZyR/eQ4GxA41kVX1OnezuYyq00sBX0jY6JMyd0kLsib5zT7
	pPnFKwrxFrzg4sZLu9oSsI5WfsWJhUBzjuVl+lrS8pvu6cOcDbymIRVMwN7R8p4qmeXj
	MK7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=n8OEwc3HA/kI8yYqNROmKVS9UXVyVVNxNEznZXTPAgw=;
	b=VDaV/CVbL8HpSjh+5zZzHhcmYtgf4Dr7yQlqCALeAKMGv375P6dQLwaiVy4qpVzyR7
	jbrRY5WOsZjNUDOvrgfj6i5O5zCkzJQj37uVfibeA94MmsCm8Lgv8i8PZXOlO2bSPAmy
	po8OrQ/HhLf8pX0xqX7hktqJcmREuhuc3loBJSmaaSsFptg/5D/R9r8F3PttaNKpLPAe
	mvJfSQtm2A7+LEo6xATr3YEDSuLczCWZkCCF12MFtaglTABEtHLNAiqjqZqYqQWfVLIl
	rXrMPM2Dc7s6KvRKzPoLgvDD2m4VZilBKDTDYKGulnjfg2HORZ500AOsStzDvPXsy2uw
	IM4Q==
X-Gm-Message-State: APjAAAX9HkPKBcVL/lRaaDcktM94koaGQI2Zy2qx1pixFg03mcb2x2HS
	pREddrFRL47aEmjc0nVDIfvSgpsH
X-Google-Smtp-Source: APXvYqwEeoQEz93A8EZT1PBUs3S0U9/sjZrLwGpy2ZPTT59hNp+V4aK2U96g3+oszPKEvDzMpBaJxQ==
X-Received: by 2002:a17:902:2bca:: with SMTP id
	l68mr34136129plb.301.1557809650792; 
	Mon, 13 May 2019 21:54:10 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:c33:d909:eb3d:d2ab:fd1d])
	by smtp.gmail.com with ESMTPSA id
	q75sm5698451pfa.175.2019.05.13.21.54.10
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 13 May 2019 21:54:10 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 13 May 2019 21:53:43 -0700
Message-Id: <cccf000f07eb8b60874c66c60a47c46d546e5ca0.1557809500.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1557809500.git.akuster808@gmail.com>
References: <cover.1557809500.git.akuster808@gmail.com>
Subject: [PATCH 01/23] nettle: fix the Segmentation fault
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
X-List-Received-Date: Tue, 14 May 2019 04:54:09 -0000

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


