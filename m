Return-Path: <andre.draszik@gmail.com>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id 42B05731B9
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Jun 2016 10:58:35 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id 187so4028738wmz.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Jun 2016 03:58:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=6wlfZ7IZbMOzV79uZ0TbevztpIkLNrBX8cf+YUDQb9E=;
	b=DMmJzB5miu7C2d6cs/p/cSobJe7JnZYCbEq77LjMwnkrgz5HYPL70Nu7CvJKu9mrHO
	UABmqrP3Z73oOIrXXHznOvUiWPbRWQtmjZUXzuyX/45b5YC4qG2kYZswQXTJPUCdPQ1p
	2lq/t5kQxoNIa+I6mVYJQTis6X4eZgB/f00HjEV34fUt2BioUyc+HSbPTtzaHkkoIw+8
	lJwqioylpGwk5NddGNw2MtKcsvbJs2hNwMiLpRzFNcgybKhcPkGgAAram45jseSq88E3
	KgCGm7b513e5BRe/mhWqifQfvOsd+EUaLTe2N6AX8sFy/b0CDQZozFVGXwSjawpV7OBO
	dCiA==
X-Gm-Message-State: ALyK8tLkRXBjtfvL3bnbvhM2ngCClssRbbdJ6j1D24h+oF2CvaRwhYA0BJmEPFhS2eQk5g==
X-Received: by 10.28.46.71 with SMTP id u68mr5025017wmu.99.1466765915496;
	Fri, 24 Jun 2016 03:58:35 -0700 (PDT)
Received: from tfsielt31850.TYCOFS.COM ([185.46.212.65])
	by smtp.gmail.com with ESMTPSA id q69sm2574157wmd.4.2016.06.24.03.58.34
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 24 Jun 2016 03:58:34 -0700 (PDT)
From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <git@andred.net>
To: openembedded-core@lists.openembedded.org
Date: Fri, 24 Jun 2016 11:58:30 +0100
Message-Id: <1466765910-22989-4-git-send-email-git@andred.net>
X-Mailer: git-send-email 2.8.1
In-Reply-To: <1466765910-22989-1-git-send-email-git@andred.net>
References: <1466765910-22989-1-git-send-email-git@andred.net>
MIME-Version: 1.0
Subject: [PATCH 4/4] glib: disable valgrind support when compiling in mips16e mode
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
X-List-Received-Date: Fri, 24 Jun 2016 10:58:35 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: André Draszik <adraszik@tycoint.com>

| mipsel-poky-linux-uclibc-gcc -mel -mabi=32 -msoft-float \
|   -march=mips32r2 -mips16 -minterlink-compressed -mtune=24kec \
|   -mdsp --sysroot=<sysroot> -DHAVE_CONFIG_H -I. \
|   -I<glib>/glib -I.. -I.. -I../glib -I<glib>/glib -I<glib> \
|   -DG_LOG_DOMAIN=\"GLib\" -DG_DISABLE_CAST_CHECKS -DGLIB_COMPILATION \
|   -DPCRE_STATIC -pthread -Wall -Wstrict-prototypes \
|   -Werror=declaration-after-statement -Werror=missing-prototypes \
|   -Werror=implicit-function-declaration -Werror=pointer-arith \
|   -Werror=init-self -Werror=format=2 -Werror=missing-include-dirs \
|   -fvisibility=hidden -O2 -pipe -g -feliminate-unused-debug-types \
|   -c <glib>/glib/gslice.c  -fPIC -DPIC -o .libs/libglib_2_0_la-gslice.o
| {standard input}: Assembler messages:
| {standard input}:2485: Error: invalid operands `move $11,$8'
| {standard input}:2487: Error: invalid operands `srl $0,$0,13'
| {standard input}:2488: Error: invalid operands `srl $0,$0,29'
| {standard input}:2489: Error: invalid operands `srl $0,$0,3'
| {standard input}:2490: Error: invalid operands `srl $0,$0,19'
| {standard input}:2491: Error: invalid operands `or $13,$13,$13'
| Makefile:2076: recipe for target 'libglib_2_0_la-gslice.lo' failed

The alternative would probably be to force compilation in normal mips
mode for all of glib (as is done for armv4 and armv5). While that
would retain the valgrind support, valgrind support itself shouldn't
be needed on the target device, and we rather keep the mips16e mode.

Signed-off-by: André Draszik <adraszik@tycoint.com>
---
 meta/recipes-core/glib-2.0/glib.inc | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-core/glib-2.0/glib.inc b/meta/recipes-core/glib-2.0/glib.inc
index c6b8e57..767492d 100644
--- a/meta/recipes-core/glib-2.0/glib.inc
+++ b/meta/recipes-core/glib-2.0/glib.inc
@@ -68,6 +68,9 @@ FILES_${PN}-utils = "${bindir}/*"
 
 ARM_INSTRUCTION_SET_armv4 = "arm"
 ARM_INSTRUCTION_SET_armv5 = "arm"
+# Valgrind runtime detection works using hand-written assembly, which
+# doesn't support mips16e
+CPPFLAGS_append_class-target_mips16e = " -DNVALGRIND=1"
 
 USE_NLS = "yes"
 
-- 
2.8.1


