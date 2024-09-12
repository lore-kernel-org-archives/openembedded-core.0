Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5BBCFEED62F
	for <webhook@archiver.kernel.org>; Thu, 12 Sep 2024 17:32:14 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (EUR05-DB8-obe.outbound.protection.outlook.com [40.107.20.50])
 by mx.groups.io with SMTP id smtpd.web11.54025.1726162331308953602
 for <openembedded-core@lists.openembedded.org>;
 Thu, 12 Sep 2024 10:32:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=Nee/SzNM;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=Nee/SzNM;
 spf=pass (domain: arm.com, ip: 40.107.20.50, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=XRuqAGCdeLm38oxa2pzTHb8R9CszCICYBWci1H9jcQzQJ+daNm58CvCJ7cdPg+eWSBlOuR64HaKXz8bX9R4qi4ddLzWHW9ohWg2xsA2W3zFKEm/FHyh18clxO0zfASwvRtOevv3Cu61xINW26OV2aWea7cQmUmYyJjOn+3EEnmmvX05K9MS4o0hhSOlwceTy+++/zfMOpwfimkF9zNOk7kax2qL/t0/ID4M7boagjFptl9IZSm+D455q80erg9RQ3t/Gka5ZBxw75J+WuxzHWdTBeHP7/KAHa1abyFOGBmxl19orrk09kzsgExIw0pR38zgPgmQOgwOn0Ey5NZTbtQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Fu+69PJzBx+EJx1KgD/fsP/ZQhjN08+pQtBxc2rBgEM=;
 b=EHe25H3MB9e9zJ51Zb0M521VyYUpwwrOlqkrm+xZuXw3Hpdj7mO5eiQqHlvKHMvRoG2MNTTp1oBAveS2UaTs+93CFBvv38j93U8/2s0iHUk/zg1oynXvEq9EThvLBcpaNpTid7vVh1FGrDQh7CdQ+tL+pUBfuJ3XNQWnNvmiQDjj3LZ0kH/W4ZgUHyH859drZEDRL/KlwrzNYQUGD/DGsurAi0h8HwTzcBOzLjs6FAMRO9v1OIgaH8S/b3Nk/cgfVuSPrgTv/FEi3YijlAzUuW1UNGq6acUtMo2JPitupmDhldhsMqjxpx9rpFNdUNnX09ybHiCntR3xb3suLGxcng==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Fu+69PJzBx+EJx1KgD/fsP/ZQhjN08+pQtBxc2rBgEM=;
 b=Nee/SzNMsQOtNRwRSTptCLOgyuUPv71TY6DWiOo8tx3CEoadGJ+zG0mCCNCI3Y8NG6TjrCu43V8xjuPrCJxTag0TihE1fvPF/gpuMw2Q49qKQr0HnUWoj7wm69DJt4C0AvSy6sRaa/nPuiY98K6C+Mt0xXfNDGDAPCCjvvlh/bk=
Received: from DU2PR04CA0339.eurprd04.prod.outlook.com (2603:10a6:10:2b4::18)
 by DB3PR08MB9897.eurprd08.prod.outlook.com (2603:10a6:10:436::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7962.14; Thu, 12 Sep
 2024 17:32:00 +0000
Received: from DB3PEPF0000885E.eurprd02.prod.outlook.com
 (2603:10a6:10:2b4:cafe::78) by DU2PR04CA0339.outlook.office365.com
 (2603:10a6:10:2b4::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.26 via Frontend
 Transport; Thu, 12 Sep 2024 17:32:00 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB3PEPF0000885E.mail.protection.outlook.com (10.167.242.9) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.7918.13
 via Frontend Transport; Thu, 12 Sep 2024 17:31:59 +0000
Received: ("Tessian outbound ee7a81b3b7b9:v441"); Thu, 12 Sep 2024 17:31:59 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: ce8cd02f9caaa1b8
X-CR-MTA-TID: 64aa7808
Received: from L7105f32647c2.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id E3C6D1E0-5E1B-42CD-90BE-D6CA26AD488D.1;
	Thu, 12 Sep 2024 17:31:53 +0000
Received: from EUR02-DB5-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id L7105f32647c2.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Thu, 12 Sep 2024 17:31:53 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VIbw1GNTo/14dm6mwh8aEKO1rN+M9YAppeqVif+zElnJfKPolbxzw/Fl7kKRDl7bTZn7C/KzTLxieva60umP23i94I2DkoDhaRAstZ6NSxlhicphxLe93VblVEwmB6sP/IC0JW1pc8V7oQZI5uqu7vaa+gt2RSZ5e/pvvVNHdAUXNBKV8JlW7qjBY4srP56WlO5q9NK+9qQBNGMuLKC5LKyn2gmtI69YQgThA3bK9ACSV7CWn/8ky6XeoDSYKVqxcjAkipniAskHsFugG9OddLp1Sh91ZEI+uVMgMNsVXLfYH2Av0ipo+Yad1LnWWzOApTkFq0RLNUumnA0P1xxGFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Fu+69PJzBx+EJx1KgD/fsP/ZQhjN08+pQtBxc2rBgEM=;
 b=s5hP3MfSvXyGpBRUZ0PfyDgaOAP9zq41FaF15Tfpm/B6YAsVDMqFrErW4xXn0oz4pcwxW7Xo+pdC0CfwKzNdGeuWpAW+qfUKKQ5QRSZbcDA1g/0yf96w47+1r98uvO3QViuX6joQbv1jb+FlcGvIFwmYKDAU2Ig9vU+UVfQxlxU5aDdns4m/sCWiBOimZwFUafX8Bs1puVF2IptErIjlyuMxgF2+DCJyQ9ebFng+OpbXP0qrhxtbIoaCmRHPUUI9tGxYIX00olDMrnOWPqpK+qICC2BmMfS8cO5P54c3b8+AWlyaHmccck8k/pYfuNQPG1S84OTGZp5eoJxzac93nQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Fu+69PJzBx+EJx1KgD/fsP/ZQhjN08+pQtBxc2rBgEM=;
 b=Nee/SzNMsQOtNRwRSTptCLOgyuUPv71TY6DWiOo8tx3CEoadGJ+zG0mCCNCI3Y8NG6TjrCu43V8xjuPrCJxTag0TihE1fvPF/gpuMw2Q49qKQr0HnUWoj7wm69DJt4C0AvSy6sRaa/nPuiY98K6C+Mt0xXfNDGDAPCCjvvlh/bk=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by AS4PR08MB7505.eurprd08.prod.outlook.com (2603:10a6:20b:4f7::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.7; Thu, 12 Sep
 2024 17:31:51 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e%6]) with mapi id 15.20.7962.014; Thu, 12 Sep 2024
 17:31:51 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: Jose Quaresma <quaresma.jose@gmail.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH] sanity: check for working user namespaces
Thread-Topic: [OE-core] [PATCH] sanity: check for working user namespaces
Thread-Index: AQHbBTTqtFkQSUQE+k+aEcpYynnOFrJUaDaAgAAAooA=
Date: Thu, 12 Sep 2024 17:31:51 +0000
Message-ID: <37B04CFA-FA19-4105-93C9-24378F19B287@arm.com>
References: <20240912165736.1531460-1-ross.burton@arm.com>
 <CANPvuRki7+qYDDvYP96PdSBSFMSE3AKKKNei_q9RNhpdb5F-bA@mail.gmail.com>
In-Reply-To: 
 <CANPvuRki7+qYDDvYP96PdSBSFMSE3AKKKNei_q9RNhpdb5F-bA@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3776.700.51)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|AS4PR08MB7505:EE_|DB3PEPF0000885E:EE_|DB3PR08MB9897:EE_
X-MS-Office365-Filtering-Correlation-Id: 24eebdaf-965a-41cb-4676-08dcd350cebd
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|366016|1800799024|376014|38070700018;
X-Microsoft-Antispam-Message-Info-Original: 
 =?us-ascii?Q?Iqzzh71jXfRKb7vQMf1JhP0BO4+axvR0DwliBTKi9L+skIZ2D2B0IJg6Q5jy?=
 =?us-ascii?Q?bHZEU6nM7BXtSWVfsmofpji+YedzBlwTsppvNj4DNzM4dkMumxk4KqfHh5Yv?=
 =?us-ascii?Q?owuLlNB3H/XMda35e4U5um/UlQxukejgIoaV5FavaQ+uRdrnSny8TuSU4wG8?=
 =?us-ascii?Q?ril4VOuu3GvJVVbCh2aZuQWmbech7Y0efHOs22JgkndyCgBpfixWQCGDgqPi?=
 =?us-ascii?Q?kpk+9Tjov1gc5XB7Mb2VpXCcLJ0JndBbLb5kVZm12HeXUct1/L8zIE7ANR+H?=
 =?us-ascii?Q?/aI6/VOI6P9R3QamvKbvziGYW+ZU36Fr3vUyGacdyoqPfivU59hKhvVxMHqh?=
 =?us-ascii?Q?VUIl1LERpFb159R7jqiLm5QkVUFQWPM1tWofCHltRBUkf615ozHhTmOqBwB4?=
 =?us-ascii?Q?SeQJEhkI4o+MH5AfR6WG9Lq+U8+aa2e3AxW9shb7kTmyQOS2QQF3RIBGQCfP?=
 =?us-ascii?Q?AyFpGi8CkboC2ltMz2ZN6IkuBMXy6kIV5OTxoJ/qv9uK4ynvqaITpW8gWvrW?=
 =?us-ascii?Q?4jesRpRrdx+0vN257aQmLZPgq9BDhD4T86UqLOUi7HjjqrKivVI5u8dMzH/I?=
 =?us-ascii?Q?Guy94ifqE1m3+iQ1oTuwa9C3nVDEee9cHQBf5n+okIXDKOftYFYYnT5v85uI?=
 =?us-ascii?Q?yPvQ7pVaRPdBc9m+eOvrXuQn4/pP2bCbeEIA2cXdYud8I3vf9neez0qCjEKb?=
 =?us-ascii?Q?MRn0wakyQZMBGYkXBXVerda2AiSgEMDJQvpgIdObio2ujG76goqP7TvifYlR?=
 =?us-ascii?Q?MEWBiwgR9XN9yp9dWjYyDfH3O/WURjBLJ4eY3D6qqZksiJMY2DRjvHT22+fF?=
 =?us-ascii?Q?Pu1GTKQudgAlscabZ8Am8L2fb0dH8O3JJLqP26IXi3sy2cPXFnQw+WBQ3tpp?=
 =?us-ascii?Q?+2Al9MkS0YnbpLHk4G3nkf0AfsxwP7zvOBnJQNKMlKK6TSACfaX9SaGVd9Qq?=
 =?us-ascii?Q?cno0G/ko8q+h2cHA8QQTya3M0+tZUQt6eXFP1qSdEq6Lf11804IhUl8OH0Jb?=
 =?us-ascii?Q?qFELLAn8OP6oOL2KdGwNxyv9f0kpbi0FTOVDdbyV6aUQumo4O3za6qD8PZy2?=
 =?us-ascii?Q?Pp0w51IkLr2GhLpZ8cS2e6vqcRt82955bO8wuqAlXPftomP1kAPJCbA+iTFu?=
 =?us-ascii?Q?MIc8/xA/u8ZaaNUATcUAJIdXjPfWZodZutHvKJTWogyviI3iWjS2QMmBV4gJ?=
 =?us-ascii?Q?OicZpV0O1eO5Ni1yWUnYpOFdWqk2e8A4sxku/IPEOcnjgF1oK3aKpoWCbIrU?=
 =?us-ascii?Q?P2f6xEqklxATXwuYTSYVEGX1+F4m4eGcgWQpYrNONom1mEEF4iQrMaUIIO00?=
 =?us-ascii?Q?d9klnBJOV+Pj0o7SfhtHngvT8N9EAsKxWUytZSYzyop1xucyG5d9ulcKyNU9?=
 =?us-ascii?Q?mWUaEUe9/8vMqIVMEk1mCvqTOAYgaDZFWn5bJDrC9TIYG/g7Pg=3D=3D?=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <672DC0C2C108C242AE95E3ED83581BC7@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR08MB7505
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-SkipListedInternetSender: 
 ip=[2603:10a6:102:2a3::12];domain=PA4PR08MB7411.eurprd08.prod.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DB3PEPF0000885E.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	939dccd8-41c4-4ef9-0683-08dcd350c9a0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|36860700013|35042699022|82310400026;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?duRxYCprJnshyfn5LYxX+TF4ECklofTPNI3fsHqI1jCwm6B4byWU7W15WIB5?=
 =?us-ascii?Q?p/4SDyC3Wu6AHK3vP31crHQDPE26ySieJjvtaZVeCGH1jha4n0gecf/KjioL?=
 =?us-ascii?Q?x/0tWruj7Adpjuv1d9DooV/oieMbRYxdrbMVf2YZuP75FIdvODdUxj56b0bT?=
 =?us-ascii?Q?K9jU2dks0WxCAc0exBuXDbECG9s5loL8VYZkaPYztUT8XVNrYQUG/QWpPf5i?=
 =?us-ascii?Q?1GX2vPjllQjvvYXEtuywn5pJKBR5RGI/D/XBg+1JdY+eWFfss1ElceKmE95J?=
 =?us-ascii?Q?vEhVxVygDK7SkQd8GsQQpjWpd4SdNsWd8JURRfSG40s/znIVUFyS7OgEugFv?=
 =?us-ascii?Q?5tXtYj3hsa70ubeWXZ/efFkkNMbdsmHNJShiMxRbwQmUpyS28CAIOE2e6kYn?=
 =?us-ascii?Q?nVoFUmNGlCuJpmVSZjYYhhyzTY96HTOarVCH28plvd/IcJMDAHExT2g1hYPS?=
 =?us-ascii?Q?P7nNfqLtdUhxnL0Gk/eckOP/ZhbgzA2Zi+s+C7cVhErfEnR5CY4bpXlYWaBX?=
 =?us-ascii?Q?AxlL5MGEkc9pjRoLu1KqnsiFiBNEbLbAid/1zYNScbXuwma0RYb3aR1jgHKU?=
 =?us-ascii?Q?0SnsHFTP+Yka+k31gguHBy+Dc8L3DVgygX9MZ971JnQzd+E7MU91M/EwOp5N?=
 =?us-ascii?Q?K27OUPHCx2V6FZ/LOsv4hV0bv1nfUNpVBd/NC/t+NVx15f+tt7B+pn5Tg9uI?=
 =?us-ascii?Q?oPPlOw98fft6plLfkAGCEUnT49LFkPKXH6pe/hocWTGv0ocSoTcxmDrfzesu?=
 =?us-ascii?Q?MjJVBv1Gzszu7yelKs/9Pa9a8GE92ZUEsEfD+yPZEaUATWobNEV00c2eWLtl?=
 =?us-ascii?Q?+k9OjjD8pHOQ+qfaxeOvrkD6Y8brasaR3lk148/va51kiD1VsCtAb7QhKqQe?=
 =?us-ascii?Q?jYZJylaqYYRVrUVcyrR6Yc/ELv0tMNE/wL8nSXIei0eu1ceHMr/r1rLSu/kp?=
 =?us-ascii?Q?01UKZwOjpIHhUo91f5LykOT/5cfKyRZmCXNf8X9n0Q2IoFLUNL9GySYXB6mX?=
 =?us-ascii?Q?ShLGpzXogyg1Myq0axdWfdrmpdYKnKMlX1d5/N+OUQ9552QC9KTzwgcpQ37Z?=
 =?us-ascii?Q?9cvBglUDg4+QK6vEptk8ARONBf35rJJ5ETH5SQBZ53KRJsXRUvETqHMCd8Ao?=
 =?us-ascii?Q?9J7iD+VLD/A9RBfzgqrPKDc5zcSkxAIciA9/9AnuAkzOrpGEOlmcvf2RCaZ3?=
 =?us-ascii?Q?NivpYGwpSYgtCB/7HhO8nfe07zvLsy2RlByqxs6+yakdKMPgK3I+piv63kQY?=
 =?us-ascii?Q?Uab3hV2yUTjDgTR4sxJ9qD6+EtwpfhRjHnGrWRESHP4iRs4PkVWAgTh8NOc2?=
 =?us-ascii?Q?qMdx7Z8V1evwbp9H8A9sF9mgRkesBexjOvDM4bgeCsBldgRBBM83iqqnf9bv?=
 =?us-ascii?Q?A4i4qIiPrHHBFEEbKNhUmIYOCyPxxgdbuhGisIsyH7j/uMuwk2IBUWQTfYtx?=
 =?us-ascii?Q?UfQs2czFEmlXJML0gz+tZ/XtNsoqtEyP?=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230040)(1800799024)(376014)(36860700013)(35042699022)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Sep 2024 17:31:59.8810
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 24eebdaf-965a-41cb-4676-08dcd350cebd
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB3PEPF0000885E.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB3PR08MB9897
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 12 Sep 2024 17:32:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204457



> On 12 Sep 2024, at 18:29, Jose Quaresma <quaresma.jose@gmail.com> wrote:
> The error message could be better imo.
> It will also happen inside a docker container that runs without the NET_A=
DMIN capability, which is the default.
> https://docs.docker.com/engine/containers/run/#runtime-privilege-and-linu=
x-capabilities

Do you have a suggestion for better wording?  Also do you have an example o=
f it failing before this patch, in case we can extend the check to actually=
 handle this case specifically.

Ross=

