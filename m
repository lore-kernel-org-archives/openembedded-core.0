Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D5385C28B2F
	for <webhook@archiver.kernel.org>; Wed, 12 Mar 2025 13:40:59 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (EUR05-VI1-obe.outbound.protection.outlook.com [40.107.21.51])
 by mx.groups.io with SMTP id smtpd.web11.37448.1741786854416015376
 for <openembedded-core@lists.openembedded.org>;
 Wed, 12 Mar 2025 06:40:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=KB7krOPA;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=KB7krOPA;
 spf=pass (domain: arm.com, ip: 40.107.21.51, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=I9E0nVeXdOcMbs3YgF7wuX7t1/KtMSEHbB1hZLa+AJrarzQq/yXRudROiQ9RtPlcVN4Xxuy2/ravKrchyD54CqfJbNwQtZU8xv4IpeCgdT8KmPq5LNx/h3ZazkVeEtrTSyVSt2AmsYV4x5KIQNrpYA451aEp5sfkelFbmlETa/PtmOVXruWUCiHln45y6WrHq0YQ+BJO7e5pCGP/cHGvXDgXcGeR+4aig9Z1zPQRA8X3xcxHT2qHALxJ0L5KxELaCvQXWSleqJHklbY//wY2CHEhaK9z/vj+7RgJqPblVe4EpOFlgc8cdIqmlh/+Q6SEHauz7C1SDbLJ4Z4YE9FX7w==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UbwUOVAfO751aPVfuJJHYqkI/fH6DwO2Ora65bvn2Cw=;
 b=KIDeeIbvqc1zHY8EuALQQsmBmYVtzH5xlbz9omr4SRiKk8Mc+Kje80WO0WC+lHQYEB6cYhp9Brz4Dager9hXah0RHDiioelbfR8wlO180ockeuC5RZSgDtkc1kzuc5Fq1ClTvpWRlK+3XF8UtRcKlLGJohgkcnJ3u1LP03+ZoehqqvILP3YSUexLnK5ckfHsTdDJb0A2B54Q0Z5IydDPKuqfJXabI9oilbY+BFgTFlEFq4h7IlO+98cYkEYEqLHwdACDhQ3RRv/jb2SI1eV/hqE614huTtF+BYgvZEiTDfW5mPcNJmpTLFpVSINw5JDLlWwQvQ4A3PUwvn41r7sAtA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UbwUOVAfO751aPVfuJJHYqkI/fH6DwO2Ora65bvn2Cw=;
 b=KB7krOPAhF0AGHWHr2qn6xOyDcL4zU9tDjZj75bLOmPde9nzM8Mhto+nsjY/aZGVg+c81Eh3WOMkCJ47z4KurrCrq8a6U5qccuC/aVRVkAlW1ycnEYCIvCFJekT7Zjh1rL9OhAQxmiiqiBV5zaUuaXumoTo1IYiBAihDc7Cl3YU=
Received: from DUZPR01CA0033.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:468::8) by AM8PR08MB5796.eurprd08.prod.outlook.com
 (2603:10a6:20b:1d1::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.27; Wed, 12 Mar
 2025 13:40:49 +0000
Received: from DU6PEPF0000B61F.eurprd02.prod.outlook.com
 (2603:10a6:10:468:cafe::1e) by DUZPR01CA0033.outlook.office365.com
 (2603:10a6:10:468::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8511.26 via Frontend Transport; Wed,
 12 Mar 2025 13:40:48 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DU6PEPF0000B61F.mail.protection.outlook.com (10.167.8.134) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8534.20
 via Frontend Transport; Wed, 12 Mar 2025 13:40:48 +0000
Received: ("Tessian outbound 68993334049c:v585"); Wed, 12 Mar 2025 13:40:48 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: a52a502febc74d5f
X-TessianGatewayMetadata: gJMcLjEDBlhNSuPM2kWOhujWd0HRx8jz0C9bx8gKqvDN7RbDIfLFdfqdprr21/fZyJgaiQMMzAr8xXeE4rAxR0pltoUWWlSsEacKjzdDlvbtXuRlWySOyfSav16bUmxzh8swTvv+zHk9luIlsDTXPsQsn8sPwxXViv84/bN1OKg=
X-CR-MTA-TID: 64aa7808
Received: from L56584829e8c6.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id CD84290C-464B-403F-BD28-8B1690AD5BBF.1;
	Wed, 12 Mar 2025 13:40:41 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id L56584829e8c6.1
    (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
    Wed, 12 Mar 2025 13:40:41 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wKOpAzdfqc0s5XXviRnzJqkB1NfkZX3TaM5Hiin2HmDKfhSc0ljZCptrpB58+Qy4O/JxBoG6d1wBiH1cbpYNfaovXAICAU8JuvEJOAWnVQqYcsSgCfFBZ01vNjuN4qIE6cH/HmUoFlrNiAvIijkG+PLtkbCjg21HnUOaFsXnloZYaD1WkIKTt0rebOV2QQCAuUXtoZDHg+XFrkXdcXM7ZyL6j3G+fXXKZKioGhDBATt9ijMrZV+kxxa21Ecf88YG8Vn0eM+iZU9l5j8rH10WC02rYlF8njOmHkbfmA7Ep2NVEvCPkYz9FRh21SLtyX5ud/70GIMIFVicytRhzACvPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UbwUOVAfO751aPVfuJJHYqkI/fH6DwO2Ora65bvn2Cw=;
 b=gm+8N6jDf5tvw62wx07nI3Z7cQ1xNioPcaQDLf1su/UhJsnReEHLTdBo07AuoAGEJHSxbND8WWi/j3FtsGR3e3Jd8o2wEZIwuwVBAYiQx0y+UMbdZgQsNjPkuFEZYVLak77oxibKDeV9i+C4DCm8pLg3d7O7qzsfVZABbfbCJy1zCxudbxPhmsVWF6lmh3gag8tZSwFAuaeerESzS496fJ4+XotxscPvqgqRVNWVDE+7aRmd4B6yBbUfXUOmZuqi7h3FFzcMeN1XaITLhovhgRLk7qKUcuEwZp0uHvZqZsPghuCoJ41+GZmUQWc8rrzU6wa2QfUndIOK7bOEW63cyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UbwUOVAfO751aPVfuJJHYqkI/fH6DwO2Ora65bvn2Cw=;
 b=KB7krOPAhF0AGHWHr2qn6xOyDcL4zU9tDjZj75bLOmPde9nzM8Mhto+nsjY/aZGVg+c81Eh3WOMkCJ47z4KurrCrq8a6U5qccuC/aVRVkAlW1ycnEYCIvCFJekT7Zjh1rL9OhAQxmiiqiBV5zaUuaXumoTo1IYiBAihDc7Cl3YU=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by AS2PR08MB9046.eurprd08.prod.outlook.com (2603:10a6:20b:5fc::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.29; Wed, 12 Mar
 2025 13:40:40 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e%5]) with mapi id 15.20.8511.026; Wed, 12 Mar 2025
 13:40:40 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "pedro.silva.ferreira@criticaltechworks.com"
	<pedro.silva.ferreira@criticaltechworks.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH] buildhistory.bbclass: restore
 BUILDHISTORY_PRESERVE files
Thread-Topic: [OE-core] [PATCH] buildhistory.bbclass: restore
 BUILDHISTORY_PRESERVE files
Thread-Index: AQHbZ2Kgl5nB71cLpECjkOi/TQ7x3bMi2CAAgAGhuYCAQf7nAIAJYR2A
Date: Wed, 12 Mar 2025 13:40:39 +0000
Message-ID: <E508C046-845C-4766-9603-EB481E64AD1E@arm.com>
References: <16166.1737643041567770551@lists.openembedded.org>
 <359.1741271194425273451@lists.openembedded.org>
In-Reply-To: <359.1741271194425273451@lists.openembedded.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3826.300.87.4.3)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|AS2PR08MB9046:EE_|DU6PEPF0000B61F:EE_|AM8PR08MB5796:EE_
X-MS-Office365-Filtering-Correlation-Id: b8b005b8-1943-422d-56de-08dd616b7f7c
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|1800799024|366016|376014|38070700018;
X-Microsoft-Antispam-Message-Info-Original: 
 =?utf-8?B?d2Q4Ym4wa016enhCV2QyNFpvVmxlTlBJRnVCSktlTUJPbitnRGJLbGZrdTN2?=
 =?utf-8?B?NFZmb2NORkgyWnpmUnVEbVdXa3REeHdicDN6Ums3RTc0dGdldGY0QnRwZjNu?=
 =?utf-8?B?N2NwSFVCRHBtTW40RnhJNDllTThCdlVCRm0ybTMzalRqa3VoczJvemNkV0pY?=
 =?utf-8?B?dCs0ck1vZGRBSExFSWEzYnU0ZjVycEdjdDh6SGN6V1BJQzlaRE1rc21CMXp1?=
 =?utf-8?B?ZGlvekErUDIvL2l4bEVGNE1Vbm4ybXNoY2JkRnpWdXI0K1JQb0Rmb2NibHZS?=
 =?utf-8?B?d01NY2d0akJiVnFkK3ZBTXNvK3NiTDN2M1lMQSsxcSs4SFU5MUlXTkI2OW54?=
 =?utf-8?B?aGw5SUJhY1VNNkpCU1p4V283bGI5aWxrclJzL1FQUk5nSkh4SlNwNS9BSDAx?=
 =?utf-8?B?M25lVjNwVWJHRkpzQ0I5L1lwL2lEc2RLbEJHaVhJVEhta3o4NjhkcnkydEpp?=
 =?utf-8?B?ZmJLVlMzM2ZKVWpRUTdTTzFBaFlNd2ZJVmZHTHh6b042V0pnT0U3NUFNNHdq?=
 =?utf-8?B?V2NwR0V0YWNRekdlVmRZSGxDdGVEUExLQ05HNWhQMEdKWElOU2hLVWYvRTFw?=
 =?utf-8?B?MG5lNjlkOVZLMVpLMkV6VzJ4amt3YzV0dFNwK3JNOHpRQkVKQndVMnNhT29t?=
 =?utf-8?B?L01RWjBDQzRzVk5ldmxFNTRQVkdpSncva1FCZ0hTaTg0YmZnc29kUDlXQWdT?=
 =?utf-8?B?RDJBaVA0ZjVaMWd6ck43a2x0WXNOMW1aY09ZZ0ZhOURRWTdEQnFha21iZVFD?=
 =?utf-8?B?U1JtcFkxTlhCRVpRWHp1S1ZQTFU2aUtXempDNFpPKzNTK0t1NTIwZU5Xdmpz?=
 =?utf-8?B?L1lXaVIrWnNiZlo2R2lzR2ZyQXRvZEZsdHM0cmxOSWI1enZZRDNZR21qcUNr?=
 =?utf-8?B?eFNGUEN1TTNISXVkSTFPcjZYRlJzeFpoWFlpTlNvRmlrYVA1TDNHc0N0Z0Rw?=
 =?utf-8?B?REJKTFJCazhnMDAzREtsTjhNbXgzRHZvVXNVV2ZUNE1BTzdFZzF5ZERsUjRG?=
 =?utf-8?B?WEc3NGhsK0hEazJsN1pTTVhXZWtpTG9kMzlJb3lGblc2MUhBZHZkSHlaalRn?=
 =?utf-8?B?MXpUSE5mQUkzODAvSHdnL3ArZEsxN3JIM2JNMlRpN1hJazhpdDAyaUYwcWNt?=
 =?utf-8?B?a0RzRXgzOW9tWXBFMUZEQkFJcnYzYVROYUtTSmU2NEFpRVJCZmhkSy9GdnAv?=
 =?utf-8?B?ZDJhKzh1UVhlQzJMemNvK1ZRMG1qbGhmc3ZIQ29UNzFhT2liQlNRRHZqckdT?=
 =?utf-8?B?WVp3cjhFY09HTDhZZWkvelUzR3I2Z0g5ZHBBSDdzTUNoVXBWWXp4MHJXYWgy?=
 =?utf-8?B?V0dRR043VWsvR0hEYjFhaUhiOXZNS3Q0aSsyQngvZ0VQSlpTQklYWGhWQXky?=
 =?utf-8?B?VERZOVJjeU1oTVI5QTBnUzFQVTB6dE9qbTFyeGpXNXFUNXJ3TGJncTFBa1VY?=
 =?utf-8?B?QU4zUVVzUWp1VFlYblhKc0RseXdEVGhLK0p6NGhWWEUwWlhpVGJFSjVhZUk0?=
 =?utf-8?B?aEJTbGNIUEkzbmZvWEFVMmJMVmptRlZZcEFuTjg0SGc0QkJwMEdaVWFpUkh1?=
 =?utf-8?B?SkFzQVNPQWRSVWNSQlNmNVJzUzVJeXRaVTcrR1AzWHg2M1ZUN2tPa3FlWCto?=
 =?utf-8?B?LytUa2RMTmU1Qk0zTkpZZWh1QUtWam82UFVpNmw4RC9pcFBRMk15d3l5Wjl1?=
 =?utf-8?B?aEo3a1NBZHZ6Y0lrREc5REc3K1Z4NEFEckFJazhMZUxlMm14dWY5bTZEYUVl?=
 =?utf-8?B?cGtOcjE5dTRPZVhBOER3RGQ4REd1THVCYkt5MGNLNUUxck5uMVlScWJPTzJz?=
 =?utf-8?B?KzlBRUkxcVMyMjdZMTJTa1RFWGdiK09vVDNmYjhDVEpFWVMzd3JRMEkra05E?=
 =?utf-8?B?N2JMcS9TRms0UjF3MXpzQ2syT1NlN1VDK1lRU0Z1bXB2RDduZlNOZzdWcEIz?=
 =?utf-8?Q?Pnx7jTIql55U+qOUkngVP4qYadud1xqb?=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <0463FA8F14D2F8419ED5F7E464947870@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB9046
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-SkipListedInternetSender: 
 ip=[2603:10a6:102:2a3::12];domain=PA4PR08MB7411.eurprd08.prod.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DU6PEPF0000B61F.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	b85697d9-a9e9-42f3-697b-08dd616b7a6d
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|35042699022|1800799024|36860700013|82310400026|376014|14060799003;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?VXk0a29jaUprZmRvUnFDODZqZHZ3eVJTRVllalNVUVB2N0JLOUY4aHgrU1BD?=
 =?utf-8?B?NVlPWVpUM21lZjRqUFFSdWNLOTA5dEprMi92TmVDVTRNdi8rVk1UWjl4MVBi?=
 =?utf-8?B?cDJsWjlCbnF3Mm5nbnl1NDRsbXExSi9QVDJCeHl1S2NvanI4dlUwaXBlOGV6?=
 =?utf-8?B?SllvNmNSUFdPQ0lXUG93L1U3SXNyd0xJbEpFaDRoNGIzWlJpUE9BYjhsbXJT?=
 =?utf-8?B?dFd2eTFOcFF0bzVmZDRjSEtrR0VWaTI3WWR5SjdheWlZOXZHZTBsVzFjQnNN?=
 =?utf-8?B?aWdBdWhHRXNHMnIrUENnY0NTRG90NmlEZHJEWC9QOFFla2tIcDIwR3VFU2My?=
 =?utf-8?B?aGd5NWs1MjJveVdncDFEMnZVNWg5d09aM0VXUEZXS0JSMDIwNDRYaTd5MWRM?=
 =?utf-8?B?OXJJd1FSbHdHMnFXd1lEQ3lYTUpJUHlVaFlIYUp4QXF5M0tPWmxSejFpeGNi?=
 =?utf-8?B?U0tOZlBaQ09COGJuWVJja0s2UnJMbm83NEh5RnpqYTkvMVhSWXA3UEkvNisv?=
 =?utf-8?B?Uk1oR2drQ3hDTWRXQ0R2RDJLQWZWb1ltem5vU280aUpDbnZ5SU1VV1l4WnlF?=
 =?utf-8?B?NGhYSDVUOTZPYWJES0hIWWNKZi81SE1GNlY0NkdNWmNpbGRvNW5vcVIxdXNk?=
 =?utf-8?B?SVhEVmtpb1lUT3gyL3pEdCsvUUkxSUR2MVVVMmNUZHBLYXoreGFPUnh5Zksv?=
 =?utf-8?B?RzM5QzFRVXNFUVZkcTBuRGlZZnJyaHlLRENkVFkxWkJMMzBZUklrVjQ4SVhR?=
 =?utf-8?B?d2VRTWhua3BpREpxV2xnWXJORmplR0tyUFhDVkJXdy94MU5OamtQR3ZGUlhD?=
 =?utf-8?B?WjBOd0I3eFVxMldXcXFlcm0wczZqWm9pb2ZqeDFWTGZySG1mbmNFU1ZNMVls?=
 =?utf-8?B?NHk0ZGhBYXhLUW5NeDIrZlY5SjliN2xjSHU4WmlVVkZqV1VYem9kSnA4U21Y?=
 =?utf-8?B?WnE4ZUp5UXU1blMwWkZJMUt3TXNOM0tIaTJIcmhsRmNpdnhvTis0U09tUDRQ?=
 =?utf-8?B?UHpqbWpSYkNYblJWRFo5eC9iK1BlbmJyL2F3Y0lGdklZRHhqM2pLcmltY3FY?=
 =?utf-8?B?Wkp4R0FrYWJIejdObnlISmxXWG55a2FjNGdnaUQ0bHBGSDU0MWdkd3ExNFhV?=
 =?utf-8?B?WHpOWTZJaThhMEJ6WnhJbnU5T1ZOK1N0MnBhN3FnVlJhcCs4YitPaHoyek11?=
 =?utf-8?B?V0hJRkRBc05Zd2dBVEtCZjZTcEhkbWV4ZGtJZTNzWVpaQ0E4ay95WXI4amtr?=
 =?utf-8?B?UHNFTmc4WDVUUlFhMFRGaEh0ck9kenBUQW80UTIxZTlWeU5QOElpYi84MlhJ?=
 =?utf-8?B?UWdHWFd1UW1EbmNtMis3OEs3dEZra0t3MjZlRU9tQ2t2UG9UL2NYcm4wbjRS?=
 =?utf-8?B?QnN2M1hJZ01yeTB5VGhvTk5xam9JeGovTWVHSnVGbTJzNTBUbDg2TDlvQ1Zp?=
 =?utf-8?B?Ujh2VkdHSHVsVnFWOFRPc3hCUDhIbVIvZXZZY3N6L1RSWnkrYzVuWnFKQ2ZX?=
 =?utf-8?B?djQxM0ZCckx0bGhmaFRtcFpFRCtpWWtGVWFxN1R1L3J6UTVtczJtL0dJaU9U?=
 =?utf-8?B?UVFCeU1ad2NlTVBia1BZR0wxL2JpYlFxc0RaRHd2S2FhVW1nazR2emNWTGZM?=
 =?utf-8?B?ZGdIL0dIYnpQUGUxRnlXU2VUZGRBZnNNaHF0YkdxUW1RU2J5emFjSlN6YmtF?=
 =?utf-8?B?QXE4Y05wbm5nTXNKelM0VDNVVExGaTJUTUhZTzZUdVZRWXFBZVdBOUNoS1N5?=
 =?utf-8?B?NVQ5MXZVZjVBWEpZcWRVcFM1cCtQR0FYL0pxdUlKaSttOTRMY0M0R2VaWlVp?=
 =?utf-8?B?Ylp0RnZ3a0JQUDRpUzJMTm9RWUQwNkdneGt4TFlOWnVZOG9OT24xWUhaYnFE?=
 =?utf-8?B?Vy8wb3RFWVNNbVF4NzJzUm5Mcm9BWnBGbTdZbGNzbEFDQU5ldkpOZWVKZmNp?=
 =?utf-8?B?OUZsdktzVExxeDR3TXVuMkdHeUdidHNSUHp1UkpjUHJvN1Excm1xVzB0aFhH?=
 =?utf-8?Q?jpNNZ+/Q72hGCsRtf5cPqCrbDnYWNE=3D?=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:64aa7808-outbound-1.mta.getcheckrecipient.com;CAT:NONE;SFS:(13230040)(35042699022)(1800799024)(36860700013)(82310400026)(376014)(14060799003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Mar 2025 13:40:48.4728
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b8b005b8-1943-422d-56de-08dd616b7f7c
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DU6PEPF0000B61F.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR08MB5796
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 12 Mar 2025 13:40:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212655

T24gNiBNYXIgMjAyNSwgYXQgMTQ6MjYsIFBlZHJvIEZlcnJlaXJhIHZpYSBsaXN0cy5vcGVuZW1i
ZWRkZWQub3JnIDxwZWRyby5zaWx2YS5mZXJyZWlyYT1jcml0aWNhbHRlY2h3b3Jrcy5jb21AbGlz
dHMub3BlbmVtYmVkZGVkLm9yZz4gd3JvdGU6DQo+IA0KPiBTaW1wbGUgc2NlbmFyaW8gdG8gdGVz
dCBpdDoNCj4gICBQcmUtY29uZGl0aW9uczoNCj4gSU5IRVJJVCArPSAiYnVpbGRoaXN0b3J5Ig0K
PiBCVUlMREhJU1RPUllfUkVTRVQgPSAiMSINCj4gQlVJTERISVNUT1JZX1BSRVNFUlZFOmFwcGVu
ZCA9ICIgZmlsZXMtaW4tcGFja2FnZS50eHQiDQo+IA0KPiBSdW46DQo+IGJpdGJha2UgLWMgY2xl
YW5zc3RhdGUgYmFzZS1wYXNzd2QgJiYgYml0YmFrZSBiYXNlLXBhc3N3ZA0KPiBDaGVjazoNCj4g
Y2F0IFBBVEhfVE9fQlVJTERfZGlyL2J1aWxkaGlzdG9yeS9wYWNrYWdlcy9jb3JlMi02NC1wb2t5
LWxpbnV4L2Jhc2UtcGFzc3dkL2Jhc2UtcGFzc3dkLWRiZy9maWxlcy1pbi1wYWNrYWdlLnR4dA0K
PiAoRmlsZSBleGlzdHMgYW5kIGNvbnRlbnQgb2spDQo+IFJ1bjoNCj4gcm0gLXJmIHRtcCAmJiBi
aXRiYWtlIGJhc2UtcGFzc3dkIChpdCB3aWxsIHVzZSBzc3RhdGUgY2FjaGUpDQo+IENoZWNrOg0K
PiBjYXQgUEFUSF9UT19CVUlMRF9kaXIvYnVpbGRoaXN0b3J5L3BhY2thZ2VzL2NvcmUyLTY0LXBv
a3ktbGludXgvYmFzZS1wYXNzd2QvYmFzZS1wYXNzd2QtZGJnL2ZpbGVzLWluLXBhY2thZ2UudHh0
DQo+IChGaWxlIHdvbnQgZXhpc3QpDQo+ICAgQ2hlZXJzLA0KDQpUaGVyZeKAmXMgYW4gZXZlbiBi
aWdnZXIgcHJvYmxlbSB3aXRoIEJVSUxESElTVE9SWV9SRVNFVCwgd2hlcmUgcmVjaXBlcyBmcm9t
IHNzdGF0ZSBhcmUganVzdCBub3QgZW50ZXJpbmcgdGhlIGJ1aWxkaGlzdG9yeSBhdCBhbGzigKYN
Cg0KRnJvbSBhIGNsZWFuIGJ1aWxkaGlzdG9yeSBhbmQgYnVpbGQgdHJlZSwgaWYgYW4gZW50aXJl
IGltYWdlIGNhbiBiZSBwb3B1bGF0ZWQgZnJvbSBzc3RhdGUgdGhlbiB0aGVyZeKAmXMganVzdCBu
b3RoaW5nIGluIGJ1aWxkaGlzdG9yeSBmb3IgdGhlIHBhY2thZ2VzLCBhcyBpdOKAmXMgb25seSBw
b3B1bGF0ZWQgb24gZG9fcGFja2FnZSB3aGljaCB3b27igJl0IGFjdHVhbGx5IGJlIHJlLXJhbi4N
Cg0KQWRkaW5nIGZpbGVzLWluLXBhY2thZ2UudHh0IHRvIHByZXNlcnZlIGZlZWxzIGxpa2UgYSB3
b3JrYXJvdW5kIGZvciB0aGF0IHByb2JsZW0sIGFtIEkgcmlnaHQ/IEFwYXJ0IGZyb20gdGhlIGZh
Y3QgdGhhdCBpdCBkb2VzbuKAmXQgYWN0dWFsbHkgd29yayB3aGVuIHRoZSBidWlsZGhpc3Rvcnkg
cmVwb3NpdG9yeSBpcyBlbXB0eSBmcm9tIHRoZSBiZWdpbm5pbmcuDQoNClJvc3M=

