Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5AF0FC43217
	for <webhook@archiver.kernel.org>; Wed,  9 Nov 2022 15:47:35 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
 by mx.groups.io with SMTP id smtpd.web12.79.1668008849247994617
 for <openembedded-core@lists.openembedded.org>;
 Wed, 09 Nov 2022 07:47:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=WqgwDzCt;
 spf=pass (domain: bootlin.com, ip: 217.70.183.199, mailfrom: alexandre.belloni@bootlin.com)
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id A4AA4FF817;
	Wed,  9 Nov 2022 15:47:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1668008847;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=qDZPXaCRJcczoEaiO2oEdVYvAz99mGIaprXLHe/K6Qs=;
	b=WqgwDzCtQqDwVwrcfxr1f0dVI0ur+mQN+1F1cmG5k6a7gLPKJuf9tRJUdslvZlZdkDCI6l
	GlVCmFm40cQSHgjcWfnQ0cumV+8tGdRmhDQe6PFbEthasOqdHsG2NiKEqPqxmlDstNkSnm
	1g06V/oMl16JBUWbLAef0IEsol/FByQUh+pCI+IU+ZMGIu+56ORd2SdbCoVVoSOQE2mR7W
	mrlS1TxRaohrnQ8NBZ6/4M9W144eoiEadgR9dDfbNnhPio63bWc2mCIBoOGwP2OsDlu/+b
	Me+ZJKGIr4s8aFSsAB0wMfjBQQqKDY+gI5ajv/HfJneZdKYSB0opJmECjobqTw==
Date: Wed, 9 Nov 2022 16:47:26 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Ola x Nilsson <ola.x.nilsson@axis.com>
Cc: openembedded-core@lists.openembedded.org,
	"niko.mauno@vaisala.com" <niko.mauno@vaisala.com>
Subject: Re: [OE-core] [RFC PATCH 1/3] Try to ensure 64 bit time on 32 bit
 glibcful hosts
Message-ID: <Y2vLjm5L3cbnf0O2@mail.local>
References: <20221108000828.42824-1-niko.mauno@vaisala.com>
 <jwqh6z9soii.fsf@axis.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <jwqh6z9soii.fsf@axis.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 09 Nov 2022 15:47:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173032

On 08/11/2022 11:51:58+0100, Ola x Nilsson wrote:
> 
> I'm working on the same thing, but I put GLIBC_64BIT_TIME_CPPFLAGS in
> TARGET_CC_ARCH instead to make sure they applied everywhere.
> 


I would not provide a feature to allow building a recipe without a 64
bits time_t, it is going to build but will fail to run properly so it is
way better to fail at compile time.

> I'd be interested to hear what others think is the best place to put
> these flags.
> 
> I'm also looking at QA tests to make sure that no application or shared
> object is still using 32bit time or file functions from glibc.
> 
> /Ola
> 
> On Tue, Nov 08 2022, Niko Mauno via lists.openembedded.org wrote:
> 
> > Add default C Preprocessor flags that ensure Y2038 compatible 64 bit
> > time on 32 bit host applications when glibc is used. Prerequisites
> > are glibc version 2.34 or newer and Linux kernel version 5.1 or newer.
> >
> > Example of impact on 32 bit 'qemuarm' machine running
> > core-image-minimal. Before this change:
> >
> >   root@qemuarm:~# /bin/busybox date
> >   Sun Nov  6 06:09:39 UTC 2022
> >   root@qemuarm:~# /sbin/hwclock.util-linux -w
> >   root@qemuarm:~# /sbin/hwclock.util-linux
> >   2022-11-06 06:09:49.994249+00:00
> >   root@qemuarm:~# /bin/busybox date -s 2040-01-01
> >   date: invalid date '2040-01-01'
> >   root@qemuarm:~# /bin/date.coreutils -s 2040-01-01
> >   Sun Jan  1 00:00:00 UTC 2040
> >   root@qemuarm:~# /sbin/hwclock.util-linux -w
> >   root@qemuarm:~# /sbin/hwclock.util-linux
> >   1931-03-04 06:26:23.000000+00:00
> >   root@qemuarm:~#
> >
> > After this change:
> >
> >   root@qemuarm:~# /bin/busybox date
> >   Sun Nov  6 06:02:20 UTC 2022
> >   root@qemuarm:~# /sbin/hwclock.util-linux -w
> >   root@qemuarm:~# /sbin/hwclock.util-linux
> >   2022-11-06 06:02:27.989730+00:00
> >   root@qemuarm:~# /bin/busybox date -s 2040-01-01
> >   Sun Jan  1 00:00:00 UTC 2040
> >   root@qemuarm:~# /sbin/hwclock.util-linux -w
> >   root@qemuarm:~# /sbin/hwclock.util-linux
> >   2040-01-01 00:00:20.992954+00:00
> >   root@qemuarm:~#
> >

Be careful because there is no guarantee hwclock is testing what you
want to test. The actual result depends on the RTC which may fail before
2038 anyway.

Note that if your system is using systemd, it will anyway fail in 2038.

> > From here on, the adding of new flags can be disabled on recipe or
> > global level by resetting the value of associated variable containing
> > the CPPFLAGS specific for 64 bit time
> >
> >   GLIBC_64BIT_TIME_CPPFLAGS = ""
> >
> > which can be useful e.g. when working around failure to compile a
> > component due to lack of 64 bit time support on 32 bit build in the
> > component's source code.
> >
> > Signed-off-by: Niko Mauno <niko.mauno@vaisala.com>
> > ---
> >  meta/conf/distro/include/tclibc-glibc.inc        | 3 +++
> >  meta/recipes-devtools/gcc/gcc-sanitizers_12.2.bb | 2 ++
> >  meta/recipes-devtools/pseudo/pseudo_git.bb       | 2 ++
> >  3 files changed, 7 insertions(+)
> >
> > diff --git a/meta/conf/distro/include/tclibc-glibc.inc b/meta/conf/distro/include/tclibc-glibc.inc
> > index f48d16939e..95770298e9 100644
> > --- a/meta/conf/distro/include/tclibc-glibc.inc
> > +++ b/meta/conf/distro/include/tclibc-glibc.inc
> > @@ -17,6 +17,9 @@ PREFERRED_PROVIDER_virtual/crypt ?= "libxcrypt"
> >  
> >  CXXFLAGS += "-fvisibility-inlines-hidden"
> >  
> > +GLIBC_64BIT_TIME_CPPFLAGS = "-D_TIME_BITS=64 -D_FILE_OFFSET_BITS=64"
> > +TARGET_CPPFLAGS += "${GLIBC_64BIT_TIME_CPPFLAGS}"
> > +
> >  LIBC_DEPENDENCIES = "\
> >  		     glibc \
> >  		     glibc-dbg \
> > diff --git a/meta/recipes-devtools/gcc/gcc-sanitizers_12.2.bb b/meta/recipes-devtools/gcc/gcc-sanitizers_12.2.bb
> > index 8bda2ccad6..b3fafa0ea4 100644
> > --- a/meta/recipes-devtools/gcc/gcc-sanitizers_12.2.bb
> > +++ b/meta/recipes-devtools/gcc/gcc-sanitizers_12.2.bb
> > @@ -5,3 +5,5 @@ require gcc-sanitizers.inc
> >  # sanitizer_linux.s:5749: Error: lo register required -- `ldr ip,[sp],#8'
> >  ARM_INSTRUCTION_SET:armv4 = "arm"
> >  ARM_INSTRUCTION_SET:armv5 = "arm"
> > +
> > +GLIBC_64BIT_TIME_CPPFLAGS = ""
> > diff --git a/meta/recipes-devtools/pseudo/pseudo_git.bb b/meta/recipes-devtools/pseudo/pseudo_git.bb
> > index c34580b4ff..7734d0fbb0 100644
> > --- a/meta/recipes-devtools/pseudo/pseudo_git.bb
> > +++ b/meta/recipes-devtools/pseudo/pseudo_git.bb
> > @@ -19,3 +19,5 @@ PV = "1.9.0+git${SRCPV}"
> >  
> >  # error: use of undeclared identifier '_STAT_VER'
> >  COMPATIBLE_HOST:libc-musl = 'null'
> > +
> > +GLIBC_64BIT_TIME_CPPFLAGS = ""
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#172959): https://lists.openembedded.org/g/openembedded-core/message/172959
> Mute This Topic: https://lists.openembedded.org/mt/94880624/3617179
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alexandre.belloni@bootlin.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

