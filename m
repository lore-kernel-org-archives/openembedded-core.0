Received: from mail-lb0-f175.google.com ([209.85.217.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bruce.ashfield@gmail.com>) id 1TBmo5-0004HL-M0
	for openembedded-core@lists.openembedded.org;
	Wed, 12 Sep 2012 15:16:41 +0200
Received: by lban1 with SMTP id n1so1019522lba.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Sep 2012 06:04:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=DiYo4D1F7eaVJladALFJ2KRus0mNc+5Pc6rFgjHfmZs=;
	b=J04ZXeovp0n1mhvHF9H+UcVQSJnah+/kp7qg2KfDVii1AEjestCS3Y7GZyCyzdmyJy
	OAXUkrZIbEifbWxPL4ejMcrLRBbWHRIuiew1OWRJAmy79QAQQ/LitzNANchuok/5gpoK
	GSdW6Rnj4Q3tJb/DDKdIPcNVzKgWKXEo87lcinrBx0tf5G/LnT7JeV1vSn13lcYos8Zz
	rOCwkNMiExr84b8tqeV974ccYw1NETdtOyvn80JLrcn1Zm2MuOiJncb/n/GAqjdhycP0
	RIl0mKmOWoufjaPpBIfwWBgPJC9XtmQWO6MGcaYzMlxwabmZOy6FL1PLRoNJsWLo3WoQ
	TZWQ==
MIME-Version: 1.0
Received: by 10.152.144.168 with SMTP id sn8mr18787799lab.1.1347454731802;
	Wed, 12 Sep 2012 05:58:51 -0700 (PDT)
Received: by 10.114.68.20 with HTTP; Wed, 12 Sep 2012 05:58:51 -0700 (PDT)
In-Reply-To: <1347452729.11710.7.camel@ted>
References: <cover.1347376358.git.bruce.ashfield@windriver.com>
	<ea700a4897d82d27177a0583f01b6432ac7ec379.1347376358.git.bruce.ashfield@windriver.com>
	<504F59B1.60308@intel.com> <504F5B17.5070500@windriver.com>
	<504F5B9A.7070501@intel.com> <1347379081.2122.48.camel@ted>
	<504F61BF.30902@intel.com> <1347452729.11710.7.camel@ted>
Date: Wed, 12 Sep 2012 08:58:51 -0400
Message-ID: <CADkTA4OL98FtR_38BMn0H3zxVmvbJ08Yd7D3qcQX+Sei9kRLLg@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org, Saul Wold <saul.wold@intel.com>
Subject: Re: [PATCH 2/2] linux-yocto/3.4: add x32 configuration fragment and tuning hook
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 12 Sep 2012 13:16:41 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Wed, Sep 12, 2012 at 8:25 AM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> On Tue, 2012-09-11 at 09:07 -0700, Saul Wold wrote:
>> On 09/11/2012 08:58 AM, Richard Purdie wrote:
>> > On Tue, 2012-09-11 at 08:41 -0700, Saul Wold wrote:
>> >> On 09/11/2012 08:39 AM, Bruce Ashfield wrote:
>> >>> On 12-09-11 11:33 AM, Saul Wold wrote:
>> >>>> On 09/11/2012 08:17 AM, Bruce Ashfield wrote:
>> >>>>> When x32 is the tuning for a x86 MACHINE, the kernel should also have
>> >>>>> CONFIG_X86_X32=y.
>> >>>>>
>> >>>>> This can be accomplished by adding the x32 configuraion fragment to the
>> >>>>> KERNEL_FEATURES when x32 is the tuning for a given machine.
>> >>>>>
>> >>>>> cc: Saul Wold <sgw@linux.intel.com>
>> >>>>> Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
>> >>>>> ---
>> >>>>> meta/recipes-kernel/linux/linux-yocto-rt_3.4.bb | 3 ++-
>> >>>>> meta/recipes-kernel/linux/linux-yocto_3.4.bb | 3 ++-
>> >>>>> 2 files changed, 4 insertions(+), 2 deletions(-)
>> >>>>>
>> >>>>> diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_3.4.bb
>> >>>>> b/meta/recipes-kernel/linux/linux-yocto-rt_3.4.bb
>> >>>>> index 4fd3845..156fb93 100644
>> >>>>> --- a/meta/recipes-kernel/linux/linux-yocto-rt_3.4.bb
>> >>>>> +++ b/meta/recipes-kernel/linux/linux-yocto-rt_3.4.bb
>> >>>>> @@ -10,7 +10,7 @@ KMETA = "meta"
>> >>>>>
>> >>>>> SRCREV_machine ?= "a35693b1287c0e50cdca33a1b95af0ff48b43cd0"
>> >>>>> SRCREV_machine_qemuppc ?= "85a1190530cb5749f5f831670976b163438dc301"
>> >>>>> -SRCREV_meta ?= "d9d5fc63d8b38705036e946ea77d971d95de11ad"
>> >>>>> +SRCREV_meta ?= "e0374ce012e7e6fc8e5bb8b957addb0478950898"
>> >>>>>
>> >>>>> PR = "${INC_PR}.0"
>> >>>>> PV = "${LINUX_VERSION}+git${SRCPV}"
>> >>>>> @@ -27,3 +27,4 @@ KERNEL_FEATURES_append = " features/netfilter"
>> >>>>> KERNEL_FEATURES_append = " features/taskstats"
>> >>>>> KERNEL_FEATURES_append_qemux86 = " cfg/sound"
>> >>>>> KERNEL_FEATURES_append_qemux86-64 = " cfg/sound"
>> >>>>> +KERNEL_FEATURES_append_x32 = " cfg/x32"
>> >>>>
>> >>>> Scratch this bit and below, as I think I will use the other mechanism
>> >>>> you talked about to go from a .conf file.
>> >>>
>> >>> Works for me. The meta change is staged and pushed out, I'll update this
>> >>> patch to not have the KERNEL_FEATURES portion.
>> >>>
>> >> Thanks, see my other email to RP, since x32 is a feature that any x86-64
>> >> machine might want to enable based on the DEFAULTTUNE it makes more
>> >> sense to be in the machine config includes.
>> >
>> > No, it doesn't.
>> >
>> > What we need here is:
>> >
>> > -KERNEL_FEATURES_append = " features/taskstats"
>> > +KERNEL_FEATURES_append = " features/taskstats ${@bb.utils.contains("TUNE_FEATURES", "mx32", " cfg/x32", "" ,d)}"
>> >
>> No, this would then only address the qemu machine, what about all the HW
>> BSP that might want it, they would need to add this same line.  If I add
>> the KERNEL_FEATURES_append to the arch-ia32.inc, conditional on mx32,
>> then any x86-64 BSP can just enable that TUNE, isn't that the point of
>> the machine config tuning?
>
> It is the point, however, the key part of this you're ignoring is that
> the kernel fragment management only happens for linux-yocto. Only the
> linux-yocto recipe supports the KERNEL_FEATURES mechanism.
>
> The arch-ia32.inc file and any machine config *cannot* depend on
> linux-yocto.
>
> So this glue belongs in linux-yocto. I agree is suboptimal for people
> not using it but such is life, there isn't any generic mechanism we can
> place this into.

:)

linux-yocto it is, I've respun the patches to include the TUNE_FEATURES check
and pushed them to poky-contrib zedd/x32:

 7aeb32 linux-yocto/3.4: add x32 configuration fragment
 d34a34c linux-yocto*: append to KERNEL_FEATURES instead of assigning

I don't have a x32 build handy, but I assume Saul will take them for a spin.

If you want a full resend of the series, shout and I'll git send-email them out.

Cheers,

Bruce

>
>> > which is simple, effective and to the point. If we start needing lots of
>> > these, we can look at an x32 override but right now I don't see the
>> > need.
>> >
>> And it does not have to be an x32 override, we just set it in the
>> arch-ia32.inc file where we define that TUNE.
>>
>> That seems the best way.
>
> Its not. See above.
>
> Cheers,
>
> Richard
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"


