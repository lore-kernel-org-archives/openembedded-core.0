Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1Qm5En-0007w3-Vp
	for openembedded-core@lists.openembedded.org;
	Wed, 27 Jul 2011 16:37:30 +0200
Received: by wyg30 with SMTP id 30so1175576wyg.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Jul 2011 07:33:15 -0700 (PDT)
Received: by 10.216.155.83 with SMTP id i61mr104500wek.57.1311777195620;
	Wed, 27 Jul 2011 07:33:15 -0700 (PDT)
Received: from [172.20.0.96] (ip545070eb.adsl-surfen.hetnet.nl [84.80.112.235])
	by mx.google.com with ESMTPS id k9sm130363weq.27.2011.07.27.07.33.14
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 27 Jul 2011 07:33:15 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1244.3)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <4E302051.1010308@windriver.com>
Date: Wed, 27 Jul 2011 16:33:09 +0200
Message-Id: <CA4DDB0D-23FC-449D-B5CF-66C230471794@dominion.thruhere.net>
References: <cover.1311683981.git.richard.purdie@linuxfoundation.org>
	<346abefc87d21d0cc111ef87a6e48f40c5b6cb0b.1311683981.git.richard.purdie@linuxfoundation.org>
	<1311769062.30326.322.camel@phil-desktop>
	<1311773637.2344.365.camel@rex> <4E302051.1010308@windriver.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1244.3)
Subject: Re: [PATCH 1/3] Add ARM tune file overhaul based largely on work from Mark Hatle
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
X-List-Received-Date: Wed, 27 Jul 2011 14:37:30 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 27 jul. 2011, om 16:27 heeft Mark Hatle het volgende geschreven:

> On 7/27/11 8:33 AM, Richard Purdie wrote:
>> On Wed, 2011-07-27 at 13:17 +0100, Phil Blundell wrote:
>>> On Tue, 2011-07-26 at 13:44 +0100, Richard Purdie wrote:
>>>> +TARGET_FPU =3D "${@d.getVar('ARMPKGSFX_FPU', True).strip('-') or =
'soft'}"
>>>=20
>>> This seems a bit backwards.  Shouldn't TARGET_FPU be the primary
>>> variable and then the package suffix be computed from that, rather =
than
>>> vice versa?
>>=20
>> It's been "fun" to use the rather limited constructs we have in these
>> variables to construct the end result. I suspect this way around, it =
was
>> the easiest way to get the right variables in the right places.
>>=20
>>>> +ARMPKGSFX_THUMB .=3D "${@bb.utils.contains("TUNE_FEATURES", [ =
"armv4", "thumb" ], "t", "", d)}"
>>>> +ARMPKGSFX_THUMB .=3D "${@bb.utils.contains("TUNE_FEATURES", [ =
"armv5", "thumb" ], "t", "", d)}"
>>>> +ARMPKGSFX_THUMB .=3D "${@bb.utils.contains("TUNE_FEATURES", [ =
"armv6", "thumb" ], "t2", "", d)}"
>>>> +ARMPKGSFX_THUMB .=3D "${@bb.utils.contains("TUNE_FEATURES", [ =
"armv7", "thumb" ], "t2", "", d)}"
>>>=20
>>> This is wrong: ARMv6 doesn't imply Thumb-2.
>>=20
>> Ah, yes. I'll fix this.
>=20
> Are you sure?  I thought ARMv6 -was- the first to support Thumb-2.  =
And armv5/4
> were thumb(1).  Note, not all ARMv6 processors contain thumb support.

As I understand it:

arm1136 doesn't have t2
arm1176 does have t2

both are armv6 :)

>=20
>>>> +# Whether to compile with code to allow interworking between the =
two
>>>> +# instruction sets. This allows thumb code to be executed on a =
primarily
>>>> +# arm system and vice versa. It is strongly recommended that =
DISTROs not
>>>> +# turn this off - the actual cost is very small.
>>>> +TUNEVALID[no-thumb-interwork] =3D "Disable mixing of thumb and ARM =
functions"
>>>> +TUNE_CCARGS +=3D "${@bb.utils.contains("TUNE_FEATURES", =
"no-thumb-interwork", "-mno-thumb-interwork", "-mthumb-interwork", d)}"
>>>> +OVERRIDES .=3D "${@bb.utils.contains("TUNE_FEATURES", =
"no-thumb-interwork", ":thumb-interwork", "", d)}"
>>>=20
>>> This is only relevant for v4t, I guess.  Interworking is basically
>>> always on for v5 and later and (CeSI aside) it's impossible on v4, =
so
>>> hardly anybody is going to be flipping this switch.  I'm not sure it
>>> really merits an OVERRIDE.
>>=20
>> I'd be happy to remove this option if there are no objections. It was
>> left for compatibility with the existing tune-thumb file but as you =
say,
>> it likely doesn't make much sense.
>>=20
>>>> --- a/meta/conf/machine/include/tune-xscale.inc
>>>> +++ b/meta/conf/machine/include/tune-xscale.inc
>>>> @@ -1,11 +1,17 @@
>>>> -require conf/machine/include/arm/arch-arm.inc
>>>> +DEFAULTTUNE ?=3D "xscale"
>>>>=20
>>>> -INHERIT +=3D "siteinfo"
>>>> +require conf/machine/include/arm/arch-armv5-dsp.inc
>>>>=20
>>>> -TUNE_CCARGS =3D "-march=3Darmv5te -mtune=3Dxscale"
>>>> -TARGET_CC_KERNEL_ARCH =3D "-march=3Darmv5te -mtune=3Dxscale"
>>>> -TUNE_PKGARCH =3D "${@['armv5teb', =
'armv5te'][bb.data.getVar('SITEINFO_ENDIANESS', d, 1) =3D=3D 'le']}"
>>>> -PACKAGE_EXTRA_ARCHS =3D "${@['armeb armv4b armv4tb armv5teb', 'arm =
armv4 armv4t armv5te'][bb.data.getVar('SITEINFO_ENDIANESS', d, 1) =3D=3D =
'le']}"
>>>> +TUNEVALID[xscale] =3D "Enable PXA255/PXA26x Xscale specific =
processor optimizations"
>>>> +TUNE_CCARGS +=3D "${@bb.utils.contains("TUNE_FEATURES", "xscale", =
"-mtune=3Dxscale", "", d)}"
>>>> +
>>>> +AVAILTUNES +=3D "xscale"
>>>> +TUNE_FEATURES_tune-xscale =3D "${TUNE_FEATURES_tune-armv5te} =
xscale"
>>>> +PACKAGE_EXTRA_ARCHS_tune-xscale =3D =
"${PACKAGE_EXTRA_ARCHS_tune-armv5te}"
>>>> +
>>>> +AVAILTUNES +=3D "xscale-be"
>>>> +TUNE_FEATURES_tune-xscale =3D "${TUNE_FEATURES_tune-armv5teb} =
xscale"
>>>> +PACKAGE_EXTRA_ARCHS_tune-xscale =3D =
"${PACKAGE_EXTRA_ARCHS_tune-armv5teb}"
>>>=20
>>> I guess that should be "_tune-xscale-be".
>>=20
>> Yes, I'll fix, well spotted.
>=20
> In the original work I did it was just tune-xscale (no be).  AFAIK =
there is no
> little endian version of xscale.  (there was an iwmmxt that was =
similar to
> xscale, but was slightly different.)

pxa25x are LE xscales (e.g. Palm Treo)
pxa26x are LE xscales with some NAND builtin
pxa27x are LE xscales with iwmmxt as an extra


>=20
>>> All in all it seems as though there's an awful lot of expanded cross
>>> products in this set of patches and I can't help wondering whether a =
lot
>>> of this stuff would be better computed programmatically.  I wouldn't =
be
>>> at all surprised if there are other copy-and-paste errors like the
>>> xscale one lurking in that mass of overrides, but it's very hard to =
spot
>>> them by eye.  It seems particularly unfortunate that everything has =
to
>>> be written out twice, once for big-endian and once for =
little-endian,
>>> given that endianness is almost entirely orthogonal to all the other
>>> "tuning" parameters.
>>=20
>> At least three of us have now done a pass over this so hopefully =
we've
>> spotted the major ones but I agree its less than ideal.
>>=20
>> The alternative is to post process the variables somehow, or turn it =
all
>> into anonymous python (which from a .conf file is not as easy as it
>> sounds).
>>=20
>> I do like the fact that it allows some standardisation of the options
>> available in a given tune file as whether or not big endian was even
>> possible was previously hit and miss.
>>=20
>> So I think its an improvement but likely not the finished end result.
>>=20
>> Cheers,
>>=20
>> Richard
>>=20
>>=20
>>=20
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>=20
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core



