Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BBDB4EB64D9
	for <webhook@archiver.kernel.org>; Thu, 29 Jun 2023 09:35:34 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
 by mx.groups.io with SMTP id smtpd.web11.4541.1688031325010547035
 for <openembedded-core@lists.openembedded.org>;
 Thu, 29 Jun 2023 02:35:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=NWxKQ3+m;
 spf=pass (domain: bootlin.com, ip: 217.70.183.198, mailfrom: alexandre.belloni@bootlin.com)
X-GND-Sasl: alexandre.belloni@bootlin.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1688031323;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Vj39XVBN3q+OAgMXPZbLMFRi03iJZTMNvNO63yyjECs=;
	b=NWxKQ3+m72jCRgqhkJA3jrMn1OQ3isN6WfGg6HRtqSQLdZVtS0WsaO16kJq21BtNL6c2XR
	BbW/lBp2AMLG/AMu6ii4nr77dnav4uR8a0eiOs2cm2aQh2mUSn1b0Rr2IYy+gcyAn8EpnS
	8bccwFeX9ugQcs2qIEw0drDu2ltbAzEPVlgcvtdrlx64DQb+bGX4mfC/KlyTfowtUf6GHE
	qq32MMkBGV4dzFRBDLKRi8ek9Oei/DviyCBAZxq6eLHlGXkoocMzfJ1ne3ukP4Bdd4MnYl
	Tnninjm89hhbKQrpazGwmakzEB3V9BbSOuq4Ty3eDDiLF9IXtaY94gUNLfuY0g==
X-GND-Sasl: alexandre.belloni@bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id ACE13C0027;
	Thu, 29 Jun 2023 09:35:22 +0000 (UTC)
Date: Thu, 29 Jun 2023 11:35:22 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: "qiutt@fujitsu.com" <qiutt@fujitsu.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH V4] kbd: Add ptest support
Message-ID: <2023062909352285065e09@mail.local>
References: <1685601998-1446-1-git-send-email-qiutt@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1685601998-1446-1-git-send-email-qiutt@fujitsu.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 29 Jun 2023 09:35:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183613

Hello,

While this patch was working fine, it is now broken on master because of
the kbd upgrade to 2.6.0 from wangmy.

https://autobuilder.yoctoproject.org/typhoon/#/builders/102/builds/4812/steps/13/logs/stdio

ERROR: kbd-2.6.0-r0 do_compile_ptest_base: ExecutionError('/home/pokybuild/yocto-worker/qemumips-alt/build/build/tmp/work/mips32r2-poky-linux/kbd/2.6.0-r0/temp/run.do_compile_ptest_base.44912', 2, None, None)
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/qemumips-alt/build/build/tmp/work/mips32r2-poky-linux/kbd/2.6.0-r0/temp/log.do_compile_ptest_base.44912
Log data follows:
| DEBUG: Executing shell function do_compile_ptest_base
| sed: can't read /home/pokybuild/yocto-worker/qemumips-alt/build/build/tmp/work/mips32r2-poky-linux/kbd/2.6.0-r0/build/tests/libtswrap/Makefile: No such file or directory
| WARNING: /home/pokybuild/yocto-worker/qemumips-alt/build/build/tmp/work/mips32r2-poky-linux/kbd/2.6.0-r0/temp/run.do_compile_ptest_base.44912:162 exit 2 from 'sed -i 's,-D_TIME_BITS=64,,g' /home/pokybuild/yocto-worker/qemumips-alt/build/build/tmp/work/mips32r2-poky-linux/kbd/2.6.0-r0/build/tests/libtswrap/Makefile'
| WARNING: Backtrace (BB generated script):
| 	#1: do_compile_ptest, /home/pokybuild/yocto-worker/qemumips-alt/build/build/tmp/work/mips32r2-poky-linux/kbd/2.6.0-r0/temp/run.do_compile_ptest_base.44912, line 162
| 	#2: do_compile_ptest_base, /home/pokybuild/yocto-worker/qemumips-alt/build/build/tmp/work/mips32r2-poky-linux/kbd/2.6.0-r0/temp/run.do_compile_ptest_base.44912, line 151
| 	#3: main, /home/pokybuild/yocto-worker/qemumips-alt/build/build/tmp/work/mips32r2-poky-linux/kbd/2.6.0-r0/temp/run.do_compile_ptest_base.44912, line 205
NOTE: recipe kbd-2.6.0-r0: task do_compile_ptest_base: Failed
ERROR: Task (/home/pokybuild/yocto-worker/qemumips-alt/build/meta/recipes-core/kbd/kbd_2.6.0.bb:do_compile_ptest_base) failed with exit code '1'


On 01/06/2023 14:46:38+0800, qiutt@fujitsu.com wrote:
> From: Qiu Tingting <qiutt@fujitsu.com>
> 
> Add a ptest for kbd
> - It is taking around 1s to execute with kvm, so added it to PTESTS_FAST
> - It contains libkeymap unit tests(27 cases) and libkbdfile unit tests(13 cases)
> 
> Signed-off-by: Qiu Tingting <qiutt@fujitsu.com>
> ---
>  .../distro/include/ptest-packagelists.inc     |  1 +
>  meta/recipes-core/kbd/files/run-ptest         | 11 +++
>  meta/recipes-core/kbd/kbd_2.5.1.bb            | 74 ++++++++++++++++++-
>  3 files changed, 85 insertions(+), 1 deletion(-)
>  create mode 100644 meta/recipes-core/kbd/files/run-ptest
> 
> diff --git a/meta/conf/distro/include/ptest-packagelists.inc b/meta/conf/distro/include/ptest-packagelists.inc
> index da9153b998..7d5883604c 100644
> --- a/meta/conf/distro/include/ptest-packagelists.inc
> +++ b/meta/conf/distro/include/ptest-packagelists.inc
> @@ -27,6 +27,7 @@ PTESTS_FAST = "\
>      gzip \
>      json-c \
>      json-glib \
> +    kbd \
>      libconvert-asn1-perl \
>      liberror-perl \
>      libgpg-error\
> diff --git a/meta/recipes-core/kbd/files/run-ptest b/meta/recipes-core/kbd/files/run-ptest
> new file mode 100644
> index 0000000000..3b154c4d73
> --- /dev/null
> +++ b/meta/recipes-core/kbd/files/run-ptest
> @@ -0,0 +1,11 @@
> +#!/bin/sh
> +
> +# Define test work dir
> +WORKDIR=@PTEST_PATH@/tests/
> +
> +# Run test
> +cd ${WORKDIR}
> +
> +./testsuite -k unittest | sed -e '/[0-9]:/s/://' \
> +    -e '/ ok/s/^/PASS: /;/ FAILED/s/^/FAIL: /;/ skipped/s/^/SKIP: /' \
> +    -e '/ ok/s/ ok.*//;/ skipped/s/ skipped.*//;/ FAILED/s/ FAILED.*//'
> diff --git a/meta/recipes-core/kbd/kbd_2.5.1.bb b/meta/recipes-core/kbd/kbd_2.5.1.bb
> index 7662b8f685..283617aaaa 100644
> --- a/meta/recipes-core/kbd/kbd_2.5.1.bb
> +++ b/meta/recipes-core/kbd/kbd_2.5.1.bb
> @@ -5,7 +5,7 @@ DESCRIPTION = "The kbd project contains tools for managing Linux console (Linux
>  LICENSE = "GPL-2.0-or-later"
>  LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
>  
> -inherit autotools gettext pkgconfig
> +inherit autotools gettext pkgconfig ptest
>  
>  DEPENDS += "flex-native"
>  
> @@ -14,6 +14,7 @@ RPROVIDES:${PN} = "console-tools"
>  RCONFLICTS:${PN} = "console-tools"
>  
>  SRC_URI = "${KERNELORG_MIRROR}/linux/utils/${BPN}/${BP}.tar.xz \
> +           file://run-ptest \
>             "
>  
>  SRC_URI[sha256sum] = "ccdf452387a6380973d2927363e9cbb939fa2068915a6f937ff9d24522024683"
> @@ -45,3 +46,74 @@ ALTERNATIVE:${PN} = "chvt deallocvt fgconsole openvt showkey \
>  ALTERNATIVE_PRIORITY = "100"
>  
>  BBCLASSEXTEND = "native"
> +
> +do_compile_ptest() {
> +    # update DATADIR in Makefile
> +    sed -i 's,-DDATADIR=.*,-DDATADIR=\\\"${PTEST_PATH}/tests\\\" \\,g' ${B}/tests/libkeymap/Makefile
> +    sed -i 's,-DDATADIR=.*,-DDATADIR=\\\"${PTEST_PATH}/tests\\\" \\,g' ${B}/tests/helpers/Makefile
> +    sed -i 's,-DDATADIR=.*,-DDATADIR=\\\"${PTEST_PATH}/tests\\\" \\,g' ${B}/tests/libkbdfile/Makefile
> +
> +    # unset -D_TIME_BITS=64 in Makefile
> +    sed -i 's,-D_TIME_BITS=64,,g' ${B}/tests/libtswrap/Makefile
> +
> +    # recompile tests
> +    oe_runmake -C ${B}/tests/ clean
> +    oe_runmake -C ${B}/tests/
> +}
> +
> +do_install_ptest() {
> +    # install files from build directory
> +    install -d ${D}${PTEST_PATH}/tests/
> +    install --mode=755 ${B}/tests/atconfig ${D}${PTEST_PATH}/tests/
> +    install --mode=755 ${B}/tests/testsuite ${D}${PTEST_PATH}/tests/
> +    install -d ${D}${PTEST_PATH}/tests/libkeymap/
> +    find ${B}/tests/libkeymap/ -type f -not -name "*.o" -not -name "Makefile" \
> +        -exec install --mode=755 {} ${D}${PTEST_PATH}/tests/libkeymap/ \;
> +    install -d ${D}${PTEST_PATH}/tests/helpers/
> +    find ${B}/tests/helpers/ -type f -not -name "*.o" -not -name "Makefile" \
> +        -exec install --mode=755 {} ${D}${PTEST_PATH}/tests/helpers/ \;
> +    install -d ${D}${PTEST_PATH}/tests/libkbdfile/
> +    find ${B}/tests/libkbdfile/ -type f -not -name "*.o" -not -name "Makefile" \
> +        -exec install --mode=755 {} ${D}${PTEST_PATH}/tests/libkbdfile/ \;
> +    install -d ${D}${PTEST_PATH}/src/
> +    install --mode=755 ${B}/src/loadkeys ${D}${PTEST_PATH}/src/
> +
> +    # install files from src/data directory
> +    install -d ${D}${PTEST_PATH}/data/keymaps/i386/qwerty/
> +    install ${S}/data/keymaps/i386/qwerty/defkeymap.map ${D}${PTEST_PATH}/data/keymaps/i386/qwerty/
> +
> +    # install files from src/tests/data directory
> +    install -d ${D}${PTEST_PATH}/tests/data/
> +    install -d ${D}${PTEST_PATH}/tests/data/libkeymap/
> +    install ${S}/tests/data/libkeymap/* ${D}${PTEST_PATH}/tests/data/libkeymap/
> +    install -d ${D}${PTEST_PATH}/tests/data/alt-is-meta/
> +    install ${S}/tests/data/alt-is-meta/* ${D}${PTEST_PATH}/tests/data/alt-is-meta/
> +    install -d ${D}${PTEST_PATH}/tests/data/bkeymap-2.0.4/
> +    install ${S}/tests/data/bkeymap-2.0.4/* ${D}${PTEST_PATH}/tests/data/bkeymap-2.0.4/
> +    install -d ${D}${PTEST_PATH}/tests/data/dumpkeys-mktable/
> +    install ${S}/tests/data/dumpkeys-mktable/* ${D}${PTEST_PATH}/tests/data/dumpkeys-mktable/
> +    install -d ${D}${PTEST_PATH}/tests/data/dumpkeys-fulltable/
> +    install ${S}/tests/data/dumpkeys-fulltable/* ${D}${PTEST_PATH}/tests/data/dumpkeys-fulltable/
> +    install -d ${D}${PTEST_PATH}/tests/data/findfile/test_1/consolefonts/
> +    install ${S}/tests/data/findfile/test_1/consolefonts/* ${D}${PTEST_PATH}/tests/data/findfile/test_1/consolefonts/
> +    install -d ${D}${PTEST_PATH}/tests/data/findfile/test_0/keymaps/include/
> +    install ${S}/tests/data/findfile/test_0/keymaps/test0.map ${D}${PTEST_PATH}/tests/data/findfile/test_0/keymaps/
> +    install ${S}/tests/data/findfile/test_0/keymaps/include/* ${D}${PTEST_PATH}/tests/data/findfile/test_0/keymaps/include/
> +    install -d ${D}${PTEST_PATH}/tests/data/findfile/test_0/keymaps/i386/include/
> +    install ${S}/tests/data/findfile/test_0/keymaps/i386/include/* ${D}${PTEST_PATH}/tests/data/findfile/test_0/keymaps/i386/include/
> +    install -d ${D}${PTEST_PATH}/tests/data/findfile/test_0/keymaps/i386/qwerty/
> +    install ${S}/tests/data/findfile/test_0/keymaps/i386/qwerty/* ${D}${PTEST_PATH}/tests/data/findfile/test_0/keymaps/i386/qwerty/
> +    install -d ${D}${PTEST_PATH}/tests/data/findfile/test_0/keymaps/i386/qwertz/
> +    install ${S}/tests/data/findfile/test_0/keymaps/i386/qwertz/* ${D}${PTEST_PATH}/tests/data/findfile/test_0/keymaps/i386/qwertz/
> +    install -d ${D}${PTEST_PATH}/tests/data/keymaps/i386/qwerty/
> +    install ${S}/tests/data/keymaps/i386/qwerty/* ${D}${PTEST_PATH}/tests/data/keymaps/i386/qwerty/
> +    install -d ${D}${PTEST_PATH}/tests/data/keymaps/i386/include/
> +    install ${S}/tests/data/keymaps/i386/include/* ${D}${PTEST_PATH}/tests/data/keymaps/i386/include/
> +    install -d ${D}${PTEST_PATH}/tests/data/keymaps/include/
> +    install ${S}/tests/data/keymaps/include/* ${D}${PTEST_PATH}/tests/data/keymaps/include/
> +
> +
> +    # update PTEST_PATH in run-ptest and atconfig
> +    sed -i "s#@PTEST_PATH@#${PTEST_PATH}#g" ${D}${PTEST_PATH}/run-ptest
> +    sed -i -e 's,${B},${PTEST_PATH},g' -e 's,/\.\./kbd-2.5.1,,g' ${D}${PTEST_PATH}/tests/atconfig
> +}
> -- 
> 2.25.1
> 

> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#182045): https://lists.openembedded.org/g/openembedded-core/message/182045
> Mute This Topic: https://lists.openembedded.org/mt/99258821/3617179
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alexandre.belloni@bootlin.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

