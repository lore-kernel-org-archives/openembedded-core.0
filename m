Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TR05e-0005F5-3V
	for openembedded-core@lists.openembedded.org;
	Wed, 24 Oct 2012 14:29:42 +0200
Received: by mail-we0-f175.google.com with SMTP id t44so211029wey.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Oct 2012 05:16:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:mime-version:content-type
	:content-disposition:user-agent;
	bh=hGI6ys8DlW4QRtWBf3qi0khqlEOao4nlArJtK36OZzs=;
	b=fKyV3HSkTlYceiEqoJlF8YP/xah03TIzbt8YqfvgmMzeELfXx5IvHlWEiwXVTFA50Z
	IaSglBYNzGUkBhQhSLlvwQbuDxo3ZSEHqV/DPFLcWF75Nppr4yjLGd+qR3ZPd+8qEq+B
	Ea1pn+gngVGWaZLYWMO1bJghn0C10iXGEAIkCTbixwVd1IkmIm+6zJ+cyfdoMgWW/NvT
	/eV6YZBPpgdDbceaDp+xQOyDqm+2aMoYCRb7mmca4/rBqakfmnqcpsYdoSEYuqOM0kWb
	9dJ6rdaSw+KXvdeXXOfx7yygLggVprprWpprZnoVYKwXaqoCY7y88ANUyqYC3e9BOQUA
	sTaQ==
Received: by 10.216.141.38 with SMTP id f38mr9825734wej.196.1351080974820;
	Wed, 24 Oct 2012 05:16:14 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id v3sm4629850wiy.5.2012.10.24.05.16.10
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 24 Oct 2012 05:16:12 -0700 (PDT)
Date: Wed, 24 Oct 2012 14:16:29 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20121024121629.GE3269@jama.jama.net>
MIME-Version: 1.0
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: gconf-native backends broken when reused from sstate?
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
X-List-Received-Date: Wed, 24 Oct 2012 12:29:42 -0000
X-Groupsio-MsgNum: 30929
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="xd7ZVmXU2EjaW0+X"
Content-Disposition: inline

--xd7ZVmXU2EjaW0+X
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

When building foxtrotgps I get this error:

| GCONF_CONFIG_SOURCE=3Dxml:merged:/OE/jansa-test/shr-core/tmp-eglibc/sysro=
ots/x86_64-linux/etc/gconf/gconf.xml.defaults \
| /OE/shr-core/tmp-eglibc/sysroots/x86_64-linux/usr/bin/gconftool-2 --makef=
ile-install-rule apps_foxtrotgps.schemas
|  /bin/mkdir -p '/OE/shr-core/tmp-eglibc/work/armv4t-oe-linux-gnueabi/foxt=
rotgps-1.1.1-r1/image/usr/share/foxtrotgps'
|
| (gconftool-2:13082): GConf-CRITICAL **: No such file `/OE/jansa-test/shr-=
core/tmp-eglibc/work/x86_64-linux/gconf-native-3.2.3-r12/GConf-3.2.3/gconf/=
=2E./backends/.libs/libgconfbackend-xml.so'
|
|
| (gconftool-2:13082): GConf-WARNING **: Failed to load source "xml:merged:=
/OE/jansa-test/shr-core/tmp-eglibc/sysroots/x86_64-linux/etc/gconf/gconf.xm=
l.defaults": Failed: Couldn't locate backend module for `xml:merged:/OE/jan=
sa-test/shr-core/tmp-eglibc/sysroots/x86_64-linux/etc/gconf/gconf.xml.defau=
lts'

First path points to wrong sysroot (/OE/jansa-test/shr-core is used only
on builder from where i get sstate-cache with SSTATE_MIRROR) and the
other paths to backends are using even WORKDIR.

It's not really foxtrotgps fault:
sysroots/x86_64-linux/usr/bin/gconftool-2 --get-default-source
xml:merged:/OE/jansa-test/shr-core/tmp-eglibc/sysroots/x86_64-linux/etc/gco=
nf/gconf.xml.defaults

Anyone seen this?

Cheers,

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--xd7ZVmXU2EjaW0+X
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlCH3B0ACgkQN1Ujt2V2gBzRLQCfTXS6CKhux1jeNqAI2FV3SOlu
sOgAniEW5/Na4sE11At6zdg1DBwjeuYe
=Ey1n
-----END PGP SIGNATURE-----

--xd7ZVmXU2EjaW0+X--
