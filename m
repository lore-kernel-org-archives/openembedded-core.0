Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f48.google.com (mail-pa0-f48.google.com
	[209.85.220.48])
	by mail.openembedded.org (Postfix) with ESMTP id A41D5767F3
	for <openembedded-core@lists.openembedded.org>;
	Sun,  9 Aug 2015 00:55:01 +0000 (UTC)
Received: by pabyb7 with SMTP id yb7so80704926pab.0
	for <openembedded-core@lists.openembedded.org>;
	Sat, 08 Aug 2015 17:55:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:mime-version:content-type:from:in-reply-to:date:cc
	:message-id:references:to;
	bh=5/6UfR1m7vYRqVLm4EmVr58KYIGeOXbK7VFcBH9M9fE=;
	b=DqLZvkONAOXdm3TEe7hdsUcyHM+KK5alBMfCU0ZfraxpbEiVjQ+YZaCck7zP5f1Z2Y
	i93skha7a+1jQ5iJ8eBDFAyMHhGUiRuDWOeocCvSzKexQPzGNIgpBm90w8TaCVRYFKhq
	eHHH4+bWxLdI++XzBaHKHP3oOu0xS2SV8y6GfRH5kkfbvH6sZW3/E8eZDk3cR+s91BPC
	XNrxPd4evpb9qU/Yl6FhdqFNSlOpd7MB4RyafDs1I/YkH6iwqnJ5aCuqfg2FZvlhQbi7
	U+sEwLfihadAiQxWtpoHLUGJymAw0txNwmG5QVCopv1AqAUQoojS8C9O7w6hL0YKHha4
	bONA==
X-Received: by 10.66.222.103 with SMTP id ql7mr29952429pac.144.1439081701704; 
	Sat, 08 Aug 2015 17:55:01 -0700 (PDT)
Received: from ?IPv6:2601:646:8601:4580:61b5:b56b:3665:2b08?
	([2601:646:8601:4580:61b5:b56b:3665:2b08])
	by smtp.gmail.com with ESMTPSA id
	do2sm14176462pbc.53.2015.08.08.17.55.00
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sat, 08 Aug 2015 17:55:01 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 8.2 \(2104\))
X-Pgp-Agent: GPGMail 2.5
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <55B85B15.4090801@windriver.com>
Date: Sat, 8 Aug 2015 17:54:55 -0700
Message-Id: <E7B4AD74-BCA2-46C7-AC95-3CF49A5E7FAF@gmail.com>
References: <cover.1438074152.git.liezhi.yang@windriver.com>
	<5f7249878baba13ed53de7fd5cc5a160a690d505.1438074152.git.liezhi.yang@windriver.com>
	<55B85B15.4090801@windriver.com>
To: Robert Yang <liezhi.yang@windriver.com>
X-Mailer: Apple Mail (2.2104)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 3/3] builder: fix USERADD_PARAM
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
X-List-Received-Date: Sun, 09 Aug 2015 00:55:05 -0000
X-Groupsio-MsgNum: 69162
Content-Type: multipart/signed;
	boundary="Apple-Mail=_B778F0CD-8934-4289-A66C-AE45D8FDBF24";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_B778F0CD-8934-4289-A66C-AE45D8FDBF24
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8


> On Jul 28, 2015, at 9:48 PM, Robert Yang <liezhi.yang@windriver.com> =
wrote:
>=20
> Hello,
>=20
> I updated this patch a little, we also need update the chown command:
>=20
>  git://git.openembedded.org/openembedded-core-contrib rbt/useradd
>=20
>=20
> diff --git a/meta/recipes-graphics/builder/builder_0.1.bb =
b/meta/recipes-graphics/builder/builder_0.1.bb
> index 78d41e5..bb729fc 100644
> --- a/meta/recipes-graphics/builder/builder_0.1.bb
> +++ b/meta/recipes-graphics/builder/builder_0.1.bb
> @@ -21,13 +21,13 @@ USERADD_PACKAGES =3D "${PN}"
> USERADD_PARAM_${PN} =3D "--system --create-home \
>                        --groups video,tty,audio \
>                        --password ${BUILDER_PASSWORD} \
> -                       --user-group ${PN}"
> +                       --user-group builder=E2=80=9D

you could use BPN

>=20
> do_install () {
>        install -d -m 755 ${D}${sysconfdir}/mini_x/session.d
>        install -p -m 755 builder_hob_start.sh =
${D}${sysconfdir}/mini_x/session.d/
>=20
> -       chown  ${PN}.${PN} =
${D}${sysconfdir}/mini_x/session.d/builder_hob_start.sh
> +       chown  builder.builder =
${D}${sysconfdir}/mini_x/session.d/builder_hob_start.sh
>         install -p -m 755 please_wait_dialog.py =
${D}${sysconfdir}/mini_x
> }
>=20
> // Robert
>=20
> On 07/28/2015 05:03 PM, Robert Yang wrote:
>> When build lib32-builder, it would create the user lib32-builder =
which
>> was incorrect.
>>=20
>> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
>> ---
>>  meta/recipes-graphics/builder/builder_0.1.bb |    2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>=20
>> diff --git a/meta/recipes-graphics/builder/builder_0.1.bb =
b/meta/recipes-graphics/builder/builder_0.1.bb
>> index 78d41e5..d87d0e9 100644
>> --- a/meta/recipes-graphics/builder/builder_0.1.bb
>> +++ b/meta/recipes-graphics/builder/builder_0.1.bb
>> @@ -21,7 +21,7 @@ USERADD_PACKAGES =3D "${PN}"
>>  USERADD_PARAM_${PN} =3D "--system --create-home \
>>                         --groups video,tty,audio \
>>                         --password ${BUILDER_PASSWORD} \
>> -                       --user-group ${PN}"
>> +                       --user-group builder"
>>=20
>>  do_install () {
>>  	install -d -m 755 ${D}${sysconfdir}/mini_x/session.d
>>=20
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core


--Apple-Mail=_B778F0CD-8934-4289-A66C-AE45D8FDBF24
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAlXGpOMACgkQuwUzVZGdMxRNEACgkZwvueoX7W0AfXBIXy8r0LtC
jmUAniU/Q0b9YTCUdBLslgX8sQPoNzOY
=Jr6L
-----END PGP SIGNATURE-----

--Apple-Mail=_B778F0CD-8934-4289-A66C-AE45D8FDBF24--
