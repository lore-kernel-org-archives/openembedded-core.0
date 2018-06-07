Return-Path: <armccurdy@gmail.com>
Received: from mail-pf0-f193.google.com (mail-pf0-f193.google.com
	[209.85.192.193])
	by mail.openembedded.org (Postfix) with ESMTP id ACC2C755A8
	for <openembedded-core@lists.openembedded.org>;
	Thu,  7 Jun 2018 04:34:44 +0000 (UTC)
Received: by mail-pf0-f193.google.com with SMTP id j20-v6so4220878pff.10
	for <openembedded-core@lists.openembedded.org>;
	Wed, 06 Jun 2018 21:34:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=6SeQ0o0iqTn0M/YZjWpgdz1Q34aDLlrRAsQgGqPffEo=;
	b=TR9jwXizXXglt9UgjtIoFxauinEgrr+hTt9WWD2/ijOty1jlIKxl1fw00N0hM0ruT7
	81ogKyhmK2/Vdi06ZKeobfUQYyhoV/ltX7H0uXE7WQwfxD9uaBIALTu/Q7dAdiapn6+1
	q3Bv3n+ttprYyMxVliRNA2RWMAZOpUfzHLZ3l05YwKOxIG1lZXTnu0QcQqFsbKtGCv3r
	LG3PUaU9ZBS+oNfFbu8YIiD6rYLqHaX4qc8ZMf3hf+cx73SUqXZpJpFQ85vLoDHCOhVv
	9ZZaD024OnkABAPlQMPjGpmfDzEfULN2VsJoaBukSSu3L3gxseqy8Ab2nWsmOy7ngNWy
	PGKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=6SeQ0o0iqTn0M/YZjWpgdz1Q34aDLlrRAsQgGqPffEo=;
	b=js8ckeNyrx4MydzyrKsUXwHomNcKkGgEjGMCX3GuGw/DNlQYjiIpMU99BHQYu5y4CD
	2xsaM+DN4nMw3n+4Z5N1AlDT0B6DQ9iKbt6cAxeSsDK1TIQskDWH18RoBSXU1hxsWl6Q
	GandKbrPOcebg0DzE1r+HuSYDiKtYmUFJO+4hnRdLq16LetBsPsCZoafF1R8p0Pmx85A
	OD7g6YOPvyiLX/6nOQobgPQVw4T6XqXfsvjJNabWGThRbwRqQYcPSiZdVqbra0N++E2I
	EAjY4QZL2FG0Y2Q+//bR3AAxV/lyFFGBbQ582rTnwzvJnhfZangZbpwzUAmntc9TnbZf
	qOTw==
X-Gm-Message-State: APt69E0e3ZpcjQ61Q2tg10DQmpAHsmZrmSMv1dPxX6ikO5+KVxrzqF5f
	Gcv+XPdfGYM83He+4RNSIs/J9g==
X-Google-Smtp-Source: ADUXVKLCHlrV1IJy+3bQlxj3jA0sprD5ftGWido7P5a7Y3d4ktaefRsxmeNdiMHNZN7ATu5rlwUF1A==
X-Received: by 2002:a65:4348:: with SMTP id k8-v6mr265042pgq.341.1528346085592;
	Wed, 06 Jun 2018 21:34:45 -0700 (PDT)
Received: from e6520.gateway.sonic.net
	(173-228-90-54.dsl.dynamic.fusionbroadband.com. [173.228.90.54])
	by smtp.gmail.com with ESMTPSA id
	z10-v6sm10840857pfh.83.2018.06.06.21.34.44
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 06 Jun 2018 21:34:44 -0700 (PDT)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  6 Jun 2018 21:34:38 -0700
Message-Id: <1528346078-20408-1-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH] gcc-target.inc: configure gcc for armv7ve targets to default to armv7ve
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
X-List-Received-Date: Thu, 07 Jun 2018 04:34:44 -0000

Originally these ARM specific EXTRA_OECONF options were applied to
both gcc for the target and gcc-cross. That lead to a compromise
being made: gcc on the target was configured to default to an ARM
architecture which was at least compatible with the target (but not
necessarily an exact match) and gcc-cross was configured default to
armv7a for both armv7a and armv7ve (to avoid gcc-cross rebuilds when
switching between the two).

However, when these ARM specific EXTRA_OECONF options were moved from
gcc-configure-common.inc into gcc-target.inc (ie they were made to
apply only to gcc on the target) the compromise no longer needed to
be made.

  http://git.openembedded.org/openembedded-core/commit/?id=851937dde81de2a9ef54c5f19a78fb12fb82afd4

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 meta/recipes-devtools/gcc/gcc-target.inc | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/meta/recipes-devtools/gcc/gcc-target.inc b/meta/recipes-devtools/gcc/gcc-target.inc
index b6e31f5..56e4b95 100644
--- a/meta/recipes-devtools/gcc/gcc-target.inc
+++ b/meta/recipes-devtools/gcc/gcc-target.inc
@@ -9,13 +9,14 @@ EXTRA_OECONF_PATHS = "\
 
 EXTRA_OECONF_append_linuxstdbase = " --enable-clocale=gnu"
 
-# ARMv6+ adds atomic instructions that affect the ABI in libraries built
-# with TUNE_CCARGS in gcc-runtime.  Make the compiler default to a
-# compatible architecture.  armv6 and armv7a cover the minimum tune
-# features used in OE.
+# Configure gcc running on the target to default to an architecture which will
+# be compatible with that of gcc-runtime (which is cross compiled to be target
+# specific). For example, for ARM, ARMv6+ adds atomic instructions that may
+# affect the ABI in the gcc-runtime libs. Since we can't rely on gcc on the
+# target to always be passed -march etc, its built-in default needs to be safe.
 EXTRA_OECONF_append_armv6 = " --with-arch=armv6"
 EXTRA_OECONF_append_armv7a = " --with-arch=armv7-a"
-EXTRA_OECONF_append_armv7ve = " --with-arch=armv7-a"
+EXTRA_OECONF_append_armv7ve = " --with-arch=armv7ve"
 
 # libcc1 requres gcc_cv_objdump when cross build, but gcc_cv_objdump is
 # set in subdir gcc, so subdir libcc1 can't use it, export it here to
-- 
1.9.1


