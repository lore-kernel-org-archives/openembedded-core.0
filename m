Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-lb0-f177.google.com (mail-lb0-f177.google.com
	[209.85.217.177])
	by mail.openembedded.org (Postfix) with ESMTP id 50BD76D14A
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Feb 2014 05:27:27 +0000 (UTC)
Received: by mail-lb0-f177.google.com with SMTP id w6so100212lbh.36
	for <openembedded-core@lists.openembedded.org>;
	Wed, 05 Feb 2014 21:27:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=t/9ZGU0KClM4ICTGcbQKc+fR4lSJ4EbgS6UAzmwR3fE=;
	b=K7cGscwhmr+2y3uBWjETTBrzQs1kevrJVWS5WKgi8Pe0AZJ1dnL3owPHCrG8htVWH3
	K4Xap4S+tAfMaMTgdNyyFgBnkhmj8xTly2buaz40Failyz0NwLt7xLTGj6810K6mZqgF
	8C0VhzxabQh+qNknX4waVKGAXNu7sMSEdLiuw/4XvF0OHeSuXfYmeR7V+aCtIrHER+Vv
	Dw3LULbUeLLWUPOPooe3N8ppz20LotcCjlPvVzgW5Me31dNCzLt0MwVgOcpRIF2mqVzP
	KcAdan7BLunqyHG0fmDUJphUmG4w0FKrIIcHWSlyOC//3rjNBvXUEREkv373Q6ivsLzj
	EsCA==
MIME-Version: 1.0
X-Received: by 10.152.42.196 with SMTP id q4mr58171lal.52.1391664447159; Wed,
	05 Feb 2014 21:27:27 -0800 (PST)
Received: by 10.112.170.166 with HTTP; Wed, 5 Feb 2014 21:27:27 -0800 (PST)
In-Reply-To: <CF185AA7.62BD0%dvhart@linux.intel.com>
References: <CADkTA4OVfau9egNsK_nd2O2gq=WQF89Zh=-2=-AncbgfVStbjw@mail.gmail.com>
	<CF185AA7.62BD0%dvhart@linux.intel.com>
Date: Thu, 6 Feb 2014 00:27:27 -0500
Message-ID: <CADkTA4OiEgwRR=ffhX3F6n4vzPRtNieUZ0aBKUsVeGAYtpG+Hw@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Darren Hart <dvhart@linux.intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] linux-yocto: Use PACKAGE_ARCH in build dir
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
X-List-Received-Date: Thu, 06 Feb 2014 05:27:27 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Thu, Feb 6, 2014 at 12:20 AM, Darren Hart <dvhart@linux.intel.com> wrote:
> On 2/5/14, 20:30, "Bruce Ashfield" <bruce.ashfield@gmail.com> wrote:
>
>>On Wed, Feb 5, 2014 at 11:02 PM, Darren Hart <dvhart@linux.intel.com>
>>wrote:
>>> The current linux-yocto build dir (B) includes MACHINE. This has been
>>> appropriate as kernels are typically built machine-specific. We have
>>> recently introduced an intel-common type kernel which can be shared
>>> across multiple machines sharing a common base (intel-core2-32,
>>> intel-corei7-64). In these cases, the kernel is built for a something
>>> more generic than MACHINE, and the current mechanism results in
>>> something like this when building for MACHINE=sys940x (using
>>>intel-common):
>>>
>>> tmp/work/core2-32-intel-common-poky-linux/linux-yocto-dev/ \
>>>
>>>3.13++gitAUTOINC+e5d23e7879_889c6bec6b-r0/linux-sys940x-noemgd-standard-b
>>>uild
>>>
>>> Note the descrepancy between core2-32-intel-common and
>>> linux-sys940x-noemgd-standard-build. This becomes counterintuitive at
>>> the very least when switching to another machine and attempting to reuse
>>> this build. This patch swaps MACHINE for PACKAGE_ARCH (which is
>>> typically MACHINE_ARCH for linux-yocto), resulting in the following
>>> build path:
>>>
>>> tmp/work/core2-32-intel-common-poky-linux/linux-yocto-dev/ \
>>>
>>>3.13++gitAUTOINC+e5d23e7879_889c6bec6b-r0/linux-core2-32-intel-common-sta
>>>ndard-build
>>>
>>> The impact to existing MACHINEs is a replace of - with _ if MACHINE
>>> contains one or more - charachters.
>>>
>>> Signed-off-by: Darren Hart <dvhart@linux.intel.com>
>>> Cc: Bruce Ashfield <bruce.ashfield@windriver.com>
>>> Cc: Richard Purdie <richard.purdie@linuxfoundation.org>
>>> ---
>>>  meta/recipes-kernel/linux/linux-yocto.inc |    2 +-
>>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/meta/recipes-kernel/linux/linux-yocto.inc
>>>b/meta/recipes-kernel/linux/linux-yocto.inc
>>> index 2bee042..4ed3188 100644
>>> --- a/meta/recipes-kernel/linux/linux-yocto.inc
>>> +++ b/meta/recipes-kernel/linux/linux-yocto.inc
>>> @@ -31,7 +31,7 @@ inherit kernel
>>>  inherit kernel-yocto
>>>  require linux-dtb.inc
>>>
>>> -B = "${WORKDIR}/linux-${MACHINE}-${LINUX_KERNEL_TYPE}-build"
>>> +B = "${WORKDIR}/linux-${PACKAGE_ARCH}-${LINUX_KERNEL_TYPE}-build"
>>
>>But for truly machine specific kernel builds, won't this cause us
>>collisions ?
>
> I don't see how. Note the build paths above. For truly machine-specifc
> builds, the WORKDIR is already machine-specific (because the PACKAGE_ARCH
> is MACHINE_ARCH), so there is no need to specify the MACHINE in the S or B
> dirs really at all. In fact, just calling this linux-build without any
> other modifier would be fine I think. What I attempted here was in keeping
> with the intent of the design: identify what we are building for in the B
> dir.

Right you are. For a machine specific kernel recipe, workdir will provide the
separation. I missed that. And yes, even though it is a bit redundant,
it is still
nice to keep that extra identifier in the buildir name.

So this is Ack'd from my side.

Bruce

>
> --
> Darren
>
>



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"

