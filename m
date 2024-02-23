Return-Path: <m.felsch@pengutronix.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81158C5478C
	for <webhook@archiver.kernel.org>; Fri, 23 Feb 2024 13:02:07 +0000 (UTC)
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
 by mx.groups.io with SMTP id smtpd.web10.9991.1708693320865892939
 for <openembedded-core@lists.openembedded.org>;
 Fri, 23 Feb 2024 05:02:01 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: pengutronix.de, ip: 185.203.201.7, mailfrom: mfe@pengutronix.de)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <mfe@pengutronix.de>)
	id 1rdVBf-0006ho-Aw; Fri, 23 Feb 2024 14:01:59 +0100
Received: from [2a0a:edc0:2:b01:1d::c5] (helo=pty.whiteo.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <mfe@pengutronix.de>)
	id 1rdVBe-002Qtv-EF; Fri, 23 Feb 2024 14:01:58 +0100
Received: from mfe by pty.whiteo.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <mfe@pengutronix.de>)
	id 1rdVBe-004HLn-1A;
	Fri, 23 Feb 2024 14:01:58 +0100
Date: Fri, 23 Feb 2024 14:01:58 +0100
From: Marco Felsch <m.felsch@pengutronix.de>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org, yocto@pengutronix.de
Subject: Re: [OE-core] [PATCH] devicetree.bbclass: fix do_fetch stage
Message-ID: <20240223130158.xai2bbltkklf4ech@pengutronix.de>
References: <20240223121040.1608421-1-m.felsch@pengutronix.de>
 <74879539489bde95b7d3fada7bae7dcfbadcb96c.camel@linuxfoundation.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <74879539489bde95b7d3fada7bae7dcfbadcb96c.camel@linuxfoundation.org>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: mfe@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: openembedded-core@lists.openembedded.org
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 23 Feb 2024 13:02:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196074

On 24-02-23, Richard Purdie wrote:
> On Fri, 2024-02-23 at 13:10 +0100, Marco Felsch wrote:
> > The fetch stage should always start with a clean ${S} directory to
> > not
> > try to compile leftovers from previous builds.
> > 
> > Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
> > ---
> > �meta/classes-recipe/devicetree.bbclass | 2 ++
> > �1 file changed, 2 insertions(+)
> > 
> > diff --git a/meta/classes-recipe/devicetree.bbclass b/meta/classes-
> > recipe/devicetree.bbclass
> > index bd50d7fa1d38..655460a9dbef 100644
> > --- a/meta/classes-recipe/devicetree.bbclass
> > +++ b/meta/classes-recipe/devicetree.bbclass
> > @@ -77,6 +77,8 @@ python () {
> > �������� d.appendVarFlag("do_compile", "depends", "
> > virtual/kernel:do_configure")
> > �}
> > �
> > +do_fetch[cleandirs] = "${S}"
> > +
> > �def expand_includes(varname, d):
> > ���� import glob
> > ���� includes = set()
> > 
> 
> This doesn't make sense. do_fetch works with the fetcher in directories
> outside WORKDIR. The sources only become available at do_unpack. The
> correct task would therefore be unpack.

Good to know, what I inspect is that old dts(i) files are still present
once I adapted the SRC_URI path e.g:

SRC_URI = "a.dts b.dts"

to

SRC_URI = "b.dts"

and so this class tries to compile both, albeit I explicite removed
a.dts from SRC_URI.

Regards,
  Marco



> 
> This is then covered by base.bbclass:
> 
> meta/classes-global/base.bbclass:do_unpack[cleandirs] = "${@d.getVar('S') if os.path.normpath(d.getVar('S')) != os.path.normpath(d.getVar('WORKDIR')) else os.path.join('${S}', 'patches')}"
> 
> Cheers,
> 
> Richard
> 
> 

