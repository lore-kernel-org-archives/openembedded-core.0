Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B693CD5BB4
	for <webhook@archiver.kernel.org>; Fri, 22 May 2026 14:28:41 +0000 (UTC)
Received: from DU2PR03CU002.outbound.protection.outlook.com (DU2PR03CU002.outbound.protection.outlook.com [52.101.65.32])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.17844.1779460114040982263
 for <openembedded-core@lists.openembedded.org>;
 Fri, 22 May 2026 07:28:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=fGfskfuP;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=fGfskfuP;
 spf=pass (domain: arm.com, ip: 52.101.65.32, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=fail;
 b=cjYSI99qBdcNSn2Cgy8wA0ON3/mh1Jxmbpr/h/X78BjIpTe4VKE3Ti7wdSRPqKyxc2idGFw2Dc5HhbK7Jl/dz2QTYw7v4jzifvngBTcR6UR2WWechYGlo7TyipIwiq7+4ejju4O3qMohDGds64GqZ+K0uwSeHe3fIThBie3z6n7s93VIAvz3Qcg5v9Z2vfD2Edgrhut+C72JusZ/gscuHGCk5RPlIOUAdTm+lPgns0YQ7ruzPFqK4zv7SPavtjmP+hq+aNrlSP02sUhn5CNj/XGp4htK5KMPajDjIEYvc50N7Qo4bopVUH4nRbyFo8ZaoyaNEdjcE1+G3ji7U8ot/g==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QFCw8qnHJ9u+KmVBy5aWgI5/8LMe1m/n70SzmQsv8D0=;
 b=bTI49cC7cUfcPFrqnLzERrKQBABSRCay4qqpXcbSfPu7Q22Au9l6pA1JbK7QSEZQfn6ZnNLgnfi+znbpk9Jonhfi2dbnGkDuRvQPWy6jcrTIPek05YX7FYD1ZhxjnjBXpdUqpkBb/XqRfQkKI/vVxe1WmW+scWXmXWw8dcDsJKVHgNRmYSLweOfkcmXoa7HM3UM4BQPFUqOaoCmJtv0cgdg/uf85gdJ176CHnB2Qc86rI5+qHiQ2w9/l8NYjE1LHyPdSjuP2Yt1mQL2X7GCA4e9IjRy5ld5b0sFsFpbM3B8D45Y8//vKF1tFGw458Xce8b7e5eQbdYacaZo9WJ5efg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=axis.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=fail (48)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QFCw8qnHJ9u+KmVBy5aWgI5/8LMe1m/n70SzmQsv8D0=;
 b=fGfskfuPEKfkhCfQehHoSKrQPMpWasXTIfMWauC3Nh4/kjkbJYOP5Lcn3Du6XNV3+jg41S0SGcAIVXh9m7/pNMjrhHn9stf/E9VIywKyweBi7n50SVBST3HQ9BNga2rLE2/8ZewBr2Rh0SGycSFYl6rQlz3DlGWFxQ3lUVAPAqk=
Received: from DB8PR04CA0008.eurprd04.prod.outlook.com (2603:10a6:10:110::18)
 by AS8PR08MB8061.eurprd08.prod.outlook.com (2603:10a6:20b:54a::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.17; Fri, 22 May
 2026 14:28:26 +0000
Received: from DU6PEPF0000A7E0.eurprd02.prod.outlook.com
 (2603:10a6:10:110:cafe::af) by DB8PR04CA0008.outlook.office365.com
 (2603:10a6:10:110::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.48.17 via Frontend Transport; Fri, 22
 May 2026 14:28:26 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DU6PEPF0000A7E0.mail.protection.outlook.com (10.167.8.39) with Microsoft SMTP
 Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.71.7 via
 Frontend Transport; Fri, 22 May 2026 14:28:26 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LgeuXH3QdDjc29GR0wFLSgAEKKqT6nQd7qMdYGlN0qE5zNrYlgwwYYFv+ntu88nowBFkvNKm/mrGRAZ6xWVIDZTyy/1kk2+RwTC9TU13H6esCc+8k2gnTse1Em1uLhPmMhxJuI4N0jsoo27bgqnEOOeg/ZFFpjZjx8Ov/IpmIAtNcvONwuhxre8CkuNfU4Vsu+pCFAkRGcdzzo+CAhjWkMpuOUTnzknPnvGL0zHDH60WolFp2Emzn87QJQ8bATJv12q5DsaEjS1lNgjRzvfYf34G9hQ9ToRbZeNGIw58SW94JKLPaZPKXj/eHBJ2TsIrNO9CeuvATNBHj8L/Y1GN+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QFCw8qnHJ9u+KmVBy5aWgI5/8LMe1m/n70SzmQsv8D0=;
 b=bpcC9UHOvHvqTcQvxRdN86CmSjmYD+eR+lehF9vUjc1AaHCdgCV5ovXb4VTK0ntcP6IOvpRH5ufYQXPhm3o1Q4LYifY3Jm3MrMedzpTuRWI97qbtg9LAn/LDqm9YxPlP0zLIXfdgRDGQBtCXMib3HtJi2l+KaHr0K5o8uWfgznSkRUhLLj0NvIi/FYITJsGJbwiXk2STiGEKTl+uTz3f8avTdooJuw3/x7fdyjUv4KJRSASKe25dvlijkU9wkHRwXsacxWo6Oxi5aRtMJw2ZuZOz0oQrgDGh7zNdyTs5ArifnUswRcMyTdZC4K3rqugS2KLBLWgyHmG5+6m0kRPHsw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QFCw8qnHJ9u+KmVBy5aWgI5/8LMe1m/n70SzmQsv8D0=;
 b=fGfskfuPEKfkhCfQehHoSKrQPMpWasXTIfMWauC3Nh4/kjkbJYOP5Lcn3Du6XNV3+jg41S0SGcAIVXh9m7/pNMjrhHn9stf/E9VIywKyweBi7n50SVBST3HQ9BNga2rLE2/8ZewBr2Rh0SGycSFYl6rQlz3DlGWFxQ3lUVAPAqk=
Received: from AM9PR08MB6258.eurprd08.prod.outlook.com (2603:10a6:20b:287::19)
 by PAWPR08MB9613.eurprd08.prod.outlook.com (2603:10a6:102:2e4::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.17; Fri, 22 May
 2026 14:27:20 +0000
Received: from AM9PR08MB6258.eurprd08.prod.outlook.com
 ([fe80::171d:1f8b:720d:7a1b]) by AM9PR08MB6258.eurprd08.prod.outlook.com
 ([fe80::171d:1f8b:720d:7a1b%6]) with mapi id 15.21.0048.016; Fri, 22 May 2026
 14:27:20 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "peter.kjellerstedt@axis.com" <peter.kjellerstedt@axis.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH 4/5] useradd_base.bbclass: Emulate the groupmems
 command using usermod
Thread-Topic: [OE-core] [PATCH 4/5] useradd_base.bbclass: Emulate the
 groupmems command using usermod
Thread-Index: AQHc4kJFC8IIWkvplEa0kiuZoFknfbYaKaCA
Date: Fri, 22 May 2026 14:27:19 +0000
Message-ID: <D12670FD-C09F-4233-A365-2002C29DF595@arm.com>
References: <20260512190415.948535-1-pkj@axis.com>
 <20260512190415.948535-5-pkj@axis.com>
In-Reply-To: <20260512190415.948535-5-pkj@axis.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3826.700.81.1.8)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	AM9PR08MB6258:EE_|PAWPR08MB9613:EE_|DU6PEPF0000A7E0:EE_|AS8PR08MB8061:EE_
X-MS-Office365-Filtering-Correlation-Id: 405ef47c-7202-456d-b63b-08deb80e62f2
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|376014|1800799024|366016|4143699003|11063799006|18002099003|22082099003|56012099003|20052099010|38070700021;
X-Microsoft-Antispam-Message-Info-Original: 
 Ku96SvwSAkPj7rA/xPqpGwcn9kE2Omr2xiUtc9PWBNkTu6BSU+v61SGw5We/UlyEdB8UPjgTmfpx/tE+HUY3/+lCelAG2CqGP/7dsHZ+PGK/CS/I5g2qyP0zbQxbMbAMDvJrIo2LdaiJvabqzaxjZzi8VW9357Tvz6vuYCNtQNAXq9i3rDJho7b+fPqoFEZiLWco+/QkvmpmfBWTtwHdXlSavCN7J6LWU/9hk7zo2LWD11TYaheAfxL525J1uyJrDDC3KNVPQPIXPOEhbJwy5NMC6nGDmOmJA6J1aZvN63m6CJFcvKr88Y3mP6Z8SjaR04vDO8iaMKAIYO1FRaVG4v8+A2gOgrlAsovKJmCVPIJxm4X59a87rZRTiHwC65o7bp0ApFPwg7YSd9ViQIcd8w0lyUzlEoRoIyWGEM/IjFtiHLSsi7AWroW3138cSd4qmx3wbs5bkMClPul+jsTp1FLnvoe7VCmEeoSN64+usNtpfSz06W8Q6Kk0iejLE58R0WgCxNNw/ZZVfGd0eI34itMFlMw9ZS/i6cMws8D+oHWlLbjvwIMHy/8i8tkBGrMVn5xofx74V8mtNA9jFMHI0AkQAOnN0QRk54pEeWRHlIuh4OX8M7etyP0MMVBtb8BHBdUvcfGusB2ADVi5/H5Yorg5VQgvlSeoOd99RAQwKJtDnZIGPC2whevq65Cb92NR25Iuq1p15KSCbTB077zrFwyB9M82x7606HHYaNZpY3WEuDI5FqIkzY+imeeZa91R
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR08MB6258.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(4143699003)(11063799006)(18002099003)(22082099003)(56012099003)(20052099010)(38070700021);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <0D64BC6A33A6B64C91891F14FB82FA40@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: 
 kwrCEC7WCMdHXNQzgrG66z2vuShRQalEiDV4gvVWFK83MnSpuar9i1mcC6J5qk2gefXnKFQsvSl8AeSIUjhhe2D+BL/WeXiYonGK5wCW1UaSa41TvW2oywjJNvEJf+fZrU7EHnuccrdkd0ghwkJbNx5EqQTscBjhgraaAm0d+yOYflB/57zBUfeU3JGTUs8oXRtSpPbu0jKoUO7c7EIOIyoCb406QX96oQs9NJfx3mVj0jF1LjFPBGmqprqv9aZvAwB/9qXqoZDL6KCS5+hJpl9Y2yZCQS4w+2YVdYpCHwvZp7hiB5WoWlhg/Zy7O6eJl93fjhv3fhpNG5s8uDzcSA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR08MB9613
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DU6PEPF0000A7E0.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	3d320fea-3a60-4e06-71a4-08deb80e3b7b
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|36860700016|376014|35042699022|14060799003|1800799024|20052099010|22082099003|56012099003|18002099003|4143699003|11063799006;
X-Microsoft-Antispam-Message-Info: 
	dnvEHfnhRxpizPEBZdJCBEg51Oy5B5YAyY4tGtLRIpcinlbLa7wBcdTmA3c8t03yGTmnu8slA/qqvvdCvIL3HlRn66P4usycBha/e8h0Oud6OWm0crfrdNdk15swgRzAclZvLxatuY2VBDVyGZtZye2nXfDzyUOkzDTQF1dpr6S3grFbSJGPSAgtVbposYG6HP9KG6RaklaX/B5CfAeiyeMy52wC0R89XUnQA3lXPqy/C13qnLAv8a6e700EyDp3mHfQUi0Ut2aJ0dUzLwY3fj0AElHHMc4QTBb0y7uGcQ3ll2dcw4Tz2szD7Q+iV0JzuMLwMzJXI4eykHlhFKNLG9e3ycRdU1RNnWp2/OZafD98XMoTb23/N7jh5WrZkRd8CennMS5ofiacbHQ3lc+LO4nC3VcH/KxQwMetEulmKI4krSZ65l+jY2dmKlXXXK+Xv1RxaJc0ghNUFq004En2jbLvyS3ptB+SAS8IgIotfHAjUCTPM9D/uPpenbRw5yGGLNhA2Sq4qOSFCgKTWR3tPcuHjXeZxrW5KAOHO98q1y6oR/wFUVk3zMMtZ157Bw34aWt8fRSip3QKa1QXJJuUOzx3GD2vh5QWTTNFIanlMbOO7qNIPiFmFl0ks+dIoyCMLNrgMUypvH9WUa8k+hJWPrq2dK8cxQK75Pgd/P43AfSDArWSNMsSM92mNu6/lnTZHzqXyEKwTuxVYPhH8unOUa3RiznhPSCwrFL1S7yNsQA=
X-Forefront-Antispam-Report: 
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(376014)(35042699022)(14060799003)(1800799024)(20052099010)(22082099003)(56012099003)(18002099003)(4143699003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	+FKsxilwsEqKAMrSMCpA/I89ni/043JpMueW6X63U9MrXptwzNAnz7en130VvEVudQVPW//+qYxdv0NIopeU+iG1+NMhdTSjW6tyAhExN8sH9Z5p2XLTQCg14DtBocBoZ0CcKpadwd6IWsQ0uSwI42DpiVvnRoNsytoEQoRlgdaw5vNj1vXgxHb/JYNHXhW7+bU+rcvek4M9Hcjq35IsWiUXObChWwDwqXUabTkfLS60wGw6FqkxPbVKCPVkG7ZSZru8/5aKW+BHzav6xwZOLTrQYeGwjhxr1T/Pwe9fYlssTxgrzKIbvKg/VNWTXIOuZ5X60OUZIgZnnSagVr87uWK6NEIQzFZtRKoHSSZXjXNOAIN3e13Xgp177atiAVNUqyVrvj2L97dQIi55R+K0wzaB1ZalgrTTJ/yAEoLsfQ8Ag9lZa/lHdD6d00GcCAAp
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 May 2026 14:28:26.1771
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 405ef47c-7202-456d-b63b-08deb80e62f2
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DU6PEPF0000A7E0.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB8061
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 22 May 2026 14:28:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237551

T24gMTIgTWF5IDIwMjYsIGF0IDIwOjA0LCBQZXRlciBLamVsbGVyc3RlZHQgdmlhIGxpc3RzLm9w
ZW5lbWJlZGRlZC5vcmcgPHBldGVyLmtqZWxsZXJzdGVkdD1heGlzLmNvbUBsaXN0cy5vcGVuZW1i
ZWRkZWQub3JnPiB3cm90ZToNCj4gVGhlIGdyb3VwbWVtcyBjb21tYW5kIGRvZXMgdG8gc3VwcG9y
dCB0aGUgLS1wcmVmaXggb3B0aW9uLCB3aGljaCBpcw0KPiBiZWluZyB1c2VkIHNpbmNlIGNvbW1p
dCBhN2I4NDZiYTdkNmQ2M2E1ZTU5OTM5ZDc1ZDljNWZlM2U0Y2JiMGU5Lg0KPiBIb3dldmVyLCB0
aGUgZ3JvdXBtZW1zIGNvbW1hbmQgY2FuIGVhc2lseSBiZSBlbXVsYXRlZCB1c2luZyB0aGUgdXNl
cm1vZA0KPiBjb21tYW5kLg0KDQpUaGlzIGVtdWxhdGlvbiBhc3N1bWVzIHRoYXQgdGhlIG9ubHkg
dmFsaWQgR1JPVVBNRU1TX1BBUkFNIGFyZSBvZiB0aGUgZm9ybSAn4oCUYWRkIFt1c2VyXSDigJRn
cm91cCBbZ3JvdXBd4oCZIGFuZCBuZXZlciB1c2VkICfigJRkZWxldGXigJksIGJ1dCBpdCBsb29r
cyBsaWtlIHRoZSBzaGVsbCBzY3JpcHQgYWN0dWFsbHkgbWFuZGF0ZXMgdGhhdC4gIE1pZ2h0IGJl
IHdvcnRoIGEgbm90ZSB0aGF0IHdoaWxzdCBpdCBhcHBlYXJzIHRoYXQgR1JPVVBNRU1TX1BBUkFN
IHN1cHBvcnRzIGFyYml0cmFyeSBvcHRpb25zLCBpdCBhY3R1YWxseSBkb2VzbuKAmXQuDQoNClJv
c3M=

