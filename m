Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f194.google.com (mail-pf0-f194.google.com
	[209.85.192.194])
	by mail.openembedded.org (Postfix) with ESMTP id BF0D378288
	for <openembedded-core@lists.openembedded.org>;
	Sat,  1 Jul 2017 14:23:43 +0000 (UTC)
Received: by mail-pf0-f194.google.com with SMTP id e199so20438363pfh.0
	for <openembedded-core@lists.openembedded.org>;
	Sat, 01 Jul 2017 07:23:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=1N+2dhs28SnuvFCty7CEt3Go0xzLoY4ZxXyhiIy573k=;
	b=CCipb2xVZu599ZyAS/6/+hpOfO4qcrbpdlJEwtwpCz7ohRITRO5BY/jF8wWeCmI8X1
	d/t/CSmUGKEmJ8Gc2oRfdtB6UXoDagwV02p/O6wrDOBcF9bHWtZy6b2cQjAEkXHN3UGO
	RbXRER00FlsesRXtxhgwuryJuH3lOrs9qVLJ0DzNHgWPQusrzEYIkm2MOwuUCrkYF4SY
	cxUfRfvl0eLSyprUAzb+beqcqtj0VC6S+4H/z4vG8uOl4zVcdVjT2TiNLWBVrOLH1vi7
	EoPBUMv/8mqR8AjTERadjNSCxqCK4KcbB8TvK3WpdOS1GrjkxIxanh2KbcFksEgK+zX6
	avDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=1N+2dhs28SnuvFCty7CEt3Go0xzLoY4ZxXyhiIy573k=;
	b=k3nrnZj36+Jg+Oj3AM2EVDdcJuokrYxxq8g72c4A3T4OX1HDw14+7z67xQXHL3bA2I
	WJKDqyFVBxVh6TfY9l5C2kk05WBNNOf/MiL9wXOfxT/M5P2vkE+s7oKbjrwZ3mRlmXcr
	OkAQfd1JXE50uLB+0ECe5vK+/0CmBZWhA4T4bzrZVHqf73S71yfiNxPgTjW9wNsS/EVG
	Hzi/XlpzJIEiaap+GxOxGb3qRM68VCf0py3wXi0V/YfXmNX+4jNgQSTAvvtIzNrKqUjy
	+rG28lhpn61OMYf/Oang7+8s4SSkA3vQqYrHibyQ7h9iNhWxQ8nYy4r28xdPnzCbP+t5
	oZ8w==
X-Gm-Message-State: AIVw111u7DiHzi2fA0Q7T3PliCN6L8z0uaD8j4eaSGX1S29ABZzVmHhP
	0+MBQGGQ1NaaSICc
X-Received: by 10.84.232.79 with SMTP id f15mr967064pln.189.1498919024604;
	Sat, 01 Jul 2017 07:23:44 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8882:b8c::3df3])
	by smtp.gmail.com with ESMTPSA id
	17sm25026909pfn.84.2017.07.01.07.23.43
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 01 Jul 2017 07:23:43 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat,  1 Jul 2017 07:23:07 -0700
Message-Id: <776e6811105e112f7e924883eed5ed4fadb0d0e8.1498893436.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.13.2
In-Reply-To: <cover.1498893436.git.raj.khem@gmail.com>
References: <cover.1498893436.git.raj.khem@gmail.com>
Subject: [PATCH 04/19] gcc: Introduce a knob to configure gcc to default to PIE
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
X-List-Received-Date: Sat, 01 Jul 2017 14:23:44 -0000

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


