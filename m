Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1487C5B552
	for <webhook@archiver.kernel.org>; Tue, 10 Jun 2025 09:49:15 +0000 (UTC)
Received: from PA4PR04CU001.outbound.protection.outlook.com (PA4PR04CU001.outbound.protection.outlook.com [40.107.162.28])
 by mx.groups.io with SMTP id smtpd.web11.82724.1749548953269023200
 for <openembedded-core@lists.openembedded.org>;
 Tue, 10 Jun 2025 02:49:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=NPNjgjXs;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=NPNjgjXs;
 spf=pass (domain: arm.com, ip: 40.107.162.28, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=i/9iOg8dVP5IQ9vyHoe71/a4m3LdLml7oT9y7+69q+GKDybxfBRl5/Qf7MezyR5CjmZ10S7BmPTRa2pnD5fw68jE2dFDWw6JYWCQIXfGbe6tJTGu9cvoINRwPdxsTAiFLnBE8Gu6HtMwmLvhs9aqgGldx6e5PPDX3yJZX5KmAuCSvchAnCSJDx/+1/M0VQZ/0ALbQRgD8nyMIpeaUnvU8rmSzbaoNkgYGo3XElugFhrrgT2OqpjeooQZ9u3snUnlPU/DgqO4wLZs1Trtmx7RV80Inyv6d1akAO18wWrBEFl1fVDo3+iP+8AIgAdyMYepfOydJEGWVo/CJV7+gFzsbQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BW/rRIKQzL3pFNinjoLOwvkmalS24G6u4U9KAnT2q+8=;
 b=t67EjdmHo1JPhojpTb+W6VsQiBvrTc5n3W2gUjPbb12ysA2hUSIB/C1T8XSC0S1G3iDxUHk/0XwszuOVhwb57l3tuyQx7Y4+70kZ8ZWJ9HDVxO3QqTtm+scTlYj7tovODIKi10H0dfhXj+wfgP9K2+1gwJcah4+tm4syNzP6x6lU/g2cJzw4cogon1VDd+ihryx4FEPJLQ9Ko5e/3+ZWy7ni8jBmYLeiyiL/enh0d8JyjdGQbogeHOGKgo1g6mcPfRyB7q3GF0Zsn1qnFoxcTg89xlMXHBlLDnPLxhsasiYvwVlnCLuwLMDNjF+4Hq40PSxFoignCaDBIh9QpiI3Tw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=skyrain.eu smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BW/rRIKQzL3pFNinjoLOwvkmalS24G6u4U9KAnT2q+8=;
 b=NPNjgjXsppx5UmfcVByxeqzjw49y4pOSAmk+Ywu4xZnJAE2hrE8ngwWIJVcsZVHRz1hr8Uuz7QiX7q/8F+MsS+DPpXzlr1bkmBfSeuXLiMPYe1Wud2jyaqeEbHQGIJ5lGWlhuciVlRPVwBl5/SVEuqSrZktV0x6240FIHABUJKk=
Received: from DUZPR01CA0084.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:46a::11) by AM7PR08MB5350.eurprd08.prod.outlook.com
 (2603:10a6:20b:101::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.27; Tue, 10 Jun
 2025 09:49:09 +0000
Received: from DB1PEPF000509FB.eurprd03.prod.outlook.com
 (2603:10a6:10:46a:cafe::b4) by DUZPR01CA0084.outlook.office365.com
 (2603:10a6:10:46a::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8835.17 via Frontend Transport; Tue,
 10 Jun 2025 09:49:11 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DB1PEPF000509FB.mail.protection.outlook.com (10.167.242.37) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8835.15
 via Frontend Transport; Tue, 10 Jun 2025 09:49:06 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=h4jC3gsEGYUXBnPaXXkyIqp8tC8kYtHqCgNZOI8ycJICq3fZXgY4Ca7IsQAHCjGkbqZjwwH7XVpQ6K5bMQZ25pJPeeiqioK6PMKAbSXhAwm7YtlPJ0n5CNrJs7LiVNhFn6JikjWa82xQ+go5T3CCwKuFBh1Jel3iHfbZvkik0XAh4Kcciq38KBrSW7PyGSCPLKXsnoouYsXzqVd0PgrhSUXFT1+f27PgUEJTT3jiPDqOUC2hmneWeYuYaPPoZfx1wEReAoeRRY8RzVQg4Dq+uw26fNaLyPDFvNIU9d+U5sxumPvvC9ueYAcQer9cK1NHK5JwjEdcNmZLHMlqNN1BlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BW/rRIKQzL3pFNinjoLOwvkmalS24G6u4U9KAnT2q+8=;
 b=v8G6aOlLfEZRmiUlDRPZV1A1/EkG5EnMIO/o/zRo+d1PDOMDs/Ma1kTrlZuSc9z4jnx5f4nIHfrRdUJHlrNVu88KjdyD+0l5gg8StjGZMVh33ddmxDc2dB2a5IPOF17wgTiE7YOWrwvr65U74VKLCzmd58YQI7+A/COxV8WB9Sz8L8hKc6Plz26OyP5/BJZANZDvWZ3mzonugGvnmeicdrT/JIFYw2DvjMg7yob8SNLtkP/W9SHPfLXq1U+3vRYxWOZRzlMmVow5CtguSmBYYZRHDSJqPIJ5GBtLKxx8NaeY2Ae88Nk//VDAdrVmYXd2gVS5e4j7nAihX3SBal6wuQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BW/rRIKQzL3pFNinjoLOwvkmalS24G6u4U9KAnT2q+8=;
 b=NPNjgjXsppx5UmfcVByxeqzjw49y4pOSAmk+Ywu4xZnJAE2hrE8ngwWIJVcsZVHRz1hr8Uuz7QiX7q/8F+MsS+DPpXzlr1bkmBfSeuXLiMPYe1Wud2jyaqeEbHQGIJ5lGWlhuciVlRPVwBl5/SVEuqSrZktV0x6240FIHABUJKk=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by DB9PR08MB7606.eurprd08.prod.outlook.com (2603:10a6:10:309::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.30; Tue, 10 Jun
 2025 09:48:27 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e%5]) with mapi id 15.20.8813.024; Tue, 10 Jun 2025
 09:48:26 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: Andrej Valek <andrej.v@skyrain.eu>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [oe][meta][PATCH] dropbear: add xauth runtime
 dependency when x11-forwarding is enabled
Thread-Topic: [OE-core] [oe][meta][PATCH] dropbear: add xauth runtime
 dependency when x11-forwarding is enabled
Thread-Index: AQHb1frgn0fs/V7HGEKDOskq7bqkVrP7EnGAgADnPACAADPvgA==
Date: Tue, 10 Jun 2025 09:48:26 +0000
Message-ID: <AF9FAB4E-BE9D-4628-9B4F-EC8887629AA5@arm.com>
References: <20250605091828.50442-1-andrej.v@skyrain.eu>
 <912349A0-C95B-487F-80D0-D5402A94ED30@arm.com>
 <e36d3a92-1548-4bce-af35-cb35b4327bbe@skyrain.eu>
In-Reply-To: <e36d3a92-1548-4bce-af35-cb35b4327bbe@skyrain.eu>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3826.600.51.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|DB9PR08MB7606:EE_|DB1PEPF000509FB:EE_|AM7PR08MB5350:EE_
X-MS-Office365-Filtering-Correlation-Id: 6eb4c234-3908-4466-66c9-08dda8040aa1
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|366016|376014|1800799024|38070700018;
X-Microsoft-Antispam-Message-Info-Original: 
 =?utf-8?B?L0pZRTY2YmpjZmh0YlhHSUErT3NCUytWSGRTOHpyN00xUFF0NTNNQWhWNlZT?=
 =?utf-8?B?aVlGTjc3U0FIMW5IdEp0aElKeWh3RWNhQkJrdFNsRTRlSWYrazhhTHFNdTFG?=
 =?utf-8?B?UGZ3SWtLcXU4cjRRS3k5VU56bVdldWRrSEY1THdpMERuZWdGS0FLVHdIZ2t2?=
 =?utf-8?B?MDNXWU5NUDRGWFBEcTlGbkE3dkdKL2JZdVhKQ01XWDdaRXBLb0FzbDErOG5C?=
 =?utf-8?B?MzI0M3RhN0ozMlRXQm04d0crMFo2T3lza0FSMGp4OWxTOUhEUXVWdDFRYnB2?=
 =?utf-8?B?ZDF0V1lMM3NnQ01iZFMrZGg2SGkrekpiTWQxYlpoUjlLM0E5cnZ1ai9Mb1hS?=
 =?utf-8?B?L3JFYThwZERxZGp4NTlHYkdTUXRqZ1I0UHpmajRYSFB1SWtXL0xFZmhsYnNi?=
 =?utf-8?B?d0hnWlNWOFlpMnQ4SFBzdDJVbHpWazJhYXphaGZYeU5FZS9ZMCtjQWhnRDl4?=
 =?utf-8?B?aVpYOFZVYkl1Rm1IWWZNOVAzNmt4Zzk2SVlSM2pHWHAyNDE0MktWTlBmWUpL?=
 =?utf-8?B?emE0SWQwNlJsMU1ob0RtdVEyYyt1RXRkVTdpK1hMT3Y3Zndoc3ZUVlhPZVJM?=
 =?utf-8?B?dEw1ZG45SUJOY2xicTRBQ2ZCdzlJQnZYSGtsSExTYlRvOE5uSS9NdUFyZElh?=
 =?utf-8?B?WDJJSVFodjZsOUtqWHRyalRtMHM2d1JMOFBTbFhSRnd3RlpaejZKMm5GTzhx?=
 =?utf-8?B?MGhEeVp1c1hnL3Y5ajJlSDZnVTRVazhBZWZKQXhicWw0N1dvdU1LY2N1OEpI?=
 =?utf-8?B?T0pnREczTHRSUllUNmsxZzBCZ2xWV3laaVRWbFRXTTNQZE9oSXFHS283ZE1O?=
 =?utf-8?B?M2x2QUlXYS95TU1TMWIvZDVEd2JwYjltcUZJNjh1dnp4WGRXVnRLejc3Wmsx?=
 =?utf-8?B?RERoUmd6c0lWZm5xYmFCc1NPMzhhWDN4dlM2c0MrcHoybUxuLzNwbDB6NWpa?=
 =?utf-8?B?aEJ4a1BBemxOTlR0OG1BZmswZm5PdE82NkxQTWhiM0VnM2piS3M4cjAyd1pl?=
 =?utf-8?B?aXI1TW5yNUdwcWJQZ1o3NEZBQ25DMTd6U0pqMGR4NzNkMjQzZ0hFWGFiL1RO?=
 =?utf-8?B?Ti95Rmo3RWw5NlRuZHpZTkpsK1BEZ1hReTVTRVNPcUxjMU9lSXl0L2hZNlVX?=
 =?utf-8?B?TEpTUEx6VkNJZGtPQ2k3ME9ISUE5MkNFeGVOT29XV2dPeGVuYTlMbzBhRWtP?=
 =?utf-8?B?SUd6VTRrbjY5WllOMmZBbkpUb25FWVlxS21pWndTUW9MYUc5UTBqakFQaEt1?=
 =?utf-8?B?TnhQblEvMmpQNzVSenhVRXRDQUViWm5wZ3ZQY1BHSjBVVk84Y25oYnhWVnM1?=
 =?utf-8?B?SmNzeGd1TDB2bzJUTlI1MXZ0UG40RTBiU21ScC9vRTU2d09ldmM0YWI3OEQr?=
 =?utf-8?B?aHRqOHl0MzF1RXd1cFpVTVZiWmEybVQ3RDlaSEV5TDl6WEZ2T0hKdVJ3ZGc1?=
 =?utf-8?B?bkduUVBrNXpNemt0MVBVZVRkWW1PWXEvYTBDVXV0emYycTlXNzNSc0NMc2pV?=
 =?utf-8?B?cW5tdjlzYXZYODBZM1Y0QmE4Rkd2Ynh5REtrbnJ1RlhqbWhKVmVrNFczL3Vt?=
 =?utf-8?B?dWtKb3JrQU1malNra1Q5eTViVC9LZW1EQ0JWcS9NN1dwSmhoNzJyVmlKaDM4?=
 =?utf-8?B?VVI5RzlMeXZ0RlFMdVJEQUVCWjJXSW9ydlBySi8wSkFvMUhJVXNhTlBJcTJw?=
 =?utf-8?B?NGNtRjZWcHIxTjVOREdFbCt1YSs2NnJwdzVVL2VaSXFzQXRMVU0wallRK0dw?=
 =?utf-8?B?amF6ajlLaWRLNEtMM2QxTFM5L0NHMHVFcTEreFQzVmZ5TFNYZTgxb2IybGFG?=
 =?utf-8?B?MDJzR3NzMkhscU5tcHpGdDRBYnl3UGlPZGF4dnowQlFGbVRMbk5FdVVVN0g0?=
 =?utf-8?B?akYrc3BBSC96OEtZT1g5SVZJOHhqQWtnV3NmQXFxbTJzT014blQ3dlVNMWM5?=
 =?utf-8?Q?zwr/55+TDko=3D?=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <469915CEAA231F459B64AE2DC82D9DA7@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB7606
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DB1PEPF000509FB.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	a67af81b-7f8d-4c6d-28a7-08dda803f282
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|14060799003|36860700013|376014|82310400026|35042699022|7053199007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?VFJPR0h3U3NOa2JabCtDZ1cxdEkwVmFwNUZGYkNJOGhaWHQ4c2NJUTIwUGNj?=
 =?utf-8?B?c0FSNzkzY0puVHVXdEtadnJZQWxrd25NUGdzTlVlRXRGM2hJV0RPK1NHTkd6?=
 =?utf-8?B?Ym5jKzMxa1lwNXRhM0p4SzMwS3FzRVRjQU16dkhsL3dvTEJWTEladHdvS2Qv?=
 =?utf-8?B?ZGJyZm1TWllwUHFrVWJ2bzB5MEdjSHdjYkkvQXQ1YUhObVlCTytkWE9QWkov?=
 =?utf-8?B?clZKczZnanFXRXZJeTRUeUk1WGxvQ1B6Tnp1c3pJc1NTYm9jMW5OR3JWRk9O?=
 =?utf-8?B?WVpIUWpHYVdxY2F4RnZEZVBKYlo4dTVGb3V1K2piN3JDNHA1ckRvR0VJU2lj?=
 =?utf-8?B?QVN2Snp0ODZyVkdmclcrd2VPVWlqNEJWRGVxMFVYRFcrbXptc2pXSUgwZ05i?=
 =?utf-8?B?aHdrVU9kZXZwamorajVWUnhRMlh5RGN5aW1BMnBqRmlZSGJDZXhvRzQydnZu?=
 =?utf-8?B?M09RbmsvYUhCNk1qN0ZvSXpqVUNtdnhMcFMraXRXQzRTbUNPTW1GUjJrdjNY?=
 =?utf-8?B?VXR0Yk5TdEFyMFRuOFE4K1lMMnVWelI0OGtmVFQrV3BkMHJBU2VVQnp4K1Mw?=
 =?utf-8?B?WFQ3ZTllQXlhRDhBL3NRYWEyMTdPeERHbjVlS0RLNThqWDNETk8xSDdkc2dn?=
 =?utf-8?B?Z1NHWE43R3dNeFRpYmxrL1hYUnZtTGtnOEpabGNQZVdpQkRmTTIxU0JkZFBy?=
 =?utf-8?B?UXA4MFh5Nkh0a05jaEpPbXA0SzcxVjNPRVlaOUpuQjluVUNJcHpNNWlEM0VZ?=
 =?utf-8?B?UGR2V2s4QUp0d2pPQmtQcVlZejh6QU9vNWFtTytYbFQrZld0bjhDRjFad09L?=
 =?utf-8?B?YzNlenNuMjYyNTZ2RFVYWWEvckxzQVBjbG02YmhENDhQNkkzbEVmU0s1OVpV?=
 =?utf-8?B?WmpLLzE4T2xRTTRvVGRCaE9XWkdNMWgvSldiMjJGcDRPYWZlVWx6eGNEOUdM?=
 =?utf-8?B?aHpoOU9ySTRndjIxT3BMNTdFdnE0d2pqYnUzMkNVMWZ4cEFRQnAzYzRwUU5V?=
 =?utf-8?B?SWVDaW1EVU1Bc1dIaG5TL0xsS3dpUVhzd2FSY08vaWdjL0FWcTJmZ3NpZkxk?=
 =?utf-8?B?bGJFcmFVczgzYUVDSXhGRjBldzBndGhCaFdyT2pyWTdzQ1NnaS84Rlpmcnpj?=
 =?utf-8?B?azI5OCt3TXovU0xYZGdGc3dlbnpQa01YSWJZZHh0RDZQOEN0MzRkRElBdGVh?=
 =?utf-8?B?d0ZQajlsaWFCWDlvNU0yNXp3bzdON3RQcGRvUXU1SjRDbmlpMVpPS3BwbUxh?=
 =?utf-8?B?TSsrcm43SEs5VXVxcTIrK2FTeTlkeDRPYWpNVWxXUk5DSXZwSTVxd00zNWpk?=
 =?utf-8?B?Wmx6VlVBZ1JrYWZWRVVZVHFIcmcybFlFTnpFZ1NoOGoyUFJHVjUxZGtsN3hh?=
 =?utf-8?B?MVVKTk03ejRRbzNIR3QyTklnOC9mQkdvUFRVMWxTVXVJREJleTdNUUxmalFV?=
 =?utf-8?B?VDA1dXZGVHAwa0NaM3RPVjdKcXh6bkFrdG1sZ2Z4TEhEbWpyMXptSXR3UjN4?=
 =?utf-8?B?MXVpak9paDVEZjE5S1QyVHRnVzF2NEFQWHVadFVaWExUZmN2L24ydG12NG1F?=
 =?utf-8?B?TkE0U2xIS3U0WGJ1VGZRRmgrTjg5WWJiK2hhc0IxVTBHV2JRRGJDbFkydEtC?=
 =?utf-8?B?RVY5VEVaU245WCtkcWNOOVM5c0FTNWhzN3NXOGZBWll5VWRxdk13d2tkaGNs?=
 =?utf-8?B?M0lhb0xJQkJQeXJaa1d6c01YeTNmZTd3L2VTU0NNMkM0OXZmUTJGYjk0NGhQ?=
 =?utf-8?B?NHl3L1dFam96bWtWYk8xY2lRRm5ENHFHRlFnS1JjNm8rRTZ0MW9aVlZTb0dN?=
 =?utf-8?B?b2JCcThNUlF2ODRLS2gzamxFYXd1eGVuNm5ZVkdPTWJpR1dQUWh2cEVRY29n?=
 =?utf-8?B?NFE3UVloVFU1d09QT0c4dWtCbzhUcXZRTU1oMzRSUnN3NWtGMHRlcFRHVWQ4?=
 =?utf-8?B?emVRak55Q1pKUUJoUWtGdGplaFJsUVFSd1RkNkpYdGFKWG1QQ3ZVUExuem45?=
 =?utf-8?B?THR2YlB4RURBPT0=?=
X-Forefront-Antispam-Report: 
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(14060799003)(36860700013)(376014)(82310400026)(35042699022)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2025 09:49:06.7705
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6eb4c234-3908-4466-66c9-08dda8040aa1
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB1PEPF000509FB.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR08MB5350
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 10 Jun 2025 09:49:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218335

T24gMTAgSnVuIDIwMjUsIGF0IDA3OjQyLCBBbmRyZWogVmFsZWsgPGFuZHJlai52QHNreXJhaW4u
ZXU+IHdyb3RlOg0KPiANCj4gSGkgUm9zcywNCj4gDQo+IFdoYXQgZG8geW91IG1lYW4gYnkgInNo
b3VsZCBiZSBhIHJlY29tbWVuZHMgbm90IGEgZGVwZW5kcyI/IEFGQUlLOiBQQUNLQUdFQ09ORklH
W3hdID0gIndpdGgsd2l0aG91dCxkZXBlbmRzLHJkZXBlbmRzIiwgc28gSSB3b3VsZCBzYXkgbXkg
dmFyaWFudCBpcyBvaywgb3I/DQoNCmh0dHBzOi8vZG9jcy55b2N0b3Byb2plY3Qub3JnL3JlZi1t
YW51YWwvdmFyaWFibGVzLmh0bWwjdGVybS1QQUNLQUdFQ09ORklHDQoNClRoZSBmdWxsIHN5bnRh
eCBpcyB3aXRoLHdpdGhvdXQsZGVwZW5kcyxyZGVwZW5kcyxycmVjb21tZW5kcyxjb25mbGljdHMg
c28ganVzdCBhZGRpbmcgYW4gZXh0cmEgY29tbWEgd291bGQgbWFrZSBpdCBhIFJSRUNPTU1FTkRT
IG5vdCBhIFJERVBFTkRTLg0KDQpNeSByZWFzb25pbmcgaXMgdGhhdCB4YXV0aCBpc27igJl0IF9u
ZWVkZWRfIGZvciBzc2ggdG8gd29yaywgc28gaXQgY291bGQgYmUgdXNlZnVsIHRvIGJlIGFibGUg
dG8gYnVpbGQgaXQgd2l0aCBYIHN1cHBvcnQgYnV0IG5vdCBhY3R1YWxseSBpbnN0YWxsIHhhdXRo
IGluIG90aGVyd2lzZSBoZWFkbGVzcyBpbWFnZXMuDQoNCj4gTm8sIEknbSBmdWxseSBvbiB5b3Vy
IHNpZGUgdG8gZW5hYmxlIHRoZSBmb3J3YXJkaW5nIGJ5IGRlZmF1bHQgd2hlbiB4MTEgaXMgZW5h
YmxlZC4NCj4gDQo+IFdpbGwgeW91IHRha2UgYSBjYXJlIG9mIGl0LCBvciBzaG91bGQgST8NCg0K
SWYgeW91IGNhbiBzZW5kIGEgc2Vjb25kIHBhdGNoLCB0aGF0IHdvdWxkIGJlIGdyZWF0Lg0KDQpS
b3Nz

