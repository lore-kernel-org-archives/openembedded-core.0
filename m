Return-Path: <Matthieu.CRAPET@ingenico.com>
Received: from smtp1.ingenico.com (smtp1.ingenico.com [217.108.148.240])
	by mail.openembedded.org (Postfix) with ESMTP id DED3E705FC
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Jul 2014 14:38:04 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.01,665,1400018400"; d="scan'208";a="54918031"
Received: from cosnadexc21.usr.ingenico.loc ([10.31.4.221])
	by antispam1.usr.ingenico.loc with ESMTP; 15 Jul 2014 16:38:06 +0200
Received: from COSNADEXC11.usr.ingenico.loc (10.31.4.211) by
	COSNADEXC21.usr.ingenico.loc (10.31.4.221) with Microsoft SMTP Server
	(TLS) id 14.3.174.1; Tue, 15 Jul 2014 16:38:05 +0200
Received: from COSNADEXC13.usr.ingenico.loc ([169.254.1.156]) by
	COSNADEXC11.usr.ingenico.loc ([10.31.4.211]) with mapi id
	14.03.0174.001; Tue, 15 Jul 2014 16:38:05 +0200
From: Matthieu CRAPET <Matthieu.CRAPET@ingenico.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH v2] libav: add PACKAGECONFIG for theora,
	libvorbis, speex and openssl
Thread-Index: AQHPnNJ/XlmlgL3ls0q17myQTtn7XpuawSVA///vQICABoqjIA==
Date: Tue, 15 Jul 2014 14:38:05 +0000
Message-ID: <8672BB614B4CCA40A6B3BDD6FD82050BA8B27988@COSNADEXC13.usr.ingenico.loc>
References: <1404138201-22662-1-git-send-email-Matthieu.Crapet@ingenico.com>
	<20140630164039.GC2437@jama>
	<C147EF5C-664D-45FD-BA7C-020B54702266@dominion.thruhere.net>
	<8672BB614B4CCA40A6B3BDD6FD82050BA8B25636@COSNADEXC13.usr.ingenico.loc>
	<53BFDC0F.3050208@opendreambox.org>
In-Reply-To: <53BFDC0F.3050208@opendreambox.org>
Accept-Language: fr-FR, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.31.16.119]
MIME-Version: 1.0
Subject: Re: [PATCH v2] libav: add PACKAGECONFIG for theora, libvorbis, speex and openssl
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
X-List-Received-Date: Tue, 15 Jul 2014 14:38:14 -0000
Content-Language: fr-FR
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi Andreas,

Thanks for contribution. Your way is simple but user must know internal dep=
endencies between codecs in licenses.
I think we can drop the GPL v2/v3 case because it is only used with libopen=
core & libvo that we don't use them in our recipe.

I'll post a v3 patch asap.

Regards,
Matthieu


-----Message d'origine-----
De=A0: openembedded-core-bounces@lists.openembedded.org [mailto:openembedde=
d-core-bounces@lists.openembedded.org] De la part de Andreas Oberritter
Envoy=E9=A0: vendredi 11 juillet 2014 14:44
=C0=A0: openembedded-core@lists.openembedded.org
Objet=A0: Re: [OE-core] [PATCH v2] libav: add PACKAGECONFIG for theora, lib=
vorbis, speex and openssl

Hi Matthieu,

I used a different approach, but could't test with master yet.

http://git.openembedded.org/openembedded-core-contrib/commit/?h=3Dobi/daisy=
&id=3D1e3c64a768a5aeaf8d904609a14dd29e298821df

While at it, you may also take a look at this commit:

http://git.openembedded.org/openembedded-core-contrib/commit/?h=3Dobi/daisy=
&id=3D1e39f95927b65c7943c8d6c36203b8b55c9b3cdf

Feel free to modify and submit as you like.

Regards,
Andreas

On 11.07.2014 13:47, Matthieu CRAPET wrote:
> Hi Koen,
>=20
> Something like this (in a small python function) would be acceptable?
>=20
> d.setVar('LICENSE', 'CLOSED')
>=20
> Regards,
> Matthieu
>=20
>=20
> -----Message d'origine-----
> De : Koen Kooi [mailto:koen@dominion.thruhere.net]
> Envoy=E9 : vendredi 11 juillet 2014 08:37 =C0 : Martin Jansa Cc : Matthie=
u=20
> CRAPET; openembedded-core@lists.openembedded.org
> Objet : Re: [OE-core] [PATCH v2] libav: add PACKAGECONFIG for theora,=20
> libvorbis, speex and openssl
>=20
> [...]
>=20
>>> +# Check codecs that require --enable-nonfree USE_NONFREE =3D=20
>>> +"${@bb.utils.contains_any('PACKAGECONFIG', [ 'faac', 'openssl' ], 'yes=
', '', d)}"
>>>
>>> EXTRA_OECONF =3D " \
>>>     --enable-shared \
>>>     --enable-pthreads \
>>>     --enable-gpl \
>>> +    ${@bb.utils.contains('USE_NONFREE', 'yes', '--enable-nonfree',=20
>>> + '', d)} \
>>
>> cannot you just pass --enable-nonfree in faac and openssl PACKAGECONFIG?
>> In worse case when both are enabled the option will be added twice.
>=20
> If you have nonfree enabled, you need to change the license as well, it w=
on't be GPL anymore.
>=20
> regards,
>=20
> Koen
>=20

--
_______________________________________________
Openembedded-core mailing list
Openembedded-core@lists.openembedded.org
http://lists.openembedded.org/mailman/listinfo/openembedded-core

