Return-Path: <ross.burton@intel.com>
Received: from mail-wr0-f193.google.com (mail-wr0-f193.google.com
	[209.85.128.193])
	by mail.openembedded.org (Postfix) with ESMTP id E8740788F1
	for <openembedded-core@lists.openembedded.org>;
	Thu,  1 Mar 2018 18:26:51 +0000 (UTC)
Received: by mail-wr0-f193.google.com with SMTP id m5so7595083wrg.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 01 Mar 2018 10:26:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=M9yflCopJZVXrvF7F3K+Tn+QNJmvmIrp31AubhSMYYI=;
	b=hGVtid6R6ue+JpkIrrMIXASyPEYHB/kb8kwG3SW0v58MmDcc3LNiky+uW9Bz0EJZkZ
	6S/X4o82+QZoQFOiH0F3UaU+VKR84GMTZuceJknels4U+960/Wq49XZ5TdsX/QwQge8m
	a/Lf+3TIxNwowfBVN/L/bYarQdYXpw5jZfXGREgvITWPFFSeocRfjoRR+XPRqn8C5zWo
	Wsf+cbqJo4hOHS+sgem7aVBfigYIMhYAjlyVMrmhQiy1dWl8B9CjYihxN4e8lA1gf1uU
	laS6BmnfCMeaJnk3Bb9WZf90+FywX5sk6TXR1tGzgcmas0A3lOPTtNiCTzRmhT3Yl6Hu
	JJ6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=M9yflCopJZVXrvF7F3K+Tn+QNJmvmIrp31AubhSMYYI=;
	b=naNOJ/itXyaZl6p1hhWXY3rCi0yEIj+4dh8PZVwWXilyMcUOOkPql8+N+CuorIr1vZ
	y71mJzjBwGRe6PORSWxJF7S9YswaDeZMk5Dy+TiUn7athJZIDjeD+bSdTvv9E9ta95xM
	wJdG4V2sA4+AAxQAT3Ri0XcGoCsJLEO55MGeAHxTsA/slxarEUETergpZIuZBhMQDi7M
	Ka7AnJAIZLnQ9IQftMPcrtKt5dW001t/vQvtoBnK26TILPmipDXUwH26bCAEcLaDkP5P
	9ObIMORMrnCZg8h5raOc1ud1QCfhgT3WoFL2zM8cVDq98fqHslnJdWIW3VZHm4D2BzZa
	5oZA==
X-Gm-Message-State: APf1xPA0mvsmXCxFEttMwvF7xUuJyzIokgAVNQEstbwO25DblmiKVoNA
	yIimMMx6yscoog9N0c5WMEUzqY6c
X-Google-Smtp-Source: AG47ELvvuiiBcKQHRlCBOzgb3zndYQtV17o2bAbis4KiJHTNygWgEEGzzRkDq3TICnt6Yzh/Y2quvg==
X-Received: by 10.223.134.136 with SMTP id 8mr2654170wrx.86.1519928812290;
	Thu, 01 Mar 2018 10:26:52 -0800 (PST)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	h188sm4955285wmf.23.2018.03.01.10.26.51
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 01 Mar 2018 10:26:51 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  1 Mar 2018 18:26:34 +0000
Message-Id: <20180301182634.20502-11-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20180301182634.20502-1-ross.burton@intel.com>
References: <20180301182634.20502-1-ross.burton@intel.com>
Subject: [PATCH 11/11] glibc: Enable static PIE support when security_flags are enabled
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
X-List-Received-Date: Thu, 01 Mar 2018 18:26:52 -0000

From: Khem Raj <raj.khem@gmail.com>

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/conf/distro/include/security_flags.inc | 2 ++
 meta/recipes-core/glibc/glibc_2.27.bb       | 3 +++
 2 files changed, 5 insertions(+)

diff --git a/meta/conf/distro/include/security_flags.inc b/meta/conf/distro/include/security_flags.inc
index 49d2417a882..d66dd576493 100644
--- a/meta/conf/distro/include/security_flags.inc
+++ b/meta/conf/distro/include/security_flags.inc
@@ -6,6 +6,7 @@
 # in the DISTRO="poky-lsb" configuration.
 
 GCCPIE ?= "--enable-default-pie"
+GLIBCPIE ?= "--enable-static-pie"
 
 # _FORTIFY_SOURCE requires -O1 or higher, so disable in debug builds as they use
 # -O0 which then results in a compiler warning.
@@ -30,6 +31,7 @@ SECURITY_X_LDFLAGS ?= "-fstack-protector-strong -Wl,-z,relro"
 SECURITY_CFLAGS_powerpc = "-fstack-protector-strong ${lcl_maybe_fortify} ${SECURITY_NOPIE_CFLAGS}"
 SECURITY_CFLAGS_pn-libgcc_powerpc = ""
 GCCPIE_powerpc = ""
+GLIBCPIE_powerpc = ""
 
 # arm specific security flag issues
 SECURITY_CFLAGS_pn-glibc = ""
diff --git a/meta/recipes-core/glibc/glibc_2.27.bb b/meta/recipes-core/glibc/glibc_2.27.bb
index 2434c061056..bcc1acfbc28 100644
--- a/meta/recipes-core/glibc/glibc_2.27.bb
+++ b/meta/recipes-core/glibc/glibc_2.27.bb
@@ -69,6 +69,8 @@ GLIBC_BROKEN_LOCALES = ""
 #
 COMPATIBLE_HOST_libc-musl_class-target = "null"
 
+GLIBCPIE ??= ""
+
 EXTRA_OECONF = "--enable-kernel=${OLDEST_KERNEL} \
                 --without-cvs --disable-profile \
                 --disable-debug --without-gd \
@@ -82,6 +84,7 @@ EXTRA_OECONF = "--enable-kernel=${OLDEST_KERNEL} \
                 --enable-bind-now \
                 --enable-stack-protector=strong \
                 --enable-stackguard-randomization \
+                ${GLIBCPIE} \
                 ${GLIBC_EXTRA_OECONF}"
 
 EXTRA_OECONF += "${@get_libc_fpu_setting(bb, d)}"
-- 
2.11.0


