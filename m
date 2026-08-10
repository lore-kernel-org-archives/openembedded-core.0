Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24F4AC5AD4E
	for <webhook@archiver.kernel.org>; Mon, 10 Aug 2026 09:44:03 +0000 (UTC)
Received: from DU2PR03CU002.outbound.protection.outlook.com (DU2PR03CU002.outbound.protection.outlook.com [52.101.65.28])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.26424.1786355034331790993
 for <openembedded-core@lists.openembedded.org>;
 Mon, 10 Aug 2026 02:43:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=KRLJrZEI;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=KRLJrZEI;
 spf=pass (domain: arm.com, ip: 52.101.65.28, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=FbPOQAUtEB93z0F/Gl/2QkX3G17BjxbuXTTacDaKdwiMv2WU1G+Cy/o2honex/oc0aQU87+BLN343qlmdhwfam3nsWNYlEL5OTUNMswj23GYsihzKZDosaflhJe+aDFaHuMug0Ix+p7/3n9KY1IebsyQATaKk3i9vWEf50tZxXWOIgwfreq0UvHmRO3tQC6iCoT5Ri8InJtokvRZQZ6/km10JfLcsRHdAOlaxORHXgyimAuAWJz9/z/aqPl3xwUfAG/7LAjAbyOukINerwBq9oY/X/bRFuQFFQTQ9IgDRxdItmdlWJ9GCQPaVbu8F0sDtiQha6b/ic+qSd4QdySj2w==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Qw86VZxuEXK3pjviI5f+1jMQnqN1NR9h8ONs9j/cX3k=;
 b=XIx1ODx/BVsuJIXy7St1dGkyx9o2ZVVOVjCiz2OEWRwzSbtdHXtTBnthbYj9qW+NSwihZKpYj5t5C623wC+WvEAEjTIcWI1HpY3igyEhntxdl5DLdE4ZeniUMg5rck1mLFOQkoN40JXnmpkJotBDzcxV1gzCTnrvIZ/DxcEGynh0WpOZqzxNyorOu7NeWitbAXiAp0bJKm5x9t2vhKw9URlyPK38NqVD/2KI2vYpOOAa4bd+BEJQQkoMUCo8RPRrQKOI7qA1HDYhN5hrmaAJmwJOJ/wWHfd4BAVZ7bexmA80qKANilnXmPJEGOJi7Es98YkuheFiYDD9R9mnMR4Zew==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=windriver.com smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Qw86VZxuEXK3pjviI5f+1jMQnqN1NR9h8ONs9j/cX3k=;
 b=KRLJrZEIVJAXE1HucOwrI0hPrDxTrCPh6U+AAP1s91DVDNay621s4WgdOxgrcIbasBmtz2Xmod+e/5QhP4kZJTAAvp3V4uqR5re2mWip9HCdqTgPtnBHWIVb0CIUW6YDzwxoCfh2KNlEiBwJL1TTuDZG+kNifKuzgYYnKHECi2Q=
Received: from DU7PR01CA0004.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:50f::18) by DB3PR08MB8939.eurprd08.prod.outlook.com
 (2603:10a6:10:42b::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.25; Mon, 10 Aug
 2026 09:43:47 +0000
Received: from DB5PEPF00014B97.eurprd02.prod.outlook.com
 (2603:10a6:10:50f:cafe::8c) by DU7PR01CA0004.outlook.office365.com
 (2603:10a6:10:50f::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.292.25 via Frontend Transport; Mon,
 10 Aug 2026 09:43:46 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DB5PEPF00014B97.mail.protection.outlook.com (10.167.8.235) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.315.6
 via Frontend Transport; Mon, 10 Aug 2026 09:43:45 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=I6xaJJ0MszU5VJVE/Guhv5uCy8Y0pbJpMrox2u6xIfqrOQcwf63ZkwnE1GHTNWkGoizzrqptGBgJZ0gweE8o6zFR9X2mkPz8VyiImPj+HRji+9edPXnZbNlXTMpe0jYuwHn+Wef5vyp/YhVTo0ii1IM3nOaBfw49wXsvEyYuzfp11LqJdXnFaGAB5X5ScrOR6OF64w4YwuHnPW1vc3ypeCN/f9AVTK7RxWhB3TaSGTVCs2voPEXAf9Q+tDBCjcHWT8rM7YRcrOhMmKmH3O2wMvfSIGWmv+VOiLz1Wq4SvprBxts07wMOjuy+bZo8SVFHMaEP+3kuqc2MfjV5PAtUxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Qw86VZxuEXK3pjviI5f+1jMQnqN1NR9h8ONs9j/cX3k=;
 b=eZzR4940NygTq30+ayT/F5B2NCnvsC6RLSIZB5iww+RkC2zCLOK3rEKVWtu8H3QkRLF4buJppGNxLqvKIeS1CBijGnKU3U0NxX5apjj1n5yp4qz5UX0+xvV5+4avVcA4kIkQCseP7PT6G2Ws6sM6jaXUlATr8Iw1tpvtagJriRp7JVmV7yV0FOG/zUEB0G1ZH6bpDkJT25BP5iCp89qxGhYCoZ2Y/RZptjvghVhDN9rF1Nu+LnzEUqGOF8MBh5nexYjK/6NWgX69TuH6uTyda73bn1VwCD/RlIX5Q8M6hXaaL5W93jnkzjf4qc6E5pdywM9vGo3FUrUQt3B6B8LfUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Qw86VZxuEXK3pjviI5f+1jMQnqN1NR9h8ONs9j/cX3k=;
 b=KRLJrZEIVJAXE1HucOwrI0hPrDxTrCPh6U+AAP1s91DVDNay621s4WgdOxgrcIbasBmtz2Xmod+e/5QhP4kZJTAAvp3V4uqR5re2mWip9HCdqTgPtnBHWIVb0CIUW6YDzwxoCfh2KNlEiBwJL1TTuDZG+kNifKuzgYYnKHECi2Q=
Received: from AM9PR08MB6258.eurprd08.prod.outlook.com (2603:10a6:20b:287::19)
 by AS4PR08MB8045.eurprd08.prod.outlook.com (2603:10a6:20b:585::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.25; Mon, 10 Aug
 2026 09:43:08 +0000
Received: from AM9PR08MB6258.eurprd08.prod.outlook.com
 ([fe80::171d:1f8b:720d:7a1b]) by AM9PR08MB6258.eurprd08.prod.outlook.com
 ([fe80::171d:1f8b:720d:7a1b%4]) with mapi id 15.21.0292.024; Mon, 10 Aug 2026
 09:43:08 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "sumanth.gavini@windriver.com" <sumanth.gavini@windriver.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, "alex.kanavin@gmail.com"
	<alex.kanavin@gmail.com>, "mathieu.dubois-briand@bootlin.com"
	<mathieu.dubois-briand@bootlin.com>, "mattware@cisco.com"
	<mattware@cisco.com>, "esparlin@cisco.com" <esparlin@cisco.com>,
	"peter.marko@siemens.com" <peter.marko@siemens.com>,
	"randy.macleod@windriver.com" <randy.macleod@windriver.com>
Subject: Re: [OE-core] [PATCH v13 08/10] rpm: filter /usr/bin/pkg-config from
 RPM auto-generated Requires
Thread-Topic: [OE-core] [PATCH v13 08/10] rpm: filter /usr/bin/pkg-config from
 RPM auto-generated Requires
Thread-Index: AQHdKIRnIWz6MuqNgEKJhxm8Iw/KVbaXCDaA
Date: Mon, 10 Aug 2026 09:43:08 +0000
Message-ID: <1A55FDD7-E4F7-4423-BA3B-7A91F3586AB2@arm.com>
References: <20260810045250.3903576-1-sumanth.gavini@windriver.com>
 <20260810045250.3903576-9-sumanth.gavini@windriver.com>
In-Reply-To: <20260810045250.3903576-9-sumanth.gavini@windriver.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3864.600.51.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	AM9PR08MB6258:EE_|AS4PR08MB8045:EE_|DB5PEPF00014B97:EE_|DB3PR08MB8939:EE_
X-MS-Office365-Filtering-Correlation-Id: f8de49e3-81c7-4d53-c4e8-08def6c3df04
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|366016|1800799024|376014|23010399003|22082099003|18002099003|10067099003|56012099006|11063799006|4143699003|38070700021|6133799003;
X-Microsoft-Antispam-Message-Info-Original: 
 GCwBihq4veHsUyh5GD2BLucLPe2NayiHz8D4I11EiOznOluTpt3H8An0/niZUGWSs3WiniknwC5AnWydm4n14X75ZMcj3CWPVbRO0nbdxal6Yr4tAvxlIjlnDfQZS1IrnYeszjLHZfLhuqXLC/AefGhhWRGfpfO+EUhbNDmBvZbkcu9X1JssrWE3vBIF5Wf3ndv1w4uWVVBdNNKxm+wimF6DrmtFL+NxBLfNj19X6WrAHEjAPcVr7PL/O66bGX0EY/YwSKDjwrpF+GNJ84Ng438/fIil2QxnKS7clsxnYazh4HoTJUh8QiaiK8rBKOq3NQ7C7+Y+y4KZrp08XUHvxQOlDCaxoPdkwD0zYFN6IUywOJWKgLbZDkhw9FD9mFBYg0PlOSr8uGF8RiYR7Uz4G2gfWIne3+l5f/upZIPsjvbEVt6wlDK/x+uA/bbpZ7lnIWPABXMGeD3MmczkhV29uePz0EVAAdz/MZOmwBKKdHF26Na6AKnkM7pqK1rz8P7Dsoy+z5KSm0vwC6OPH/V2nwO1gsMHhl0ZEOPO/j8oXwCncDC2Y3LIu5Wm/7F8hYU+e/ZJ8z4s6IukBTWFj6DGEW5HM1laig9HEE+S5G13gxb7FQ9gVrFdIW1hATiHqmsbsJeNZAcgwp2ORmnz1l0vR2k0UJKyqPi+yFLo19Dj64dMHYarFvO4VevOGziuMlupj/eUTNySHzK1whb4CCGsGGC1zgDGPpovziWDTTNPIdk=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR08MB6258.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(23010399003)(22082099003)(18002099003)(10067099003)(56012099006)(11063799006)(4143699003)(38070700021)(6133799003);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <EC6943A07468914CB76D7D527898AE34@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: 
 dDgJUYxIFSbt+r4R42MR1YLoSgIaYHugJwgdaFNyrVmaCZ+pCLUK4TBuqCyLpoiZlD+GJk3K9+XucSrjkyV0cGQnesAWNihTN7E3KdE3GIjMSy+F+qWfuJpPFi8aZ4/tH+X6QjsGqy+25tvbrnokzR2/fo9qngGhaCFBBcFSwM8wkT9vMel0yPnxvLf5TFc3mzTZcRJHuNwCYMKPVBwtrqgKRw44EPfknnjf8ozEY6ksSf+nPmFB9l0tyRSpWNjJbaEDdpKVj/MA8F+CMQVbVeYm0m+u3/yApYI5D0Qdo9lljGeYMwj7wyuJUTLtdIOrO2hSVcRW7pLnJCQKqFnpmg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR08MB8045
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DB5PEPF00014B97.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	9f4de263-1067-44d5-b690-08def6c3c8c0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|35042699022|376014|36860700016|23010399003|82310400026|14060799003|6133799003|11063799006|56012099006|4143699003|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	TDzof3a7Tw629Qzt7mB95NO4bfHok3D2h5+KsnV6DDC77ZLfMGLuwskMd/LVUI9H2VHUzTAwqogSmN6ipReKfI7ZcxstcwlEBzy612QBsjJKr8AlD9RzYRTOxU9CNDSDKsQwosRqpBDmrTrOz8ByKcaS/Mi7u2/MDG5TMK4BkXm/LDOlWfrrn4Z3bSwvwHg4axJiJzXQHsaaq06RVVsDCtFPUgmek6rhhiiR+iU5QibOclNxQ1WufGFiBu9aD1zL1RW4Sd0gyJLGbgSEWLxljgozEHg/fRF5Zcy3T0bSLDhcvsrvvHVmHRASsRF744sQiIV2NR6f9KG2mto2kc+PJmV87IEoRFPZx5rXg6KNeMeHGL0nY62QIchyNp3LY3eZIMqfKZew07KR0BFabrxDhtWDc6aXKZcsbgYe6HUHi5fs+B8+GbSzOmxqV80z+boT3lNA/2GxCqzPGRixoH6K+ep+Ur8z22Iix7HqqV9ZCHZwrEnGSENW+8yc1npEKPm9P1YYBeg5Ax0kh3wU2hA6KMQCLi5GxM1bSYIfYYcpbUEGAj6O93ZkdnHpNJ1jumsrvU02zVcm9PW4G46jpWFiFkAYdCiBaW7im4LA2LR+47sahdXnpehIIB+4LJlfk01eQn03ZKmN7wTgelXE58hcf0m7+VntvgB9qRmOS4VfICcTYFZpuVfLBNLzfyrTV4jYgQao4xBgsiDNL23dpHrqCQ==
X-Forefront-Antispam-Report: 
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(35042699022)(376014)(36860700016)(23010399003)(82310400026)(14060799003)(6133799003)(11063799006)(56012099006)(4143699003)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	x3erzzyIJ/HiRVAvjjvPtoGaeGrZ78pkXZzAHRtoJQpKPLcOf/YBvAg12iwJ7Y5xFEFg9+MBCgkYNQ7x1ix9o3L2LtrM9YsIqooDlz9+QX8UyiDrlSkD7QdjS0ZpQXRyLGnto9j1HrdrfBd5M17JmmfpKyHAfgv+z/Or64oXATC860HYfNJnHTTZ9vPAORx4jmbhAX8l8C1kcD7/WXLNJMI59LeEVaIdKc26cC6A/HbQZ78HrPCaLxnSa+vhLIPpIu++zUfUjk9vIpiIzA8djAr821XgwAPB7LX32t2+4hc69SJctzlY8OdTwrC+oYFiny8li3lHpOedNrCi9Yq/7pp/D/5/3cvYN6B4DPuU/7wuGtKyqnAXFZYHyTEEeNU8TEK61KT35toH+f2vyRk8ySkHKP6Zw1mEO6VW4DxNpDdLcKZItHI8lvZoXwHUMsF3
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Aug 2026 09:43:45.2820
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f8de49e3-81c7-4d53-c4e8-08def6c3df04
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB5PEPF00014B97.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB3PR08MB8939
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 10 Aug 2026 09:44:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243122

T24gMTAgQXVnIDIwMjYsIGF0IDA1OjUyLCBTdW1hbnRoIEdhdmluaSB2aWEgbGlzdHMub3BlbmVt
YmVkZGVkLm9yZyA8c3VtYW50aC5nYXZpbmk9d2luZHJpdmVyLmNvbUBsaXN0cy5vcGVuZW1iZWRk
ZWQub3JnPiB3cm90ZToNCj4gDQo+ICogQWRkZWQgMDAwMS1wa2djb25maWdkZXBzLnNoLURvLW5v
dC1lbWl0LXVzci1iaW4tcGtnLWNvbmZpZy1hcy1hLnBhdGNoDQo+ICAtIHBrZ2NvbmZpZ2RlcHMu
c2ggdW5jb25kaXRpb25hbGx5IGVtaXRzIC91c3IvYmluL3BrZy1jb25maWcgYXMgYSBoYXJkDQo+
ICAgIFJlcXVpcmVzIGZvciBwYWNrYWdlcyBzaGlwcGluZyAucGMgZmlsZXMuIEluIE9FL1lvY3Rv
IGNyb3NzLWNvbXBpbGF0aW9uLA0KPiAgICBwa2ctY29uZmlnIGlzIGEgaG9zdC1vbmx5IGJ1aWxk
IHRvb2wgbm90IG5lZWRlZCBvbiB0aGUgdGFyZ2V0IHJvb3RmcywNCj4gICAgY2F1c2luZyBkb19y
b290ZnMgYW5kIGRvX3BvcHVsYXRlX3NkayBmYWlsdXJlcyB3aXRoIC1kZXYgcGFja2FnZXMuDQoN
CkJ1dCB0aGF04oCZcyBub3QgZW50aXJlbHkgdHJ1ZSAtIGEgcGFja2FnZSB3aGljaCBzaGlwcyBh
IC5wYyBmaWxlIGFyZ3VhYmx5IG5lZWRzIHBrZ2NvbmZpZyBvZiBzb21lIHNvcnQgZm9yIHRoYXQg
dG8gYmUgdXNlZnVsLCBhbmQgaXTigJlzIGFic29sdXRlbHkgcG9zc2libGUgdG8gZG8gZGV2ZWxv
cG1lbnQgb24gdGhlIHRhcmdldC4NCg0KWW91IGNhbiBhcmd1ZSB3aGV0aGVyIHRoaXMgZGVwZW5k
ZW5jeSBpcyBhY3R1YWxseSB1c2VmdWwgLSBhbmQgSSBkb27igJl0IGJlbGlldmUgaXQgaXMsIHRo
ZSB1c2VyIG9mIHRoZSAucGMgZmlsZSBzaG91bGQgYmUgdGhlIG9yaWdpbiBvZiB0aGUgcGtnY29u
ZiBkZXBlbmRlbmN5LCBidXQgd2UgY2FuIGZpeCB0aGlzIGFuZCBrZWVwIHRoZSBleGlzdGluZyBi
ZWhhdmlvdXIgYnkgYWRkaW5nIGFub3RoZXIgUlBST1ZJREVTIHRvIHBrZ2NvbmYuDQoNCihub3Rl
IHRoYXQgbXkgV0lQIGJyYW5jaCB0byByZW1vdmUgcnBtZGVwcyBlbnRpcmVseSBkb2VzbuKAmXQg
Z2VuZXJhdGUgdGhlc2UgZGVwZW5kZW5jaWVzIGF0IGFsbCwgYXMgSSByZWFsbHkgZG8gYmVsaWV2
ZSB0aGV54oCZcmUgcG9pbnRsZXNzKQ0KDQpSb3Nz

