Return-Path: <raj.khem@gmail.com>
Received: from mail-pl0-f66.google.com (mail-pl0-f66.google.com
	[209.85.160.66])
	by mail.openembedded.org (Postfix) with ESMTP id 61395744F9
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Apr 2018 06:50:35 +0000 (UTC)
Received: by mail-pl0-f66.google.com with SMTP id t20-v6so9485735ply.9
	for <openembedded-core@lists.openembedded.org>;
	Sun, 15 Apr 2018 23:50:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=GYC8GjwZodQPQ4S17ZXlj5gEmFAFtoxhcPT1zboyBsc=;
	b=D9ziJyly5wpq0h0fLYkjwBIgL9n9ZuUKNmzrAHMLqPhLURDRd78K6x2F5Hx5Fbm+TU
	G97E+JEjYX0+/qintrv9rOWN9e2FrTSdWA2WgISuflNJtPSTkTNo+WJIF5QxJI3RhLiI
	V0LxDzuUhUSA48z8JZxRbPboMNNusZFuEiCMi1EQWoMJK4whlrDM8xQg5ERY4GWkD05T
	JORghWvS2BHv7MgA3dmvUAB3pXcyyukB8yoDnbyGmPvB0GgFMjsHoF4TzVLFGcGZceiC
	TJNUMyO8BrV6OMb1TkpCOwPvehQKlkZkCfe4C/Q3HtZakZjtAf9dFS/Zr1xxpFyBOOZ1
	oNAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=GYC8GjwZodQPQ4S17ZXlj5gEmFAFtoxhcPT1zboyBsc=;
	b=GK5gOxgx1oT1Ljun7LfpbWk1PKMevee6anGlHkOilA9MM+Cneb9kCEOBU67QP+RVD0
	gyTDOSRONWylhLHEXmnF4xQ2ReIVxjEXngxAH13d4bCkVxH3IiyuMSaUu5TeNhtcgzHk
	ITtM91D+rRe0gqqhun2Dy8VL+2JurgT7P+/dAaiPzc2yX4n0Nvpe8cbKPI65+VKZQTAs
	PqVLmv3wfmBzD+agmZ4ajOHXiR9vxpsV37soXsyBsMmlTfFqpzpsghCYqVpjOyfcNx7r
	u9xZr8YSNQZapWrvSTNx/hsz2u6bDwnKGLMJtJ23KjvjNfmZ7KxQiwDvV663LmGvngSa
	w/gQ==
X-Gm-Message-State: ALQs6tB8EjauUyr3q/eE/qJzdVF2XV7KTxIJUA6UtBn7OehB7oqBtjyc
	dtWE9CD5xgZgpfzNJX6Adn56hQ==
X-Google-Smtp-Source: AIpwx4/ozDNEF/B6tjt0qU50X7raTJyDKpHnDPbRGkEQXFi81xUQ6/bBAblF4x9F2X0Hz0mLOyOZsQ==
X-Received: by 2002:a17:902:bd03:: with SMTP id
	p3-v6mr14378185pls.236.1523861436234; 
	Sun, 15 Apr 2018 23:50:36 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8880:466c::487b])
	by smtp.gmail.com with ESMTPSA id
	o13sm2388362pgn.54.2018.04.15.23.50.34
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 15 Apr 2018 23:50:34 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 15 Apr 2018 23:50:13 -0700
Message-Id: <20180416065014.29385-3-raj.khem@gmail.com>
X-Mailer: git-send-email 2.17.0
In-Reply-To: <20180416065014.29385-1-raj.khem@gmail.com>
References: <20180416065014.29385-1-raj.khem@gmail.com>
Subject: [PATCH 3/4] gcc-runtime: Disable gcc version of libssp
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
X-List-Received-Date: Mon, 16 Apr 2018 06:50:35 -0000

libssp is implemented fully in glibc as well as in musl
so we really do not need the gcc version of this library
except may be for mingw, where we keep it enabled anyway
gcc in OE is built with the knowledge that C library
already provides libssp implementation, we should therefore
not need the gcc implementation of same.

libssp_nonshared piece is a detail which is needed when gcc
is the compiler, in glibc this is part of libc_nonshared.a
already and libc_nonshared.a is linked always when linking
with -lc becuase libc.so in glibc is actually a linker script

GROUP ( /usr/lib/libc.so.6 /usr/lib/libc_nonshared.a  AS_NEEDED ( /usr/lib/ld-linux-x86-64.so.2 ) )

which automatically links in the needed runtime bits, this however
is not the case for musl, where core SSP APIs are implemented in full
but compiler specific runtime isn't, for this we add a new package
called libssp_nonshared which generate the needed runtime stub
and gcc is already carrying patch to link to libssp_nonshared.a
on musl

This should fix a long standing problem where static PIE executable
were not buildable with OE since it was conflicting SSP implementation
one from C library and the other one from gcc and we end up with
duplicate symbol errors during linking.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-devtools/gcc/gcc-7.3.inc     | 4 +++-
 meta/recipes-devtools/gcc/gcc-runtime.inc | 4 +++-
 2 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/gcc/gcc-7.3.inc b/meta/recipes-devtools/gcc/gcc-7.3.inc
index d968c322d2..7e52afc643 100644
--- a/meta/recipes-devtools/gcc/gcc-7.3.inc
+++ b/meta/recipes-devtools/gcc/gcc-7.3.inc
@@ -93,10 +93,12 @@ FORTRAN = ""
 JAVA = ""
 
 LTO = "--enable-lto"
+SSP ?= "--disable-libssp"
+SSP_mingw = "--enable-libssp"
 
 EXTRA_OECONF_BASE = "\
     ${LTO} \
-    --enable-libssp \
+    ${SSP} \
     --enable-libitm \
     --disable-bootstrap \
     --disable-libmudflap \
diff --git a/meta/recipes-devtools/gcc/gcc-runtime.inc b/meta/recipes-devtools/gcc/gcc-runtime.inc
index 97365a21dc..b4e5539575 100644
--- a/meta/recipes-devtools/gcc/gcc-runtime.inc
+++ b/meta/recipes-devtools/gcc/gcc-runtime.inc
@@ -24,8 +24,10 @@ RUNTIMELIBITM_nios2 = ""
 RUNTIMELIBITM_microblaze = ""
 RUNTIMELIBITM_riscv32 = ""
 RUNTIMELIBITM_riscv64 = ""
+RUNTIMELIBSSP ?= ""
+RUNTIMELIBSSP_mingw ?= "libssp"
 
-RUNTIMETARGET = "libssp libstdc++-v3 libgomp libatomic ${RUNTIMELIBITM} \
+RUNTIMETARGET = "libstdc++-v3 libgomp libatomic ${RUNTIMELIBITM} \
     ${@bb.utils.contains_any('FORTRAN', [',fortran',',f77'], 'libquadmath', '', d)} \
 "
 RUNTIMETARGET_append_x86 = " libmpx"
-- 
2.17.0


