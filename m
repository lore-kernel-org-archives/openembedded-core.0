Return-Path: <raj.khem@gmail.com>
Received: from mail-io0-f177.google.com (mail-io0-f177.google.com
	[209.85.223.177])
	by mail.openembedded.org (Postfix) with ESMTP id D302B76BF5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Aug 2015 20:03:47 +0000 (UTC)
Received: by iodt126 with SMTP id t126so162648577iod.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Aug 2015 13:03:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=3w79gX+L9zGNlAI9OTA/XPdTWP2LWvBh5SoFIkxAwSE=;
	b=SD5E1VvdaVh0dqSwfejnAUlajgII8Bu91BlAUE3AnigQfRmpbH/AUqfDY7sei5m8da
	J/h8VlZ+nGDCcZqhpAFzpVlhNuENvpATUnpgVIBCDohrhPptol6hGbGROTWZDdZlLdtR
	0ojkE9lHxQzhZOP8nVbMZ/GvLsHx23aqdxlESfxyKEOwJ1mi02Y6O/AIg4bTsA9oY6as
	tUukfSfzstmAnyJrZ3BUq4Q9x6jhX5wWvKBY5JkvNTGts0iCddEd7k5t5MNh0Je3ZnU9
	Hbk2/5IxBzhVsdxLtGYvmE4sqkQQUE59Q08LO4Ty/FgvGIC09BHRJ/1X/ZNGwuL1Hy2c
	Cb9g==
X-Received: by 10.107.18.67 with SMTP id a64mr25730347ioj.106.1440446627496;
	Mon, 24 Aug 2015 13:03:47 -0700 (PDT)
Received: from dvm-ch2e-038.sys.comcast.net (a-96-119-89-79.sys.comcast.net.
	[96.119.89.79]) by smtp.gmail.com with ESMTPSA id
	hh9sm9538417igb.18.2015.08.24.13.03.46
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 24 Aug 2015 13:03:47 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 24 Aug 2015 13:03:31 -0700
Message-Id: <b05830f097799a68010e1c091713e581bba219e6.1440446289.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <87b72ec93b53c0a0ac61950f52480fa86a93c937.1440446289.git.raj.khem@gmail.com>
References: <87b72ec93b53c0a0ac61950f52480fa86a93c937.1440446289.git.raj.khem@gmail.com>
In-Reply-To: <cover.1440446289.git.raj.khem@gmail.com>
References: <cover.1440446289.git.raj.khem@gmail.com>
Subject: [PATCH 13/17] diffstat: Add TOOLCHAIN_OPTIONS to Linker calls
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
X-List-Received-Date: Mon, 24 Aug 2015 20:03:49 -0000

configure in this case does a novel thing where it drops all additional
compiler options from CC variable into CFLAGS which in OE's case include
the options added by TOOLCHAIN_OPTIONS and then it does exactly same for
LD as well, the problem starts when we miss the --sysroot options and
ABI options which are part of CC variables usually in OE, in the end it
assigns LD = CC but doesnt add newly separated CFLAGS to LDFLAGS hence
the compile still works since all those needed options are getting into
compiler cmdline but link step fails especially when using gold, since
it does not find --sysroot option on cmdline it starts to complain about
missing libraries and paths

This shows up with clang more so because clang does not have implicit
sysroot that it silently passes down to linker like gcc does when
confgured with sysroot

We see errors like

arm-angstrom-linux-gnueabi-clang -c -I.
-I/mnt/home/kraj/work/angstrom/build/tmp-angstrom-glibc/work/armv7at2hf-vfp-neon-angstrom-linux-gnueabi/diffstat/1.60-r0/diffstat-1.60
-DHAVE_CONFIG_H   -D__extern_always_inline=inline -D_GNU_SOURCE -O2
-pipe -g -feliminate-unused-debug-types  -march=armv7-a -mthumb
-mfloat-abi=hard -mfpu=neon -no-integrated-as
--sysroot=/mnt/home/kraj/work/angstrom/build/tmp-angstrom-glibc/sysroots/raspberrypi2
/mnt/home/kraj/work/angstrom/build/tmp-angstrom-glibc/work/armv7at2hf-vfp-neon-angstrom-linux-gnueabi/diffstat/1.60-r0/diffstat-1.60/diffstat.c
NOTE: make -j 16
arm-angstrom-linux-gnueabi-clang -Wl,-O1 -Wl,--hash-style=gnu
-Wl,--as-needed -o diffstat diffstat.o
/mnt/home/kraj/work/angstrom/build/tmp-angstrom-glibc/sysroots/x86_64-linux/usr/bin/arm-angstrom-linux-gnueabi/arm-angstrom-linux-gnueabi-ld:
error: cannot open crt1.o: No such file or directory
/mnt/home/kraj/work/angstrom/build/tmp-angstrom-glibc/sysroots/x86_64-linux/usr/bin/arm-angstrom-linux-gnueabi/arm-angstrom-linux-gnueabi-ld:
error: cannot open crti.o: No such file or directory
/mnt/home/kraj/work/angstrom/build/tmp-angstrom-glibc/sysroots/x86_64-linux/usr/bin/arm-angstrom-linux-gnueabi/arm-angstrom-linux-gnueabi-ld:
error: cannot open crtbegin.o: No such file or directory
/mnt/home/kraj/work/angstrom/build/tmp-angstrom-glibc/sysroots/x86_64-linux/usr/bin/arm-angstrom-linux-gnueabi/arm-angstrom-linux-gnueabi-ld:
error: cannot open crtend.o: No such file or directory
/mnt/home/kraj/work/angstrom/build/tmp-angstrom-glibc/sysroots/x86_64-linux/usr/bin/arm-angstrom-linux-gnueabi/arm-angstrom-linux-gnueabi-ld:
error: cannot open crtn.o: No such file or directory
/mnt/home/kraj/work/angstrom/build/tmp-angstrom-glibc/sysroots/x86_64-linux/usr/bin/arm-angstrom-linux-gnueabi/arm-angstrom-linux-gnueabi-ld:
error: cannot find -lgcc
/mnt/home/kraj/work/angstrom/build/tmp-angstrom-glibc/sysroots/x86_64-linux/usr/bin/arm-angstrom-linux-gnueabi/arm-angstrom-linux-gnueabi-ld:
error: cannot find -lgcc
/mnt/home/kraj/work/angstrom/build/tmp-angstrom-glibc/sysroots/x86_64-linux/usr/bin/arm-angstrom-linux-gnueabi/arm-angstrom-linux-gnueabi-ld:
error: cannot find -lgcc
/mnt/home/kraj/work/angstrom/build/tmp-angstrom-glibc/sysroots/x86_64-linux/usr/bin/arm-angstrom-linux-gnueabi/arm-angstrom-linux-gnueabi-ld:
error: cannot find -lgcc

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-devtools/diffstat/diffstat_1.60.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-devtools/diffstat/diffstat_1.60.bb b/meta/recipes-devtools/diffstat/diffstat_1.60.bb
index 29c32a8..25ba4da 100644
--- a/meta/recipes-devtools/diffstat/diffstat_1.60.bb
+++ b/meta/recipes-devtools/diffstat/diffstat_1.60.bb
@@ -18,6 +18,8 @@ S = "${WORKDIR}/diffstat-${PV}"
 
 inherit autotools gettext ptest
 
+LDFLAGS += "${TOOLCHAIN_OPTIONS}"
+
 do_configure () {
 	if [ ! -e ${S}/acinclude.m4 ]; then
 		mv ${S}/aclocal.m4 ${S}/acinclude.m4
-- 
2.1.4


