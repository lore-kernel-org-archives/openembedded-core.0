Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9498CD1AD36
	for <webhook@archiver.kernel.org>; Thu, 17 Oct 2024 08:18:33 +0000 (UTC)
Received: from EUR03-VI1-obe.outbound.protection.outlook.com (EUR03-VI1-obe.outbound.protection.outlook.com [40.107.103.68])
 by mx.groups.io with SMTP id smtpd.web11.44310.1729153111773607352
 for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Oct 2024 01:18:32 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@cherry.de header.s=selector1 header.b=HCu6ztsm;
 spf=pass (domain: cherry.de, ip: 40.107.103.68, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fORimOSFtZl6aMniqB5e8o6LS8S/FYQLtwZPlGGx89c+yXtVSBaMf882cJw92VaASx1de05uOzZwZRlPzv8B8Ar53dzNzyQuMIfyHHud0cvyPhzuOirbwmPMS3WGh0vQMDyZKl832VkZmPfZAIvsz/TtuT277rLFGQuKJy+lC1XcxF4zRoTr0Edh/3tsuK4gKzYZ0osn94au3UjHBeg1WDmXCurKrWjKfK/fMqB1oVn6XY3nObVnjzjuhIOwPPNEF5BbY0qr4mV1nxQTPER4w+U/+C4z6eZQ7EMSrlP2bMr1ttfw04uYYKA5AEwrD2F+S3eBWSPqQh3/m7yJ/MgIWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TvIR+d6suehZp04nxdNCh0u7DNNsFBGxn92CKv3KD6U=;
 b=LYd0mYHzAHwR9OXGDEvLPBs71/RWMfxritfbImqMWAcAfDul5HUkyeKoXBoTnjfxmPlKM7kgxf8XbmwOiCB70wr8xN2wK5poLkLux7ZTeJAJZULlDGOgcwfGaXJDc1dHGf/HlZguEmOgxEQTp77BAY9VfC3r61sUGtgRAB9wdzPqmDRWZoglF2LJE1Virfg42nM4My7n73Ec+kFfQk0WZpBgp+jJkTAL1DfEj97o5Awa+M8UL3mJeL4y6O6QG//Lib2Ny2fKqbQ4X95r29hZfZzSiF+EXFE3Z0ntUYrCvjzDGTjJUuQ83Q1iG7plmcPhumnRDZURpwHT2cxEwdbgqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TvIR+d6suehZp04nxdNCh0u7DNNsFBGxn92CKv3KD6U=;
 b=HCu6ztsmRlAHJwVSOL5Wbi3S9l8NfHowqnA/mEbBdv7ZxtZuESt5TOCNAAiN2tsfI8TkljCLMDbpXqI70zxq5Pus8bbDusHX3V+PryYT8sE/Vv2q27yEP5wskIlh4K/tAHt5HbQuJ/5/Y2MR2yZG8xu2jB5sROOzV2d4Bf2pfqQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com (2603:10a6:20b:42c::20)
 by VI1PR04MB6974.eurprd04.prod.outlook.com (2603:10a6:803:133::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.18; Thu, 17 Oct
 2024 08:18:26 +0000
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a]) by AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a%7]) with mapi id 15.20.8069.016; Thu, 17 Oct 2024
 08:18:26 +0000
Message-ID: <4a307cc0-2ff6-4d73-9c0b-21893be1e5d0@cherry.de>
Date: Thu, 17 Oct 2024 10:18:25 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core][PATCH] tune-cortexa32: set tune feature as armv8a
To: raj.khem@gmail.com, workjagadeesh@gmail.com
CC: openembedded-core@lists.openembedded.org
References: <20241016122555.21496-1-workjagadeesh@gmail.com>
 <CAMKF1srq8CNR7xuNDov3Vh4JjipFWjzuroeL35HFF=CKKS0vhQ@mail.gmail.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <CAMKF1srq8CNR7xuNDov3Vh4JjipFWjzuroeL35HFF=CKKS0vhQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: FR0P281CA0192.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ab::11) To AS8PR04MB8897.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8897:EE_|VI1PR04MB6974:EE_
X-MS-Office365-Filtering-Correlation-Id: d68a9204-41f1-4b01-369c-08dcee8445fe
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?h7/aG0mTJsrqDgZfLXbimzSkcP8w3MqBvc5s2hDWU6vH1CDFkIu135dc84Dw?=
 =?us-ascii?Q?OMVOXEK+0Lqu0aBrHf7bjq22gTwXBZCeCsLGdCoW2VN0O50reVmJxbmJa/aC?=
 =?us-ascii?Q?BQN3PvlMibueLkU9lgLq0e+3qFz+8Y9RMPAn4FqRffTxL28e5YJlRaJRV1mj?=
 =?us-ascii?Q?SwOURHO71+3INbzWgbsKSyknfcOESdR9wLy/FOCMXZpk4q0eNT5pNnHPXnNb?=
 =?us-ascii?Q?yfMDZUuheusZXVoJD42/9h7iwwoNVWZ1KpgRn7cCkBwq4NiqUzttpoBlVRbd?=
 =?us-ascii?Q?DVsYgl5YTbs6auw2MpaFghN1d74Pn1ElT60K28JTGaJqXAQp2kFAiA4s+fg0?=
 =?us-ascii?Q?NbwyI4gFdAUk+B30WfYtWURsQX/W+aWhnxVr8FDatc+Jj153oh2LwIv11sMp?=
 =?us-ascii?Q?cRomvTJDfhQZncCMjwLYRtG1ATy/jHmAcxgRTqFMydvFUh6S+jF242S8kHzJ?=
 =?us-ascii?Q?ejTPCL0hEeGan3kbAqKL02u7Zryy299lKKi1ZVeR/Vaj0gOxHlIRUTTMw1S/?=
 =?us-ascii?Q?Vi8DfE5TF0XrVmctEc5vTUrjiD7j0La59Ynq8LyzhW2/EC8xtfVDJtq5KApS?=
 =?us-ascii?Q?BZgaHwuONNilr878QLoPx71wBVvS92A6rsC44nzipUwncqOLSDjY3rfrTOjK?=
 =?us-ascii?Q?9WePe1xiC5CNC+kBycjKZETp7hNEpk+u1rk3KeV21xp53grYaMTbKpeDvNyU?=
 =?us-ascii?Q?4OY9tkij2ggqf8F2giUFouHER4MDBsFs/l6SbbTu8TV5X2mJ1kT++G+mUuAM?=
 =?us-ascii?Q?MsQ0xHPH2KEqNv2kxRSir8grXcB0va2L1rqjS1vpuzVVRtpL3azDV6a7whyB?=
 =?us-ascii?Q?puUVhI6Ga5txq99LLcelJj+Fi8V+DlvLh93zrvu2foCEk8Xr5ANNHvBsz4HJ?=
 =?us-ascii?Q?iKP/Axg3Nf1ACTjOoaSgvLFDmTfgXMrxkQg7OandxcA0p6p4xCpz397yJeyQ?=
 =?us-ascii?Q?o2S54c15AjvtV7bNe42zVuO/3WB/G4epSvzYFtpJxUnk0WR3hCQuLA7ORBrC?=
 =?us-ascii?Q?2TYkljdzrnGayssI9BCQ7vgwqUxGRG2CX/CqEGagMH3S7hOM7HqCTbO7mcoh?=
 =?us-ascii?Q?YnrlQX5BIH3sExuG5x/wHJEi3RrSHlVuojguCmLxD/teUyvS5HxY7aAXqKMA?=
 =?us-ascii?Q?dAv2lGn4cRixDKrL37rPfKHJk2yOEHD3CwQ5jUkVIyogOJJdzfxH3OvSw0qG?=
 =?us-ascii?Q?sVkrvh363zVyJ3IjovXwBnPnhedIm6VKIAwiebrucUu6BVGRlY1cp5wZX8Lg?=
 =?us-ascii?Q?6fb65LeoQ02DXFT6/i+Vbb5CXpUNq0Ftll8zNI40MyAwZX0Y+hkDFsKpKxg8?=
 =?us-ascii?Q?JU7y3vdwBamxrV3eIESr+yd0?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8897.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?VoKfRhAyXexnsDZELZxcW4UgcPMX2yPSv7vGI1MCUfAwP5QLieoV+0ET6gIr?=
 =?us-ascii?Q?3MjucMhNFIL4UMfF9xFRfx/agRgqJJ3jkkHFHE3c0VVdZQFkOqldUpFmlBA6?=
 =?us-ascii?Q?5UnfFWW9jTYmbRd5dWALWefhCz+pL11VzNbN/3kA8haDusivrSrIbRZvq3nM?=
 =?us-ascii?Q?Ek8YGb8Viw9ms+rbWOkHwtsEwMAZe45xSdDcIRFybSLg3JmwupsHQ7lPI+y+?=
 =?us-ascii?Q?jsi+XnnWeTPP/uvLShWboVQrq+nIjRwrtx/7YdjyxeuGFETk5+7h1hvzSXkK?=
 =?us-ascii?Q?9GF5IcUcjz/mC3ofTd138zbqfJkJ5Tau/Kuewu59SijtRF11G49spinIWf9u?=
 =?us-ascii?Q?1NGuh28EAbKd8Z7g9mk6HTyWjJQHfTXxy0oK4WP5HJ+4wOQpc7EqTz8WSdh5?=
 =?us-ascii?Q?qDfkGAxbp2nAVb9NE8iuDAwEkWtqUhol47o9lSKuwrce0R/M6yjd2AVyYLWQ?=
 =?us-ascii?Q?p2uF7yBZZ7cPI31RVGWcy0ORKK+xcwKg+4MqnIpfGeNUrsy81FJjD3xeq4aP?=
 =?us-ascii?Q?+es3MOs++YCjYQxNSR4QMdEer1daw9ak540co7vYe15xvnFmZP/uBwMIF/ev?=
 =?us-ascii?Q?AKvUsuJQdYtx6XekwuTRgg4fhP5sTKkZj8KYvBYwu7aGv6ZHW56cSGd3Spnj?=
 =?us-ascii?Q?pPqZPaI7tfCsm5NSx3nTT77MXUV1ZVKC0+KYT5IJTkZqs63UqkcUDWQX1Qih?=
 =?us-ascii?Q?svJgccP+Hyb6rdhNGqN6GQxdmM3l3RoNHTQs/vqzxZUYyaPaNTCGd2Ry9lU/?=
 =?us-ascii?Q?Iel+JRoryZ2al7lGi+W1Xn2PIUZJl8SfrcawBHuhivYiadHgwpSC40ysXovr?=
 =?us-ascii?Q?fYa+ohfCTDzJYlN+rh+PqATi9+azRY6DWqu+zOH66ybkteg6sRup6ai0QEgt?=
 =?us-ascii?Q?gWa/R7ac/XcFO3IDOt2xLkmx/WIKzaIQKkhRhrwW1nGtoARaovl0hzp4L5r6?=
 =?us-ascii?Q?C1ra0hp5nOXHb83jaJ5P5K/+3xtMSLOrjSCEn8dEkGcJSgjWUn5tgtd3LGkL?=
 =?us-ascii?Q?v/IeM1gIULx/5/Z+4TE1nL0n0zy1PAcKywD9d+NXjXDVXGNLBrRy5mgAR2v0?=
 =?us-ascii?Q?PN8JaFXu9OAgEGdE2kCSuxPLIqBXcTYJkgnrmdQU2n42bxr+IMLbOm4+Tldv?=
 =?us-ascii?Q?ao6k8znF1ItFZEKuF3OcP23WMlAEs3XwFcKRntwt+CVRKhTYm4GsreCDQ9WF?=
 =?us-ascii?Q?2UIE1WZgqeL6ip/d+/79AB5hbvS187IPRt0GVa0bUPnZ4d3rtLtOD65xxsPB?=
 =?us-ascii?Q?toVHwfpgR+ZqppTbQUYr39ynGJ7NkeiFaag3Q256GhG6PW4cwOvx5KwhRnMk?=
 =?us-ascii?Q?75dS38I8/fNXXF5D0vMr5OSfDlHPCnbexbvGuYANtweYSm7Ik6g81j+s7gLE?=
 =?us-ascii?Q?TUsSYMGA91EdwfSpej/ALs9k+SWYl6zATx7wknZHc9Zjz05st5ymRbu3BWxM?=
 =?us-ascii?Q?7mpoHvyZwOcbAJgTFdolVMkiUcSAgzKkSozriLq4NA7UTtGAtpBVowSA7TSV?=
 =?us-ascii?Q?Q887FCHntgJD81LmoVcHUR/aAy6DuGmmHrbjYcg3psjGjp1AYh4qozSehRII?=
 =?us-ascii?Q?1VeZVj3d6ocdNR0aLoWvVyS/mX8bgDnE3iL+44KTo76947XMI0YCM7qZR3Ww?=
 =?us-ascii?Q?zw=3D=3D?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: d68a9204-41f1-4b01-369c-08dcee8445fe
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8897.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Oct 2024 08:18:25.8930
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nrXsnaNRR6VXoBrFYBZJ1k0IGGmfN4mxasH0NELcUNWV05a29pFYo/Ky9dZcGpJuyY3inPGPDGodz7HxygjUVMq1f8fQ8As7MghKEQ0mRvw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6974
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 17 Oct 2024 08:18:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205987

Hi Khem, Jagadeesh,

On 10/17/24 3:36 AM, Khem Raj via lists.openembedded.org wrote:
> On Wed, Oct 16, 2024 at 5:26=E2=80=AFAM Jagadeesh Krishnanjanappa via
> lists.openembedded.org
> <workjagadeesh=3Dgmail.com@lists.openembedded.org> wrote:
>>
>> Cortexa32 is a 32-bit armv8a architecture processor, so set the tune fea=
ture
>> as armv8a instead of aarch64 which is 64-bit armv8a architecture.
>>
>=20
> That's right. its aarch32 only arch. This change is fine to apply.
>=20

Do we not have an issue with
TUNE_FEATURES:tune-cortexa32          =3D "aarch64 cortexa32 crc=20
callconvention-hard neon"

in meta/conf/machine/include/arm/armv8a/tune-cortexa32.inc as well too then=
?

Cheers,
Quentin

