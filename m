Return-Path: <armccurdy@gmail.com>
Received: from mail-pf0-f194.google.com (mail-pf0-f194.google.com
	[209.85.192.194])
	by mail.openembedded.org (Postfix) with ESMTP id 5068D65C5B
	for <openembedded-core@lists.openembedded.org>;
	Sat,  7 Oct 2017 02:12:50 +0000 (UTC)
Received: by mail-pf0-f194.google.com with SMTP id i23so18051186pfi.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 06 Oct 2017 19:12:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=Z8DchuJRjwLUb4Txk4rBbabo+FVB7wHy9DCN3x3NuLk=;
	b=Gp0Ih3brXwVw4xTnvpqDxIkRupWAMqqvUP+6p+uhceEbiY29+/c7xZj+pD7AOuWWu7
	TAtsof9muq0766osb7aOj75XVdgzcmH9LD1snU7yICylhnKASOFcKgN57Cq0QjqDgX3q
	p504u6Tfdnu9zxFtA0RvxCqmUgGE397yo9x9vCF5GS1YnTMim8XrnotN6867RVCBu9Jf
	xLoaNVHOqWt8v0hE2gSIZL4WTX//XknB2BNpML0NOMnKOniCNI813Sstyhi6N9OmleO+
	wweAGjiY2ZXKWGUvFlbdK7RqjdULY9c8uku0VxPX047vYrAoA8gIktX+3bU02CGAAPhN
	EiVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=Z8DchuJRjwLUb4Txk4rBbabo+FVB7wHy9DCN3x3NuLk=;
	b=M6appzxDla5mJx5crVbfG3k6QPt9G24zrDfIgKax+FvJXXVLhuRhdc/gV5ncoEF8rN
	uyzU9ANXnfvWTwLJ+ZZQ+9tIyVGePFNrT+V/nYRzqU3k7rcpTcSYyivfg2Lo/x1qgaq9
	Qp0RnyYLod1WfnVQIBYqRDpwjW1grF+IhLKGq7Wz9atsNe/ub5YrAxdrwOvDvetdOyVk
	5vdnmFPVgSgaZmvESW7Mceg4rHfmjhRdAf1guOtgJl16C851qJG/uZx2B5jZIlilJ7bl
	IV6vTjvjP5P/iX5eVrrB+OK1eWTqyJO74Pugz+CJqLE1280T9EnfhSN4kPc0VpAElLlr
	RiCA==
X-Gm-Message-State: AMCzsaVd6716V2ghI1jRfLrUDx4a51cRXGqPG9z3cBSeVaovgXocivLF
	XczkplHIstbBuRxFiCJ5YQ4Ouw==
X-Google-Smtp-Source: AOwi7QCB4zYf1sCG7CaTKgM+ODUhjcexWL7EdqaPsWqwjKwLe+K1LluiAN0CK7o7NxRUkn7lyZ6ewA==
X-Received: by 10.84.218.131 with SMTP id r3mr3369590pli.271.1507342372271;
	Fri, 06 Oct 2017 19:12:52 -0700 (PDT)
Received: from e6520.guest-wifi.scl.liberty.com ([4.16.80.121])
	by smtp.gmail.com with ESMTPSA id
	d12sm5087784pfl.140.2017.10.06.19.12.50
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 06 Oct 2017 19:12:50 -0700 (PDT)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  6 Oct 2017 19:12:45 -0700
Message-Id: <1507342365-28471-1-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH] musl: use a more specific fix for ARM thumb + frame pointers
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
X-List-Received-Date: Sat, 07 Oct 2017 02:12:51 -0000

When compiling for Thumb or Thumb2, frame pointers _must_ be disabled
since the Thumb frame pointer in r7 clashes with musl's use of inline
asm to make syscalls (where r7 is used for the syscall NR).

In most cases, frame pointers will be disabled automatically due to
the optimisation level, but appending an explicit -fomit-frame-pointer
to CFLAGS handles cases where optimisation is set to -O0 or frame
pointers have been enabled by -fno-omit-frame-pointer earlier in
CFLAGS, etc.

Note that this limitation applies both to gcc and clang, the only
difference between the two being that where gcc aborts with an error
about reusing r7, clang apparently silently generates broken code:

  https://bugs.llvm.org/show_bug.cgi?id=34165

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 meta/recipes-core/musl/musl_git.bb | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/meta/recipes-core/musl/musl_git.bb b/meta/recipes-core/musl/musl_git.bb
index 8b6a2e3..3766501 100644
--- a/meta/recipes-core/musl/musl_git.bb
+++ b/meta/recipes-core/musl/musl_git.bb
@@ -28,6 +28,16 @@ export CROSS_COMPILE="${TARGET_PREFIX}"
 
 LDFLAGS += "-Wl,-soname,libc.so"
 
+# When compiling for Thumb or Thumb2, frame pointers _must_ be disabled since the
+# Thumb frame pointer in r7 clashes with musl's use of inline asm to make syscalls
+# (where r7 is used for the syscall NR). In most cases, frame pointers will be
+# disabled automatically due to the optimisation level, but append an explicit
+# -fomit-frame-pointer to handle cases where optimisation is set to -O0 or frame
+# pointers have been enabled by -fno-omit-frame-pointer earlier in CFLAGS, etc.
+CFLAGS_append_arm = " ${@bb.utils.contains('TUNE_CCARGS', '-mthumb', '-fomit-frame-pointer', '', d)}"
+
+# Pending testing, this can probably be removed (fixed more specifically above
+# by appending -fomit-frame-pointer to CFLAGS when building for Thumb).
 ARM_INSTRUCTION_SET_toolchain-clang = "arm"
 
 CONFIGUREOPTS = " \
-- 
1.9.1


