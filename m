Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f175.google.com (mail-wi0-f175.google.com
	[209.85.212.175])
	by mail.openembedded.org (Postfix) with ESMTP id 4AC716AC33;
	Sun, 29 Mar 2015 00:28:22 +0000 (UTC)
Received: by wiaa2 with SMTP id a2so78162532wia.0;
	Sat, 28 Mar 2015 17:28:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=011WvXYHML4+DoL7HKhWHP3dgW0lnsxMu92BMm7h5Mw=;
	b=kdp6Qb5GRtdt42/ts/tYotB+cG5PQ3O/1RpgCawuGz+I+VsRUSvFCSZz2b4S89EbbE
	fuCW+/8OtEtnJT1Aaoan7CFtcqQn7QGM/y2qnJC3J6Bo2a2xq2lOCXLOHQgmKYBzllEu
	laL1E2yucHZizbWQX1QH6IyFvRep+BrLea9/O32EhgatuZ0PySNuM+kCnKPntwy528LT
	Oi4Hc8YksK3/y3HnPUkHXDFWGE0QGLs3kWVJ58atyQkGwD6qQq/CRn5WBO0677cqkg5z
	5/VJKzXLSHC6jbsgCwyRexh+QuksGSc4GGaPxYMBEInRECLwBeabhw9yUiVXGl7OBjQb
	vLHw==
X-Received: by 10.180.189.35 with SMTP id gf3mr9348562wic.5.1427588903627;
	Sat, 28 Mar 2015 17:28:23 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	cj9sm9101634wjc.42.2015.03.28.17.28.21
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 28 Mar 2015 17:28:22 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Sun, 29 Mar 2015 01:28:43 +0100
To: "Burton, Ross" <ross.burton@intel.com>
Message-ID: <20150329002843.GE2343@jama>
References: <20150316174236.48B8050234@opal.openembedded.org>
	<20150321021120.GF4738@jama>
	<1426930147.29168.104.camel@linuxfoundation.org>
	<20150321145504.GG4738@jama> <20150323222113.GD3904@jama>
	<CAJTo0LbTfKqs_se99op6w1eA0A4_QAM5VX9VVDYJYh6+1pnyzQ@mail.gmail.com>
	<20150325161208.GK3904@jama>
MIME-Version: 1.0
In-Reply-To: <20150325161208.GK3904@jama>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: OE-core <openembedded-core@lists.openembedded.org>,
	"openembedded-commits@lists.openembedded.org"
	<openembedded-commits@lists.openembedded.org>
Subject: Re: [oe-commits] Jonathan Liu : fontcache.bbclass: prepend to PACKAGEFUNCS instead of appending
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
X-List-Received-Date: Sun, 29 Mar 2015 00:28:25 -0000
X-Groupsio-MsgNum: 63803
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="76DTJ5CE0DCVQemd"
Content-Disposition: inline

--76DTJ5CE0DCVQemd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 25, 2015 at 05:12:08PM +0100, Martin Jansa wrote:
> On Wed, Mar 25, 2015 at 12:11:05PM +0000, Burton, Ross wrote:
> > On 23 March 2015 at 22:21, Martin Jansa <martin.jansa@gmail.com> wrote:
> >=20
> > > In my case it's reproducible by adding udev-ptest to image, more
> > > specifically
> > > having these 2 directories in rootfs:
> > > usr/lib/udev/ptest/test/sys/devices
> > > usr/lib/udev/ptest/test/sys/bus
> > >
> >=20
> > oe-core 3f799b should mean that those directories are in a tarball inst=
ead
> > of unpacked on the rootfs.  Do you have that commit?
>=20
> Oh, thanks for pointer. I was seeing the same issue in dizzy and master
> build, but this change can explain why I wasn't able to reproduce it in
> master yesterday.

I've found the reason why it was failing for me in master even with this
udev fix when building our internal images.

The problem is that we have fontconfig bbappend which sets:
WEBOS_FONTCONFIG_CACHE =3D "${datadir}/fontconfig/cache"
EXTRA_OECONF_append =3D " --with-cache-dir=3D${WEBOS_FONTCONFIG_CACHE}"

and this oe-core commit:
commit 23393c6685860d0b1c459874d35395360d0b6d3c
Author: Jonathan Liu <net147@gmail.com>
Date:   Mon Mar 9 13:28:37 2015 +1100

    postinst-intercepts/update_font_cache: fix ownership of fontconfig cache
=20
adds:
chown -R root:root $D${localstatedir}/cache/fontconfig

Which doesn't exist in our builds and chown and whole postinst
interceptor fails.

I'll send patch to make fontconfig cache dir configureable so that we
don't need to overlay fontcache.bbclass as well as
scripts/postinst-intercepts/update_font_cache

Thanks,

>=20
> > Ross
>=20
> --=20
> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com



--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--76DTJ5CE0DCVQemd
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlUXRzsACgkQN1Ujt2V2gBzC6wCdGoPzMMCjRy0YkZxK57r8WNjF
XsoAnijnQYK4/Rqb6Om11rSjXf5qDIGa
=bI2a
-----END PGP SIGNATURE-----

--76DTJ5CE0DCVQemd--
