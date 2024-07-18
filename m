Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8E6CFC3DA49
	for <webhook@archiver.kernel.org>; Thu, 18 Jul 2024 21:59:00 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
 by mx.groups.io with SMTP id smtpd.web11.5762.1721339933380792516
 for <openembedded-core@lists.openembedded.org>;
 Thu, 18 Jul 2024 14:58:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=ImTlm/2I;
 spf=pass (domain: bootlin.com, ip: 217.70.183.200, mailfrom: alexandre.belloni@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 4DB0820003;
	Thu, 18 Jul 2024 21:58:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1721339931;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=oaZaMPOuQwkEOSTh+T0bySG5lYmUAM8hMI4aHsWNl9A=;
	b=ImTlm/2IazPXmDe4/EKGVpTFviZ01N9pxKBQWMTroYSSfFNmLXRwgQXj+OyL7BxXeW58IJ
	S/sisc6FWfFjnPVngYZjGwXBiL0bz/zzQsKxVG7E2m6VCq+Pb+7vPSc4TXsNvDoX8tMWgT
	MuIceXsW1BRghQAVGks272mHjmrqcGrqXdraGTLEKXST8Xx0h35PO6Vbo081qj2tmoFCpU
	0hkOnCB/na5vYLM4HPfJOmVaIqOSIShZCW7AUmw/9NPxt+4/qP1FgAd/2S7zhIX1h+vTaJ
	x4Hm10LD0lzNUK+zwPB5y8plVy3M7HFzQGn+ILZTsxnXrgagLTJJ3BqS97CL5w==
Date: Thu, 18 Jul 2024 23:58:49 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: yoann.congal@smile.fr
Cc: sundeep.kokkonda@windriver.com,
	openembedded-core@lists.openembedded.org,
	randy.macleod@windriver.com, naveen.gowda@windriver.com,
	shivaprasad.moodalappa@windriver.com, yash.shinde@windriver.com,
	deepthi.hemraj@windriver.com, harish.sadineni@windriver.com
Subject: Re: [OE-core] [PATCH] oeqa/selftest/reproducibile: rename of
 reproducible directories
Message-ID: <202407182158492c41de2a@mail.local>
References: <20240718100440.1555319-1-sundeep.kokkonda@windriver.com>
 <CAMSfU+66tLkOehv29BiAzo5gb+you3tqUWywrTaP9CBaVTmZzA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMSfU+66tLkOehv29BiAzo5gb+you3tqUWywrTaP9CBaVTmZzA@mail.gmail.com>
X-GND-Sasl: alexandre.belloni@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 18 Jul 2024 21:59:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202238

On 18/07/2024 12:27:43+0200, Yoann Congal via lists.openembedded.org wrote:
> Le jeu. 18 juil. 2024 � 12:05, Sundeep KOKKONDA via lists.openembedded.org
> <sundeep.kokkonda=windriver.com@lists.openembedded.org> a �crit :
> 
> > From: Sundeep KOKKONDA <sundeep.kokkonda@windriver.com>
> >
> > We do see a few reproducible issues are depending on the path length of
> > the build directory.
> > https://bugzilla.yoctoproject.org/show_bug.cgi?id=15554
> >
> > The current implementation of reproducible tests having different names
> > for directories but with same length.
> > The build directory names are changed to have difefrent lenth.
> >
> > Signed-off-by: Sundeep KOKKONDA <sundeep.kokkonda@windriver.com>
> > ---
> >  meta/lib/oeqa/selftest/cases/reproducible.py | 10 +++++++---
> >  1 file changed, 7 insertions(+), 3 deletions(-)
> >
> > diff --git a/meta/lib/oeqa/selftest/cases/reproducible.py
> > b/meta/lib/oeqa/selftest/cases/reproducible.py
> > index 7c6cf3eb1f..6932b0c2a5 100644
> > --- a/meta/lib/oeqa/selftest/cases/reproducible.py
> > +++ b/meta/lib/oeqa/selftest/cases/reproducible.py
> > @@ -276,9 +276,13 @@ class ReproducibleTests(OESelftestTestCase):
> >              os.chmod(save_dir, stat.S_IRWXU | stat.S_IRGRP | stat.S_IXGRP
> > | stat.S_IROTH | stat.S_IXOTH)
> >              self.logger.info('Non-reproducible packages will be copied
> > to %s', save_dir)
> >
> > -        vars_A = self.do_test_build('reproducibleA',
> > self.build_from_sstate)
> > +        # The below bug shows that a few reproducible issues are depends
> > on build dir path length.
> > +        # https://bugzilla.yoctoproject.org/show_bug.cgi?id=15554
> > +        # So, the reproducibleA & reproducibleB directories are changed
> > to reproducible & reproducible-extended to have different size.
> >
> > -        vars_B = self.do_test_build('reproducibleB', False)
> > +        vars_A = self.do_test_build('reproducible',
> > self.build_from_sstate)
> > +
> > +        vars_B = self.do_test_build('reproducible-extended', False)
> >
> 
> How about "reproducible-sstate" & "reproducible-no-sstate" (diff length but
> match what happens under the hood) ?

This was discussed out of the ML, because we have pids in paths, we need
more than 3 chars to ensure the difference un path length is not hidden
again.



-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

