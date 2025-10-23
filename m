Return-Path: <pratik.farkase@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A6D0CCD1BC
	for <webhook@archiver.kernel.org>; Thu, 23 Oct 2025 15:40:03 +0000 (UTC)
Received: from AS8PR04CU009.outbound.protection.outlook.com (AS8PR04CU009.outbound.protection.outlook.com [52.101.70.52])
 by mx.groups.io with SMTP id smtpd.web10.24847.1761233992131264905
 for <openembedded-core@lists.openembedded.org>;
 Thu, 23 Oct 2025 08:39:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@est.tech header.s=selector1 header.b=nt/RA/kq;
 spf=pass (domain: est.tech, ip: 52.101.70.52, mailfrom: pratik.farkase@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=av2P2dkb862J1rnx/U21WZdpALBmbx7cA/ujQg5CqucV7FBuX46/qDhEysgmchzbeDDYabEZoU+IqDu4Te0Vvp8a2IAlz2MfoAGm2svio4iDQBkKDf0k6KSUMFops+QFTKMsK01XSP3WQjdhvJjL4/u+/kSOHpDOp1JPHtAQhHIjuDg0x93WoOoWFrFAiplQ2GX5XvPPfhDD5UUvencpMVrCpZzbaAoCkj9vq/MNXvO9x2EaS+HTDubeLJVntcdX3Vf8OXLR3gMZfDyHg9/3dRSgJVwFAkKJCZfMHEkg/HoDwMV93Tu9bmsUQ4jmZgzIgNT7rCsjAiW8vg5EcrXjSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qTxwjEltSv5YkxrCN7Ry16xmyczKZel1qJVDgzLyn18=;
 b=vSAhT16wovvZyii4ogPxKgyYlTJfxPv1icqFrutGfDCCJjV4QwDgPGtC+g9M4368B1UEgDssW8sZxyHUV7Ov42C4LlPUFjsKSEU1QqT3i8wQg31KhcN2u8G+NwZGZ22sTHrk5CHh8ogaebeUwUksvHgb6qSDc/IOpMVJHxPhPlYGJB4xb/wTjMVFCmXX+vLllSRlmx1SaUQ+8Eu8JwFkrSOb9D23D5QzHjSGxnnNE3C0oGPr2HJDp7nOgworPkrVqgUCkONNxS3bFNn+xax+BJ0ap8zGUxJTGXdMZo4yDmbwINKC0i6gQuKO0IGShLnMFnhO0lnHTBK1ZekWQrSNgA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qTxwjEltSv5YkxrCN7Ry16xmyczKZel1qJVDgzLyn18=;
 b=nt/RA/kqsJ1cZfZ9ObbaYVAb1zYu7A9kcA7eQcKDV9YG9BYUs5RXTY323OpuIafx2epc4pkXUCmeNGa7+T/xWJKXpvt40JVf46sUWuOpzCbMhcz21Tlfp0jSb3RvdX8cAD09W2YAJPits75nNJucHRPHSXTT5w7eUlcrnbr6wwl7OZ7nZogti/RuDfpppsd1WcuiloFuGm38hf/PLo53F5uIKY48EAMCAYoTh0RFEX3PmqhxAHLApZ7ozmLBPyb1WXqOtxQCXFcF7Oyo1PncSpREy8W3hnrlXOf/LQfA+3F0cTfq5jcXrFzzU/US/H1VZ8JwsJQ9Lw80rram/VI2Ww==
Received: from GV2P189MB3005.EURP189.PROD.OUTLOOK.COM (2603:10a6:150:26e::16)
 by PR3P189MB0938.EURP189.PROD.OUTLOOK.COM (2603:10a6:102:42::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.13; Thu, 23 Oct
 2025 15:39:49 +0000
Received: from GV2P189MB3005.EURP189.PROD.OUTLOOK.COM
 ([fe80::c13f:ef4:ecf2:85af]) by GV2P189MB3005.EURP189.PROD.OUTLOOK.COM
 ([fe80::c13f:ef4:ecf2:85af%6]) with mapi id 15.20.9228.015; Thu, 23 Oct 2025
 15:39:49 +0000
From: Pratik Farkase <pratik.farkase@est.tech>
To: Joao Marcos Costa <joaomarcos.costa@bootlin.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
CC: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Subject: Re: [OE-core] [PATCH] libxslt: add ptest support
Thread-Topic: [OE-core] [PATCH] libxslt: add ptest support
Thread-Index: AQHcQ2ZZYk7gkftOokCdQMxLiYHWcbTPptcAgAA3t5c=
Date: Thu, 23 Oct 2025 15:39:49 +0000
Message-ID: 
 <GV2P189MB30059C744414367D5F832D3EFEF0A@GV2P189MB3005.EURP189.PROD.OUTLOOK.COM>
References: <20251022151239.87981-1-pratik.farkase@est.tech>
 <e47700e3-0e68-4d0e-9d76-2e748fbb43ff@bootlin.com>
In-Reply-To: <e47700e3-0e68-4d0e-9d76-2e748fbb43ff@bootlin.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: GV2P189MB3005:EE_|PR3P189MB0938:EE_
x-ms-office365-filtering-correlation-id: 08e9be5b-233b-41a9-c9aa-08de124a6698
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|1800799024|366016|376014|38070700021|7053199007|13003099007|8096899003;
x-microsoft-antispam-message-info: 
 =?iso-8859-1?Q?wZCe0ZW75ULpz/xS/J6YmSIkFt8/DANLaz+1bO5cR9Jm3nTG5Bc/nA7N6u?=
 =?iso-8859-1?Q?yHGhSR/G9CgvNja2uJxvHHl4hECqw101AiVSpmLpiqrdGv1G9ZKzPwB6p0?=
 =?iso-8859-1?Q?t61SApONXlJE18jsVbZgr54jhDAVjN1etaVD83aU1hlmHorgwENHqdMTe4?=
 =?iso-8859-1?Q?SL+/s2Dj4XYmCKvCPIwGsHBhriQ833KVLoPJ0lGDFo2/Kt8Ewnro3vkM18?=
 =?iso-8859-1?Q?D++dCFrXPi5UQLtiAbOfWYFQnhQxp/wTgAsRyslAtFNQdtrtmJI60UQDEb?=
 =?iso-8859-1?Q?2ClMz+sVMO9OnCZM73TW9h/+18zXrwYIjWqhOrkpnJl/KF8ogKHiIyJ7el?=
 =?iso-8859-1?Q?PmVyna6ADWg9s0g1mWl+GIUhyYQ8VOAm8z28MyVGC5XdL4D0OGt2AeVRMD?=
 =?iso-8859-1?Q?0y9UqNHVT6QLJNvoxxSVwKlg5+nRSMAVSZEFw96FwmQ7voHOvW5PqxGfG0?=
 =?iso-8859-1?Q?iSpla03vJB2GBjPHSQAvDbgduSd60/sWp7D7TDXrVMy8SyXGwgLxfWdfnk?=
 =?iso-8859-1?Q?9pdc8UT7DX2V3AvqA4Fz1OGb2mwXPmkh9knYdZgrjdhsFVdqXwOpvp+j2o?=
 =?iso-8859-1?Q?OPFF4ZAsU7E7Z98nEQsOALdz7nGicile19nVBUeYIC0g7job3cl/V2uoCK?=
 =?iso-8859-1?Q?R0A60dxBsz3uVkdXUBLtAABBFfTk1RfIUDX7/coe0X+nYB7oEHCxMcLkrf?=
 =?iso-8859-1?Q?K2NjenR6cDfuymW87oxwCje9sNFq+3uaiqy3eOIbLYS/ekCXoAs7vpP8L+?=
 =?iso-8859-1?Q?kI6OEJZphAFYqn8yioVuKBOvRcMgMplcUe5u/YcmM/LfbrfOTFImE5D/5v?=
 =?iso-8859-1?Q?XGSfq5NWEydPVuIL0xVQrCh9P2UUPamUJ5ZIdHqtRC28I0lqhe0NlHMu9W?=
 =?iso-8859-1?Q?uq1Dk7nlU7KDrz9+X8jqH54hpucp/WDBiyAU2mQuOl0aS4S7KCRSc1911T?=
 =?iso-8859-1?Q?GEYgoTO94ZjzoOytk0gobMwjareKh8/qCcC2e9U+m8cMu6DhwRYq2szHHF?=
 =?iso-8859-1?Q?D0gSR3jKQ5XzZ9TTBNkas3OD3hBCkae+Z/quG3GRHum9vszX0kEg57hvvY?=
 =?iso-8859-1?Q?edDHwPm9Abdu+XeW+zw3PP+agOprAdG8v4QVPN8fK+I3aaDAWO0AsXSA/A?=
 =?iso-8859-1?Q?KWL28HqobtKayBGrQi6Pgn4c5NLzxofjWMvUUwJoGe9+kNGSplegdK8Jc/?=
 =?iso-8859-1?Q?qwMi9M3cmyQtd1lRj6pWl0zLU9B8ZFF0xR17Av0mFUczQXNLLfKuoRGmkC?=
 =?iso-8859-1?Q?dfFhjz4a39n7YoqloF7VjmD7aaQQFx4Y1kvJNsHZelCH+AHhogPX6p7vni?=
 =?iso-8859-1?Q?BOwojtv6wxZxMqJP2v3zYCokLy23u0n3R+cNIu6VIMbzE4m0+1blGYyKz+?=
 =?iso-8859-1?Q?LLpSw8wGqIeVHpQoqIUXNsYtR/S6xFCHVTdiYg1tlI+bUA65HN6A5qk3CJ?=
 =?iso-8859-1?Q?NkmAsnTMHb5aExK0y75TKwQt+JOCUuJFWV0cp8bNtaadmM3YSi7LmyuAsd?=
 =?iso-8859-1?Q?+xlVt9uLgL6140PM6RK91O?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2P189MB3005.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700021)(7053199007)(13003099007)(8096899003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?vc6tBQLlnkMysT+vEwuiNY9tSs1sGjgW+h4Gr/2ZaWB6msH75WDzDe31w4?=
 =?iso-8859-1?Q?OxHM1t1AbXaZ6mVG01eaA9pWYiTtuUiU2AtG/QpWrZdH0K+0VE5ENWPGiP?=
 =?iso-8859-1?Q?jo70ibiAkMleugbBieED/GddGKSoNpW7G56yAI94C71Hi2KLGffnh68zNe?=
 =?iso-8859-1?Q?R+qnxnK2eg/AvZvgVNfTVGB9o8Zeo2mfpdSS1qLhGKf69oNMMMFrd4fkjP?=
 =?iso-8859-1?Q?DwlX6J4gqKgSYYxUffRB/AK+Owqu+vIZAMfkrkROQOYrnlGvR/6M1RHj9b?=
 =?iso-8859-1?Q?9e957v6yKVU/qcmC1MOIHmPI5ewMz1fxMdDjaQIqWz3zwhxmdo6GmQ5wI/?=
 =?iso-8859-1?Q?OPdRK46izLimB+YUb/qiosQR2NMwNCyFkBhWbR9wdULM9GP3gu1LMdDbR4?=
 =?iso-8859-1?Q?MS8R/5GHzmp1PtkG6UKCbFv6qetocOaPb6qrvB/WZstsR0kNMr/+8Qc2by?=
 =?iso-8859-1?Q?hju/2oI7Ga9B5z8x2sXEqzmkVv2XeiL7aPYa8c38HMVmH3T2NiYL9I21Tl?=
 =?iso-8859-1?Q?U7yP1PiNCJNg43zwAbrUEL81Uf0hIkg2t5lYPJA+bMF18YZ9E26a7Gvg0/?=
 =?iso-8859-1?Q?C0spJzG03lBxIkg03ICpFejrnrffe+ZuQVIC+ZbMd1TY6FCLhQMlcHdmnr?=
 =?iso-8859-1?Q?bY2c/IwDbur2mf5HYVVvUAI40AsMzNvWLeuNP9uTSFu+msvXkF0JWoyG+P?=
 =?iso-8859-1?Q?LeSWw/9tqQr9QOAG5zPb1HC50qqE6lXkfh4a+ZWrOCio2y+k2gAD1oCQ7c?=
 =?iso-8859-1?Q?RPn1SS5m2rpiumFA/WkyNDh37QCuaUzRH5xfaatg5NgBYRkPTqGkf6v9mR?=
 =?iso-8859-1?Q?vgw8MrquvVcJuu27a8kHUi2QSqMUUrG5RNiSxH2kn2DPL+2znCxk6yE95i?=
 =?iso-8859-1?Q?e5SzJR3CHHp14c/9WmHl3eNLsr8AJBASarkBRCNjEeEp2tVWMZORn5WXj+?=
 =?iso-8859-1?Q?EISR1BOrw+nb4Ok4cyjXJLgYpTF+Wso+1SFAqRzdEGgliKOUpyaPhPwJgx?=
 =?iso-8859-1?Q?h0S6GjS+S2nvecp1Ox871IGw0hX8Tm/+900vK1KC9nEMGJpnWWAGxZaTee?=
 =?iso-8859-1?Q?l4WOpGyvt5efR9WUzrqdLU0HJS3BDS63gMdRCqb2rHaoZTxL6ELZ/RuVWE?=
 =?iso-8859-1?Q?ELklr3CiRGltRS/4Xae1iI5hsC8XBnWzmnVMTc6PjiR3OHUVW4l8mbAm9t?=
 =?iso-8859-1?Q?zt7WebRaSvM+HigdPY7Mw5ZEoRk4XKQ51ISnYS2MMgZqklbCAT3gb1/MuI?=
 =?iso-8859-1?Q?eP+P9AL842drfz2bLYgxuXhGMWh4eZExldPRPKBHo6x6w8YpCpDPcpdl6+?=
 =?iso-8859-1?Q?PJlbOBVpj7TtfTQK/0ujSV9ii9ydGaoeFh6S62WyRDMaMhkv6VRpXDG3JH?=
 =?iso-8859-1?Q?jWHmlVd+ycb8dgAl3VqEHB3wACKDOYZtPkTPiAigsSb9USiGmQu2ZvLfGv?=
 =?iso-8859-1?Q?absm03oF4gGgBciVP4d4UHvOBFQWREyqDXe9ksWyZ2hDqMvnt3h7g+iUiH?=
 =?iso-8859-1?Q?pRRQDV9zh9Vt28fSUYM6JAyfPtZPvnLCz7W/ui/fvV4XQUAc1hVih4Z/ta?=
 =?iso-8859-1?Q?gTtkm8Stad0fRubL/mkijRFGuxb6lAP4bmvzUg/sXExWdCLFot/ADyHWvo?=
 =?iso-8859-1?Q?FX7EpTxWB3JoeokzHvcOy3lJ7hiGrdgmVc?=
Content-Type: multipart/alternative;
	boundary="_000_GV2P189MB30059C744414367D5F832D3EFEF0AGV2P189MB3005EURP_"
MIME-Version: 1.0
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: GV2P189MB3005.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 08e9be5b-233b-41a9-c9aa-08de124a6698
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Oct 2025 15:39:49.0963
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jmZK19IZnrLEP0GPlkIGqcZx4Ya7USi6grzp692z+GQ2GICn0kO2NTxWvsUqwjyaWBBqGFESdcsbYLv9GhPiNg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3P189MB0938
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 23 Oct 2025 15:40:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225270

--_000_GV2P189MB30059C744414367D5F832D3EFEF0AGV2P189MB3005EURP_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi Joao and Mathieu,

Yes I looked at the logs and like you pointed out, the issue is here :

ptests which had no test results:
['libxslt']

The run-ptest was initially implemented to just run the tests using runtest=
 and not output the PASS: / FAIL: status but with v4 patch it has been modi=
fied to do that. I have no testimage setup with me to test it at my end loc=
ally, but try the v4 patch and let me know if it fixes the error/failure.

Best Regards,
Pratik
________________________________
From: Joao Marcos Costa <joaomarcos.costa@bootlin.com>
Sent: 23 October 2025 2:16 PM
To: Pratik Farkase <pratik.farkase@est.tech>; openembedded-core@lists.opene=
mbedded.org <openembedded-core@lists.openembedded.org>
Cc: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Subject: Re: [OE-core] [PATCH] libxslt: add ptest support

Hello, Pratik

On 10/22/25 17:12, Pratik Farkase wrote:
> Add ptest support for libxslt 1.1.43 including:
> - do_compile_ptest and do_install_ptest
> - test data installation
> - cleanup of buildpath references
> - added run-ptest installation
>
> Signed-off-by: Pratik Farkase <pratik.farkase@est.tech>
> ---

I know you already sent a v3, but as for this very first version there
were some failures detected on SWAT:

https://autobuilder.yoctoproject.org/valkyrie/#/builders/61/builds/2481/ste=
ps/13/logs/stdio
https://autobuilder.yoctoproject.org/valkyrie/#/builders/73/builds/2520/ste=
ps/13/logs/stdio
https://autobuilder.yoctoproject.org/valkyrie/#/builders/56/builds/662/step=
s/14/logs/errors

Could you please take a look on those?

--
Best regards,
Jo=E3o Marcos Costa

--_000_GV2P189MB30059C744414367D5F832D3EFEF0AGV2P189MB3005EURP_
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
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
Hi Joao and Mathieu,</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
<br>
</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
Yes I looked at the logs and like you pointed out, the issue is here :&nbsp=
;</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
<br>
</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
<span style=3D"background-color: rgb(255, 255, 0);">ptests which had no tes=
t results:<br>
['libxslt']</span></div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
<br>
</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
The run-ptest was initially implemented to just run the tests using runtest=
 and not output the PASS: / FAIL: status but with v4 patch it has been modi=
fied to do that. I have no testimage setup with me to test it at my end loc=
ally, but try the v4 patch and let
 me know if it fixes the error/failure.&nbsp;</div>
<div id=3D"Signature">
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
Best Regards,</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
Pratik</div>
</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> Joao Marcos Costa &lt=
;joaomarcos.costa@bootlin.com&gt;<br>
<b>Sent:</b> 23 October 2025 2:16 PM<br>
<b>To:</b> Pratik Farkase &lt;pratik.farkase@est.tech&gt;; openembedded-cor=
e@lists.openembedded.org &lt;openembedded-core@lists.openembedded.org&gt;<b=
r>
<b>Cc:</b> Mathieu Dubois-Briand &lt;mathieu.dubois-briand@bootlin.com&gt;<=
br>
<b>Subject:</b> Re: [OE-core] [PATCH] libxslt: add ptest support</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">Hello, Pratik<br>
<br>
On 10/22/25 17:12, Pratik Farkase wrote:<br>
&gt; Add ptest support for libxslt 1.1.43 including:<br>
&gt; - do_compile_ptest and do_install_ptest<br>
&gt; - test data installation<br>
&gt; - cleanup of buildpath references<br>
&gt; - added run-ptest installation<br>
&gt; <br>
&gt; Signed-off-by: Pratik Farkase &lt;pratik.farkase@est.tech&gt;<br>
&gt; ---<br>
<br>
I know you already sent a v3, but as for this very first version there <br>
were some failures detected on SWAT:<br>
<br>
<a href=3D"https://autobuilder.yoctoproject.org/valkyrie/#/builders/61/buil=
ds/2481/steps/13/logs/stdio">https://autobuilder.yoctoproject.org/valkyrie/=
#/builders/61/builds/2481/steps/13/logs/stdio</a><br>
<a href=3D"https://autobuilder.yoctoproject.org/valkyrie/#/builders/73/buil=
ds/2520/steps/13/logs/stdio">https://autobuilder.yoctoproject.org/valkyrie/=
#/builders/73/builds/2520/steps/13/logs/stdio</a><br>
<a href=3D"https://autobuilder.yoctoproject.org/valkyrie/#/builders/56/buil=
ds/662/steps/14/logs/errors">https://autobuilder.yoctoproject.org/valkyrie/=
#/builders/56/builds/662/steps/14/logs/errors</a><br>
<br>
Could you please take a look on those?<br>
<br>
-- <br>
Best regards,<br>
Jo=E3o Marcos Costa<br>
</div>
</span></font></div>
</body>
</html>

--_000_GV2P189MB30059C744414367D5F832D3EFEF0AGV2P189MB3005EURP_--

