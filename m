Return-Path: <francesco@dolcini.it>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B090AF8924B
	for <webhook@archiver.kernel.org>; Tue, 21 Apr 2026 10:17:06 +0000 (UTC)
Received: from mail11.truemail.it (mail11.truemail.it [217.194.8.81])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.21188.1776766619776666140
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Apr 2026 03:17:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@dolcini.it header.s=default header.b=UKrg31Jr;
 spf=pass (domain: dolcini.it, ip: 217.194.8.81, mailfrom: francesco@dolcini.it)
Received: from francesco-nb (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch [83.173.201.248])
	by mail11.truemail.it (Postfix) with ESMTPA id 7A86F22206;
	Tue, 21 Apr 2026 12:16:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1776766616;
	bh=LO401cXQTyl2fNoJvrgXyTNP79OZdeu15mYZxYDu/7g=; h=From:To:Subject;
	b=UKrg31Jru3yd680YDML5diZ5nI+zNkDmlPYzv3JoBfFSQ4OpDpzo4kY172I1ScLEb
	 HAbm6GurjnJpGhXwCd1iCNvXkE6r/gQVTpyGAeGT2XYrhvuoyrCSLwENJkP3yg+zBa
	 /XtgdrdcZynhe4NJ9EPsyKc1rsf8VNDynsp2diUt00sGoFNYNApJZ/Ow1qLzCRY2z5
	 w8Wm3sQxZyEgwxCtH1CZctXttblA9uYf0HQZBPjUnUmU8TRCRJ3/U0HVLUpOj4cZZ4
	 e1mQu0325l4GtmdvwiQFZglyOE2hM+otMVTM+hB1Qdrpit6c+kjTqwFpHm7ODshdvJ
	 xO/UtPemZJohg==
Date: Tue, 21 Apr 2026 12:16:55 +0200
From: Francesco Dolcini <francesco@dolcini.it>
To: Paul Barker <paul@pbarker.dev>
Cc: Francesco Dolcini <francesco@dolcini.it>,
	Wojciech Dubowik <Wojciech.Dubowik@mt.com>, trini@konsulko.com,
	openembedded-core@lists.openembedded.org,
	Franz Schnyder <fra.schnyder@gmail.com>, u-boot@lists.denx.de
Subject: Re: [PATCH] tools: mkeficapsule: Add disable pkcs11 menu option
Message-ID: <20260421101655.GD23508@francesco-nb>
References: <20260409074710.1322519-1-Wojciech.Dubowik@mt.com>
 <7xe72m3tkzultqh3hw4cubfognfryjk5ababajoe6w6zt7jx4c@aaxa2kehv635>
 <aeXgdkBin5uz0-OH@mt.com>
 <20260420085001.GA47182@francesco-nb>
 <e87d67ec12516ae9c62b1d7b19797ff0ec131b36.camel@pbarker.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e87d67ec12516ae9c62b1d7b19797ff0ec131b36.camel@pbarker.dev>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 21 Apr 2026 10:17:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235660

On Tue, Apr 21, 2026 at 11:07:21AM +0100, Paul Barker wrote:
> On Mon, 2026-04-20 at 10:50 +0200, Francesco Dolcini wrote:
> > + Paul Barker
> > 
> > Hello all,
> > 
> > On Mon, Apr 20, 2026 at 10:14:46AM +0200, Wojciech Dubowik wrote:
> > > On Thu, Apr 16, 2026 at 05:51:13PM +0200, Franz Schnyder wrote:
> > > > On Thu, Apr 09, 2026 at 09:47:07AM +0200, Wojciech Dubowik wrote:
> > > > > Some distros are using gnutls library without pkcs11 support
> > > > > and linking of mkeficapsule will fail. Add disable pkcs11
> > > > > option with default set to no so distros can control this
> > > > > feature with config option.
> > > > Shouldn't it be the other way around? Use of pkcs11 should be disabled 
> > > > by default and enabled if required. As it is now, it would still depend
> > > > on the the gnutls library having pkcs11 support and therefore still 
> > > > would break our OE builds with mainline u-boot if we don't change our
> > > > modules defconfig.
> > > 
> > > As far as I understand, gnutls is built by default with pkcs11 support. So for
> > > most of the distribution it should be ok. Security by default.
> > > I don't have yn strong opinion for this but default enabled has been suggested
> > > by the maintainer.
> > 
> > We are in the very unfortunate situation in which we are not able to run
> > any test at the moment in our CI and automated test infrastructure (not
> > in U-Boot, not in OE), and the reason is that we have pcks11 enabled in
> > U-Boot, and OE core is not picking up the patch to enable it [1].
> > 
> > Any advise to have a way forward?
> > 
> > Francesco
> > 
> > [1] https://lore.kernel.org/all/20260408130553.819420-1-fra.schnyder@gmail.com/
> 
> Which versions of U-Boot and openembedded-core are you trying to build?

U-Boot master + openembedded-core master.

Francesco


