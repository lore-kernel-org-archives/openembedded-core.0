Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA1A2C25B74
	for <webhook@archiver.kernel.org>; Mon, 27 May 2024 18:35:06 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
 by mx.groups.io with SMTP id smtpd.web10.4112.1716834896650293013
 for <openembedded-core@lists.openembedded.org>;
 Mon, 27 May 2024 11:34:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=dZPKz4vZ;
 spf=pass (domain: bootlin.com, ip: 217.70.183.194, mailfrom: alexandre.belloni@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id DA0F240002;
	Mon, 27 May 2024 18:34:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1716834894;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lnlQV2y2MJ5jdfndVx4iAM9dy+HTejtJ0FiFoYs7Fac=;
	b=dZPKz4vZ03moBx+7mLrPFHb9sYpiMAatU7DkMGhOs8CR4lN1MKRJb8HG6oddIWC/Np2uP6
	d+av6GaHTn/aoKGmw7ldiq63nrze6DTuYqjxi10gkaVx2Is6zPl0eBf87A/KdH5osiH2gR
	KhKHhXSBNHHzZEzUsD8lNwshFoty1zCoaRein/89MWBXgzgtaJpK1FHVB4obgvZV3ccyVQ
	ms85R28eVcKjTsjGvNVS3wPLM5GV9nZlX+oNx4jiir9/r15Z2sTg5oCxeMW3+2f9iC1/eB
	zSD5pKtMBdktaWDaINV6BXgKY9E64YWgKr7tlInQ2KDKKcKfWcy0I5nt1KAa5Q==
Date: Mon, 27 May 2024 20:34:53 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: ecordonnier@snap.com
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>,
	openembedded-core@lists.openembedded.org,
	Bruce Ashfield <bruce.ashfield@gmail.com>
Subject: Re: [OE-core][PATCH v5] kernel.bbclass: make do_symlink_kernelsrc
 reentrant
Message-ID: <202405271834539197f0ef@mail.local>
References: <CAHUKmYaFA8_eHrSCqknXqDfPfkwySdjqxWKvo6thuAAmD4guNw@mail.gmail.com>
 <73130ae89b57e6af9749dbead7dc3f42894e04e7.camel@linuxfoundation.org>
 <CAHUKmYYiOTTz=PLdb8d3Q5X8muZH754Kqz2kBmkfr=Kqp5CTQg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAHUKmYYiOTTz=PLdb8d3Q5X8muZH754Kqz2kBmkfr=Kqp5CTQg@mail.gmail.com>
X-GND-Sasl: alexandre.belloni@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 27 May 2024 18:35:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199931

On 27/05/2024 11:45:58+0200, Etienne Cordonnier via lists.openembedded.org wrote:
> Hi Richard,
> 
> I also apologize for replying late. I was busy with other things and
> haven't found time to rework this patch.
> 
> > Firstly, can I ask why you're using a non-default directory for ${S}?
> > Is this as a way of doing a kind of external source usage?
> 
> My use-case is that the BSP I am using includes the source of the kernel as
> source alongside the BSP yocto layer (not in an extra git repository), and
> then points S to the directory containing the sources of the kernel without
> using the externalsrc class (as far as I know the externalsrc class isn't
> meant for this use-case, since there are several recipes provided as source
> in this way, and externalsrc only has one path pointing to the external
> source).
> 

You should rather educate your vendor to provide a proper git repository
for the kernel.

> I agree with you that the complexity of this function is very high, so not
> supporting a non-default S would be a better solution in this case. I'll
> try to rework the patch and test it with externalsrc as well.
> 
> Étienne
> 
> On Fri, Feb 9, 2024 at 6:36 PM Richard Purdie <
> richard.purdie@linuxfoundation.org> wrote:
> 
> > On Thu, 2023-12-21 at 22:49 +0100, Etienne Cordonnier via
> > lists.openembedded.org wrote:
> > > From: Etienne Cordonnier <ecordonnier@snap.com>
> > >
> > > The function do_symlink_kernsrc is not reentrant in the case where S is
> > defined
> > > to a non-default value. This causes build-failures e.g. when building
> > linux-yocto, then updating
> > > poky to a commit which modifies kernel.bbclass, and then building
> > linux-yocto again.
> > >
> > > Bugzilla:
> > https://urldefense.proofpoint.com/v2/url?u=https-3A__bugzilla.yoctoproject.org_show-5Fbug.cgi-3Fid-3D15325&d=DwIFaQ&c=ncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&r=AhkbNonVuMIGRfPx_Qj9TsRih1DULJTKUkSGa66m67E&m=e0iYk69Iih3UnIjABITtc6yS38bhv_6P4NMuSpVmmoSHk1-sSuvH3y702O0nTeZj&s=OtiPnSuoZjUXFgz9pxbGOOyjQmKPEq-OhEbhtsAmvZE&e=
> > >
> > > Tested with a recipe "my-custom-linux" which unpacks sources to a custom
> > ${S} directory
> > > and ran symlink_kernsrc several times:
> > > $ bitbake -f -c symlink_kernsrc my-custom-linux
> >
> > Sorry for the delay in getting back to review this patch. I'm extremely
> > worried about adding complexity into this function, particularly as
> > that complexity is now adding in significant overhead.
> >
> > Firstly, can I ask why you're using a non-default directory for ${S}?
> > Is this as a way of doing a kind of external source usage?
> >
> > Having spent time looking at what this code is doing, in normal usage,
> > S gets set to STAGING_KERNEL_DIR, the source is unpacked there and none
> > of this code triggers.
> >
> > For EXTERNALSRC, a symlink is put in place. The code should remove a
> > symlink if present and create it with the current setup. In that sense,
> > this patch isn't doing the right thing.
> >
> > I'm very tempted to say the "using a non default S value" just error
> > out.
> >
> > Whilst I understand how we got to this level of complexity, I think it
> > will just end up causing us pain in the long run and I'd rather just
> > not support it.
> >
> > Cheers,
> >
> > Richard
> >

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#199898): https://lists.openembedded.org/g/openembedded-core/message/199898
> Mute This Topic: https://lists.openembedded.org/mt/103308574/3617179
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alexandre.belloni@bootlin.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

