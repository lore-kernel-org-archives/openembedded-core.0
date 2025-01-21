Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C96BCC0218B
	for <webhook@archiver.kernel.org>; Tue, 21 Jan 2025 15:29:53 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (EUR05-VI1-obe.outbound.protection.outlook.com [40.107.21.67])
 by mx.groups.io with SMTP id smtpd.web10.18593.1737473385549596058
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Jan 2025 07:29:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=YhjJ8Sco;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=YhjJ8Sco;
 spf=pass (domain: arm.com, ip: 40.107.21.67, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=mIOZiIN4CN4CU6ybYPuXgshwnXl2ZEmSgXSjuKuME+burYKuLUQduWC8l1LHi5JO08/HXIskdoNZrdJzBTBM07aeNaImUig6WsuZDdDQuD+S+fZlz4+Y53eFBCWPh7tENqe3lLa6Il09WFv/Ifegq8TgSpIDWgkB69m+06Qz8MXm/PKrwBdT4w7ITPJLsBJ+pCjEDB3QONs7eNPJa8YdJ08E9nCKJ7yH8bCn6JZQyC98jcEEkzx/rKgwkLKUppNfCJtasJLXtnhrFnZPxU1/sI8VS7K04IS7uW8D04Xy4cNZl2yXSK/oJjs2D4p3IERUi68DN1Xg3UilKakz0IjllQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QXZ2wWVYqZPXvfXSv5p6uH+ZOj0ZwRfO7SjyIboRs50=;
 b=s1O1eYEWlxGA4L7qtgtMGQvvWU508lMDnOSa+VplRtp4itSHWK3iDA4L15PYgIGWCJk7oDVcZym6hXYMt+ntoGNHbnjnOFCtUKKt+I53VTLNIKOGLinViJRPxqkyIhIzIYsuDabOywM5e1ZB3ltl2OiMJ/6cBc7RabH6K8GLQlzNK4r2BmCZzNr7Jrj73W0/pUFhu/cAFYhwIBTV+QSlXn/e6+qgGJPL0UQdw9vh0RhvzMBHjambYDitv1jdCMXrFkAVYPynZi1c/o69HumbcbmJDVEy94QqeESbEC6lxi98WFxe1ssXapagA8WUhAKR8AqvMSWCVPnqOaZs2uizNQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QXZ2wWVYqZPXvfXSv5p6uH+ZOj0ZwRfO7SjyIboRs50=;
 b=YhjJ8ScobYSfL1NRzLYJjTqo3RCX+HK0Zq8onMlVCFLYOFf6xIUSx/hD/C97pIIoIjbtzOkd8ZyR0o88WkwWt8AVre+OtKToUsDucFwMiQq9Lmsa2lcV04IFZzc01Q+GQkAza4UEiSc+gg4L6AaY6HMZKUGkoikKAzbiwKH9moM=
Received: from AS4PR10CA0024.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:5d8::16)
 by PR3PR08MB5817.eurprd08.prod.outlook.com (2603:10a6:102:82::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.22; Tue, 21 Jan
 2025 15:29:40 +0000
Received: from AM3PEPF0000A78D.eurprd04.prod.outlook.com
 (2603:10a6:20b:5d8:cafe::66) by AS4PR10CA0024.outlook.office365.com
 (2603:10a6:20b:5d8::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8356.22 via Frontend Transport; Tue,
 21 Jan 2025 15:29:40 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM3PEPF0000A78D.mail.protection.outlook.com (10.167.16.116) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8377.8
 via Frontend Transport; Tue, 21 Jan 2025 15:29:40 +0000
Received: ("Tessian outbound ad07758b3bb4:v543"); Tue, 21 Jan 2025 15:29:39 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: af6b7dc819937f31
X-TessianGatewayMetadata: cEVahRT7Drf4JwnNF8xKMCgLng2GxifHRYYml+bnIZw+ZuFL6gs3WZMGTVh3B9OH6/2kNz8t1Ng6PhZP0/Oot/xAqsAFiQCRX3LLMPKiAEG7a+fPvxp5TOR/soBjB0O70ZWtxBeTGitLqDtlvZ/R4fzRLCW9oCPePMKzXCu6uSk=
X-CR-MTA-TID: 64aa7808
Received: from Ld24e3f7fae45.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 1E2A583F-1B97-4C4E-B6F2-9782AACD1629.1;
	Tue, 21 Jan 2025 15:29:33 +0000
Received: from DU2PR03CU002.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id Ld24e3f7fae45.1
    (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
    Tue, 21 Jan 2025 15:29:33 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=B0NawfenYJ0CfaLtVN36E21bj3RELPIIFLut5+vL0kV3x/TlGMoHSwDuG7geGColXymREMLkW5EPHM3Z2y8+q97rb5ZnNMVffQo1e8grt82uaSL4yrhtV5H4szBvRKlY7E0qNQT2bsVq/YOYFh4pTz7E7PXdfuORjigQPM+hlJwEPkw8yPn7inKmWzh++MxueKqKTMziK5sTHRYfsfaiE1C6XeQJbWJQh5CyW+WNRtJaWNDY0fJp0m/qwrvrAw06TTcxG/uo+VwUK76zS9Gzdhh2Iu2s6kbigv9BxmArK1WhZwfdEqJfih2/lps5wWc5ZNSM936ksweVkAbgHpu5jQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QXZ2wWVYqZPXvfXSv5p6uH+ZOj0ZwRfO7SjyIboRs50=;
 b=H8Lfej+BOCgzoNANtlf51yFRNulHDYpyuUABkWDlvrn+QPAMIE/o+B7d7p2Hogb9K3kqUrNLdXsM1VSkiY2mMla5SETFXSeemV8K0BYL8+MztlaM4Szz2kKGionjMHzNopwdFBF8/7ZnLHmF8Mt81Ysu7wg+uA+Nzx0jhafFMT1p7SpxQfOPw+1K/ChbTExWN1/rrQ249I7HQsSp9+wxk81KoNkyzmCI53vpEojSgio6PIiJbtYvUq44Rs6dBgudR3VU1EPsvrxFIrzY6MCwImlKKtPBaHsGIZ5bLot8bySKhwTu8gN8LH3DpaiPF1Zh5wZl16EiffUt2C+GtP6I0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QXZ2wWVYqZPXvfXSv5p6uH+ZOj0ZwRfO7SjyIboRs50=;
 b=YhjJ8ScobYSfL1NRzLYJjTqo3RCX+HK0Zq8onMlVCFLYOFf6xIUSx/hD/C97pIIoIjbtzOkd8ZyR0o88WkwWt8AVre+OtKToUsDucFwMiQq9Lmsa2lcV04IFZzc01Q+GQkAza4UEiSc+gg4L6AaY6HMZKUGkoikKAzbiwKH9moM=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by VI1PR08MB5520.eurprd08.prod.outlook.com (2603:10a6:803:135::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.21; Tue, 21 Jan
 2025 15:29:32 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e%6]) with mapi id 15.20.8356.017; Tue, 21 Jan 2025
 15:29:32 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "gavrosc@yahoo.com" <gavrosc@yahoo.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, Yoann Congal
	<yoann.congal@smile.fr>
Subject: Re: [OE-core] [PATCH v4] sanity: test for c toolchain
Thread-Topic: [OE-core] [PATCH v4] sanity: test for c toolchain
Thread-Index: AQHba3QpyvWGJTHX6ECzptFOLvn/PrMhW5OA
Date: Tue, 21 Jan 2025 15:29:32 +0000
Message-ID: <2A1DD9F9-11BF-4A72-A96F-51F6FC93E5FF@arm.com>
References: <20250120194636.22297-1-gavrosc.ref@yahoo.com>
 <20250120194636.22297-1-gavrosc@yahoo.com>
In-Reply-To: <20250120194636.22297-1-gavrosc@yahoo.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3826.300.87.4.3)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|VI1PR08MB5520:EE_|AM3PEPF0000A78D:EE_|PR3PR08MB5817:EE_
X-MS-Office365-Filtering-Correlation-Id: 961271c5-6e32-4fb5-ca55-08dd3a306c1a
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|1800799024|366016|376014|38070700018;
X-Microsoft-Antispam-Message-Info-Original: 
 =?utf-8?B?blpqWG9HU0hUbmY0cnVPc3FPam1qMlFYdWw0NXZzSnBNa3UwNkJySWNpU2lo?=
 =?utf-8?B?OWEzOUNSaGJBNUdPVVNjRlpJa1Zyb2J2SzRFMGcvV3E2WSswemFYY3g0c29r?=
 =?utf-8?B?RnVZWCtaU1RxTWFLb240Zy9ESnZ1V0t0SXFkWVBzb213OHliV0xVVG15Vmto?=
 =?utf-8?B?VHg2NmNiZTg1L01uMXR2VFhSVkt2QVM3NTdoV2tlLzZKc2FFY1JxL0w5clVo?=
 =?utf-8?B?b3hDclVTa2ZtcTNTTERXS0ZEVXI3Qm9JTnlhYjI5OThIUW9Dc1RQMjd2WnpE?=
 =?utf-8?B?dVExWFhveTQvZVN3em9tL2lsT0tyQVBOVVQ0Tnh0MGRKSlZZVGpBaFhNQkJV?=
 =?utf-8?B?N2FGNUExbkFOTXZsN3A2VEZRMEF1Z3RQbTExWEI5eGZVeFBSQVVpcHAvLzZY?=
 =?utf-8?B?dkwzOFZaa2JUM0pCMlFOKzkxRjcvbGZ2ejViVHBQM3NyTnBpV2l5cGxRaXR0?=
 =?utf-8?B?Rk9pajE4MlJNL0Nrd0RVTGdFSjBYR0lJV2VyNmRueVp4c0l2a0VDMERHR0xU?=
 =?utf-8?B?eE5mNmZjR0JOekw1YmtsTEtES0E3V3JqMEorUE8xVGlwd3pBRS9ZR2loQWFw?=
 =?utf-8?B?MGtmeEloMUxpdSszR1g4UjhQMFVNaDVlQmhuVU85S2I3S01PVkdPQk85QmpG?=
 =?utf-8?B?b3cyVE15U05TMFJRM21KVE1zYUVNamJzZEhvU0tWSmdvKzI3dmlpQzNKRW8y?=
 =?utf-8?B?aDcvNmRFalhPWW54aU1XNGVva2NRb1VaUU1FTzlMNXNHVUJDQ1ZxMGtMK1dM?=
 =?utf-8?B?c2UvNUJkMjA3Q0dHYlJLTS9pd1RlMHhOK09Va1UzWlJOMjRGc0tFVm1SRlpn?=
 =?utf-8?B?SUkybDEvenpVOWxXdU1oV3NqYlpzOGlKSWV2MTByNUd1TjF4N1lPQU15dUY3?=
 =?utf-8?B?cWMxNTVheU15YmJVeVd2eXd6WkNzbXNZU3ByT1lidHZ2YmZ3aHFNd3FwZnlj?=
 =?utf-8?B?emtjVkpFUVREYlR3KzZORFlaTnRGYmRVaXJQRHlGc2RmaXp6RmFpQVhaenph?=
 =?utf-8?B?Tzg3S3A2OWdZYS83RmJ5R1c3dUl3MjJrQVhpNG10SFBTaENEanM5M1Jpb0RM?=
 =?utf-8?B?WlpPdGVWcjlSSG9hYmFhVkxTU3JjbW1xMFRNcTFJUXVQZG9YR3Y1VlkwMW9j?=
 =?utf-8?B?bjV6MzlNSTNIeHFHTVJ1MWxRWExZd010YVVNaU9OaHhHRUVncVNWR1VBQ1pU?=
 =?utf-8?B?M2s4bTNwOFRLbzdJeTNxUTY3b3FwV2R1T0hveXNsQWFkMmMyMW1yWjBZeUo2?=
 =?utf-8?B?T3U0SngyRHZDNitmK0xaUXQxd2dYanQ2bjJGT2dGOHhyZVBXTTNrVTFIOXl6?=
 =?utf-8?B?SnAzSTRqdzV1emEyT2p4VTZ4N1k5TnVYdzdUYVBxWWFENkMzRm83dnc4WFpD?=
 =?utf-8?B?U3FRc1FraUVKckI2ZkNrQWRNQlFVbXlvbUhUcXR0c214dTFRZVZxRTRhR1Vt?=
 =?utf-8?B?SnljS2pMZVFYWXVlRjh3OUdIQ3UxNzMrdDdhY3d5Q0g2OVpBemZzQkw3RHVR?=
 =?utf-8?B?UTJhTStBV242OTBpM0hTSXE1cDlVYmZvQzZ4RzJJanVCcTlWWldOcVY3WCsv?=
 =?utf-8?B?UUN3NUV1U0VVY0YvbXFZODFhZW9HS1ZqOWxzZ3NreWMyb2FyUGNpN2pCMXJS?=
 =?utf-8?B?SituMVNLUnhhanhjLzI5RlhXcDZIRXF6Z2dpNHRTL1MxTkd2dDREOXU2SW1G?=
 =?utf-8?B?ckpmK1dGcm1NcHdZS1BSUE9JWUovWUt5WEgwZWFEeCtEaU9kRS80RzZ3VW1W?=
 =?utf-8?B?L3VJblpDdUUzOEZ0RlZSWjZEN3pid2tUMk1wdHM2ZDcvSWhyOG9MY01aYWFB?=
 =?utf-8?B?cHp6SXdZNDdnR2JlRjdyR21NL3N6d1VCbmt3ZktoNmpXVlBXTFByaDAra1oy?=
 =?utf-8?B?L2lDVGhld2V0b3JhakxlZ0RJMVYrQWJFanVBdjU4ek5sdEcxdFkxNXdGdGNw?=
 =?utf-8?Q?g2ap9o046KIIW3AHCUlAHWcAnYv30Ryh?=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <8C0DED9325582C4B97BAF018399AB364@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB5520
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-SkipListedInternetSender: 
 ip=[2603:10a6:102:2a3::12];domain=PA4PR08MB7411.eurprd08.prod.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM3PEPF0000A78D.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	45542680-ec62-4633-e9ae-08dd3a306755
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|14060799003|36860700013|82310400026|35042699022;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?OEtyeVhEUFV6LzdzVVdubndaTWFVYU8xeUNOQVB4UG40eFFGT2F1VkpLdkVG?=
 =?utf-8?B?TWx1anQwTHN6Y2VMSnlRcDA3NnQ3dDQvU1VFczFhaUVGQU13RzV6azZwOXVY?=
 =?utf-8?B?ODlWSjFLekdQT1pwN25rZzVqM0IyaWtVcDlvL0haMTlaN0U0Tm5YbVpseE5E?=
 =?utf-8?B?WmJudlROcGJqT1luU2V0aFZwNXltblB5T0lRdDFGMEVQVFFNU2xNc04rb0d0?=
 =?utf-8?B?VnNEQU14QUZkeWx0RHE5OXRYeHJXdDlKNVpTeWdVV3h2K2I0M2I2TEk1U3lE?=
 =?utf-8?B?cWo0b2M4NzN4WGVrOUorb0I5QnkxbmRRSHdsblBvWkordkFrVC81VWZ1VTUv?=
 =?utf-8?B?cEpFVHNic1NEV0xHaEs3NVlycTUwajZULzg1cC9RNU03QlRxUDVUUjRESzd2?=
 =?utf-8?B?YVMzSHNyNVRFT2c4QzVjNDFwNzZxaWZyT3dTRDlDNXZpQll2QXhQdUxJeCtQ?=
 =?utf-8?B?SWRyei9tQ2taSUxsNjIvelNnN2JVNjlZWlM2NDdVamRwRmc5ZHh2Y3h1YlVP?=
 =?utf-8?B?Rlk1ZzVGUjA2YjhUZ3RzRXFLcVhYd1RoS2hqczdHdUFUVnd0SmhQemFEVnBG?=
 =?utf-8?B?UUhFeUZYNzZpSFVIWnJnendJV0tISW4rZ092cGVEM3dkRThIWmlSbTFVTjM4?=
 =?utf-8?B?aVRzSjNab0VpNTNVNDV6SlhoRmVOUWQxYkpBODduejhjRWlvcHBDYi9rb3dJ?=
 =?utf-8?B?TTFJOWFTRU5OellaU0ZyYTRQd2w2aWpLUDYyQ0d0RHFPOHdOZHpsWU9NU3h5?=
 =?utf-8?B?TXc3VGVOL2UwYnJrb1U4SkkzOEJLVWxxMDd4UElKWGNIRjlhQXZlMWNDZVdP?=
 =?utf-8?B?SUFNOEFJdlZ1T056b0VpQ0M1cW5KL3VkRTRQbkdNcVExWVlSSnRPYnN6WEoy?=
 =?utf-8?B?YzNRb1BTUDV2cU50YkZ0S2l3UjE4cGxCOUxNWW8zZ2NMTVZxWGhTWXlhcWZs?=
 =?utf-8?B?ak9sUFZQR2ZERWlKaDh1RnhHdW85NmNaa1BUVG5BbENJN1FMNHFpRUV1eTdn?=
 =?utf-8?B?YWtWanN1YmVya1hLSEE2SFAwVzhWSkF2aEloMkFzVDZ1RDlwaTlTdkZvTWtt?=
 =?utf-8?B?clIrbyt6eHRXazBIK0I5L3c0MFJpV2tRQk9PSUlnRDFwcXU3emUvRWFUZnFl?=
 =?utf-8?B?dGZTN1QvbUkyLy83Z3o5aTlPNDkzMEZsSnZSSkJrSXVncG14dG44MGZLZ2tU?=
 =?utf-8?B?aFhpK0tQWGJLR2JCdW50aVhmd2pvc3VNQnFpUHIvUlF1ZURaeWROdjQxMThV?=
 =?utf-8?B?MVRxdzh6WWVzTGJnWi92VklBUmF4YVNSRFUzUXFHeEtBWllSdGdXeXV4OEtj?=
 =?utf-8?B?Mmx3Y3A4V1Q4blVpZHUyZ0RoMktWb2pSYWJIOVh2TUtLc0VZMnlxQThUUUpm?=
 =?utf-8?B?YjJxNk5tak1MTFVQNmNBUGNMMlVxU2JrU2c3MHNDbkFFRGxTTG1iUGRzUENr?=
 =?utf-8?B?QkJaMVdmZ2FkMjBoNnJwcmhpSlNOSnR3aUFBZXJFWk14UHp4QXdTSFN2NS9F?=
 =?utf-8?B?aFpBSnRoUVNSbUwrVTQ1WkRIeUtWSmF1RCtNS1hubDF1TDIxU1FaRDh3Mks1?=
 =?utf-8?B?M0V1RTNzd3lkM0hTdGVrTEF6RHBlOVJlN3lqb3ZySVUxTzlSeWtxQS9Tcmwz?=
 =?utf-8?B?d1NTUzg2U28wSi9NM2kxeFZSWUlwUTVNbGNnUTdSVzNVaHBUTnVQRnlMczVw?=
 =?utf-8?B?aEo0ajlLSXhpUkdTUStjNERWL01oU0NmMWx0RVQzcHJ3TlVMdVYzNWtxbW9N?=
 =?utf-8?B?OUJZdklyKzFpZHdKMERtZUVxbm9UN25YQjVodHh0eEVIUTBhOS9lN2xVZmJP?=
 =?utf-8?B?MWpvTm5EblVrWFNWcHgyYU52UGc4RWVFTzZ3WVBGMk9sbUxXSWRIaFFwTjRu?=
 =?utf-8?B?eHVFamhDdHZuVkFwVjlOa21pQVdraXROVUpvRFpWZlBBT29EK3owRkNQVDF1?=
 =?utf-8?B?SXBaZWNJNzZET0ZNRk1BNzdkY3FTUkNhSGJaeVFQSXBHa1UzZTYrRkJmMnor?=
 =?utf-8?Q?YSoZYE2rm0Kiec1wBh6P027IOPExy4=3D?=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:64aa7808-outbound-1.mta.getcheckrecipient.com;CAT:NONE;SFS:(13230040)(1800799024)(376014)(14060799003)(36860700013)(82310400026)(35042699022);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jan 2025 15:29:40.1608
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 961271c5-6e32-4fb5-ca55-08dd3a306c1a
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM3PEPF0000A78D.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR08MB5817
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 21 Jan 2025 15:29:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210097

SGksDQoNClNvbWUgbW9yZSBjb21tZW50czoNCg0KVGhlIHNob3J0bG9nIHNheXMg4oCcQyB0b29s
Y2hhaW7igJ0gYnV0IHRoZSB0ZXN0IGlzIGZvciB0aGUgQysrIHRvb2xjaGFpbiBub3QgQywgY29y
cmVjdD8NCg0KPiArZGVmIGNoZWNrX2NfdG9vbGNoYWluKGQpOg0KDQo+ICsgICAgdHJ5Og0KPiAr
ICAgICAgICB3aXRoIE5hbWVkVGVtcG9yYXJ5RmlsZShkZWxldGU9RmFsc2UsIHN1ZmZpeD0iLmMi
KSBhcyBjX2ZpbGU6DQoNCldoeSBkZWxldGU9RmFsc2UgYW5kIHRoZW4gbWFudWFsIGNsZWFudXAg
bGF0ZXI/ICBZb3UgY2FuIG1vdmUgdGhlIGNvbXBpbGVyIGludm9jYXRpb24gdG8gaW5zaWRlIHRo
ZSB3aXRoIGFuZCB1c2UgY19maWxlLmZsdXNoKCkgdG8gd3JpdGUgdGhlIGR1bW15IGNvZGUgdG8g
ZGlzaywgb3IganVzdCBwYXNzIHRoZSBzb3VyY2UgdG8gdGhlIGNvbXBpbGVyIHRocm91Z2ggc3Rk
aW4gd2l0aCBzdWJwcm9jZXNzLnJ1bijigKYsIGlucHV0PWNfY29kZSkuDQoNCj4gKyAgICAgICAg
ICAgIGNfY29kZSA9ICIiIg0KPiArICAgICAgICAgICAgI2luY2x1ZGUgPHN0ZGlvLmg+DQo+ICsg
ICAgICAgICAgICBpbnQgbWFpbigpIHsNCj4gKyAgICAgICAgICAgICAgICBwcmludGYoXCJIZWxs
bywgV29ybGQhXFxuXCIpOw0KDQpObyBuZWVkIHRvIGVzY2FwZSB0aGUg4oCcIGluc2lkZSBhIOKA
nOKAneKAnS4NCg0KQXMgd2XigJlyZSBleHBsaWNpdGx5IHRlc3RpbmcgdGhlIEMrKyBsaW5rYWdl
IHRvIGxpYnN0ZGMrKywgd291bGQgaXQgYmUgc2FmZXIgdG8gYWN0dWFsbHkgY2FsbCBzb21ldGhp
bmcgZnJvbSBsaWJzdGRjKysgYW5kIGNhbGwgQlVJTERfQ1hYIGluc3RlYWQgb2YgQlVJTERfQ0M/
DQoNCj4gKyAgICAgICAgICAgICAgICByZXR1cm4gMDsNCj4gKyAgICAgICAgICAgIH0NCj4gKyAg
ICAgICAgICAgICIiIg0KPiArICAgICAgICAgICAgY19maWxlLndyaXRlKGNfY29kZS5lbmNvZGUo
J3V0Zi04JykpDQoNClNldCB0aGUgbW9kZSB3aGVuIHlvdSBvcGVuIHRoZSBmaWxlIHRvIHRleHQg
YW5kIHlvdSB3b27igJl0IG5lZWQgdG8gZW5jb2RlIG1hbnVhbGx5Lg0KDQo+ICsgICAgICAgICAg
ICBjX2ZpbGVfbmFtZSA9IGNfZmlsZS5uYW1lDQo+ICsNCj4gKyAgICAgICAgYnVpbGRfY2MgPSBk
LmdldFZhcignQlVJTERfQ0MnKS5zdHJpcCgpDQoNCkJVSUxEX0NDIGNvdWxkIGluY2x1ZGUgd2hp
dGVzcGFjZSwgc28geW91IHNob3VsZCB1c2Ugc2hsZXguc3BsaXQoKSB0byB0dXJuIHRoZSBjb21t
YW5kIGludG8gYSBsaXN0IG9mIHRva2VucyBpZiB5b3Ugd2FudCB0byBwYXNzIGEgbGlzdCB0byBy
dW4oKS4NCg0KPiArICAgICAgICBvdXRwdXRfYmluYXJ5ID0gY19maWxlX25hbWUgKyAiLm91dCIN
Cj4gKyAgICAgICAgY29tcGlsZV9jb21tYW5kID0gW2J1aWxkX2NjLCBjX2ZpbGVfbmFtZSwgJy1v
Jywgb3V0cHV0X2JpbmFyeSwnLWxzdGRjKysnXQ0KPiArICAgICAgICByZXN1bHQgPSBzdWJwcm9j
ZXNzLnJ1bihjb21waWxlX2NvbW1hbmQsIHN0ZG91dD1zdWJwcm9jZXNzLlBJUEUsIHN0ZGVycj1z
dWJwcm9jZXNzLlBJUEUpDQo+ICsNCj4gKyAgICAgICAgaWYgcmVzdWx0LnJldHVybmNvZGUgPT0g
MDoNCj4gKyAgICAgICAgICAgIHJldHVybiBOb25lDQo+ICsgICAgICAgIGVsc2U6DQo+ICsgICAg
ICAgICAgICByZXR1cm4gZiJDIHRvb2xjaGFpbiBjaGVjayBmYWlsZWQgdG8gbGluayBhZ2FpbnN0
IGxpYnN0ZGMrKy4gUGxlYXNlIGVuc3VyZSBsaWJzdGRjKysgYW5kIGhlYWRlcnMgYXJlIGluc3Rh
bGxlZC4gRXJyb3I6XG57cmVzdWx0LnN0ZGVyci5kZWNvZGUoKX0iDQo+ICsgICAgZXhjZXB0IEV4
Y2VwdGlvbiBhcyBlOg0KPiArICAgICAgICByZXR1cm4gZiJBbiB1bmV4cGVjdGVkIGlzc3VlIG9j
Y3VycmVkIGR1cmluZyB0aGUgQyB0b29sY2hhaW4gY2hlY2s6IHtzdHIoZSl9Ig0KPiArICAgIGZp
bmFsbHk6DQo+ICsgICAgICAgIGlmIGNfZmlsZV9uYW1lIGFuZCBvcy5wYXRoLmV4aXN0cyhjX2Zp
bGVfbmFtZSk6DQo+ICsgICAgICAgICAgICBvcy5yZW1vdmUoY19maWxlX25hbWUpDQo+ICsgICAg
ICAgIGlmIG91dHB1dF9iaW5hcnkgYW5kIG9zLnBhdGguZXhpc3RzKG91dHB1dF9iaW5hcnkpOg0K
PiArICAgICAgICAgICAgb3MucmVtb3ZlKG91dHB1dF9iaW5hcnkpDQoNClRoZXJl4oCZcyBhIG5l
YXRlciB3YXkgb2YgZG9pbmcgdGhpcyBieSByZWFkaW5nIHNvdXJjZSBjb2RlIGZyb20gc3RkaW4g
YW5kIHdyaXRpbmcgdG8gL2Rldi9udWxsLCBzbyB0aGVyZeKAmXMgbm8gY2xlYW51cCB0byBkby4g
U29tZXRoaW5nIGxpa2UgdGhpcyBlbnRpcmVseSB1bnRlc3RlZCBjb2RlOg0KDQpjX2NvZGUgPSDi
gJzigKbigJ0NCmNtZCA9IHNobGV4LnNwbGl0KGQuZ2V0VmFyKOKAnEJVSUxEX0NYWOKAnSkpICsg
W+KAnC3igJwsIOKAnC1v4oCdLCDigJwvZGV2L251bGzigJ0sIOKAnC1sc3RkYysr4oCdXSkNCnRy
eToNCiAgc3VicHJvY2Vzcy5ydW4oY21kLCBpbnB1dD1jX2NvZGUsIGNhcHR1cmVfb3V0cHV0PVRy
dWUsIHRleHQ9VHJ1ZSwgY2hlY2s9VHJ1ZSkNCiAgcmV0dXJuIE5vbmUNCmV4Y2VwdCBzdWJwcm9j
ZXNzLkNhbGxlZFByb2Nlc3NFcnJvcjoNCiAgcmV0dXJuIGYiQW4gdW5leHBlY3RlZCBpc3N1ZSBv
Y2N1cnJlZCBkdXJpbmcgdGhlIEMgdG9vbGNoYWluIGNoZWNrOiB7c3RyKGUpfeKAnQ0KDQpDaGVl
cnMsDQpSb3Nz

