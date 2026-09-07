Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74C16C79FA0
	for <webhook@archiver.kernel.org>; Mon,  7 Sep 2026 13:10:41 +0000 (UTC)
Received: from PA4PR04CU001.outbound.protection.outlook.com (PA4PR04CU001.outbound.protection.outlook.com [40.107.162.62])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.34629.1788786637166409052
 for <openembedded-core@lists.openembedded.org>;
 Mon, 07 Sep 2026 06:10:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=j+YzUh2T;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=j+YzUh2T;
 spf=pass (domain: arm.com, ip: 40.107.162.62, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=b6Kz/cGdGuULjt460oARQZ9m634fps7z22VLyNhqE7/DBrZi87do/N//X28363w2pwzUmcafBMd5iGKuSKVbpheuu1ZSxEhd2E91qNfiFWnu9dj0IaXzIk5nI2Y9Fdxaluw29OZIKqGQBJ4XWeHwpyvSOPsu8xI5384vvbYRR3QdM0Adz4RvkikLkPPNBN71Ith4UWySlOS2HskqLXtlXKWOq89XGix6+b2XRXmubVpnR7L11R6dbzlRBmX3dRYBMMvMfF4E7KZHgYeWqwn/HktTgqEuJcTjaIfq2D7CLOnFQ4Jxv7ebV+AjpcBaSdJNHQvSzfwyYaEtovYcwSY1IA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ftmMOF2+036IqMp0PEn3a7pWiYwA43k8XxVzL/S+7NQ=;
 b=FcmhqArkl8+UAcDPrFGxN+hxAQIPG1GeXA0fIZJuKVI2HZAlELVC4R0rEzPseiCt6ETFEO2mDfU3eNxNJboiIy9x/E7bZViRAxWAx50m+VJQE4BNraAjzdRE5J/R+XBL0p/kMxQh0F/dUaFMRfzdvCc/E2DP3z/LnkY9gsvqIUqh+H1+SWgRMce/tvXOogOypYanYjCFsQAIM5+hRAVpqLoJPj7A3S4RQA6jDoA4XF+aRAP55ZwEB8cVHnN47HAOTRjerjaC6UDJcmizBT+3+RF3pzergW2eH5LYA/sY0ynPdvsTHKvPweUwcHxrnRGrq9IuCMkX+GqTF4geZBUP2A==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ftmMOF2+036IqMp0PEn3a7pWiYwA43k8XxVzL/S+7NQ=;
 b=j+YzUh2TDDkGvLPSDt6FIMqsKlQnfIBnftQRQLHMRdtXS6L0Q+qmICw9oefG3jVPN+RKLm8/oCrP/dLZifxVOxJEg8kclwXTfheicakW8nqbtvA7m/52ok9Zhtj++PWXGsfe3SAJsLWSB12dfK8PIaO1ahOEmB43MVwBr1KKEGg=
Received: from DU2PR04CA0293.eurprd04.prod.outlook.com (2603:10a6:10:28c::28)
 by DB9PR08MB8359.eurprd08.prod.outlook.com (2603:10a6:10:3d9::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.6; Mon, 7 Sep 2026
 13:10:31 +0000
Received: from DB5PEPF00014B9D.eurprd02.prod.outlook.com
 (2603:10a6:10:28c:cafe::2c) by DU2PR04CA0293.outlook.office365.com
 (2603:10a6:10:28c::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.382.15 via Frontend Transport; Mon, 7
 Sep 2026 13:10:31 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DB5PEPF00014B9D.mail.protection.outlook.com (10.167.8.164) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.406.5
 via Frontend Transport; Mon, 7 Sep 2026 13:10:30 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uL3k8V5rTvIXDrobePuLHjgfauRsfd14NWCGIRIEoiTuV8jJDw7vxgRxRS0sjOf9pb8I6Y29AGVr5RsdDVAhYnQdKo9+R7vi+9SRuc0hyzowF3p5lguEniJHDxTccCKtVuFSwOsxo7SR1hZr0QY3YW2hLZf3QzardgDclfeMkHBWa2Bjn8niJVdcdcdd99H1/gdv4XqBHx14Y+V09vGyMmd283riKcj8N2aZeCLjrZHWiXeUgXSi8RNeu0aP0zO2KdfzMMxtejjonlK4ebvQNmQWCEky1B4V25LnGdHnh1Lh51eMTQI9z/el5Yl1my85PJMH9eBKdfRGtXLoEtf5TQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ftmMOF2+036IqMp0PEn3a7pWiYwA43k8XxVzL/S+7NQ=;
 b=bAvINjLPD6W4ZehUniZPHtwly7RFH6HUdZIagevk4piQNoUG5LDz0rhuazX6SmNKz42B9/H1pM2kjgLlZeOdk14uGMXc6IUtvK+P1Kv82yKkdMcaYaiIekXA9P/ytDkjEG4dy9rZmN0IG3jE6oiTJ7fzOOE7sZSfJl+fq+M1rqGTqdaGOjKMJ4+iahwU3HsBW6Lu+RTzQEzeMuuN1GzDz6iKoCzKlGHuaBi+MVokiEDwmyvxseGzNdsa0GvEumS5g5IAKIz+1L/YzALYsfoai2EisE1AASYy6JQuQIq1FkUczVj2/yfvzEnpQclD/YiOqTBs6qAOko0p2EyT+9tCLA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ftmMOF2+036IqMp0PEn3a7pWiYwA43k8XxVzL/S+7NQ=;
 b=j+YzUh2TDDkGvLPSDt6FIMqsKlQnfIBnftQRQLHMRdtXS6L0Q+qmICw9oefG3jVPN+RKLm8/oCrP/dLZifxVOxJEg8kclwXTfheicakW8nqbtvA7m/52ok9Zhtj++PWXGsfe3SAJsLWSB12dfK8PIaO1ahOEmB43MVwBr1KKEGg=
Received: from AM9PR08MB6258.eurprd08.prod.outlook.com (2603:10a6:20b:287::19)
 by DB8PR08MB5516.eurprd08.prod.outlook.com (2603:10a6:10:f9::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.6; Mon, 7 Sep 2026
 13:09:55 +0000
Received: from AM9PR08MB6258.eurprd08.prod.outlook.com
 ([fe80::171d:1f8b:720d:7a1b]) by AM9PR08MB6258.eurprd08.prod.outlook.com
 ([fe80::171d:1f8b:720d:7a1b%4]) with mapi id 15.21.0406.005; Mon, 7 Sep 2026
 13:09:55 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>, openembedded-architecture
	<openembedded-architecture@lists.openembedded.org>
Subject: RFC: Semantic change to PYPI_PACKAGE in pypi.bbclass
Thread-Topic: RFC: Semantic change to PYPI_PACKAGE in pypi.bbclass
Thread-Index: AQHdPsot9uNBGtkfLk+Hy2CcHuQhpA==
Date: Mon, 7 Sep 2026 13:09:55 +0000
Message-ID: <18E925A3-6509-4631-86DD-7420C1B3C18A@arm.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3864.700.51.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	AM9PR08MB6258:EE_|DB8PR08MB5516:EE_|DB5PEPF00014B9D:EE_|DB9PR08MB8359:EE_
X-MS-Office365-Filtering-Correlation-Id: 8b34f3f5-32d6-45f6-e42b-08df0ce164d5
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|376014|366016|23010399003|1800799024|38070700021|10067099003|56012099006|11063799006|18002099003;
X-Microsoft-Antispam-Message-Info-Original: 
 TuJHZjPjOxNX1+EKHHnjW19DrvzSnzkHEi7c/vplLPN019YJ8AK6AY+KePOH3dUENb71Q1UfRT6G0WV421cGlYENnWbQXcOd7PlQXr3WfWAb1LeY2VwLISx330XkH3D1o/xBKTr29+uwyzTumXBGDp2sprx8R38zWEWeggd6yjtgrZGOtcQQTBmP6yvnfXXas5vxQC8ClLKDBA9+Vv80khDkmor+Hz+bGPuyLtcO8dk1zq1CSWvYJc3pZtETQ7dNxIBzy2q+0orSJOPWC73wQDgk9r8dUGYgsDWb5+mKBxbYfFI441ufSf7UmrsOHvv1z2yxQUXowPy4JBOE3TUkXjn8HoS3DTj62DoP5g5lNauRFawCOKHmkN2qdVbm3nZ4b/hxUUZJwyttNAZhW+8fnhdhap60F8reNMS+7xQ2V92fSsTSU+eHBpJDF/MBe2c5rZdSD8XezuP45MS4VDoZTJrr/JB/ckVoWpcO9eHeG0SWI2NXNBvbDL+ejgWZg3+BF4KNvbqWGnf4iQF+z2H5icnycD2V5kI/5m2UQjhyCiSLuR2Hqm0G/nEYMwqKEvwdrnezmAxMXrb6jrkvIb2K/gAIZEGQ7aBHTc7hNuxNaBr2w5yyJiQiJwwN+h+cpG4e6JZmKW72B2KI3ANWMSm2RRvCRXoSnXPjGnoO1mtacKg=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR08MB6258.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(23010399003)(1800799024)(38070700021)(10067099003)(56012099006)(11063799006)(18002099003);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <73061BFEFED1054EA6AF856845DB1B41@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: 
 aIxTBb1g0CLgU5PzVwHxoHQ3ElaoeC3mptWJZyha5QuUpDt83DMFCJvBjmgZn8ng4t4ByviHoQdvAyFiJXezz48kiSO/+md0Eh1+x4FyCdaNVW/LTaHqJEA/fGcarwQJq24OC+TNIoVPB7sS2NWDQhU2nGCDtou7L+yNQ0qPXAXtw55UaAefGpR4LxoxfhB1mr3c0heOUrARq9qR+o0iJdOlNWT1FILYC/+zzYuQ3ZALRSIXRp2EMc2Va1nbfsEnvWqPczB6NJU2PlFr5qq0lEFe/i/4TyBFjjGQ27knLEVLlVcesUdf7RxZSzgty6Z6UeO5lHENOFhdaPCbYxYEWA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR08MB5516
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DB5PEPF00014B9D.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	7ca9c13e-5a8f-4a75-c0ca-08df0ce14feb
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|35042699022|82310400026|14060799003|1800799024|23010399003|36860700016|13003099007|10067099003|56012099006|11063799006|18002099003;
X-Microsoft-Antispam-Message-Info: 
	k09dBIH1JRHJQg3NUXoTAJKjb27vi6mpa+KPmeOu0Zr7rtOQctOGkfmnW9YdlawVYk99gTT4F4Xxvktly6Xq4nEthTsxC+cPVtUGxowkE7eJuIyAILDUFIWKxPZDrvEuXneDsJCD8k1pmydQlz3TJpjyAMF2aFO4Rn9H0XyDfz6zVjm6IUfMe7YAsqJLoK2gF3ypRQcYjGxrEZmvl8H+6GgJJZUZcIHQgP/1zE/dBtGcsuTjSGISap1cCFDKVpfIB1IbpKk4as1dtS6Jujn79ZcU6mQjz4RUb0b0GlJJrZ+MpO8vT52OFHbW2nPOB12KgEs+720pZiI/vTr4TCejmPvP6eRRUJLj10p90Y8YUu+AxQtIpqyejbWfg7jqszmybWfq/QqAgb6W+ERGShXOwOLpkN2n5Ra7nCEqNCpxmS3ThipDECvneTq3PKRvcOLZKQORcyP0GFSCcAavd3c8Q6TrGFyMwm47RptfxH0iVpaJ2UwQ9+FlUWufxLF1sJt87YaiHB61hsHW0wikae2AIqUnpaM6d1zLMdWlvkaUTk5SWFTwkklDZHqWXnLv1+P9weDTUCg09H32DsWYC1wyW8qPzDui7CkVtRI0o/p63OEGHRtGeg5eT8B67+GWsJNV4KZPVMpgxN9YV5AmIT1gqw==
X-Forefront-Antispam-Report: 
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(35042699022)(82310400026)(14060799003)(1800799024)(23010399003)(36860700016)(13003099007)(10067099003)(56012099006)(11063799006)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	Uve54GgLnheWbVtLynryryLEgOC1tCEbYr4voJ5V9rz7Xy9ChduK+NKrYzzANRQWI9YXPNC6NLSq8tje7ec0NCHOqj7uOmrj5hSOpS6o3HYJdwW8s3HNUIYtandbTJSicILBNdO3lIvqWwe96LMzaSMm+GtyURwkT5wtXwSoteyI8PD0SU0WnMhPiLqUL/7c/bdZdHfkdeU4cP0XNlND2jhxmgOlkdw9LeCfMXasHwNsfZ6u3BlHUt1zBUsuO9XeZdA550HroPjMIIpj8KJKf+q41MMaZgR4x5IdDhpTOSJ3Xi5e2Nv5zhRUEc9/yoHuy2JeWu4s4ypjZv56Vsc3h2CmZFLna6f1q3q1sHinY0eUmCHPZaPN0qsgO2kxlS/P0p8NeZWiLszDxL/Rgs81pbwiEaPusPn3u6ZqCR2GemLY3F3o8+aiU1/E2GsIAOJU
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Sep 2026 13:10:30.8358
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8b34f3f5-32d6-45f6-e42b-08df0ce164d5
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB5PEPF00014B9D.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB8359
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 07 Sep 2026 13:10:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245256

SGksDQoNCkZvciBzb21lIHRpbWUgbm93IEnigJl2ZSBiZWVuIHdhbnRpbmcgdG8gY2hhbmdlIHRo
ZSBweXBpLmJiY2xhc3MgdmFyaWFibGVzIHNvIHRoYXQgdGhleeKAmXJlIG1vcmUgbG9naWNhbCBh
bmQgdXNlZnVsLCBzcGVjaWZpY2FsbHkgUFlQSV9QQUNLQUdFLiAgVGhlIGltcGV0dXMgYmVoaW5k
IHRoaXMgd2FzIGEgbWl4IG9mIHRoZSBtZWFuaW5nIG5vdCBiZWluZyBlbnRpcmVseSBvYnZpb3Vz
LCBhbmQgYSBkZXNpcmUgdG8gYXV0by1nZW5lcmF0ZSBweXRob24gcGFja2FnZSBkZXBlbmRlbmNp
ZXMsIHdoaWNoIHdvdWxkIG5lZWQgdGhlIGNvcnJlY3QgcGFja2FnZSBuYW1lIHRvIGJlIGtub3du
LiAgSeKAmXZlIGJlZW4gbWVhbmluZyB0byBzZW5kIHRoaXMgZm9yIHRoZSBlbnRpcmUgcmVsZWFz
ZSBjeWNsZSBidXQgbmV2ZXIgYWN0dWFsbHkgZmluaXNoZWQgaXQgdW50aWwgbm93LCBzbyBJ4oCZ
bSBwb3N0aW5nIHRoaXMgYXMgYSBSRkMgbm93IHRoYXQgd2UgbW9zdCBsaWtlbHkgbWVyZ2UgaW4g
TTEgYWZ0ZXIgdGhlIG5leHQgcmVsZWFzZS4NCg0KQ3VycmVudGx5LCBQWVBJX1BBQ0tBR0UgaXMg
YWN0dWFsbHkgdGhlIG5hbWUgb2YgdGhlIHNkaXN0IChzb3VyY2UgZGlzdHJpYnV0aW9uKSB0YXJi
YWxsLiAgQXMgc29tZSByZWxlYXNlcyBhcmUgcXVpdGUgb2xkIHRoaXMgbWF5IG9yIG1heSBub3Qg
aGF2ZSBiZWVuIG5vcm1hbGlzZWQsIHNvIHRoZSBzZGlzdCBuYW1lIGNhbuKAmXQgYWx3YXlzIGJl
IHVzZWQgZm9yIGhvbWVwYWdlIGxpbmtzLCB1cGdyYWRlIGNoZWNraW5nLCBvciBkZXBlbmRlbmNp
ZXMuDQoNCldlIGRlZmF1bHQgUFlQSV9QQUNLQUdFIHRvIHRoZSByZWNpcGUgbmFtZSB3aXRoICJw
eXRob24zLeKAnCBzdHJpcHBlZCBvZmYsIGJ1dCBhcyBwcm9wZXIgc2Rpc3QgZmlsZW5hbWUgbm9y
bWFsaXNhdGlvbiBpbnZvbHZlcyB0aGUgc3RhbmRhcmQgbm9ybWFsaXNhdGlvbiBhbmQgdGhlbiB0
dXJuaW5nIC0gdG8gXyAoc2VlIFsxXSksIGFuZCBfIGluIHJlY2lwZSBuYW1lcyBpcyBhIGJhZCBp
ZGVhLCB3ZSBub3cgbmVlZCB0byBleHBsaWNpdGx5IGFzc2lnbiBQWVBJX1BBQ0tBR0UgaW4gYSB0
aGlyZCBvZiByZWNpcGVzIGluIG9lLWNvcmUgKGFuZCB0aGF0IHBlcmNlbnRhZ2Ugd2lsbCBvbmx5
IGluY3JlYXNlIGFzIG1vcmUgcGFja2FnZXMgYXJlIHVwbG9hZGVkIHdpdGggbm9ybWFsaXNlZCBu
YW1lcykuDQoNCkkgcHJvcG9zZSBzd2l0Y2hpbmcgUFlQSV9QQUNLQUdFIHRvIGJlIHRoZSBhY3R1
YWwgcGFja2FnZSBuYW1lIChkZWZhdWx0aW5nIHRvIGEgdmFsdWUgZGVyaXZlZCBmcm9tIHRoZSBy
ZWNpcGUgbmFtZSBhcyBiZWZvcmUpLCB3aGljaCB3ZSB0aGVuIG5vcm1hbGlzZSBhcyBuZWVkZWQg
Zm9yIHRoZSB1cGRhdGUgY2hlY2sgYW5kIHNkaXN0IGZpbGVuYW1lLiAgQXMgdGhlIHVwZGF0ZSBj
aGVjayBVUkxzIGFyZSBzcGVjaWZpZWQgdG8gYmUgdGhlIG5vcm1hbGlzZWQgbmFtZSB0aGF0IHdp
bGwgYWx3YXlzIHdvcmssIGFuZCB3ZSBjYW4gY2F0ZXIgZm9yIG5vbi1ub3JtYWxpc2VkIHNkaXN0
cyBieSBhZGRpbmcgUFlQSV9QQUNLQUdFX1NESVNUIGZvciB0aGF0IHB1cnBvc2UuDQoNClRoaXMg
aW52b2x2ZXMgYSBiaXQgb2YgY2h1cm4gdG8gdXBkYXRlIFBZUElfUEFDS0FHRSBhbmQgc2V0IFBZ
UElfUEFDS0FHRV9TRElTVCB3aGVyZSBuZWVkZWQsIGJ1dCBpdOKAmXMgYSBuZXQgcmVkdWN0aW9u
WzJdIGFuZCBvdmVyIHRpbWUgdGhlIG51bWJlciBvZiBQWVBJX1BBQ0tBR0VfU0RJU1QgYXNzaWdu
bWVudHMgd2lsbCB0ZW5kIHRvIHplcm8uDQoNCk9idmlvdXNseSwgSSBoYXZlIHRoaXMgd29yayBk
b25lIGFscmVhZHkgaW4gb2UtY29yZS1jb250cmliOnJvc3Mvd2lwL3B5cGktd2lwIGFuZCBoYXZl
IGFsc28gdXBkYXRlZCBtZXRhLW9lLg0KDQpJIHRoaW5rIHRoaXMgaXMgdGhlIHJpZ2h0IHRoaW5n
IHRvIGRvLCBidXQgb25lIHRoaW5nIGlzIG5pZ2dsaW5nIG1lIHdoaWNoIGlzIHdoeSBJIGFsd2F5
cyBzdGFsbGVkIG9uIGZpbmlzaGluZyB0aGUgc2VyaWVzLiBXZSBjb3VsZCBzYXkgdGhhdCBQWVBJ
X1BBQ0tBR0UgaXMgdGhlIG5vcm1hbGlzZWQgcGFja2FnZSBuYW1lIChzbywgamluamEyIG5vdCBK
aW5qYTIsIHFlbXAtcW1wIG5vdCBxZW11LnFtcCkgaW5zdGVhZCBvZiB0aGUgcmVhbCBuYW1lIGFu
ZCB0aGF0IHdvdWxkIHJlbW92ZSB0aGUgbmVlZCB0byBub3JtYWxpc2UgaXQgYW55IGZ1cnRoZXIu
ICBUaGUgc2Rpc3QgaXMgYmFzZWQgb24gdGhpcyBub3JtYWxpc2VkIG5hbWUsIHRoZSByZWxlYXNl
cyBBUEkgdXNlcyB0aGUgbm9ybWFsaXNlZCBuYW1lLCB0aGUgaG9tZXBhZ2UgbGlua3Mgd29yayB3
aXRoIGJvdGggb3JpZ2luYWwgYW5kIG5vcm1hbGlzZWQgbmFtZXMsIGFuZCBpbiBhbnkgZnV0dXJl
IGF1dG9tYXRpYyBkZXBlbmRlbmN5IGdlbmVyYXRpb24gd2UgY2FuIHdvcmsgd2l0aCBub3JtYWxp
c2VkIG5hbWVzIGFueXdheS4NCg0KSeKAmW0gdG9ybiBvbiB0aGlzOiB1c2luZyB0aGUgcmVhbCBw
YWNrYWdlIG5hbWUgaXMg4oCcY29ycmVjdOKAnSBhbmQgZWFzeSB0byBleHBsYWluIChpdOKAmXMg
dGhlIG5hbWUgb24gcHlwaS5vcmcgPGh0dHA6Ly9weXBpLm9yZy8+LCBvciBpbiB0aGUgcHlwcm9q
ZWN0LnRvbWwpIGJ1dCB1c2luZyB0aGUgbm9ybWFsaXNlZCBuYW1lIG1lYW5zIG1vcmUgcmVjaXBl
cyB3b3VsZCB3b3JrIHdpdGhvdXQgYXNzaWdubWVudHMuIEZvciBleGFtcGxlLCB3aXRoIHRoaXMg
Y2hhbmdlIGluIGNvcmUgd2XigJlkIG5vIGxvbmdlciBuZWVkIHRvIHNldCBQWVBJX1BBQ0tBR0Ug
Zm9yIHB5dGhvbjMtamluamEyIChKaW5qYTIpLCBweXRob24zLXB5c29ja3MgKFB5U29ja3MpLCBv
ciBweXRob24zLXFlbXUtcW1wIChxZW11LnFtcCkuDQoNCkFueSB0aG91Z2h0cz8NCg0KQ2hlZXJz
LA0KUm9zcw0KDQpbMV0gaHR0cHM6Ly9wYWNrYWdpbmcucHl0aG9uLm9yZy9lbi9sYXRlc3Qvc3Bl
Y2lmaWNhdGlvbnMvc291cmNlLWRpc3RyaWJ1dGlvbi1mb3JtYXQvDQpbMl0gRm9yIG9lLWNvcmUs
IDQ2IGZpbGVzIGNoYW5nZWQsIDE1IGluc2VydGlvbnMoKyksIDY5IGRlbGV0aW9ucygtKQ==

