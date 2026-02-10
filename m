Return-Path: <pratik.farkase@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8694EB26FE
	for <webhook@archiver.kernel.org>; Tue, 10 Feb 2026 18:54:21 +0000 (UTC)
Received: from DB3PR0202CU003.outbound.protection.outlook.com (DB3PR0202CU003.outbound.protection.outlook.com [52.101.84.44])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.704.1770749657176663403
 for <openembedded-core@lists.openembedded.org>;
 Tue, 10 Feb 2026 10:54:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@est.tech header.s=selector1 header.b=E6aaw1Xp;
 spf=pass (domain: est.tech, ip: 52.101.84.44, mailfrom: pratik.farkase@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nyZf1xjPjjV9I0RjlqqbZAGqJRGZQM4h3xm1gXtOCUadFuFHGy9StwOFecLDMAGBnOs4rIoFX4B7uFJ5Pq1HFAt9a3AiDtqg2gSuWH545pJ+sr5AZ7XKco+9/jAtYHrvQoW8Llqo5SA1hU6CLM2atlIhWNBVKFfyWNSDYn6JJBU9pb10+cmOIcBsh/3R+215VEV0hyD6CMm2KGN3s/ooB8GtSpPdY4nGD5+FKQnKwnGUgfcW1U7mqxUxNY4JWEs5kM5vUCkDFEhyd2GKMaDRdzQIYW55JDFyt4geXB0YMnNbQ4k1RwAztSc740cAap93cpfnN9CuZ6GgucHK6KWqdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UgQraoaVRPwWocJy8LQ0Oc8akRY05av5YDimgipCu8c=;
 b=vSs2LYaXQd27PdwWdkWqZ9+ZEsvcSsKyJfPhh1wi/pjrj/5h6fsp01gGAemBvTXuAdwBUFfXQWbI4ftQoDzWEO613rVPe+aIcgRZMwkMwlfd20r8uEZNNn58oBuWI5QbaI8MpgNRjIK18t8jXAOr8mkMN0bIT/KH5RtSK2xpL5fFwOjkQy3lxDWpmgpWiUiL6mTR6KZ2PLLwnq/fYrTkW7Vstd3tcRuO1iJCx4t2s7qjH9jXB9zTW/Mp0hu5K08aGCeQJOdQ3dT1s/2JrYFEQ4xYJ451/U+Nfreo3K40jUinpWjwfgqpJV1mMFy9K/pI9wddZ6m66rFbHMlZPCb5VQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UgQraoaVRPwWocJy8LQ0Oc8akRY05av5YDimgipCu8c=;
 b=E6aaw1XpS5S4uw7N8U0Yug6NJK+oufIRqOKquv/fcxjv7MXoSyr/u1U0W6ObOmNt+eDrQLPKlFMhehHwEDKgSSxuyIBnhxhrEsjyg3lW0jHOd09rnsLub2ZFgvwqT4Ciotm39GjGdDdlK5HATRcFcuW7U1CvzoGyiwJ07NqV03rDn9vU0cepdM5vOuCnbrxJ+yMTdlcRhVYVhJKCQWLpfa+HQ3o3yu3CCitGTJcwDyqIwUezGdU1OZPniW1Gf4qhxJuUH8pFKd1Pl7u268AigpxamCy/wGePhCPW3N5RHyutEFPVbBzMUodjK2VB56x/0hs2yTF43ReKylN5HmKjzg==
Received: from GV2P189MB3005.EURP189.PROD.OUTLOOK.COM (2603:10a6:150:26e::16)
 by FRWP189MB3207.EURP189.PROD.OUTLOOK.COM (2603:10a6:d10:17d::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.19; Tue, 10 Feb
 2026 18:54:06 +0000
Received: from GV2P189MB3005.EURP189.PROD.OUTLOOK.COM
 ([fe80::481f:ee0d:c0ce:36b9]) by GV2P189MB3005.EURP189.PROD.OUTLOOK.COM
 ([fe80::481f:ee0d:c0ce:36b9%4]) with mapi id 15.20.9587.017; Tue, 10 Feb 2026
 18:54:06 +0000
From: Pratik Farkase <pratik.farkase@est.tech>
To: Ross Burton <Ross.Burton@arm.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, "pratik.farkase@ericsson.com"
	<pratik.farkase@ericsson.com>
Subject: Re: [OE-core][PATCH v3] libconfig: add ptest support
Thread-Topic: [OE-core][PATCH v3] libconfig: add ptest support
Thread-Index: AQHcleaxPbMZ1IPe0kmxOtOn4835IbV74ZIAgABusxw=
Date: Tue, 10 Feb 2026 18:54:06 +0000
Message-ID: 
 <GV2P189MB3005FAFCA7404323AFA97B89FE62A@GV2P189MB3005.EURP189.PROD.OUTLOOK.COM>
References: <20260128140635.43214-1-pratik.farkase@est.tech>
 <20260204145811.19113-1-pratik.farkase@est.tech>
 <56068E4F-CD6A-4E3D-A685-52994C77FFDF@arm.com>
In-Reply-To: <56068E4F-CD6A-4E3D-A685-52994C77FFDF@arm.com>
Accept-Language: en-US, en-GB
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: GV2P189MB3005:EE_|FRWP189MB3207:EE_
x-ms-office365-filtering-correlation-id: e592cde5-0e74-40a6-d626-08de68d5c434
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|38070700021;
x-microsoft-antispam-message-info: 
 =?Windows-1252?Q?t6TCZKnfuQbpmZ6VQRGMcpPP4q3Ly1IJre1+bwoGSiUEyIJHvEphlYwE?=
 =?Windows-1252?Q?iDGfhZGqm2SGRs8P/f6OlW7F3i8sGTaOVLGQo0dDsTEgQk6zO8aThJrs?=
 =?Windows-1252?Q?5DV+Pimgn8YuUbTaI5lpgH5BYqNfXFF5xDld/G7AJq3iOwTUEKAMx492?=
 =?Windows-1252?Q?WzWQ7RLPA2kFWrOZX6dnUJr5LY3WZVJb3Rsvdu0y9nEFgl41DVFpigrW?=
 =?Windows-1252?Q?qUZesi5jIvaO8uOpxlPbhkYFVbiO27FjM3aI7Cp8f031+HiIdPHIJT+i?=
 =?Windows-1252?Q?DKCjjRNJYkOCi3p/+rhns4I6EERa632znlXLQghMYNFAGQWhK37k2LlL?=
 =?Windows-1252?Q?YbP4CVBFDl5xF5iR0m1yF6vvSmSr9OU+7PvHUnDNSBPdbZVRZySwR/6v?=
 =?Windows-1252?Q?daMxMongnupnTnEHmfWh9aCWAoU8rB20QsFhyxuEAtnNf02U0xHvyjhR?=
 =?Windows-1252?Q?d9fxkqw4lUoJL23CopVZBSguvVYKkspD0qGpq1M79oqlJmd+E5cRGVH6?=
 =?Windows-1252?Q?MX4zzNt60hB59zjnmyW+AG02/emHqqTEw80IyhTFU3L6q/8vp1zzh7UE?=
 =?Windows-1252?Q?0IZG5gn3XKeG2QRyxmP/T6zl9/VkDw+s0wFGx8uILidQ103ZGFohtIhN?=
 =?Windows-1252?Q?/Qo7Vd4kHwIddEqBMXCL77QHtS1FNLMZ+KSzrJkYGljylC+Wt4JM6wgg?=
 =?Windows-1252?Q?8M6hxRpN77b38yyIvrcqTq8OGiXlO7xbJFFqrMin8Y5lGLI2TQwNOtrP?=
 =?Windows-1252?Q?bekU1sgNv43kpaAOT8ZPJoEt4qH0Vp09fPRBEVSupU7YFO5QExeCWueA?=
 =?Windows-1252?Q?mFyGt6j/1Gzt5FApJkoLiJesX+NZXTr8zWHGhLuyh4HOStft+7pxfsna?=
 =?Windows-1252?Q?LxN2LWFBOmiqL972RfQvA0nbw1dH9IpGqJIZWtPox0jMPPnnBoYA66/S?=
 =?Windows-1252?Q?TD+L0619w7HGQ6cWdB7Z8vkhObPclv/ZoBbHTsJNgL+b/5cDeiYrlxaQ?=
 =?Windows-1252?Q?X1i6j1vMpy/uhHvmNfALvr/5m+lOWFMUKYsESAMf1kNdU1HWmDy5s0vq?=
 =?Windows-1252?Q?rCIGy8nZLbRQvpklZdhX2I2E67+s+XJiwWVKKxrLCBEaYmLg6cufA6NG?=
 =?Windows-1252?Q?cjJAWPwdfv7nluk2n2VfDhgGSmfbatowNjfkynFxTAmtrS4AXFwvsfeT?=
 =?Windows-1252?Q?QrfL8NzSXdmul62Gw8GUYgUXOb/e7GW86k9Q7BGml4+A/YZcpXJL2rqw?=
 =?Windows-1252?Q?D1CMxd+HEgK6xvUV+Kaiuh902DlSKMcq54cvtApe0CoDlzVnkVe5ApnV?=
 =?Windows-1252?Q?bMJRvjSvpnI7xWogQeVWCTXWilLSoCccc2RquMhMWpiqE14cURkxz9wU?=
 =?Windows-1252?Q?26o6tWrXwryG60FZNiUYn2FDR7wV9wvSOsnPoLCYV2PHDadmezLtJy0j?=
 =?Windows-1252?Q?QzdDERwqM2Ruu4ds8M2y7MeRDP0v1Rf0V6JB8/hRetB/vxevKdZtjMSs?=
 =?Windows-1252?Q?I2gS6ibV3uRlJMC6APpemvmvtYtUt1xvOzMBm9TegudRuJVSdrw9wQQ4?=
 =?Windows-1252?Q?EZumZcxLJ+GqcIDSf13h9TTLDMWx9XB6mcO/WQ2SP+RRVDnXdOURgQgb?=
 =?Windows-1252?Q?EsIdIJMwit8TmFnF3zzDkuA9Exkh3pV9VnfNZ2MiX4Z3DXXRDCAZqI9J?=
 =?Windows-1252?Q?sanY6Hzt9+ooshTsMpbeScg7kfiXmOOPV2EGvVWHPpElb5duymks6VXY?=
 =?Windows-1252?Q?FJ9tdH2DqLEm4XOcOcQ=3D?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2P189MB3005.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?Windows-1252?Q?XccPTwCrSySiPG6Athb8obNturyRPejUZ5yUtjo+m/etGXNOV+Pw4jU/?=
 =?Windows-1252?Q?l6OI0WAcUGSjYW8cM2keYLl85b7iPHJPMccv0kjW1fNQscX/3eNXK5D0?=
 =?Windows-1252?Q?Ud7hn3/rf6Nw79zbr9mMU21ofvsJAB0Ep3FqEs775yjGdVMRC72HdjdM?=
 =?Windows-1252?Q?HDj+sz/7ueWTrwCfZSU9n9/lFlbIuR1BjCHbVtr3a+tAwTGT+DOwftTg?=
 =?Windows-1252?Q?kqylcjnkqW7od1Io2X0DnNQlk+ld32lUxWDy1xtGfVAE/Jmhy5WgPES4?=
 =?Windows-1252?Q?RMNU+cNtw//QrzVP5pTTpxhrtu0c832ZZT96VZ74tqcEVNvAvPOlJCNg?=
 =?Windows-1252?Q?LWWdNTkn5Brg6+vb8pBpWO7xbF3zJMwM1YPxT6GTMBCFxN5gCgZK++Pg?=
 =?Windows-1252?Q?hBaWCFEsTUOpiIMNHzfy8dBMn8SAMEmAjRJVRRc5sPLY/4Oemdmc2pOB?=
 =?Windows-1252?Q?75VgTuYaTbXIHgAQRw94UmMV9OqdWubzuUAL7xprWs4pB46pIr34wbuk?=
 =?Windows-1252?Q?ttC+RgmOgblsuuMzpeoNSSiKxvcIV2sMD0eDBMLUWbCFsI43co92KRPC?=
 =?Windows-1252?Q?W8xnZUt5PhmRiBEcx7xyaeOoSTqs55VKvP7AUI1wFdE9E8LPau44pZi/?=
 =?Windows-1252?Q?tXeWz4rR//Ipu3GbQArrhxN5CCLUIkwexVOuni87dgkWrIiryvOFq9ZL?=
 =?Windows-1252?Q?faxcOLUrW+saUtd8y1mLMETba7XdwBYvFV8dr6JSIQaeHFDdEw5TUQna?=
 =?Windows-1252?Q?E+ZR7GfT47Mu3pPR6ApclaTXTvbufC5nUbrKVLqH8MsD6ixFcdd6gdHe?=
 =?Windows-1252?Q?CwFriumaI1ApeF+8wc7p1tw0dWp+TP7OwH4i//2ruURaSAIpNzypmbe7?=
 =?Windows-1252?Q?qaQ6bW6o1r8mx+xhgQuvWWESBYVqgQFcbZN87T3OQCx4GIws4BZTDxyP?=
 =?Windows-1252?Q?i22jLJ86NWGTn5+HPH33RdEXAWVXkOl+OpeXkpFkQo3SO3uAIvfI/VcE?=
 =?Windows-1252?Q?mPb8xtEKdCzep8DwsVhayVQS/lEq8y5N6DF9fS2B/PC/4NjExKWTBFHp?=
 =?Windows-1252?Q?l6HJeUDwqtKoq8lfZsqMhSoMY94tvkdNTx9MEd0PZ3fjGPxf1G/g2VBk?=
 =?Windows-1252?Q?TpyuFNJ1S1vsVLdl0/ZakZfqUvXX/RkDTdrhnI8KIx4WVUkPXVEkvUOC?=
 =?Windows-1252?Q?7sjNEJXkQqr2wIwnJ+BA3PGXE4hF2UsyOF8l9WCAtteTtY2b5ADzKg3i?=
 =?Windows-1252?Q?Mi+pyO3yn1NfllSEMsymF1zBMcsF03DZ3DV5sCVjsfHNYmmgcHQJ6Z01?=
 =?Windows-1252?Q?4Dmeh9IqDH7UsT/YkG2HzZj2E9uQI4aitKFdm5HRZMuAXLvUjS1+Gn69?=
 =?Windows-1252?Q?x3mNRf47Mp19L9NFXPYqeDvHQap6BKiotHBsj2W/lYvnpatQp67sblNM?=
 =?Windows-1252?Q?ITs4LZP81iUAvm1CHKhOMi0Wu+szWz8/MSblxbkMwNZsyw4Is/cyQKN7?=
 =?Windows-1252?Q?k31ORdtsdN6StrDmIoWB2fGYtVJUVlVOszTf6Thk9XootW23Z6LS5kGD?=
 =?Windows-1252?Q?Hr+0ok5SGfgDDg5WdftQgkk07EGZJt30lYvaHRkZCQo1yOlD7E4h2xPO?=
 =?Windows-1252?Q?fZHpQx5/ad7DLGtzde5vgEvIX1A4pTqI81YoIR/z8fEOQ5oJ9KVFMoK/?=
 =?Windows-1252?Q?72iC5bYIzBJ2QmZNa8mZxuJDUz2OQrFxM+E7FnZTLZM0cu5BCjg9eBy+?=
 =?Windows-1252?Q?ALkKHI2Fzi2rxeZEBxYFfz6JjP4ihET4jOCE0dSSzLiMu+guYFZiBPjU?=
 =?Windows-1252?Q?kS5CWqo4lYMKoXbIomxwFIe6ywPnFhDNfUBoNtcHKRZBotsL6U3/d6AA?=
 =?Windows-1252?Q?1sxEUCvBLODQ6g=3D=3D?=
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: GV2P189MB3005.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: e592cde5-0e74-40a6-d626-08de68d5c434
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Feb 2026 18:54:06.1799
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: bdeck1uBQolCKLlEe/WEDxEGRFUF4W2VPkk+cH/WLmemA/NWFxYawwHJnTDG+65fGLy3z+zEH8eYEy31M28bbA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: FRWP189MB3207
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 10 Feb 2026 18:54:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230928

Hi Ross,=0A=
=0A=
Thanks for the review.=0A=
=0A=
I have removed the conditional checks in do_install_ptest() so the build wi=
ll fail if the test artifacts are missing, as suggested. Patch v4 is sent h=
ere:=0A=
=0A=
https://lore.kernel.org/all/20260210184719.7219-1-pratik.farkase@est.tech/=
=0A=
=0A=
Thanks for your feedback. I will keep this in mind for future implementatio=
ns. =0A=
=0A=
Best Regards,=0A=
Pratik=0A=
=0A=
=0A=
________________________________________=0A=
From: Ross Burton <Ross.Burton@arm.com>=0A=
Sent: Tuesday, February 10, 2026 1:13 PM=0A=
To: Pratik Farkase=0A=
Cc: openembedded-core@lists.openembedded.org; pratik.farkase@ericsson.com=
=0A=
Subject: Re: [OE-core][PATCH v3] libconfig: add ptest support=0A=
=0A=
Hi Patrik,=0A=
=0A=
> On 4 Feb 2026, at 14:58, Pratik Farkase via lists.openembedded.org <prati=
k.farkase=3Dest.tech@lists.openembedded.org> wrote:=0A=
> +do_install_ptest() {=0A=
> +    install -d ${D}${PTEST_PATH}/tests=0A=
> +=0A=
> +    if [ -f ${B}/tests/libconfig_tests ]; then=0A=
> +        ${B}/libtool --mode=3Dinstall install -m 0755 ${B}/tests/libconf=
ig_tests ${D}${PTEST_PATH}/tests/libconfig_tests=0A=
> +    fi=0A=
> +=0A=
> +    if [ -d ${S}/tests/testdata ]; then=0A=
> +        cp -r ${S}/tests/testdata ${D}${PTEST_PATH}/tests/=0A=
> +    fi=0A=
> +}=0A=
=0A=
Same comments are before: don=92t use conditions when installing or running=
 the tests unless there=92s a very good reason: we _want_ the build or test=
s to fail if things change.=0A=
=0A=
(this one hasn=92t merged, so please send a v4)=0A=
=0A=
Thanks,=0A=
Ross=0A=
=0A=

