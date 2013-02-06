Received: from mail-da0-f53.google.com ([209.85.210.53])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>)
	id 1U3Zq9-00086g-A0; Thu, 07 Feb 2013 23:21:09 +0100
Received: by mail-da0-f53.google.com with SMTP id r13so23478daj.12
	for <multiple recipients>; Thu, 07 Feb 2013 14:05:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=T1OEC0zSeXYR/1xCQYceID8fzudR2J6Mt+9Blm/D/8g=;
	b=H6rcCimoErzwzoNK3Z7xpmyYkMoPWFlQzF24i1nXmjzYf7wLoMy8aJ1MOsqen3VuWZ
	E+DgXb5a6HffByEE1xQNIJp3a2dmxjPl3enihPuaoGeGCYqCa5KaLx/zcq3X92aFxM4t
	Xc8W2NiniL0A/kK3LNHmigFY+O3wKiiR4afJqjbbKB/32it6DvKKZs9nYcRbIM2v3c17
	CxuKGBinQQFEi/ZnyuC6hADYmjyGZZCJkkPDVYy3epjEzQ6ZFXDiYGadOz8ywMHREc20
	bz6aO5iOvt+iODRWgxDVDm08gY6C+qZurtmZBxNVgHX0beabaGozDVyX8nazB4AsG9Jp
	jgtw==
X-Received: by 10.66.74.197 with SMTP id w5mr79553264pav.60.1360193657728;
	Wed, 06 Feb 2013 15:34:17 -0800 (PST)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id w2sm35651667pax.22.2013.02.06.15.34.15
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Wed, 06 Feb 2013 15:34:16 -0800 (PST)
Date: Thu, 7 Feb 2013 00:34:09 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: Laurentiu Palcu <laurentiu.palcu@intel.com>
Message-ID: <20130206233409.GJ3271@jama>
References: <20130206093802.16EA32097@opal> <20130206115620.GT3271@jama>
	<511247C9.2010505@intel.com> <20130206211710.GC3271@jama>
MIME-Version: 1.0
In-Reply-To: <20130206211710.GC3271@jama>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-commits@lists.openembedded.org,
	openembedded-core@lists.openembedded.org
Subject: Re: [oe-commits] Laurentiu Palcu : add fontcache.bbclass
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 07 Feb 2013 22:21:09 -0000
X-Groupsio-MsgNum: 35130
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="J9fO++IT6debZ01Z"
Content-Disposition: inline

--J9fO++IT6debZ01Z
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 06, 2013 at 10:17:10PM +0100, Martin Jansa wrote:
> On Wed, Feb 06, 2013 at 02:08:41PM +0200, Laurentiu Palcu wrote:
> >=20
> >=20
> > On 02/06/2013 01:56 PM, Martin Jansa wrote:
> > > Fails in do_rootfs here, but without any details in log:
> > > Building from feeds activated!
> > > Running intercept scripts:
> > >> > Executing update_font_cache
> > > ERROR: Function failed: do_rootfs (see
> > > /OE/shr-core/tmp-eglibc/work/tuna-oe-linux-gnueabi/shr-image/2.0-r20/=
temp/log.do_rootfs.2236
> > > for further information)
> > >=20
> > Most probably fontconfig package was not rebuilt with the new sysroot
> > feature. Can you run the native fc-cache with --help and look for a
> > sysroot option? If it's there, than it's probably a qemu issue... :/
>=20
> It fails only on some machines I'm building (3 machines from 6) and only =
sometimes (last run it was only on 2 from 6)
>=20
> Now I was running it manually and got nice error finally:
> Running intercept scripts:
> > Executing update_font_cache
> readelf: Error:
> '/OE/shr-core/tmp-eglibc/work/tuna-oe-linux-gnueabi/shr-image/2.0-r20/roo=
tfs/usr/bin/fc-cache':
> No such file
> ERROR: intercept script "update_font_cache" failed!
>=20
> So something is pulling interceptor without runtime dependency on
> fontconfig.

In the end it wasn't fs-cache missing, but
/usr/bin/crossscripts/qemuwrapper in some sysroots

bitbake -c cleansstate qemuwrapper-cross
for each MACHINE and building it again resolved that..

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--J9fO++IT6debZ01Z
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlES6HEACgkQN1Ujt2V2gBydBACfUbHBvNXZ59C1m6zetmQepTgh
pMQAn1kdwdjSQajNCzOJeQ7fXZquM1pv
=PPcS
-----END PGP SIGNATURE-----

--J9fO++IT6debZ01Z--
