Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A540EC35FFA
	for <webhook@archiver.kernel.org>; Wed, 19 Mar 2025 13:45:21 +0000 (UTC)
Received: from EUR03-AM7-obe.outbound.protection.outlook.com (EUR03-AM7-obe.outbound.protection.outlook.com [40.107.105.45])
 by mx.groups.io with SMTP id smtpd.web10.8228.1742391920393435521
 for <openembedded-core@lists.openembedded.org>;
 Wed, 19 Mar 2025 06:45:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=P14sFT48;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=P14sFT48;
 spf=pass (domain: arm.com, ip: 40.107.105.45, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=ZSULOGcAlZt0DtGrpYU/+ljUtSm7ORwPTtK8IJXlvDHELZsgv16iWlwgCWXMGNrZ5cIqJny4MH2rGCf8cZXJaz/SE7Gtmtn0BtLoG3FRQ8U1Hmci6yNCja/h1eI4JEkNOfpOBP7mzD/lq1dkWqWmsXROH7e8oVzoXbf7/dG2wJSL5cQ/FvJn62Iqe3yC0VzD1DsG0hSxNOzlWlVstdxVTwHkorED34cOl7AD7hjhD4UTjRwdl69HqQgBsp4iqFEWC9TK0k3aIJvsw2X0ia3Phzdf4CjXLEpHhDFT7a1jazGH9BsAaCsjEBjbfvX7+hmSBBxpXXIY2cPO5EV8qnMk/w==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ySmvKiUl0ay3cW/gdgycrsEc84c/8lJXKsHIeESgcI0=;
 b=JX+AUVjs+sNKl36eDeUR/6b3EVPWL3ct/ynty3ed0YtfYYHX6XPmd4Pjt2HUNz/BAMtPuvjY1i9YRShnpn1CFmSp7ENMHQXajldc0vRDE6rzeg6AIPxpnO5OySQZRbjZ1pOeUP5pIrFAopR1dbuRSMF9RnjJkaYXuLRst4BDAiwviarpqFmIIhZpaDZd6vuyBAWzzTnyXWJvy2lp7Tn5OMBEexsNtFqlfAlUv+YtF2SLUmQDLBSPgF0FGxLDIT+l7be0YZkh586bxMyj7Y6otWrkXoSI5DxnmwD/QcxdVEYapDJIaNx3GRNdU9WNCkssp3llwz4b8qFb1NccOOhfSg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ySmvKiUl0ay3cW/gdgycrsEc84c/8lJXKsHIeESgcI0=;
 b=P14sFT487Ba1ZGlg3umFS377nDP9owlXbfyVVlNkwsZ4ZRrAGRpgRS/NrjEJn39OvzqbZyaXSYI3/Si9k+N80NmqsAHdVPKXlICiZvlcrZhcUe/w0gm0y7IfFkGp2PecJVg9LUd6QM+MB80/1Bewlsjx9Bmu4EHKnPWGZSsu+fQ=
Received: from AS9PR04CA0141.eurprd04.prod.outlook.com (2603:10a6:20b:48a::11)
 by AS4PR08MB8190.eurprd08.prod.outlook.com (2603:10a6:20b:58d::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.33; Wed, 19 Mar
 2025 13:45:15 +0000
Received: from AM2PEPF0001C713.eurprd05.prod.outlook.com
 (2603:10a6:20b:48a:cafe::d6) by AS9PR04CA0141.outlook.office365.com
 (2603:10a6:20b:48a::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8534.33 via Frontend Transport; Wed,
 19 Mar 2025 13:45:15 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM2PEPF0001C713.mail.protection.outlook.com (10.167.16.183) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8534.20
 via Frontend Transport; Wed, 19 Mar 2025 13:45:15 +0000
Received: ("Tessian outbound ec1a125a00e6:v597"); Wed, 19 Mar 2025 13:45:15 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: b04df98b14de643e
X-TessianGatewayMetadata: hy+x31jWpi77klgvMhZ7/+5VPHEe4NDvg/UqTMO4GCEDlW+pdTRAAhbh+fxif72Tca9QpgP9ABnde42lRd7GbKcOdod5lcrycSVzWt2r9aeDtq/D+Gky6+jUnKRIXYhz4PIPp2LEAHvymj72A5uE5h1w8R9CZ7hD224T9Ulf3nc=
X-CR-MTA-TID: 64aa7808
Received: from L2c91b30f2480.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id FD6EF82C-2E94-4231-B885-DA7653AEF947.1;
	Wed, 19 Mar 2025 13:45:08 +0000
Received: from OSPPR02CU001.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id L2c91b30f2480.1
    (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
    Wed, 19 Mar 2025 13:45:08 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jsQ/E3UyjxL753SWeRvkzjoxq8wVJTea3YFB1yb35HGuxtFYE6J2XshUeQEjBDoIFG4gKkTtCUCjFULHm240DigZZjQNe7eo+QZS+0LUj+yO8DU9NAtxVJU8RFIUGtDsuww3XwCDxd2OyKcxqXsszaA9oY8uY9Nh+CDL7YD96Qb3obdtIgCmnVFHEN8KWG/9H4cYAdW7EsW7iZd1Uhxe3EBnm8GrAdpPeJiKskOSQ1w3qSzE57+X2NFXTtkiGNKsy6bbNpK70aaqJdFhHNLvliE/F0Lm3Mj0JEpy5cugdXzi9H4H2xC+ZYTFfLdZ/DJQdFUoryx+2F/rArVNlQ8mHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ySmvKiUl0ay3cW/gdgycrsEc84c/8lJXKsHIeESgcI0=;
 b=pByoHCShppfBbXs9Caw4tUj/TNpNfIoX7mxpmiHVd2kD3vGebkuAVp2FyawLBeeZ8elvzMMxcCXNpZy8nq3pOMZ3SNEUstQyGe7P9nJ+muyLWVmdo4G4VXFZrIydu5I9xUIS0Ms5oFdHmtgmAdkvfKCRWQJ361h6rAmDDxDdwrLBFWVgJnwpSWapo6uFuebVkIiPOgY30VFDxKhzC6tj/bonGitI9EVt9F3hiVcqN9sL7LdbfYhMFo3rRjyfknQdMdeVxRw3TQg3eg0gevvGDKKctjptxNnW6ryYaLb/UqdMbWlSGMdL1KR7zxJBmP4OtXsvvC7BvtsiWfm4unbMag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ySmvKiUl0ay3cW/gdgycrsEc84c/8lJXKsHIeESgcI0=;
 b=P14sFT487Ba1ZGlg3umFS377nDP9owlXbfyVVlNkwsZ4ZRrAGRpgRS/NrjEJn39OvzqbZyaXSYI3/Si9k+N80NmqsAHdVPKXlICiZvlcrZhcUe/w0gm0y7IfFkGp2PecJVg9LUd6QM+MB80/1Bewlsjx9Bmu4EHKnPWGZSsu+fQ=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by AS8PR08MB7910.eurprd08.prod.outlook.com (2603:10a6:20b:50b::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.34; Wed, 19 Mar
 2025 13:45:03 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e%5]) with mapi id 15.20.8534.031; Wed, 19 Mar 2025
 13:45:03 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: Niko Mauno <niko.mauno@vaisala.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/2] packagegroup-core-x11: Avoid non-ASCII in RDEPENDS
Thread-Topic: [PATCH 1/2] packagegroup-core-x11: Avoid non-ASCII in RDEPENDS
Thread-Index: AQHbmK857zw6u8vCkkCliqvt9M1QqrN6eNCA
Date: Wed, 19 Mar 2025 13:45:03 +0000
Message-ID: <23DBD022-4B3B-486B-B286-35AAC9FC90FA@arm.com>
References: <20250319091329.3057329-1-niko.mauno@vaisala.com>
In-Reply-To: <20250319091329.3057329-1-niko.mauno@vaisala.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3826.400.131.1.6)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|AS8PR08MB7910:EE_|AM2PEPF0001C713:EE_|AS4PR08MB8190:EE_
X-MS-Office365-Filtering-Correlation-Id: aa095864-c0e1-4277-cca4-08dd66ec4775
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|376014|366016|1800799024|38070700018;
X-Microsoft-Antispam-Message-Info-Original: 
 =?us-ascii?Q?91+DO5p+5DPbsfuOhXkIou6xzALM9XoDg2vhSZFPPoEt5Qb2VdD5MeHSrcoY?=
 =?us-ascii?Q?rIVA7wPd81YjXEgWz4qqDzLFSANtm+xfOixaQYA/o2AmuFqrJnHINpwP/0Ih?=
 =?us-ascii?Q?tf6BXibeFmafthg1SNquTbCkswee77K1DC9RIFRvIJbxouWQ1tz5QMiW+8KM?=
 =?us-ascii?Q?wRJ6FEI1oyGTA2tcjH5Yys5BCLYbC9Z4ISFDBGnE86/vV8qpeZJyMifW9EzG?=
 =?us-ascii?Q?oSUWb8H/b/V0nYZ9kWvFw/OgAy265cyZREXH94ukTYKw113j5K3gOU2GKES9?=
 =?us-ascii?Q?R4IX4EByEV2UcKL1zaiVdeaSZtkIfDfKAWWS0ZxZej0PZ4cznpKqkBjcNhmR?=
 =?us-ascii?Q?B12po0FzuH3R4GgDqyW5bZFFQ/WvtPmeEn+GA3Z59AWAtIpYNOTNZINtHg8d?=
 =?us-ascii?Q?EWpr+Y42MxUNJUJkiio3l8b4wENE0yPFKsw5CwHxa7b3vIxUanDhn+8jgut+?=
 =?us-ascii?Q?NvMcUC+hiJcUUU/orgOvZgMb5dIgcBGUuAbfFtbXTMbX3FccIBgByQsAexUk?=
 =?us-ascii?Q?NA8qojzXDOcBn1kRUG3vuMuA09WE975EYwUcmJImtrnejs6ItkUF45IQ8ZDc?=
 =?us-ascii?Q?zJB0V3LMidHCbE+7iGbYjBSmFRAx9WLG9SqjWA89eE6Ws3PwgGUwxujT/8OI?=
 =?us-ascii?Q?ONQdZIv1NrwB6WrSw2+xf6708eNtDZlGWuA0xPQDd2kCBovlX4oEFAf3TJeQ?=
 =?us-ascii?Q?s0vrB+77KoY48vW1JHlQexa9YIAuMb6aeFEen/CPRJvYoD00041Y1zAPmiqW?=
 =?us-ascii?Q?cTBVf/ltgkARqzWGR4dmT2N0QS/SuCTP5K3n3+bYmNkOvWuryMZU6uFOAIrZ?=
 =?us-ascii?Q?LmeYOdK7DKPQB/cxYhCcdVtU7nacpMF7V4QU4CySVHnRUt25BPuw07/YmClY?=
 =?us-ascii?Q?W78XljFktsKbbMg2FMV8mAOHf3HWZQn3pgJaT5oJosGcMuiPMbkqoub63BEh?=
 =?us-ascii?Q?XD3kXE1u4Bil4SkfEyq7n7TF9azR7uZZ1oeeAVd31S0Bzxmsa6LZSy2m7iWU?=
 =?us-ascii?Q?n7FlBtgy+3Ben+7Wi6HXl1iwCQCqcdLZVWcq9wGPDUyRhzpCdYY6Kz5vhoju?=
 =?us-ascii?Q?PoGR7ZRiMxf6/DsSWlQTs0+FAXX6a3gi2iJ7gSUSdnQZyzknz/Rw/ELfUJax?=
 =?us-ascii?Q?o4EKADSlA+psM5d3zJrEh5yuZgcDf8BgxEgbvrjgrh4uaLFkL+JfwIMPDvA5?=
 =?us-ascii?Q?HDzGsuu149+6Ou6vccUg3YxrHtaf7xo3kvRoZAqyM4gFirc8hSc+2FiGwvg8?=
 =?us-ascii?Q?iaLoRPeZXjtvagxfaYBSe2LoslSWHIEWJJ5U+iRYSPeu49EsswevX5FYI1vr?=
 =?us-ascii?Q?RQgeALy23QlzOszid/Es8D3N/cpZ6R2dbXvIyKJ0thN3+IWgkd5ntQSolNDy?=
 =?us-ascii?Q?YVCH3XF4DBKZSIDKAs2zQ9WgOMO4kOuW76adB/ffkwLs0ZuuYrw4h7+VnEF1?=
 =?us-ascii?Q?ApcgJ67jYkEz/tuyG6srlivYKhULManP?=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <363E74D361BEF642967608A3A6E884D3@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB7910
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-SkipListedInternetSender: 
 ip=[2603:10a6:102:2a3::12];domain=PA4PR08MB7411.eurprd08.prod.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM2PEPF0001C713.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	6daba70b-df6f-47b2-9558-08dd66ec4070
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|36860700013|1800799024|14060799003|35042699022|82310400026;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?ppsonZWGyDOFQawpp8XyUgEOIeKeUYjKKGXHFVQLzzvmTA/KSF8pPteBzuAM?=
 =?us-ascii?Q?Ds2hG0NJKUWrc7rNq7JWDBUOidLXuRH7VYrAKwPLiaDDNqU/0FKNHV4NpztR?=
 =?us-ascii?Q?i1mIXlKQ5xVMiewZelvjo1NE56mUkDIWP+WY0JCii9R1dzpMaHlBjTzpCPjo?=
 =?us-ascii?Q?yvPExc6H5ynWWP/WsMuz6xVE4lPaYdh/WEVMGEhE4UpvjYnx2141YFNv86vG?=
 =?us-ascii?Q?ycjZmapMz4dGTdgPHx0ZN4lQ9wEAI4fTBzcG43r0rT95gZCNGHo6RBqaYZls?=
 =?us-ascii?Q?nwDsZIJzSVOfVQBi3s+A/novYmyZoxV3yiaWOZB8FW//8LbQtHAbC9dYjV3o?=
 =?us-ascii?Q?8OgpgfE6nig2e7MmUSazDm9e41jRc0jTQjZoboEZT+ii+e+MG1aP51hXYndQ?=
 =?us-ascii?Q?a3ktv/dv/3XLOaUSFajW0EYAdLF3KYtysA1GAoKAYe/IBa8UhLgN1jO9y4n5?=
 =?us-ascii?Q?KjhHqtZA1uQv3LqiLzO5/+4sM0u4fQfyLxcF0uMLtd3i2Bf8OT8ufUkHYVYC?=
 =?us-ascii?Q?j3faWRZYsFOO90SJkx4JHVyn7CU/nPLf2yXH3UcYYEl/eDJiI0G2QtInanms?=
 =?us-ascii?Q?6dGxj8UDr4ycoG3WwGMpj+uI4lXEcAyJ+4vd1dzOUfVIoVQzT3O/R44Rgn/J?=
 =?us-ascii?Q?1vHq4B/LX/3pYRm60mg63XoOZwrhb1w9/a3/Tnd8CaQIe/o9fooHtCqTm75e?=
 =?us-ascii?Q?8u30Oa6/CpKsMg/p++h9hf7LOSzB5xJ58qiFblT5oTl0g+1RJESN3IHO+MMR?=
 =?us-ascii?Q?tptxegkQDgG7X7uDnQ77iR0UmamQLTxfK/bARKaAd9x9Z9dz9Ru6IepCnVHn?=
 =?us-ascii?Q?0lQNTEwsjTSMlYFSNfCPSHkexTjFgMRrcOlgMEnrZgYpsAWOQuAQXDbNXDh6?=
 =?us-ascii?Q?8Uh22Lw9nijy1jv0uV5qra95YFQ7cOIQ6bkG0+elMP63/FVTUKskmbWlLXYR?=
 =?us-ascii?Q?NHp0H3YmVOsUhpK8cuJKyT1n/Yypl57Vjk/OZBdjULwFuR1EYJ3xhCU3Udal?=
 =?us-ascii?Q?H6bLG2X2R3PQuIilCXWN8STELwU+r1XZ+6hD1iGis/y72LyVtYTIAI5wdzqe?=
 =?us-ascii?Q?83VNd/gO5gJMftuoyV+pfStSkVkgv0GFKHehpkYpyayhKIG5Xmf9Bu8gFpWh?=
 =?us-ascii?Q?gS4XE8XzvaIaoDvUke7YMDPPAZblHGHL0Vrr7oJYzEVMGf3i8UdukYicRt6c?=
 =?us-ascii?Q?yTQjlSlYzL30k2ux4MuUyJK9ZoD8JGe0EjgZQBZz+wJOJhVuwwNcRzLPxzMc?=
 =?us-ascii?Q?BWMxtO8uGPz38YSolYIqjkuNpV60YBP0xJ5mB2extycbSo6BsN2Rm4QxMNlU?=
 =?us-ascii?Q?7CblI1y6wIH4iwS1hu6FMoz6gfekCEESjDNEOdOz88IIu49PBW+QtHiamzxq?=
 =?us-ascii?Q?xPq3EeJj+I3HNn8z0nzIF0EASlH5F8OEc5a2JJDyYwSGHB1fcXI5E9mE5bWA?=
 =?us-ascii?Q?aufU5owxSXRyqtXrTzZVDy9VBAkquNA1HR6avJt0oE/lrNJLG44zmJK5ITo5?=
 =?us-ascii?Q?kHy2WdHTCxXuB9U=3D?=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:64aa7808-outbound-1.mta.getcheckrecipient.com;CAT:NONE;SFS:(13230040)(376014)(36860700013)(1800799024)(14060799003)(35042699022)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Mar 2025 13:45:15.3071
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: aa095864-c0e1-4277-cca4-08dd66ec4775
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM2PEPF0001C713.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR08MB8190
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 19 Mar 2025 13:45:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213332

Thanks, I was about to look at this! I agree that the dependency should be =
removed - anything that needs dbus will be pulling it in already.  This dep=
endency is historical from when the x11-enabled launcher was a separate pac=
kage.

Ross

> On 19 Mar 2025, at 09:13, Niko Mauno <niko.mauno@vaisala.com> wrote:
>=20
> Replace the UTF8 character for non-breaking space with regular
> (ASCII) space in RDEPENDS:${PN}-utils variable.
>=20
> Signed-off-by: Niko Mauno <niko.mauno@vaisala.com>
> ---
> meta/recipes-graphics/packagegroups/packagegroup-core-x11.bb | 2 +-
> 1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/meta/recipes-graphics/packagegroups/packagegroup-core-x11.bb=
 b/meta/recipes-graphics/packagegroups/packagegroup-core-x11.bb
> index 91db7ed33b..10184f1cf1 100644
> --- a/meta/recipes-graphics/packagegroups/packagegroup-core-x11.bb
> +++ b/meta/recipes-graphics/packagegroups/packagegroup-core-x11.bb
> @@ -30,6 +30,6 @@ RDEPENDS:${PN}-utils =3D "\
>     xrandr \
>     xmodmap \
>     xdpyinfo \
> -    xinput-calibrator \
> +    xinput-calibrator \
>     dbus-x11 \
>     "
> --=20
> 2.39.5
>=20


