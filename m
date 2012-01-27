Received: from mail-wi0-f175.google.com ([209.85.212.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1Rqmz0-0005xN-3D
	for openembedded-core@lists.openembedded.org;
	Fri, 27 Jan 2012 15:40:54 +0100
Received: by wibhq7 with SMTP id hq7so1300716wib.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Jan 2012 06:33:05 -0800 (PST)
Received: by 10.181.13.113 with SMTP id ex17mr11402551wid.15.1327674784894;
	Fri, 27 Jan 2012 06:33:04 -0800 (PST)
Received: from [172.20.1.36] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id fv6sm23668208wib.8.2012.01.27.06.33.02
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 27 Jan 2012 06:33:03 -0800 (PST)
Mime-Version: 1.0 (Apple Message framework v1251.1)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <1327669675.19643.454.camel@ted>
Date: Fri, 27 Jan 2012 15:32:57 +0100
Message-Id: <774CB1BB-75BF-4D3F-9485-A66FAF6D2004@dominion.thruhere.net>
References: <1327597394-31990-1-git-send-email-koen@dominion.thruhere.net>
	<1327611071.19643.405.camel@ted>
	<E55A8B17-3534-482A-8A69-CFE94D14F04D@dominion.thruhere.net>
	<1327621946.19643.425.camel@ted>
	<D7538C0B-CAE0-4043-BCF3-50C18B18781E@dominion.thruhere.net>
	<1327657835.19643.439.camel@ted>
	<1A3FDA4B-424A-4C09-8DC9-9663BBC92D92@dominion.thruhere.net>
	<1327669675.19643.454.camel@ted>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1251.1)
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
X-List-Received-Date: Fri, 27 Jan 2012 14:40:54 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 27 jan. 2012, om 14:07 heeft Richard Purdie het volgende geschreven:

> On Fri, 2012-01-27 at 12:55 +0100, Koen Kooi wrote:
>> Op 27 jan. 2012, om 10:50 heeft Richard Purdie het volgende =
geschreven:
>>=20
>>> On Fri, 2012-01-27 at 10:45 +0100, Koen Kooi wrote:
>>>> Op 27 jan. 2012, om 00:52 heeft Richard Purdie het volgende =
geschreven:
>>>>=20
>>>>> On Fri, 2012-01-27 at 00:17 +0100, Koen Kooi wrote:
>>>>>> Op 26 jan. 2012, om 21:51 heeft Richard Purdie het volgende =
geschreven:
>>>>>>=20
>>>>>>> On Thu, 2012-01-26 at 18:03 +0100, Koen Kooi wrote:
>>>>>>>> If a recipe packages multiple versions of shlib (e.g. powervr =
drivers) we only want the shlib code to pickup $PN, not $PN-foo =
subpackages.
>>>>>>>> This keeps backward compatibility with the global PRIVATE_LIBS =
usage if no per package PRIVATE_LIBS are set for a given package. In =
other words: this doesn't break the firefox recipe.
>>>>>>>>=20
>>>>>>>> Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
>>>>>>>> ---
>>>>>>>> meta/classes/package.bbclass |    5 ++++-
>>>>>>>> 1 files changed, 4 insertions(+), 1 deletions(-)
>>>>>>>>=20
>>>>>>>> diff --git a/meta/classes/package.bbclass =
b/meta/classes/package.bbclass
>>>>>>>> index 45447e3..22a76cf 100644
>>>>>>>> --- a/meta/classes/package.bbclass
>>>>>>>> +++ b/meta/classes/package.bbclass
>>>>>>>> @@ -1246,7 +1246,8 @@ python package_do_shlibs() {
>>>>>>>> 				if not this_soname in sonames:
>>>>>>>> 					# if library is private =
(only used by package) then do not build shlib for it
>>>>>>>> 					if not private_libs or =
-1 =3D=3D private_libs.find(this_soname):
>>>>>>>> -						=
sonames.append(this_soname)
>>>>>>>> +						if not =
private_libs_pkg or -1 =3D=3D private_libs_pkg.find(this_soname):
>>>>>>>> +							=
sonames.append(this_soname)
>>>>>>>> 				if libdir_re.match(root):
>>>>>>>> 					needs_ldconfig =3D True
>>>>>>>> 				if snap_symlinks and (file !=3D =
this_soname):
>>>>>>>> @@ -1328,6 +1329,8 @@ python package_do_shlibs() {
>>>>>>>> 	shlib_provider =3D {}
>>>>>>>> 	private_libs =3D d.getVar('PRIVATE_LIBS', True)
>>>>>>>> 	for pkg in packages.split():
>>>>>>>> +		if not private_libs:
>>>>>>>> +			private_libs_pkg =3D =
d.getVar('PRIVATE_LIBS_' + pkg, True)
>>>>>>>=20
>>>>>>> You might as well just put:
>>>>>>>=20
>>>>>>>                      private_libs =3D d.getVar('PRIVATE_LIBS_' + =
pkg, True)
>>>>>>>=20
>>>>>>> and drop the first bit of the patch.
>>>>>>=20
>>>>>> Wouldn't that kill backward compatibility?
>>>>>=20
>>>>> No, since it would only take effect if the plain PRIVATE_LIBS was =
not
>>>>> set...
>>>>=20
>>>> The problem with the 'private_libs' var is that it's global and =
this needs a pkg local variable.
>>>=20
>>> I see your point. How about just doing:
>>>=20
>>> 	private_libs =3D d.getVar('PRIVATE_LIBS_' + pkg, True) or =
d.getVar('PRIVATE_LIBS', True)
>>>=20
>>> ?
>>=20
>> That would still set the global variable when it encounters a
>> subpackage with PRIVATE_LIBS set. And that would mean it will come
>> down to carefully ordering PACKAGES and hoping the class iterates =
them
>> in the same order.
>>=20
>>> The code just looks more complex in your patch than I think it needs
>> to be.
>>=20
>> I agree but I couldn't figure out a way that keeps both the old =
global
>> syntax working and enables the per-package one to work as well. But I
>> must admit that I lack the most basic python skills :)
>=20
> I was meaning to do:
>=20
>        shlib_provider =3D {}
> -       private_libs =3D d.getVar('PRIVATE_LIBS', True)
>        for pkg in packages.split():
> +               private_libs =3D d.getVar('PRIVATE_LIBS_' + pkg, True) =
or d.getVar('PRIVATE_LIBS', True)
>                needs_ldconfig =3D False
>                bb.debug(2, "calculating shlib provides for %s" % pkg)
>=20
> so private_libs is reset each time to the correct value.

I'll try a build with that and send a v2 of the patch if it works as we =
expect it :)=


