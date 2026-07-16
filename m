Return-Path: <joerg.sommer@navimatix.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43CCAC44514
	for <webhook@archiver.kernel.org>; Thu, 16 Jul 2026 19:45:01 +0000 (UTC)
Received: from GVXPR05CU001.outbound.protection.outlook.com (GVXPR05CU001.outbound.protection.outlook.com [52.101.83.93])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3419.1784231091991477111
 for <openembedded-core@lists.openembedded.org>;
 Thu, 16 Jul 2026 12:44:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@navimatix.de header.s=selector1 header.b=FPFlAlS6;
 spf=pass (domain: navimatix.de, ip: 52.101.83.93, mailfrom: joerg.sommer@navimatix.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XMNJUW8o1h9clrQx5xUp1zSxK2FdX5VSoMeXUdteB9wfPUfac0McUb39AKyJx3E9gcpyS52G8+Mp0vKOQJXyKRZ89RU4KZhZwbSle/pCnQawFPhoTWyn7TdYD/xh7PfsqowtG8gGx7C1aUNlg5m/xXGGICKo5c/MkTMe+43flY6U+eNNzW2vhboiHWmQiXAM9cxJFqUTBUTW+z/BbL3pHiHBKRRiwbmqhYPsBsYw7jSq+06o/Ay6RJU0kdvBSTiQG1iL5u24zQaWXv7kk+Wl9YedLhlORebDnCwaYVLIR2KArWl95srfQTtpJYJfjq1ej+P5vPpWDzsjg7wYfhptSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/MsMvAJ1UHsMfbF6XafNnz6Z/ga4h5GQNHprWgPAlSg=;
 b=FjFG1KjQ95oqtoUpFRCXJb+3viqnDGzNPztcJtSuHyjNurq1Uik1qDtumBJVkV4n5Dc3g2VysBeGFeE3dTM3FBrIGWMqMn5EKHsY5G0jhJqwKYkvBnIPjXpY2iasO4Et5Y2vBNzFPhNKBPfYEJ7UoIYeYmWrox4tV02MXZT1t+9jcZGegai+eqMCnp3t3BxTbKpgcSAbmaeJjHEn+FYwSh3oRxh4LB1GbM8ige78EWIR4eXd0TYsHJk5DUPJwk4XBUU24MMI887B97ccOhnnqktN/lLIHN0N8WijTdpDe2Xi/+uPQkKaoVJ1duPH6q84WGyyIyOndiVOLJPuIe0obQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=navimatix.de; dmarc=pass action=none header.from=navimatix.de;
 dkim=pass header.d=navimatix.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=navimatix.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/MsMvAJ1UHsMfbF6XafNnz6Z/ga4h5GQNHprWgPAlSg=;
 b=FPFlAlS6Yeuqe5qm86ySYm2BVx/yR69SB+eIoxQcX20BlhQdf4641ACLvwvzaupyfNr8qQWNnNqNrRdmr/sgIyIRf83T7YqG6ijggjD99hKqs5XmtGRZ7z8lt1G5fuOvOk8jRgs29XUlQGDMsmkttDqaTHtnjDGvDJxYdvfpk5I=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=navimatix.de;
Received: from GV2PR01MB11835.eurprd01.prod.exchangelabs.com
 (2603:10a6:150:2cb::8) by VI0PR01MB12784.eurprd01.prod.exchangelabs.com
 (2603:10a6:800:333::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.202.20; Thu, 16 Jul
 2026 19:44:45 +0000
Received: from GV2PR01MB11835.eurprd01.prod.exchangelabs.com
 ([fe80::d5c3:2dea:3d98:25fd]) by
 GV2PR01MB11835.eurprd01.prod.exchangelabs.com ([fe80::d5c3:2dea:3d98:25fd%3])
 with mapi id 15.21.0223.011; Thu, 16 Jul 2026 19:44:45 +0000
Date: Thu, 16 Jul 2026 21:44:42 +0200
From: =?utf-8?B?SsO2cmc=?= Sommer <joerg.sommer@navimatix.de>
To: Antonin Godard <antonin.godard@bootlin.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] Enable audit and other PACKAGECONFIG by DISTRO_FEATURES
Message-ID: <alkzQSCY9mQY6J7R@navimatix.de>
References: <20260714144019.2771283-2-joerg.sommer@navimatix.de>
 <DJZVVSXKA0WD.3IQ8L9ZBTAO5T@bootlin.com>
Content-Type: multipart/signed; micalg=sha256;
	protocol="application/pkcs7-signature"; boundary="cx5ziseyfo77keyi"
Content-Disposition: inline
In-Reply-To: <DJZVVSXKA0WD.3IQ8L9ZBTAO5T@bootlin.com>
X-ClientProxiedBy: BE1P281CA0103.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:79::20) To GV2PR01MB11835.eurprd01.prod.exchangelabs.com
 (2603:10a6:150:2cb::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR01MB11835:EE_|VI0PR01MB12784:EE_
X-MS-Office365-Filtering-Correlation-Id: 466c6480-0455-49b5-ccae-08dee372afc8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|23010399003|1800799024|376014|4143699003|56012099006|18002099003|22082099003|10067099003;
X-Microsoft-Antispam-Message-Info: 
	FcOBscQFaGd3vi16xCylyCBrvLy7dlcoyUAfN3vcq40FAJcGLpQYxIlTuYtAf3baIPZqoMn8Aphg2Hh5RAUqwGWZ0xPW1YnMjVivwdDSgMrh3GoKRtmWwcFMuZnoY146iv0l0Uk7SOr77nGDnVIRTi1h0MVqIue4Fxs9nAqKXalmh/rSSY65mKDWOl0mLz9Qhq+2jyFYjfG54xTlYk9viHxiKgcQaoGgAk0dkbhO/mJv8U6ekr8znlHlJNtjspFvyMj+Wv+ASQ6GjqAoVz12FWH7XboxlNScoKWccRG9JoY+ZigYJypA2L9dXysZuglwmo4PO50Bf8UBtA5ZsqO/oKQ9aYAQb9zHIDOBTtfRozXDjKG8bIMDhG4f8kZdU+W5c+1HK53JZilIQXC2k4//WiUh6go0r4w9DZLK7wLJdu+Bm+W1R86DHWRWsAVI2JDfW+vO4yYGVysJAB3I1b5qHkCwCX6x7k1akZwilESqEXyPXXTnmL2fUeDpDTp2dAhmgLdGNNsH+ZH+VnViNUgPh7QjFLRkUWf2V3OBQxw2autU0r2iAaeVcEU/xN78sOVLzrxuazRa06Xuhx8TBkJbHs6GWknTd8t1SAxoKZXGRCg=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR01MB11835.eurprd01.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(1800799024)(376014)(4143699003)(56012099006)(18002099003)(22082099003)(10067099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?iso-8859-1?Q?XwvgyIiwxkU5pyb/k2eXZdcjcS4it3/hFV2khXYSMDLpJK88QdiUhk/OWp?=
 =?iso-8859-1?Q?M//WpcD4hdzRZdO7srEydQ22cA4vjBIGsnzN3vwJmDtv4NfWoY7dnN6oxd?=
 =?iso-8859-1?Q?uHgfKwt7phjz7F5bMy8m7yL4EeMVa4tUKhfNJiRV0rPMT3Lg7nDzkZSfMd?=
 =?iso-8859-1?Q?urOReegF35OUXe1zxcCY4yrlYU3myhvPJmGaUSBCkY+RmVJmQxkpMtcv7C?=
 =?iso-8859-1?Q?JZGT7D/Nt0CKVlGYEZEhXDSSJK7bzPVe7P3juzURFO4sqIMgdd3i7nfzmW?=
 =?iso-8859-1?Q?YG3uiWT8LgrJ5Mh/DIgNW6WZ5C8zutXKvxDU7upbr5VBxyWUm+DQ53tmrG?=
 =?iso-8859-1?Q?UfvZbtyb6mpgRUU1lgEFc29YOnD4jFFOSwNkhmJVYQbSH6bGqJpIf/MDFX?=
 =?iso-8859-1?Q?LnxjwAl7zP4uuXH86oKjFk2ZD7PrOxpeeGToklISEYiBgaJO9cQ0FOjigv?=
 =?iso-8859-1?Q?8u6zYJ+K7ifKEjxC7f0RjVw2536XEUQcuNHpCrLuBVXg1rS0fvRzeaBhEd?=
 =?iso-8859-1?Q?BErGa8WQ9Oqk/umuLIUgTDe7SDXPNxIYhHHV0hYJB2VMLoWrJOsXdwyizm?=
 =?iso-8859-1?Q?SCOAHPPr167L5+GdSm0j98FSFZASDPO4jFMza2cHFBayjOrJa5z8akVY4Y?=
 =?iso-8859-1?Q?I8RnjH7RIpVqXJAtIakK1p6qcvAOROL4KgnIBBk5PV5oXoSRP60Axm8v8O?=
 =?iso-8859-1?Q?2TJESLEKARJsHpLEd5WgFNI4hMTGnezpxkESx2GbPMRvkjtZ28HtwPgfsK?=
 =?iso-8859-1?Q?vAy3OJD9a5yXuDEdRwOaYtYikzgdEPcunb6coe4uXEws0a13Pfn9QuyKnm?=
 =?iso-8859-1?Q?iieDsB1s/SXSf+9bWfRoTXcpQ9GFqcVt35eZTTNmjgGkcivsX9vrhdwfdV?=
 =?iso-8859-1?Q?BgoI2ZGoFoA23elizDxXPMH+vUcawSVQQxaPlX1R96YYNG3p5g1LHdjp6s?=
 =?iso-8859-1?Q?UyVM7GlHd2yYdygEKPDjbkWjNHgp5f3Z8j8Mic9Z/2AO2QatotQeqm8JZP?=
 =?iso-8859-1?Q?iVeY8kpR255ZWpeFu4/UBit595exD/NEDSzMx2l6eQiCbU+NHX+RcmLwvK?=
 =?iso-8859-1?Q?H0578wv7noCWopt4mWuUVjK4c07AtErpKtoHezWpRT8WvVNPcy3rcMj9YU?=
 =?iso-8859-1?Q?7LURmjEWtTC/00lL+EAWPEyhValQh5rLXPXXJSnxJ7t+bMnuIBJYd5Wt8O?=
 =?iso-8859-1?Q?XZjPKoNeOskemqlDsb6SlXEHSbM0X6BkGDuq0UiXSxE74uXsujqtYtUCn2?=
 =?iso-8859-1?Q?tTTGWN9Jw7kbDI2goiONqLFvWsHx7aNkVglC5eUstXvg3FtBZ8sN3e9oXZ?=
 =?iso-8859-1?Q?eo7EmpzP+ZFBnW9jwpBXlSmTATGxXZdYYgByldqKguL0F5ncSLVS2wXR3A?=
 =?iso-8859-1?Q?0eFVsYkAcx8b24b8OceDROBZy5jwqvJ64S0cVbGZyXMt47LyKm8528GtJJ?=
 =?iso-8859-1?Q?ZdT3q9yVmFaolkgowvKm7v0ZDHWTNlF8moaUM9KEh/URqa/fJVtbzhg5Vk?=
 =?iso-8859-1?Q?nMqFSjmA0pNAj5MMRfjnYbH3zXbzYbiuKJ9EQoduGsDLvTB2twKgSshhDx?=
 =?iso-8859-1?Q?LBVR7qc7LQuEYiQAcXlK3hV1ktv6OnFqxNWlBgjawM9C7Cl5shOh4ytX+G?=
 =?iso-8859-1?Q?akk+XK3f13JIW8pKrvb4IlRznz7Ut5jtvz3hfnmc9KAbvlEVYpInscLSiw?=
 =?iso-8859-1?Q?er9nG8xaYU1J6F9vns6Y7jfDRq5ZEjXIOtT7GXwNWLUxO8ncbCJyy0tDN1?=
 =?iso-8859-1?Q?wjQUr57CWJx812Qw9qDAKIrnVRgXqdi8b+R/DkVrUvDNprVVyo6GdKGocD?=
 =?iso-8859-1?Q?hoQufarAsLzmsqZodYtK4qUmphJXATM=3D?=
X-OriginatorOrg: navimatix.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 466c6480-0455-49b5-ccae-08dee372afc8
X-MS-Exchange-CrossTenant-AuthSource: GV2PR01MB11835.eurprd01.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jul 2026 19:44:45.0508
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: c87b4f54-b992-4813-8f3f-4a876324197f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: e8YKK8HfN8ptvLwhz1k/w3ryS7hJYuJa/4G/IHhkYE8oT6HPvWZrjpNr2BNYTHScjnTgXTKrSYP3nE6jxVHVlYgh9VcLn41r5NoxQang3ys=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR01MB12784
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 16 Jul 2026 19:45:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241105

--cx5ziseyfo77keyi
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [OE-core] Enable audit and other PACKAGECONFIG by DISTRO_FEATURES
MIME-Version: 1.0

Antonin Godard schrieb am Do 16. Jul, 11:21 (+0200):
> On Tue Jul 14, 2026 at 4:41 PM CEST, J=F6rg Sommer via lists.openembedded=
=2Eorg wrote:
> > systemd already enables its PACKAGECONFIG[audit] by filtering the
> > DISTRO_FEATURES for `audit`. It's useful to extend this feature to more
> > packages.
>=20
> Side-question, if we officially support the audit distro feature, wouldn'=
t it be
> relevant to also maintain the audit recipe in OE-Core? It is currently
> provided by meta-oe.

I don't know. But it sounds sensible. Can someone else give a yes or no?

--=20
Navimatix GmbH           T: 03641 - 327 99 0
Tatzendpromenade 2       F: 03641 - 526 306
07745 Jena               www.navimatix.de

Gesch=E4ftsf=FChrer: Steffen Sp=E4the, Jan Rommeley
Registergericht: Amtsgericht Jena, HRB 501480

--cx5ziseyfo77keyi
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
BgkqhkiG9w0BBwEwHAYJKoZIhvcNAQkFMQ8XDTI2MDcxNjE5NDQ0MVowLwYJKoZIhvcNAQkE
MSIEIMFrJKoO9MROn7jnY39sogIjZ7wX6ELnVVwYcJ8DT8N8MDUGCSqGSIb3DQEJDzEoMCYw
CwYJYIZIAWUDBAEqMAsGCWCGSAFlAwQBAjAKBggqhkiG9w0DBzANBgkqhkiG9w0BAQEFAASC
AQASOml2eOt6u+wsKl6VWFD4C3VxSlNv9h4rkX6nFeg2cHwx6bijquUqaWgW/YdmcmllqV6M
WLd+6ZRBFXqxMSVMOrSuWMMixpCXwb4Nxpycf2mJNxKmahn54TkQNvUDgaheymrRASsfWQRf
kn3usoOcCrPdQzgoqu092DViFNdV6GmlQ8uZ7kOF5wvAUONQHwf/ObV9EUxHt9RTbORwweK1
kHZHh3kF5QkJJZqpBXp0LPes/az/mRp+IaDP9s8peThAO71E/4y4xpV0rkr04sXomx7ietrI
YrgGPOxoHIKVF/02cuJbZVwWHTO4F1rXar34TDsd4YIWg/CheeDf6Byu

--cx5ziseyfo77keyi--

