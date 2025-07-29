Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12AF7C83F26
	for <webhook@archiver.kernel.org>; Tue, 29 Jul 2025 10:22:51 +0000 (UTC)
Received: from AM0PR83CU005.outbound.protection.outlook.com (AM0PR83CU005.outbound.protection.outlook.com [52.101.69.17])
 by mx.groups.io with SMTP id smtpd.web10.3740.1753784568027898650
 for <openembedded-core@lists.openembedded.org>;
 Tue, 29 Jul 2025 03:22:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=kk85eyl8;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=kk85eyl8;
 spf=pass (domain: arm.com, ip: 52.101.69.17, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=wWtQyGARmMcZdz+JUbD+ZRMNjh5ytio5OpffWn50RhU35vbYREAKhZJBh7v1MLnc7lDqN2tofUgwtUUSxz+RR0/VYubzrM3XDB2xN0cuqIoBwtXeii9RiSUg2Y2P9LBori7YlK0czBoXuvBqVde6vaBnXyN+Y5nixd3hiatmDztf9NdZITBLxcN1DfZOL0/F9leH1LfxQJFe53BIHcYF8CUl0Qml5A8QqFXa6cXPnWkrtr0+iF8OT8bLVs0IJs+nTreISMDAXM3/Z+OsMf9wi5qjySdy3oaHTjQTc+MtMZKLVZpC7I9ss8kqa9dFPjPl/cMb6HVHRDC7iKVo7T5rKw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0Q9ZfP8iM3OMdJhb0cuyvVZoGXiEhG1F5IMn634AJ50=;
 b=BqH6YiCvu4Ft20yvm6nmshmSDwPfDDbvoXMQ1D9OD9eGIRrSG3p2XZa+1enJ/KrJl6dSD9LJgxEMXQm4BSzDJrnpKL4MrxGSuRB/DatwRvfhilqZsJgtB5BEKX1nK6Zja3yCyWiIRvRaQrgLrsL8iLLt21IGlWvQ2k8g2Ptt6keyq7H4uV3iTWidw9/tRnZc9lVUTEYrZ4TJsyNVqqPRnB6EKasPZlrSCmfFEJe1XgFBkyhakCxexgcw2QOScxhvhI3Gov4ZZ4RYjDyO0EkojNCe75BlITgvuvMxx7pWuSZ5ke0rLymE54XAw7w+i74+l2sT8u1B/WwreiXnMQNd5A==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=siemens.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0Q9ZfP8iM3OMdJhb0cuyvVZoGXiEhG1F5IMn634AJ50=;
 b=kk85eyl8zkg83O+jZEvndArQmt+gtN7z3iQGsUohFN/c1it5my2senaQt6mbrTQhMsQeb6vX3DyNgPNu9p0ZVo4b6TwPe5BYaDTjv3Pt51KtXJGLzaYRUh7UD22nAiGqZcRIcEMkex97YOG3UyW401rlpABkNL9Sy4oF9Twsa44=
Received: from DB9PR05CA0030.eurprd05.prod.outlook.com (2603:10a6:10:1da::35)
 by GV1PR08MB8239.eurprd08.prod.outlook.com (2603:10a6:150:5f::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8964.26; Tue, 29 Jul
 2025 10:22:41 +0000
Received: from DB5PEPF00014B9F.eurprd02.prod.outlook.com
 (2603:10a6:10:1da:cafe::29) by DB9PR05CA0030.outlook.office365.com
 (2603:10a6:10:1da::35) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8964.26 via Frontend Transport; Tue,
 29 Jul 2025 10:22:41 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DB5PEPF00014B9F.mail.protection.outlook.com (10.167.8.169) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8989.10
 via Frontend Transport; Tue, 29 Jul 2025 10:22:41 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NC6fPP+a9rS9AJz+y3YsWui4jMW5oCFYgxLVA61gMcdsRmcBXUJHC4BYSHYABYRIFyUn/qAYEJJ2xBTNzJ0Jhx/Oyy3wSxd57jOsOK7p1H0Rx1HbG74wC8WeI0eyhszu57PfgVMoEr2LWvT+ecKheU9+fpTHutVFIkn2EAluj8Rg2jN9iaERUAEkjuMp0lAAsUb7WZzAkCq86LO7CMbLQGu/e05HF55Lm/To71NJtbhNYsH2tGf8xdWy84TxQh9hNZq1M+EtONb58Fk3VZS7YFiVXWqBS8HDkuZ58YTZviOiSqqOylBp6qOhpOtvTrrVNxtC0YOL5GNupnxJ7ETj6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0Q9ZfP8iM3OMdJhb0cuyvVZoGXiEhG1F5IMn634AJ50=;
 b=p+L9FgteBYH0los3qn6NA+k8Y30qs9m2rvNuqBV/P7gb5vzRlgxsjys8ID+a8odZ7VHn7CsvYSAY1cMZkgc4mjxn6Ur9fRENWQHNnWSFel7sal4AXQnu0sP5E3dIMTpTgYochpcKwv2tyfWlBjPoiFDSpB00++ZtqbfA1RB4rhf7RF4SOk4bkRt5Y0L/MEiNeudcC4SBSxXvWFizCs+EmJGggLXjOpUa/IY9zVFgF66gLtyWMaOGxAzwW2JxdODuZw/J4a+4wecO/xrD/22utI3D3DwAGLUOoR94F0NHWSNvCRKOmbtIt3Knfj53qgxB1SLX14i1XA38LYQJT2wu3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0Q9ZfP8iM3OMdJhb0cuyvVZoGXiEhG1F5IMn634AJ50=;
 b=kk85eyl8zkg83O+jZEvndArQmt+gtN7z3iQGsUohFN/c1it5my2senaQt6mbrTQhMsQeb6vX3DyNgPNu9p0ZVo4b6TwPe5BYaDTjv3Pt51KtXJGLzaYRUh7UD22nAiGqZcRIcEMkex97YOG3UyW401rlpABkNL9Sy4oF9Twsa44=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by AS2PR08MB9391.eurprd08.prod.outlook.com (2603:10a6:20b:595::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8964.27; Tue, 29 Jul
 2025 10:22:09 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e%5]) with mapi id 15.20.8964.025; Tue, 29 Jul 2025
 10:22:09 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: Peter Marko <peter.marko@siemens.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, Khem Raj <raj.khem@gmail.com>
Subject: Re: [OE-core][PATCH] oeqa: do not fail when sdk package is not
 available
Thread-Topic: [OE-core][PATCH] oeqa: do not fail when sdk package is not
 available
Thread-Index: AQHb+5rMmQXkzznrzUSu+c8l20FudrRI7gUA
Date: Tue, 29 Jul 2025 10:22:08 +0000
Message-ID: <F3F17D36-6445-4D90-88DF-DCFA46DC6158@arm.com>
References: <20250723062616.101590-1-peter.marko@siemens.com>
In-Reply-To: <20250723062616.101590-1-peter.marko@siemens.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3826.600.51.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|AS2PR08MB9391:EE_|DB5PEPF00014B9F:EE_|GV1PR08MB8239:EE_
X-MS-Office365-Filtering-Correlation-Id: 5085eaa1-483a-4a1a-921d-08ddce89d9b2
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|1800799024|376014|366016|38070700018;
X-Microsoft-Antispam-Message-Info-Original: 
 =?us-ascii?Q?VF83mth545qbdGHE/8/yWhkT306843Fm791p/BWsMNFA79uuz5au+ZLgLymA?=
 =?us-ascii?Q?ngYq9SkeN3CoelRTcHE1vfxy/WLOr3Rxs7uNchOW2DoXkbB66lJCx4vO88uE?=
 =?us-ascii?Q?UckFjbWb0dliveKkDff9FoFinY7CKVQAPFmw5HivMLPSNGPBZmq2A16N0kyO?=
 =?us-ascii?Q?ZHmdlnD4retLQVs0SphqxuAX+BScGTlY/XTYJuar0EErVUt67VM3pkN6VNr3?=
 =?us-ascii?Q?Jq4IS+Gn/fgnkCUsTVX1XFwVT5Ji/VusaA16CJ12qE0JKTgwFZEhCHEYTkj/?=
 =?us-ascii?Q?oqH5Yc419jjZMtKujxmy6m4AF2thc+H0Pc8QWoQbOBtLrayDdoeu3S160lY3?=
 =?us-ascii?Q?PpvltZyOoWCCcMwm51VrLPGDOYuWFxMTc+PQprAH+T3q9Sb33bbTisigFyNp?=
 =?us-ascii?Q?bg5ICkNZI8wPYmjIPwFM9jjZbRH9RUpihy1gNHZNfHy7xG5hzackd2+IZJVh?=
 =?us-ascii?Q?b6NQCzKGzNzXyFLTpfMFQ76zZK6ut7RFxFBy4K6PuHYRkqhS000VAHXi1nu4?=
 =?us-ascii?Q?9VbUgaP9H1vr+eAJRYV++UAz4QNExWMZF3WoFiaPsUufwaI/HJxw8NaeggUF?=
 =?us-ascii?Q?euhMgdMjlG3k/OOIcYp3fZcvC8DcYzT6LK73uwhr4midI8LPBkaeDIO7GBSR?=
 =?us-ascii?Q?ZhOS4LKGyfcHrOl90KM4a2+UXiSox2CaUnC6SOt5B6zNT/2Jz6py4/YvBH51?=
 =?us-ascii?Q?2Fqo+gGktx3pJQmDA5SiwSsaqegZrl9SHV7yc/8HNLtKUv/t29L/vv539d68?=
 =?us-ascii?Q?nCTYKEh8nqx+ybJ31SN3KUSQu/te4nIrq7lu5XhrRnmLBVdvV28Bs9EeO3DK?=
 =?us-ascii?Q?aWoqTem0peJgEAXOY8sHkm+lxA86ZQ0dcAivbleMCy3o6cHGg3Tw7i83evEq?=
 =?us-ascii?Q?6PhJugGQjnIW8BBsQH5EPn8TomESyGljzEfwO6wWI3Yecgmaf1mcJArBQIAk?=
 =?us-ascii?Q?nzSEBOlJBIX3zjzRx/UmKPo410SonSYTu676Ty/Le3s/nBfrinOo1Gerrvu8?=
 =?us-ascii?Q?KVOx+TYbL22+utt4jPyxpIHHeHv8Geh3dWtaCcsLiqHavHngdImP+UC59lBT?=
 =?us-ascii?Q?3HvOZrAws4un0uGi8GJ4EMspuIuhG34l2Cg4vbynMzrsbilPMtHCDplSouA3?=
 =?us-ascii?Q?lpePQcA7HRl9B/5yUYIFRo4lmxngFLT4ZjZ6bUEcnslLgB5ybiS/qGHs5KFf?=
 =?us-ascii?Q?x4OMFhf4JvOfKnUcvIokiOrWGI5b/nX2Owv+tYcRjxNqe2Rv8kpIixTXPT5i?=
 =?us-ascii?Q?9uuZkItDZULhS/0K0ZCVbnqr94RWlAfBR8nncJkUFpm6LUwv0AduzhbFtc7V?=
 =?us-ascii?Q?FXVfq+0HCi2NqhhvgNo0nzv/mkCvVW5waxNhAoSVIYwHAqm07KIFqwnat6r5?=
 =?us-ascii?Q?fbO98F2vkDU/wwPpnHq9joNY72dlczf3mfEDAUWb25MPlntebmxiW++K1pnS?=
 =?us-ascii?Q?VMTPLjMq+DVu/B9SrW1TEUWACfL+GTcRjW9Y4FcuPPkPepcmj44FiQ=3D=3D?=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <76CD27E1FF0BAC419EE100920BC91A41@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB9391
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DB5PEPF00014B9F.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	5f0274ae-7db7-4924-1182-08ddce89c655
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|376014|1800799024|14060799003|36860700013|35042699022|7053199007;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?58CaxMkIoEPwxwKYfFxspSLp2mgPPr/GeuIfd0l6aoTXlcSp6uU+t3NWxl5c?=
 =?us-ascii?Q?3nyqnMTXmvNG1lA7IzkAesxy4f8ukBPyARLbmQNSl3/759Lg8SOPr9TwhDBM?=
 =?us-ascii?Q?WrGY16tMS91k5Ij2RX08j4NwFDlcm/VDKs1zSVoGUn+74nbGqNnkIhR9E4aI?=
 =?us-ascii?Q?ADWrTUefiH76WBy/SG13iMszk90uloc8oTj/qLVn27z7ANdvtbpBm6s2otlB?=
 =?us-ascii?Q?MYy0Rl50WHLH68eDgrOqOaQBwaSxl6JLl6Rgtv6Fdno5Fc/ciTnDkhHvy2c9?=
 =?us-ascii?Q?RBLGUoyBYGNwtm3wvzKh0XdHVMyjXzxmrKDoNVjvM8ybTxDMD3m15YsDK2LT?=
 =?us-ascii?Q?gZCYB6EIysTGgkVtwtgHBRq79QQtX61rsjN1CtJBkbF4iGLVsJCPcD/YRTdP?=
 =?us-ascii?Q?6iryJ4QHc2OKLc9Y+l9kDtJpdl6TATXV5zV1VTr02KerGL6tuasnEtXqc4Hh?=
 =?us-ascii?Q?aCtch5q88dUUWIkj9a8u727uHpjRscI5xyEUXMmYlDJ0QuEfRcIjcqyIm4Va?=
 =?us-ascii?Q?hsImnen2VtQUOGs0Y2gm0XjA4TSBxAqoWA+cIcvNlaflWZ2Y0o5+TYekjOVO?=
 =?us-ascii?Q?BQhBq+Y7tA9hj9cSrxmtdV1FrmINNj8HRF+Lv/rCLC9OOqt0O0nzgRjLEJE7?=
 =?us-ascii?Q?BJL7Kcy6/+UEdhbLhTSMSi3tHVMu6X2eJojTRSZMA+I7yFb+x+d4JrdbapvN?=
 =?us-ascii?Q?4XPgjnZdmo4X/IPoTNnmM3xbZbsHpRzvsqPX7F2s6UpojCScYlOwoNPC2pCe?=
 =?us-ascii?Q?YZ5/57eqVdMLbF4dYVqv2pQQL36QD7MzErV+tWBql0DNSWLrRNDt9bTlfeoG?=
 =?us-ascii?Q?8XvOLsKU6hM7cwkw5DlGBSYxV+5vssDfg4BinGl0GETKGmfSuQ9Oh1nSpc5o?=
 =?us-ascii?Q?kPeboOgE1GWCLuTyoveYTzXAYxUiPfIMMNhKa4LhQclCobvfm6DoFZUzUikv?=
 =?us-ascii?Q?B6lodk3qD1CsX3QqQp82Rl56nQCPzK6AtW+C6uQY0hwBqGCO1qZY506fCfuN?=
 =?us-ascii?Q?Ps3Bqy80rohN5Pt0rJjJPIc10jM/JmbInxXBXmXHb3gtI2XIQwH/ug0HlRmN?=
 =?us-ascii?Q?rR9aBkOqk6hEMqF7iBKZPo8ME2gYjryfeBFxhVlrewgZsjw2nV96m6DOTsJN?=
 =?us-ascii?Q?0NhDc9JEGP4vLTu7yxgL/g8n3q25B0A0QfXMAgFiLslEfmzv8F2H6g6AAMkg?=
 =?us-ascii?Q?InW83ZMbAHfcv95SRPwIXdsNDDR8qbI1WWLiNs5Bzq0A8heNYPPivMLmTdTD?=
 =?us-ascii?Q?RVstMVQa+u6/NXXbRtP4lmDJ3jvYtMd5aufqLM2oUZ+n1TkZ9IFVOa7AermE?=
 =?us-ascii?Q?pZmevTlnDFq/v3jMCerHtIo8jCMb3XKRob4Q4CNbQkU0eCqhNvV8O0ZeniHm?=
 =?us-ascii?Q?8xVybQapLHDm+Or/8cLXPpTMbef51rKLtu5TBVXNd/mGsOKrVF3uddOak0qO?=
 =?us-ascii?Q?1cAN0a1fV1kABk2Kbpna4jkOTTEG87gGjC8UjnMIhPFunoyMEmrOIAkAO5ra?=
 =?us-ascii?Q?NZD/FHtrJcmebrl45p6sApyxMgCt00uoVFPo?=
X-Forefront-Antispam-Report: 
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(1800799024)(14060799003)(36860700013)(35042699022)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jul 2025 10:22:41.3702
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5085eaa1-483a-4a1a-921d-08ddce89d9b2
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB5PEPF00014B9F.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR08MB8239
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 29 Jul 2025 10:22:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221056

On 23 Jul 2025, at 07:26, Peter Marko <peter.marko@siemens.com> wrote:
>=20
> From: Peter Marko <peter.marko@siemens.com>
>=20
> Prior to commits:
> * 11277efd057685558a744e98082b5709e849dd2a
> * d0e8b83d05957b1f22d08582e364afa4b522801e
> the tests were skipped if package was not available.
> Now the code calls function ensure_host_package which says
> "try to sdk-install missing dependencies", however in fact for sdkext it
> causes a failure if the installation is not available.
>=20
> Since maturin is not installed in any image, it cannot be installed
> unless it's downloaded from sstate-cache mirror populated by a world
> build. These builds are however now not done for powerpc and mips.
> It also does not work in local builds without sstate-cache mirror.
>=20
> Fix this by skipping the test if the package cannot be installed to
> match the original behavior before those commits.
>=20
> Signed-off-by: Peter Marko <peter.marko@siemens.com>
> Cc: Ross Burton <ross.burton@arm.com>
> Cc: Khem Raj <raj.khem@gmail.com>
> ---
> meta/lib/oeqa/sdk/case.py | 5 ++++-
> 1 file changed, 4 insertions(+), 1 deletion(-)
>=20
> diff --git a/meta/lib/oeqa/sdk/case.py b/meta/lib/oeqa/sdk/case.py
> index 1fd3b3b569..002eed271d 100644
> --- a/meta/lib/oeqa/sdk/case.py
> +++ b/meta/lib/oeqa/sdk/case.py
> @@ -44,7 +44,10 @@ class OESDKTestCase(OETestCase):
>             if isinstance(self.tc, OESDKExtTestContext):
>                 recipe =3D (recipe or packages[0]) + "-native"
>                 print("Trying to install %s..." % recipe)
> -                self._run('devtool sdk-install %s' % recipe)
> +                try:
> +                    self._run('devtool sdk-install %s' % recipe)
> +                except:
> +                    raise unittest.SkipTest("Test %s needs one of %s" % =
(self.id(), ", ".join(packages)))
>             else:
>                 raise unittest.SkipTest("Test %s needs one of %s" % (self=
.id(), ", ".join(packages)))

Yeah, I managed to break the logic slightly there.

I think it does, but can you confirm that the sdk-install output is visible=
 in the test output when it is skipped?  Also, the except should catch just=
 subprocessed.CalledProcessException.

Thanks,
Ross=

