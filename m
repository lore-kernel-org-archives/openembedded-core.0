Return-Path: <kweihmann@outlook.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D35C6C433EF
	for <webhook@archiver.kernel.org>; Thu, 25 Nov 2021 10:14:28 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (EUR05-AM6-obe.outbound.protection.outlook.com [40.92.91.100])
 by mx.groups.io with SMTP id smtpd.web09.10310.1637835267817239920
 for <openembedded-core@lists.openembedded.org>;
 Thu, 25 Nov 2021 02:14:28 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@outlook.com
 header.s=selector1 header.b=sKf6HCO3;
 spf=pass (domain: outlook.com, ip: 40.92.91.100,
 mailfrom: kweihmann@outlook.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DI8AnJXkMDTgoLm+caWJ0GsCufmUcm9LqTBN3xoaQdTPkad4J3PPS/XrLaxIuDAQQat3fRsYzEWUSKHPGtQ063wNLfo3ZKwC4ZOPsQledqW7FdrIxlvYqPkvr4D204o3PPO6SDnuBEL/GHt2hWnW2e14mrP1YSUnSEu9c7u48CLSZaDJHpdvZMUCblQbsAtnBP0JHwtPmtApB+rNdn1DkPE3p8ZVLTTm9ll1j2UvUcpC4tEl0wrOXkb6yEN3CKzSXfzlMv0XD/b3UFW55pjyhwNwDCdAzUvVZTYzw3b18qoyuCsIsGzhvylhcybkvEc+HR6GoVqnbCGwElD2Z2kpBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YIFgtrsNEEDL/3XhxJMcUL5CpJ7y7A74qXsVXXo7/KU=;
 b=Ntf25IwScNeYXuotW2yEUqoHc/7BuRI9dP148RIEQuQNNYdksox7C+MMJfCuQT8qNA1HZwArn2yT7BUKXr8mV87ye6RHAaRfHxxUd5phCEmegMHb7sE0y2KtwQu3pmWvU8lSBSXrhoZLC+xphvI3vRoxlFXSxRpkf5CL39ctHcXMPJ8mP/vEXxrhTEXG6H+HrCByHC0jy9BIgGiSN+oj15MR0ei3vSFSWow0JoJiW4BqbAAdB1rjCVkT2avxOrVL+VbSoZw4QDQNPZ+efTeHLmMV/nQDvnCwKrqDeOLRFs3jd7ys65XUxGE9N6a0qH3NP4ibDYTdFIpSOD/PLkIxXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YIFgtrsNEEDL/3XhxJMcUL5CpJ7y7A74qXsVXXo7/KU=;
 b=sKf6HCO3tOoXVnnUuK73JskckMOlJRYKm3oj9rNwFPfozhPdkjQAmsC27x0c35n/6Vyqgw+2o6f/YYWP5Hb0j29+SSGJfRDvzpCZN5Ie8XXHgCoCX5fNNdWcDTThlAJ3gFpEMMgYKDALalwYZPFSYhTyofs/e/5u9+C6aI2MqHlGKkmj9V9AqZ7pBCZM/aGvjnyFto3SK5T25PzPhNtAPnNJ92WLkGRAIUhx+LWCycG26vCKKQl4e2OfsQw2WDlG+exRYmxJYjcLfqkJ71TZLu9yZ1C97v7+knFZuVa68jkUzk+eh4mUCbiaqOdyKlGrHgvqXS3CIvz56hOO2W+VDQ==
Received: from AM9PR09MB4642.eurprd09.prod.outlook.com (2603:10a6:20b:284::24)
 by AM0PR09MB4147.eurprd09.prod.outlook.com (2603:10a6:208:192::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.22; Thu, 25 Nov
 2021 10:14:24 +0000
Received: from AM9PR09MB4642.eurprd09.prod.outlook.com
 ([fe80::7c6f:9b99:3d00:f710]) by AM9PR09MB4642.eurprd09.prod.outlook.com
 ([fe80::7c6f:9b99:3d00:f710%3]) with mapi id 15.20.4734.020; Thu, 25 Nov 2021
 10:14:23 +0000
Subject: Re: [OE-core] [RFC][PATCH 1/2] distutils3-legacy: fallback for
 missing setup.py
To: Tim Orling <ticotimo@gmail.com>
CC: openembedded-core@lists.openembedded.org
References: 
 <AM9PR09MB46426836B8FC0FACE562A084A8619@AM9PR09MB4642.eurprd09.prod.outlook.com>
 <CANx9H-BnuuwVojhz5SGZqN97oj1VhoDLZ0W7ZBO=v5J0tXoS_w@mail.gmail.com>
From: Konrad Weihmann <kweihmann@outlook.com>
Message-ID: 
 <AM9PR09MB4642339C419682FB30822526A8629@AM9PR09MB4642.eurprd09.prod.outlook.com>
Date: Thu, 25 Nov 2021 11:14:21 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: 
 <CANx9H-BnuuwVojhz5SGZqN97oj1VhoDLZ0W7ZBO=v5J0tXoS_w@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-TMN: [SWrbEHB4wQyRs7vOHryfnXXnM0fMUEoIyD/ijNBukpazpBlZZ4TNh4ovVbQRS6Dy]
X-ClientProxiedBy: AM4PR05CA0034.eurprd05.prod.outlook.com (2603:10a6:205::47)
 To AM9PR09MB4642.eurprd09.prod.outlook.com (2603:10a6:20b:284::24)
X-Microsoft-Original-Message-ID: 
 <60a30e30-cdcb-7c31-746e-1513833a1622@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:3103:205c:200:bed3:df7f:f488:16a2]
 (2a02:3103:205c:200:bed3:df7f:f488:16a2) by
 AM4PR05CA0034.eurprd05.prod.outlook.com (2603:10a6:205::47) with Microsoft
 SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.20 via Frontend
 Transport; Thu, 25 Nov 2021 10:14:22 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9bba075e-8211-4192-2d8a-08d9affc59e0
X-MS-TrafficTypeDiagnostic: AM0PR09MB4147:
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	X32sj0J8NYTIR80LAH2urRmKgAOarFUdalAZOe8HJz7SxHfRbbpKEoGIUJkCQEi5akUxFEI1Z27XoT3blG26xs7t8SQZ9InPmfH+giYsFn9FcXT5XPEBLpf3iyRLN/ub4hbKHoyI1OA0Z0UQTF2cRRluTXHS5JBw1pMVcmc8qOUObvTZV7IlqlZ/4c7sVKNPd6asIn6onxYEMadGbyZfTOiMEP43bL7rkDrpcrZv9+TLc+HFgfofgk+TGjtMctn0hWiuOBoVgQD+3wHJpWzV+83x8Lbq8QDOuuq6pLEq7LzG/BrQ9tZJBwG5lzst9TrWwGpOFZdsMtE3yBR+Ve+zFxe4aEwSFNoxRa2ld/fyOsKcwQDehxvrhq4+6BKA9VLi5UlDMonYjtG4mat3jjFWv/n2MpU/zlgkMoRp9XMXvcdpHyhbDBthUgD50szHTDzPKVNPYSCpXUafXMvV/zKWO5JE4snEjv1tXvwNRZVWhY8vxcDN+IhrJJrRdWpKA6Tj1SCqMWJszzoh+dPIxVmCdCORSgTpWGy56AO/Ip55aw/phWyiJfSa5H7aEj+2ronZLqNw40HDQrYN4aBGwFANDqD30DDEP+flciADqspBSb9lOXr0uMJcL4gtMc1SwTYp2Ogti3LT5YOsfKvfbemXpnM+Ma/XWVNJeKXu+f4fOyQ=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	UQwwrucZys6ijeXqYbCLjWo3zpxT1EbFYAENGLO7vLCM3VFxvG7NTuXim6AHCVX60z+bwGfWzuSFaKNSPMOG5ni5UBA9zta4jP+KbWvvabtLP51khI+s+yXLuroKPTpg4Q6MWBGpOe44/yHbOnSQn8H8DPvVgvCHfipm4HK3fyQwLBJWS1jjE712QgPzsoyiFaJgZtVRphdLsu7UVik1INTX9csbL2+zE2OnnaCzoQ1Lju4oZ182J8Rz0tqm/4n94dBm/TV5KYn2Xmducj0h2bVXEBKiDVfKoG4vQYH5zSlX5QbIwSkn0U8D0qQ00k9Ti9VUglKs0ciTtB/U/j2bMV1wMCoEJ8pkv+WBYsvNuTNUoEs848en+L1VdopPvwSGlvgNMmCakj3vMkAirSHymap3EunLDtxCPRdhu4La23+ZUmGDOiJH718NtVJhNszlhs9fqb8eQ4CunPpAID8ZVn22EfPuu/q9s8+u3m9yfhwvJDG5fBcL1VD2TUkt234zIOyc3mT2f4DQsTp/F0sHB5p5+11yV4xuM4jsJTgLhSqIMIFgsoxFigKWBP7FGHCVbENMwIiEOjh2hzXNT9VYY/7binu+XtNn9d+o8y/hBgzS41fZnFKib5HHoSNtIlWA+iqtH9Z8cCPwGIfkzYCy4/uVFTmN+N5zoo6P0IZVHbsCxAVqfNymZiPtOQeS3yNAbhdq26wU8lLob1O8m7JEtcUMTuupc+o5qXMyBX/0HjQf/NkJhetfgogwmMwMfKDwnaqcMXSfRGX4GXLVgChG2Q==
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 9bba075e-8211-4192-2d8a-08d9affc59e0
X-MS-Exchange-CrossTenant-AuthSource: AM9PR09MB4642.eurprd09.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2021 10:14:22.9525
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR09MB4147
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 25 Nov 2021 10:14:28 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158774



On 24.11.21 22:02, Tim Orling wrote:
>=20
>=20
> On Wed, Nov 24, 2021 at 12:15 PM Konrad Weihmann <kweihmann@outlook.com=20
> <mailto:kweihmann@outlook.com>> wrote:
>=20
>     add a bbclass to disutils3 that generates a fallback setup.py in case
>     there is no setup.py available in the source dir, but a setup.cfg.
>=20
>=20
> I=E2=80=99ll check this out later, but I do want to highlight that we wil=
l be=20
> deprecating distutils bbclasses (and moving them to meta-python for=20
> continuity).
>=20
> https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D14610=20
> <https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D14610>

Not sure if we should support it at all after the rework is done.
Most of the python modules that haven't made at least the move to=20
setup.cfg will stop working with py3.12 anyway - putting some pressure=20
on the respective upstream to migrate.
So what is the benefit in moving distutils-support to meta-python (which=20
btw bundles poky/meta to openembedded-layer - a move that is discouraged=20
by a couple of projects I came across so far)?

I mean the patches currently in the works likely will affect kirkstone+=20
releases only, right? so current already released branches will remain=20
unaffected by this switch - or is there a plan to even backport this=20
change to other releases?

>=20
>=20
> We can refactor this series into the refactored setuptools3.bbclass=20
> (sans distutils). I will do this if we merge these changes.
>=20
> https://git.yoctoproject.org/poky-contrib/log/?h=3Dtimo/nodistutils_14610=
=20
> <https://git.yoctoproject.org/poky-contrib/log/?h=3Dtimo/nodistutils_1461=
0>

Fine for me - I would be also be fine, if we could use my patch for an=20
intermediate period, till the removal of distutils is done.

>=20
> I=E2=80=99d like to hear what concerns others have.
>=20
>=20
>     Use the mapping provided by
>     https://setuptools.pypa.io/en/latest/userguide/declarative_config.htm=
l
>     <https://setuptools.pypa.io/en/latest/userguide/declarative_config.ht=
ml>
>     to translate the most essential items to legacy setuptools.setup
>     dictitonary.
>=20
>     Signed-off-by: Konrad Weihmann <kweihmann@outlook.com
>     <mailto:kweihmann@outlook.com>>
>     ---
>      =C2=A0meta/classes/distutils3-legacy.bbclass | 112 +++++++++++++++++=
++++++++
>      =C2=A0meta/classes/distutils3.bbclass=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=
=C2=A0 =C2=A01 +
>      =C2=A02 files changed, 113 insertions(+)
>      =C2=A0create mode 100644 meta/classes/distutils3-legacy.bbclass
>=20
>     diff --git a/meta/classes/distutils3-legacy.bbclass
>     b/meta/classes/distutils3-legacy.bbclass
>     new file mode 100644
>     index 0000000000..266d30138f
>     --- /dev/null
>     +++ b/meta/classes/distutils3-legacy.bbclass
>     @@ -0,0 +1,112 @@
>     +# Helper to create a trimmed down setup.py from information found in
>     +# setup.cfg, in case there is no setup.py shipped with the sources
>     +
>     +# this functionality can be safely removed once the pypa community
>     +# comes up with a safe replacement for the functionality found in
>     distutils3.bbclass
>     +
>     +def distutils_legacy_package_name(d):
>     +=C2=A0 =C2=A0 # use pypi name or fall back to BPN
>     +=C2=A0 =C2=A0 return d.getVar("PYPI_PACKAGE") or
>     d.getVar('BPN').replace('python-', '').replace('python3-', '')
>     +
>     +DISTUTILS_LEGACY_VERSION ?=3D "${PV}"
>     +DISTUTILS_LEGACY_NAME ?=3D "${@distutils_legacy_package_name(d)}"
>     +
>     +python do_create_setup_py_legacy() {
>     +=C2=A0 =C2=A0 import os
>     +
>     +=C2=A0 =C2=A0 if
>     os.path.exists(os.path.join(d.getVar("DISTUTILS_SETUP_PATH"),
>     "setup.py")):
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return
>     +
>     +=C2=A0 =C2=A0 from configparser import ConfigParser, NoOptionError,
>     NoSectionError, ParsingError
>     +=C2=A0 =C2=A0 import re
>     +
>     +=C2=A0 =C2=A0 config =3D ConfigParser()
>     +=C2=A0 =C2=A0 try:
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 config.read(os.path.join(d.getVar("DISTU=
TILS_SETUP_PATH"),
>     "setup.cfg"))
>     +=C2=A0 =C2=A0 except FileNotFoundError:
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return
>     +
>     +=C2=A0 =C2=A0 def _strip(x):
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return re.sub(r"\s|\t|\n", "", x)
>     +
>     +=C2=A0 =C2=A0 def get_section(section):
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 try:
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return dict(config.items(s=
ection=3Dsection))
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 except (NoSectionError, ParsingError):
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return None
>     +
>     +=C2=A0 =C2=A0 def get_option(section, option):
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 try:
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return config.get(section=
=3Dsection, option=3Doption)
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 except (NoOptionError, NoSectionError, P=
arsingError):
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return None
>     +
>     +=C2=A0 =C2=A0 def extract_bool(section, option, default):
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 _option =3D get_option(section, option)
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if _option is None:
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return default
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return bool(_strip(_option))
>     +
>     +=C2=A0 =C2=A0 def extract_str(section, option, default):
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 _option =3D get_option(section, option)
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if _option is None:
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return default
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return _strip(_option)
>     +
>     +=C2=A0 =C2=A0 def extract_dict_vallist(section, default, delim=3D"")=
:
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 _section =3D get_section(section)
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if _section is None:
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return default
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return {_strip(k): [_strip(x) for x in r=
e.split(delim, v)]
>     if delim else [ _strip(v) ] for k, v in _section.items()}
>     +
>     +=C2=A0 =C2=A0 def extract_dict(section, default):
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 _section =3D get_section(section)
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if _section is None:
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return default
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return {_strip(k): _strip(v) for k, v in=
 _section.items()}
>     +
>     +=C2=A0 =C2=A0 def extract_list(section, option, default, delim):
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 _option =3D get_option(section, option)
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if _option is None:
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return default
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 bb.warn("%s:%s -> %s" % (section, option=
, _option))
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 _listitems =3D re.split(delim, _option) =
if delim else [_option]
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return [_strip(x) for x in _listitems]
>     +
>     +=C2=A0 =C2=A0 def quote(x):
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return '"%s"' % x
>     +
>     +=C2=A0 =C2=A0 _pkginfo =3D {
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 "entry_points":
>     extract_dict_vallist("options.entry_points", {}),
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 "include_package_data": extract_bool("op=
tions",
>     "include_package_data", False),
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 "name": quote(extract_str("options", "na=
me",
>     d.getVar("DISTUTILS_LEGACY_NAME"))),
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 "package_data":
>     extract_dict_vallist("options.package_data", {}, r"\s+|,"),
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 "packages": extract_list("options", "pac=
kages", [], ""),
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 "version": quote(d.getVar("DISTUTILS_LEG=
ACY_VERSION")),
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 "zip_safe": extract_bool("options", "zip=
_safe", False),
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 "install_requires": extract_list("option=
s",
>     "install_requires", [], r"\t+|\n+"),
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 "python_requires": quote(extract_str("op=
tions",
>     "python_requires", ">0.0")),
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 "package_dir": extract_dict("package_dir=
", {}),
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 "py_modules": extract_list("options", "p=
y_modules", [],
>     r"\s+|,"),
>     +=C2=A0 =C2=A0 }
>     +
>     +=C2=A0 =C2=A0 # In case packages is using :find module
>     +=C2=A0 =C2=A0 # we need to look for top level directories containing=
 a
>     __init__.py
>     +=C2=A0 =C2=A0 if _pkginfo["packages"] =3D=3D ["find:"]:
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 # top level search dir can be adjusted b=
y
>     options.packages.find option
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 _path =3D extract_str("options.packages.=
find", "where", "")
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 _pkginfo["packages"] =3D set(x.name <htt=
p://x.name> for x in
>     os.scandir(os.path.join(
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 d.getVar("DISTUTILS_SETUP_=
PATH"), _path)) if
>     os.path.isdir(x) and os.path.exists(os.path.join(x, "__init__.py")))
>     +
>     +=C2=A0 =C2=A0 with open(os.path.join(d.getVar("DISTUTILS_SETUP_PATH"=
),
>     "setup.py"), "w") as o:
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 o.write("import setuptools\n")
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 o.write("setuptools.setup(\n")
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 for k, v in _pkginfo.items():
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 o.write("%s =3D %s,\n" % (=
str(k), str(v)))
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 o.write(")")
>     +
>     +
>     +}
>     +
>     +do_create_setup_py_legacy[doc] =3D "Create a fallback version of
>     legacy setup.py if not existing"
>     +addtask do_create_setup_py_legacy before do_configure after
>     do_patch do_prepare_recipe_sysroot
>     diff --git a/meta/classes/distutils3.bbclass
>     b/meta/classes/distutils3.bbclass
>     index be645d37bd..f26f0d5184 100644
>     --- a/meta/classes/distutils3.bbclass
>     +++ b/meta/classes/distutils3.bbclass
>     @@ -1,4 +1,5 @@
>      =C2=A0inherit distutils3-base
>     +inherit distutils3-legacy
>=20
>      =C2=A0B =3D "${WORKDIR}/build"
>      =C2=A0distutils_do_configure[cleandirs] =3D "${B}"
>     --=20
>     2.25.1
>=20
>=20
>     -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>     Links: You receive all messages sent to this group.
>     View/Reply Online (#158741):
>     https://lists.openembedded.org/g/openembedded-core/message/158741
>     <https://lists.openembedded.org/g/openembedded-core/message/158741>
>     Mute This Topic: https://lists.openembedded.org/mt/87289428/924729
>     <https://lists.openembedded.org/mt/87289428/924729>
>     Group Owner: openembedded-core+owner@lists.openembedded.org
>     <mailto:openembedded-core%2Bowner@lists.openembedded.org>
>     Unsubscribe:
>     https://lists.openembedded.org/g/openembedded-core/unsub
>     <https://lists.openembedded.org/g/openembedded-core/unsub>
>     [ticotimo@gmail.com <mailto:ticotimo@gmail.com>]
>     -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>=20

