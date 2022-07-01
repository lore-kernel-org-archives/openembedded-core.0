Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18F8BC43334
	for <webhook@archiver.kernel.org>; Fri,  1 Jul 2022 12:26:48 +0000 (UTC)
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com
 [209.85.167.42])
 by mx.groups.io with SMTP id smtpd.web08.37294.1656678399635185148
 for <openembedded-core@lists.openembedded.org>;
 Fri, 01 Jul 2022 05:26:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=arE8sVSl;
 spf=pass (domain: gmail.com, ip: 209.85.167.42,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f42.google.com with SMTP id e12so3594254lfr.6
        for <openembedded-core@lists.openembedded.org>;
 Fri, 01 Jul 2022 05:26:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=8PRx9sOlhqsSUJRVj3XTEuN6yXwCZjsR75RllluRks0=;
        b=arE8sVSlK0h6qlQm1CyFYmX57dWTu/9xokhe0NmjuZFJJg0gDNX6HgAcckz6jQYX9k
         fYE5+fKUkr72b2IzZ2Mdq2+A6v5vi3hgUf7le6g0V2VJNbBSHDEbqj6xO0CIgEcDrTDe
         b2vT7sMMQLTb6RtmNfhyAoYXq/K+8TMHQgzK7q4yYyuhOjJq6bc4D5MdhhS8ivSbLFV/
         VYXFDlAfMCHQ09qQcXjjXKgQvI5o3Q98zR7eyRSlmmPur7YckB0HLSbjTlwx90ak2erK
         qUtn8VBlAhZHEQFnCYMvShzzsk96IbEMe0DMSzz70ud4/HAqmK5gTyj6rKc2Cz7XuC7O
         i7dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=8PRx9sOlhqsSUJRVj3XTEuN6yXwCZjsR75RllluRks0=;
        b=azNWOPZv341FTzU7/BSAzvAUpL+je/axUyEeI9AOEl+AaY5bU7nqwzuysByW9uTHhc
         SsGpCe5HFNPHDDpo6bMOZcwLf+W1iQP1h1vZ3UDg4efynqHf1aHpMX4VJe2RtV5twDKk
         N862A+Ba61kZHIUEHWP3MgXLV3e4nXAO0r8DMQKj+liRwgr2G9Ed8to0hER6fDlayEpa
         Bj3nUho6A3vup+7LRAoI4SbZ12qQg6FIG4ZXIm0mYE38PpFDcqn6ecqzTRcR62/fnuzO
         TwmDiU6fUQ+j0f3Sfs+K1kNIC+AIfC/SaakfBFcsJb0uGNJbTwVkUCaJDJNfYggRL4GA
         P7PA==
X-Gm-Message-State: AJIora9WZrarbokBx7GpweCxxK+no9PVbPFcBeBDNZIBVzBwp2jVKZdm
	D1VjU5muCqyXDhZr5ddy+K8SP1vxXEuTVM+wZRk=
X-Google-Smtp-Source: 
 AGRyM1usp8fDGz800+72HWnznSY1cNPfaNorC4sFjzvWfbmEy22x4nHmgbHMILy59h/ITRWG0tuOgqCLnP7Awjpb0d0=
X-Received: by 2002:a05:6512:3403:b0:481:60ae:7ebc with SMTP id
 i3-20020a056512340300b0048160ae7ebcmr1657458lfr.358.1656678397792; Fri, 01
 Jul 2022 05:26:37 -0700 (PDT)
MIME-Version: 1.0
References: 
 <SN4PR04MB836516C391002BA878B9E828E4BA9@SN4PR04MB8365.namprd04.prod.outlook.com>
In-Reply-To: 
 <SN4PR04MB836516C391002BA878B9E828E4BA9@SN4PR04MB8365.namprd04.prod.outlook.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 1 Jul 2022 14:26:25 +0200
Message-ID: 
 <CANNYZj-+8qv4WWn0SufyzE4N5j5F_DYE_fR9+PHqDJ3oPZA6Pw@mail.gmail.com>
Subject: Re: [OE-core][PATCH] package_manager/ipk: do not pipe stderr to
 stdout
To: Shruthi Ravichandran <shruthi.ravichandran@ni.com>
Cc: "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 01 Jul 2022 12:26:48 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167466

Yes, certainly.

Alex

On Fri, 1 Jul 2022 at 00:30, Shruthi Ravichandran
<shruthi.ravichandran@ni.com> wrote:
>
> The change currently does discard everything in stderr. I can update
> it to capture stderr and push it to bb.note on command success and
> bb.fatal on command failure. In fact, I can make those changes to the
> several other instances in this file where stderr is piped to stdout
> too. Would that be acceptable?
>
> Shruthi
>
> > -----Original Message-----
> > From: Alexander Kanavin <alex.kanavin@gmail.com>
> > Sent: Thursday, June 30, 2022 1:47 AM
> > To: Shruthi Ravichandran <shruthi.ravichandran@ni.com>
> > Cc: openembedded-core@lists.openembedded.org
> > Subject: Re: [OE-core][PATCH] package_manager/ipk: do not pipe stderr to stdout
> >
> > Thanks for the information - perhaps this should be added to the commit message?
> >
> > Does this change discard things that appear on stderr completely, or
> > does it still go somewhere where it can be seen later?
> >
> > Alex
> >
> > On Wed, 29 Jun 2022 at 21:22, Shruthi Ravichandran
> > <shruthi.ravichandran@ni.com> wrote:
> > >
> > > Hi Alex,
> > >
> > > I've found that some OE commands print an error during cleanup when
> > > the tmp_dir does not exist and an attempt is made to delete it. I've
> > > submitted a patch to opkg to fix that.
> > > Link:
> > https://urldefense.com/v3/__https://git.yoctoproject.org/opkg/commit/?id=8dfdda86afd407a66e3dc00a077bdcc8b53d54ea__;!!FbZ0ZwI
> > 3Qg!omDrJfbrjlLbY2OMgsAgQrIcnap222jrjZJAhJX_BWhVJfMi09419QAHH1bVf1VafwMRcVuWBaQ5k8y6gk-W-iLjh48$ .
> > > That was the one instance that was causing an issue in our builds.
> > > There may be other instances that I don't know of. Given that, I think
> > > the package_manager code should be resilient against any such
> > > miscellaneous stderr messages, which do not result in the command
> > > itself failing.
> > >
> > > Hope that helps,
> > > Shruthi
> > >
> > > > -----Original Message-----
> > > > From: Alexander Kanavin <alex.kanavin@gmail.com>
> > > > Sent: Tuesday, June 28, 2022 1:33 PM
> > > > To: Shruthi Ravichandran <shruthi.ravichandran@ni.com>
> > > > Cc: openembedded-core@lists.openembedded.org
> > > > Subject: Re: [OE-core][PATCH] package_manager/ipk: do not pipe stderr to stdout
> > > >
> > > > This needs additional justification. What are the error messages, why are they harmless and why the solution is to suppress them instead
> > of
> > > > addressing the reasons they appear?
> > > >
> > > > Alex
> > > >
> > > > On Tue 28. Jun 2022 at 23.13, Shruthi Ravichandran <shruthi.ravichandran@ni.com <mailto:shruthi.ravichandran@ni.com> > wrote:
> > > >
> > > >
> > > >       When parsing the output of a command, do not pipe stderr to stdout.
> > > >       Opkg sometimes prints harmless error messages even when the opkg
> > > >       command succeeds. When stderr is piped to stdout, these error
> > > >       messages may clobber the stdout and cause unexpected results while
> > > >       parsing the output.
> > > >
> > > >       Signed-off-by: Shruthi Ravichandran <shruthi.ravichandran@ni.com <mailto:shruthi.ravichandran@ni.com> >
> > > >       ---
> > > >        meta/lib/oe/package_manager/ipk/__init__.py | 2 +-
> > > >        1 file changed, 1 insertion(+), 1 deletion(-)
> > > >
> > > >       diff --git a/meta/lib/oe/package_manager/ipk/__init__.py b/meta/lib/oe/package_manager/ipk/__init__.py
> > > >       index 4cd3963111..d7f3f31853 100644
> > > >       --- a/meta/lib/oe/package_manager/ipk/__init__.py
> > > >       +++ b/meta/lib/oe/package_manager/ipk/__init__.py
> > > >       @@ -103,7 +103,7 @@ class OpkgDpkgPM(PackageManager):
> > > >                """
> > > >
> > > >                try:
> > > >       -            output = subprocess.check_output(cmd, stderr=subprocess.STDOUT, shell=True).decode("utf-8")
> > > >       +            output = subprocess.check_output(cmd, shell=True).decode("utf-8")
> > > >                except subprocess.CalledProcessError as e:
> > > >                    bb.fatal("Unable to list available packages. Command '%s' "
> > > >                             "returned %d:\n%s" % (cmd, e.returncode, e.output.decode("utf-8")))
> > > >       --
> > > >       2.20.1
> > > >
> > > >
> > > >       -=-=-=-=-=-=-=-=-=-=-=-
> > > >       Links: You receive all messages sent to this group.
> > > >       View/Reply Online (#167354): https://urldefense.com/v3/__https://lists.openembedded.org/g/openembedded-
> > core/message/167354__;!!FbZ0ZwI3Qg!omDrJfbrjlLbY2OMgsAgQrIcnap222jrjZJAhJX_BWhVJfMi09419QAHH1bVf1VafwMRcVuWBaQ5k8y6
> > gk-W-P8eXeA$
> > > > <https://urldefense.com/v3/__https://lists.openembedded.org/g/openembedded-
> > > > core/message/167354__;!!FbZ0ZwI3Qg!qc0xbL3QBz_illnPIJoeHb6mGA1kBLndLjrGDjlfDwR7rkQcM8i7ZTte5y_GL4XNQru-
> > > > qSvIV3p_DxpS6tCIX3jHMdg$>
> > > >       Mute This Topic:
> > https://urldefense.com/v3/__https://lists.openembedded.org/mt/92051989/1686489__;!!FbZ0ZwI3Qg!omDrJfbrjlLbY2OMgsAgQrIcnap222
> > jrjZJAhJX_BWhVJfMi09419QAHH1bVf1VafwMRcVuWBaQ5k8y6gk-WvQyK1Es$
> > > >
> > <https://urldefense.com/v3/__https://lists.openembedded.org/mt/92051989/1686489__;!!FbZ0ZwI3Qg!qc0xbL3QBz_illnPIJoeHb6mGA1kB
> > > > LndLjrGDjlfDwR7rkQcM8i7ZTte5y_GL4XNQru-qSvIV3p_DxpS6tCIs81jASw$>
> > > >       Group Owner: openembedded-core+owner@lists.openembedded.org <mailto:openembedded-
> > > > core%2Bowner@lists.openembedded.org>
> > > >       Unsubscribe: https://urldefense.com/v3/__https://lists.openembedded.org/g/openembedded-
> > core/unsub__;!!FbZ0ZwI3Qg!omDrJfbrjlLbY2OMgsAgQrIcnap222jrjZJAhJX_BWhVJfMi09419QAHH1bVf1VafwMRcVuWBaQ5k8y6gk-
> > WWbrhU-c$
> > > > <https://urldefense.com/v3/__https://lists.openembedded.org/g/openembedded-
> > > > core/unsub__;!!FbZ0ZwI3Qg!qc0xbL3QBz_illnPIJoeHb6mGA1kBLndLjrGDjlfDwR7rkQcM8i7ZTte5y_GL4XNQru-
> > qSvIV3p_DxpS6tCIADJRjJc$>
> > > > [alex.kanavin@gmail.com <mailto:alex.kanavin@gmail.com> ]
> > > >       -=-=-=-=-=-=-=-=-=-=-=-
> > > >
> > > >
> > >
> > >
> > > INTERNAL - NI CONFIDENTIAL
>
> INTERNAL - NI CONFIDENTIAL

