Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-la0-f42.google.com (mail-la0-f42.google.com
	[209.85.215.42])
	by mail.openembedded.org (Postfix) with ESMTP id 0D20260167
	for <openembedded-core@lists.openembedded.org>;
	Mon,  5 Jan 2015 20:18:39 +0000 (UTC)
Received: by mail-la0-f42.google.com with SMTP id gd6so19217521lab.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 05 Jan 2015 12:18:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=THirP0yEjJb0wXnkJJh63XQzSjO9rdujQJIEkrKMgXM=;
	b=GTvAG6n7Me2sxEyXFfZUsQHw577trq/arEBjYJaZAkicMK36+V3Na4OyHYtEkDLWY8
	6TkoJb7YshvH1/EE9f7dmcdFNCjl0xP9MUZoMzE6NlHDUK6+Dl8/PEuKKHF+iZVQoiQ0
	B4CfaOs+d4nQlQJvINwOZARbitEJ1T7CjgeVjuf5LuT3XEfdGxmkciVuJxZhkzcc0JUA
	Zj5p4joricrorDkqBjTHrM2suot5m8hznFlKj7PSbQ/0u0xs5SNtq7E9nmhDCsQUgDSn
	CrDfjXlvh6tINFXQlQMdLLi5tzjoCiVL/sYkMuapoQpKKkCvuwzimOIC+LZ6RRMmX9dM
	Vp+w==
MIME-Version: 1.0
X-Received: by 10.112.154.70 with SMTP id vm6mr93244542lbb.18.1420489119331;
	Mon, 05 Jan 2015 12:18:39 -0800 (PST)
Received: by 10.112.48.41 with HTTP; Mon, 5 Jan 2015 12:18:39 -0800 (PST)
In-Reply-To: <54AA4B86.9040905@topic.nl>
References: <54AA4536.7030101@topic.nl>
	<54AA4B86.9040905@topic.nl>
Date: Mon, 5 Jan 2015 15:18:39 -0500
Message-ID: <CADkTA4MgqEASmHgGunCkTUR=1qdgxP6dqW90PmgYmZ2HHTUWPg@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Mike Looijmans <mike.looijmans@topic.nl>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: What is expected of a kernel recipe nowadays?
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
X-List-Received-Date: Mon, 05 Jan 2015 20:18:42 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Jan 5, 2015 at 3:29 AM, Mike Looijmans <mike.looijmans@topic.nl> wrote:
> I think I found it. The kernel bbclass changes "S" to point elsewhere.
> Moving the statement
> S = "${WORKDIR}/git"
> to after the "inherit kernel" line makes the compile run again.


Interesting. Can you confirm that Richard's commit:

-----------------

commit 1dd37a2a9960ad26e27567d1871d78bec336e1a2
Author: Richard Purdie <richard.purdie@linuxfoundation.org>
Date:   Fri Dec 19 17:46:27 2014 +0000

    kernel: Fix non linux-yocto builds

    After the recent kernel changes, non linux-yocto builds stopped working
    properly for two reasons:

    a) ${S} was being reset to ${WORKDIR}/git for example and STAGING_KERNEL_DIR
       did not contain the source

    b) Most builds were using ${B} == ${S}

    This patch adds a fixup to the unpack function to handle the case where
    ${S} != ${STAGING_KERNEL_DIR} and also set up the infrastrcture so that
    B != S for kernel builds from now on. The kernel build system is one of the
    best for supporting this and there is no good reason not to take advantage
    of it.

    (From OE-Core rev: 106dab2fd0321e6b4e77b40111e59a3a31d329d4)

    Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

------------

Is in your tree ? it should be fixing things up and allowing the source to
be found.

Alternatively, if you drop the explicit set of S, does the build start working
again ?

Bruce

>
>
>
>
> On 01/05/2015 09:03 AM, Mike Looijmans wrote:
>>
>> I updated to the current master of OE-core, but I can't get the kernel
>> recipe
>> to work any longer:
>>
>> https://github.com/topic-embedded-products/meta-topic/blob/master/recipes-kernel/linux-zynq/linux-topic.bb
>>
>>
>> (I got similar problems in other projects too, I'm focussing on this one
>> first.)
>>
>> Several things were changed in kernel.bbclass, but I don't understand what
>> is
>> being expected from me now to get the kernel recipe in working order
>> again.
>>
>>
>> | DEBUG: Executing python function sysroot_cleansstate
>> | DEBUG: Python function sysroot_cleansstate finished
>> | DEBUG: Executing shell function do_configure
>> | NOTE: make -C
>>
>> /home/mike/zynq_platform/build/tmp-glibc/sysroots/topic-miami-vice-xc7z015/usr/src/kernel
>>
>> O=/home/mike/zynq_platform/build/tmp-glibc/work/topic_miami_vice-oe-linux-gnueabi/linux-topic/3.17+gitAUTOINC+0feb6e4839-r0/build
>> oldnoconfig
>> | make: Entering directory
>>
>> `/home/mike/zynq_platform/build/tmp-glibc/sysroots/topic-miami-vice-xc7z015/usr/src/kernel'
>>
>> | make: *** No rule to make target `oldnoconfig'.  Stop.
>> | make: Leaving directory
>>
>> `/home/mike/zynq_platform/build/tmp-glibc/sysroots/topic-miami-vice-xc7z015/usr/src/kernel'
>>
>> | NOTE: make -C
>>
>> /home/mike/zynq_platform/build/tmp-glibc/sysroots/topic-miami-vice-xc7z015/usr/src/kernel
>>
>> O=/home/mike/zynq_platform/build/tmp-glibc/work/topic_miami_vice-oe-linux-gnueabi/linux-topic/3.17+gitAUTOINC+0feb6e4839-r0/build
>> oldconfig
>>
>>
>>
>> Met vriendelijke groet / kind regards,
>>
>> Mike Looijmans
>> System Expert
>>
>>
>> TOPIC Embedded Systems
>> Eindhovenseweg 32-C, NL-5683 KH Best
>> Postbus 440, NL-5680 AK Best
>> Telefoon: (+31) (0) 499 33 69 79
>> Telefax:  (+31) (0) 499 33 69 70
>> E-mail: mike.looijmans@topic.nl
>> Website: www.topic.nl
>>
>> Please consider the environment before printing this e-mail
>>
>> Topic zoekt gedreven (embedded) software specialisten!
>> http://topic.nl/vacatures/topic-zoekt-software-engineers/
>>
>
>
>
> Met vriendelijke groet / kind regards,
>
> Mike Looijmans
> System Expert
>
>
> TOPIC Embedded Systems
> Eindhovenseweg 32-C, NL-5683 KH Best
> Postbus 440, NL-5680 AK Best
> Telefoon: (+31) (0) 499 33 69 79
> Telefax:  (+31) (0) 499 33 69 70
> E-mail: mike.looijmans@topic.nl
> Website: www.topic.nl
>
> Please consider the environment before printing this e-mail
>
> Topic zoekt gedreven (embedded) software specialisten!
> http://topic.nl/vacatures/topic-zoekt-software-engineers/
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"

