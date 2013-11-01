Return-Path: <martin.jansa@gmail.com>
Received: from mail-ea0-f182.google.com (mail-ea0-f182.google.com
	[209.85.215.182])
	by mail.openembedded.org (Postfix) with ESMTP id C21AF6D12B
	for <openembedded-core@lists.openembedded.org>;
	Fri,  1 Nov 2013 09:38:59 +0000 (UTC)
Received: by mail-ea0-f182.google.com with SMTP id o10so1950329eaj.13
	for <openembedded-core@lists.openembedded.org>;
	Fri, 01 Nov 2013 02:39:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=IWfYNptwAkScDtzDh654LtfJO2S2yzmGhoop4ftpJMI=;
	b=cc7ldxiGdz7ShPCXnC/tIceYRXTYcZq+gMxG5wmBHa9IDxxCYrEIvKrrv1zPxcCtD2
	LbzwqvIb1UPL/JdThZKhdng5qXhZVr1j2ONm47qzYXkmR6O2zHnAybUIZupHbVxTQi5U
	Ox20kdx1wOszBP4qqYcxKawThp+t1aDJNzatuModiATQnVZK4TTDMEv4j4P77rwIc/a3
	OSTSZKawLkYgF04weRZYqu2tftg+Ck6vmfHVi8Zlc2RKGxzU6oaKk10gTLE7yUUWyc9r
	wAgv/uTFzkoINxqOc55Jbf3f2YdFebAFqj3qFKtiD9/ERCLWa7+U1Ra0b1caKW1JApG0
	T3Hg==
X-Received: by 10.14.193.198 with SMTP id k46mr598823een.128.1383298741223;
	Fri, 01 Nov 2013 02:39:01 -0700 (PDT)
Received: from localhost (ip-89-176-104-107.net.upcbroadband.cz.
	[89.176.104.107])
	by mx.google.com with ESMTPSA id j7sm5419064eeo.15.2013.11.01.02.39.00
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 01 Nov 2013 02:39:00 -0700 (PDT)
Date: Fri, 1 Nov 2013 10:39:03 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Message-ID: <20131101093903.GO32015@jama>
References: <cover.1383214870.git.hongxu.jia@windriver.com>
	<0ab98fd1823d92b6661b60432b3ec30fd9c9a03d.1383214870.git.hongxu.jia@windriver.com>
	<20131031104111.GI32015@jama> <52724411.9050909@windriver.com>
	<1383295856.25877.124.camel@ted>
MIME-Version: 1.0
In-Reply-To: <1383295856.25877.124.camel@ted>
User-Agent: Mutt/1.5.22 (2013-10-16)
Cc: openembedded-core@lists.openembedded.org, saul.wold@intel.com
Subject: Re: [PATCH 1/1] qemu: use PACKAGECONFIG to address nss dependencies
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
X-List-Received-Date: Fri, 01 Nov 2013 09:39:00 -0000
X-Groupsio-MsgNum: 46493
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="8N0TQpGUCeEQshoq"
Content-Disposition: inline

--8N0TQpGUCeEQshoq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 01, 2013 at 08:50:56AM +0000, Richard Purdie wrote:
> On Thu, 2013-10-31 at 19:50 +0800, Hongxu Jia wrote:
> > On 10/31/2013 06:41 PM, Martin Jansa wrote:
> > > On Thu, Oct 31, 2013 at 06:23:01PM +0800, Hongxu Jia wrote:
> > >> Use PACKAGECONFIG to explicitly address nss dependencies rather than
> > >> tested by configure.
> > >>
> > >> It avoided potential errors while multiple builds shared a common
> > >> state_cache.
> > > There are more floating dependencies in qemu.inc, see
> > > http://patchwork.openembedded.org/patch/56935/
> > >
> > > and even this list isn't complete, there is also:
> > > WARN: packages/armv5te-oe-linux-gnueabi/qemu/qemu/latest lost depende=
ncy on  cairo gdk-pixbuf gnutls gtk+ libvte
> > >
> > > Can you please improve it to fix them all?
> > >
> >=20
> > OK, I will try to fix them as possible as I can.
> >=20
> > Drop this patch, wait for V2.
>=20
> Part of the problem here is that qemu-native has some "floating"
> dependencies by design. If the native system has graphics support, qemu
> will have too. If it doesn't it won't have. This works out to be quite
> useful for people. Some people have headless build machines they don't
> want to install X on, equally some have build machines which do have X
> and they do want graphical qemu.
>=20
> How do we support both?

Aren't reproducible builds more important than automagically enabled
graphics support, what if such automagically enabled qemu-native gets
reused from sstate on headless server without graphics support?

We can extend documentation to say that in order to enable graphics
support for qemu-native you need to set
PACKAGECONFIG_pn-qemu-native +=3D "foo bar"
in local.conf (or to remove some to disable it, but enabling explicitly
is imho better because we don't have graphics native support in
ASSUME_PROVIDED).

Regards,

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--8N0TQpGUCeEQshoq
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlJzdrcACgkQN1Ujt2V2gByKVACfSl9WdU9eXaHr3xMOV+VNVgLv
RYkAnR0wV5djBTl++OS2MLrrpaOi0P0s
=sF7E
-----END PGP SIGNATURE-----

--8N0TQpGUCeEQshoq--
