Return-Path: <tgaige.opensource@witekio.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50575CD4F3C
	for <webhook@archiver.kernel.org>; Tue, 19 May 2026 14:20:41 +0000 (UTC)
Received: from mx-relay05-hz12-if1.hornetsecurity.com (mx-relay05-hz12-if1.hornetsecurity.com [94.100.139.205])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.22733.1779200434516459345
 for <openembedded-core@lists.openembedded.org>;
 Tue, 19 May 2026 07:20:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@witekio.com header.s=selector1 header.b=MoLtRYov;
 spf=permerror, err=parse error for token &{10 18 spf.hornetsecurity.com}: limit exceeded (domain: witekio.com, ip: 94.100.139.205, mailfrom: tgaige@witekio.com)
ARC-Authentication-Results: i=2; mx-gate05-hz12.hornetsecurity.com 1;
 spf=pass reason=mailfrom (ip=40.107.162.102, headerfrom=witekio.com)
 smtp.mailfrom=witekio.com
 smtp.helo=pa4pr04cu001.outbound.protection.outlook.com; dkim=pass
 header.d=witekio.com header.s=selector1 header.a=rsa-sha256; dmarc=pass
 header.from=witekio.com orig.disposition=pass
ARC-Message-Signature: a=rsa-sha256;
 bh=nmo5XFl33FuqSlE8jtAV/TF/ixfcI8vCOW5yP9T4pMo=; c=relaxed/relaxed;
 d=hornetsecurity.com; h=from:to:date:subject:mime-version:; i=2; s=hse1;
 t=1779200431;
 b=MZSQSaPc2OZ+5ZnF/ORHIg8aaZ18ZJ9Gm9PUzlTy0BuKbf1aqyV2VFHfHCU1x6Nr6I+7XjUB
 G/9UGpJ6Sg4ZRtocACugnjp4AuWgde7IxNG/CZukCNX556Dr8g807/jdbSahVGkExzLOYsy5h0V
 TO8FFpJvf9nQbDTyGcLTZY2eatcjMGQaJi9wT8Oa44Z//HDH2MSjAhfjFfoQXESW3QlbAFJRanO
 DG2AnoQj1qWjteynPiJzDAVBn9AtdUv2rKIZYSeaLb5Xpybx30fvPNebfkF3CXLM6hRstPYXYi2
 vm1v5atDQHSVrp6z4pPP2w70ZTxSdvRU1yuMQb5zlayrg==
ARC-Seal: a=rsa-sha256; cv=pass; d=hornetsecurity.com; i=2; s=hse1;
 t=1779200431;
 b=IBVoq0beJ0ul70g4pS/WbZ6Uy99sAk2ToCMnz3fAXBIIn+kEY4LxsJ2bSq+cu01qav6fvSKn
 uusmaiyy5LIstwhgyffsyistOx8L4PABbp9KDjYX0JfoaPvcKqIdcWxgpajw2usSHaQ/0NpH/hF
 /NUjLQtoRDsG6GdMcViO03UvShtLwvNkuEXeLcIr2rLv8FiPjgZ1rK426Z/KsATY90WeDFJ+Syo
 Z3GF4EuuhfN1Io99pD71tuhgEL6CNRFgzDDxz8BOyEOG1BTDNuJIt2jv0kT+N+Bq/6dQF1GmzMN
 V6gOT39AXKvTFfDUeA9PjdwzC0cilqBuWM3MzKEMESy/g==
Received: from mail-francecentralazon11023102.outbound.protection.outlook.com ([40.107.162.102]) by mx-gate05-hz12;
 Tue, 19 May 2026 16:20:31 +0200
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rrLOuXYz1PZNx9yC/0b/oyJnr8XP/ZBhIMHjsw5ePIRPLtOSPynPofZQEzs4sTikpW7TNBi4io8QgUlGK8MHy2c7wy0iXyOloyc+U7LdbJYxyAkGb0/atEJaVimt4uZJPssIG3Rnu6O6DCkdsTxEgFuWzkESFKZSTUUNIGOle9JDgxNCVcAf0Ea5mSwbJCgNgrtwmOn+zc45t2IjLls1GF6f+FE4bYgquEFSod27mJLjxzOqTYfaPgddIRG90m3e+cilNdQsa5ArrI+A1mX7+eWTMy5Wl9SnMStX8TmX5lBVzaiPS3c8Lph5B0B7qmboCIUilNZjhAAaT3WdaZeIEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nmo5XFl33FuqSlE8jtAV/TF/ixfcI8vCOW5yP9T4pMo=;
 b=ci6jLoPaHNOzkcw1fl42eXwofgM4KBKkiamdwUhKaoYuYVZ5l0nZ3XQlr8uhMBs0e8nh3UqhFfMHoXOpAisPX6rSA6WlmHk12qMYe/soywoYlxIpyvti7wmgb3C8CLFLzRRIFaQYInX2NwkTgQ20hZobryRndSi/LAoElcyvUF4Gwm+dQMIGj2p5Ts5Rp5Hp+lgWKDOeNrh+TSpBfXRvZTbaDHIgQAlQe9qkcF84Zw8eMgssKJkw7EP+sCezwZjxr2AxzcKJAzZoHdxaxHiFXBf/eIy9U592ruXLfRMWHVuSGKpWGxVz62r7eqbM2ebuexC2d9UnYE4M/YEo+vllzg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=witekio.com; dmarc=pass action=none header.from=witekio.com;
 dkim=pass header.d=witekio.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=witekio.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nmo5XFl33FuqSlE8jtAV/TF/ixfcI8vCOW5yP9T4pMo=;
 b=MoLtRYovbDbEktIhxKw5c+aQJRGp9Gp5i8m3FuzoJk0WXDFAuCUhPeI/TS/znMwwEfIzJsKghaTU73s1n14wxBK8uIgnflhXI3gUGfTU5gJm1a2SNvktin2RQplqyzwRIyx4/W8Un7bzVy8eMHt4LCdqwToCF7zn3tj8Go1dYQC76rmi5XZ0pSBuLbBYn7cTL17gNRsyTM1wnce10gZH+jjGwFz3AIr6RcyxqpSkwJDGwu25B/Ko/XWrTKc8ASj61+t5PaYAj1Xyfp3OsHWqwnFO4x5A2gWosmXvpqTN5q8dSEIVa/wwISxVMbEri01GvqqLBb3kGNno+1JRUx3tdA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=witekio.com;
Received: from AM9P192MB1396.EURP192.PROD.OUTLOOK.COM (2603:10a6:20b:3ad::23)
 by GV1P192MB2609.EURP192.PROD.OUTLOOK.COM (2603:10a6:150:25b::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.14; Tue, 19 May
 2026 14:20:15 +0000
Received: from AM9P192MB1396.EURP192.PROD.OUTLOOK.COM
 ([fe80::25ed:86ef:4d24:3d38]) by AM9P192MB1396.EURP192.PROD.OUTLOOK.COM
 ([fe80::25ed:86ef:4d24:3d38%5]) with mapi id 15.21.0025.023; Tue, 19 May 2026
 14:20:15 +0000
From: tgaige.opensource@witekio.com
To: openembedded-core@lists.openembedded.org
Cc: hsimeliere.opensource@witekio.com,
	Theo Gaige <tgaige.opensource@witekio.com>,
	Bruno Vernay <bruno.vernay@se.com>
Subject: [scarthgap][PATCH] expat: patch CVE-2026-45186
Date: Tue, 19 May 2026 16:16:38 +0200
Message-ID: <20260519141641.1367089-1-tgaige.opensource@witekio.com>
X-Mailer: git-send-email 2.43.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: ZR0P278CA0138.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:40::17) To AM9P192MB1396.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:20b:3ad::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9P192MB1396:EE_|GV1P192MB2609:EE_
X-MS-Office365-Filtering-Correlation-Id: 337ad2c6-ef72-4500-6ac7-08deb5b1befc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|366016|376014|52116014|13003099007|38350700014|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	rI5+Za3TxYRW3YG0HBTSF9UXKD37c38et4SCic6h5uVc2rglz0hd8Ug9XOjGf54Kbtae+RdxsOZS+T0YYJGozcwWOqgGvsDIWTJXNjq8qyD70ygx2+TkWDNDaNc860doJoNvTh3RmhzJem3YjwK+R0+aHUkDHm7AxsVgABOJgSc6DEKSeS90ndQLRZN1HNhH4Z2joUatPmUf9aIlcxncKFiVGT/A8DmYA1Bd0NyfxM1YSHY+vegAW/AvyBwtvHS/Pe+vJrNfCNlmKQtgxCwm8aveFOb/mZg8O+9XnKYMluBW9ptJprvXabrT6SRPddbjzaenPZi/NtPd5ceapcm+PGypnPrtx3vCTS27CJ+KZwKYGxKHkZTAXUQ2f8YQC7BmOzoKslV65lw7sGPD+j2yE+ewGtiHDtxGeXnotyTWRr3c7IpxAb3hpjUXStLzkfjgGfDWdExRlyXJxXUkla/iMh5TmWEfUst6TKS+EuPdblrV4sKDyd5RUn4YI9O0Mf60X8Az3AQiMcmYNY4ZXy07/7jlTuimgfpRoCbMU+OpPho+zYe/I57jHvNu2pxE5JQgKcO2H1EITDm+ZpZfISNEzh1riClqvL7S4Xm28Z41H6PcPW603xPN0VaFDTrw+lyPYlJ4BLuDHIIrjl1Fp041V5ZTg42RcHo6bvVLqskmKaMKO+ffarkA82gy9ngMIuAcctk3pQHlXV+GMswdhKHvkg==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9P192MB1396.EURP192.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(52116014)(13003099007)(38350700014)(56012099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?QlJCVXppazlHYk02VUwrVE5jM0E3elZPeDhFVzBaM2RHQ2pJSk9XZmRoemxm?=
 =?utf-8?B?YTF5U0V6TlM0SzIzaUJZY1JqVUNKbWYvc1FoZWxyamRUNFk5L245WHdVbG1i?=
 =?utf-8?B?ZGVRSFRucHpweWRnUER0L3MyVkh2bHpsSVJzY0M3UnJyQTBCbmpJSGFndEZa?=
 =?utf-8?B?QXpSVzV3OEN6SWZaVEh4bG5CSkRuQUp1S0lEYUMvRzFwdWxLSjdZc1RaeDhT?=
 =?utf-8?B?VmFrYm5paDBKeWllcXN5aVRzWmdiOFMxYUVnTEVDY3Fyb3hFK1E3K2dWVmox?=
 =?utf-8?B?eEdOa0ppNTJyUFdOTEw2RnNHUEN5Y3hRUmtNa00reENIVFE0amNtNC9SSGVE?=
 =?utf-8?B?eFhFWkdMQ1ZtOHcvejRVbWtDNFJiY25tNHJadnBrMVZERlJ2MW43MTkvWHNF?=
 =?utf-8?B?Q0FEb3ovenBmN1I0bU02OXYzV0ZHbW9veTRIZGViOG5OWkd1QnY3cGFZU1R0?=
 =?utf-8?B?MDRneXBHMmlaQm51UVhtMDVlVVVWTnYvSzJ1VDg2dU8wUUY3U0Zmc2QrYnl0?=
 =?utf-8?B?eUJvQWllOTdISWcxUmxIbDJ0ZU1yQVhxSzJsSWwzZFkxY2JnWXB0SDZLNXV0?=
 =?utf-8?B?Wi8yQ3U0Zk5FTDEybnppVkt6ZVNFR0xESDUyMWtmd3lPV2ROZE51bHBFcGVE?=
 =?utf-8?B?ZUh1V2NuR0V1eG5mLzRObGc1cnd6NWJHT09pQldJeFhXSkwwSmZucko2UnRK?=
 =?utf-8?B?dUNHOW1sNmYwaG1vNFI0WUcxOWdoanNkTlY5Qk1la21OYWQydWtWeGUvckN1?=
 =?utf-8?B?SlpCL1dkZHZmVDFnUEcwU2RSYVFRQ2xlbnZDV2NMMzVrU2hsMDUxc2pPd3VQ?=
 =?utf-8?B?ZkpXWExZbUpnTzZmMFR0akRhRW82MEd5UnhORFVBY01OUGNRbjZUNzF6Rll2?=
 =?utf-8?B?dGhyYUZsM0hxWEhkeGpsTE1qS2hLSTJpMTk1MVg2MTlVMndYdVRENXAxNTRZ?=
 =?utf-8?B?WHdQaWFySVpZNCtua2ZmQkxUNnNzZ1JGSzF0RXcrNTNhNWo1N0xwSmtDUFVp?=
 =?utf-8?B?U2FzbzNsNEgvSHdFYitZZjB1L21HaUhZOERKME8yRHVDbDFmSElhQkdlUXVZ?=
 =?utf-8?B?VDZ6VGpHM0tOcEhoaGFNLzRZSi94WWNyR25IYlVnL0M3ZzhBb1BETEtZbHVW?=
 =?utf-8?B?VkQ5S3FXalJMNmtJZTRsVVlFaFpEVjBZbWdxWFFTTG8rYkRFMHc0M3JOckk4?=
 =?utf-8?B?cjMza2xZY2Fzay9qYVVZb2dtL29BQnBmN3k3ZmJZdm9BYTlxd2dRZHhXNDlL?=
 =?utf-8?B?Z0s0d0M2UW55UndJL3JrMmU0UUtjczh6NFBvSHFqRC9sSi9FcVhETUg3N1Mx?=
 =?utf-8?B?T3RaNlRKeGdUNWgwME8zbldzVlR3MDNZVDVENmhVVHhQLzdCaFNBeDFCTzFi?=
 =?utf-8?B?TjVLSHdWbmd3MVJLMWxMV0ZkWDZKdDhCT1dDMHk0cDdFU3NZbUswSncycGpI?=
 =?utf-8?B?TklNaVhjWTJXbEFZSkt1eWRIMlZlLzdqUlVhNkRZN24xci94YmV1ZlpzeSty?=
 =?utf-8?B?akhiallrVVE4NXFYb3J2aVVib3VPcVdEMzY5QXN5NGpSQk9QTU8wdThXUFpy?=
 =?utf-8?B?QjRCZnI1eitCMVhacmlXVWlrSW5renY3SDZDU1cwRllYNVhOYXZxWEo0RVUy?=
 =?utf-8?B?elFIQjhpQ2ZUdEFCRHJTMjdvZG9RNmRNSldud0pXZDNSVTNEVnZaaytDYnpV?=
 =?utf-8?B?VmNPTldMZVJ6MmJOY0J4dGkveEl4Ny9ZckI2Rkc5N1B2MU9EL2l5N0NkNnI4?=
 =?utf-8?B?NE90QXlMSTVtSndmYzhCWmdzVVVieElvOVNHOFczN2xFaW5hdS9zQ2hQUnRG?=
 =?utf-8?B?QUdpTlBOaExtYXJ2K0NxbTJoSXNESFpkOXZiU3R2UUp5YVBoWnhjSUwvUi9y?=
 =?utf-8?B?WElGU1AvUGU5WTBQNXpEamptdUtQRitoeWFLYXJrSUp6TGRvMFZIU2lSZWJQ?=
 =?utf-8?B?OUhNQ1J2bVJwWk1lTTJnck5OYkdYTHZqUzd6MVVhNlBJaFJXUlE2RExCWDRW?=
 =?utf-8?B?UTE0M3VONEhPaUdheFBScUk3MlhLaWd2ZzhqTmdrNnVPdjRNTHBJS1UvQlg0?=
 =?utf-8?B?dUVRNm9BTmNSNXFORnNMQjVzZFlmYTh0ZVhwZDlNMWpHang0dXVXL2tROTZo?=
 =?utf-8?B?ek5jOG8xdzNBYkZ4UEx3T0hhT2svZXhXVkhuQnhJVnRnblMzUkNIbnI4TmtP?=
 =?utf-8?B?SkZNc2EyRk8yWUtXRmRSWjNxdnAzb0owN0tzQVZpeThMcGFIYTJ3dFRVR013?=
 =?utf-8?B?WnpvVXg5TjBNdUJVN3VaU3YzZXhQV01vUGMwTnFmQmlERThQT1BlN0d6bXVR?=
 =?utf-8?B?eWR3Q1dXcE5UNmUydXVyZktnb0g5bDRnTlFMcVQvNjk2NmNCNWg4QT09?=
X-Exchange-RoutingPolicyChecked: 
	VGJMiYxEF3EP4Q45VIy69HBgEww011MYAq2g9OYkc3zzDcNzC+ixaxGPWwBnRrZerQjHYsC6hDdKqjH/AhUWkQj76DSfQRrlYnKXUHBqzMkZmtkYphAvSQPvwt9s4zY8To6P1GHTQUDU2jNsD8lv+kYdW1Fy1h24yGd+U/gSAIp07USwIqWpifK3Gi0t/2+ONwec9smOfXwrMAW14RoLJI+0SBJTznVdSvwc3SSDX6+QW6h4a+SU7Dwnej3pKAyuFTddfTUP46Dhj9dsNE+qD4qZIxluHICHnV5WvOGEmT5FfCX5+3wCfkvg7zxuQi3m3j/YqX/19Vq+UoRqaLUCGQ==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	x+x59eo3YaXgU9nA63OkqjPhMowmQVgf+DWZbnC+BzjVTAUeyh+rdk7G8/bPdfjwE0tl40ECkTkC5xxFANIESJ1kLATZCHmiiSpTCkMpPk4ghP3WzM09ax5fVLYbeEFlvsqW4Uga7YUqIpTXDEeSWfZqE2NOdCLBhedVGVeDztvXEtrCDDNCUHqnDj43MLBZvQSvYYuDlP591VQ0nBuVmVz4Fk7LxO7h9jYd8bSoEdEwh2nf5cP45HWDMyPz6IJXyZtKkOXp2r9w63eMvufMXkK2piIHHHTOY1sLHzFvAhNftDT+zYBc9Klf4BBV2o4cOJh5IBHrEUlCsJ+JM9ILVv+0MDySeaPswH0pfPdvb5YkxYs2kAgdNcWKSWfLGk4edYpGQr6NYAtk4dHxkGei6TaWMmx58ybq1qI369RJ2DWwnmKVJVpmw/RrJ/PnxeIiOKywEDiqY9qZycLoXkSYNBHwIgoG5/cDfvlMRfzFWgxHh6UckB1UCfz8qS371zr7+UA+rWfuBA1VrM4/OUD3KMHkTDaceMJzl/Adx0Nv0/nx78FMkDYxf2HTVfocJ+fc29jkYGV3HZj+8U3XQH7nlIqqg5weeb3RfSM/UoeYUBGdvaWoKz3bXv9GE1GTYzi+
X-OriginatorOrg: witekio.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 337ad2c6-ef72-4500-6ac7-08deb5b1befc
X-MS-Exchange-CrossTenant-AuthSource: AM9P192MB1396.EURP192.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 May 2026 14:20:15.2660
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 317e086a-301a-49af-9ea4-48a1c458b903
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YxhtcLJWsy+CEFMb8jf7lCAXtZL0BRz1AurS3A1ogcyrJOsfuuQ4vTupmcv1feQQIIyPHUWmi4kROqbnGFerCw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1P192MB2609
X-cloud-security-sender: tgaige@witekio.com
X-cloud-security-recipient: openembedded-core@lists.openembedded.org
X-cloud-security-crypt: load encryption module
X-cloud-security-Mailarchiv: E-Mail archived for: tgaige.opensource@witekio.com
X-cloud-security-Mailarchivtype: outbound
X-cloud-security-Virusscan: CLEAN
X-cloud-security-disclaimer: This E-Mail was scanned by E-Mailservice on mx-gate05-hz12 with 4gKcJg1dkcz2RZZT
X-cloud-security-connect: mail-francecentralazon11023102.outbound.protection.outlook.com[40.107.162.102], TLS=1, IP=40.107.162.102
X-cloud-security-Digest: e04478a9c30ea5eaf4f248a3d45ba142
X-cloud-security: scantime:2.667
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 19 May 2026 14:20:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237331

From: Theo Gaige <tgaige.opensource@witekio.com>

Backport patches from [1] also mentioned in [2].

[1] https://github.com/libexpat/libexpat/pull/1216
[2] https://security-tracker.debian.org/tracker/CVE-2026-45186

Signed-off-by: Theo Gaige <tgaige.opensource@witekio.com>
Reviewed-by: Bruno Vernay <bruno.vernay@se.com>
---
 .../expat/expat/CVE-2026-45186-01.patch       |  70 ++++
 .../expat/expat/CVE-2026-45186-02.patch       | 318 ++++++++++++++++++
 .../expat/expat/CVE-2026-45186-03.patch       |  46 +++
 .../expat/expat/CVE-2026-45186-04.patch       |  32 ++
 .../expat/expat/CVE-2026-45186-05.patch       |  32 ++
 .../expat/expat/CVE-2026-45186-06.patch       |  87 +++++
 .../expat/expat/CVE-2026-45186-07.patch       |  52 +++
 .../expat/expat/CVE-2026-45186-08.patch       |  39 +++
 meta/recipes-core/expat/expat_2.6.4.bb        |   8 +
 9 files changed, 684 insertions(+)
 create mode 100644 meta/recipes-core/expat/expat/CVE-2026-45186-01.patch
 create mode 100644 meta/recipes-core/expat/expat/CVE-2026-45186-02.patch
 create mode 100644 meta/recipes-core/expat/expat/CVE-2026-45186-03.patch
 create mode 100644 meta/recipes-core/expat/expat/CVE-2026-45186-04.patch
 create mode 100644 meta/recipes-core/expat/expat/CVE-2026-45186-05.patch
 create mode 100644 meta/recipes-core/expat/expat/CVE-2026-45186-06.patch
 create mode 100644 meta/recipes-core/expat/expat/CVE-2026-45186-07.patch
 create mode 100644 meta/recipes-core/expat/expat/CVE-2026-45186-08.patch

diff --git a/meta/recipes-core/expat/expat/CVE-2026-45186-01.patch b/meta/recipes-core/expat/expat/CVE-2026-45186-01.patch
new file mode 100644
index 0000000000..bc97341d44
--- /dev/null
+++ b/meta/recipes-core/expat/expat/CVE-2026-45186-01.patch
@@ -0,0 +1,70 @@
+From 02fd51c3475c400cf4095228eb1ce4fa19639f5f Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Berkay=20Eren=20=C3=9Cr=C3=BCn?= <berkay.ueruen@siemens.com>
+Date: Fri, 13 Mar 2026 13:26:45 +0100
+Subject: [PATCH 1/8] Make "counting_start_element_handler" count default attrs
+
+(cherry picked from commit 0802a5892030610144b736dec6e2f63e8600fe85)
+
+CVE: CVE-2026-45186
+Upstream-Status: Backport [https://github.com/libexpat/libexpat/pull/1216/commits/0802a5892030610144b736dec6e2f63e8600fe85]
+Signed-off-by: Theo Gaige <tgaige.opensource@witekio.com>
+---
+ tests/basic_tests.c | 8 ++++----
+ tests/handlers.c    | 2 +-
+ tests/handlers.h    | 1 +
+ 3 files changed, 6 insertions(+), 5 deletions(-)
+
+diff --git a/tests/basic_tests.c b/tests/basic_tests.c
+index 023d9ce4..d6edb16b 100644
+--- a/tests/basic_tests.c
++++ b/tests/basic_tests.c
+@@ -2439,9 +2439,9 @@ START_TEST(test_attributes) {
+                          {XCS("id"), XCS("one")},
+                          {NULL, NULL}};
+   AttrInfo tag_info[] = {{XCS("c"), XCS("3")}, {NULL, NULL}};
+-  ElementInfo info[] = {{XCS("doc"), 3, XCS("id"), NULL},
+-                        {XCS("tag"), 1, NULL, NULL},
+-                        {NULL, 0, NULL, NULL}};
++  ElementInfo info[] = {{XCS("doc"), 3, 0, XCS("id"), NULL},
++                        {XCS("tag"), 1, 0, NULL, NULL},
++                        {NULL, 0, 0, NULL, NULL}};
+   info[0].attributes = doc_info;
+   info[1].attributes = tag_info;
+ 
+@@ -5496,7 +5496,7 @@ START_TEST(test_deep_nested_attribute_entity) {
+            (long unsigned)(N_LINES - 1));
+ 
+   AttrInfo doc_info[] = {{XCS("name"), XCS("deepText")}, {NULL, NULL}};
+-  ElementInfo info[] = {{XCS("foo"), 1, NULL, NULL}, {NULL, 0, NULL, NULL}};
++  ElementInfo info[] = {{XCS("foo"), 1, 0, NULL, NULL}, {NULL, 0, 0, NULL, NULL}};
+   info[0].attributes = doc_info;
+ 
+   XML_Parser parser = XML_ParserCreate(NULL);
+diff --git a/tests/handlers.c b/tests/handlers.c
+index e6582231..9ff7b354 100644
+--- a/tests/handlers.c
++++ b/tests/handlers.c
+@@ -137,7 +137,7 @@ counting_start_element_handler(void *userData, const XML_Char *name,
+     fail("ID does not have the correct name");
+     return;
+   }
+-  for (i = 0; i < info->attr_count; i++) {
++  for (i = 0; i < info->attr_count + info->default_attr_count; i++) {
+     attr = info->attributes;
+     while (attr->name != NULL) {
+       if (! xcstrcmp(atts[0], attr->name))
+diff --git a/tests/handlers.h b/tests/handlers.h
+index ac4ca940..11d45ebd 100644
+--- a/tests/handlers.h
++++ b/tests/handlers.h
+@@ -88,6 +88,7 @@ typedef struct attrInfo {
+ typedef struct elementInfo {
+   const XML_Char *name;
+   int attr_count;
++  int default_attr_count;
+   const XML_Char *id_name;
+   AttrInfo *attributes;
+ } ElementInfo;
+-- 
+2.43.0
+
diff --git a/meta/recipes-core/expat/expat/CVE-2026-45186-02.patch b/meta/recipes-core/expat/expat/CVE-2026-45186-02.patch
new file mode 100644
index 0000000000..d7991b3b9c
--- /dev/null
+++ b/meta/recipes-core/expat/expat/CVE-2026-45186-02.patch
@@ -0,0 +1,318 @@
+From 943a9bccac7fa8d156807fb7f106335b4e02da36 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Berkay=20Eren=20=C3=9Cr=C3=BCn?= <berkay.ueruen@siemens.com>
+Date: Fri, 13 Mar 2026 13:27:31 +0100
+Subject: [PATCH 2/8] test(attlist): Cover duplicate attribute names
+
+Co-authored-by: Sebastian Pipping <sebastian@pipping.org>
+(cherry picked from commit e569f47181c43dca5d262089e541ddf9a9c09927)
+
+CVE: CVE-2026-45186
+Upstream-Status: Backport [https://github.com/libexpat/libexpat/pull/1216/commits/e569f47181c43dca5d262089e541ddf9a9c09927]
+Signed-off-by: Theo Gaige <tgaige.opensource@witekio.com>
+---
+ tests/basic_tests.c | 282 ++++++++++++++++++++++++++++++++++++++++++++
+ 1 file changed, 282 insertions(+)
+
+diff --git a/tests/basic_tests.c b/tests/basic_tests.c
+index d6edb16b..907a4580 100644
+--- a/tests/basic_tests.c
++++ b/tests/basic_tests.c
+@@ -2462,6 +2462,279 @@ START_TEST(test_attributes) {
+ }
+ END_TEST
+ 
++START_TEST(test_duplicate_cdata_attribute) {
++  /*
++  https://www.w3.org/TR/xml/#attdecls
++
++  Test the following statement from the linked specification:
++    When more than one definition is provided for the same attribute of a given
++    element type, the first declaration is binding and later declarations are
++    ignored.
++  */
++
++  const char *text
++      = "<!DOCTYPE doc [\n"
++        "  <!ATTLIST doc attribute CDATA 'expected' attribute CDATA 'ignored'>\n"
++        "]>\n"
++        "<doc/>\n";
++  AttrInfo doc_info[] = {{XCS("attribute"), XCS("expected")}, {NULL, NULL}};
++  ElementInfo info[]
++      = {{XCS("doc"), 0, 1, NULL, doc_info}, {NULL, 0, 0, NULL, NULL}};
++
++  XML_Parser parser = XML_ParserCreate(NULL);
++  assert_true(parser != NULL);
++
++  ParserAndElementInfo parserAndElementInfos = {
++      parser,
++      info,
++  };
++
++  XML_SetStartElementHandler(parser, counting_start_element_handler);
++  XML_SetUserData(parser, &parserAndElementInfos);
++
++  if (_XML_Parse_SINGLE_BYTES(parser, text, (int)strlen(text), XML_TRUE)
++      != XML_STATUS_OK)
++    xml_failure(parser);
++
++  XML_ParserFree(parser);
++}
++END_TEST
++
++START_TEST(test_duplicate_id_attribute_1) {
++  /*
++  https://www.w3.org/TR/xml/#attdecls
++
++  Test the following statement from the linked specification:
++    When more than one definition is provided for the same attribute of a given
++    element type, the first declaration is binding and later declarations are
++    ignored.
++  */
++
++  const char *text
++      = "<!DOCTYPE doc [\n"
++        "  <!ATTLIST doc identifier CDATA 'expected' identifier ID #REQUIRED>\n"
++        "]>\n"
++        "<doc/>\n";
++  AttrInfo doc_info[] = {{XCS("identifier"), XCS("expected")}, {NULL, NULL}};
++  ElementInfo info[]
++      = {{XCS("doc"), 0, 1, NULL, doc_info}, {NULL, 0, 0, NULL, NULL}};
++
++  XML_Parser parser = XML_ParserCreate(NULL);
++  assert_true(parser != NULL);
++
++  ParserAndElementInfo parserAndElementInfos = {
++      parser,
++      info,
++  };
++
++  XML_SetStartElementHandler(parser, counting_start_element_handler);
++  XML_SetUserData(parser, &parserAndElementInfos);
++
++  if (_XML_Parse_SINGLE_BYTES(parser, text, (int)strlen(text), XML_TRUE)
++      != XML_STATUS_OK)
++    xml_failure(parser);
++
++  XML_ParserFree(parser);
++}
++END_TEST
++
++START_TEST(test_duplicate_id_attribute_2) {
++  /*
++  https://www.w3.org/TR/xml/#attdecls
++
++  Test the following statement from the linked specification:
++    When more than one definition is provided for the same attribute of a given
++    element type, the first declaration is binding and later declarations are
++    ignored.
++  */
++
++  const char *text
++      = "<!DOCTYPE doc [\n"
++        "  <!ATTLIST doc identifier ID #REQUIRED identifier CDATA 'unexpected'>\n"
++        "]>\n"
++        "<doc/>\n";
++  AttrInfo doc_info[] = {{NULL, NULL}};
++
++  ElementInfo info[]
++      = {{XCS("doc"), 0, 0, NULL, doc_info}, {NULL, 0, 0, NULL, NULL}};
++
++  XML_Parser parser = XML_ParserCreate(NULL);
++  assert_true(parser != NULL);
++
++  ParserAndElementInfo parserAndElementInfos = {
++      parser,
++      info,
++  };
++
++  XML_SetStartElementHandler(parser, counting_start_element_handler);
++  XML_SetUserData(parser, &parserAndElementInfos);
++
++  if (_XML_Parse_SINGLE_BYTES(parser, text, (int)strlen(text), XML_TRUE)
++      != XML_STATUS_OK)
++    xml_failure(parser);
++
++  XML_ParserFree(parser);
++}
++END_TEST
++
++START_TEST(test_duplicate_cdata_attribute_multiple_attlistdecl) {
++  /*
++  https://www.w3.org/TR/xml/#attdecls
++
++  Test the following statement from the linked specification:
++    When more than one AttlistDecl is provided for a given element type,
++    the contents of all those provided are merged.
++  */
++  const char *text = "<!DOCTYPE doc [\n"
++                     "  <!ATTLIST doc attribute CDATA 'expected'>\n"
++                     "  <!ATTLIST doc attribute CDATA 'ignored'>\n"
++                     "]>\n"
++                     "<doc/>\n";
++  AttrInfo doc_info[] = {{XCS("attribute"), XCS("expected")}, {NULL, NULL}};
++  ElementInfo info[]
++      = {{XCS("doc"), 0, 1, NULL, doc_info}, {NULL, 0, 0, NULL, NULL}};
++
++  XML_Parser parser = XML_ParserCreate(NULL);
++  assert_true(parser != NULL);
++
++  ParserAndElementInfo parserAndElementInfos = {
++      parser,
++      info,
++  };
++
++  XML_SetStartElementHandler(parser, counting_start_element_handler);
++  XML_SetUserData(parser, &parserAndElementInfos);
++
++  if (_XML_Parse_SINGLE_BYTES(parser, text, (int)strlen(text), XML_TRUE)
++      != XML_STATUS_OK)
++    xml_failure(parser);
++
++  XML_ParserFree(parser);
++}
++END_TEST
++
++START_TEST(test_duplicate_cdata_attribute_multiple_attlistdecl_2) {
++  /*
++  https://www.w3.org/TR/xml/#attdecls
++
++  Test the following statement from the linked specification:
++    When more than one AttlistDecl is provided for a given element type,
++    the contents of all those provided are merged.
++  */
++  const char *text = "<!DOCTYPE doc [\n"
++                     "  <!ATTLIST doc attribute CDATA 'expected_doc'>\n"
++                     "  <!ATTLIST tag attribute CDATA 'expected_tag'>\n"
++                     "  <!ATTLIST doc attribute CDATA 'ignored_doc'>\n"
++                     "]>\n"
++                     "<doc><tag></tag></doc>\n";
++  AttrInfo doc_info[] = {{XCS("attribute"), XCS("expected_doc")}, {NULL, NULL}};
++  AttrInfo tag_info[] = {{XCS("attribute"), XCS("expected_tag")}, {NULL, NULL}};
++  ElementInfo info[] = {{XCS("doc"), 0, 1, NULL, doc_info},
++                        {XCS("tag"), 0, 1, NULL, tag_info},
++                        {NULL, 0, 0, NULL, NULL}};
++
++  XML_Parser parser = XML_ParserCreate(NULL);
++  assert_true(parser != NULL);
++
++  ParserAndElementInfo parserAndElementInfos = {
++      parser,
++      info,
++  };
++
++  XML_SetStartElementHandler(parser, counting_start_element_handler);
++  XML_SetUserData(parser, &parserAndElementInfos);
++
++  if (_XML_Parse_SINGLE_BYTES(parser, text, (int)strlen(text), XML_TRUE)
++      != XML_STATUS_OK)
++    xml_failure(parser);
++
++  XML_ParserFree(parser);
++}
++END_TEST
++
++START_TEST(test_duplicate_cdata_attribute_multiple_attlistdecl_3) {
++  /*
++  https://www.w3.org/TR/xml/#attdecls
++
++  Test the following statement from the linked specification:
++    When more than one AttlistDecl is provided for a given element type,
++    the contents of all those provided are merged.
++  */
++  const char *text
++      = "<!DOCTYPE doc [\n"
++        "  <!ATTLIST doc attribute CDATA 'expected_doc'>\n"
++        "  <!ATTLIST tag attribute CDATA 'expected_tag'>\n"
++        "  <!ATTLIST doc second_attribute CDATA 'second_expected_doc' attribute CDATA 'ignored_doc'>\n"
++        "]>\n"
++        "<doc><tag></tag></doc>\n";
++  AttrInfo doc_info[] = {{XCS("attribute"), XCS("expected_doc")},
++                         {XCS("second_attribute"), XCS("second_expected_doc")},
++                         {NULL, NULL}};
++  AttrInfo tag_info[] = {{XCS("attribute"), XCS("expected_tag")}, {NULL, NULL}};
++  ElementInfo info[] = {{XCS("doc"), 0, 2, NULL, doc_info},
++                        {XCS("tag"), 0, 1, NULL, tag_info},
++                        {NULL, 0, 0, NULL, NULL}};
++
++  XML_Parser parser = XML_ParserCreate(NULL);
++  assert_true(parser != NULL);
++
++  ParserAndElementInfo parserAndElementInfos = {
++      parser,
++      info,
++  };
++
++  XML_SetStartElementHandler(parser, counting_start_element_handler);
++  XML_SetUserData(parser, &parserAndElementInfos);
++
++  if (_XML_Parse_SINGLE_BYTES(parser, text, (int)strlen(text), XML_TRUE)
++      != XML_STATUS_OK)
++    xml_failure(parser);
++
++  XML_ParserFree(parser);
++}
++END_TEST
++
++START_TEST(test_duplicate_id_attribute_multiple_attlistdecl) {
++  /*
++  https://www.w3.org/TR/xml/#attdecls
++
++  Test the following statement from the linked specification:
++    When more than one AttlistDecl is provided for a given element type,
++    the contents of all those provided are merged.
++  */
++  const char *text = "<!DOCTYPE doc [\n"
++                     "  <!ATTLIST doc identifier ID #REQUIRED>\n"
++                     "  <!ATTLIST tag identifier CDATA 'identifier_tag'>\n"
++                     "  <!ATTLIST doc identifier CDATA 'ignored'>\n"
++                     "]>\n"
++                     "<doc identifier='doc_identity'><tag></tag></doc>\n";
++  AttrInfo doc_info[]
++      = {{XCS("identifier"), XCS("doc_identity")}, {NULL, NULL}};
++  AttrInfo tag_info[]
++      = {{XCS("identifier"), XCS("identifier_tag")}, {NULL, NULL}};
++  ElementInfo info[] = {{XCS("doc"), 1, 0, XCS("identifier"), doc_info},
++                        {XCS("tag"), 0, 1, NULL, tag_info},
++                        {NULL, 0, 0, NULL, NULL}};
++
++  XML_Parser parser = XML_ParserCreate(NULL);
++  assert_true(parser != NULL);
++
++  ParserAndElementInfo parserAndElementInfos = {
++      parser,
++      info,
++  };
++
++  XML_SetStartElementHandler(parser, counting_start_element_handler);
++  XML_SetUserData(parser, &parserAndElementInfos);
++
++  if (_XML_Parse_SINGLE_BYTES(parser, text, (int)strlen(text), XML_TRUE)
++      != XML_STATUS_OK)
++    xml_failure(parser);
++
++  XML_ParserFree(parser);
++}
++END_TEST
++
+ /* Test reset works correctly in the middle of processing an internal
+  * entity.  Exercises some obscure code in XML_ParserReset().
+  */
+@@ -6325,6 +6598,15 @@ make_basic_test_case(Suite *s) {
+   tcase_add_test__ifdef_xml_dtd(tc_basic, test_empty_foreign_dtd);
+   tcase_add_test(tc_basic, test_set_base);
+   tcase_add_test(tc_basic, test_attributes);
++  tcase_add_test(tc_basic, test_duplicate_cdata_attribute);
++  tcase_add_test(tc_basic, test_duplicate_id_attribute_1);
++  tcase_add_test(tc_basic, test_duplicate_id_attribute_2);
++  tcase_add_test(tc_basic, test_duplicate_cdata_attribute_multiple_attlistdecl);
++  tcase_add_test(tc_basic,
++                 test_duplicate_cdata_attribute_multiple_attlistdecl_2);
++  tcase_add_test(tc_basic,
++                 test_duplicate_cdata_attribute_multiple_attlistdecl_3);
++  tcase_add_test(tc_basic, test_duplicate_id_attribute_multiple_attlistdecl);
+   tcase_add_test__if_xml_ge(tc_basic, test_reset_in_entity);
+   tcase_add_test(tc_basic, test_resume_invalid_parse);
+   tcase_add_test(tc_basic, test_resume_resuspended);
+-- 
+2.43.0
+
diff --git a/meta/recipes-core/expat/expat/CVE-2026-45186-03.patch b/meta/recipes-core/expat/expat/CVE-2026-45186-03.patch
new file mode 100644
index 0000000000..fe3e329b88
--- /dev/null
+++ b/meta/recipes-core/expat/expat/CVE-2026-45186-03.patch
@@ -0,0 +1,46 @@
+From 74e67b6a37d2e14b899a182bad37d8c49c539f29 Mon Sep 17 00:00:00 2001
+From: Sebastian Pipping <sebastian@pipping.org>
+Date: Mon, 20 Apr 2026 13:44:43 +0200
+Subject: [PATCH 3/8] tests: Define .attributes the first time around
+
+(cherry picked from commit 05307d352a5aa858cdda57ec53a53b597b3a4a82)
+
+CVE: CVE-2026-45186
+Upstream-Status: Backport [https://github.com/libexpat/libexpat/pull/1216/commits/05307d352a5aa858cdda57ec53a53b597b3a4a82]
+Signed-off-by: Theo Gaige <tgaige.opensource@witekio.com>
+---
+ tests/basic_tests.c | 10 ++++------
+ 1 file changed, 4 insertions(+), 6 deletions(-)
+
+diff --git a/tests/basic_tests.c b/tests/basic_tests.c
+index 907a4580..b0178fc7 100644
+--- a/tests/basic_tests.c
++++ b/tests/basic_tests.c
+@@ -2439,11 +2439,9 @@ START_TEST(test_attributes) {
+                          {XCS("id"), XCS("one")},
+                          {NULL, NULL}};
+   AttrInfo tag_info[] = {{XCS("c"), XCS("3")}, {NULL, NULL}};
+-  ElementInfo info[] = {{XCS("doc"), 3, 0, XCS("id"), NULL},
+-                        {XCS("tag"), 1, 0, NULL, NULL},
++  ElementInfo info[] = {{XCS("doc"), 3, 0, XCS("id"), doc_info},
++                        {XCS("tag"), 1, 0, NULL, tag_info},
+                         {NULL, 0, 0, NULL, NULL}};
+-  info[0].attributes = doc_info;
+-  info[1].attributes = tag_info;
+ 
+   XML_Parser parser = XML_ParserCreate(NULL);
+   assert_true(parser != NULL);
+@@ -5769,8 +5767,8 @@ START_TEST(test_deep_nested_attribute_entity) {
+            (long unsigned)(N_LINES - 1));
+ 
+   AttrInfo doc_info[] = {{XCS("name"), XCS("deepText")}, {NULL, NULL}};
+-  ElementInfo info[] = {{XCS("foo"), 1, 0, NULL, NULL}, {NULL, 0, 0, NULL, NULL}};
+-  info[0].attributes = doc_info;
++  ElementInfo info[]
++      = {{XCS("foo"), 1, 0, NULL, doc_info}, {NULL, 0, 0, NULL, NULL}};
+ 
+   XML_Parser parser = XML_ParserCreate(NULL);
+   ParserAndElementInfo parserPlusElemenInfo = {parser, info};
+-- 
+2.43.0
+
diff --git a/meta/recipes-core/expat/expat/CVE-2026-45186-04.patch b/meta/recipes-core/expat/expat/CVE-2026-45186-04.patch
new file mode 100644
index 0000000000..0c725b232b
--- /dev/null
+++ b/meta/recipes-core/expat/expat/CVE-2026-45186-04.patch
@@ -0,0 +1,32 @@
+From fa671cc8f4900c709231732c40b0941d4ec36f53 Mon Sep 17 00:00:00 2001
+From: Sebastian Pipping <sebastian@pipping.org>
+Date: Mon, 13 Apr 2026 01:34:03 +0200
+Subject: [PATCH 4/8] tests: Make counting_start_element_handler enforce
+ complete attribute lists
+
+(cherry picked from commit 4176aff73840711060913e0ac6aa1168d8ba5c8d)
+
+CVE: CVE-2026-45186
+Upstream-Status: Backport [https://github.com/libexpat/libexpat/pull/1216/commits/4176aff73840711060913e0ac6aa1168d8ba5c8d]
+Signed-off-by: Theo Gaige <tgaige.opensource@witekio.com>
+---
+ tests/handlers.c | 3 +++
+ 1 file changed, 3 insertions(+)
+
+diff --git a/tests/handlers.c b/tests/handlers.c
+index 9ff7b354..5e72e8b6 100644
+--- a/tests/handlers.c
++++ b/tests/handlers.c
+@@ -155,6 +155,9 @@ counting_start_element_handler(void *userData, const XML_Char *name,
+     /* Remember, two entries in atts per attribute (see above) */
+     atts += 2;
+   }
++
++  // Self-test that the test case's list of expected attributes is complete
++  assert_true(atts[0] == NULL);
+ }
+ 
+ void XMLCALL
+-- 
+2.43.0
+
diff --git a/meta/recipes-core/expat/expat/CVE-2026-45186-05.patch b/meta/recipes-core/expat/expat/CVE-2026-45186-05.patch
new file mode 100644
index 0000000000..5ca401935c
--- /dev/null
+++ b/meta/recipes-core/expat/expat/CVE-2026-45186-05.patch
@@ -0,0 +1,32 @@
+From 3e060a687a3485938f98244f92ebc6f87d53a019 Mon Sep 17 00:00:00 2001
+From: Sebastian Pipping <sebastian@pipping.org>
+Date: Sun, 8 Mar 2026 22:14:41 +0100
+Subject: [PATCH 5/8] lib: Extract a constant for upcoming reuse
+
+(cherry picked from commit fb35f2d2040d114f355bae8a7450942533237530)
+
+CVE: CVE-2026-45186
+Upstream-Status: Backport [https://github.com/libexpat/libexpat/pull/1216/commits/fb35f2d2040d114f355bae8a7450942533237530]
+Signed-off-by: Theo Gaige <tgaige.opensource@witekio.com>
+---
+ lib/xmlparse.c | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/lib/xmlparse.c b/lib/xmlparse.c
+index 9bc67f38..8d3e8db1 100644
+--- a/lib/xmlparse.c
++++ b/lib/xmlparse.c
+@@ -7708,8 +7708,9 @@ dtdCopy(XML_Parser oldParser, DTD *newDtd, const DTD *oldDtd,
+       newE->prefix = (PREFIX *)lookup(oldParser, &(newDtd->prefixes),
+                                       oldE->prefix->name, 0);
+     for (i = 0; i < newE->nDefaultAtts; i++) {
++      const XML_Char *const attributeName = oldE->defaultAtts[i].id->name;
+       newE->defaultAtts[i].id = (ATTRIBUTE_ID *)lookup(
+-          oldParser, &(newDtd->attributeIds), oldE->defaultAtts[i].id->name, 0);
++          oldParser, &(newDtd->attributeIds), attributeName, 0);
+       newE->defaultAtts[i].isCdata = oldE->defaultAtts[i].isCdata;
+       if (oldE->defaultAtts[i].value) {
+         newE->defaultAtts[i].value
+-- 
+2.43.0
+
diff --git a/meta/recipes-core/expat/expat/CVE-2026-45186-06.patch b/meta/recipes-core/expat/expat/CVE-2026-45186-06.patch
new file mode 100644
index 0000000000..14e5545792
--- /dev/null
+++ b/meta/recipes-core/expat/expat/CVE-2026-45186-06.patch
@@ -0,0 +1,87 @@
+From cbf6df87b8525169533e0742fd587fdb0d9ec997 Mon Sep 17 00:00:00 2001
+From: Sebastian Pipping <sebastian@pipping.org>
+Date: Sun, 8 Mar 2026 23:05:49 +0100
+Subject: [PATCH 6/8] lib: Introduce ELEMENT_TYPE.defaultAttsNames
+
+(cherry picked from commit 7f0f1b9e70d937072d2e9e37ae9edf27784cc080)
+
+CVE: CVE-2026-45186
+Upstream-Status: Backport [https://github.com/libexpat/libexpat/pull/1216/commits/7f0f1b9e70d937072d2e9e37ae9edf27784cc080]
+Signed-off-by: Theo Gaige <tgaige.opensource@witekio.com>
+---
+ lib/xmlparse.c | 17 +++++++++++++++++
+ 1 file changed, 17 insertions(+)
+
+diff --git a/lib/xmlparse.c b/lib/xmlparse.c
+index 8d3e8db1..4a29c18f 100644
+--- a/lib/xmlparse.c
++++ b/lib/xmlparse.c
+@@ -388,6 +388,7 @@ typedef struct {
+   int nDefaultAtts;
+   int allocDefaultAtts;
+   DEFAULT_ATTRIBUTE *defaultAtts;
++  HASH_TABLE defaultAttsNames;
+ } ELEMENT_TYPE;
+ 
+ typedef struct {
+@@ -3844,6 +3845,8 @@ storeAtts(XML_Parser parser, const ENCODING *enc, const char *attStr,
+                                          sizeof(ELEMENT_TYPE));
+     if (! elementType)
+       return XML_ERROR_NO_MEMORY;
++    if (! elementType->defaultAttsNames.parser)
++      hashTableInit(&(elementType->defaultAttsNames), parser);
+     if (parser->m_ns && ! setElementTypePrefix(parser, elementType))
+       return XML_ERROR_NO_MEMORY;
+   }
+@@ -7549,6 +7552,7 @@ dtdReset(DTD *p, XML_Parser parser) {
+     ELEMENT_TYPE *e = (ELEMENT_TYPE *)hashTableIterNext(&iter);
+     if (! e)
+       break;
++    hashTableDestroy(&(e->defaultAttsNames));
+     if (e->allocDefaultAtts != 0)
+       FREE(parser, e->defaultAtts);
+   }
+@@ -7590,6 +7594,7 @@ dtdDestroy(DTD *p, XML_Bool isDocEntity, XML_Parser parser) {
+     ELEMENT_TYPE *e = (ELEMENT_TYPE *)hashTableIterNext(&iter);
+     if (! e)
+       break;
++    hashTableDestroy(&(e->defaultAttsNames));
+     if (e->allocDefaultAtts != 0)
+       FREE(parser, e->defaultAtts);
+   }
+@@ -7683,6 +7688,10 @@ dtdCopy(XML_Parser oldParser, DTD *newDtd, const DTD *oldDtd,
+                                   sizeof(ELEMENT_TYPE));
+     if (! newE)
+       return 0;
++
++    if (! newE->defaultAttsNames.parser)
++      hashTableInit(&(newE->defaultAttsNames), parser);
++
+     if (oldE->nDefaultAtts) {
+       /* Detect and prevent integer overflow.
+        * The preprocessor guard addresses the "always false" warning
+@@ -7719,6 +7728,12 @@ dtdCopy(XML_Parser oldParser, DTD *newDtd, const DTD *oldDtd,
+           return 0;
+       } else
+         newE->defaultAtts[i].value = NULL;
++
++      NAMED *const nameAddedOrFound = (NAMED *)lookup(
++          parser, &(newE->defaultAttsNames), attributeName, sizeof(NAMED));
++      if (! nameAddedOrFound) {
++        return 0;
++      }
+     }
+   }
+ 
+@@ -8458,6 +8473,8 @@ getElementType(XML_Parser parser, const ENCODING *enc, const char *ptr,
+                                sizeof(ELEMENT_TYPE));
+   if (! ret)
+     return NULL;
++  if (! ret->defaultAttsNames.parser)
++    hashTableInit(&(ret->defaultAttsNames), getRootParserOf(parser, NULL));
+   if (ret->name != name)
+     poolDiscard(&dtd->pool);
+   else {
+-- 
+2.43.0
+
diff --git a/meta/recipes-core/expat/expat/CVE-2026-45186-07.patch b/meta/recipes-core/expat/expat/CVE-2026-45186-07.patch
new file mode 100644
index 0000000000..77fafd67e4
--- /dev/null
+++ b/meta/recipes-core/expat/expat/CVE-2026-45186-07.patch
@@ -0,0 +1,52 @@
+From 6c72e124eb8f699977600edc5183ecce89ce13ec Mon Sep 17 00:00:00 2001
+From: Sebastian Pipping <sebastian@pipping.org>
+Date: Sun, 8 Mar 2026 23:06:29 +0100
+Subject: [PATCH 7/8] lib: Leverage ELEMENT_TYPE.defaultAttsNames for attribute
+ collision detection
+
+.. to resolve quadratic runtime behavior
+
+(cherry picked from commit 4cd4eb0683e04cd45a2ffc81a08ca2a2663994b5)
+
+CVE: CVE-2026-45186
+Upstream-Status: Backport [https://github.com/libexpat/libexpat/pull/1216/commits/4cd4eb0683e04cd45a2ffc81a08ca2a2663994b5]
+Signed-off-by: Theo Gaige <tgaige.opensource@witekio.com>
+---
+ lib/xmlparse.c | 14 ++++++++++----
+ 1 file changed, 10 insertions(+), 4 deletions(-)
+
+diff --git a/lib/xmlparse.c b/lib/xmlparse.c
+index 4a29c18f..b3f0b734 100644
+--- a/lib/xmlparse.c
++++ b/lib/xmlparse.c
+@@ -7177,10 +7177,10 @@ defineAttribute(ELEMENT_TYPE *type, ATTRIBUTE_ID *attId, XML_Bool isCdata,
+   if (value || isId) {
+     /* The handling of default attributes gets messed up if we have
+        a default which duplicates a non-default. */
+-    int i;
+-    for (i = 0; i < type->nDefaultAtts; i++)
+-      if (attId == type->defaultAtts[i].id)
+-        return 1;
++    NAMED *const nameFound
++        = (NAMED *)lookup(parser, &(type->defaultAttsNames), attId->name, 0);
++    if (nameFound)
++      return 1;
+     if (isId && ! type->idAtt && ! attId->xmlns)
+       type->idAtt = attId;
+   }
+@@ -7227,6 +7227,12 @@ defineAttribute(ELEMENT_TYPE *type, ATTRIBUTE_ID *attId, XML_Bool isCdata,
+   att->isCdata = isCdata;
+   if (! isCdata)
+     attId->maybeTokenized = XML_TRUE;
++
++  NAMED *const nameAddedOrFound = (NAMED *)lookup(
++      parser, &(type->defaultAttsNames), attId->name, sizeof(NAMED));
++  if (! nameAddedOrFound)
++    return 0;
++
+   type->nDefaultAtts += 1;
+   return 1;
+ }
+-- 
+2.43.0
+
diff --git a/meta/recipes-core/expat/expat/CVE-2026-45186-08.patch b/meta/recipes-core/expat/expat/CVE-2026-45186-08.patch
new file mode 100644
index 0000000000..1ce5494d3d
--- /dev/null
+++ b/meta/recipes-core/expat/expat/CVE-2026-45186-08.patch
@@ -0,0 +1,39 @@
+From 594f59a8013ab78cd2e439f4c8d56ed5d261b0a4 Mon Sep 17 00:00:00 2001
+From: Sebastian Pipping <sebastian@pipping.org>
+Date: Fri, 8 May 2026 22:16:24 +0200
+Subject: [PATCH 8/8] Changes: Document CVE-2026-45186
+
+(cherry picked from commit 1045a780a850f1fd0ee3a59b04ec79dd659705ec)
+
+CVE: CVE-2026-45186
+Upstream-Status: Backport [https://github.com/libexpat/libexpat/pull/1216/commits/1045a780a850f1fd0ee3a59b04ec79dd659705ec]
+Signed-off-by: Theo Gaige <tgaige.opensource@witekio.com>
+---
+ Changes | 11 +++++++++++
+ 1 file changed, 11 insertions(+)
+
+diff --git a/Changes b/Changes
+index 4265d608..1d91af70 100644
+--- a/Changes
++++ b/Changes
+@@ -30,6 +30,17 @@
+ !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
+ 
+ Patches:
++        Security fixes:
++           #1216  CVE-2026-45186 -- Fix quadratic runtime from attribute name
++                    collision checks that allowed denial of service attacks
++                    through moderately sized crafted XML input (CWE-407).
++                    Please note that a layer of compression around XML can
++                    significantly reduce the minimum attack payload size.
++
++        Special thanks to:
++            Berkay Eren Ürün
++            Nick Wellnhofer
++
+         Security fixes:
+      #1018 #1034  CVE-2025-59375 -- Disallow use of disproportional amounts of
+                     dynamic memory from within an Expat parser (e.g. previously
+-- 
+2.43.0
+
diff --git a/meta/recipes-core/expat/expat_2.6.4.bb b/meta/recipes-core/expat/expat_2.6.4.bb
index 151720a9e3..a1997ecbba 100644
--- a/meta/recipes-core/expat/expat_2.6.4.bb
+++ b/meta/recipes-core/expat/expat_2.6.4.bb
@@ -51,6 +51,14 @@ SRC_URI = "${GITHUB_BASE_URI}/download/R_${VERSION_TAG}/expat-${PV}.tar.bz2  \
            file://CVE-2026-32777-02.patch \
            file://CVE-2026-32778-01.patch \
            file://CVE-2026-32778-02.patch \
+           file://CVE-2026-45186-01.patch \
+           file://CVE-2026-45186-02.patch \
+           file://CVE-2026-45186-03.patch \
+           file://CVE-2026-45186-04.patch \
+           file://CVE-2026-45186-05.patch \
+           file://CVE-2026-45186-06.patch \
+           file://CVE-2026-45186-07.patch \
+           file://CVE-2026-45186-08.patch \
            "
 
 GITHUB_BASE_URI = "https://github.com/libexpat/libexpat/releases/"
-- 
2.43.0


