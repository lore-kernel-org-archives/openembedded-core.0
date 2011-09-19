Received: from mail-wy0-f169.google.com ([74.125.82.169])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1R5eqo-00082L-9l
	for openembedded-core@lists.openembedded.org;
	Mon, 19 Sep 2011 16:29:39 +0200
Received: by wyi11 with SMTP id 11so8369976wyi.28
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Sep 2011 07:24:22 -0700 (PDT)
Received: by 10.227.3.15 with SMTP id 15mr2953527wbl.33.1316442262250;
	Mon, 19 Sep 2011 07:24:22 -0700 (PDT)
Received: from [172.20.0.96] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id gd6sm26152677wbb.1.2011.09.19.07.24.20
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 19 Sep 2011 07:24:20 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1244.3)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <4E774F1D.1020105@windriver.com>
Date: Mon, 19 Sep 2011 16:24:18 +0200
Message-Id: <A827B150-8003-45AB-BDE6-B50863931ACE@dominion.thruhere.net>
References: <1316275989.6161.23.camel@trisquel>
	<4E774F1D.1020105@windriver.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1244.3)
Subject: Re: armv6-novfp and armv6-vfp and tune files
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
X-List-Received-Date: Mon, 19 Sep 2011 14:29:39 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 19 sep. 2011, om 16:18 heeft Mark Hatle het volgende geschreven:

> On 9/17/11 11:13 AM, Denis 'GNUtoo' Carikli wrote:
>> hi,
>> I've an HTC Dream, it has an armv6 CPU but lack a vfp unit.
>> I want to add correct support for it in meta-smartphone/meta-htc.
>> In order to have a correct machine config that works a tune inc file
>> must be required in it.
>>=20
>> In openembedded-core there is no tune file yet for an armv6 that =
lacks a
>> vfp, but there are theses two files:
>> meta/conf/machine/include/tune-arm1136jf-s.inc
>> meta/conf/machine/include/arm/arch-armv6.inc
>>=20
>> tune-arm1136jf-s.inc requires arch-armv6.inc.
>>=20
>> So I need to create an tune-arm1136ej-s.inc which requires an
>> arch-armv6-novfp.inc(also to be created).
>>=20
>=20
> Is the arm1136ej-s the core in the HTC dream?  Or is it a custom armv6 =
(w/o vfp)?
>=20
> If it's the later you should add a new tune file for this htc dream's =
processor.
>=20
> The arch-armv6 should be modified to include a novfp feature.  Using =
the armv5
> as an example, I suggest:
>=20
> # Little Endian
> -AVAILTUNES +=3D "armv6 armv6t armv6hf armv6thf"
> +AVAILTUNES +=3D "armv6-novfp armv6 armv6t armv6hf armv6thf"
>=20
> +TUNE_FEATURES_tune-armv6-novfp ?=3D "armv6"
>=20
> +PACKAGE_EXTRA_ARCHS_tune-armv6-novfp =3D =
"${PACKAGE_EXTRA_ARCHS_tune-armv5e} armv6"
>=20
> (if there is a thumb variant, add that as well...)
>=20
> (...and... if there is a big endian variant add that as well...)
>=20
> Then using tune-arm1136ej-s.inc as a model for a new htc-dream tune:
>=20
> DEFAULTTUNE ?=3D "htcdream"
>=20
> require conf/machine/include/arm/arch-armv6.inc
>=20
> TUNEVALID[htcdream] =3D "Enable HTC dream specific processor =
optimizations"
> TUNE_CCARGS +=3D "${@bb.utils.contains("TUNE_FEATURES", "htcdream",
> "-mtune=3D<something appropriate here>", "", d)}"
>=20
> AVAILTUNES +=3D "htcdream"
> TUNE_FEATURES_tune-htcdream =3D "${TUNE_FEATURES_tune-armv6-novfp} =
htcdream"
> PACKAGE_EXTRA_ARCHS_tune-htcdream =3D =
"${PACKAGE_EXTRA_ARCHS_tune-armv6-novfp}"
>=20
> If the htc-dream has an existing core, then you can simply add a =
"novfp" variant
> to that core.
>=20
>>=20
>> however I wonder how to create the armv6-novfp.inc:
>> arch-armv6.inc has things like that inside:
>> TUNE_FEATURES_tune-armv6 ?=3D "armv6 vfp"
>> or:
>> PACKAGE_EXTRA_ARCHS_tune-armv6 =3D =
"${PACKAGE_EXTRA_ARCHS_tune-armv5e-vfp}
>> armv6-vfp"
>> or:
>> TUNEVALID[armv6] =3D "Enable instructions for ARMv6"
>>=20
>> in the recipes and in the feeds and in the workdir it's labeled as
>> "armv6-vfp".
>>=20
>> So the correct way would be to label an armv6 that lacks a vfp =
"armv6".
>>=20
>> however, I fear that the armv6 override is already taken, and also =
maybe
>> the arch-armv6.inc should be moved to arch-armv6-vfp.inc.
>=20
> Due to the way this was originally implemented, I was told no variants =
of the
> armv6 existed w/o VFP.....  so the naming is what it is, I'm open to =
suggesting
> a change to make it more explicit that armv6 is w/o VFP and armv6-vfp =
is w/ VFP.
> But it's up to the oe-core community if they'll accept that change to =
the core
> tunings.  It's more likely they will accept armv6-novfp (as in the =
examples above.)


It's called armv6-novfp in OE classic




