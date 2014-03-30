Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-la0-f43.google.com (mail-la0-f43.google.com
	[209.85.215.43])
	by mail.openembedded.org (Postfix) with ESMTP id 89F8D6F4C4;
	Sun, 30 Mar 2014 13:36:03 +0000 (UTC)
Received: by mail-la0-f43.google.com with SMTP id e16so5001574lan.16
	for <multiple recipients>; Sun, 30 Mar 2014 06:36:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=pzqsPEmj1EFnnWs+AT1/NDW0mrqRB/SRgh2u26KpHSs=;
	b=r1LReU0srUB+Kg03SJWoLu0EBkKU12bWsNCE7keJ5RN5JU9OD1BUHxeekTh0LWu4JQ
	zG1U5QHsiInq5uSkGEA6xULYTC1qeN2eY7RF1f+GdqaY9hnbad2uN2BeeNTIPlFvxsVO
	t07ODsayCU2T/7ZA2TBFW8SOwKLUJayNkQpPMCajWU+ApsUPYy7/7epDTCynAO1ih1qQ
	3CjOv3+9iZFbrE63L5fwbkXN8xRVSUE0YIGGBPo/Zdy5f7luZT5MJ8J2zvEgQKQYY5kU
	ZJ+MXuhA5LIakAis0egjYcUKcFWbfYyW6KWdb98AYoXSQZWnNrNzSLPFKR4LgDE7iDJU
	wRVQ==
MIME-Version: 1.0
X-Received: by 10.152.36.73 with SMTP id o9mr1601556laj.30.1396186563929; Sun,
	30 Mar 2014 06:36:03 -0700 (PDT)
Received: by 10.112.58.132 with HTTP; Sun, 30 Mar 2014 06:36:03 -0700 (PDT)
In-Reply-To: <1396183001.14790.46.camel@ted>
References: <20140330090302.B0FBA50478@opal> <20140330113031.GF2428@jama>
	<1396183001.14790.46.camel@ted>
Date: Sun, 30 Mar 2014 09:36:03 -0400
Message-ID: <CADkTA4MV-mQ7VAgiYfQUK8h1A2kf6pohNp-nyY7zKQfUYJCS9w@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: "Hart, Darren" <darren.hart@intel.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>,
	openembedded-commits@lists.openembedded.org
Subject: Re: [oe-commits] Bruce Ashfield : linux-yocto/3.10: fix drm build failure
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
X-List-Received-Date: Sun, 30 Mar 2014 13:36:07 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Sun, Mar 30, 2014 at 8:36 AM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> On Sun, 2014-03-30 at 13:30 +0200, Martin Jansa wrote:
>> On Sun, Mar 30, 2014 at 09:03:02AM +0000, git@git.openembedded.org wrote:
>> > Module: openembedded-core.git
>> > Branch: master
>> > Commit: 42c0eba4fac6b8bd28b58ec04574d04b0ab0c457
>> > URL:    http://git.openembedded.org/?p=openembedded-core.git&a=commit;h=42c0eba4fac6b8bd28b58ec04574d04b0ab0c457
>> >
>> > Author: Bruce Ashfield <bruce.ashfield@windriver.com>
>> > Date:   Thu Mar 27 13:22:32 2014 -0400
>> >
>> > linux-yocto/3.10: fix drm build failure
>> >
>> > Andrea Adami reported the following build failure:
>> >
>> >     .../drm/drm_mm.h:105:2: error: implicit declaration of function
>> >     'BUG_ON' [-Werror=implicit-function-declaration]
>> >     |   BUG_ON(!hole_node->hole_follows);
>> >     |   ^
>> >     |   CC      drivers/pci/setup-res.o
>> >     |   CC      drivers/gpu/drm/i915/i915_drv.o
>> >     | cc1: some warnings being treated as errors
>> >     | make[6]: *** [drivers/gpu/drm/ttm/ttm_agp_backend.o] Error 1
>> >     | make[5]: *** [drivers/gpu/drm/ttm] Error 2
>> >
>> > Cherry picking mainline commit 86e81f0e6 [drm/mm: include required headers in drm_mm.h]
>> > fixes the build problems.
>> >
>> > cc: Andrea Adami <andrea.adami@gmail.com>
>> > Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
>> >
>> > ---
>> >
>> >  meta/recipes-kernel/linux/linux-yocto-rt_3.10.bb   |  4 ++--
>> >  meta/recipes-kernel/linux/linux-yocto-tiny_3.10.bb |  2 +-
>> >  meta/recipes-kernel/linux/linux-yocto_3.10.bb      | 14 +++++++-------
>> >  3 files changed, 10 insertions(+), 10 deletions(-)
>> >
>> > diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_3.10.bb b/meta/recipes-kernel/linux/linux-yocto-rt_3.10.bb
>> > index 9b0c5d3..fe6773a 100644
>> > --- a/meta/recipes-kernel/linux/linux-yocto-rt_3.10.bb
>> > +++ b/meta/recipes-kernel/linux/linux-yocto-rt_3.10.bb
>> > @@ -3,8 +3,8 @@ require recipes-kernel/linux/linux-yocto.inc
>> >  KBRANCH = "standard/preempt-rt/base"
>> >  KBRANCH_qemuppc = "standard/preempt-rt/qemuppc"
>> >
>> > -SRCREV_machine ?= "f121a3aa028df37b8050779adaa239d29aaa2edd"
>> > -SRCREV_machine_qemuppc ?= "7172d3cbc73584e724b61ef5d13fc3519720f4c0"
>> > +SRCREV_machine ?= "f4351616572c6ad5a8b71b1becf02c3e779b85b8"
>> > +SRCREV_machine_qemuppc ?= "a6dfc85e99633d739068a03d2551e39847628551"
>> >  SRCREV_meta ?= "df3aa753c8826127fb5ad811d56d57168551d6e4"
>> >
>> >  SRC_URI = "git://git.yoctoproject.org/linux-yocto-3.10.git;bareclone=1;branch=${KBRANCH},meta;name=machine,meta"
>> > diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_3.10.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_3.10.bb
>> > index baa82fd..123f307 100644
>> > --- a/meta/recipes-kernel/linux/linux-yocto-tiny_3.10.bb
>> > +++ b/meta/recipes-kernel/linux/linux-yocto-tiny_3.10.bb
>> > @@ -9,7 +9,7 @@ LINUX_VERSION ?= "3.10.34"
>> >
>> >  KMETA = "meta"
>> >
>> > -SRCREV_machine ?= "2ee37bfe732c73f7d39af55875ce8d30b282471c"
>> > +SRCREV_machine ?= "c7739be126930006e3bfbdb2fb070a967abc5e09"
>> >  SRCREV_meta ?= "df3aa753c8826127fb5ad811d56d57168551d6e4"
>> >
>> >  PV = "${LINUX_VERSION}+git${SRCPV}"
>> > diff --git a/meta/recipes-kernel/linux/linux-yocto_3.10.bb b/meta/recipes-kernel/linux/linux-yocto_3.10.bb
>> > index 56fbd07..49dd13d 100644
>> > --- a/meta/recipes-kernel/linux/linux-yocto_3.10.bb
>> > +++ b/meta/recipes-kernel/linux/linux-yocto_3.10.bb
>> > @@ -11,13 +11,13 @@ KBRANCH_qemux86  = "standard/common-pc/base"
>> >  KBRANCH_qemux86-64  = "standard/common-pc-64/base"
>> >  KBRANCH_qemumips64 = "standard/mti-malta64"
>> >
>> > -SRCREV_machine_qemuarm ?= "e18e8c2c7cad913a25342f9f860eeeefce24b8aa"
>> > -SRCREV_machine_qemumips ?= "6f191aaecfdbebda450cec4a1f30fb0d1a2ed889"
>> > -SRCREV_machine_qemuppc ?= "ba2e16160c7f910de432511ca0008101a7b2263b"
>> > -SRCREV_machine_qemux86 ?= "2ee37bfe732c73f7d39af55875ce8d30b282471c"
>> > -SRCREV_machine_qemux86-64 ?= "2ee37bfe732c73f7d39af55875ce8d30b282471c"
>> > -SRCREV_machine_qemumips64 ?= "e05f0378e9c21d689eed8aacb306d2c1a044e0d0"
>> > -SRCREV_machine ?= "2ee37bfe732c73f7d39af55875ce8d30b282471c"
>> > +SRCREV_machine_qemuarm ?= "0e99eabbe5b3bec853ace496f94612bc37800260"
>> > +SRCREV_machine_qemumips ?= "b6b20f49e9a169a0672b7cc2d7b93d6652ca7873"
>> > +SRCREV_machine_qemuppc ?= "d71b782615b802c78e1586494b94dd40531775c8"
>> > +SRCREV_machine_qemux86 ?= "c7739be126930006e3bfbdb2fb070a967abc5e09"
>>
>> Is it correct revision?
>>
>> ERROR: Fetcher failure: Unable to find revision c7739be126930006e3bfbdb2fb070a967abc5e09 in branch
>> standard/common-pc/base even from upstream
>> ERROR: Logfile of failure stored in: work/qemux86-webos-linux/linux-yocto/1_3.10.34+gitAUTOINC+df3aa753c8_c7739be126-r0/temp/log.do_fetch.73290
>>
>> > +SRCREV_machine_qemux86-64 ?= "c7739be126930006e3bfbdb2fb070a967abc5e09"
>> > +SRCREV_machine_qemumips64 ?= "88abb1eb327f4e3c711d19a228cb153fdd9b3506"
>> > +SRCREV_machine ?= "c7739be126930006e3bfbdb2fb070a967abc5e09"
>> >  SRCREV_meta ?= "df3aa753c8826127fb5ad811d56d57168551d6e4"
>> >
>> >  SRC_URI = "git://git.yoctoproject.org/linux-yocto-3.10.git;bareclone=1;branch=${KBRANCH},${KMETA};name=machine,meta"
>
> We've also just seen:
>
> http://autobuilder.yoctoproject.org/main/builders/nightly-oecore/builds/22/steps/BuildImages/logs/stdio

Wouldn't be the same thing, but clearly is a merge commit. git rerere
must have pulled in an old
resolution on my behalf.

I probably won't be near a computer with enough power to fix this up
until tonight, but I'll have a look
then.

Bruce

>
> which may be related.
>
> Cheers,
>
> Richard
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"

