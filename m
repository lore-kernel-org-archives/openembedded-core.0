Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f54.google.com (mail-pg0-f54.google.com [74.125.83.54])
	by mail.openembedded.org (Postfix) with ESMTP id 7E7FD783E0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Jun 2017 15:23:50 +0000 (UTC)
Received: by mail-pg0-f54.google.com with SMTP id k71so1654623pgd.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Jun 2017 08:23:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=nsSoIeJcsGHEVnDaOWgHdeJfb99r0xS6xh2P08iu4k8=;
	b=Rt8USffFAXLNAOZXcpbydDX9MgAO1ruh6MB0bh063b2ckupALsLVviU6Gk3Hq6SUZI
	L4A36zqewZ/kfEEbsIKXfKbVnptCdGeCpfOyMJv9KVJMn/6uoPZIm/eyktcChBsVjBN0
	nL8m+qud8ra46QkTnhICXf1dxML1InV7hlTGpQ6LtqPqqwAwscPlhzLuwAWOiciZg3eU
	iFcbI/t5M6ASJ6efP5QSW8EP7m9AKMoK+kEKicX67BzWksL8jVBADnJfSgJgBpIyPgyq
	1lJy3/WW6gD6CSqG5bMZCqrYwOllA1YMu7CsvlwmkteZxnqJdEyLvXqjNIWE2wk7EJfP
	zPsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=nsSoIeJcsGHEVnDaOWgHdeJfb99r0xS6xh2P08iu4k8=;
	b=AilwJis9gLuKYZ/t76GT9HhPaZjky188kWcAi9V9E72w6Akn2fmhAmKeWxXpbnzv+5
	wehXne1oalD6YmHJ5ZqVUIriOONsORlyl2S4Dr4IQWwU3QFdIQhhl/+M+Cjac4++mw6+
	if3lVskzizr3byC6idtW9QqKVaEVt5I5U1Eli5gYeExy+dJeUZqp5zkvKFyCT+Bqcjvz
	0R3CKUJvOfEj6hjA1fvmPpr68GnjaDfp8qnGVf1FoFFh/1f3X4Lvro2Dg9KCOrBHjoFK
	kV+fvI4GQYmkpVOEMaIiagp/Dr5MDn4pxrT31uPSx21+T91zxYfYJinJ4Wl8KBSFBORY
	GXHQ==
X-Gm-Message-State: AKS2vOyH626jbsAVO773K/nv6qawtCzV6dsu8ihlZohfQvETQZyM6ieY
	MSchHULliWzAGpd/
X-Received: by 10.99.5.147 with SMTP id 141mr605959pgf.134.1497453832116;
	Wed, 14 Jun 2017 08:23:52 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8882:b8c::264a])
	by smtp.gmail.com with ESMTPSA id i2sm502948pfe.89.2017.06.14.08.23.50
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 14 Jun 2017 08:23:50 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 14 Jun 2017 08:23:28 -0700
Message-Id: <0c42aa0a47357fb01ce61c059be4e7bea5f61cb9.1497453168.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.13.1
In-Reply-To: <cover.1497453168.git.raj.khem@gmail.com>
References: <cover.1497453168.git.raj.khem@gmail.com>
Subject: [PATCH 09/10] libunwind: We set -fPIE in security flags now if gcc is not configured for default PIE
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
X-List-Received-Date: Wed, 14 Jun 2017 15:23:51 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-support/libunwind/libunwind_1.2.bb | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/meta/recipes-support/libunwind/libunwind_1.2.bb b/meta/recipes-support/libunwind/libunwind_1.2.bb
index e598e40c6f..c6312f24fd 100644
--- a/meta/recipes-support/libunwind/libunwind_1.2.bb
+++ b/meta/recipes-support/libunwind/libunwind_1.2.bb
@@ -21,8 +21,4 @@ EXTRA_OECONF_append_libc-musl = " --disable-documentation --disable-tests "
 ARM_INSTRUCTION_SET_armv4 = "arm"
 ARM_INSTRUCTION_SET_armv5 = "arm"
 
-# see https://sourceware.org/bugzilla/show_bug.cgi?id=19987
-SECURITY_CFLAGS_remove_aarch64 = "-fpie"
-SECURITY_CFLAGS_append_aarch64 = " -fPIE"
-
 LDFLAGS += "-Wl,-z,relro,-z,now ${@bb.utils.contains('DISTRO_FEATURES', 'ld-is-gold', ' -fuse-ld=bfd ', '', d)}"
-- 
2.13.1


