Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C19CC77B7A
	for <webhook@archiver.kernel.org>; Mon, 29 May 2023 16:07:15 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.53055.1685376428268360648
 for <openembedded-core@lists.openembedded.org>;
 Mon, 29 May 2023 09:07:09 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 4BCC240C24;
	Mon, 29 May 2023 16:07:07 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jRFky2K6D7Ve; Mon, 29 May 2023 16:07:07 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-88-116.washdc.fios.verizon.net [100.15.88.116])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 2F0CA40A30;
	Mon, 29 May 2023 16:07:06 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id BC39416392B; Mon, 29 May 2023 12:06:19 -0400 (EDT)
Date: Mon, 29 May 2023 12:06:19 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH] u-boot: do_compile depends on the value of
 UBOOT_LOCALVERSION
Message-ID: <20230529160619.GG9226@denix.org>
References: <20230528171515.832179-1-denis@denix.org>
 <5e1bf6762dd751f6bf5c5e2463fb91da34efe563.camel@linuxfoundation.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5e1bf6762dd751f6bf5c5e2463fb91da34efe563.camel@linuxfoundation.org>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 29 May 2023 16:07:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181874

On Mon, May 29, 2023 at 01:41:00PM +0100, Richard Purdie wrote:
> On Sun, 2023-05-28 at 17:15 +0000, Denys Dmytriyenko wrote:
> > UBOOT_LOCALVERSION is often used to pass SCM commit SHA to the code
> > via populating .scmversion file at the start of do_compile(). Let's
> > explicitly mark do_compile() as depending on the the value of this
> > variable to avoid errors like this:
> > 
> > $ echo 'UBOOT_LOCALVERSION = "${SRCPV}"' >> conf/local.conf
> > $ bitbake u-boot

^^^^^^^^


> > Loading cache: 100%
> > Loaded 0 entries from dependency cache.
> > WARNING: /OE/poky-master/meta/recipes-bsp/u-boot/u-boot_2023.04.bb: Exception during build_dependencies for do_compile
> > WARNING: /OE/poky-master/meta/recipes-bsp/u-boot/u-boot_2023.04.bb: Error during finalise of /OE/poky-master/meta/recipes-bsp/u-boot/u-boot_2023.04.bb
> > ERROR: ExpansionError during parsing /OE/poky-master/meta/recipes-bsp/u-boot/u-boot_2023.04.bb
> > Traceback (most recent call last):
> >   File "Var <SRCPV>", line 1, in <module>
> >   File "/OE/poky-master/bitbake/lib/bb/fetch2/__init__.py", line 784, in get_srcrev(d=<bb.data_smart.DataSmart object at 0x7fa0604a7100>, method_name='sortable_revision'):
> >          if not scms:
> >     >        raise FetchError("SRCREV was used yet no valid SCM was found in SRC_URI")
> > 
> > bb.data_smart.ExpansionError: Failure expanding variable SRCPV, expression was ${@bb.fetch2.get_srcrev(d)} which triggered exception FetchError: Fetcher failure: SRCREV was used yet no valid SCM was found in SRC_URI
> > The variable dependency chain for the failure is: SRCPV -> UBOOT_LOCALVERSION -> do_compile
> > 
> > ERROR: Parsing halted due to errors, see error messages above
> > 
> > Signed-off-by: Denys Dmytriyenko <denis@denix.org>
> > ---
> >  meta/recipes-bsp/u-boot/u-boot.inc | 1 +
> >  1 file changed, 1 insertion(+)
> > 
> > diff --git a/meta/recipes-bsp/u-boot/u-boot.inc b/meta/recipes-bsp/u-boot/u-boot.inc
> > index b3482dcef3..ec8108f5c9 100644
> > --- a/meta/recipes-bsp/u-boot/u-boot.inc
> > +++ b/meta/recipes-bsp/u-boot/u-boot.inc
> > @@ -23,6 +23,7 @@ PACKAGECONFIG[openssl] = ",,openssl-native"
> >  # u-boot build system and appended to the u-boot version.  If the .scmversion
> >  # file already exists it will not be overwritten.
> >  UBOOT_LOCALVERSION ?= ""
> > +do_compile[vardepvalue] = "${UBOOT_LOCALVERSION}"
> >  
> >  require u-boot-configure.inc
> >  
> 
> How would I reproduce this?

The instructions are in the description above.


> The fix looks a bit like a workaround and I'd like to understand what
> is really going on here.

This started happening recently after your change that empties SRC_URI for 
code parser cache handling in BB_HASH_CODEPARSER_VALS, as reported here:

https://lists.openembedded.org/g/openembedded-core/message/181726

-- 
Denys

