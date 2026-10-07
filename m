Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9ABF0CA5FFF
	for <webhook@archiver.kernel.org>; Wed,  7 Oct 2026 20:14:51 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.822.1791404088056349521
 for <openembedded-core@lists.openembedded.org>;
 Wed, 07 Oct 2026 13:14:48 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id D484D40C86;
	Wed,  7 Oct 2026 20:14:46 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id iRSv2EpDcLxS; Wed,  7 Oct 2026 20:14:46 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 9D069406B9;
	Wed,  7 Oct 2026 20:14:44 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 3D44917EEF3; Wed,  7 Oct 2026 16:14:44 -0400 (EDT)
Date: Wed, 7 Oct 2026 16:14:44 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: Paul Barker <paul@pbarker.dev>
Cc: openembedded-core@lists.openembedded.org,
	Denys Dmytriyenko <denys@konsulko.com>
Subject: Re: [PATCH] Revert "tclibc-baremetal.inc: fix gcc-cross
 EXTRA_OECONF"
Message-ID: <20261007201444.GP4190@denix.org>
References: <20261006214254.1556824-1-denis@denix.org>
 <9032ce70465fe1664635c7a3c4eef470c774092e.camel@pbarker.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9032ce70465fe1664635c7a3c4eef470c774092e.camel@pbarker.dev>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 07 Oct 2026 20:14:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247403

On Wed, Oct 07, 2026 at 03:30:10PM +0100, Paul Barker wrote:
> On Tue, 2026-10-06 at 17:42 -0400, Denys Dmytriyenko wrote:
> > From: Denys Dmytriyenko <denys@konsulko.com>
> > 
> > While this change has good intentions, unfortunaly, it completely
> > breaks baremetal setup (at least for ARM arch).
> > 
> > The line this change removes seems to mask an underlying issue,
> > but until that issue is fully understood and resolved, let's
> > revert it and restore the working baremetal behavior.
> > 
> > For more details please see the following discussion:
> > https://lists.openembedded.org/g/openembedded-core/topic/121486589
> > 
> > This reverts commit 020d5f018616bc48eae3a23d5498dec3c78a1386.
> > 
> > Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
> > ---
> >  meta/conf/distro/include/tclibc-baremetal.inc | 1 +
> >  1 file changed, 1 insertion(+)
> > 
> > diff --git a/meta/conf/distro/include/tclibc-baremetal.inc b/meta/conf/distro/include/tclibc-baremetal.inc
> > index 6043cb6654..abea5a7162 100644
> > --- a/meta/conf/distro/include/tclibc-baremetal.inc
> > +++ b/meta/conf/distro/include/tclibc-baremetal.inc
> > @@ -18,6 +18,7 @@ USE_NLS ?= "no"
> >  IMAGE_LINGUAS = ""
> >  LIBC_DEPENDENCIES = ""
> >  
> > +EXTRA_OECONF:pn-gcc-cross-${TARGET_ARCH}:append = " --without-headers"
> 
> Hi Denys,
> 
> I wonder if the fix is that this should be:
> 
>     EXTRA_OECONF:append:pn-gcc-cross-${TARGET_ARCH}

Yeah, I noticed the order of overrides is backwards, but don't think it 
matters and the issue is deeper it seems. I see that Joerg send a follow up 
patch to address it, but I haven't been able to test it yet.

-- 
Denys

