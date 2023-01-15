Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6010DC46467
	for <webhook@archiver.kernel.org>; Sun, 15 Jan 2023 21:30:23 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
 by mx.groups.io with SMTP id smtpd.web11.150953.1673818221368722862
 for <openembedded-core@lists.openembedded.org>;
 Sun, 15 Jan 2023 13:30:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=KatE2YfT;
 spf=pass (domain: bootlin.com, ip: 217.70.183.194, mailfrom: alexandre.belloni@bootlin.com)
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id E49D340004;
	Sun, 15 Jan 2023 21:30:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1673818219;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=aLR5R2/IkaA4GHCi1eN6w56J5jbdfttiZ3u+U2rMnWg=;
	b=KatE2YfTUc5ZkR4EbMNJCGQsWL/EYZsrnAySFte19YtiM6rlpUenjEyO6bh5c1q3zscSnC
	wmifuq/r1Ix+uGDVCSUpZfVUVgX+gxx0/BJh+WDZKgf1x0Q/ECVV5m7gA9PeaporYvhdEb
	MH3JDBsnViF7BpzQv7zhcRq8E84z4OesEBeLPwH6HzndFBvGMFHHiVxWtGDFs0dk3TKmRV
	0QahplC8jm6HGFEvXMLdU1ZH80OaNcJk557oHHAR0BpcXo9Pa6THc8OHIKNsHTKAcUjDmm
	KSRF+gtUzzjdKRYAJKnDPdsU8kx3eNPUaZvukJSJA6uhQVC+CO50Vrnfc2qQ6A==
Date: Sun, 15 Jan 2023 22:30:18 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Changqing Li <changqing.li@eng.windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH 2/2] curl: enable nghttp2 for support HTTP2
Message-ID: <Y8RwajkarV+GAz+O@mail.local>
References: <20221229023442.2520067-1-changqing.li@windriver.com>
 <20221229023442.2520067-2-changqing.li@windriver.com>
 <Y7baMI4MLdLKahf+@mail.local>
 <a690d84f-aa54-4187-e0dd-780a966cf454@windriver.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <a690d84f-aa54-4187-e0dd-780a966cf454@windriver.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 15 Jan 2023 21:30:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175957

On 13/01/2023 16:04:42+0800, Changqing Li wrote:
> 
> On 1/5/23 22:09, Alexandre Belloni wrote:
> > CAUTION: This email comes from a non Wind River email account!
> > Do not click links or open attachments unless you recognize the sender and know the content is safe.
> > 
> > This fails on the AB:
> > 
> > https://autobuilder.yoctoproject.org/typhoon/#/builders/80/builds/4580/steps/14/logs/stdio
> 
> Hi, Alexandre
> 
> I need some help to debug this issue.
> 
> I cannot reproduce this issue on my host. First,� the gcc command used to
> build the binary conftest will
> 
> have as-needed enabled by default,� so actually,� these libs will not be
> linked, and runtime check will passed.
> 
> Refer the command:
> 
> gcc -o conftest -isystem/mnt/lincd/build/tmp-glibc/work/x86_64-linux/curl-native/7.87.0-r0/recipe-sysroot-native/usr/include
> -pipe -Werror-implicit-function-declaration -g -O2 -std=gnu89 -pedantic
> -Wall -W -Wpointer-arith -Wwrite-strings -Wunused -Wshadow -Winline
> -Wnested-externs -Wmissing-declarations -Wmissing-prototypes -Wno-long-long
> -Wbad-function-cast -Wfloat-equal -Wno-multichar -Wsign-compare -Wundef
> -Wno-format-nonliteral -Wendif-labels -Wstrict-prototypes
> -Wdeclaration-after-statement -Wold-style-definition -Wstrict-aliasing=3
> -Wcast-align -Wtype-limits -Wold-style-declaration -Wmissing-parameter-type
> -Wempty-body -Wclobbered -Wignored-qualifiers -Wconversion
> -Wno-sign-conversion -Wvla -ftree-vrp -Wdouble-promotion -Wformat=2
> -Warray-bounds=2 -Wshift-negative-value -Wshift-overflow=2
> -Wnull-dereference -fdelete-null-pointer-checks -Wduplicated-cond
> -Wunused-const-variable -Wduplicated-branches -Wrestrict -Walloc-zero
> -Wformat-overflow=2 -Wformat-truncation=2 -Wimplicit-fallthrough=4
> -Wno-system-headers -isystem/mnt/lincd/build/tmp-glibc/work/x86_64-linux/curl-native/7.87.0-r0/recipe-sysroot-native/usr/include -I/mnt/lincd/build/tmp-glibc/work/x86_64-linux/curl-native/7.87.0-r0/recipe-sysroot-native/usr/lib/..//include -I/mnt/lincd/build/tmp-glibc/work/x86_64-linux/curl-native/7.87.0-r0/recipe-sysroot-native/usr/lib/pkgconfig/../../../usr/include
> -DOPENSSL_SUPPRESS_DEPRECATED -I/mnt/lincd/build/tmp-glibc/work/x86_64-linux/curl-native/7.87.0-r0/recipe-sysroot-native/usr/lib/pkgconfig/../../../usr/include -L/mnt/lincd/build/tmp-glibc/work/x86_64-linux/curl-native/7.87.0-r0/recipe-sysroot-native/usr/lib -L/mnt/lincd/build/tmp-glibc/work/x86_64-linux/curl-native/7.87.0-r0/recipe-sysroot-native/lib
> -Wl,--enable-new-dtags -Wl,-rpath-link,/mnt/lincd/build/tmp-glibc/work/x86_64-linux/curl-native/7.87.0-r0/recipe-sysroot-native/usr/lib -Wl,-rpath-link,/mnt/lincd/build/tmp-glibc/work/x86_64-linux/curl-native/7.87.0-r0/recipe-sysroot-native/lib -Wl,-rpath,/mnt/lincd/build/tmp-glibc/work/x86_64-linux/curl-native/7.87.0-r0/recipe-sysroot-native/usr/lib -Wl,-rpath,/mnt/lincd/build/tmp-glibc/work/x86_64-linux/curl-native/7.87.0-r0/recipe-sysroot-native/lib
> -Wl,-O1 -Wl,--allow-shlib-undefined -Wl,--dynamic-linker=/mnt/lincd/build/tmp-glibc/sysroots-uninative/x86_64-linux/lib/ld-linux-x86-64.so.2 -L/mnt/lincd/build/tmp-glibc/work/x86_64-linux/curl-native/7.87.0-r0/recipe-sysroot-native/usr/lib/..//lib -L/mnt/lincd/build/tmp-glibc/work/x86_64-linux/curl-native/7.87.0-r0/recipe-sysroot-native/usr/lib/pkgconfig/../../../usr/lib -L/mnt/lincd/build/tmp-glibc/work/x86_64-linux/curl-native/7.87.0-r0/recipe-sysroot-native/usr/lib/pkgconfig/../../../usr/lib
> conftest.c�� -lnghttp2 -lssl -lcrypto -lssl -lcrypto -lz
> 
> 
> I also tried to add "-Wl,--no-as-needed" in above comand, and manually run
> it,� then conftest will link those libraries. These libraries can also be
> found at runtime
> 
> since these libraries will be in recipe-sysroot-native.
> 
> $/mnt/yocto/test/tmp/work/x86_64-linux/curl-native/7.87.0-r0/build# ldd
> conftest
> �� �linux-vdso.so.1 (0x00007ffd447c1000)
> �� �libnghttp2.so.14 => /mnt/lincd/build/tmp-glibc/work/x86_64-linux/curl-native/7.87.0-r0/recipe-sysroot-native/usr/lib/libnghttp2.so.14
> (0x00007f6bd36af000)
> �� �libssl.so.3 => /mnt/lincd/build/tmp-glibc/work/x86_64-linux/curl-native/7.87.0-r0/recipe-sysroot-native/usr/lib/libssl.so.3
> (0x00007f6bd3606000)
> �� �libcrypto.so.3 => /mnt/lincd/build/tmp-glibc/work/x86_64-linux/curl-native/7.87.0-r0/recipe-sysroot-native/usr/lib/libcrypto.so.3
> (0x00007f6bd31cf000)
> �� �libz.so.1 => /mnt/lincd/build/tmp-glibc/work/x86_64-linux/curl-native/7.87.0-r0/recipe-sysroot-native/usr/lib/libz.so.1
> (0x00007f6bd31b5000)
> �� �libc.so.6 => /lib/x86_64-linux-gnu/libc.so.6 (0x00007f6bd2fb9000)
> �� �libpthread.so.0 => /lib/x86_64-linux-gnu/libpthread.so.0
> (0x00007f6bd2f96000)
> �� �libdl.so.2 => /lib/x86_64-linux-gnu/libdl.so.2 (0x00007f6bd2f90000)
> �/mnt/lincd/build/tmp-glibc/sysroots-uninative/x86_64-linux/lib/ld-linux-x86-64.so.2 => /lib64/ld-linux-x86-64.so.2 (0x00007f6bd36e6000)
> $/mnt/yocto/test/tmp/work/x86_64-linux/curl-native/7.87.0-r0/build#
> ./conftest
> 
> 
> This should be an host related issue,� Does the worker "debian11-ty-3" means
> that this build is built on debian11 docker or debian11 host? Thanks.

This is a debian 11 host.

> 
> 
> Regards
> 
> Changqing
> 
> > 
> > | checking run-time libs availability... failed
> > | configure: error: one or more libs available at link-time are not available run-time. Libs used at link-time: -lnghttp2 -lssl -lcrypto -lssl -lcrypto -lz
> > | NOTE: The following config.log files may provide further information.
> > | NOTE: /home/pokybuild/yocto-worker/oe-selftest-debian/build/build-st-109066/tmp/work/x86_64-linux/curl-native/7.87.0-r0/build/config.log
> > | ERROR: configure failed
> > | WARNING: exit code 1 from a shell command.
> > NOTE: recipe curl-native-7.87.0-r0: task do_configure: Failed
> > ERROR: Task (virtual:native:/home/pokybuild/yocto-worker/oe-selftest-debian/build/meta/recipes-support/curl/curl_7.87.0.bb:do_configure) failed with exit code '1'
> > 
> > On 29/12/2022 10:34:42+0800, Changqing Li wrote:
> > > From: Changqing Li <changqing.li@windriver.com>
> > > 
> > > After commit `ostree: replace libsoup-2.4 by curl`, ostree depends on
> > > libcurl, but it needs http2 support, otherwise it will fail with
> > > error:
> > > OSTree:ERROR:../git/src/libostree/ostree-fetcher-curl.c:886:initiate_next_curl_request: assertion failed (rc == CURLM_OK): (1 == 0)
> > > | Bail out! OSTree:ERROR:../git/src/libostree/ostree-fetcher-curl.c:886:initiate_next_curl_request: assertion failed (rc == CURLM_OK): (1 == 0)
> > > 
> > > Enable nghttp2 to fix above error.
> > > 
> > > Signed-off-by: Changqing Li <changqing.li@windriver.com>
> > > ---
> > >   meta/recipes-support/curl/curl_7.86.0.bb | 6 +++---
> > >   1 file changed, 3 insertions(+), 3 deletions(-)
> > > 
> > > diff --git a/meta/recipes-support/curl/curl_7.86.0.bb b/meta/recipes-support/curl/curl_7.86.0.bb
> > > index f5e3e7235d..6cee548f35 100644
> > > --- a/meta/recipes-support/curl/curl_7.86.0.bb
> > > +++ b/meta/recipes-support/curl/curl_7.86.0.bb
> > > @@ -24,9 +24,9 @@ inherit autotools pkgconfig binconfig multilib_header ptest
> > >   # Entropy source for random PACKAGECONFIG option
> > >   RANDOM ?= "/dev/urandom"
> > > 
> > > -PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'ipv6', d)} libidn openssl proxy random threaded-resolver verbose zlib"
> > > -PACKAGECONFIG:class-native = "ipv6 openssl proxy random threaded-resolver verbose zlib"
> > > -PACKAGECONFIG:class-nativesdk = "ipv6 openssl proxy random threaded-resolver verbose zlib"
> > > +PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'ipv6', d)} libidn openssl proxy random threaded-resolver verbose zlib nghttp2"
> > > +PACKAGECONFIG:class-native = "ipv6 openssl proxy random threaded-resolver verbose zlib nghttp2"
> > > +PACKAGECONFIG:class-nativesdk = "ipv6 openssl proxy random threaded-resolver verbose zlib nghttp2"
> > > 
> > >   # 'ares' and 'threaded-resolver' are mutually exclusive
> > >   PACKAGECONFIG[ares] = "--enable-ares,--disable-ares,c-ares,,,threaded-resolver"
> > > --
> > > 2.25.1
> > > 
> > > 
> > > 
> > 
> > --
> > Alexandre Belloni, co-owner and COO, Bootlin
> > Embedded Linux and Kernel engineering
> > https://bootlin.com

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#175812): https://lists.openembedded.org/g/openembedded-core/message/175812
> Mute This Topic: https://lists.openembedded.org/mt/95931602/3617179
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alexandre.belloni@bootlin.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

