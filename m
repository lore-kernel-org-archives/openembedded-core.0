Return-Path: <joerg.sommer@navimatix.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00CBC10F3DFC
	for <webhook@archiver.kernel.org>; Sat, 28 Mar 2026 20:27:04 +0000 (UTC)
Received: from DUZPR83CU001.outbound.protection.outlook.com (DUZPR83CU001.outbound.protection.outlook.com [52.101.66.95])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.18330.1774729621065406442
 for <openembedded-core@lists.openembedded.org>;
 Sat, 28 Mar 2026 13:27:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@navimatix.de header.s=selector1 header.b=WIXE0ChT;
 spf=pass (domain: navimatix.de, ip: 52.101.66.95, mailfrom: joerg.sommer@navimatix.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=p0n9NmivL6rWggMSn7qhoMUImgGvDlvF1kVR+N20E5BpSaMz/G2K4zfOck/+diJAMRyMhCsocoQCaEOpwaIKfzB/MzXeWOEznQUzX9x/wI9CVPmYqfbl4mYKl4kwZihnOTJKNIuZ+tEj2CqhrdpgYmQvu0zfa7xH7Y/d6G6O1ArLLRo+5sGqDkKXsyGYHVVX+Oe1YD6ivJlOXT5w1/2wsU+J1bewjwC4mD+v7ZL+7iKgFoPeyD24QEZY/1S5ObB+6PtjWPPFinmcduKnVKDDycVqS6EXQFN5fxiF/JFDPgOfGUgEUuERqKNTrqNXP3Sij7K4jobR0CArqN6GhKqIiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6fZq5MWOEN01CQ3hQ4H+cQ1PMJlrMvx3NjbteFbZlPU=;
 b=NKeRWG0/W/vq+jnPz5+FDiBQsLhKy+DmNrZvDFBwkp6MBUSydgy/495N6XneBgUH7ZuQexhlYV+jOV4TUEMsbGWcB7sH/u08DhezGaIkD+GPHN5l5tsjINgZdbhAVZIrYmORg/HnlNeKj8bgore3PbQwujwm4LHSbVc4r0O4g8oE2FpXvs+WhNSavRMCFmt57fTFIbGtsM5y0HSyYqiCnBzIAidBLuLyfWFrQ4NydH89wsffndVTJz/jWdyMRMUsk2x4kVZFLXPgo4d02o0WHOvaIa8j9LOc2jrqmNIsZEbXba5qgaHwlERvovZ0c1HIeJMl4wBf3w/GjlnuBgpWPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=navimatix.de; dmarc=pass action=none header.from=navimatix.de;
 dkim=pass header.d=navimatix.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=navimatix.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6fZq5MWOEN01CQ3hQ4H+cQ1PMJlrMvx3NjbteFbZlPU=;
 b=WIXE0ChTxdgzTWMqRFJjEoIpMYlXaGWeQ0TRoaeaErg+L+bKEAMECdtCcGVTd+YdLXJMHO+AMPgKLZM5Maya2V/6aWDBIfTLE9h0JR2wRuIa5f1i4BXkTZZuKSsYDnpQAYWyLTDuZm+FIjj6FN/ONFlNb+DKtbEiSyDNrIGgKoE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=navimatix.de;
Received: from GV2PR01MB11835.eurprd01.prod.exchangelabs.com
 (2603:10a6:150:2cb::8) by AS8PR01MB7237.eurprd01.prod.exchangelabs.com
 (2603:10a6:20b:25e::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.25; Sat, 28 Mar
 2026 20:26:57 +0000
Received: from GV2PR01MB11835.eurprd01.prod.exchangelabs.com
 ([fe80::d5c3:2dea:3d98:25fd]) by
 GV2PR01MB11835.eurprd01.prod.exchangelabs.com ([fe80::d5c3:2dea:3d98:25fd%3])
 with mapi id 15.20.9745.023; Sat, 28 Mar 2026 20:26:57 +0000
Date: Sat, 28 Mar 2026 21:26:54 +0100
From: =?utf-8?B?SsO2cmc=?= Sommer <joerg.sommer@navimatix.de>
To: openembedded-core@lists.openembedded.org
Cc: changqing.li@windriver.com, rs@ti.com, 
	ricardo.salveti@oss.qualcomm.com, raj.khem@gmail.com, antonin.godard@bootlin.com, 
	richard.purdie@linuxfoundation.org
Subject: Re: [OE-core] [PATCH] lto.inc: add DEBUG_PREFIX_MAP back to
 TARGET_LDFLAGS
Message-ID: <acg3xGOKkL769U3e@navimatix.de>
References: <20260204052638.284617-1-changqing.li@windriver.com>
Content-Type: multipart/signed; micalg=sha256;
	protocol="application/pkcs7-signature"; boundary="rbuohh47gsarny7k"
Content-Disposition: inline
In-Reply-To: <20260204052638.284617-1-changqing.li@windriver.com>
X-ClientProxiedBy: BE0P281CA0019.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:14::6) To GV2PR01MB11835.eurprd01.prod.exchangelabs.com
 (2603:10a6:150:2cb::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR01MB11835:EE_|AS8PR01MB7237:EE_
X-MS-Office365-Filtering-Correlation-Id: 0ef9a81a-256b-40b8-a3e8-08de8d085b7b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|366016|376014|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info: 
	eHQfUpz9X8ShGw+dsGjtBAniE9TU8HP/i+9ZEtKzxtqSON1Jk/IBtB7aXpAHF/ZrawJkKJ1eVDXKiRWcdqw2YG62GktgF9mg3RJQ2Tn1ytIUSGSU1zhGBApaLPc/03wwwvY5gDqhgFR01DvdN3zdnPNERCRgLv68kLlyH6z5mTIB4Qp2puqfm0XxQ8EDZUCq2vcrbOBuJ7qS8FqboClV7wSjqTMZrn13D/OFEhw+WjINYIdWt1oXVZLwRZRelpmXfx2G+JjC9E4DCVhO1Az6ITu4pMcXXc4TS5zDo0pIgNrFZMTYO2oSGHiJ8E8Z6eQxJng8X9IjDbsQX80ezz084qxjzAVmzOf/CixftX0MEfT7uyk0FkAqWArn7szovwXXyWxVmmJIA/uNRAtGc7GY4aZ4XYVhzKfZmaeKMoJSVZVYVER4/bBRisHc/BcxJfi4VXzofCDxfYpxIuGBeu9ij7z0SyWyM02t3hpH6i/UMAO+eUK4ysyfsTu0uYybkVuKU3XdWZWOJZp4GzX/SLC8PtEFWDvVchUn6EhUk9wyH3y1GngGSrsJwTnQ4QtuBgtmLufaspb75ud8EzFakKLJ9bbgsKkBuRc4JrPY4s9dD40lTvfbJcJMdsdhN4KTsZlcS72PhuwoZcg6Z1JemwemsfW1PiV9qDNBX9nGXRaJ6lsfeyevCz02fieBOafmwc8+
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR01MB11835.eurprd01.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?iso-8859-1?Q?1aobmmvF3iTdpDyvMyLIBN22Z5mrmFc1WWrn2DbZZhlR6+ptvmB2CUQ5fS?=
 =?iso-8859-1?Q?sj7suvgAzIw3oXNCPMUjSptMMoWowin4SjiWsoj8igI5K7AX8Qps1l1SoV?=
 =?iso-8859-1?Q?V68HUz2Z7iIxQ/QKSQoLDGBzDvIX7Pkx/lFNQCu+GBBst6uNO+kEtfzMLe?=
 =?iso-8859-1?Q?yEoeHqNEBKMiUbxSMH3VykoVIlIhrP5LmCJH7r/v5D2K7G38EAJuM9pq7B?=
 =?iso-8859-1?Q?ogfVuAIX/jXkrU8kR+1lmCmNqqFzsFok4j8zqk6Gq/tuouphENlMJk3mrh?=
 =?iso-8859-1?Q?HoN/PbUJ+WCIjaAA2BM/otjobCTZPWjxXz44upa61vokrTm2SnH9s0ADox?=
 =?iso-8859-1?Q?SZ+sVkuyVkAMVRE0tiWbob+ANPfdtOItIfrk0sVMvYmjXlSISwd2EiRq1N?=
 =?iso-8859-1?Q?G4PJ1ATEJnC0+QZa9o4EgtmdD+tLNps5BvDfkbH2AWyW7zevbFBs0PrQ+O?=
 =?iso-8859-1?Q?mjIrkjYP/9sKED6GGa7K/wA6DOyhOzmoerflxXjAn/Cs+NkZrKJ2ztRX13?=
 =?iso-8859-1?Q?L7U+2sGrD3IDrED9/Bb1CPw9rAfCD5t2uxf2v3dUprdD0DI3mU0emKTjr0?=
 =?iso-8859-1?Q?yEJtnjabGBlgLRunHOlaRZM8QkxbKFAIkLTh9kLNanBoO6HXfZ38XExZMG?=
 =?iso-8859-1?Q?CfIFXWTE6bFPqiJCbnyg1MEC8Y8Rbu24KtJxRHQDQm+iwzGxqpcqXnBcu4?=
 =?iso-8859-1?Q?Eqs/HCrKzPnpr8KoUZYCMAjy/QEbnaJMvyQni2SWVS3rPKNmJLqMbY6HXO?=
 =?iso-8859-1?Q?qWUcMSnP+2c6gnOBI76D977BsML2HGpf8RTciIMtM0flDWgW6dzeueQ/ke?=
 =?iso-8859-1?Q?B8cjM7lczcMDR8qCt74aMAexneczMCsdec9/yIMSjZPpfUsm5ZC9TAsyUq?=
 =?iso-8859-1?Q?20v7d+jTsDGxuLknuYAttLHGV9H5YVKqWWL0tWIO4U4qM+ac71f2YbxKa9?=
 =?iso-8859-1?Q?7dtcLW8lxej639Qekuzup81NaqBkJLOfNviO3lyO/RfZdz9FcvX0PY4TCY?=
 =?iso-8859-1?Q?kNwQfQT2wl59TrB0Dr3e1BJ+M6VrNg6cywYC91cUmw9R89lEEdHiwuxnbE?=
 =?iso-8859-1?Q?EWXAKQsstQJIc77O8mVXdVlB8Jhuj//M3GhKFc22xYYNCJY3dLZ3mVrV5z?=
 =?iso-8859-1?Q?Y/aE8UuxRcsjfBDmG7vV8pVSblSjGScNrwk9t0I1aft1NXYOVU3dHgTNCm?=
 =?iso-8859-1?Q?pFDcqqweH1lMPIe15c7mKzBOefgqE0EtnAKB33ad2ri/s8F0wy8MfE18nt?=
 =?iso-8859-1?Q?RsWh6Z/uGb+ghYTIcN2ESbXPSYS233DqI/US4OD84V1uxrfPeAoT2fPBXd?=
 =?iso-8859-1?Q?BOnJm9GQrInqip+IIOqNHaZ1Bcp+vC1heWWUDCUC1fEi4aF3ptaFBf5Aeq?=
 =?iso-8859-1?Q?JEptXQfpUNBHYqcpc2Lp+bU3X86qv5k+0/DTCZvFedE+vTFdRpEQd9qGbJ?=
 =?iso-8859-1?Q?no4FWL8bpQGPraw31mCs+sTUQ5GQNqUmr6dfqDmzVVXGJegNS2Rr4g8psa?=
 =?iso-8859-1?Q?rNFLDI6ZTAAx/JhT5jkVIUyrW1/RVb9pxbAK1cc8z2hxYtJ3yFjceIctqq?=
 =?iso-8859-1?Q?hdu76w5z6y69o7agcOUbo1Q6UJil5AEB37Wsqozjrn8e9tjNfrdouz+hUr?=
 =?iso-8859-1?Q?552MzZoU8sfEESRezuyV53VwZjPcHEl+4RHwueojU03ujH4OvR/wozz2N+?=
 =?iso-8859-1?Q?c4KoR7Ao1VrOOFFZYTD3BeU+Rd6iLkb+CLxO13EKTzVGvS/wXTwrqkowjc?=
 =?iso-8859-1?Q?ocV3dJLpaYk4i5PEnalM710ypbJQSqJEyc3OG+c9WH4kW/W2wy0xxLBak2?=
 =?iso-8859-1?Q?GG6PxrSMTgQpeDLONpOoscbZ/E87TM8=3D?=
X-OriginatorOrg: navimatix.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 0ef9a81a-256b-40b8-a3e8-08de8d085b7b
X-MS-Exchange-CrossTenant-AuthSource: GV2PR01MB11835.eurprd01.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Mar 2026 20:26:56.8837
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: c87b4f54-b992-4813-8f3f-4a876324197f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ntweM1pO/+iFsmzN7vh9rqtEoln8qrI/1PrY1fX2giM63O7SY/uN8+NCKZ/mhnxwpXY3Yx7ph0xSjPfg02f9S4razfT/E0vtntifm8Fj+gY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR01MB7237
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 28 Mar 2026 20:27:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234132

--rbuohh47gsarny7k
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [OE-core] [PATCH] lto.inc: add DEBUG_PREFIX_MAP back to
 TARGET_LDFLAGS
MIME-Version: 1.0

Changqing Li via lists.openembedded.org schrieb am Mi 04. Feb, 13:26 (+0800=
):
> From: Changqing Li <changqing.li@windriver.com>
>=20
> DEBUG_PREFIX_MAP is appended to TARGET_LDFLAGS in commit [1] for fixing
> reproducible issue when LTO is enabled. It is removed in comit [2] since
> this commit causes cgo binary not reproducible. But actually, we still
> need this DEBUG_PREFIX_MAP in LDFLAGS when LTO enabled. So, only appened
> it when LTO is enabled. Refer [3] for the history, with this patch,
> patch [4] is also needed for cgo + lto enabled.

Gentle ping. This patch is missing, otherwise QA check buildpaths matches in
nearly all packages.

But this still leaves some packages with buildpaths, because there's a bug
in gcc that it does not apply -ffile-prefix-map:
https://gcc.gnu.org/bugzilla/show_bug.cgi?id=3D124581

> diff --git a/meta/conf/distro/include/lto.inc b/meta/conf/distro/include/=
lto.inc
> index 227f0c5c2a..cef92901e3 100644
> --- a/meta/conf/distro/include/lto.inc
> +++ b/meta/conf/distro/include/lto.inc
> @@ -49,5 +49,6 @@ LTO:toolchain-clang =3D "${@bb.utils.contains('DISTRO_F=
EATURES', 'thin-lto', '-flt
> =20
>  SELECTED_OPTIMIZATION:append =3D "${@bb.utils.contains('DISTRO_FEATURES'=
, 'lto', ' ${LTO}', '', d)}"
>  TARGET_LDFLAGS:append:class-target =3D "${@bb.utils.contains('DISTRO_FEA=
TURES', 'lto', ' ${LTO}', '', d)}"
> +TARGET_LDFLAGS:append:class-target =3D "${@bb.utils.contains('DISTRO_FEA=
TURES', 'lto', ' ${DEBUG_PREFIX_MAP}', '', d)}"

Possibly, I would join these lines.


Best regards J=F6rg

--=20
Navimatix GmbH           T: 03641 - 327 99 0
Tatzendpromenade 2       F: 03641 - 526 306
07745 Jena               www.navimatix.de

Gesch=E4ftsf=FChrer: Steffen Sp=E4the, Jan Rommeley
Registergericht: Amtsgericht Jena, HRB 501480

--rbuohh47gsarny7k
Content-Type: application/pkcs7-signature; name="smime.p7s"
Content-Disposition: attachment; filename="smime.p7s"
Content-Transfer-Encoding: base64

MIIThAYJKoZIhvcNAQcCoIITdTCCE3ECAQExDzANBglghkgBZQMEAgEFADALBgkqhkiG9w0B
BwGgghDNMIIFgTCCBGmgAwIBAgIQOXJEOvkit1HX02wQ3TE1lTANBgkqhkiG9w0BAQwFADB7
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
jnZymQyd/teRCBaho1+VMIIGEDCCA/igAwIBAgIQTZQsENQ74JQJxYEtOisGTzANBgkqhkiG
9w0BAQwFADCBiDELMAkGA1UEBhMCVVMxEzARBgNVBAgTCk5ldyBKZXJzZXkxFDASBgNVBAcT
C0plcnNleSBDaXR5MR4wHAYDVQQKExVUaGUgVVNFUlRSVVNUIE5ldHdvcmsxLjAsBgNVBAMT
JVVTRVJUcnVzdCBSU0EgQ2VydGlmaWNhdGlvbiBBdXRob3JpdHkwHhcNMTgxMTAyMDAwMDAw
WhcNMzAxMjMxMjM1OTU5WjCBljELMAkGA1UEBhMCR0IxGzAZBgNVBAgTEkdyZWF0ZXIgTWFu
Y2hlc3RlcjEQMA4GA1UEBxMHU2FsZm9yZDEYMBYGA1UEChMPU2VjdGlnbyBMaW1pdGVkMT4w
PAYDVQQDEzVTZWN0aWdvIFJTQSBDbGllbnQgQXV0aGVudGljYXRpb24gYW5kIFNlY3VyZSBF
bWFpbCBDQTCCASIwDQYJKoZIhvcNAQEBBQADggEPADCCAQoCggEBAMo87ZQKQf/e+Ua56NY7
5tqSvysQTqoavIK9viYcKSoq0s2cUIE/bZQu85eoZ9X140qOTKl1HyLTJbazGl6nBEibivHb
SuejQkq6uIgymiqvTcTlxZql19szfBxxo0Nm9l79L9S+TZNTEDygNfcXlkHKRhBhVFHdJDfq
B6Mfi/Wlda43zYgo92yZOpCWjj2mz4tudN55/yE1+XvFnz5xsOFbme/SoY9WAa39uJORHtbC
0x7C7aYivToxuIkEQXaumf05Vcf4RgHs+Yd+mwSTManRy6XcCFJE6k/LHt3ndD3sA3If/JBz
6OX2ZebtQdHnKav7Azf+bAhudg7PkFOTuRMCAwEAAaOCAWQwggFgMB8GA1UdIwQYMBaAFFN5
v1qqK0rPVIDh2JvAnfKyA2bLMB0GA1UdDgQWBBQJwPL8C9qU21/+K9+omULPyeCtADAOBgNV
HQ8BAf8EBAMCAYYwEgYDVR0TAQH/BAgwBgEB/wIBADAdBgNVHSUEFjAUBggrBgEFBQcDAgYI
KwYBBQUHAwQwEQYDVR0gBAowCDAGBgRVHSAAMFAGA1UdHwRJMEcwRaBDoEGGP2h0dHA6Ly9j
cmwudXNlcnRydXN0LmNvbS9VU0VSVHJ1c3RSU0FDZXJ0aWZpY2F0aW9uQXV0aG9yaXR5LmNy
bDB2BggrBgEFBQcBAQRqMGgwPwYIKwYBBQUHMAKGM2h0dHA6Ly9jcnQudXNlcnRydXN0LmNv
bS9VU0VSVHJ1c3RSU0FBZGRUcnVzdENBLmNydDAlBggrBgEFBQcwAYYZaHR0cDovL29jc3Au
dXNlcnRydXN0LmNvbTANBgkqhkiG9w0BAQwFAAOCAgEAQUR1AKs5whX13o6VbTJxaIwA3RfX
ehwQOJDI47G9FzGR87bjgrShfsbMIYdhqpFuSUKzPM1ZVPgNlT+9istp5UQNRsJiD4KLu+E2
f102qxxvM3TEoGg65FWM89YN5yFTvSB5PelcLGnCLwRfCX6iLPvGlh9j30lKzcT+mLO1NLGW
MeK1w+vnKhav2VuQVHwpTf64ZNnXUF8p+5JJpGtkUG/XfdJ5jR3YCq8H0OPZkNoVkDQ5CSSF
8Co2AOlVEf32VBXglIrHQ3v9AAS0yPo4Xl1FdXqGFe5TcDQSqXh3TbjugGnG+d9yZX3lB8bw
c/Tn2FlIl7tPbDAL4jNdUNA7jGee+tAnTtlZ6bFz+CsWmCIb6j6lDFqkXVsp+3KyLTZGXq6F
2nnBtN4t5jO3ZIj2gpIKHAYNBAWLG2Q2fG7Bt2tPC8BLC9WIM90gbMhAmtMGquITn/2fORds
NmaV3z/sPKuIn8DvdEhmWVfh0fyYeqxGlTw0RfwhBlakdYYrkDmdWC+XszE19GUi8K8plBNK
cIvyg2omAdebrMIHiAHAOiczxX/aS5ABRVrNUDcjfvp4hYbDOO6qHcfzy/uY0fO5ssebmHQR
EJJA3PpSgdVnLernF6pthJrGkNDPeUI05svqw1o5A2HcNzLOpklhNwZ+4uWYLcAi14ACHuVv
JsmzNicwggUwMIIEGKADAgECAhEA/OH3TxzsxiYnBai43hD2fjANBgkqhkiG9w0BAQsFADCB
ljELMAkGA1UEBhMCR0IxGzAZBgNVBAgTEkdyZWF0ZXIgTWFuY2hlc3RlcjEQMA4GA1UEBxMH
U2FsZm9yZDEYMBYGA1UEChMPU2VjdGlnbyBMaW1pdGVkMT4wPAYDVQQDEzVTZWN0aWdvIFJT
QSBDbGllbnQgQXV0aGVudGljYXRpb24gYW5kIFNlY3VyZSBFbWFpbCBDQTAeFw0yNDA2MDQw
MDAwMDBaFw0yNjA3MDMyMzU5NTlaMCoxKDAmBgkqhkiG9w0BCQEWGWpvZXJnLnNvbW1lckBu
YXZpbWF0aXguZGUwggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAwggEKAoIBAQDNxFyhl/UuZdUp
uQiuqZBMSU/pN5SMIj4lkvTlrtp2jl4Q77wbv4vXdXIFWqKd3qtut55G0ptK4nXs1ARrh3AH
QAYwB0vW+PHVNPLs9yombnTeMgnEv/RQDFkH+DxoKdY5+DRUmcVO/tYl6ExMEBj6oh6b/63w
hIkC61WRETH3FpRCRbyNBD73OWt0KzxoKzW9xmdqfhNtylLcIFMzuv9C1WAqJ3mLbFHYaW4N
EMMckPZJWWYzvA2nwCCryerE3J9z4ZbSK0OK6DDRN9gW/H7+/4pHSIhdooGfQEdgLj+Z4ZPh
vLMF5DncBD8k5DOK8mlDxCKp4GsrLLuBfLQdxilvAgMBAAGjggHiMIIB3jAfBgNVHSMEGDAW
gBQJwPL8C9qU21/+K9+omULPyeCtADAdBgNVHQ4EFgQU3lTOaS6cJRsIzzEjdtC4j6GPtWIw
DgYDVR0PAQH/BAQDAgWgMAwGA1UdEwEB/wQCMAAwHQYDVR0lBBYwFAYIKwYBBQUHAwQGCCsG
AQUFBwMCMFAGA1UdIARJMEcwOgYMKwYBBAGyMQECAQoBMCowKAYIKwYBBQUHAgEWHGh0dHBz
Oi8vc2VjdGlnby5jb20vU01JTUVDUFMwCQYHZ4EMAQUBAjBaBgNVHR8EUzBRME+gTaBLhklo
dHRwOi8vY3JsLnNlY3RpZ28uY29tL1NlY3RpZ29SU0FDbGllbnRBdXRoZW50aWNhdGlvbmFu
ZFNlY3VyZUVtYWlsQ0EuY3JsMIGKBggrBgEFBQcBAQR+MHwwVQYIKwYBBQUHMAKGSWh0dHA6
Ly9jcnQuc2VjdGlnby5jb20vU2VjdGlnb1JTQUNsaWVudEF1dGhlbnRpY2F0aW9uYW5kU2Vj
dXJlRW1haWxDQS5jcnQwIwYIKwYBBQUHMAGGF2h0dHA6Ly9vY3NwLnNlY3RpZ28uY29tMCQG
A1UdEQQdMBuBGWpvZXJnLnNvbW1lckBuYXZpbWF0aXguZGUwDQYJKoZIhvcNAQELBQADggEB
AANadCCx1OE0/PYv8CMHn1qrbn3u9yIQuut1yAVv1daof2ULxyGOm/M+XnSW1h+xcUukaNTB
qwJx6KTauuWjVL1LRXz9+sNvQfS1KdJF9yfgcCTiIMNjfKap+t/dD275tpVeLbRSWyJaQRhb
GVjarr8yry1mnaaiJqv1TERaHqjDNpEwU/Ex8XetmkdJK01qCP+ZOEHwRr/pEB/oEKYB08+P
CfWWWT0YVlwW3FdYpMi70zyynhyE0ZkxBuwh20CulXlafk9nzu1ly9HDU2MG6fnKLirJLOj1
+9s6RvytgsBtk1dB4lJEMe32RnTa4ABWg2VpdqmG7wjr2BlUCzLzuxUxggJ7MIICdwIBATCB
rDCBljELMAkGA1UEBhMCR0IxGzAZBgNVBAgTEkdyZWF0ZXIgTWFuY2hlc3RlcjEQMA4GA1UE
BxMHU2FsZm9yZDEYMBYGA1UEChMPU2VjdGlnbyBMaW1pdGVkMT4wPAYDVQQDEzVTZWN0aWdv
IFJTQSBDbGllbnQgQXV0aGVudGljYXRpb24gYW5kIFNlY3VyZSBFbWFpbCBDQQIRAPzh908c
7MYmJwWouN4Q9n4wDQYJYIZIAWUDBAIBBQCggaAwGAYJKoZIhvcNAQkDMQsGCSqGSIb3DQEH
ATAcBgkqhkiG9w0BCQUxDxcNMjYwMzI4MjAyNjUzWjAvBgkqhkiG9w0BCQQxIgQgG3zqHcsk
1UeBi4pz5W0yyhdwAZ2+n8vzenA/2X1v4iswNQYJKoZIhvcNAQkPMSgwJjALBglghkgBZQME
ASowCwYJYIZIAWUDBAECMAoGCCqGSIb3DQMHMA0GCSqGSIb3DQEBAQUABIIBABAXrL5X+bav
Fc3HDkWZmXSnUSxpd8JAajG8N5bwSGBWJapN6ES4Yf7n+Id1Q/hEKnW3agKeCbAAb+Ad7Cii
yx5RJ1kRRbf7RhpbVM81Z/ikzZV8e+gMOC3FHSl6X8GCvo5/tHkSuTjwWk9wnuQJ9daW1K4n
+n+M1ZX6lVUck7EJUD6fy6U1jxak7MDBSMWD91/1lZG22+MPdtUPMQLTpn3DosrwiSMIph/u
d7xhX/YXC2fqTWZCOQfePrhi45CnKZcQL7Nuayr/BjvomyGjT1sGDaG/pwik+TKh2Z6wU4bA
yLV3XkffaXSUJ8XgNF6OSBzthhA+QtntkZxsu8nj260=

--rbuohh47gsarny7k--

