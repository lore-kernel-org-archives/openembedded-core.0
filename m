Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6EBDC54E65
	for <webhook@archiver.kernel.org>; Wed, 21 May 2025 10:22:17 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (EUR05-DB8-obe.outbound.protection.outlook.com [40.107.20.47])
 by mx.groups.io with SMTP id smtpd.web11.7936.1747822933464644565
 for <openembedded-core@lists.openembedded.org>;
 Wed, 21 May 2025 03:22:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=S18zSysb;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=S18zSysb;
 spf=pass (domain: arm.com, ip: 40.107.20.47, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=xwIeZ0Xhge2NCug5/UJCOFzexi4vTr//d1SdvX+KBSTo8NKnMrBsc62L1+jTDlR/9FB7g/gqd87g09ZmncexQMScU9/8F7nCUnY9Fxm09hs5Rsd0cOSVdXlw84kfemsfR4OCPbjHoOPwWV6QS4HVFBFdPlqM+0w+gBHG7uKlKmAsU81Unmahx1NOPAvaqyEW8QpSWyUWNMfKN7ewTiCrzxae3KmQ4j8ljLdLsr4K8u+dM7TAbre4oIry9ouP615iclbKY3I8Jby9xvi+dioCOeDzg8Z2BBaglS3W31sDMxj6MDWRmcj0vcwbx5lpKtNDAipJjm9t8kOm1lT6OCkrEQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uD1reLI8gm/3YqC4tUW5qFJV/KaEUnm+ZDH7P4DfEsQ=;
 b=aYzYSoUlVlXGZYDSyFw1hAqhbZQr/oUvlmIgXFhNW2gm0aNSihpofshZWeeg4BV6yOwGL7UCas4Figy+zEO/OF0GbSkAUF00eH1TzM5vsau/xUMhIeUM9MPb7eE0f1j5yTyiMZaxexnLjGzz88EOstctvDJwtuBc9CSZqZMW8zOsRFKxhzM7JAThivlvxl7bEGimXaXXI1w4EhZa4MIMo4g3dDNeNDx8bPksYOydLqssRXN5IMDUozej5eQHi3/ts1rJHC7/r0Vu4hpKq6QaLUb1yL0igygqE+0M1/9BsgZm0BWo9uvWx0tfYWvdn5LtUaWq8h9I8qXNqvd/wh4nMw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=windriver.com smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uD1reLI8gm/3YqC4tUW5qFJV/KaEUnm+ZDH7P4DfEsQ=;
 b=S18zSysbqVj1Yp+qrsr/mKQI/TJ9RX1IH9cakBG5yFrOQXSJFJm7DzzN0Gs4H+mbAuPgsAkQBWLlltfK94873yUP3RBYYnTto7QBSp54omSfkXV4f0FOjvftLr5iWVX/wLh1H0X80Z7a4eZ1egOWbLnFZdGmiqOQNSUht5tqZ04=
Received: from AM0PR08CA0006.eurprd08.prod.outlook.com (2603:10a6:208:d2::19)
 by GV1PR08MB10402.eurprd08.prod.outlook.com (2603:10a6:150:15d::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.30; Wed, 21 May
 2025 10:22:09 +0000
Received: from AM3PEPF00009B9F.eurprd04.prod.outlook.com
 (2603:10a6:208:d2:cafe::22) by AM0PR08CA0006.outlook.office365.com
 (2603:10a6:208:d2::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8746.30 via Frontend Transport; Wed,
 21 May 2025 10:22:08 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AM3PEPF00009B9F.mail.protection.outlook.com (10.167.16.24) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8769.18
 via Frontend Transport; Wed, 21 May 2025 10:22:06 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YMd858nqRqOYTWQFdkQFYhVkvEzQOY30BIQFkDUgTd+k88DhK+hgSi7oMngs8QF4KpUVdMfv+E8L1jbMu59r8cUluDsVbP4/HH9uGJbRSi64y7nvJB2frWD0164NhlhyadQM6j/U/e2D0XZiNflLQ0f8TJXjBYggcdSgt9GMJc5N0xltbc3KntrRj+G0ISOn0k2YNsZyzkLvN+kuxhVGWrodNNpdveqvAXb2zyZhY5t9Cl1NUsRHaE1erVoQr1pYkavituaIWoXGkwsHO1j+mNRhxxf2l52/MF5WWTghvdR8+0a0JpcCouFVMcvO3yNLhERhx1PqwhWKmO7bGZzWrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uD1reLI8gm/3YqC4tUW5qFJV/KaEUnm+ZDH7P4DfEsQ=;
 b=PQzXlEq7oyVhmrLDC75tPVFnkvhds9SQ2dBDBpOnw8vuVr1WjfOSAie+UwOsaskhN8mEhpbbPsJc/Irk4SrHUL/cbKOcKlDb2epDHL35v9NNOtiXgbP2B0c6Yn7HksHCG+Yb424b2/DqdbVqt/ZJI0vMScNzY9oWV317qeXwZ8owEtBlbCkLGbkBHjR9AF8D3WqhWvkDdklq1D9rPvwQFyhF6HtSYVhjJIcK+BKCNI1SAPjswT+a1NzdH6BqRsfXNk7f/HY7Jwm+CAr6d3PS/yHm4kum3HK01LmY0bQ3iOYa4Xqoa8U+I2DMTYwPvopLEmSpH1MGLDFUkk8eGB+6JQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uD1reLI8gm/3YqC4tUW5qFJV/KaEUnm+ZDH7P4DfEsQ=;
 b=S18zSysbqVj1Yp+qrsr/mKQI/TJ9RX1IH9cakBG5yFrOQXSJFJm7DzzN0Gs4H+mbAuPgsAkQBWLlltfK94873yUP3RBYYnTto7QBSp54omSfkXV4f0FOjvftLr5iWVX/wLh1H0X80Z7a4eZ1egOWbLnFZdGmiqOQNSUht5tqZ04=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by DBAPR08MB5784.eurprd08.prod.outlook.com (2603:10a6:10:1a6::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.30; Wed, 21 May
 2025 10:21:34 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e%5]) with mapi id 15.20.8722.031; Wed, 21 May 2025
 10:21:33 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "liezhi.yang@windriver.com" <liezhi.yang@windriver.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH 1/1] autotools.bbclass: Copy
 gettext/po/Makefile.in.in to all po/Makefile.in.in
Thread-Topic: [OE-core] [PATCH 1/1] autotools.bbclass: Copy
 gettext/po/Makefile.in.in to all po/Makefile.in.in
Thread-Index: AQHbyi10TE4Nw8wXLU+sNW3LqoRIrLPc39cA
Date: Wed, 21 May 2025 10:21:33 +0000
Message-ID: <20864857-AF77-4A76-ACE2-B5548B42A7C4@arm.com>
References: <cover.1747817251.git.liezhi.yang@windriver.com>
 <ec444128381202080ec89649e127d0e6ae6cbdf5.1747817251.git.liezhi.yang@windriver.com>
In-Reply-To: 
 <ec444128381202080ec89649e127d0e6ae6cbdf5.1747817251.git.liezhi.yang@windriver.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3826.500.181.1.5)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|DBAPR08MB5784:EE_|AM3PEPF00009B9F:EE_|GV1PR08MB10402:EE_
X-MS-Office365-Filtering-Correlation-Id: df9480d9-44e4-4f67-1071-08dd9851569c
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|376014|1800799024|366016|38070700018;
X-Microsoft-Antispam-Message-Info-Original: 
 =?utf-8?B?RStNekhlRCt5NEM1WGI1MUFWbnI2bklUVTM0KzNPM3pkdFA1WDArazRqV0dz?=
 =?utf-8?B?alA1RjVJVUdWclFTb0t3QkZpa3RpUGtxZkc3N1R1L0RqNy9MdG5tcUU3aUU0?=
 =?utf-8?B?eHZRdDRCV0lQRXpNaFIybGNuTDhJblpud1pHLy96RFE5cHRvMjFqM05HZG04?=
 =?utf-8?B?RHZvQjBBWjRLRG11Mm9oWGRXSmxmVzQrM2FJS09ZdzFLU1ZJWEovUkl6eE5E?=
 =?utf-8?B?WUlkOXB5NGdZREtFWVgrY1FBb0pVL09uUFkreDE4VjNZbXlveTBNcHF2MkRz?=
 =?utf-8?B?dmNzeUtVdWZnWFZEUnh4Rk5OMEJzSFlWWWVIdlRQc2FiYjFPdFlQTnpqWjhC?=
 =?utf-8?B?WjE3TDhlS3FPVmRyRWJ4a1U5SHZmRXUrbytSVGZ2ODhETlFVd0toNzhiZFdD?=
 =?utf-8?B?Y0diVStxS0pZWXpRTEVNMGFjaklma3RzN3RoeFFNS3pWL2E4VTNjYm5hUGNG?=
 =?utf-8?B?QVVOaklaaVpDcndhWVI3WlFQM1hXZ2dYazZmQWk5YUl3cStlU2RWZVdXanAx?=
 =?utf-8?B?ajlqRDhaaWxwQUljVlBmZDI3eHBIa1k1bnNOQzczazBrVzN5MEVKa2liRjNT?=
 =?utf-8?B?YjgyU2xjM2xWcmllNGI4bmlQdWRtdlJ5MlVDeFB6Z3VRRHBnOTZvUHFOSHpD?=
 =?utf-8?B?VHl4SEdpZk1UK1prcnBwMzF5NmUzMHFzSnM4S0E0OFQvbHVNejFBTnFnR1hu?=
 =?utf-8?B?SlpXVEVBdTI1N3l6Z0xNTU1Ca2RidFFtcFN5YW85VDhtSFdkVWRyZHNvb21Q?=
 =?utf-8?B?TnJkVkZQOFBXZHFUVVVLWm8xczhxNnFGNGk4Nmtlb0UwL1h0K1l4YVRYZkRw?=
 =?utf-8?B?a0xSSC83Z2VlSUZuNmFkOCswM3cyMWdaU1ZKTDlyNURTVU9sL3ZUR2c0YVFZ?=
 =?utf-8?B?aW4wNGRLT1lzM0hGSXd3QldCTDdhMTlHTDMvVWhpT25ESEpMd0d2MHVQYmZh?=
 =?utf-8?B?aTdGRHBUU0pCS3lZZUlVdmpoYzN5ZVVPdFFmNkF3aUs4V3JGblk2djMvc21s?=
 =?utf-8?B?bURSTUJEbVcwUWd5bmFiT0VML0o4WjBDQUJSa3JJdEtCcm1QZVBUTnE3aUR5?=
 =?utf-8?B?cXVLZmVXMkFPVjVnVVoySE1VZTZPTjJlUlZtVTlxVyttM1IxYmN5ZlBQUXpa?=
 =?utf-8?B?dWlkejJITzFHMXN5Z3M1WlYyZGJiazZFV1NQc2NYUmsxWnQ3a1V2VjFCMUNC?=
 =?utf-8?B?dVF2anplNWIzdmJIWTlyK2l3a0N4UnFUQml6VVlieW5LUlQva2xZL2x5TU43?=
 =?utf-8?B?K1BNSjIvaFdJNnlhT3ZGQ0ZCMUtXY1JFUU9QNFBaZklYZ250VnhldjMzSm1a?=
 =?utf-8?B?QVdYWTlPRk0rNUNEcENPeFoyVmd4cGloMzd0N1FKUW5hbEY0bmRWbWxnVm94?=
 =?utf-8?B?cnoxK1ZRNlZsSFpOWVZvYTNvZ2VDS1Zxemc5cWk1MjJYckFWdC9ka0R3UWda?=
 =?utf-8?B?RUVSRmp3TTdRVFhXUjNscVluckRGMVZvaktLa3ExVjl5TXQ2dlUyREVjd3BF?=
 =?utf-8?B?cnVXbzVHN0Q5bmx3TVZCc0Yvb0s4MGJmZ1RyRGtuVmFJY1dpK1NVeDg3RjN4?=
 =?utf-8?B?UE42azNlUHRmVHp4QzZBRHZuMTdYWmxKOTRMSkZ4b21DaGRYWEc2Y3FlNXp3?=
 =?utf-8?B?SFZVYXJaa0Q1QW16Q2F1MTM5TGVNU1Z0SXMyWUNWaGFyay9yV3JSYjZFcGsy?=
 =?utf-8?B?NVFnS0VCL05XdEdEbDBjK0NZemNsdXhGMGpUdms4TjhLMElzWG53NGZvZlp4?=
 =?utf-8?B?bjkybU5KS1J5cXhFUWZqWXUreldUcXEzd0JhbzF3dHU4a2JjaEJwMkpKL3FH?=
 =?utf-8?B?ZXFaZllteC91SkVXSGRZejFwSjN3U2R5c3dKakpZbDhqaUlqcHFGb0hwNzlF?=
 =?utf-8?B?ZWFTR3owZTB1L01HV0ZNaDNWRy9vcXAzaGlzdnhtSDYwK1I4SGxPcVRtYm0y?=
 =?utf-8?B?TE1aWElCSUpOeHVQdEx3SSszVy91aW9Pc2tEcHh0TlVQSmlOVXVXY1dSRDls?=
 =?utf-8?B?MWd2QmpyWkdBPT0=?=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <B4BC72D75E4509478040DC233C059856@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR08MB5784
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM3PEPF00009B9F.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	376d949e-ade1-4f3b-5e32-08dd985142e5
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|14060799003|35042699022|1800799024|82310400026|36860700013|376014;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?OU53TW50YmpuM2ZpZHNscmtWL3p5Sk9iSzR0RHVONnhTWUY0ZDBSYjM1YVFj?=
 =?utf-8?B?RzQ1dWtKcTZIdmJRQ1hJZHBHL2pFM1NMaFlrcjBTbkJ3SEhldVJoQ1Q2N0Iy?=
 =?utf-8?B?YzFCWGs2MktVQmkvYitjZnlmcFRaWHZab2FwZlBTOXJqbEhCMU9uNkZIa29S?=
 =?utf-8?B?ZnkrcTc0L1d6MnZLRDhIMnRuVHNNZnFzSWRQWUNOYjFwTkcwT0xlYlNnd3R0?=
 =?utf-8?B?M0NQS1NpZmR3MEQ0WEgzTm9xS0d3MXhPWjArMHI0OWpDZGQ3UnhRMWgrbjJW?=
 =?utf-8?B?cTRJSVBXTEVWTFZSMTRVVk4xYnNFSUV6UkptbmlLQW5MQmo5UXNZSkc1TmFB?=
 =?utf-8?B?RDRvMng0ZWoyNjlIZzZ3Z0hoYnN4NUdhNWxZTEpHTWJrNVpZT1NsaVo4Z0Nz?=
 =?utf-8?B?NkkvODl6TzF3aERTdlRSZEk5SWNDdWJwV0N2Q1ZLdzhjekRCSXVvVzRGaktV?=
 =?utf-8?B?a2FWRUhESlJSWE52V3lUdDJXSlhlbC9USDVJWGdVRFBLbTVqZklYN0pkRE12?=
 =?utf-8?B?ZjZ2bzNVZU5HT3pKOHNBdFM2MTBENjRxY2tVVmhNcHRNazN4bXFaUGVCWmNS?=
 =?utf-8?B?cEFHSVlKNVVYMGxnMisxOEY2WHhqbVg0QU14WUdtUVRBblYwMlBWSEZrODVF?=
 =?utf-8?B?R1VPVWZ4b1ptcEUraU4zQzhtTWkxeWEvaEhOV3BnZXhzTkRtU25ZVE1ieUNW?=
 =?utf-8?B?cFdubnhId3BzeHUyZkhXUG5LWm9RTkZ6eE5pUzhxanRKOERSWVV3ZFhmazRY?=
 =?utf-8?B?Z0xhSEYyMUJvZmVZbUlJUjdlaFFTdGJvZlc3YXhVeWJLNVp6alNPMDBkOW5j?=
 =?utf-8?B?OTR4aThqOXJtdnVZbXVMSTh6TzJyNHQ1YzNaaVRIVlp6YXVWUmQ3eVNmM1U0?=
 =?utf-8?B?TlRyRWdQWHFWZjJaa3FsZUUzcDd4NGIyVWpCbVduUm5PQ3d1dFZ6YnkzQnhy?=
 =?utf-8?B?ZkN2TzNjb1MvdWcyODRnTzhSbWNrdFMweHk3dGlMMDBpL0J5eSt6M3RDRzU1?=
 =?utf-8?B?OHB2WUt3LzJ4bU9EbG92d0Z1U3ZEZ21MOVN2aHh3cDFJMGs3WTAxOGhMRjE4?=
 =?utf-8?B?R2lOd3E1SEFoSEJrWDYwVTgweHAwdUFnMldlUFJyUnRYcVVteXB5eldYWXNH?=
 =?utf-8?B?YWEzbnQ1RmVoTzRGOWp1RzN3Q25maTc5ZmxWQTc0TWxJSE9NR1VzV2M4Qnd0?=
 =?utf-8?B?NmVxTnQ3Y0xrN2xVOC92VS9ISHpvcStwV0RPNUkvNDBSWFZyVjlXWURUSWw1?=
 =?utf-8?B?ei91UmlvcSt0a0E4aUhYTWtaWjRLajQrRnNiS2JvVnByTk5pa2ZMaWlGeHpU?=
 =?utf-8?B?Yk01Ymw5czhOWkNvT3V3dGs2b1dHYlk1NWw1SDBhaGlINmtldDBWWWVvekNS?=
 =?utf-8?B?cnZZaTdIWGVFbFVkKzJWRTlwUWN0bnBaOW9EdzdDNU1DME83RU5QY2NEZ1Vt?=
 =?utf-8?B?THlvZ1RQRlJ5TWxBTGZucTdodER6UnI4WHFsZXNFR3ZKNEt1SFE1dWFmSEpZ?=
 =?utf-8?B?L2ZJVlV5Q2MzeGU1ajlLZ1kxblJKS1B2MWtyQUZxWkhZdjZNY1IxOUlzRTVS?=
 =?utf-8?B?dFEvc0M1MzVldWIxUThxcCtoVGwrU1RZYXU0eHJxWmp6Y3RHSE5JVGFlNXor?=
 =?utf-8?B?ZndiWVVyNVFOTWtidlhYMDQvbkFrK20wa2tWSk9Cdjk5U3J3d1FFQnFqdU1z?=
 =?utf-8?B?aEhyVmVFQUs1emRGeXZObnR4dENpWWNJWVlMbjhtVy9YQjY1bWg3Rk5DdG1G?=
 =?utf-8?B?QXpMaFlXVEcwNlllSXA4VDFFSGoxSWxXUnRMNXp2ZVVETFlWVzh1VGI1SEFv?=
 =?utf-8?B?ckc0QlZBQ0w1bnl6WG1uaTdDV2JKUWpDTlRDbExFL01nYWEzSXAwUnlrQllJ?=
 =?utf-8?B?MXJLYjVxaW1JSHFsVFFuNlBvVkU3YWZyWHJJdWJBQnVEQ0IvUjRpN2pUS1lo?=
 =?utf-8?B?RnlSYzBrSmQ3ZVZqa3ZWRU1qTFJyMjZjS2NpYmFXUXlMd0NCOUNhVEJibjJs?=
 =?utf-8?B?TStic1pSQVJPcFEvSWNBbmMzY1MzdTQzZWlNeHpyZVB3RGlDekdwL3FvaFRy?=
 =?utf-8?Q?OttoZ4?=
X-Forefront-Antispam-Report: 
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(14060799003)(35042699022)(1800799024)(82310400026)(36860700013)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 May 2025 10:22:06.8904
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: df9480d9-44e4-4f67-1071-08dd9851569c
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM3PEPF00009B9F.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR08MB10402
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 21 May 2025 10:22:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217017

T24gMjEgTWF5IDIwMjUsIGF0IDA5OjUwLCBSb2JlcnQgWWFuZyB2aWEgbGlzdHMub3BlbmVtYmVk
ZGVkLm9yZyA8bGllemhpLnlhbmc9d2luZHJpdmVyLmNvbUBsaXN0cy5vcGVuZW1iZWRkZWQub3Jn
PiB3cm90ZToNCj4gVGhlIHByZXZpb3VzIGNvZGUgb25seSBjb3BpZWQgdG8gJHtTfS9wby9NYWtl
ZmlsZS5pbi5pbiwgYnV0IHRoZXJlIG1pZ2h0IGJlDQo+IG90aGVyIHBvL01ha2VmaWxlLmluLmlu
IGluICR7U30sIGZvciBleGFtcGxlOg0KDQpJ4oCZdmUgbWFkZSBpdCBteSBsaWZl4oCZcyB3b3Jr
IG92ZXIgdGhlIGxhc3QgZmV3IHllYXJzIHRvIHNsb3dseSByZW1vdmUgYWxsIHRoZSBjcmF6eSBm
cm9tIGF1dG90b29scy5iYmNsYXNzIHNvIEkgaGF2ZSBhIGNvdW50ZXItcHJvcG9zYWw6IHdoYXQg
aWYgZ2V0dGV4dGl6ZSB3b3JrcyBub3c/DQoNCklmIHRoZXJl4oCZcyBhIG5ldyBnZXR0ZXh0IHJl
bGVhc2Ugd2UgbmVlZCB0byBpbnRlZ3JhdGUsIHRoZW4gaXTigJlzIGFic29sdXRlbHkgd29ydGgg
aW52ZXN0aWdhdGluZyB0byBzZWUgaWYgdGhlIHRvb2xpbmcgbm93IHdvcmtzIG91dCBvZiB0aGUg
Ym94LiAgVW5mb3J0dW5hdGVseSB3aGF0IHRoZSBicmVha2FnZSBhY3R1YWxseSBpcyBoYXMgYmVl
biBsb3N0IGJleW9uZCBhIGNvbW1lbnQgc2F5aW5nIHRoYXQgaXTigJlzIOKAnGJyb2tlbuKAnS4N
Cg0KUm9zcw==

