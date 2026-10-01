Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B660CA5FD6
	for <webhook@archiver.kernel.org>; Thu,  1 Oct 2026 16:28:52 +0000 (UTC)
Received: from AS8PR04CU009.outbound.protection.outlook.com (AS8PR04CU009.outbound.protection.outlook.com [52.101.70.63])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.15341.1790872130145079328
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Oct 2026 09:28:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=T1Ke4AjO;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=T1Ke4AjO;
 spf=pass (domain: arm.com, ip: 52.101.70.63, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=Ec87nvXXxqbcbQEXwusjyux9wvkztrTov3h0onG/aGYa107RvegkpozMWkxDlxZ0JpS9LP3VwIi/krqeregJzhnQeKX7lQPw/TbjBJpJbfJvtnRwDrXzBKQYtIoKo2hKHFAKmGL1Ud2gff1peCc78k+CToemP8VFNdcbYfwLzlJMGkepNHh/Jb/HWXT6vz4GqdK8nTdtNN6FSQbJpWsv8NrgfAj92Yq2dxBeH7wW0Xz+JEEU25zDIr+zCeEQO1/Rb4dImE192P8azbPv5c57lhLWp111VYpiNbfTpS5MYN4+KkiFpVzyEGJ2q0Dtpi76ILSC4xjqjA2/Yi+arsd+BA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RnmMa1sqK/e0PQiQJgZPs/eiilJDdm8c8ZChDdLFaQc=;
 b=KDpeACNUypUSt9L5sW1cBdExFPs8CHTC3X2UW5UL4nkb76urqs1sDB0QH+CQcC0CfHd8vXLBvynI2bZVjSWb898qsAQaswBN23agtVCqQ80PGlNgewlqTQiydu6ZFYuX0uFNmn2uQZjvvnqvhnBqn4VYhoQ8ou2BGDQxPAykD8pFdBBSpJpyrDxFDVOppx3ZUStLymNY4QFhzbmb6PrePO3rtG6W/hvd+9lQG36RjtH1cazvoxFM8wGktBwk9dB/9yZZ8HZdWG8MCt4zYGTi4o8ArjZmC6NnCA9AKHQvApSp6fbQ0JXxqdV1jVDgPQH1k4YGtmGkPlUAAVgRMRPRnA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=bootlin.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RnmMa1sqK/e0PQiQJgZPs/eiilJDdm8c8ZChDdLFaQc=;
 b=T1Ke4AjOZR+xD2kq6+SJgnnd8gqLvE/P5lnefRalr5rPixLZ+tqtAlP5C8596Lxgxk0D2OWPIJN/629MdT7Akom5j0awogffCBwLmYD4fl2bkeBwYZ5mpjOfOqzi8gvyfMP/w9cd9ZI7VEqum196S8f1Q0Wuh7CSE0QqLJAAYbk=
Received: from AS8P250CA0018.EURP250.PROD.OUTLOOK.COM (2603:10a6:20b:330::23)
 by DU2PR08MB10159.eurprd08.prod.outlook.com (2603:10a6:10:46f::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.18; Thu, 1 Oct
 2026 16:28:43 +0000
Received: from AMS1EPF00000092.eurprd05.prod.outlook.com
 (2603:10a6:20b:330:cafe::1e) by AS8P250CA0018.outlook.office365.com
 (2603:10a6:20b:330::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.472.17 via Frontend Transport; Thu, 1
 Oct 2026 16:28:43 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 4.158.2.129) smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AMS1EPF00000092.mail.protection.outlook.com (10.167.242.89) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.472.14
 via Frontend Transport; Thu, 1 Oct 2026 16:28:43 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NSMcXDPPmWQ9XBDOOaqyjdEMUVN0+TRLPUtIO4WCu9OB+fpPNA6DKYFAc85a6WH3ik2z/lUH3jkusrnd8PL2YYEHUAm+zsYuUYRNkxrugMQQBkmAcSHTXdkRbIk+qIIqoeewoNC5EYO4S6c4W7l5Y/S6Clgq9m26y5WBH2wqczRAuH11n3Vn+LLK96AE263VqCbrNc6FzJFlbTVOtHEPqVK6Sbn/fqm1L8h90bLKfxxwVOgvdACzID/i/qI6M64WMNRp1GN91V6sZaSQ8BnvssHr4Z+GoO/pMmIIkkXDNwp4GnLkDdxIPfsw23ASDI8JGvLl5PZZkchrOCHQxxIIpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RnmMa1sqK/e0PQiQJgZPs/eiilJDdm8c8ZChDdLFaQc=;
 b=d7BJeU3XE4Yh5DUkJpJXcuwiylwyKS/6fk0CjFj29t/aVHKX34UPu+LiLnGy+OYNlJzTjfhRla6nW5BwkpmYJmSlSg5ncWe67KN51zmNFvi4OxkyGJDqjUUBbNhQTLgjqVzHz2JV68SWLLrIZDohgtcL5oeR514++xF6kQv0+Wx5wSRZJo6dHH/jUlyuLmMi0MKCZrdD0SIhDVffSXH9RPoSHneucHkeb8H3ZYKOawF6oaH7IlmI2PD8vqUNP1dJSq2fQohF0sn+LQAKPAKtBCj2cCUY5o4AZmA15tAvT7WuJ6MvvYKM8ahLS9HK7hPrQJeZNv1Sxum/UPiwlIiZcA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RnmMa1sqK/e0PQiQJgZPs/eiilJDdm8c8ZChDdLFaQc=;
 b=T1Ke4AjOZR+xD2kq6+SJgnnd8gqLvE/P5lnefRalr5rPixLZ+tqtAlP5C8596Lxgxk0D2OWPIJN/629MdT7Akom5j0awogffCBwLmYD4fl2bkeBwYZ5mpjOfOqzi8gvyfMP/w9cd9ZI7VEqum196S8f1Q0Wuh7CSE0QqLJAAYbk=
Received: from AM9PR08MB6258.eurprd08.prod.outlook.com (2603:10a6:20b:287::19)
 by PA6PR08MB10737.eurprd08.prod.outlook.com (2603:10a6:102:3d3::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.14; Thu, 1 Oct
 2026 16:28:11 +0000
Received: from AM9PR08MB6258.eurprd08.prod.outlook.com
 ([fe80::171d:1f8b:720d:7a1b]) by AM9PR08MB6258.eurprd08.prod.outlook.com
 ([fe80::171d:1f8b:720d:7a1b%4]) with mapi id 15.21.0472.016; Thu, 1 Oct 2026
 16:28:11 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "joaomarcos.costa@bootlin.com" <joaomarcos.costa@bootlin.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, "thomas.petazzoni@bootlin.com"
	<thomas.petazzoni@bootlin.com>, "tgamblin@baylibre.com"
	<tgamblin@baylibre.com>
Subject: Re: [OE-core] [PATCH v3 1/1] recipes-support/gnutls: disable slow
 tests for RISCV64
Thread-Topic: [OE-core] [PATCH v3 1/1] recipes-support/gnutls: disable slow
 tests for RISCV64
Thread-Index: AQHdT+1BHv2jfwwE+kqa9iRwqSxtv7bo48yA
Date: Thu, 1 Oct 2026 16:28:11 +0000
Message-ID: <2E08BDB0-EC22-44F9-A5E6-8452D64852CE@arm.com>
References: <20260929083308.1734775-1-joaomarcos.costa@bootlin.com>
 <20260929083308.1734775-2-joaomarcos.costa@bootlin.com>
In-Reply-To: <20260929083308.1734775-2-joaomarcos.costa@bootlin.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3864.700.51.1.1)
Authentication-Results-Original: mx.microsoft.com 1; dkim=none (message not
 signed) header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	AM9PR08MB6258:EE_|PA6PR08MB10737:EE_|AMS1EPF00000092:EE_|DU2PR08MB10159:EE_
X-MS-Office365-Filtering-Correlation-Id: 6e40f046-0f7d-48ce-6ed8-08df1fd90f64
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|366016|376014|23010399003|1800799024|38070700021|11063799006|4143699003|56012099006|10067099003|22082099003|18002099003|3023799007;
X-Microsoft-Antispam-Message-Info-Original: 
 5IdI44uDqv59peRL9b/8EoG+VBnn/yzwyju+4JjmLvwK0z40BmTXuD9wCZWwxj3QGQczU7la3VSsOtgOe4c6e5OFlFmUAzmBw0F3CQKjur8q9jluN5VyDOFvaqpJbWQ1l1u3hVUoP8pXCMZsdmWpoftJia9HZfLgUmnW5Rn4vrUvlyRzhA/LEM8br/7qW+84j8M+9tOV3wZEXEA1CdNHvwMqsCrZRuG9tHrtMiX78dCYrweg886TjqaA/w65d/wTFkTmRKmRpRK39ugfrNsZmCjHE3DYrVx/9rVRNPzU9aNdmjbeghQXv+bAazkiJ37KOl/DhXtJfBvrp//SH+Sbe38T+X1WFKY7QjbUTSM+x7MWGsCb7luuLgC8shqTdOJPOr6es3DX1Xd0kWzXlqyIBHL+Bo5XInMGLSgXHOSzplQ1Z+llWNNY4QbiLIxjQEHBWNdB2GyRgNshEGIcjYgVwBki4oEU9+xYm+sHLnSrUmVm5p2J8hVFUIUuYaVNojPzHRaXPH7X4PVAqs3WTmHsYwNNM+3NSLBJ/8bwT85+7CHwfA5U7ggoTQ2I2w0002jjb6gDmkIBFkT/ICQYzYVPKaD6d5Rto2XA/cOVkFQBV/freWwlMVrok/pC0MGDShQsg5rmaCkuEk9B03p1Ux0Sax9asbbUzHT2NxU/dgZJFqkPa/a5HoSDzhCeBlm236psKWDpypF+jaTwMntBwFfUyA==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR08MB6258.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(23010399003)(1800799024)(38070700021)(11063799006)(4143699003)(56012099006)(10067099003)(22082099003)(18002099003)(3023799007);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <192537D2DD46314FBBE22E7702F8C5C6@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: 
 hbY8n1wxPedWA+wZI//CTDrtFWQfdcaZan8oBGZwwR1nAcTOxW7xTEzP1s7atLNWuCLNLu5tpOy5Mq8HhDoaSmnNTyAcDHQQw6yFiabISdTp25ePA4eI4OWp55xd47s9H1axT3K2MfvBmo6pAgJDghmLCIyNRNXPYZC60KBrkTuWZ7rz125IYZg64YNhi4G0idswRlB9sx17TreRDS/b9nU/Di876pV//hSborMajRSqPAwPtmTzrbNxosmO5yLTM4oxX3rCpd6H3Np65wJuIjPHjUlkB9pETiF5+d1SIY0DjbwOqTc8WMil5iivHmtkk0FEgMx7gMjh568EAxWOww==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA6PR08MB10737
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AMS1EPF00000092.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	a4858ff7-a013-41a9-6489-08df1fd8fc1e
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|35042699022|23010399003|376014|14060799003|82310400026|36860700016|3023799007|10067099003|11063799006|56012099006|4143699003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: 
	OZBhZfNEsFtyHqiu42dkwVAVphbuTG1W6yWyd1X/v/6HDLbMbpQK7J3cuiPvqmssO9+VM+0g8Z7EyMv0FlDyPhraQGB2azxs7i2GwcOKYcS0tr0V0ROFl9pkwc3aZfRJIqCr211Y7wgD7SaD8/Obua3SCROqxAVZTn74D5lTfiGAgrTEz7tJtD88/gGv3sfi31rmB2SKYHRX4UipiE90T96b8EaHUqdtND8XrlVhUu7M5yLF07vHgWf76JvhZl7BuOaFiSqglKzZz2vA6BdXvpHJR+GPTv+5KSv931FOWJ8yt5EPKjaMAJ4bFy3t5bBHdbL/LMcl0Xf0JCooEpe/tBThUmhbI1MNotjK4IgCirH1YhwKHMZq7znz/XppIg56DyrG5FBXTbcdveaAXB5P3s3cqPVsKKNTCF2e5j++mOQcAeCxIIzAIEzLTKjDvR3qwjKGztgW9uqDWeseKNvnpaPt/BnA+i8uVfUtBd+EXlUjbsCFDLUEGIh6umSaY28vYl9h9sAv4m+wHyl246TBmfWytZzG6lhmxIw3TyVkjMO6IQVp6e82spMbWyCmpgm4hVFPQ3JIfRaA6c8A9JnaRXLhjZ6HaCGk0JLjoQDl70MS3IyUywwHTmFrRZ8g814kXHvnLl/U9AZLcbw2s+KU6W91DeP8kv47HKjhPlzNKGdhrIliqZdTDflBSm3m6Xtd
X-Forefront-Antispam-Report: 
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(35042699022)(23010399003)(376014)(14060799003)(82310400026)(36860700016)(3023799007)(10067099003)(11063799006)(56012099006)(4143699003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	AJn7btWLQo8m/gwRcLDwlnH02ocY6upi7Pof6I/wP7fCHM4Yyd1HhSlx2hvdsm+i35tb1Yyal66mdk2HCYVtv05ZPlJVNpDmlguVQDq8CbOK6moBAnYCGfrJ+O8ZClZLvaXMdIVWtDiKOs98/Zx76U0qUeqES5FqEA8v6HscmOvuQSBu88KohkMo/W71ZYn1km/YB8ynCXDWTlAtBz5wODUHRwGDU+n4GSiP3iNvw7ubtS6QCznXMIi6ag/Hs4P5CmkqYxSerY03T8gQ0jaRjydZavZVixNuruwfYgRmgog/on18IX6WJq7+b0zLnm1d+rsvi0StaLYs5kStk2c+xDriOL3+6ysl4jmplcFewDERjNUs/6f3kyU9UOHTSpSiYQOSqDRcxVcHlm6jC9E8kNlzO7hyh1J4SnbGk2ZY7I0cQXkCT7Bt4VYimyzZpsFQ
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Oct 2026 16:28:43.5640
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6e40f046-0f7d-48ce-6ed8-08df1fd90f64
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AMS1EPF00000092.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR08MB10159
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 Oct 2026 16:28:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247045

SGkgSm9hbywNCg0KT24gMjkgU2VwIDIwMjYsIGF0IDA5OjMzLCBKb2FvIE1hcmNvcyBDb3N0YSB2
aWEgbGlzdHMub3BlbmVtYmVkZGVkLm9yZyA8am9hb21hcmNvcy5jb3N0YT1ib290bGluLmNvbUBs
aXN0cy5vcGVuZW1iZWRkZWQub3JnPiB3cm90ZToNCj4gK1NSQ19VUkk6YXBwZW5kOnJpc2N2NjQg
PSAiXA0KPiArICAgIGZpbGU6Ly8wMDAxLXRlc3RzLU1ha2VmaWxlLmFtLWRpc2FibGUtc2xvdy10
ZXN0LWNhc2VzLWluLVJJU0NWNjQucGF0Y2ggXA0KPiArIg0KDQpBcmNoaXRlY3R1cmUtc3BlY2lm
aWMgcGF0Y2hlcyBhcmUgZGlzY291cmFnZWQgYXMgdGhlIGF1dG8gdXBncmFkZSBoZWxwZXIgZG9l
c27igJl0IGRvIHRlc3QgYnVpbGRzIG9uIGV2ZXJ5IGFyY2hpdGVjdHVyZSwgc28gaXQgd2lsbCBx
dWl0ZSBwb3NzaWJseSBnbyBzdGFsZSBmYXN0Lg0KDQpMdWNraWx5LCBnbnV0bHPigJlzIHJ1bi1w
dGVzdCBhbHJlYWR5IGhhcyBhIOKAnHRlc3RfZGlzYWxsb3dsaXN04oCdLCBzbyB3ZSBqdXN0IG5l
ZWQgdG8gYWRkIGEgd2F5IG9mIGV4dGVuZGluZyB0aGF0IHdpdGggYSB2YXJpYWJsZSBpbiB0aGUg
cmVjaXBlLCB3aGljaCBjYW4gdGhlbiB1c2UgYSBtYWNoaW5lIG92ZXJyaWRlLg0KDQpSb3Nz

