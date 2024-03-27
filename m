Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0FD38C54E67
	for <webhook@archiver.kernel.org>; Wed, 27 Mar 2024 20:17:52 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (EUR05-DB8-obe.outbound.protection.outlook.com [40.107.20.74])
 by mx.groups.io with SMTP id smtpd.web11.381.1711570662925860292
 for <openembedded-core@lists.openembedded.org>;
 Wed, 27 Mar 2024 13:17:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=kLEUpv8T;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=kLEUpv8T;
 spf=pass (domain: arm.com, ip: 40.107.20.74, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=LmAhc/nMc3XQVEVyXsVIicYNihlijgKBikzYyzro59YsHMwuuRhSPuIX+3Awgp5HElpB/CkTk9xUS2w+dmSdA8rQDJwkTuvLvrgKdIJap38TV7kIRrcTrWUo0yAADNw+WjkkwlJJmfrM8a01yX4V11x5TE6/wWOkUcl8zJp2fzWTG6pK0aHvoKB4mc81IKEkhtGpnspt8LapU7Bkk4/pvGLTpXxzDT63i+fzXo1XdnBK86HuniS5yOqGiw1nl09VOWs3q2cx3IwiUv1UJbW3TRR2W0/7g9T+2ha4T3vPfIxumIfiMiK4RhKFx3tWnBTN9rBcqK1QX8VZqj6zKrDfFg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DaEYvkaTj/HQX1FwuXkHTJRVvUP8sDok+xajUC1KfDc=;
 b=HZ+2qVe6wEmCd86IXkej5mkeE5fGBo72wDcp00ohpTlBhkpBR4qNm0ElkdJVUXHj0revDn+ZLi2e/3wMgSIWqmE8VM52re87HZ/135TGTM65MXUF/rdYDVh+x9u+uzdPUW3HO8l1GF8L4Lh3ABS27s7yp2cmzcSJZgChG3X5CXQ+ri/QSuUD+M4pS7fUaplqlKNRB7srNhU3M9ELS3w80LvxEEZ6SVnXdqlHkX62NM4tZaJOnWEh1qbiJeLfrUu3RF0ljQWSNUntPAhXvyQtr1d2olq8ANne2iG6ddi1yQ5rmONZ3r5iJliDZsihnWg9EoYQ7ABymDyHztIvBjrU9g==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DaEYvkaTj/HQX1FwuXkHTJRVvUP8sDok+xajUC1KfDc=;
 b=kLEUpv8Tiaac1yG/IMMfjbrBI+J6lCYvLzo27E0Sf4HTXmvhHfdIh/czkdr3wvx5y1xx388Uq77HTm3xMF98vV5JCK7SO9kwouzuc9SIjmZ9wK35GYXdq/xOA+QW8LuWgXIoTMAvYuZvsdH6yJL0+wkOwQZE/DVj3LtoRcGlw1I=
Received: from AS8P250CA0030.EURP250.PROD.OUTLOOK.COM (2603:10a6:20b:330::35)
 by DU0PR08MB7415.eurprd08.prod.outlook.com (2603:10a6:10:353::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.31; Wed, 27 Mar
 2024 20:17:39 +0000
Received: from AM2PEPF0001C70E.eurprd05.prod.outlook.com
 (2603:10a6:20b:330:cafe::4b) by AS8P250CA0030.outlook.office365.com
 (2603:10a6:20b:330::35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.13 via Frontend
 Transport; Wed, 27 Mar 2024 20:17:39 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM2PEPF0001C70E.mail.protection.outlook.com (10.167.16.202) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7409.10 via Frontend Transport; Wed, 27 Mar 2024 20:17:39 +0000
Received: ("Tessian outbound 1b0f2681ce6f:v300"); Wed, 27 Mar 2024 20:17:38 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 1a660207b357f39e
X-CR-MTA-TID: 64aa7808
Received: from 11734ea5911a.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id F168421F-DED7-4A29-B010-BE75211F07A7.1;
	Wed, 27 Mar 2024 20:17:32 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 11734ea5911a.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Wed, 27 Mar 2024 20:17:32 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BrLjd97g2WrAI2t0zdcfwJlFoTVAxSOAKhC8SMxDG+232N6MrUfEpDQjooGs0Q9yj7q9ztTlKV/M4OXnnWWtojsYrAZ9u7qVvm+pzYM6ZM1lHPAXUbmyTBBBkgUPji6XisWfoCvQjYLnzMDUF6pBn3wvYE52xsPuhkBDH4m4n21lGNKwx51WcR+a6J50e97+R/zXulQTO8LKVLJgYXvZRzySImlXImY2v2HkGOVJXSzzuX1AlldJ5lkiqbBq+0eabr3IX0alDQu3qZerLfmhlNOpeKZR6cNKw9M8qSJn5/gtl9hXgRGUR7+vP5GyJ8R0pu9PXzZfMu+VonJBCDAI/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DaEYvkaTj/HQX1FwuXkHTJRVvUP8sDok+xajUC1KfDc=;
 b=Z8RlLV/9r2Hrtt3B0VqYiOoIcc6hxsty2LF6AHnNJ1DajzSmkTGGwG3SDiTwfsNa3q7eM5GRl5I/Rc1u+mMfmuwpXZpOFXzuXojVlSLfoEEFxYr/15YBSgPqd6dt+obSFdptg4NGuVUsk+7781twK1anolHSaZqVa+C/2x3UK8nz+BkppzqB3s6vlP9xvF+rTLs/t/gXXrKzRJzM98mzrCi80HrtafKdUcwsJwXlOWGVgfGJ/ozBf7gTW5dbNNNVjL4RJ6pYSVHAjaFx/oyeQF4aDfrBuditiiTgmG3c7X5psersVPw6yiCpth8q9wliv77PKnBQUG4CCsOG88cKFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DaEYvkaTj/HQX1FwuXkHTJRVvUP8sDok+xajUC1KfDc=;
 b=kLEUpv8Tiaac1yG/IMMfjbrBI+J6lCYvLzo27E0Sf4HTXmvhHfdIh/czkdr3wvx5y1xx388Uq77HTm3xMF98vV5JCK7SO9kwouzuc9SIjmZ9wK35GYXdq/xOA+QW8LuWgXIoTMAvYuZvsdH6yJL0+wkOwQZE/DVj3LtoRcGlw1I=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by AS8PR08MB6376.eurprd08.prod.outlook.com (2603:10a6:20b:33e::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.32; Wed, 27 Mar
 2024 20:17:30 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::36de:39f1:4d:5228]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::36de:39f1:4d:5228%5]) with mapi id 15.20.7409.028; Wed, 27 Mar 2024
 20:17:30 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "omatiush@cisco.com" <omatiush@cisco.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH v2] curl: improve reproducibility
Thread-Topic: [OE-core] [PATCH v2] curl: improve reproducibility
Thread-Index: AQHagGpLcE4xn9QMs0OvN7aVNfORT7FMBrSA
Date: Wed, 27 Mar 2024 20:17:30 +0000
Message-ID: <98A19F22-6509-4CE0-B9E2-3E4BDC15676C@arm.com>
References: <20240327171434.949887-1-omatiush@cisco.com>
In-Reply-To: <20240327171434.949887-1-omatiush@cisco.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3774.400.31)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|AS8PR08MB6376:EE_|AM2PEPF0001C70E:EE_|DU0PR08MB7415:EE_
X-MS-Office365-Filtering-Correlation-Id: c1307486-b6ff-4663-4c3a-08dc4e9af324
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 LF59e0RHPg0TCT22bNpPyu824yZ16DEZb/McZ7OJjd2x0ZH7/6vIhSfV08wQDZpdXdItxs5zGqeNdUrkQylekVE8Y7PjOyEyHqPqxuNmovQ4rX8ev0So9BZ2GC4bW4RCopS8ZnkyzxeTmLGYo1B9S+c+wvS8k3FLZOZoyx+OYiFnX3r3Hlz32DVc/c/WE9loX4sNAvCNm6FlCqZPQ5BZiWjOpJ7FePV7ZpymmxPxrLNJOmagQyrzMa1EMApNgqLdZTdZ/rVg+ZSrNFC4LLi/09ugQ2Gl7iAluYd7l8IJiXyxio0q3ic4BBM99doCsokE/6NKwaqwRzz5rt2ofdxX7jObOIEGKtnrfjYzEMJE8nawVkDL42gilYljZJ6iGykW8BL9SMw6AultxeqwT+s5u3rSkUpUM7WgM9vwku76J0pK5PdE01VB4jZwJqfPbQvGYnjBkoNnhpImlcxQMYn2478T3qbPUmgeK4gjBe5daafERz5NOilhQzUsrrlO+2uYHwrxorW/DFOWapkRWnyc5hZUEM97J0jpmbn/0R0vpcNsEVqpCatCtrdt7zthgyMKnUqOmBAJuYz+RqTQDQjdaMZo9BdErDU9B46T8LpsYMiRSWOKE65RyuRaDxTGn/qJnqo1h87XQ3rdlAgKkBMwry2FUMC58AUkzpYtHUaC/my8DyNYsobqoWsG5cyUnkFWzB/Bvd2A4mJOqhFoZTM6o1esNq2HrsmrZoGuQtcXsOI=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366007)(376005)(1800799015)(38070700009);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <534A865E9B868E489B20AE6C02FFE03C@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6376
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM2PEPF0001C70E.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	2d4b6e2e-f417-43c9-fc24-08dc4e9aedd8
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	fnR5ELg1H1814z7tjCnRQ5v7bylVFFwtlHSlrhjGBB+udtsB3PQs33PVc79SYZBlwU256LtIOSNICi8mMEPcyYCV8fLRYNa+9rywA2hBUFrgWvA2x9Ms7an02p+ohcjCWhDjaFLAz4aMZZ28M7yd+I/6hB3tyJ5G9wBITC92Ydjyg9eg+eyxDaxqqQ7RpxUmjQsV/sqBDRSVfv9SYxQT/0ypPOlv1Ku6OH5KhnQi5B/d97cnldquqcgeVpmYlftuaVozv+EGNxWGJc0MDKmbFXtHi3/bCKqbE4IVcUqoRvVG8O4cWiymRUmkHaIhDVvW6C7PQJRW8FV/HeEuG2touV3BPKzGBBP3MQywZ4de3N7UZDzLNG7mr2N/l/DbYeuaRByNiRp7X3epES21YVgbdA9ZvDLbwxascw/B/LWj2Cm0MsqAtQLrmU2xlcech+2eujdN9u7DukeTRORFSJelfnIRqCUv/484RaMnYKlagKO60txQDbSTtmi7H8u3ofvIBAcSNePVa9iPAA5V4xjn4fkIYWNbkF+kF66XLdMo6pZIafOKhEQFsaDDPUE57nFbBqFVskSFQ6w98WGmX/rNU0OItUu+JNA1lxrlX5AuRQ6BodCVVK1e+boXctIkrOJmlrHKTQ1xf8fp2F/XZ971s/4clsYvSLfmUO+4/Po7BWScTrtCNDWLiUWfbgVq7iH6dPGZPMCEh9mxH2kJfn5jxTWkBpsj3aIHkJDNnY1Zrd3SGB5aizT4Qlx+VztLjf1K
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(1800799015)(376005)(82310400014)(36860700004);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Mar 2024 20:17:39.0471
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c1307486-b6ff-4663-4c3a-08dc4e9af324
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM2PEPF0001C70E.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB7415
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 27 Mar 2024 20:17:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197568

T24gMjcgTWFyIDIwMjQsIGF0IDE3OjE0LCBPbGVoIE1hdGl1c2hhIHZpYSBsaXN0cy5vcGVuZW1i
ZWRkZWQub3JnIDxvbWF0aXVzaD1jaXNjby5jb21AbGlzdHMub3BlbmVtYmVkZGVkLm9yZz4gd3Jv
dGU6DQo+ICtkb19pbnN0YWxsOmFwcGVuZDpjbGFzcy10YXJnZXQoKSB7DQo+ICsgZml4X2Fic29s
dXRlX3BhdGhzDQo+ICt9DQo+ICsNCj4gK2RvX2luc3RhbGw6YXBwZW5kOmNsYXNzLW5hdGl2ZXNk
aygpIHsNCj4gKyBmaXhfYWJzb2x1dGVfcGF0aHMNCj4gK30NCg0KV291bGQgaXQgYmUgYmVzdCB0
byBqdXN0IGFsd2F5cyBkbyB0aGlzIHNlZD8gIEEgbmF0aXZlIGJ1aWxkIHdvbuKAmXQgaGF2ZSBh
IOKAlHN5c3Jvb3QgYW55d2F5Lg0KDQoob3IgZXZlbiBiZXR0ZXIsIHN0b3AgY3VybC1jb25maWcg
ZnJvbSBlbWJlZGRpbmcgdGhlIHN5c3Jvb3QgaW4gdGhlIGZpcnN0IHBsYWNlKQ0KDQpSb3Nz

