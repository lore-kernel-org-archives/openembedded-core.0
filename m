Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39546C5478C
	for <webhook@archiver.kernel.org>; Tue, 27 Feb 2024 21:57:41 +0000 (UTC)
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
 by mx.groups.io with SMTP id smtpd.web10.1955.1709071057878959428
 for <openembedded-core@lists.openembedded.org>;
 Tue, 27 Feb 2024 13:57:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=xuAARsKr;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.181, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-6e332bc65b3so2668479b3a.3
        for <openembedded-core@lists.openembedded.org>; Tue, 27 Feb 2024 13:57:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1709071057; x=1709675857; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AzouUONTKufLkrRwrpl9g3fKktS+YH077e8814+wt0w=;
        b=xuAARsKrkh08SVbkEXq0ygY7Jh99WG4k3uO7QU+m+cXzOWgcAAJlkJc0gNX9qMP7e4
         nOqSodZqw/8VGACSdeq7aSuGmMbZZH/ESvvTg8JpDox1co55+DQBwgwPk0eH6SETX4MG
         P6uxVNGTGBw4SRnMGzgdMbAc6X46QRSVC5STQtxZgAWXe1Ag9MGw8x+QZtrCwBjxUnxu
         2sYMgze2e1hddZghFno8tbS0y6WzTDhEIeXgKQpr6N5DHHuvLevveHilJLU6WdLc8fQr
         BpKCNFAm2RG+z1n89CT6cnKUhMOjCItCMRYKAar2KdEQGxC6o9OiBjYFJgShm0dY6m+Q
         UvDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709071057; x=1709675857;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AzouUONTKufLkrRwrpl9g3fKktS+YH077e8814+wt0w=;
        b=WBUVJ1KuTfIM5qVXMCCbTx1E6JPCDBFUY1VyDwUjziCIQ8ehz+S/GTPUp2NhOam206
         ATUy1Xncmnj+dB9+8Lv4zOX2bt5nUWERsyWvnMUh7MRxqy5G9FUecQ/HmPJZRl/JEndB
         /NMz7zihTpoKbxuMKcEHarzepUf3EalU/kfmWUet1KhiffSgHHwfodlY+TwdH0itT+Ch
         FZEhPw5igsAcLRgIaOd3vjF8EerEaZd6KgCF1tdoFHbX6/GjKk+PZB75z8ZD8rM7CFhD
         JhCrlEp3i9SmxEjy8mWwf+Vd1cV1K30FiDGko7Eu2T7MvcRhnUaamnUBXqGLLb58J0AE
         /RYA==
X-Gm-Message-State: AOJu0YyTSxSIvJvNSJkQj9k9v8Y4JM3yqaaqPzX0/LRmOFTTyrLemW2a
	gtjcvWIwhtJT9FjUcY6Wdihr4oek9gC075T2T839UCKlp2wrYVKJiZ9Qxw3M1A4rDwz79kYJ+vO
	0k/w=
X-Google-Smtp-Source: AGHT+IEwQmpRf9IExYpilGWESBC4YppeDL3I7JGOjY154BvOYWf+soF1Lz4ewzC2awTqxNU3z7rfqw==
X-Received: by 2002:aa7:9194:0:b0:6e2:de02:598e with SMTP id x20-20020aa79194000000b006e2de02598emr10037820pfa.33.1709071056977;
        Tue, 27 Feb 2024 13:57:36 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-234-108-41.hawaiiantel.net. [72.234.108.41])
        by smtp.gmail.com with ESMTPSA id n7-20020aa78a47000000b006e50bbf4e71sm4936428pfa.9.2024.02.27.13.57.36
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Feb 2024 13:57:36 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 15/16] kernel: fix localversion in v6.3+
Date: Tue, 27 Feb 2024 11:57:02 -1000
Message-Id: <74897e505db19a23a5b864a48a4fa97d657605c8.1709070850.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1709070850.git.steve@sakoman.com>
References: <cover.1709070850.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 27 Feb 2024 21:57:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196314

From: Bruce Ashfield <bruce.ashfield@gmail.com>

During testing of the v6.4 reference kernel, it was noticed that
on-target modules no longer matched the magic value of the running
kernel.

This was due to a different localversion in the cross built kernel
and the scripts / resources created on target.

This was due to changes in the setlocalversion script introduced
in the v6.3 series.

The .scmversion file is no longer used (or packaged) to inhibit
the addition of a "+" (through querying of the git status of the
kernel) or the setting of a local version.

We recently introduced the KERNEL_LOCALVERSION variable to allow
recipes to place a value in .scmversion, so we extend the use of
that variable to kernel-arch.bbclass and use it to set the
exported variable LOCALVERSION.

We must do it at the kernel-arch level, as the variable must be
exported in any kernel build to ensure that setlocalversion always
correctly sets the localversion.

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

cherry-picked from master 765b13b7305c8d2f222cfc66d77c02e6a088c691

Signed-off-by: Andreas Helbech Kleist <andreaskleist@gmail.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes/kernel-arch.bbclass | 7 +++++++
 meta/classes/kernel.bbclass      | 6 ++++--
 2 files changed, 11 insertions(+), 2 deletions(-)

diff --git a/meta/classes/kernel-arch.bbclass b/meta/classes/kernel-arch.bbclass
index 4cd08b96fb..0a79dea0af 100644
--- a/meta/classes/kernel-arch.bbclass
+++ b/meta/classes/kernel-arch.bbclass
@@ -66,3 +66,10 @@ KERNEL_LD = "${CCACHE}${HOST_PREFIX}ld.bfd ${HOST_LD_KERNEL_ARCH}"
 KERNEL_AR = "${CCACHE}${HOST_PREFIX}ar ${HOST_AR_KERNEL_ARCH}"
 TOOLCHAIN ?= "gcc"
 
+# 6.3+ requires the variable LOCALVERSION to be set to not get a "+" in
+# the local version. Having it empty means nothing will be added, and any
+# value will be appended to the local kernel version. This replaces the
+# use of .scmversion file for setting a localversion without using
+# the CONFIG_LOCALVERSION option.
+KERNEL_LOCALVERSION ??= ""
+export LOCALVERSION ?= "${KERNEL_LOCALVERSION}"
diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
index 80fb1879b0..940f1a3cf4 100644
--- a/meta/classes/kernel.bbclass
+++ b/meta/classes/kernel.bbclass
@@ -418,7 +418,7 @@ do_compile_kernelmodules() {
 	if (grep -q -i -e '^CONFIG_MODULES=y$' ${B}/.config); then
 		oe_runmake -C ${B} ${PARALLEL_MAKE} modules ${KERNEL_EXTRA_ARGS}
 
-		# Module.symvers gets updated during the 
+		# Module.symvers gets updated during the
 		# building of the kernel modules. We need to
 		# update this in the shared workdir since some
 		# external kernel modules has a dependency on
@@ -614,7 +614,6 @@ do_shared_workdir () {
 # We don't need to stage anything, not the modules/firmware since those would clash with linux-firmware
 SYSROOT_DIRS = ""
 
-KERNEL_LOCALVERSION ??= ""
 KERNEL_CONFIG_COMMAND ?= "oe_runmake_call -C ${S} O=${B} olddefconfig || oe_runmake -C ${S} O=${B} oldnoconfig"
 
 python check_oldest_kernel() {
@@ -636,6 +635,9 @@ kernel_do_configure() {
 	# $ scripts/setlocalversion . => +
 	# $ make kernelversion => 2.6.37
 	# $ make kernelrelease => 2.6.37+
+	# See kernel-arch.bbclass for post v6.3 removal of the extra
+	# + in localversion. .scmversion is no longer used, and the
+	# variable LOCALVERSION must be used
 	if [ ! -e ${B}/.scmversion -a ! -e ${S}/.scmversion ]; then
 		echo ${KERNEL_LOCALVERSION} > ${B}/.scmversion
 		echo ${KERNEL_LOCALVERSION} > ${S}/.scmversion
-- 
2.34.1


