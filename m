Return-Path: <joerg.sommer@navimatix.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A0191FB3CFD
	for <webhook@archiver.kernel.org>; Mon, 30 Mar 2026 10:23:59 +0000 (UTC)
Received: from MRWPR03CU001.outbound.protection.outlook.com (MRWPR03CU001.outbound.protection.outlook.com [40.107.130.128])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.47751.1774866230399982688
 for <openembedded-core@lists.openembedded.org>;
 Mon, 30 Mar 2026 03:23:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@navimatix.de header.s=selector1 header.b=ykHZZjSi;
 spf=pass (domain: navimatix.de, ip: 40.107.130.128, mailfrom: joerg.sommer@navimatix.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oRt0ygJ7j1U/eHBodGfwg44cvJ9cVJOzNOKmYhVHHyzMaP77OdeJ2AGd8+wPTDhr4TABhkLYW7LRxKHi7mPc8C3YNzOLbKF9Uc9v1b5nSUUVRL3hhRg0i55aKWDD/Oq2NHhuJXx4PskIG6RKnJ6EiSSTr3pmnNi4qdBMIYVsHyNvanp5WyDs9S/HW0fokipvUP3NRvAirNycyWK/BH8jSihcya/69WTGCrrNJAcF0wpOX7N3xkFFWK2UdY291OpnTJJQ0URjgdoOPI23jTPqm196+rWHVmmUUsJdvTIEe3YbAFufcQvE3BAJ4KrjvPBwb8MOzWe/kO6ihOH42UTI3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=80yg6YuQ5w90mXDVgBSEs/kYLNQ02ag50zfgDJXbME0=;
 b=LH8Bt6AduenFCnS5uGnd9c2dmWYbYkyI7ALeXwnqN5ewVbwR5dcO1UTyDbMz3o7HDdc6p50PwpfaEL7QZgcVXbAuuswE4hskD9KD/91Y5Wfo9T+U+G2vNnNt03BF0EVSFyFXYf4hAE5l6F0JWModGhz0ravNO7jkRVr34IVwyxiHKgMTQdi6xt7TvHdhOAA6wXPakQhDfIQ88BxNzgzHxGcr/MGWMr/b3n4Hg8ZXBdsdHaqCTzKUR7rTGzElMHtUQgqRQRlSF9aqUjrCOb6ViSE6WF2uYF+moDY2yoSTU41bNtZD/tBWJCHbktDbBRV8QNIqGXA87Hb9dYXXxLi9QA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=navimatix.de; dmarc=pass action=none header.from=navimatix.de;
 dkim=pass header.d=navimatix.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=navimatix.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=80yg6YuQ5w90mXDVgBSEs/kYLNQ02ag50zfgDJXbME0=;
 b=ykHZZjSiLccwAoNrG1MsLSFKvaSpNPKJ0m6OvqmYSG5Yw0U7zzdi1tHtjK1V2KFKT7b3TX5Ps2pe0xQdSXY7x4P1B8dA6r9xqGXj4e8l03lpBf/eokFd5qEY1iLnrsy6LKHK1u8VoYs42Pz4judxMvSB7X/aN14UKnma5QXNOV0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=navimatix.de;
Received: from GV2PR01MB11835.eurprd01.prod.exchangelabs.com
 (2603:10a6:150:2cb::8) by GVX0PFE83DDC7B7.eurprd01.prod.exchangelabs.com
 (2603:10a6:158:401::86b) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.28; Mon, 30 Mar
 2026 10:23:44 +0000
Received: from GV2PR01MB11835.eurprd01.prod.exchangelabs.com
 ([fe80::d5c3:2dea:3d98:25fd]) by
 GV2PR01MB11835.eurprd01.prod.exchangelabs.com ([fe80::d5c3:2dea:3d98:25fd%3])
 with mapi id 15.20.9745.027; Mon, 30 Mar 2026 10:23:44 +0000
Date: Mon, 30 Mar 2026 12:23:41 +0200
From: =?utf-8?B?SsO2cmc=?= Sommer <joerg.sommer@navimatix.de>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Thomas Perrot <thomas.perrot@bootlin.com>, 
	openembedded-core@lists.openembedded.org, changqing.li@windriver.com, rs@ti.com, 
	ricardo.salveti@oss.qualcomm.com, raj.khem@gmail.com, antonin.godard@bootlin.com
Subject: Re: [OE-core] [PATCH] lto.inc: add DEBUG_PREFIX_MAP back to
 TARGET_LDFLAGS
Message-ID: <acpOozTnDECIDOVg@navimatix.de>
References: <20260204052638.284617-1-changqing.li@windriver.com>
 <acg3xGOKkL769U3e@navimatix.de>
 <0110332424c01404402aa58286399958e1449110.camel@bootlin.com>
 <2e2f88fe044c6b3dc868652c01f647d58abf1a33.camel@linuxfoundation.org>
Content-Type: multipart/signed; micalg=sha256;
	protocol="application/pkcs7-signature"; boundary="btrnegyvq4w2i4hn"
Content-Disposition: inline
In-Reply-To: <2e2f88fe044c6b3dc868652c01f647d58abf1a33.camel@linuxfoundation.org>
X-ClientProxiedBy: BE1P281CA0420.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:83::17) To GV2PR01MB11835.eurprd01.prod.exchangelabs.com
 (2603:10a6:150:2cb::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR01MB11835:EE_|GVX0PFE83DDC7B7:EE_
X-MS-Office365-Filtering-Correlation-Id: 196a2efc-f1bd-40f5-5f7f-08de8e466b90
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|1800799024|376014|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info: 
	3uOdbaEODUc2NyupB29QbSpUiMjU7FhzWypi8MDFinp/eJ+rgW/ClxUSlZdafwd69LBbGYxVEKz3qBYt+yfI36B2jo9UVPwv96VY6Rxt5/tjabKu/KlsfQlYnDeyJnVtB0qfQ+WVLExiTf8yVsjk1gVWlvpV7H73y53VCPtsYtYZ0SHrH14wZhvO+6qywpMr5gQgcpROvuVYX4ZWoos652jasYeKpuRJyTDIjqfRpoeWm9zSHLmePLtHFxtUpuKqYj+sftY+gTX9C5IFZJfJs3clhgA8B91aUOblU6FSTpOZvMaHFEraQg5AiWLjtUax7lwSeoJkZUe6mm3NhcE7LAcUPuYSoUYZj6F+LS84hsUPXBvzHKzZWq8tVOMGhJLjlqDcpvuM9gsXH0/tPJRtVwJ1Q+sv3b3UAsuMdM6ph/5Pq3hX9CRzhScdMwuxeYLMo3uz5poerhepwHvBDJaKcwMW4FfIl+amFqag60Sxjf3cqNjhvXhul2w1gZB/LpMYz32RBWXlfAOcLXkDMiMUjizcVV05U6Wk1DMtgQQnGsv1B3rHMF7b+EuF3SJiZz5IdWXfxBUtUJaO5jg89tKDnuzCFYF+B8CARzDW17hqHjO9l+2qGI/gKsXLm8968PYpUAfL0JSW4a+1ul1jrYgemzqiJNdAwuwdG24rxgUr8IG27xE2SbAufv4st2B6V2c8
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR01MB11835.eurprd01.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?iso-8859-1?Q?jWpEFfFrrvP6ovsrutyFuPktY3JEOO+/GdS46HhFecSNxAh9vzf5CPrc8z?=
 =?iso-8859-1?Q?TuvA9ril3Rhi6Ml1rQp3+WATtm8Hu7BASJa5CDs5gTzm5pacwWsbm6ArWb?=
 =?iso-8859-1?Q?aA+R4W13yyxe/imm7J7eTQaWGYIWLn9nNeRBTLFpv4muec8xprYLydiTlw?=
 =?iso-8859-1?Q?tIih7pL1eIqgcVKHny1sIauK2WD4HIcnuJAO8VtbmMcp1/5nB/wYj7ZSax?=
 =?iso-8859-1?Q?cBaQBYDdG0gI9oTmZ+W2YtuU+alFQzLJd4Gr2MPx9Q0xKVadVQytmJzZ4S?=
 =?iso-8859-1?Q?QW9j+uPotOOabnvrM93rbwB9zLCVSRclJK0HUOrUFxrHQAtGUii/ClbsCb?=
 =?iso-8859-1?Q?GoQC4H0DG5T8YjDiGNCXjqwTZyQmnk++ljif2FA/LIla+hnBUehcbr1Re6?=
 =?iso-8859-1?Q?DPwwzHEOYw09XQIsH33AaOloH3G2OVMjF2q1b6PD76id45OREgf/hgdHZc?=
 =?iso-8859-1?Q?fqYkk1MT8gFOpfplgzU46KF2/2Um9pnF7S5UkoqE4mukwlSl6NGz10k8iB?=
 =?iso-8859-1?Q?9nYnq9eSDWM4vaps5qaw7Oc8Cz5FSrP3xi6hi3p7DoUyvLz5jFMkuEHP+I?=
 =?iso-8859-1?Q?qKCaFd1WJv3jpK1SwyS61Ark12QppoLe08UKVv+OdM+75ofY4Zl7WjqOaq?=
 =?iso-8859-1?Q?AN4C/Jzcsduw3VuppJbN6HcZRczulvVRwulYlO8mZgXLcOFmXCW9bPSn9r?=
 =?iso-8859-1?Q?UhlehvsAfIiXxMc2iU3vY5n1MKAnZC59ZCHUkcFACLAI6UfU3cLd/RV7J3?=
 =?iso-8859-1?Q?1B8bbW165//ip4t8nAptOwH52WiWJqlhiMKYa9H+Gb/7XtRRAiyutcF5EQ?=
 =?iso-8859-1?Q?tsiE7Im0Ity631/xiPWkTLB6gLQLpJDLsnAaLs8EhoierVQd72jME2CwBD?=
 =?iso-8859-1?Q?3fahcgR2E1w1EYKtiFndqziLsUQBkfK8XS70QEbpLQ/S5vLji/HTioRONV?=
 =?iso-8859-1?Q?WKL8NkZ2wpH9cjd2dLKV+4f7kfnNRIqCFfKAfEFZQoBY/AuWKYoSpbZ8Rv?=
 =?iso-8859-1?Q?VOsvci2HJ7L7yKTLlYAZtpZLbwe2UB5OkAGZjHR9FEDga8poZ5REwWBJM5?=
 =?iso-8859-1?Q?t3ved4REp2UxAGfcWhwTOnq5f7YccwktvObIq1DV4JpQTKix/UbJ29JW23?=
 =?iso-8859-1?Q?RZpeYa6aep7uD6V5PeaMOm4UBgC7UvKkKz6eKHyfKzds61p29YeCnXIXsa?=
 =?iso-8859-1?Q?n7kPuZ1n3B4llAXGm5XTDQjolKg5uSO+A382LrsiZDlF9GLf+AHHkzV3EH?=
 =?iso-8859-1?Q?P+PvzGp6GS5tdCKN2Ca+2bdSuDrPnRg9jNf+RJ3TmvxYYGxapAz+MrO43W?=
 =?iso-8859-1?Q?dURk9/exdhqlc1wjsI2kDjvxaHqER+tNMNsMNmvipGin0DsUc2iVmdUrEl?=
 =?iso-8859-1?Q?LnwYN9ThB6drpa3jxnG7pZvZRoZbwrygTudilzJw6d/JELM6DFhOA87kh4?=
 =?iso-8859-1?Q?UIUxrqa/A7PslbK2rIhj8CPwA1OjlDihUEPe2CZeRCG2dmsnZzoRvnu78l?=
 =?iso-8859-1?Q?qTSOzhkyBt/Gw8R1zsyQ3nb8IWZtNBnuyJ8ZKi2JqS+yRa47HeX48p1Y3f?=
 =?iso-8859-1?Q?snFJTxIfRS5ndXKnWs1UnjzJLQg3Eax72rXdEbRyOrY8RQCc2EFBnxPZ0P?=
 =?iso-8859-1?Q?HvEuWt4Jz3scMeyFCNMOzgMHkK4w1DbDoG7gRCiF2+kH8OD7nE6y7R9B+Z?=
 =?iso-8859-1?Q?VKKYyK0OUkJVW3eYzKanytjWGNi9WE7ktIjGhSel5fKvWldU+dXUa0UU8g?=
 =?iso-8859-1?Q?wByWHOgzLoRcGQAZXKuTtINPx9Urj2UfqhCNuZ8pdYxDfW4SIB9Lw2OJdw?=
 =?iso-8859-1?Q?kbn+VeR0gs/+/N/DM9O/Ig8ifFU4kys=3D?=
X-OriginatorOrg: navimatix.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 196a2efc-f1bd-40f5-5f7f-08de8e466b90
X-MS-Exchange-CrossTenant-AuthSource: GV2PR01MB11835.eurprd01.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Mar 2026 10:23:44.0604
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: c87b4f54-b992-4813-8f3f-4a876324197f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FTfVh6nW6730pAq4CkJZzIcB0zWnzxGwcyckIehmQeKnQYf0SAaiPrDvGoKt8CrfIu1DKYD5JNwqtbM5n1NKYfZaMAziu3TOHqjuLKUy/5k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVX0PFE83DDC7B7
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 30 Mar 2026 10:23:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234223

--btrnegyvq4w2i4hn
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [OE-core] [PATCH] lto.inc: add DEBUG_PREFIX_MAP back to
 TARGET_LDFLAGS
MIME-Version: 1.0

Richard Purdie schrieb am Mo 30. M=E4r, 11:18 (+0100):
> On Mon, 2026-03-30 at 11:59 +0200, Thomas Perrot wrote:
> > =A0=A0 1. Hello,
> > =A0=A0=A0=A0=A0=20
> > On Sat, 2026-03-28 at 21:26 +0100, J=F6rg Sommer via
> > lists.openembedded.org wrote:
> > > Changqing Li via lists.openembedded.org schrieb am Mi 04. Feb,
> > > 13:26
> > > (+0800):
> > > > From: Changqing Li <changqing.li@windriver.com>
> > > >=20
> > > > DEBUG_PREFIX_MAP is appended to TARGET_LDFLAGS in commit [1] for
> > > > fixing
> > > > reproducible issue when LTO is enabled. It is removed in comit
> > > > [2]
> > > > since
> > > > this commit causes cgo binary not reproducible. But actually, we
> > > > still
> > > > need this DEBUG_PREFIX_MAP in LDFLAGS when LTO enabled. So, only
> > > > appened
> > > > it when LTO is enabled. Refer [3] for the history, with this
> > > > patch,
> > > > patch [4] is also needed for cgo + lto enabled.
> > >=20
> > > Gentle ping. This patch is missing, otherwise QA check buildpaths
> > > matches in
> > > nearly all packages.
> >=20
> > I confirm this patch is required to fix QA check build paths for a
> > few packages.=20
>=20
> Can someone please work out a smaller reproducer to provide to upstream
> gcc/binutils so we can try and get the underlying bug fixed?

I've send some simple test cases in
https://gcc.gnu.org/bugzilla/show_bug.cgi?id=3D124581


Best regards J=F6rg

--=20
Navimatix GmbH           T: 03641 - 327 99 0
Tatzendpromenade 2       F: 03641 - 526 306
07745 Jena               www.navimatix.de

Gesch=E4ftsf=FChrer: Steffen Sp=E4the, Jan Rommeley
Registergericht: Amtsgericht Jena, HRB 501480

--btrnegyvq4w2i4hn
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
ATAcBgkqhkiG9w0BCQUxDxcNMjYwMzMwMTAyMzQwWjAvBgkqhkiG9w0BCQQxIgQgbnhT77T3
668pBcIvLNb2mZ4oMs5TzjTjl8alJ8+84SwwNQYJKoZIhvcNAQkPMSgwJjALBglghkgBZQME
ASowCwYJYIZIAWUDBAECMAoGCCqGSIb3DQMHMA0GCSqGSIb3DQEBAQUABIIBAMWtSlvRvzhC
ghnSOJe9UvLXlQJ+cCK/vfPc2qWnS+1BEeAPeMze6rh0cm3tjI68znntJEHLNWaWJHKtJAlb
AG0cb7LKkofXBGYRxWYamwZPRQc7j9QhESFl+MRzHQzx7Q6XVdAaPHZbwRe10wPs+f0GSrz6
+NxGdP/FPwO6yBtNkRzFOAFRRxqIelGcZb0TGsd+mL2sI9IN168RtnJ10f6ZmBOeIOaL7oCL
P0K/x0O4NawUtrWBjwqaJEB/GYouxB+zn6xGggYLdloUUKw7WqtoLxDlRVY3ErdxVyzzA9lT
S3f591q5bPok0rGDjRcJcPI8srubeXqzUizCYvcLIDA=

--btrnegyvq4w2i4hn--

