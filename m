Return-Path: <matt@madison.systems>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4678CC433EF
	for <webhook@archiver.kernel.org>; Sun,  9 Jan 2022 12:04:22 +0000 (UTC)
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com
 [209.85.167.48])
 by mx.groups.io with SMTP id smtpd.web08.16954.1641729860902281158
 for <openembedded-core@lists.openembedded.org>;
 Sun, 09 Jan 2022 04:04:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@madison.systems header.s=google header.b=Y0WRPWGC;
 spf=pass (domain: madison.systems, ip: 209.85.167.48,
 mailfrom: matt@madison.systems)
Received: by mail-lf1-f48.google.com with SMTP id o12so34323270lfk.1
        for <openembedded-core@lists.openembedded.org>;
 Sun, 09 Jan 2022 04:04:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=madison.systems; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Yu5p7vaf+iZwpn+kHkRlqVVGTJbZvv8Kf1AvxjMphyY=;
        b=Y0WRPWGCyidWBIo9Y2GlTKOKgRzIUwyyucTaN0NOMab3v5fnIB+jMyQ7++GGQXRlPy
         1fTQfNpiq2ZhOZ8fiElPLzvF6ka+Ee9y+SrgVemkfY9e6hK4XMG5pV+U+5QTZVh0+/6X
         iVLzCSzCnVI93Nh9bKluvVyvwsMybZu4ASzOhn3mPzivv7h81jPnQu8SOK8IaHHWEnVI
         F2Rt6IiS8pSvABVPbJVVVbUHM2KrsfK9y0yIJGVxaLu135qOnVM1Z/RGxWHSTItx+cRJ
         lrRPPFpDkXr+7q3k3B/na4zUi9qNXJ7BSFjF4zkernjS+mz+3vfMZXId9U+TO8VL24Sk
         USBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Yu5p7vaf+iZwpn+kHkRlqVVGTJbZvv8Kf1AvxjMphyY=;
        b=48omM330uqROjfc9ZmasRrRCrd99S2lZbWMWhSeLJX00lhoZXYiK7kTCHo6HOoI0Qk
         II2DMh5IaWcJxUm4lJuG5rz559UQRjaS0Mzo+6NiFOj6i6uazveNiUuMEJzsltIJWSH6
         jFOD0tjabLmmD6bIgcf/DI68E3YqE9eoTW2zPvv51vVJLTwUn4E5bnDuMqpj0vwLQ8hE
         zc8gXBXIzDG/DiT+OH/2nG5HVgIbwZRQXevRETZhajOyShc5WODSzehuA7x/KtALvbrI
         oBqxQCNvE6dyktkVgbc78hgSXSpEiy3VVfZbheWx/XlbJnRTCJoTxdP6w/nR5xiJJFvB
         DAUA==
X-Gm-Message-State: AOAM533EeesUvY4B+tD8kuvWpd+ZK2uE+dvmPRMG2EDbPXyBKSIeTQd6
	RJah0zXupDIxVWvKvl5+6ZHU3MIgn6F9FyYY/Owcwg==
X-Google-Smtp-Source: 
 ABdhPJynU/FW0T3CGGDG7QJ5AWDQ9HL9LqUiIdqPV2R+MWuDl9Kz2MPTgnFNa/IIFNSbaP4fAfkcC93zrBP8Kgv3WWE=
X-Received: by 2002:a05:6512:10d0:: with SMTP id
 k16mr56165339lfg.43.1641729858711;
 Sun, 09 Jan 2022 04:04:18 -0800 (PST)
MIME-Version: 1.0
References: <20211215201615.536707-1-matt@madison.systems>
 <8d74dd73e03223215a4799df4f7a17bc4b9706eb.camel@linuxfoundation.org>
 <CAGgRHJoyzifLStq3KQfPcHR9HYcQPR+vP=754K5K=3zrBaseqA@mail.gmail.com>
 <16C7FE06BC92B547.9201@lists.openembedded.org>
 <b6e67f9d1c5bff66c5c4ebb792ddf70f6ab3d12a.camel@linuxfoundation.org>
 <CAGgRHJr1UGOL1-p+242MvitOLaCBZKok2S+xDrCL74vndnZUag@mail.gmail.com>
 <93794e98cf7d13b438a1c51e0bd810df130e89e4.camel@linuxfoundation.org>
 <CAGgRHJpHEyuwCs1Hbu7QpZWvN6qrDXebL0iFJ8iryWpiYhNFMw@mail.gmail.com>
 <325a814a0aa94ddd4d0ef0d44a62a8e2b62e8e3e.camel@linuxfoundation.org>
 <AM9PR09MB4642D4D6332DB31362B0B538A84F9@AM9PR09MB4642.eurprd09.prod.outlook.com>
 <bd85fb3c472a46758baaab3d5bc27298@axis.com>
In-Reply-To: <bd85fb3c472a46758baaab3d5bc27298@axis.com>
From: Matt Madison <matt@madison.systems>
Date: Sun, 9 Jan 2022 04:04:07 -0800
Message-ID: 
 <CAGgRHJo4xf9sdz2bivRfVCe=BADTWisiQk-==iV-GV-nLmh4tw@mail.gmail.com>
Subject: Re: [OE-core][PATCH] qemu.bbclass: drop OLDEST_KERNEL reference
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Cc: Konrad Weihmann <kweihmann@outlook.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 09 Jan 2022 12:04:22 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160281

On Sun, Jan 9, 2022 at 3:32 AM Peter Kjellerstedt
<peter.kjellerstedt@axis.com> wrote:
>
> > -----Original Message-----
> > From: openembedded-core@lists.openembedded.org <openembedded-
> > core@lists.openembedded.org> On Behalf Of Konrad Weihmann
> > Sent: den 9 januari 2022 10:24
> > To: Richard Purdie <richard.purdie@linuxfoundation.org>
> > Cc: Patches and discussions about the oe-core layer <openembedded-
> > core@lists.openembedded.org>
> > Subject: Re: [OE-core][PATCH] qemu.bbclass: drop OLDEST_KERNEL reference
> >
> > On 08.01.22 16:13, Richard Purdie wrote:
> > > On Sat, 2022-01-08 at 07:10 -0800, Matt Madison wrote:
> > >> On Sat, Jan 8, 2022 at 6:34 AM Richard Purdie
> > >> <richard.purdie@linuxfoundation.org> wrote:
> > >>>
> > >>> On Fri, 2022-01-07 at 06:44 -0800, Matt Madison wrote:
> > >>>> On Fri, Jan 7, 2022 at 4:56 AM Richard Purdie
> > >>>> <richard.purdie@linuxfoundation.org> wrote:
> > >>>>>
> > >>>>> On Fri, 2022-01-07 at 12:51 +0000, Richard Purdie via
> > lists.openembedded.org
> > >>>>> wrote:
> > >>>>>> On Fri, 2022-01-07 at 04:36 -0800, Matt Madison wrote:
> > >>>>>>> On Fri, Jan 7, 2022 at 3:19 AM Richard Purdie
> > >>>>>>> <richard.purdie@linuxfoundation.org> wrote:
> > >>>>>>>>
> > >>>>>>>> On Wed, 2021-12-15 at 12:16 -0800, Matt Madison wrote:
> > >>>>>>>>> which is introducing task hash changes for some
> > >>>>>>>>> allarch package builds, and should no longer
> > >>>>>>>>> be needed with recent versions of qemu.
> > >>>>>>>>>
> > >>>>>>>>> Signed-off-by: Matt Madison <matt@madison.systems>
> > >>>>>>>>> ---
> > >>>>>>>>>   meta/classes/qemu.bbclass | 2 +-
> > >>>>>>>>>   1 file changed, 1 insertion(+), 1 deletion(-)
> > >>>>>>>>>
> > >>>>>>>>> diff --git a/meta/classes/qemu.bbclass
> > b/meta/classes/qemu.bbclass
> > >>>>>>>>> index 01a7b86ae1..333202b7c4 100644
> > >>>>>>>>> --- a/meta/classes/qemu.bbclass
> > >>>>>>>>> +++ b/meta/classes/qemu.bbclass
> > >>>>>>>>> @@ -54,7 +54,7 @@ def qemu_run_binary(data, rootfs_path,
> > binary):
> > >>>>>>>>>   # this dance). For others (e.g. arm) a -cpu option is not
> > necessary, since the
> > >>>>>>>>>   # qemu-arm default CPU supports all required architecture
> > levels.
> > >>>>>>>>>
> > >>>>>>>>> -QEMU_OPTIONS = "-r ${OLDEST_KERNEL}
> > ${@d.getVar("QEMU_EXTRAOPTIONS_%s" % d.getVar('PACKAGE_ARCH')) or ""}"
> > >>>>>>>>> +QEMU_OPTIONS = "${@d.getVar("QEMU_EXTRAOPTIONS_%s" %
> > d.getVar('PACKAGE_ARCH')) or ""}"
> > >>>>>>>>>   QEMU_OPTIONS[vardeps] += "QEMU_EXTRAOPTIONS_${PACKAGE_ARCH}"
> > >>>>>>>>>
> > >>>>>>>>>   QEMU_EXTRAOPTIONS_ppce500v2 = " -cpu e500v2"
> > >>>>>>>>
> > >>>>>>>> I've sent a revert for this since the commit message isn't true,
> > this is causing
> > >>>>>>>> autobuilder failures and there was also a user report of issues
> > with it.
> > >>>>>>>
> > >>>>>>> Bummer.  I think this is because our OLDEST_KERNEL setting for
> > aarch64
> > >>>>>>> (3.14.0) is
> > >>>>>>> higher than the UNAME_MINIMUM_RELEASE definition in QEMU (3.8.0).
> > >>>>>>>
> > >>>>>>>>
> > https://autobuilder.yoctoproject.org/typhoon/#/builders/42/builds/4559/ste
> > ps/13/logs/stdio
> > >>>>>>>> (centos7 aarch64 build)
> > >>>>>>>>
> > >>>>>>>> We'll have to find a different way to fix the allarch issue (more
> > details
> > >>>>>>>> welcome on which package shows the issue).
> > >>>>>>>
> > >>>>>>> I ran into the issue with cantarell-fonts and wayland-protocols,
> > but
> > >>>>>>> any recipe that inherits both allarch and meson should trigger it.
> > >>>>>>>
> > >>>>>>> In my case, I have a layer check job for meta-tegra that runs
> > >>>>>>> yocto-check-layer with the --machines option specifying qemux86
> > and
> > >>>>>>> one of the (aarch64) machines in my layer, and that was reporting
> > the
> > >>>>>>> signature changes between the two architectures.
> > >>>>>>
> > >>>>>> I wonder why we don't detect that with our standard tests? :/
> > >>>>>>
> > >>>>>> There may be another fix:
> > >>>>>>
> > >>>>>> diff --git a/meta/classes/allarch.bbclass
> > b/meta/classes/allarch.bbclass
> > >>>>>> index 5bd5c44a276..0aadf7bfba6 100644
> > >>>>>> --- a/meta/classes/allarch.bbclass
> > >>>>>> +++ b/meta/classes/allarch.bbclass
> > >>>>>> @@ -43,6 +43,9 @@ python () {
> > >>>>>>           d.setVar("TARGET_LDFLAGS", "none")
> > >>>>>>           d.setVar("POPULATESYSROOTDEPS", "")
> > >>>>>>
> > >>>>>> +        if bb.data.inherits_class("meson", d):
> > >>>>>> +            d.setVar("do_write_config", ":")
> > >>>>>> +
> > >>>>>>           # Avoid this being unnecessarily different due to nuances
> > of
> > >>>>>>           # the target machine that aren't important for "all" arch
> > >>>>>>           # packages.
> > >>>>>>
> > >>>>>>
> > >>>>>
> > >>>>> Sorry, that isn't quite right. We want to just remove the append to
> > write_config
> > >>>>> which generates the qemu wrapper which will probably need a little
> > more invasive
> > >>>>> juggling of the code to make it easier...
> > >>>>
> > >>>> Your patch to disable the qemu wrapper for allarch looks like a good
> > solution.
> > >>>> Hopefully, that will work OK across the board.
> > >>>
> > >>> It seemed to be so I've merged it. Am hoping this resolves things!
> > >>
> > >> Drat. Unfortunately, it only works if allarch is inherited after meson
> > >> (which inherits qemu).  So cantarell-fonts checks out OK,
> > >> but wayland-protocols doesn't, since it inherits allarch first.
> > >
> > > Probably easy to fix but hard to spot new problems :/
> >
> > would an insane check similar to native-last be of help here?
>
> That seems like the wrong solution. As far as possible, bbclasses should
> be designed to be able to inherit them in any order, and it should be possible
> to rewrite this change so that is still possible to do.

Doing so would be a bit ugly, since it's a Python function. Something like

    if bb.data.inherits_class('qemu', d):
        d.setVar("qemu_wrapper_cmdline", "def
qemu_wrapper_cmdline(data, rootfs_path, library_paths):\n    return
'false'\n")

in the anonymous python function in allarch.bbclass would do that.

-Matt

>
> > >
> > > Cheers,
> > >
> > > Richard
>
> //Peter
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#160280): https://lists.openembedded.org/g/openembedded-core/message/160280
> Mute This Topic: https://lists.openembedded.org/mt/87752526/3618418
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [matt@madison.systems]
> -=-=-=-=-=-=-=-=-=-=-=-
>

