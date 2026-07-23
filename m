Return-Path: <joerg.sommer@navimatix.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7F80C531D0
	for <webhook@archiver.kernel.org>; Thu, 23 Jul 2026 20:03:32 +0000 (UTC)
Received: from OSPPR02CU001.outbound.protection.outlook.com (OSPPR02CU001.outbound.protection.outlook.com [40.107.159.82])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5386.1784837001585838134
 for <openembedded-core@lists.openembedded.org>;
 Thu, 23 Jul 2026 13:03:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@navimatix.de header.s=selector1 header.b=gnqRC3V3;
 spf=pass (domain: navimatix.de, ip: 40.107.159.82, mailfrom: joerg.sommer@navimatix.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=F+91l6WY4IcH2j2ZXtdy35tGpLED3nEXtybFZ6E5TU4su54MNMc/fiKqOpfXVpMXLCtsc2viO4+YE/d3NiOyt7AWpTabgHWGpC+zk4YFCMXrdh6ouTWZn7SKN1DfFsu0txZt/n+Ii+9QtHfufQ0guVcr/CEbBForJRBxJWWUZI9EmKnVONbYdpto1txO1bn/hgfQCPbilRoZR/DnQgipEOWt6JEhHy/5NX/PqD7+P0o1jQJCWdy1RmLjZ7lyEceEOXicF1FSEJZ1qaasoiTJgB+C0H+MsDwa1//vXKyToEqGApWNqs4gruojZvDUWWbfDXltYOtNRPQHBc2ZSkrJzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=V1w0dDE5gMAhz2xWkwYUiXpKAHi+oX65RAzGkshVI58=;
 b=i8v45gwuf+0W9KWztGfg1uFaNRIleUMNxwDL1EvRT1uniuQC2YRU9ceiDhdJnAsDn50MyE7qdfgtRABeuethIs3qhy9/ogViLuir0ZUYx4yiBGChDcshKsYa4tA4VDHFjjFVOIoJeFsMv8QYMNVrzvO3EuJ1UBBx4woXrlNaVyGahz9X+BnXgRmnsG0SU/E1F1Bp+5GsQwSrgoYmlAkqZX1Rehi0ePvJ+zpVyDy98xLHbVHk1DgBa7ZtoQ9K3xG9NHGkUBc9DVuw1DYMw3QrojV1ZnILoAo3ZVKgYIQRZdGP3nR9AkqpuagBhiaXQBXx9XO+qo5/G5PfpOYYZA5EAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=navimatix.de; dmarc=pass action=none header.from=navimatix.de;
 dkim=pass header.d=navimatix.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=navimatix.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V1w0dDE5gMAhz2xWkwYUiXpKAHi+oX65RAzGkshVI58=;
 b=gnqRC3V3jkeeyignvMkUQXTuzxSGiWsVwAL20Xz02DZvTcNLirs1RhSqiVxYGwAmCo6VzTSK9OubsrNKZihMzdpKhhKG41KPmFpSo8dcR3qFWbqACxuYX9yV3lXzh/GRRxG4a6ahmm19z2s8K/iHi/pgT55RgpBDjP/aqaLPcPw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=navimatix.de;
Received: from GV2PR01MB11835.eurprd01.prod.exchangelabs.com
 (2603:10a6:150:2cb::8) by DU0PR01MB10259.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:31a::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.10; Thu, 23 Jul
 2026 20:03:15 +0000
Received: from GV2PR01MB11835.eurprd01.prod.exchangelabs.com
 ([fe80::d5c3:2dea:3d98:25fd]) by
 GV2PR01MB11835.eurprd01.prod.exchangelabs.com ([fe80::d5c3:2dea:3d98:25fd%3])
 with mapi id 15.21.0245.009; Thu, 23 Jul 2026 20:03:15 +0000
Date: Thu, 23 Jul 2026 22:03:13 +0200
From: =?utf-8?B?SsO2cmc=?= Sommer <joerg.sommer@navimatix.de>
To: ross.burton@arm.com
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH] libgit2: remove library paths from installed
 .cmake
Message-ID: <amJzACEoQbiYHwMa@navimatix.de>
References: <20260723193744.3592838-1-ross.burton@arm.com>
Content-Type: multipart/signed; micalg=sha256;
	protocol="application/pkcs7-signature"; boundary="2qekdalghkyc4ft2"
Content-Disposition: inline
In-Reply-To: <20260723193744.3592838-1-ross.burton@arm.com>
X-ClientProxiedBy: BE1P281CA0223.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:88::6) To GV2PR01MB11835.eurprd01.prod.exchangelabs.com
 (2603:10a6:150:2cb::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR01MB11835:EE_|DU0PR01MB10259:EE_
X-MS-Office365-Filtering-Correlation-Id: 5cc82629-2e8c-4ed5-bb3b-08dee8f56e75
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|23010399003|1800799024|376014|56012099006|10067099003|5023799004|22082099003|18002099003|3023799007;
X-Microsoft-Antispam-Message-Info: 
	4QyI3jfb/0dXDrC5oTIxacSgYKI0csZLbQ7FQoEUQ6cAov2NJJB/Qkd1fwE88T90DDzvhpeJdG1vFZRc/OpaYVzQ9b4h8iOViVpr6oR1xZVEAoS+j27BCPxZ95tFimZHcxEHAEJ3Oz1xYCQf25QD2l4xCQKqJV0lypHGadfdSNfKVb7QZPG9Y4mXAgJhWVQmAt/FrBQQA2GhvuhSDsOVGIlWzZ8KNZZ+taWtbT/62mDttPFbYvZdNWRK0h5UccX1cpzRFdSLambYdh3gXxTLZpOgadTXRGv+8Ov0ONcTh5ZFrgaEwgf5bkc0o7K4Tb5FXQAFgsTlkVUzlHNrscnsikxV9eM46IV+GKA5scWRak9qo5D2dJFeLXwSAAGGt09vFFV4IZiGccaKIlppLJqVZzPLk4exhQ7XvSl9gUddiSd54Tz65E07EDeUV2kWhSUhJFsaa7Ac/OO+wAVUjR/MiMJjXLXM0uGG3JjjEOSodTcpC6DwPR4LYY0TZrLAhuXbhntIpv38zo1ZcFrkl3+xvldD/raHgI68Gdmk9iHDgmj4JoF3z81ypn4mwMcEqMNJU4xlShiOgzFOBnez1XpXadMcOx0V7rB5aZXluxA/w4s=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR01MB11835.eurprd01.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(1800799024)(376014)(56012099006)(10067099003)(5023799004)(22082099003)(18002099003)(3023799007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?WDJpVFRpK3ZycFVuNDFCOThWd3hRRjk4bU5ReG1oSk05RXBrTlpyZDhjRlc0?=
 =?utf-8?B?U2VWZXVTOU16UjBlS2dKOGxWK0NRWE5ZRTUzSEpRMldUTHVaenZEbFJ1Uzc3?=
 =?utf-8?B?YlVtWjRmbVR5SDJhcGZDUzNiN3BRWWxOK1ZjamxDYjBoZUNHdTUrK3JLWk9V?=
 =?utf-8?B?UWZrS3dMbzlpWFZ3Nml6TFJKSURLY3ZHRDBiaDAvMWx6cFViS0ZWcGtIcWVz?=
 =?utf-8?B?UDhETGpPU1RRNVdoTTYvTDZpaTArdkNEN09tVjBKbFJHTEc1am9GSkl0TnFX?=
 =?utf-8?B?UUM5cENFZThCK0dOenpKU3R5NDdLbE90NU9EMFFkWjVNYTFMcExJNlVwbGxF?=
 =?utf-8?B?V0xVcThOdFJoeUYzY1RkM3lNTlZxa0srS0l6UGNZU2h1TFQrWjhQeXpTL1pC?=
 =?utf-8?B?cVZUZHV2cFQ2K3M4Z3k2VjBvL01TRTFQWnNlbFV6dHl5YU43M25yUXUwSU9x?=
 =?utf-8?B?Q0drV202aE1rd1lhcnVSS2dHamhGQVE0QlFuMTVFUkJYakNubmhMaHJybjcy?=
 =?utf-8?B?aERrV0NPMC9DbFZoUThURUhpZy9EYXd5V3NRMjdyRlU2cHFMM0ZMUVJLWUFm?=
 =?utf-8?B?cm5mdXJjM2RJOUE5K3N0ZjdXakQreEtXQkgyT3h0Nlhwa0VCTkwxd1orYm45?=
 =?utf-8?B?UGdIQzhTNFVCZmpxRHpOZUE4Qi95eUNSOU9xdnlscmpmTU5ZQVpXcURVdlFL?=
 =?utf-8?B?OG0vQVBmOTRmcHRDTzFJTm1iQkVGdUFHSEpoaW9wbEJxTS8rTVRkM29ZeXZ6?=
 =?utf-8?B?ZjlQclF6b3ZOUWFpSmZHV21JZkRFUEVDbTVVbkp1RTJmbzlpaTM0SnYwaGRF?=
 =?utf-8?B?ZE5USkYvNWN1TUdaSk1sdjh5d3RpQktwS2NpN3Riejlmcy9uZ0ZkakdGQWNH?=
 =?utf-8?B?RkxJTVZWRW41RmtrdFNsSTJpZCsveUEyRC9XM2pIRG1CYzFDRGxvekFCMVc5?=
 =?utf-8?B?ZzN6c2htTERMSmFJZDNKaVkza25maFgyMzdIMDltbzZIakZZREt5eUFXZXo3?=
 =?utf-8?B?WWZlNGpxa3BiNEQyZGRyS1V1TE0rakErdXFoT2FHZE9vZVpyc2FrUnYzckIv?=
 =?utf-8?B?aEN6Z2xROEMydXpXYVdRWmZEY3R4VWJnTlNsSVVldURPSlM1cDU5NklUa2k2?=
 =?utf-8?B?TDhqa3BYSWRVNzhjYkk5dUV5anZDZ1BxOVFyb2tJLzN4QmVaa1lleTl5WmZa?=
 =?utf-8?B?aVIvVXpEb0JOYm5BakJ6M1RaTDl2dCtYVVZ5SEg3eUJnMlVRSTlhRE5qQ3N6?=
 =?utf-8?B?VEV1M0JiU1ZMc25KS0o3Uzd5MCt5NlBPOHJmTU81ZUJGbVNoUzFJdDFqUkNP?=
 =?utf-8?B?dDEwRzdDR1hpTGppNXNyNVJ2cDYxcW04Q1RsR1dqV3ZVN2d5WjkxbDRxQ3Bj?=
 =?utf-8?B?OVp5T1ArdUJhL3RZV3FnUVRuMlpwbWxSM3RaeUkyVGtxZnVIQnBCdFRXREpo?=
 =?utf-8?B?ZnpwWnB4M3Q2Nmg5V0hER2x3clVvWnJBNU1VR3dpaXJQWFIrVzM2UERLbFk4?=
 =?utf-8?B?L2k0T2NneDFXVmUrcmc4OGlGcklXSWdZYzlwMzlzNFg2SDl6QS9lVUQvU2Vr?=
 =?utf-8?B?SWEydlBZcEpoM29rWm1iSUVLY1k5SjJ0K1ppVHlMYlpodXFDS2wwOExDbUds?=
 =?utf-8?B?ekg5V0ZtSllONEgyeVpsWFgwVnkyOXVRblIrV3ZMZGkrNm5CYU05YUtPeTAr?=
 =?utf-8?B?RmNEM2JUNGJKdmdBcDl1UTh3QUZYRlFJRGJaREFlOXovMHhPdDQzVGZ5d0dF?=
 =?utf-8?B?Sk1adTVSY3QvQmxxMGdROUdQaXFqM1JPVG9NWlNMUXZvbGFVeld6ZTFrRCtU?=
 =?utf-8?B?M1hjQVpYVHFlbE9sVkk3ZkV3WEFCQWxwUWE4RFVWZEN5WThGTEQraWlHVnlS?=
 =?utf-8?B?MFg2ZXpNUDM3dGF3WkxTVnY2TEt3eFZDamtCSXdQNW1KaThSY05GNzVQdEtu?=
 =?utf-8?B?TWptNVA2dklVTHpNNGtyM3B3YTNaMC9ldkhTNUtXdllsenhnR1dYWVBZWXhm?=
 =?utf-8?B?OUY2Mlh1U0lmR3A0OGVzN1Z4U29jaFFJSXNOQWxCYTdIK1pzUzdzY3h3NERt?=
 =?utf-8?B?cC9qQnE1ZmViei9UbjdQcTJzWkZyMHpDVExvVm5MZkNwdlQwbXd4aTdPb1BV?=
 =?utf-8?B?ZWdKTncwRlJ0QnZkWWJTUFVVRmxKRTVWOXRRR0ozbmpjOG80ZlVMdk5Cc2pl?=
 =?utf-8?B?ckhXenU3VkhQOElYM1l6d1RuL256RGJ6VXhwZC9DZiszU1Zqa29FZHRWR0E0?=
 =?utf-8?B?SWFMRXFSRERyeGRYTVZQeC9CbGNjaTZ6ZVorUisrMDhkcU44QXFCaUVmMlpL?=
 =?utf-8?B?U2dyb0pYYld3Z1BkVUVHMGdUUzRhMEJsOWJUaVB1a2s3Mk9LV3pFaTl3d0ZN?=
 =?utf-8?Q?uhnYB6U4t4GK61/c=3D?=
X-OriginatorOrg: navimatix.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 5cc82629-2e8c-4ed5-bb3b-08dee8f56e75
X-MS-Exchange-CrossTenant-AuthSource: GV2PR01MB11835.eurprd01.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jul 2026 20:03:15.2594
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: c87b4f54-b992-4813-8f3f-4a876324197f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ApoaNh4v9NvcaZxOiGQAmhUxNkxxDB1R6RJWQfFGLIlvQI71lk629AB8YVuZFfZgioXmDUZKXt1cu4fZDc7K+updY8fNZHm5Wu8r+lhH8HQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR01MB10259
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 23 Jul 2026 20:03:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241869

--2qekdalghkyc4ft2
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [OE-core] [PATCH] libgit2: remove library paths from installed
 .cmake
MIME-Version: 1.0

Ross Burton via lists.openembedded.org schrieb am Do 23. Jul, 20:37 (+0100):
> The libgit2 cmake rules generate a .cmake file that tells people linking
> to libgit2 how to link.  This includes the complete path to each of the
> libraries that libgit2 links, such as /path/to/sysroot/usr/lib/libssl.so.
>=20
> The build paths were previously removed with a quick sed, but this breaks
> builds where those target paths exist on the build host as they get used
> verbatim.
>=20
> However, all of this linkage is redundant as the library directly links
> to these libraries.  Mark the linkage as private, so the references do
> not appear in the .cmake files.
>=20
> [ YOCTO #16373 ]
>=20
> Signed-off-by: Ross Burton <ross.burton@arm.com>
> ---
>  ...m-libraries-are-private-link-librari.patch | 42 +++++++++++++++++++
>  meta/recipes-support/libgit2/libgit2_1.9.4.bb |  8 ++--
>  2 files changed, 45 insertions(+), 5 deletions(-)
>  create mode 100644 meta/recipes-support/libgit2/files/0001-cmake-mark-sy=
stem-libraries-are-private-link-librari.patch
>=20
> diff --git a/meta/recipes-support/libgit2/files/0001-cmake-mark-system-li=
braries-are-private-link-librari.patch b/meta/recipes-support/libgit2/files=
/0001-cmake-mark-system-libraries-are-private-link-librari.patch
> new file mode 100644
> index 00000000000..267770ae6fe
> --- /dev/null
> +++ b/meta/recipes-support/libgit2/files/0001-cmake-mark-system-libraries=
-are-private-link-librari.patch
> @@ -0,0 +1,42 @@
> +From 5670d3eed82f0d64766158809bf3d0c7c631b0ea Mon Sep 17 00:00:00 2001
> +From: Ross Burton <ross.burton@arm.com>
> +Date: Thu, 23 Jul 2026 17:35:23 +0100
> +Subject: [PATCH] cmake: mark system libraries are private link libraries
> +
> +When generating libgit2Targets.cmake, mark the system libraries that
> +libgit2.so links to as private, as the don't not need to be seen by

I think this should be =E2=80=9Cas they do not need=E2=80=9D

> +applications that link to libgit2.
> +

J=C3=B6rg

--=20
Navimatix GmbH           T: 03641 - 327 99 0
Tatzendpromenade 2       F: 03641 - 526 306
07745 Jena               www.navimatix.de

Gesch=C3=A4ftsf=C3=BChrer: Steffen Sp=C3=A4the, Jan Rommeley
Registergericht: Amtsgericht Jena, HRB 501480

--2qekdalghkyc4ft2
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
BgkqhkiG9w0BBwEwHAYJKoZIhvcNAQkFMQ8XDTI2MDcyMzIwMDMxMlowLwYJKoZIhvcNAQkE
MSIEICJqTWORyuWh9rq5+7DjduwopDErYAiAHVjDXiMKBbjpMDUGCSqGSIb3DQEJDzEoMCYw
CwYJYIZIAWUDBAEqMAsGCWCGSAFlAwQBAjAKBggqhkiG9w0DBzANBgkqhkiG9w0BAQEFAASC
AQBJAE7nLbJ0LU6sfDday9OZ8I5TM6ZnFcdh2uJJRcweHxwolOf3/jJ4BrtkUTEYHSkyNb44
RMGOvepisHFVtaSGUgqy8d5xmRlHw5+iiJteLqEE4c/kuuNgoqFhXj7y3jmfl4Ggh84RKaZw
V0WCZoBvk95Rz5xBpgVp0DvvmKq/26h2QeBBGJlB37pPNd5u2zG/IETqx7mrqpbSkAkP00b1
vwJC6yvF6G/kPPFcsojMymfLa+QIGbcJBXue/srAohFIADWNXYP4bN+pl5g59Bc5bj+jwzQK
Dvi+2ehf4KrPmU/txKEam66737CEJ0tTw2pjNWIbEURDi+qJqc2AvfUc

--2qekdalghkyc4ft2--

