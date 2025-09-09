Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EDADBCA0FED
	for <webhook@archiver.kernel.org>; Tue,  9 Sep 2025 13:06:03 +0000 (UTC)
Received: from OSPPR02CU001.outbound.protection.outlook.com (OSPPR02CU001.outbound.protection.outlook.com [40.107.159.15])
 by mx.groups.io with SMTP id smtpd.web10.12548.1757423153593720448
 for <openembedded-core@lists.openembedded.org>;
 Tue, 09 Sep 2025 06:05:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=b4tMBLqr;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=b4tMBLqr;
 spf=pass (domain: arm.com, ip: 40.107.159.15, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=KPEoSrUQZJUv5RY/vU62SLvhXLcf/Q/ZEpBeRqKvzH82vdCLINJPJCJWX6bWByL98LgJdqa1ok6S2791dgFleDpXhQR0vtu6+Oc3wT/mYPaff8nOEg5jAU4RvQ0mkph4deorb+V7/fZZVoxfDQlzZA3VsLDXPsXe7AN4Pq2CtQEm/ZLgSdAiObjCSwWWINm3n1rHOrUwQkHspIbUL4CiTQXnG0zkV6rOJEs0CuJbV1L7d21Rr0j8GRBH19Kr7xIjL0InEkQt/IIOTtz4GXh4L0bFjE+47ox05anTv6HyERYNIADMvJPo9l6GBgMOFAjsFYbE7epYVd9a6mJayJrICg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RIwfMAAn2QpIcKoKkftAudUBIfTdIhfItWPaO+ATm0U=;
 b=nH/1bYTXqoXi3JSXuvjv5o5IFebLYC/qK2U/RRNrD6+hst8oKh4v9yFBW4XgtPdWYoT/i66SbBhMUVwut0e2kZ97daDEXI5GZPYyKwQ8ohzB+xnC80ivNMQs7r0LMEGIOCJGBxfhFBgNsoOUjAlPSV2ryzrRqWqOgULlzVDw+Z+N5PZhOHlhiaLRx8McSQSALH0+AexK9s6YX3ru8NFZ4BcYywh2Tq1YN/e03+zL7MvqQrqfJ97MURmPvvyhco2t92SvScWpr8HqSIH25l4t0Ns48Av58i+TKnJcRM3FcG2y7hQgIrNpvWvtIR5mQaZpS0ehkl9Oe0X36NwfxA2RsQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=siemens.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RIwfMAAn2QpIcKoKkftAudUBIfTdIhfItWPaO+ATm0U=;
 b=b4tMBLqrO0SXG2lQoKWCTsxUWDwc3NZlbnYbQbmUPj4XOGc0GgtgvOE5Ob2Tx0goPZNv/FjjLVNQxYfQz7Fvo1tAWWL9qmR6PoWvWpwFLRLqE5jRKwlTu2WZlpbxHtypg66sf9V94WBMV2ARsyntJm8qCx7ep13jes7gQK7PKII=
Received: from DU7P251CA0001.EURP251.PROD.OUTLOOK.COM (2603:10a6:10:551::14)
 by AS8PR08MB5894.eurprd08.prod.outlook.com (2603:10a6:20b:23d::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.22; Tue, 9 Sep
 2025 13:05:44 +0000
Received: from DB5PEPF00014B9C.eurprd02.prod.outlook.com
 (2603:10a6:10:551:cafe::f5) by DU7P251CA0001.outlook.office365.com
 (2603:10a6:10:551::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9094.23 via Frontend Transport; Tue,
 9 Sep 2025 13:05:44 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DB5PEPF00014B9C.mail.protection.outlook.com (10.167.8.170) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9115.13
 via Frontend Transport; Tue, 9 Sep 2025 13:05:44 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tB4LvZF5Vyfykj8XZ5t3535ClIZGYpEk8K/zXy4Cli8DYq4Q5XEcSQuSyFWwIOkdXozPu9Z8f/S2H4MZsRMlDwsKeS5lgj7K4ofFRabeA7DU3WRwR9BT27IOTstnLKCUWr0GMOmc7FOTkZyO1MK8goWQHqcT41g77PVegODGEL/oqfhLhWAlyi4784RydF4AE6Kw8camwFme7s5IMUbtbP1I+YgQxeguBOvzyk+h7sanuwKNNEZSj67drLZQjCIG/SVCeKyMfMv/q9Kgy0plPrl3YXhs0YA3hOEpYA2gxLyz8JdxN/6jzB5+HDSFZuPZenrd8VZR7w2kCEaMyHg8hQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RIwfMAAn2QpIcKoKkftAudUBIfTdIhfItWPaO+ATm0U=;
 b=Es5C8yMEs8aMRbsrczKJ6aPyiDVhWVqQLLcIL17Ljzuw5znz1258OK8yixUr1v2b5uTllMfHCdNRyO2qJxMMKzYYt7y7gFYr0J9Sn7SrjU6B/Atn5ngAs6Pw3+G1WEQJ1RQ73PrMpIPJ7f2iYUxqH6v0gyQyLfk/RjnfUGL4Xz8pZcrGPpdOJcs2nKSIBON4NLVSsM+UOFjqNi5MfUd+obRv/gz8rpgcYgNJSbI8iEFW2AcVBjIHWPDeQLgAlmU14p3oM4K2oXW+evk+zTu9cCa+XjUdg+F+GsrcPxBTboB7ThJlWmuo5SdhBnk81l8kqLO6WVrcUb0IctM+O8juYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RIwfMAAn2QpIcKoKkftAudUBIfTdIhfItWPaO+ATm0U=;
 b=b4tMBLqrO0SXG2lQoKWCTsxUWDwc3NZlbnYbQbmUPj4XOGc0GgtgvOE5Ob2Tx0goPZNv/FjjLVNQxYfQz7Fvo1tAWWL9qmR6PoWvWpwFLRLqE5jRKwlTu2WZlpbxHtypg66sf9V94WBMV2ARsyntJm8qCx7ep13jes7gQK7PKII=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by DB4PR08MB7959.eurprd08.prod.outlook.com (2603:10a6:10:38e::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.22; Tue, 9 Sep
 2025 13:05:08 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::7f73:806a:3493:7d50]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::7f73:806a:3493:7d50%4]) with mapi id 15.20.9094.021; Tue, 9 Sep 2025
 13:05:07 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "peter.marko@siemens.com" <peter.marko@siemens.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core][PATCH] sqlite3: upgrade 3.48.0 -> 3.50.4
Thread-Topic: [OE-core][PATCH] sqlite3: upgrade 3.48.0 -> 3.50.4
Thread-Index: AQHcHSH/d/EzehD7/06lS9AorWA98LSKvdCAgAAcmoA=
Date: Tue, 9 Sep 2025 13:05:07 +0000
Message-ID: <9D9FCA93-9D8F-4F86-A080-C1CCD08B70B5@arm.com>
References: <20250903222658.3929743-1-peter.marko@siemens.com>
 <DE61F3AA-CA08-41FC-8F66-04910F2AA132@arm.com>
In-Reply-To: <DE61F3AA-CA08-41FC-8F66-04910F2AA132@arm.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3826.700.81)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|DB4PR08MB7959:EE_|DB5PEPF00014B9C:EE_|AS8PR08MB5894:EE_
X-MS-Office365-Filtering-Correlation-Id: f20f0def-1126-4700-5964-08ddefa19629
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|1800799024|366016|376014|38070700021;
X-Microsoft-Antispam-Message-Info-Original: 
 =?utf-8?B?SUxwd2tzQWpQZUlOcmkwRHRMWXkvVjhqdFVRM3U2Z2NaM1V1NkVndXZzNkZv?=
 =?utf-8?B?WksvWnVpZUJrTEQxTG5tVmRmNGJid2xDVEY4YlJFY3AwNllyUzl2bTlnN01n?=
 =?utf-8?B?TWZ5bFowOVdXcmhIQTY4L042NzYxT0VjOWp6dXpxaHZSRWt2SWFlaWtnT0RG?=
 =?utf-8?B?TDFib2J3VDNJdDRhdE1GMFNhSm94UVMzTG5sdzhGU2tJeXZkbXF1VVV2VTdn?=
 =?utf-8?B?YldQY1d6QnVsbFprNzhnTmIwWS8vMGFmK0FvV1Evdk9YV0ppRmgrWnlCYWFP?=
 =?utf-8?B?RUpERHVSQ1J6Nld1d3l5amRIbDhQelp0blJOcTh6M1BDWit1MXJEaVBGY1ZH?=
 =?utf-8?B?alMrUDR0bnVmczBERk51UGVkRFp4UjZGWW5ScTYydWZTSFFsQWlNazE2U3R6?=
 =?utf-8?B?WTFyVW82ZnAwdXRGRXowMmwrVXhDcUdEeC9GZXprNk5MRmJEVUN0NWdFcWhR?=
 =?utf-8?B?UUlxV2w5RHIxVXhibThNUTJBdGRadURSR0VhdHZueFcrZVNwVHVwM2NSZnZo?=
 =?utf-8?B?Vm1jU0VCdDdsWjJscVRvcWwwR3ZycVBkV1Q3ajVvOGF5VzdFUWU1WjNCZWZU?=
 =?utf-8?B?NURyVUxDK29QdlhyOXA1VnFuTzZYbXpiWnhrVlNNUytqeXFGemd4ZzdqTmE1?=
 =?utf-8?B?OURwbE9DbmdlbklBVzZ4a3NnVkpCOEtMSWt0bnN0MXp4TjlnZW92RStub3Q4?=
 =?utf-8?B?S0lRMW9SUzlCd050Y1dMbkg3aVlXNlY0VEZuWnN4TGQ3RDhia2szUWlzQmZw?=
 =?utf-8?B?MFpRWWVZS1ZDaG0xWnEvTGNYUjFSZDFoeis5TCtXdGdFMTRPU1FydGh2QmEv?=
 =?utf-8?B?Vll0V3NzOU9sc1E0OGxPTUlVclJkSTlEZjZXZW9ZdDRhUXBuUUJDTGNXRmdE?=
 =?utf-8?B?UVk4MUZzSFN0RE9RcVR3Z25wZzBBWG1EbDJ4R3RIWFRiNUlEVXBRU3VUdzVJ?=
 =?utf-8?B?bGJDNVFlYTNzbi9WTkREWUpNMUxybitHcndra0ZKazcxdWJXcGd2MDlma29a?=
 =?utf-8?B?cmNDdXV3MTVXeDhESDdNNmlJOC9GQVZ3aEVPNlVzYjllTWF2eDMvUktoS0tX?=
 =?utf-8?B?YURWay9yK2tXRmw4WmtWUVdLVmx6VENGSGpuYm9xWmtoS3R0d2RJK1VsZnBW?=
 =?utf-8?B?ZDJBb2l5aFdSS3RsZ0FHV3JTR1JzZDJMYVhidkdkbmNrL05YZjVkdng0R1pR?=
 =?utf-8?B?RFRXZlQ5bGx5S1BpNGVTUWVFSlluZEcvNmhTRkhvaVRxc0lGZXNtZ0VGOEg0?=
 =?utf-8?B?MWg1UUVNR2VEL2FDTWg2TmlsNUIxZExJY2Zqd0NXWm56U2xVSTd1L2F5R0FU?=
 =?utf-8?B?S2d4Zm9QbEhmNDdVWkVRY3MxME5xcms2eGlSckhDSm9URVhpWkE3dnRweGhH?=
 =?utf-8?B?Q01PdWdFRjFsOUtOTGJ3OWc2ZlpGRXBadDNpczB1MXU4OXl6WlNKRzRVTzBx?=
 =?utf-8?B?U1VlVURtR2xVNG16RUlTd0YyYmxQdlc2TjNRUzliV3c2OUhndnJtL0NGaTd5?=
 =?utf-8?B?YzJjeXFEdmZjQnZuZWt5Vm8wcnRwMVNRN0Z6akMyaTl4b3ZNT2k4aldjbVY5?=
 =?utf-8?B?MGdvNzBTcm5ieEhMS0ZFY2Q1SGhUejNkOUpmNmtyaCt4ZUFkWStaTzEydGxn?=
 =?utf-8?B?TG92MU9zWHRJY29RV3MxKzg1ZUl0ZEpFcEJJMmxPaXFSc2V0MEdsQ0V3TmYr?=
 =?utf-8?B?dWgrMWdZMHdjc1hKcUpOTlBYYlZCOStYWU53dFVyQWVPTHZWUUhoeXdCVVNZ?=
 =?utf-8?B?emtEaFNmeHZVQXBtZUFCVXZCMUkrUjZpYWlYN2cwVFhGRklKemVUZVNtYnE4?=
 =?utf-8?B?KzArOEhocVg5ckh3aVR3akk3TmFkZ3VWYUFxNHdoeDVmZ3dXTzRXNHVLZGlx?=
 =?utf-8?B?R21BS1NpemdaRUtVM0JFbVFQYWVhTm4raHcxRHpYTDB5QlNvUVViY050L0Fq?=
 =?utf-8?B?UUdBN3h1b1BoN1FkMng1SGJ2ZkI3aHBQWG4vZEFZV1huek0wTTVtWjQ5eXNJ?=
 =?utf-8?Q?GWByjSAqfvto6qQ/DiUETqH3x6JasI=3D?=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700021);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <3EA1D7C6CD2C274E91C47274531F5E91@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB4PR08MB7959
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DB5PEPF00014B9C.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	edb6f305-08c4-4e45-db51-08ddefa18044
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|1800799024|376014|35042699022|14060799003|36860700013;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?b011dlh4Q3VuYmxlTDczaE9jZ0drMnVDSkRlTEdRa0tjT1lxVE51N3l1NmlT?=
 =?utf-8?B?QlgwYVZ5MFdRckYwblRJS25HWDk0QnFGMWY1T093eENHaHo1L2pvWTI2UDNT?=
 =?utf-8?B?WkYzdXBwdDhQOVdjRzgwYkdKcXM2V1RkK2QySERyWGVmM1JVUnlsNkdrdlNQ?=
 =?utf-8?B?TjFxaFFKdkRQM0dWRDJ4N0NUamlMZ1FzOWRLTUJzSlpxOTFScGRVeS9JMmhP?=
 =?utf-8?B?Q3dWdTBoTTFOb1BFbER5RGpOQzR1UzB6eXFJTThnakNJZkFGNmx6WlhWVFZN?=
 =?utf-8?B?aFhnVUdabmx2bzZxcVRSTkthWVR0RVQ1Qkd3bkJnTjFhaDRCbU5mYlM0Zzc5?=
 =?utf-8?B?NlRGOW9kTWtnT3Z6UHFZdnNacHV2SFVGVGpNajJVT1lDVW5wTjBqMGN0QkhE?=
 =?utf-8?B?Ry9XbkN3NWlkMnpOTC9XYU0xS1h5R05CVGQ4aDhySXFpdHNSVlFsQ2d0TjRr?=
 =?utf-8?B?dUQzUlZOL1haMUdTMjVtQm15ZklGNXNtQmNTWjRRbnUvalliTE51bGlHTFN5?=
 =?utf-8?B?K0FjS3JoRGhwTThTZC85UUx2Tks3MHNqNTJKS08xbFc2WERNbkJLck5qWkxK?=
 =?utf-8?B?czIzNGFUWHYwSmhHZ1hEMENtZlltT3RpSExIaC9OQ1BnbTk5UkIyb1RCdnhO?=
 =?utf-8?B?MWhZUmJQYnJvcW9CSFQ2L2pwUjJpbGZtb2NWSnBBcURZancwTXRYS1dwSDA2?=
 =?utf-8?B?VDE2UVFoZk1sVjFrNmVYejg2TjIrWHE5MzdKcmR3cXpZZXFST1g4cnphUEEv?=
 =?utf-8?B?RkhHN1VyMllNQUJ4ZGZSbmdQWEtOKzR6cGk5Tnhmd0FuRndRV2ZvbTRHdEhY?=
 =?utf-8?B?UVI3VmFZOGk1ekFnUENiSDFMQnRPVFZuWDk1Y1pUV2labkVZenR3ZGdrTmRI?=
 =?utf-8?B?MzhXNGVRNmlsazZsTExRRFBkZlUzWERpTmI4TjExbXc5OTVuZGhyNVM1dTVL?=
 =?utf-8?B?eW1nakRMS2lEQkZITUI1N1lLNjUwbnFzTmhwSGdSSjUwbmdPK2E5aHorT0V3?=
 =?utf-8?B?K1J3czhnTTNYYnlCMmtrTnd4WHpCK2ZFSTZNOFVSR09EZWFoN0xERGlReTVu?=
 =?utf-8?B?bUdIOVVqOUNodmNEeDUybDdEUkVxUEs0ZmRiTHBnTlp2ejNRMlprdHRqWGFu?=
 =?utf-8?B?UlpiZjJtdkJXN3lMT0c4aHM5NVdtYVp2SEhJeVhBNmp4N3JzQy9Qb1F1Q0V3?=
 =?utf-8?B?V3dhSW9RV3U1NzFaNGRxdDc1Z1RZeFpuNk10NWpJekxjNnhkQkQ5SVQ5aGQw?=
 =?utf-8?B?WkI2VFZmdlNVWWFsdUhqZE84emJRSXpVTFRMTytMMUZCMlNhTTN4MHBVQ3VP?=
 =?utf-8?B?R09MZ0NNZDNtNUZ4T2dacVJDVkVRb1hDMzFqK2tCZWc5MHpiS0dXUXA2NVFn?=
 =?utf-8?B?Sm00bVdxeG9IVkRHKzRQTnB0YzNTSmtINVl5NVBHTE15QlZ1RVFVSXowRWxS?=
 =?utf-8?B?Q0hFOHpUYXVEcjlpMVpTK1FFWHluSlBsUEhxanNDTytHa2RYcHNybEpJc3Zk?=
 =?utf-8?B?M1dwcUxQWnBoZEpPOXpHYUxSWjdzTVdMSTdVNUhVbmhnd0ViQWhWa0JscVFi?=
 =?utf-8?B?ems1bm5CbW5xcUZvbjlqYUpZOEx3QlBiU2xVS0tKbmhETFNydVhNWS9OMkx4?=
 =?utf-8?B?TC9zZFVqeVNkeTRMSFQ3VUxNTDRYaXRZYVZudDdTVitncGFXeFFzRWJFeG9w?=
 =?utf-8?B?aVBKc1l5SnlvQ0o1WWt2Y2h4NFkvSWRhSG85TGNwM1FKMW1zM3BWNFd5QWZx?=
 =?utf-8?B?Z3Q2VytrNVpJdGpUTkVzeitVUC93dlZuc01zWjB5cm5LMHEvT1VLbzY4czA5?=
 =?utf-8?B?OXM4YkcyTDgvZncvbk4wK3BGTDZiQVV3Q1pwTVNtZ1ZxREo5RTF1bnhZNzli?=
 =?utf-8?B?VkpFVUVoTFpoYWFPU0RGbTNZOFlScWhnU0dCWmY0SWlYRjRCK29SVERtNWFv?=
 =?utf-8?B?V0l0Sy9CcmJ6bVFqVFVjeThMV3RrU1BlMjhJSzdDZXJlekw4anEvRm1TUEU0?=
 =?utf-8?B?TzZCUWhrQmxNOWp1WTJZMm1xRy9HbFR5dnhOejA5a1VIYTVtZmN3RFU1cXJG?=
 =?utf-8?Q?zDUn7T?=
X-Forefront-Antispam-Report: 
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(376014)(35042699022)(14060799003)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Sep 2025 13:05:44.4077
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f20f0def-1126-4700-5964-08ddefa19629
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB5PEPF00014B9C.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB5894
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 09 Sep 2025 13:06:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223110

T24gOSBTZXAgMjAyNSwgYXQgMTI6MjIsIFJvc3MgQnVydG9uIDxSb3NzLkJ1cnRvbkBhcm0uY29t
PiB3cm90ZToNCj4+ICogYWRkIGhhY2sgdG8gcmV3cml0ZSBuYXRpdmUgYmluYXJpZXMgYXMgbmF0
aXZlIGluc3RhbGxhdGlvbiB3aWxsIHN0cmlwDQo+PiB0aGVtIHVuY29uZGl0aW9uYWxseQ0KPiAN
Cj4gVGhhdOKAmXMgZGVmaW5pdGVseSBhIGJ1ZyBpbiBlaXRoZXIgdXBzdHJlYW0gYXV0b3NldHVw
IG9yIHNxbGl0ZS4gIEhhdmUgeW91IGxvb2tlZCBhdCBhdXRvc2V0dXAgdG8ga25vdyBpZiBpdHMg
YSBidWcgdGhlcmUsIG9yIGluIHRoZSB1c2Ugb2YgaXQgYnkgc3FsaXRlPw0KDQpBY3R1YWxseeKA
piBhcmUgeW91IHN1cmUgYWJvdXQgdGhpcz8NCg0KSSBqdXN0IGRlbGV0ZWQgeW91ciBoYWNrLCB0
aGUgZG9faW5zdGFsbCBsb2cgZm9yIHNxbGl0ZTMtbmF0aXZlIHNob3dzIGl0IHVzaW5nIOKAmGlu
c3RhbGzigJkgd2l0aG91dCAtcywgYW5kIHRoZSBiaW5hcmllcyBhcmUgbm90IHN0cmlwcGVkIGlu
IHRoZSBpbWFnZS8gZGlyZWN0b3J5Og0KDQokIGZpbGUgbGlic3FsaXRlMy5zby4zLjUwLjQNCmxp
YnNxbGl0ZTMuc28uMy41MC40OiBFTEYgNjQtYml0IExTQiBzaGFyZWQgb2JqZWN0LCBBUk0gYWFy
Y2g2NCwgdmVyc2lvbiAxIChTWVNWKSwgZHluYW1pY2FsbHkgbGlua2VkLCBCdWlsZElEW3NoYTFd
PTZlOGQyZWY3OTNhNWFjZjkyNzExNmY4ZmZhNGIyOWJjYmUzOTM0YTIsIG5vdCBzdHJpcHBlZA0K
DQoobXkgYnVpbGRlciBpcyBhcm02NCwgdGhpcyBpc27igJl0IGEgY3Jvc3MtY29tcGlsZSkNCg0K
Um9zcw==

