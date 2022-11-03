Return-Path: <kweihmann@witekio.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B2435C4332F
	for <webhook@archiver.kernel.org>; Thu,  3 Nov 2022 14:16:02 +0000 (UTC)
Received: from EUR01-VE1-obe.outbound.protection.outlook.com (EUR01-VE1-obe.outbound.protection.outlook.com [40.107.14.49])
 by mx.groups.io with SMTP id smtpd.web11.19816.1667484955401880181
 for <openembedded-core@lists.openembedded.org>;
 Thu, 03 Nov 2022 07:15:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@witekio.com header.s=selector2 header.b=gCDjqAjE;
 spf=pass (domain: witekio.com, ip: 40.107.14.49, mailfrom: kweihmann@witekio.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CvywXRLLLF0ub+2McJozb6eKAnQVEXaPNrgJnsm9EAejQEWBfdnp/izEJ1s3dwvRT5rX6QaYeLj4eMEtcho3nojkmlDZGypOR6liQMQnZmZLwdGXluTAeOw2fPcApyv26+DBQMbvpGI6QzXSgTp95CsxnZ5mYWeKqo2+SKcq5r3rsd0xzCpLPTm4kSc7Yib/HuJBKYKBknqd9EDusY4b8sffVAGvzaz2idUhyQawEYTbw+hiHo2jSRZShFQ3VkEfhzVNp5kkB33+K+hiWRCbcYo+YbHmFDTxfPCkm8W1dQrQZX8OuNDEMC468rBxdQ2I4rZREpJh7r7bJQFA0p+H1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SkR/EHlCZGYB4Zpp/96gzzJb5MuxY62c10MFPNtH6PE=;
 b=Nxp8KTr9Vbz7cEXAxFAPuyxnr+hsdfNPx/jTL+p4NBfWFOC9XKMXTDps6WV8KjCdW24PgXuZ4JXDL6WEceng5kokorHRlOoaLYi98d2uwKxkvfcTBZobTZsM3JzZyFrHhXER79YRQplRXqgkFWl1YQNirc5QIjN+hXOWSO6fgFRshjeG7OAhkzyGIPsT8a8Q6wcrc4rexDRbNrU5lc0GMrz4HVSgmzAHJbjpy8QuU5LGvSUTH5g1dR6fH/eGgag4GqXbcb4haTiy34PlIcUV8/U8EMA8+4b8uA9qx5q01xQkZo8Qcq9NK/YmWt4CzjAoMq2q4HYaK09kjdlwspQRfA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=witekio.com; dmarc=pass action=none header.from=witekio.com;
 dkim=pass header.d=witekio.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=witekio.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SkR/EHlCZGYB4Zpp/96gzzJb5MuxY62c10MFPNtH6PE=;
 b=gCDjqAjE8GimctvrPDMVECMfiPLYX9GWn5jNkfkNpseA5QNEZavKdTd06CH3BIoLXs9/SeF04f5GkOs1f3lDutJ4VEzLs907ECGR61HbNzR/zx6A81EzFpYZBsY31kqQCaYR0TANMf4PHYLbL9XoOAvCVubL2uYE0cnbd/lW9dz6aQt1lM1cc1zrUjp2/5ZIWEritRdFBsbm8tjxjjASko0GVfH5kE3xt2d+2kZvMy/mwa7lEdgGWJpjIwNlyTzYx1aaNQyTO76Mxgr3ZM2jDKTkScqNajBx5DJAhUb2SoZn+fTQN/tknsewKfQELd/UuS6l9rx2C0US23Gz2KKv0g==
Received: from AM8P192MB0963.EURP192.PROD.OUTLOOK.COM (2603:10a6:20b:1c9::22)
 by AM8P192MB0882.EURP192.PROD.OUTLOOK.COM (2603:10a6:20b:1cb::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5791.20; Thu, 3 Nov
 2022 14:15:52 +0000
Received: from AM8P192MB0963.EURP192.PROD.OUTLOOK.COM
 ([fe80::e098:20b2:952e:2fb9]) by AM8P192MB0963.EURP192.PROD.OUTLOOK.COM
 ([fe80::e098:20b2:952e:2fb9%9]) with mapi id 15.20.5791.022; Thu, 3 Nov 2022
 14:15:52 +0000
From: Konrad WEIHMANN <kweihmann@witekio.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
CC: "steve@sakoman.com" <steve@sakoman.com>
Subject: [PATCH 0/1] create-spdx: default share_src for shared sources
Thread-Topic: [PATCH 0/1] create-spdx: default share_src for shared sources
Thread-Index: AQHY745LJ+RuV/MnVUSvVnydZwxuig==
Date: Thu, 3 Nov 2022 14:15:52 +0000
Message-ID: 
 <AM8P192MB09633133388817BF0814341EA3389@AM8P192MB0963.EURP192.PROD.OUTLOOK.COM>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=witekio.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM8P192MB0963:EE_|AM8P192MB0882:EE_
x-ms-office365-filtering-correlation-id: ec395680-6c11-462b-791d-08dabda5ea16
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 zzrEoHxTlcObVskpnnKvM38Ibx+KS41+Nfmjbs9KppCL3Ad0FqxZ2oQAiwv8wSUPYkveF+tNK5vpD7K2TlFoIb0kWy9FwzrKbSv76cejF4IkC6JA6iaExRc08fES9YZSYyGGdRtHnTqjdcx+lF/ZQ4xN+qwzXwB1bEqpCSW6x9P2SvCGxxUWqJkgkYjVaQCChMzlb5lXq7ewyovY4AF8lCAE6AOE3sbSFmdpWlZzT/d2YjCnqhY3XbtUtolRnZgXckMEn5AV35mxmDxA2vxREdyGqB8xK0zYGoWlyfbeoGQLUsvWP6EcqSt23Pd8yVz/9GYBlCjeBltaWn9SBPWQpsVoHxwKwHdrqJDQ0ooyR3xQTUOF0xLjUsvyE0idHBSe3HY4J6yuHYrF23YTmgsX2kH4LpiQ1XLJK+JdPg/OdxH+/T6BkyBWsyGXZXLBetF1F//sZPn4i74ScsA8rciHlcw6nkPQVkb0E3DXJoatBkTCDXsnDMpBRPJg57pF9c+Ir7UZwULd7/BiK4OSV0iHO2lVPfUAbq4amN5LinYdlJHR4yDPqxRmmEcC7K84/FoCXRleMXo+lORPOtl80Ja44R65YH6pyrJ2H4FMaRvRzrbbIgY6N3wuGYOavmuwrYEwN5DeZ1KPOWkqrNlb5OtsiqMy4cLtOQvhSoNumwmhFSPFjRUs7jyODHBLG7l8Ds6gfkBSQ8ILO7Q1t0Oqh7KDSvs1VzBtPQQ9RXKmqz7A6zjjE9yckrYAMxp4r/Qr0unE00oLsjL2gk7QGwBgjMACHMi0b6RxKr0et/sWJXRxiIA=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM8P192MB0963.EURP192.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230022)(346002)(376002)(39850400004)(396003)(366004)(136003)(451199015)(19627405001)(66899015)(83380400001)(86362001)(55016003)(6506007)(2906002)(71200400001)(966005)(7696005)(38100700002)(38070700005)(33656002)(122000001)(26005)(9686003)(478600001)(186003)(64756008)(8676002)(66446008)(66476007)(66946007)(4326008)(66556008)(6916009)(91956017)(76116006)(316002)(8936002)(41300700001)(52536014)(5660300002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?hMiZeF8RS02Zk7aCInJiG6Rx8CSbgY+KLeacXTlHV6b+ZtbBWZUJCzNHjL?=
 =?iso-8859-1?Q?DhaqrGbbViwfsxe3tmcd5dRlXjCzHzYNNVQCeEBcjbo3c7nGuqW8W16D0F?=
 =?iso-8859-1?Q?VEaDQDauy7K4UOiFg3OCyHxrCmt6v1wh74JyFW0XGmjtMsNibhzBQNFNEr?=
 =?iso-8859-1?Q?bQW1JpMUZZQQd2dF/KQX9uqK6hLq706wNAflyZBVIprlY5keZRbHk7FdqL?=
 =?iso-8859-1?Q?8Yxm4mZj5ik0HAqgnVhaqdf6GgEbRyhBcSI7Sd+AAg1YpFInYF4cCen0JN?=
 =?iso-8859-1?Q?/CAf0kyo48L4hOzWT4OaFHntwAdJxipdG8h9aQ4WAf26/5huSSfFEd4BI6?=
 =?iso-8859-1?Q?YkhmfHFORHdmljL+NNVpIsHlJZKnmHmCrMDQDdOlo0SswLqVqymVC0G4Ig?=
 =?iso-8859-1?Q?H8KQMdUsSp853QX4YX/nMmCHk/sBvSi8ixsbRMzArrEsuMtSuDBQhr4Eb4?=
 =?iso-8859-1?Q?BEUbz/D+8/5uXNWnrYe+jLCiMStaWcyFOAdnEfzhL0PBtvgjCgDLeVQs3C?=
 =?iso-8859-1?Q?PDTn+UpwaA1f3WbLOEIsJpRebsRFeWT6Zb1zCU1nn7LiV9r9dyD+BcorHE?=
 =?iso-8859-1?Q?8kICoFyuuTxeULCIizQjyvaLfvyZDrKAUPhcGMvpPAtjkqPWfcgMO15yei?=
 =?iso-8859-1?Q?OJz3AgC6X4ZHgY7Vg9tcXBRUllwkS+M/RLTTFq5y6ALuGSu3k8IUEo+Gli?=
 =?iso-8859-1?Q?TVllgwIYJnmi/DFGHQoM8gNHHRf0nXzgTcMiUbIx9OD481t5KCKkhshhXI?=
 =?iso-8859-1?Q?rSRMZ+F39fN+pa6FKAf0O2yrccEZpXOhbVGHkYS5LSFbIwXyWtgNU059N2?=
 =?iso-8859-1?Q?fzgQOLtFxTh0ayO4b9nGdkjVP/JsKQuCcUxJFfRk+aDzCqvFP4l8Jv7omH?=
 =?iso-8859-1?Q?rigePEkyH3bI2M6p3rfOq67tvIhq3WWRBbKxfOTGGa0sS168AHiM3sM2F+?=
 =?iso-8859-1?Q?O4QuhFpEtXCXw2LtMeHoBkw5vMNw7EBnWNGJwevNV74aY7lgdCzrx/QD4T?=
 =?iso-8859-1?Q?0EdCeROvP4oA5TioBVC8RWbbwdwjlp2ZM/UFu2PeJpesNtfTyXbFXX9gZ6?=
 =?iso-8859-1?Q?Bu+FXjCHg4qNaQpyQCf4GJADjpXvz/R5au/7zadOeuNY+s7dHiPSdztzp6?=
 =?iso-8859-1?Q?OKsuIcBrzC/+6nwdr0rdV9FMDi+Pm6gkEvjG61mM21sDmUOwfvufeovsXj?=
 =?iso-8859-1?Q?7U99NDFaYT1s0gNPxnRt0C5WeSm14ZI9orWRLeAcNrGY6VMJOGXjoLPPjD?=
 =?iso-8859-1?Q?/PrH+zoNpCtcqpqMl0vg09qcZLp8yWBIANjYjiyLrdjB+2JUJDcVvBeQAG?=
 =?iso-8859-1?Q?ER2m18MAjjz2zOepNaIPyfOR+SZW3geUt4p9L8RPGCXW7+6ncdRBBwMyfS?=
 =?iso-8859-1?Q?1eAG9qipDnFFNFNV5f2jhs5fsnDeSkpIfVINBwWqBgpUTRA0kbjoELHetO?=
 =?iso-8859-1?Q?av86QxsBjmPSvnMa+uSKKGA7UYEYy5x4XvnezwAlqExad577gH7OytlsIv?=
 =?iso-8859-1?Q?p7rnt41PO4h4/A9H+n/ScoMdurpA1AoL8D7qk+KhgFAkyuTMSYeFCzT3B5?=
 =?iso-8859-1?Q?5zWdjsDve/EJ+E8wN9GY/WdGoaLYB4uqtyxsgbcmZDveuvp9mTulOZNkkL?=
 =?iso-8859-1?Q?ESOlVlOx16qWVG2zaTAB29Og9q73rSGWZM?=
Content-Type: multipart/alternative;
	boundary="_000_AM8P192MB09633133388817BF0814341EA3389AM8P192MB0963EURP_"
MIME-Version: 1.0
X-OriginatorOrg: witekio.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM8P192MB0963.EURP192.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: ec395680-6c11-462b-791d-08dabda5ea16
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Nov 2022 14:15:52.0785
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 317e086a-301a-49af-9ea4-48a1c458b903
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: nkNWFJliNG0Euv6Om3RdYkf/282caCIpq5y/7C/rtymb3nYHAs9E/emSFuReWeFEDO5d5AxcihLfsGyoBxgvnw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8P192MB0882
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 03 Nov 2022 14:16:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172630

--_000_AM8P192MB09633133388817BF0814341EA3389AM8P192MB0963EURP_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

as it's practically impossible to send an email patch from corporate
environment, please find the following patch at the mentioned
remote location.

It would be nice to have that backported to kirkstone as well, once merged,=
 as this is
where I encountered the issue first

The following changes since commit 482c493cf681121fb041f98066a42af14145ff9e=
:

  valgrind: update to 3.20.0 (2022-11-03 07:46:47 +0000)

are available in the Git repository at:

  https://github.com/witekio-kwe/poky spdx-fix
  https://github.com/witekio-kwe/poky/tree/spdx-fix

Konrad Weihmann (1):
  create-spdx: default share_src for shared sources

 meta/classes/create-spdx.bbclass | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)


Witekio GmbH is registered in Frankfurt. Registered office: Am Wartfeld 7 -=
 61169 Friedberg. Registered company number: HRB 95432. VAT number DE287400=
071
This message contains confidential information and is intended only for the=
 individual(s) addressed in the message. If you aren't the named addressee,=
 you should not disseminate, distribute, or copy this e-mail.

We continuously commit to comply with the applicable data protection laws a=
nd ensure fair and transparent processing of your personal data. Please rea=
d our privacy statement including an information notice and data protection=
 policy for detailed information on our website.

--_000_AM8P192MB09633133388817BF0814341EA3389AM8P192MB0963EURP_
Content-Type: text/html; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
1">
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);" class=
=3D"elementToProof ContentPasted0">
as it's practically impossible to send an email patch from corporate</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);" class=
=3D"elementToProof ContentPasted0">
<div class=3D"ContentPasted0">environment, please find the following patch =
at the mentioned</div>
<div class=3D"ContentPasted0">remote location.<br>
<br>
It would be nice to have that backported to kirkstone as well, once merged,=
 as this is<br>
where I encountered the issue first</div>
<div><br class=3D"ContentPasted0">
</div>
<div class=3D"ContentPasted0">The following changes since commit 482c493cf6=
81121fb041f98066a42af14145ff9e:</div>
<div><br class=3D"ContentPasted0">
</div>
<div class=3D"ContentPasted0">&nbsp; valgrind: update to 3.20.0 (2022-11-03=
 07:46:47 +0000)</div>
<div><br class=3D"ContentPasted0">
</div>
<div class=3D"ContentPasted0">are available in the Git repository at:</div>
<div><br class=3D"ContentPasted0">
</div>
<div class=3D"ContentPasted0">&nbsp; https://github.com/witekio-kwe/poky sp=
dx-fix</div>
<div class=3D"ContentPasted0">&nbsp; https://github.com/witekio-kwe/poky/tr=
ee/spdx-fix</div>
<div><br class=3D"ContentPasted0">
</div>
<div class=3D"ContentPasted0">Konrad Weihmann (1):</div>
<div class=3D"ContentPasted0">&nbsp; create-spdx: default share_src for sha=
red sources</div>
<div><br class=3D"ContentPasted0">
</div>
<div class=3D"ContentPasted0">&nbsp;meta/classes/create-spdx.bbclass | 5 ++=
+--</div>
&nbsp;1 file changed, 3 insertions(+), 2 deletions(-)<br>
</div>
<div><br>
<p style=3D"font-size:8pt; line-height:8pt; font-family: 'Source Sans Pro';=
">Witekio GmbH is registered in Frankfurt. Registered office: Am Wartfeld 7=
 - 61169 Friedberg. Registered company number: HRB 95432. VAT number DE2874=
00071<br>
This message contains confidential information and is intended only for the=
 individual(s) addressed in the message. If you aren't the named addressee,=
 you should not disseminate, distribute, or copy this e-mail.<br>
<br>
We continuously commit to comply with the applicable data protection laws a=
nd ensure fair and transparent processing of your personal data. Please rea=
d our privacy statement including an information notice and data protection=
 policy for detailed information
 on our website. </p>
</div>
</body>
</html>

--_000_AM8P192MB09633133388817BF0814341EA3389AM8P192MB0963EURP_--

