Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0CECCD98DA
	for <webhook@archiver.kernel.org>; Tue, 16 Jun 2026 10:18:16 +0000 (UTC)
Received: from PA4PR04CU001.outbound.protection.outlook.com (PA4PR04CU001.outbound.protection.outlook.com [40.107.162.36])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.150849.1781605096102972812
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Jun 2026 03:18:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=dw448M3z;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=dw448M3z;
 spf=pass (domain: arm.com, ip: 40.107.162.36, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=OdZ9/X8BYcDMZNcUxqjyaQWlWzkvMZG+dDt5AlX22hFcsUXIfYD4gIO7rb1Idkqa6jhcKTXvjX4qobSKDMYsHTATijuZ9FIieyWZfpmNmvGIwZsbtn0PkQDKjt1gYIfZeSXUq4T16GQrNxJ+MoT18C2ruFYRB0+6Jp6rQVp6tdeDjSvVlS1pt87zZGH1B19QwiUjqna3RpGM8hy2yQWMDA83NpFx7f98J4tMsfH4Als/HxRPvT8wzZb3wwz952wC0u0mCBAtdrXQPcjE66U0PhEP8gwiapTcmheyzPw3a1OGGwAtt6RnUBe10PeRA19z71zhw3iaezL/vJSbJQelHQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=W7fiKIqZ3mih76T+qVFWRAlZjyrG+bt7oSWDmZTKFaY=;
 b=PVHA97zTZU1SJxwKEbsYUKAI8g+NbSHMLXE1UyiDQvtvi4/Xpt8Z9eI4ZUVxNwAzPVdBu/fJqv0hhdzHf/xWysMHl700dtSgR7ebJtWzJajWK1xvm6lkSs3EBt1URaKzC877fm72A0rat81t7MZXY7j315GOSw9ebnlVPLvJolifPOYl/fqOyJpvGrpPErIXXUn9WPjOEQdUhayVYPMSdjxsLojvT9JFAvBUXmoo6G+e5AoZsFaV075CmPjnJVuzxjuY6mPu5loLgulXDbaUlun7nEvsrCfwoZ56FImNXHxTv1B9PtrSyx16lvbTmoVeVx5CXnenQKZVmJYGW5OdAw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=windriver.com smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=W7fiKIqZ3mih76T+qVFWRAlZjyrG+bt7oSWDmZTKFaY=;
 b=dw448M3zhqkhcjpbL15sx4244HhOrXmbPilTW8OrKHOgg4dQibi08gWg+hRlsUbWmB2xyqRO0wGnIGD5et3xeeKzM7FIBVrfKNrFUC3Zh8gfG6Ho4NMvfuvdObJ9Zj5ldjxzAXG+epEfz3JegwsDlG43mObZcNIwoBiA4d1JkGU=
Received: from DU7P251CA0029.EURP251.PROD.OUTLOOK.COM (2603:10a6:10:551::35)
 by DBAPR08MB5720.eurprd08.prod.outlook.com (2603:10a6:10:1a1::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.18; Tue, 16 Jun
 2026 10:18:08 +0000
Received: from DU2PEPF00028D0B.eurprd03.prod.outlook.com
 (2603:10a6:10:551:cafe::7f) by DU7P251CA0029.outlook.office365.com
 (2603:10a6:10:551::35) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.113.18 via Frontend Transport; Tue,
 16 Jun 2026 10:18:08 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DU2PEPF00028D0B.mail.protection.outlook.com (10.167.242.171) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.113.7
 via Frontend Transport; Tue, 16 Jun 2026 10:18:07 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ikKBzg5xC4m61sF+1JbVIdipgpnw2LWNOUAnylolt0S/szJaCGvuDePfvJt26MqRazx2lc/koVhVLm+O22mXrrYib6h39CpmLLdsXbL5JPISKP7axCSJE6BIED1OpwUVqtqe4M40Kk8roheN2q/v8Ar+hsoiprXUSVaZFkBixbWTlJQi+Id2pEN2euiMRejggU+vOphDVvQGnXS+AKVk0aygxThXsML8mc4+UWVGsF0F9nEFVgDVPot5J8i/U5CbLbVkQJ5XXi8AYt4pp/1hkImTdhpLu+YQ3jp2jROYaK5JtotrhSkgrobdbXXSUjIAeQyRcfdPFaxVrtb32IUJCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=W7fiKIqZ3mih76T+qVFWRAlZjyrG+bt7oSWDmZTKFaY=;
 b=w5RXZXOsWwT4vA8yqany6I7BPVmhG2yCq1a75ISbCkXHoQo4+w+k2+MrIaNHXkgZ+lbZJSZfVqArh+IMXw7km9lB/xohmvyM3r6qdbDhE1JLN+M7J4J6KIRxdVqAW4yiITmp7PHsVg59WahDvnAU4FdmQmozcpaR5W+YeYVBP8PHGgixRC+pQba1RsWY5y1t2NN11366R9KciQF0qu0IbedKpeEEjgQpPN/N02WXuGN1HE1XGMCYvtomedmSQ8G3mtbMLhbCdm9+0iv8aZtuhUzw725A1gaUTngzwB/1UhOT8T3nmoBdBeHfcEMBFzxULvyW6jSG27yTBt8XT0Oe/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=W7fiKIqZ3mih76T+qVFWRAlZjyrG+bt7oSWDmZTKFaY=;
 b=dw448M3zhqkhcjpbL15sx4244HhOrXmbPilTW8OrKHOgg4dQibi08gWg+hRlsUbWmB2xyqRO0wGnIGD5et3xeeKzM7FIBVrfKNrFUC3Zh8gfG6Ho4NMvfuvdObJ9Zj5ldjxzAXG+epEfz3JegwsDlG43mObZcNIwoBiA4d1JkGU=
Received: from AM9PR08MB6258.eurprd08.prod.outlook.com (2603:10a6:20b:287::19)
 by DB9PR08MB8226.eurprd08.prod.outlook.com (2603:10a6:10:39e::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.18; Tue, 16 Jun
 2026 10:17:01 +0000
Received: from AM9PR08MB6258.eurprd08.prod.outlook.com
 ([fe80::171d:1f8b:720d:7a1b]) by AM9PR08MB6258.eurprd08.prod.outlook.com
 ([fe80::171d:1f8b:720d:7a1b%6]) with mapi id 15.21.0113.015; Tue, 16 Jun 2026
 10:17:00 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "zhixiong.chi@windriver.com" <zhixiong.chi@windriver.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core][PATCH V2] python3-cython: make generated _cyutility.c
 be reproducible
Thread-Topic: [OE-core][PATCH V2] python3-cython: make generated _cyutility.c
 be reproducible
Thread-Index: AQHc544AGs0NEAzo8keRe3qmhFn0e7ZBI2EA
Date: Tue, 16 Jun 2026 10:17:00 +0000
Message-ID: <1A86D4F0-7C2A-44E2-8231-2241888537C5@arm.com>
References: <20260519124943.497200-1-zhixiong.chi@windriver.com>
In-Reply-To: <20260519124943.497200-1-zhixiong.chi@windriver.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3826.700.81.1.8)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	AM9PR08MB6258:EE_|DB9PR08MB8226:EE_|DU2PEPF00028D0B:EE_|DBAPR08MB5720:EE_
X-MS-Office365-Filtering-Correlation-Id: 19fe2b8d-2e9d-49a4-24f9-08decb908f61
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|23010399003|376014|366016|1800799024|56012099006|38070700021|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info-Original: 
 2bKP8OddQyk7B2c/6wDOIiyPYi8L0Kmu5CRpHUTYkkwSlD7f7gLuIGSr8syE/Jj+a7vEfZhO8q7M8+1Nwn+UClPWFmFMCP6qhH8aENPuPKLGhqzoUh5ig3Pg0gI42bkIs2vPMtFjm+hk01Ir4Iaejwp7//HsIGk0QvFqn4km8x/WgdK0eFv4Q6LT2/97+o/qEqXM1diLTFKWxKFXlKg+vrv0xnUTd4U7dXQuHImdwTZfzkYJBzu+eDWYBpIQ69i7YAaYjvES0OAfkpkOSwpegFSpc6lOpCqqaSAPxys/Fm5gxDWXP5LsDfHdx5u5W/6rRaWJTyqlkSQ5QB/FGf1CEgHwzskjxKqAX/4FLI86IDe00gF2Tb4aOaY1AMR03l0a3IZaSMjUMb4bmFNctSom2SFWBPqnagqM/OjcQd+z/H2oz1FQNtwZnV850oIcBJuhdpfnWl2g/nU5yNqHOxC6T9j4rjdwVCyuRWfR2Ht0SpPalMXfNRUB2TINd+ZO7CWOr4k5vLWcAdAaVAgBQSdqqD/kQyp4gGyHqW+F9FcwxAkpjKLulMjdJ9o5YmkdmtGNKU/iC4oK0LdK/runP3wGXf0SF1MqOXnlw9hoXgchjwobdWXXyy2sR/U9CswUiTUPwzYYOo4WME7eznzGvKdLyL8+Dyu1CnOC4+aEcKQqwDR719AaoqDM5sR6aB3CN1xU9n307csRdEuk/U5j93ZgvZ4uoBO6yAkr90Hy24Gssdc=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR08MB6258.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(366016)(1800799024)(56012099006)(38070700021)(11063799006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <FCFC95799813EB45AC2A5E13C7AADE60@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: 
 T1cScapuFm6M/t+wWQlDnhv09RzAAeg+AiaqR55vt+Vn0Ea6jk6QJjtb7zl+SfeKmN95gl9U3v6EYK83IWIDRFJ77Q+lKahoICqfS0k8fbaWA7tLWOirZa9EO2ZmJtO/AA4/Wn7m0e9rpTaVcx6pCqEUmzwMrnoWLcJa5sFR+66IsTcsbTDGIwQgnusHEWlbvM5ul19DXZUwc2hq4wCYEvz+JmcLp6hy7yPa1SJ6VBqkmmALgBwfAC06Yu5U5EER4Z0IX75r8enMVIMcOr2wwsnT2bliJosbw/CVtpWigEBZHLnfBQ69Sh9TzBzEtGYRtTRG8Ny78f5tG0W3VVVAqA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB8226
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DU2PEPF00028D0B.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	577730a7-3c5d-4b88-fcf3-08decb9067b5
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700016|14060799003|35042699022|23010399003|376014|82310400026|1800799024|56012099006|11063799006|18002099003|22082099003|13003099007;
X-Microsoft-Antispam-Message-Info: 
	tUSZ33if9UeZRCo48iHD6QKcMw+jXvoS4C6fP+P9AFaCl/ZrKTIFDcNbSHw+Hc/cd8pjcA1ETKkW0/iQzQSiCbz3Zb9rdv1BYzHQtYGkijmJX64gftdk8aZJ95CYyh2wzZ5rmfft4w7DM7TgE5LM8mjJbG3obH5byoR3lkTjJpdYcQ+1FDnbY+3jwn9BEaBOl1736SGwZXJYcfxSpkgAqnsUCJEkywpNtm4nHyg8uhlYcHlgi6g0Fx2TKDyBOpqdsC3gJ6tawMVpSAkokkuOT6G7HKMOHbvj1EA2CJDIBSoTK9B5Hg1cBPXK5F4IAydKJD0/7yMk2Hpf/7gjOApQvbSiXix5tK//7H+ECTCLSthrnNU/dbgsdHWvqmINZ+RqQQqYxUFOdgVQeHpSh2qMuegkAi1DR7QAHLfm9tTPr5THiztko9WKi4dgPv9nBEg9fCwG+Ioon5y+N+dS+07/qV9MrbRFSs7kZE7kmw/FpiOcyRW2S1tdCyRfxjjg8VkeMxuViPbQ4oL4X9Vci0cl7cNRrD5F825OnU2jK7b4YqFG1dPYSgTPVHRkOqHLjuv7dWeY6ASQSorNXqdGaG603z9BhGeqyWszBGrgZiAazjcPVI4wqVSfM8os8EId9MV6+Wbn/fpdELa/Eeji3x6o/m0h+ods+50tcPbz4OwyKCfu7d/++O+f4+0jARXeu5uYPjbeC7h6xIMnJQzrlMmcTZCJBKeIDUN2HDrFsDbn2lc=
X-Forefront-Antispam-Report: 
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(14060799003)(35042699022)(23010399003)(376014)(82310400026)(1800799024)(56012099006)(11063799006)(18002099003)(22082099003)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	taunUla44onCO92uHMOREdc5QELf+VJEYBV/ULlOnZvr+kNKu5j+TC65eGTskvAyz6r8J6I79r5efT/7awvxx4Aik710M6mc/9e2Yzf6BMKcfwrSqKIKJfzHm8tZREInBizy7Jsu35J38uAmsVfXFyz2MwOnmjbHHJeB09DX9LSHLsv10BSF+t/kBekpTR105KNvoN0Ub8gAuGlW+FjGgYddbx3n3mISKz2NwzD0pzLVFJNOs40iObR2HT4ICO1nalLvgg0pM+en4aGox8hBQJa2k60RMtkxE2fvR9Jqm6ftLkAhGyntBz0iOz59nC5tA+X+8WA2FGhzBuRV/GSrwlHzJHdtFFCmhIcnt4CD5uarUjvGFf2ukiTpcvKZRPgiJ0HIFNzMhINU1rbd3NNAy00FVSPnGENL0X/EtLkG7JEYjZ3etcHVnRJrYhibZEHi
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2026 10:18:07.3955
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 19fe2b8d-2e9d-49a4-24f9-08decb908f61
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DU2PEPF00028D0B.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR08MB5720
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 Jun 2026 10:18:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238886

On 19 May 2026, at 13:49, Zhixiong Chi via lists.openembedded.org <zhixiong=
.chi=3Dwindriver.com@lists.openembedded.org> wrote:
>=20
> While python3 module use cython to build shared moudle utility library,
> the generated source file _cyutility.c is not stable at each build and
> made the generated library not be reproducible.
>=20
> This commit use the fixed relative buildpath instead of the original
> unpredictable tmpdir in the generated source file to assure the file
> _cyutility.c should be reproducible.

I see #7723 has been merged, so you can backport that instead now (https://=
github.com/cython/cython/pull/7739 is the backport to the 3.2 branch).

Cheers,
Ross=

