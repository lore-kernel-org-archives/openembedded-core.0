Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 93F1AC369B4
	for <webhook@archiver.kernel.org>; Tue, 15 Apr 2025 12:42:13 +0000 (UTC)
Received: from AS8PR04CU009.outbound.protection.outlook.com (AS8PR04CU009.outbound.protection.outlook.com [52.101.70.20])
 by mx.groups.io with SMTP id smtpd.web10.19052.1744720931799006899
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Apr 2025 05:42:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=F8hPLt7q;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=F8hPLt7q;
 spf=pass (domain: arm.com, ip: 52.101.70.20, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=Edg88ObP1wHPSVYj2FZFjc/zDQWGHRybh0/rwkQbhPelmFDl+kGBAoU1S4Bm3k2Wgz4moRw7tVJkUzWLF9Fz/Rlz0lloJL9t27Ef7uErf+zgi6izHNC1XBWWc41pKL9ZVCksryWhl3smnSItRbm/QdeZwSAYuKFeyBYtUjpxUgFzmy577LXPzbrpjr1Ascror72T0DDQGVQHQDYM26J7yVvUyE/kYe6Hug7FZ6B70KIF2miUS9MWfq14GZV4aZAyNUIZyrmHDtMAdK8dsYA9l9y5UbuoNn4sRyhCv5VVVn/DZmrFCypxj6bUJONYB8kPFIZyPTwamju19yp2OTVLWg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zhsmrEHeOzm+YHOR/ysvXEua208ZFN8M0vl/0rKKACA=;
 b=q3STDSylVqSMEZwX9ElDTxCBUYxS18vJEe89Oh7u4Mlk+YKeukLtqv+e1hd7cf5tXmgZazMrsk7qGZ6kbI8rs8eeiX/gLg93fTXGLA8IMvg+dMEaEX13MxaACARJjW0VUMU3NhJOL1QSHrdVSD4EYcGW04Fm4QlLFDR6nhmzkwA83ApdPwsEcs9+u5URjlEa/IeZqlp73pKMf585HhGOKYgC6U11ns80a2DPBABe8CplS8rR7dRD2Xuq6x7L2L7ne5Y2L92N6P6iyLHRGCyCNRlFcOw0xSP/0BQa3FbEaNmYIoWXKPE+0ocbGciElorvxbbSPWzTdklQEkFfq5YQEQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=gmail.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zhsmrEHeOzm+YHOR/ysvXEua208ZFN8M0vl/0rKKACA=;
 b=F8hPLt7q1KMSbz9T0M81jIXZnQPtC5HI+ZwzM/4sl4dmPX8px6Nz23kznFvvk+E2xdK179Xbm4TJ1iGI9+dTPLURwylh7DydOlt+bB92VUgLTEYHsf4eOGljivwEe9oCxT0ldqR2Q6VcGZVjGhvOTeQI0NaUp1QnjycodhRaOU8=
Received: from CWLP123CA0254.GBRP123.PROD.OUTLOOK.COM (2603:10a6:400:19e::22)
 by DU0PR08MB7616.eurprd08.prod.outlook.com (2603:10a6:10:320::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.32; Tue, 15 Apr
 2025 12:42:07 +0000
Received: from AM3PEPF0000A797.eurprd04.prod.outlook.com
 (2603:10a6:400:19e:cafe::c6) by CWLP123CA0254.outlook.office365.com
 (2603:10a6:400:19e::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8632.35 via Frontend Transport; Tue,
 15 Apr 2025 12:42:07 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AM3PEPF0000A797.mail.protection.outlook.com (10.167.16.102) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.12
 via Frontend Transport; Tue, 15 Apr 2025 12:42:07 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=chwCtzW1kDI6+BvguPaYvRozHpzRy9xVaOhgZMtwkVZ+klxmFliZXrNR035Dbad0lSl4MRIua0CY512JVJ7E59AKLRnqhSLXBEnzWg2WCkFvfkGn5KPe5F114ubcMj/pjaJH+RT0/T31tZbC5oM2gH7xLy6tyEW6wBMWncpjfF4V+0wkQdVzhhtDxzikSRAYYaTgAcO3VT2nxkZkWVE4HG7TsbeiA96D3WZd4IYiEV28UnSS/Cqin89peNK+m+tEPNMNPX6Yt6Z8g/pGrkczBCn2im204QoWETj6TcPdvoh+HWA913BLxn8VK/SiyLzbw15l0xPTQwVvhQ6imUMylA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zhsmrEHeOzm+YHOR/ysvXEua208ZFN8M0vl/0rKKACA=;
 b=ES9ydlwq4sBgJGphJE3trJQYCkVLkjyQVnAOXDYXrpBAfsPM+Eh+SDdPKgfbKYvNemEnunWDVAwPdljI2WwAzXYW2KiIW4i8pENdL9JSaVEuuT43GV7kJRDebq89p9n63rkCBaDyUw9wAHpZUA1yCuMnV/UCI6ImFFYR9fKBxRcD/WMyP/+z9NwH11tLbyF5jtZF8Qc+kmB3CtxaB2BsSyxCoJVpfay5kKuxg7VzxMkGc1cMrh1bpau95hGoGp0yV9Etn4UpJrK878fhmTH0XfvKzxt+fHNhx/pw3JR8SJQ7iMbnnlB2CKuQKY+LHE0fzr9BOoIdYzaMfRiUatW8Ew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zhsmrEHeOzm+YHOR/ysvXEua208ZFN8M0vl/0rKKACA=;
 b=F8hPLt7q1KMSbz9T0M81jIXZnQPtC5HI+ZwzM/4sl4dmPX8px6Nz23kznFvvk+E2xdK179Xbm4TJ1iGI9+dTPLURwylh7DydOlt+bB92VUgLTEYHsf4eOGljivwEe9oCxT0ldqR2Q6VcGZVjGhvOTeQI0NaUp1QnjycodhRaOU8=
Received: from AS4PR08MB7429.eurprd08.prod.outlook.com (2603:10a6:20b:4e1::9)
 by PAXPR08MB6461.eurprd08.prod.outlook.com (2603:10a6:102:153::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.34; Tue, 15 Apr
 2025 12:41:34 +0000
Received: from AS4PR08MB7429.eurprd08.prod.outlook.com
 ([fe80::8db5:7772:a426:2afe]) by AS4PR08MB7429.eurprd08.prod.outlook.com
 ([fe80::8db5:7772:a426:2afe%4]) with mapi id 15.20.8632.030; Tue, 15 Apr 2025
 12:41:34 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: Samuli Piippo <samuli.piippo@gmail.com>
CC: "martin.jansa@gmail.com" <martin.jansa@gmail.com>, Patches and discussions
 about the oe-core layer <openembedded-core@lists.openembedded.org>, Samuli
 Piippo <samuli.piippo@qt.io>, Tim Orling <ticotimo@gmail.com>
Subject: Re: [OE-core] meta-qt6 on layerindex
Thread-Topic: [OE-core] meta-qt6 on layerindex
Thread-Index: AQHbou3hLaTaCbzsaEiljwyfeAaPBrOP/kSAgBTDQ4A=
Date: Tue, 15 Apr 2025 12:41:34 +0000
Message-ID: <70DCE40B-AEC3-4139-AD20-69C7C0AA8C0E@arm.com>
References: 
 <CA+chaQcpXOTbbePCjusXgrcR-Y9fk02JOnecFsR2e5B+==x7Eg@mail.gmail.com>
 <CABXoSoVs_O7At3c+=nM6w=fwgULniKACzu_8AwhZR9iat59UYQ@mail.gmail.com>
In-Reply-To: 
 <CABXoSoVs_O7At3c+=nM6w=fwgULniKACzu_8AwhZR9iat59UYQ@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3826.400.131.1.6)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	AS4PR08MB7429:EE_|PAXPR08MB6461:EE_|AM3PEPF0000A797:EE_|DU0PR08MB7616:EE_
X-MS-Office365-Filtering-Correlation-Id: 642eab46-0ed0-4369-f570-08dd7c1aeea7
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|376014|1800799024|366016|38070700018;
X-Microsoft-Antispam-Message-Info-Original: 
 =?utf-8?B?c0Nnd2JIWVhkalZ0YmtFRFZhL3hWdTZERzA0czNyc0ZRY1kwMnhBU3hqeURO?=
 =?utf-8?B?Nk8yWHVBUDJwam1nRHdoRElIMzZzakYzZ1BBUmZ2SklWV0h0QXV4VXhuZVdJ?=
 =?utf-8?B?cWhRZ3VidmlHMjQ2SVo2WlM4YXRkT3BjU0RXNG1FZFZjdmgySVcwUm1ObUtE?=
 =?utf-8?B?c0piYWdIUmdvdTNhVXZkaURPdHVmK2tuNlB6aFlmN092bHNHSjEvbzdlcHhG?=
 =?utf-8?B?K2NVa1M2R21UTTNnZmFGa1VycmhJTFM4Q25xQnYvOFBUOGw0Y2dVZG5OUnNV?=
 =?utf-8?B?Tk8rdEpEdjRlc25DSlduTkszcUtrWXNka2RGcG1FUlVtUWc2NDdSK1BBRTdp?=
 =?utf-8?B?NlNCOVdZaklKL2JUT0ExRk1leFdZYkZ0RE5ydWczVHdWanJmTktkUnBJSDM0?=
 =?utf-8?B?Wkh6RDBWTVRkNUR2MS9zQ3RaMXNLUFpSMkFwVWtTb1Q1VGFidUpXWWNJQi93?=
 =?utf-8?B?UjRSd1RLNnJUUWpFaFhwMERrTVFjK25lQkVoYnR1bkdzejYxMW5nV0dxa1hU?=
 =?utf-8?B?c0RuUVd5bGZjNDBuK0puYWtnQ0xCK0I1M2NkRjY1bGpWMzRMVWE0RG9udndR?=
 =?utf-8?B?SUNJaVhYZTF2WUVuRW4yMHZ2Qzl3WWR5NCsyTnY0c3B2Ym9LVTVad0p0WDVx?=
 =?utf-8?B?T1ZYUHdRRGwySXRncC9GTVFQcWR2aHU2N0RsVGdkQ0xnWlgvaFFZbks1OU9q?=
 =?utf-8?B?ZEtYcVUyWndKL2NRb0NIWHRhbE5CWEdLdmsrRmdTK0tUd2JmTlRaYU9YZ2dl?=
 =?utf-8?B?bGMrTW5hNUNaODdnUTBjdi9ZZFFKeHdPYlRRc3Z6NDJMZlR4ZW9SWVUyY3RH?=
 =?utf-8?B?c1VZVHBleCswRW1jK1dsNEFtZ2RYR0tqem9CVG5Wc3FpeWRlbGxZMFhFS2ov?=
 =?utf-8?B?bkRtVTdPZ0lEdGxhNFRhT1dNNUdQWmlVbmIycjlJUG9lbTdZOVlVbHFuOTFk?=
 =?utf-8?B?R2FMY2RUdnl1YXUyTkN2RVlMbjRWK29UOWQ2WTdheCtiZU9NaEllQWc0dFNn?=
 =?utf-8?B?UVQ2WDFBK29QVGlGTHYySmpaR3NwRTV1WFlHa0tDekErd2NRNjJEbE03WEM4?=
 =?utf-8?B?REFyd0pySndoemxTb2pqbk9iYzNJQkM1UnNxeUQwMXRzWjV3c2VQbDFGMys0?=
 =?utf-8?B?R25WVzF4SFdTUm1RZXdOSS9sS2xhK3ZIb3cyVUl2SnZjSHpJcnVRK21iSjdO?=
 =?utf-8?B?TjZSejNuMHc3b0NNY2VNbDlROU9mZkhETVN4TVNOczJZSDlsUEdBbm1HZlF1?=
 =?utf-8?B?RDAzZlN3UXdoSHk1blNieFk0UzBhdDRuZjBrQ3dvL2p2TDFBd1ZYQ2JTdGds?=
 =?utf-8?B?MCtnd0JUdktKaHFzby8vRkZuclVXYWdMSVdWU2pNMlAvRzY1Y3dhR1F5S2Vr?=
 =?utf-8?B?OTVuOElWZzlLMlFKdHdGM1A5cXRPVlIxNHdRQVV1SlloeWRWeHFOSU56ZVhK?=
 =?utf-8?B?djlxc3hScTZNRk5WTHp2N3R0UndzaW9CYXdjSExLUHJMMWN3M2FtYy9aWnJh?=
 =?utf-8?B?M28xTHdtSUNiN0ZJVVlpek9nZWNjTE54aWRrRVhKQmJSMjROdThoZFAwaVVa?=
 =?utf-8?B?RVpodU9jcVRDOS9od0k3VkpuTm9OSEhhRk1SV2Vkdk84NHo4Z0s1bHUzbFpN?=
 =?utf-8?B?RENtMzNnNWVCd2RaNnJvRjd6eGEwZmdUcm43NitiY3JQTUlHYWZIdzlZUHVh?=
 =?utf-8?B?QVpFd3JjWGFFT095QXhVajhvRFhzNzlNdVdEQnp3OGtYSk9Bb1NSQkhRdnEz?=
 =?utf-8?B?OTN3UUd3OVRRYnpINDZRRkNRcVdBWm5QNUNhaFJ4K1ZkM283UkFxeXlxWkcy?=
 =?utf-8?B?ZXZkT2lvUS9qQ2k3blhYVzVvNkhaNDZEWXpnYjFzcjFzQStJSmJPV0xDbklY?=
 =?utf-8?B?NlA1dzQyZ0NyUmg3c3Q2azJXQ2s1M24yZ25vMGUxZHpDRUdMbDh6RHdiMElF?=
 =?utf-8?B?NjFRMDJyMHU5ejdWbjRaOG5BemVYYlNRVjkraURVWUFXSW5tKzFNRTlSQ05N?=
 =?utf-8?B?aDU3cFVoSnFnPT0=?=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR08MB7429.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <67AD3750F0F6FC4BA5ADC41022368977@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB6461
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM3PEPF0000A797.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	0db69c82-790c-4c0b-c07e-08dd7c1adaf7
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700013|14060799003|1800799024|376014|35042699022|82310400026|7053199007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?Z0RpRzVDL0JSUDA3L1IwWHFGOGJ2dUV5TkREWmZTRmJyWVJONHI4V3dYSWo2?=
 =?utf-8?B?TFUrZDBZSmpGWC9EQnFOVG1hTFVyYU9SOHJmSEs5Tk1WUUkvc0NFTzJvcWpj?=
 =?utf-8?B?bGVFUUZVU2lRR2k3bjhGbkdRUTZjTTgxU0E2cDV5Ti9FN3RQeGZ3Q3dCb0NH?=
 =?utf-8?B?SlZ1dFh1NXBwWE5jL2p0MWxTeVdBL3J6bmlTYjRNZmlzUDFwNGlHN1pGTmw1?=
 =?utf-8?B?MGFTTW56L0xENzlBNllCRkpYcW5HM0g1S0VwY3QrRFdDNklieURWNWlXNExr?=
 =?utf-8?B?ZEVFOGZyRzNnMk8yTHhlOHpSMWQrS2hHUFQ1VndKMTlQVXhGT2hEYVMzQklJ?=
 =?utf-8?B?SThLN08wdktlOG5EbmV2V2E2OERHbkJpRzhSQmd1bjVwam00MzJadlFWZVN0?=
 =?utf-8?B?Y29heDVqZ3I5TGYxYi8xR0NxdW81ZXZEbmN1UnlkMVJvejVweGQvOERob25w?=
 =?utf-8?B?M2pCNXR1TzNkUWl3YkRWZ0RkM3NkRjk1a1FGVDBKYW1LcUZmSFEwMHRHeVM2?=
 =?utf-8?B?akFXSXJtS0xXMjd6TWlaQXZSZlV5Wk5HdzBzVjM3WWloR2p4d1VwVDlPZUNh?=
 =?utf-8?B?bTMxeld1STR3ckRaanpKZkZRUUEySzd3S3E1M1ZjSEVnOUFReXBLRno0eFNs?=
 =?utf-8?B?YWtrSkZrNml2amsyYW9ZUUlLS1puMFc1eE02anErZzZJdHFsYmVjZkQ3ekNX?=
 =?utf-8?B?dFB1d3c4SGhyMVZwTlI4c2dsTWYzUlFSL2l6ckNDd0JEMFhqTkl3QmFEVkVB?=
 =?utf-8?B?aHdwK1BQc0hSQUg4ZUVPclE0RWlEK2FRdzI2Sld1NFZYS2RIdVM0dG9YanRF?=
 =?utf-8?B?WXRJV3NEc1JndjVsZWF0SHcyOHRGNUlGVjFJb29xQzZEb0twR1ZROWc4cDRW?=
 =?utf-8?B?cXlHbmE4ZUcwVHE1dndwTS85NlJndDM4V2lmUXoxM09hSElpQWpNQjl0RWpP?=
 =?utf-8?B?U1hlYXpTZytIYXQ5SFFNWWtqZnlLemswR3JockcxZ050NUk2VjRIZ1FwRk1J?=
 =?utf-8?B?ck1XSmFtSXlrZlozb3hoWXpJeE51cWR2V2dHUHpJTkViS1hXL05UY3RVRUhR?=
 =?utf-8?B?bHU2eGhxR2F1eFFEQVM0QStPRmpjTUg4bEtkTUw2Yyt1aTNHclg1S2c4Y2R3?=
 =?utf-8?B?TDZHS1Rnd21yelBhNlAxcmJjeGpNN3Ftemt4YXZaTGVlcTFlQzdQL3R5SFh6?=
 =?utf-8?B?ZHJZRU1EWlBLU1JPbU0wN3V2UklxSVQ2dTVwYXRsR2pnYURaMUpONlNDbEE2?=
 =?utf-8?B?Wlhsd0h6cXlxS2xIQVZjQVNKYy8zM2xROUFGN2liTnowak9jY3QxZ1FnRjEz?=
 =?utf-8?B?Q3QzeGowTHBHZkZFa2Z4NERUa3hwSDJyM2phaW1GN3BIRVl1OHBiRklqRE43?=
 =?utf-8?B?SzRMWnl5YXZWb1dRVTFIK3NSMXNYVlRjWTQ2ekNnbHgvNVVVWnovOXQxMnVN?=
 =?utf-8?B?azdlQWhHZnNTZDQvOG9IOGZwUU5xZW5hMDE5YXR1ZEhMbXdYV0ZSVi9RM05B?=
 =?utf-8?B?WHYzU0FLanNjclgvU1VjV3JiYTU2dDJPL0pNMzZSdTVMRUFKZE8zSC9BcG16?=
 =?utf-8?B?V1l5VkVzRU1pbUQwbjhoZmJOTldmVlZsRFBYV1kraEJpQXpjN2dPNzNRcTlB?=
 =?utf-8?B?NUQ4OUdDczV2eVhidVBUeUVQM1doeFp4a0l3V1orQ1FrdEUwUWo1L1BuVDRH?=
 =?utf-8?B?YkZEOGFrb21KV1gvazdFYmdoR0xoL1Evcko0RWFvWk82MTBHUWlxbWVlMFQ4?=
 =?utf-8?B?MEdiTk9CbloxUXoydzZ4aVNtS2RXc0NBamIreVF1SnB1bzV5dE0wZ0Z5bURy?=
 =?utf-8?B?dUVtdzl0aW0vSFBDOWxKYVhHaEE4L3Z1MVZnKzN1QlB5eGdZcENudmtNV21V?=
 =?utf-8?B?T2d3Z0ZFTFVvV2NuNEdSbHJFNWxFekdub1hTQ1NzMG84SGxkNFNjendkOXZu?=
 =?utf-8?B?TVpDMnd1SDQybGdMZWZnci9hQkZXcnQ4NmsxbDhjWGZUTGVTemltYlZEd0VO?=
 =?utf-8?B?bEs5QzA5QXgzZmNuMHV0WWtzbjJkTkVBT213RmRrYmhjQVZLKzhmWGJmd04w?=
 =?utf-8?Q?xTCc+l?=
X-Forefront-Antispam-Report: 
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(14060799003)(1800799024)(376014)(35042699022)(82310400026)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Apr 2025 12:42:07.0675
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 642eab46-0ed0-4369-f570-08dd7c1aeea7
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM3PEPF0000A797.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB7616
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 15 Apr 2025 12:42:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214845

T24gMiBBcHIgMjAyNSwgYXQgMDg6MzcsIFNhbXVsaSBQaWlwcG8gPHNhbXVsaS5waWlwcG9AZ21h
aWwuY29tPiB3cm90ZToNCj4gDQo+IEl0IHdvdWxkIGJlIGdyZWF0IGlmIEkgd2VyZSBhYmxlIHRv
LCBhcyB0aGUgbGF5ZXIgbWFpbnRhaW5lciwgYWRkIHRoZSBuZWVkZWQgYnJhbmNoIG1hcHBpbmdz
IHRvIHRoZSBsYXllcmluZGV4Lg0KPiBTbyBmYXIsIFRpbSBoYXMgYmVlbiB0aGUgb25lIHRvIHVw
ZGF0ZSB0aG9zZS4NCj4gDQo+IHNjYXJ0aGdhcCAtPiA2LjgNCj4gc3R5aGVhZCAtPiA2LjkNCj4g
DQo+IElmIFRpbSBvciBvdGhlciBhZG1pbiBjb3VsZCBhZGQgdGhlc2UgYnJhbmNoIG1hcHBpbmdz
LCB0aGF0IHdvdWxkIGJlIGdyZWF0Lg0KPiBUaGUgbWFwcGluZyBjYW4gYmUgYWRkZWQgZnJvbSBh
ZG1pbiB2aWV3OiBMYXllciBicmFuY2hlcyDigLogQWRkIGxheWVyIGJyYW5jaA0KPiBBRkFJSywg
b25seSBCcmFuY2ggYW5kIEFjdHVhbCBCcmFuY2ggdmFsdWVzIG5lZWQgdG8gYmUgc2V0IHVwLk9u
Y2UgdGhlcmUgaXMgYSBsYXllciBicmFuY2ggc2V0IHVwLCBpdCBhcHBlYXJzLCBJIGFsc28gaGF2
ZSBhY2Nlc3MgcmlnaHRzIHRvIG1vZGlmeSBpdC4NCg0KSeKAmXZlIGp1c3QgYWRkZWQgc2NhcnRo
Z2FwIGFuZCBzdHloZWFkIGJyYW5jaGVzIGZvciBtZXRhLXF0Ni4gIFNvcnJ5IGZvciB0aGUgZGVs
YXkgaW4gdGhpcyENCg0KUm9zcw==

