Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-yk0-f174.google.com (mail-yk0-f174.google.com
	[209.85.160.174])
	by mail.openembedded.org (Postfix) with ESMTP id B5C9F6E630
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Aug 2015 02:09:16 +0000 (UTC)
Received: by ykoo205 with SMTP id o205so51522830yko.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 05 Aug 2015 19:09:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=KfZK5Wp/XZ+vA9ufaQKymtNmEFB40g9j+6Lr24wM0/g=;
	b=wmQjCB84vgsogUbVMiqUb84iS/mA3Ab9oywTtmPA1M9Kw9uLG/aZaQJ6bA4+havbHE
	e0Php7bmPn3Xor3bl+DqLjfeQGYWk8uI1gW7BsAcovr56Ro0us9MTwbKNIlaH/mWfyVg
	w2Z9jW5Pb4ew2aZuxxR17bP1BeejBGogPGJdKS4hE87YPF8l+H8q5zW+QzLEMh7JZkY9
	xPyhW0tq8X7cj54GxBdo/S7R/S5aPrI4Yi0qlmh5O5YbXPs2tGR8jxjcdVOlm979asae
	WXeapYo9+L1ISjNb+uJgPv3/9vTOscjagowO2jHFJZ6hu+h1iX0I+Ox8EAgBV3liyZrD
	lsKg==
MIME-Version: 1.0
X-Received: by 10.13.234.76 with SMTP id t73mr12608908ywe.68.1438826956842;
	Wed, 05 Aug 2015 19:09:16 -0700 (PDT)
Received: by 10.13.226.203 with HTTP; Wed, 5 Aug 2015 19:09:16 -0700 (PDT)
In-Reply-To: <6E51916E4A1F32428260031F4C7CD2B6101D4E4C@ORSMSX109.amr.corp.intel.com>
References: <1438634128-4347-1-git-send-email-juro.bystricky@intel.com>
	<55C0E631.7070703@windriver.com>
	<6E51916E4A1F32428260031F4C7CD2B6101D46F3@ORSMSX109.amr.corp.intel.com>
	<55C0F729.5000908@windriver.com>
	<CADkTA4MPP3KiV9Nq_wi-_qx26mGEkX+uzXvv4ZXfM0YpMEccKw@mail.gmail.com>
	<CADkTA4PchJT4R5tmzeYwOWQLf_4OnuD0KtU08z=Yjf0zfEwM0A@mail.gmail.com>
	<6E51916E4A1F32428260031F4C7CD2B6101D4E4C@ORSMSX109.amr.corp.intel.com>
Date: Wed, 5 Aug 2015 22:09:16 -0400
Message-ID: <CADkTA4O5dj_TdNOGitrT5tte9SC+7GdbD-KPk_TZjsoaRHxGNg@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: "Bystricky, Juro" <juro.bystricky@intel.com>
Cc: "Purdie, Richard" <richard.purdie@intel.com>,
	"jurobystricky@hotmail.com" <jurobystricky@hotmail.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/2] Support for VirtualBox guest additions
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
X-List-Received-Date: Thu, 06 Aug 2015 02:09:23 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Aug 5, 2015 at 6:02 PM, Bystricky, Juro
<juro.bystricky@intel.com> wrote:
> Thanks for the link. My new understanding is that kernel-dev package
> should already have essentially the same functionality as the kernel-headers package,
> which makes kernel-headers package redundant.
>  I tried it, but it did not work.
> To be specific, I expected to see the folder "/usr/lib/modules/3.19.5-yocto-standard/build"
> however, it is missing . Looking at kernel.bbclass it seems it used to exist, but succumbed to
> some bitrot.

What release are you using ? master ? I just want to talk about the right
organization of the code.

and yes, the /usr/lib/modules/* path did exist, but with the move to
kernel-devsrc,
it appears to have been broken. Nothing is creating the directory, or a symlink
to point the convenience (or nothing that I can see from my scan).

As you can see from the mix of recipes/classes and the manipulations
of the parts of the tree .. that there are still some issues with the packaging
and we need to sort that out first, and then see if anything new really does
need to be created.

Rather than kernel-dev, you should be using kernel-devsrc in master, and we can
work to make kernel-devsrc have a smaller footprint with some additional
packaging changes (if required), but the full package should meet your current
need.

You said you tried it (kernel-devsrc), what errors did you run into there ?

>
> Just to make sure  we are on the same page, this is what I would like to accomplish:
> http://www.cyberciti.biz/tips/build-linux-kernel-module-against-installed-kernel-source-tree.html

Yep. This is what we test, so I'm still interested in the details of what broke
for you, if you have a recipe or captured output, I'd be interested in
seeing it,
so I can debug further.

I've built the entire kernel, modules, and thinks like the ATI / nvidia modules
against an installed kernel-dev package, so it did work as intended in those
cases .. that being said, me saying "it worked for me", isn't what I'm claiming
is the complete answer :)

I'm just away from my development machines at the moment, so I can't easily
spawn test builds for another 4 or 5 days.

Bruce

>
> Juro
>
>> -----Original Message-----
>> From: Bruce Ashfield [mailto:bruce.ashfield@gmail.com]
>> Sent: Tuesday, August 4, 2015 7:49 PM
>> To: Hatle, Mark G (Wind River)
>> Cc: Bystricky, Juro; openembedded-core@lists.openembedded.org;
>> jurobystricky@hotmail.com; Purdie, Richard
>> Subject: Re: [OE-core] [PATCH 0/2] Support for VirtualBox guest additions
>>
>> On Tue, Aug 4, 2015 at 11:43 PM, Bruce Ashfield <bruce.ashfield@gmail.com>
>> wrote:
>> > On Tue, Aug 4, 2015 at 2:32 PM, Mark Hatle <mark.hatle@windriver.com>
>> wrote:
>> >> On 8/4/15 12:25 PM, Bystricky, Juro wrote:
>> >>> I agree, the name "kernel-headers" may not be the most fortunate,
>> "linux-headers"
>> >>> is probably more fitting.  The recipe installs the files in a
>> >>> similar fashion that is done by
>> >>>
>> >>> apt-get install linux-headers-$(uname -r)
>> >>>
>> >>> Typical contents can be viewed for example here:
>> >>> https://www.archlinux.org/packages/core/i686/linux-headers/
>> >>>
>> >>> These files are needed to allow building  of kernel drivers against
>> >>> the running Linux kernel. In a way, it is a subset of kernel-devsrc,
>> >>> but including  ".config" file used for the actual running kernel.
>> >>
>> >> Again this is part of the purpose of the existing kernel-devsrc
>> >> package.  So what is missing preventing this from working.  It likely
>> >> needs to be added to the kernel-devsrc package instead (or a sub
>> >> package that is created by the kernel-devsrc recipe.)
>> >
>> > Peeking in on vacation.
>> >
>> > At a minimum, we need to figure out why the existing package wasn't
>> > able to build the use case in question here .. I've built pretty much
>> > everything against it at one point .. so I'd like to learn more.
>> >
>> > And yes, what we don't need is more sets of rules that copy and
>> > package parts of the kernel build. We are already doing that in our
>> > do_shared_workdir and that is pretty much the minimum to build against
>> > the kernel. If that directory structure needs more for this purpose (or less),
>> then update it.
>> >
>> > But we need to do all of this in the existing classes, to keep
>> > everything in one place, not more recipes that are grabbing chunks of
>> > the same source tree.
>>
>> FYI: exiting thoughts are here:
>>
>> https://bugzilla.yoctoproject.org/show_bug.cgi?id=7095
>>
>> So as you can see, we aren't offended by a 'headers' package, but it has to
>> make sense with the existing packages, and needs to be generating from our
>> existing bits of the system.
>>
>> Cheers,
>>
>> Bruce
>>
>> >
>> > Bruce
>> >
>> >
>> >>
>> >>> Having these files installed, it is possible  to compile additional
>> >>> kernel drivers that are not part of the kernel-devsrc .
>> >>>  VirtualBox compiles some of their own drivers this way, others as well.
>> >>> There are many other scenarios where you may want to add a new
>> >>> kernel driver to an already installed Linux kernel.
>> >>
>> >> Yes, this was part of the design behind the kernel-devsrc, make sure
>> >> the sources and components used to build the running kernel were made
>> >> available to the target so that out-of-tree/external kernel modules
>> >> could be built to match the running system -- as well as the ability
>> >> to reconfigure and rebuild the kernel itself.
>> >>
>> >> Bruce is on vacation this week and may not be around to respond, but
>> >> adding yet another package is not the right answer here.  Lets fix
>> >> what may be broken in what we have.
>> >>
>> >> --Mark
>> >>
>> >>> Juro
>> >>>
>> >>>
>> >>>
>> >>>> -----Original Message-----
>> >>>> From: Mark Hatle [mailto:mark.hatle@windriver.com]
>> >>>> Sent: Tuesday, August 4, 2015 9:20 AM
>> >>>> To: Bystricky, Juro; openembedded-core@lists.openembedded.org;
>> >>>> jurobystricky@hotmail.com
>> >>>> Cc: Purdie, Richard
>> >>>> Subject: Re: [OE-core] [PATCH 0/2] Support for VirtualBox guest
>> >>>> additions
>> >>>>
>> >>>> On 8/3/15 3:35 PM, Juro Bystricky wrote:
>> >>>>> In order to support VirtualBox guest additions, kernel headers
>> >>>>> need to be present in the VM. I am aware we already have two
>> >>>>> packages/recipes that are somewhat similar (kernel-devsrc.bb,
>> >>>>> linux-libc-headers), but none
>> >>>> of them is suitable for this purpose.
>> >>>>> Besides the kernel headers, some additional files (scripts,
>> >>>>> Makefiles, .config, etc) are also required.
>> >>>>
>> >>>> linux-libc-headers is only for building applications.
>> >>>> kernel-devsrc is for building modules on the target.
>> >>>>
>> >>>> What do these specific modules need that are not present in kernel-
>> devsrc?
>> >>>> (I really don't want 'yet another' confusing package added to the
>> >>>> system.)
>> >>>>
>> >>>>> The new recipe "kernel-headers.bb" can in principle be used by
>> >>>>> other
>> >>>> images as well.
>> >>>>> It is not limited to the Build Appliance and hence is not a part
>> >>>>> of the Build Appliance recipe.
>> >>>>
>> >>>> I think kernel-headers is a bad name for a package.  It could be
>> confusing.
>> >>>>
>> >>>> --Mark
>> >>>>
>> >>>>> Juro Bystricky (2):
>> >>>>>   kernel-headers: linux kernel headers
>> >>>>>   build-appliance-image: support for VirtualBox guest addtions
>> >>>>>
>> >>>>>  .../README_vbox_guest_additions.txt                | 78
>> >>>> ++++++++++++++++++++++
>> >>>>>  .../images/build-appliance-image_12.0.1.bb         |  4 +-
>> >>>>>  meta/recipes-kernel/linux/kernel-headers.bb        | 66
>> >>>> ++++++++++++++++++
>> >>>>>  3 files changed, 147 insertions(+), 1 deletion(-)  create mode
>> >>>>> 100644
>> >>>>> meta/recipes-core/images/build-appliance-
>> >>>> image/README_vbox_guest_addit
>> >>>>> ions.txt  create mode 100644
>> >>>>> meta/recipes-kernel/linux/kernel-headers.bb
>> >>>>>
>> >>>
>> >>
>> >> --
>> >> _______________________________________________
>> >> Openembedded-core mailing list
>> >> Openembedded-core@lists.openembedded.org
>> >> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>> >
>> >
>> >
>> > --
>> > "Thou shalt not follow the NULL pointer, for chaos and madness await
>> > thee at its end"
>>
>>
>>
>> --
>> "Thou shalt not follow the NULL pointer, for chaos and madness await thee
>> at its end"



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"

