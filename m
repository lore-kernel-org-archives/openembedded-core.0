Return-Path: <m.felsch@pengutronix.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03259C54798
	for <webhook@archiver.kernel.org>; Fri, 23 Feb 2024 13:55:38 +0000 (UTC)
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
 by mx.groups.io with SMTP id smtpd.web11.10941.1708696527665551473
 for <openembedded-core@lists.openembedded.org>;
 Fri, 23 Feb 2024 05:55:27 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: pengutronix.de, ip: 185.203.201.7, mailfrom: mfe@pengutronix.de)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <mfe@pengutronix.de>)
	id 1rdW1O-0005Fu-4v; Fri, 23 Feb 2024 14:55:26 +0100
Received: from [2a0a:edc0:2:b01:1d::c5] (helo=pty.whiteo.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <mfe@pengutronix.de>)
	id 1rdW1N-002R4S-OV; Fri, 23 Feb 2024 14:55:25 +0100
Received: from mfe by pty.whiteo.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <mfe@pengutronix.de>)
	id 1rdW1N-004HvQ-2A;
	Fri, 23 Feb 2024 14:55:25 +0100
Date: Fri, 23 Feb 2024 14:55:25 +0100
From: Marco Felsch <m.felsch@pengutronix.de>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org, yocto@pengutronix.de
Subject: Re: [OE-core] [PATCH] devicetree.bbclass: fix do_fetch stage
Message-ID: <20240223135525.j5lnfi2gq37hmuz6@pengutronix.de>
References: <20240223121040.1608421-1-m.felsch@pengutronix.de>
 <74879539489bde95b7d3fada7bae7dcfbadcb96c.camel@linuxfoundation.org>
 <20240223130158.xai2bbltkklf4ech@pengutronix.de>
 <9c456049b253f718c74aae063343ab0db8081f81.camel@linuxfoundation.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <9c456049b253f718c74aae063343ab0db8081f81.camel@linuxfoundation.org>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: mfe@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: openembedded-core@lists.openembedded.org
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 23 Feb 2024 13:55:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196084

On 24-02-23, Richard Purdie wrote:
> On Fri, 2024-02-23 at 14:01 +0100, Marco Felsch wrote:
> > On 24-02-23, Richard Purdie wrote:
> > > On Fri, 2024-02-23 at 13:10 +0100, Marco Felsch wrote:
> > > > The fetch stage should always start with a clean ${S} directory
> > > > to
> > > > not
> > > > try to compile leftovers from previous builds.
> > > > 
> > > > Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
> > > > ---
> > > > �meta/classes-recipe/devicetree.bbclass | 2 ++
> > > > �1 file changed, 2 insertions(+)
> > > > 
> > > > diff --git a/meta/classes-recipe/devicetree.bbclass
> > > > b/meta/classes-
> > > > recipe/devicetree.bbclass
> > > > index bd50d7fa1d38..655460a9dbef 100644
> > > > --- a/meta/classes-recipe/devicetree.bbclass
> > > > +++ b/meta/classes-recipe/devicetree.bbclass
> > > > @@ -77,6 +77,8 @@ python () {
> > > > �������� d.appendVarFlag("do_compile", "depends", "
> > > > virtual/kernel:do_configure")
> > > > �}
> > > > �
> > > > +do_fetch[cleandirs] = "${S}"
> > > > +
> > > > �def expand_includes(varname, d):
> > > > ���� import glob
> > > > ���� includes = set()
> > > > 
> > > 
> > > This doesn't make sense. do_fetch works with the fetcher in
> > > directories
> > > outside WORKDIR. The sources only become available at do_unpack.
> > > The
> > > correct task would therefore be unpack.
> > 
> > Good to know, what I inspect is that old dts(i) files are still
> > present
> > once I adapted the SRC_URI path e.g:
> > 
> > SRC_URI = "a.dts b.dts"
> > 
> > to
> > 
> > SRC_URI = "b.dts"
> > 
> > and so this class tries to compile both, albeit I explicite removed
> > a.dts from SRC_URI.
> 
> This is a known problem, I thought there was an open bug for it but I
> can't seem to find it right now.
> 
> Basically the problem is that the fetcher can't know what it previously
> placed during do_unpack and know what it needs to clean up. Deleting
> the contents of ${S} sounds straight forward but in reality, it isn't
> quite that simple, particularly due to S = ${WORKDIR} that some recipes
> use.
> 
> Longer term the plan is to drop support for S = ${WORKDIR} and then we
> can simplify things but nobody has got around to doing that work yet.

Okay, thanks for input. In that case I will wait and notice it as known
bug.

Regards,
  Marco

