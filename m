Return-Path: <ola.x.nilsson@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7BC20C4332F
	for <webhook@archiver.kernel.org>; Tue,  8 Nov 2022 10:56:49 +0000 (UTC)
Received: from smtp2.axis.com (smtp2.axis.com [195.60.68.18])
 by mx.groups.io with SMTP id smtpd.web10.6440.1667905000264672128
 for <openembedded-core@lists.openembedded.org>;
 Tue, 08 Nov 2022 02:56:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=axis-central1 header.b=ocXtwAD5;
 spf=pass (domain: axis.com, ip: 195.60.68.18, mailfrom: ola.x.nilsson@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1667905001;
  x=1699441001;
  h=references:from:to:cc:subject:date:in-reply-to:
   message-id:mime-version;
  bh=9pAxwU8rm9Vvvh/gTV9tWhNabDFjA2LAkM1nigZvPkE=;
  b=ocXtwAD59y7RB4lr/LvC96gzn5GlVHj387mZfhsTSmunQ/1VGgJmNdxy
   KpR+QSej+WB0uZxD3erI+pcghJeLfKOGJGEHSjoYfdKvN4mJSmjcdkdZL
   NqAYB1jc5qj9gSskf0MeSbywpNWfrXWrJnrA17LFtfjWfAHrmSUzoVkEZ
   AK222LsabzJF8uwjj+6DmQhDU0o0WaNB1XclIzKfL2xopGiRYeAq2tBsg
   O3JdILZTJByBrG5SNNenqg006X41nqQTSiMfM5kf7St2orPX1D/0QBBUy
   UjQh+ZF1X48KlcXgi0t6l+fJhKo48CHE177rXDCTfWYsHjsGBeulzxDuL
   A==;
References: <20221108000828.42824-1-niko.mauno@vaisala.com>
User-agent: mu4e 1.8.9; emacs 29.0.50
From: Ola x Nilsson <ola.x.nilsson@axis.com>
To: <openembedded-core@lists.openembedded.org>
CC: "niko.mauno@vaisala.com" <niko.mauno@vaisala.com>
Subject: Re: [OE-core] [RFC PATCH 1/3] Try to ensure 64 bit time on 32 bit
 glibcful hosts
Date: Tue, 8 Nov 2022 11:51:58 +0100
Organization: Axis Communications AB
In-Reply-To: <20221108000828.42824-1-niko.mauno@vaisala.com>
Message-ID: <jwqh6z9soii.fsf@axis.com>
MIME-Version: 1.0
Content-Type: text/plain
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 08 Nov 2022 10:56:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172959


I'm working on the same thing, but I put GLIBC_64BIT_TIME_CPPFLAGS in
TARGET_CC_ARCH instead to make sure they applied everywhere.

I'd be interested to hear what others think is the best place to put
these flags.

I'm also looking at QA tests to make sure that no application or shared
object is still using 32bit time or file functions from glibc.

/Ola

On Tue, Nov 08 2022, Niko Mauno via lists.openembedded.org wrote:

> Add default C Preprocessor flags that ensure Y2038 compatible 64 bit
> time on 32 bit host applications when glibc is used. Prerequisites
> are glibc version 2.34 or newer and Linux kernel version 5.1 or newer.
>
> Example of impact on 32 bit 'qemuarm' machine running
> core-image-minimal. Before this change:
>
>   root@qemuarm:~# /bin/busybox date
>   Sun Nov  6 06:09:39 UTC 2022
>   root@qemuarm:~# /sbin/hwclock.util-linux -w
>   root@qemuarm:~# /sbin/hwclock.util-linux
>   2022-11-06 06:09:49.994249+00:00
>   root@qemuarm:~# /bin/busybox date -s 2040-01-01
>   date: invalid date '2040-01-01'
>   root@qemuarm:~# /bin/date.coreutils -s 2040-01-01
>   Sun Jan  1 00:00:00 UTC 2040
>   root@qemuarm:~# /sbin/hwclock.util-linux -w
>   root@qemuarm:~# /sbin/hwclock.util-linux
>   1931-03-04 06:26:23.000000+00:00
>   root@qemuarm:~#
>
> After this change:
>
>   root@qemuarm:~# /bin/busybox date
>   Sun Nov  6 06:02:20 UTC 2022
>   root@qemuarm:~# /sbin/hwclock.util-linux -w
>   root@qemuarm:~# /sbin/hwclock.util-linux
>   2022-11-06 06:02:27.989730+00:00
>   root@qemuarm:~# /bin/busybox date -s 2040-01-01
>   Sun Jan  1 00:00:00 UTC 2040
>   root@qemuarm:~# /sbin/hwclock.util-linux -w
>   root@qemuarm:~# /sbin/hwclock.util-linux
>   2040-01-01 00:00:20.992954+00:00
>   root@qemuarm:~#
>
> From here on, the adding of new flags can be disabled on recipe or
> global level by resetting the value of associated variable containing
> the CPPFLAGS specific for 64 bit time
>
>   GLIBC_64BIT_TIME_CPPFLAGS = ""
>
> which can be useful e.g. when working around failure to compile a
> component due to lack of 64 bit time support on 32 bit build in the
> component's source code.
>
> Signed-off-by: Niko Mauno <niko.mauno@vaisala.com>
> ---
>  meta/conf/distro/include/tclibc-glibc.inc        | 3 +++
>  meta/recipes-devtools/gcc/gcc-sanitizers_12.2.bb | 2 ++
>  meta/recipes-devtools/pseudo/pseudo_git.bb       | 2 ++
>  3 files changed, 7 insertions(+)
>
> diff --git a/meta/conf/distro/include/tclibc-glibc.inc b/meta/conf/distro/include/tclibc-glibc.inc
> index f48d16939e..95770298e9 100644
> --- a/meta/conf/distro/include/tclibc-glibc.inc
> +++ b/meta/conf/distro/include/tclibc-glibc.inc
> @@ -17,6 +17,9 @@ PREFERRED_PROVIDER_virtual/crypt ?= "libxcrypt"
>  
>  CXXFLAGS += "-fvisibility-inlines-hidden"
>  
> +GLIBC_64BIT_TIME_CPPFLAGS = "-D_TIME_BITS=64 -D_FILE_OFFSET_BITS=64"
> +TARGET_CPPFLAGS += "${GLIBC_64BIT_TIME_CPPFLAGS}"
> +
>  LIBC_DEPENDENCIES = "\
>  		     glibc \
>  		     glibc-dbg \
> diff --git a/meta/recipes-devtools/gcc/gcc-sanitizers_12.2.bb b/meta/recipes-devtools/gcc/gcc-sanitizers_12.2.bb
> index 8bda2ccad6..b3fafa0ea4 100644
> --- a/meta/recipes-devtools/gcc/gcc-sanitizers_12.2.bb
> +++ b/meta/recipes-devtools/gcc/gcc-sanitizers_12.2.bb
> @@ -5,3 +5,5 @@ require gcc-sanitizers.inc
>  # sanitizer_linux.s:5749: Error: lo register required -- `ldr ip,[sp],#8'
>  ARM_INSTRUCTION_SET:armv4 = "arm"
>  ARM_INSTRUCTION_SET:armv5 = "arm"
> +
> +GLIBC_64BIT_TIME_CPPFLAGS = ""
> diff --git a/meta/recipes-devtools/pseudo/pseudo_git.bb b/meta/recipes-devtools/pseudo/pseudo_git.bb
> index c34580b4ff..7734d0fbb0 100644
> --- a/meta/recipes-devtools/pseudo/pseudo_git.bb
> +++ b/meta/recipes-devtools/pseudo/pseudo_git.bb
> @@ -19,3 +19,5 @@ PV = "1.9.0+git${SRCPV}"
>  
>  # error: use of undeclared identifier '_STAT_VER'
>  COMPATIBLE_HOST:libc-musl = 'null'
> +
> +GLIBC_64BIT_TIME_CPPFLAGS = ""


