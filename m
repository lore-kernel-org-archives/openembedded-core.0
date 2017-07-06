Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f68.google.com (mail-pg0-f68.google.com [74.125.83.68])
	by mail.openembedded.org (Postfix) with ESMTP id 45AA8774FC
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Jul 2017 14:33:34 +0000 (UTC)
Received: by mail-pg0-f68.google.com with SMTP id u36so464117pgn.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 06 Jul 2017 07:33:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=1N+2dhs28SnuvFCty7CEt3Go0xzLoY4ZxXyhiIy573k=;
	b=CfEuNPyYRGoY+e5lnUEuNQmRI6p2st6BBST7o3TGtKuE80rwzvtN5LWcLUu97W0wpB
	4LbXEe4DrDcydNrt9B/Z+WzVjHKTYyQr7cbCNuYzcT0dpQ6IfJig38xXjAeZDJl2dX9Q
	4GH4k47AW9ratFt/x4IRH4J+4wCIAilBZrZleY9rDG85jRIkZBt7OIIsDX/cY6myixg5
	7fancMnNBq8sdpTzUL4C//pd8XQFKgam1nwlV+Qgl70hgONYQXTkEAKFaOQPGGKdtJ3u
	G1HD/8T+Kw8jHVeZLJ7GAiLX/vJreNg92HE/WBQQWUCqSJ/uo2PgKz1TO7H9lTDQFD1o
	W1hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=1N+2dhs28SnuvFCty7CEt3Go0xzLoY4ZxXyhiIy573k=;
	b=hQTD2WKzOtcZaO587B2z8+T7ZmNiBwyfS7FPFW/xazvpPiqabypx3T0zXADrMtgxCe
	y1Mkxth/sp8UNrAlexo/17iHvnFJdsjadv2AFmnHEj08FQpnHKNxQBk7apdUpLpqbbeM
	/eJ4bnegb2d/aiUO6Ox9C4CaSKBQJBkxSkaofELkF8nW9yJwiiI761CMPyVDB6TNL9fr
	RNziUZnhQT0oVRh40KjIwi5+xtvXCu0gMphdtYCXy++ZaR3wHkbiY1mQAqd6zNEjWzI+
	6unUgsVlncBHFwDXcEYv6awdj1CqBTtneuMILKfw7wwckMS75xlXOzoyfIkkD01VFLxJ
	gtrA==
X-Gm-Message-State: AIVw111vl5x+gec4xnjNCNrg7eSuqagQFoLnvG+J9S7SfstnDjYq44Ug
	u6BL3IIFKtSw02Dk
X-Received: by 10.98.147.142 with SMTP id r14mr9668465pfk.150.1499351615900;
	Thu, 06 Jul 2017 07:33:35 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8882:b8c::3df3])
	by smtp.gmail.com with ESMTPSA id
	w66sm1132739pfi.63.2017.07.06.07.33.34
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 06 Jul 2017 07:33:34 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  6 Jul 2017 07:33:02 -0700
Message-Id: <5b14394f7884d7aff45122a03fb3e15bbe52d8f3.1499351361.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.13.2
In-Reply-To: <cover.1499351361.git.raj.khem@gmail.com>
References: <cover.1499351361.git.raj.khem@gmail.com>
Subject: [PATCH 01/22] gcc: Introduce a knob to configure gcc to default to PIE
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
X-List-Received-Date: Thu, 06 Jul 2017 14:33:35 -0000

GCCPIE flag which is empty by default adds "--enable-default-pie"
configure option for harderned distros

We do not require to add -fpie -pie flag externally anymore

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/conf/distro/include/security_flags.inc        | 4 +++-
 meta/recipes-devtools/gcc/gcc-configure-common.inc | 3 +++
 2 files changed, 6 insertions(+), 1 deletion(-)

diff --git a/meta/conf/distro/include/security_flags.inc b/meta/conf/distro/include/security_flags.inc
index 38164d08b8..f2eb224a77 100644
--- a/meta/conf/distro/include/security_flags.inc
+++ b/meta/conf/distro/include/security_flags.inc
@@ -5,6 +5,8 @@
 # From a Yocto Project perspective, this file is included and tested
 # in the DISTRO="poky-lsb" configuration.
 
+GCCPIE ?= "--enable-default-pie"
+
 # _FORTIFY_SOURCE requires -O1 or higher, so disable in debug builds as they use
 # -O0 which then results in a compiler warning.
 lcl_maybe_fortify = "${@base_conditional('DEBUG_BUILD','1','','-D_FORTIFY_SOURCE=2',d)}"
@@ -12,7 +14,7 @@ lcl_maybe_fortify = "${@base_conditional('DEBUG_BUILD','1','','-D_FORTIFY_SOURCE
 # Error on use of format strings that represent possible security problems
 SECURITY_STRINGFORMAT ?= "-Wformat -Wformat-security -Werror=format-security"
 
-SECURITY_CFLAGS ?= "-fstack-protector-strong -pie -fpie ${lcl_maybe_fortify} ${SECURITY_STRINGFORMAT}"
+SECURITY_CFLAGS ?= "-fstack-protector-strong ${lcl_maybe_fortify} ${SECURITY_STRINGFORMAT}"
 SECURITY_NO_PIE_CFLAGS ?= "-fstack-protector-strong ${lcl_maybe_fortify} ${SECURITY_STRINGFORMAT}"
 
 SECURITY_LDFLAGS ?= "-fstack-protector-strong -Wl,-z,relro,-z,now"
diff --git a/meta/recipes-devtools/gcc/gcc-configure-common.inc b/meta/recipes-devtools/gcc/gcc-configure-common.inc
index 63fa1d9686..e2ce234aa1 100644
--- a/meta/recipes-devtools/gcc/gcc-configure-common.inc
+++ b/meta/recipes-devtools/gcc/gcc-configure-common.inc
@@ -22,6 +22,8 @@ EXTRA_OECONF_INITIAL ?= ""
 GCCMULTILIB ?= "--disable-multilib"
 GCCTHREADS ?= "posix"
 
+GCCPIE ??= ""
+
 EXTRA_OECONF = "\
     ${@['--enable-clocale=generic', ''][d.getVar('USE_NLS') != 'no']} \
     --with-gnu-ld \
@@ -29,6 +31,7 @@ EXTRA_OECONF = "\
     --enable-languages=${LANGUAGES} \
     --enable-threads=${GCCTHREADS} \
     ${GCCMULTILIB} \
+    ${GCCPIE} \
     --enable-c99 \
     --enable-long-long \
     --enable-symvers=gnu \
-- 
2.13.2


