Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1RZfJT-0000Qs-Ex
	for openembedded-core@lists.openembedded.org;
	Sun, 11 Dec 2011 10:03:16 +0100
Received: by wgbds11 with SMTP id ds11so7623676wgb.24
	for <openembedded-core@lists.openembedded.org>;
	Sun, 11 Dec 2011 00:56:19 -0800 (PST)
Received: by 10.216.14.37 with SMTP id c37mr1227493wec.86.1323593779519;
	Sun, 11 Dec 2011 00:56:19 -0800 (PST)
Received: from [172.20.1.19] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id dd4sm20964168wib.1.2011.12.11.00.56.17
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 11 Dec 2011 00:56:18 -0800 (PST)
Mime-Version: 1.0 (Apple Message framework v1251.1)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <CAMKF1sre0Wk1C_m6sS8yM4-apZYeOYp=Va-Mm19jpXqukUjFBA@mail.gmail.com>
Date: Sun, 11 Dec 2011 09:56:17 +0100
Message-Id: <4672BCAC-24D2-42DA-8EE5-76965C027DCD@dominion.thruhere.net>
References: <1323477267.5309.206.camel@ted>
	<CAMKF1sre0Wk1C_m6sS8yM4-apZYeOYp=Va-Mm19jpXqukUjFBA@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1251.1)
Cc: "Ashfield, Bruce" <Bruce.Ashfield@windriver.com>, "Hart,
	Darren" <darren.hart@intel.com>
Subject: Re: [PATCH] kernel.bbclass: Allow do_compile_kernelmodules to use PARALLEL_MAKE
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 11 Dec 2011 09:03:16 -0000
X-Groupsio-MsgNum: 14043
Content-Type: multipart/signed;
	boundary="Apple-Mail=_1DA88941-C3F5-43F5-A87E-7C857F1EFF7D";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_1DA88941-C3F5-43F5-A87E-7C857F1EFF7D
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii


Op 11 dec. 2011, om 00:28 heeft Khem Raj het volgende geschreven:

> On Fri, Dec 9, 2011 at 4:34 PM, Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
>> Without this we don't take advantage of any configured multiple CPU
>> cores which seems a shame.
>>=20
>> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
>> ---
>> diff --git a/meta/classes/kernel.bbclass =
b/meta/classes/kernel.bbclass
>> index d0cc279..120a524 100644
>> --- a/meta/classes/kernel.bbclass
>> +++ b/meta/classes/kernel.bbclass
>> @@ -89,7 +89,7 @@ kernel_do_compile() {
>>  do_compile_kernelmodules() {
>>        unset CFLAGS CPPFLAGS CXXFLAGS LDFLAGS MACHINE
>>        if (grep -q -i -e '^CONFIG_MODULES=3Dy$' .config); then
>> -               oe_runmake modules  CC=3D"${KERNEL_CC}" =
LD=3D"${KERNEL_LD}"
>> +               oe_runmake ${PARALLEL_MAKE} modules  =
CC=3D"${KERNEL_CC}" LD=3D"${KERNEL_LD}"
>>        else
>>                bbnote "no modules to compile"
>>        fi
>=20
>=20
> in base.bbclass oe_runmake says
>=20
> ${MAKE} ${EXTRA_OEMAKE} "$@"
>=20
> and
>=20
> conf/bitbake.conf says
>=20
> EXTRA_OEMAKE_prepend_task-compile =3D "${PARALLEL_MAKE} "
>=20
> hmmm so we dont parallel make if task is not called do_compile ?

Correct, that's why I did the following in meta-ti a while ago:

commit c62d16735db1beecd47a0ea3c4c51ddd29a1aeeb
Author: Koen Kooi <koen@dominion.thruhere.net>
Date:   Thu Jul 21 13:38:33 2011 +0200

    linux.inc: enable parallel make for modules as well
   =20
    Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>

diff --git a/recipes-kernel/linux/linux.inc =
b/recipes-kernel/linux/linux.inc
index 77e3179..9650e68 100644
--- a/recipes-kernel/linux/linux.inc
+++ b/recipes-kernel/linux/linux.inc
@@ -228,6 +228,10 @@ do_configure_append() {
        fi
 }
=20
+# bitbake.conf only prepends PARALLEL make in tasks called do_compile, =
which isn't the case for compile_modules
+# So explicitly enable it for that in here
+EXTRA_OEMAKE =3D "${PARALLEL_MAKE} "
+
 do_install_append() {
        oe_runmake headers_install =
INSTALL_HDR_PATH=3D${D}${exec_prefix}/src/linux-${KERNEL_VERSION} =
ARCH=3D$ARCH
 }

regards,

Koen



--Apple-Mail=_1DA88941-C3F5-43F5-A87E-7C857F1EFF7D
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----

iEYEARECAAYFAk7kcDEACgkQMkyGM64RGpFtLwCfWS2TpM4uJo8se/KfJVPbEAsR
bhAAoLjIrWUD/7TWYw5pUNWe3ISssNdv
=fAlm
-----END PGP SIGNATURE-----

--Apple-Mail=_1DA88941-C3F5-43F5-A87E-7C857F1EFF7D--
