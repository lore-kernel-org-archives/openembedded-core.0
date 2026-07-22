Return-Path: <joerg.sommer@navimatix.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9ACD1C4453A
	for <webhook@archiver.kernel.org>; Wed, 22 Jul 2026 09:49:57 +0000 (UTC)
Received: from OSPPR02CU001.outbound.protection.outlook.com (OSPPR02CU001.outbound.protection.outlook.com [40.107.159.124])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.44280.1784713792661857805
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Jul 2026 02:49:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@navimatix.de header.s=selector1 header.b=HTaopVB3;
 spf=pass (domain: navimatix.de, ip: 40.107.159.124, mailfrom: joerg.sommer@navimatix.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=B+pFc5RMa3gzz4Mi3kz7bfDrznTn/ZyZEMJQ190ubrP8x7cR2se4OMFDId05YkXr0lRNcnl5mW0zyJXkfWA//rprrKZmNDtvI/ZPWL0Saa+GEFCpSHOowVjOSQVtznmmkwiWPGtyuI45LCG2/PKvdi28DJJzuH7vTw4C76d6/NYOXgaNrbDq+xz6Mj0TqXexqlTzaI7DTe1yT+EcqZnG3z1ZATIKUirL8rZXJ04SX00hR1GhEvPIYbe8RKxH9hv7ZYhvKjo1pif4pvVCOj8iDZXr+2KTnGSiNVzldaqArtf8+4Qvqf1SYH5sE5d4NyaF4mxlDU3bxxU2SiYhEQ5rQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uSVIujv8fEXmhLaS1CG13H/xbEx1Vgs/FHVicIrEPrA=;
 b=RixGR3A0D99TcNUJFECnCPsmwl2EXHMtx61xFXWOdJCfJW0P18Jvw5y4c4aTPCfiRWt2bM5pzX+57el1jB4GRxUqaHETKDAt6H90kjKCnneBqkCrtHLLDBHZQsSdJ1HNNtDRorgmvTSNAh1ImWVzdCVmMl2Rr/gEN3v34Thbtq66NRD40c+1nXvwitD4rA/ZK3fFt7tSSlcn9o0g50PRdM8BDKRXKAgjzVS/LTJsqVaRgQ4KIeWpjHfgl4mKai9MIrQ7jKFuVIEfqKUBJytL1GNSzjKBgUkZqtodB6Btl8HhKdjrEOCEAsa0iJn/NJk3Kpnaeg3v2KS59o3dCZBCCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=navimatix.de; dmarc=pass action=none header.from=navimatix.de;
 dkim=pass header.d=navimatix.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=navimatix.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uSVIujv8fEXmhLaS1CG13H/xbEx1Vgs/FHVicIrEPrA=;
 b=HTaopVB3MJTvCG387qDFWxZWwFxmbbX3WVY51dBIpjSw1dShbhgiIw7F3fbRs2ITagmzXgRB2BttLl5+lfjmimEzuTOwdrcKX1/cDBjKWMClyEr8SdSFD5L5m2fMBE/J4zfXu72qOpYQELYIE8gobRBFcrdGiknU7j6f2suxDGU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=navimatix.de;
Received: from GV2PR01MB11835.eurprd01.prod.exchangelabs.com
 (2603:10a6:150:2cb::8) by DBAPR01MB6567.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:18e::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.10; Wed, 22 Jul
 2026 09:49:48 +0000
Received: from GV2PR01MB11835.eurprd01.prod.exchangelabs.com
 ([fe80::d5c3:2dea:3d98:25fd]) by
 GV2PR01MB11835.eurprd01.prod.exchangelabs.com ([fe80::d5c3:2dea:3d98:25fd%3])
 with mapi id 15.21.0245.009; Wed, 22 Jul 2026 09:49:48 +0000
Date: Wed, 22 Jul 2026 11:49:45 +0200
From: =?utf-8?B?SsO2cmc=?= Sommer <joerg.sommer@navimatix.de>
To: HimaniRamesh.Barde@windriver.com
Cc: openembedded-core@lists.openembedded.org, Randy.MacLeod@windriver.com, 
	Shiva.Komati@windriver.com
Subject: Re: [OE-core] [PATCH v2] systemd.bbclass: fix service enablement for
 cross-install scenarios
Message-ID: <amCPncSGEt6euFYd@navimatix.de>
References: <20260716061519.765593-1-HimaniRamesh.Barde@windriver.com>
 <20260722064730.3212268-1-HimaniRamesh.Barde@windriver.com>
Content-Type: multipart/signed; micalg=sha256;
	protocol="application/pkcs7-signature"; boundary="ls5usz2btfhk634i"
Content-Disposition: inline
In-Reply-To: <20260722064730.3212268-1-HimaniRamesh.Barde@windriver.com>
X-ClientProxiedBy: BE1P281CA0155.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:67::12) To GV2PR01MB11835.eurprd01.prod.exchangelabs.com
 (2603:10a6:150:2cb::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR01MB11835:EE_|DBAPR01MB6567:EE_
X-MS-Office365-Filtering-Correlation-Id: 3bdd274e-7a96-4a2d-d57e-08dee7d69126
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|366016|23010399003|376014|18002099003|22082099003|4143699003|10067099003|56012099006;
X-Microsoft-Antispam-Message-Info: 
	ba31aqKFihmvVXZRMzL/YYGLuDY0hC1UFJuD0gNSpFJx3ROz/q8vwo1BFbaYaxHpdQlrvuURrgAfULkz2xUv/qp/9vCE3yDYas2ha3VVtlvVr9c+7UATSLuvmHLCP7k8f7H6J2V4Ulu8rzeqMP4M82zydlf4/Z+n7VZv71ypqua8qWsjgnA/ag++sFLxXVrgmVyOKtAn5PGAsUCGE3yM1kuVvuZwn4injQTIYUx0n0wpxNWNAKXooG7CSaO9RWMD40xQCp4URH+DXUafmmGMAQWDt7A8lr1jbAEhSqz/3bPZYAD1HB1ynyDT4kDaQZnn68fMTMY0h2VmFnj/rDna9WIaZxBQ+MuyPij0SHz0Hqs+ckmOdLS285TkpV2zzIl20y+7DSjOWf2fHo9SIXI8u6DVUFomktBzwcHYqnX/t5AwDGo2OJWhzb7HQbHNQaK9ibde9IudDUoBia6EWzgXOCJH2zNR/sMfIM+dt1BG6fR5dSylzaD4MhmXwCl6TrwcaQjqyRHxLcGftZ4d0mGjQqeMu+JvVZ/fI9llszxy7W0VmyMbtP1mN1g2HV8p2354BEDeQfVqO69uArTI5YZy9nrhC5tgqM11RK0q9Nxm+CM=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR01MB11835.eurprd01.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(23010399003)(376014)(18002099003)(22082099003)(4143699003)(10067099003)(56012099006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?iso-8859-1?Q?+FE4lXNW6wutMrFTOzJtExsHAMV7L/EnmygFtDye5BjgOJyhE6k6XFSizF?=
 =?iso-8859-1?Q?5zBto5GuawEN546V/emGc9trO8NPgfrmroF265QzomtFWUeRJ2HK4ol21g?=
 =?iso-8859-1?Q?Y4WovVNPZbRV/OZaovzaNDAtgKJrQ+YtZVAVxF3AgYsEWjiFti8iR723GQ?=
 =?iso-8859-1?Q?yvboWMpK9w8+saujWkvVcunkxvNWDrz0f8K96G1NyOqKbls/RGmCTVOAz9?=
 =?iso-8859-1?Q?DXnsn7w+xLH+sgBBT4/fqtBDbx+sKUrpuHG/jt0v0Fhqve40dh2f3dq//y?=
 =?iso-8859-1?Q?xImhLyk3/mqZLbHMwoVK5FX776LNNo6V9PTGogFx4/aY5CJzNXfeFXyHau?=
 =?iso-8859-1?Q?ockookXIsDf4ZsdSQrgvJZyDNf1gvSTzQQKBscwkGuPH5c8gdBekbmPVv1?=
 =?iso-8859-1?Q?pt/0ULA0NeWyM+UP9YZyNUPO3QxYGHVx0WNH8uNsajSER2/ppLQjC5UmS4?=
 =?iso-8859-1?Q?1q3ettz6RJ+qh+q7jgxiX1Fqkb8WEiNyqSjQLzD1Q/92QseRPZN8x7OoK7?=
 =?iso-8859-1?Q?niizZhXKqJ86wJTQJJT+IYGBTza5OVzcmAE0Z+bUCL/erWJjJ4MmDUMMoz?=
 =?iso-8859-1?Q?F9tcW+kBvAIGBPtRzzE1yF/EuYp7qj9BmJpUPrVhXegW/3mq2G0RwY7ZEG?=
 =?iso-8859-1?Q?UpILGEslzzoLQOP2+34oF/7R5GIhLyKyZjekEwoGVg9ZMr5jPy+2fR9sZ/?=
 =?iso-8859-1?Q?Gn+qNNK+88WpBFOgdTr/ekxTgR6Km+gDqEZ+q0yezLF7Y/cBAe1J7ZYw9s?=
 =?iso-8859-1?Q?RarJL7K0/BhNfjJf0PTbQNYI7z0q+SgJJkP3UO4r8A0HowZSPX09x/ygia?=
 =?iso-8859-1?Q?I42yF3oFvRaB0CYNVRw5BguFYl3A6n8B5FnwSz+LCOJzLlnfU8lHeWkBuq?=
 =?iso-8859-1?Q?N3QlkpM5hGP10kdIHtiTn/bcmw2OHxN/VccMtZ4Ft3PBJ9NDFLs2goEUQo?=
 =?iso-8859-1?Q?v9uVFToDu8Xr7PMJkWophJ3cwkvYrEZGVCPvOowkTWXagVBHojg3WjrbZi?=
 =?iso-8859-1?Q?ieFkpdhZrRumjb4qdUzvfbNWZzK590KnHpw7UJpE++B/KUe2s7f1cGNPZx?=
 =?iso-8859-1?Q?3X6V7RNSw5VL6qQfDO8YShkrzmPVjN8/u18oAzQEdlW642kVBF8jM6tsZB?=
 =?iso-8859-1?Q?whz/JqEck959rb6Za8GT2xCBkNvtR1dv3NOBkaYZLV4bTr7p3OCdocpCeo?=
 =?iso-8859-1?Q?p9nlKFGeXsMPLiABan4bkvRd/MwJfCXaW6hUEqY1va1IzCkUfk/yNtQHHy?=
 =?iso-8859-1?Q?qMZZ+AxJ7D4mnCL0wC7SiokDEPKiCX0SgR3FdR5S1VaPCcF0I+QQJfmgcS?=
 =?iso-8859-1?Q?8McquYdtIcg1sFJc3qZBCc6CFrWw1Hb4cjpwXX66ZyOa3t7dkP4V57qyKW?=
 =?iso-8859-1?Q?DuILNmOYmo9MeD3zkQ++xGeRzUb/RLygB+n/QyL8Uj2FyDf5zqhvsqdwRD?=
 =?iso-8859-1?Q?ml7udI0miMzrw8qLNwaSij8IETKRZqId51J4wklPMo9mrhh/Ms36y8N6ck?=
 =?iso-8859-1?Q?LlkQg4CppxkYWjDve646esOZyFpz1NFl6EZ4yM8f0mAhTCxHtrH1tlEt7N?=
 =?iso-8859-1?Q?UFkXSGAc0oo9y0rItIb6ORT/4e8bkCcCdqHX4OOYHE3wuMwe1eG0hFJcT6?=
 =?iso-8859-1?Q?KyOm8CFAkEILT1IjIxQIKQILdzf+qmKS6RGggv5RIGiMMCaoKT7FYnJNfr?=
 =?iso-8859-1?Q?p9AJollaRPYV+AX1NnUWEdfvxfQMOGDUbBvHdr0ApYfgy1w6WsW6Sk627a?=
 =?iso-8859-1?Q?67hci/Nh3SBiRfNR5KqPyHWchm9ziT3papjN6R4Wcoz1y3Xg9z2DgB8CMq?=
 =?iso-8859-1?Q?kzx1M/Ma4M639wc9amOz5dbOKirfJwQ=3D?=
X-OriginatorOrg: navimatix.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 3bdd274e-7a96-4a2d-d57e-08dee7d69126
X-MS-Exchange-CrossTenant-AuthSource: GV2PR01MB11835.eurprd01.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jul 2026 09:49:47.9292
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: c87b4f54-b992-4813-8f3f-4a876324197f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dlq95wuYS9Jmx8qAUOY6BTjpekfgcGIWj/eq7A25tkB2OWj/XjrprFW5PJ6zkIc6TyGOZV/JzDpPThJZS5+zxzLP+EyByER4QKkc+jpmoEo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR01MB6567
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 Jul 2026 09:49:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241635

--ls5usz2btfhk634i
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [OE-core] [PATCH v2] systemd.bbclass: fix service enablement for
 cross-install scenarios
MIME-Version: 1.0

Himani Ramesh Barde via lists.openembedded.org schrieb am Mi 22. Jul, 06:47=
 (+0000):
> When packages are installed outside of Yocto's normal image creation
> (e.g., using multistrap, debootstrap, or dpkg directly on a host),
> the postinst script fails to enable systemd services.
>=20
> The issue is that the entire enable logic is gated behind
> "if type systemctl >/dev/null 2>/dev/null". In cross-install scenarios:
> - If systemctl is absent on the host: the check fails, script is skipped
> - If host systemctl is present: it cannot find target unit files
>=20
> Fix this by separating the offline ($D set) and online ($D unset)

May it be better to say off-side and on-side or image-build and on-target?

> code paths into distinct branches. The previous code used a single
> OPTS variable to switch between "--root=3D$D" (offline) and "" (online)
> within one unified block. This variable is removed because the two
> scenarios now have dedicated branches with different logic:
>=20
> - Offline ($D set): Uses "systemctl --root=3D$D preset" per service,
>   which reads preset files from the target rootfs and creates symlinks
>   without needing the host systemctl to understand the target's unit
>   files. Falls back to "systemctl --root=3D$D enable" per service.
>=20
> - Online ($D unset): Same as before - enable, daemon-reload, preset,
>   restart. No behavioral change for on-target installs.


--=20
Navimatix GmbH           T: 03641 - 327 99 0
Tatzendpromenade 2       F: 03641 - 526 306
07745 Jena               www.navimatix.de

Gesch=E4ftsf=FChrer: Steffen Sp=E4the, Jan Rommeley
Registergericht: Amtsgericht Jena, HRB 501480

--ls5usz2btfhk634i
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
BgkqhkiG9w0BBwEwHAYJKoZIhvcNAQkFMQ8XDTI2MDcyMjA5NDk0NFowLwYJKoZIhvcNAQkE
MSIEIIL+4BVHcIveuvKrVJW+UGR1TTRj58l29d5cSSRLZQcZMDUGCSqGSIb3DQEJDzEoMCYw
CwYJYIZIAWUDBAEqMAsGCWCGSAFlAwQBAjAKBggqhkiG9w0DBzANBgkqhkiG9w0BAQEFAASC
AQCgpFVDEKqT7PDq1ErPylFuSMtO1u0R01jzu5CA286WfmDseF9X8pjcKuVS6gTpPE26CVHm
wzt5ZEANoumEOQ++nvuphq2k8t1baGAAoMkq4TBCpCVppmCevQT2sT9abIPyDyapA+LtnHdg
H1MbTj0jzIV3wyoxs1llE6ANUItqglyFNdxGtaJnTDpwFmcx5vRXrMsfRItSqpuxPbgVdG9V
LDMY0fDonWbhiahv+rE17FvVqnQzzC+660lHTc118HW7MBZP/O0/SyYZnxEi12Tj++TLk9tc
lCco4S+DJydyjlpCyIGz/CB8Fi2fzdGy3ffgs/txHbcC5AjxhqJtoM59

--ls5usz2btfhk634i--

