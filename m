Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C98C3C47DB3
	for <webhook@archiver.kernel.org>; Wed, 31 Jan 2024 16:53:52 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
 by mx.groups.io with SMTP id smtpd.web11.93.1706720023930123455
 for <openembedded-core@lists.openembedded.org>;
 Wed, 31 Jan 2024 08:53:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=BzK55uys;
 spf=pass (domain: bootlin.com, ip: 217.70.183.196, mailfrom: alexandre.belloni@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 20481E0005;
	Wed, 31 Jan 2024 16:53:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1706720021;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=sMCDEhf9YcxGxU7Hcfkld/HvtnajCJqcl8A4imtsZDw=;
	b=BzK55uyskFIqYggb2vEyKPtqEIjuP6RommaDfz8ZJZuS7iFNFA+8XUNKmhh6VJIIBOTitw
	5jvq/vYOS+p1CDdynKWk4ZkYoDBrs82zh1ykI1q4JLc6wr5DeJyPKDmXeULET/KZq1lCxh
	mrHKTOFVfEDEPPvlWX0A4vmxhIDEx/HpeC0mb0Ah0BYav3jhmGB6k3sZlzZFuxGlftxV1L
	EpPPSOk+HO7wmStjr/AYZJcjdYytPWXTysW+yiBySc72hWbcNH0K0MaqNbGS2s7scRrG/b
	2h9kFnYo3nYgLICbkHubIllpH0ySlPJbz5pkpNn+EDLX1qgmodAnLryjwYTgTA==
Date: Wed, 31 Jan 2024 17:53:40 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: ecordonnier@snap.com
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core][PATCH v5] kernel.bbclass: make do_symlink_kernelsrc
 reentrant
Message-ID: <20240131165340dbfecc40@mail.local>
References: <17A2F72F5D272934.28089@lists.openembedded.org>
 <17A2F73D8934EE37.10357@lists.openembedded.org>
 <CAHUKmYbSB7YvxRbriXxpG9+JumEysDgVW=SxBX=B1yjDCRMrtw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAHUKmYbSB7YvxRbriXxpG9+JumEysDgVW=SxBX=B1yjDCRMrtw@mail.gmail.com>
X-GND-Sasl: alexandre.belloni@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 31 Jan 2024 16:53:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194529

On 30/01/2024 16:39:27+0100, Etienne Cordonnier via lists.openembedded.org wrote:
> Hi,
> what is the status of this patch? Was it rejected?
> 

I'll test it again because I don't remember but I possibly add a
build/test failure.

> Étienne
> 
> On Thu, Dec 21, 2023 at 10:50 PM Etienne Cordonnier via
> lists.openembedded.org <ecordonnier=snap.com@lists.openembedded.org> wrote:
> 
> > patch v5: added ignore_dangling_symlinks to avoid error when linux sources
> > contain dangling symlinks
> >
> > On Thu, Dec 21, 2023 at 10:49 PM Etienne Cordonnier via
> > lists.openembedded.org
> > <https://urldefense.proofpoint.com/v2/url?u=http-3A__lists.openembedded.org&d=DwMFaQ&c=ncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&r=AhkbNonVuMIGRfPx_Qj9TsRih1DULJTKUkSGa66m67E&m=UCoMTsJKrnqkV-eQGGRGBeC-wIGTP7H0LRPvcTWkn9673LluHqkCpFInRctDEEct&s=Af3lZ-qHdVwBo6b8tlJ45PXYNer8GU6q0uxJ740caCA&e=>
> > <ecordonnier=snap.com@lists.openembedded.org> wrote:
> >
> >> From: Etienne Cordonnier <ecordonnier@snap.com>
> >>
> >> The function do_symlink_kernsrc is not reentrant in the case where S is
> >> defined
> >> to a non-default value. This causes build-failures e.g. when building
> >> linux-yocto, then updating
> >> poky to a commit which modifies kernel.bbclass, and then building
> >> linux-yocto again.
> >>
> >> Bugzilla: https://bugzilla.yoctoproject.org/show_bug.cgi?id=15325
> >> <https://urldefense.proofpoint.com/v2/url?u=https-3A__bugzilla.yoctoproject.org_show-5Fbug.cgi-3Fid-3D15325&d=DwMFaQ&c=ncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&r=AhkbNonVuMIGRfPx_Qj9TsRih1DULJTKUkSGa66m67E&m=eo9dzHi2uXPV1dA2f4GoA6Y7QoDiG2TTF1R2YQ__SwnF1U1d0O2JxX3PprS_T9BN&s=e9FG4cG4GbLjCy8loEN6qVisSUax4Ngvd_Ok8TPonvY&e=>
> >>
> >> Tested with a recipe "my-custom-linux" which unpacks sources to a custom
> >> ${S} directory
> >> and ran symlink_kernsrc several times:
> >> $ bitbake -f -c symlink_kernsrc my-custom-linux
> >>
> >> Signed-off-by: Etienne Cordonnier <ecordonnier@snap.com>
> >> ---
> >>  meta/classes-recipe/kernel.bbclass | 8 +++++++-
> >>  1 file changed, 7 insertions(+), 1 deletion(-)
> >>
> >> diff --git a/meta/classes-recipe/kernel.bbclass
> >> b/meta/classes-recipe/kernel.bbclass
> >> index 9ff37f5c38..45b63f1fa1 100644
> >> --- a/meta/classes-recipe/kernel.bbclass
> >> +++ b/meta/classes-recipe/kernel.bbclass
> >> @@ -189,11 +189,17 @@ python do_symlink_kernsrc () {
> >>              # drop trailing slash, so that os.symlink(kernsrc, s)
> >> doesn't use s as
> >>              # directory name and fail
> >>              s = s[:-1]
> >> -        if d.getVar("EXTERNALSRC"):
> >> +        if d.getVar("EXTERNALSRC") and not os.path.islink(s):
> >>              # With EXTERNALSRC S will not be wiped so we can symlink to
> >> it
> >>              os.symlink(s, kernsrc)
> >>          else:
> >>              import shutil
> >> +            # perform idempotent/reentrant copy
> >> +            s_copy = s + ".orig"
> >> +            if not os.path.isdir(s_copy):
> >> +                shutil.copytree(s, s_copy, ignore_dangling_symlinks=True)
> >> +            bb.utils.remove(s, recurse=True)
> >> +            shutil.copytree(s_copy, s, ignore_dangling_symlinks=True)
> >>              shutil.move(s, kernsrc)
> >>              os.symlink(kernsrc, s)
> >>  }
> >> --
> >> 2.34.1
> >>
> >>
> >>
> >>
> > 
> >
> >

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#194496): https://lists.openembedded.org/g/openembedded-core/message/194496
> Mute This Topic: https://lists.openembedded.org/mt/104055728/3617179
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alexandre.belloni@bootlin.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

