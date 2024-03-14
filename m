Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 678F5C54E67
	for <webhook@archiver.kernel.org>; Thu, 14 Mar 2024 15:32:57 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (EUR05-DB8-obe.outbound.protection.outlook.com [40.107.20.54])
 by mx.groups.io with SMTP id smtpd.web10.16003.1710430376307757826
 for <openembedded-core@lists.openembedded.org>;
 Thu, 14 Mar 2024 08:32:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=ZKub4c5+;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=ZKub4c5+;
 spf=pass (domain: arm.com, ip: 40.107.20.54, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=g1lhmugp6Sl0SIAX2diZu2CdJhH54UGGknY+f4Zt0Yhd7xbo7xk1QJyGHh5rVhlhBB0Va3cBbDd7hDBpIQxSyCPx25lByUbsy6y8SXPj2n98y8b849QrPi0ALFPCEdWdykIg6cCkJFt4ZBFjdMqg8E6MMSht+B+U3fiR2tgePrXPbnuD+a10I7W4ItN0GrZLc3I354oSwC3E3bq8leLyjKHMDb6HmckI4lFga/bpP9FprJJWBNkdaqoftlXJ70AbqeMpMPaAbeYF59sjtYxgCFWaPsZBuA9HbI9Fan7W7cw5A84GiRaKqgShXkKLTzAzg4KIpL2gGDlTox1YUJEWLw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8huA5IftzVISGu8isyWo/EtdSUsE4eKhVclXACnvVvM=;
 b=D67QQrDw/q5xJaWinyrczMWl85QFfP8vJ9yGak832XWqrnb5K5/0vfzOYkOQIJvhRw8iPoVmamZjdv6QWkvG7wQP2pE4P3csT8BFmgHSV7XXRatyfn3A1E4rCNxLn2WiJvdAyxfklOHlH62l7cOxHeFuSS7vHcqVtVPVVnAa+7LQoxwhynbGm1kIWoDYXHkPqySifahPP2oNWCcRFmRzEkBOH6zUp+zGFzlgYbSItcfW7B0jliRcOD0UtIwPiMrwE3nZd5Sxg8ivPAWjNyFdJ439X+3USBlUEuqPRjoqqL3LtmkBZT0dIn+6+lPKtUw/+Iw4Icj86+gfl9edXmfc1Q==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8huA5IftzVISGu8isyWo/EtdSUsE4eKhVclXACnvVvM=;
 b=ZKub4c5+UjPbslS09cChVgW5fcL9eELGni92KnVljszQjj1S28w8T8ndVNP8piBPA+4vmWLCGW+uczWmfn3BdWdcazi4a1yzX2WyrUsziTFc4ttEfBcWv/4GRX18XyndIFa4rVUzl8K62ZETh3KQPeoFR37XP8g708sPomJSNJs=
Received: from AM0PR06CA0123.eurprd06.prod.outlook.com (2603:10a6:208:ab::28)
 by VI1PR08MB9982.eurprd08.prod.outlook.com (2603:10a6:800:1c4::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7386.18; Thu, 14 Mar
 2024 15:32:52 +0000
Received: from AM3PEPF0000A79A.eurprd04.prod.outlook.com
 (2603:10a6:208:ab:cafe::67) by AM0PR06CA0123.outlook.office365.com
 (2603:10a6:208:ab::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7386.21 via Frontend
 Transport; Thu, 14 Mar 2024 15:32:52 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM3PEPF0000A79A.mail.protection.outlook.com (10.167.16.105) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7386.12 via Frontend Transport; Thu, 14 Mar 2024 15:32:51 +0000
Received: ("Tessian outbound 5180408f3322:v276"); Thu, 14 Mar 2024 15:32:51 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 3fe17fd97597184a
X-CR-MTA-TID: 64aa7808
Received: from 855550d022ab.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id C8F65090-7EF0-41F6-9EBC-C5BEA2C7811A.1;
	Thu, 14 Mar 2024 15:32:44 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 855550d022ab.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Thu, 14 Mar 2024 15:32:44 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PDMVh7D1ddQHVlM+T7o0ihGEmQMxo2tyS/SIzfXNLA5ooLmS0HBk99ZnNLihoARnPNdAtMRRSUTWfHkpeb6nKwzP8KDJI8x0bblHcC4PPct826RPivfdfsEszMm1ex8BypfdL2mEqAQhsSYGJc2a7s7eIjTWdwoyHYJXqC/35xyH1c/JjtEk0UKn9v9UOXQ55O1y+nzuQXlxX05ji5QffFFPuKa5Iqia3XE63tOK4tPJYQyWWf225Zln03z8fncHI6DiLN5TQi/xY1aOYLQzGCTzO3eAfYgOB/fRWeHgZzV9T9G604ycJCSXmnNvkSCi9Qhl5M2tvnAeoSm1qJjfog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8huA5IftzVISGu8isyWo/EtdSUsE4eKhVclXACnvVvM=;
 b=mkmnKJ7adjIBVKsWnD1Wgr5syBEu0ZFNh5Ox2+xHNiPLGbV5KUMNnMIeCdEufQauSRfFthfeAUyai28PlF+9u4u2+dhTB/nRP/hqYSqncybMPfMXGnTCDI4B3WlJiknRqZwcxAcp1ppLSnqLBM1YXJXqlouwAiC+lIPtmTFMbUuQ0Qz++JUifP6/Uu19oTYgMxvRa59qle+9Gt5jVWiLJbcutaajaGcrKpAByt7sgoAuGhm759FRFCjxCWd5vDGYOgyJLZ4NGkQxuygI/7S7E2jo9o0xL/SkFyy3MkPxdPotymL49XA87oV1Y5HMUJtWvOVkJ17RY5FDqopPx/wClQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8huA5IftzVISGu8isyWo/EtdSUsE4eKhVclXACnvVvM=;
 b=ZKub4c5+UjPbslS09cChVgW5fcL9eELGni92KnVljszQjj1S28w8T8ndVNP8piBPA+4vmWLCGW+uczWmfn3BdWdcazi4a1yzX2WyrUsziTFc4ttEfBcWv/4GRX18XyndIFa4rVUzl8K62ZETh3KQPeoFR37XP8g708sPomJSNJs=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by AM0PR08MB5363.eurprd08.prod.outlook.com (2603:10a6:208:188::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7386.19; Thu, 14 Mar
 2024 15:32:42 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::36de:39f1:4d:5228]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::36de:39f1:4d:5228%5]) with mapi id 15.20.7386.020; Thu, 14 Mar 2024
 15:32:42 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "martin.jansa@gmail.com" <martin.jansa@gmail.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH] insane: add patch-status to default ERROR_QA
 for all layers
Thread-Topic: [OE-core] [PATCH] insane: add patch-status to default ERROR_QA
 for all layers
Thread-Index: AQHadd6RKxe06hykN0WKzrRWegag+rE3XeuA
Date: Thu, 14 Mar 2024 15:32:41 +0000
Message-ID: <697FEB04-7741-41E1-B093-AB7E7BA733D7@arm.com>
References: <20240314070903.83765-1-martin.jansa@gmail.com>
In-Reply-To: <20240314070903.83765-1-martin.jansa@gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3774.400.31)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|AM0PR08MB5363:EE_|AM3PEPF0000A79A:EE_|VI1PR08MB9982:EE_
X-MS-Office365-Filtering-Correlation-Id: 91eb96dc-ca23-4f99-b420-08dc443c02b4
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 jUUdhqYCXRYrmYXsI+vAmqtF3BBPbfd+FS3eghF9b+gU01+SiCMnCJojMnq0NB+VjSQnPvODo8GiJDbJnIMdkiojajFlY8G2c95PbsTn6RwfswWeAD2hINwiIjMo8XyHRLnQFDwos8ZIKNRC4rTS1ZGLEstVjjkWouwVWPBtRBhr2f741I4+0zalFp38WuB+rUmCSEuZ2ldpCgOyE3EO43Yc67ykUYhEU2r4DExvzFtUBneiBwqTdUhivTHziczaMvAnvBShjjjDyeGdJ3viAx43rCsySU+/oQh2hjmLf4dO4MY4PXukD898ujk8lM79JrxAhH/cy/G1OPvNl8Mj0tvIWEWKQPHJ4M1riiPWfkcK/EivVvYigbpY0jzw+7qLNx154LFEmfgapLrQ7bRSkMjCTpIrXn0d9h2+nGI7m1f4FC+YLzGjs6AxCFtcz5Uf3K1H4epT7LqRBjWNlcUD3Sol7c4Uz2Cwxy+QfKnfVfqkXp38D8xco6QvbDxOtBJctWUK2tA7Nsi94DQ/FZ6XJJgUoVc5at6zks6LgRm/bBHdFVW77b8n2p8yXA2T2D74OU0ckTgzqCVnDzkdPcFNWBI91W+UllrtCr2Ku3Wbcxf+mPB2Vizx4vT/66Gi+4HxKALwNP0RC8WMQTFAel41e1KHX/r+1A1D9gBljB/bYOk=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005)(1800799015)(38070700009);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <F50684795A4C884F933A53663ECD05B1@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB5363
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM3PEPF0000A79A.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	1dc438fc-84d1-4a6a-b557-08dc443bfccf
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	S/UQvDQoTumB0Ylwnt4Oqvl7c+S5jb2LGyrCHo5hYVSLNgcHNlE5BUva683LR3Pt1e1nbbbtD25VJMMqWcrDfN0wbq8J11uVTP0WDm3+zFhB+sIcNQF+tst0Bsr5TVIA8EGr2a0TysrrDONO3vorf3exoEKW9i6IRJTzQsf0LunDU3nWN8PlDwbOLef+EUoLdrqsPErmwwkMtg1v2iBNAOXc8M+BHi69Y84X4xkritQWN1KUoaWJw8RkSeJHA4jxydUg86GQMAlJWjNsTZEuW2XqkCQxA9r7cAlBHZzI0wdOOAj/8dxRKNzWfcvg3WYa37Wh6vO89NDkVlQCOG5EbmLTmQsk/6FsZG3fSSXxXlHwtMvxqs4exLPULIJJKcutBoy4DNLIeHbgNanNx0ALyi4oZ/VUTLU3cgcjl0grCioY9QnfytI3sw4OapRkb+4gyLGCmLiaIOXJBqryqPy4yhegGo+msy197bSfMzJYcT9ABrsKlyjUxHZhqR+KnBZyEYf2yHpIroHeGYx7nAtm/WDSThyFD39lO+lNp1DknBwAJqTcp0wzo/mNnKf6Z3+dyMRcck2EWyxxbpyOOxi/FjvkqtDMvxtUP4k9T1htAhKsmm+rpqW2su9TdAsyx2d9uf8n7EflgMhBXLulORtmYU/RcNzjyEcpIUwrqNkZgQYj62KvPlLkDfoPLvAL5BJPiVnCZDnErGFhGZCoUgfpng==
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230031)(82310400014)(1800799015)(36860700004)(376005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Mar 2024 15:32:51.3422
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 91eb96dc-ca23-4f99-b420-08dc443c02b4
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM3PEPF0000A79A.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB9982
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 14 Mar 2024 15:32:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197112

T24gMTQgTWFyIDIwMjQsIGF0IDA3OjA5LCBNYXJ0aW4gSmFuc2EgdmlhIGxpc3RzLm9wZW5lbWJl
ZGRlZC5vcmcgPE1hcnRpbi5KYW5zYT1nbWFpbC5jb21AbGlzdHMub3BlbmVtYmVkZGVkLm9yZz4g
d3JvdGU6DQo+IA0KPiAqIGl0J3MgZW5hYmxlZCBmb3IgcGF0Y2hlcyBpbiBvZS1jb3JlIGZvciB2
ZXJ5IGxvbmcgdGltZSBhbmQgSSB3YXMgdXNpbmcNCj4gIGl0IGZvciBtYW55IG90aGVyIGxheWVy
cyBhcyB3ZWxsLCBzbyBtb3N0IGxheWVycyBzaG91bGQgYmUgaW4gZ29vZA0KPiAgc2hhcGUNCj4g
DQo+ICogaXQncyBhbHNvIHBvc3NpYmxlIHRvIGRpc2FibGUgaXQgZm9yIGluZGl2aWR1YWwgbGF5
ZXIgYXMgc2hvd24NCj4gIGJ5IG9lLWNvcmUgaW46DQo+ICBodHRwczovL2dpdC5vcGVuZW1iZWRk
ZWQub3JnL29wZW5lbWJlZGRlZC1jb3JlL2NvbW1pdC9tZXRhL2NsYXNzZXMtZ2xvYmFsL2luc2Fu
ZS5iYmNsYXNzP2g9c2NhcnRoZ2FwJmlkPTYxYTg4MWZkYmU4YjVhMjFjNjI3NmI4YTVkMDZjYzMw
NDg2YjFlYjMNCg0KVGhpcyBpcyBxdWl0ZSBhIOKAnHN0cm9uZ+KAnSBjaGFuZ2UgaW4gcG9saWN5
LCBlc3BlY2lhbGx5IGZvciBzbyBsYXRlIGluIHRoZSByZWxlYXNlIGN5Y2xlIChwb3N0LU0zKS4g
IEnigJltIG9uIHRoZSBmZW5jZSBidXQgbGVhbiB0b3dhcmRzIGxldHRpbmcgbGF5ZXJzIG9wdC1p
biwgaW5zdGVhZCBvZiBmb3JjaW5nIGl0IG9uIHRoZW0gYW5kIGhhdmluZyB0byBvcHQgb3V0Lg0K
DQpSb3Nz

