Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 611E0C3ABCC
	for <webhook@archiver.kernel.org>; Tue, 13 May 2025 12:55:42 +0000 (UTC)
Received: from EUR03-DBA-obe.outbound.protection.outlook.com (EUR03-DBA-obe.outbound.protection.outlook.com [40.107.104.85])
 by mx.groups.io with SMTP id smtpd.web11.75708.1747140934314080260
 for <openembedded-core@lists.openembedded.org>;
 Tue, 13 May 2025 05:55:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siemens.com header.s=selector2 header.b=l5R08WDj;
 spf=pass (domain: siemens.com, ip: 40.107.104.85, mailfrom: peter.marko@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NqVfz2ZgDIa10Wh25Wux9vr6yRCkIznp4kStszKSRyyDa0nRzKlQqDYu0iuDrfVPrPGCBrHAPhfmWKnRsyOLI3ZncLdpII5I2xEdtSrjPTn329vN16YwSSH2xLQBE0FIgWuQAIGu/4sCc6vYGC9MN6am+XuIMrZ6Qp8wgjSSqGYeu6zKxV0JHDUGTTkQ6frVGHy+Ano/s9UzNQdeRU4FycHbLg7ehqJRkz16I/JFhyRfHCpKq55+SYlHfSaMlHpYde+KrPy7SNdyZRRzPqHxNAAOrWL/E3C2IHYzSdjSRkGlX+EykWlIhOAqcESgjsvQU/6DSXkYVl289HJ79kqzNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hVLu+T58VWj5WSdnqs+PuEmzAjqjzT/Z1hCCe3uxmg8=;
 b=x0eUgArb5H+nhNLXLC2j6DdM+wZ5z0CSEFAcgdIcr98pa3MLZr5zS42slVdbmwyq4kBCnH73SefVHHOfbA9DWP3Jvb+Dv5CsQmrNpsBOz+xfCmbcZYvJ6Qel8IrHwwzJ1oNexbZaN1+d/1gxX4eqmmHsX7LZQpOE/URWKq3HmYEX3LOJzFYdb5MFfjqsZ5JvvRul7tFqf1KKLlzYVIDTv15FJffcXGIQck9HGbgESLklA6Wxm0fVtJqPwXhlPInHBaihWjv9FRd65xF0LHCAMpjGW3eOD5mu2PWiMoW6FmIxWRkiXtJ/0WJk0UGRrShTfQkLRZ7/cNpT5Bbm7OADXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hVLu+T58VWj5WSdnqs+PuEmzAjqjzT/Z1hCCe3uxmg8=;
 b=l5R08WDjROyvt/vi+XEK4LFFcAMkA+Dkg9gnehfbDQDCB3uB6bHHKAjde4jZXBbCnrLdv47RbTXUabX7mRgYvklJFlT6glLbotR72v+R6y1gzhTBa5LpPSfqcMlLPPa/k95KmLhny1bPaGZ/D2Mqejbx4wUbD4ojRn+3LFnWdh4iaOfN7D9ShwH4h35gdDo2KR+V6/Au3HOd+PrSYVLf9LQv9G8kgCM8rVVSVLOcqZIrHwJbtcVa3djBflG5yz6KQAnbU92dYRO8fyrLgtQhbmy6/jSR/tSU6Iu57FrASGmOGVdWJVViaYj1/0vEOFMf4FAY5HEIuZaUWunUIHW5rg==
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:479::20)
 by AS8PR10MB7970.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:568::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.29; Tue, 13 May
 2025 12:55:30 +0000
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::6c68:267b:6fd1:d3f2]) by AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::6c68:267b:6fd1:d3f2%4]) with mapi id 15.20.8722.027; Tue, 13 May 2025
 12:55:30 +0000
From: "Marko, Peter" <Peter.Marko@siemens.com>
To: "richard.purdie@linuxfoundation.org" <richard.purdie@linuxfoundation.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, Khem Raj <raj.khem@gmail.com>
Subject: RE: [OE-core] [PATCH 2/2] libsoup-2.4: Drop recipe as obsolete
Thread-Topic: [OE-core] [PATCH 2/2] libsoup-2.4: Drop recipe as obsolete
Thread-Index: AQHbxAUxR2RKbEQ0TkSRsFtsWHnQG7PQhA2Q
Date: Tue, 13 May 2025 12:55:30 +0000
Message-ID: 
 <AS1PR10MB56977601A8481656CFBBD09BFD96A@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
References: <20250513124706.1312750-1-richard.purdie@linuxfoundation.org>
 <20250513124706.1312750-2-richard.purdie@linuxfoundation.org>
In-Reply-To: <20250513124706.1312750-2-richard.purdie@linuxfoundation.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ActionId=8c679c4f-938a-40b8-b031-2d1257f4f910;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ContentBits=0;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Enabled=true;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Method=Standard;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Name=restricted;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SetDate=2025-05-13T12:53:38Z;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SiteId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Tag=10,
 3, 0, 1;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS1PR10MB5697:EE_|AS8PR10MB7970:EE_
x-ms-office365-filtering-correlation-id: d224172c-4b5b-4f99-b368-08dd921d70db
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info: 
 =?us-ascii?Q?15t9AwrhTT5QU6pCy5/gQYUasZFzpYl6xF+Q69axo4GqghxREpNqEJixsnww?=
 =?us-ascii?Q?bskQc5HEeLPD0aCI8mifCE/1KnX2SvfEnXMveFBBJkvWOf6iBXH0iBbrg8UN?=
 =?us-ascii?Q?5J1TejTpoMSti/n5+/G9f7VL1Xud97l8HW+uOMb/5DY9FstcYiXe4B6IexV7?=
 =?us-ascii?Q?uzA+9+sf1Zi1OLEeyfZJKIQ8tbq/J5z930PC2bMulbk90abBj7fIIMbdEyWh?=
 =?us-ascii?Q?h01mKDwC+DkHuiZIM/Rn4PwPFgl2xbYehHUj4g+vDSKwoM7oKHqgDyGpq28z?=
 =?us-ascii?Q?s9CM1ZsKq7Yu6y9hXgBZO9ItVO4cef6S50Jqs0ITf7RlGw+fLN7HrQid0zyC?=
 =?us-ascii?Q?Eja9crahn9v+4+DPsOBL8159Z0lkRkyvTQGs6DkWV9u0wg+rKYgdxQziLdQk?=
 =?us-ascii?Q?JXEWn5Jhpy0H7HTvXpQgXLjXWzCo6ZE+5EGsHnONe7mVVbhi8EtV4ZD162hO?=
 =?us-ascii?Q?VRU+chE/kzLyFL4tO6GOyEvwo6kFz6Wb8mIzh6P71+4kBFzjru1FRAC6sOTV?=
 =?us-ascii?Q?gfmB/ncy4CeySNawZ788/gBsRpWbyH6CNZEqRhSt4WlDMfkhEvH41aEf0tRc?=
 =?us-ascii?Q?UQmPCadPIUvgL/QyQsJZRAgRv5m+fKB/Ow2np2MI5/B39/+C2TqnMqLOI+Yk?=
 =?us-ascii?Q?v9U2JlvlHhnk7Hx5koBwCkpG4a0lWWOwpBkUe4M2YuzOOJw9zVV3Ezf+ULdN?=
 =?us-ascii?Q?E0/kejmoddjh4zWnbpuijmFz0cTTmGO83I5LK20U4Zobj2TUo3qxXXOOeDyG?=
 =?us-ascii?Q?RfjOZME0Vont3dyrgnV2sfR+R5AWHf9X3FEgQQNjxJwyEk0WxI/GrHmDYYGO?=
 =?us-ascii?Q?FnoJ6aujZCxIRjbJnkMytmpTax1zSshhU/8msVMd331EBECIBtJWMHXCHp+s?=
 =?us-ascii?Q?ntwoz+ewBytGXkDsX7A/c6HWuJZwx2XPRP0vR/qy11AmLHfN5cbkV6sl9UjB?=
 =?us-ascii?Q?fLdXPT1wuKI20fwKjn4sodMt2ykmJjF7TVh2/L1Ppgz26IGIuUAxkiFwbhbz?=
 =?us-ascii?Q?2p9DGYpoEdql1iSNFVsqtFylx8nmAxEvaqOxXacpW8h1vi/d5rxYbKInCfle?=
 =?us-ascii?Q?Sb9FzzE/3GKOCKJeObzCjtFjayPE2YsOhUi6jGHww6/e60JnaliPm0jl9pPx?=
 =?us-ascii?Q?2x4rR4PSyh3J0wE7Fgl7AZlJDV9mm69AoVYz9h1VPMJCmK9k2WsunY9zEDCR?=
 =?us-ascii?Q?/ho1CjZLYGclHOb4KcUGmXAmwJe4cc6j+Iq9y0o1KHlQ5Hr/rU6GX6O63Plz?=
 =?us-ascii?Q?Ut6T7AC8BdflsFTXmUpmhBSsUtix055FRcjFtUUm5hHw5cAzunX5djMejHvG?=
 =?us-ascii?Q?RMwxzmXExA3wKIkKgAzBRPK9Q+IWj+tJSbz0Mq+41fP/MOH9d8oycxEkVT92?=
 =?us-ascii?Q?BomX+4n9FzdJ5sBeMJ4ft3C0w0k5hwcJimdabIoStQ/pxPIcAqHCy3kn4oqV?=
 =?us-ascii?Q?N6sgT/3kKKM=3D?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?1UecRk+nKA8MClqlhnyyUCuOzRAAht5vE66EtOJKmXoUewzyby0J3SpbKRbI?=
 =?us-ascii?Q?hSvC6U+tH6NlXoAe6OllHprdXh5jPh9zzTfvcfCiyrjQcnwmNdsujydwo0Sk?=
 =?us-ascii?Q?2iX1M2qDwq5aDJtZLbF+6hV8ta4pJPV6LVZL7e8yA5V9H7ouzijDnxkCklU5?=
 =?us-ascii?Q?nuc56wkeMFAA+hzNJpxPx/lWZNBZowFoGjtOamD9hBgASRjhbw/vkreKMW6S?=
 =?us-ascii?Q?jC3EHD+KyEaLevMgH4aHE97erDuG86DblcRbPEDbDYyax+7HLDzFCwwU9scF?=
 =?us-ascii?Q?Qg7Zvz+YYNKHkGrOvd5Aaj/tEh3IAGy/79xbISBIvnSa+EyLPO7s+yVbefDQ?=
 =?us-ascii?Q?Mtg+wdF5na/dD1+pSg5kj/N9gDNnYz2n30YYJInFYjwomQRiUdpGNMFitEjJ?=
 =?us-ascii?Q?RLzzmZh2zVYG2/VRwrIGpKvaBUIHjIjy2uqYW9VkYWhuvmuCdcRPHKa73Pi5?=
 =?us-ascii?Q?64mx2nFMoQARSJKsYgeFn/tMlG8Oj/adewLCdieT0JHvwiGn8Yk0YXgkiuE2?=
 =?us-ascii?Q?cVfg8ff/qaYcRJIelSx/LGuVCj3H1+k7oO11tPEAFmFhnyAQrE6JqHqu5ieb?=
 =?us-ascii?Q?R9eP++P84avtLB1d83qZWeog2guZLTIVJVOQwJXU08SVqj+jpTqo1KlXznIy?=
 =?us-ascii?Q?3aXM7g0q+jNtqMllU0j4Q576Nhu16THdm7MFwQmgcUL19DE0StdyiUMnBQMT?=
 =?us-ascii?Q?sSiqqoB7N2m5XqaedSopPlHvwn22Ry0IRVL20kO0sPN5bZO+NZPSqbsMQ9NL?=
 =?us-ascii?Q?BKVzg63zvSxiFlIaTJeCnq7ywQD9dOVV9l2pUiy0QyIFrYFDOw1RafPe4XU/?=
 =?us-ascii?Q?ShXPSK1oYV91fqbBsFVootiI0sJskbKEFzFrm+zQyHo2zxtJiTnoIVwNvufv?=
 =?us-ascii?Q?hmaq8fqB17gJ4TxjBqE9MRCMFaWyKZBrEdSQoZkMgwoDOALlHvp1XZCJn/NI?=
 =?us-ascii?Q?JfrFJo8pkqE+3WIWOwZm9JeoG+PXBQVOhWhFfPpgOu61NHWsc2ubdq9Jhm+J?=
 =?us-ascii?Q?uhqhn4XYkKG4uObL3ceb3x/O24b5OAIk2q1fuNXWHsM1iohzUiGCjmFNkLr0?=
 =?us-ascii?Q?IpTguc3JG6OCXUPMP5/R2SodSftamOSJUyFkBXvUiU7dCVuxGKPk4phhX0gm?=
 =?us-ascii?Q?dWm0I///qiaF/IzAfP0k76g75PRVc5uQnPa4jukHXDn3z4MDjdwIAKCE64xV?=
 =?us-ascii?Q?hLDvqHz0cLDRZh613Lt0gnpULzTpIG70xgcGkUECxUAxcnBGuK/TLnJzOJ5/?=
 =?us-ascii?Q?1k7Amwfi5fj93RI/5eWQwzV+7Bga1uibbbITM6dWiRon+puSAZV8Izgvlbec?=
 =?us-ascii?Q?MJ3KUlFTyzaf8mbJ/D3XODncQXlzZM0UJoZmBxgegedWbZBo+gNUzKJXo0bE?=
 =?us-ascii?Q?1JSIp+ekOR5TPla/J6O+wnx51bNAswkmvFQZfW7FrOwRBWUuh+sAx1gNpHvn?=
 =?us-ascii?Q?FnpRy5wgJN863Sp0FCoE7h+s8s68N6V7XvLmEssCdLinnbOD623c7hiWTCk3?=
 =?us-ascii?Q?Nj2k9mkqO1MiSqsNm8bdGph6Ualyo+EO0/fEcTSaPdP+XkKcPQiZP9dyEcWN?=
 =?us-ascii?Q?KGerbxHUIt9AmUJiJ3eg98TUg9oWzM5pcPCVirZu?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: d224172c-4b5b-4f99-b368-08dd921d70db
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 May 2025 12:55:30.1221
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: GTXfO/Iu5XVeovBEg8+JI/HcVIyLuovojH+uLTRWaksubmXCdzd79mIKy43Q/9TKaFnypweX4+QApPQ5cEKT3w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR10MB7970
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 13 May 2025 12:55:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216423

I see 15 users in meta-oe, so I guess it needs to be moved there for now.
Peter

-----Original Message-----
From: openembedded-core@lists.openembedded.org <openembedded-core@lists.ope=
nembedded.org> On Behalf Of Richard Purdie via lists.openembedded.org
Sent: Tuesday, May 13, 2025 14:47
To: openembedded-core@lists.openembedded.org
Subject: [OE-core] [PATCH 2/2] libsoup-2.4: Drop recipe as obsolete

The last user in OE-Core was gst-examples. This has been upgraded and the d=
ependency
dropped, all other users can use libsoup3 instead. Therefore remove the obs=
olete and
deprecated version.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/conf/distro/include/distro_alias.inc     |   1 -
 meta/conf/distro/include/maintainers.inc      |   1 -
 .../libsoup-2.4/0001-CVE-2025-32911.patch     |  74 ---------
 ...ild-with-libxml2-2.12.0-and-clang-17.patch |  44 ------
 ...-Fix-possibly-uninitialized-warnings.patch |  43 ------
 ...-http-and-https-aliases-support-test.patch | 145 ------------------
 .../libsoup-2.4/CVE-2024-52532-1.patch        |  37 -----
 .../libsoup-2.4/CVE-2024-52532-2.patch        |  43 ------
 .../libsoup-2.4/CVE-2024-52532-3.patch        |  48 ------
 .../libsoup/libsoup-2.4_2.74.3.bb             |  66 --------
 10 files changed, 502 deletions(-)
 delete mode 100644 meta/recipes-support/libsoup/libsoup-2.4/0001-CVE-2025-=
32911.patch
 delete mode 100644 meta/recipes-support/libsoup/libsoup-2.4/0001-Fix-build=
-with-libxml2-2.12.0-and-clang-17.patch
 delete mode 100644 meta/recipes-support/libsoup/libsoup-2.4/0001-Fix-possi=
bly-uninitialized-warnings.patch
 delete mode 100644 meta/recipes-support/libsoup/libsoup-2.4/0001-Remove-ht=
tp-and-https-aliases-support-test.patch
 delete mode 100644 meta/recipes-support/libsoup/libsoup-2.4/CVE-2024-52532=
-1.patch
 delete mode 100644 meta/recipes-support/libsoup/libsoup-2.4/CVE-2024-52532=
-2.patch
 delete mode 100644 meta/recipes-support/libsoup/libsoup-2.4/CVE-2024-52532=
-3.patch
 delete mode 100644 meta/recipes-support/libsoup/libsoup-2.4_2.74.3.bb

diff --git a/meta/conf/distro/include/distro_alias.inc b/meta/conf/distro/i=
nclude/distro_alias.inc
index a938c007e8a..8052464f1d9 100644
--- a/meta/conf/distro/include/distro_alias.inc
+++ b/meta/conf/distro/include/distro_alias.inc
@@ -157,7 +157,6 @@ DISTRO_PN_ALIAS:pn-libpod-plainer-perl =3D "OSPDT"
 DISTRO_PN_ALIAS:pn-libsamplerate0 =3D "Meego=3Dlibsamplerate Fedora=3Dlibs=
amplerate OpenSuSE=3Dlibsamplerate Ubuntu=3Dlibsamplerate Mandriva=3Dlibsam=
plerate Debian=3Dlibsamplerate"
 DISTRO_PN_ALIAS:pn-libsdl2 =3D "Fedora=3Dsdl2 Opensuse=3Dlibsdl2 Ubuntu=3D=
libsdl2 Debian=3Dlibsdl2"
 DISTRO_PN_ALIAS:pn-libsndfile1 =3D "Meego=3Dlibsndfile Fedora=3Dlibsndfile=
 OpenSuSE=3Dlibsndfile Ubuntu=3Dlibsndfile Mandriva=3Dlibsndfile Debian=3Dl=
ibsndfile"
-DISTRO_PN_ALIAS:pn-libsoup-2.4 =3D "Meego=3Dlibsoup Fedora=3Dlibsoup OpenS=
uSE=3Dlibsoup Ubuntu=3Dlibsoup2.4 Mandriva=3Dlibsoup Debian=3Dlibsoup2.4"
 DISTRO_PN_ALIAS:pn-libtelepathy =3D "Debian=3Dlibtelepathy2 Ubuntu=3Dlibte=
lepathy2"
 DISTRO_PN_ALIAS:pn-libtimedate-perl =3D "Debian=3Dlibtimedate-perl Ubuntu=
=3Dlibtimedate-perl"
 DISTRO_PN_ALIAS:pn-liburcu =3D "Fedora=3Duserspace-rcu Ubuntu=3Dliburcu0"
diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/in=
clude/maintainers.inc
index 69f6a2d2846..6c19e306cfa 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -400,7 +400,6 @@ RECIPE_MAINTAINER:pn-libsm =3D "Unassigned <unassigned@=
yoctoproject.org>"
 RECIPE_MAINTAINER:pn-libsndfile1 =3D "Unassigned <unassigned@yoctoproject.=
org>"
 RECIPE_MAINTAINER:pn-libsolv =3D "Anuj Mittal <anuj.mittal@intel.com>"
 RECIPE_MAINTAINER:pn-libsoup =3D "Anuj Mittal <anuj.mittal@intel.com>"
-RECIPE_MAINTAINER:pn-libsoup-2.4 =3D "Anuj Mittal <anuj.mittal@intel.com>"
 RECIPE_MAINTAINER:pn-libssh2 =3D "Unassigned <unassigned@yoctoproject.org>=
"
 RECIPE_MAINTAINER:pn-libssp-nonshared =3D "Khem Raj <raj.khem@gmail.com>"
 RECIPE_MAINTAINER:pn-libtasn1 =3D "Anuj Mittal <anuj.mittal@intel.com>"
diff --git a/meta/recipes-support/libsoup/libsoup-2.4/0001-CVE-2025-32911.p=
atch b/meta/recipes-support/libsoup/libsoup-2.4/0001-CVE-2025-32911.patch
deleted file mode 100644
index 9ef0643837f..00000000000
--- a/meta/recipes-support/libsoup/libsoup-2.4/0001-CVE-2025-32911.patch
+++ /dev/null
@@ -1,74 +0,0 @@
-From 52c5859b82fe79f2c32d883e048d218e0d7f2182 Mon Sep 17 00:00:00 2001
-From: Changqing Li <changqing.li@windriver.com>
-Date: Wed, 30 Apr 2025 14:59:55 +0800
-Subject: [PATCH] CVE-2025-32911
-
-CVE: CVE-2025-32911
-Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/libsoup/-/merge_=
requests/422/commits]
-
-Signed-off-by: Changqing Li <changqing.li@windriver.com>
----
- libsoup/soup-message-headers.c | 13 +++++++++----
- tests/header-parsing-test.c    | 15 +++++++++++++++
- 2 files changed, 24 insertions(+), 4 deletions(-)
-
-diff --git a/libsoup/soup-message-headers.c b/libsoup/soup-message-headers=
.c
-index 39ad14a..78b2455 100644
---- a/libsoup/soup-message-headers.c
-+++ b/libsoup/soup-message-headers.c
-@@ -1454,10 +1454,15 @@ soup_message_headers_get_content_disposition (Soup=
MessageHeaders  *hdrs,
- 	 */
- 	if (params && g_hash_table_lookup_extended (*params, "filename",
- 						    &orig_key, &orig_value)) {
--		char *filename =3D strrchr (orig_value, '/');
--
--		if (filename)
--			g_hash_table_insert (*params, g_strdup (orig_key), filename + 1);
-+                if (orig_value) {
-+                        char *filename =3D strrchr (orig_value, '/');
-+
-+                        if (filename)
-+                                g_hash_table_insert (*params, g_strdup (o=
rig_key), g_strdup(filename + 1));
-+                } else {
-+                        /* filename with no value isn't valid. */
-+                        g_hash_table_remove (*params, "filename");
-+                }
- 	}
- 	return TRUE;
- }
-diff --git a/tests/header-parsing-test.c b/tests/header-parsing-test.c
-index 946f118..752196e 100644
---- a/tests/header-parsing-test.c
-+++ b/tests/header-parsing-test.c
-@@ -1034,6 +1034,7 @@ do_param_list_tests (void)
- #define RFC5987_TEST_HEADER_FALLBACK "attachment; filename*=3DUnknown''t%=
FF%FF%FFst.txt; filename=3D\"test.txt\""
- #define RFC5987_TEST_HEADER_NO_TYPE  "filename=3D\"test.txt\""
- #define RFC5987_TEST_HEADER_NO_TYPE_2  "filename=3D\"test.txt\"; foo=3Dba=
r"
-+#define RFC5987_TEST_HEADER_EMPTY_FILENAME ";filename"
-=20
- static void
- do_content_disposition_tests (void)
-@@ -1133,6 +1134,20 @@ do_content_disposition_tests (void)
- 	g_assert_cmpstr (filename, =3D=3D, RFC5987_TEST_FALLBACK_FILENAME);
-         parameter2 =3D g_hash_table_lookup (params, "foo");
-         g_assert_cmpstr (parameter2, =3D=3D, "bar");
-+	g_hash_table_destroy (params);
-+
-+	 /* Empty filename */
-+	soup_message_headers_clear (hdrs);
-+	soup_message_headers_append (hdrs, "Content-Disposition",
-+								 RFC5987_TEST_HEADER_EMPTY_FILENAME);
-+	if (!soup_message_headers_get_content_disposition (hdrs,
-+													   &disposition,
-+													   &params)) {
-+			soup_test_assert (FALSE, "empty filename decoding FAILED");
-+			return;
-+	}
-+	g_free (disposition);
-+	g_assert_false (g_hash_table_contains (params, "filename"));
- 	g_hash_table_destroy (params);
-=20
- 	soup_message_headers_free (hdrs);
---=20
-2.34.1
-
diff --git a/meta/recipes-support/libsoup/libsoup-2.4/0001-Fix-build-with-l=
ibxml2-2.12.0-and-clang-17.patch b/meta/recipes-support/libsoup/libsoup-2.4=
/0001-Fix-build-with-libxml2-2.12.0-and-clang-17.patch
deleted file mode 100644
index d867e5bc176..00000000000
--- a/meta/recipes-support/libsoup/libsoup-2.4/0001-Fix-build-with-libxml2-=
2.12.0-and-clang-17.patch
+++ /dev/null
@@ -1,44 +0,0 @@
-From ced3c5d8cad0177b297666343f1561799dfefb0d Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Wed, 22 Nov 2023 18:49:10 -0800
-Subject: [PATCH] Fix build with libxml2-2.12.0 and clang-17
-
-Fixes build errors about missing function prototypes with clang-17
-
-Fixes
-| ../libsoup-2.74.3/libsoup/soup-xmlrpc-old.c:512:8: error: call to undecl=
ared function 'xmlParseMemory'; ISO C99 and later do not support implicit f=
unction declarations
-
-Upstream-Status: Submitted [https://gitlab.gnome.org/GNOME/libsoup/-/merge=
_requests/385]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- libsoup/soup-xmlrpc-old.c | 1 +
- libsoup/soup-xmlrpc.c     | 1 +
- 2 files changed, 2 insertions(+)
-
-diff --git a/libsoup/soup-xmlrpc-old.c b/libsoup/soup-xmlrpc-old.c
-index c57086b6..527e3b23 100644
---- a/libsoup/soup-xmlrpc-old.c
-+++ b/libsoup/soup-xmlrpc-old.c
-@@ -11,6 +11,7 @@
-=20
- #include <string.h>
-=20
-+#include <libxml/parser.h>
- #include <libxml/tree.h>
-=20
- #include "soup-xmlrpc-old.h"
-diff --git a/libsoup/soup-xmlrpc.c b/libsoup/soup-xmlrpc.c
-index 42dcda9c..e991cbf0 100644
---- a/libsoup/soup-xmlrpc.c
-+++ b/libsoup/soup-xmlrpc.c
-@@ -17,6 +17,7 @@
-=20
- #include <string.h>
- #include <errno.h>
-+#include <libxml/parser.h>
- #include <libxml/tree.h>
- #include "soup-xmlrpc.h"
- #include "soup.h"
---=20
-2.43.0
-
diff --git a/meta/recipes-support/libsoup/libsoup-2.4/0001-Fix-possibly-uni=
nitialized-warnings.patch b/meta/recipes-support/libsoup/libsoup-2.4/0001-F=
ix-possibly-uninitialized-warnings.patch
deleted file mode 100644
index fcd442c13af..00000000000
--- a/meta/recipes-support/libsoup/libsoup-2.4/0001-Fix-possibly-uninitiali=
zed-warnings.patch
+++ /dev/null
@@ -1,43 +0,0 @@
-From 1159686379184a1c899eabb2174258aba5e0fd79 Mon Sep 17 00:00:00 2001
-From: Patrick Griffis <pgriffis@igalia.com>
-Date: Mon, 20 Sep 2021 15:41:31 -0500
-Subject: [PATCH] Fix possibly uninitialized warnings
-
-Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/libsoup/-/commit=
/fb98e9a8c3062c75357b961543af091de2dd5459]
-
-Signed-off-by: Changqing Li <changqing.li@windriver.com>
----
- libsoup/soup-websocket-connection.c | 2 +-
- tests/samesite-test.c               | 3 +++
- 2 files changed, 4 insertions(+), 1 deletion(-)
-
-diff --git a/libsoup/soup-websocket-connection.c b/libsoup/soup-websocket-=
connection.c
-index 65c1492..585d45c 100644
---- a/libsoup/soup-websocket-connection.c
-+++ b/libsoup/soup-websocket-connection.c
-@@ -471,7 +471,7 @@ send_message (SoupWebsocketConnection *self,
- 	GByteArray *bytes;
- 	gsize frame_len;
- 	guint8 *outer;
--	guint8 mask_offset;
-+	guint8 mask_offset =3D 0;
- 	GBytes *filtered_bytes;
- 	GList *l;
- 	GError *error =3D NULL;
-diff --git a/tests/samesite-test.c b/tests/samesite-test.c
-index 0b081b2..60c9b8e 100644
---- a/tests/samesite-test.c
-+++ b/tests/samesite-test.c
-@@ -60,6 +60,9 @@ assert_highest_policy_visible (GSList *cookies, SoupSame=
SitePolicy policy)
- 	case SOUP_SAME_SITE_POLICY_NONE:
- 		expected_count =3D 1;
- 		break;
-+	default:
-+		g_assert_not_reached ();
-+		break;
- 	}
-=20
- 	g_assert_cmpuint (size, =3D=3D, expected_count);
---=20
-2.34.1
-
diff --git a/meta/recipes-support/libsoup/libsoup-2.4/0001-Remove-http-and-=
https-aliases-support-test.patch b/meta/recipes-support/libsoup/libsoup-2.4=
/0001-Remove-http-and-https-aliases-support-test.patch
deleted file mode 100644
index 0d4139ec084..00000000000
--- a/meta/recipes-support/libsoup/libsoup-2.4/0001-Remove-http-and-https-a=
liases-support-test.patch
+++ /dev/null
@@ -1,145 +0,0 @@
-From 0e3bfa22b23451531caf8cc30b1771ac6a41fcad Mon Sep 17 00:00:00 2001
-From: Carlos Garcia Campos <cgarcia@igalia.com>
-Date: Thu, 11 Feb 2021 10:47:09 +0100
-Subject: [PATCH] Remove http and https aliases support test
-
-Upstream has removed the whole function of http and https aliases
-support, this commit partially cherry pick it, only remove the test to
-mute the warning:
-| ../libsoup-2.74.3/tests/server-test.c: In function 'do_one_server_aliase=
s_test':
-| ../libsoup-2.74.3/tests/server-test.c:180:17: warning: 'g_socket_client_=
set_tls_validation_flags' is deprecated [-Wdeprecated-declarations]
-|   180 |                 g_socket_client_set_tls_validation_flags (client=
, 0);
-|       |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
-
-Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/libsoup/-/commit=
/111ae4ebe7cc2e389573cff5b9ac76509d6cbac0]
-
-Signed-off-by: Changqing Li <changqing.li@windriver.com>
----
- tests/server-test.c | 104 --------------------------------------------
- 1 file changed, 104 deletions(-)
-
-diff --git a/tests/server-test.c b/tests/server-test.c
-index 8976103..cb7e815 100644
---- a/tests/server-test.c
-+++ b/tests/server-test.c
-@@ -154,108 +154,6 @@ do_star_test (ServerData *sd, gconstpointer test_dat=
a)
- 	soup_uri_free (star_uri);
- }
-=20
--static void
--do_one_server_aliases_test (SoupURI    *uri,
--			    const char *alias,
--			    gboolean    succeed)
--{
--	GSocketClient *client;
--	GSocketConnectable *addr;
--	GSocketConnection *conn;
--	GInputStream *in;
--	GOutputStream *out;
--	GError *error =3D NULL;
--	GString *req;
--	static char buf[1024];
--
--	debug_printf (1, "  %s via %s\n", alias, uri->scheme);
--
--	/* There's no way to make libsoup's client side send an absolute
--	 * URI (to a non-proxy server), so we have to fake this.
--	 */
--
--	client =3D g_socket_client_new ();
--	if (uri->scheme =3D=3D SOUP_URI_SCHEME_HTTPS) {
--		g_socket_client_set_tls (client, TRUE);
--		g_socket_client_set_tls_validation_flags (client, 0);
--	}
--	addr =3D g_network_address_new (uri->host, uri->port);
--
--	conn =3D g_socket_client_connect (client, addr, NULL, &error);
--	g_object_unref (addr);
--	g_object_unref (client);
--	if (!conn) {
--		g_assert_no_error (error);
--		g_error_free (error);
--		return;
--	}
--
--	in =3D g_io_stream_get_input_stream (G_IO_STREAM (conn));
--	out =3D g_io_stream_get_output_stream (G_IO_STREAM (conn));
--
--	req =3D g_string_new (NULL);
--	g_string_append_printf (req, "GET %s://%s:%d HTTP/1.1\r\n",
--				alias, uri->host, uri->port);
--	g_string_append_printf (req, "Host: %s:%d\r\n",
--				uri->host, uri->port);
--	g_string_append (req, "Connection: close\r\n\r\n");
--
--	if (!g_output_stream_write_all (out, req->str, req->len, NULL, NULL, &er=
ror)) {
--		g_assert_no_error (error);
--		g_error_free (error);
--		g_object_unref (conn);
--		g_string_free (req, TRUE);
--		return;
--	}
--	g_string_free (req, TRUE);
--
--	if (!g_input_stream_read_all (in, buf, sizeof (buf), NULL, NULL, &error)=
) {
--		g_assert_no_error (error);
--		g_error_free (error);
--		g_object_unref (conn);
--		return;
--	}
--
--	if (succeed)
--		g_assert_true (g_str_has_prefix (buf, "HTTP/1.1 200 "));
--	else
--		g_assert_true (g_str_has_prefix (buf, "HTTP/1.1 400 "));
--
--	g_io_stream_close (G_IO_STREAM (conn), NULL, NULL);
--	g_object_unref (conn);
--}
--
--static void
--do_server_aliases_test (ServerData *sd, gconstpointer test_data)
--{
--	char *http_aliases[] =3D { "dav", NULL };
--	char *https_aliases[] =3D { "davs", NULL };
--	char *http_good[] =3D { "http", "dav", NULL };
--	char *http_bad[] =3D { "https", "davs", "fred", NULL };
--	char *https_good[] =3D { "https", "davs", NULL };
--	char *https_bad[] =3D { "http", "dav", "fred", NULL };
--	int i;
--
--	g_test_bug ("703694");
--
--	g_object_set (G_OBJECT (sd->server),
--		      SOUP_SERVER_HTTP_ALIASES, http_aliases,
--		      SOUP_SERVER_HTTPS_ALIASES, https_aliases,
--		      NULL);
--
--	for (i =3D 0; http_good[i]; i++)
--		do_one_server_aliases_test (sd->base_uri, http_good[i], TRUE);
--	for (i =3D 0; http_bad[i]; i++)
--		do_one_server_aliases_test (sd->base_uri, http_bad[i], FALSE);
--
--	if (tls_available) {
--		for (i =3D 0; https_good[i]; i++)
--			do_one_server_aliases_test (sd->ssl_base_uri, https_good[i], TRUE);
--		for (i =3D 0; https_bad[i]; i++)
--			do_one_server_aliases_test (sd->ssl_base_uri, https_bad[i], FALSE);
--	}
--}
--
- static void
- do_dot_dot_test (ServerData *sd, gconstpointer test_data)
- {
-@@ -1382,8 +1280,6 @@ main (int argc, char **argv)
-=20
- 	g_test_add ("/server/OPTIONS *", ServerData, NULL,
- 		    server_setup, do_star_test, server_teardown);
--	g_test_add ("/server/aliases", ServerData, NULL,
--		    server_setup, do_server_aliases_test, server_teardown);
- 	g_test_add ("/server/..-in-path", ServerData, NULL,
- 		    server_setup, do_dot_dot_test, server_teardown);
- 	g_test_add ("/server/ipv6", ServerData, NULL,
---=20
-2.34.1
-
diff --git a/meta/recipes-support/libsoup/libsoup-2.4/CVE-2024-52532-1.patc=
h b/meta/recipes-support/libsoup/libsoup-2.4/CVE-2024-52532-1.patch
deleted file mode 100644
index cb1f0961100..00000000000
--- a/meta/recipes-support/libsoup/libsoup-2.4/CVE-2024-52532-1.patch
+++ /dev/null
@@ -1,37 +0,0 @@
-From a693d49bff058fc20a448dc4e7d324ff0dc6597e Mon Sep 17 00:00:00 2001
-From: Ignacio Casal Quinteiro <qignacio@amazon.com>
-Date: Wed, 11 Sep 2024 11:52:11 +0200
-Subject: [PATCH 1/3] websocket: process the frame as soon as we read data
-
-Otherwise we can enter in a read loop because we were not
-validating the data until the all the data was read.
-
-Fixes #391
-
-CVE: CVE-2024-52532
-Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/libsoup/-/commit=
/6adc0e3eb74c257ed4e2a23eb4b2774fdb0d67be#f1d67ca0386b145ea201cf88d27f72724=
d7c6715]
-
-Signed-off-by: Changqing Li <changqing.li@windriver.com>
----
- libsoup/soup-websocket-connection.c | 5 ++---
- 1 file changed, 2 insertions(+), 3 deletions(-)
-
-diff --git a/libsoup/soup-websocket-connection.c b/libsoup/soup-websocket-=
connection.c
-index a4095e1..65c1492 100644
---- a/libsoup/soup-websocket-connection.c
-+++ b/libsoup/soup-websocket-connection.c
-@@ -1140,9 +1140,8 @@ soup_websocket_connection_read (SoupWebsocketConnect=
ion *self)
- 		}
-=20
- 		pv->incoming->len =3D len + count;
--	} while (count > 0);
--
--	process_incoming (self);
-+		process_incoming (self);
-+	} while (count > 0 && !pv->close_sent && !pv->io_closing);
-=20
- 	if (end) {
- 		if (!pv->close_sent || !pv->close_received) {
---=20
-2.34.1
-
diff --git a/meta/recipes-support/libsoup/libsoup-2.4/CVE-2024-52532-2.patc=
h b/meta/recipes-support/libsoup/libsoup-2.4/CVE-2024-52532-2.patch
deleted file mode 100644
index dcadafe9449..00000000000
--- a/meta/recipes-support/libsoup/libsoup-2.4/CVE-2024-52532-2.patch
+++ /dev/null
@@ -1,43 +0,0 @@
-From f5b76410de1318f49844dacf6e68692522b6c856 Mon Sep 17 00:00:00 2001
-From: Ignacio Casal Quinteiro <qignacio@amazon.com>
-Date: Wed, 2 Oct 2024 11:17:19 +0200
-Subject: [PATCH] websocket-test: disconnect error copy after the test ends
-
-Otherwise the server will have already sent a few more wrong
-bytes and the client will continue getting errors to copy
-but the error is already !=3D NULL and it will assert
-
-CVE: CVE-2024-52532
-Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/libsoup/-/commit=
/29b96fab2512666d7241e46c98cc45b60b795c0c]
-
-Signed-off-by: Changqing Li <changqing.li@windriver.com>
----
- tests/websocket-test.c | 5 ++++-
- 1 file changed, 4 insertions(+), 1 deletion(-)
-
-diff --git a/tests/websocket-test.c b/tests/websocket-test.c
-index 5e40cf3..1ec9ff6 100644
---- a/tests/websocket-test.c
-+++ b/tests/websocket-test.c
-@@ -1331,8 +1331,9 @@ test_receive_invalid_encode_length_64 (Test *test,
- 	GError *error =3D NULL;
- 	InvalidEncodeLengthTest context =3D { test, NULL };
- 	guint i;
-+	guint error_id;
-=20
--	g_signal_connect (test->client, "error", G_CALLBACK (on_error_copy), &er=
ror);
-+	error_id =3D g_signal_connect (test->client, "error", G_CALLBACK (on_err=
or_copy), &error);
- 	g_signal_connect (test->client, "message", G_CALLBACK (on_binary_message=
), &received);
-=20
- 	/* We use 127(\x7f) as payload length with 65535 extended length */
-@@ -1345,6 +1346,7 @@ test_receive_invalid_encode_length_64 (Test *test,
- 	WAIT_UNTIL (error !=3D NULL || received !=3D NULL);
- 	g_assert_error (error, SOUP_WEBSOCKET_ERROR, SOUP_WEBSOCKET_CLOSE_PROTOC=
OL_ERROR);
- 	g_clear_error (&error);
-+	g_signal_handler_disconnect (test->client, error_id);
- 	g_assert_null (received);
-=20
-         g_thread_join (thread);
---=20
-2.34.1
-
diff --git a/meta/recipes-support/libsoup/libsoup-2.4/CVE-2024-52532-3.patc=
h b/meta/recipes-support/libsoup/libsoup-2.4/CVE-2024-52532-3.patch
deleted file mode 100644
index ab6af722914..00000000000
--- a/meta/recipes-support/libsoup/libsoup-2.4/CVE-2024-52532-3.patch
+++ /dev/null
@@ -1,48 +0,0 @@
-From d97bb2e340f5a6d7e56a7738403f9d18bc406b70 Mon Sep 17 00:00:00 2001
-From: Simon McVittie <smcv@debian.org>
-Date: Wed, 13 Nov 2024 14:14:23 +0000
-Subject: [PATCH 3/3] websocket-test: Disconnect error signal in another pl=
ace
-
-This is the same change as commit 29b96fab "websocket-test: disconnect
-error copy after the test ends", and is done for the same reason, but
-replicating it into a different function.
-
-Fixes: 6adc0e3e "websocket: process the frame as soon as we read data"
-Resolves: https://gitlab.gnome.org/GNOME/libsoup/-/issues/399
-Signed-off-by: Simon McVittie <smcv@debian.org>
-
-CVE: CVE-2024-52532
-Upstream-Status: Backport
-[https://gitlab.gnome.org/GNOME/libsoup/-/commit/4c9e75c6676a37b6485620c33=
2e568e1a3f530ff]
-
-Signed-off-by: Changqing Li <changqing.li@windriver.com>
----
- tests/websocket-test.c | 4 +++-
- 1 file changed, 3 insertions(+), 1 deletion(-)
-
-diff --git a/tests/websocket-test.c b/tests/websocket-test.c
-index 2b19a7b..0699a06 100644
---- a/tests/websocket-test.c
-+++ b/tests/websocket-test.c
-@@ -1300,8 +1300,9 @@ test_receive_invalid_encode_length_16 (Test *test,
- 	GError *error =3D NULL;
- 	InvalidEncodeLengthTest context =3D { test, NULL };
- 	guint i;
-+	guint error_id;
-=20
--	g_signal_connect (test->client, "error", G_CALLBACK (on_error_copy), &er=
ror);
-+	error_id =3D g_signal_connect (test->client, "error", G_CALLBACK (on_err=
or_copy), &error);
- 	g_signal_connect (test->client, "message", G_CALLBACK (on_binary_message=
), &received);
-=20
- 	/* We use 126(~) as payload length with 125 extended length */
-@@ -1314,6 +1315,7 @@ test_receive_invalid_encode_length_16 (Test *test,
- 	WAIT_UNTIL (error !=3D NULL || received !=3D NULL);
- 	g_assert_error (error, SOUP_WEBSOCKET_ERROR, SOUP_WEBSOCKET_CLOSE_PROTOC=
OL_ERROR);
- 	g_clear_error (&error);
-+        g_signal_handler_disconnect (test->client, error_id);
- 	g_assert_null (received);
-=20
- 	g_thread_join (thread);
---=20
-2.34.1
-
diff --git a/meta/recipes-support/libsoup/libsoup-2.4_2.74.3.bb b/meta/reci=
pes-support/libsoup/libsoup-2.4_2.74.3.bb
deleted file mode 100644
index 7e275a48f4c..00000000000
--- a/meta/recipes-support/libsoup/libsoup-2.4_2.74.3.bb
+++ /dev/null
@@ -1,66 +0,0 @@
-SUMMARY =3D "An HTTP library implementation in C"
-DESCRIPTION =3D "libsoup is an HTTP client/server library for GNOME. It us=
es GObjects \
-and the glib main loop, to integrate well with GNOME applications."
-HOMEPAGE =3D "https://wiki.gnome.org/Projects/libsoup"
-BUGTRACKER =3D "https://bugzilla.gnome.org/"
-SECTION =3D "x11/gnome/libs"
-LICENSE =3D "LGPL-2.0-only"
-LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D5f30f0716dfdd0d91eb439ebec522ec=
2"
-
-DEPENDS =3D "glib-2.0 glib-2.0-native libxml2 sqlite3 libpsl"
-
-SHRT_VER =3D "${@d.getVar('PV').split('.')[0]}.${@d.getVar('PV').split('.'=
)[1]}"
-
-SRC_URI =3D "${GNOME_MIRROR}/libsoup/${SHRT_VER}/libsoup-${PV}.tar.xz \
-           file://0001-Fix-build-with-libxml2-2.12.0-and-clang-17.patch \
-           file://0001-CVE-2025-32911.patch \
-           file://0001-Fix-possibly-uninitialized-warnings.patch \
-           file://0001-Remove-http-and-https-aliases-support-test.patch \
-           file://CVE-2024-52532-1.patch \
-           file://CVE-2024-52532-2.patch \
-           file://CVE-2024-52532-3.patch"
-
-SRC_URI[sha256sum] =3D "e4b77c41cfc4c8c5a035fcdc320c7bc6cfb75ef7c5a034153d=
f1413fa1d92f13"
-
-CVE_PRODUCT =3D "libsoup"
-
-S =3D "${WORKDIR}/libsoup-${PV}"
-
-inherit meson gettext pkgconfig upstream-version-is-even gobject-introspec=
tion gtk-doc
-
-UPSTREAM_CHECK_REGEX =3D "libsoup-(?P<pver>2(\.(?!99)\d+)+)\.tar"
-
-GIR_MESON_ENABLE_FLAG =3D 'enabled'
-GIR_MESON_DISABLE_FLAG =3D 'disabled'
-
-PACKAGECONFIG ??=3D ""
-PACKAGECONFIG[brotli] =3D "-Dbrotli=3Denabled,-Dbrotli=3Ddisabled,brotli"
-# libsoup-gnome is entirely deprecated and just stubs in 2.42 onwards
-PACKAGECONFIG[gnome] =3D "-Dgnome=3Dtrue,-Dgnome=3Dfalse"
-PACKAGECONFIG[gssapi] =3D "-Dgssapi=3Denabled,-Dgssapi=3Ddisabled,krb5"
-PACKAGECONFIG[ntlm] =3D "-Dntlm=3Denabled,-Dntlm=3Ddisabled"
-PACKAGECONFIG[sysprof] =3D "-Dsysprof=3Denabled,-Dsysprof=3Ddisabled,syspr=
of"
-
-# Tell libsoup where the target ntlm_auth is installed
-do_write_config:append:class-target() {
-    cat >${WORKDIR}/soup.cross <<EOF
-[binaries]
-ntlm_auth =3D '${bindir}/ntlm_auth'
-EOF
-}
-EXTRA_OEMESON:append:class-target =3D " --cross-file ${WORKDIR}/soup.cross=
"
-
-EXTRA_OEMESON +=3D "-Dvapi=3Ddisabled -Dtls_check=3Dfalse"
-
-GTKDOC_MESON_OPTION =3D "gtk_doc"
-
-# When built without gnome support, libsoup-2.4 will contain only one shar=
ed lib
-# and will therefore become subject to renaming by debian.bbclass. Prevent
-# renaming in order to keep the package name consistent regardless of whet=
her
-# gnome support is enabled or disabled.
-DEBIAN_NOAUTONAME:${PN} =3D "1"
-
-# glib-networking is needed for SSL, proxies, etc.
-RRECOMMENDS:${PN} =3D "glib-networking"
-
-BBCLASSEXTEND =3D "native nativesdk"

