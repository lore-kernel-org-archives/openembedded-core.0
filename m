Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1RqYgg-0007bM-Gn
	for openembedded-core@lists.openembedded.org;
	Fri, 27 Jan 2012 00:25:02 +0100
Received: by werc1 with SMTP id c1so912693wer.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Jan 2012 15:17:14 -0800 (PST)
Received: by 10.216.131.91 with SMTP id l69mr1955835wei.28.1327619834285;
	Thu, 26 Jan 2012 15:17:14 -0800 (PST)
Received: from [172.20.1.36] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id t6sm8088360wid.1.2012.01.26.15.17.13
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 26 Jan 2012 15:17:13 -0800 (PST)
Mime-Version: 1.0 (Apple Message framework v1251.1)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <1327611071.19643.405.camel@ted>
Date: Fri, 27 Jan 2012 00:17:07 +0100
Message-Id: <E55A8B17-3534-482A-8A69-CFE94D14F04D@dominion.thruhere.net>
References: <1327597394-31990-1-git-send-email-koen@dominion.thruhere.net>
	<1327611071.19643.405.camel@ted>
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
X-List-Received-Date: Thu, 26 Jan 2012 23:25:02 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 26 jan. 2012, om 21:51 heeft Richard Purdie het volgende geschreven:

> On Thu, 2012-01-26 at 18:03 +0100, Koen Kooi wrote:
>> If a recipe packages multiple versions of shlib (e.g. powervr =
drivers) we only want the shlib code to pickup $PN, not $PN-foo =
subpackages.
>> This keeps backward compatibility with the global PRIVATE_LIBS usage =
if no per package PRIVATE_LIBS are set for a given package. In other =
words: this doesn't break the firefox recipe.
>>=20
>> Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
>> ---
>> meta/classes/package.bbclass |    5 ++++-
>> 1 files changed, 4 insertions(+), 1 deletions(-)
>>=20
>> diff --git a/meta/classes/package.bbclass =
b/meta/classes/package.bbclass
>> index 45447e3..22a76cf 100644
>> --- a/meta/classes/package.bbclass
>> +++ b/meta/classes/package.bbclass
>> @@ -1246,7 +1246,8 @@ python package_do_shlibs() {
>> 				if not this_soname in sonames:
>> 					# if library is private (only =
used by package) then do not build shlib for it
>> 					if not private_libs or -1 =3D=3D =
private_libs.find(this_soname):
>> -						=
sonames.append(this_soname)
>> +						if not private_libs_pkg =
or -1 =3D=3D private_libs_pkg.find(this_soname):
>> +							=
sonames.append(this_soname)
>> 				if libdir_re.match(root):
>> 					needs_ldconfig =3D True
>> 				if snap_symlinks and (file !=3D =
this_soname):
>> @@ -1328,6 +1329,8 @@ python package_do_shlibs() {
>> 	shlib_provider =3D {}
>> 	private_libs =3D d.getVar('PRIVATE_LIBS', True)
>> 	for pkg in packages.split():
>> +		if not private_libs:
>> +			private_libs_pkg =3D d.getVar('PRIVATE_LIBS_' + =
pkg, True)
>=20
> You might as well just put:
>=20
>                         private_libs =3D d.getVar('PRIVATE_LIBS_' + =
pkg, True)
>=20
> and drop the first bit of the patch.

Wouldn't that kill backward compatibility?

regards,

Koen=


