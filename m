Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35C31C433F5
	for <webhook@archiver.kernel.org>; Wed,  4 May 2022 12:45:38 +0000 (UTC)
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com
 [209.85.128.172])
 by mx.groups.io with SMTP id smtpd.web10.5927.1651668329614595270
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 May 2022 05:45:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Ea/bjwr6;
 spf=pass (domain: gmail.com, ip: 209.85.128.172,
 mailfrom: bruce.ashfield@gmail.com)
Received: by mail-yw1-f172.google.com with SMTP id
 00721157ae682-2f83983782fso13852927b3.6
        for <openembedded-core@lists.openembedded.org>;
 Wed, 04 May 2022 05:45:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=vuLsPUP45wwgjkX/1ydy/SBLETw/ZEIqkG+AA7/lG0Y=;
        b=Ea/bjwr6XfERqXK0I2p+IhbKemAuOl6xrc6Khr+SnsVowlbo0pN48W8HlffiAkcazo
         PawZw56EK859YqV3PJWk/1a1ielMiaXdo950Qdli2JS45UjFtwfos9wqSE4y/2VZq7Et
         ig+me7hHHneYiOEbrt3SpwtTTRuMUi8TkYMGALt1q77+I73FhPSYRj4IhvN5cvxYVlZs
         uq1UH4Q0teseqec6+VO57/opvKtH6A/zp2N+bNj4VGjOgW53Id7bKg62Te4NOirBRg0H
         FPOEYSeAAh9qu+38YqfgumDykN1JL8T76OT8j2kbWp76xnVFLbLm752sOCHlemq7CJjh
         aKoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=vuLsPUP45wwgjkX/1ydy/SBLETw/ZEIqkG+AA7/lG0Y=;
        b=wy8q7qCcAin5v8wwzGu6HybE93T/jC88mvYYOT44V2VfPhw3Ptkh1ocieSbPZ4Qycg
         tS9qJ72IJHxXIQUGs9m/a1kGBHxfq94TPjNK9CBrXqrbkYWXmzqdc6P5F9IvNrtdAymG
         pJ0kUCEEPrVU17+gfpp68iCgFijpjv1bLSsrBqbTN8wBgP1cTMT3gPQb1Z7FHd7eUs52
         pydFLJtm59TJgBL2QjToHm7VTwvWaRG0XL5zUNOfGyf8jmA0CUfx4FGvkn+jl5BMmPYQ
         rGUCX7bdGWD3os5edoplo8tay2Jy4lEj5aMAcWk1HaxkQeRA3laJQ749lpT19Kxu02OZ
         2Q6A==
X-Gm-Message-State: AOAM531W0pYvLcY4Xt6CXztAmJdgXnMN4SD7jyhPdXxto9uEyDhl+rUQ
	wj2huvukPhdOTJMBHTCYuLIKwuXSBZx85msaBVA=
X-Google-Smtp-Source: 
 ABdhPJzzERtD1+6l/rnKiYkp1BDdeczrA0dFB9oSJhMaS9wxuGUD7at9IwF2tOqUA+V2qT/mW8zfFNT2pNmwZ8AcZDs=
X-Received: by 2002:a81:6cc1:0:b0:2f8:bb31:143b with SMTP id
 h184-20020a816cc1000000b002f8bb31143bmr18587961ywc.64.1651668328756; Wed, 04
 May 2022 05:45:28 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1651153370.git.bruce.ashfield@gmail.com>
 <821e6cab4677b71af00197cf2be80680d57aa4ea.camel@linuxfoundation.org>
 <16EA5E7263695663.11702@lists.openembedded.org>
 <16EA76835C38B7CA.4798@lists.openembedded.org>
 <16EA920E59E6B6F1.28542@lists.openembedded.org>
 <CADkTA4M6NzCMVtEhiu+Hyaqp4gMZViP1XRH1qP1t2Ds3S6TL1w@mail.gmail.com>
 <f52bff6a24a5c2a015ed595ab09da89b2e249e75.camel@linuxfoundation.org>
 <CAP71WjzwwV00BAeG6BtVD49fVrCe8rKvToEsKMi0hahxER4PVA@mail.gmail.com>
In-Reply-To: 
 <CAP71WjzwwV00BAeG6BtVD49fVrCe8rKvToEsKMi0hahxER4PVA@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Wed, 4 May 2022 08:45:17 -0400
Message-ID: 
 <CADkTA4MaYGsgaK-hY15yU2V+BTHL7mr=QRWM0z2v3qt-_FvCUQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 00/15] kernel-yocto: consolidated pull request
To: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>,
	Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>, Khem Raj <raj.khem@gmail.com>,
	Jon Mason <jdmason@kudzu.us>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 04 May 2022 12:45:38 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165218

On Wed, May 4, 2022 at 3:18 AM Nicolas Dechesne
<nicolas.dechesne@linaro.org> wrote:
>
> hey Bruce,
>
> On Sun, May 1, 2022 at 6:59 AM Richard Purdie <richard.purdie@linuxfounda=
tion.org> wrote:
>>
>> On Sat, 2022-04-30 at 17:35 -0400, Bruce Ashfield wrote:
>> > On Sat, Apr 30, 2022 at 12:26 AM Bruce Ashfield via
>> > lists.openembedded.org
>> > <bruce.ashfield=3Dgmail.com@lists.openembedded.org> wrote:
>> > >
>> > > On Fri, Apr 29, 2022 at 4:02 PM Bruce Ashfield via
>> > > lists.openembedded.org
>> > > <bruce.ashfield=3Dgmail.com@lists.openembedded.org> wrote:
>> > > >
>> > > > On Fri, Apr 29, 2022 at 8:41 AM Bruce Ashfield via
>> > > > lists.openembedded.org
>> > > > <bruce.ashfield=3Dgmail.com@lists.openembedded.org> wrote:
>> > > > >
>> > > > >
>> > > > > I'll see about running the strace locally today. Hopefully it po=
ps up
>> > > > > here so I can debug.
>> > > >
>> > > > FYI: I have the landlock test case passing here, there's just an
>> > > > output difference from the kernel. The test is passing.
>> > >
>> > > I have located the exact kernel commit that changed the output, henc=
e
>> > > why the test is failing.
>> > >
>> > > strace upstream hasn't adjusted yet, so I'll spin up a patch, and ge=
t
>> > > send patches to the list over the weekend.
>> >
>> > The two patches that fix the strace ptest fail, and qemuarm graphical
>> > boot are on the list.
>>
>> Thanks Bruce! I've queued it and started it running through testing.
>
>
> Since this patch, qemuarmv5 fails to build with:
>
> 00:01:47 NOTE: Running task 899 of 5734 (virtual:native:/home/tuxbake/oe/=
poky/meta/recipes-core/zlib/zlib_1.2.12.bb:do_deploy_source_date_epoch)
> 00:01:47 ERROR: linux-yocto-5.15.36+gitAUTOINC+fcf48627ea_ebfb1822e9-r0 d=
o_kernel_metadata: Could not locate BSP definition for qemuarm/standard and=
 no defconfig was provided
> 00:01:47 ERROR: linux-yocto-5.15.36+gitAUTOINC+fcf48627ea_ebfb1822e9-r0 d=
o_kernel_metadata: ExecutionError('/home/tuxbake/oe/build/tmp/work/qemuarmv=
5-poky-linux-gnueabi/linux-yocto/5.15.36+gitAUTOINC+fcf48627ea_ebfb1822e9-r=
0/temp/run.do_kernel_metadata.98856', 1, None, None)
> 00:01:47 ERROR: Logfile of failure stored in: /home/tuxbake/oe/build/tmp/=
work/qemuarmv5-poky-linux-gnueabi/linux-yocto/5.15.36+gitAUTOINC+fcf48627ea=
_ebfb1822e9-r0/temp/log.do_kernel_metadata.98856
> 00:01:47 Log data follows:
> 00:01:47 | DEBUG: Executing python function extend_recipe_sysroot
> 00:01:47 | NOTE: Direct dependencies are ['/home/tuxbake/oe/poky/meta/rec=
ipes-kernel/kern-tools/kern-tools-native_git.bb:do_populate_sysroot']
> 00:01:47 | NOTE: Installed into sysroot: []
> 00:01:47 | NOTE: Skipping as already exists in sysroot: ['kern-tools-nati=
ve']
> 00:01:47 | DEBUG: Python function extend_recipe_sysroot finished
> 00:01:47 | DEBUG: Executing shell function do_kernel_metadata
> 00:01:47 | NOTE: do_kernel_metadata: for summary/debug, set KCONF_AUDIT_L=
EVEL > 0
> 00:01:47 | ERROR: Could not locate BSP definition for qemuarm/standard an=
d no defconfig was provided
> 00:01:47 | WARNING: /home/tuxbake/oe/build/tmp/work/qemuarmv5-poky-linux-=
gnueabi/linux-yocto/5.15.36+gitAUTOINC+fcf48627ea_ebfb1822e9-r0/temp/run.do=
_kernel_metadata.98856:404 exit 1 from 'exit 1'
> 00:01:47 | WARNING: Backtrace (BB generated script):
> 00:01:47 | #1: bbfatal_log, /home/tuxbake/oe/build/tmp/work/qemuarmv5-pok=
y-linux-gnueabi/linux-yocto/5.15.36+gitAUTOINC+fcf48627ea_ebfb1822e9-r0/tem=
p/run.do_kernel_metadata.98856, line 404
> 00:01:47 | #2: do_kernel_metadata, /home/tuxbake/oe/build/tmp/work/qemuar=
mv5-poky-linux-gnueabi/linux-yocto/5.15.36+gitAUTOINC+fcf48627ea_ebfb1822e9=
-r0/temp/run.do_kernel_metadata.98856, line 272
> 00:01:47 | #3: main, /home/tuxbake/oe/build/tmp/work/qemuarmv5-poky-linux=
-gnueabi/linux-yocto/5.15.36+gitAUTOINC+fcf48627ea_ebfb1822e9-r0/temp/run.d=
o_kernel_metadata.98856, line 435
> 00:01:47 NOTE: recipe linux-yocto-5.15.36+gitAUTOINC+fcf48627ea_ebfb1822e=
9-r0: task do_kernel_metadata: Failed
> 00:01:47 ERROR: Task (/home/tuxbake/oe/poky/meta/recipes-kernel/linux/lin=
ux-yocto_5.15.bb:do_kernel_metadata) failed with exit code '1'
>

It's fallout from Jon's re-org. I'll have a look today and send
patches as appropriate.

Bruce

> see full build log
> https://oebuilds.tuxbuild.com/28f9WxOsIhBeAgIbQH3DsCwyQCc/build-debug.log
>
>
>
>>
>> Cheers,
>>
>> Richard
>>
>>
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#165076): https://lists.openembedded.org/g/openembedd=
ed-core/message/165076
>> Mute This Topic: https://lists.openembedded.org/mt/90753174/1279857
>> Group Owner: openembedded-core+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [n=
icolas.dechesne@linaro.org]
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>


--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

