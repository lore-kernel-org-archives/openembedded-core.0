Received: from mail-wi0-f177.google.com ([209.85.212.177])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TddgG-00037m-Sf
	for openembedded-core@lists.openembedded.org;
	Wed, 28 Nov 2012 10:11:44 +0100
Received: by mail-wi0-f177.google.com with SMTP id c10so4426784wiw.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Nov 2012 00:57:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=vKnU9wnPOY/8Tr4eCeFQU1J5vB67v87sstAUO2VyT8U=;
	b=Ie3mqEvfL8yTTQJxjOMHMkasvP0DdIzSqvAoSr7ZeAI9kZLV3NCaw4Ol9ZBQfo3E0N
	39dJswz/ZcuHxT1CpCeB+qVCCOyaAwY2K2FhcTy7gRcLlwD4Od4RztLL8x5lB71riuz6
	/ZxlzVumCRu2QHNGO2cQK6eG271s/52tlu8VEfDz7iHXa+oK7nMzGXQUpzjJYodxPQSC
	jy6Ux6d4O3/HVJbW86uXDEW3E69sTNFdma+zHp1uL15ugayirWwT/oQ1+2ov97IhQF2e
	PrkVAC4cfzIBzymQMVDvgr3Wu0XK24lciViThRQ1qZE5secsFR+oU8E2Ek6+T+lnwAek
	KiBg==
Received: by 10.180.94.169 with SMTP id dd9mr31357449wib.14.1354093050857;
	Wed, 28 Nov 2012 00:57:30 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id d9sm6286897wiw.0.2012.11.28.00.57.29
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 28 Nov 2012 00:57:30 -0800 (PST)
Date: Wed, 28 Nov 2012 09:57:26 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: Mark Hatle <mark.hatle@windriver.com>
Message-ID: <20121128085726.GA3477@jama.jama.net>
References: <20121127182306.GE3692@jama.jama.net>
	<50B50A05.9020201@windriver.com>
MIME-Version: 1.0
In-Reply-To: <50B50A05.9020201@windriver.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: locale data broken in gstreamer
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
X-List-Received-Date: Wed, 28 Nov 2012 09:11:45 -0000
X-Groupsio-MsgNum: 31827
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="9amGYk9869ThD9tj"
Content-Disposition: inline

--9amGYk9869ThD9tj
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 27, 2012 at 12:44:21PM -0600, Mark Hatle wrote:
> On 11/27/12 12:23 PM, Martin Jansa wrote:
> > In last rebuild from scratch I've noticed couple of weird locale data:
>=20
> Paul E and I just observed this as well...  My build machine is an -old- =
FC13=20
> machine..  system we found it on was x86.

OK, the issue is triggered by:

commit 841ea3c1c18e50e77fccbd5f44d6a79a50913b67
Author: Richard Purdie <richard.purdie@linuxfoundation.org>
Date:   Thu Oct 11 08:43:01 2012 +0000

    autotools.bbclass: Fix gettext macro versions issues

Especially this part:
-if [ -d ${S}/po/ -a ! -e ${S}/po/Makefile.in.in ]; then
-     cp ${STAGING_DATADIR}/gettext/po/Makefile.in.in ${S}/po/
+if [ -d ${S}/po/ ]; then
+     cp ${STAGING_DATADIR}/gettext/po/Makefile.in.in ${S}/po/

And it influences gst* because they are hacking their po/Makefile.in.in in =
autogen.sh by this patch
http://cgit.freedesktop.org/gstreamer/common/commit/gettext.patch?id=3Dc81a=
d072c76522175cbddead96d6f3c448068d67

RP: do you remember why you removed "-e ${S}/po/Makefile.in.in" check?
I guess it was because it can be from older gettext version (in gstreamer=
=20
case 0.17 instead of our 0.18)

Is there some way to inject Makefile.in.in modification between this=20
gettext modifications and running autoreconf/configure? I don't see any=20
in run.do_configure, but I guess there is cleaner solution for upstream=20
to use.

As work around we can replace DOMAIN setting in po/Makevars in all gst* pac=
kages.

Cheers,
>=20
> --Mark
>=20
> > Collected errors:
> >   * check_data_file_clashes: Package gst-plugins-base-locale-en-gb wants
> >   * to install file /usr/share/locale/en_GB/LC_MESSAGES/.mo
> >          But that file is already provided by package  * gstreamer-loca=
le-en-gb
> >   * check_data_file_clashes: Package gst-plugins-base-locale-cs wants to
> >   * install file /usr/share/locale/cs/LC_MESSAGES/.mo
> >          But that file is already provided by package  * gstreamer-loca=
le-cs
> >
> > All gstreamer and gst-plugins-base locales package just .mo file.
> >
> > from log.do_install:
> > make[1]: Entering directory `/OE/shr-core/tmp-eglibc/work/armv4t-oe-lin=
ux-gnueabi/gstreamer/0.10.36-r1/gstreamer-0.10.36/po'
> > installing af.gmo as /OE/shr-core/tmp-eglibc/work/armv4t-oe-linux-gnuea=
bi/gstreamer/0.10.36-r1/image/usr/share/locale/af/LC_MESSAGES/.mo
> > installing az.gmo as /OE/shr-core/tmp-eglibc/work/armv4t-oe-linux-gnuea=
bi/gstreamer/0.10.36-r1/image/usr/share/locale/az/LC_MESSAGES/.mo
> > installing be.gmo as /OE/shr-core/tmp-eglibc/work/armv4t-oe-linux-gnuea=
bi/gstreamer/0.10.36-r1/image/usr/share/locale/be/LC_MESSAGES/.mo
> >
> > They are installed to $(DOMAIN).mo
> > gstreamer-0.10.36/po/Makefile.in.in:$(INSTALL_DATA) $$realcat $(DESTDIR=
)$$dir/$(DOMAIN).mo; \
> > gstreamer-0.10.36/po/Makefile.in.in:echo "installing $$realcat as $(DES=
TDIR)$$dir/$(DOMAIN).mo"; \
> >
> > and DOMAIN should be set to GETTEXT_PACKAGE (gstreamer-0.10)
> > ./gstreamer-0.10.36/po/Makevars:DOMAIN =3D $(GETTEXT_PACKAGE)
> > ./gstreamer-0.10.36/po/Makefile:DOMAIN =3D $(GETTEXT_PACKAGE)
> >
> > Anyone else seen this, any idea why it fails now? gst* recipes weren't =
changed lately IIRC,
> > so maybe some change in gettext which can break more recipes?
> >
> > Cheers,
> >
> >
> >
> > _______________________________________________
> > Openembedded-core mailing list
> > Openembedded-core@lists.openembedded.org
> > http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
> >
>=20
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--9amGYk9869ThD9tj
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlC10fYACgkQN1Ujt2V2gBxJ4ACgirkqd6CuFx/LvvZ2RtXS48N/
VHQAniPIwnby+oDxGSl0VOt5I869Yz7Q
=1aK4
-----END PGP SIGNATURE-----

--9amGYk9869ThD9tj--
