Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F0C4109B489
	for <webhook@archiver.kernel.org>; Tue, 31 Mar 2026 15:05:53 +0000 (UTC)
Received: from GVXPR05CU001.outbound.protection.outlook.com (GVXPR05CU001.outbound.protection.outlook.com [52.101.83.39])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.22726.1774969545835839545
 for <openembedded-core@lists.openembedded.org>;
 Tue, 31 Mar 2026 08:05:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=BzTMRkj+;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=BzTMRkj+;
 spf=pass (domain: arm.com, ip: 52.101.83.39, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=FhS+ZfCPYBYX8JH4PpfB+iRb+KqzPLM6YCKOr2wxzovtSx0dS3SrA64T7UdPaDxxtMAafgarzvtXhbg5eOFRrS4F6+j98GiuLWnu0/dcDDbiZ3/T5k5g0zxF2Yo/Vn/66KZiSnt7B2IOWqWByYQhqmLoc4AnD00KRyhUwKu2MHa8gl7LcPN2x/lNCW+293mtlJxyJUVCrME5BtoIYJQ7cUgykn95Gv51+rMCCT2OpvHi37A4eF4wKosmGpcvIGOxlubyHArHg2PW+3CQOqC1SeaPWYzBgNWUrAHc5connt4RtGsvj5wTG6l8gC45B4HZtN57T+OdZxWae2kjLz0wMg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jRk6zIRM7z4FebOBljjU4MOmnU3XSN713E3j7izywj4=;
 b=guV/5NyM9EvHwBGbhtQYS2BhbDD/uNfvd1RZWtSlCMsIPugWW2gMF+feLyGWWbRU980JL/cEm/1Rss7ObQ1W6gy34zGi3e3CVWziFiNr4cNoyjSk/45y1wAFDHW2hnxmoES4PlGOBRB4pSGhSz65KKuAMnP9+YX1GupmrG41U3nKfeC5YV2xSbMlTuQ+6VXN/LEHu9z95+AdhTj8FfFGB7qkIQJUvio6DH/SPb8JCDvwWHm4NmoWjJqd6ZmeJMn8GW5oxBdD4XgVg/AjMEpfb9d7VQTCgk0gA98GPd8IEekoJUSuymhccC5Akb4Xx0KzAKDmpuTRZH70+V79qPBIkA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=gmail.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jRk6zIRM7z4FebOBljjU4MOmnU3XSN713E3j7izywj4=;
 b=BzTMRkj+xMcpW8lLTruxVAeOwZBJKLgASfTi4iLeGntPKKK2miY+KTjk4s7DibdbOI5ZmBUqzK8+6CbokQOi4fDmP4QZsJDzqOriqbxy4EDlDOMo3P5eNqAUcH4XRVnfJD7FM22/RLvgvN4EF7ml1GVKjZuX/B7t2ADKWifjJbI=
Received: from CWLP265CA0330.GBRP265.PROD.OUTLOOK.COM (2603:10a6:401:57::30)
 by AM8PR08MB6529.eurprd08.prod.outlook.com (2603:10a6:20b:354::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.15; Tue, 31 Mar
 2026 15:05:41 +0000
Received: from AMS0EPF00000191.eurprd05.prod.outlook.com
 (2603:10a6:401:57:cafe::86) by CWLP265CA0330.outlook.office365.com
 (2603:10a6:401:57::30) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9745.28 via Frontend Transport; Tue,
 31 Mar 2026 15:05:41 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AMS0EPF00000191.mail.protection.outlook.com (10.167.16.216) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9745.21
 via Frontend Transport; Tue, 31 Mar 2026 15:05:40 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MvmH6dQudJHRKLoVRDrEKIHfs9KM2WpudSyRd3hbp9VygQWy2ryfq1i3ogm++AjSqGebPtn4dOIig727wFe01ZnePjiLs50z76IMpmRE307Dl9ODS8g/BNseDK2sZQGO3HICr0gEmWMLnXIVcmnIzWiE+LrtG023oupzNC12QDyhcn4cpFVtAr3R4CD0wbzCWs8KNA1alQ9ZNjHqQdZOhfkXFoA0/rXbqmU5T1QnUs4jEFfjS7AXX/LpHumVsOe5giqsEwII8g/uAAvweA5tN3hHprpsbKfaEq0hGuUEKB29Bq6925q8cOwqN6MVCb6muBzh4TIkB/EJfouSIFSrMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jRk6zIRM7z4FebOBljjU4MOmnU3XSN713E3j7izywj4=;
 b=VkwvB5sj2i7kaRaWHy+zkMugwdnqmceg7NT5tOE4BtmAE1r2Yyry4SBH8iatUG3rPr4zJfx8xLktjiEBTMWvJdrRfXcV3M3FF+0kqU8xOtWPcHQFbkX90e3YP1uAQN0Ukkg70De8A7P9bmKe+cUcli7YxnWtqUFV5CATpyTwA3NC70osaesr0xnPoBR61M/CdZEjl/a5PWCcsn52wr3y6M0T1Y48Lw1wU20RYL6gz6rfRh94CZ+rxRHMdXll0hzd9AtqZ5FV6g6bPegI3AEfcPmQBV9+ry9VLxg/un8Sihq8fIJdh5FQYIHlJ04rM5hF6rbVKmxLfnH23s836X4LXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jRk6zIRM7z4FebOBljjU4MOmnU3XSN713E3j7izywj4=;
 b=BzTMRkj+xMcpW8lLTruxVAeOwZBJKLgASfTi4iLeGntPKKK2miY+KTjk4s7DibdbOI5ZmBUqzK8+6CbokQOi4fDmP4QZsJDzqOriqbxy4EDlDOMo3P5eNqAUcH4XRVnfJD7FM22/RLvgvN4EF7ml1GVKjZuX/B7t2ADKWifjJbI=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by AS2PR08MB8877.eurprd08.prod.outlook.com (2603:10a6:20b:5e6::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.28; Tue, 31 Mar
 2026 15:04:38 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::7f73:806a:3493:7d50]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::7f73:806a:3493:7d50%6]) with mapi id 15.20.9745.027; Tue, 31 Mar 2026
 15:04:37 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "rybczynska@gmail.com" <rybczynska@gmail.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH 1/3] classes/vex: remove
Thread-Topic: [OE-core] [PATCH 1/3] classes/vex: remove
Thread-Index: AQHcwRHDMM2buOT4+UKIWvUT2idtcbXItzgAgAAF+oA=
Date: Tue, 31 Mar 2026 15:04:37 +0000
Message-ID: <38C0C321-1456-4C35-9AA1-8B4CB8BEF6B1@arm.com>
References: <20260331132430.781647-1-ross.burton@arm.com>
 <CAApg2=Rnrr_ZijiZ4cxKvkwmeCOssHXVfNHi2hZAywuhNe+F-Q@mail.gmail.com>
In-Reply-To: 
 <CAApg2=Rnrr_ZijiZ4cxKvkwmeCOssHXVfNHi2hZAywuhNe+F-Q@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3826.700.81.1.4)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|AS2PR08MB8877:EE_|AMS0EPF00000191:EE_|AM8PR08MB6529:EE_
X-MS-Office365-Filtering-Correlation-Id: 2dd1ae6b-05a5-4a5c-a6ba-08de8f36f92a
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|376014|366016|1800799024|38070700021|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info-Original: 
 gX/LZh1vBwezGhVTCvTPP+Rt1EPstMrRuHfuUOMc7JK/ZST5RT8YFfk2Xk/J0V10MCWwNVLyL7BGuufG5NTFHoxK55Ux/ljf8SJ9W2YWjZitDGCGa+g6kUD/XICk9Vt27atjzx2ZSIFVsowS0Da5lEMPOCHE2SR5dxKbPLPiknPLfU1VB7zFtCcg5BSd/OEKCb0CQbvsWQx92TyMp4ez4TQ2bfgtQR7KCEQ/nSn9+rCjyBjxNXuhiVVk9RyqUBlxhOgY5Ta7myMuBBveKCRtpnf5a9q1BL7u6yWISrviHHcF0iLPM57uIh9UmbsQpzzjmnuq763U2IUje16J2b85+/xto0r4SppR1XgsBuDTOsYxS/mHmQo5ufcCF804rawwiFH2rRAeZjCuYNH/NtM6I+hF+6vBhgpxRJX9tx83bkR90aMzeEvCoo5+ph62AvxKecM8ln25zzz89HcwGsjEGTOT39yFAxUQk/lyseMOEY6pgeX6LydQvFD5BLjtf9dIPM9Bxa5fmCBo8TbFw2+deYzHIK55QK3ycsaDh15uYS0n04kkI90FwqCb8Ypsa+b+xxyUgJ/OEjRZtD9iHXducMQvl5/ZRTXFDH4tx06Q1iIH+5LFfd2B2CD5WJpxkioLzFpCRLI+Hir5pfXw59W1FmU0V4oqq+SQbzq0C4bDAwDIwtuS0HU5enVXX/vZ/U3nMzPMWBRJmkTKqj6qVSHyFk/v22qLi+GarZ/yw84PRaKNnYfeDhtIQnrgW6THSFjLBOwCTaiDztPqTl6oZRQDXs1H34m9mBJ+2GxPaXL8WjI=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700021)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <7A4388C87612E14E869D6107E87EE7FA@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: 
 XuhNa1e/hMfIr5VRgjEEwV7xJ1SLWmRC4Ufri9cD+BQxhY2l74ZMv21Bd64UCOYxbyfUk07pbmxufJ+c0O9O5CT8JZKN9htKXjHxm0rhyUk5rkJkik2u+l7meKfmrHLDp/TMqPjGstLfXP/wtB9l2qRkHq1NM0Vq06MzRPnTlDytmInZaaneb4qbr58MUoE+9KHOZToIzzGvSAveRP2hBfT5vmNvYvnguDWYXoC9aDVMIXtRaB5DahNnaP8H/pt4iRT2hPSzCH0pf4jWSS79F9yPKTrwB3Q+Ncxfyr23cMVpoq1YXrFOevbUP4V7G9Evn4DPkI555TFxgo92Z2Tl/w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB8877
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AMS0EPF00000191.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	4e6cc1e3-e715-4f20-1149-08de8f36d3de
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|376014|36860700016|35042699022|1800799024|14060799003|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info: 
	6PhpylfX0ygJJZNiDawskLAUOdGA834Obs1HOX0g03V7wGn5I2VmlhSyGNhQmAPKDaeIesEbCxS1jK27I0ltmR6nT1RgpJf4aDKtzzoOIxjjbu6YMWqxiNLZRB3Bf9eEZds4UwOF3G3p2gCpQEV9Cc6SlwHn6Lt9HBqC0zHzozcqyz5wlF24hMZVE/EBwx1Cw/ccZu7Z4tvQ47O67OBuXYYBChWLNvPY7BBOeXojnj628lVHzJFcwtfueBQbczhFCQHXePs1Rtc1M+0aCUpqbhVPe1hJLkOPvZhiJ10r90uxoigCUDpZ/aHeuBZ9BD/vyQQu9dmn0+KZFYw3qSvZq/RqFbIG7yWql2O5T3LbJ2i1uJ3WNHXorHvxUt96KukpTQiQHOdnlz9iqmRv7Je+kq24wZIhvnB4c0WOBnnsxR7SbWWZWIH+bLO8+8/wjJC2POLQ3Cbk+p+TNvCqPOCFDyUvgFLlXIJBXqldjB+JxHBeLBSqpzTmiZTuRsd+Qek3SBPuSVL5Aq/lDIW+iMMGp35ulBNY3JPRrdmxqnAPXdcwtqICSCyE4m95CrhFKT9TdMBk92T6cmCSOSe+Dzgp8a03W+D0coD1HTrqDcS3T9VGNirDH4whQSvSPbEXpR05euEhuIJd/3Sj+2rW6k9EOw37y8S68lkK+5hhZenJx7XAtglTz3pKRwwaZ9xdT0fO/iTg8jz3W0bOhWB93PG+n9DeA8om10n5h9llOf7EPSEDcfz6YMiI9meBytMZ+vWIM54cPWry3A5csasCvEd8mg==
X-Forefront-Antispam-Report: 
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(36860700016)(35042699022)(1800799024)(14060799003)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	V/37fKdxXE7RhNYktlYCe5z3OvRU2ADfufFu5VmlMgmwo5b+a4u2kdX/GIR8tpxRvhcaQFnN2eozf7LC2HL63RQmVEbIbsLkHSEBncSXu8M1DTiCsBedusjLjC7ub01tzgtAFl3KF6YuTvCbUDJsMAPw+/p3BP5QvtQkmzt/hmX1zQ3gIw4Vi33+FiaMYvw/YdydASdJpHBi1DBEOhUWaH6tWehwQUf6eRaF+iuGO86YhkIUTTdwRb0QgpVw8Ru2Eskw9f6+rdm+KFqXzmUQfREq6hh8puiYNCtUcS4JIHMn1550NCTeOspXJj1kaBg/Eun7N9Lwk/vp4+gIrAVO4WaGUySX4gpDnKP5LTzrYsnOvu6TfGEzUa2TYt4G5yz+OCNSpG9o576Gqo7O/tFIVsHun79B/rlAxIzHusvm0dI/hmkiuZRckYenQt3jZbQh
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Mar 2026 15:05:40.4058
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2dd1ae6b-05a5-4a5c-a6ba-08de8f36f92a
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AMS0EPF00000191.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR08MB6529
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 31 Mar 2026 15:05:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234299

On 31 Mar 2026, at 15:43, Marta Rybczynska via lists.openembedded.org <rybc=
zynska=3Dgmail.com@lists.openembedded.org> wrote:
> For the record, I do not agree with this removal. SPDX3 has still not rea=
ched mature usage outside of the LF ecosystem.

Is there an ecosystem of tooling that uses the Yocto-specific JSON format t=
hat vex.bbclass generates?

Ross=

