Return-Path: <pratik.farkase@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29011E9D3FB
	for <webhook@archiver.kernel.org>; Wed,  4 Feb 2026 15:12:38 +0000 (UTC)
Received: from PA4PR04CU001.outbound.protection.outlook.com (PA4PR04CU001.outbound.protection.outlook.com [40.107.162.26])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.22642.1770217947651656753
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Feb 2026 07:12:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@est.tech header.s=selector1 header.b=QAwfXiCf;
 spf=pass (domain: est.tech, ip: 40.107.162.26, mailfrom: pratik.farkase@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AUWuAECsxQUOjh8y0MjtI1FxigFoSsg/0Ys2pS5F1HXpg/Jbnt3mKabyhNH7DJylHbCyPsbAb5qahoAKfP+PZrL9V/qziKanF4WV4dp7Use2HXhQBXjl3toLp1wzVTUGqX4rPp+sYZoaqcKfoz4ao80CE2C27L4gxqyfs/cW9n4DeHsPx3AUg4DddBxg6pDlhG5Er6zO6+titlIODQn0dLJBARr46aLHckNKXM3gz/jkYt2PtPmguBtahrrzCq2ObCPFq+dPNXEb+t6XiLzAclE3nC4sXpTBwbLa+GLrGLaFrtvHxR1RNU/uC9e2YZR4jaoDErsG30uHFPwz5eOwkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eOozvMas4+nXrFoZ4bD27b7yOXU0jFFf8WS//JCyCRs=;
 b=oOyLaqBb1XSC1YCM0gDDBOLTBxUevgncx+VwC0+YH5h/rXYylQgWPlvIquyTngX7Le/7OYXiJlPHmoxjEvTs5clszeZn/rUcInS5EmXP5YL+NyqZ3/QqAPYHt7Go1vk4N0svMxKBraReC9cagAuehJBWjNu4enjOrQHcuYWHU88ec7hRMEfg7TnJefauzlmrWHSJ7/y1sIC/Tj/3DPwoKy3Ue93I1Z77HtHbXgD9WvBlv8gH10UuwGRQGaZwwG6rfE+0xT21UgMDWLNAfJpkNKF2MLJoH86FBoauCA9IZexYxqhsQtMJYEn7+5/z6OcUu4MDKpYmXV5oLXUEOnoGlQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eOozvMas4+nXrFoZ4bD27b7yOXU0jFFf8WS//JCyCRs=;
 b=QAwfXiCfR+5VCsatiZ5w2X/QRyUuaTS8kkdN5LtVaULKT1F+hm3hYjrEcMdLtQzead3E/J9IrCCOusLc3xpXdyEZDAopPa3j7pqUzz3BrB+0iyEE9HCR9RmTFI1OKLHImkT+pTFZjH2O2rezZWlI0X4FVeq7p5784AyCErHAf8olN7sKufErlKGrT/Ql48Li3BLOLcENyEwtnn91jF97ItEcMR8TC3CB2MTTDvSJ7GnJIEiPe462/UqDMubqY3m1MRIYnafaPHnYKafVfSZPfW4zrpkHPxBsmHKL54KX5SCFRD7Uc374VFAmlT53LOyBygAZmUtnw7zF4ZeGg97eMA==
Received: from GV2P189MB3005.EURP189.PROD.OUTLOOK.COM (2603:10a6:150:26e::16)
 by AM7P189MB1025.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:17b::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.16; Wed, 4 Feb
 2026 15:12:23 +0000
Received: from GV2P189MB3005.EURP189.PROD.OUTLOOK.COM
 ([fe80::481f:ee0d:c0ce:36b9]) by GV2P189MB3005.EURP189.PROD.OUTLOOK.COM
 ([fe80::481f:ee0d:c0ce:36b9%4]) with mapi id 15.20.9564.016; Wed, 4 Feb 2026
 15:12:23 +0000
From: Pratik Farkase <pratik.farkase@est.tech>
To: Alexander Kanavin <alex.kanavin@gmail.com>
CC: Randy MacLeod <randy.macleod@windriver.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, "pratik.farkase@ericsson.com"
	<pratik.farkase@ericsson.com>, Richard Purdie
	<richard.purdie@linuxfoundation.org>
Subject: Re: [OE-core][PATCH v1] libconfig: add ptest support
Thread-Topic: [OE-core][PATCH v1] libconfig: add ptest support
Thread-Index: AQHckF9WTpead0Uhr0+hKOkrljk1fLVoSx+AgACHnwWACZn6AIAAQ7bF
Date: Wed, 4 Feb 2026 15:12:23 +0000
Message-ID: 
 <GV2P189MB3005D914A2CCB8FA282C3B44FE98A@GV2P189MB3005.EURP189.PROD.OUTLOOK.COM>
References: <20260128140635.43214-1-pratik.farkase@est.tech>
 <5f426a3e-4220-4274-b38b-e2bae5188cee@windriver.com>
 <DU2PPFB77F8FB197407E3ABBE614C6C569DFE9EA@DU2PPFB77F8FB19.EURP189.PROD.OUTLOOK.COM>
 <CANNYZj8YBnBb1dnU0jVUB1VGhSZxRWsLjq6qnwB1apHsVtL7_w@mail.gmail.com>
In-Reply-To: 
 <CANNYZj8YBnBb1dnU0jVUB1VGhSZxRWsLjq6qnwB1apHsVtL7_w@mail.gmail.com>
Accept-Language: en-US, en-GB
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: GV2P189MB3005:EE_|AM7P189MB1025:EE_
x-ms-office365-filtering-correlation-id: ea8401be-a21b-4664-4f23-08de63ffcc98
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|366016|376014|4022899009|1800799024|38070700021;
x-microsoft-antispam-message-info: 
 =?us-ascii?Q?Dql/lKutRqgdt1qUUaAkx8XJYKml2HNmyN9wF6RYDF2Bmqo48RSJxbgqudp3?=
 =?us-ascii?Q?5ZSzjzw833a+gAeZIwEdZG8GQuQLQSH/m0sGW6UjgD401dwr2NvxRuPS2hUE?=
 =?us-ascii?Q?rZK7G445q8UVKX/6GcXawSZki8gg3IKNvTdb+9CJ9MM/ysJKIkW/RDV0tAo4?=
 =?us-ascii?Q?okbC11bdJ5/qln8Hlmp7lD4iq/g/mH/P0BTOljAcwML8HsYBRDO8DRgztr6q?=
 =?us-ascii?Q?Sdz0M6CqeWx3EAsrS9S4dL4nrW4v867nwWAkWusooDy+OheUbYHP1owlOpY+?=
 =?us-ascii?Q?J59LQhmX9HBbzXQePWj82T9DLMWqhRVYgqXQAWSsocdHPN0lP0vm9u9deSi/?=
 =?us-ascii?Q?ix8tk4NBugZcp506RXAueDeMpo/vbYveAOLiQZnwOvnyxbusp8UwpOp3UGq+?=
 =?us-ascii?Q?hWgkTpAeuVvVaVb3gGESNbfLyC7AprdqKS78qJVj2qZFZLXDBLqbD+p0Nqem?=
 =?us-ascii?Q?z9pld8WPDlTdkoljhqLvV5mX3DCogWT2KRY8bQVeJc4lWFazRRjmvtX2G6La?=
 =?us-ascii?Q?0TXuBbLIBOGxc4RuseaGXhzsmb7v81HmfDc5RKOgdQG2OgD/XJtEMH7j0vOh?=
 =?us-ascii?Q?bXnTjLjIQQpBnalCVtrrB2osBI3pbKFEZiL0RfqPVWFOEzF5eKyV8RegiwXN?=
 =?us-ascii?Q?qu3wFmYVcMELkFeoZ7JkDUBwWL2ZBdqwKIcYLSixXnI6b0ZEUFdc6PDuyfU5?=
 =?us-ascii?Q?mrbHiQLOsASoshA8eQkekUPYyxo9xwE2mO/PGea0hz4EtYpPjAvttfTTMEFF?=
 =?us-ascii?Q?6uldlofIWsKUQAevyDYEF6pXGdgsVHnIZzppeqEE+DW/4ydMFlRzd8vJ0lh4?=
 =?us-ascii?Q?1l3xp6dsvsykZCJot21hMgSvmT3lxnINVURmq6FBt+VTMBsRd1fzfL482Qxk?=
 =?us-ascii?Q?lK7QYt6kas/MFm6Pj3u7duN8NfA9XSWtya8TeN+hAZ74Ox2quX5waJF33VJf?=
 =?us-ascii?Q?IaImhIVab6UrdY5MS4hCEImQHMNEVNTwRPuihm+Na1bPIxJKymv6PhbTUVAd?=
 =?us-ascii?Q?dUIvX7FI8T6vaUOTrUR8e4GlEdX8odPV5/1PJZPJTHpTfNyzLpJVmKjLMuCN?=
 =?us-ascii?Q?gPGBBQA0DHc2SnKRyxdDLK58hMZj0oW1xPgkCjn0Zb4WpIoxReueUA8EyRub?=
 =?us-ascii?Q?ixprhVhijbaVqA1I1GgimE+b3FSdN9YnGEm7d7IvXzVnmnttHOqyTahIzfyl?=
 =?us-ascii?Q?Qav2D1i5z4veAZFZF/wmIrdcproR1aoEIO2kRsESG/sl0d/J4uBFAFst+8HJ?=
 =?us-ascii?Q?1IYY7ip3As3LFX6eJVroRtWC/g1/skSkG8pyzE0clP5r6y2lAo8o40AtaOhk?=
 =?us-ascii?Q?oLAELLi78K098Rmmz6Ak+fvAUjIyvyhtWcjlzFgA9I+FwerCa2SqRCRbK+gy?=
 =?us-ascii?Q?HF/DamWBAZQQQxZP9p9rHhmyG9ZWKqNCUmF2saFwP9PYIYHRVXB2phAFA9wQ?=
 =?us-ascii?Q?Dsr78jglPdZ/zi6thfqAjU3X3sWEg43vtbqyVkST9lhGGRRctjsLMaIcmd0S?=
 =?us-ascii?Q?N+OCsIZ7Cet1C//Jxg73x66QskIg/l26xXp3V6mbfoTsP1ioBvjEklA3ZqxH?=
 =?us-ascii?Q?lTDMkiSOWqY/d8j/khw=3D?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2P189MB3005.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(4022899009)(1800799024)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?DICk5DaQZrx/sfBIHW8rBQv88lyxo8sh5OGJ3WfNmXh4GXwcVJ0zCovo1s8o?=
 =?us-ascii?Q?XdD/gscffNv3Nx+JHAuRQHqZ4tzRY1GFFdiQ9IFa10d8UQ/G6r95305cI/Wo?=
 =?us-ascii?Q?PQGNpmG0gDyKIAqeU8pHmdui9JgoRfPacDbX9LmEv/tCkG7XEt4MnEgwQ3yH?=
 =?us-ascii?Q?tlXxXV4qEwq7nZSmKEbAiLK/P9G4orSd4mjMqLg79GiCejeC1HMomsvE4LCO?=
 =?us-ascii?Q?2/N/LYFmmq2xFORhB1PdmpBzQrkRWb8xPMKZ6dnKlKmyLcVpBkHvyW8qMg34?=
 =?us-ascii?Q?pqSkU92OmxoIf0g6CQUZEgZC3Djn+BvlvKrcfDyikWjw7NX6F/3MRe3mOMBX?=
 =?us-ascii?Q?dI9CXIQGAnFq+juwIMQ9juk92mFlqJMV5TolxMiOT6t5NMlbiodzunjPAuGQ?=
 =?us-ascii?Q?1ozx6nPtyOxhTBDGE4pQ5kk4PIeT5MJouzz4MOS8Bz5UhLLe9eKiBwcwevwS?=
 =?us-ascii?Q?zPdo+8pJeUGQz+aQBF6ybWrqhOzec7/7wTEwU6dyTTnEwPqzbnaRyjLFHM3C?=
 =?us-ascii?Q?PMW43uoakDuYrzrOGXsNrA58TRaubijqDylBiw4/xBDYivFwiJ/AosBOl82y?=
 =?us-ascii?Q?U3gEiX4norTliXWxNyRnrnwlvXPS7rJBe56HAtelOW+gRPNsw/4uTfu6HqeY?=
 =?us-ascii?Q?rnMjKLCBAPGE5qW6nVIieexu0PGO+19pfZq4VsGJADQag9T38pJgfOwhDzfK?=
 =?us-ascii?Q?1usfRTFMDVCvx/uqnGE23IJD+WxHBemReSAnn/sI80FLvQHtgQiJl8QM+Aar?=
 =?us-ascii?Q?U/ZgckWHdQpb+z8/aFlG8J05AzdjwSUr/AjByWudpeuAJxOlEL/gP7uqcVTP?=
 =?us-ascii?Q?GwH5t2rFso7eTmT+VXdTCYzJCzZpQKTp9mq/sdf8Gf67p968GNVQxQsMjK4u?=
 =?us-ascii?Q?MsIbMlqNm8E9PKKz+ryqYXsu0FtuJEJkLXGSUKOxu+3H2ESBLmn3+RxNSmH+?=
 =?us-ascii?Q?0MUXvz0qbocekPzvrhexpt5GjIKIWcpE10QxuwFt3UVjoGR4msraL8tN7Ma6?=
 =?us-ascii?Q?ciQCEwrDYve58KLSLOsBoXo+tUdZxrqST08XqgMSptdTAQDVr0X00XFs3z/M?=
 =?us-ascii?Q?tFzg96SyeCEpP+/eLiUqcD1XEF/lSAIyN+uOh1j99kZzFfX8u7+COPsLuYPm?=
 =?us-ascii?Q?DG2qB+THWqY4YK4zt9H5sH4DCmlG1rDi2i2XAaq8G6LvzgXnfvgyqDQoPP2Z?=
 =?us-ascii?Q?dr+/5ZhEnXj7/zB9v7AvChTl3d5Gr0KZh7O0Jnjwo0y/yj7lZsYlM7K/HbNY?=
 =?us-ascii?Q?iBE1DgE1gJgxPZQyxGkSilB+a4QqgWuyU4qkl2uumr7Lgc5FzinGx8N6Tq1+?=
 =?us-ascii?Q?okv5oGak+GsDbGW50RC0xX0/fwiSUBQt1BY3/ld8kHH07yFsa2T+GRjm64/r?=
 =?us-ascii?Q?sju9Xa+H0hjR6wYvN/8OnIAxkUq9ulptp/cmTLMAdlbRh3wKxz8Dg1CDc8cS?=
 =?us-ascii?Q?NVeolQUNMBbuqcItAjZ/g/S+eRkpb2WuFsUlpF76It5OazLhAJuFf75sfPdu?=
 =?us-ascii?Q?rgIi2hWPrfCWxjzDsfVKbGpD7UkdCNujgTEgcK48Jy/CqmZuLWeOzuNaxsNy?=
 =?us-ascii?Q?FPOhZfl1zCV2I5X0h7AhSVUR3t7+OZwAmCm5Qht0pbDhdM57GSykV36/3N2d?=
 =?us-ascii?Q?AlhYOJ8C87dhZ9RZM6VrDMfjrR4q+9Pjn2Pk8mQAnly6cI1h58/1gF2OCC5F?=
 =?us-ascii?Q?E0HKV6YX5zXZehShSFvAPtkXmONPq5fqvHwrtAfGtoHRLbmaApkONKobNAvz?=
 =?us-ascii?Q?K2JC/HkCRw=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: GV2P189MB3005.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: ea8401be-a21b-4664-4f23-08de63ffcc98
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Feb 2026 15:12:23.2595
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JvpIQOIxsvmJCuRvl5yHb2yDZGpkoHpNqWcAI5s51q0RrH+7yhyLIXQ5MB3bM1m/LW4DVhBM3QLatAhd7bG9sw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7P189MB1025
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 04 Feb 2026 15:12:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230542

Hi,

Thanks for catching this error. I have sent a v3 separately.

Best Regards,
Pratik

________________________________________
From: Alexander Kanavin <alex.kanavin@gmail.com>
Sent: Wednesday, February 4, 2026 12:09 PM
To: Pratik Farkase
Cc: Randy MacLeod; openembedded-core@lists.openembedded.org; pratik.farkase=
@ericsson.com; Richard Purdie
Subject: Re: [OE-core][PATCH v1] libconfig: add ptest support

Unfortunately this was merged to master prematurely, and I just had to
sent a revert:

https://lists.openembedded.org/g/openembedded-core/message/230509

Please address the issues and resend.

Alex


On Thu, 29 Jan 2026 at 09:33, Pratik Farkase via
lists.openembedded.org
<pratik.farkase=3Dest.tech@lists.openembedded.org> wrote:
>
> Hi Randy,
>
> Good catch! You're absolutely right - the bash dependency was unnecessary=
.
>
> I've removed the RDEPENDS on bash. Patch v2 is sent separately.
>
> Thanks for the review!
>
> Best Regards,
> Pratik
>
> ________________________________________
> From: Randy MacLeod <randy.macleod@windriver.com>
> Sent: Thursday, January 29, 2026 1:26 AM
> To: Pratik Farkase; openembedded-core@lists.openembedded.org
> Cc: pratik.farkase@ericsson.com
> Subject: Re: [OE-core][PATCH v1] libconfig: add ptest support
>
> Hi Pratik,
>
> On 2026-01-28 9:06 a.m., Pratik Farkase via lists.openembedded.org wrote:
>
> Add ptest support to enable automated testing of libconfig
> using ptest-runner.
>
> Nice, thanks.
>
>
>
> The implementation uses libtool --mode=3Dinstall to properly
> install test binaries, avoiding issues with libtool wrapper
> scripts. Tests are built via 'make check TESTS=3D' to compile
> without running during the build phase.
>
> The test suite includes 16 tests covering parsing, formatting,
> binary/hex values, escaped strings, and various edge cases.
> All tests pass successfully on qemux86-64 :
> START: ptest-runner
> BEGIN: /usr/lib/libconfig/ptest
> [TEST] ParsingAndFormatting
> parsing testdata/input_0.cfg
> parsing testdata/input_1.cfg
> parsing testdata/input_2.cfg
> parsing testdata/input_3.cfg
> parsing testdata/input_4.cfg
> parsing testdata/input_5.cfg
> parsing testdata/input_6.cfg
> parsing testdata/input_7.cfg
> [ OK ] ParsingAndFormatting
>
> [TEST] ParseInvalidFiles
> [ OK ] ParseInvalidFiles
>
> [TEST] ParseInvalidStrings
> [ OK ] ParseInvalidStrings
>
> [TEST] BigInt1
> [ OK ] BigInt1
>
> [TEST] BigInt2
> [ OK ] BigInt2
>
> [TEST] BigInt3
> [ OK ] BigInt3
>
> [TEST] BigInt4
> [ OK ] BigInt4
>
> [TEST] BigInt5
> [ OK ] BigInt5
>
> [TEST] BigInt6
> [ OK ] BigInt6
>
> [TEST] BigInt7
> [ OK ] BigInt7
>
> [TEST] RemoveSetting
> [ OK ] RemoveSetting
>
> [TEST] EscapedStrings
> [ OK ] EscapedStrings
>
> [TEST] OverrideSetting
> [ OK ] OverrideSetting
>
> [TEST] SettingLookups
> [ OK ] SettingLookups
>
> [TEST] ReadStream
> [ OK ] ReadStream
>
> [TEST] BinaryAndHex
> some auto big hex: 4294967296
> some auto big bin: 8589934591
> negativehex: -1430532899
> [ OK ] BinaryAndHex
>
> 16 tests; 16 passed, 0 failed
> PASS: libconfig_tests
> DURATION: 0
> END: /usr/lib/libconfig/ptest
> STOP: ptest-runner
> TOTAL: 1 FAIL: 0
>
> Change-Id: Ibd69ccd63ce0168571d46a199c08be59ea748d69
> Signed-off-by: Pratik Farkase <pratik.farkase@est.tech><mailto:pratik.far=
kase@est.tech>
> ---
>  .../distro/include/ptest-packagelists.inc     |  1 +
>  .../libconfig/libconfig/run-ptest             | 16 ++++++++++++++
>  .../libconfig/libconfig_1.8.2.bb              | 21 ++++++++++++++++++-
>  3 files changed, 37 insertions(+), 1 deletion(-)
>  create mode 100755 meta/recipes-extended/libconfig/libconfig/run-ptest
>
> diff --git a/meta/conf/distro/include/ptest-packagelists.inc b/meta/conf/=
distro/include/ptest-packagelists.inc
> index 739995bcfe..7c5810f252 100644
> --- a/meta/conf/distro/include/ptest-packagelists.inc
> +++ b/meta/conf/distro/include/ptest-packagelists.inc
> @@ -29,6 +29,7 @@ PTESTS_FAST =3D "\
>      json-c \
>      json-glib \
>      libcheck \
> +    libconfig \
>      libconvert-asn1-perl \
>      libexif \
>      libgpg-error\
> diff --git a/meta/recipes-extended/libconfig/libconfig/run-ptest b/meta/r=
ecipes-extended/libconfig/libconfig/run-ptest
> new file mode 100755
> index 0000000000..d81fcf4def
> --- /dev/null
> +++ b/meta/recipes-extended/libconfig/libconfig/run-ptest
> @@ -0,0 +1,16 @@
> +#!/bin/sh
> +
> +cd tests
> +
> +for t in libconfig_tests; do
> +    if [ -x ./$t ]; then
> +        ./$t
> +        if [ $? -eq 0 ]; then
> +            echo "PASS: $t"
> +        else
> +            echo "FAIL: $t"
> +        fi
> +    else
> +        echo "SKIP: $t"
> +    fi
> +done
> diff --git a/meta/recipes-extended/libconfig/libconfig_1.8.2.bb b/meta/re=
cipes-extended/libconfig/libconfig_1.8.2.bb
> index 6e08a7b04b..9ae0ce2e6e 100644
> --- a/meta/recipes-extended/libconfig/libconfig_1.8.2.bb
> +++ b/meta/recipes-extended/libconfig/libconfig_1.8.2.bb
> @@ -9,6 +9,7 @@ LIC_FILES_CHKSUM =3D "file://COPYING.LIB;md5=3D17c8e32f0f=
72580cc2906b409d46b5ac"<file://COPYING.LIB;md5=3D17c8e32f0f72580cc2906b409d=
46b5ac>
>
>  SRC_URI =3D " \
>      git://github.com/hyperrealm/libconfig.git;protocol=3Dhttps;branch=3D=
master;tag=3Dv${PV} \
> +    file://run-ptest \
>  "
>  SRCREV =3D "a42cb47c1526a4f2ed025fcbb2289863375bc898"
>
> @@ -17,7 +18,7 @@ DEPENDS +=3D "bison-native flex-native"
>
>  UPSTREAM_CHECK_GITTAGREGEX =3D "^v(?P<pver>\d+(\.\d+)+)$"
>
> -inherit autotools pkgconfig
> +inherit autotools pkgconfig ptest
>
>  PACKAGE_BEFORE_PN =3D "${PN}++"
>  FILES:${PN}++ =3D "${libdir}/${BPN}++*${SOLIBS}"
> @@ -27,3 +28,21 @@ do_compile:prepend() {
>      rm -f ${S}/lib/grammar.[ch]
>      rm -f ${S}/lib/scanner.[ch]
>  }
> +
> +do_compile_ptest() {
> +    oe_runmake -C tests check TESTS=3D
> +}
> +
> +do_install_ptest() {
> +    install -d ${D}${PTEST_PATH}/tests
> +
> +    if [ -f ${B}/tests/libconfig_tests ]; then
> +        libtool --mode=3Dinstall install -m 0755 ${B}/tests/libconfig_te=
sts ${D}${PTEST_PATH}/tests/libconfig_tests
> +    fi
> +
> +    if [ -d ${S}/tests/testdata ]; then
> +        cp -r ${S}/tests/testdata ${D}${PTEST_PATH}/tests/
> +    fi
> +}
> +
> +RDEPENDS:${PN}-ptest +=3D "<mailto:@@-27,3+28,21@@do_compile:prepend(){r=
m-f${S}/lib/grammar.[ch]rm-f${S}/lib/scanner.[ch]}++do_compile_ptest(){+oe_=
runmake-CtestscheckTESTS=3D+}++do_install_ptest(){+install-d${D}${PTEST_PAT=
H}/tests++if[-f${B}/tests/libconfig_tests];then+libtool--mode=3Dinstallinst=
all-m0755${B}/tests/libconfig_tests${D}${PTEST_PATH}/tests/libconfig_tests+=
fi++if[-d${S}/tests/testdata];then+cp-r${S}/tests/testdata${D}${PTEST_PATH}=
/tests/+fi+}++RDEPENDS:${PN}-ptest+=3D>bash"
>
> Why do you need bash rather than any posix shell?
> We run the ptests in a minimal environment so if busybox shell works, ple=
ase drop this.
>
> If not, please either remove the bash dependency or explain it in the com=
mit log.
>
> Thanks,
>
> ../Randy
>
>
>
>
>
>
>
>
>
>
>
>
> --
> # Randy MacLeod
> # Wind River Linux
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#230125): https://lists.openembedded.org/g/openembedde=
d-core/message/230125
> Mute This Topic: https://lists.openembedded.org/mt/117507676/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [al=
ex.kanavin@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

