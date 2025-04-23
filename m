Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47CC3C369CB
	for <webhook@archiver.kernel.org>; Wed, 23 Apr 2025 10:41:06 +0000 (UTC)
Received: from EUR03-AM7-obe.outbound.protection.outlook.com (EUR03-AM7-obe.outbound.protection.outlook.com [40.107.105.48])
 by mx.groups.io with SMTP id smtpd.web10.5233.1745404864602037086
 for <openembedded-core@lists.openembedded.org>;
 Wed, 23 Apr 2025 03:41:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=OyCcbMWF;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=OyCcbMWF;
 spf=pass (domain: arm.com, ip: 40.107.105.48, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=N6FG1LLWm885uX7mRiazpGC6Rf2iGYxwV2HnbzJa6B+ky3YLRlBKofqy4NmFPjUXbjpkeY2nu1hwQzl9nY3dxEv9Qr8DqYgdjj/fzv6X4f/3AdtKg3CLsNgbTOB7W+8WnAEv8Xmj3Zo+agFT+vwwQJlHuz1Ks6e/Atp658ByYrchkiggb4js2QDRyE5VBJJd8X/Fgnz8D+FTwtqn7LXBj81i0k/K5jBYA/y/nKpZOxhzVBjnQts+vAwuL9NdbhfKYDUHpYti34fnOogcC8MBqRTbvZ2v5SU8evU+wUGWnom0bjPbxC6poSKSSPzexiWitiR7HoHvg0UtqrhfOE0+HA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=V5M8rqA7kEKHpo3Il1Krabs+iSCuc/nzMH7mXCb6gL8=;
 b=re2FIi1lhvAEThirRcrZziCJ4+ERKT3+Scxk5i6L5621e7AqrPl915QtG7zIZoIW1tVvpah3mtgCaPazIvmr4mIkP/TmE8nrZbP4fS2F/HO4VnD7weY77nfGxRDGu8viWIgzTlZiWpUvCeg3wAY4Hq38fkp931R+bsUTaYvTnVx++vcwR0eXgQU0ipE1qYN6eIUXsmR7VLWENny0mldyB/8+CalxMM46MUBHNJaWrpjqWVQ1Spt3jREj/GJ9tgvSGkdChNaS7NPiVl3ObFLmhWwXu55Xb7oJgnRAORM/S4ESQY5aE8sNaHYAlMRHu9Hebu8YjrmqL6JslaFzHWTbsw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=linaro.org smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V5M8rqA7kEKHpo3Il1Krabs+iSCuc/nzMH7mXCb6gL8=;
 b=OyCcbMWFJIYj/M61tTg1qMHEBpdG+ZU3FS1vOpBPnaiNx+DynH1bvHVcVpUN2Akv/eMiIyKvStle9BS2gqc+Q8pKbgKRxZdQ5W9qwNA0czXLr86TaviWCk3z8JPHFBChI7leqpqqC6eQ434EKamoH5wW/+Kz6AZfoLKGaeLc3LU=
Received: from DUZPR01CA0334.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b8::25) by AS8PR08MB8660.eurprd08.prod.outlook.com
 (2603:10a6:20b:562::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.23; Wed, 23 Apr
 2025 10:41:01 +0000
Received: from DU2PEPF00028D10.eurprd03.prod.outlook.com
 (2603:10a6:10:4b8:cafe::db) by DUZPR01CA0334.outlook.office365.com
 (2603:10a6:10:4b8::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.36 via Frontend Transport; Wed,
 23 Apr 2025 10:41:06 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DU2PEPF00028D10.mail.protection.outlook.com (10.167.242.24) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.12
 via Frontend Transport; Wed, 23 Apr 2025 10:41:00 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GEhe3PEGprlBmR2xwuKHCj4E9hxhKB8sm5AaEtC0M0x0ZeyKeAErtp3Hi5rXADEY5qr+7+AOZgFWzKmU5sUGcJI6A/wpEhPcob7sChplOTFCwpPvY2neNI+iWLjuii2pu73Qr2OXRF+8mAtYgABx3M2kFVOtUW2KVpbFJzicdBSr04r6vJ34YzgJuokU20PUcVv7C2GRrJuuwJOUEk/n1lqYhKb0V0x5DUhT2z4lqxbrpkgRzuzYDmjJHGgHJ3Yp/rUKVbdVKGtDZsGmG944J+B2iMyZpEin6jMZBhSbCAZMGRY8K3S1IKXknOR66H7V1KiDmWVhx43Rhgkkjo0rkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=V5M8rqA7kEKHpo3Il1Krabs+iSCuc/nzMH7mXCb6gL8=;
 b=KN5DPH8evX+5ZjNxuKoaJkC3kZb31CKfS3bwJjPXQDNq81KE7WqnCKQMr5wsgAFT3xr/T1FSF7OlIMuKIGWgMJd4EJ6Jbhias0RakFJpmXOwTpN40TybXXal+rUd08i80sv8p+PFVx6Dc4OUEWjJHg9oJ135yI+MiwMF656v0zBqHFKiIFWjfBU9u2N4shelDaVad3ukGSUuc1gtf/Vi7FS7TnWq+uVqN3NKMvh4D4zmUaw83B/JcDXESA9Pmt5AdauiRDmXZdvzNFv/YCNaPWB8uEp5UkuGoPsTVhuV8DFqjsEPSivKEWwnxJqvtZUxLMcOzLkC7J6CGImKIXfmvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V5M8rqA7kEKHpo3Il1Krabs+iSCuc/nzMH7mXCb6gL8=;
 b=OyCcbMWFJIYj/M61tTg1qMHEBpdG+ZU3FS1vOpBPnaiNx+DynH1bvHVcVpUN2Akv/eMiIyKvStle9BS2gqc+Q8pKbgKRxZdQ5W9qwNA0czXLr86TaviWCk3z8JPHFBChI7leqpqqC6eQ434EKamoH5wW/+Kz6AZfoLKGaeLc3LU=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by DB4PR08MB9190.eurprd08.prod.outlook.com (2603:10a6:10:3fd::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.35; Wed, 23 Apr
 2025 10:40:28 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e%3]) with mapi id 15.20.8655.033; Wed, 23 Apr 2025
 10:40:27 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: Mikko Rapeli <mikko.rapeli@linaro.org>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, "Bill Mills
 (bill.mills@linaro.org)" <bill.mills@linaro.org>
Subject: Re: [PATCH RFC walnascar 1/3] systemd: enable getty generator by
 default
Thread-Topic: [PATCH RFC walnascar 1/3] systemd: enable getty generator by
 default
Thread-Index: AQHbtDkj/GlAhzwPxkec9G2dXxB03rOxD8KA
Date: Wed, 23 Apr 2025 10:40:27 +0000
Message-ID: <2D1A1380-E911-4885-9889-AB6506606A5D@arm.com>
References: <20250422190053.3244331-1-ross.burton@arm.com>
 <aAi-kEIeR6mMYBBF@nuoska>
In-Reply-To: <aAi-kEIeR6mMYBBF@nuoska>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3826.500.181.1.5)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-mailer: Apple Mail (2.3826.500.181.1.5)
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|DB4PR08MB9190:EE_|DU2PEPF00028D10:EE_|AS8PR08MB8660:EE_
X-MS-Office365-Filtering-Correlation-Id: f6267871-e909-457a-0c7a-08dd825356f6
X-LD-Processed: f34e5979-57d9-4aaa-ad4d-b122a662184d,ExtAddr,ExtAddr
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|376014|366016|1800799024|13003099007|38070700018;
X-Microsoft-Antispam-Message-Info-Original: 
 =?utf-8?B?dWxGNEhjUlhCK2xzQTBHSFNZUjlzU05JNFlienIrdVVQdWJoZGJvR2dmK0U1?=
 =?utf-8?B?aTA0dm1Kb1kwcjZVdHMvY096dHgzZGNkaTNKbnovVitRVTVNVm5rQzUyNk5u?=
 =?utf-8?B?MGdVczRoUEQzTjF6SU0wbmFibmQrNmt3THo0aCtoMlhhd2FabWNsNVF1Zyt1?=
 =?utf-8?B?MnNPSzlXeS80TldsT3dtdFViN3hvVG9kTE9xbmpLSDlNaG9QTlMyRFhpUWVT?=
 =?utf-8?B?YlQwWUpLYm80b0QxTHA3U2IrYktVbGFLc2hwNklwYW8xM3A1b3NpK1kyQ3ZY?=
 =?utf-8?B?UEQ2QnJjYXg1dithYjNxbHZ1eEFITFdNNGhmWWc3V3B6M3RJUWNXTVcwY0NU?=
 =?utf-8?B?SGhiam1ZMjBmaW5vUXdzVU5vUE9EdGxjL2dyY0lRR3VyczdGdU9uWGN4YnJm?=
 =?utf-8?B?TlV3TS9nU1QxZ242OGN2dWc0d3dUVkp4TUpMaWo1ZFp0ZVRBcFNoVllzWUZX?=
 =?utf-8?B?TjY2TmVLeGZ1dTB2VFZSUW5WOWxzWXZQeG1CSXlJQUVBbHlGazZOeVVrb0Yz?=
 =?utf-8?B?aDNjclFmaTc5K1AxRTFyWFAyNXFVV0UzeWhyaVpQY00rUXJSeE1kZ1Yxem8z?=
 =?utf-8?B?cjZyM3FBaHQ1N0dqRHZoVHhvcm9Wc3B5VXlXbEJOVzd1OHduZ0ZlTnBVWjNU?=
 =?utf-8?B?WlFqMjJjbHNRUEk1SThtN2s2bHdzeENpNllzU0ZXMXJHNStoRk8xUFZ3QzVG?=
 =?utf-8?B?aldkNnc1MlV0SlVBdnUwRVRPYnlIMVY3TUQ0YjRPQXZxQmlUUTlycEYyZjdx?=
 =?utf-8?B?cVEwTkEzNWRCWm1YMDNVQlNTTnY3cGc5Z3YrbUZtaWxkUWVIdlgybU5EQ1BF?=
 =?utf-8?B?cE45NlhGK3BjMnYvNUUrY2dSRGJqc0RvUzdYbGkva2E2d0pFS0V4b2xkUmVT?=
 =?utf-8?B?R0pQVFd2RzYyM1NaTG1LWGJoNjJSamlZL0xnRllqV3YrRy9ZM0RIZlJDdlpP?=
 =?utf-8?B?M2JXNE9wNnRSWUx0a0JJYnoyWkNWK0E5MkViLzhEeC9kbk1wek9lNzFCOFg0?=
 =?utf-8?B?ZTNubmhPVjdmd3VEK0ErQTVRaTZLUEQ4aksvNE5FZ2N1L0pTSk1jNm9hKzZm?=
 =?utf-8?B?UFBHNm5wQk90aFBBbW1kTE9XWng1elNVMkp5d1V2UUltU2kwd2poZy9JZE1H?=
 =?utf-8?B?eHppN2NTb1Fkck4yMGRuNktSQTQxa05qOE9TSUpYRXM1ZElhRG1VMWtOeXRH?=
 =?utf-8?B?bUJIRjdmYzdQVS96MG5TL1M3RlJMZ001NmdYVkJYTmFmUlUwREc3SHFZMG40?=
 =?utf-8?B?Q2wwWTBEQmtyZDVBN3VlQ2s2TUU5WUJzZFVLVWhUT2plalorTEsrREt1eGlM?=
 =?utf-8?B?dlRoOHArdEk2RWczc1FRaktpakhPTmtsTW1zUXhvMUN5KzJQMnd5dTYzVnZo?=
 =?utf-8?B?SkxqUVdiL2lmbEkzeStlRTF3S0oyblM0RkRTQUlGalZXeGNkbFUzbE5ocEY3?=
 =?utf-8?B?b0VRQ000eUVUVzBjYUlsa2VuQWFyYkIrcThUYkZXOS80SFl0RnBmQ1dub3JC?=
 =?utf-8?B?UTNJZzQ0T0ZSaXFKL29rd2xNd3F6bXdreVRoTzk3ZElEdjhYNm5saURPRGpr?=
 =?utf-8?B?YXBucEtWbmhNV3lMVnV4d1hpTVhjWm1ZZnBmR2VXRjVEa1RFcjI4SVUzUzNK?=
 =?utf-8?B?QnlVUUo5S2RDNzFvRzY3YjFjVVY3TXN2NFdRQktQMnZTQjZTbnFHaUdIUVJm?=
 =?utf-8?B?OUFSbm5MRDJ0MnA1YmRUNE5CZkpEaUtnWmltZEl0WTJuQ0tpNllNQWoybEZv?=
 =?utf-8?B?T21FZmU3bXp1dDN0WGRnRFhTcVBIYjFGeTFFNFRVTzdjemRKcW1TYTV5Wi9E?=
 =?utf-8?B?UXRsTXp5clM2T3FFb050MjhodFBSMFNXZ3ZPWml6NDdxQmZuZnhIVmpBdHJF?=
 =?utf-8?B?cFNCdmVoOFhCdEhTVHlkV3Zrc1Z0U05pTDhZOVQ0NUg1Vjg5U3QySGNYSHFu?=
 =?utf-8?Q?iIXr9wpFkeM=3D?=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(13003099007)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <46AD0B36F60F5141925D8D2AD6C952D0@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB4PR08MB9190
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DU2PEPF00028D10.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	876be97e-58f6-4f14-4d16-08dd8253433f
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|82310400026|35042699022|14060799003|1800799024|36860700013|7053199007|13003099007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?eWw1NUE4UHdCUllPTUpqNUJXa1hqMGtsWExrdlpaT3dwV1Q1T0V4NE9rZTBT?=
 =?utf-8?B?MnRsTzRyblpBc1hlWFM0M0I1YU04ek94NEtrWXRjSWZ0V1dtR0xNcFVYYXQy?=
 =?utf-8?B?TDZWU0doUmtVSGpaTnpUMGs1VW5EKzlLVFFNSEpWSzd6ZHdJSkFBbkR4VTRE?=
 =?utf-8?B?aFF6L2tWckl1b1p1bU1JVFZSNngrejlyTXdndTF3dGpuNWJKZWQ4QStxNVhD?=
 =?utf-8?B?YmxhellNNTUyTFFiaTBLbFloemdXTGxDRkhKUFpiVThINDUxK0JVVVhPSmcr?=
 =?utf-8?B?a3FpS3kwM09EOXRMWmtxRVdMd3ZxSzNOSGtwSmJNN3dSYVVyelM2Vm9DM2cv?=
 =?utf-8?B?NU1MbjMvTElCZzFheStiSGE5MTRIbnhTL0YyV0gwUi96ck11Qk5FZzVYZDBT?=
 =?utf-8?B?bHkwaWMycm03QVdjdkxob05KVGZBTkpKcnlhSVA3OUZ5cVBiMGlzWlFmNUsy?=
 =?utf-8?B?Rk1iOWxhTENZS3M2NVZQcDkyQzNEanNJd2dGa3JFYWw0NGh6MkRFZk5qblht?=
 =?utf-8?B?MWtlVWhJNjZMaFNDZ3pLaXU0OG1GdW53aWFDMXFMOHFuV2QyTVlFTHFPWFNs?=
 =?utf-8?B?bzJwYUlaNmRCL1VuUnBhY01SbEx1eGZOS1lTZDdzUENCYS9Hc3o0dmV2ZFdm?=
 =?utf-8?B?L1JuNFlHMGQxaFZwdklRTzl2Z09aZ1MzUlA3WmZHTFFRSXd2RTRkalV6UW1H?=
 =?utf-8?B?NHR6NGZmaGViUlFZRVZkMk5kTjlGcXhIRG9OdGQ3QUkzMlczOUpjb2orYUxr?=
 =?utf-8?B?VjZjN1JIKytva0E2M3plZm02MXYyVjFhdW80TnNqNkt4N0p5aFVHVEh4QzVm?=
 =?utf-8?B?cHp4TnhlTWtrcnhadXBkV3VMOU9qYitGaENpNWtKOEYzeUExc2o1OXc0UWhm?=
 =?utf-8?B?SVVmRUFsOXNPMzF4R2w2bmE3S2JDTm9UaDVXejdnNThoVHBRdXNubW5HVUV0?=
 =?utf-8?B?djVNVmtNU3M4Ni9LZHBuRE1aOVdRTDNXbjdNUUVpR1RKUlkvNk9uaCtTQ1hY?=
 =?utf-8?B?TnRXa282R3hTZ3YwRm5PWjczdmo2RlV5V1dSZlQ2eS93bU8rL2pHcWZUVHRU?=
 =?utf-8?B?TEVlUGVOcnVneGl3TjhYVmJSNnlEOW8wNC96S1RPNzNVUVhVaFkyTnkrTHRX?=
 =?utf-8?B?dTQxdlhpZGg3QWlMM0EvVVpZaVVZUXl1cTIwUitJVGRoT29ON1JCeGpsaFBI?=
 =?utf-8?B?TzJIK0EzRWJxVWoxSUs0Y05RWjB4VXNldVlaazZnbnVGRHBlWmFhbDA3b01E?=
 =?utf-8?B?M1RLc00rNXF3aUJGMUV6ME1OaEI2WW11eUpseFBFSjZSa0R5ek9nNkJyREdF?=
 =?utf-8?B?alh4VVNTTGxEblIxdFRESTdUZU45K2gvMGx4eTgwVkg0RFM2NGNNekhGdkhq?=
 =?utf-8?B?aDhESmdpcDVqK1krMEpZMEJLT2c2aHpKSVpkWVNHVjdWY2ZGOVZxZEpsU2p6?=
 =?utf-8?B?ci9aS3NrTE5vNk9FNjlIQk90bExRR0piRml6emZHYmF2K25pWGFyM2NwNXRX?=
 =?utf-8?B?Y2lqcGxKamxreTRUYUV1clo5cFQvWVIveHpucC9jaUdWS0lPSWI2T0s3TUN6?=
 =?utf-8?B?UGdCQnhFbm1qU2JJcFBsNlNReU9ZdzlMRkRaUk54RDdMcW9RcHRvc1hVRlE2?=
 =?utf-8?B?U2JBd0k1RGdQQ29nMUZlMzFBWit0V3dxdnRZZlhRL3RuR1hlY2hxaFRqWEx1?=
 =?utf-8?B?cWpsUnhpRms1NHdvdkdTOCs2cXZUUmF2QTBCdlowaUc0QnU2cGdYUkVJeUhS?=
 =?utf-8?B?eExGUVpiMkJIRGNaSDExc1h6WXRDYVdKUjkyWDlVQTIzY2sxbmJHZ21FbGtM?=
 =?utf-8?B?cXBIYkxXclVWc3JEYWQ1bTdTdEFKaUtFRWVlM2pBaUVhbWFkUEc0bktxQjA0?=
 =?utf-8?B?MUh5cERyU252eWdScG4vZStlY2pLc3h2R1BLOUF0aHptdTljOGc1cFhLeUxN?=
 =?utf-8?B?c0haQ2ZaYng5RG5mMG5JUjZBUkNHM3dwcm5CYXpacHRUdHBLRzN2bEVJS0dI?=
 =?utf-8?B?NEpyQkRLYlpRPT0=?=
X-Forefront-Antispam-Report: 
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(35042699022)(14060799003)(1800799024)(36860700013)(7053199007)(13003099007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Apr 2025 10:41:00.8246
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f6267871-e909-457a-0c7a-08dd825356f6
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DU2PEPF00028D10.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB8660
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 23 Apr 2025 10:41:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215278

T24gMjMgQXByIDIwMjUsIGF0IDExOjE4LCBNaWtrbyBSYXBlbGkgPG1pa2tvLnJhcGVsaUBsaW5h
cm8ub3JnPiB3cm90ZToNCj4+IFJlc3RvcmUgdGhlIGV4aXN0aW5nIGJlaGF2aW91ciBieSBleHBs
aWNpdGx5IGVuYWJsaW5nIHRoZSBzZXJpYWwgZ2V0dHkNCj4+IGdlbmVyYXRvcjogdGhpcyBtZWFu
cyB0aGF0IHN5c3RlbWQgd2lsbCBhdXRvbWF0aWNhbGx5IGJyaW5nIHVwIGEgZ2V0dHkNCj4+IG9u
IHRoZSBmaXJzdCBzZXJpYWwgY29uc29sZSBpdCBmaW5kcy4NCj4gDQo+IElzIHRoZXJlIGEgbmVl
ZCB0byBiZSBiYWNrd2FyZHMgY29tcGF0aWJsZSB0aGlzIG11Y2g/IE1hbnkgdGhpbmdzIG1heSBi
cmVhaw0KPiBvciBnZXQgcmVmYWN0b3JlZCBvbiBtYXN0ZXIgYnJhbmNoIGJldHdlZW4gcmVsZWFz
ZXMgYW5kIHRoaXMgaXMganVzdCBvbmUgb2YgdGhlbS4NCg0KWWVzLCBiZWNhdXNlIHRoaXMgaXMg
dGhlIGJlaGF2aW91ciB0aGF0IGJvdGggZml4ZXMgdGhlIEtWMjYwIGlzc3VlIGFuZCBhbHNvIGRv
ZXNu4oCZdCBicmVhayBhbGwgb2YgdGhlIHNlbGZ0ZXN0cyBkdWUgdG8gaG93IHRlc3RpbWFnZStx
ZW11IGludGVyYWN0Lg0KDQo+IFRoZW4gd2l0aCB0aGVzZSBwYXRjaGVzIHRoZXJlIHN0aWxsIGlz
IHRoZSBidWcvaXNzdWUgc2VlbiBpbiBwcmV2aW91cyBzdGF0ZSB0b28NCj4gd2hlcmUgc3lzdGVt
ZCB0cmllcyB0byBzdGFydCBhZ2V0dHkgb24gYWxsIFNFUklBTF9DT05TT0xFUyBkZWZpbmVkDQo+
IGF0IGJ1aWxkIHRpbWUgd2hpY2ggc2xvd3MgZG93biBib290IHRvICJydW5uaW5nIiBvciAiZGVn
cmFkZWQiIHN0YXRlDQo+IGJ5IG1vcmUgdGhhbiBvbmUgbWludXRlLiBUaGlzIGhhcHBlbnMgYWxz
byBvbiBxZW11IHdoZXJlIGNvcmUtaW1hZ2UtYmFzZQ0KPiAoSSd2ZSBhZGRlZCBzeXN0ZW1kLWFu
YWx5emUgd2l0aCBkZXBlbmRlbmNpZXMgdGhlcmUgdG8gbWVhc3VyZSB0aGVzZSk6DQoNClllcy4g
IEFzIEkgc2FpZCwgdGhlIHByb3BlciBzb2x1dGlvbiBoZXJlIGlzIHRvIGFjdHVhbGx5IHByb2Jl
IHRoZSBzZXR1cC4gIE9uY2Ugd2XigJl2ZSBnb3Qgd2FsbmFzY2FyIG91dCBvZiB0aGUgd2F5IEni
gJlsbCBmaW5pc2ggbXkgYnJhbmNoIHRoYXQgZG9lcyB0aGUgc2FtZSBzeXN0ZW0gaW5zcGVjdGlv
biBmb3Igc3lzdmluaXQgc28gd2UgZG9u4oCZdCBuZWVkIHRvIGhhcmRjb2RlIFNFUklBTF9DT05T
T0xFUywgaW5zdGVhZCBpdCB3aWxsIGJyaW5nIHVwIGEgY29uc29sZSBvbiB0aGUgZmlyc3QgdHR5
IGl0IGNhbiBmaW5kLiAgVGhhdCBpcyBsaWtlbHkgdG8gY2F1c2UgcHJvYmxlbXMgd2l0aCB0ZXN0
aW1hZ2UgKGFzIGl0IGhvb2tzIHVwIGEgc2Vjb25kIHR0eSBmb3IgZmFpbHVyZXMpIGJ1dCB3aWxs
IGJlIGlzb2xhdGVkIHRvIGdlbmVyaWNhcm02NCBhbmQgbm90IGV2ZXJ5IHFlbXUgbWFjaGluZS4N
Cg0KPiBUaHVzIEkgdGhpbmsgdGhpcyBicmVha2luZyBjaGFuZ2UgaXMgZmluZSBmb3IgbWFzdGVy
IGJyYW5jaCBhbmQgdXBjb21pbmcNCj4gcmVsZWFzZSBhbmQgdGhhdCBhbnlvbmUgZXhwZWN0aW5n
IGRpZmZlcmVudCwgbW9yZSByb2J1c3QgYmVoYXZpb3Igc2hvdWxkIGp1c3QgdXNlDQo+IHRoZSBz
eXN0ZW1kIGFnZXR0eSBnZW5lcmF0b3IuDQo+IA0KQWJzb2x1dGVseS4NCg0KPiBGb3IgZ2VuZXJp
Y2FybTY0IEkgdGhpbmsgaHR0cHM6Ly9saXN0cy55b2N0b3Byb2plY3Qub3JnL2cvcG9reS9tZXNz
YWdlLzEzNTkyDQo+IGlzIHRoZSB3YXkgdG8gZ28gdG8gZml4IGJvdGggY29tcGxldGVseSBtaXNz
aW5nIGFnZXR0eQ0KPiBodHRwczovL2J1Z3ppbGxhLnlvY3RvcHJvamVjdC5vcmcvc2hvd19idWcu
Y2dpP2lkPTE1ODMwDQo+IGFuZCB0aGUgc2xvdyBib290IHRpbWUuIEJvdGggdGhpcyBzZXJpZXMg
YW5kDQo+IGh0dHBzOi8vbGlzdHMueW9jdG9wcm9qZWN0Lm9yZy9nL3Bva3kvbWVzc2FnZS8xMzU5
MiBhcHBsaWVkIGRvZXMgbm90DQo+IHNlZW0gdG8gd29yayBzaW5jZSBTRVJJQUxfQ09OU09MRVMg
aXMgbm93IHVzZWQgYWxsIHRoZSB0aW1lLCBzbyBkZWxheWVkDQo+IGJvb3QgaXNzdWUgcmVtYWlu
cyB1bmZpeGVkLg0KDQpNYWtpbmcgc3lzdGVtZCBtYWNoaW5lLXNwZWNpZmljIHdvdWxkIGJlIGRp
c2FzdHJvdXMgZm9yIHJlYnVpbGRzIGFzIGl0IGlzIHRoZSBwcm92aWRlciBvZiBsaWJ1ZGV2IGFu
ZCBsaWJzeXN0ZW1kLCBzbyB3b3VsZCBtZWFuIHRoYXQgX2V2ZXJ5XyByZWNpcGUgdGhhdCB1c2Vz
IHRob3NlIGlzIGFsc28gbm93IG1hY2hpbmUtc3BlY2lmaWMuDQoNCkFzIHdhcyBkaXNjdXNzZWQg
aW4gdGhlIFR1ZXNkYXkgdGVjaCBjYWxsIGxhc3Qgd2VlaywgSSBzdXNwZWN0IGEgYmV0dGVyIHNv
bHV0aW9uIHdvdWxkIGJlIHRvIGhhdmUgYSBtYWNoaW5lLXNwZWNpZmljIGNvbmZpZ3VyYXRpb24g
cmVjaXBlIHRoYXQgY2FuIGRyb3AgaW4gY29uZmlndXJhdGlvbiBmaWxlcywgbWFzayBvciBlbmFi
bGUgdW5pdHMsIGV0Yy4gIFRoaXMgd2F5IHNwZWNpZmljIG1hY2hpbmVzIGNhbiBjb25maWd1cmUg
c3lzdGVtZCBpbiBzcGVjaWZpYyB3YXlzLCB3aXRob3V0IGFjdHVhbGx5IHRvdWNoaW5nIHRoZSBj
b3JlIHJlY2lwZS4NCg0KQWx0ZXJuYXRpdmVseSwgc3BsaXR0aW5nIHN5c3RlbWQgaW50byDigJh1
c2Vyc3BhY2XigJkgYW5kIOKAmXN5c3RlbeKAmSByZWNpcGVzIHdoZXJlIHRoZSBmb3JtZXIgaXMg
dHVuZS1zcGVjaWZpYyBhbmQgY29udGFpbnMgdGhlIHVzZXJzcGFjZS1mYWNpbmcgbGlicmFyaWVz
IGFuZCB0aGUgbGF0dGVyIGlzIG1hY2hpbmUgc3BlY2lmaWMgYW5kIGV2ZXJ5dGhpbmcgZWxzZSBj
b3VsZCBtYWtlIHNlbnNlLg0KDQpSb3Nz

