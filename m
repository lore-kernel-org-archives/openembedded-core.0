Return-Path: <joerg.sommer@navimatix.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3E9C109B493
	for <webhook@archiver.kernel.org>; Tue, 31 Mar 2026 15:41:04 +0000 (UTC)
Received: from AM0PR83CU005.outbound.protection.outlook.com (AM0PR83CU005.outbound.protection.outlook.com [52.101.69.96])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.23338.1774971654343270336
 for <openembedded-core@lists.openembedded.org>;
 Tue, 31 Mar 2026 08:40:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@navimatix.de header.s=selector1 header.b=DAr9f4G0;
 spf=pass (domain: navimatix.de, ip: 52.101.69.96, mailfrom: joerg.sommer@navimatix.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wK5YA8FwbqD2kVd/5D0cvHYeaUNT5PUHMUryDU5t6Hrj8YK3kO9jiXE6b9i4dY24DSPx4WLxyhuGhzoREBsVfCm6dxwMlDpcbKOWlF/QbKAOvOrt9Xc2mIB3Gw7kUSdrWjriUKpImF0cQWWtdHlYFjTBinBfFS4SnrRYGO+/bJn6/7M4GJ6LcKNPDhirJGPd7dZHL+g1g/B+iF+TjSTM+835y3suLJOo5dID2z8tclKtpvbIcmDDu75ro4PzL8rdV0JwVMIiSaykf9/PVkMMCBbtkS9LK+mNIPbXMh2zdObHJv/Gf90pkP11dAxfHpGXkyDmhOUJR7E8L7A+9vFOPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ak2rmv3O5vpb92slwKogDeqrtYpJ6MhWap41QoUDXEE=;
 b=Uee9UR1Uasfjy6yS2ZjiznWl5nctGK9FFyg0jQkQdfi9UMNNN35f+pPmskeFmgjHF9m8j6Cg7Fbh++evhnhlqwtVwfMbLkCmxrbelehyivgHkR09PQK15BCwJLmV49gsLBkCGKi9KR3n9d+eRlLCtvJy1jpLabHanK6XRIY7q/S/QE95C+zQvU3bfZgBSkvEFof0T4J6SaD6F09lYqC6QvzX44mKkFgUmNz6aD9fXZj/zAVllG8L/TrfGDmwxwAkbgdRlA4WsIhmRRb2z42q7ozmICyR5xHL9PGoSvov/y0tUPDsAMknTzE0Z0uDxQdWfdiqudtmk1QADt+GerOj6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=navimatix.de; dmarc=pass action=none header.from=navimatix.de;
 dkim=pass header.d=navimatix.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=navimatix.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ak2rmv3O5vpb92slwKogDeqrtYpJ6MhWap41QoUDXEE=;
 b=DAr9f4G0b/wghWXLWiUQJMOjt0YV5IRupEFCzINoGc0Q0ULzjAB8x/7FD6PzcS/Kyboh3Lpoi247fyZgsAQYahbM2rE++MNVuvrYcnko1//Kp4oUl1SZfjAqfH3tCdaXwCOSlydrKMa3l/p7Kbu25e/yQAxhZ/ya5eWmaDFNqfc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=navimatix.de;
Received: from GV2PR01MB11835.eurprd01.prod.exchangelabs.com
 (2603:10a6:150:2cb::8) by PAXPR01MB8236.eurprd01.prod.exchangelabs.com
 (2603:10a6:102:206::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.31; Tue, 31 Mar
 2026 15:40:36 +0000
Received: from GV2PR01MB11835.eurprd01.prod.exchangelabs.com
 ([fe80::d5c3:2dea:3d98:25fd]) by
 GV2PR01MB11835.eurprd01.prod.exchangelabs.com ([fe80::d5c3:2dea:3d98:25fd%3])
 with mapi id 15.20.9769.014; Tue, 31 Mar 2026 15:40:48 +0000
Date: Tue, 31 Mar 2026 17:40:46 +0200
From: =?utf-8?B?SsO2cmc=?= Sommer <joerg.sommer@navimatix.de>
To: thomas.perrot@bootlin.com
Cc: openembedded-core@lists.openembedded.org, thomas.petazzoni@bootlin.com
Subject: Re: [OE-core][PATCH] lto: disable for expect and add
 DEBUG_PREFIX_MAP to ldflags
Message-ID: <acvqE8lCFwxJesUk@navimatix.de>
References: <20260331081246.73406-1-thomas.perrot@bootlin.com>
Content-Type: multipart/signed; micalg=sha256;
	protocol="application/pkcs7-signature"; boundary="7smsswquznu6b223"
Content-Disposition: inline
In-Reply-To: <20260331081246.73406-1-thomas.perrot@bootlin.com>
X-ClientProxiedBy: BE1P281CA0314.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:85::15) To GV2PR01MB11835.eurprd01.prod.exchangelabs.com
 (2603:10a6:150:2cb::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR01MB11835:EE_|PAXPR01MB8236:EE_
X-MS-Office365-Filtering-Correlation-Id: 3ad11c6d-e9f1-4b30-7ff0-08de8f3be19b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|366016|4022899009|376014|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info: 
	QLA8tvyMb++iqrCOll7Q37wudvWbrvS+VlG64zm0PsUkcDD5feic+xtrqhCwzJJvBiSeFxa0BN2DZqBU/JAAcMMfbkpHlT0gP35jXpDqPW/yp9IVlsmzWrPt8vfR+/SEyaM2bhfeARzXCiAcSjuiC2fu2fZdBbFuq+A60SZhxYC6XXK+X+4eSO1ynxM0vNSJ81YmJcxHKww3fNLnW/6zS6mfxR+Jo6myH6lYnV6aLIaIam61+fLdAxzHI6rQZvBG7v0uKySeBhxIBcZ2Y2Zy0UIyOiDV/EffzeLCXg55gfvEucyV4XI07SaufmlSsvFH4lUoxEpmbl9TVmqLA6U15BsJDK6IGwdm7pYIgBYIVHbtHq9VE3QgmsRC3N74cJW33wHue6VVXsvGQzQyRB7jU2/p9Ly1EeX/qcMwjnEyjwU0SdukMZPm0cFhgnYh9EJOHtN1NGf4Kf4k8H2bqlimm7HQGIpwNYPWh7TcqTv8NaG0GFnsueF+cdWf40L6MF7PQybxgTBMTJzbLkOp4Y9EnXwdOUr4nDX2vX39vCQqY5qqsiwLfoWaLvnc+xhRO07bAwQ7ZIsBR2S8Hn+01aOqkWkFs5EngMVBNLUa9JldwKmavIT4s/qs5YeadlCSKf/QejHbhA+qNDDKF5ESsTKnOfSyawBLd5DSiQ2sN860zrBd1k7R4CrPAWOY2nHx2hEQ
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR01MB11835.eurprd01.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(4022899009)(376014)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?iso-8859-1?Q?84ttjV0futj9QGW5SWHxUKlY46oSKvdo/xAyZoJW13X7lDUi5kQ/tghZf/?=
 =?iso-8859-1?Q?yhWmkrAcTdKzW32xaQ2fPycdTUrZkhnpcN0uNPm4ilPJe+EWeoVonJl10b?=
 =?iso-8859-1?Q?jQZSJr34VYyyxoryN1Mn2jwUnC89ZvTN+fHdbnIX/2sBlWCmvMhNGAmIRU?=
 =?iso-8859-1?Q?varQY6D5hcCsuYYNN2G4ZKKTtAWKKq0A4R+NYtJoPHwOXarxBoBG+X5Gsw?=
 =?iso-8859-1?Q?x6+2Iik3yc7futn3h6uoTC3ThVpTDRMO3PtyT5I5m6hxSNk9HHcVEabuQF?=
 =?iso-8859-1?Q?3o9uAKWiGUU40oUK1cPMabCSkzBIUXE4cHTcSg2P2iL2vH1rloY6UZ0yuO?=
 =?iso-8859-1?Q?IpfOpg/skqJoXEiMiufm7Jexuvt/aE85/zdFuc2XxpBHvhlS6Rv2CoRUnc?=
 =?iso-8859-1?Q?cPoL6V5OmpMj1/9JdlmJD5gdRn7l0HQ/1nUjJrNVqQr+Yx8Lgokt0G/BKI?=
 =?iso-8859-1?Q?5LOnsDka5t+0MB29I0ldopYIkcpXywNlrYMvbk+KROGaAC9hLtudGm0tl/?=
 =?iso-8859-1?Q?kvaPI+4sk+1EDdWt2dWinGR7XjlRf+mpOOcjhIiQoX9w951eKkvmZkkSnj?=
 =?iso-8859-1?Q?l+8GvQeOTskbnaXOphOUy/pORp64aS3XkP9xf2eumfjSXLEJnQryjSJNUw?=
 =?iso-8859-1?Q?j68iGZcFKiugVz1O0knxEM16jHBK4ZMdng2VHBbwymqpgWZO2s2rOtbRlN?=
 =?iso-8859-1?Q?099M2Cuc5GxZmHP208udid/BY39XqSYhUw9CwHgItsICklnVTK10+NsjpQ?=
 =?iso-8859-1?Q?et1VtHR6Hxp8Bok/sbEwhzh3P/lFP5RaZN1jA6hmUy9ns1ZXYTj6RlolN6?=
 =?iso-8859-1?Q?ERhB3R/DeYUboukRuN0wOdM9e2O4eVPKKPUeeFch+BQcU47VFMqaD6sBp+?=
 =?iso-8859-1?Q?jWrtMagGncRdMETTFmclSU8qJ14jDkC26qbjuKvtxVogvWuEWqsAbdaojt?=
 =?iso-8859-1?Q?Zz4/RXzPlaZaivVQGCvfF3T6jOfpGz+Js4NIOV5isqQfi6IzSdLWnmr70S?=
 =?iso-8859-1?Q?hrNKGqlGttyNoGQY8mzluaEWlqxkCUizTEettoBzy5byKlNBjZmqN8xzFF?=
 =?iso-8859-1?Q?FncJhwjK0dWgk9X8cFU/P7mp0MbUV9tS9MmLKIFsMdQN56PkLlT+lKqlJz?=
 =?iso-8859-1?Q?1blIUIxNy6T221XtnebaWriEZDIw3MmTqXuM5ymx/4oosy8wBnAp+5ooDr?=
 =?iso-8859-1?Q?bMX/3125ot2lMh+nTQjnUsCedOPuvpLAR1BsoES5mHCbvuwNDuyUC8R08f?=
 =?iso-8859-1?Q?U5Juoyr6RaenqQo6jK5FME4FmR1JnAiFWiKhkaux/w5482wNNZaKIFdybL?=
 =?iso-8859-1?Q?KXHZzXGYdshM8qbVzbWCPDiYztQ9I5kfCno7tePn4OfebT9cBdzdCtcJYf?=
 =?iso-8859-1?Q?84HxPf55gwPpO6CgVqnEnjXY0uakvRYkCtdHUUOD1o9BnkrA78uZZfcPUb?=
 =?iso-8859-1?Q?O/RUsXzP0hSbqsw75hh7yeuXQzQ5mdoHi0DKYm39RP4pwo5CBcqOGrhuTY?=
 =?iso-8859-1?Q?ZinXz6rm59LHByFZgScpUsyG1Vahm49ujgiC8PLeIdxWQg97dP3i/cLzEs?=
 =?iso-8859-1?Q?ITDsIUOiL7jkqD6LAWE5TWQVdwzaBm9/5IwJGs0Zr9N0Ru5NUt7n7v+Bb6?=
 =?iso-8859-1?Q?fHsOxRcYFYoBlqwLJlqfwBCOmw2hEr/mxYnm+1w27qzge+X3MV8WnGDs5p?=
 =?iso-8859-1?Q?/+a2jnx1nHz9Yj/Z7iO4yBfrBCeg5iacBqrBbKOqyb30HOiACYkMV0lrUy?=
 =?iso-8859-1?Q?/6mHjpZmc/6inrs7tQvBXAUc4wu/lXCN4Ztyhcm73BShKO0v1an6XLni+F?=
 =?iso-8859-1?Q?40/G33+lQiVbTTDAXkbxr4NWJepL5aQ=3D?=
X-OriginatorOrg: navimatix.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 3ad11c6d-e9f1-4b30-7ff0-08de8f3be19b
X-MS-Exchange-CrossTenant-AuthSource: GV2PR01MB11835.eurprd01.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Mar 2026 15:40:48.5749
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: c87b4f54-b992-4813-8f3f-4a876324197f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: T4rmcFw8OfWhlgV6TaElr7N3oHkmfCafNn2+RsmG6B8fY2KniU+yVeu1soPQqEpqyIGW7YP4krF+Hqav0jVtzYOMUJSHQk5ZAKOKE1XQbAA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR01MB8236
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 31 Mar 2026 15:41:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234304

--7smsswquznu6b223
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [OE-core][PATCH] lto: disable for expect and add
 DEBUG_PREFIX_MAP to ldflags
MIME-Version: 1.0

Thomas Perrot via lists.openembedded.org schrieb am Di 31. M=E4r, 10:12 (+0=
200):
> From: Thomas Perrot <thomas.perrot@bootlin.com>
>=20
> Disable LTO for the expect package and append DEBUG_PREFIX_MAP to
> TARGET_LDFLAGS when LTO is enabled, ensuring debug info remapping
> is applied consistently alongside LTO flags.
>=20
> Signed-off-by: Thomas Perrot <thomas.perrot@bootlin.com>
> ---
>  meta/conf/distro/include/lto.inc | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/meta/conf/distro/include/lto.inc b/meta/conf/distro/include/=
lto.inc
> index 8752249685a4..c66dfc5a8074 100644
> --- a/meta/conf/distro/include/lto.inc
> +++ b/meta/conf/distro/include/lto.inc
> @@ -4,6 +4,7 @@
>  #
> =20
>  # Disable LTO for following packages
> +LTO:pn-expect =3D ""

I suspect this is due to the gcc bug not because LTO is unsuitable for
expect. Might it be a good idea to move all excludes due to the gcc bug in
its own block? This would make it easier to revert them when the bug gets
resolved.

>  LTO:pn-glibc =3D ""
>  LTO:pn-gcc-runtime =3D ""
>  LTO:pn-libgcc-initial =3D ""
> --=20
> 2.53.0
>=20

>=20
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: Every message in topics or hashtags you are following is emailed t=
o you.
> The first message of every new thread is also emailed to you.
> You automatically follow any topics you start or reply to.
> View/Reply Online (#234270): https://lists.openembedded.org/g/openembedde=
d-core/message/234270
> Follow This Topic: https://lists.openembedded.org/ft/118593189/7646358
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [jo=
erg.sommer@navimatix.de]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>=20

--=20
Navimatix GmbH           T: 03641 - 327 99 0
Tatzendpromenade 2       F: 03641 - 526 306
07745 Jena               www.navimatix.de

Gesch=E4ftsf=FChrer: Steffen Sp=E4the, Jan Rommeley
Registergericht: Amtsgericht Jena, HRB 501480

--7smsswquznu6b223
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
ATAcBgkqhkiG9w0BCQUxDxcNMjYwMzMxMTU0MDQ1WjAvBgkqhkiG9w0BCQQxIgQgffLIzZQm
VLwTvMyOdEikM4ZzL0x0F494zV96LYuwaBMwNQYJKoZIhvcNAQkPMSgwJjALBglghkgBZQME
ASowCwYJYIZIAWUDBAECMAoGCCqGSIb3DQMHMA0GCSqGSIb3DQEBAQUABIIBAI88CqN4JqFy
YTRYDHTVG3J40DHU0QPyiGx3nlcwmH1YXTa+mxcXTOfILV5YUVHbX+3WJWwPleGkw9CEWtSB
93NroeYghhlCnpXxgZM/hsZjC1qte2z9Fk19UGCPZD3SUaetn/u4ex2e28BDfwdbB1i1gVe/
t2KaNRwTBEaFCM5ZwyGG7D11JWnbeOhYmchgxAkxQiXxrfvaRlYbM3QvZaDfXQ9rfySO7DrN
py8MnWyOQVwMiq0qoViIn74sEPDaRkaQ3YIHRYamMPQE3tHDv3IRZOHRgQ3tpymHnizTNa9+
KfWRVvAbdltq0jR48Nbt2pCmO7A/c5QNJI6FszJ19+U=

--7smsswquznu6b223--

