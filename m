Received: from mail-ea0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TdQ2A-0002m8-3V
	for openembedded-core@lists.openembedded.org;
	Tue, 27 Nov 2012 19:37:27 +0100
Received: by mail-ea0-f175.google.com with SMTP id h11so4862828eaa.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Nov 2012 10:23:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:mime-version:content-type
	:content-disposition:user-agent;
	bh=Y5khD/ou1KwVA06jiFpD70b3Ya0M9UHNBNq/dDqY5aM=;
	b=WQGajgBYYW+9cJ4DWroyHtPwJTgjk1vOE2OJPS5vQCp1YoTQ5skjw7UJZSVeWcMyXk
	Ih67ZtW9tJMi0DQ21dIL3PSC1S+j9tCzkGUuDte6LxrdhK6odZBpaCjAZEF35xBqET+n
	Jnt83WedkffXU1mEjjtWAoy74p0Fbzo4+nfGuis+hAhU1AE0fcQMNEGkzG0yXIp8+Jpl
	h6CU3vJqM5Hmm6G7DL8CsLS7/yIxmB019ujQxCiGw35XIePg1zToPPMnpHj1pNnIpCau
	Wj8pmVp9lPhwtrTFiaSob5LDGHeEVrnaSyJ2qnK2nDwnSC9a9Yt/1Xtkx+Fj1zKcvVR2
	sKyA==
Received: by 10.14.3.195 with SMTP id 43mr60589940eeh.36.1354040592810;
	Tue, 27 Nov 2012 10:23:12 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id 46sm42155275eeg.4.2012.11.27.10.23.11
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 27 Nov 2012 10:23:12 -0800 (PST)
Date: Tue, 27 Nov 2012 19:23:06 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Message-ID: <20121127182306.GE3692@jama.jama.net>
MIME-Version: 1.0
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: locale data broken in gstreamer
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
X-List-Received-Date: Tue, 27 Nov 2012 18:37:27 -0000
X-Groupsio-MsgNum: 31802
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="/unnNtmY43mpUSKx"
Content-Disposition: inline

--/unnNtmY43mpUSKx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

In last rebuild from scratch I've noticed couple of weird locale data:

Collected errors:
 * check_data_file_clashes: Package gst-plugins-base-locale-en-gb wants
 * to install file /usr/share/locale/en_GB/LC_MESSAGES/.mo
        But that file is already provided by package  * gstreamer-locale-en=
-gb
 * check_data_file_clashes: Package gst-plugins-base-locale-cs wants to
 * install file /usr/share/locale/cs/LC_MESSAGES/.mo
        But that file is already provided by package  * gstreamer-locale-cs

All gstreamer and gst-plugins-base locales package just .mo file.

=66rom log.do_install:
make[1]: Entering directory `/OE/shr-core/tmp-eglibc/work/armv4t-oe-linux-g=
nueabi/gstreamer/0.10.36-r1/gstreamer-0.10.36/po'
installing af.gmo as /OE/shr-core/tmp-eglibc/work/armv4t-oe-linux-gnueabi/g=
streamer/0.10.36-r1/image/usr/share/locale/af/LC_MESSAGES/.mo
installing az.gmo as /OE/shr-core/tmp-eglibc/work/armv4t-oe-linux-gnueabi/g=
streamer/0.10.36-r1/image/usr/share/locale/az/LC_MESSAGES/.mo
installing be.gmo as /OE/shr-core/tmp-eglibc/work/armv4t-oe-linux-gnueabi/g=
streamer/0.10.36-r1/image/usr/share/locale/be/LC_MESSAGES/.mo

They are installed to $(DOMAIN).mo
gstreamer-0.10.36/po/Makefile.in.in:$(INSTALL_DATA) $$realcat $(DESTDIR)$$d=
ir/$(DOMAIN).mo; \
gstreamer-0.10.36/po/Makefile.in.in:echo "installing $$realcat as $(DESTDIR=
)$$dir/$(DOMAIN).mo"; \

and DOMAIN should be set to GETTEXT_PACKAGE (gstreamer-0.10)
=2E/gstreamer-0.10.36/po/Makevars:DOMAIN =3D $(GETTEXT_PACKAGE)
=2E/gstreamer-0.10.36/po/Makefile:DOMAIN =3D $(GETTEXT_PACKAGE)

Anyone else seen this, any idea why it fails now? gst* recipes weren't chan=
ged lately IIRC,=20
so maybe some change in gettext which can break more recipes?

Cheers,

--/unnNtmY43mpUSKx
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlC1BQoACgkQN1Ujt2V2gByveACfdIhETKVmxT4fkb8cEQXjW7lh
17QAn2Fg43C8/n5XfSoiQoDNqWJo13QZ
=l3WN
-----END PGP SIGNATURE-----

--/unnNtmY43mpUSKx--
