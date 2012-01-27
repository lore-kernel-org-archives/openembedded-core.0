Received: from mail-wi0-f175.google.com ([209.85.212.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1RqiUf-0004Dk-Lk
	for openembedded-core@lists.openembedded.org;
	Fri, 27 Jan 2012 10:53:17 +0100
Received: by wibhq7 with SMTP id hq7so1091160wib.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Jan 2012 01:45:29 -0800 (PST)
Received: by 10.180.90.212 with SMTP id by20mr9706231wib.12.1327657528998;
	Fri, 27 Jan 2012 01:45:28 -0800 (PST)
Received: from [172.20.1.36] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id ho4sm10516151wib.3.2012.01.27.01.45.27
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 27 Jan 2012 01:45:28 -0800 (PST)
Mime-Version: 1.0 (Apple Message framework v1251.1)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <1327621946.19643.425.camel@ted>
Date: Fri, 27 Jan 2012 10:45:26 +0100
Message-Id: <D7538C0B-CAE0-4043-BCF3-50C18B18781E@dominion.thruhere.net>
References: <1327597394-31990-1-git-send-email-koen@dominion.thruhere.net>
	<1327611071.19643.405.camel@ted>
	<E55A8B17-3534-482A-8A69-CFE94D14F04D@dominion.thruhere.net>
	<1327621946.19643.425.camel@ted>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
X-Mailer: Apple Mail (2.1251.1)
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] package bbclass: allow per package PRIVATE_LIBS
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
X-List-Received-Date: Fri, 27 Jan 2012 09:53:17 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 27 jan. 2012, om 00:52 heeft Richard Purdie het volgende geschreven:

> On Fri, 2012-01-27 at 00:17 +0100, Koen Kooi wrote:
>> Op 26 jan. 2012, om 21:51 heeft Richard Purdie het volgende =
geschreven:
>>=20
>>> On Thu, 2012-01-26 at 18:03 +0100, Koen Kooi wrote:
>>>> If a recipe packages multiple versions of shlib (e.g. powervr =
drivers) we only want the shlib code to pickup $PN, not $PN-foo =
subpackages.
>>>> This keeps backward compatibility with the global PRIVATE_LIBS =
usage if no per package PRIVATE_LIBS are set for a given package. In =
other words: this doesn't break the firefox recipe.
>>>>=20
>>>> Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
>>>> ---
>>>> meta/classes/package.bbclass |    5 ++++-
>>>> 1 files changed, 4 insertions(+), 1 deletions(-)
>>>>=20
>>>> diff --git a/meta/classes/package.bbclass =
b/meta/classes/package.bbclass
>>>> index 45447e3..22a76cf 100644
>>>> --- a/meta/classes/package.bbclass
>>>> +++ b/meta/classes/package.bbclass
>>>> @@ -1246,7 +1246,8 @@ python package_do_shlibs() {
>>>> 				if not this_soname in sonames:
>>>> 					# if library is private (only =
used by package) then do not build shlib for it
>>>> 					if not private_libs or -1 =3D=3D =
private_libs.find(this_soname):
>>>> -						=
sonames.append(this_soname)
>>>> +						if not private_libs_pkg =
or -1 =3D=3D private_libs_pkg.find(this_soname):
>>>> +							=
sonames.append(this_soname)
>>>> 				if libdir_re.match(root):
>>>> 					needs_ldconfig =3D True
>>>> 				if snap_symlinks and (file !=3D =
this_soname):
>>>> @@ -1328,6 +1329,8 @@ python package_do_shlibs() {
>>>> 	shlib_provider =3D {}
>>>> 	private_libs =3D d.getVar('PRIVATE_LIBS', True)
>>>> 	for pkg in packages.split():
>>>> +		if not private_libs:
>>>> +			private_libs_pkg =3D d.getVar('PRIVATE_LIBS_' + =
pkg, True)
>>>=20
>>> You might as well just put:
>>>=20
>>>                        private_libs =3D d.getVar('PRIVATE_LIBS_' + =
pkg, True)
>>>=20
>>> and drop the first bit of the patch.
>>=20
>> Wouldn't that kill backward compatibility?
>=20
> No, since it would only take effect if the plain PRIVATE_LIBS was not
> set...

The problem with the 'private_libs' var is that it's global and this =
needs a pkg local variable.

regards,

Koen=


