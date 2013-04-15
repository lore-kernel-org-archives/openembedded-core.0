Received: from mail-lb0-f180.google.com ([209.85.217.180])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bruce.ashfield@gmail.com>) id 1URoZ5-0003k7-6Y
	for openembedded-core@lists.openembedded.org;
	Mon, 15 Apr 2013 20:55:44 +0200
Received: by mail-lb0-f180.google.com with SMTP id t11so4803153lbi.39
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Apr 2013 11:38:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:x-received:in-reply-to:references:date:message-id
	:subject:from:to:content-type;
	bh=KBzxXGhxkzaDBCFTc/f9oyEiar6cfpoIrgFpQBAY0z8=;
	b=XF4qWAOp5cpdR7ZfgiQY/42yKc5qNIFJmlliSj0FL1mk3sPYLDSPYZxIOatrB/lgHh
	LUt+b0yBXpFYnQ6ZQ+jVgtxl/4BzwMwEiENcvav098ZYf3kqNEu06sUfCwyLUG04BPOx
	kE3Pl42Uyk9QViI5GFej3CPjXvyCVHWXZkKQp6+TllY5KxtRze17nsvDDmUxi9m4Pfoc
	b4CTRKy8fyhd8hNckatBuWx2FS4n/ebWXQd19IlXnG5LTvVLe4KchlEfeoplTsGosdr3
	YIXMzKwqCcJr2oFzhJgurg4FJFKrhlxbCngfEPGSyGN/2y3XRW6OtWddbsFdt5snhjaX
	2R0w==
MIME-Version: 1.0
X-Received: by 10.152.19.199 with SMTP id h7mr1221973lae.21.1366051093751;
	Mon, 15 Apr 2013 11:38:13 -0700 (PDT)
Received: by 10.112.75.161 with HTTP; Mon, 15 Apr 2013 11:38:13 -0700 (PDT)
In-Reply-To: <CADkTA4Nz1jGjK+iJEXKQ8zVcR0DBOP-4x97b57_wdoN7kSdP4w@mail.gmail.com>
References: <20130415180716.GA30774@ad.chargestorm.se>
	<CADkTA4Nz1jGjK+iJEXKQ8zVcR0DBOP-4x97b57_wdoN7kSdP4w@mail.gmail.com>
Date: Mon, 15 Apr 2013 14:38:13 -0400
Message-ID: <CADkTA4O8VpiQB8vCDPoB87N+fafYrpjL4grN3HNn_7ys_cty=Q@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: linux-yocto-custom. error in patch step
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
X-List-Received-Date: Mon, 15 Apr 2013 18:55:48 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Mon, Apr 15, 2013 at 2:15 PM, Bruce Ashfield
<bruce.ashfield@gmail.com> wrote:
> On Mon, Apr 15, 2013 at 2:07 PM, Anders Darander <anders@chargestorm.se> wrote:
>>
>> Hi,
>>
>> I've been playing around a little bit with linux-yocto-custom, however,
>> i'm currently getting a build error (rather patch error)...
>>
>> Skipping my own layers and machines, I've reproduced the same issue by
>> just taking oe-core (or poky), and editing
>> meta-skeleton/recipes-kernel/linux-yocto-custom.bb accoring to the
>> partial patch below, and adding a defconfig in
>> meta-skeletons/recipes-kernel/linux/linux-yocto-custom/defconfig:
>>
>> ---------------------
>> @@ -47,18 +47,23 @@ require recipes-kernel/linux/linux-yocto.inc
>>  # Override SRC_URI in a bbappend file to point at a different source
>>  # tree if you do not want to build from Linus' tree.
>>  SRC_URI =
>> "git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git;protocol=git;nocheckout=1"
>> +SRC_URI += "file://defconfig"
>>
>> -LINUX_VERSION ?= "3.4"
>> +LINUX_VERSION ?= "3.8"
>>  LINUX_VERSION_EXTENSION ?= "-custom"
>>
>>  # Override SRCREV to point to a different commit in a bbappend file to
>>  # build a different release of the Linux kernel.
>>  # tag: v3.4 76e10d158efb6d4516018846f60c2ab5501900bc
>> -SRCREV="76e10d158efb6d4516018846f60c2ab5501900bc"
>> +SRCREV="19f949f52599ba7c3f67a5897ac6be14bfcb1200"
>> +
>> +
>>
>>  PR = "r1"
>>  PV = "${LINUX_VERSION}+git${SRCPV}"
>>
>>  # Override COMPATIBLE_MACHINE to include your machine in a bbappend
>>  # file. Leaving it empty here ensures an early explicit build failure.
>> -COMPATIBLE_MACHINE = "(^$)"
>> +COMPATIBLE_MACHINE = "qemuarm"
>> ----------------------
>>
>> I'm using qemuarm as a playground (as I'm normally running a custom arm
>> machine).
>>
>> This gives the following error:
>> ERROR: Function failed: do_patch (see
>> /home/anders/poky/build/tmp/work/qemuarm-poky-linux-gnueabi/linux-yocto-custom/3.8+gitAUTOINC+19f949f52599ba7c3f67a5897ac6be14bfcb1200-r1/temp/log.do_patch.8972
>> for further information)
>> ERROR: Logfile of failure stored in:
>> /home/anders/poky/build/tmp/work/qemuarm-poky-linux-gnueabi/linux-yocto-custom/3.8+gitAUTOINC+19f949f52599ba7c3f67a5897ac6be14bfcb1200-r1/temp/log.do_patch.8972
>> Log data follows:
>> | DEBUG: Executing shell function do_patch
>> | WARNING: no meta data branch found ...
>> | Already on 'master'
>> | Your branch is behind 'origin/master' by 12742 commits, and can be
>> fast-forwarded.
>> | ERROR. input file "meta/cfg/scratch/obj/qemuarm-standard.scc" does not
>> exist
>> | ERROR. A meta series could not be created for
>> meta/cfg/scratch/obj/qemuarm-standard.scc
>> | ERROR. Could not locate meta series for qemuarm
>> | ERROR. Could not apply patches for qemuarm.
>> |        Patch failures can be resolved in the devshell (bitbake -c
>> devshell linux-yocto-custom)
>> | ERROR: Function failed: do_patch (see
>> /home/anders/poky/build/tmp/work/qemuarm-poky-linux-gnueabi/linux-yocto-custom/3.8+gitAUTOINC+19f949f52599ba7c3f67a5897ac6be14bfcb1200-r1/temp/log.do_patch.8972
>> for further information)
>> ERROR: Task 3
>> (/home/anders/poky/meta-skeleton/recipes-kernel/linux/linux-yocto-custom.bb,
>> do_patch) failed with exit code '1'
>>
>>
>> Using my own machine, I got a similar error, that
>> ${MACHINE}-standard.scc didn't exist.
>>
>> The plan is to use a defconfig as the main configuration, and possibly
>> later on add config fragments for certain featuers.
>>
>> However, I'm missing one step, as I'm not able to build without the
>> meta/cfg/scratch/obj/qemuarm-standard.scc file.
>>
>> Any hints on what step I've currently overlooked would be nice...
>
> Let me have a look at this, there were some changes to the tools for
> 1.4, so the
> examples may need some tweaking.
>
> We did run all the yocto-bsp tools against 1.4 and they worked, and they are
> users of the same interface.
>
> Anyway, if there's a bug, I'll follow up with a patch shortly.

Indeed, something managed to happen here. I'm investigating and will follow
up once I know what broke.

Bruce

>
> Cheers,
>
> Bruce
>
>>
>> Cheers,
>> Anders
>>
>> --
>> Anders Darander
>> ChargeStorm AB / eStorm AB
>>
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>
>
>
> --
> "Thou shalt not follow the NULL pointer, for chaos and madness await
> thee at its end"



--
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"


