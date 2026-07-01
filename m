Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9338C43327
	for <webhook@archiver.kernel.org>; Wed,  1 Jul 2026 12:50:21 +0000 (UTC)
Received: from PA4PR04CU001.outbound.protection.outlook.com (PA4PR04CU001.outbound.protection.outlook.com [40.107.162.61])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.44358.1782910216370544853
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Jul 2026 05:50:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=GaalgXNQ;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=GaalgXNQ;
 spf=pass (domain: arm.com, ip: 40.107.162.61, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=paM9TaLTECd0FYkS1HttF4QHuUuNIEBOcflZtESHueKmsNH5bBPeyIbJWq/xyqMQUjzeb7sM3l+BF7RnY8dQT0qmJ7bOLqJlSdB+IXwSrpX82bepc78K5URInw5f+BC2PUPMaCSO73g+ToVUzZUMEM+TBcGUZbq/JOqSQCvipnDJxX2DNzx+36swATJq4fio6bsHmzRG83gjbLF+9nXUwgbm+Pkx+DBN9RbIlsCfGD/DXxh5M3oEaj9qm6GPd7WVbvEm7/FrCzozujOAIRF5euUxz9WeudO2XshOM6MBtt5aoNTh4oCwVe2j1isjOiMWJ6Yo6ggGau4gkjz9JEqdoQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kLASJQLmp9OJKQtCMAXgs9US8xsfFPqHNYDbHV+BBuE=;
 b=hRzScobwr+D2PJkYpI4wxmp/JJhu7fgbiC6oum8TjTMHxTTdVDyqSpu3ha2dKlJfE+EvjzMqsX/WmtiVkXQyqiucJEYothvd7hYXbkoWWpK3QdDlrG45j33KFSGlzRGiUsrl/KOaNAlb+dcosioGS5+9ON6wGBwmdOSVuzrPziz62Eu/Wn1helCcJqfJLjdV/1MzHaDbYzNEBlP4zQnO90QpFnEkodppjKjmFc5Jb8lB1SY5254FgxagT5P0KrS+B+ULc1cQoYD3KppB2x4Mc2cPUMyyydu6+xHmE/dOSGh5wJIC/3lcn098uLO915GzZbm8R3nP0jt/HfpirXgPMw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=bootlin.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kLASJQLmp9OJKQtCMAXgs9US8xsfFPqHNYDbHV+BBuE=;
 b=GaalgXNQ7tdsDJHudAv4thCXfdyBk5ijGiBftl7GNtUIeRzLzdzOhoonWWp598stIiJBSuGfyXDAWQvhVPT5ii3JDrLIEkDQQX9FNbY3OOiq76RT+rGupJi4B3iIC5k6Ayh3Z/6aqaKaVD0GypBSNptM7PECg6MYIujuTnrNtAE=
Received: from DU2PR04CA0161.eurprd04.prod.outlook.com (2603:10a6:10:2b0::16)
 by AMBPR08MB11657.eurprd08.prod.outlook.com (2603:10a6:20b:738::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.8; Wed, 1 Jul 2026
 12:50:10 +0000
Received: from DB1PEPF00039230.eurprd03.prod.outlook.com
 (2603:10a6:10:2b0:cafe::5d) by DU2PR04CA0161.outlook.office365.com
 (2603:10a6:10:2b0::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.181.8 via Frontend Transport; Wed, 1
 Jul 2026 12:50:10 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DB1PEPF00039230.mail.protection.outlook.com (10.167.8.103) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.181.6
 via Frontend Transport; Wed, 1 Jul 2026 12:50:10 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FtMlJzO35EY9FAQcVWetmo0nfiSSfrdNscDcHuZTXPdafVsYxdvvwnUr7TvJjqOB4OPs/oMI4QHDqiQjbeoln54A3DvEAShi+0l/DlzDMmxL7jQCR1v98+ELnaW9EqhLNdkhDdmiY0WCxIX9CirUoYcVCZb/l9SJg9Hia2mJ+Cr/6aDByCJYTrpNK7Ty3+b2JYAThuzoe2bKqdbvNbNFPzitS1zg/Tm7/MiMU/kUjjw9EU/vxRtZ+ChurkurCZbO13p7PtjzBz8YCtg8EeCaIZ4YOol9otU9r3ltvHOztsFYv0YjgMqrizq9sWihOiIscwA0iKN0xng4B5zp2WdNoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kLASJQLmp9OJKQtCMAXgs9US8xsfFPqHNYDbHV+BBuE=;
 b=I+3bBd40ARzLAfrDO5uHj0g+msrg9t8rp2JeTcErOud+cp/HBLmRlmD4efS2ldYnBo4zmhpunh8aUVfPPMQQkE0QkRxJtaq1yYoJ6UKj7Lkrs569DyMUArRtly59YpZ+xEoBE28xN5DQNpkzXcFyTAIPl9LSoG0/tIqwCjACwi9+NtF8SKDBZLi4oO8uADTv/Y41TvRJlL9LLN/bbTHUWA+t62i6qbXpMBBF0hituKysrpGmM2zUluW+MnnleMmyquAyO0y01I86Fiam8+rSGc556BtPaVXthPnnBn4yYY9jXcJiXqyMInsRf49+E5GF7r17NT7A+x7unrVT7bfEeQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kLASJQLmp9OJKQtCMAXgs9US8xsfFPqHNYDbHV+BBuE=;
 b=GaalgXNQ7tdsDJHudAv4thCXfdyBk5ijGiBftl7GNtUIeRzLzdzOhoonWWp598stIiJBSuGfyXDAWQvhVPT5ii3JDrLIEkDQQX9FNbY3OOiq76RT+rGupJi4B3iIC5k6Ayh3Z/6aqaKaVD0GypBSNptM7PECg6MYIujuTnrNtAE=
Received: from AM9PR08MB6258.eurprd08.prod.outlook.com (2603:10a6:20b:287::19)
 by VI1PR08MB5343.eurprd08.prod.outlook.com (2603:10a6:803:12d::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.8; Wed, 1 Jul 2026
 12:49:06 +0000
Received: from AM9PR08MB6258.eurprd08.prod.outlook.com
 ([fe80::171d:1f8b:720d:7a1b]) by AM9PR08MB6258.eurprd08.prod.outlook.com
 ([fe80::171d:1f8b:720d:7a1b%6]) with mapi id 15.21.0181.008; Wed, 1 Jul 2026
 12:49:05 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH 1/3] classes/insane: increase shebang size limit
Thread-Topic: [OE-core] [PATCH 1/3] classes/insane: increase shebang size
 limit
Thread-Index: AQHdCJnnZgU4uCHHDEiU3NM5vhkcELZYiDOAgAAWjIA=
Date: Wed, 1 Jul 2026 12:49:05 +0000
Message-ID: <8C63F3E1-BB9D-4F57-B55F-A8618F5735DE@arm.com>
References: <20260630140800.4018491-1-ross.burton@arm.com>
 <DJN76GVF0HS6.3OSE79EMVNASR@bootlin.com>
In-Reply-To: <DJN76GVF0HS6.3OSE79EMVNASR@bootlin.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3864.600.51.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	AM9PR08MB6258:EE_|VI1PR08MB5343:EE_|DB1PEPF00039230:EE_|AMBPR08MB11657:EE_
X-MS-Office365-Filtering-Correlation-Id: 321f3c17-9b1d-4495-5040-08ded76f493e
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|23010399003|376014|366016|1800799024|38070700021|18002099003|22082099003|3023799007|56012099006|11063799006|4143699003|6133799003;
X-Microsoft-Antispam-Message-Info-Original: 
 tOyMStAgkjT7P+EcLhlvQK7O9fuZbdgrM4l3xsvDG8udLsX1z4iAsBzWur/ZClBLPdOWBTg/gpVnJkGVbe6mHMF+/UJe8Gja6V+Opfj7pi3tzw924wKgAD3EUU6Pq3rM3TN/F8YyRX5PreFj9+pTJOTA28jd1C0rg84Gj6DOP8Qm0gFOsVYApXOGjHWTGxJ8OluDHWnByYtxbONPquoJ/vlC/M+TYIn7g36W5O2ktEX1HSon4TVIt287SLX6otEwawwEi0mP2E69PLURFlHgZs3OfpdWnGvThaYN1pfx3RuXJR39KAwbrViW8uoLmCh8ZL+es0oaTR3JUyps5UTZUXx/C1TAKVEmD528hwX9OExntuHv+jv/WCr0/YOQAITKirUvcXmQNwRV49bk2yas1Zf1sN28ZNPCmq9k6arFzh9e/ERxkwCl5R+GebSo1apwMQGMhFamBFfARNjRUn1tCTJqodFnMFpGQqWqIER8saaeWZvoPVzh3ci1+YZjilEF9fiK5ZweCIDbo3Ksp9jQKOh+gaFMt+y4MxLhAWkmPC/GxquCALNcEgaCvP0sRh1yuTJWC81g+rpiru22TLaZjxJXQ5j3rGuDkty+UOv9H2c3DJJjH+0NmB9OZdp/qjETzBLLEQtuhAwJe62//Yr4ZAOf/ns/u7gyLVmr87nKu5E=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR08MB6258.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(366016)(1800799024)(38070700021)(18002099003)(22082099003)(3023799007)(56012099006)(11063799006)(4143699003)(6133799003);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <DACDED73CF8DC44AAF118900187682FB@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: 
 K4E/11yrbp2B7hctUVIM6X34/6446xYhS2SOieVotVGEKBsbyAa/cquPk2IXvWvixhOVC0vl2UDY2T4/9bQP1V+HqT2SJeiPPEE0fMo8P8dIHVdPRw4DDyok1U2NANHA4RzydgJQNVqZV2AI29BjWSuoeHeppugpjsmUNal8DSrRa9H0Hzw8hlFx0Kf3ZKfI6tkdAXpfk7oYtYxAuAt02xbWTVWnMfeMOPSSaTdzqMNMi8MlLyU0R9EtoV3YqvsCfyrhfhT7hs+Q9E0gKrqLwwgwzovD58lbfOMGu7EoNHjMxIe76tMAj+ei/z5Yjla6yZ7Aot+TtyoXc0u/4pAE2g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB5343
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DB1PEPF00039230.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	00574496-c637-4106-c69a-08ded76f22cd
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|14060799003|376014|35042699022|36860700016|1800799024|23010399003|82310400026|6133799003|11063799006|4143699003|22082099003|18002099003|13003099007|56012099006|3023799007;
X-Microsoft-Antispam-Message-Info: 
	mobbcXBGq+2MOr3dyaNSTh7flARa4/m1QOpux4BzO3z3bDj9BykNSs91h3EBd8DI4+GF+8lFt1Igi+AIypuRJmvjnpSvq3/ywNnl70zKaMGNcCWLAvy6qxfh4P9Towz3Roz5R56u26yOUPFNqf9xIGRbnS7gFDiBHrI3fLpfTs6AREa38/ld85V8Zyt9/jRNNbnmb6OUytJv03HHX/15n2Nxvwqqc+aBusJ84hx4Z++DqUrxWY72TwjyHqOvGFECRCXzS8QcpbkfpmYjvMhL2bgNvnrOhQlYDimP0PeoUm03lGv2lIs4YlZat3RVWhOXbF2OV96Mhy41S/a4stciC6Gg0vI9SILEwE/zLL1zuNjDAw19hTFxhur/Oo9oLbrrbz6PddAUZWgYWrlYQfZjPhHvH8Zx+E2nqe/zBBFDW8GYGPHKW0QKfz8XpMzs5SIhSCeq6HkksqE/aQjZCeilco+V4ofN8h+8TLbs4Sp8dtC7JwwbEhzYXgSmOvYOJP8Ql0vimLutKxOBLwBiKb+JnpIccWd5sb3uOLANtRFaaHRUMn0wY/R7P14wKCBLQrOXUgJCetQKUer0kTlfom8c2Rb+HfdeIY2f9YVgrDTdKPUd75gGAfKrQH2xjETFO88DxlPqaq/cJjHw3wycdExeZQ==
X-Forefront-Antispam-Report: 
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(14060799003)(376014)(35042699022)(36860700016)(1800799024)(23010399003)(82310400026)(6133799003)(11063799006)(4143699003)(22082099003)(18002099003)(13003099007)(56012099006)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	VXy0wKAypvednuXkCTDiVvnU2muageXkSYzb5/RjTgyiLIERstGo118JTyZiHfRaLAqwV1iMFb1Vwb0ecNjlkNLDpKnSqkjcFzbOYxJsM4FeGVzJqdVoJzokZdP8xMqm+tBv2PBu2PGeU6AcrChBRigFwttn9YP1Fm31QzZ/A4XKCb0dtJ1yCbGmZi9LUuUAv75XRedu7tkWFZfMdUXdNFdig8oDyX0QKS/ygPD7vOMmZ0RSlPuxZEh5APbrYhVH+lJ5HgawZUK7yMJ1EeqJXxzJ11qfQn9bHxXZ4pF7VlPLuSGObpADgK273BwWruRVNGnM9yJJRXc5bBZ5bjpz87mT1jhgRoGs/+wb1X3XME/bYDGjoT+GA7sKW6SD34EpAlzxJ4ws+6Hr+VsELrtbE2Y7Bl3Tik1PxhmzYWDGWvXiDXUpl4zFLZtHyehuKUzc
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jul 2026 12:50:10.2873
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 321f3c17-9b1d-4495-5040-08ded76f493e
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB1PEPF00039230.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AMBPR08MB11657
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Jul 2026 12:50:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239982

SGlsYXJpb3VzbHksIEkgd2FzIHRoaW5raW5nIEkgc2hvdWxkIHdyaXRlIGEgdGVzdCBjYXNlIGFu
ZCBkaWRu4oCZdCBldmVuIHRoaW5rIHRvIGNoZWNrIHRoZXJlIHdhcyBvbmUgYWxyZWFkeeKApg0K
DQpTb3JyeSB0byBicmVhayB5b3VyIGJ1aWxkLCB2MiBjb21pbmcgc29vbi4NCg0KUm9zcw0KDQo+
IE9uIDEgSnVsIDIwMjYsIGF0IDEyOjI4LCBNYXRoaWV1IER1Ym9pcy1CcmlhbmQgPG1hdGhpZXUu
ZHVib2lzLWJyaWFuZEBib290bGluLmNvbT4gd3JvdGU6DQo+IA0KPiBPbiBUdWUgSnVuIDMwLCAy
MDI2IGF0IDQ6MDcgUE0gQ0VTVCwgUm9zcyBCdXJ0b24gdmlhIGxpc3RzLm9wZW5lbWJlZGRlZC5v
cmcgd3JvdGU6DQo+PiBTaW5jZSBMaW51eCA1LjEgdGhlIHNoZWJhbmcgYnVmZmVyIGhhcyBiZWVu
IDI1NiBieXRlc1sxXSwgc28gdXBkYXRlIHRoZQ0KPj4gY2hlY2sgdG8gbWF0Y2guDQo+PiANCj4+
IEFsc28gcmV3cml0ZSB0aGUgdGVzdCwgY3JlYXRlIGEgdmFyaWFibGUgZm9yIHRoZSBtYWdpYyBu
dW1iZXIgKHRoYXQgaGFzDQo+PiB0aGUgc2FtZSBuYW1lIGFzIHRoZSBrZXJuZWwgI2RlZmluZSks
IGRvbid0IHBvaW50bGVzc2x5IHRyeSB0byBkZWNvZGUNCj4+IHRoZSBieXRlcyBhcyBVVEYtOCwg
YW5kIGNvbnNvbGlkYXRlIHRoZSB0ZXN0IGxvZ2ljIHRvIGVudGlyZWx5IGluc2lkZQ0KPj4gdGhl
IHRyeSBibG9jay4NCj4+IA0KPj4gWzFdIGxpbnV4IDZlYjNjM2QwYTUyZGMgKCJleGVjOiBpbmNy
ZWFzZSBCSU5QUk1fQlVGX1NJWkUgdG8gMjU2IikNCj4+IC0tLQ0KPiANCj4gSGkgUm9zcywNCj4g
DQo+IFRoYW5rcyBmb3IgeW91ciBwYXRjaC4NCj4gDQo+IEkgYmVsaWV2ZSB5b3UgYWxzbyBuZWVk
IHRvIHVwZGF0ZSB0aGUgdGVzdF9zeXNyb290X21heF9zaGViYW5nIHNlbGZ0ZXN0DQo+IC8gc3lz
cm9vdC1zaGViYW5nLXRlc3QtbmF0aXZlIHJlY2lwZToNCj4gDQo+IDIwMjYtMDctMDEgMTE6MjU6
MzUsNTExIC0gb2Utc2VsZnRlc3QgLSBJTkZPIC0gRkFJTDogc3lzcm9vdC5TeXNyb290VGVzdHMu
dGVzdF9zeXNyb290X21heF9zaGViYW5nIChzdWJ1bml0LlJlbW90ZWRUZXN0Q2FzZSkNCj4gMjAy
Ni0wNy0wMSAxMToyNTozNSw1MTEgLSBvZS1zZWxmdGVzdCAtIElORk8gLSAtLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
DQo+IDIwMjYtMDctMDEgMTE6MjU6MzUsNTExIC0gb2Utc2VsZnRlc3QgLSBJTkZPIC0gdGVzdHRv
b2xzLnRlc3RyZXN1bHQucmVhbC5fU3RyaW5nRXhjZXB0aW9uOiBUcmFjZWJhY2sgKG1vc3QgcmVj
ZW50IGNhbGwgbGFzdCk6DQo+ICBGaWxlICIvc3J2L3Bva3lidWlsZC95b2N0by13b3JrZXIvb2Ut
c2VsZnRlc3QtZGViaWFuL2J1aWxkL2xheWVycy9vcGVuZW1iZWRkZWQtY29yZS9tZXRhL2xpYi9v
ZXFhL3NlbGZ0ZXN0L2Nhc2VzL3N5c3Jvb3QucHkiLCBsaW5lIDQ5LCBpbiB0ZXN0X3N5c3Jvb3Rf
bWF4X3NoZWJhbmcNCj4gICAgc2VsZi5hc3NlcnRUcnVlKGV4cGVjdGVkIGluIHJlcy5vdXRwdXQs
IG1zZz1yZXMub3V0cHV0KQ0KPiAgRmlsZSAiL3Vzci9saWIvcHl0aG9uMy4xMi91bml0dGVzdC9j
YXNlLnB5IiwgbGluZSA3MjcsIGluIGFzc2VydFRydWUNCj4gICAgcmFpc2Ugc2VsZi5mYWlsdXJl
RXhjZXB0aW9uKG1zZykNCj4gQXNzZXJ0aW9uRXJyb3I6IEZhbHNlIGlzIG5vdCB0cnVlIDogTk9U
RTogUmVjb25uZWN0aW5nIHRvIGJpdGJha2Ugc2VydmVyLi4uDQo+IA0KPiBodHRwczovL2F1dG9i
dWlsZGVyLnlvY3RvcHJvamVjdC5vcmcvdmFsa3lyaWUvIy9idWlsZGVycy8zNS9idWlsZHMvNDE4
Mw0KPiBodHRwczovL2F1dG9idWlsZGVyLnlvY3RvcHJvamVjdC5vcmcvdmFsa3lyaWUvIy9idWls
ZGVycy80OC9idWlsZHMvNDAxMA0KPiANCj4gVGhhbmtzLA0KPiBNYXRoaWV1DQo+IA0KPiAtLSAN
Cj4gTWF0aGlldSBEdWJvaXMtQnJpYW5kLCBCb290bGluDQo+IEVtYmVkZGVkIExpbnV4IGFuZCBL
ZXJuZWwgZW5naW5lZXJpbmcNCj4gaHR0cHM6Ly9ib290bGluLmNvbQ0KDQoNCg==

