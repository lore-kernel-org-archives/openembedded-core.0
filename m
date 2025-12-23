Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B90E2E6FE4E
	for <webhook@archiver.kernel.org>; Tue, 23 Dec 2025 21:26:26 +0000 (UTC)
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.109029.1766525177086090135
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Dec 2025 13:26:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=fDVp7u3s;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.180, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2a12ed4d205so47473265ad.0
        for <openembedded-core@lists.openembedded.org>; Tue, 23 Dec 2025 13:26:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1766525176; x=1767129976; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OqORGIfPiOY4um3MLNUnU68433tnPwvakIz+Q4oXXS4=;
        b=fDVp7u3si6VDsA7peHJNsklcNqLpBWduDZvQo2R1MqyfSTEqpB/jtoXhz4DMYs7i6l
         2QdSQcXnXcr5SEskQoloiZEtnkNvjwNuofAHTvYXYTOr0b+oR2HxqwIEYPppOjY0LkTb
         gq58u9QszbU+tTi0C6iuMSjYs881sJelSMsFhmjL/+7i7nIvc2yNmqOfnBvb85ElUhu6
         MRzPpzgZ8ZKKv0J190LQ/CIdOgzHxnRkOKd84lUdPaTcr3lP40YF0u2byNvdAGo1vYg1
         O+HaFxWWAklLwc0vGihzxYL5a/cJRpPRzreAI5f157yFEyi45XRrE6qXAp9UXjV7yHjE
         axOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766525176; x=1767129976;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=OqORGIfPiOY4um3MLNUnU68433tnPwvakIz+Q4oXXS4=;
        b=tOYR4lg+0nm4A3Gcxk9h0oh79U42f/rizMwLF0v+uqFUI1ijC9mpobASmvpzfLNzC3
         1Ku49uX9OPKer5LHTlx5sNvm2PUWo4xOqaGUcBWiTaMBpQRWmEEhSNgIOdeB0AF6LSmU
         u8ISSTxauGaGMcy7QRhpgrqT2jexVRuGnqt8uDmowrBKQOruB2jC6UpMvn2uKrCIFebB
         i89uWJpZgor4ozmEpqIh93XFFkiV0UhsXmDDkpi/HjwkpJWRyDoSjZV+nVoZoFF2JusT
         jDeU+WYEc68ATEyqOkVumLYavzOfdtnE7YWpFuBFvBr/mn15H1+0emcheY1U5+Ox/24N
         +4XA==
X-Gm-Message-State: AOJu0Yx3hW5ssVcDQxI0eIV6MT7Z5Y7db2CmxObSUt7sGQkvRmnSa8i6
	35LzyDyNRUN8JfsyLuPngbldIcsI75X3H5XidcdOjKXX2ODj+2J3Cmo0WgNg1LWHQYe14IZsCuA
	iDPkm
X-Gm-Gg: AY/fxX7fhYDeX/aotaimHmjricxfinVq0D0GMF7VhJmao2dyq2B1vSE10h3ae0hVkY9
	zk5UlJuuG6Eck9Vta6LKcbBO8WU2QO80uYyKlfctarSO38JVIteTbzvVjYTnUb7pn43AeDZSf9v
	eV3zszxxGkwoLGef1/BZK/LzTHeobB9o6uCrkp0i4s0675paxC7Uo4yedB7vdVpqqDg7QE4lqcS
	DmdmGxB/Gl1eNMhC2v6mH61TPH5ZSATjwUsk3qMpgDQeMGhUyx3W4nd73RQDLMRQHXSfZTllS+I
	khXO02eBlL8NlQlFH5+fjvDM7xAwYduNBhA1yWcck4njOXwyiGvqbUyah112G5dt46fzNCdDSWw
	yMbQg5A8EU2OIfetDGR7vY0pYyCGrljRu6aOt7t7cAn4u0P5adkQUO+lzv5/5c7afJUtbTxvmzN
	AE4g==
X-Google-Smtp-Source: AGHT+IEgzwmu+0yBcFFerGSulsjc81ythWmknlzRBtGzsRqPonvkDQmDZ1fg67uaiBc4saL19R1hlw==
X-Received: by 2002:a17:903:2f81:b0:2a0:c58b:ed6 with SMTP id d9443c01a7336-2a2f2735103mr142666815ad.29.1766525176324;
        Tue, 23 Dec 2025 13:26:16 -0800 (PST)
Received: from hexa.. ([2602:feb4:3b:2100:74b3:f61b:a7a7:fafc])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a2f3c6a80esm133756765ad.8.2025.12.23.13.26.15
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Dec 2025 13:26:15 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 05/10] binutils: fix CVE-2025-11839
Date: Tue, 23 Dec 2025 13:25:56 -0800
Message-ID: <d99979ea5fa475a59d3c21859d3bbbd81e0cdba4.1766525021.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1766525021.git.steve@sakoman.com>
References: <cover.1766525021.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 23 Dec 2025 21:26:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228498

From: Yash Shinde <Yash.Shinde@windriver.com>

CVE-2025-11839

PR 33448
[BUG] Aborted in tg_tag_type at prdbg.c:2452
Remove call to abort in the DGB debug format printing code, thus allowing
the display of a fuzzed input file to complete without triggering an abort.

https://sourceware.org/bugzilla/show_bug.cgi?id=33448

Upstream-Status: Backport [https://sourceware.org/git/?p=binutils-gdb.git;a=commitdiff;h=12ef7d5b7b02d0023db645d86eb9d0797bc747fe]

Signed-off-by: Yash Shinde <Yash.Shinde@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../binutils/binutils-2.38.inc                |  1 +
 .../binutils/0049-CVE-2025-11839.patch        | 32 +++++++++++++++++++
 2 files changed, 33 insertions(+)
 create mode 100644 meta/recipes-devtools/binutils/binutils/0049-CVE-2025-11839.patch

diff --git a/meta/recipes-devtools/binutils/binutils-2.38.inc b/meta/recipes-devtools/binutils/binutils-2.38.inc
index 2fe4a17e0d..426c00ce3f 100644
--- a/meta/recipes-devtools/binutils/binutils-2.38.inc
+++ b/meta/recipes-devtools/binutils/binutils-2.38.inc
@@ -87,5 +87,6 @@ SRC_URI = "\
      file://CVE-2025-11412.patch \
      file://CVE-2025-11413.patch \
      file://0048-CVE-2025-11494.patch \
+     file://0049-CVE-2025-11839.patch \
 "
 S  = "${WORKDIR}/git"
diff --git a/meta/recipes-devtools/binutils/binutils/0049-CVE-2025-11839.patch b/meta/recipes-devtools/binutils/binutils/0049-CVE-2025-11839.patch
new file mode 100644
index 0000000000..7f2f6d553d
--- /dev/null
+++ b/meta/recipes-devtools/binutils/binutils/0049-CVE-2025-11839.patch
@@ -0,0 +1,32 @@
+From 12ef7d5b7b02d0023db645d86eb9d0797bc747fe Mon Sep 17 00:00:00 2001
+From: Nick Clifton <nickc@redhat.com>
+Date: Mon, 3 Nov 2025 11:49:02 +0000
+Subject: [PATCH] Remove call to abort in the DGB debug format printing code,
+ thus allowing the display of a fuzzed input file to complete without
+ triggering an abort.
+
+PR 33448
+---
+ binutils/prdbg.c | 1 -
+ 1 file changed, 1 deletion(-)
+
+Upstream-Status: Backport [https://sourceware.org/git/?p=binutils-gdb.git;a=commitdiff;h=12ef7d5b7b02d0023db645d86eb9d0797bc747fe]
+CVE: CVE-2025-11839
+
+Signed-off-by: Yash Shinde <Yash.Shinde@windriver.com>
+
+diff --git a/binutils/prdbg.c b/binutils/prdbg.c
+index c239aeb1a79..5d405c48e3d 100644
+--- a/binutils/prdbg.c
++++ b/binutils/prdbg.c
+@@ -2449,7 +2449,6 @@ tg_tag_type (void *p, const char *name, unsigned int id,
+       t = "union class ";
+       break;
+     default:
+-      abort ();
+       return false;
+     }
+ 
+-- 
+2.43.7
+
-- 
2.43.0


