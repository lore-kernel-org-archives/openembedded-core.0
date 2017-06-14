Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f194.google.com (mail-pf0-f194.google.com
	[209.85.192.194])
	by mail.openembedded.org (Postfix) with ESMTP id 8AC1F783AC
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Jun 2017 15:23:39 +0000 (UTC)
Received: by mail-pf0-f194.google.com with SMTP id w12so510238pfk.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Jun 2017 08:23:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=VkzQlCvNcZ6kAcUD2E30XR2J99tpzScwVWpndwntAps=;
	b=ZwjfOhyAssbehakL87+Tj5lzzvVwnAtAKKd/pYdY2U4TS0J2aRGoot/cgorR6ApQjI
	Q9Uhaa9LYk8G7YUHy4Td4oZal+vnuibRM73XW6tcc7lKuOUFDz+bBMuPfmIp6jYV1Vzd
	J2mdvfiamxR8LwdsaFN6KnUtirXWvjTSmErNqj4FM5LjjdExwKjUZ4k7yYFv5vUmTFq2
	bzAFsrahR84P3rzEKy/UVYMrx4cBtZ9slzIWXbInWLcW5E35mmOU34Di8Snkmw1ZxTjg
	qoV+gA3FjV7G9AmPXcdSTF8Q3lVq+9tYM0CaI6OpC9uZfiK246ZxgGHXsGdQj52HUy87
	rrEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=VkzQlCvNcZ6kAcUD2E30XR2J99tpzScwVWpndwntAps=;
	b=TcFdRTnUo5DgelTgMmNkgDq1tdqrSTLu7ot/VGnbHoPybOAO1fdlq7WCLYvo0HAiIJ
	TSXGVUUdMg3Z50y/S3kuXqtDwkBRj+nr8xX89z88TyGgM1oimFOiYyofhEE+pUc4kIJT
	qR0RWTIexFp9v0QC80YP98KeDZnVwUeYM5nkmefG/PZW2+d3BhtFX4KjrLvbzF0X8nmc
	KBFQxWYfEwMf5RCfkmsZ0CAZq8cqhzcBzy5npGMBXAenzEWPu9zimFeWkpCWXKrT2yET
	ff5ZLYv4ykBklE5Z2VXIjIgQQY+lkPYKYzp2dzvWgbYfJOvP4huvv/1vtMvub3YnHMiY
	KQsw==
X-Gm-Message-State: AKS2vOwbiFpXwDB5PUph1NdHGk5FRldEDNMCJ/XSJV+Fdk1Zgttm+hs1
	CoeY6qvGp6v2851G
X-Received: by 10.84.236.66 with SMTP id h2mr657897pln.233.1497453820291;
	Wed, 14 Jun 2017 08:23:40 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8882:b8c::264a])
	by smtp.gmail.com with ESMTPSA id i2sm502948pfe.89.2017.06.14.08.23.38
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 14 Jun 2017 08:23:39 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 14 Jun 2017 08:23:20 -0700
Message-Id: <68f0709c949f9264e5164d549c12bf67b773374b.1497453168.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.13.1
In-Reply-To: <cover.1497453168.git.raj.khem@gmail.com>
References: <cover.1497453168.git.raj.khem@gmail.com>
Subject: [PATCH 01/10] gcc: Introduce a knob to configure gcc to default to PIE
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
X-List-Received-Date: Wed, 14 Jun 2017 15:23:39 -0000

GCCPIE flag which is empty by default adds "--enable-default-pie"
configure option for harderned distros

We do not require to add -fpie -pie flag externally anymore

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/conf/distro/include/security_flags.inc        | 4 +++-
 meta/recipes-devtools/gcc/gcc-configure-common.inc | 3 +++
 2 files changed, 6 insertions(+), 1 deletion(-)

diff --git a/meta/conf/distro/include/security_flags.inc b/meta/conf/distro/include/security_flags.inc
index e162abeb3d..d3b7257240 100644
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
index 086525997e..af3575355c 100644
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
2.13.1


