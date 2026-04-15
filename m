Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5594F41986
	for <webhook@archiver.kernel.org>; Wed, 15 Apr 2026 09:42:31 +0000 (UTC)
Received: from AM0PR83CU005.outbound.protection.outlook.com (AM0PR83CU005.outbound.protection.outlook.com [52.101.69.69])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.15091.1776246142435258096
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Apr 2026 02:42:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=R25FxxiK;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=R25FxxiK;
 spf=pass (domain: arm.com, ip: 52.101.69.69, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=kC3PLTN3eP5kTIjma3WwusV7iHj6I+quYvBR0WJFMa1uS2DRXDhCclvOLCnYy2fxsXOffXLXU3rpATwJb7iCKgQjCDcGDoCuhrziPlZEIr484upLXm5n/nd+sHECoo+drvE2k3dAE1YYKGVUaxpqo1gCzt4NiA0PyXzevCcer1BxGk6+aAYznhblWq1fY/BsyYHOX9OOvUOUhOvu77IBoJpHWB/afanG7ljZf+r4e0U8cwfa8qH8aht8aE/HH2kBvLwOH//zdZ6w1oJdK6lqAPp5ZRDcgrnl128S2yfYAV5vSCSYKs94SZOaw89fAQv/HA9L+4QhHgtFPIs9+xQ89Q==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Zu70hb+Q6Ds/bsXB+C7c7LzNwFLQpio8Wf9oIVWaFiM=;
 b=NnaDwvtZMv0SP5/wppcXIxJqzKxavG+7iUg2Pl8Iss0iYnvl1QBL2eWpApvuwM+mMP9SAcNr+RHSMGvimNrGDZV6RFJVM3nXnCbTD8au9XrRxFTEEdYZG/44kWAGbuVLr/OoWRiJnNGsmtwp8S8/tFl7+VYZiKvBexNURqAnpGf8WzhLJ33Bur7GQQh3yut2ISukGG7ezEE1uRPP4lW2K3t1pVbIG2kRFmYMFd77a2xR58TNssoYyh1YvX+kcexRpkFD5Vk22IZ4EAfbV/U7yonPw3XWI8NxWcpbw7pTXEg8o6+9S3hH3bzrJq8B8jQN7qPWzy2rD8ZZCqE4nJYpUQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=gmail.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Zu70hb+Q6Ds/bsXB+C7c7LzNwFLQpio8Wf9oIVWaFiM=;
 b=R25FxxiKO6LE49NCyihIm4w1AzbbqDWlyAJrYFMI/hlKtiebQ4Ys68XT4fKHtY5hVsq2Z9Bev2v8HBDMH07DLYXPPbOsNkN9tdwHa/7v7GAwcrDsaWj6VCziRSl6TSJag6wQR4J56muYUQjlYA1ctgKJukp/8sdFHBuGPN+6oaU=
Received: from DB8P191CA0023.EURP191.PROD.OUTLOOK.COM (2603:10a6:10:130::33)
 by DU0PR08MB7948.eurprd08.prod.outlook.com (2603:10a6:10:3e0::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.48; Wed, 15 Apr
 2026 09:42:14 +0000
Received: from DB5PEPF00014B91.eurprd02.prod.outlook.com
 (2603:10a6:10:130:cafe::38) by DB8P191CA0023.outlook.office365.com
 (2603:10a6:10:130::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9769.48 via Frontend Transport; Wed,
 15 Apr 2026 09:42:14 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DB5PEPF00014B91.mail.protection.outlook.com (10.167.8.229) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9769.17
 via Frontend Transport; Wed, 15 Apr 2026 09:42:14 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OIJ3YfClbwIlmDoiTOPKxUfvUSyF2EUuzcEAFbuIINd1saT1zszvkaLASEjP4MsUg48HXUQ7Ao5DU44jvX+8/cxzNshpNq1caGoiPCnfJVfco9RJLF6bfC8EMJEU68zWkYEX2mZcPmfy0BN4qHLj20WGWyb5y1//AhjQvOvPSKrxk3YbyrbWPc9JxxLti84kAayiurM7V/SJOpf+AS5IEAakSMczo+KJvddcxL3g52PQOb6zR3KAFNq4pcssrZOZMPwgnIBQkGSUNlRklH10Gsz+JY0UZA5yIY7CBExp4dDoNRlZFVEBgCvIvG/H2aSIp9sj2RMzh4Eys/TegIPX6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Zu70hb+Q6Ds/bsXB+C7c7LzNwFLQpio8Wf9oIVWaFiM=;
 b=SpIG1tqJmTVheJrI9NLSqpOwh8K6lv/dyNRHbWRXW0O5YduZEz9OwbMZQGqIVbfMrEEtGFtz6YAVZTEMdINXSQpvDs6ZxENLoUxtJeg8KAHG/PIB21X/8aMugIRCw9TLwzmel0Cr4AE9k/9BvH6qZrAvQpBoJas7zkzI3to/0MPfwFqXMZIKym//SN+vvT5c/pSpwpatdCwf9k5xT/vUJBaVdhUX6kFLe9z7fOoYCACQdVb+/fT2Xh25ZBHByIWylveLmh9rmFT+8NLnhETNXQUFq/Rl7bEy/cP1Ei4xXEMOPxSvVe9OugPOY4a5tdvvUwCMEgPrMg8Evai2VEd5zA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Zu70hb+Q6Ds/bsXB+C7c7LzNwFLQpio8Wf9oIVWaFiM=;
 b=R25FxxiKO6LE49NCyihIm4w1AzbbqDWlyAJrYFMI/hlKtiebQ4Ys68XT4fKHtY5hVsq2Z9Bev2v8HBDMH07DLYXPPbOsNkN9tdwHa/7v7GAwcrDsaWj6VCziRSl6TSJag6wQR4J56muYUQjlYA1ctgKJukp/8sdFHBuGPN+6oaU=
Received: from AS4PR08MB7429.eurprd08.prod.outlook.com (2603:10a6:20b:4e1::9)
 by AS2PR08MB9641.eurprd08.prod.outlook.com (2603:10a6:20b:60a::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.48; Wed, 15 Apr
 2026 09:41:11 +0000
Received: from AS4PR08MB7429.eurprd08.prod.outlook.com
 ([fe80::9c90:b612:8e37:fe68]) by AS4PR08MB7429.eurprd08.prod.outlook.com
 ([fe80::9c90:b612:8e37:fe68%5]) with mapi id 15.20.9769.046; Wed, 15 Apr 2026
 09:41:11 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "fbberton@gmail.com" <fbberton@gmail.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH] waf: Use Python 3 built by the build system
Thread-Topic: [OE-core] [PATCH] waf: Use Python 3 built by the build system
Thread-Index: AQHczLQF4bZWdvPC90KotEd0VQmxbLXf3ocA
Date: Wed, 15 Apr 2026 09:41:10 +0000
Message-ID: <D89E23D5-C9B7-4875-A2E7-1823645E5C4E@arm.com>
References: <20260415084344.43909-1-fbberton@gmail.com>
In-Reply-To: <20260415084344.43909-1-fbberton@gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3826.700.81.1.6)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	AS4PR08MB7429:EE_|AS2PR08MB9641:EE_|DB5PEPF00014B91:EE_|DU0PR08MB7948:EE_
X-MS-Office365-Filtering-Correlation-Id: cd8dd7aa-29c6-46a7-4e91-08de9ad34695
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|376014|1800799024|366016|56012099003|22082099003|18002099003|38070700021;
X-Microsoft-Antispam-Message-Info-Original: 
 XSNaEjgSd8wnXn4ClTv1JYHrD1oCQ4Ui7Ehwv7bdiwyfVAW3O5pyTJRuFg4MY7/kI3Q/XiqQiFJ5s5OFlRw7bm4ARA/v85bvsA+aPX5QP485NsbSXefDp1Exui0A/tcBAzwsSg6Id4BruDemRx/cZzXfm2W5hzCuZigjIZRcRL0LxwMFXx8J0Ii3dWganu+ZLHmYFBqM4YHqvSU0zVFZfyqHBfk/yyoy2ve6Cv6bBIA4m3u4+phcjPdSVYWUL+ZDM8ErohtE4XrBc/1cT77HvlnYX7oS6WXkM7O8FKa5KjVrrhxYAf0o8D12DRWM0YR4EXg1sQZAL111QxrLQWhKpQvRgDM6tqAUxrh2VNzjni8hd6Coz0cyQ10s04UOCMg2PM5EA0M42zj3Bt5v+LIloGcBqqHfKAke3egMx0wKdkyDQODjisq0J4h2DDipsav2hVdA+bQViWQBqt3pEzrEWNqM+xyLAcz1F02zjVurXe8zvBFUD+nUzltdLomtmLpyQAwKmllPStORnF7UdQya3I+2GnvCgkgH/shQX3BkJihOfIH6AYBRXxe8j73xhtkWdf9qVFe7h0hYbqsj3pTmc87vLruC2/ZxyxtNv/uaQtAZ7vt9orwCd1snlJyNUmzdUHDllWQcvqWKPuEjzhFGOgVpDIxKkmwXyLjxADBMfHJGcEO1vZ04O4T2YSwzpF8wnxAQynKPGIyyxdg5paV5+vV7IPgEv2QyHnMuMHE7HCItLbB5I6nFXHCfjnbh572zPC+6XS2dzm0KZwHIAaS2pA1OZVb3pXT/ZXtwotbU1Bg=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR08MB7429.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(56012099003)(22082099003)(18002099003)(38070700021);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <1D4812079481C942B846DD73285FC87D@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: 
 ousn9xwyerCRPUDXSC7AduMQhdXIX4fnq5xJxS+/ghJzZOMGNmZ0yHTw7Yd0NbswlvIaMadt5UMK56ZU/4wZkN8D4N6hAYjNjKqQ/iVEKl+cm0FslJTVMnT8WCymhsL/Bg0/+J5dmXA1PamBVc7mkeXxFFyTYuzwWILRUi4iQ5V1rj/jf3ptwUgtszRC+oB+gZ1B+xH4lOfcgYOT87uiaRg8WWlgeuNQFwloeT8oQZGpEhsT01uNy6//vV26f/Eok3r8YHrhbao/ofQef+zzW2xbS2fQ5Pw/1vWIKBE2EcrBc0vtnlLCcovV/4/q7bkX9hw3ysJF/X87w+2nO7iTjQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB9641
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DB5PEPF00014B91.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	2486fd28-1c9b-47a1-2413-08de9ad320b5
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|35042699022|82310400026|1800799024|36860700016|14060799003|376014|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info: 
	PUzIq67m5el9f5yHW/tMdqo6w+WzkzONVTwT4OgMaogmocL7UlADQb/WFxCFEl10mMCXjYzpNuPzArd5Q7FEU4W6ZTnYrCvCczctrooUUuEvaXKWIio90DXT07t0ANPL96e3hHJHDWWShocjzq6qCIvPLp8MbeFnjsZix8m0VlUZL9y2ZawfkXvL4hYK7euF4QzI0HK+oJQsXimbU8F/5LvxX8otsrtIKlRViuIe7i4Aaa9LB8PCnBU9C+tzU6tpLbEDj75UaP46bC6ZIAyk3Jne6OMatHP9PLNE4wRMVtH0Ae9Hu2+AJ72necThEETe/OwYtU6FPYQcEQ4PGO3wRHi7jKJLxFlxDNNMyfapztFREaQlr7X9coxO2cxRxrC+baZAWRVOt99JPldFJS57xgqMcESS6e3NJyrsA8QOu3UTg3dB6F8/W3/31MBdBSpOuCRV6rDoXLgdtYP9QUz0wiXuYqcTVF/n34WCaiNr7tC6BE2VAl6gkerUAdrU+CnxEYlRNB2wSspy67X8Z+Qcnn95vtwxKMm4NkShFiEbBMs+3IverPiik5DdkaaU/dWbOGr8YMk9r9p2SKl6tw7/guPz02429lAL1nC01zRTE7hzeKx+mw/9QsOjG2D8Att5Q9FwJ53SN76nnLNr14w9ykPu3aZkPto4peubnaqpYMEAKCyfKF8CBNq10x7yBGLkULCMULmze6mZC5SlejYCIg+UjpyVvzjZt4n0u2GRDbRHx4Z/pO6Iy3nFriGdeOtKZFtjfR5i24k1YY6/9/Y1Hw==
X-Forefront-Antispam-Report: 
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(35042699022)(82310400026)(1800799024)(36860700016)(14060799003)(376014)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	O+7XJzhdgyPnYwtIEZbonB8+iw/vUojrf1+q+3k5jUXhe42JOrahTw63Pf1yie5u5abUQn3cBlpgI1+4V3jyUVCkQm32xbVoW6o1ky+O8gquCpk4QjKr8HTRjM+gM9MB0xdt+2lNCCEsCMZdTj5iQD7r1Oc6UotFXyCiQQBnDpdWun5HSQS2vGeiMMMyM3Bkx9yI+Bng8cx1txnsGWMUykIeNYHe8IcbsuFIixSDyeu7PnLsFXS07VCAlr/6NVeCLQnp5ZKACNPbEzj2Vf7ikb8A5z0oYMxkQyu0cmfoh3iK6MH4v4ifAdmfrFUCUCnNRZkuYfDYPqtWzbOkyw5y0faebNH826xL9H11acSljAYOps78LKSvJoBxEgbUbMegmNWKkG5KImpAXHHI9F9oi1P8RPdPhmenGdiozunSwI36o8ITuHUIE88ZEWLKqJhY
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Apr 2026 09:42:14.5702
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cd8dd7aa-29c6-46a7-4e91-08de9ad34695
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB5PEPF00014B91.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB7948
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Apr 2026 09:42:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235191

On 15 Apr 2026, at 09:43, Fabio Berton via lists.openembedded.org <fbberton=
=3Dgmail.com@lists.openembedded.org> wrote:
>=20
> From: Fabio Berton <fabio.berton@ctw.bmwgroup.com>
>=20
> Inherit python3native bbclass to call waf using Python 3 built by the
> build system instead of the host Python 3.

Why?

Ross=

