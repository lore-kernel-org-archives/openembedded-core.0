Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A776BD7833D
	for <webhook@archiver.kernel.org>; Mon,  2 Dec 2024 17:36:30 +0000 (UTC)
Received: from EUR03-DBA-obe.outbound.protection.outlook.com (EUR03-DBA-obe.outbound.protection.outlook.com [40.107.104.53])
 by mx.groups.io with SMTP id smtpd.web10.179164.1733160985584208203
 for <openembedded-core@lists.openembedded.org>;
 Mon, 02 Dec 2024 09:36:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=meKblHzW;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=meKblHzW;
 spf=pass (domain: arm.com, ip: 40.107.104.53, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=OK1yGzNiLyW8AhYRzxg4CcZPc4UK1DQJiSofrTIWyVVYkWa1l4EhCgs5fVC5Emw/en3pZdGvC6jo3fr9A7U5MLJZvBvxd0EW/xF6kApleEYQ/17phCVGwi/b4CH9H1jWejUNqA13Fd3ZGGdnkyt2cONKY0c3ocnUeYXnK20tUzkVYazr/mSFZODXc/FkFXi5H8FE8R3HSn/lsKBVEiSTcWP/Y6BBLdbyGqj7vFwj9OJ6cRZJ8CeaCqN1BAJxEn05z+4LSaaxab/8WN4/M6vXssYL5S2/ut7xtFgwhPvmoVuJ815oG/YGDyZv3yFHO+nrlnE8s42Avtn0lZNYQH6Tmg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gji8TppfpHB2tVyQ2AKp/rtoySpy6xxX1q0nTlQXJw8=;
 b=b2F9g9dkp2/cFssQ3sQQjxZsXFipxhH5UeM3ghox95imElGNtFkhQfeotF2tYL1ijsGAuqM3dwdrr7+rMM0pGjdMkXMJ1OVvEftnwc3ocD2xKaIqSTU3EHZUBblsYX3zMk4DyAApgFRsaGbw96h1UZnS++EZVaNsUbZ3yx+ebjka0IR/e5z+4puNutkejEe8h2j5PQanp1rYfEc1gsS4lhZ4NpWRXLF9lxQTr1QwNvr9BJIjA2WOn1QcCDr/JpYOt3ezKprGNzs/qYWAtp8fmxCon+tS9my2k/iNrpeiPQOV4uwz96wsghaYNLvnycZyT5VJgaUpJc5TntadWId9dQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gji8TppfpHB2tVyQ2AKp/rtoySpy6xxX1q0nTlQXJw8=;
 b=meKblHzWQeVvGzsU2W7dYgoAEBI6Z62LIMsT13C7CnfNc/VvgSltrstzkXgu+3hbvu4J53uG+t4I7ra5GsNm4e4AGW1MPgT4uSlHd0tIIk6S2ODz6HMpfbfZgWpOl4MbpAEQ0U1dEdM3uPhktbf9sQKJgPvySL+RG5elRbrEv40=
Received: from DUZPR01CA0119.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4bc::19) by AS2PR08MB9223.eurprd08.prod.outlook.com
 (2603:10a6:20b:59d::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8207.18; Mon, 2 Dec
 2024 17:36:20 +0000
Received: from DB3PEPF00008859.eurprd02.prod.outlook.com
 (2603:10a6:10:4bc:cafe::e3) by DUZPR01CA0119.outlook.office365.com
 (2603:10a6:10:4bc::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8207.18 via Frontend Transport; Mon,
 2 Dec 2024 17:36:20 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB3PEPF00008859.mail.protection.outlook.com (10.167.242.4) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8230.7
 via Frontend Transport; Mon, 2 Dec 2024 17:36:20 +0000
Received: ("Tessian outbound 4eb3d11e9250:v514"); Mon, 02 Dec 2024 17:36:20 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: d23ac56832ffef86
X-TessianGatewayMetadata: 0nP15ezlPBZsbGk3BfKSXKN43vRIdfXUSUX8MOUgDo3Ib1HBb33IYl6RzYoctudcqHiL4YvL/VndvWM5VYBOiC0JcE3L69StmNvs4JruNqZ1z25hdmYnGdE+J6YYDTwuSdVEUtzGXACjdZOhOcdce0DhOsqV+pFeMKEvLayOum4=
X-CR-MTA-TID: 64aa7808
Received: from L5c9059ae34d1.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 6A6C3654-5C1D-4344-9B73-E7D55C986820.1;
	Mon, 02 Dec 2024 17:36:12 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id L5c9059ae34d1.1
    (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
    Mon, 02 Dec 2024 17:36:12 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=h08YEOOpgMYXnNjz64TRQIiWsubgZ145plrybAQ1SD0Ro31KTubH24SCES1ev1kICQ8w0x2g79XTbdXG7UM0YxygbGby/lGhtIfatAtysf04AmugOCslVtnGnJ4rQl01i33vyBdMa09Wk4nH538tShWpx3meHt/O+XXyDx72zgSMkWLZ/ZevMG2aTwCiZx07VjtYodkKrb60hjpyyUNoKXi2oEpiV8ptCJj3J2mAt2x8H8tyIDGapk2rIgwA/BSrl+/cVQ5Rr19dTm/jaQWy6qcEh9sMWNCHWRIyMe5UkkZLPaFJXntyqJzfZrw/NBKaCaAu60pVYwO3nDTljwNbAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gji8TppfpHB2tVyQ2AKp/rtoySpy6xxX1q0nTlQXJw8=;
 b=L/g1hm7FKOrOGsxvGvY7ctge3UPW+s8oiLWVUbqT1G+3R9uXyEc11zpeMApvNzZ5YlNVrAnNmQNcpR2fGqaCwKnUAk7WmYDlP39F2jxaTvCF9ealMXoRQsxQtvsE95LAZbaz7LLyc15k5J3u3uPbhusz/wMEFFJQlB6tJ5sfqkiXIaLpNAkcslbYq4xfWwu9H7EVz51ej2fmwFUw5DKr+LwrJrk4W/qwDpOcXYy991ultF3Na3RUPBSizxyDpgjqfQOnuYBAlzf4zKLxDCC7vJIiTJzOsdFwr1qlAoCs9jpEPq6qG6J3rmm5ySIAGWPBmaYt8mkw8s7fTU5QtEXdJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gji8TppfpHB2tVyQ2AKp/rtoySpy6xxX1q0nTlQXJw8=;
 b=meKblHzWQeVvGzsU2W7dYgoAEBI6Z62LIMsT13C7CnfNc/VvgSltrstzkXgu+3hbvu4J53uG+t4I7ra5GsNm4e4AGW1MPgT4uSlHd0tIIk6S2ODz6HMpfbfZgWpOl4MbpAEQ0U1dEdM3uPhktbf9sQKJgPvySL+RG5elRbrEv40=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by DB3PR08MB10336.eurprd08.prod.outlook.com (2603:10a6:10:43b::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8207.18; Mon, 2 Dec
 2024 17:36:10 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e%5]) with mapi id 15.20.8207.017; Mon, 2 Dec 2024
 17:36:10 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: Jamin Lin <jamin_lin@aspeedtech.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, Troy Lee
	<troy_lee@aspeedtech.com>
Subject: Re: [OE-core] [PATCH v4 0/3] uboot-sign: support ATF and TFE ITS
 generation
Thread-Topic: [OE-core] [PATCH v4 0/3] uboot-sign: support ATF and TFE ITS
 generation
Thread-Index: AQHbOYOsLghdnSp4Y0CIH703YxxwQ7LMxguAgAW/9QCAAMhFgA==
Date: Mon, 2 Dec 2024 17:36:10 +0000
Message-ID: <F46A7C06-C0FD-44D9-8114-7E7AD63A72A3@arm.com>
References: <20241118063233.698679-1-jamin_lin@aspeedtech.com>
 <1762D5D7-817A-4852-920F-C6B57DAFD599@arm.com>
 <SI2PR06MB5041CADD5A098C99FAAD77E3FC352@SI2PR06MB5041.apcprd06.prod.outlook.com>
In-Reply-To: 
 <SI2PR06MB5041CADD5A098C99FAAD77E3FC352@SI2PR06MB5041.apcprd06.prod.outlook.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3826.200.121)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|DB3PR08MB10336:EE_|DB3PEPF00008859:EE_|AS2PR08MB9223:EE_
X-MS-Office365-Filtering-Correlation-Id: b1fba97a-ae95-40e8-b499-08dd12f7d55f
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|376014|366016|1800799024|38070700018;
X-Microsoft-Antispam-Message-Info-Original: 
 =?utf-8?B?OTRzSEtCRlZRMzQ3bElwamZZRm5lNW5GeTFzQUdILzVnR29SQXRvTk0rRk5o?=
 =?utf-8?B?SDJmTFJhSWlZZDBWQTh5SmVYT3Jlbm96aEJYd3UvZXdwaUZYcDg3anR0MlY0?=
 =?utf-8?B?VVYyWnNIaWJyZExsdjlGWlNXNzZ4ZDhHRTJzcDZsY2pZVEVtYjNlYUQwaHkr?=
 =?utf-8?B?U21CbDF3Mml3RFNNb3BqMC9ZK1NzS1dkakF3T2hMdGp6eTMreUk4UElqOHQv?=
 =?utf-8?B?QjFIY0dmYUd5TEFXN1JBMUwwaTNadlI0bFJOc3plbGxvRDc0SG9kQk9qcTlX?=
 =?utf-8?B?NDU2VlNXYmg3bGczR0JrQ0Q5QnQ3NUFCM2xPbDNubmEybEJSeWFtMkZvVHAr?=
 =?utf-8?B?VzJkNFJURUdub2JLVFhPMldhRk56WS9qc1JVbDFGU1RRb3VNRStoMDQ4SnhX?=
 =?utf-8?B?b2xPalFPVmMrcUFFc0VnOEdYM2lPd0RWTW5GLzVzeHNnUk5FYnRHWjhNbkJZ?=
 =?utf-8?B?ellkczRHZWNoTlVVblk5VmU2Q0hMT3dDQjZYZ0tEeUFzSUNzYkZiQmMyWUx6?=
 =?utf-8?B?eGpSSHVlWmdIazgzU3c5bE1Ic0RFNkwwSlQxT1lYY3FURmhMcjMwWXBPUTgz?=
 =?utf-8?B?VlZtUEtnRzJYWmhwOThXRS9Pd2VRRlp6VGUwOXBLNGsxYy9kNVFid1hHTTIv?=
 =?utf-8?B?N1ZGNWhiWHlrUi9ldjQvU2ZtbUliSndXODN4bkFTQllldkUza2pmRUI0WUVS?=
 =?utf-8?B?eEVkWWdzWFE2eHJ4V3U5OGtxN1lmZ2xkWkJTYmpKcnFwUVNwYXJTUEMvZGls?=
 =?utf-8?B?SThIZkp2TUdSZ204RnhsRXVheDVCTlk5dGQ4anB1T3ByeC9MWU1WRUxUSVZC?=
 =?utf-8?B?NVQvN0sxT0Z2NHlTekRmcW8yWHNOSmRiWVNIeW9tNVNqYi81MnlKZStUVnY2?=
 =?utf-8?B?VXNCWTFkSjFZR1NVNktVWUhiRXNadDYrSm9aR0krTEtnOEp6WGdNdGxtdjl1?=
 =?utf-8?B?Rlpxb1I0M0hBb1pFQzJsdzQzUzFIdmdnZjg3SkhVRCtSc1U4MEdIRlZkV1ZF?=
 =?utf-8?B?VVdzdXlTRURkUzZzcWZGcFpjaFhFcjBkSmVJUG8xQ25VbERsZzFaK3pOanVC?=
 =?utf-8?B?VWM0aDBiYk5ib2IrTHZkK1FubVdmaGJRcmhhUDVQZnBxVUxFdzRWRFBOdWZE?=
 =?utf-8?B?TVl3aGQ2blp1VnZuaXJEeEhLTzNpYmNrN0Y1R3lZaVB6RWUwN09OMHBSSUE5?=
 =?utf-8?B?UHM3ZVBYbzlZMGJNTWdGMGlaVUtCL3BYR2pVc2w5UnJZczAxVGlIUCt5KzUr?=
 =?utf-8?B?UTgrcFNXMEtPQjd2TVJBWWY5Y1RkTUZrdzBQeUNoNndBZzVjdGoyZHVwYk1y?=
 =?utf-8?B?ZDVxNm1PQXJnRUwraFg1RTVjQVo2dHh4T2RvZy8wa25lMlo0ay9yOEhNZUMz?=
 =?utf-8?B?Q3A1bDUraUl4TE1xVldDajU1ZjJYcjFnaW9FbnhtV1VrdlhSZzFpQlIreGhV?=
 =?utf-8?B?dUFRY1F3TmVMOW54YkF5TGZ0WldtbWNsSXR0cjhWNGRZYzh6TFZ4K016SjNH?=
 =?utf-8?B?Y3VOeGtGRFNQRUFMRnIwZE9iamhaS1EzbnNieHpSSGV6Y2ZKVUgweEdObFhK?=
 =?utf-8?B?TFN6UjBwV1Jheml2VkNyNkY0emh6cEJVSXEwQWxoVFNydi9UbTJjNmJ2bGdQ?=
 =?utf-8?B?M09BNTF2OHV6akFLNjB1eEZhS0FQbUxmQkJtSkNocUl3alBya0NxS2dzWDRD?=
 =?utf-8?B?YWNjVTR5VXpoUTlaZmhGYTAvalAwdFRrMUkraUxzQWE2QnlwUjhkUk44d09s?=
 =?utf-8?B?OVNmYWJQNEp5YzJDSWRqWGJJbU5YTTlySXlCcXE0c0o4b3E5YVlVb3dYNm5p?=
 =?utf-8?B?OTNrS3ByTXZZTk8rME9RK1d1VkZMRkh1d3BJeFhhdUZmeUxwRyt6cmRCU252?=
 =?utf-8?B?YnBSaUZzbjVHOW1PMHRIYTNrK2ROK09BMXJWcXh2TVlyWGc9PQ==?=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <8A24BE957B1D2643BA602B9478C2F93D@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB3PR08MB10336
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-SkipListedInternetSender: 
 ip=[2603:10a6:102:2a3::12];domain=PA4PR08MB7411.eurprd08.prod.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DB3PEPF00008859.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	5a66bbf6-e9ab-4586-3758-08dd12f7cf71
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|14060799003|376014|1800799024|36860700013|82310400026|35042699022;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?WXdPeTd4UnBwaFBsTE1jTFBkSXJmb2dsOWwvc1ZTazBtRnE1bmhnUzhkUGJs?=
 =?utf-8?B?TVM4c1NWM3gvNWZMQVRTa1ZtcWlEbGM1Uzlna0dVQ1dGSmNXTnUrcXhyWmZa?=
 =?utf-8?B?b3IxR2V4dk04eFVhaW1uZ01Wc1NUZTZTY0t3RFI4dU9FcEt4WjFFUi94SWVG?=
 =?utf-8?B?SVZEZlJqYVdRcjFjVVRJVGFPNDlOOFRJNVdZVTU0RDByZ2pYdmxTd2U5ZHlZ?=
 =?utf-8?B?SVZ6UXJ6eElseHRYMTBJRHVHZFllaHJ5Tmw3Tlowa3lRdWRtaVNUNUdTWUIr?=
 =?utf-8?B?blZOUGdzNzQycDkyN1VtVWZqM3FBOGtSL2s3N1NuMTBlSEJ0SER5T2x6dkNV?=
 =?utf-8?B?T21QOEd4ME5RUG9hUDVQTUY2cjEwQmhETE5xbUNvN1Z4bkNYUjlNMHJGbnRy?=
 =?utf-8?B?cUNVcWlKTDNpdTcwaU1iUzFESFdHeDdjcWczS1k1cURoRlNpYldBS05QR0k0?=
 =?utf-8?B?N2ZoVUQ0aXRTVnZVOFpyYmVrOHdlcWF1dlhBdm9jSGRLV2h4eFBIcTRmZmZH?=
 =?utf-8?B?Z0wrdmdlQjd6OGtVcjVRSExXeEc0TlB5ZlZyNlI3ZnVsK3JPaUZ5ZmRYbjlJ?=
 =?utf-8?B?UUhLbGNzZFpEUUNmcnF6UC80Vm5DMWJKdGh2Q05ZbEo5WkdsL3dmbmkvTE54?=
 =?utf-8?B?ZlRJdi9uMHh2WWdOMFVuQ0hXYkFFUEZKbnlKaXpYMzVxa3Z4dzNMSHFOakk3?=
 =?utf-8?B?YmJWTXlqM3BNTFhJNDlYbUROZFNGQjZrR08yR0FyQ3YzM3dTRHNSL3JLR2dK?=
 =?utf-8?B?NVRlRnZtbjdoNTFLQVlvMVV1Q0JxU0JwRGd3YzBvNWdwOFR5UWFnZ2dzb0pT?=
 =?utf-8?B?eTBXWk83ckQxa05DMzZWZ0V0TGpFTXl6Z1FGSTFrUW83VlR3NTN2a2JHOVZj?=
 =?utf-8?B?Y1BXZTdSSURQYUF4RmNaWDJNbmtoRi9POUtzb21Ub0hGTlNOelBYcG1qRzVi?=
 =?utf-8?B?dExjamJoakpsbTl0QytUVTg3U3Q0NzBZT1BTbks4ZFowbkhLZEJKUlJpakhV?=
 =?utf-8?B?d0ZGei8vZWtwL3hiK0F0ZkQxdkNuTkRnUXlnNEppa1VQamlHWG1KeWRobEp2?=
 =?utf-8?B?Q3d5MnUxd3FiTjk2QS9OVGZ4MytaTTJ6Z3RteXFPZDRuSGZnM1hKbmJab2ZH?=
 =?utf-8?B?YkRSMHlCZEY5QWV4WEZHUzdyMzZhS05rUkMxQkRYY21DZCtZUkhoaVZjdTkr?=
 =?utf-8?B?NVJFRlQwcWJFRVp1MlY4am9jNjZwc09nTm9vakdFYVVNaWZMNmZXRXFPOERY?=
 =?utf-8?B?K3F6TDdUVk9PeXJlVGx1RzhFdy9lNEZnbXp4TXU1Ni91WVIxUTBSK2VvNENr?=
 =?utf-8?B?c1Rtc1lTeitVd21nMCtEeEVmKy9ja01ocDgyQ3BWdzR3U3FMSE5zbkZhdExN?=
 =?utf-8?B?eTVvelNwdmZpUnF0ekYzL2ZPUzZUTzVnb2s0azh6ZUExT21FREw4NU5SUGpt?=
 =?utf-8?B?Z3Aycjk1UmVxOUk1M0VFUG5lRHcvcUJxUkRrRm40bVhGVURUWHczTjJvY0o1?=
 =?utf-8?B?WlF4d0JSZXhhSTMwNkg5MVNSNkFTQzdkVzV3OHBqVkdMT2FiTEhlV0ZBUzZJ?=
 =?utf-8?B?ZDVSMFNvSnNSNEZmZEN4RHNQazR6YStjTCs2THpiM3RDYklieXV2eVdPNHNL?=
 =?utf-8?B?MTF2SXBWTEJTWEx5YVgvUG1XL1ZkU0sxTW92OTNjcXlRTXRTdDFRSSsxSzk5?=
 =?utf-8?B?QW1CUGFaZUVSS0VSdVpRaGRiUDRxVDMzQytDZThnUVhJRXFCcGQ3WnhqcU9T?=
 =?utf-8?B?QVd1NFNpYTAwTWRmclpkeG9JSS93cWh5RG9hT0pkRWpOYTF2aFFLelJvbHpt?=
 =?utf-8?B?T2ExL3I1alkyem1DU1BsU3FKQnJTUlFlSHpxbytXRmpzb0lIZG1tZmRzU1ZG?=
 =?utf-8?B?SFl5U2Qxdjc3K1pSNjUvNWdpTlJEdzYyMGk4ck9JVjNEaUVaSGFPTGVneXA4?=
 =?utf-8?Q?UKmgUb6/QHe0yjWxNSczeKnl4NOLWWyN?=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:64aa7808-outbound-1.mta.getcheckrecipient.com;CAT:NONE;SFS:(13230040)(14060799003)(376014)(1800799024)(36860700013)(82310400026)(35042699022);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Dec 2024 17:36:20.2519
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b1fba97a-ae95-40e8-b499-08dd12f7d55f
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB3PEPF00008859.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB9223
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 02 Dec 2024 17:36:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208150

SGkgSmFtaW4sDQoNCk9uIDIgRGVjIDIwMjQsIGF0IDA1OjM5LCBKYW1pbiBMaW4gPGphbWluX2xp
bkBhc3BlZWR0ZWNoLmNvbT4gd3JvdGU6DQo+IGNyZWF0ZV9pdHMoKSB7DQo+IGNhdCA8PCBFT0Yg
Pj4gJHtVQk9PVF9JVFN9DQo+ICAgICR7VVNFUl9GSVJNV0FSRX0gew0KPiAgICAgICAgICAgIGRl
c2NyaXB0aW9uID0gJHtVU0VSX0RFU0NSSVBUSU9OfTsNCj4gICAgICAgICAgICBkYXRhID0gL2lu
Y2Jpbi8oIiR7VUJPT1RfRklUX1NTUF9JTUFHRX0iKTsNCj4gICAgICAgICAgICB0eXBlID0gJHtV
U0VSX0ZJUk1XQVJFfTsNCj4gICAgICAgICAgICBhcmNoID0gIiR7VVNFUl9BUkNIfSI7DQo+ICAg
ICAgICAgICAgb3MgPSAiJHtVU0VSX09TfSI7DQo+ICAgICAgICAgICAgbG9hZCA9IDwke1VTRVJf
TE9BREFERFJFU1N9PjsNCj4gICAgICAgICAgICBlbnRyeSA9IDwke1VTRVJfRU5UUllQT0lOVH0+
Ow0KPiAgICAgICAgICAgIGNvbXByZXNzaW9uID0gJHtVU0VSX0NPTVBSRVNTfTsNCj4gRU9GDQo+
IGlmIFsgIiR7U1BMX1NJR05fRU5BQkxFfSIgPSAiMSIgXSA7IHRoZW4NCj4gY2F0IDw8IEVPRiA+
PiAke1VCT09UX0lUU30NCj4gICAgICAgICAgICBzaWduYXR1cmUgew0KPiAgICAgICAgICAgICAg
ICBhbGdvID0gIiR7VUJPT1RfRklUX0hBU0hfQUxHfSwke1VCT09UX0ZJVF9TSUdOX0FMR30iOw0K
PiAgICAgICAgICAgICAgICBrZXktbmFtZS1oaW50ID0gIiR7U1BMX1NJR05fS0VZTkFNRX0iOw0K
PiAgICAgICAgICAgIH07DQo+IEVPRg0KPiBmaQ0KPiBjYXQgPDwgRU9GID4+ICR7VUJPT1RfSVRT
fQ0KPiAgICB9Ow0KPiBFT0YNCj4gfQ0KPiANCj4gVGhlbiwgdXNlcnMgc2V0IOKAnFVTRVJfWFhY
4oCdIHZhcmlhYmxlcyB0byBjcmVhdGUgdGhlaXIgb3duIElUUyBmaWxlIGZvciB1LWJvb3Qva2Vy
bmVsIEZJVCBpbWFnZSBnZW5lcmF0aW9uLg0KPiBPciBjYW4geW91IGdpdmUgbWUgYW55IHN1Z2dl
c3Rpb24gYWJvdXQgeW91ciBnb2FsIGFuZCBJVFMgaW1wcm92ZW1lbnQ/DQoNCkkgd2FzIGFjdHVh
bGx5IHdvbmRlcmluZyBpZiBpdCB3b3VsZCBiZSBzZW5zaWJsZSB0byBoYXZlIHRoZSB1c2VyIG9m
IHRoZSBjbGFzcyB3cml0ZSB0aGUgLml0cyBmcm9tIHNjcmF0Y2guICBJdCBjb3VsZCBzdXBwb3J0
IHZhcmlhYmxlIGV4cGFuc2lvbiB0byBhbGxvdyB0aGUgdXNlIG9mIHZhcmlhYmxlcyB0aGF0IGFy
ZSBhbHJlYWR5IGRlZmluZWQgaW4gdGhlIG1hY2hpbmUgY29uZmlndXJhdGlvbiwgYnV0IEkgY291
bGQgc2VlIHNvbWVvbmUgd2FudGluZyBtb3JlIGZsZXhpYmlsaXR5IGluIHlvdXIgZGVzaWduLg0K
DQpJbXBvcnRhbnQgbm90ZTogSeKAmXZlIG5vdCB1c2VkIGZpdGltYWdlcyBzbyBJIG1pZ2h0IG5v
dCBiZSByaWdodCwgdGhpcyBpcyBqdXN0IGFuIG9ic2VydmF0aW9uIGZyb20gc2VlaW5nIGluY3Jl
YXNpbmcgYW1vdW50cyBvZiBjdXN0b21pc2F0aW9uIG5lZWRlZCBvbiB0aGUgZXhpc3RpbmcgZml0
IGdlbmVyYXRpb24uDQoNClJvc3M=

