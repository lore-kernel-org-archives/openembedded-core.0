Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f66.google.com (mail-pg0-f66.google.com [74.125.83.66])
	by mail.openembedded.org (Postfix) with ESMTP id 6E59577CE0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Jul 2017 02:51:05 +0000 (UTC)
Received: by mail-pg0-f66.google.com with SMTP id v190so5090654pgv.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Jul 2017 19:51:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=YfYhKP0LZNP68brmeibCSfQHUV3zcNwLDiyWTnb9IpA=;
	b=JPypAYsCp7l6lpEDF9nMymahmm/AxrfF2mYjIcijoByyXDNLwfv4ocVogxOMyjvYc+
	teS8kahjjfLlHTylrX2BLr0ydhWdhgrjRxK4IGcsD5QXTMKL+PrfLiF+SrqVA/pzbjYs
	Ai2KV+8sdmX0BjZlufNK/G+swbKZBfSC07i4Q6n52rHmJuitYa39bKln/NlWXpFtIZD7
	+l3vYOuZY/NbI2MPNVshxLPJXbTeYzpZl2K6U9goKlOn5puzOJKTNJXtUq9R/Usykd7D
	lg/lB9VLdmDHQKMGQaRuXZe4RW8m+u040r0/GmElNQ7MPIyfzIaGBi8gSC22x1j3gNAh
	ZrFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=YfYhKP0LZNP68brmeibCSfQHUV3zcNwLDiyWTnb9IpA=;
	b=jVcct/99R/4gN3Zw7x9ywlQ8hDZq8RVkBsyVWdmZCVorD7YwgPUKOSIhP32ecviV0b
	COHpqIQYwoH4sso9rYknZSBvkplDvYiCT2AOzD4WkeREfbo+/pNS/w1MKeMADVfdPG7D
	NK85K6Ckbf06uMgobvn4ok3Sir7Brry+3HL9U0231EGgUsd0WtOYf7HccVZaUXg6xrY9
	9t1T/5lBOT5qBY0iD2GDWoEmWXSruvLAbrvZySnD+Xecg5d5nMEM0Jhct5RQqIAU+GzT
	D0WIeUkQBLwywHglBqpbfn0D5eVu/OqDTgc8xQZcGJHmRsyYSelQsKEGg9b3AtKa/FOU
	I1fQ==
X-Gm-Message-State: AIVw113RrJxRbfEjEx1nfPnp1cXtnel8q7yKM03575+HiDM2MIHpqToI
	gcv8w/BKihybo59L
X-Received: by 10.84.132.13 with SMTP id 13mr839406ple.42.1500432666597;
	Tue, 18 Jul 2017 19:51:06 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8882:b8c:6245:cbff:fe64:591])
	by smtp.gmail.com with ESMTPSA id
	w87sm7726077pfk.100.2017.07.18.19.51.05
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 18 Jul 2017 19:51:05 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 18 Jul 2017 19:50:55 -0700
Message-Id: <20170719025055.34644-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.13.3
In-Reply-To: <20170719025055.34644-1-raj.khem@gmail.com>
References: <20170719025055.34644-1-raj.khem@gmail.com>
Subject: [PATCH 2/2] mkelfimage: Fix build on x86_64 with hardening
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
X-List-Received-Date: Wed, 19 Jul 2017 02:51:05 -0000

We get linking errors on some hosts like
| ld -static --warn-multiple-gp --warn-common -T linux-i386/convert.lds -o objdir/linux-i386/convert ob
jdir/linux-i386/head.o objdir/linux-i386/convert_params.o
| objdir/linux-i386/convert_params.o: In function `printf':
| convert_params.c:(.text+0x1fd): undefined reference to `__stack_chk_fail_local'

This is because the build system is defaulting to host linker when building
32bit binaries and it may not have same defaults as OE toolchain and issue
gets highlighted.

fix it by using cross linker for 32bit links when building on x86_64

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-devtools/mkelfimage/mkelfimage_git.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-devtools/mkelfimage/mkelfimage_git.bb b/meta/recipes-devtools/mkelfimage/mkelfimage_git.bb
index 2bcc8d7bd9..2ad4b49ab1 100644
--- a/meta/recipes-devtools/mkelfimage/mkelfimage_git.bb
+++ b/meta/recipes-devtools/mkelfimage/mkelfimage_git.bb
@@ -29,6 +29,7 @@ CACHED_CONFIGUREVARS += "\
     HOST_CFLAGS='${BUILD_CFLAGS}' \
     HOST_CPPFLAGS='${BUILD_CPPFLAGS}' \
 "
+EXTRA_OECONF_append_x86-64 = " --with-i386=${HOST_SYS}"
 
 inherit autotools-brokensep
 
-- 
2.13.3


