Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 7A5AD7C434
	for <openembedded-core@lists.openembedded.org>;
	Sun,  5 May 2019 19:24:52 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 44xwmT0FrYz4D
	for <openembedded-core@lists.openembedded.org>;
	Sun,  5 May 2019 21:24:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1557084292;
	bh=rKSSNKWoIBFlksA96zmZ072ws73uLuG7hSkARchPC7I=;
	h=From:To:Subject:Date:From;
	b=k/TYE6NlI0xVDLeKFGJ0vOwNhNul8kBoaSsyurHLLA+G0Sx6wYhzY6VH3CEcG63bu
	V4VEDBkwR9flwp0Y3+JSjFHlRMTAP2CKuhNVFqUBF4whpHYtVD59hgfdtQKKDhaBi0
	yJR2KCTcmciKGv7Hl+me+e1bkCQZjLlOWsHF5wmqj2qRiBNCeTYO9S4D910yP1OxrR
	CmPwrncDjhmHGob0AP5qZ8dn9l2R8JgyS1YDcn52x0kH82ggrZCFPKzcR90Eb1tT3N
	5/dlactCjT6LwvpAeX7SZJ6+6EhgQ3mJhmgW3qwmmBKYvr4DSA7TW+GCdN0AGK7bj4
	nPAM/VmMSmrxykRjC6svEq2nRPh+yPxLs1AKYPxrBCZzzd74YXTHQs2kwaCg3VGti8
	/jVZISd/2wj6zLgCfmdtGk0KYLVFPJkoix0Z+k/AVC1nwpKB9Yxcg0VC04l/CsyLxi
	ZmVEW2lei4kiLE0HovrN2tNE5rd4xjGMTvTSePblcr2gZCJTD1FnPbe/l0dl8Tiylc
	KMD75/YnO9poelsPH9gWtw2hlIz2qAba6WO5cXB1a64JqhMwau+BQ6CkPLCnE7O/dT
	23tcTXsynu6EDJ2jNWRWr0cBiamow4cEKXcNSz9XGYXfbsOWnRFsyVHAFL5sP/CpQg
	Go9Zqd03uezLqQy+vpbuhZjw=
From: Adrian Bunk <bunk@stusta.de>
To: openembedded-core@lists.openembedded.org
Date: Sun,  5 May 2019 22:24:24 +0300
Message-Id: <20190505192424.26245-1-bunk@stusta.de>
X-Mailer: git-send-email 2.17.1
Subject: [warrior][PATCH] nettle: fix the Segmentation fault
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
X-List-Received-Date: Sun, 05 May 2019 19:24:53 -0000

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
---
 meta/recipes-support/nettle/nettle_3.4.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-support/nettle/nettle_3.4.1.bb b/meta/recipes-support/nettle/nettle_3.4.1.bb
index dd49c30c84..8375fcf2df 100644
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
2.17.1


