Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TBLde-0003z4-A0
	for openembedded-core@lists.openembedded.org;
	Tue, 11 Sep 2012 10:16:06 +0200
Received: by eaad12 with SMTP id d12so87585eaa.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Sep 2012 01:03:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:mime-version:content-type
	:content-disposition:user-agent;
	bh=yupKg1qABOVn5t5XO2iTKi0GskPBwRBPsk7eMIiQACw=;
	b=wlR1nX/j9N8bJI45tGkeYqkBWBlqyFjR0HYeSee+/3OHBGg6kLMj+W5PMuIHPr6oD3
	YJB+UPvg/Pio8vT7En6tl3FQ3lFQHD7Cbvo67gbo5w31YXDtDDT+0hiyfhWovoVH4Dpt
	RZ3QoqkpR6TM8XeJKe91jy1PNNk7VcqBKQ8e1NF1/mKjXJQ41uv1LsyFW39HYavxnlJ7
	klhL1656DAG53Jbubc9C5foNYjNzmB3hPOOVkmHpEe0Ufjk4/F8QdwKYuQ4UhCX625TN
	v9tgKsnOWgiWCXlav2Tkg5fZ6XIUBAOBIWgZn9emhU9SsH1a5nZEFkKrLIm/lNk7fIhf
	aEnQ==
Received: by 10.204.152.6 with SMTP id e6mr4312752bkw.85.1347350615705;
	Tue, 11 Sep 2012 01:03:35 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id n17sm8549995bks.6.2012.09.11.01.03.33
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 11 Sep 2012 01:03:34 -0700 (PDT)
Date: Tue, 11 Sep 2012 10:03:34 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Message-ID: <20120911080334.GD3465@jama.jama.net>
MIME-Version: 1.0
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: DEPENDS_virtclass-native = "libpng jpeg" not extended to libpng-native jpeg-native
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
X-List-Received-Date: Tue, 11 Sep 2012 08:16:06 -0000
X-Groupsio-MsgNum: 29010
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="H1spWtNR+x+ondvy"
Content-Disposition: inline

--H1spWtNR+x+ondvy
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

in meta-openembedded/meta-oe/recipes-extended/libwmf/libwmf_0.2.8.4.bb:

DEPENDS_virtclass-native =3D "libpng jpeg"
DEPENDS =3D "libpng jpeg expat gtk+"

BBCLASSEXTEND =3D "native"

Did it work (at least at some point of time) that DEPENDS for
libwmf-native were expanded to libpng-native and jpeg-native?

Because now it does not:
OE tuna@shr ~/shr-core $ bitbake-diffsigs
stamps.1347348593/nokia900/x86_64-linux/libwmf-native-0.2.8.4-r1.do_configu=
re.sigdata.315a83efebb27040d6bf0aaead16671e
stamps.1347348593/om-gta02/x86_64-linux/libwmf-native-0.2.8.4-r1.do_configu=
re.sigdata.0f8349ada0c8a18a6d6ed7b7841ec955
Hash for dependent task libpng_1.2.49.bb.do_populate_sysroot changed
=66rom 640001ee0530e51ef0aefb300c34f7dd to 7ba7d74a27e1e0af253ddac00a2be1c2
Hash for dependent task libjpeg-turbo_svn.bb.do_populate_sysroot changed
=66rom 3fe6eae3a6fd1af40233d548680c5bab to ff852ac3d5e826ff74e68b5ddc4ac3e1

So native recipe depending on target checksum -> rebuilding with each
MACHINE switch.

I can fix it by:
DEPENDS_virtclass-native =3D "libpng-native jpeg-native"
but maybe there is more cases like this and this could be checked by
native.bbclass or something like that.

Cheers,

--H1spWtNR+x+ondvy
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlBO8FYACgkQN1Ujt2V2gBzLogCfWhQp8T1CzOpOGWvW97M1KJnm
I4YAoIQ8m2zGxMlyES1Z9K5siJPrqvFF
=Flet
-----END PGP SIGNATURE-----

--H1spWtNR+x+ondvy--
