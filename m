Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-ot1-f66.google.com (mail-ot1-f66.google.com
	[209.85.210.66])
	by mail.openembedded.org (Postfix) with ESMTP id 5717A7EC92
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Aug 2019 15:31:37 +0000 (UTC)
Received: by mail-ot1-f66.google.com with SMTP id k18so51188828otr.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Aug 2019 08:31:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=+iKMQf2/zUF8MVfRBCX9YqpS/SKaNAxabZScHDamfF8=;
	b=Vu6jvkAiEyiiBXz3qovzNzFIGMJThrpMZvc+/AOpsYjMHTVe3HJbN8KLoZGWId5R9y
	/ozu3zBzXmBAF9giVN47a023swG6t2aN69I2UxUSe3nZMxarg45CFn4PTaRHUPcgdGnI
	lNVaHYBHYH9uvRpuf8iUJwLPmON68G7yGt7ZYRpttiT+qmP5ez1lFcdkyhXkz9+aNfjS
	ak4RHinhR8HC8Kp6NPhyqaJFTzneL2vDabalT8jUwfOf4t3ljhFYWEB070OeQMG6VF72
	HRpVQilQ11uIs4bHvP2NMN9mOUHqnTGksrhN2+3XlpVKZHqmPrB+Diaa5cHLQXssaKVf
	HZ+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=+iKMQf2/zUF8MVfRBCX9YqpS/SKaNAxabZScHDamfF8=;
	b=PFchrbHEZYnXNnkQ5UWrJRRH3Z8ud0BQXtUQgssaE0Cu0tna8ATJhz7Q8qdigN9ltY
	p15xOKrvSD77FPrsCa7NHbikqMaBG1ip5X8O0CtLthAGGCQDFR0YtYqTfawojN5by97g
	0t5wpV1De//ekx7vNrN3ZCGrePNfJIB66GA7fWd6tS9tgZ+dzOT+RJcHrSY87/4t6hUO
	nyKUa8PAfwJ11J1ArxWb+Iqjnqhth47B5M28vex9oamsWxGSq76Gu11k9cDali//wshk
	chkkD6Lf90crddsAINYCSv9IU+tYxEWze5VMfSBa2e5g8CLWTn0hz5pWwcumDKiIsHND
	AyHQ==
X-Gm-Message-State: APjAAAWcj7URX+OZ1cJSRTFuCSW78nk3tgkhFMmOJtu1TcpRy1h2TiC8
	iGY8FCoPhE9J6PXTyGw1d5k=
X-Google-Smtp-Source: APXvYqwgpwz9Zvrz5bnC703Lsb3EpR9pYO80+F0TTkbfBJxcgpQy7IJ6VeKggj6Cmkgw8hDjnFHg3g==
X-Received: by 2002:a6b:a12:: with SMTP id z18mr497321ioi.222.1565796698078;
	Wed, 14 Aug 2019 08:31:38 -0700 (PDT)
Received: from localhost.localdomain
	(CPEe8de27b71faa-CM64777d5e8820.cpe.net.cable.rogers.com.
	[174.112.251.208])
	by smtp.gmail.com with ESMTPSA id 8sm224570ion.26.2019.08.14.08.31.36
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Wed, 14 Aug 2019 08:31:37 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Date: Wed, 14 Aug 2019 11:31:29 -0400
Message-Id: <3a3fd8a7128901ab5fff8de55b789ecd3b633cc6.1565796002.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <cover.1565796002.git.bruce.ashfield@gmail.com>
References: <cover.1565796002.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/5] kernel-devsrc: tweak for v5.3+
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
X-List-Received-Date: Wed, 14 Aug 2019 15:31:37 -0000
Content-Transfer-Encoding: 8bit

From: Bruce Ashfield <bruce.ashfield@gmail.com>

The 5.3 kernel has two changes that require tweaks to the minimal
kernel-devsrc package.

- 4ce97317f [x86/purgatory: Do not use __builtin_memcpy and __builtin_memset]

  This change removes the need for arch/x86/purgatory/string.c and
  instead reuses a copy in arch/x86/boot/compressed/, so we can't copy
  the file anymore. To support older kernels, we make the copy survive
  the non-existence of the file.

- b1663d7e [docs: Kbuild/Makefile: allow check for missing docs at build time]

  This change adds the sourceing of Documentation/Kbuild to the top
  level Kbuild file. So we now leave the copy of Documention/'s Kbuild
  in the devsrc.

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 meta/recipes-kernel/linux/kernel-devsrc.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-kernel/linux/kernel-devsrc.bb b/meta/recipes-kernel/linux/kernel-devsrc.bb
index 5ec5929735..3900489ac5 100644
--- a/meta/recipes-kernel/linux/kernel-devsrc.bb
+++ b/meta/recipes-kernel/linux/kernel-devsrc.bb
@@ -65,7 +65,6 @@ do_install() {
     )
 
     # then drop all but the needed Makefiles/Kconfig files
-    rm -rf $kerneldir/build/Documentation
     rm -rf $kerneldir/build/scripts
     rm -rf $kerneldir/build/include
 
@@ -205,11 +204,12 @@ do_install() {
 	    cp -a --parents arch/x86/purgatory/sha256.c $kerneldir/build/ 2>/dev/null || :
 
 	    cp -a --parents arch/x86/purgatory/stack.S $kerneldir/build/
-	    cp -a --parents arch/x86/purgatory/string.c $kerneldir/build/
+	    cp -a --parents arch/x86/purgatory/string.c $kerneldir/build/ 2>/dev/null || :
 	    cp -a --parents arch/x86/purgatory/setup-x86_64.S $kerneldir/build/
 	    cp -a --parents arch/x86/purgatory/entry64.S $kerneldir/build/
 	    cp -a --parents arch/x86/boot/string.h $kerneldir/build/
 	    cp -a --parents arch/x86/boot/string.c $kerneldir/build/
+	    cp -a --parents arch/x86/boot/compressed/string.c $kerneldir/build/ 2>/dev/null || :
 	    cp -a --parents arch/x86/boot/ctype.h $kerneldir/build/
 	fi
 
-- 
2.19.1


