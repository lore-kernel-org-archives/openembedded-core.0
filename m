Return-Path: <max.oss.09@gmail.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id A558677BC8
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Mar 2017 15:07:43 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id x124so1126978wmf.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Mar 2017 08:07:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=ZrCacVfTvcCwu2bBB9zrX9n9DmeaboBObacAPNf21ZQ=;
	b=cRhv90HjI8WmAUAO/SsWIbAOSP+xO0MncYdtcp6TUJh2vWE3S7AR1FdqPeMa6aZ2wp
	2xmhQPAlGOJ04c85gO5BTTqAikohOa6vYPQJGS/NtU39xly3d1bYEOx57336LJQ70CAW
	Qwl05XuPOFz7xm3qnK0UDF6aFyKNKUlG6+2gvY8+VOG1AX7S3naEO8hK1Dr8uILfXTJ7
	dK3q35NOXNqP8kyh8QilQzu8InczKFye5PEg/1qiHl8Ov0+rkZMio1ilF+/sIlDOeR69
	WTUl+nr7dPBziHp2dfCKVGJNExHTD7G/0U44eClw7Q/VBk9Q8t6WFvLrQKe+pIywaBWJ
	ZXQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=ZrCacVfTvcCwu2bBB9zrX9n9DmeaboBObacAPNf21ZQ=;
	b=DnGllTJacOlqAg2xINkPb9NYNgAPukBImadjsFOAwEhe+Vmm18/3oE3d/bnlVjawrS
	F48aazn7gumJwsWpVp+dBykgLFRFC4X2/vp43Ava5L2zufBE6f6l9f/T/dJtMHVS4HRB
	5vVnb+xuYWecZQAgBJJQrG7g7KLW8E7QDC08BBxzeU/NzpknsrSpXAyShs+IBI3NJcp1
	iLalFPerS5+vFLQnO6FgvB/w3wKaBWpGR+BzlSOjxZk1u+iulN/NzpB3OX4uRM5D/5dG
	HVqHA81OjSj++GtrAFsB5JNgjtfSWMWkoul4NT3iEPFCorLnHQMDR2IRJrsyu+2z8PDe
	ipIg==
X-Gm-Message-State: AFeK/H0REeFICnS4sAoakPsRX0ji4toNj5SwQu5BXvJd0V1hMRNMVoOa0W86Vsqyk9QrYQ==
X-Received: by 10.28.84.18 with SMTP id i18mr3728818wmb.12.1490367739248;
	Fri, 24 Mar 2017 08:02:19 -0700 (PDT)
Received: from Saturn.local.all ([194.191.225.83])
	by smtp.gmail.com with ESMTPSA id
	h187sm2745332wma.32.2017.03.24.08.02.18
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 24 Mar 2017 08:02:18 -0700 (PDT)
From: Max Krummenacher <max.oss.09@gmail.com>
X-Google-Original-From: Max Krummenacher <max.krummenacher@toradex.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 24 Mar 2017 16:01:14 +0100
Message-Id: <1490367674-24329-1-git-send-email-max.krummenacher@toradex.com>
X-Mailer: git-send-email 2.6.6
Cc: Max Krummenacher <max.krummenacher@toradex.com>
Subject: [PATCH] openssl: Fix regression when building for thumb2
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
X-List-Received-Date: Fri, 24 Mar 2017 15:07:46 -0000

Commit 'c8da8ce openssl: Fix build with clang' introduced a regression.
do_compile fails when building with gcc/thumb2.

Note that I did not test if it still builds with clang.

Prevents the following when building with thumb2:

| ghash-armv4.S: Assembler messages:
| ghash-armv4.S:88: Error: thumb conditional instruction should be in IT block -- `ldrplb r12,[r2,r3]'
| ghash-armv4.S:98: conditional infixes are deprecated in unified syntax
| ghash-armv4.S:98: Error: thumb conditional instruction should be in IT block -- `ldrplb r8,[r0,r3]'
| ghash-armv4.S:105: Error: thumb conditional instruction should be in IT block -- `eorpl r12,r12,r8'
| ghash-armv4.S:107: Error: thumb conditional instruction should be in IT block -- `andpl r14,r12,#0xf0'
| ghash-armv4.S:108: Error: thumb conditional instruction should be in IT block -- `andpl r12,r12,#0x0f'
| ghash-armv4.S:144: conditional infixes are deprecated in unified syntax
| ghash-armv4.S:144: Error: thumb conditional instruction should be in IT block -- `ldrneb r12,[r2,#15]'
| ghash-armv4.S:231: conditional infixes are deprecated in unified syntax
| ghash-armv4.S:231: Error: thumb conditional instruction should be in IT block -- `ldrplb r12,[r0,r3]'
| ghash-armv4.S:248: Error: thumb conditional instruction should be in IT block -- `andpl r14,r12,#0xf0'
| ghash-armv4.S:249: Error: thumb conditional instruction should be in IT block -- `andpl r12,r12,#0x0f'

Signed-off-by: Max Krummenacher <max.krummenacher@toradex.com>
---
 .../0001-Fix-build-with-clang-using-external-assembler.patch        | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/meta/recipes-connectivity/openssl/openssl/0001-Fix-build-with-clang-using-external-assembler.patch b/meta/recipes-connectivity/openssl/openssl/0001-Fix-build-with-clang-using-external-assembler.patch
index 47b83a5..2270962 100644
--- a/meta/recipes-connectivity/openssl/openssl/0001-Fix-build-with-clang-using-external-assembler.patch
+++ b/meta/recipes-connectivity/openssl/openssl/0001-Fix-build-with-clang-using-external-assembler.patch
@@ -29,18 +29,14 @@ diff --git a/crypto/modes/asm/ghash-armv4.pl b/crypto/modes/asm/ghash-armv4.pl
 index 8ccc963ef..442fed4da 100644
 --- a/crypto/modes/asm/ghash-armv4.pl
 +++ b/crypto/modes/asm/ghash-armv4.pl
-@@ -124,7 +124,14 @@ $code=<<___;
+@@ -124,7 +124,10 @@ $code=<<___;
  #include "arm_arch.h"
  
  .text
 +#if defined(__thumb2__) || defined(__clang__)
 +.syntax	unified
 +#endif
-+#if defined(__thumb2__)
-+.thumb
-+#else
  .code	32
-+#endif
  
  #ifdef __clang__
  #define ldrplb	ldrbpl
-- 
2.6.6


