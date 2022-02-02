Return-Path: <jatedev@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49295C433F5
	for <webhook@archiver.kernel.org>; Wed,  2 Feb 2022 15:59:19 +0000 (UTC)
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com
 [209.85.210.171])
 by mx.groups.io with SMTP id smtpd.web12.66117.1643817558379277736
 for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Feb 2022 07:59:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=NL2b9Mjf;
 spf=pass (domain: gmail.com, ip: 209.85.210.171, mailfrom: jatedev@gmail.com)
Received: by mail-pf1-f171.google.com with SMTP id a19so13194300pfx.4
        for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Feb 2022 07:59:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=eDDmNIQhN56CEMaEC+9R5SBJoQanDDolyMVF2N2P9mw=;
        b=NL2b9MjfCg05djfa+UQEWpKq6UtPIZCewH+gXnRPk3HEleWkEDixa4cJEy2TFpiOA4
         3XDUrOP6srqIgnA0FP73vNs5Q1yrymGFKqbVkgYGFCfDz8+imDGZWHwKV3AASoXH6mTK
         wkQo9m5ilHWghpSCu+d2nKVJR9LhHLxbTWbPMsHtM6z/FgWiba8g09/f27kpH6VctvMg
         fXaLVvF6wCSsV5vZbeqrzXxi/xYH9VoLwobVQWrRXS3mBX1HsTeAyiZbVDzc979zXZ/g
         zIgNth22RcDmW0dFZpKIAwKs/bwwO3VQbJhtknRiQhPwWmrnPLeRKKCrVNPgjntLdOZ3
         lU3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=eDDmNIQhN56CEMaEC+9R5SBJoQanDDolyMVF2N2P9mw=;
        b=liamgFdBSkJ9cRwex1RB1/F2bmmpUmSwXf7Nc167OLZXZqLOiPb6bmeiH8Pi7YF+d8
         5C1ba1joKQGtFaPs1GFfL59nINUHJ6To3Fd9JN7auhx24rP3vWmxXhRbnRi9CyMcc/cX
         YTJvW8jNsava9xfyw4oF/WGSwtIxy9Lpjptd5J7S+WxCFfkwUo1rwWtyludafYQchhYv
         bMjaAQIqetdle1dOoljnGQrXGFfEKfAPXjNFOTJEbZPZS4YQlR+9+rZp1JhddZl3b9G9
         g9+M8LZs3fzhWzm0YKpMY6oWDijCNNuo5kujh1cHpUOJTC05brAU20mzMKqcb5FtnkdF
         HC6Q==
X-Gm-Message-State: AOAM532Ckm7tM7KS3tUv+BeeaPsYPqN0ScXlgrbqDvStdPuPN/26hkIM
	OjoWVBcxmk+litIBmTO0oa2ndHs3m6fbV6qQrX0=
X-Google-Smtp-Source: 
 ABdhPJxjN4qeYYW265ZONZga19it/Zs7tMKaL5oVD/tMixzQ3uEVhxQhM3ALHpkrOfWLdnELy/V+2ro1WNML5XGl5eI=
X-Received: by 2002:a65:4d0d:: with SMTP id
 i13mr24651514pgt.483.1643817557567;
 Wed, 02 Feb 2022 07:59:17 -0800 (PST)
MIME-Version: 1.0
References: 
 <BN0PR20MB3941083EB28A3B5AB04EFAC5BB7E9@BN0PR20MB3941.namprd20.prod.outlook.com>
 <CH0PR20MB3948AC46EF12C3A3605BF32CBB5B9@CH0PR20MB3948.namprd20.prod.outlook.com>
 <bf6ee93c78eaee8e4bc821b63156be45f02e7508.camel@siemens.com>
 <CH0PR20MB3948156AE1B1E2D4FA68ABA1BB5B9@CH0PR20MB3948.namprd20.prod.outlook.com>
 <d89906854674100b2169c5b5d8621685571f947e.camel@siemens.com>
 <CH0PR20MB39485B3A3234B704218F36C9BB219@CH0PR20MB3948.namprd20.prod.outlook.com>
 <ed8186dabf6149d39095443930812df8f3a45f4f.camel@siemens.com>
 <CH0PR20MB3948A6946F96088FA2CF7A86BB229@CH0PR20MB3948.namprd20.prod.outlook.com>
In-Reply-To: 
 <CH0PR20MB3948A6946F96088FA2CF7A86BB229@CH0PR20MB3948.namprd20.prod.outlook.com>
From: Jate Sujjavanich <jatedev@gmail.com>
Date: Wed, 2 Feb 2022 10:59:06 -0500
Message-ID: 
 <CAPphmgaC7ZpV+eKMFvyo_C5QWnR1KAWFO_+8CPXpT_ZqOW77xw@mail.gmail.com>
Subject: Re: [OE-core] [dunfell][PATCH RFC] busybox.inc: Create temporary
 busybox links during install
To: Bryan Evenson <bevenson@melinkcorp.com>
Cc: "Valek, Andrej" <andrej.valek@siemens.com>,
	"openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000982c3705d70b190c"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Feb 2022 15:59:19 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161218

--000000000000982c3705d70b190c
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I have performed a major distribution upgrade in the past. This was with
rpm which requires bash. I did not have issues with utilities required by
the upgrade disappearing.

I believe rpm installs the new file, and then removes old files. Does opkg
remove the old binary before installing the new version?


-Jate

On Fri, Jan 28, 2022 at 8:12 AM Bryan Evenson <bevenson@melinkcorp.com>
wrote:

> Andrej,
>
> > -----Original Message-----
> > From: Valek, Andrej <andrej.valek@siemens.com>
> > Sent: Friday, January 28, 2022 6:39 AM
> > To: openembedded-core@lists.openembedded.org; Bryan Evenson
> > <bevenson@melinkcorp.com>
> > Subject: Re: [dunfell][PATCH RFC] busybox.inc: Create temporary busybox
> > links during install
> >
> > Hello Bryan,
> >
> > So looks like, there is some kind of problem.
> >
> > Was you able to run the busybox command after upgrade like, "busybox ls
> /"
> > ?
>
> In this particular case, after upgrade both "busybox ls" and "ls" worked.
> However, that was partly because for this particular case the packages we=
re
> identical but I just forced a version number change.  None of the files
> were actually different after the upgrade.  Failure to replace files didn=
't
> affect operation.  When I was upgrading my image from the morty release t=
o
> the dunfell release, there was a change in util-linux that conflicted wit=
h
> busybox if they both didn't upgrade cleanly and the update-alternatives
> installation step would fail for both.  In that case "busybox ls" would
> still work but "ls" would not.  Repeated upgrade attempts didn't fix it. =
 I
> had to manually delete certain files that were not deleted during the
> initial upgrade attempt and then upgrade packages manually in a particula=
r
> order to get the system fully operational again.
>
> >  - If yes, there is a problem, that update alternatives hasn't been
> processed
> > correctly. Try direct command after reboot, if possible
> >  - If no, lets continue with patch creation based on the master branch
>
> I will continue work on a patch based on master.  I'm going to try testin=
g
> a few other cases so I don't anticipate having a patch ready until early
> next week.
>
> Thanks,
> Bryan
>
> >
> > Cheers,
> > Andrej
> >
> > On Thu, 2022-01-27 at 14:39 +0000, Bryan Evenson wrote:
> > > Andrej,
> > >
> > > > -----Original Message-----
> > > > From: Valek, Andrej <andrej.valek@siemens.com>
> > > > Sent: Saturday, January 22, 2022 2:26 AM
> > > > To: openembedded-core@lists.openembedded.org; Bryan Evenson
> > > > <bevenson@melinkcorp.com>
> > > > Subject: Re: [dunfell][PATCH RFC] busybox.inc: Create temporary
> > > > busybox links during install
> > > >
> > > > Hello again,
> > > >
> > > > Maybe a general question. Is it working in current master? I do not
> > > > want to brake dunfell, just applying something, which will create a
> > > > lot of divergence.
> > > >
> > >
> > > I wasn't able to build an image based on the latest master as of
> > > Monday.  From the error messages I think it had something to do with
> > > the addition of setuptools3-base that wasn't complete yet.  I was abl=
e
> > > to build and run an image based on the latest honister branch.
> > > The master branch has four commits for busybox that honsiter does not
> > > have.  In those four commits, I see no changes to any of the
> > > installation steps.  Based on this information, I'd say its safe to
> > > say that testing on the latest honister branch should confirm whether
> > > the problem is still present or not.
> > >
> > > To test, I first built my image and directly programmed it on my
> > > hardware.  My image is based upon core-image-minimal, uses sysvinit
> > > for an init system and opkg for a package manager.  I have also added
> > > bash, cronie, dhcpcd and util-linux to my image; I've added others bu=
t
> > > these seem to produce the most obvious errors.
> > >
> > > After programming the image on my hardware, I added PR=3D"r1" to the =
gcc
> > > recipe.  This forced all the packages to get rebuilt and increment th=
e
> > > version number (if anyone knows a simpler way to accomplish this, let
> > > me know).  I then created a package feed with this update and
> > > attempted an upgrade.
> > >
> > > To upgrade, I did:
> > > opkg update
> > > opkg --download-only upgrade
> > > opkg upgrade > full_upgrade.txt 2>&1 &
> > >
> > > I download all the packages to be upgraded first.  I then sent the
> > > upgrade process to the background so I could check other things durin=
g
> > > the upgrade process.
> > >
> > > During the upgrade, I would occasionally execute "ls -l" to verify
> > > that the file full_upgrade.txt existed and was still growing.  About =
a
> > > minute into the upgrade process when I executed "ls -l" I got the
> > > error message:
> > >
> > > ls: not found
> > >
> > > From that point on until upgrade was complete I had to execute
> > > "busybox ls -l" to see the current directory file list.  After upgrad=
e
> > > was complete, I checked full_upgrade.txt for error messages.
> > > I saw the following:
> > >
> > > /usr/bin/update-alternatives: line 1: sed: not found  (occurred 102
> > > times)
> > > /usr/sbin/update-rc.d: line 54: rm: not found (occurred 36 times)
> > > Stopping crond: /etc/init.d/crond: line 37: start-stop-daemon: not
> > > found
> > > /tmp/opkg-yBH1Ta/cronie-zHpym4/preinst: line 1: tr: not found
> > > /etc/init.d/udev: line 74: start-stop-daemon: not found
> > > /tmp/opkg-yBH1Ta/dhcpcd-c86ca9/preinst: line 1: tr: not found
> > >
> > > In this case, a lot of alternatives and init scripts may not be setup
> > > correctly because either the old ones were not removed or the new one=
s
> > > were not installed.  Prior to my patch below, I saw similar errors
> > > when upgrading my image from a build based off the morty branch to on=
e
> > > based off dunfell (and my system was not operational after the
> > > upgrade).  After my patch, I performed the same upgrade with no error=
s
> > > and my system was fully operational.
> > >
> > > I'm up for any thoughts on a different approach that accomplishes the
> > > same goal.  Otherwise, I'm going to work with what I have and update
> > > my changes so they patch cleanly on master.
> > >
> > > Thanks,
> > > Bryan
> > >
> > > > Cheers,
> > > > Andrej
> > > >
> > > > On Fri, 2022-01-21 at 15:02 +0000, Bryan Evenson wrote:
> > > > > Andrej,
> > > > >
> > > > > Thanks for the response.  This is an attempt to fix a problem I a=
m
> > > > > having with automated firmware upgrades for my system.  I am usin=
g
> > > > > opkg for a package manager; not sure if the same problem exists
> > > > > with other package managers.  I run into problems whenever busybo=
x
> > > > > is one of the packages that needs to get updated.  I enact my
> > > > > distribution firmware upgrade by calling "opkg --download-only
> > > > > upgrade; opkg upgrade".  What I see happen is:
> > > > >
> > > > > 1. In the busybox pkg_prerm stage sets up some soft links for som=
e
> > > > > common applets in a temporary directory and exports a path to tha=
t
> > > > > directory.  It might also setup a temporary alternative to /bin/s=
h
> > > > > if it is the last shell.
> > > > > 2. After the remove stage, the busybox binary is gone.  The
> > > > > softlinks created in the prerm stage are useless since they point
> > > > > to binary that no longer exists.
> > > > > 3. opkg continues with upgrade on other packages which may depend
> > > > > on a command provided by busybox in a prerm, postrm, preinst or
> > > > > postinst script.  These upgrades then fail since the commands are
> > > > > no longer available.
> > > > > 4. The busybox upgrade completes, which may or may not complete
> > > > > successfully.  For what I am attempting, I am upgrading my system
> > > > > from the morty branch to dunfell.  I have util-linux on my system
> > > > > which shares some alternatives with busybox.  The util-linux
> > > > > upgrade fails because it needs some busybox applets during its
> > > > > upgrade process.
> > > > > Then the busybox upgrade fails because the final update-
> > > > > alternatives doesn=E2=80=99t work; some files still exist that ut=
il-linux
> > > > > couldn't remove during its upgrade that clash with busybox's
> > > > > alternatives.
> > > > >
> > > > > After trying several ways to get my upgrade to work, I landed on
> > > > > the approach below.  I'm creating a temporary directory and
> > > > > copying the busybox binary and the busybox.links files to that
> > > > > directory.  I then install an alternative for every applet for
> > > > > busybox listed in all of its busybox.links files that points to
> > > > > the temporary copy of the busybox binary.  This means that any
> > > > > package that uses a busybox applet during its install process
> > > > > should still work.  Then during the postinst step I am removing
> > > > > all the temporary alternative links.
> > > > > I
> > > > > use the temporary busybox.links files for removing the alternativ=
e
> > > > > links in case the upgraded busybox is now configured with a
> > > > > different set of applets.
> > > > >
> > > > > This is a heavy handed approach, and it does extend the upgrade
> > > > > process for me by a few minutes since it runs through update-
> > > > > alternatives for busybox two more times.  But, the approach works
> > > > > for me and I think would be more resilient than past approaches.
> > > > > I tried to mimic the existing code in my additions.  If a more
> > > > > widescale rewrite makes sense than that works for me also.
> > > > >
> > > > > Thanks,
> > > > > Bryan
> > > > >
> > > > >
> > > > > > -----Original Message-----
> > > > > > From: Valek, Andrej <andrej.valek@siemens.com>
> > > > > > Sent: Friday, January 21, 2022 9:01 AM
> > > > > > To: openembedded-core@lists.openembedded.org; Bryan Evenson
> > > > > > <bevenson@melinkcorp.com>
> > > > > > Subject: Re: [dunfell][PATCH RFC] busybox.inc: Create temporary
> > > > > > busybox links during install
> > > > > >
> > > > > > Hi Bryan,
> > > > > >
> > > > > > Sorry, maybe I didn't fully understand the use-case. Are you
> > > > > > trying to upgrade the busybox on demand? If yes, that is not a
> > > > > > good idea.
> > > > > >
> > > > > > I'm little bit scary about doing "export
> > > > > > PATH=3D$busybox_rmdir:$PATH"
> > > > > > and
> > > > > > creating a custom locks is not a good at all.
> > > > > >
> > > > > > Cheers,
> > > > > > Andrej
> > > > > >
> > > > > > On Fri, 2022-01-21 at 13:29 +0000, Bryan Evenson wrote:
> > > > > > > All,
> > > > > > >
> > > > > > > Ping on this RFC.  It works for me, but I have a feeling ther=
e
> > > > > > > is a better way to do this.  It still seems a little messy an=
d
> > > > > > > could probably be simplified for the same effect.
> > > > > > >
> > > > > > > Thanks,
> > > > > > > Bryan
> > > > > > >
> > > > > > > > -----Original Message-----
> > > > > > > > From: Bryan Evenson
> > > > > > > > Sent: Thursday, December 23, 2021 9:50 AM
> > > > > > > > To: openembedded-core@lists.openembedded.org
> > > > > > > > Subject: [dunfell][PATCH RFC] busybox.inc: Create temporary
> > > > > > > > busybox links during install
> > > > > > > >
> > > > > > > > Busybox upgrades sometimes fail, especially if there is a
> > > > > > > > major
> > > > > > > > distribution upgrade and all packages need to be updated.
> > > > > > > > Success
> > > > > > > > is highly dependent on the package upgrade order.
> > > > > > > >
> > > > > > > > Commit [1] attempts to ensure a shell is still present by
> > > > > > > > adding
> > > > > > > > an alternative to /bin/sh if busybox is the only shell.
> > > > > > > > However, if busybox is not the only shell present and the
> > > > > > > > other
> > > > > > > > shells are upgrading, it may then be possible that all
> > > > > > > > shells
> > > > > > > > will be removed during the upgrade process.
> > > > > > > >
> > > > > > > > Commit [2] creates temporary symbolic links for all the
> > > > > > > > busybox
> > > > > > > > links during busybox's postinst step.  However, this is too
> > > > > > > > late
> > > > > > > > in the process as some packages attempt to use 'rm' and
> > > > > > > > 'sed'
> > > > > > > > after
> > > > > > > > update-alternatives removes the old links and prior to when
> > > > > > > > busybox's postinst step runs.
> > > > > > > >
> > > > > > > > This fix is similar to [2] but runs during the preinst
> > > > > > > > step. For
> > > > > > > > opkg, this is the first step that is guaranteed to run from
> > > > > > > > the
> > > > > > > > new package (prerm is run from the old package) and will
> > > > > > > > therefore be a backwards-compatible fix for upgrading older
> > > > > > > > systems.
> > > > > > > >
> > > > > > > > Copies the existing busybox binary and the busybox.links
> > > > > > > > files
> > > > > > > > to a temporary directory and then creates alternative links
> > > > > > > > for
> > > > > > > > all installed busybox commands.  The temporary links and
> > > > > > > > directory are cleaned up during the postinst step.
> > > > > > > >
> > > > > > > > RFC: This works for me, but there may be room for
> > > > > > > > improvement. I
> > > > > > > > don't know if the current pkg_prerm steps are necessary
> > > > > > > > anymore.
> > > > > > > > However, in
> > > > > > > > my testing I did need the links for update-alternatives to
> > > > > > > > work
> > > > > > > > in the preinst step. I am also not certain if the
> > > > > > > > populate_packages_updatealternatives_append
> > > > > > > > step is necessary anymore.  I have also only tested this
> > > > > > > > fix on
> > > > > > > > dunfell, as I don't have a working image based on master
> > > > > > > > yet.
> > > > > > > > It
> > > > > > > > may be more appropriate for this to go to master and then
> > > > > > > > be
> > > > > > > > backported to dunfell, but I would need assistance in
> > > > > > > > testing.
> > > > > > > >
> > > > > > > > [1] https://git.openembedded.org/openembedded-
> > > > > > > > core/commit/meta/recipes-
> > > > > > > >
> > > > > >
> > > >
> > core/busybox/busybox.inc?id=3Da9d2af8f5b3da8239cf00a52883ca596a19ea23
> > > > > > > > a
> > > > > > > > [2] https://git.openembedded.org/openembedded-
> > > > > > > > core/commit/meta/recipes-
> > > > > > > >
> > > > > >
> > > >
> > core/busybox/busybox.inc?id=3D3a035bd0a06a6ded4d0ce7e35a3bce42245727
> > > > > > > > d2
> > > > > > > >
> > > > > > > > Signed-off-by: Bryan Evenson <bevenson@melinkcorp.com>
> > > > > > > > ---
> > > > > > > >  meta/recipes-core/busybox/busybox.inc | 57
> > > > > > > > ++++++++++++++++++++++++++-
> > > > > > > >  1 file changed, 55 insertions(+), 2 deletions(-)
> > > > > > > >
> > > > > > > > diff --git a/meta/recipes-core/busybox/busybox.inc
> > > > > > > > b/meta/recipes-
> > > > > > > > core/busybox/busybox.inc index e0522be729..c85402411b
> > > > > > > > 100644
> > > > > > > > --- a/meta/recipes-core/busybox/busybox.inc
> > > > > > > > +++ b/meta/recipes-core/busybox/busybox.inc
> > > > > > > > @@ -441,12 +441,28 @@ pkg_postinst_${PN}_prepend () {  }
> > > > > > > >
> > > > > > > >  pkg_postinst_${PN}_append () {
> > > > > > > > -        # If busybox exists in the remove directory it is
> > > > > > > > because it was the only shell left.
> > > > > > > >          if [ "x$D" =3D "x" ] ; then
> > > > > > > > +           # If busybox exists in the remove directory it
> > > > > > > > is
> > > > > > > > because it was the only
> > > > > > > > shell left.
> > > > > > > >             if [ "x$BUSYBOX" !=3D "x" ] ; then
> > > > > > > >                update-alternatives --remove sh $BUSYBOX
> > > > > > > > -              rm -f $BUSYBOX
> > > > > > > >             fi
> > > > > > > > +           # Remove the temporary alternatives
> > > > > > > > +           for busybox_preinstdir in /tmp/busyboxpreinst-
> > > > > > > > *; do
> > > > > > > > +               if [ "$busybox_preinstdir" !=3D
> > > > > > > > '/tmp/busyboxpreinst-
> > > > > > > > *' ] ; then
> > > > > > > > +
> > > > > > > > BUSYBOX_PREINST_DIR=3D"$busybox_preinstdir"
> > > > > > > > +                  BUSYBOX=3D"$BUSYBOX_PREINST_DIR/busybox"
> > > > > > > > +                  if [ -e $BUSYBOX ] ; then
> > > > > > > > +                      for suffix in "" ".nosuid" ".suid";
> > > > > > > > do
> > > > > > > > +                          if [ -e
> > > > > > > > $BUSYBOX_PREINST_DIR/busybox.links$suffix ] ; then
> > > > > > > > +                              while read link; do
> > > > > > > > +                                  update-alternatives --
> > > > > > > > remove
> > > > > > > > $($BUSYBOX basename
> > > > > > > > $link) $BUSYBOX
> > > > > > > > +                              done <
> > > > > > > > $BUSYBOX_PREINST_DIR/busybox.links$suffix
> > > > > > > > +                          fi
> > > > > > > > +                      done
> > > > > > > > +                  fi
> > > > > > > > +                  rm -rf $BUSYBOX_PREINST_DIR
> > > > > > > > +               fi
> > > > > > > > +           done
> > > > > > > >          fi
> > > > > > > >  }
> > > > > > > >
> > > > > > > > @@ -480,6 +496,43 @@ pkg_prerm_${PN} () {
> > > > > > > >          fi
> > > > > > > >  }
> > > > > > > >
> > > > > > > > +pkg_preinst_${PN} () {
> > > > > > > > +        # Create a temporary copy the busybox binary and
> > > > > > > > the
> > > > > > > > links
> > > > > > > > files.  Then,
> > > > > > > > +        # install an alternative link for all the links.
> > > > > > > > Other
> > > > > > > > packages use these
> > > > > > > > +        # commands during their upgrade process.  This
> > > > > > > > ensures
> > > > > > > > the
> > > > > > > > links are
> > > > > > > > available
> > > > > > > > +        # to all the other packages.  We do this in the
> > > > > > > > preinst
> > > > > > > > step because it is
> > > > > > > > +        # the first step guaranteed to be used from the
> > > > > > > > new
> > > > > > > > package.  The
> > > > > > > > prerm is
> > > > > > > > +        # used from the old package.  Placing this here
> > > > > > > > ensures it
> > > > > > > > runs on
> > > > > > > > upgrade even
> > > > > > > > +        # on older systems.
> > > > > > > > +
> > > > > > > > +        if [ "x$D" =3D "x" ] ; then
> > > > > > > > +           # update-alternatives may need the links from
> > > > > > > > commands
> > > > > > > > added in
> > > > > > > > the prerm step
> > > > > > > > +           # to operate.  Make sure we can get to that
> > > > > > > > path.
> > > > > > > > +           for busybox_rmdir in /tmp/busyboxrm-*; do
> > > > > > > > +               if [ "$busybox_rmdir" !=3D '/tmp/busyboxrm-=
*'
> > > > > > > > ] ;
> > > > > > > > then
> > > > > > > > +                  export PATH=3D$busybox_rmdir:$PATH
> > > > > > > > +               fi
> > > > > > > > +           done
> > > > > > > > +
> > > > > > > > +           # Create a temporary directory for the busybox
> > > > > > > > binary
> > > > > > > > and the link lists
> > > > > > > > +           BUSYBOX=3D${base_bindir}/busybox
> > > > > > > > +           BUSYBOX_TMP_DIR=3D`$BUSYBOX mktemp -d
> > > > > > > > /tmp/busyboxpreinst-
> > > > > > > > XXXXXX`
> > > > > > > > +           BUSYBOX_TMP_LOC=3D"$BUSYBOX_TMP_DIR/busybox"
> > > > > > > > +           $BUSYBOX cp $BUSYBOX $BUSYBOX_TMP_LOC
> > > > > > > > +
> > > > > > > > +           # Go through all the links and install an
> > > > > > > > alternative
> > > > > > > > that points to the
> > > > > > > > temporary
> > > > > > > > +           # busybox binary.
> > > > > > > > +           for suffix in "" ".nosuid" ".suid"; do
> > > > > > > > +               if [ -e ${sysconfdir}/busybox.links$suffix
> > > > > > > > ] ;
> > > > > > > > then
> > > > > > > > +                   $BUSYBOX cp
> > > > > > > > ${sysconfdir}/busybox.links$suffix
> > > > > > > > $BUSYBOX_TMP_DIR
> > > > > > > > +                   while read link; do
> > > > > > > > +                       update-alternatives --install $link
> > > > > > > > $($BUSYBOX basename $link)
> > > > > > > > $BUSYBOX_TMP_LOC 1
> > > > > > > > +                   done <
> > > > > > > > $BUSYBOX_TMP_DIR/busybox.links$suffix
> > > > > > > > +               fi
> > > > > > > > +           done
> > > > > > > > +        fi
> > > > > > > > +}
> > > > > > > > +
> > > > > > > >  pkg_postrm_${PN} () {
> > > > > > > >          # Add path to remove dir in case we removed our
> > > > > > > > only
> > > > > > > > grep
> > > > > > > >          if [ "x$D" =3D "x" ] ; then
> > > > > > > > --
> > > > > > > > 2.17.1
> > > > >
> > >
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#161078):
> https://lists.openembedded.org/g/openembedded-core/message/161078
> Mute This Topic: https://lists.openembedded.org/mt/87919018/3616919
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> jatedev@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--000000000000982c3705d70b190c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">I have performed a major distribution upg=
rade in the past. This was with rpm which requires bash. I did not have iss=
ues with utilities required by the upgrade disappearing.</div><div dir=3D"l=
tr"><br></div><div>I believe rpm installs the new file, and then removes ol=
d files. Does opkg remove the old binary before installing the new version?=
</div><div><br></div><div><br></div><div>-Jate<br></div><br><div class=3D"g=
mail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Fri, Jan 28, 2022 at 8=
:12 AM Bryan Evenson &lt;<a href=3D"mailto:bevenson@melinkcorp.com" target=
=3D"_blank">bevenson@melinkcorp.com</a>&gt; wrote:<br></div><blockquote cla=
ss=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid =
rgb(204,204,204);padding-left:1ex">Andrej,<br>
<br>
&gt; -----Original Message-----<br>
&gt; From: Valek, Andrej &lt;<a href=3D"mailto:andrej.valek@siemens.com" ta=
rget=3D"_blank">andrej.valek@siemens.com</a>&gt;<br>
&gt; Sent: Friday, January 28, 2022 6:39 AM<br>
&gt; To: <a href=3D"mailto:openembedded-core@lists.openembedded.org" target=
=3D"_blank">openembedded-core@lists.openembedded.org</a>; Bryan Evenson<br>
&gt; &lt;<a href=3D"mailto:bevenson@melinkcorp.com" target=3D"_blank">beven=
son@melinkcorp.com</a>&gt;<br>
&gt; Subject: Re: [dunfell][PATCH RFC] busybox.inc: Create temporary busybo=
x<br>
&gt; links during install<br>
&gt; <br>
&gt; Hello Bryan,<br>
&gt; <br>
&gt; So looks like, there is some kind of problem.<br>
&gt; <br>
&gt; Was you able to run the busybox command after upgrade like, &quot;busy=
box ls /&quot;<br>
&gt; ?<br>
<br>
In this particular case, after upgrade both &quot;busybox ls&quot; and &quo=
t;ls&quot; worked.=C2=A0 However, that was partly because for this particul=
ar case the packages were identical but I just forced a version number chan=
ge.=C2=A0 None of the files were actually different after the upgrade.=C2=
=A0 Failure to replace files didn&#39;t affect operation.=C2=A0 When I was =
upgrading my image from the morty release to the dunfell release, there was=
 a change in util-linux that conflicted with busybox if they both didn&#39;=
t upgrade cleanly and the update-alternatives installation step would fail =
for both.=C2=A0 In that case &quot;busybox ls&quot; would still work but &q=
uot;ls&quot; would not.=C2=A0 Repeated upgrade attempts didn&#39;t fix it.=
=C2=A0 I had to manually delete certain files that were not deleted during =
the initial upgrade attempt and then upgrade packages manually in a particu=
lar order to get the system fully operational again.<br>
<br>
&gt;=C2=A0 - If yes, there is a problem, that update alternatives hasn&#39;=
t been processed<br>
&gt; correctly. Try direct command after reboot, if possible<br>
&gt;=C2=A0 - If no, lets continue with patch creation based on the master b=
ranch<br>
<br>
I will continue work on a patch based on master.=C2=A0 I&#39;m going to try=
 testing a few other cases so I don&#39;t anticipate having a patch ready u=
ntil early next week.<br>
<br>
Thanks,<br>
Bryan<br>
<br>
&gt; <br>
&gt; Cheers,<br>
&gt; Andrej<br>
&gt; <br>
&gt; On Thu, 2022-01-27 at 14:39 +0000, Bryan Evenson wrote:<br>
&gt; &gt; Andrej,<br>
&gt; &gt;<br>
&gt; &gt; &gt; -----Original Message-----<br>
&gt; &gt; &gt; From: Valek, Andrej &lt;<a href=3D"mailto:andrej.valek@sieme=
ns.com" target=3D"_blank">andrej.valek@siemens.com</a>&gt;<br>
&gt; &gt; &gt; Sent: Saturday, January 22, 2022 2:26 AM<br>
&gt; &gt; &gt; To: <a href=3D"mailto:openembedded-core@lists.openembedded.o=
rg" target=3D"_blank">openembedded-core@lists.openembedded.org</a>; Bryan E=
venson<br>
&gt; &gt; &gt; &lt;<a href=3D"mailto:bevenson@melinkcorp.com" target=3D"_bl=
ank">bevenson@melinkcorp.com</a>&gt;<br>
&gt; &gt; &gt; Subject: Re: [dunfell][PATCH RFC] busybox.inc: Create tempor=
ary<br>
&gt; &gt; &gt; busybox links during install<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; Hello again,<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; Maybe a general question. Is it working in current master? I=
 do not<br>
&gt; &gt; &gt; want to brake dunfell, just applying something, which will c=
reate a<br>
&gt; &gt; &gt; lot of divergence.<br>
&gt; &gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt; I wasn&#39;t able to build an image based on the latest master as=
 of<br>
&gt; &gt; Monday.=C2=A0 From the error messages I think it had something to=
 do with<br>
&gt; &gt; the addition of setuptools3-base that wasn&#39;t complete yet.=C2=
=A0 I was able<br>
&gt; &gt; to build and run an image based on the latest honister branch.<br=
>
&gt; &gt; The master branch has four commits for busybox that honsiter does=
 not<br>
&gt; &gt; have.=C2=A0 In those four commits, I see no changes to any of the=
<br>
&gt; &gt; installation steps.=C2=A0 Based on this information, I&#39;d say =
its safe to<br>
&gt; &gt; say that testing on the latest honister branch should confirm whe=
ther<br>
&gt; &gt; the problem is still present or not.<br>
&gt; &gt;<br>
&gt; &gt; To test, I first built my image and directly programmed it on my<=
br>
&gt; &gt; hardware.=C2=A0 My image is based upon core-image-minimal, uses s=
ysvinit<br>
&gt; &gt; for an init system and opkg for a package manager.=C2=A0 I have a=
lso added<br>
&gt; &gt; bash, cronie, dhcpcd and util-linux to my image; I&#39;ve added o=
thers but<br>
&gt; &gt; these seem to produce the most obvious errors.<br>
&gt; &gt;<br>
&gt; &gt; After programming the image on my hardware, I added PR=3D&quot;r1=
&quot; to the gcc<br>
&gt; &gt; recipe.=C2=A0 This forced all the packages to get rebuilt and inc=
rement the<br>
&gt; &gt; version number (if anyone knows a simpler way to accomplish this,=
 let<br>
&gt; &gt; me know).=C2=A0 I then created a package feed with this update an=
d<br>
&gt; &gt; attempted an upgrade.<br>
&gt; &gt;<br>
&gt; &gt; To upgrade, I did:<br>
&gt; &gt; opkg update<br>
&gt; &gt; opkg --download-only upgrade<br>
&gt; &gt; opkg upgrade &gt; full_upgrade.txt 2&gt;&amp;1 &amp;<br>
&gt; &gt;<br>
&gt; &gt; I download all the packages to be upgraded first.=C2=A0 I then se=
nt the<br>
&gt; &gt; upgrade process to the background so I could check other things d=
uring<br>
&gt; &gt; the upgrade process.<br>
&gt; &gt;<br>
&gt; &gt; During the upgrade, I would occasionally execute &quot;ls -l&quot=
; to verify<br>
&gt; &gt; that the file full_upgrade.txt existed and was still growing.=C2=
=A0 About a<br>
&gt; &gt; minute into the upgrade process when I executed &quot;ls -l&quot;=
 I got the<br>
&gt; &gt; error message:<br>
&gt; &gt;<br>
&gt; &gt; ls: not found<br>
&gt; &gt;<br>
&gt; &gt; From that point on until upgrade was complete I had to execute<br=
>
&gt; &gt; &quot;busybox ls -l&quot; to see the current directory file list.=
=C2=A0 After upgrade<br>
&gt; &gt; was complete, I checked full_upgrade.txt for error messages.<br>
&gt; &gt; I saw the following:<br>
&gt; &gt;<br>
&gt; &gt; /usr/bin/update-alternatives: line 1: sed: not found=C2=A0 (occur=
red 102<br>
&gt; &gt; times)<br>
&gt; &gt; /usr/sbin/update-rc.d: line 54: rm: not found (occurred 36 times)=
<br>
&gt; &gt; Stopping crond: /etc/init.d/crond: line 37: start-stop-daemon: no=
t<br>
&gt; &gt; found<br>
&gt; &gt; /tmp/opkg-yBH1Ta/cronie-zHpym4/preinst: line 1: tr: not found<br>
&gt; &gt; /etc/init.d/udev: line 74: start-stop-daemon: not found<br>
&gt; &gt; /tmp/opkg-yBH1Ta/dhcpcd-c86ca9/preinst: line 1: tr: not found<br>
&gt; &gt;<br>
&gt; &gt; In this case, a lot of alternatives and init scripts may not be s=
etup<br>
&gt; &gt; correctly because either the old ones were not removed or the new=
 ones<br>
&gt; &gt; were not installed.=C2=A0 Prior to my patch below, I saw similar =
errors<br>
&gt; &gt; when upgrading my image from a build based off the morty branch t=
o one<br>
&gt; &gt; based off dunfell (and my system was not operational after the<br=
>
&gt; &gt; upgrade).=C2=A0 After my patch, I performed the same upgrade with=
 no errors<br>
&gt; &gt; and my system was fully operational.<br>
&gt; &gt;<br>
&gt; &gt; I&#39;m up for any thoughts on a different approach that accompli=
shes the<br>
&gt; &gt; same goal.=C2=A0 Otherwise, I&#39;m going to work with what I hav=
e and update<br>
&gt; &gt; my changes so they patch cleanly on master.<br>
&gt; &gt;<br>
&gt; &gt; Thanks,<br>
&gt; &gt; Bryan<br>
&gt; &gt;<br>
&gt; &gt; &gt; Cheers,<br>
&gt; &gt; &gt; Andrej<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; On Fri, 2022-01-21 at 15:02 +0000, Bryan Evenson wrote:<br>
&gt; &gt; &gt; &gt; Andrej,<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; Thanks for the response.=C2=A0 This is an attempt to fi=
x a problem I am<br>
&gt; &gt; &gt; &gt; having with automated firmware upgrades for my system.=
=C2=A0 I am using<br>
&gt; &gt; &gt; &gt; opkg for a package manager; not sure if the same proble=
m exists<br>
&gt; &gt; &gt; &gt; with other package managers.=C2=A0 I run into problems =
whenever busybox<br>
&gt; &gt; &gt; &gt; is one of the packages that needs to get updated.=C2=A0=
 I enact my<br>
&gt; &gt; &gt; &gt; distribution firmware upgrade by calling &quot;opkg --d=
ownload-only<br>
&gt; &gt; &gt; &gt; upgrade; opkg upgrade&quot;.=C2=A0 What I see happen is=
:<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; 1. In the busybox pkg_prerm stage sets up some soft lin=
ks for some<br>
&gt; &gt; &gt; &gt; common applets in a temporary directory and exports a p=
ath to that<br>
&gt; &gt; &gt; &gt; directory.=C2=A0 It might also setup a temporary altern=
ative to /bin/sh<br>
&gt; &gt; &gt; &gt; if it is the last shell.<br>
&gt; &gt; &gt; &gt; 2. After the remove stage, the busybox binary is gone.=
=C2=A0 The<br>
&gt; &gt; &gt; &gt; softlinks created in the prerm stage are useless since =
they point<br>
&gt; &gt; &gt; &gt; to binary that no longer exists.<br>
&gt; &gt; &gt; &gt; 3. opkg continues with upgrade on other packages which =
may depend<br>
&gt; &gt; &gt; &gt; on a command provided by busybox in a prerm, postrm, pr=
einst or<br>
&gt; &gt; &gt; &gt; postinst script.=C2=A0 These upgrades then fail since t=
he commands are<br>
&gt; &gt; &gt; &gt; no longer available.<br>
&gt; &gt; &gt; &gt; 4. The busybox upgrade completes, which may or may not =
complete<br>
&gt; &gt; &gt; &gt; successfully.=C2=A0 For what I am attempting, I am upgr=
ading my system<br>
&gt; &gt; &gt; &gt; from the morty branch to dunfell.=C2=A0 I have util-lin=
ux on my system<br>
&gt; &gt; &gt; &gt; which shares some alternatives with busybox.=C2=A0 The =
util-linux<br>
&gt; &gt; &gt; &gt; upgrade fails because it needs some busybox applets dur=
ing its<br>
&gt; &gt; &gt; &gt; upgrade process.<br>
&gt; &gt; &gt; &gt; Then the busybox upgrade fails because the final update=
-<br>
&gt; &gt; &gt; &gt; alternatives doesn=E2=80=99t work; some files still exi=
st that util-linux<br>
&gt; &gt; &gt; &gt; couldn&#39;t remove during its upgrade that clash with =
busybox&#39;s<br>
&gt; &gt; &gt; &gt; alternatives.<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; After trying several ways to get my upgrade to work, I =
landed on<br>
&gt; &gt; &gt; &gt; the approach below.=C2=A0 I&#39;m creating a temporary =
directory and<br>
&gt; &gt; &gt; &gt; copying the busybox binary and the busybox.links files =
to that<br>
&gt; &gt; &gt; &gt; directory.=C2=A0 I then install an alternative for ever=
y applet for<br>
&gt; &gt; &gt; &gt; busybox listed in all of its busybox.links files that p=
oints to<br>
&gt; &gt; &gt; &gt; the temporary copy of the busybox binary.=C2=A0 This me=
ans that any<br>
&gt; &gt; &gt; &gt; package that uses a busybox applet during its install p=
rocess<br>
&gt; &gt; &gt; &gt; should still work.=C2=A0 Then during the postinst step =
I am removing<br>
&gt; &gt; &gt; &gt; all the temporary alternative links.<br>
&gt; &gt; &gt; &gt; I<br>
&gt; &gt; &gt; &gt; use the temporary busybox.links files for removing the =
alternative<br>
&gt; &gt; &gt; &gt; links in case the upgraded busybox is now configured wi=
th a<br>
&gt; &gt; &gt; &gt; different set of applets.<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; This is a heavy handed approach, and it does extend the=
 upgrade<br>
&gt; &gt; &gt; &gt; process for me by a few minutes since it runs through u=
pdate-<br>
&gt; &gt; &gt; &gt; alternatives for busybox two more times.=C2=A0 But, the=
 approach works<br>
&gt; &gt; &gt; &gt; for me and I think would be more resilient than past ap=
proaches.<br>
&gt; &gt; &gt; &gt; I tried to mimic the existing code in my additions.=C2=
=A0 If a more<br>
&gt; &gt; &gt; &gt; widescale rewrite makes sense than that works for me al=
so.<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; Thanks,<br>
&gt; &gt; &gt; &gt; Bryan<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; -----Original Message-----<br>
&gt; &gt; &gt; &gt; &gt; From: Valek, Andrej &lt;<a href=3D"mailto:andrej.v=
alek@siemens.com" target=3D"_blank">andrej.valek@siemens.com</a>&gt;<br>
&gt; &gt; &gt; &gt; &gt; Sent: Friday, January 21, 2022 9:01 AM<br>
&gt; &gt; &gt; &gt; &gt; To: <a href=3D"mailto:openembedded-core@lists.open=
embedded.org" target=3D"_blank">openembedded-core@lists.openembedded.org</a=
>; Bryan Evenson<br>
&gt; &gt; &gt; &gt; &gt; &lt;<a href=3D"mailto:bevenson@melinkcorp.com" tar=
get=3D"_blank">bevenson@melinkcorp.com</a>&gt;<br>
&gt; &gt; &gt; &gt; &gt; Subject: Re: [dunfell][PATCH RFC] busybox.inc: Cre=
ate temporary<br>
&gt; &gt; &gt; &gt; &gt; busybox links during install<br>
&gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; Hi Bryan,<br>
&gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; Sorry, maybe I didn&#39;t fully understand the use=
-case. Are you<br>
&gt; &gt; &gt; &gt; &gt; trying to upgrade the busybox on demand? If yes, t=
hat is not a<br>
&gt; &gt; &gt; &gt; &gt; good idea.<br>
&gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; I&#39;m little bit scary about doing &quot;export<=
br>
&gt; &gt; &gt; &gt; &gt; PATH=3D$busybox_rmdir:$PATH&quot;<br>
&gt; &gt; &gt; &gt; &gt; and<br>
&gt; &gt; &gt; &gt; &gt; creating a custom locks is not a good at all.<br>
&gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; Cheers,<br>
&gt; &gt; &gt; &gt; &gt; Andrej<br>
&gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; On Fri, 2022-01-21 at 13:29 +0000, Bryan Evenson w=
rote:<br>
&gt; &gt; &gt; &gt; &gt; &gt; All,<br>
&gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; Ping on this RFC.=C2=A0 It works for me, but =
I have a feeling there<br>
&gt; &gt; &gt; &gt; &gt; &gt; is a better way to do this.=C2=A0 It still se=
ems a little messy and<br>
&gt; &gt; &gt; &gt; &gt; &gt; could probably be simplified for the same eff=
ect.<br>
&gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; Thanks,<br>
&gt; &gt; &gt; &gt; &gt; &gt; Bryan<br>
&gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; -----Original Message-----<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; From: Bryan Evenson<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; Sent: Thursday, December 23, 2021 9:50 A=
M<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; To: <a href=3D"mailto:openembedded-core@=
lists.openembedded.org" target=3D"_blank">openembedded-core@lists.openembed=
ded.org</a><br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; Subject: [dunfell][PATCH RFC] busybox.in=
c: Create temporary<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; busybox links during install<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; Busybox upgrades sometimes fail, especia=
lly if there is a<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; major<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; distribution upgrade and all packages ne=
ed to be updated.<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; Success<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; is highly dependent on the package upgra=
de order.<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; Commit [1] attempts to ensure a shell is=
 still present by<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; adding<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; an alternative to /bin/sh if busybox is =
the only shell.<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; However, if busybox is not the only shel=
l present and the<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; other<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; shells are upgrading, it may then be pos=
sible that all<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; shells<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; will be removed during the upgrade proce=
ss.<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; Commit [2] creates temporary symbolic li=
nks for all the<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; busybox<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; links during busybox&#39;s postinst step=
.=C2=A0 However, this is too<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; late<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; in the process as some packages attempt =
to use &#39;rm&#39; and<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &#39;sed&#39;<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; after<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; update-alternatives removes the old link=
s and prior to when<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; busybox&#39;s postinst step runs.<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; This fix is similar to [2] but runs duri=
ng the preinst<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; step. For<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; opkg, this is the first step that is gua=
ranteed to run from<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; the<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; new package (prerm is run from the old p=
ackage) and will<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; therefore be a backwards-compatible fix =
for upgrading older<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; systems.<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; Copies the existing busybox binary and t=
he busybox.links<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; files<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; to a temporary directory and then create=
s alternative links<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; for<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; all installed busybox commands.=C2=A0 Th=
e temporary links and<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; directory are cleaned up during the post=
inst step.<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; RFC: This works for me, but there may be=
 room for<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; improvement. I<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; don&#39;t know if the current pkg_prerm =
steps are necessary<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; anymore.<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; However, in<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; my testing I did need the links for upda=
te-alternatives to<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; work<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; in the preinst step. I am also not certa=
in if the<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; populate_packages_updatealternatives_app=
end<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; step is necessary anymore.=C2=A0 I have =
also only tested this<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; fix on<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; dunfell, as I don&#39;t have a working i=
mage based on master<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; yet.<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; It<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; may be more appropriate for this to go t=
o master and then<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; be<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; backported to dunfell, but I would need =
assistance in<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; testing.<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; [1] <a href=3D"https://git.openembedded.=
org/openembedded-" rel=3D"noreferrer" target=3D"_blank">https://git.openemb=
edded.org/openembedded-</a><br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; core/commit/meta/recipes-<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt;<br>
&gt; core/busybox/busybox.inc?id=3Da9d2af8f5b3da8239cf00a52883ca596a19ea23<=
br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; a<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; [2] <a href=3D"https://git.openembedded.=
org/openembedded-" rel=3D"noreferrer" target=3D"_blank">https://git.openemb=
edded.org/openembedded-</a><br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; core/commit/meta/recipes-<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt;<br>
&gt; core/busybox/busybox.inc?id=3D3a035bd0a06a6ded4d0ce7e35a3bce42245727<b=
r>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; d2<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; Signed-off-by: Bryan Evenson &lt;<a href=
=3D"mailto:bevenson@melinkcorp.com" target=3D"_blank">bevenson@melinkcorp.c=
om</a>&gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; ---<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; =C2=A0meta/recipes-core/busybox/busybox.=
inc | 57<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; ++++++++++++++++++++++++++-<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; =C2=A01 file changed, 55 insertions(+), =
2 deletions(-)<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; diff --git a/meta/recipes-core/busybox/b=
usybox.inc<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; b/meta/recipes-<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; core/busybox/busybox.inc index e0522be72=
9..c85402411b<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; 100644<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; --- a/meta/recipes-core/busybox/busybox.=
inc<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; +++ b/meta/recipes-core/busybox/busybox.=
inc<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; @@ -441,12 +441,28 @@ pkg_postinst_${PN}=
_prepend () {=C2=A0 }<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; =C2=A0pkg_postinst_${PN}_append () {<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 # If busybox exists in the remove directory it is<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; because it was the only shell left.<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 if [ &quot;x$D&quot; =3D &quot;x&quot; ] ; then<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 # If busybox exists in the remove directory it<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; is<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; because it was the only<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; shell left.<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 if [ &quot;x$BUSYBOX&quot; !=3D &quot;x&quot; ]=
 ; then<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 update-alternatives --remove =
sh $BUSYBOX<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 rm -f $BUSYBOX<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 fi<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 # Remove the temporary alternatives<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 for busybox_preinstdir in /tmp/busyboxpreinst-<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; *; do<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if [ &quot;$busybox_preinstdi=
r&quot; !=3D<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &#39;/tmp/busyboxpreinst-<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; *&#39; ] ; then<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; +<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; BUSYBOX_PREINST_DIR=3D&quot;$busybox_pre=
instdir&quot;<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 BUSYBOX=3D&=
quot;$BUSYBOX_PREINST_DIR/busybox&quot;<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if [ -e $BU=
SYBOX ] ; then<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 for suffix in &quot;&quot; &quot;.nosuid&quot; &quot;.suid&quo=
t;;<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; do<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if [ -e<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; $BUSYBOX_PREINST_DIR/busybox.links$suffi=
x ] ; then<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 while read lin=
k; do<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 update-alternatives --<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; remove<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; $($BUSYBOX basename<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; $link) $BUSYBOX<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 done &lt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; $BUSYBOX_PREINST_DIR/busybox.links$suffi=
x<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 fi<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 done<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 fi<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 rm -rf $BUS=
YBOX_PREINST_DIR<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 fi<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 done<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 fi<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; =C2=A0}<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; @@ -480,6 +496,43 @@ pkg_prerm_${PN} () =
{<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 fi<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; =C2=A0}<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; +pkg_preinst_${PN} () {<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 # Create a temporary copy the busybox binary and<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; the<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; links<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; files.=C2=A0 Then,<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 # install an alternative link for all the links.<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; Other<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; packages use these<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 # commands during their upgrade process.=C2=A0 This<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; ensures<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; the<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; links are<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; available<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 # to all the other packages.=C2=A0 We do this in the<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; preinst<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; step because it is<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 # the first step guaranteed to be used from the<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; new<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; package.=C2=A0 The<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; prerm is<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 # used from the old package.=C2=A0 Placing this here<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; ensures it<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; runs on<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; upgrade even<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 # on older systems.<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; +<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 if [ &quot;x$D&quot; =3D &quot;x&quot; ] ; then<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 # update-alternatives may need the links from<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; commands<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; added in<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; the prerm step<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 # to operate.=C2=A0 Make sure we can get to that<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; path.<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 for busybox_rmdir in /tmp/busyboxrm-*; do<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if [ &quot;$busybox_rmdir&quo=
t; !=3D &#39;/tmp/busyboxrm-*&#39;<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; ] ;<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; then<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 export PATH=
=3D$busybox_rmdir:$PATH<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 fi<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 done<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; +<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 # Create a temporary directory for the busybox<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; binary<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; and the link lists<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 BUSYBOX=3D${base_bindir}/busybox<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 BUSYBOX_TMP_DIR=3D`$BUSYBOX mktemp -d<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; /tmp/busyboxpreinst-<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; XXXXXX`<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 BUSYBOX_TMP_LOC=3D&quot;$BUSYBOX_TMP_DIR/busybox&quot=
;<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 $BUSYBOX cp $BUSYBOX $BUSYBOX_TMP_LOC<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; +<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 # Go through all the links and install an<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; alternative<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; that points to the<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; temporary<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 # busybox binary.<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 for suffix in &quot;&quot; &quot;.nosuid&quot; &quot;=
.suid&quot;; do<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if [ -e ${sysconfdir}/busybox=
.links$suffix<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; ] ;<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; then<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 $BUSY=
BOX cp<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; ${sysconfdir}/busybox.links$suffix<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; $BUSYBOX_TMP_DIR<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 while=
 read link; do<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 update-alternatives --install $link<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; $($BUSYBOX basename $link)<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; $BUSYBOX_TMP_LOC 1<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 done =
&lt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; $BUSYBOX_TMP_DIR/busybox.links$suffix<br=
>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 fi<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 done<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 fi<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; +}<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; +<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; =C2=A0pkg_postrm_${PN} () {<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 # Add path to remove dir in case we removed our<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; only<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; grep<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 if [ &quot;x$D&quot; =3D &quot;x&quot; ] ; then<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; --<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; 2.17.1<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt;<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#161078): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/161078" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/161078</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/87919018/3616=
919" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/87919018/3616919</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:jatedev@gmail.com" target=
=3D"_blank">jatedev@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div>
</div>

--000000000000982c3705d70b190c--

