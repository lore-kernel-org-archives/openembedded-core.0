Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A688DCA0FFF
	for <webhook@archiver.kernel.org>; Mon,  1 Sep 2025 17:00:01 +0000 (UTC)
Received: from OSPPR02CU001.outbound.protection.outlook.com (OSPPR02CU001.outbound.protection.outlook.com [40.107.159.58])
 by mx.groups.io with SMTP id smtpd.web10.57376.1756745995068095163
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Sep 2025 09:59:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=EpEPiejc;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=EpEPiejc;
 spf=pass (domain: arm.com, ip: 40.107.159.58, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=rur0rMMx5F4wjq+ejDj9uOnddsN1y1L99sH8IMVOagopj1FV/2fAh3I8TgVjtGp+CfHWdrdRaYfwrFbxoFdRALcR/39US6V63PZJOmir/zCoKctCA7qJKWypu8OYidk2vseN8Fu67tZrpSbtms20o27WBBvzK70S5bD4cBOkS9tuH1p/ZLxvZz4UAyp8S14nfEM5A0ZdLAUpdnQtTMSEZjgf+UCU989rFmcu2J3WQyGskNGVFWQaYbZWnYqh5q6+2AMiBuWEu4L7X57dk0H1hCiRwdbrp0Rj6OlLphF5oTdkeBM/fL61dfyv8WCv0wTbyPwfMJOq8mcYQXMgLZFQmQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Rdyfk9ynjeE+4veYhRtsqN/9E44HN690GrYpxDxfzTM=;
 b=IeKLe1M6hO5vY4w8ov8pRK0vQHKJ4SyOIzVi7ecBrK8qHxZRNvADFvFvsIOvTgzNv+/fclK8v/3aKZj7zWbUubJP6D7Oopu3t7mOjzvzuJd3n9cKdEIApqWpFGIj5Lgjpj/k68KUTDw9M9ck4oFNvsGEudyROHbfp4jCTs3Oirv1iFQfpFEzEbx9yBEJ/Ohf6ATzecmitJZkgHw9q/eHuroje6gzZx02/MpADy+Z1CKV+1hsHwNrKxChLi+DuIy7Gx72MpXWbrLOgq/12lBE593D9l8iyaNYc8zXLE7IjQzB9rVwPV7bN97LjXSSLBvIHo5CTDUzPpVUH525HFYgGg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=gmail.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Rdyfk9ynjeE+4veYhRtsqN/9E44HN690GrYpxDxfzTM=;
 b=EpEPiejcdUVfDA9oRACZHgwTWBlxS6kBWG3OuJ3/QD7/bBHfB8jjh/V4iQ2rEJNYljtVkcnMRS/oYyoA6cb9rpIYI/GMq8r1PIGAONBF92sLh9mMrMuUy+cS4XMfeIKIEDG2kebZeYusf684oOX6uzmoRqD+oIrfH+rjyYjqORg=
Received: from AM9P192CA0027.EURP192.PROD.OUTLOOK.COM (2603:10a6:20b:21d::32)
 by GVXPR08MB8212.eurprd08.prod.outlook.com (2603:10a6:150:16::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.20; Mon, 1 Sep
 2025 16:59:49 +0000
Received: from AM2PEPF0001C70D.eurprd05.prod.outlook.com
 (2603:10a6:20b:21d:cafe::66) by AM9P192CA0027.outlook.office365.com
 (2603:10a6:20b:21d::32) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9073.26 via Frontend Transport; Mon,
 1 Sep 2025 16:59:49 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AM2PEPF0001C70D.mail.protection.outlook.com (10.167.16.201) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9094.14
 via Frontend Transport; Mon, 1 Sep 2025 16:59:49 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DjWX+3bLXU+qxfjZ2Hi1JJwmHzJa+k+u0o8ZkCPFSsvWwN9ETH4aBFLEBTGLqMvI/eww9QmRK1irgxsMMgc9Y3ww47GXsPI8/pQNso/YUJlSGHVrKDfYauyydccvaYi56GCapYy9Dch5ql8YMmQPBXrAgQf+DE6CGT075AtBCxXXb3iKP9j0Qcu9N2+gAzOFXqZ+/tllQfrTJMUL/CAExUDhDjPEvcsM1vY3yxASifcB4jy7wwbfzajA6fQsGEn2JA79vAp1h3OLi7tGNbIzYperfR8FpUTq2E9H1BjjPf3bzrXxkX6UBnPfpLvAx7Ad/wLV/F+h5O6xbEXn6saPow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Rdyfk9ynjeE+4veYhRtsqN/9E44HN690GrYpxDxfzTM=;
 b=s4cmqqm2NbHUIQdPKqnLc6bRrQBEFmIgygiMravYvXmRf3EzDe627aEJX2qCC7evkqSNsG9aZ4E20q01iSLbm5eLRNdimHK1GeG1DwgY/CIkglGHWXc2RpTig+zRFiPv8rEKxlbvqTMjITvcu0th6b0LpcRbh47TenNc7jU79yFZgP196zGPbtTtKjws8jQDq6b/zi8LdiY+M3p2vwPgF6fSMLl9H2uTH2xucv3ADfaLY8zPWHThCFCp4Sd/HbcfM5RIHMaT8FfZOFPu2MRqSa/VvbJuc448i2ya45wi/GEU/9ypcX1yhQoQpF6C/dSqE8VydKPe5HcdsoXoFwb1OQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Rdyfk9ynjeE+4veYhRtsqN/9E44HN690GrYpxDxfzTM=;
 b=EpEPiejcdUVfDA9oRACZHgwTWBlxS6kBWG3OuJ3/QD7/bBHfB8jjh/V4iQ2rEJNYljtVkcnMRS/oYyoA6cb9rpIYI/GMq8r1PIGAONBF92sLh9mMrMuUy+cS4XMfeIKIEDG2kebZeYusf684oOX6uzmoRqD+oIrfH+rjyYjqORg=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by GV2PR08MB7930.eurprd08.prod.outlook.com (2603:10a6:150:ab::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.20; Mon, 1 Sep
 2025 16:59:17 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::7f73:806a:3493:7d50]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::7f73:806a:3493:7d50%4]) with mapi id 15.20.9073.026; Mon, 1 Sep 2025
 16:59:17 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "skandigraun@gmail.com" <skandigraun@gmail.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH v2] pinentry: upgrade 1.3.1 -> 1.3.2
Thread-Topic: [OE-core] [PATCH v2] pinentry: upgrade 1.3.1 -> 1.3.2
Thread-Index: AQHcGLslXYvpAO05RUuis7iB986cNrR+kf0A
Date: Mon, 1 Sep 2025 16:59:16 +0000
Message-ID: <10AC7637-C4F4-45F6-B10C-A13FE5ED192D@arm.com>
References: <20250829080118.3776531-1-skandigraun@gmail.com>
In-Reply-To: <20250829080118.3776531-1-skandigraun@gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3826.700.81)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|GV2PR08MB7930:EE_|AM2PEPF0001C70D:EE_|GVXPR08MB8212:EE_
X-MS-Office365-Filtering-Correlation-Id: 7da763fc-c938-4f33-8265-08dde978f67f
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|376014|366016|1800799024|38070700018;
X-Microsoft-Antispam-Message-Info-Original: 
 =?utf-8?B?d0Zuc000UEYvTlkra1BRdGgzWG42UFY4bmRxK2NORXhsY20xWFlWQ3Z1Tysr?=
 =?utf-8?B?dDdCK3FmRm5MSU9nTHFrVWxKcEMycThQNFA2NDNjV2pyQUJoRUI3OHMrbFRY?=
 =?utf-8?B?T0RTMk9hZDJsN0RPbXozajlLZDE1Q0NCa21NY3BTdlB6eEVEeWI5SS9DRnRH?=
 =?utf-8?B?M3pPSUpxNlI5ejlvRHJBRkoyNCtubEIrSVdkdVZKQ2VYNWNXbXpqaUM2M21i?=
 =?utf-8?B?Y0RIREc0ZDRiQmFlOUtDd0NqVVBJbmVDY2NYRGQ3UURlOXBrZm8vQzA2UzFa?=
 =?utf-8?B?ZndkN1FZUDhNM2U1MEZHakx6UitXNGhaSUhkeThmQ3NSdTUrMy8wU0psMHFL?=
 =?utf-8?B?YVYvYjdvbFQ3SWNpcFNvQjhnL3ZnWVdlSjRCdXVaOVVKMDhuSGJTVjhHYjc2?=
 =?utf-8?B?L3R3azFyVERHNHFSS0cwbWp6ZDA1MDYzUHdodyswSmR3QnI1Sm1TMC92S01r?=
 =?utf-8?B?ZmVESXNjTUtvRVRWWGdZRG1DbHpLQk9yY01mQzk5OTBiV1c4RVNvMU03VWYv?=
 =?utf-8?B?cVRVRFF3elBsejJsVXdvSkQ3UkM5Sm42Tkk1cEVJQ0lvTWNRaWl1OWhCZW9P?=
 =?utf-8?B?citab1pQbitwKzZSSC9zL0tkcyszRW5XNCsrMTN1UEdOQWZQYVA1YVc3T29l?=
 =?utf-8?B?c3VuajU0NXRHL3YyQ3UvZ0lyR2VidFhyaXlNdkFkRnB4UVMyeU05VWxMb0Zi?=
 =?utf-8?B?b08wSHdlb3N4U2pDOXJQTjYzeWN0NFE5eURpcjg3anE1V1oxQUdBQzZtUDRX?=
 =?utf-8?B?SzhEWk45eElsWnJMMUtKUFFrdUhTMWg5aXFRVklkTStoQmh0b2Q3WFRLR3Fi?=
 =?utf-8?B?eXVoNUQzaHR4S0c0cEtLNm4zSE9SdnErTCtUWU5iam5UZS9BcjdaNTVSTmdZ?=
 =?utf-8?B?VWc1enc4SUhYSFhreUtBTlVpdWVaOXRCVDZBZEhiWDdIZi9zYkRMTWZReFhn?=
 =?utf-8?B?Uk9TRS9TVWhWeURMa0tZOE1Rd2NMdENhcEJMM1IrbHhUTklVa0pVTW96VVhl?=
 =?utf-8?B?Tkw2cG1NMUNYeStSWFZpeS96NWh6S0VVZHZBSU03VTZqYzlCS0pNSzNvNk9s?=
 =?utf-8?B?eC9uRVdTWHVSVGhBY0d5eWpBVFJ2RjV6T1gzOXlHcmh2NCtmWlluNnRMblcr?=
 =?utf-8?B?NGJIcm5sZitjYVdQWDlUM21oY0tnOHdJTWlxRmdPYVgyQ05MaGIyVnFsVUtM?=
 =?utf-8?B?YW9rRDRjbDEva2E0MEtnaC9SbGdGLyt3aWZpMHJieWJQbUtFcHhtUmh0akJm?=
 =?utf-8?B?S3FNbVVUZTVLRWxvUVYxUWtQS2o4OTNsSmQ4cGhjeXk0L0d3NFFVSlBlOHk3?=
 =?utf-8?B?QzdSUGZ5NERXVUhpbG5hQmN4eVREcmdDMHpkZUJZTnJRNUx5amgxN011ZWxq?=
 =?utf-8?B?ZTlPd2pwdlJUVG5OVHEvWS94TlZCajArU2kyWjE5SUxlQ0M3Z2M5czBOZDhP?=
 =?utf-8?B?aE4xNWN6eGpaMU5rQW9WSTc2bm1Mc21NNjZnM2tSVGdzRnpkajRyRWp4dkI1?=
 =?utf-8?B?NFNPbkptOHJ1WUhQR1dvSXpOaTVZeisrTllYUGNoNDU5c0FmWDdRaVpGUmhT?=
 =?utf-8?B?bCt5QjNiVUt5VllJK2ZkRm5sbEZNakRFbmk3RWZXTnNGSTZyNndhR1V6OXVV?=
 =?utf-8?B?QmNIdkp6S3h2emtLajVnZmUxTWF6ays1eEtpeVllV1FwNkZaZ0ZHWjVSZmJv?=
 =?utf-8?B?eWpZQWdrY3NsQXdXNHlmZXRaTDFpWnZqeWNXaUQrVTdYcHNFMFA5V0V5ZGVN?=
 =?utf-8?B?KzV3UzF5cTJZUWUzSU1CSy9lY2U5SWZJMUcvUzk3NjB0RnFtTzR3UlYyVFU2?=
 =?utf-8?B?elRidXAyOXJlZ1hqdDhodkdSOEZUdGxEamVqaWpYTmtiWHh4Uk5mcUhWc0Q0?=
 =?utf-8?B?MGhzWkw0YzEweXFTWFc2cWNzNitUUHgzaXljenRLS1FORDlsblEzMDJLYlF3?=
 =?utf-8?B?ZnZIeXlMU3ZTZXUyOWZLS0pvT0dHcGEyL0NWeDh0b1BkSHFJVGpoTGZIeHVp?=
 =?utf-8?B?NnJwa3p3Ymx3PT0=?=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <28A68F30AC58C34BAFE67183963D72C6@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR08MB7930
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM2PEPF0001C70D.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	aa24940a-3451-4a2d-3a86-08dde978e2fb
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|82310400026|35042699022|376014|14060799003|36860700013;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?V0JmZjJEOTYvcEhuWUY1dVRKdDEvRG9ZOWNqckJCY0IrV0gwT3Y4eEFKNS9U?=
 =?utf-8?B?OTdqSTIyaTBqK0hmbmVDNUVaRjN1OWg4YjNzcE9hV1NJWUZ3cmhOSnk4WER4?=
 =?utf-8?B?UUovclFsS1lCdzU0dnQ2SlRhbm5SUUdRN2NXU1c3YytNbkcwTGVZUDNFWUdo?=
 =?utf-8?B?dW1oQmdGeVJOcm04WDFsektYY0ZRRG8zbDhoczNiZUlFQkpSQjIvSis0dUR0?=
 =?utf-8?B?NjJkTXRYeEQvK0RJY1pBV1pYdXlzT1A1Sk9VQkVJZ2VINWhSaHYyQUJOY09R?=
 =?utf-8?B?dWcraTFXTmVYQlpUcGZsNG9SM3pJY29UTis2L1N4WHNXbm1XWi9qbi82Y1Zq?=
 =?utf-8?B?dWYxOVhRS2FQWlJhcGgzMmlxZzJhWlZvbkRoQ2sxVzJ1QlowWTdZbUZxN1M2?=
 =?utf-8?B?Sk4rb0k3SWdXN3JnMUIzS2FoRWJmSFhRQkloSHBmVS9obVlzQmR2M0pwWUUy?=
 =?utf-8?B?NFRYYWdLRlA3b1MzZC9YY3FubGJlNXR3VVVNd0FqNTd6d2VwRjNmQzZWa0ZR?=
 =?utf-8?B?eFVYRlM2cmhtakY2cnpqdU1NemxhbWwwc1pJV3RwdlNIbHZiUkkzbkZqUm8v?=
 =?utf-8?B?N2F3UU8zZlZqTGwyYWlkQk9EeGtlcnJaMVJ6b05vYWo0OE9sanhCdjZEbkhn?=
 =?utf-8?B?dGp0Y05lM0dzSlFkSHZSRGYxQ2VYODJ6Y2M4UVlGdGdwWlFscHZWVEJ5TFM4?=
 =?utf-8?B?ZzA2OGpSYWNOQUdxd3BUc2ZMdkN3NCtwRVBFUXZyVmRwcGs2ZUFpaTJValdm?=
 =?utf-8?B?clREMmFhWUFhdnNqK1ZYeElJN0pxRm1IbWJSN3JjMkNYVStiUWFDRG9aM2Ra?=
 =?utf-8?B?aU85d2FwdDVjaTNDQW5KUGlKaHdXa3Q2Q0IzYWt4Z3E2NVhST1gyYUU4RUk5?=
 =?utf-8?B?RTRGRHo2SG9meUFsQVlRVzZXNVZIZ3R5aHZ2Wjc2dWxLeDFJaFZJWGlXM0Qz?=
 =?utf-8?B?NFhCdk5yd1BENklBcGtrd3Q5WXc3QkZPT0JnWDNxNkI0Nk9EOVVkZHJzaWxC?=
 =?utf-8?B?cnEyekZhcnBNbVJPc3pOWnM2bldUUVdDMUowbkU2WUFCY0NtNHp3VGpZT3FU?=
 =?utf-8?B?bUdzcjlGN082Rk9INFRGQ3MzL0tZUDcveTM0N0pjYnFyNFZVaDRUSGo4OGxq?=
 =?utf-8?B?QVBkajJlWDVFcGQvTlNad1dwY25RRHk4ckNSN1QxaFpxYURZa1VqOXEwYjVj?=
 =?utf-8?B?S2trY2FvSDJYTXhkRXo2bDVhVVhQdnowTVI4UmZacHhES2hBdXZWdHpoYzJG?=
 =?utf-8?B?S3hMOFBaV0VlMm5HQ1RoRzdVRzlaT1NOUHdwYlVENjgzTURadGcwc3dSaFgz?=
 =?utf-8?B?MjAvblFRRU8yT2JCcWs2Z0QxY0F1MGZPMnhpRnovMndyQVhyeDV5VWZRSHg5?=
 =?utf-8?B?TXRwbnU5QTBVWFYrNm5Vdm1vSXhtdUFSMTZRQ1p2aE9tQWJGcngxdlVscnJN?=
 =?utf-8?B?Y3REeEViZmRIeElEY3pVdU1mcWRzbjBmQ25kNGpqYzhYZTBkQUxaejI3UnU0?=
 =?utf-8?B?UEJxR3NNVm10bURkN3RwcitUaFRUejQ3OXF5L0gyU2VvOUxneFhCODhoN041?=
 =?utf-8?B?MjdUa0Mzc3dFYmk5bXE3bHRrcktJS0lxWlQzT0M2WGYzWi9Hd1ozaGIvRll1?=
 =?utf-8?B?dEtpdk80MGM5bm1ZTTAzQ3p5QmRpb2UveHZ1K01FZHNuVG5iR3d1dWlaZVNI?=
 =?utf-8?B?b096ZGJTS1k1ZlBJU2ZqNUJBMUpkeGdHOXY3Q2VXVUVuT3RaVXdTK0c0Rnpr?=
 =?utf-8?B?dHRqOExEYUR4TmFnT1ZVL2hzcDd1WWMvdFdBVG9OdGNwZmtLd0ZGUXZPSGRI?=
 =?utf-8?B?K25WQ1FWUWpEeUMzQjdkNUdWelBvR0lZRmlsbXFZNlRSOUtEdXhBbHZCUlBv?=
 =?utf-8?B?Nnpxd0lyMUFFOXZvakNYT01CMnBIWWd0YlJSZDBqdlRqZWNJTmc0Y1Q2N0dW?=
 =?utf-8?B?azM0QnhibmRZdGhXNHJKcUE4RktEUVJUV0tBaWxaM3BnZmVmZVV5aE16ODRt?=
 =?utf-8?B?QXhhbUtZNytHbHBqK1JzQm0zYVBuSGdTV09ydnZYZkVjelYvQTNhT2dVVG9Z?=
 =?utf-8?Q?wizr31?=
X-Forefront-Antispam-Report: 
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(35042699022)(376014)(14060799003)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Sep 2025 16:59:49.6964
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7da763fc-c938-4f33-8265-08dde978f67f
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM2PEPF0001C70D.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR08MB8212
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 01 Sep 2025 17:00:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222668

T24gMjkgQXVnIDIwMjUsIGF0IDA5OjAxLCBHeW9yZ3kgU2FydmFyaSB2aWEgbGlzdHMub3BlbmVt
YmVkZGVkLm9yZyA8c2thbmRpZ3JhdW49Z21haWwuY29tQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmc+
IHdyb3RlOg0KPiAtLS0gYS9tZXRhL3JlY2lwZXMtc3VwcG9ydC9waW5lbnRyeS9waW5lbnRyeS0x
LjMuMS9ncGctZXJyb3JfcGtjb25mLnBhdGNoDQo+ICsrKyBiL21ldGEvcmVjaXBlcy1zdXBwb3J0
L3BpbmVudHJ5L3BpbmVudHJ5L2dwZy1lcnJvcl9wa2NvbmYucGF0Y2gNCg0KSSBsb29rZWQgYWdh
aW4gYXQgdGhlIHN0YXRlIG9mIGdwZyBhbmQgcGtnLWNvbmZpZywgYW5kIEkgdGhpbmsgd2UgY2Fu
IGNsZWFuIHVwIG5vdy4NCg0KSW5zdGVhZCBvZiBwYXRjaGluZyBncGctZXJyb3IubTQgdG8gdXNl
IHBrZy1jb25maWcsIEkgc3VzcGVjdCB3ZSBjYW4gc2ltcGx5IGRvIHRoaXMgaW4gY29uZmlndXJl
LmFjOg0KDQotQU1fUEFUSF9HUEdfRVJST1IoIiRORUVEX0dQR19FUlJPUl9WRVJTSU9O4oCdLCBo
YXZlX2dwZ19lcnJvcj15ZXMsaGF2ZV9ncGdfZXJyb3I9bm8pDQorUEtHX0NIRUNLX01PRFVMRVMo
R1BHX0VSUk9SLCBbZ3BnLWVycm9yID49ICRORUVEX0dQR19FUlJPUl9WRVJTSU9OXSwgaGF2ZV9n
cGdfZXJyb3I9eWVzLCBoYXZlX2dwZ19lcnJvcj1ubykNCg0KSSBzdXNwZWN0IHVwc3RyZWFtIHdv
buKAmXQgdGFrZSB0aGF0IGVpdGhlciwgYnV0IGl0IHdpbGwgYmUgYSBsb3QgZWFzaWVyIHRvIG1h
aW50YWluIGZvciB1cy4NCg0KUm9zcw==

