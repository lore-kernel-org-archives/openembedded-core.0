Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D31EAC7EE33
	for <webhook@archiver.kernel.org>; Thu, 26 Jun 2025 10:20:31 +0000 (UTC)
Received: from AM0PR83CU005.outbound.protection.outlook.com (AM0PR83CU005.outbound.protection.outlook.com [52.101.69.44])
 by mx.groups.io with SMTP id smtpd.web11.4870.1750933223294097356
 for <openembedded-core@lists.openembedded.org>;
 Thu, 26 Jun 2025 03:20:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=GoK9dlBo;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=GoK9dlBo;
 spf=pass (domain: arm.com, ip: 52.101.69.44, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=SdAyvJsdZ1R8Ro/SXt175TwoEd3YZqz9ZqPb1LEpZTbYWw7xyxZejlIfSNBbZvfM5R3ZsZkdIVTqH/HfpDY2Xb9XK6EVpHQnXzyX6wJaOWdJ/5LOKde0u91EKjP/AtJUKaW5ydMAzN8USDaPeU4TsPYNxUbRBhbrWVwTsbSKN9pdpV9T4GENOnqpsX0z9C+Y1HztT3zC7JBumayFQasIE2B/rPJnSdcLMOJLR/eXSfIsjjlwgp4suhfLxFMNL9gFlBW7bm5RVtFFWQPYQom2OhXwHtZrFQv/5NR0z5/9X4LrlTv75/bYhXsPqf60URc7nCR82ndlhY/AVQmXALyqSg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nkUCo9MbOBN/OpwaZKLoTvKrj8qFtXePpqNmGX2Lne0=;
 b=tUGmHpDgN2Xf7W2pfGp99tloplU6+cRhFdWxTIdO68LCJ1ZLYrXvM5D2n4MsnU0gJsOrVQxKCFJlzT6RIs/lSha9v2yJDuwlKl/oQB5IlGuztNSHTeXzJbrjz29ABhc2lCtjEf24oZORaZ4HX6HtBFUeIZk6kiOGoypKKC8e4RvuKiCSB6L7Q5Ukjc3Js28mIh4pFFYQktyrQhWyE4oAOeaZij0gV2vl5NKHq2uUdAxK2PBvzHS6qD3Nra/5OyK2TJMKOETgjTU2BNa/+V/Gl2JaWx4mzYmP4g93ZFJJMpc33tt0iEBJWH+e+l+eLojuKIIZAf2WRcBuUW5BjtnrRw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=konsulko.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nkUCo9MbOBN/OpwaZKLoTvKrj8qFtXePpqNmGX2Lne0=;
 b=GoK9dlBo9zlzd5yRnmTUGbwDMB6QgTI8VKG6MDsX927YGriInpC8/bi0UvdhiVTA8MZx1+//UE8bWfybZHvqNqyqHqSZYuSDdYNKOobzOHHCgtjRIw56UbX+MHBp7DH6neIYxOomT5bYdRny3Jf0DEtMxhOB2GG2rUOUJvHqxng=
Received: from DU6P191CA0047.EURP191.PROD.OUTLOOK.COM (2603:10a6:10:53f::12)
 by AS8PR08MB9265.eurprd08.prod.outlook.com (2603:10a6:20b:5a1::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.27; Thu, 26 Jun
 2025 10:20:19 +0000
Received: from DU2PEPF00028D0C.eurprd03.prod.outlook.com
 (2603:10a6:10:53f:cafe::33) by DU6P191CA0047.outlook.office365.com
 (2603:10a6:10:53f::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8880.18 via Frontend Transport; Thu,
 26 Jun 2025 10:20:18 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DU2PEPF00028D0C.mail.protection.outlook.com (10.167.242.20) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8880.14
 via Frontend Transport; Thu, 26 Jun 2025 10:20:17 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mztL1VSaBs1cntcxTw6sRhVmwsAQ50hauzYgQP7DURXTVrJWPGnd89CmNtdKuEzVnzeGM0fFsx5t9UzQFyHubXU43xVPN61wgM7WAgZCUPNa0kWFpXjhptDVb8yZ7GY0Zf02SzOmGTNQ9bT4cR3/e7BhzAAUWhkwpLdFuNUdIAZLqy8sHEgvlM3Vl0q2xOjOVQIA02mR/4TLB5EeXZtnnqaGPWuTVjvdIFeXU4flSd72nmSRDBqnKodtiruUKYUuu+7EJ//dLbzYPI1sJIDdEHKGKf7VkhGCOyLGt6TWxRiGsu2X82vlotLWpbUb230Bf3dL0IvOH/uQuAG4ZYWHQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nkUCo9MbOBN/OpwaZKLoTvKrj8qFtXePpqNmGX2Lne0=;
 b=Z/xiv+1ty96TfXz6fjPjMTsjEzptezWgbj2NE1hDl9d7rM6Af/8KLZs7zChhHIY3IT7qxuo1dlJnTU81kZQ8fQRIY3vullcfLRdEPplvuz95CvbJUuUWkFgzbFv4XcX8gv7WSUWrBEVipCXWD/Z0d9xVrYI23CFAyDSP3vITC7eStjGm4eqL8Izzpsdic47U1GvI/OWteNupwI2UZQmzlpzsouTAC1YTyu+phwoI76UpJObV/Ne+NSVRVD8Pv3YMAyqE8XCB9tuEqnfnonjuDadOY0b4zNIJslYXvXQBQY/9QIZ8CVve8v5GbmDo897O+gpUN2CBdUL8nhPbCG7ffQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nkUCo9MbOBN/OpwaZKLoTvKrj8qFtXePpqNmGX2Lne0=;
 b=GoK9dlBo9zlzd5yRnmTUGbwDMB6QgTI8VKG6MDsX927YGriInpC8/bi0UvdhiVTA8MZx1+//UE8bWfybZHvqNqyqHqSZYuSDdYNKOobzOHHCgtjRIw56UbX+MHBp7DH6neIYxOomT5bYdRny3Jf0DEtMxhOB2GG2rUOUJvHqxng=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by DU5PR08MB10733.eurprd08.prod.outlook.com (2603:10a6:10:526::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.27; Thu, 26 Jun
 2025 10:19:45 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e%7]) with mapi id 15.20.8857.026; Thu, 26 Jun 2025
 10:19:44 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "tim.orling@konsulko.com" <tim.orling@konsulko.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH 1/6] python3-wheel: upgrade 0.45.1 -> 0.46.1
Thread-Topic: [OE-core] [PATCH 1/6] python3-wheel: upgrade 0.45.1 -> 0.46.1
Thread-Index: AQHb5V25pIaAC/5gQ0qzoZqADBeeibQVPOQA
Date: Thu, 26 Jun 2025 10:19:44 +0000
Message-ID: <08D01BAF-8748-4F97-9EE2-6395227D1690@arm.com>
References: <cover.1750806216.git.tim.orling@konsulko.com>
 <8028bc471f02bc3d688ab422120db7504a38a121.1750806216.git.tim.orling@konsulko.com>
In-Reply-To: 
 <8028bc471f02bc3d688ab422120db7504a38a121.1750806216.git.tim.orling@konsulko.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3826.600.51.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|DU5PR08MB10733:EE_|DU2PEPF00028D0C:EE_|AS8PR08MB9265:EE_
X-MS-Office365-Filtering-Correlation-Id: 71e08381-9d89-431a-922d-08ddb49b0c3d
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|1800799024|376014|366016|38070700018;
X-Microsoft-Antispam-Message-Info-Original: 
 =?utf-8?B?QnZlbW1WZEVIak1HdnI3MmVuZzlEZDRKNDNhR001Yk84bm9VWGo0aHRDRnZB?=
 =?utf-8?B?Qml2SHkzV0h2TGQvSW53bEZlRVFlemZ2RThMMnZMWlliUWp1TDJ1Um5kMHpM?=
 =?utf-8?B?UVN4OWRFNklpbjI3cUJNVXF3a1IyRXNscEdodkRuUlluci8rd0QzUGhJQWpE?=
 =?utf-8?B?V0VnY0lHaVAyd2E3blI3cFBJazRYWlN0b1k2WDBQcS9jeWxNbkxsNDNQK1Fh?=
 =?utf-8?B?ZzFRbVJOWllHRTQwY2NTSStGUHR5T29zTHd1WU45ZmdzKzRWb3A3aWNZYlUx?=
 =?utf-8?B?ZDIwdVBIcHJqdDBFdUVUdy9BZGtoUG1OZTdKOWQ5YWx3N1BRT1RQV2VvL1dm?=
 =?utf-8?B?WWhqanJEMmtmNXQrU2F3QTJLWDBLR29xaUpGN1ZTU0d3ekNkRDZ2TndhMnBQ?=
 =?utf-8?B?Y080YUZlTkltUUN6R0V3Qng5T3hTV3N2RTZmYzdRRVVhTHkrcFhjby9zK1Qw?=
 =?utf-8?B?NmVhUDVzUVNlZnJKc3JWQ25jQzFtWVZNV2R4VmdWa0JGWW5GNjFOaXhKMWpo?=
 =?utf-8?B?WXBvRmlkTTlwVExmUURmMmJvcDhTNk54S3lRZGNTdU1USUVKeHR1b3U1bXNZ?=
 =?utf-8?B?d0oxdy9TWUlwaUdpUlc0czAzNkRwOVYvYXlsdVdMaWNQWmV1c00wNVE5N3cx?=
 =?utf-8?B?MHg2WnN1ZFdnN2haL3dQRkhMa1FmdmNSaFVLZTN3SnYyQ0RMY2Fsd3pZQlBK?=
 =?utf-8?B?V090NGxwZXV4WFMrcUVpWFY3bzYxU0tFL1N4dDB0WDltWlAwb1hUWnNNcmRW?=
 =?utf-8?B?UG9JWGdBTE1TNUpMY2hoSlpMODBweHN3UWQzNEM4b1RwZnRXOFJ3MnhKNFBY?=
 =?utf-8?B?YUFOV2s4ZnNGbkNVZkdvNFpKNlNkSU54M1NKYm1OaDRCS1NjMHdUS1MyK3RS?=
 =?utf-8?B?dVJrVEx2NHpwdnh4ZEI2T3NJTGZJMjlVdzBTY1hCd2dVNFdJYnlYMDUzOGRC?=
 =?utf-8?B?UGxkZ3NjeVlNZUxudmdsV3dkR3V2WjRxVFRPZDlkYTlMOHRNdUJ2RFpaSWpN?=
 =?utf-8?B?ZWswL3B1WWV5cXBUdjhqSkNLWjJnU0J5YlZrenYyaVpmK25hYzloa3ZlaUZ4?=
 =?utf-8?B?SXRjcTBXVXpUQXg1Vm5TckFhSjR0M1lVa2FCOTA3ZHdONVMxTG5CQ2tENGdw?=
 =?utf-8?B?ZHUzRVFpb0FqdlBpYWc4SjBVc2JuMjRLTGpVd1gxVUs0QlJENE40a2h1bzJ4?=
 =?utf-8?B?eWwvYlJpeDBFMmNIVlk1SEV1eFF6SGVxVEJ2WnpHUW5sbmVTV0dJVnhuN2xE?=
 =?utf-8?B?bkJXQVZCL1J4MkFtanJJc1daLzhEV2pYekVSd0hTRHRIOWt3b3NoK2w5aDV2?=
 =?utf-8?B?b0c4Q1RTZlFVeEFWL1I2dEZMUnN2bGczekVDdlZwa21WeEFSblByc0tCZUlM?=
 =?utf-8?B?eVdiSXl0THRreTlnT3dXU1oxeGE3aTUyTWo0STQ2R0hwUklVc1VxTVYrVWdE?=
 =?utf-8?B?WTNtYkl2eE9sVWJQeG5tcTBvTGhmQzlDdkljc0dRbVNMS2RJa0NKNG5ncUxC?=
 =?utf-8?B?Tll6aXhaM1NMaWs1SURvUDhpUHZYWUE0YnVJMkNzZzlHTWwzQzUwNW0xRmdn?=
 =?utf-8?B?aFZZMkU1enJpa2FucWpyeXBxenpMTG12dDcwK1JUM01PN3hPVk9pUHpwVGda?=
 =?utf-8?B?Rjg2RE9pbExUMG40MkVPRkIwS2FFVXBsWElOdm1hdmFXRWFpNDRuSUxqOFQw?=
 =?utf-8?B?RWNmRDJ5N2w4UkwxRWozU0FZZzZoNGpBdVBsM1dwWVF6REhqaGNGM2RMVDUy?=
 =?utf-8?B?YWowbFJiM2RoR2dlbk5zcklQRkdvekdGbmlYSTN5aWdmbWNBUU5mR2V5UUZj?=
 =?utf-8?B?UGFwWXJIdWNOQWlqRmpQVkVIYll5ci9xajBCckVvcmdYd2hnVGtTcHlkMnE0?=
 =?utf-8?B?bGZ6MEFnNElrZnZyOTd3UXRDQXdzYXZ1cWRxVjJFQkZDN2tFOE9iN1hYZTRI?=
 =?utf-8?B?MllZdVJ5MHozbkhVUVZjQk9WTnRJWE9ReWxja0k5SEF6bVhQMGRkR2pSSkp5?=
 =?utf-8?B?cVNISlhsUkJRPT0=?=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <9FB480720C3BD6409F36DF170F0B9925@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU5PR08MB10733
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DU2PEPF00028D0C.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	b601f82c-ecb0-4d7b-85e2-08ddb49af8db
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|14060799003|36860700013|82310400026|35042699022|376014|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?WjJJRTBlbkNtSWVQTmJzcW1kamlNSVdoZGE4bDI5ZXo5VENGNDhHcTdyWGts?=
 =?utf-8?B?MGJvVW0ybjNTUzFZNjlUQ0ZBY0RRYVVYRnpsMWJiNU5wL2dLNmJyZFpJZGVJ?=
 =?utf-8?B?Uk9yQnpUNE13YXRJWFgwWm5tbUdCY2JPaDhMUzczUCtPRTdQM3A4dVI1UWUy?=
 =?utf-8?B?Y2dkSVhKYk81bFhHVUNMSEs5azJiQkcwT3J6ZWtZY201VEVTWjE4aXdPbnYz?=
 =?utf-8?B?UldVM25mT09qbFI4WEhjTGZTRmFkem52MHZJM2hjNXJiRlgydFc2QlhiWjhH?=
 =?utf-8?B?UTJVZDZBUHNSRjBwY2NPR2JpK3dLZVdmeTR1eWJTczlTZlFVY3pZa2VuU0Fs?=
 =?utf-8?B?RjVob1NjV0dqOTVibDcwRXpLWFNNY3JxU0ZQN2JndngyeUg4aHR6bFpJSThZ?=
 =?utf-8?B?aGF5TnlLMW9qQ3N3Y3BCZ2NnV29VZWI2RFY2VmpOQjVLQ3h1cEJmT3pUSEhB?=
 =?utf-8?B?emY4WndRTGNzS0hiZkN2R3J2UlFCQ0g3VGhwQmcrVzlXNGJwVDdrai85eHBn?=
 =?utf-8?B?aTdMSGE0Z1lwR09IM3JWdGl0ZHl6bVduNGgvL2FpbjVqekQrZjMrN3FkR2RP?=
 =?utf-8?B?cGxyZkJNR1NyNDYxVGJ0MmpoSlQvVFRva0IwTGF1cmVsSklhMnc2b0RDYmUz?=
 =?utf-8?B?YStLUEhEaTY4dnBFNjRFQWhHUHMrVHZqMHZScXRLV01sTTUzdkRheFlhVUtI?=
 =?utf-8?B?UTVLRytIQ3B3NVByeDl4bUpSN0lxMWRFNmxNTE1mTTVMZ0tsZS92MmNNSnE3?=
 =?utf-8?B?ZEJnb2hsTmdEWWc4NUt4SU4yWElraVRqbmFoc1ZDaEhjZFFZQ3dSb2lvUlQz?=
 =?utf-8?B?akZiRUUyYUNvWGg0bkp2WEhLeFkwWkl4emh5ZkdEL2VFcUZCazQ1a3BkTzZC?=
 =?utf-8?B?U05JYkw1Wld0c0UzVHEvUlFLZmpWTkt0L2dmR0ZzRlYrTEkzQm1mVTlXdEN3?=
 =?utf-8?B?cjRDdldpQnlSMjBWbHJ5VUpBaWVRUzBlSkF6SERHb0kvSEpERXlEMGFyM0Vk?=
 =?utf-8?B?NWN6Mk1Hc3d6YkJ5V0V5cFJOU1ZJd3VQdEZRWWNWKzRHZExwbFRKY3RsTm5U?=
 =?utf-8?B?NVA1aWtza2hvcmRhZFFiTVN0S0hEYTJCWWdPZWJEbjdOQ25rSGdhOXhxUllH?=
 =?utf-8?B?ZEVHcTZVaUl6d0NReXo1azE3WjVvMFpheVhBSFc4aXBaNGdDMy92WkxRMWpq?=
 =?utf-8?B?ZFR2Q2Q5RXZnaWN1M3NPTG1vRitLbkpVa0FINVBpdWI5bGRYbmNVdmhZTWQy?=
 =?utf-8?B?dXhpTzFqd05ZNnlDazM3SG00TGZTM1Z5Y1hWcUJid0drMElsaXJJS3RwYU1G?=
 =?utf-8?B?UGRIcGFpUFNEd1VCKzJSS2tzd1hxOElKNmMxSXd2bC93Szh5RzFlZUp2RzV0?=
 =?utf-8?B?RUlEb243dlliMmlpeGt2NVNqTVR3cHplbm55Wkh3N2lzM0xZVURQUzM1MXVD?=
 =?utf-8?B?L3VmNk9Vclc3MTJ6UVNNQzYzeHVVcXhwVmphL3A3T0hneEVTWWdNbkdDcjZv?=
 =?utf-8?B?ekU2aEdkcjFKcmxLbHJnb3RkMlRBMEVvVTg3WnNjOFhhTVlhYjhRT0ZYajhw?=
 =?utf-8?B?c24xUVFkVGp4T1dRWTZPdUQrTUM4Z1F5Zk1taGVuR1BRM0EwUkNuYWErSXJO?=
 =?utf-8?B?UHhxckYxSWl2V0t5c3F6cWpaZVFqZVhNZ2dXaUw4d1ljM2hHdDdQTHNCLytx?=
 =?utf-8?B?Zk5LTmhKZG1TeFpPeHpIbzdyaVQzZXlqTnBtK0t1QzVvV3FwR0FsVHdQQlh4?=
 =?utf-8?B?dG9FZmRScW0ybUZxL3RZdXhlaDNGeGlOYmFLbkw1WnZZQVJxRkZwc1VOdGVk?=
 =?utf-8?B?eUNZL3lXZ1o3MnZNelVVOC9xekl3a1hWRUVIWWNkMFRlNk8wSkd4L3QyRVFh?=
 =?utf-8?B?ZjF6ZFg0Mm1Vb2tKQTlaTW9HeDhCQ0o2MWtYd01KN3cyTjFPRlNtZ1ZXRE5Z?=
 =?utf-8?B?dHBNNm1wMGloV0ZIdlduYU9DNUlZRWMwUWxwODYwa3UrY0d5LzQ3dldVc3dw?=
 =?utf-8?B?Q2xlYnVRbS9qdFlJMlNOWlZqNUlidmdreC91eFI1VVVkZ3J6VGVacEMybkx3?=
 =?utf-8?Q?8KLD75?=
X-Forefront-Antispam-Report: 
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(14060799003)(36860700013)(82310400026)(35042699022)(376014)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jun 2025 10:20:17.4307
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 71e08381-9d89-431a-922d-08ddb49b0c3d
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DU2PEPF00028D0C.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB9265
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 26 Jun 2025 10:20:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219343

T24gMjUgSnVuIDIwMjUsIGF0IDAwOjEzLCBUaW0gT3JsaW5nIHZpYSBsaXN0cy5vcGVuZW1iZWRk
ZWQub3JnIDx0aW0ub3JsaW5nPWtvbnN1bGtvLmNvbUBsaXN0cy5vcGVuZW1iZWRkZWQub3JnPiB3
cm90ZToNCj4gKiBSZW1vdmVkIHZlbmRvcmVkIHBhY2thZ2luZyBpbiBmYXZvciBvZiBhIHJ1bi10
aW1lIGRlcGVuZGVuY3kgb24gaXQNCg0KSeKAmW0gZ3Vlc3NpbmcgdGhpcyBtZWFucyB3ZSBuZWVk
IGEgUkRFUEVORFMgb24gcHl0aG9uMy1wYWNrYWdpbmc/DQoNClJvc3M=

