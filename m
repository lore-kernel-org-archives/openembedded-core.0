Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D5C6AC43458
	for <webhook@archiver.kernel.org>; Mon,  6 Jul 2026 10:24:16 +0000 (UTC)
Received: from DB3PR0202CU003.outbound.protection.outlook.com (DB3PR0202CU003.outbound.protection.outlook.com [52.101.84.12])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.147102.1783333448594549447
 for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Jul 2026 03:24:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=RFtWmSND;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=RFtWmSND;
 spf=pass (domain: arm.com, ip: 52.101.84.12, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=lTIQpTscQZGhQN6oIBSQSx0suV0EbPLVEP3lkOg5A2TosbzUwllBy2KDMgZ6DqvevvSn+1lQdoeI7CR14KTdcU7Gmb8Cjg1HLhg1Lynh5LarS6uf9nN6ZvBYlPix0JmlO9+b6VVS8AGKVTlDplfvpRXbg6rx3/D4uwj8SnKYCE0dqU0oWXjDMVqjyMmXoW+vnRLJ17B8VJyGHWgYHd96okQAay120xsNrSqNyFH/pp4XNbkUgsU+Rw7hgyM3iUv/fyUx2L4BF8tnQKq9y6zTNQYwdvMtt09ehKjFgjuFzsUQCRvqk198c1i9V/kf0jCKxhFlgSMXeRII7bq1af3jVw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hxGnqoDYkqaIA6v+Ax0xUgh8rAbGNHaLe1aScBrDjl4=;
 b=uC18d/3hIEivKMWc0Ro0djx7cKbxSCNrbtGsqQiqqxY1G6yUDiRF5LPGf9WsWGdf2bryShUEnICj+9ayXZYkCSSRqao5NA+Kyd5xqnadNLIKtrOL29A5EKlBlrhBWBLeYVnXttg7zm+Yx4FL2k/0WbCpPaWJ0Nkto2rBZdsoclgOLGb0mS/QDFbEeJhyi1XW/B+C5eqlffq1mxUuLRRfYWn1zO8U3kUulGuOcejvXWpEBv+G1/xg967K56IIpsZ1U/HMox5P0uiEnVDSfwAmA1e7fYja/u+FeyFDTRL4zFQPeU/pIh/zFXEWmFjWKVHHWcxfcrJwHMf+iJkjBMWWLg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=bmw.de smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hxGnqoDYkqaIA6v+Ax0xUgh8rAbGNHaLe1aScBrDjl4=;
 b=RFtWmSNDD3jd66a67HpFSapxX15e1p6/ay0fv1mxij5cBmu6PAgmio9vdGhbzU2AyrJ20Gim0QjCxOPPQHFPyz/DZOnFHAQmsWZG9oabtO7xYEQ+4F2zIdwkWMS0ALohpJcSnL8kWwt0xYPmc2h+kqWCHtPdbcX1B4kpY4gnxF8=
Received: from AS4P251CA0022.EURP251.PROD.OUTLOOK.COM (2603:10a6:20b:5d3::14)
 by AS8PR08MB8013.eurprd08.prod.outlook.com (2603:10a6:20b:572::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.8; Mon, 6 Jul 2026
 10:24:02 +0000
Received: from AM3PEPF0000A79C.eurprd04.prod.outlook.com
 (2603:10a6:20b:5d3:cafe::80) by AS4P251CA0022.outlook.office365.com
 (2603:10a6:20b:5d3::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.181.13 via Frontend Transport; Mon, 6
 Jul 2026 10:24:02 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AM3PEPF0000A79C.mail.protection.outlook.com (10.167.16.107) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.181.6
 via Frontend Transport; Mon, 6 Jul 2026 10:24:02 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PTGfPYTM3bsWJ6d5ivDq7Niqys9Wt4iQZZFqhuk+NlOS1iCrM/4M36DFVsad/rLMAVPHP2UQ25dyIPL0e+MXszc83Pa1NPj22Vte2/j1s7i1mZehW7PF5wQdtPoMPZjVtEeZG/o9RcVCngvG31k0KNgpazI8qoqw4KHXKyUczz7KJQQwDfjKHvgTpW9IprhxinQe/Wd0m0pTIF5oz6C8MpSST1wRdto4vEBUyylNR8EWYmkybR1bkPsShT4iRoWQLa9sFFX+920Mvlne5CbqFfogPjMciwTHR6HhvXVoDcjV3bDx74LJ08pYo4uY3DLGVaWcrbZFLgxY7JF3OMjHHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hxGnqoDYkqaIA6v+Ax0xUgh8rAbGNHaLe1aScBrDjl4=;
 b=fWuKvF5/kn4GRJ24QdOoowD5aFNYNxuXB8LEVBuP2pfejSRQM0L7UXgqnNbemgsvzMwIe0Cb0Cis1Y1zBtqfFhNTCceBeNbC3/5hKtW1Vuxj+1D26sXasNJHumBahSe4ZeLmFb24OPU8VGsrJ2+eTlaZHrYKPEYOycOLSdmvAUqrmDymoK1NlJu/K0mjEWfzTFOcbDUXXu/C8PaJatyAtxy/8jQiHD0ZCz8xg48GvaBAtBjap1z5TUhygiN80cT/I6FdUQMiHVq4WR1FTW+GCPbzas6vaBzloiNn6bIQTTxuC1tiwsbNCjzuaSv3GsvzxFHzNBxsNA7LqOzwBVSLGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hxGnqoDYkqaIA6v+Ax0xUgh8rAbGNHaLe1aScBrDjl4=;
 b=RFtWmSNDD3jd66a67HpFSapxX15e1p6/ay0fv1mxij5cBmu6PAgmio9vdGhbzU2AyrJ20Gim0QjCxOPPQHFPyz/DZOnFHAQmsWZG9oabtO7xYEQ+4F2zIdwkWMS0ALohpJcSnL8kWwt0xYPmc2h+kqWCHtPdbcX1B4kpY4gnxF8=
Received: from AM9PR08MB6258.eurprd08.prod.outlook.com (2603:10a6:20b:287::19)
 by VE1PR08MB5789.eurprd08.prod.outlook.com (2603:10a6:800:1b3::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.13; Mon, 6 Jul
 2026 10:22:59 +0000
Received: from AM9PR08MB6258.eurprd08.prod.outlook.com
 ([fe80::171d:1f8b:720d:7a1b]) by AM9PR08MB6258.eurprd08.prod.outlook.com
 ([fe80::171d:1f8b:720d:7a1b%6]) with mapi id 15.21.0181.012; Mon, 6 Jul 2026
 10:22:59 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "Moritz.Haase@bmw.de" <Moritz.Haase@bmw.de>
CC: Richard Purdie <richard.purdie@linuxfoundation.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>,
	"mathieu.dubois-briand@bootlin.com" <mathieu.dubois-briand@bootlin.com>,
	"alex.kanavin@gmail.com" <alex.kanavin@gmail.com>
Subject: Re: [OE-core] [PATCH v3] json-c: upgrade 0.18 -> 0.19
Thread-Topic: [OE-core] [PATCH v3] json-c: upgrade 0.18 -> 0.19
Thread-Index: AQHdCtpSY+JYB8d4LEafuBemOhq5xLZgNQgAgAAIsACAAAiKAIAABtIA
Date: Mon, 6 Jul 2026 10:22:59 +0000
Message-ID: <3F9C71F5-92F9-4A23-AFD9-1B1A2D8C0CC6@arm.com>
References: <20260703105349.1664278-1-Moritz.Haase@bmw.de>
 <ebb0c3d6facbb9d88be4451aa981363d65c19d67.camel@linuxfoundation.org>
 <CANNYZj-ki4BiFoP1aYtDDs+2sngrV0T7o6Yh0KScuUHGu2TEVg@mail.gmail.com>
 <AD364370-1FC4-4E75-90DB-5DB5D651F9B2@arm.com>
In-Reply-To: <AD364370-1FC4-4E75-90DB-5DB5D651F9B2@arm.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3864.600.51.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	AM9PR08MB6258:EE_|VE1PR08MB5789:EE_|AM3PEPF0000A79C:EE_|AS8PR08MB8013:EE_
X-MS-Office365-Filtering-Correlation-Id: d4e757c4-181d-43d3-63a1-08dedb48b33b
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|366016|23010399003|376014|1800799024|38070700021|22082099003|56012099006|18002099003|11063799006|4143699003;
X-Microsoft-Antispam-Message-Info-Original: 
 k4Igv9Rgar79XPUr5zjAHiKUjlkVXnmS3tmzskNwnTvRLFwKr+YPYwoyeeUUl/ZesLQZpi/BbNrkTioDuUvxI0Zr6eTMFCqoDPDv1BiOT3Eo8ZHIirksR8fanm0zqrs+Ghmc5qnayDwu7xlO7n9feF3XtrFUSy3hJrl+Ejd0R1s6JSxO9Y6LCXmcY2dZFUOkTCrCBfWAUGW5HN9F08aynQJnRVRhrTMYO8ffcLt04Dp+KO/C7roGr+rKSU3iqj65xr9XKveSoBFY8kvXP2o5dMJhSWP/dunOXZfTeUV2IhtuUMt7VHz5v/VdQChAuNnrlbLeGYoxR015UAQ5R+uxzjhR11w9bjNpvIy/NUI6INQ+bKq6jfsGoG9OhSFe6A8KAV36dU40U/SMgDc6u9/qLtGjsJxV7LDRZpLbNLhtimhk51zVp2KY6begeJKiaIyiUnudHf2aw4Lk1M6EqQsrMZw4AUMayqqW9amrl9BRP0rn4PHNEuhh2t47gtYaL0kL8SN6L6yHLuc37bpFpGF8TEBfHC+jDxFEd0nBXcIPQ6NbkZnaMid4U/rl4yqnSi8emHaTxP3Z5qctlNNZzUrBtCR+NVzOikFILfcDH+1mRdtmLD35fY3g0mMA+FNq7IXivflP+MMr/tzqBmzF8GQGPgFt7ZIqMGiEb9nSElkwilaV2FBDglyJgXoXMickh/WnGUQ3MuY7V50pMUwrPW17qwsQMHvEWNWBQ8v1QUlhXRg=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR08MB6258.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(376014)(1800799024)(38070700021)(22082099003)(56012099006)(18002099003)(11063799006)(4143699003);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <A94B66EC3F3C7745847259B178D5F7B6@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: 
 AoMJNua9ncJ63Fc8/eOMS0n2DxX0t1c7QdFSIXnp1oOLLMPgQd8RFeSihS02p6UoBqo8cngNiis4yqhb3MotgVQ6AhJxa90/QypDTdoTLV5f7ZAxF+ElFDCsPSKr1hWKfKUQxzOSVySvvFb18uvTgFAOYDt571I6tiGbFwpQegvmKk2wI0S6D9O+VNciYLgZoDP5/N6+TqZbSjbCaf/MZj4NGnwGpRbBSr6yThBQNKAxrErIyjEcyOZOBmokC+ps98NqK6Sgq8D2tjqBIWKcoK6WIK37r2oohdNGlUXa0FAJUUsmIFo50x19ZdYUUP0m+Aq5t7TBYKqk8I3gQEjSwg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB5789
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM3PEPF0000A79C.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	70fa0a87-d0aa-4f50-7ea7-08dedb488d92
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700016|1800799024|376014|23010399003|14060799003|82310400026|35042699022|56012099006|18002099003|11063799006|4143699003|22082099003;
X-Microsoft-Antispam-Message-Info: 
	xnTGCnUp5mid0cr6Y8CwbSNYCLUXcLUPcu0LgGnlLr7E4+iWzE7oP+vNMlOWn1b2VfsYFd0T8xsno/RV/F9h+ya/DFIAU15R9GiXKnEyehC0T1BwU2z+RJHV27663d1kqeTvnSA5ZLpdwdGxEcAzXOdfS0FHp19KklbsoC6QObtCXd9rc95GBq1SCtHimusylwYaK0wpPxEvYdxPJF+gJ9M3iSjr18FnHVeSLnbFx0izlR2FfWyYnondxdHfw0yCt7DGwRswxpmuiVlQUODmLyHgRrpYldzOoMezC6s5epbwG8sThnrFJmeXTpxFuOsESS26viU3N0ZYgYUJt+dnMpq42W3l3ZRSceYhijED7E4AUBmKYQi9Wv2sUexOCwtGZ5WaSsmD/5R2bs+ss3xfWa4FXKv2NVRCFETsu5z95VctC4cMQZY4oQCxk+W8hbdkjefO0X91S88KXHOsY1ghzLlmB/5zAjDiBUA/5bczW+mr1yt878PuQNeYG0cjUNDG6Ep8b0b+z9+7Lq+f6bJd3W4UrMLYjB3qo6sHjTxzcaWLAMAS4dmI58Q7RdOYvWG1VYr2BYgy82uZuouR+ylw40vz1+YpFFwABOXWBS548GX/dl/QdZ4EvOXeGYiwQCOq8NyptWCzCa/h1t2B/tYJuuzbweDTvqXmwvmyJpbWOUH4MUHYwHkjhPz5ocKJurzwBGb2lNaUwx1JXZvDtYy6KQ==
X-Forefront-Antispam-Report: 
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(1800799024)(376014)(23010399003)(14060799003)(82310400026)(35042699022)(56012099006)(18002099003)(11063799006)(4143699003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	12FCB2+RKnpthHK1yp1rSo67GL+xARe1Zm8aj6ktgAxY8Z6VhnpjIoguJCexLfWEasgzDId/tC3GjiRJe3+zSh7P/m2U+qqaHSVLAB0oW3eyUYzwOIGaxtE2b4fp+l/86g9jSstltez5Alao8CYMctIqFcAI/Kj7cN0ZdA4StzWb2Q8HwxSuvJEWuH1mGmUC3beaJFzFoLm47lbnLUXR6ftbkLRgYqTTUVD2BYTn0dAyZBY0fzBM0yCLQv3pm4FZu8Y9E5HvLT6bd90TvD/Q9oqENDKz4I1zLofX2PzdJnF+pxhWgJR86BequS8VXf1JsNIRKCdF6O6FzVk8lkSLtC2amb4F3QDHHl1diA6ZT4Tewy9vcxl31yiRkZQIrCGc4b0RJD/NdJ7LDqpBIt3lP0RGokG8AnP7S79Zk2aRc/2Zcko0CBC9B8ZaQJRxLVvs
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jul 2026 10:24:02.3398
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d4e757c4-181d-43d3-63a1-08dedb48b33b
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM3PEPF0000A79C.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB8013
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 06 Jul 2026 10:24:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240238

T24gNiBKdWwgMjAyNiwgYXQgMTA6NTgsIFJvc3MgQnVydG9uIDxyb3NzLmJ1cnRvbkBhcm0uY29t
PiB3cm90ZToNCj4gQWxzbywgYnVzeWJveOKAmXMgeHhkIGlzIHN1ZmZpY2llbnQgZm9yIHRoaXMg
dGVzdCBzdWl0ZSwgc28gSSB0aGluayB3ZSBzaG91bGQgZW5hYmxlIHRoYXQgaW4gYnVzeWJveCBh
bmQgdGhlbiBqc29uLWMgd29u4oCZdCBuZWVkIHRvIHB1bGwgdmltIGludG8gdGhlIGJ1aWxkLg0K
DQpJIGp1c3Qgc2VudCBhIHBhdGNoIHRvIGVuYWJsZSB4eGQgaW4gYnVzeWJveCwgc28gcmVzZW5k
aW5nIHRoaXMgd2l0aG91dCB0aGUgZXhwbGljaXQgZGVwZW5kZW5jeSBvbiB4eGQgd2lsbCBzdGls
bCB3b3JrLg0KDQpSb3Nz

