Return-Path: <mac@mcrowe.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02A09C43458
	for <webhook@archiver.kernel.org>; Thu,  9 Jul 2026 19:08:00 +0000 (UTC)
Received: from deneb.mcrowe.com (deneb.mcrowe.com [88.97.37.36])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.4377.1783624074059196489
 for <openembedded-core@lists.openembedded.org>;
 Thu, 09 Jul 2026 12:07:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mcrowe.com header.s=20260328 header.b=KqNWA5mQ;
 spf=pass (domain: mcrowe.com, ip: 88.97.37.36, mailfrom: mac@mcrowe.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mcrowe.com;
	s=20260328; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=XCqCcN3b/OqWuIPJTrjpRTfMqOjN6PLrwKFU/2/ycKg=; b=KqNWA5mQXjf/gmDiw63OFxk4vY
	EaiiN/h66mpo2SrNAWbVGafBGnzB7C+7CFR1b3KNqrw+k2fjz/ATORReSnxQE37gBmgtFRQao6vys
	gCFp96a7bFEBytIJSbAP2015g/yz4OQPm2CBA/+JTQ5RMgwo5Ttgj7V4aVk6PE8fltLvaFiuA3v1+
	OHarJLK9FlNEQH7sMwV+FEZth84WRc/MFIOeA1ETd/vtxXIrmocGmX/69EPYR24uqxFJmwWyu1ezL
	avAPKUOdF5tirNWwbvANjYp0VxNbYvTwDpAmi9/Bl7rdXMhgugGL6eIL8gI6R0X26u9rjVkbFSBw7
	gDTHkvuQ==;
Received: from mac by deneb.mcrowe.com with local (Exim 4.98.2)
	(envelope-from <mac@mcrowe.com>)
	id 1whu6B-00000000EdX-2SQB;
	Thu, 09 Jul 2026 20:07:51 +0100
Date: Thu, 9 Jul 2026 20:07:51 +0100
From: Mike Crowe <mac@mcrowe.com>
To: Yoann Congal <yoann.congal@smile.fr>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [scarthgap][PATCH] dropbear: Disable DSS correctly
Message-ID: <ak_xh2CM7n4X8_c_@mcrowe.com>
References: <20260629165056.2489582-1-mac@mcrowe.com>
 <DJS7O5671XMZ.OZRLCFBNZFYP@smile.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DJS7O5671XMZ.OZRLCFBNZFYP@smile.fr>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 09 Jul 2026 19:08:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240590

Hi Yoann,

On Tuesday 07 July 2026 at 10:54:38 +0200, Yoann Congal wrote:
> On Mon Jun 29, 2026 at 6:50 PM CEST, Mike Crowe via lists.openembedded.org wrote:
> > From: Mike Crowe <mac@mcrowe.com>
> >
> > Take upstream patch that stops sysoptions.h unconditionally turning
> > DROPBEAR_DSS back on even when it has been disabled (which is the
> > default).
> >
> > Signed-off-by: Mike Crowe <mac@mcrowe.com>
> > ---
> >  ...PBEAR_DSS-is-only-forced-for-fuzzing.patch | 29 +++++++++++++++++++
> >  .../recipes-core/dropbear/dropbear_2022.83.bb |  1 +
> >  2 files changed, 30 insertions(+)
> >  create mode 100644 meta/recipes-core/dropbear/dropbear/0001-Fix-so-DROPBEAR_DSS-is-only-forced-for-fuzzing.patch
> >
> > diff --git a/meta/recipes-core/dropbear/dropbear/0001-Fix-so-DROPBEAR_DSS-is-only-forced-for-fuzzing.patch b/meta/recipes-core/dropbear/dropbear/0001-Fix-so-DROPBEAR_DSS-is-only-forced-for-fuzzing.patch
> > new file mode 100644
> > index 0000000000..b9705a2bbb
> > --- /dev/null
> > +++ b/meta/recipes-core/dropbear/dropbear/0001-Fix-so-DROPBEAR_DSS-is-only-forced-for-fuzzing.patch
> > @@ -0,0 +1,29 @@
> > +From c7dfaebd5f6a4cde4198f4d2a7baabaa1f632274 Mon Sep 17 00:00:00 2001
> > +From: Matt Johnston <matt@ucc.asn.au>
> > +Date: Tue, 6 Dec 2022 22:34:11 +0800
> > +Subject: [PATCH] Fix so DROPBEAR_DSS is only forced for fuzzing
> > +
> > +Regression from 787391ea3b5af2acf5e3c83372510f0c79477ad7,
> > +was missing fuzzing conditional
> > +
> > +Upstream-Status: Backport [https://github.com/mkj/dropbear/commit/c043efb47c3173072fa636ca0da0d19875d4511f]
> 
> This patch is missing your signed-off-by.

Well, it's not my patch. :)

I wasn't aware that I was expected to add one to the patch itself for a
backport.

https://docs.yoctoproject.org/scarthgap/contributor-guide/recipe-style-guide.html
doesn't seem to say that a SoB should be added to the patch. It does say:

| Of course, if another person later takes care of submitting this patch
| upstream, the status should be changed to Submitted [where], and an
| additional Signed-off-by: line should be added to the patch by the person
| claiming responsibility for upstreaming.

which sort of implies that a SoB should be added for original patches that
are suitable for upstreaming but this patch is a backport which originated
upstream (without a SoB) which isn't the same thing.

Adding a SoB to an unmodified upstream backport patch feels like
appropriation on my part, but I can do so if that's the policy.

Thanks.

Mike.

