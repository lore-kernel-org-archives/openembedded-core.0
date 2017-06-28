Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f67.google.com (mail-pg0-f67.google.com [74.125.83.67])
	by mail.openembedded.org (Postfix) with ESMTP id 4F5A277FF6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Jun 2017 16:04:35 +0000 (UTC)
Received: by mail-pg0-f67.google.com with SMTP id j186so8715949pge.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Jun 2017 09:04:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=1N+2dhs28SnuvFCty7CEt3Go0xzLoY4ZxXyhiIy573k=;
	b=tqhfWCZENYk+hbAkyGZuCA01p7sJO0IJEhN2Lkp2QGZzLHeKOti4nRceXeJk2taLTh
	rN+7uek2PJud2tzA+VjEMXl095zgw9SRajPej9bY5A6KpdpiHNlK6fcutM2bKn1FWvuw
	x76eVKWkYlFbL7tpshybi/lGoUeEC8kBAO4VfK0UKKgyjgIIgjZixXI9jutr4cC0I6LL
	NsvLNIStCwcv32rF2z6SWgGn55HBMRVUU3oFPPnNXnOEENNBI3EddFSD3RD5YIQTSirA
	r+zLSJVe50rSJKLwrK4Vs0+hy92YZOAC6xWmmkJv8aGAUnTQovSSKXDxgii2n5QbIgID
	wn+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=1N+2dhs28SnuvFCty7CEt3Go0xzLoY4ZxXyhiIy573k=;
	b=MMey4Kz6+gLpbaWOEoZHVCH6iFbBMZUWbEmchSGaIZtJzN97CmNnnEIrzxYdAF+qei
	T1fYgvLoyrJ6R14E4KtgxGAtCWs4dP+8TxdPLCDtkIHoiCyzUBa/UK4bvN3oFPzcDIyR
	O4Zg2WQ0nWOmI9V3HWvbfAYn2HuhP5T4SqnBemJgfWQZDoOL3tviLRaNMTj2Dqjz2CN6
	lW02CoYq8I4HU2fFnHl9mICuS9KULOaJ/loVEAmk3YFcUWV1ml8H2QYCISgJSGegZ0Zx
	A9oOvhhRzM3iZd0trHqbZwFmfq3xCVZfHbSFrzeZRmRBJIhc/CK7zER3x4B3qj1Kz2Dr
	bIeg==
X-Gm-Message-State: AKS2vOw3rHGO87wElV1aqHEDqbVrdM78uQaapZXtB+YEH/k5XrHO0Gu2
	mqbfbyhHZL+x/1l3
X-Received: by 10.84.128.69 with SMTP id 63mr12412962pla.54.1498665876924;
	Wed, 28 Jun 2017 09:04:36 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8882:b8c::3df3])
	by smtp.gmail.com with ESMTPSA id
	v62sm5243608pfb.124.2017.06.28.09.04.35
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 28 Jun 2017 09:04:35 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 28 Jun 2017 09:04:14 -0700
Message-Id: <d4f2bfa0a53e7da46254275e294b12a41efd80a0.1498665211.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.13.2
In-Reply-To: <cover.1498665211.git.raj.khem@gmail.com>
References: <cover.1498665211.git.raj.khem@gmail.com>
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
X-List-Received-Date: Wed, 28 Jun 2017 16:04:37 -0000

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


