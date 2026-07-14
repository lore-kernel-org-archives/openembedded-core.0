Return-Path: <joerg.sommer@navimatix.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E479C44501
	for <webhook@archiver.kernel.org>; Thu, 16 Jul 2026 06:38:54 +0000 (UTC)
Received: from DUZPR83CU001.outbound.protection.outlook.com (DUZPR83CU001.outbound.protection.outlook.com [52.101.66.73])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6832.1784183924159615952
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Jul 2026 23:38:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@navimatix.de header.s=selector1 header.b=xFpFqQw0;
 dkim=pass header.i=@navimatix.de header.s=selector1 header.b=xFpFqQw0;
 spf=pass (domain: navimatix.de, ip: 52.101.66.73, mailfrom: joerg.sommer@navimatix.de)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=navimatix.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=n+CtwyyFDkf+3BYbcfiEXtugyx0ufqq7VxUuoNW6mDQ=;
 b=xFpFqQw0nHLzxj7xlyDrQdeDqpBeJpfherd136x4Sr2c/YQcId48hb73xJIvPpcF3OHZyYjSeJIRvDmLQCRn/1yUiaftfhybvGfBiamBGV3ubmxXV7VSkngKqah3Lrlrl/ESszPHjOOX6dm//LhXu15L2TlcsOud5ezbMn5BCRs=
Authentication-Results: dkim=error (no key for signature)
 header.d=none;dmarc=none action=none header.from=navimatix.de;
Received: from GV2PR01MB11835.eurprd01.prod.exchangelabs.com
 (2603:10a6:150:2cb::8) by DB8PR01MB6518.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:15c::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.11; Thu, 16 Jul
 2026 06:38:40 +0000
Received: from GV2PR01MB11835.eurprd01.prod.exchangelabs.com
 ([fe80::d5c3:2dea:3d98:25fd]) by
 GV2PR01MB11835.eurprd01.prod.exchangelabs.com ([fe80::d5c3:2dea:3d98:25fd%3])
 with mapi id 15.21.0223.011; Thu, 16 Jul 2026 06:38:39 +0000
Resent-From: =?utf-8?B?SsO2cmc=?= Sommer <joerg.sommer@navimatix.de>
Resent-Date: Thu, 16 Jul 2026 08:38:37 +0200
Resent-Message-ID: <alh8bb0PDhcbESCt@navimatix.de>
Resent-To: openembedded-core@lists.openembedded.org
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Q3gu4e22iKILJQRbgnJoCcR775Z1dQQ7CktbDs3jz2ZWQumpOv2AmBmIrl+U+1SDlwboCEG6vAk33XWB9ouUGG5j+bhjRPYzyxdl9MrnjlxlCgNJiku7bVkUmKBHqvY7pKnKHx6Zp2iB2xFe4cA56s9JwNMxzTw0JoJgNQqkTH+emucCCZOsig1YA23n7ci2htUlVWWxKSNw+cwQTUA15ezNp+sSPiUTUd8Vt360COrAAuyIN9PwUGGjS4ygY1R2WnsenLeac/Y3R3dpSBrY2Xyxxf8Ef68D4tgwLJVrynXRUID1kBtjD1tuYoEE6vdrK6gwYiTUC5nUEzzHtRRWkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=n+CtwyyFDkf+3BYbcfiEXtugyx0ufqq7VxUuoNW6mDQ=;
 b=RqaywT4/7IQ/3cN88v1uX8ovKCg4SmGqAaiqLex/dfG+SUsogtlVRdkbnOXTUr+59xw97afNFdOnnjX5gtDGPjPbssTqZ+NskX2QEob1hbKu1rkTTbUPGNp21yfFqIPvgtXSh0qtacdZl9HVAI1rjOHvOLx31xYulMardRkDJmPM6/Vo9p0nSbn0+24MljbNjwzieHgsS5x05sa4eqkfx85eqh0lN8RSJhkX8CnB72IyyvxkOTnyh7XcQvkskmRzcA/1kkDGE4SkOVnJoUD0buQz6jhbwU/m9yKBOoHP0+mAeOz4kcRD0GCACAODzgc7Z5Ha5CHDQro8wWc+tO0NEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=navimatix.de; dmarc=pass action=none header.from=navimatix.de;
 dkim=pass header.d=navimatix.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=navimatix.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=n+CtwyyFDkf+3BYbcfiEXtugyx0ufqq7VxUuoNW6mDQ=;
 b=xFpFqQw0nHLzxj7xlyDrQdeDqpBeJpfherd136x4Sr2c/YQcId48hb73xJIvPpcF3OHZyYjSeJIRvDmLQCRn/1yUiaftfhybvGfBiamBGV3ubmxXV7VSkngKqah3Lrlrl/ESszPHjOOX6dm//LhXu15L2TlcsOud5ezbMn5BCRs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=navimatix.de;
Date: Tue, 14 Jul 2026 14:23:10 +0200
From: =?utf-8?B?SsO2cmc=?= Sommer <joerg.sommer@navimatix.de>
To: Joshua Watt <jpewhacker@gmail.com>
CC: <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH 3/4] base-files: Install /etc/mtab in a
 systemd-friendly way
Message-ID: <alYiaN1VdtUYB7V_@navimatix.de>
References: <5380f2caab9ad346667be7997955839e0825c8bc.1783357184.git.joerg.sommer@navimatix.de>
 <4baea9df11ee5e91a5a425a63d91fcb4b22d03a2.1783357184.git.joerg.sommer@navimatix.de>
 <CAJdd5GYCYRiXjb9c9DNhvXJhAMt22hLtEVrseh-4N6t237+Gog@mail.gmail.com>
Content-Type: multipart/signed; micalg=sha256;
	protocol="application/pkcs7-signature"; boundary="w3snnpgrv2b7p2bw"
Content-Disposition: inline
In-Reply-To: <CAJdd5GYCYRiXjb9c9DNhvXJhAMt22hLtEVrseh-4N6t237+Gog@mail.gmail.com>
X-ClientProxiedBy: BE1P281CA0273.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:84::17) To GV2PR01MB11835.eurprd01.prod.exchangelabs.com
 (2603:10a6:150:2cb::8)
X-MS-TrafficTypeDiagnostic: 
	GV2PR01MB11835:EE_|VI1PR01MB6224:EE_|GV1PR01MB8529:EE_|PR3PR01MB6620:EE_|GV2PR01MB11835:EE_|DB8PR01MB6518:EE_
X-MS-Office365-Filtering-Correlation-Id: 16d08b6e-e028-4f4c-5dfc-08dee304dee9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|35042699022|14060799003|1800799024|366016|376014|23010399003|4143699003|56012099006|18002099003|22082099003|10067099003;
X-Microsoft-Antispam-Message-Info: 
	aAufTR3ClKTFC5KsKVIwHPKfP35CQCahiqYdzV38hYdV0UnbMJN13du2HZtz5xddhqcmpa4etG/pjcKasosvYab7TS73bcq8/yg1SRGf9+FUgIJX55oN7MkxQFLcAY0/SPyR9t+j7xO8KxZrpYVv+k48Pgh+UPsbD3vIT7RHh4PDoD97kL1NcKUriyNkIMTvY3q8sQgRwFReyCXSU63ktRWcoEnANTD2M1RO1IcteRWFi3/Ndb1pfaVBl0HcDB4OT+BzT5wJlTQ8rutcWeBwZHh+1epWi/aY7Azo/NRta7OBbhosYbfZUqCOXQAquEaq4uhSLPJCwnzXSZXCROO1c4Oa8N6wPWziJTUui1PktyFcZb/xDI2OixLpW9WoMD6L2fmcmIJCdY5yveav6isSKI3pz52AGiGrhva3HIkX3RBBmDSbi9twgABb3/AE0oUGPxtoLCByeX2iHKIYhuQ8NOeWnNFZwUh+70XjeYW3rAW1zQGQZkQ6PVwmlm85TLCUMysgbnoKOH2QL+05ijhClMO5d3IPxdMnGituEXdtyCWf154g3opk7jebUAng+8PYOMFxbU8DAjvZb8f0q9i9AlgbpkNfwDrDQRDuZqGVIuk=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR01MB11835.eurprd01.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(35042699022)(14060799003)(1800799024)(366016)(376014)(23010399003)(4143699003)(56012099006)(18002099003)(22082099003)(10067099003);DIR:OUT;SFP:1102;
X-MS-Exchange-CrossTenant-Network-Message-Id: 39fb4c81-4b35-4bff-2dea-08dee1a2ac1b
X-MS-Exchange-CrossTenant-AuthSource: GV2PR01MB11835.eurprd01.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jul 2026 12:23:12.3574
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: c87b4f54-b992-4813-8f3f-4a876324197f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: I7WxQYgX6VkOacWOo2HVeW92O1k8CQIB+izQqqIpOWsCpSSetpC+Lwj2P/xuLSgVmv/SFu4ZYFmgzJ1nq0u6Ysw4fs0HALbACtkRkpLMS4w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR01MB6224
X-ClientProxiedBy: BE1P281CA0356.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:82::10) To GV2PR01MB11835.eurprd01.prod.exchangelabs.com
 (2603:10a6:150:2cb::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	39fb4c81-4b35-4bff-2dea-08dee1a2ac1b
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?bCtnaVVtd09YaEpZMk9JZEZzdE5LNkxVMU80M3B6NUdTdkR6eFFXYWhpSE01?=
 =?utf-8?B?NkcyUXVuY2gvL0tTRS9NbUlrcEo2UGQ4bHAxR2JoTWtVUUl6dE95K09iNTBZ?=
 =?utf-8?B?bTdiM2tzOTluSDczb01DWklHSjh5b0NqMnN1RlB6YlBrN3FMN2RpM2pScnVG?=
 =?utf-8?B?eWd4cTFlSEJXTmtFZ3BhUWtJK0lxMTIyRitXWE1sdmpzQUZMZi9iQXpGNnd2?=
 =?utf-8?B?L1ZYYzIzWXRDaW1pYjVFUWxWcjlDS282eEs5WkJyMXJRSGlGbWZnaEo4cU5W?=
 =?utf-8?B?YTMzMDRtK09zT21aRzNFbWtER0hKaDVqSm1IZVQ2NWJlZGpDSmJZYlN0L3Rn?=
 =?utf-8?B?dFVhbkdOM01INTV5bTZERkhsWmJ2aGZsVGdBaGVpRDM4MmRvbjl1OUduOWs4?=
 =?utf-8?B?Y1BpWklOQzd2ZkpOdndVV1l3cmczTEhFUk9pUWl5NGZZV2JOVzlEU0dNbk9D?=
 =?utf-8?B?Skxma0MrTk1OMUthaHJqVGI3Tkt4SGt0ZDF5SjVKbC9qNDdQeFhZYVRYSkNI?=
 =?utf-8?B?SWtnNlBIVjFjdVJZdTB2NGFiY2ZZYU9SN2tocE5MNmpib3BWWmoyZmxGeGhJ?=
 =?utf-8?B?anJrckdrTlN1WkllWnI4MXE4bmdFbDUxMFp1TFdWVDdaTnRlTXVPUkp0Sngv?=
 =?utf-8?B?WXY4bllRdmlkRTljRXVBZnFnYzAvYXNmZTc0M1pvVzFMUExnajdoTUU4cTg4?=
 =?utf-8?B?bVY3R1dMK250T3gyUisvQWREblNFaFdjY0YzRTRRYjB2OURlUWVwaWhIcnpQ?=
 =?utf-8?B?b25DOGRMWTU0T0VrMmZnaGNVaEdldUk0KzlFNi9qMTZpZWdKeDBwbFg2VDJs?=
 =?utf-8?B?cW50bmF6VFVEME1CRTJnSk5sZ01Oa1RhTm5jdFh5eUt5WFZxVVArR3EzM0Fq?=
 =?utf-8?B?MEpmNWJ1by91dzByNlAvdnlsSUwwaUZrd1NhbTMwVE84OVV6ZWdCdWV2d1JF?=
 =?utf-8?B?UE1iYU0yUGQ0VE9QdzRFbWdUWk1pVkd2NzY4MUlzdlhPdFp0SWVXSG1ZL3Bh?=
 =?utf-8?B?TGVwSm9rNGp0OEZSZHRHcGVuMmo4bStaaDAwSlQrK0FTK3JCK0VRSU5qdkVi?=
 =?utf-8?B?OHBTSS85NndiRDFwc3daSjkxMWZNcmU1VUpCTU9lbnJDRWYyTDYvdG5qZmd3?=
 =?utf-8?B?TlFJUXJmQXQ4c1lCNWx2QWoyT1VaSmRwL1hSSXJvVVBFQmVyQk1LcEwvYzNQ?=
 =?utf-8?B?Yk5MKzd4Wlc1SWRyVHU3YWNId2JNR2FqYlFCaEsxQVV3andpTjdGRHM1dERH?=
 =?utf-8?B?QURaOWtpaEdySTVzNmJHVE5VV1Y0SXJvcmhRYnFTeHFPZm5hMmVPSVRUeHZx?=
 =?utf-8?B?bFJDTUYxRW1kVG01V003c1RWQ3VCdVA5MzY3S0J0L1E3UTNnWHNDdVNva1VN?=
 =?utf-8?B?ZC9ZaGVIWm9hWmpQalU3aWlIVUVvMkNZRTFMdTlTbW5FeDRPU1lBZEF1c1lJ?=
 =?utf-8?B?eWY1bW9qemNBUkluL0hVK1ovajNIRFJpSnpORnhuWXdVUm5TRnRFOW5ZTDBR?=
 =?utf-8?B?RFpKVmdORnE5N3I0OW5XUGMxZk84aE9uMGlOQVVQNnI1L0ZnOHJJcUZiK1hy?=
 =?utf-8?B?QmFoWUtsMjNuc1crcVNQZ0lKRGhqNDZiaGFXV2pIR2tpbHB4S1JUOFRhTVJk?=
 =?utf-8?B?WUhEQVVlQVZVMktVMUx1azVxMktiNEVyZzBVTm84NFdTYkhMY3pYVW1pNEJ4?=
 =?utf-8?B?VThXNUY1TkRRLzBPYnp3OFpEWUU2QzJudkpjcWpaVm1hV0tjQnZBa2tYbWJa?=
 =?utf-8?B?Y0xmVjA2WUY2elF4andmYnZlYkx4aUFicG81MU0rbFpJZFJCWGUxMDcvRWRI?=
 =?utf-8?B?YWU1WHR4Y0NSTW1vKzNDSFdiL3pvNHdiWjlEaGlMNTdXeVNQTXo2NVdHOURx?=
 =?utf-8?B?ejFhdFk5SVdDQ0FzeTh5SVFSRWpaaUZiQUw1MU5OazFQSjFGOEllSkxTQnVB?=
 =?utf-8?B?TnpTNkRHcE10eUY1V3Z4c0ZnV29lcHJhMmRraTZiSWJMTGdNWnBialNkYkF4?=
 =?utf-8?B?dlYxNndmNGg4N1cyTkdKTXgreFdxRkF2TkFZMnY2ZDZCM3EvdGtERmxsbU5I?=
 =?utf-8?B?VWJsMHFQVExFUG5POWdXcis0ME54R1drQ2VaZlZZNGpRWTEwbGlyUGNmc1ky?=
 =?utf-8?B?U0h5cEEzSDdBV0h5R0dkbVhzR3RLTDdiWUlEdEpVUVNLY1hqYlBXaENSaGdM?=
 =?utf-8?B?c3lMSlBRZkdGTGlPeTMxa1FjYUtUYTJYdEgyZjI3UHNpUU1adnJkY2U1byth?=
 =?utf-8?B?aEtuOU9NNDkvQnA5TVBpS2FrTmlZeUFuaURiT3VVSE9kcDBTWDVKMFlIazFk?=
 =?utf-8?B?cXNaekU2cU5oSGwwdERUcHlmTFdBUWZYN3hocTdWNUY0UlM5NG01RUZ0aGJt?=
 =?utf-8?Q?u5mu6bcowiqa26sc=3D?=
X-OriginatorOrg: navimatix.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 16d08b6e-e028-4f4c-5dfc-08dee304dee9
X-MS-Exchange-CrossTenant-AuthSource: GV2PR01MB11835.eurprd01.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jul 2026 06:38:39.4265
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: c87b4f54-b992-4813-8f3f-4a876324197f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QmOBIBYIMiyt/mQCbgrtOwE9v4sCSHcNyl+Ra7gmSoG3Bx85nof2uHTUnJMkBgko65dHj2w01+H42jdsEuZkwlBk2Z7l9O4ZhEafYaerTYM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR01MB6518
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 16 Jul 2026 06:38:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241054

--w3snnpgrv2b7p2bw
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [OE-core] [PATCH 3/4] base-files: Install /etc/mtab in a
 systemd-friendly way
MIME-Version: 1.0

Joshua Watt schrieb am Mo 13. Jul, 10:29 (-0600):
> On Mon, Jul 6, 2026 at 10:59=E2=80=AFAM J=C3=B6rg Sommer via lists.openem=
bedded.org
> <joerg.sommer=3Dnavimatix.de@lists.openembedded.org> wrote:
>=20
> > From: J=C3=B6rg Sommer <joerg.sommer@navimatix.de>
> >
> > The old mtab pointed to /proc/mounts which itself is a symlink. Systemd
> > therefore tries to replace it with a symlink to /proc/self/mounts, but
> > fails
> > on a read-only rootfs:
> >
> >     systemd-tmpfiles: symlink(../proc/self/mounts, /etc/mtab) failed:
> > Read-only file system
> >
> > Signed-off-by: J=C3=B6rg Sommer <joerg.sommer@navimatix.de>
> > ---
> >  meta/recipes-core/base-files/base-files_3.0.14.bb | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/meta/recipes-core/base-files/base-files_3.0.14.bb
> > b/meta/recipes-core/base-files/base-files_3.0.14.bb
> > index d4d777b485..aafc0aa923 100644
> > --- a/meta/recipes-core/base-files/base-files_3.0.14.bb
> > +++ b/meta/recipes-core/base-files/base-files_3.0.14.bb
> > @@ -109,7 +109,7 @@ do_install () {
> >         install -m 0644 ${S}/host.conf ${D}${sysconfdir}/host.conf
> >         install -m 0644 ${S}/motd ${D}${sysconfdir}/motd
> >
> > -       ln -sf /proc/mounts ${D}${sysconfdir}/mtab
> > +       ln -sf ../proc/self/mounts ${D}${sysconfdir}/mtab
> >
>=20
> This should be absolute /proc/self/mounts otherwise it's assuming
> sysconfdir is only one directory level deep, and AFIACT, there is no reas=
on
> for it to be absolute

The path comes from tmpfiles.d/etc.conf. I suspect it has to do with the
containers and mounting proc with different options (hidepid, subset). So
the container root dir in /run/=E2=80=A6/etc/mtab points to the right mount=
s file
viewing from the outside.

https://github.com/systemd/systemd/blob/9ac37aa0c7bc63dc93a29cbe631f394635e=
c425f/tmpfiles.d/etc.conf.in#L11

But `ln -s -f -T -n -r ${D}/proc/self/mounts ${D}${sysconfdir}/mtab` seems
to work.

--=20
Navimatix GmbH           T: 03641 - 327 99 0
Tatzendpromenade 2       F: 03641 - 526 306
07745 Jena               www.navimatix.de

Gesch=C3=A4ftsf=C3=BChrer: Steffen Sp=C3=A4the, Jan Rommeley
Registergericht: Amtsgericht Jena, HRB 501480

--w3snnpgrv2b7p2bw
Content-Type: application/pkcs7-signature; name="smime.p7s"
Content-Disposition: attachment; filename="smime.p7s"
Content-Transfer-Encoding: base64

MIIaGAYJKoZIhvcNAQcCoIIaCTCCGgUCAQExDzANBglghkgBZQMEAgEFADALBgkqhkiG9w0B
BwGgghehMIIFgTCCBGmgAwIBAgIQOXJEOvkit1HX02wQ3TE1lTANBgkqhkiG9w0BAQwFADB7
MQswCQYDVQQGEwJHQjEbMBkGA1UECAwSR3JlYXRlciBNYW5jaGVzdGVyMRAwDgYDVQQHDAdT
YWxmb3JkMRowGAYDVQQKDBFDb21vZG8gQ0EgTGltaXRlZDEhMB8GA1UEAwwYQUFBIENlcnRp
ZmljYXRlIFNlcnZpY2VzMB4XDTE5MDMxMjAwMDAwMFoXDTI4MTIzMTIzNTk1OVowgYgxCzAJ
BgNVBAYTAlVTMRMwEQYDVQQIEwpOZXcgSmVyc2V5MRQwEgYDVQQHEwtKZXJzZXkgQ2l0eTEe
MBwGA1UEChMVVGhlIFVTRVJUUlVTVCBOZXR3b3JrMS4wLAYDVQQDEyVVU0VSVHJ1c3QgUlNB
IENlcnRpZmljYXRpb24gQXV0aG9yaXR5MIICIjANBgkqhkiG9w0BAQEFAAOCAg8AMIICCgKC
AgEAgBJlFzYOw9sIs9CsVw127c0n00ytUINh4qogTQktZAnczomfzD2p7PbPwdzx07HWezco
EStH2jnGvDoZtF+mvX2do2NCtnbyqTsrkfjib9DsFiCQCT7i6HTJGLSR1GJk23+jBvGIGGqQ
Ijy8/hPwhxR79uQfjtTkUcYRZ0YIUcuGFFQ/vDP+fmyc/xadGL1RjjWmp2bIcmfbIWax1Jt4
A8BQOujM8Ny8nkz+rwWWNR9XWrf/zvk9tyy29lTdyOcSOk2uTIq3XJq0tyA9yn8iNK5+O2hm
AUTnAU5GU5szYPeUvlM3kHND8zLDU+/bqv50TmnHa4xgk97Exwzf4TKuzJM7UXiVZ4vuPVb+
DNBpDxsP8yUmazNt925H+nND5X4OpWaxKXwyhGNVicQNwZNUMBkTrNN9N6frXTpsNVzbQdcS
2qlJC9/YgIoJk2KOtWbPJYjNhLixP6Q5D9kCnusSTJV882sFqV4Wg8y4Z+LoE53MW4LTTLPt
W//e5XOsIzstAL81VXQJSdhJWBp/kjbmUZIO8yZ9HE0XvMnsQybQv0FfQKlERPSZ51eHnlAf
V1SoPv10Yy+xUGUJ5lhCLkMaTLTwJUdZ+gQek9QmRkpQgbLevni3/GcV4clXhB4PY9bpYrrW
X1Uu6lzGKAgEJTm4Diup8kyXHAc/DVL17e8vgg8CAwEAAaOB8jCB7zAfBgNVHSMEGDAWgBSg
EQojPpbxB+zirynvgqV/0DCktDAdBgNVHQ4EFgQUU3m/WqorSs9UgOHYm8Cd8rIDZsswDgYD
VR0PAQH/BAQDAgGGMA8GA1UdEwEB/wQFMAMBAf8wEQYDVR0gBAowCDAGBgRVHSAAMEMGA1Ud
HwQ8MDowOKA2oDSGMmh0dHA6Ly9jcmwuY29tb2RvY2EuY29tL0FBQUNlcnRpZmljYXRlU2Vy
dmljZXMuY3JsMDQGCCsGAQUFBwEBBCgwJjAkBggrBgEFBQcwAYYYaHR0cDovL29jc3AuY29t
b2RvY2EuY29tMA0GCSqGSIb3DQEBDAUAA4IBAQAYh1HcdCE9nIrgJ7cz0C7M7PDmy14R3iJv
m3WOnnL+5Nb+qh+cli3vA0p+rvSNb3I8QzvAP+u431yqqcau8vzY7qN7Q/aGNnwU4M309z/+
3ri0ivCRlv79Q2R+/czSAaF9ffgZGclCKxO/WIu6pKJmBHaIkU4MiRTOok3JMrO66BQavHHx
W/BBC5gACiIDEOUMsfnNkjcZ7Tvx5Dq2+UUTJnWvu6rvP3t3O9LEApE9GQDTF1w52z97GA1F
zZOFli9d31kWTz9RvdVFGD/tSo7oBmF0Ixa1DVBzJ0RHfxBdiSprhTEUxOipakyAvGp4z7h/
jnZymQyd/teRCBaho1+VMIIGkDCCBHigAwIBAgIRAJNhG7GFaX1Mm3w/sd+ASzYwDQYJKoZI
hvcNAQEMBQAwgYgxCzAJBgNVBAYTAlVTMRMwEQYDVQQIEwpOZXcgSmVyc2V5MRQwEgYDVQQH
EwtKZXJzZXkgQ2l0eTEeMBwGA1UEChMVVGhlIFVTRVJUUlVTVCBOZXR3b3JrMS4wLAYDVQQD
EyVVU0VSVHJ1c3QgUlNBIENlcnRpZmljYXRpb24gQXV0aG9yaXR5MB4XDTIxMDMyMjAwMDAw
MFoXDTM4MDExODIzNTk1OVowWjELMAkGA1UEBhMCR0IxGDAWBgNVBAoTD1NlY3RpZ28gTGlt
aXRlZDExMC8GA1UEAxMoU2VjdGlnbyBQdWJsaWMgRW1haWwgUHJvdGVjdGlvbiBSb290IFI0
NjCCAiIwDQYJKoZIhvcNAQEBBQADggIPADCCAgoCggIBAJHlG/qqbTcrdccuXxSl2yyXtixG
j2nZ7JYt8x1avtMdI+ZoCf9KEXMarmefdprS5+y42V8r+SZWUa92nan8F+8yCtAjPLosT0eD
7J0FaEJeBuDV6CtoSJey+vOkcTV9NJsXi39NDdvcTwVMlGK/NfovyKccZtlxX+XmWlXKq/S4
dxlFUEVOSqvbnmbBGbc3QshWpUAS+TPoOEU6xoSjAo4vJLDDQYUHSZzP3NHyJm/tMxwzZypF
N9mFZSIasbUQUglrA8YfcD2RxH2QPe1m+JD/JeDtkqKLMSmtnBJmeGOdV+z7C96O3IvLOql3
9Lrl7DiMi+YTZqdpWMOCGhrN8Z/YU5JOSX2pRefxQyFatz5AzWOJz9m/x1AL4bzniJatntQX
2l3P4JH9phDUuQOBm2ms+4SogTXrG+tobHxgPsPfybSudB1Ird1uEYbhKmo2Fq7IzrzbWPxA
k0DYjlOXwqwiOOWIMbMuoe/s4EIN6v+TVkoGpJtMAmhkj1ZQwYEF/cvbxdcV8mu1dsOj+TLO
yrVKqRt9Gdx/x2p+ley2uI39lUqcoytti/Fw5UcrAFzkuZ7U+NlYKdDL4ChibK6cYuLMvDaT
QfXv/kZilbBXSnQsR1Ipnd2ioU9CwpLOLVBSXowKoffYncX4/TaHTlf9aKFfmYMc8LXd6JLT
ZUBVypaFAgMBAAGjggEgMIIBHDAfBgNVHSMEGDAWgBRTeb9aqitKz1SA4dibwJ3ysgNmyzAd
BgNVHQ4EFgQUp9eVd+tKwyfNk743TCaEIRR9XZgwDgYDVR0PAQH/BAQDAgGGMA8GA1UdEwEB
/wQFMAMBAf8wHQYDVR0lBBYwFAYIKwYBBQUHAwQGCCsGAQUFBwMCMBEGA1UdIAQKMAgwBgYE
VR0gADBQBgNVHR8ESTBHMEWgQ6BBhj9odHRwOi8vY3JsLnVzZXJ0cnVzdC5jb20vVVNFUlRy
dXN0UlNBQ2VydGlmaWNhdGlvbkF1dGhvcml0eS5jcmwwNQYIKwYBBQUHAQEEKTAnMCUGCCsG
AQUFBzABhhlodHRwOi8vb2NzcC51c2VydHJ1c3QuY29tMA0GCSqGSIb3DQEBDAUAA4ICAQBw
pquT4ow8LyRHG6NgR4oUsFncHl+eWLMtEBwv90EpGCGGDDDjoO23j4Zw6tS+THzwgz4SyP0M
FQaMzHj40enm+z1Y29QIQCnJTeDOHWHKMRxeiFD8MBso+XgVM6z6MMDbbJ95btM/4eE3LyaB
uBbheiINaAVieIdxLq6+dVkm00kmvMdlARsTkEvr5a9nYhGAs8T5RBD1DozAv9r89WJcn+QY
X1M2l5vv0ws3Me1ziVSjC2cRhcae4seOFFjkRdJItzfk6H/Wm2FNv2XG8nE1nbgN8UCdhORO
lQGGQ9DN152RmSJ1A6KAJIldo3YrJNiO8J4JLAE5/Tl9CNUHtbdYTOZLCAZ95G1g2GELQ2DQ
1Xxo55iNojqUA4w1feORe86Dq2P08xzolHKepP1LGEw1gDGCkUYR0gVXLJExGd3dfEZDm0mm
U7vWb6vRyLso/GUawFD2MZS4kK8/igkPO2Pkjfd5HD7hknpPVhcuBaWxWj8Q7bjwVlxGwts6
sNZ+UJ5HC4c+11vVoV9cdbb93qpbWn/d+azhit6kRYdUmAUl8Bt5VRBMKCUnSaAAspxb9kFK
+cvm/MjErxN63YNEcMs2QKs3N862V8MQaoKqD+KsKnaLxF6pxRpOotenpfUTNE9GqxP9nI6i
9rSHf16VFwW4NnJ6yUgzHUMdIqtTge98VjCCBiowggQSoAMCAQICEHb3t/4teUvaYKSSf0s+
XMIwDQYJKoZIhvcNAQEMBQAwWjELMAkGA1UEBhMCR0IxGDAWBgNVBAoTD1NlY3RpZ28gTGlt
aXRlZDExMC8GA1UEAxMoU2VjdGlnbyBQdWJsaWMgRW1haWwgUHJvdGVjdGlvbiBSb290IFI0
NjAeFw0yMTAzMjIwMDAwMDBaFw0zNjAzMjEyMzU5NTlaMFgxCzAJBgNVBAYTAkdCMRgwFgYD
VQQKEw9TZWN0aWdvIExpbWl0ZWQxLzAtBgNVBAMTJlNlY3RpZ28gUHVibGljIEVtYWlsIFBy
b3RlY3Rpb24gQ0EgUjM2MIIBojANBgkqhkiG9w0BAQEFAAOCAY8AMIIBigKCAYEAk7qaEDRX
E35PMot8PAmiNaWYblItPHGyt1+H+DUs2GAYHofsdeURmjngaB0C3GcUcrVav1HsGjJuoh77
nRif3O0gxUJGnIzj4ppKxxTsMNau8qvL+FnEkK6VrnqqnKIL3myjhJRdghUlK8Lgetl/3Pdz
KQ7JO2xPZFklrLRm8EQSuUdyccvb+auvRdSnwrxsOvV+9n18ZdeahL/RBxM7R31DhVkMPO19
EiQMj4PBl99wuWzXWL7yLgYh2/TJvIpSOf7waFcHkVYvfAPivV/ulUVaN2ncpSvlE4/TjA8d
5NXKOY+C7RcyD3UZIi6XVg7T81gOfnvE/eEGsyHmgjzLFDYpgBwVOd7jLQ9jhLX4hdRbm959
FrXQQrozzfTbyxRIwMwDqgUoPxIQVU9A7qXKu3yRXsn7OvnjYkYve6X0ZifTbjZaf4Hi/KXW
fNn67zqCt0eNONM2QB5bNqg14qLooRQcgRpSNAEB4UsSyhwsJqEhXz4QwPFWn/wwvEJ0FgYD
AgMBAAGjggFsMIIBaDAfBgNVHSMEGDAWgBSn15V360rDJ82TvjdMJoQhFH1dmDAdBgNVHQ4E
FgQUHwSkfkz2MrEJ4pF84WzfUr/PLv0wDgYDVR0PAQH/BAQDAgGGMBIGA1UdEwEB/wQIMAYB
Af8CAQAwHQYDVR0lBBYwFAYIKwYBBQUHAwIGCCsGAQUFBwMEMBEGA1UdIAQKMAgwBgYEVR0g
ADBPBgNVHR8ESDBGMESgQqBAhj5odHRwOi8vY3JsLnNlY3RpZ28uY29tL1NlY3RpZ29QdWJs
aWNFbWFpbFByb3RlY3Rpb25Sb290UjQ2LmNybDB/BggrBgEFBQcBAQRzMHEwSgYIKwYBBQUH
MAKGPmh0dHA6Ly9jcnQuc2VjdGlnby5jb20vU2VjdGlnb1B1YmxpY0VtYWlsUHJvdGVjdGlv
blJvb3RSNDYucDdjMCMGCCsGAQUFBzABhhdodHRwOi8vb2NzcC5zZWN0aWdvLmNvbTANBgkq
hkiG9w0BAQwFAAOCAgEAWooWgE/1j6esLJfOKB48VUcFaafH6wZcbEln7ls6BP7IvAP2GDRF
33LtQhuVpt7qIqm/RXxWQLaC0yA14LE/pZZdm6CkkoWlTRgzZln6rM9dm2JvqyX2TLS0Z7P1
E6o9EmPx53bRNrnauUu2lYYfpODYq/5LzDPWBjGNK5QW4+oKCykPzzfSveoF5KTuW1xxy+da
EmtXm3hgYwYvTrB/7jHZU2hVbj/8DUAf/JCa/+AdQCtUE5XzKl6o5gGtWahY1yh9smQ3b48/
cto1QW+ZwGCHk5CLr5bDhe2uh2ifn8BXxBOf33D6YHjnrOUyNxi43QD2wZRwyL8arpu/Ljl4
H9zwIM0Q4vfbZuDghYLDnRVC1fGYBArWxw+uvoEMvO7lcc9MTezGkonPmanHYAcGffaIXpIQ
rQWtWS9Pb22jEy6YZCUiqH4YcqkelJHqJD1HBLVMOPaCn2wXgBbv9jvZQsP9yFrD6tKX//ue
D1V12I+L8qjUj17/ZRuxLcPDCF6vb/Svnu38Ejni16jHUO9G/YWFBZOuRbutUEgEp8hMXEzJ
XO43NzBthf80VV86GaC83nNy3TETFF2yav+ioLIK7Qd5NRnI4DXNQYPq6j8qkEnODayXA1bR
7V/qy4BrdrLHJf9NHMiANvCNiDn02MuniTPmb+rp4syaXK409MSG4PYwggVWMIIDvqADAgEC
AhEAsFHj29zvfVPWA2FcnDeJlzANBgkqhkiG9w0BAQsFADBYMQswCQYDVQQGEwJHQjEYMBYG
A1UEChMPU2VjdGlnbyBMaW1pdGVkMS8wLQYDVQQDEyZTZWN0aWdvIFB1YmxpYyBFbWFpbCBQ
cm90ZWN0aW9uIENBIFIzNjAeFw0yNjA3MDIwMDAwMDBaFw0yODA3MDEyMzU5NTlaMCoxKDAm
BgkqhkiG9w0BCQEWGWpvZXJnLnNvbW1lckBuYXZpbWF0aXguZGUwggEiMA0GCSqGSIb3DQEB
AQUAA4IBDwAwggEKAoIBAQDNxFyhl/UuZdUpuQiuqZBMSU/pN5SMIj4lkvTlrtp2jl4Q77wb
v4vXdXIFWqKd3qtut55G0ptK4nXs1ARrh3AHQAYwB0vW+PHVNPLs9yombnTeMgnEv/RQDFkH
+DxoKdY5+DRUmcVO/tYl6ExMEBj6oh6b/63whIkC61WRETH3FpRCRbyNBD73OWt0KzxoKzW9
xmdqfhNtylLcIFMzuv9C1WAqJ3mLbFHYaW4NEMMckPZJWWYzvA2nwCCryerE3J9z4ZbSK0OK
6DDRN9gW/H7+/4pHSIhdooGfQEdgLj+Z4ZPhvLMF5DncBD8k5DOK8mlDxCKp4GsrLLuBfLQd
xilvAgMBAAGjggHHMIIBwzAfBgNVHSMEGDAWgBQfBKR+TPYysQnikXzhbN9Sv88u/TAdBgNV
HQ4EFgQU3lTOaS6cJRsIzzEjdtC4j6GPtWIwDgYDVR0PAQH/BAQDAgWgMAwGA1UdEwEB/wQC
MAAwHQYDVR0lBBYwFAYIKwYBBQUHAwQGCCsGAQUFBwMCMFAGA1UdIARJMEcwOgYMKwYBBAGy
MQECAQoBMCowKAYIKwYBBQUHAgEWHGh0dHBzOi8vc2VjdGlnby5jb20vU01JTUVDUFMwCQYH
Z4EMAQUBAjBNBgNVHR8ERjBEMEKgQKA+hjxodHRwOi8vY3JsLnNlY3RpZ28uY29tL1NlY3Rp
Z29QdWJsaWNFbWFpbFByb3RlY3Rpb25DQVIzNi5jcmwwfQYIKwYBBQUHAQEEcTBvMEgGCCsG
AQUFBzAChjxodHRwOi8vY3J0LnNlY3RpZ28uY29tL1NlY3RpZ29QdWJsaWNFbWFpbFByb3Rl
Y3Rpb25DQVIzNi5jcnQwIwYIKwYBBQUHMAGGF2h0dHA6Ly9vY3NwLnNlY3RpZ28uY29tMCQG
A1UdEQQdMBuBGWpvZXJnLnNvbW1lckBuYXZpbWF0aXguZGUwDQYJKoZIhvcNAQELBQADggGB
AD6hnou447615g2A0y87bR6mtVI+C+wAFCqRqfrCgHu0dB29VPiVXIVYbPN7H6meSMNr2lFo
e81aZfbE7LMQj98hVKA/ljqWKJe6R5W1Tssv1568G9GJ0fvL1iGT74LuqcuYPt0LVH99Q1rH
MfCBKpsyFo7P3JwoqEkuIpbAhaQMYdTcOgeHMYOLrIdx/9wQ1BXjTa/Cajvc3QxJEb308wgJ
PBxhl8FWWm5MNOynBmRZPKeOeMF5113u6b03KTmXhBqSVeN2nZXEZ+B+wNcJv1dr4Sa0/k6p
tbjZcr9ZkK7QtCarYgLDbsSbcLRJMuXUSHf1yaLwihZWJ1asynbFEmv1SrRSQ+3Hv4megEeY
kYmW9Jiu9qh5z6S98F7JhsP4n6tGs24Xz7l2I/T+BmJMRglTeQnzBihH0kFPUanlApSKC99A
clKs/tfOX8HKHs79Bw3PjRjJDog4D4Pbkom8UwQ/m5sCuOf7v632pjK2jm3OErS3XZxIjnFV
4Gl+5jZ1zzGCAjswggI3AgEBMG0wWDELMAkGA1UEBhMCR0IxGDAWBgNVBAoTD1NlY3RpZ28g
TGltaXRlZDEvMC0GA1UEAxMmU2VjdGlnbyBQdWJsaWMgRW1haWwgUHJvdGVjdGlvbiBDQSBS
MzYCEQCwUePb3O99U9YDYVycN4mXMA0GCWCGSAFlAwQCAQUAoIGgMBgGCSqGSIb3DQEJAzEL
BgkqhkiG9w0BBwEwHAYJKoZIhvcNAQkFMQ8XDTI2MDcxNDEyMjMwOVowLwYJKoZIhvcNAQkE
MSIEIMSeef5bb7Ed47cwsTkhp58EOCO7kIK/qxO4Siy+mRErMDUGCSqGSIb3DQEJDzEoMCYw
CwYJYIZIAWUDBAEqMAsGCWCGSAFlAwQBAjAKBggqhkiG9w0DBzANBgkqhkiG9w0BAQEFAASC
AQBOQqKYftS8Vhf1Nrebp2e//DIS1BFwVQlwuBMeM90LzmrrmwQmGE18a8xNoOyUtIjHQGQD
YguMW2psreYewv/sgCCcAXt1Awi5sW6QkhK2sSnqgcd3xx1fmpFMcbptVIW2XFRiXVBaiFCR
77e2BrqQjudO1YF/7cWZ3hpDJ5tgAUFww2rHu+w8Vl7q8Gh5eOc0Iujp1gLZu8R3rd4xjMGJ
HP/KrZ25sfDTuR5pwGoPCqvgy3Y01fKbxog4VU0Y4AppffKT6plm/NGYhGXVUkbEjNtYv5qa
VddFIsxrbt8NrexDENLecXXCV4dh0v/wzitrEFR8kKrBBcUqUKYIgcRN

--w3snnpgrv2b7p2bw--

