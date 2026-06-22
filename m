Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB9F7CD98F2
	for <webhook@archiver.kernel.org>; Mon, 22 Jun 2026 14:05:17 +0000 (UTC)
Received: from DU2PR03CU002.outbound.protection.outlook.com (DU2PR03CU002.outbound.protection.outlook.com [52.101.65.56])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.43978.1782137108193077371
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Jun 2026 07:05:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=FMUaoozs;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=FMUaoozs;
 spf=pass (domain: arm.com, ip: 52.101.65.56, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=QlUlhOCYWjXqmUcXKxNfDaMXfTrJ5UJ+dWNdCiq3aH0mGRAchF6XsNnZLCNxlVORCDykK3Lf1rUckLIvwu5CsirCmkTPIHtQm4XJDY3S3Wr+r5ngkUiEdrmemwT8IZvcLDCxupUyjTd+hrPOMCuVLCzuRqyREGcMtja6juKyCMIQZSDIbVrT8fXJ1TIX6gl5NjvXY7MFYH3thytHNfTZpBwlWKthXUCDO9gs5Nop1fNpcoBY5is0NgJa+xG2b7lLNVEkkb91v9fpoCBrOpE1XuUNYXHv1S1EgAoeDffsRiFYgHPy9FR6eSn4aEOOfbAZOCVl/vVwedSvIeaA4GL6RA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DiaqvgeSpSlPY4SaL4fT9c62kFzvuh53kuObyAQsCY4=;
 b=RkrBfgCzd+H4i9jT92PKXZcY0F26y5HwQpZ37rBCAbJ0ikNkKEHWbqbtczNvXWQPUPFKObZkn22lF1CV/rOCndlNBHv+CPoT2rFZ4TtgwCb2gS0zaFIqU+IGBt+KTmYE2QEAASl1+51uxVxOHVxodDR6RQOj0Cyscd/XI092K6/vYq8E0L62Q7MOauuRvCAZFCFpFu5GI+tOHfg6EJrxRSoAZe4SOVJrOsCR5ROq8oMN/GpURduZ5CTs6fGBl9hrUBMazvQxQPtBfuJnC+hvvT8LszbyBjioz1K5KN+RsQDFmx8l5Jltg4nGSP98zw1MiI6pnu/Dxf3yKj7r+ZPSVw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DiaqvgeSpSlPY4SaL4fT9c62kFzvuh53kuObyAQsCY4=;
 b=FMUaoozsY21iTmkQk+i2TKeaQfWpo3BJtGZ/Mh//TLC+T/T/PXGKKGD/re21ml3g82n2mTARzv0OY5xfV5iIFcAfSw6EyjtpJAdn1tq7HRpPAtRarLQ2jJp4tqYR0V2VQxxtXd+efqFTR/CnfgCy9wzAJuMm8GxIOgthvfXznUM=
Received: from DU2PR04CA0306.eurprd04.prod.outlook.com (2603:10a6:10:2b5::11)
 by GV2PR08MB8099.eurprd08.prod.outlook.com (2603:10a6:150:7d::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.19; Mon, 22 Jun
 2026 14:04:58 +0000
Received: from DB5PEPF00014B8D.eurprd02.prod.outlook.com
 (2603:10a6:10:2b5:cafe::4) by DU2PR04CA0306.outlook.office365.com
 (2603:10a6:10:2b5::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.139.14 via Frontend Transport; Mon,
 22 Jun 2026 14:04:57 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DB5PEPF00014B8D.mail.protection.outlook.com (10.167.8.201) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.159.10
 via Frontend Transport; Mon, 22 Jun 2026 14:04:57 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=A63eWGqD+m4Er+cc83YIonL9O7C61yMJsJrCFLJIMBhfCAqPZrBcUc+vETxwzZ2i+DfcGHTDRUs0WcrHirQS6EkGsEAmofmJfNTsNBOf4y0UaFz1/T34dwMM+Ln9GpUParly8N6jsY+D7tpQzi4Cboq5MVOoiCo2S6aRHH7g+DHPhdBfa9BPx9bMME6GrIWUV6xagDwQzib0XhQxSeWq/gbKXmsuISdTeNtA5YV36RVE+nW0/EQnlRCFvuDZjX8Nmjn6G3rnMqE7vHUi3d9r93tKX2Mn1D+wvGwlXSrOaDZmKe1f1pa6ORtcB4+aG51RFY5eTzybdKa/PTpX3iGq8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DiaqvgeSpSlPY4SaL4fT9c62kFzvuh53kuObyAQsCY4=;
 b=SKOAOcStz0v+zPXFtozHeSve3L2ySuj0tWtupATRnMEaU7EPMNitN55gwVYZr9a+8TQ2yrJFxpzkcXU96S+5LI3z7sh32WZTZFiirMpoajUBNPyRLXSJfFDsl6rhw6CW4dKe0xuiF9t7jRn3E8wuQsSFF2N9621KGe30+tDWU0a9VUjTwTo2kjlyHbbihssos78YaHRKIV6y7fivPyMBxt/f+SBMopqhLRewm/VRdSONsCdhx2+gPPThrxqjQG7Ph5sODiM2c4L2qiTmxaHDnoGy84iH2Mv2EnqrxVRmNDJGUi0p37147QN6dGSWM/+rpxMQNLhc9jBoGYmsbsn7WQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DiaqvgeSpSlPY4SaL4fT9c62kFzvuh53kuObyAQsCY4=;
 b=FMUaoozsY21iTmkQk+i2TKeaQfWpo3BJtGZ/Mh//TLC+T/T/PXGKKGD/re21ml3g82n2mTARzv0OY5xfV5iIFcAfSw6EyjtpJAdn1tq7HRpPAtRarLQ2jJp4tqYR0V2VQxxtXd+efqFTR/CnfgCy9wzAJuMm8GxIOgthvfXznUM=
Received: from AM9PR08MB6258.eurprd08.prod.outlook.com (2603:10a6:20b:287::19)
 by AS8PR08MB5912.eurprd08.prod.outlook.com (2603:10a6:20b:29f::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.13; Mon, 22 Jun
 2026 14:03:54 +0000
Received: from AM9PR08MB6258.eurprd08.prod.outlook.com
 ([fe80::171d:1f8b:720d:7a1b]) by AM9PR08MB6258.eurprd08.prod.outlook.com
 ([fe80::171d:1f8b:720d:7a1b%6]) with mapi id 15.21.0139.009; Mon, 22 Jun 2026
 14:03:54 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH] libjitterentropy: fix license statement
Thread-Topic: [OE-core] [PATCH] libjitterentropy: fix license statement
Thread-Index: AQHdAkp3LTn7Eq3yR0SeMvFrRXhXTLZKm0mA
Date: Mon, 22 Jun 2026 14:03:54 +0000
Message-ID: <CF3D22E9-50EF-4B7B-B620-A6977A2D6842@arm.com>
References: <20260622132413.2346201-1-ross.burton@arm.com>
In-Reply-To: <20260622132413.2346201-1-ross.burton@arm.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3864.600.51.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	AM9PR08MB6258:EE_|AS8PR08MB5912:EE_|DB5PEPF00014B8D:EE_|GV2PR08MB8099:EE_
X-MS-Office365-Filtering-Correlation-Id: 026a3d4b-a835-4524-d8f7-08ded0673e0c
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|376014|4022899009|1800799024|23010399003|366016|11063799006|3023799007|56012099006|18002099003|38070700021|22082099003;
X-Microsoft-Antispam-Message-Info-Original: 
 C+yFwBYpwkEJGRBvgACEljVsyT0ILF4nmSun93ih0ndS4VeYCHcUW/eSd3dtf7KX5TNBYkivPdBiPbq7oza8chLr7q+NJNqEKSSEr3O/CPsS6jjgQv2tCwIbKsKtxkxp0XlVtdBv6RY/b2hMnOPVEjm6kgbrsSQVOywLWDsgZXNvYSFRi7gwBoZqYShInx4Ysn8hGLaYmBbB0P4rks1ss//5xfUweAMSxQKNDMkjyqrS+2MT5UY8mO1lC9B+K8+aDLpDR2CJWBZz4XUQup+NDS6Es69r+EaxzJ0mQXEZs0LaxFdgxSPQacRn0eU43fFc6vpubdpbKUhGk1ypsbQege0lXTXQNZmZB63Yws0hKH9IcJEpkvzoce+LV/3W8DCp/GKiiVKGoGuGXa5pG8CrS32sk0lezLmyYnflrTNcf37rrXCmHcfAFMgxUvqxOienFLanxtaPZndZdPa0BttKQQ2gudymcMmE9079xu9N5MOfGiDBfdd63Hw0o0yCgg2H+aSDfOxm4C0ze9yNmL6aasA6u/zHwjhek1YeocpI0pYwe4WIwURH1+gF35hxnyJRt175xH+zl06TnXKRUJythmYVBOmLNYp0tcpL7QqO3LvfH2B5FprxyudOFCpXlncVmoGLyAr2BHB8xUauwdYnbcnH6I+Hml9WIJeyQ6qwK8k=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR08MB6258.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(4022899009)(1800799024)(23010399003)(366016)(11063799006)(3023799007)(56012099006)(18002099003)(38070700021)(22082099003);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <838415CD97918148AB2EC93AE3FE57A7@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: 
 WCXnQmJI4rlsGSaSUKGS8M4UFrKD2L5CN20h0NipqdZcF9CWuSrs+01QZhZZc+NyrOLAlFm7IIErGEUIIvMqscUQHc5f1E0vTzY/b7NwlI/v9iY9KhwF2CiJ2s1qkrXjqQhXFdeBxlN1SpwgN+is62bHR2QP8Hgn6EjoegzxFC3/YwmT2Uo46N0OAj56W7himY/nShqhJznm+o32vreD5KiPc9es21/x0FLBfOaAo87oMnqH11ZiD+Ys05pv+3Dqvg4A84UARtviGKFXdg/qqfHIPYzTvmdhEhnBgrC9Co+lp7Izh+oRfDn4kF+PqNF/gf9J/fG7fOUx0Y5iLYVP+A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB5912
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DB5PEPF00014B8D.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	844fd2da-4823-4af5-c6cd-08ded0671897
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|23010399003|14060799003|35042699022|82310400026|376014|4022899009|1800799024|36860700016|13003099007|18002099003|22082099003|11063799006|3023799007|56012099006;
X-Microsoft-Antispam-Message-Info: 
	NY06J5x4Uv8EZiImUEB5rxZ8sCh6Nu04Rm3sL8OA205U/RfmsgxhqaRt/IBHte3QvI4LLLuxpxs4xFauVHGWJxKX4qOgRddrnLXx6peSGruDgVdfX6noh2dOtQHK4LQMg11xidoyftEFyGGxW2MEY7wGh+hlEJj825knBHljSgB9yaDyRugsZ/+IkUNupI7+KZgltCNigIa5FxDQQe6Mkz8TTznyA7BRshmpMQhGgx3huOMRhtwAg//pK8kiyUz772RqdqA1XTIntwuQ+BDppUdgdbFkisX5G7qZ+jJHw4kP/2OIRKBtUX2gS/i94n1o8SGScDyFwxFcVbX2BuqeJ0KYO5tTHL/bE1hc87+vFLcuOQvUTi0QwgYKgh9kIxX7hQamihD2SssPt9VntWzGZKokGL/MTMQ7XoMno+fvlfHhADMsIBNBlKgt+cVWJK/s39QhoNVzhgyhV+k7Za0HM8ELYEUzUaRhFyCJZ+myXdaTaePCvjYMtqJpMU+X2uDOBqrBKrhYOd26snUZWoISOn8EAUEQ/u7VRrduyaSz4bzjCdWDSn+dxWqlxXhVzcBbyBcG9jxsDQ6lJhqukSJcTDSTg1ZuOQg9Ps+y85pRRwuNOhXpJ2DCLoRJi2plgKWC13kA5d43UkIcImTJRb7fog==
X-Forefront-Antispam-Report: 
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(14060799003)(35042699022)(82310400026)(376014)(4022899009)(1800799024)(36860700016)(13003099007)(18002099003)(22082099003)(11063799006)(3023799007)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	KVEniTHfJBaz7u7aY6cjWgYMY2hvq/FTv9R8QWxvr2pCXW4YL+6C+hiZPt48VZb63gdXqbLwOh1gi5/v0FxCKyKTtN6t0/R3mwlckZktC07+wsiDOo4N8JCiMSZw17cKesN7EQF0sK/0uNOakfObhke7Zlim0DcwVRsrO9Lt0k8MSgSIqR3vj3wah+xY7Ed6GynPIPDCW/8EPYsl2jn6ynfHbjYEyB+YWvMjm8zwGfQN5RZexJIs0OuoDXMFPDka5YAQUGwRGrtUcyuMerZRGS8yiBOeTm9hS1Jf3FTLRVpSgM5rme6a0TpbJUi8bOaS/rSXiXEdtngS0gZwMebF9SI4PuyO9Q5uCSA0xoSn3vuppsGwM32XyK77ZRfmLX7pAXm89hsv8sZi94ZlKSm9e6d4pltteuNk6C5NCLJQoIb1BsjXhtBO60+WiGerW3v2
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jun 2026 14:04:57.4035
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 026a3d4b-a835-4524-d8f7-08ded0673e0c
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB5PEPF00014B8D.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR08MB8099
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 22 Jun 2026 14:05:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239300

Sigh, was splitting and rebasing and messed this up. v2 incoming.

> On 22 Jun 2026, at 14:24, Ross Burton via lists.openembedded.org <ross.bu=
rton=3Darm.com@lists.openembedded.org> wrote:
>=20
> LICENSE clearly states the alternative to BSD is GPL-2.0-only:
>=20
>  ALTERNATIVELY, this product may be distributed under the terms of the
>  GNU General Public License, in which case the provisions of the GPL2
>  are required INSTEAD OF the above restrictions.
>=20
> Use GPL-2.0-only, and reorder to match.
>=20
> Signed-off-by: Ross Burton <ross.burton@arm.com>
> ---
> .../recipes-support/libjitterentropy/libjitterentropy_3.6.3.bb | 3 +--
> 1 file changed, 1 insertion(+), 2 deletions(-)
>=20
> diff --git a/meta/recipes-support/libjitterentropy/libjitterentropy_3.6.3=
.bb b/meta/recipes-support/libjitterentropy/libjitterentropy_3.6.3.bb
> index 7890dfa5c70..d119d8432be 100644
> --- a/meta/recipes-support/libjitterentropy/libjitterentropy_3.6.3.bb
> +++ b/meta/recipes-support/libjitterentropy/libjitterentropy_3.6.3.bb
> @@ -4,7 +4,7 @@ It does not depend on any system resource other than a hi=
gh-resolution time \
> stamp. It is a small-scale, yet fast entropy source that is viable in alm=
ost \
> all environments and on a lot of CPU architectures."
> HOMEPAGE =3D "http://www.chronox.de/jent.html"
> -LICENSE =3D "GPL-2.0-or-later | BSD-3-Clause"
> +LICENSE =3D "BSD-3-Clause | GPL-2.0"
> LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3De01027c4ad1fe5a4768f8488c945d4=
91 \
>                     file://LICENSE.gplv2;md5=3Deb723b61539feef013de476e68=
b5c50a \
>                     file://LICENSE.bsd;md5=3D66a5cedaf62c4b2637025f049f9b=
826f \
> @@ -23,4 +23,3 @@ do_install () {
>                        LIBDIR=3D"${baselib}" \
>                        INSTALL_STRIP=3D"install"
> }
> -
> --=20
> 2.43.0
>=20
>=20
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#239296): https://lists.openembedded.org/g/openembedde=
d-core/message/239296
> Mute This Topic: https://lists.openembedded.org/mt/119923427/6875888
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ro=
ss.burton@arm.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>=20


