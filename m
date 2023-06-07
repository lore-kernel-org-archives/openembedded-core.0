Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76DD5C7EE25
	for <webhook@archiver.kernel.org>; Wed,  7 Jun 2023 12:34:17 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
 by mx.groups.io with SMTP id smtpd.web10.7251.1686141256605477490
 for <openembedded-core@lists.openembedded.org>;
 Wed, 07 Jun 2023 05:34:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=dK7D/Mrm;
 spf=pass (domain: bootlin.com, ip: 217.70.183.194, mailfrom: alexandre.belloni@bootlin.com)
X-GND-Sasl: alexandre.belloni@bootlin.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1686141254;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=GdCaWWMR1uhe64cvzkdADTiNszcu+PdRA0RHxwwfAn4=;
	b=dK7D/Mrm1TUSKYrbQTZ/nUGtquVFaDXWJDH86I70MZ5/AmSWVSqlwk+Mdu3apGs6A28QOb
	FltmoRF6OICdR9b4YsQRTAI+oWAaNowRgB33MDhRrkeN+FQx0HBbVviNtUKCYd3snq1cp1
	yf92tCGKgUJW3FDhpjASh0Uwgs+Mo6YK6j6PUv/38ZbYZEryZ8+sMxnCeqPz2nMcmR8NvN
	TwOF7EWqil1MVO+s6QDXTkCLWBxkmC+kbN46wQCLtIU/M9PDc38Wg0glZX4dW/BZnKrc7A
	HDebVSkmjSCtuHElXaXIRfteZ28gYdYyg8AbGueURJrUJrn2tTn+ZKq+dUmBJQ==
X-GND-Sasl: alexandre.belloni@bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 6553940004;
	Wed,  7 Jun 2023 12:34:14 +0000 (UTC)
Date: Wed, 7 Jun 2023 14:34:14 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Sudip Mukherjee <sudipm.mukherjee@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH] libssh2: Upgrade to v1.11.0
Message-ID: <2023060712341407b7c7f8@mail.local>
References: <20230602213452.23696-1-sudipm.mukherjee@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230602213452.23696-1-sudipm.mukherjee@gmail.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 07 Jun 2023 12:34:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182476

Hello,

this doesn't build:

https://autobuilder.yoctoproject.org/typhoon/#/builders/107/builds/4674/steps/12/logs/stdio
| /usr/src/debug/libssh2/1.11.0-r0/tests/test_auth_keyboard_info_request.c:270: undefined reference to `userauth_keyboard_interactive_decode_info_request'
| collect2: error: ld returned 1 exit status
| make[3]: *** [Makefile:973: test_auth_keyboard_info_request] Error 1



https://autobuilder.yoctoproject.org/typhoon/#/builders/106/builds/6210/steps/12/logs/stdio
| /home/pokybuild/yocto-worker/beaglebone-alt/build/build/tmp/work/cortexa8hf-neon-poky-linux-gnueabi/libssh2/1.11.0-r0/recipe-sysroot-native/usr/bin/arm-poky-linux-gnueabi/../../libexec/arm-poky-linux-gnueabi/gcc/arm-poky-linux-gnueabi/13.1.1/ld: test_hostkey.o: in function `test':
| /usr/src/debug/libssh2/1.11.0-r0/tests/test_hostkey.c:43: undefined reference to `_libssh2_base64_decode'
| collect2: error: ld returned 1 exit status
| make[3]: Leaving directory '/home/pokybuild/yocto-worker/beaglebone-alt/build/build/tmp/work/cortexa8hf-neon-poky-linux-gnueabi/libssh2/1.11.0-r0/build/tests'
| make[3]: *** [Makefile:1037: test_hostkey] Error 1


On 02/06/2023 22:34:52+0100, Sudip Mukherjee wrote:
> Changes:
> Update license checksum: change in copyright year.
> Remove patch fixed by upstream.
> Disable rpath, hardcoded rpath failed curl-native build.
> Adjust ptests.
> 
> Signed-off-by: Sudip Mukherjee <sudipm.mukherjee@gmail.com>
> ---
>  .../libssh2/libssh2/fix-ssh2-test.patch       | 23 -------------------
>  .../recipes-support/libssh2/libssh2/run-ptest |  2 +-
>  .../{libssh2_1.10.0.bb => libssh2_1.11.0.bb}  | 16 ++++++++-----
>  3 files changed, 11 insertions(+), 30 deletions(-)
>  delete mode 100644 meta/recipes-support/libssh2/libssh2/fix-ssh2-test.patch
>  rename meta/recipes-support/libssh2/{libssh2_1.10.0.bb => libssh2_1.11.0.bb} (67%)
> 
> diff --git a/meta/recipes-support/libssh2/libssh2/fix-ssh2-test.patch b/meta/recipes-support/libssh2/libssh2/fix-ssh2-test.patch
> deleted file mode 100644
> index ee916c42d4..0000000000
> --- a/meta/recipes-support/libssh2/libssh2/fix-ssh2-test.patch
> +++ /dev/null
> @@ -1,23 +0,0 @@
> -In 8.8 OpenSSH disabled sha1 rsa-sha keys out of the box,
> -so we need to re-enable them as a workaround for the test
> -suite until upstream updates the tests.
> -
> -See: https://github.com/libssh2/libssh2/issues/630
> -
> -Upstream-Status: Backport [alternative fixes merged upstream]
> -
> -Patch taken from https://github.com/mirror-rpm/libssh2/commit/47f7114f7d0780f3075bad51a71881f45cc933c5
> -
> ---- a/tests/ssh2.sh
> -+++ b/tests/ssh2.sh
> -@@ -25,7 +25,8 @@ $SSHD -f /dev/null -h "$srcdir"/etc/host
> -     -o 'Port 4711' \
> -     -o 'Protocol 2' \
> -     -o "AuthorizedKeysFile $srcdir/etc/user.pub" \
> --    -o 'UsePrivilegeSeparation no' \
> -+    -o 'HostKeyAlgorithms +ssh-rsa' \
> -+    -o 'PubkeyAcceptedAlgorithms +ssh-rsa' \
> -     -o 'StrictModes no' \
> -     -D \
> -     $libssh2_sshd_params &
> -
> diff --git a/meta/recipes-support/libssh2/libssh2/run-ptest b/meta/recipes-support/libssh2/libssh2/run-ptest
> index 5e7426f79d..ed87074fcd 100644
> --- a/meta/recipes-support/libssh2/libssh2/run-ptest
> +++ b/meta/recipes-support/libssh2/libssh2/run-ptest
> @@ -2,7 +2,7 @@
>  
>  ptestdir=$(dirname "$(readlink -f "$0")")
>  cd tests
> -for test in simple mansyntax.sh ssh2.sh
> +for test in test_simple mansyntax.sh test_sshd.test
>  do
>  	./../test-driver --test-name $test --log-file ../$test.log --trs-file ../$test.trs --color-tests no --enable-hard-errors yes --expect-failure no -- ./$test
>  done
> diff --git a/meta/recipes-support/libssh2/libssh2_1.10.0.bb b/meta/recipes-support/libssh2/libssh2_1.11.0.bb
> similarity index 67%
> rename from meta/recipes-support/libssh2/libssh2_1.10.0.bb
> rename to meta/recipes-support/libssh2/libssh2_1.11.0.bb
> index d5513373b0..31a3c0c90b 100644
> --- a/meta/recipes-support/libssh2/libssh2_1.10.0.bb
> +++ b/meta/recipes-support/libssh2/libssh2_1.11.0.bb
> @@ -5,20 +5,20 @@ SECTION = "libs"
>  DEPENDS = "zlib"
>  
>  LICENSE = "BSD-3-Clause"
> -LIC_FILES_CHKSUM = "file://COPYING;md5=3e089ad0cf27edf1e7f261dfcd06acc7"
> +LIC_FILES_CHKSUM = "file://COPYING;md5=24a33237426720395ebb1dd1349ca225"
>  
>  SRC_URI = "http://www.libssh2.org/download/${BP}.tar.gz \
> -           file://fix-ssh2-test.patch \
>             file://run-ptest \
>             "
>  
> -SRC_URI[sha256sum] = "2d64e90f3ded394b91d3a2e774ca203a4179f69aebee03003e5a6fa621e41d51"
> +SRC_URI[sha256sum] = "3736161e41e2693324deb38c26cfdc3efe6209d634ba4258db1cecff6a5ad461"
>  
>  inherit autotools pkgconfig ptest
>  
>  EXTRA_OECONF += "\
>                   --with-libz \
>                   --with-libz-prefix=${STAGING_LIBDIR} \
> +                 --disable-rpath \
>                  "
>  
>  # only one of openssl and gcrypt could be set
> @@ -41,9 +41,13 @@ do_install_ptest() {
>  	install -d ${D}${PTEST_PATH}/tests
>  	install -m 0755 ${S}/test-driver ${D}${PTEST_PATH}/
>  	cp -rf ${B}/tests/.libs/* ${D}${PTEST_PATH}/tests/
> -	cp -rf ${S}/tests/mansyntax.sh  ${D}${PTEST_PATH}/tests/
> -	cp -rf ${S}/tests/ssh2.sh  ${D}${PTEST_PATH}/tests/
> -	cp -rf ${S}/tests/etc ${D}${PTEST_PATH}/tests/
> +	cp -rf ${B}/tests/test_simple ${D}${PTEST_PATH}/tests/
> +	cp -rf ${S}/tests/mansyntax.sh ${D}${PTEST_PATH}/tests/
> +	cp -rf ${S}/tests/test_sshd.test  ${D}${PTEST_PATH}/tests/
> +	cp -rf ${S}/tests/openssh_server ${D}${PTEST_PATH}/tests/
> +	cp -rf ${S}/tests/key* ${D}${PTEST_PATH}/tests/
> +# Makefile.inc required as test_sshd.test generates the list of test from this
> +	cp -rf ${S}/tests/Makefile.inc ${D}${PTEST_PATH}/tests/
>  	mkdir -p ${D}${PTEST_PATH}/docs
>  	cp -r ${S}/docs/* ${D}${PTEST_PATH}/docs/
>  }
> -- 
> 2.30.2
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#182343): https://lists.openembedded.org/g/openembedded-core/message/182343
> Mute This Topic: https://lists.openembedded.org/mt/99295530/3617179
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alexandre.belloni@bootlin.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

