Return-Path: <clopez@igalia.com>
Received: from smtp4.mundo-r.com (smtp3.mundo-r.com [212.51.32.191])
	by mail.openembedded.org (Postfix) with ESMTP id 62A7F76E4A
	for <openembedded-core@lists.openembedded.org>;
	Sat, 10 Oct 2015 21:45:44 +0000 (UTC)
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: A2BxBwD4hRlW/5tjdVteHAEBAYMHhw6oMItLhgqDEzKBWH8CgSA8EAEBAQEBAQGBCoQnAQEEI2YLGAkhAgIPSBMIAoguAa9mk18BCyCGc4R+gTODYReCUoFFBZYTgk6BYYhrnAM4K4IRHYFWPIgdAQEB
X-IPAS-Result: A2BxBwD4hRlW/5tjdVteHAEBAYMHhw6oMItLhgqDEzKBWH8CgSA8EAEBAQEBAQGBCoQnAQEEI2YLGAkhAgIPSBMIAoguAa9mk18BCyCGc4R+gTODYReCUoFFBZYTgk6BYYhrnAM4K4IRHYFWPIgdAQEB
X-IronPort-AV: E=Sophos;i="5.17,664,1437429600"; 
	d="asc'?scan'208";a="32310623"
Received: from fanzine.igalia.com ([91.117.99.155])
	by smtp4.mundo-r.com with ESMTP; 10 Oct 2015 23:45:44 +0200
Received: from maestria.local.igalia.com ([192.168.10.14] helo=mail.igalia.com)
	by fanzine.igalia.com with esmtps 
	(Cipher TLS1.0:RSA_AES_256_CBC_SHA1:32) (Exim) id 1Zl1xX-0001DL-SJ
	for <openembedded-core@lists.openembedded.org>;
	Sat, 10 Oct 2015 23:45:43 +0200
Received: from fanzine.local.igalia.com ([192.168.10.13] helo=[10.76.0.6])
	by mail.igalia.com with esmtps 
	(Cipher TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16) (Exim)
	id 1Zl1xX-0001MM-Mg for <openembedded-core@lists.openembedded.org>;
	Sat, 10 Oct 2015 23:45:43 +0200
To: openembedded-core@lists.openembedded.org
references: <20150514114002.GA2402@jama>
	<1444403489-29494-1-git-send-email-Martin.Jansa@gmail.com>
	<561900D1.5060906@igalia.com>
	<CA+chaQffPJOrTzmZRoxUAJ1LnixtbJHLtJ5wm7eJAWGiZxnpXg@mail.gmail.com>
From: Carlos Alberto Lopez Perez <clopez@igalia.com>
openpgp: id=B5D2B50BC48EC7F1EE90D9AB965089CE6B95F882;
	url=http://key.neutrino.es
x-enigmail-draft-status: N1110
organization: Igalia S.L.
message-id: <56198707.8@igalia.com>
Date: Sat, 10 Oct 2015 23:45:43 +0200
user-agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:38.0) Gecko/20100101 Icedove/38.0
mime-version: 1.0
in-reply-to: <CA+chaQffPJOrTzmZRoxUAJ1LnixtbJHLtJ5wm7eJAWGiZxnpXg@mail.gmail.com>
Subject: Re: [PATCH] webkitgtk, gcr, libsecret: force ARM mode
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
X-List-Received-Date: Sat, 10 Oct 2015 21:45:46 -0000
X-Groupsio-MsgNum: 72077
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature";
	boundary="6V4U55orQSP4jo6xBmChO94hcC39R4Qiw"

--6V4U55orQSP4jo6xBmChO94hcC39R4Qiw
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 10/10/15 17:32, Martin Jansa wrote:
> Did you enable thumb in that build? It's not enabled by default.
>=20
> ARM_INSTRUCTION_SET is for recipes to use arm when distro selects thumb=
 by
> default.

I assumed it was enabled by default if it was listed on the list printed
on TUNE_FEATURES when starting bitbake. Seems not.

I manually enabled it on the recipe of webkitgtk+ by setting
'ARM_INSTRUCTION_SET =3D "thumb"' and I was able to reproduce the build
failure.

However, later I tried doing the same for a standard armv7a machine and
it built fine.

qemuarm is arvm6 with thumb1, and any armv7 or newer machine will prefer
thumb2 instead. The compiler would automatically use thumb2 when
enabling -mthumb on a armv7 or newer march.

So, it built fine with -march=3Darmv7-a -mthumb

Given that most people building webkitgtk+ will use armv7 or newer, I
don't think disabling the possibility of building webkitgtk+ with thumb
(thumb2) unconditionally is a good idea.

I also tested to build gcr and libsecret. Both build also fine with
-mthumb on armv7.


So, could we set ARM_INSTRUCTION_SET=3Darm only for armv6 or older
machines in this 3 recipes?


--6V4U55orQSP4jo6xBmChO94hcC39R4Qiw
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2
Comment: You can fetch my GnuPG key from http://key.neutrino.es

iQIcBAEBCgAGBQJWGYcHAAoJEJZQic5rlfiCOhgP/06ox7y6cpri4EfhYl+74ifO
Vkh+jCygUJGvRtZrXMdEdfrHx7SqDj1B2c3n4rd3oUDIwQnqQYxHaHQAUkqXVEgU
KDzyDj6wUUvagTBtddBz6ctuhfUKdj0gFL73VAx9Zg4hB8J0uEAx1yuwrYT+S4RR
bRvZfG1rnNvExt8ISpwPhmBGuYU+xJyMmR+uWLsoh9Lxt6xeyyCoEG7Qr/cvEX10
ZK4RXhlYAVb34EjD9UYsZ4zF9QnScV9Q2gZ0u+d5SLwy68+uuTU37ZuTA3jOcpPU
BWxev6P6ZqfLCb1beqhXlib8p8IgCOFLQA3OfM9mXqv6JTH0jyxr3ZPptoawUOTF
fiQM94wqMPm1Bbf1twzQWXbbwq8GoIG3QcVTrfLNxTplTrnwte7xQowNejJY2cfD
Laqgds/CadxUmWQip/EM9+eqYb4F6EYfhwk1q2Ym98jkjyscJy6U1vyJ87spHYF9
mAgmZbWKtKHbW+3Ql3pah1ufDSlIq6WlDyh8SfkTzmmHgsLuecIxNHmBWMFm7tHt
z5OmmboZi42v38zDYZ1UMUw5AT2BOUhFWabQXm05aqEk4bixxfiR5J9O7Pb9qk6x
SwRhc+EUgjuxZ5Ycwg9uG9aKhHL+uYX19rNfLUcQrmlz6km2d5r6bx1RV19zaryc
bkgNoEggGoaDOrLH1S6B
=DI3I
-----END PGP SIGNATURE-----

--6V4U55orQSP4jo6xBmChO94hcC39R4Qiw--
