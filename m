Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1QgZQ7-0002I8-Qk
	for openembedded-core@lists.openembedded.org;
	Tue, 12 Jul 2011 11:40:33 +0200
Received: by wyg30 with SMTP id 30so3586846wyg.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Jul 2011 02:30:28 -0700 (PDT)
Received: by 10.216.235.33 with SMTP id t33mr5060435weq.6.1310463028014;
	Tue, 12 Jul 2011 02:30:28 -0700 (PDT)
Received: from [172.20.0.96] (ip545070eb.adsl-surfen.hetnet.nl [84.80.112.235])
	by mx.google.com with ESMTPS id g48sm4681821wee.13.2011.07.12.02.30.25
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 12 Jul 2011 02:30:26 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1084)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <1310460068.20015.1021.camel@rex>
Date: Tue, 12 Jul 2011 11:30:20 +0200
Message-Id: <E040CBE3-4C88-4768-B056-0588A5566BDA@dominion.thruhere.net>
References: <1310399860.20015.980.camel@rex>
	<164DA52B-98AF-47AA-A42D-1DE7FA9A1200@dominion.thruhere.net>
	<1310402833.20015.986.camel@rex>
	<839342D0-8691-4528-8B7A-9515ED47B6C2@dominion.thruhere.net>
	<1310460068.20015.1021.camel@rex>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1084)
Subject: Re: [RFC PATCH 2/3] conf/machine: Overhaul tune include files
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
X-List-Received-Date: Tue, 12 Jul 2011 09:40:33 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 12 jul 2011, om 10:41 heeft Richard Purdie het volgende geschreven:

> On Mon, 2011-07-11 at 19:04 +0200, Koen Kooi wrote:
>> Op 11 jul 2011, om 18:47 heeft Richard Purdie het volgende =
geschreven:
>>>> Taking armv7a as an example with my angstrom hat on I need the =
following knobs:
>>>>=20
>>>> 1) softp or hardfp calling conventions, resulting in a different =
package arch (e.g. armv7a vs armv7ahf) (link incompatible)
>>>> 2) neon or not, resulting in a different packagearch (e.g armv7a vs =
armv7a-vfponly) (link compatible)
>>>> 3) Thumb2 or arm mode, no direct need for different packagearch, =
they are compatible
>>>> 4) use FPU fw or not (TARGET_PFU) (slightly different from 2.)
>>>>=20
>>>> Do you have any examples on how the package arch will look with =
this patchset?
>>>=20
>>> I added in code to differentiate between big and little endian. We =
can
>>> add in code to add extra options, e.g. in the tune-armv7 case:
>>>=20
>>>=20
>>> TARGET_CC_ARCH +=3D "${@bb.utils.contains("TUNE_FEATURES", =
"callconvention-hard", "-mfloat-abi=3Dhardfp", "-mfloat-abi=3Dsoftfp" =
,d)}"
>>>=20
>>> PACKAGE_EXTRA_ARCHS =3D "${TUNE_ARCH}${SUFX2} =
armv4${ENDSUFX}${SUFX2} armv4t${ENDSUFX}${SUFX2} =
armv5te${ENDSUFX}${SUFX2} armv6${ENDSUFX}${SUFX2} =
armv7${ENDSUFX}${SUFX2}"
>>=20
>> And SUFX2 being 'hf' or '', right? If so, the proposal looks good to =
me, but I need to digest it some more.
>=20
> Correct.
>=20
> An updated version of this with a few more pieces filled out is
> available at:
>=20
> =
http://git.yoctoproject.org/cgit.cgi/poky-contrib/commit/?h=3Drpurdie/temp=
4&id=3Dd2a0bf99fd573221f230bb5253b85166997fac69

If I understand it correctly

	TARGET_FPU_armv7a =3D "hard"
	TARGET_FPU ?=3D "soft"

becomes

	TUNE_FEATURES_append_armv7a =3D " hard"

And

	ARM_FP_ABI =3D "hardfp"

becomes

	TUNE_FEATURES +=3D "callconvention-hard"

And to maintain the status quo for beagleboard/angstrom:

	TUNE_FEATURES_append_omap3 =3D " neon"


I would also add something like the following:

--- a/meta/classes/base.bbclass
+++ b/meta/classes/base.bbclass
@@ -166,7 +166,7 @@ python base_eventhandler() {
         if name.startswith("BuildStarted"):
                bb.data.setVar( 'BB_VERSION', bb.__version__, e.data )
-               statusvars =3D ['BB_VERSION', 'TARGET_ARCH', =
'TARGET_OS', 'MACHINE', 'DISTRO', 'DISTRO_VERSION','TARGET_FPU']
+               statusvars =3D ['BB_VERSION', 'TARGET_ARCH', =
'TARGET_OS', 'MACHINE', 'DISTRO', 'DISTRO_VERSION','TUNE_FEATURES']
                statuslines =3D ["%-17s =3D \"%s\"" % (i, =
bb.data.getVar(i, e.data, 1) or '') for i in statusvars]
=20
Finally a small nitpick: debian uses 'hf' as hardfloat suffix and I =
prefer that over '-hfp'. Meego calls it armv8, but let's not go there.

regards,

Koen=


