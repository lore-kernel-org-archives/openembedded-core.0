Return-Path: <joerg.sommer@navimatix.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 623C7C5DF97
	for <webhook@archiver.kernel.org>; Sat, 22 Aug 2026 14:09:53 +0000 (UTC)
Received: from AM0PR83CU005.outbound.protection.outlook.com (AM0PR83CU005.outbound.protection.outlook.com [52.101.69.127])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7229.1787407784508447133
 for <openembedded-core@lists.openembedded.org>;
 Sat, 22 Aug 2026 07:09:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@navimatix.de header.s=selector1 header.b=tLxIZvF+;
 spf=pass (domain: navimatix.de, ip: 52.101.69.127, mailfrom: joerg.sommer@navimatix.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QzyzE67gRCiohNa59PVN0A3VxL95hDNiFnqb6LFw6YStxqN8uh3HLL7N8Ccvay1Y/CXTLB2nJ2m8JQf+6CJbRBDu49ZnylBRuCILX+7EUoUVvJvezQ/+nIuNGOqSWIzRRR0gv7Lmop2MipowJ5joVSOgRHkyvW4RD6LcGV1zJ06lwSTHIOe32W9XpKus8+sLaStalLm/qsDtTkwYa7gIMtoLihsb5f0Uhp16sxlHF36d4cXElFuc4DuOjlmiGIVd7ETHVsmVSEHgj7WuNg1b5TuO3FmqegLQkyCnXzoiRlmliuQVpoeuM+/p8jJS8BvE4nf1uyofbpdO08R5tH3zng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iesXBwpAuNWABoLp+/AOQa5kG0J7IoY5u5xsMG5Tui4=;
 b=ZA1JQHoUCJhPSY5VySQ6BBjRDkfJqAQiFdXoCtWhBt8dRO6Dicg68ay0eHiOmtAOeRxQme/EFkcgh+y7CFudD2sMr3ZkICJsUEYzi4mz6ZxYs9sDoir07zX97l29rM4Pqdib19tzD04Z9Pjc82qE7mGlblW2xbdnd2gVLPpvY2LHErFJ+NnF+0xJopxwb0mxIgckL/LBbIK/Ki9FI/FThlkQ9YBG4BWXNdkHARn36KJgwQRamTvoyXjHqYHtKXR86vds6z9isn7g3ylM+TAJYNMNwnPplOW5/VJu/dnbjHIFy+6Yvlg9txjpU0Yd1gK7lJsWIcArIM7uh73OTf9PnQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=navimatix.de; dmarc=pass action=none header.from=navimatix.de;
 dkim=pass header.d=navimatix.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=navimatix.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iesXBwpAuNWABoLp+/AOQa5kG0J7IoY5u5xsMG5Tui4=;
 b=tLxIZvF+YjFk0vBRiWkbNIMsuvoqTm7iipohaPoyyOXVg8M+rkGgEVRhYUTVRhoCWzMYWChN+pbVYPa8+qG1Mjn19CI6IxyntdQNESudFSWnPM4QVJOJeE0vsk3JtuAAB1/EItTG+hZtQjN6opiJjwzwXjMmjVlHoS2gCcZrS9o=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=navimatix.de;
Received: from GV2PR01MB11835.eurprd01.prod.exchangelabs.com
 (2603:10a6:150:2cb::8) by DBAPR01MB6711.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:178::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.8; Sat, 22 Aug
 2026 14:09:39 +0000
Received: from GV2PR01MB11835.eurprd01.prod.exchangelabs.com
 ([fe80::d5c3:2dea:3d98:25fd]) by
 GV2PR01MB11835.eurprd01.prod.exchangelabs.com ([fe80::d5c3:2dea:3d98:25fd%6])
 with mapi id 15.21.0339.008; Sat, 22 Aug 2026 14:09:38 +0000
Date: Sat, 22 Aug 2026 16:09:36 +0200
From: =?utf-8?B?SsO2cmc=?= Sommer <joerg.sommer@navimatix.de>
To: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Cc: openembedded-core@lists.openembedded.org, 
	richard.purdie@linuxfoundation.org, ross.burton@arm.com, rs@ti.com
Subject: Re: [PATCH v2] bitbake.conf: Extend distro feature usrmerge to merge
 bin+sbin
Message-ID: <aoms3iLkFaLTp8E7@navimatix.de>
References: <ada29b3926f0497ef35618685c298cad840f45e0.1784883539.git.joerg.sommer@navimatix.de>
 <aolV39x9UzHwcTrZ@navimatix.de>
 <DKVGRWKPI3K2.1PBICS35XGJYK@bootlin.com>
Content-Type: multipart/signed; micalg=sha256;
	protocol="application/pkcs7-signature"; boundary="ch3fbihgwnnnv4dd"
Content-Disposition: inline
In-Reply-To: <DKVGRWKPI3K2.1PBICS35XGJYK@bootlin.com>
X-ClientProxiedBy: BE1P281CA0275.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:84::11) To GV2PR01MB11835.eurprd01.prod.exchangelabs.com
 (2603:10a6:150:2cb::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR01MB11835:EE_|DBAPR01MB6711:EE_
X-MS-Office365-Filtering-Correlation-Id: d9a95718-6fb8-4b3d-6fce-08df005700c1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|23010399003|366016|376014|1800799024|4143699003|10067099003|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: 
	J5aXmFhuo/IusgU05oPQ7TwE2J6mM0eD6UHKKCAiBqBRXMccN6iRjXGPzpF8aRQ2xi2mL/HrTvzqgE9m8Ff3pyTor+fp8Fk2hihzIpd26CW38omA8kS+0TpHsE94pCdyt1BARhRJppgG5gepwXhWNDZzD1I093UV2ZPz6nJzVShr2HUwjZgRAecgcC3dSlMu6oFKCW3rk3jawLyMZVdEs146wfohAb+uGx0QTpif47aveO7pXOPshR0k5M3DP7zywv1VVD5hU2QFJVXm9pIRxJc+7DVoKCXDK2+4+y1cIhpgnXlY6mh7kHjMgwvI1hNz4BgJILPyuqg+Lm4awyffG2ys0HZEd0lA9kSAbQWxWddGEoEtFfkXqLEn+m1bb5oi4pujpfKuFyH7de0/1PwTVI/9PrC7WgGOP9lXyd4MNI9c5xVzHoE4GznbBJN34dpDAxWM++emZLJw/7x0Hab1NKn1qjVFv93WX828/tO4IDRPB8iRkqU4DLygZxIMaELYkGL4Gcf1lUBnsfxg5yurI4FTIBp7p/cD82uhUv9Z/EGObcjUBhnX2EfI62VwT7rw2HQj9EcSLwPOojEefvShseqkRIAYt6mDT4xu3SEO8rI=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR01MB11835.eurprd01.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(376014)(1800799024)(4143699003)(10067099003)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?iso-8859-1?Q?QKitvP7B3NbQAxWnsFDEP5xMFXMasDsfU/dfRPU8wnZaAY7JmlwJyoxkQT?=
 =?iso-8859-1?Q?IxrHu7KlZTibwbMIk4KSWtIbr5KJ2+Osw7WLcyeZG8CUx9qSKs+Zz/+4ur?=
 =?iso-8859-1?Q?TuqxXTGbmWrr9tDqPXlFW1tE+BrMDn4U7lJ9K1Xig9FT8PtIHXrz9eYVYh?=
 =?iso-8859-1?Q?ikVbKkle9WX0MVwxt/OcKw7IsSM7IRVweKSiCbMyv3gCxdyRpRghk08WdT?=
 =?iso-8859-1?Q?vH7WH1Wpubw4L8DfLiqlnzHop/ige6d6uexIpkqU5JPWr9GxgvT0H1T3cD?=
 =?iso-8859-1?Q?fseMrUR/UurKbKEPiuadLmShBrreytB6Ln5hZ+ssE6HIGr27dwkgvaBFNp?=
 =?iso-8859-1?Q?n8nzaQOxjnh4S3wb001iH58G0vVNPCnlg84eGH99oCEWJe7po5DxOv2y2d?=
 =?iso-8859-1?Q?qi+2pqONsH0TmlZVfxOKGyNYe5e/8P6SDYQPF41lPhsviROBwml9iaf2K+?=
 =?iso-8859-1?Q?0jU12vN0wgqP54+yCecYxQaWu4G2GJ9JYVtg00HzqG1/6D7mwmBwKKiVcp?=
 =?iso-8859-1?Q?u94OibYFxaGnCjPGtKkUI4T8C5g7SbdtkxInztMZ3ml4nG2zRwKuLLMK3R?=
 =?iso-8859-1?Q?tH51PEocN1hAvTWSeHFul+q1Ilxr2cDMThhJCEAB6+WbtCR860LlMQZOmZ?=
 =?iso-8859-1?Q?kASIssiAMcXRxo+lXQIkpOTyCLeCkYyJXpFBLSqfegzUN06vdazYQZKGw+?=
 =?iso-8859-1?Q?dOrnVzfSl3VENXLKP7/fpdpSZeZXfsR7qdr6iyzCc0zg2QSlFnb74E08Nr?=
 =?iso-8859-1?Q?7aSolRjiHNnU8ZdF69h3BPsAp0VjkIQdD3iaRivAi3jeHcNJf7NDaMWuf5?=
 =?iso-8859-1?Q?jvMlZf7mtpQndVLs2YUasMy5onuk7IemwK4UaNcLSdslznMLM7NKO6QPHl?=
 =?iso-8859-1?Q?DXOMfJcnMSbLJV92YDiwspKF1D9rCdP7IDPhgDHYkWjqHh4rTsoA0cqxO/?=
 =?iso-8859-1?Q?hT49uZ0RRjioXC8vqlE+xqYfi3hU83cd+OHMTk6Dv/jnHCmRCRgA0ESEbN?=
 =?iso-8859-1?Q?0EoCX4l98kyzHGbsjWiSZKepVQnhNZPSOwjITRjCygQG32GbitBUdF4cAN?=
 =?iso-8859-1?Q?/veU/izzKUUdbaom8ONv/TsJGw/CRpc09b0kghmyWaZIE9V9tDCu1mgF8R?=
 =?iso-8859-1?Q?nLFg+4ema6FfA+gF4sun2+cYXecjVmjxiFOWOOOvZbXfyDW8wuMku7pVS9?=
 =?iso-8859-1?Q?aUCqmYGuZbzBipJ323ki2arccRiziIjd1/vHzdOSEyEKUgda3RIoj21fQJ?=
 =?iso-8859-1?Q?7+TYXgzVvRwpTH43upImFDycEKORLBkQnMFef1IF7xSshNY/babihWrNr4?=
 =?iso-8859-1?Q?aoLVTMEJjYMI2R18VAuuElgzw2TyjkrGypAE0TT3GCfSaX0I1UmIGqYV1O?=
 =?iso-8859-1?Q?Difc1y110GCSsoVV+zTWsDagP6TQ1a6KE1VbEMvI4/uDZW7xnPQIxm+SDh?=
 =?iso-8859-1?Q?CC4LRc7Ds2nmG0W+uT1j38bKN3yk2fsXgLLeAbCIO97qHk749CQqNS7Xv0?=
 =?iso-8859-1?Q?EjyzZGy/EusL5ymTiTQoJIi5cLsD13gSr9OCg6LAdXsc/5TOZkwLS7Mx76?=
 =?iso-8859-1?Q?/LQ8rldsv/xDBhLUMqU4vDuvzkKAuzcfq4SRv77VdpsT+SuJe48hGLaoV1?=
 =?iso-8859-1?Q?AoHUvKwQOkOJ0SaK7qliHHumCTfFY7yX8gP3HRwglkVuTylrPbkhGoiIMK?=
 =?iso-8859-1?Q?k35yFQZt0fPQ0BsTW3R1RdAy6lAgNbYPKY+amunVPd1CE4vHNUxEE2zFfP?=
 =?iso-8859-1?Q?a6qyo/2CavlIzDBhv3r3mUsUnrMNnj/yjJx+MQaVt4zAmSlOiNexkUycO4?=
 =?iso-8859-1?Q?h0+QTacz/7Ic/Kkd+mDWl3PtLiI47Bw=3D?=
X-OriginatorOrg: navimatix.de
X-MS-Exchange-CrossTenant-Network-Message-Id: d9a95718-6fb8-4b3d-6fce-08df005700c1
X-MS-Exchange-CrossTenant-AuthSource: GV2PR01MB11835.eurprd01.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Aug 2026 14:09:38.5928
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: c87b4f54-b992-4813-8f3f-4a876324197f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GQDd0TjTVVWMwRYDCJ8P7DPe744xNX4Zs/9EFtAlAzd8ZIu9Awcve/fSOn5fv/Azz+EwNy+eEQVwPGMonBRi0+oinVS5jBR5EmV15S2cUZY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR01MB6711
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 22 Aug 2026 14:09:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243975

--ch3fbihgwnnnv4dd
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v2] bitbake.conf: Extend distro feature usrmerge to merge
 bin+sbin
MIME-Version: 1.0

Mathieu Dubois-Briand schrieb am Sa 22. Aug, 14:16 (+0200):
> On Sat Aug 22, 2026 at 9:56 AM CEST, J=F6rg Sommer wrote:
> > J=F6rg Sommer schrieb am Fr 24. Jul, 11:00 (+0200):
> >> From: Randolph Sapp <rs@ti.com>
> >>=20
> >> The split of bin and sbin became more artificial over time, and it is =
no
> >> longer clear why programmes goes into the one or the other directory; =
e.g.
> >> forever normal users have used sendmail in /usr/sbin, and fdisk and mk=
fs
> >> learned to operate on files to create images long ago.
> >
> > Gentle ping. What's the state of this?
> >
>=20
> Hi J=F6rg,
>=20
> Previous builds showed some errors. Should it have evolve since that?

Yes, I think so. The bootchart2 errors were addressed by 2bf18f9908, and the
tcf-agent by 443f8c62ad.



--=20
Navimatix GmbH           T: 03641 - 327 99 0
Tatzendpromenade 2       F: 03641 - 526 306
07745 Jena               www.navimatix.de

Gesch=E4ftsf=FChrer: Steffen Sp=E4the, Jan Rommeley
Registergericht: Amtsgericht Jena, HRB 501480

--ch3fbihgwnnnv4dd
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
BgkqhkiG9w0BBwEwHAYJKoZIhvcNAQkFMQ8XDTI2MDgyMjE0MDkzNVowLwYJKoZIhvcNAQkE
MSIEIFAQ0Puz0XtApjWsFejQjIKA+bdMdsDvhOi6ibfzb4KIMDUGCSqGSIb3DQEJDzEoMCYw
CwYJYIZIAWUDBAEqMAsGCWCGSAFlAwQBAjAKBggqhkiG9w0DBzANBgkqhkiG9w0BAQEFAASC
AQCxKeIoVy7FwIWwI0Vwgoeyu6ItA0LP2w024M+T1AomdDIj8ZJizhQjT1R7fxUYvnpMSLKy
f3jCq6AB3ud3mpuYXVQ4NkO88+EjHo73ygdOLZDG9GOSolR+lZVwqCJQt3TBGeUGPDBdmM7m
8IJn1nB6pKRJfjDsodFqi0aGSssWRsNclfbmKjOxJvCvfEKPuVqxdRF5ft15gpOx2T01JXUi
WjDFA7VNzp68RtSu6lHppCVcl8Y3FjsVCj4WsabVcBT1DmE8yATIZxwxGE9SEBWZkb1tYmMo
YV3nrE8DnsmTip/P//Og5npA0Ow6SZ7l2x0lJL8J32V5kvupz/BaT96D

--ch3fbihgwnnnv4dd--

