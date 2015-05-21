Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-yh0-f52.google.com (mail-yh0-f52.google.com
	[209.85.213.52])
	by mail.openembedded.org (Postfix) with ESMTP id 18F4A609B2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 May 2015 13:55:11 +0000 (UTC)
Received: by yhda23 with SMTP id a23so21168006yhd.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 May 2015 06:55:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=AlcV2PacY6st5DOEhJWAP5Z/szVqP5p0eo0ejvuB6Ew=;
	b=prL1PW2XyRUBs6ujnRM9yDWEzXH+LuR6a3oDv7+jjAaKuuvfIKfdwAKTAppBzsZGI6
	+tslkv1rlcXsIpO4CZtrKcBTlv40oXBZgLWWBvhc7B5YqzofIKEkt/5w8mzGHGJUHw3X
	kK3tG+80ki8UfnjuO1WYhUGf6KdSDI6vLYwRQ9CpW2lbTEPg4H+P83dfpLVUUOSkWWXB
	pw4WQAzyjYGeO4DGjnezTEp+ILizdR06cGESYMF7CXc116cX+90s9KRtw0g8xrnWUQ/i
	xAr3hY2q63OafPywlhfzPOlVwH0M+dpCuHZZHtR+AywIA5Mk8yzVHPRVCdweWKjdKfwc
	x75Q==
MIME-Version: 1.0
X-Received: by 10.236.70.200 with SMTP id p48mr2844474yhd.178.1432216512683;
	Thu, 21 May 2015 06:55:12 -0700 (PDT)
Received: by 10.129.128.2 with HTTP; Thu, 21 May 2015 06:55:12 -0700 (PDT)
In-Reply-To: <1953557.Q3PSlmcSRZ@peggleto-mobl.ger.corp.intel.com>
References: <81B0EC78FE09F04E8E0FF9B9C2BF8A3649393797@deeres07.ebgroup.elektrobit.com>
	<1953557.Q3PSlmcSRZ@peggleto-mobl.ger.corp.intel.com>
Date: Thu, 21 May 2015 09:55:12 -0400
Message-ID: <CADkTA4PNiiDrvR2TzBsXP=i5bBGgvyuSBYRN5Rpwd46T+1=-1Q@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: Problem with module.bbclass
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
X-List-Received-Date: Thu, 21 May 2015 13:55:12 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, May 21, 2015 at 9:53 AM, Paul Eggleton
<paul.eggleton@linux.intel.com> wrote:
> Hi Steffen,
>
> On Thursday 21 May 2015 13:48:34 Steffen.Pankratz@elektrobit.com wrote:
>> I am using
>> http://git.openembedded.org/openembedded-core/tree/meta/classes/module.bbcl
>> ass as a base for my recipe to compile a kernel module outside of the kernel
>> tree.
>>
>> This is my recipe:
>>
>> DESCRIPTION = "Nouveau kernel module"
>> SECTION = "kernel/modules"
>> LICENSE = "CLOSED" #fixme
>> PR = "r0"
>> SRC_URI = "git://github.com/Gnurou/nouveau;protocol=https;branch=staging"
>> SRCREV = "c256f9450c613cd5075fc8c4a407686925041487"
>> S = "${WORKDIR}/git/drm/nouveau"
>> inherit module
>>
>> Naively, I hoped that would work out of the box. Of course it did not :) and
> every compiler call resulted in an error message like this:
>> | make: *** [lib/nvif/notify.o] Error 1
>> | In file included from ./lib/include/nvif/os.h:32:0,
>> |
>> |                  from ./drm/nouveau/include/nvif/object.h:4,
>> |                  from ./drm/nouveau/include/nvif/device.h:4,
>> |
>> |                  from drm/nouveau/nvif/device.c:25:
>> | /home/vagrant/repos/tk1/build/tmp/sysroots/x86_64-linux/usr/lib/arm-poky-l
>> | inux-gnueabi/gcc/arm-poky-linux-gnueabi/4.9.2/include/stdint.h:9:26: fatal
>> | error: stdint.h: No such file or directory|
>> |  # include_next <stdint.h>
>> |
>> |                           ^
>> |
>> | compilation terminated.
>>
>> I could resolve that issue by adding the following line to my recipe:
>>
>> EXTRA_OEMAKE='-C "${STAGING_KERNEL_DIR}"'
>>
>> And another problem I had faced was that using:
>>
>> S = "${WORKDIR}/git/drm/nouveau"
>>
>> Compiled all kernel modules inside the kernel tree, instead only the nouveau
>> kernel module.
>>
>> I could solve that as well and finally I ended up with:
>>
>> EXTRA_OEMAKE='-C "${STAGING_KERNEL_DIR}" M="${S}"/drm/nouveau/'
>>
>> Now, I am not sure if I am doing something wrong or if there maybe is a
>> problem with module.bbclass.
>
> The original message makes it sound like the makefile for the module isn't
> using CC but instead calling gcc directly, and thus not getting the
> --sysroot option passed in - is that possible?

Ha! We crossed in the ether. This is very likely what it is. Having just fixed
perf for the 4.1 kernel, that's exactly what was happening and the symptom
was the same.

Bruce

>
> Cheers,
> Paul
>
> --
>
> Paul Eggleton
> Intel Open Source Technology Centre
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"

