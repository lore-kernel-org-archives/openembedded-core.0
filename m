Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-yk0-f169.google.com (mail-yk0-f169.google.com
	[209.85.160.169])
	by mail.openembedded.org (Postfix) with ESMTP id D3E0C60017
	for <openembedded-core@lists.openembedded.org>;
	Wed,  5 Aug 2015 13:50:38 +0000 (UTC)
Received: by ykax123 with SMTP id x123so35702856yka.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 05 Aug 2015 06:50:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=YVy+mvYskRj+39+WDVaLVxD/pO2Dfy/5M7npVPVdpfA=;
	b=syKeSWIZf3xs2n84f6FN+GU89Ymg5GnLwg1iLJf7vILTUam2EzeKXyXxXXxGINIzKr
	csymUPbXq5xVq3tiwZ7ThcrTh8JALgrp06x2omxXD0xv5XEd8tFqE0z7KSJncvzofMQC
	YabE3wCLzu1aD4iODU6eES7F/tCctHvqOM8avL//NPhWPU0AvJKHRTxcNrGJL3jK7CMQ
	PYvE9aLpR0NmV+V6PkGiZhIWSpmHKEMk5PLKR60hq2HMBoFER0kFrz9An1zppagc3XXi
	G5phjAxT4AB0K/Rj5WpWz1y3kTTPoXWUZ8cZ9FY8/7qscLa4Ged6l4oCSFeqStB7w3vM
	drPw==
MIME-Version: 1.0
X-Received: by 10.13.234.76 with SMTP id t73mr9350934ywe.68.1438782638822;
	Wed, 05 Aug 2015 06:50:38 -0700 (PDT)
Received: by 10.13.226.203 with HTTP; Wed, 5 Aug 2015 06:50:38 -0700 (PDT)
In-Reply-To: <OF2F3F95BE.08ECF07F-ONC2257E98.002DF696-C2257E98.002F92BC@ni.com>
References: <1438674108-24258-1-git-send-email-adrian.ratiu@ni.com>
	<CADkTA4PEZCM151f7Z72jcr-4H3MQqusdPr9WkO-jwUxrufPsTw@mail.gmail.com>
	<OF2F3F95BE.08ECF07F-ONC2257E98.002DF696-C2257E98.002F92BC@ni.com>
Date: Wed, 5 Aug 2015 09:50:38 -0400
Message-ID: <CADkTA4POzofrpfDEp8_bRokSoPV+2pb_RimQ+PrrZ2guqfPGNw@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Adrian Ratiu <adrian.ratiu@ni.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] kernel-yocto: do_configme: Add $TOOLCHAIN_OPTIONS to CFLAGS
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
X-List-Received-Date: Wed, 05 Aug 2015 13:50:43 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Aug 5, 2015 at 4:39 AM, Adrian Ratiu <adrian.ratiu@ni.com> wrote:
> Bruce Ashfield <bruce.ashfield@gmail.com> wrote on 05.08.2015 05:17:14:
>
>> On Tue, Aug 4, 2015 at 4:41 AM, Ioan-Adrian Ratiu <adrian.ratiu@ni.com>
>> wrote:
>> > The kernel configure step was broken by the sysroot poisoning in [1].
>>
>> Can you be more precise here ? Configuration certainly works for me .. and
>> has been working since last October.
>
> This works because it was fixed in linux-yocto.inc *after* the sysroot
> poisoning.
> I've mentioned this in the next line :) But this is not what this fix is
> for,
> this fix should have been done at the same time with adding
> $TOOLCHAIN_OPTIONS
> to $KERNEL_CC in linux-yocto.inc.
>
> This bug was missed because there is NO error reporting in
> yocto-kernel-tools
> merge_configs.sh and the build continues despite the error. I've sent a
> patch to
> fail loudly in case merge_configs.sh fails in yocto-kernel-tools. You know
> about
> it because you responded to that mail :) These issues are related.

right. And as you saw there .. I don't need that patch. So we might as well
let this one sit as well.

>
>> > In linux-yocto.inc this was fixed by appending $TOOLCHAIN_OPTIONS to
>> > KERNEL_CC, TOOLCHAIN_OPTIONS containing the needed --sysroot arg.
>> >
>> > However, [1] also breaks the yocto configure fragment generation:
>> > after parsing the fragments, when make is called on the merged file
>> > to fill in any missing symbols with default values. The call chain is:
>> >
>> > do_kernel_configme() -> configme -> merge_config.sh
>> > -> make KCONFIG_ALLCONFIG=$TMP_FILE
>> >
>> > This issue was uncaught until now because configme redirects all stdout
>> > and stderr to merge_log.txt prior to calling merge_configs.sh and there
>> > is no return value checking, so building continues and the silent error
>> > is ignored.
>> >
>> > Adding $TOOLCHAIN_OPTIONS to $CFLAGS before calling configme fixes this.
>> >
>> > TODO: In a future patch this kind of error should be made loud and cause
>> > the build to fail.
>> >
>>
>> That won't be required, I already have a queue of patches that changes
>> things significantly.
>>
>> If you can elaborate on the type of breakage you were seeing, I'll add
>> this to that queue.
>
> The error I'm seeing is caused by merge_configs.sh from yocto-kernel-tools
> which calls make --alldefconfig | --allnoconfig with a poisoned sysroot.
>
> The failure is caused by make not getting a --sysroot argument and this
> error
> fails silently because of not checking the return code in yocto-kernel-tools
> (again, I've sent a patch for this also, you responded to it yesterday).
>

I'm pretty familiar with these issues .. having fixed many myself. All I was
looking for was the cut and paste of the error message.

The right thing is to ensure that the scripts and tools for the kernel
config are build long before the configuration merging happens, and
that is what I've done with my re-ordering.

Cheers,

Bruce

> The correct way to fix this IMO is to add the --sysroot ARG to the
> environment
> in kernel-yocto.bbacless do_configme *before* calling the
> yocto-kernel-tools,
> thus the tools get called with a sane sysroot.
>
> The exact error is this:
>
> Partial contents of merge_log.txt:
> "
> HOSTCC  scripts/basic/fixdep
> /home/ovidiu/000/git/nilrt/build/tmp-glibc/work-shared/x64/kernel-source/scripts/basic/fixdep.c:106:23:
> fatal error: sys/types.h: No such file or directory
> #include <sys/types.h>
>                       ^
> compilation terminated.
> /home/ovidiu/000/git/nilrt/build/tmp-glibc/work-shared/x64/kernel-source/scripts/basic/Makefile:21:
> recipe for target 'scripts/basic/x86_64-nilrt-linux-fixdep' failed
> make[2]: *** [scripts/basic/x86_64-nilrt-linux-fixdep] Error 1
> /home/ovidiu/000/git/nilrt/build/tmp-glibc/work-shared/x64/kernel-source/Makefile:428:
> recipe for target 'scripts_basic' failed
> make[1]: *** [scripts_basic] Error 2
> Makefile:133: recipe for target 'sub-make' failed
> make: *** [sub-make] Error 2
> "
>
>
>
> National Instruments Romania S.R.L.
> ------------------------------------------------------
> B-dul 21 Decembrie 1989, nr. 77, A2
> Cluj-Napoca 400604, Romania
> C.I.F.: RO17961616 | O.R.C.: J12/3337/2005
> Telefon: +40 264 406428 | Fax: +40 264 406429
> E-mail: office.cluj@ni.com
> Web: romania.ni.com
>
> Vanzari si suport tehnic:
> Telefon gratuit : 0800 070071
> E-mail vanzari: ni.romania@ni.com
> E-mail suport tehnic: techsupport@ni.com



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"

