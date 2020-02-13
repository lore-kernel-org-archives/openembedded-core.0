Return-Path: <obi@opendreambox.org>
X-Greylist: delayed 451 seconds by postgrey-1.34 at layers.openembedded.org;
	Thu, 13 Feb 2020 23:26:06 UTC
Received: from relay.dream-property.net (relay.dream-property.net
	[178.19.67.222])
	by mail.openembedded.org (Postfix) with ESMTP id 0C66260CD9
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Feb 2020 23:26:06 +0000 (UTC)
Received: from mail.dream-property.net (mail.dream-property.net
	[82.149.226.172])
	by relay.dream-property.net (Postfix) with ESMTPS id AB8DF10095A21;
	Fri, 14 Feb 2020 00:18:35 +0100 (CET)
Received: from localhost (ip-176-199-141-47.hsi06.unitymediagroup.de
	[176.199.141.47])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits)
	server-digest SHA256) (No client certificate requested)
	by mail.dream-property.net (Postfix) with ESMTPSA id 4941F3140E0A;
	Fri, 14 Feb 2020 00:18:35 +0100 (CET)
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=opendreambox.org; 
	s=dkim; t=1581635915;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	content-transfer-encoding:content-transfer-encoding:
	in-reply-to:in-reply-to:references:references;
	bh=MOOj8jq92fjFRO5Qn1OUmFYQJW1VAb50/yukHb+6crs=;
	b=Nu5s98WC/N/ofW3W59GZxZ2fUPmGwdXFxVLupfVzrdeQYy85xnm/5MbA2mIBNxdjNpZMbx
	w0fnsvOYykeXCgDQ==
Date: Fri, 14 Feb 2020 00:18:33 +0100
From: Andreas Oberritter <obi@opendreambox.org>
To: Maxime =?UTF-8?B?Um91c3Npbi1Cw6lsYW5nZXI=?=
	<maxime.roussinbelanger@gmail.com>
Message-ID: <20200214001833.6a4c1a50@opendreambox.org>
In-Reply-To: <CAE=T-s7MvwX1Tx_=_GK82CHE3uo8hisCXGTrBB=LaNg_o-jOZQ@mail.gmail.com>
References: <20200210214211.2696-1-maxime.roussinbelanger@gmail.com>
	<fea6b9336e34c7df3cd23217cf2715b04fbd9ae6.camel@linuxfoundation.org>
	<CAE=T-s6CdNNZjqitGhYrAV8EiufQrPZJY8JLTmnPAEHC-sSHbQ@mail.gmail.com>
	<928575d17e93b117b6f555d674089560161d6c97.camel@linuxfoundation.org>
	<CAE=T-s6tXBA66zqe83-sib4m-JSXS++9sQ_m-D3a1KjU+-YcAw@mail.gmail.com>
	<CANNYZj8_fd=k95FA0VFF7ZjxuFVCU8V0HouxtLCNptdWLCMLpA@mail.gmail.com>
	<CAE=T-s7MvwX1Tx_=_GK82CHE3uo8hisCXGTrBB=LaNg_o-jOZQ@mail.gmail.com>
MIME-Version: 1.0
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] wpa-supplicant: add virtual supplicant
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 13 Feb 2020 23:26:07 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu, 13 Feb 2020 11:13:49 -0500
Maxime Roussin-B=C3=A9langer <maxime.roussinbelanger@gmail.com> wrote:

> On Thu, Feb 13, 2020 at 11:00 AM Alexander Kanavin <alex.kanavin@gmail.co=
m>
> wrote:
> >
> > On Thu, 13 Feb 2020 at 16:55, Maxime Roussin-B=C3=A9langer <
> maxime.roussinbelanger@gmail.com> wrote:
> >>
> >> PACKAGECONFIG[iwd] =3D "--enable-iwd, --disable-wifi, iwd, iwd"
> >> PACKAGECONFIG[wpa-supplicant] =3D "--enable-wifi, --disable-wifi,
> wpa-supplicant, wpa-supplicant"
> >
> >
> > The problem with this, is that enabling one but not the other will
> combine into '--enable-iwd --disable-wifi' which is not what is intended.
>=20
> Actually, it is what is intended, the `--disable-wifi` will disable
> wpa-supplicant support, but keep the wifi support from other plugins (i.e.
> iwd).
>=20
> I agree that maybe the `--enable-wifi` is probably not the best option
> name, but I am not sure I can something about it :)

It should be the user's responsibility (or the image recipe's) to choose the
wifi daemon, and it should be possible to uninstall one and install the oth=
er
from a package feed, or even to install both at the same time and use one f=
or
wlan0 and the other for wlan1.

Debian enables support for both daemons in connman and has the following
package metadata:

Recommends: wpasupplicant | iwd

I don't know whether there's a way to generate that line in OE. If not, you
could try to fake it by adding RPROVIDES_${PN} =3D "iwd-or-wpasupplicant" or
something similar to both daemon's recipes and recommending that in recipes
supporting both daemons.

Best regards,
Andreas

