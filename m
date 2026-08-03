Return-Path: <joerg.sommer@navimatix.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D915C5518F
	for <webhook@archiver.kernel.org>; Mon,  3 Aug 2026 08:37:18 +0000 (UTC)
Received: from DU2PR03CU002.outbound.protection.outlook.com (DU2PR03CU002.outbound.protection.outlook.com [52.101.65.122])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.38950.1785746233843562165
 for <openembedded-core@lists.openembedded.org>;
 Mon, 03 Aug 2026 01:37:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@navimatix.de header.s=selector1 header.b=5cm3KA6s;
 spf=pass (domain: navimatix.de, ip: 52.101.65.122, mailfrom: joerg.sommer@navimatix.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YeOGHfZxnHcq6YAROceQ/X9A6P/LmDNgd7sHWb8iNwFyl5Ahp02f/0cZKTk2+y9Dg/96eAOnqN3iJ4jnbkGvdRFURjFluXCR6wi71Vp3DNylcoy+a71Xy6tK9E/O/CI0iSepw3X0hbZ+VlNJRR8nyZqePh1N5UDStqJnjVnZbtOFGPmi6752lB8zSpwMu3lK9zR+JJjGJ51kFJlzDFPppUM6lfixHxn6ooKI72oVLvdW6dTsiFhCh60EC7g/TnInWfMrF4d1QRGXReDy3HLef42+mbdM6R6/TzpcYfspoLHt8bL6rQH/4blCkgi4VDd1Jf3oXahSO76DDF0qZzetuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=k7860M0tW1svG45wvB428rjrRhTOr3AyweoXc3LH8js=;
 b=Jba7SErFhpGU0m8u+QSRCB5FqGLAoXAdZwHRnK+IJ+DtQSe/UTFd3IOPwfyXhZXyLqixAb0MxHOMErr0lDCM/4q8DpuBxR3kyQeCRgWkYc8ZU49TqLSx9qxaH9RnzxAu3kQeNlwhEcYW2gnHgZuz/+3NUiCD5+jphBGXRRfIC1HFaAqu41Po/epSMc34jsOqoANhvSpXAV+wI5C4WDQDBt+CsOSGiL3+nU1AnnsHuBeVwqEXUXh/rit5r5HB+TYS6u69vNx9yypnQX4YdW0PSAaZOezcWRFooPpjcuqzOCosNizkNXpZ1+Kq08hPlHPiSUBx/qaWrjKDz5+FJ3y3Bw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=navimatix.de; dmarc=pass action=none header.from=navimatix.de;
 dkim=pass header.d=navimatix.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=navimatix.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k7860M0tW1svG45wvB428rjrRhTOr3AyweoXc3LH8js=;
 b=5cm3KA6slz2tmV+wRk4FtudFwvgb3dhlSnitlfThGjpqvrwzynIK8xeHY+enaFYULxG8aTXK9Zkh/ftMwCui0w4g/iEnRaNjQ+xiUUeaK138aTbN/tTLJNm6N9LPB/HcFwkLGkfvhqCyg2Sd+HO1e4D5lzSOq3Fpwht+wBmRsKw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=navimatix.de;
Received: from GV2PR01MB11835.eurprd01.prod.exchangelabs.com
 (2603:10a6:150:2cb::8) by AS8PR01MB8121.eurprd01.prod.exchangelabs.com
 (2603:10a6:20b:378::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.17; Mon, 3 Aug
 2026 08:37:09 +0000
Received: from GV2PR01MB11835.eurprd01.prod.exchangelabs.com
 ([fe80::d5c3:2dea:3d98:25fd]) by
 GV2PR01MB11835.eurprd01.prod.exchangelabs.com ([fe80::d5c3:2dea:3d98:25fd%3])
 with mapi id 15.21.0270.015; Mon, 3 Aug 2026 08:37:09 +0000
Date: Mon, 3 Aug 2026 10:37:06 +0200
From: =?utf-8?B?SsO2cmc=?= Sommer <joerg.sommer@navimatix.de>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org, antonin.godard@bootlin.com
Subject: Re: [OE-core] [PATCH] audit: Move 4.1.4 from meta-openembedded
Message-ID: <anBRlCbmSzxBu6et@navimatix.de>
References: <ade2bf144146d1174890a073a88cb314da65d5fb.1785739505.git.joerg.sommer@navimatix.de>
 <d204c0394793abbf3ee4142ea1976054d1af611e.camel@linuxfoundation.org>
Content-Type: multipart/signed; micalg=sha256;
	protocol="application/pkcs7-signature"; boundary="dat4q7thixj3hfky"
Content-Disposition: inline
In-Reply-To: <d204c0394793abbf3ee4142ea1976054d1af611e.camel@linuxfoundation.org>
X-ClientProxiedBy: BE1P281CA0442.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:81::17) To GV2PR01MB11835.eurprd01.prod.exchangelabs.com
 (2603:10a6:150:2cb::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR01MB11835:EE_|AS8PR01MB8121:EE_
X-MS-Office365-Filtering-Correlation-Id: 16440ccf-386b-4e6d-6085-08def13a67d0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|23010399003|366016|376014|1800799024|6133799003|56012099006|10067099003|4143699003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: 
	jei8Vt9K6gVsOkMH1OkRB3gD9+CY/RE3TKM8CSfB1cfaRAqVFpf5D2UD4Tipes0PlKdXawjU4KQTTiKDTj18FdK4GcBRvm2BVpjgOhIm6glsf3/Zwv8FSJVpi94ZmMoRLgi7pfEKaGyxR8EW8EB+LF+K63MFlYCXy0FfJBG911asRXkcU+P4X8rI0F/4NY8PWWPTMm1xy4/LYKsH89HM0bBxpQEAbdiV6agVsZJ94dgzLI5+xgKFq10CmJf2Bz/ru7sfldxn4qA58vuU2ab7nIzzJkmpgLOxLOgT+y1LHUfoCuvLRDz7cuTIwSFYE5A9w5RTyOan/ojZObL8chdcZO7pDe85c4G8642ceD+0YyGGi4nqHVM4DF3ioXZpLR8m1fumzaB8E/iO8+WhpcWmNw4tUaYMtoazCf/lqHSd1wo+OvGxRU8ByKJkrvnrrzXjFziO5OmId1IKB8bGBOLEZoWfkjAL3tfEG644FuRh8ssHHmWWnB0q3Fns+xY0/NdlsPrvC5xo//c+OMr0PgzydnVjZ4jBzF5sGH0pXm8RAH90Dj1D/1S+0tYmCWRjIk0lSTawrxHf/0FLqQ5agxumRlldDfGKSg+cixWN7lznSxU=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR01MB11835.eurprd01.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(376014)(1800799024)(6133799003)(56012099006)(10067099003)(4143699003)(18002099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?iso-8859-1?Q?g5MvIpm3hyOjemZss3M1aMApNcK7mtEpKxx60JrDe9EawtmK0ZlHh3KOOK?=
 =?iso-8859-1?Q?RCZOdjMMlDdxXcT1pBiVmGeCsUlAq7em+WF9chLGKcVbRp5z1iFNOsbvbr?=
 =?iso-8859-1?Q?pCKYitX9IsRYkZoUlTuUi+uWv7X+SL8oJw4i1M0/VfCmenpSVIjvnQ4yhA?=
 =?iso-8859-1?Q?ZUybzpf/J54lowbbChhKmVN++pu4gq7oWE8YegLS3WSp00uDCqU2AxuFaH?=
 =?iso-8859-1?Q?cyA49yaya45pt9rq34eE9MWR2ACnhHLPNArA6mhRQDMUqD5PS+OJM+CJ7G?=
 =?iso-8859-1?Q?nEBdIxyIo/QcnC2S46xauCwv4YsK0G0JlcwQAEnii0uJxAuIWZ28mD6zP5?=
 =?iso-8859-1?Q?1TKIzp+qR7tlAblta+gYcmTQtu+eYcLAfEW3SepzHDoYxH7NTbj/VIs8A3?=
 =?iso-8859-1?Q?PijvROQ5eEBt+FoaaA47zHSBlsYTiZxOczK5EEFRmLZzQ0+fyEaMMSBD5u?=
 =?iso-8859-1?Q?8SbGF/hFi56F0enIlGFIn7JItrVgKQZ2wSHOFFFqOu1dInfPK3ZmndUUKD?=
 =?iso-8859-1?Q?FQXxaqT3l5hProN/2HLO7o0XESGyl7pJj/hdgt8U93d+r4Vi+fUyY8idx9?=
 =?iso-8859-1?Q?J73lyCUWTSeaL/SiBFkxlYT79bIdwkyJrJd+ud09zug4E2zFxvPTnk88Ag?=
 =?iso-8859-1?Q?MiRX4hs3D1gBDfA4L37g30T64HEXBmqL+h5U3YwJl/MQY4M6Xdb/V9uoCd?=
 =?iso-8859-1?Q?uZ2JyBZyAXixTQh3weNgEV4N4Mp613rDMQRqvHCt/WYkf2lZN0NFSOUg4L?=
 =?iso-8859-1?Q?VWQ0Kn7pPEHzq7N1q9HElaG9MNao/tinsP6X/F8LGS92cciTrKqOPlMJwO?=
 =?iso-8859-1?Q?DzFEFdnCIOa+ycKb37BszrY6on7OsaCSv6BzItIvn1MA0ods6mc7HFP5fv?=
 =?iso-8859-1?Q?O3e80k04tjvUz7iP+OKfqP8My/QJrS/zOoRt9k6X3w5UBoHtou7mGBluqX?=
 =?iso-8859-1?Q?EW8ZE2eqm28QrqGwX9syeLWGd1tzX2EqZoRPAmNngLu+WiV6la6DZyKPlI?=
 =?iso-8859-1?Q?oDI0N7ksUZ6W+5dWc3bAwoffeaRH7wjsVzcJZy5jSV8tDOvXOL7x9sW6Cy?=
 =?iso-8859-1?Q?pPRG2x+8uJGnePHO29U9xaisicDYEkHDkko8sYDUrfpB9W9EGWdZeNOICS?=
 =?iso-8859-1?Q?Ga/ueDvgFiu6oTHhe62DeT+KUFGD4L5Xr7shixfHN5bwXebukdjDFKH17k?=
 =?iso-8859-1?Q?KOSh08x+bk8N4tg+dgsdUrI0UddOxlxbIGc1ftokE/UzkVQFOfYy2B8A8U?=
 =?iso-8859-1?Q?tQuRm02B3jaU/dyKg8KruJ+ORWbnvierMaZ6D5QKnDbmPX1wUf/POoaNBG?=
 =?iso-8859-1?Q?/w/cDPBppJo03hDrYgIj2EI7XE8/z6meYczSf2Yl5RnRqLFyFssYcgCT6v?=
 =?iso-8859-1?Q?FZe/mtqAWkQu2CInbX1YgckqfC+SplA11SI5wbl4VVLG51quvdLqhXSiD2?=
 =?iso-8859-1?Q?MaZQ7v2xkCBUPXwa+/Ljmu0r+MXn5QbPcZubt7okdFd/DCjqo0qnWmZxSx?=
 =?iso-8859-1?Q?Uff1Syv+sSItqZ33hnYKNpdxw+oF3SOU94It5alROq9lFmCLGIfyWkzf0N?=
 =?iso-8859-1?Q?3BTZgq00ZysvWo3gT4VnwAEeDt2dx7SfbG588WDPtWRpPe/VQOcHEIKlca?=
 =?iso-8859-1?Q?8XqJN3UeNhyvs0ZrcHeQIuf1phQOPNQxtiX05aq8J2/O4hwycHQJVkZjXa?=
 =?iso-8859-1?Q?uy/MkWwf6LOCCdGjfkVGrf6qxU1pPq2i7rniCmzwFrxGItpdJNTnkxheJG?=
 =?iso-8859-1?Q?f1rmQdz9CUI9PYJj5uPagTfPezcZnfxk25aWDDJskh4WfbzSuEi+IAZG53?=
 =?iso-8859-1?Q?a6plKA0h/VsCrpTPlQtNLHV0OJbFIYA=3D?=
X-OriginatorOrg: navimatix.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 16440ccf-386b-4e6d-6085-08def13a67d0
X-MS-Exchange-CrossTenant-AuthSource: GV2PR01MB11835.eurprd01.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Aug 2026 08:37:08.7333
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: c87b4f54-b992-4813-8f3f-4a876324197f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1Q4HYpgeW2d6Lb0Zoq2XkqVpU/ixoeNluD34CnYZ+NVDPuU5/JfQp3GHulLshPhVfR2FJRmAKvu2F58sI0pWSR+9Eaus2tzew+PPQmXOTHY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR01MB8121
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 03 Aug 2026 08:37:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242621

--dat4q7thixj3hfky
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [OE-core] [PATCH] audit: Move 4.1.4 from meta-openembedded
MIME-Version: 1.0

Richard Purdie schrieb am Mo 03. Aug, 08:56 (+0100):
> On Mon, 2026-08-03 at 08:45 +0200, J=F6rg Sommer via lists.openembedded.o=
rg wrote:
> > From: J=F6rg Sommer <joerg.sommer@navimatix.de>
> >=20
> > With the new established distro feature *audit* in oe-core the tools for
> > this should be available too. Therefore, include the recipe from
> > 8f3df8b447aa8a27ce15ccdcfa9d3eb253c08dc2 in meta-openembedded.
> >=20
> > Signed-off-by: J=F6rg Sommer <joerg.sommer@navimatix.de>
>=20
> I don't know what the right thing to do here is.
>=20
> We (as in the review meeting) agreed we should take the other patches
> and standardise the controls as doing that adhoc would be a pain for
> anyone wanting to use this.

That's totally fine. Antonin suggested an appropriate note for the
documention. We'll go with this.

Thanks for your feedback.

--=20
Navimatix GmbH           T: 03641 - 327 99 0
Tatzendpromenade 2       F: 03641 - 526 306
07745 Jena               www.navimatix.de

Gesch=E4ftsf=FChrer: Steffen Sp=E4the, Jan Rommeley
Registergericht: Amtsgericht Jena, HRB 501480

--dat4q7thixj3hfky
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
BgkqhkiG9w0BBwEwHAYJKoZIhvcNAQkFMQ8XDTI2MDgwMzA4MzcwNVowLwYJKoZIhvcNAQkE
MSIEIBXqwZpUQWdn5Y+2tw+ImvdZl1dNf7Bh0bugffTqi5pbMDUGCSqGSIb3DQEJDzEoMCYw
CwYJYIZIAWUDBAEqMAsGCWCGSAFlAwQBAjAKBggqhkiG9w0DBzANBgkqhkiG9w0BAQEFAASC
AQBmPK4/6t4nRmVdl69jclgGNZnY8lcHs4I1ypc1v7JG6tPefrou5bTclOT+G+LofrsXTrH8
e3hwSbNiTq+WpCQJ0W1BZWgqMKuSAnsWcAO58f0gCAPPXus4HfYXyVk+aiM6FUC3FqbpqpJ6
rrvWtBMuu+9gciB5htyGHi4YAMOKLz1ElvD4dppj2zQnjn+FJTW3yd9pg3CmTJQZv0edoM/7
XTYUbfowTffAb1QRfiCUfE/p9NBMhPZiOhWZcStsUhdfeI+si06tjMOOC07bohqNkIA9LkNm
9kdNC4lvTJ0iY6ccSnKXug51o41yAxRtN9ozoVzbAjvmwOVUFDjMhuho

--dat4q7thixj3hfky--

