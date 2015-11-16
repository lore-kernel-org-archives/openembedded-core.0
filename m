Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-yk0-f176.google.com (mail-yk0-f176.google.com
	[209.85.160.176])
	by mail.openembedded.org (Postfix) with ESMTP id 711E26E268;
	Mon, 16 Nov 2015 16:17:22 +0000 (UTC)
Received: by ykfs79 with SMTP id s79so247913465ykf.1;
	Mon, 16 Nov 2015 08:17:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=EiB19Ue6LZogHHcYt2E7d7hBbQDeW3tGe/ebnUcpxm4=;
	b=G2FkBttRF8Ppp9rLYdXm6VDDCXa2/kX8wYZLozWhbMWD6nV152ktH/HU8OOagsd7So
	poxNWGRTknwlUq7xom4eCrEi/4flqHimg5idDP4j69qj4SWHjIbUuglXwbauo73GC450
	KR1XIxcO4htDep5jUR2dM4duqCRLoJngcYh9NB0cDfQm+QFM4JO2/ZFJRVpcm2vXSk2a
	otOw5NvsAoS+sBkA4MQd5itaBNwD81JaFoeg9FVNdlhEAaL5hQVoKOL2wv6fRW9nqDjG
	H9AXJonzHqCkt+Ewe/cgaV/kOLTuUlcLePViTJkHuCfa8cvaBk2lQznLJRQaLH0YIsvK
	+3wg==
MIME-Version: 1.0
X-Received: by 10.129.130.132 with SMTP id s126mr35754927ywf.131.1447690642176;
	Mon, 16 Nov 2015 08:17:22 -0800 (PST)
Received: by 10.31.202.196 with HTTP; Mon, 16 Nov 2015 08:17:22 -0800 (PST)
In-Reply-To: <20151116151159.GA2240@jama>
References: <20151112114311.GD2574@jama> <20151114095739.GD2564@jama>
	<20151116151159.GA2240@jama>
Date: Mon, 16 Nov 2015 11:17:22 -0500
Message-ID: <CADkTA4OwVpyD_t6p+AO1=Ami3gMFU7QtfQd_0w-oNj+zSoL5qQ@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: State of bitbake world, test-dependencies 2015-11-12
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
X-List-Received-Date: Mon, 16 Nov 2015 16:17:22 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Nov 16, 2015 at 10:11 AM, Martin Jansa <martin.jansa@gmail.com> wrote:
> On Sat, Nov 14, 2015 at 10:57:39AM +0100, Martin Jansa wrote:
>> On Thu, Nov 12, 2015 at 12:43:11PM +0100, Martin Jansa wrote:
>> > Another incremental test, only 26 recipes were tested, but it found enough
>> > issues in just released Jethro.
>> >
>> > Complete log:
>> > http://logs.nslu2-linux.org/buildlogs/oe/world/log.dependencies.20151111_112937.log/
>> >
>> > ERROR: 42 issues were found in these recipes: cifs-utils clutter-gst-3.0 devicekit-power fbida gammu gst-plugins-good gstreamer1.0-plugins-bad gstreamer1.0-plugins-good imsettings libsdl2 pinpoint qt-mobility-embedded qt-mobility-x11 samba sox
>> >
>> > I'll send fix for pinpoint, gst* devicekit-power, fbida, gammu before re-triggering the testing for qemuarm.
>>
>> Complete log:
>> http://logs.nslu2-linux.org/buildlogs/oe/world/log.dependencies.20151113_162451.log/
>>
>> I've added few more recipes to this test run, so the results look worse
>> (because of many issues from efl-libunwind, I've already sent patch for
>> this), but they are actually better.
>>
>> ERROR: 86 issues were found in these recipes: cifs-utils efl enjoy
>> imsettings linux-yocto qt-mobility-embedded qt-mobility-x11 samba sox
>> vlc
>
> With the fixes I've sent in last few days we're almost clean again (at
> least for the recipes I was testing in this run).
>
> Only issue is samba->libpam and yocto-linux failing to build.
>
> Complete log qemuarm:
> http://logs.nslu2-linux.org/buildlogs/oe/world/log.dependencies.20151115_174203.log/
> Complete log qemux86:
> http://logs.nslu2-linux.org/buildlogs/oe/world/log.dependencies.20151116_034635.log/
>
> qemuarm:
> ERROR: 2 issues were found in these recipes: samba vlc
> WARN: vlc: vlc rdepends on libvorbis, but it isn't a build dependency?
> WARN: samba: samba rdepends on libpam, but it isn't a build dependency?
>
> I've fixes PATCHv2 for vlc, so qemux86 is even better:
> ERROR: 4 issues were found in these recipes: cifs-utils linux-yocto linux-yocto-tiny-kexecboot samba
> WARN: samba: samba rdepends on libpam, but it isn't a build dependency?
>
> cifs-utils is there only because of linux-yocto
>
> NOTE: Uploading the report /home/jenkins/oe/world/shr-core/tmp-glibc/log/error-report/error_report_20151116034725.txt to errors.yoctoproject.org:80
> NOTE: Your entry can be found here: http://errors.yoctoproject.org:80/Errors/Build/9880/
> NOTE: Build completion summary:
> NOTE:   do_populate_sysroot: 99% sstate reuse (2268 setscene, 19 scratch)
> NOTE:   do_package_qa: 99% sstate reuse (2066 setscene, 19 scratch)
> NOTE:   do_package: 95% sstate reuse (402 setscene, 18 scratch)
> NOTE:   do_packagedata: 99% sstate reuse (2066 setscene, 18 scratch)
> NOTE:   do_package_write_ipk: 99% sstate reuse (2061 setscene, 19 scratch)
> NOTE:   do_populate_lic: 99% sstate reuse (2327 setscene, 13 scratch)
>
> Summary: 1 task failed:
>   /home/jenkins/oe/world/shr-core/openembedded-core/meta/recipes-kernel/linux/linux-yocto_4.1.bb, do_compile

Wow. It looks like the shared directory went away underneath the build of
the kernel itself.

Great log on this one .. easy to see what was going on.

Has this particular error been seen before ? Or is this the first time it has
popped up ?

Bruce

> Summary: There were 7 WARNING messages shown.
> Summary: There were 2 ERROR messages shown, returning a non-zero exit code.
> ===== 2nd build to rebuild each recipe with every possible dep =====
> Logs will be stored in test-dependencies/1447645595/2_max directory
> Building recipe: cifs-utils (1/13)
> ERROR: Task 187 (/home/jenkins/oe/world/shr-core/openembedded-core/meta/recipes-kernel/linux/linux-yocto_4.1.bb, do_compile) failed with exit code '1'
> Building recipe: ctdb (2/13)
> Building recipe: imsettings (3/13)
> Building recipe: libldb (4/13)
> Building recipe: libtdb (5/13)
> Building recipe: libtevent (6/13)
> Building recipe: linux-yocto (7/13)
> Building recipe: qt-mobility-embedded (8/13)
> Building recipe: qt-mobility-x11 (9/13)
> Building recipe: samba (10/13)
> Building recipe: sox (11/13)
> Building recipe: talloc (12/13)
> Building recipe: vlc (13/13)
> Copying buildhistory/packages to test-dependencies/1447645595/2_max
> Copying do_package logs to test-dependencies/1447645595/2_max/do_package/
> ===== 3rd or 4th build to rebuild each recipe with minimal dependencies =====
> Logs will be stored in test-dependencies/1447645595/3_min directory
> !!!Removing tmpdir "/home/jenkins/oe/world/shr-core/tmp-glibc"!!!
> Building recipe: cifs-utils (1/14)
> Building recipe: ctdb (2/14)
> Building recipe: imsettings (3/14)
> Building recipe: libldb (4/14)
> Building recipe: libtdb (5/14)
> Building recipe: libtevent (6/14)
> Building recipe: linux-yocto (7/14)
> Building recipe: linux-yocto-tiny-kexecboot (8/14)
> ERROR: Task 221 (/home/jenkins/oe/world/shr-core/openembedded-core/meta/recipes-kernel/linux/linux-yocto_4.1.bb, do_kernel_metadata) failed with exit code '1'
> Building recipe: qt-mobility-embedded (9/14)
> Building recipe: qt-mobility-x11 (10/14)
> Building recipe: samba (11/14)
> Building recipe: sox (12/14)
> Building recipe: talloc (13/14)
> Building recipe: vlc (14/14)
>
> I'll merge pending meta-oe patches soon (tonight) into master as well as jethro branches.
> Lets hope that pending oe-core patches get merged before next (2.1) release!
>
> Regards,
>
> --
> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"

