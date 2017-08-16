Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f67.google.com (mail-pg0-f67.google.com [74.125.83.67])
	by mail.openembedded.org (Postfix) with ESMTP id 1F10160103
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Aug 2017 21:11:00 +0000 (UTC)
Received: by mail-pg0-f67.google.com with SMTP id y129so6409552pgy.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Aug 2017 14:11:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=wU8ZFLcLjDM5XrFCXXh054yfp5kQSSlNTNdCuN3/sBE=;
	b=HkpFIx+pMMkwQTHyzumfCeK70iM3ZmyxjAcBoSm3HhQGJhjlttz+TUOC/SPr1imrKR
	joBQyDCs2d/1w7uaH6ebQIUAzv/gbhcGHkIMNpAc79rMLjyP+V/+leqLch2J8guhdnkm
	s8jkeq629iB9DmiXjYdIMZkBOVRR6X7THP3PZB9fgq07sJkGqUWvZRZR1cq9BOqALF4u
	ePO2NU6MSTqwzVfZD8CU255lu7iyXJ7m96PzKwNZkg0tH1bhRj80YGxaB3Cak/bEwGsh
	UpvPCtSYvmQdOgKXXK9TkD2FnI3vVxwtsd3VOLh0J+VqJxUhT6PRrQtWIvaq9QzwZ7B7
	kNRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=wU8ZFLcLjDM5XrFCXXh054yfp5kQSSlNTNdCuN3/sBE=;
	b=izlIB1h5UfyN3jrhTuHFyWGriFpqHnTol3iLPunBsmKaAFune5qb1oOeT27oP+y4W0
	8ZZ/3iReFGo1rTatsG0C/MMN9YAQqABxUYjHKKxYduGYBnc2uaoTT5YcXiYacsyKo35S
	odk3siFEQvGPwb2vq7JL0uC4bssWgMJ1eJG+ts7MXTuy3yiz76Hpn5nBjFz0rCjTosZC
	T6bm+QqSv88EyIXIXTkq4LFXVbuK3E9Z6BGc0JJyFhWakmczp3RZCX4OKsaK8Ld8sPls
	PM5Z1TaD0S6YhgDi4X8KNzUswiKwz+1A1gxAXyByA0orOHHyvQ1kEdhxDNKa5tKeWhHW
	y5pw==
X-Gm-Message-State: AHYfb5jx/lhLq/9rNJ6BzrgqsW43YwaSXLZmBx+cQH9iRA9wyiIc9KSv
	gmr4uGdKwn0u3o8w
X-Received: by 10.84.241.6 with SMTP id a6mr3339125pll.178.1502917862079;
	Wed, 16 Aug 2017 14:11:02 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8882:b8c::8319])
	by smtp.gmail.com with ESMTPSA id
	206sm3385682pfc.61.2017.08.16.14.11.00
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 16 Aug 2017 14:11:00 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 16 Aug 2017 14:10:53 -0700
Message-Id: <20170816211053.28935-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.14.1
Subject: [PATCH] mkelfimage: Make -fno-stack-protector effective
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
X-List-Received-Date: Wed, 16 Aug 2017 21:11:01 -0000

mkelfimage uses different flags to compile as freestanding binary
it does not pour CFLAGS into them during configure as a result
-fno-stack-protector was never used. Which failed to build with
compilers configured to build with ssp by default. It worked with
gcc since we do not configure our toolchain to default to ssp

Fixes errors e.g.
| objdir/linux-i386/convert_params.o: In function `convert_params':
| linux-i386/convert_params.c:(.text+0x9f4): undefined reference to `__stack_chk_fail'
| objdir/linux-i386/convert_params.o: In function `compute_checksum':
| linux-i386/convert_params.c:(.text+0xa71): undefined reference to `__stack_chk_fail'
| objdir/linux-i386/convert_params.o: In function `printf':
| linux-i386/convert_params.c:(.text+0xcc7): undefined reference to `__stack_chk_fail'
| make: *** [linux-i386/Makefile:24: objdir/linux-i386/convert] Error 1

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-devtools/mkelfimage/mkelfimage_git.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/mkelfimage/mkelfimage_git.bb b/meta/recipes-devtools/mkelfimage/mkelfimage_git.bb
index 2ad4b49ab1..05a5a1a489 100644
--- a/meta/recipes-devtools/mkelfimage/mkelfimage_git.bb
+++ b/meta/recipes-devtools/mkelfimage/mkelfimage_git.bb
@@ -23,11 +23,12 @@ CLEANBROKEN = "1"
 
 S = "${WORKDIR}/git/util/mkelfImage"
 
-CFLAGS += "-fno-stack-protector"
 CACHED_CONFIGUREVARS += "\
     HOST_CC='${BUILD_CC}' \
     HOST_CFLAGS='${BUILD_CFLAGS}' \
     HOST_CPPFLAGS='${BUILD_CPPFLAGS}' \
+    I386_CFLAGS='-fno-stack-protector' \
+    IA64_CFLAGS='-fno-stack-protector' \
 "
 EXTRA_OECONF_append_x86-64 = " --with-i386=${HOST_SYS}"
 
-- 
2.14.1


