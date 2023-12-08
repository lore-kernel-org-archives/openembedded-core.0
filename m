Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33C12C4167B
	for <webhook@archiver.kernel.org>; Fri,  8 Dec 2023 23:38:57 +0000 (UTC)
Received: from EUR04-DB3-obe.outbound.protection.outlook.com (EUR04-DB3-obe.outbound.protection.outlook.com [40.107.6.77])
 by mx.groups.io with SMTP id smtpd.web10.27096.1702078736095731913
 for <openembedded-core@lists.openembedded.org>;
 Fri, 08 Dec 2023 15:38:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=selector1 header.b=e8/XrR7E;
 spf=pass (domain: axis.com, ip: 40.107.6.77, mailfrom: peter.kjellerstedt@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FttrL/sT22+R+bNDrevvTbBFUE7edA31I06avAZyx9Myam4Wa8f6xn/TDXKmKrGXHfvtZFczOz36iKuxSwZT69hsp8vI9BSUpiOuMqI96YkYSCnIGWv4grd1aqBO3mRfdQvtuXYI6T9LdRJmpBCAc/PTQIM01hNMEhzq99S9ZO0taqdSJEvQ9yBGB0x7yd720iqycBJvl/fgm1lBH7KaCMGL+wvx8aDGzzcErhGbSZKSb9D/376ScMg4HT6fx/PDYswqU4xoo54U9uFp/wJKwRrawm3ECbykhurN6axjQtg5yH1GwKmkg+7DCuPaEcF2unXG6b8WJ+2JcObtzcAdLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6e2QEsWIQSiebsqO1vAh2CdTzDM01P5vvAN51qdRfjQ=;
 b=V+oIm76cB2+AfKsfQu8ti4k4UuTAcg68jFrL4/TlGVh5sFbiWEYr0cNVHwIyOB1BaRNO/m2j79FP/1mT0Z4cBK8vJXmlfYzCzqwegI9xqAE2mNSdfu3HuYD/sQcLCeovq3jmii9KfC7OdBqCacbbhx+4jrdmsPSQtGUL1tG00NcxDVpLAspRxXT/+XMpNEdA/8rVtZe7BPYpeIUI5mMrXOroZcaAQGVuddBSCn9oKcfinkjOFZGridxtScqQLQMT0Ou+COOSHOBGFaJqy0TyzQyfeEiMH+ypYpGp3e3EtlvOWdQk6aO2b2VAxu7FwsJ6ymRoVr/gookuM9YyMCkLLA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axis.com; dmarc=pass action=none header.from=axis.com;
 dkim=pass header.d=axis.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6e2QEsWIQSiebsqO1vAh2CdTzDM01P5vvAN51qdRfjQ=;
 b=e8/XrR7EWzyY0XeihSyvxxF8r1L0dgKgBj/mQiZ/+UAhsKxeuHtfnO/Up2oxft2/q5zFIjjAPPvDx8FUvEEjvTdHNV/HyklHRdbeyZhZxK2BO2I8dCa8F7DN+OQZFAynEIgWSgargKpR3mVKDoZchg2bGPZuaECJ7KaZ/0RlkAs=
Received: from DB5PR02MB10213.eurprd02.prod.outlook.com (2603:10a6:10:4a8::17)
 by DB9PR02MB7002.eurprd02.prod.outlook.com (2603:10a6:10:22b::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.28; Fri, 8 Dec
 2023 23:38:52 +0000
Received: from DB5PR02MB10213.eurprd02.prod.outlook.com
 ([fe80::7d13:15f0:2292:6962]) by DB5PR02MB10213.eurprd02.prod.outlook.com
 ([fe80::7d13:15f0:2292:6962%7]) with mapi id 15.20.7068.027; Fri, 8 Dec 2023
 23:38:52 +0000
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: Tim Orling <ticotimo@gmail.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core] [PATCH 4/6] recipetool: add python_maturin support
Thread-Topic: [OE-core] [PATCH 4/6] recipetool: add python_maturin support
Thread-Index: AQHaKWMkH/bnyflKU0yuVN3hmADFfrCgC9wQ
Date: Fri, 8 Dec 2023 23:38:52 +0000
Message-ID: 
 <DB5PR02MB102131DCF2E3B74419CAE99C4EF8AA@DB5PR02MB10213.eurprd02.prod.outlook.com>
References: <cover.1701989368.git.tim.orling@konsulko.com>
 <1c44ffa9837ab6c7a8ea24a2f69eafb38838fb45.1701989368.git.tim.orling@konsulko.com>
In-Reply-To: 
 <1c44ffa9837ab6c7a8ea24a2f69eafb38838fb45.1701989368.git.tim.orling@konsulko.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axis.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB5PR02MB10213:EE_|DB9PR02MB7002:EE_
x-ms-office365-filtering-correlation-id: ed36463c-084a-4726-efd7-08dbf846d5f6
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 hQrD1KDjtUdZ++1+VbXUM4ULTj8ktihHcuGCfKhZnie+HEqVTHQqZkvNysmRueSj+3OiYyLbygjIbCO5RmFI3pCa2LHu3QJ354b09o8AZfqqjhAtpCBSiaCappl4ki4jdxbP7mYXwRZM9M6KYuAYSPyI2smt5oRjpyfXFzpljXoPf3iMsmNE3JVJ+xLZ0r1rasYR0JHCwHrOu8zKTN3vsMoebCqGag2CEvbhJ4Y0CIecFuJLZFO0QwHiLPsLTaqkcUjWa9b62i4MoxAdbHVVyii5tPVpID6rz60ES+o+ViK2smoRbsKNPLG4bDG4BtY+EkJj/VZ9dl31+N4/nBUeX9Buqu4OnT1lbBbXB2cfffTE+67xGRIHhOxlB2so8C6KyPvxR2J2TfyFkRGjawMqPIAxP66OvI8SY22vELnVmf0QsJ4gnjViCF3GDO/RYLAJ8dC7to5Ije9NjuE/AgpIU6oftywzzA0avCra6Yy5BKrMvHPbEQiNfIjfDyaL+k70SfTTLLw95N4fG/wWq21AAnSLfgKqFU3Np6vJM9DeU+HyYzSTDLWIEdy3780x2kkE2mS1VEQaL47i79uFBBOcofBvDKMfOMHdcKtmk5Uut1Y=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB5PR02MB10213.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(346002)(396003)(39860400002)(136003)(376002)(230922051799003)(1800799012)(451199024)(64100799003)(186009)(2906002)(8936002)(8676002)(44832011)(52536014)(5660300002)(38070700009)(41300700001)(26005)(71200400001)(33656002)(83380400001)(55016003)(86362001)(38100700002)(122000001)(478600001)(110136005)(316002)(6506007)(66946007)(76116006)(66556008)(66476007)(66446008)(64756008)(53546011)(9686003)(7696005);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?c1yePWTW8NyvWhM4jrzotc/HIkS9gGfmry8gkphkssd4oB+9/+b/sbI2nY9b?=
 =?us-ascii?Q?T1gtg5YuVo/C255GrXeJ65cJBcCyl2fmHOWhgx7YOS0HSzZ51wOBsorFjOZp?=
 =?us-ascii?Q?wF8W722mcorgJdTLzbb10zHUSBcZJm7DWi0+zRtvu0WaXpx0ZJ1PwXKvN0Sn?=
 =?us-ascii?Q?1u5pkXtEyBEzbBOanbEcgQbgW1j2u5byoPBNTnGfBkwkvXkWs66f2GJAyI3o?=
 =?us-ascii?Q?dVMDcXfgahPKepEan9YfVh1GAxpBCHc8BRhJRaFUtAo1cNVyj4KD7NBGRdEL?=
 =?us-ascii?Q?M1H6uLDDmgTzSkMeNpMPql2W8leJ6m7xSuLOQBDQ03wO4FvAQAAUFrgWWSfn?=
 =?us-ascii?Q?InC6Vyr9DfrkDMpuX/BTcA724/go5s7tgZMxQfX70O8/aHKjZWYcN079s8Cr?=
 =?us-ascii?Q?3dC6q4GjhUxiUPlUSitL/aVxYPhRBiRA0N9UJ8q4T0a3WviMC0hXt+SNTE6y?=
 =?us-ascii?Q?hgW4cMh4xXOPUh9T7yt6C/hgy+E0zR85yvhqAlEIyJZJe2WrBVJdHBSxeeFl?=
 =?us-ascii?Q?RJWRM3l08+THyVt5Uto7QwyTk1E/zZf+sFCosUXxo0h07XQt5+encBGoPPN6?=
 =?us-ascii?Q?kMRsif1pWauz6RIWL1k1YMSc/ZJq+NkXaLLTm+WHsEwJOwY/qxyZvDQ08Pqe?=
 =?us-ascii?Q?WWXZQOslO5mDTvUH8MnHpfj+3uxw8jl6MC778+5xj4QrkKoMNk1aYQ4ANAyp?=
 =?us-ascii?Q?fxVxOn2iAKeBr1V4IboZKZ9vBxJuLgkcxEW7Qx5+JAsdZ6cIiOONRwX/qweL?=
 =?us-ascii?Q?F8FS7skct21kLN3NC4PKDrtf2XE5KJ3w65qx4M4tgfhyCdlk7V37BC3PWD8G?=
 =?us-ascii?Q?/LFV/in5xNcErYyTJw/x4yIRVMTW1edm+gR3bPSaDWEHyFgYkq/6eNRhGs2Z?=
 =?us-ascii?Q?G6tG2jO3nbaanFpCCWsZPo9eEc8gCmrH/mmSaln7C6snODhCSSEsN5THU8SU?=
 =?us-ascii?Q?I9rAnVCchIDMvUpyzLQOAqotUr3e9J3kPs9sP6SIXt7s1THwVBHK4egT+BaH?=
 =?us-ascii?Q?82NZTBIoR9XnsxheuWUQ8a7n/lNUhxKZwfoGUydOIf3nY9X54arZnvErcwoE?=
 =?us-ascii?Q?nsluX16HSebLFboEi8PIzzxBkIc5VORgF3edqgTqiNx7gtWL4xPbeqziBe9l?=
 =?us-ascii?Q?Eotyrx4GIxA+xX4oRlXt9A8zUtQksYJWJmq3W8tJczDwraNzGsxQ0vPvRYGf?=
 =?us-ascii?Q?DS/WbGOsB/e6eLqSJQjJzg0oLTKtwRjtKMyL7T3DGZz0xCWVpo6miJeKyLRj?=
 =?us-ascii?Q?PIr1nE/MahIzwLQntm3aZd+QdCIdtEv3GqurXhsOE6/wTmc/i5Gt4gxsVsmF?=
 =?us-ascii?Q?o+xsSv50pruB/sWH5brdDi3nIAQpJG2lVLY0lBx53u4nPKhhCAU7XghKi3CS?=
 =?us-ascii?Q?ejPqR4YdUfdiZ+1sZdShjvxapoW2RaTgTMZr0apgSyZzlN1FzzWOvuAJW50V?=
 =?us-ascii?Q?u91p2qeNcDc8ok8bkfPxTIiK1eOqgYgaiTJupXUZmPlf15zWIN5LYBL5g6OT?=
 =?us-ascii?Q?LNQxyNYwIShzZ1CYZygXEPoE0YSX+JhESKE3ZmTwbz72l9+Mkx7cpd3zirTg?=
 =?us-ascii?Q?kXnlJQG5gsTYjWC1yuw=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB5PR02MB10213.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ed36463c-084a-4726-efd7-08dbf846d5f6
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Dec 2023 23:38:52.3966
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: tBQ4xh26S7P6c0RLa4It473/mZHmpuSPEoZrj6VQAR4yRWd5A5z8FvJtlQamgyZz
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR02MB7002
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 08 Dec 2023 23:38:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192087

> -----Original Message-----
> From: openembedded-core@lists.openembedded.org <openembedded-core@lists.o=
penembedded.org> On Behalf Of Tim Orling
> Sent: den 8 december 2023 00:13
> To: openembedded-core@lists.openembedded.org
> Subject: [OE-core] [PATCH 4/6] recipetool: add python_maturin support
>=20
> Add the new python_maturin PEP-517 backend
>=20
> Add selftest for 'pydantic-core' pypi package.
>=20
> [YOCTO #15312]
>=20
> Signed-off-by: Tim Orling <tim.orling@konsulko.com>
> ---
>  meta/lib/oeqa/selftest/cases/recipetool.py    | 34 +++++++++++++++++++
>  .../lib/recipetool/create_buildsys_python.py  |  1 +
>  2 files changed, 35 insertions(+)
>=20
> diff --git a/meta/lib/oeqa/selftest/cases/recipetool.py b/meta/lib/oeqa/s=
elftest/cases/recipetool.py
> index 55cbba9ca74..ddcacaa73c7 100644
> --- a/meta/lib/oeqa/selftest/cases/recipetool.py
> +++ b/meta/lib/oeqa/selftest/cases/recipetool.py
> @@ -611,6 +611,40 @@ class RecipetoolCreateTests(RecipetoolBase):
>=20
>          self._test_recipe_contents(recipefile, checkvars, inherits)
>=20
> +    def test_recipetool_create_python3_pep517_maturin(self):
> +        # This test require python 3.11 or above for the tomllib module
> +        # or tomli module to be installed
> +        try:
> +            import tomllib
> +        except ImportError:
> +            try:
> +                import tomli
> +            except ImportError:
> +                self.skipTest('Test requires python 3.11 or above for to=
mllib module or tomli module')
> +
> +        # Test creating python3 package from tarball (using maturin clas=
s)
> +        temprecipe =3D os.path.join(self.tempdir, 'recipe')
> +        os.makedirs(temprecipe)
> +        pn =3D 'pydantic-core'
> +        pv =3D '2.14.5'
> +        recipefile =3D os.path.join(temprecipe, 'python3-%s_%s.bb' % (pn=
, pv))
> +        srcuri =3D 'https://files.pythonhosted.org/packages/64/26/cffb93=
fe9c6b5a91c497f37fae14a4b073ecbc47fc36a9979c7aa888b245/pydantic_core-%s.tar=
.gz' % pv
> +        result =3D runCmd('recipetool create -o %s %s' % (temprecipe, sr=
curi))
> +        self.assertTrue(os.path.isfile(recipefile))
> +        checkvars =3D {}
> +        checkvars['HOMEPAGE'] =3D 'https://github.com/pydantic/pydantic-=
core'
> +        checkvars['LICENSE'] =3D set(['MIT'])
> +        checkvars['LIC_FILES_CHKSUM'] =3D 'file://LICENSE;md5=3Dab599c18=
8b4a314d2856b3a55030c75c'
> +        checkvars['SRC_URI'] =3D 'https://files.pythonhosted.org/package=
s/64/26/cffb93fe9c6b5a91c497f37fae14a4b073ecbc47fc36a9979c7aa888b245/pydant=
ic_core-${PV}.tar.gz'
> +        checkvars['SRC_URI[md5sum]'] =3D '1eb13c211147496c1c9484ff7f8ac4=
38'
> +        checkvars['SRC_URI[sha1sum]'] =3D '0803a731aa793f3eaf4d52f656d73=
00408ca0b36'
> +        checkvars['SRC_URI[sha256sum]'] =3D '6d30226dfc816dd0fdf120cae61=
1dd2215117e4f9b124af8c60ab9093b6e8e71'
> +        checkvars['SRC_URI[sha384sum]'] =3D 'cca6d9f0ba72ff92e16aaf3d6c6=
28b8df33bdf244cc39c9d59cff9d541f35d4e87ec136e6 0e4b040ad73c5c69b27cec6'
> +        checkvars['SRC_URI[sha512sum]'] =3D 'e6c3081dfa58d9b59f8c33dfe80=
712d732ac3048a2f8240f9a0f5448d9bfc83e222c1e08b8bb49779b84f685c3bec3060cc935=
c113a818b1ab8aa955f3df2238'

After my recent changes to recipetool, only the sha256sum shall be=20
present here.

> +        inherits =3D ['python_maturin']
> +
> +        self._test_recipe_contents(recipefile, checkvars, inherits)
> +
>      def test_recipetool_create_github_tarball(self):
>          # Basic test to ensure github URL mangling doesn't apply to rele=
ase tarballs
>          temprecipe =3D os.path.join(self.tempdir, 'recipe')
> diff --git a/scripts/lib/recipetool/create_buildsys_python.py b/scripts/l=
ib/recipetool/create_buildsys_python.py
> index 9312e4abf13..9bebb3061b1 100644
> --- a/scripts/lib/recipetool/create_buildsys_python.py
> +++ b/scripts/lib/recipetool/create_buildsys_python.py
> @@ -668,6 +668,7 @@ class
> PythonPyprojectTomlRecipeHandler(PythonRecipeHandler):
>          "poetry.core.masonry.api": "python_poetry_core",
>          "flit_core.buildapi": "python_flit_core",
>          "hatchling.build": "python_hatchling",
> +        "maturin": "python_maturin",
>      }
>=20
>      # setuptools.build_meta and flit declare project metadata into the "=
project" section of pyproject.toml
> --
> 2.34.1

//Peter


