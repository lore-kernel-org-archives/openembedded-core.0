Return-Path: <m.felsch@pengutronix.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E98AC4167B
	for <webhook@archiver.kernel.org>; Wed, 29 Nov 2023 09:36:22 +0000 (UTC)
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
 by mx.groups.io with SMTP id smtpd.web11.28509.1701250573771051798
 for <openembedded-core@lists.openembedded.org>;
 Wed, 29 Nov 2023 01:36:14 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: pengutronix.de, ip: 185.203.201.7, mailfrom: mfe@pengutronix.de)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <mfe@pengutronix.de>)
	id 1r8GzL-0002mA-IT; Wed, 29 Nov 2023 10:36:11 +0100
Received: from [2a0a:edc0:2:b01:1d::c0] (helo=ptx.whiteo.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <mfe@pengutronix.de>)
	id 1r8GzK-00CNDi-Ln; Wed, 29 Nov 2023 10:36:10 +0100
Received: from mfe by ptx.whiteo.stw.pengutronix.de with local (Exim 4.92)
	(envelope-from <mfe@pengutronix.de>)
	id 1r8GzK-004Pvg-JU; Wed, 29 Nov 2023 10:36:10 +0100
Date: Wed, 29 Nov 2023 10:36:10 +0100
From: Marco Felsch <m.felsch@pengutronix.de>
To: "Marko, Peter" <Peter.Marko@siemens.com>
Cc: "openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>,
	"yocto@pengutronix.de" <yocto@pengutronix.de>
Subject: Re: [OE-core] [PATCH] json-c: fix icecc compilation
Message-ID: <20231129093610.34gr6zwe26xkiyii@pengutronix.de>
References: <20231128224743.2854095-1-m.felsch@pengutronix.de>
 <AS1PR10MB569750733E9544DDFF316DC0FD83A@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <AS1PR10MB569750733E9544DDFF316DC0FD83A@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
User-Agent: NeoMutt/20180716
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: mfe@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: openembedded-core@lists.openembedded.org
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 29 Nov 2023 09:36:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191434

On 23-11-29, Marko, Peter wrote:
> -----Original Message-----
> From: openembedded-core@lists.openembedded.org <openembedded-core@lists.openembedded.org> On Behalf Of Marco Felsch via lists.openembedded.org
> Sent: Tuesday, November 28, 2023 23:48
> To: openembedded-core@lists.openembedded.org
> Cc: yocto@pengutronix.de; mfe@pengutronix.de
> Subject: [OE-core] [PATCH] json-c: fix icecc compilation
> 
> > Skip -Werror to make it possible to compile this recipe with ICECC else all fallthrough comments will be removed since we pre-process the files on the host before sending them to the compile nodes which then cause errors because of default -Werror switch.
> >
> > Fixes: caf64f85b5c5 ("json-c: update 0.13.1 - > 0.14")
> > Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
> > ---
> > Hi,
> >
> > I'm not familar with the stable material but IMHO this would be somthing for kirkstone.
> 
> You need to send a separate patch for kirkstone as this one does not apply there.

Thanks for the information. So there are no stable maintainers
backporting this patch?

> > Regards,
> >   Marco
> >
> >  meta/recipes-devtools/json-c/json-c_0.17.bb | 3 +++
> >  1 file changed, 3 insertions(+)
> >
> > diff --git a/meta/recipes-devtools/json-c/json-c_0.17.bb b/meta/recipes-devtools/json-c/json-c_0.17.bb
> > index f4b7a32cea01..20bcece7685d 100644
> > --- a/meta/recipes-devtools/json-c/json-c_0.17.bb
> > +++ b/meta/recipes-devtools/json-c/json-c_0.17.bb
> > @@ -17,6 +17,9 @@ UPSTREAM_CHECK_REGEX = "json-c-(?P<pver>\d+(\.\d+)+)-\d+"
> >  
> >  RPROVIDES:${PN} = "libjson"
> >  
> > +# Required for ICECC builds
> > +EXTRA_OECMAKE = "-DDISABLE_WERROR=ON"
> 
> I don't like removing WERROR unconditionally which decreases quality checks.
> Can we do it only in case ICECC is used?
> Something like "${@'-DDISABLE_WERROR=ON' if bb.data.inherits_class(icecc, d) else ''}"

Good point, but IMHO IMHO Werror builds are for the project itself. It's
not oe-core's purpose to check each package that Werror builds do
succeed else you would need to enable it for all packages.

Regards,
  Marco


> 
> > +
> >  inherit cmake ptest
> >  
> >  do_install_ptest() {
> --
> 2.39.2
> 
> 

