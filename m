Return-Path: <armccurdy@gmail.com>
Received: from mail-pf0-f195.google.com (mail-pf0-f195.google.com
	[209.85.192.195])
	by mail.openembedded.org (Postfix) with ESMTP id 635A472F96
	for <openembedded-core@lists.openembedded.org>;
	Mon,  9 Oct 2017 16:00:43 +0000 (UTC)
Received: by mail-pf0-f195.google.com with SMTP id z80so10152121pff.4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 09 Oct 2017 09:00:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=J6rTENGzG2oraLhu09Mzi0lVO2AhUaBdri90r8IWjKo=;
	b=FD5Fp62QdQTrxgL/DA0jOhg7u8G2vQ1FRVjndBRU3RA4ymPHH/BP1+NTNSU4Qb1J3n
	1vg9IHOFlqyBGoE/E/4I4cA6VQohiKq3yIhkSUBpUc8W5JaytgvdBEKNMftllTvPUAc8
	UW0u8BbF4ZNhVz4vT7M6RUQS5tUYcfQMHcnUJdh0yIsDzO7LSXrTwK8u2JvuzgrGF5Ry
	jRiVdrLdkX1o5QkuncHEcKc3uxDE+wlAMRFcZFYVaH0YrVcYFip56HQVbRFkWspOkdM/
	JRvbFKWMJqQowCGPybP15AH1jPm/VkvkGKYdD2Pm5TabQ0zRSoqkZrdxqeJlLsXXVDnK
	KnGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=J6rTENGzG2oraLhu09Mzi0lVO2AhUaBdri90r8IWjKo=;
	b=XPXEIfFGWhO12qbqpqZmqmTavggx5c7fqyxn3VfbcpoB8RKtmv4nRCY0M43nKsmDod
	2HVV57N8ItIJhxRUwJ6/WUN4kWQAyxwpKf/tuSpPeWqSSUys0hFi8aYo1hhIMZ+6k/39
	YfZlhd9hkeGJ/Qw3+n3etb1hHkGBkMkgd7SDQW1XdHQWjz+d5Fhi/3Q93IUz5E1N0Yag
	eGcb5kWuyuxtUI4f2z1Jig1Vw/+lpjXVNrJ7Aa9MIhZ/QNmehuGmJNJi6aZe7gQgS3G8
	xVprv8wLILDn7pm6DKWnidMYeGl+YMdw66N9CgYN87DrYCgAcUxusX3RI3exQplVn4KB
	+1Vg==
X-Gm-Message-State: AMCzsaUkeUHuBbcDiZhCQAhwkYwZJ3MXXrG4TQnWUumLVv4oaHGMoPsX
	/EU1xY9ctECA5S8NXLGVR+KrNQ==
X-Google-Smtp-Source: AOwi7QCcSbjp6GTCLxApH5kEUJiaWdjZctdphnAvbs5cxvVqsANvJy0Pr+nqUmNUwk78pVF1+FTEmw==
X-Received: by 10.98.15.197 with SMTP id 66mr4914962pfp.272.1507564844150;
	Mon, 09 Oct 2017 09:00:44 -0700 (PDT)
Received: from e6520.cablelabs.com ([4.16.80.121])
	by smtp.gmail.com with ESMTPSA id
	f3sm17897999pfd.82.2017.10.09.09.00.42
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 09 Oct 2017 09:00:42 -0700 (PDT)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  9 Oct 2017 09:00:35 -0700
Message-Id: <1507564835-8727-1-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH v2] musl: use a more specific fix for ARM thumb + frame pointers
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
X-List-Received-Date: Mon, 09 Oct 2017 16:00:44 -0000

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
 meta/recipes-core/musl/musl_git.bb | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-core/musl/musl_git.bb b/meta/recipes-core/musl/musl_git.bb
index 8b6a2e3..bd7573e 100644
--- a/meta/recipes-core/musl/musl_git.bb
+++ b/meta/recipes-core/musl/musl_git.bb
@@ -28,7 +28,13 @@ export CROSS_COMPILE="${TARGET_PREFIX}"
 
 LDFLAGS += "-Wl,-soname,libc.so"
 
-ARM_INSTRUCTION_SET_toolchain-clang = "arm"
+# When compiling for Thumb or Thumb2, frame pointers _must_ be disabled since the
+# Thumb frame pointer in r7 clashes with musl's use of inline asm to make syscalls
+# (where r7 is used for the syscall NR). In most cases, frame pointers will be
+# disabled automatically due to the optimisation level, but append an explicit
+# -fomit-frame-pointer to handle cases where optimisation is set to -O0 or frame
+# pointers have been enabled by -fno-omit-frame-pointer earlier in CFLAGS, etc.
+CFLAGS_append_arm = " ${@bb.utils.contains('TUNE_CCARGS', '-mthumb', '-fomit-frame-pointer', '', d)}"
 
 CONFIGUREOPTS = " \
     --prefix=${prefix} \
-- 
1.9.1


