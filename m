Return-Path: <prvs=024cf7ccd=Mikko.Rapeli@bmw.de>
Received: from esa4.bmw.c3s2.iphmx.com (esa4.bmw.c3s2.iphmx.com
	[68.232.139.62])
	by mail.openembedded.org (Postfix) with ESMTP id 733A57DE64
	for <openembedded-core@lists.openembedded.org>;
	Wed,  8 May 2019 14:22:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=bmw.de; i=@bmw.de; q=dns/txt; s=mailing1;
	t=1557325356; x=1588861356;
	h=from:to:cc:subject:date:message-id:references:
	in-reply-to:content-id:content-transfer-encoding: mime-version;
	bh=6OIIK8//GBZpLWQJoUIoObITb0s6WHfEClsKZJX/jw4=;
	b=DEipC3noQVt5XeRGVls0PtFJDIGi2IapDCGvmChkaB+JAd8ojK8sGFgr
	xedV19pT78KGgG+DqDXIi0kzyUCiqKB4SEzjw9EyyFgu1OXuKU7zQycc9
	6rkrmhjS7RlgKdUCkV7WEUO+y5nwy800ZCMkYkPaYxxE6WG54nuPzOVvj A=;
Received: from esagw3.bmwgroup.com (HELO esagw3.muc) ([160.46.252.35]) by
	esa4.bmw.c3s2.iphmx.com with ESMTP/TLS; 08 May 2019 16:22:34 +0200
Received: from esabb4.muc ([160.50.100.33])  by esagw3.muc with ESMTP/TLS;
	08 May 2019 16:22:33 +0200
Received: from smucm10k.bmwgroup.net (HELO smucm10k.europe.bmw.corp)
	([160.48.96.47])
	by esabb4.muc with ESMTP/TLS; 08 May 2019 16:22:33 +0200
Received: from smucm10k.europe.bmw.corp (160.48.96.47) by
	smucm10k.europe.bmw.corp
	(160.48.96.47) with Microsoft SMTP Server (TLS;
	Wed, 8 May 2019 16:22:33 +0200
Received: from smucm10k.europe.bmw.corp ([160.48.96.47]) by
	smucm10k.europe.bmw.corp ([160.48.96.47]) with mapi id 15.00.1473.004;
	Wed, 8 May 2019 16:22:32 +0200
From: <Mikko.Rapeli@bmw.de>
To: <bunk@stusta.de>
Thread-Topic: [OE-core] [PATCH 2/2] openssh: usable sshd depends on rngd from
	rng-tools
Thread-Index: AQHVBaGpALdn5Btobk+wHBWkPPApHaZhIdoAgAAETgA=
Date: Wed, 8 May 2019 14:22:32 +0000
Message-ID: <20190508142232.GC3459@hiutale>
References: <1557321969-28686-1-git-send-email-mikko.rapeli@bmw.de>
	<1557321969-28686-2-git-send-email-mikko.rapeli@bmw.de>
	<20190508140708.GC25917@localhost>
In-Reply-To: <20190508140708.GC25917@localhost>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [192.168.221.40]
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 2/2] openssh: usable sshd depends on rngd from rng-tools
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
X-List-Received-Date: Wed, 08 May 2019 14:22:33 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-ID: <27A2CA8CC5A7D843B77525DE22CE2C3F@bmwmail.corp>
Content-Transfer-Encoding: quoted-printable

On Wed, May 08, 2019 at 05:07:08PM +0300, Adrian Bunk wrote:
> On Wed, May 08, 2019 at 04:26:09PM +0300, Mikko Rapeli wrote:
> > Since openssl 1.1.1 and openssh which uses it, sshd
> > startup is delayed. The delays range from few seconds
> > to minutes and even to hours. The delays are visible
> > in host keys generation and when sshd process is started
> > in response to incoming TCP connection but is failing
> > to provide SSH version string and clients or tests time out.
> >=20
> > In all cases traces show that sshd is waiting for getentropy()
> > system call to return from Linux kernel, which returns only
> > after kernel side random number pool is initialized. The pool
> > is initialized via various entropy source which may be
> > missing on embedded development boards or via rngd from
> > rng-tools package from userspace. HW random number generation
> > and kernel support help but rngd is till needed to feed that data
> > back to the Linux kernel.
> >=20
> > Example from an NXP imx8 board shows that kernel random number pool
> > initialization can take over 400 seconds without rngd,
> > and with rngd it is initialized at around 4 seconds after boot.
> > The completion of initialization is visible in kernel dmesg with line
> > "random: crng init done".
> >...
> > --- a/meta/recipes-connectivity/openssh/openssh_7.9p1.bb
> > +++ b/meta/recipes-connectivity/openssh/openssh_7.9p1.bb
> > @@ -148,6 +148,7 @@ FILES_${PN}-keygen =3D "${bindir}/ssh-keygen"
> > =20
> >  RDEPENDS_${PN} +=3D "${PN}-scp ${PN}-ssh ${PN}-sshd ${PN}-keygen"
> >  RDEPENDS_${PN}-sshd +=3D "${PN}-keygen ${@bb.utils.contains('DISTRO_FE=
ATURES', 'pam', 'pam-plugin-keyinit pam-plugin-loginuid', '', d)}"
> > +RDEPENDS_${PN}-sshd +=3D "rng-tools"
> >...
>=20
> This should only be an RRECOMMENDS so that people can opt out of it.
>=20
> E.g. CONFIG_RANDOM_TRUST_CPU in the kernel can solve the same=20
> problem without using rng-tools on some platforms.

I think this is a stronger dependency than just RRECOMMENDS. We build
images and disable recommends but we care that sshd starts as fast as in
sumo and earlier yocto releases for testing etc purposes.

-Mikko=

