Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CBAABC5AC67
	for <webhook@archiver.kernel.org>; Tue, 11 Aug 2026 10:02:16 +0000 (UTC)
Received: from AM0PR02CU008.outbound.protection.outlook.com (AM0PR02CU008.outbound.protection.outlook.com [52.101.72.35])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.51209.1786442526436715761
 for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Aug 2026 03:02:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=CqYoaKyP;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=CqYoaKyP;
 spf=pass (domain: arm.com, ip: 52.101.72.35, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=sxHA0nbbGb1VMd2gVPbP2+6jf1+pMqhac9iicEIZmgam1UzCBmDHOC2RjBFtIjsMYjkY/D4YyYUxsmHIOVj0eEe4BIy63RqlLVTB2lIPYAAcr+l48fnzhFh2sV8iZe/BsJMPu6QhiFy2gvFZ5BYzWVR3nkoyFP/RjcIFVqBpeShDqLx1ENIVNVNKizAJNOdt2DLONS8iNoo0bLMeO/vw3kfHvaU0SLyIJ7ZSMbl+5Hi+60ZugT/2I/Dv8FXLLC7an8lg4E/GW9FAvmiU+gwZc5AtKcE6c2hmXyyUr4SawOWsrM8xKkpQwER5RSuw/9aVlCTcwrjiKVcNlvPFHldCQg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aWIvT83j62HWtP38nkzJD98rVViLkrkBCCXwyhw+A5k=;
 b=kvR7KFuSM5ZauD4FnFIIFqykTUk5jX9H5aUH2jvLCMGkCHrLwsfwmBeIQ42h1kyAEubQQ7PoVR3QUGPrJ9h2K6al+vcKxw5y8IONpXX5uKW1zD9YVmU4xbrnY2C0XJkfqdLjC4B5yiqsg6Fi6MzCmUevnLUfMdVPFfGVwe5uaKOwr63tnU4DdueiEb6gTCkCxAY84qbC3AwlgBwFfq6mb64AvUUQcT5oRFyiKxad9l/qvIerjzgYqWxleyM5LzqtSq5H+Tyo+QEEQKIx1a2pkPYVUgQ1YVDhgkAcmDaD45qYGhNVB+XneuFxkncP85jqn6OgTxYNkBXi4zbF9/0IMg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=linuxfoundation.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aWIvT83j62HWtP38nkzJD98rVViLkrkBCCXwyhw+A5k=;
 b=CqYoaKyPHD70SM+e6m/cCjnhMxJdXC264E8bECB/KZHSm4Kf+TXKvJ370V4cIhMun2pkmmaQBMcAFwCZhC29RA6TYxDtlD4SWqEEDfgeT9mg4dT+ogAx63tY45LbR+vkGLP9napuv+H5rg5ihZEwMXBPUAKFPAiUiKdunEusmbs=
Received: from AS9PR07CA0035.eurprd07.prod.outlook.com (2603:10a6:20b:46b::25)
 by PAWPR08MB9032.eurprd08.prod.outlook.com (2603:10a6:102:335::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.25; Tue, 11 Aug
 2026 10:01:59 +0000
Received: from DU6PEPF0000A7E4.eurprd02.prod.outlook.com
 (2603:10a6:20b:46b:cafe::d) by AS9PR07CA0035.outlook.office365.com
 (2603:10a6:20b:46b::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.315.11 via Frontend Transport; Tue,
 11 Aug 2026 10:01:58 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DU6PEPF0000A7E4.mail.protection.outlook.com (10.167.8.43) with Microsoft SMTP
 Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.315.6 via
 Frontend Transport; Tue, 11 Aug 2026 10:01:58 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=W8E1eaeEElwVyuXZmF9hmh7u/v2fVFSCSv1f6oC856s+fHw73amLVCpqYWBVNY7RqMX0KwGA5D1xjAi++A5V2SkCbzx51oVvV4fHSj250FcCO1Qzf5xNolaXE430tMnXIsEHirtXwYRhp9lLErRlbhTUd5jrTH/FRTHW2QX/oNZzBa7bntl30MpG51IN+G1qFFZNJX64Sttkmsm5MDaRcJlhv2lxwEDz6JkNopZMPteyqotpZtqxB1y0fVM9j3bkmroHtwknsx6T/ea872ZYR8u/TAGMHe6BxLUy+8qJ9BrFb1RdDme7vjSuDJSBJsuvp0UQaML0lW3exs47qFG7Bg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aWIvT83j62HWtP38nkzJD98rVViLkrkBCCXwyhw+A5k=;
 b=sw1mRBdrEHBl8HHwbNO6tBGx7dAmOwhwypIfoyqVkNzuvYOMuNopQ0tDZ3mRBmzY1YH35EsICVItY9Co2MC9SC4pG1ibSAZFY9FmNasDZg9JQwVl0RMTXkFqleaEYU4Rn1ZiCgu6gNUHymE71sZORpEnVXbyiuVnJLh7OfC9VZ6VgtTeDONwDI3Z5ojzPrs6mttSQbHYTq50M3lniWwct1Kh6wPpUqKtwqwWPHjdOVUsMEx/8B5JR1lQzlg8T7Km9ukG5OLlRXbcKQSoI8YHAoGLxI2bolU76GvlzICaSAFlebusrRfe5pSI+KFutx4vnVYDyP7rqzb9qwQx453wlw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aWIvT83j62HWtP38nkzJD98rVViLkrkBCCXwyhw+A5k=;
 b=CqYoaKyPHD70SM+e6m/cCjnhMxJdXC264E8bECB/KZHSm4Kf+TXKvJ370V4cIhMun2pkmmaQBMcAFwCZhC29RA6TYxDtlD4SWqEEDfgeT9mg4dT+ogAx63tY45LbR+vkGLP9napuv+H5rg5ihZEwMXBPUAKFPAiUiKdunEusmbs=
Received: from AM9PR08MB6258.eurprd08.prod.outlook.com (2603:10a6:20b:287::19)
 by PAXPR08MB7552.eurprd08.prod.outlook.com (2603:10a6:102:24f::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.25; Tue, 11 Aug
 2026 10:01:24 +0000
Received: from AM9PR08MB6258.eurprd08.prod.outlook.com
 ([fe80::171d:1f8b:720d:7a1b]) by AM9PR08MB6258.eurprd08.prod.outlook.com
 ([fe80::171d:1f8b:720d:7a1b%4]) with mapi id 15.21.0292.024; Tue, 11 Aug 2026
 10:01:24 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH] pango: upgrade 1.58.0 -> 1.58.2
Thread-Topic: [OE-core] [PATCH] pango: upgrade 1.58.0 -> 1.58.2
Thread-Index: AQHdKMjdoMPB1vg9LUuP6Ya9JE2HvraYbv8AgAAwHoA=
Date: Tue, 11 Aug 2026 10:01:23 +0000
Message-ID: <6BF72D5C-993A-4EEB-BCC6-7FE56C6B61B8@arm.com>
References: <20260810130443.796578-1-ross.burton@arm.com>
 <80c4628227ad5d46f784e06f5804209b38af9f7b.camel@linuxfoundation.org>
In-Reply-To: 
 <80c4628227ad5d46f784e06f5804209b38af9f7b.camel@linuxfoundation.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3864.600.51.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	AM9PR08MB6258:EE_|PAXPR08MB7552:EE_|DU6PEPF0000A7E4:EE_|PAWPR08MB9032:EE_
X-MS-Office365-Filtering-Correlation-Id: 28c4057a-7332-4874-e8ed-08def78f951f
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|366016|23010399003|1800799024|376014|18002099003|22082099003|11063799006|4143699003|56012099006|10067099003|38070700021;
X-Microsoft-Antispam-Message-Info-Original: 
 QmuRJ89spWDZ8G1d3qU/vBiAbEMLTE7N1L76lf76txIdPnJ+wNKLipwSUDd+Qcr2IPmKrz+NylOxr6jfrGV9hIiX/RzurqKFJlr9awLUQkPg+L8rYoRDn7Z0WumUbnMu7GzZ4ss059GUoJ8MMd4fBJY9HhPpXpkIZMIpK6DzTCdh/YlB8PA4xilJbawlzq/vt2g1fdomB3DxMdbYzh1gEy2ZZUc5a33338a6O63opnsD+Q6QDcWieX9r5yxdzaiampWTwL8E8KeMIPnJQ8TSFzXkIlJ8GKli8JFTGjY6A1dNQkFmhM8Nxj8kkX9MqKZSJ25ZLmeJ6X76cYk8UlaS+T+rhNazHgefDb8sy1nzPNQwpHGJaXdSzYQgikjcsa19QSqxQIvnH3+fIQji6nLD4dWHQOH9kBjtRw3NH7brR/Sz9W64HGW2/TVo9VZ0PQtFKVFZhHvfq6XQRorDCX4LpQXWbAaxdA53hyGvOjwgd46wm8aIsh2Jya5H2H5pFQfPkt2srGa7WOkl3TmH3HhNBKgDUb1vcSUfe4dD+vIQ3XcJVe1O0v9kSxOpp2vbKI0Q5wvHuOTtHX8JTAtKI/4MIfehQ83HqD3TEb5xV3Kl1oVnavVRR8SHfuDziw6rUaLva72WxpkcT6s8LmQKCEbKkTJek7IZKpVS53MW/R59rXs=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR08MB6258.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(1800799024)(376014)(18002099003)(22082099003)(11063799006)(4143699003)(56012099006)(10067099003)(38070700021);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <CEC4A92E48D9DF4AAB063E1BA399AEB1@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: 
 bdWjn5VxJTv/pL3VSfv3bxbzbnOaW7Xm2l9C2J2s0le/zRMSjuMwj6JfIka0LAnTu4ckjUuky39SCUCVynlUwgSyaSTM5dlhfe2UuV/g3Qo1cxlcwwlOO4clNjME/UexvMRueNZxuLGjLu9kTnmSUrB9Md6UpLeOT98xp9/KPn5HNE4PC5T3GQlwSbqYNb+XGbGhnjqPpyv7Z2dcU0VpiL7kk/51pwJk1xmIqzwTY7OhpQZtlEi8n0rLzWThgFLNZaStnADZeld8dtalIOWH0fLIsebVMtO5HkauJ2SG1KVaDdZzRg5uQgRA9BrTMrKLs9wLW5Z4JNqTJfgqqq5lTw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB7552
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DU6PEPF0000A7E4.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	366b520a-79ea-46b9-59c2-08def78f8064
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|14060799003|82310400026|23010399003|36860700016|35042699022|22082099003|18002099003|56012099006|11063799006|4143699003|10067099003;
X-Microsoft-Antispam-Message-Info: 
	IAz2nQ/3COnY/IcHdLThs0jEmyytYgwMSo7wXHeiDSVYKFtSR//wwESsGp8d4eZPDz+szxg2r9DCU/5j2qSnf+WBqUWTBir1FpaheCzd3WvqOEgFmLliVfnKoKW5Dp5KgHhnfhMMgoGH+VvWcYPkfC86f3gem0ImWZUTcdOgKtZ1YX7D/JmU9EzlsE1UM6DkXxq4c23BJ6iuwhjadrg+LIo3TEc8BjMVaUyx6p5DVHLD3rNf4CpdzjrcnPbVbyXU6lXmSEhXa1wLMooRZcyu+YkboAn3G5ZNMMfhbg1y9960MQ2/w3z7UXAQjJ6d79xkKTxyaNXm4TkVcL5gKV/U3dJBzLrg5tO5mY+hERzp0hWyiA1c7L33ka6bXjWP5ZoJw6no9OnsjX/sSDZq8KSiEw5fRMytjOqZS60l2VX83NIJnMJvbp/mbzj+tfmKOFhltyXj+eABw/zroriT4b35EBQ4VwgmUVxnTk8SJEIJZd6Jo22oJxN2KmEsJSp3990L1S0Kyxku9gbIhgA/WHxe0v3v7brvIrgON3aKkedsMFAeFF1nPL+NEnPNcE9b3kX07hgvvAiLhLKaa2SavRGLepI0aqvUVk64AxC5IsPq8asuWf/ZhbVJh15UXkRQujhspO1L9S4NOZb+omweFXwpkmQPdekPLvs+TRhERehhSqD0mjuBlXcdu9CYTWnaZWezzhrVWre+zMn34xqYVBgRHQ==
X-Forefront-Antispam-Report: 
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(14060799003)(82310400026)(23010399003)(36860700016)(35042699022)(22082099003)(18002099003)(56012099006)(11063799006)(4143699003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	ls2RdAKjrhFSJRWvFkV/BSX5eSBPmgypHxOYWkNAY93zQ9Wp5PnGEpNCZe9YnVmbqE+XbIRe77Q2rQrVRStl32i/pHcITVTkI6IKNTLfH1bLVjAu/tfgPum6yRvhL9ynE0HB/rZI5TF140p8jM4/o68JysWtdIQQFkO0fIzM8tqtCOxRvmRXtOaP7YObtliVEmxxY1EUlBLXCyzlwrkhElAwIAKs5UmEKjTXzb30fyjI6cMG9jc5ka4mVm3MsP5xpXrxIhArEGjtfOSXsewwc8+wJleOhURt9xp4H7m+FFcYU/5AhYexKF9JW3dzuaYo0qG0Om6+0FftzaB0L7Fy0mzdRnl4q6iSM1eMR204xKKlY1gxHsdBWbzUeIu0TPt3W7jJCsi2jwlbYX4aSBg0SuTMo5/ogqhWcPYe2E3/l4jlgHyU5B0dEtIAxCfFYnh+
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Aug 2026 10:01:58.6972
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 28c4057a-7332-4874-e8ed-08def78f951f
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DU6PEPF0000A7E4.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR08MB9032
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 11 Aug 2026 10:02:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243180

On 11 Aug 2026, at 08:09, Richard Purdie <richard.purdie@linuxfoundation.or=
g> wrote:
> I confirmed this caused ptest failures in all librsvg runs, e.g.:
>=20
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/61/builds/4242

I ran this locally, the test that is failing is one that tests under/over/t=
hrough lines and one of the main changes in 1.58.1 was:

>> * Renderer: Keep over/under/through lines in sync

Filed https://gitlab.gnome.org/GNOME/librsvg/-/work_items/1237 to alert ups=
tream.  We can hold off this upgrade until librsvg is updated.

Ross=

