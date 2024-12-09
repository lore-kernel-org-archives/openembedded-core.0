Return-Path: <m.felsch@pengutronix.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BCDDDE7717D
	for <webhook@archiver.kernel.org>; Mon,  9 Dec 2024 17:38:23 +0000 (UTC)
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
 by mx.groups.io with SMTP id smtpd.web10.108121.1733765898618372945
 for <openembedded-core@lists.openembedded.org>;
 Mon, 09 Dec 2024 09:38:19 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: pengutronix.de, ip: 185.203.201.7, mailfrom: mfe@pengutronix.de)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <mfe@pengutronix.de>)
	id 1tKhi5-0008Sb-4r; Mon, 09 Dec 2024 18:38:17 +0100
Received: from pty.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::c5])
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <mfe@pengutronix.de>)
	id 1tKhi3-002YMA-0V;
	Mon, 09 Dec 2024 18:38:15 +0100
Received: from mfe by pty.whiteo.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <mfe@pengutronix.de>)
	id 1tKhi3-006d05-2i;
	Mon, 09 Dec 2024 18:38:15 +0100
Date: Mon, 9 Dec 2024 18:38:15 +0100
From: Marco Felsch <m.felsch@pengutronix.de>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org, yocto@pengutronix.de
Subject: Re: [OE-core] [PATCH] icecc: fix PN 'no-pn' handling
Message-ID: <20241209173815.lq7fh5nr55mttn6u@pengutronix.de>
References: <20241209164608.3595821-1-m.felsch@pengutronix.de>
 <180F920C983A7BC6.8554@lists.openembedded.org>
 <d470ced4a402955d9061201ba33c8b875f0bce63.camel@linuxfoundation.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <d470ced4a402955d9061201ba33c8b875f0bce63.camel@linuxfoundation.org>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: mfe@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: openembedded-core@lists.openembedded.org
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 09 Dec 2024 17:38:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208493

On 24-12-09, Richard Purdie wrote:
> On Mon, 2024-12-09 at 17:22 +0000, Richard Purdie via lists.openembedded.org wrote:
> > On Mon, 2024-12-09 at 17:46 +0100, Marco Felsch via lists.openembedded.org wrote:
> > > Since bitbake commit f24bbaaddb36 ("data: Add support for new
> > > BB_HASH_CODEPARSER_VALS for cache optimisation") the
> > > BB_HASH_CODEPARSER_VALS are passed during the bb.build_dependencies()
> > > step.
> > > 
> > > With PN set to 'no-pn' and the icecc_version() running during
> > > bb.build_dependencies() (due to the 'vardepsexclude') the bb.fatal() is
> > > triggered while parsing target-sdk-provides-dummy.bb albeit it was
> > > already disabled via ICECC_RECIPE_DISABLE.
> > > 
> > > To fix this use_icecc() need to verify if PN is set to 'no-pn' which
> > > indicates the early bb.build_dependencies() task and return 'no' in that
> > > case.
> > > 
> > > Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
> > > ---
> > > Hi,
> > > 
> > > this patch should fix the reoprted ICECC bug:
> > > 
> > > https://lists.yoctoproject.org/g/yocto/topic/icecc_support_broken/103429714
> > > 
> > > Regards,
> > > � Marco
> > > 
> > > �meta/classes/icecc.bbclass | 6 ++++++
> > > �1 file changed, 6 insertions(+)
> > > 
> > > diff --git a/meta/classes/icecc.bbclass b/meta/classes/icecc.bbclass
> > > index 159cae20f8ca..df73e31e9514 100644
> > > --- a/meta/classes/icecc.bbclass
> > > +++ b/meta/classes/icecc.bbclass
> > > @@ -159,6 +159,12 @@ def use_icecc(bb,d):
> > > ������������ bb.debug(1, "%s: bbclass %s found in disable, disable icecc" % (pn, bbclass))
> > > ������������ return "no"
> > > �
> > > +��� # PN set to 'no-pn' indicates that bitbake is at the early
> > > +��� # bb.build_dependencies() stage and it's not possible to use the value to
> > > +��� # decide if icecc can be used.
> > > +��� if pn == "no-pn":
> > > +������� return "no"
> > > +
> > > ���� disabled_recipes = (d.getVar('ICECC_RECIPE_DISABLE') or "").split()
> > > ���� enabled_recipes = (d.getVar('ICECC_RECIPE_ENABLE') or "").split()
> > > �
> > 
> > I'm not sure the patch description is quite right and I'm also not sure
> > this is a safe way to solve the issue here.
> > 
> > Bitbake is trying to work out the dependencies of the various
> > functions. The reasoning was that setting some dummy values for that
> > code would stop it spiralling off and analysing multiple pieces of code
> > that were effectively functionally identical where for example a
> > version string just changes.
> > 
> > This gets messy with shell function, for example with the shell
> > function:
> > 
> > set_icecc_env() {
> > ��� if [ "${@use_icecc(bb, d)}" = "no" ]
> > ��� then
> > ������� return
> > ��� fi
> > }
> > 
> > it has to run use_icecc() to expand that in case it turned into a block
> > of code.
> > 
> > If we take a patch like this, I would like the comment above and the
> > commit message to be correct. "bb.build_dependencies" doesn't exist and
> > the early stage you refer to is misleading as it doesn't work like
> > that.

Okay, thanks for the clarification. I'm not very deep into the bitbake
core development.

> > If we're hitting the "NULL prefix" code in icecc_version(), wouldn't it
> > be better to special case pn == "no-pn" there, note that it is at
> > dependency parse time and return a dummy "parse-time-dummy-
> > icetarball.tgz" value?

I used the current location (use_icecc) since it makes no sense to me to
check for recipe names (disabled_recipes, enabled_recipes) if we can't
use the PN value.

> I meant to add, if we rewrite some of these functions in python, these
> issues would go away as we don't expand data in python functions.

Now with your explanation it makes more sense to me why only
set_icecc_env() failed... Thanks a lot!

> The modern way of doing much of this would be a python prefunc on the
> appropriate tasks. I have to wonder how many people are using icecc :/.

Okay, I will give it a try with a python based prefunc.

Regards,
  Marco

