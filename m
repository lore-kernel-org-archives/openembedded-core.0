Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87A09C83F11
	for <webhook@archiver.kernel.org>; Sat, 26 Aug 2023 10:31:35 +0000 (UTC)
Received: from smtp1.axis.com (smtp1.axis.com [195.60.68.17])
 by mx.groups.io with SMTP id smtpd.web11.5964.1693045889257344074
 for <openembedded-core@lists.openembedded.org>;
 Sat, 26 Aug 2023 03:31:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=axis-central1 header.b=U/zwEDeY;
 dkim=pass header.i=@axis.com header.s=selector1 header.b=oFUcR0NX;
 spf=pass (domain: axis.com, ip: 195.60.68.17, mailfrom: peter.kjellerstedt@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1693045889;
  x=1724581889;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=opBKYka/9D3VzI74W10GBoeaZd8Yr0GixjsZr5hZaPo=;
  b=U/zwEDeYj1xuW3RfpMGTomGNxq1dUc49+ug3CxzFUCJabHZ96YFQPmsy
   QesPB/KvLLzPIeDn8gMaw5q2lF0l4CSat9mFCeLEI3K5LH585CTx1k8W0
   8xOUEh/SVkpRnvM8eYdZiK2cDYf5Y+Zba3GOf4TNJdbQ/s7eJ94sflC/e
   SluxEV23zNofNB+bZFZt7FB5xtbGrrAHIdfH/U2Zg8ff6ikVnm3b/SQad
   iscwcW5u9eijOKLzVLlhF1YkMDItMTn82fJnRyYlIVKYFO5Z5Cx6mbQu8
   0pbbQfdy2ts5HWervKfFgBKC1hY3HD/T1OMwG1Au1CCj+KK7Nif21a398
   w==;
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Xmqk4bSTSk1CKgQBgcCdvqK2d2nHDFHziCvu+w/KymI9dSeZvHCr480NbSew00vH+12ZLiPEdafqR9brmqdSvEjwUVW9mEfdyLrjW6yMcBNGbWv2vns4asKDUtDW2To5H2Whgqhw2zSu+Hs6piiPM6/06vXXQ7x4Su730EBmbNpmRuWBBBFFOJzvtEux/a2szSrJK0xerWSsw+2nPbuPB5dN5rYlYBVNdr9XhZVjeUz5r/19GLqpa9pad4BXzMS24UYS+HAEDtBoWw0DJBst3c6xPQmL40++vttOzuYcwk+jtTu0gQilxNYI63+M1oW3YPDRWCQmK9G1qpm/UJ/IrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=opBKYka/9D3VzI74W10GBoeaZd8Yr0GixjsZr5hZaPo=;
 b=h1Cst/icfwIUay8k41ks3r85weQ06J94jIV4oOnXJHgA7/Is10kRVFR+x3ELPXNFP1y/3v4/eTSWratvhKXayreID1RTQ3StUXpu0alaXxj5fvXIWe2uIatcyy8qAjX2Y5oHwSmGZkMDqJv+vXO2tGwVN4lMyB/tJdLwou+SZbyNzaWGIiq0eTig+6l78yJdrez0Vub9WRPoHmWrosh0oennFDp56XQrbXafmHr3ZCkNZq9ZDhwd/AqDUhSbXR3Z2jm1TUvI0ARzcw53JSpf2jkJ6uR9OLp0PTPZzwStVgFoXkgO2X9arbE20kU6GLqEJA+/+vGruBP+xp5VPHiyOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axis.com; dmarc=pass action=none header.from=axis.com;
 dkim=pass header.d=axis.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=opBKYka/9D3VzI74W10GBoeaZd8Yr0GixjsZr5hZaPo=;
 b=oFUcR0NX7gY5+SzRvJSszJAUoWbK73aOrrw7wVihVGX5zmbH4sNc+UKZVjf493/29sEGSGEjluC4FYIRaRk17RwDdgm+OS5N88fLLedR0fg+3s1BN/+Np3TTadVUK0oH6yaRLlpJsKeFNguLcjwO18yHKXOF3ejwmeEyKzkVALY=
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: Adrian Freihofer <adrian.freihofer@gmail.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
CC: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: RE: [OE-core] [PATCH v3 01/13] vscode: add minimal configuration
Thread-Topic: [OE-core] [PATCH v3 01/13] vscode: add minimal configuration
Thread-Index: AQHZ16Nmnuvoo1el4EuiYfEa6x7qfK/8YQpA
Date: Sat, 26 Aug 2023 10:31:22 +0000
Message-ID: <DB5PR02MB102131FBF97F15D1A10F95B94EFE2A@DB5PR02MB10213.eurprd02.prod.outlook.com>
References: <20230825222711.2735745-1-adrian.freihofer@siemens.com>
 <20230825222711.2735745-2-adrian.freihofer@siemens.com>
In-Reply-To: <20230825222711.2735745-2-adrian.freihofer@siemens.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axis.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB5PR02MB10213:EE_|VI1PR02MB6128:EE_
x-ms-office365-filtering-correlation-id: 0e8b50b9-341a-47da-10cd-08dba61f97ca
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: R0HiGy6MovfdbMhXuKdxon21BewFNNdlGk/Z1WTJs99qAw+2EqcRTjjhuMw99TepcxL5nxaHsdlSJrsVINGLwIVryHyW4skzoSCC9kXattRzrRQ0fxt/Ftu4L4rMp6Hudj7DUjCxJ8zKYZ4lpx7dMu2E9a0NfOjKkYrrn75wluz2xr6YPMoIIzekKR5dfwV+B7n2MhlyYOpkt/nBxyr4yuWSgVlMY77/u7PSK9zhzNw9A2CASd8LIVX9uSGFTnIz/nsMk5ZFJY70fHQGN0zcF3Nk4m7VsAtwoMskd3EJvvi1VAJyCvR/WvWcl1oxBqEs26zmQNu+u9/+hhwpnGn6KneLalsx3s5scrvqovovwyQcjc0vibjt7pkm5Hmw3sMNGuf3iGL+GvEy3Gi2IsYOU5kujp1fN0OkYeyTVVtJvb4oT/BevS/rdZ1rzjFzceHw86W0KR0KIkLQUrJNBtCqXbkCWWBfbpdfkiQAFy1FE37YFziDceQymu/fOZNGloAPTvkeuxnHF2lif5UUa0qi4Os/GNVpbY56ZlnAyfxftMKuaRiGpJU9N6lnpjQBVXGBlKSC/LWQZhrHTcGfPFAKmFq+huvdJJd1F6ovXYbbdE0GgotgNCnr0tnWc13aNkcY
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB5PR02MB10213.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(39850400004)(346002)(376002)(366004)(136003)(451199024)(186009)(1800799009)(478600001)(122000001)(83380400001)(26005)(9686003)(53546011)(55016003)(7696005)(6506007)(71200400001)(86362001)(44832011)(33656002)(5660300002)(4326008)(2906002)(52536014)(66946007)(316002)(76116006)(38100700002)(38070700005)(66556008)(66476007)(8936002)(66446008)(64756008)(8676002)(110136005)(41300700001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?nrY6cxxTPUGdZZYLHtgKTYY5fue/ADPIv/2+M4YQusG82IzbyTNbCnOe11fF?=
 =?us-ascii?Q?N6NThpIULLKROuxyr95MnHofVlSFmu8zyBshh7qDPUsFIB2iolGT8QdT7tQT?=
 =?us-ascii?Q?2bs9t+4ftPUHP5dGrWh5z5zJlcL/PAGF05yS8I7hWwJ6nFepfheWIGxOzxpm?=
 =?us-ascii?Q?ZQo3Jc2z2+c/QsDHi9Hy/hRa6N/etVOzqxkFKlrFk5TuGNrbFtdZqHNuMlIl?=
 =?us-ascii?Q?7rR/vaMGiVQnKq6jb4gT3AId4qMsEHJ5UXa8vkhkbflYZiEHfdAWyiaFiCw5?=
 =?us-ascii?Q?IKlhsuTWeCbnUBE3tnITFJ4EjjKphSjXXnQUSmNvo4RsfBMTqYX234i8VZNq?=
 =?us-ascii?Q?RpMkFK2XSJ1S4d2gFZ+5cy5pK2i1NPleNwwTI5dzKbl9esYDI9cgsULYvby/?=
 =?us-ascii?Q?rCDyTd6VN183/o0SwCRANxCuz3E82zAobMlHlm95lVa8uia6w9CLauTFwV2m?=
 =?us-ascii?Q?j5l2UtM0vxco3nJPIi7xwEyt6yI/kdIpOa6RLINTthPWAl4385gatJY8sUHS?=
 =?us-ascii?Q?35jFywp1oLyaKYblSfUeVds+PQ0OsxAEGcTX2A30sHYkosIMRMW2357gnIin?=
 =?us-ascii?Q?WcTL0l0NQDxVfuxDjjVSbmObm3qG/hI7XWx7Vuz8DDVlgagV1CiG9iIrtq41?=
 =?us-ascii?Q?hPQJGSoMO3E4E09yOfrqMpck5KuMwoRKtV27rE3W2mSZmDDHXcmic/40U9kF?=
 =?us-ascii?Q?WbGm8y9gUVQeN/QkXtgwKE2lsJaOZM12fSJv11e/B+XpNrjX0JGML/IwNTiE?=
 =?us-ascii?Q?Nt6cmc7Q/AbDtTtdiLIM+TSn1sGxlPfxM6NIPSqddkOrvf3+h2XlCdnkctaQ?=
 =?us-ascii?Q?DXfL0P5bKJZjsK0ZHJuLRLBB2B7BNaeVL/WNHFHOeVpN6+zfyyZyo8r8q951?=
 =?us-ascii?Q?XMMJOf0roIxGREReHV3CRheFIxFlx8fCULV6NgacbgFufKe/0LHEabOkEU5I?=
 =?us-ascii?Q?PT1uyyrFFhQg/TWiZBSd31Ah9GVBHb4avcds2Wcs5r23dTK+BA8GsOg3U+EL?=
 =?us-ascii?Q?vN7PCTDippYwKH46Yf9LHRh4gw3LCftVXDkV2TlcGqmF4RE8slUBBOhymuGm?=
 =?us-ascii?Q?s1oRq/u9PVEBH3RMC7EvrkcOl692JLucjlO1BwOsCFacz4noh6V7+Z+DnxQp?=
 =?us-ascii?Q?v272c98YDkExHMmlVH+mWjdb9txQaE+zKVwFZ28AXTgR7MRcYeIWeOe+3mPj?=
 =?us-ascii?Q?7VREGI2sHeTayZ1pWOKB3M8IZYENTgAG9iaoPqWpBeXl7n4nOl6T+Pari5OI?=
 =?us-ascii?Q?Mx7N/iSPLL9BqblxSmXbRrfk+qR5LmhthKnlY89YzfnN51y9aO9/HElUINBX?=
 =?us-ascii?Q?Qz9DHJU8CJ2WUARYQ0X9QHmDkZM6coFd+XTy0Sc6YY4YgcVCycnbBPiGRyHn?=
 =?us-ascii?Q?hq54Z7oTn1mBFxbVhopasR+p7q7MliemFXWwevnx1Cyx4OazTamqhci6s2yL?=
 =?us-ascii?Q?EG4Kop8RWULOmgu486l3bTxQ9aJdXU9g2f7cRpE3r9m5Xi8/UUB3aSrMUwp8?=
 =?us-ascii?Q?H9aYGAw8ggSxt9IEsEy7UP69n0Oc0f+BSBd7BkriQxuajwb8MA3qfPvWpZ9e?=
 =?us-ascii?Q?7ADORjLXclqyjNFHNg4=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB5PR02MB10213.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0e8b50b9-341a-47da-10cd-08dba61f97ca
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Aug 2023 10:31:22.3779
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: MKZ82v6rEjYhjKkPPNtslskZcZaZl8J6Z9Um3B1FG7F5Kwryga6j+z+BuH7I4r8O
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR02MB6128
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 26 Aug 2023 10:31:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186743

> -----Original Message-----
> From: openembedded-core@lists.openembedded.org <openembedded-core@lists.o=
penembedded.org> On Behalf Of Adrian Freihofer
> Sent: den 26 augusti 2023 00:26
> To: openembedded-core@lists.openembedded.org
> Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
> Subject: [OE-core] [PATCH v3 01/13] vscode: add minimal configuration
>=20
> It is essential to configure VSCode indexer plugins to ignore the build
> folder of bitbake. Otherwise, the indexer plugins run with 100% CPU load
> until an OOM exception occurs. In practice, this makes VSCode more or
> less unusable for working with Yocto until a file like the one added by
> this commit is deployed before VSCode starts. From the user's point of
> view, it is not obvious why the system runs at 100% CPU load and
> eventually crashes.
>=20
> It is even more misleading that VSCode starts the indexers immediately,
> but does not stop or reconfigure them when the ignore list is updated.
> In practice, this means that every time the ignore list is changed,
> VSCode immediately starts indexing the build folder until the OOM
> exception stops it. Depending on the system's OOM handler, the entire
> build machine may crash.
> Particularly annoying is the Python plugin that ignores the general
> ignore list and requires an extra ignore section.
>=20
> Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
> ---
>  .gitignore            |  2 ++
>  .vscode/settings.json | 29 +++++++++++++++++++++++++++++
>  2 files changed, 31 insertions(+)
>  create mode 100644 .vscode/settings.json
>=20
> diff --git a/.gitignore b/.gitignore
> index 8f48d452dab..f6ce090b5fc 100644
> --- a/.gitignore
> +++ b/.gitignore
> @@ -36,3 +36,5 @@ _toaster_clones/
>  downloads/
>  sstate-cache/
>  toaster.sqlite
> +.vscode/
> +vscode-bitbake-build/
> diff --git a/.vscode/settings.json b/.vscode/settings.json
> new file mode 100644
> index 00000000000..4c941d47444
> --- /dev/null
> +++ b/.vscode/settings.json
> @@ -0,0 +1,29 @@
> +{
> +    "files.watcherExclude": {
> +        "**/.git/**": true,
> +        "**/cache/**": true,
> +        "**/tmp*/**": true,
> +        "**/downloads/**": true,
> +        "**/sstate-cache/**": true,
> +        "**/vscode-bitbake-build/**": true,
> +        "**/workspace/sources/**": true

You should include workspace/attic here and below as well.

> +    },
> +    "files.exclude": {
> +        "**/.git/**": true,
> +        "**/cache/**": true,
> +        "**/tmp*/**": true,
> +        "**/downloads/**": true,
> +        "**/sstate-cache/**": true,
> +        "**/vscode-bitbake-build/**": true,
> +        "**/workspace/sources/**": true
> +    },
> +    "python.analysis.exclude": [
> +        "**/.git/**",
> +        "**/cache/**",
> +        "**/tmp*/**",
> +        "**/downloads/**",
> +        "**/sstate-cache/**",
> +        "**/vscode-bitbake-build/**",
> +        "**/workspace/sources/**"
> +    ]
> +}
> --
> 2.41.0

//Peter


