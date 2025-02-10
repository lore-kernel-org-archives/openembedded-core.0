Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8C97C0219D
	for <webhook@archiver.kernel.org>; Mon, 10 Feb 2025 11:47:29 +0000 (UTC)
Received: from DU2PR03CU002.outbound.protection.outlook.com (DU2PR03CU002.outbound.protection.outlook.com [52.101.66.51])
 by mx.groups.io with SMTP id smtpd.web10.48919.1739188041432241329
 for <openembedded-core@lists.openembedded.org>;
 Mon, 10 Feb 2025 03:47:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=G7ZnEbjN;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=G7ZnEbjN;
 spf=pass (domain: arm.com, ip: 52.101.66.51, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=iq1DnS/RsnCVByBIVPDexMdiRDT2qQj6SxQ+N82oq/vonaHPZg1Fpb+vgio509Lsg8djXKA5+0XgM5hkX+DsXe4FrJhhBhADzTEcMCCagYPnuUBTrRMN5ukXIKpdHwIZdM8X9DPlxiyDRr6t7KSq0zAkLss1jOVY7zvlAwGvKp/M4FpChyH/fpd+ycinHPGWJnZiUqofbaEmoKiX5LJarzbJ7w8DVu5yUjH5NQE6vnPTV1IqP0Q94Th53REyjfv+VjiusycrcrZx7KL6LyIMe00IgcItEPjinmDP3dMgzJASjgRtUPpKE0Z9HKFWVwiTcXpDLSLIkHcChpkakkzIMg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7tYBxxzU+rr1Ue8WAoBO2cJLnDNVlJrUOByrBoFzftU=;
 b=kJheu3K02erDY+ll5PbXS/4JaZOhR8MNSUiN8QLRKPq2g0V8QkJ/wSCIroF5MlVKfzpPMH1Il/ZoJj5P26jDwonX7Y7HlElI7LUnqc3FutF4j6Yb0O1bv3lbk0BZr+OdDwuWi2XPsKBD55VEQ0wo6UCORSiByFrMcYoh+CFzyIvLVp9NJJ0J2ciG3Uee+hOwMZshhSO0m8qvShhWIMsJa/6QcOJl9A7MeQegOvf+KEUEYV51I1YrWHYBioGb115UGZJBuCeZYQsxFdnfaZyBdx0w0PgplE2k/vp4oISsZhQ/ffG7dumIKrdYtM0GCK9cuImNldYmC2qv0MTVVBeFBQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7tYBxxzU+rr1Ue8WAoBO2cJLnDNVlJrUOByrBoFzftU=;
 b=G7ZnEbjNyMan+m8WOz4v6oZN5soDtiOYXwKYD/g36aUJJmrHukw4vGCgjp1rzfT0BBYdDL0K+sFqWTSk2O7JS/SFmCh4hth1r3cPaojwgR2objuzy3FkvaX6LTIIJfNytSU/UFUKFzbCNyiTWozvkTEgRffEEmdlCBXw8j1ZXK8=
Received: from DUZPR01CA0262.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b9::24) by AM8PR08MB5588.eurprd08.prod.outlook.com
 (2603:10a6:20b:1d4::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.18; Mon, 10 Feb
 2025 11:47:16 +0000
Received: from DB5PEPF00014B95.eurprd02.prod.outlook.com
 (2603:10a6:10:4b9:cafe::ee) by DUZPR01CA0262.outlook.office365.com
 (2603:10a6:10:4b9::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8398.31 via Frontend Transport; Mon,
 10 Feb 2025 11:47:16 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5PEPF00014B95.mail.protection.outlook.com (10.167.8.233) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8445.10
 via Frontend Transport; Mon, 10 Feb 2025 11:47:16 +0000
Received: ("Tessian outbound b69432ffdd72:v567"); Mon, 10 Feb 2025 11:47:16 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 17b8d7604862d5e7
X-TessianGatewayMetadata: KsEWZHMNPP/wUo3kBUJYWauALBHf9bZQC1OIrjoQo1ROsnXglUGc2hx0QxjXDQ/uRhKC6Qw5cGo87jF6oNcKkxSGY1xFH3KpQjeSnDqGdXoPzE04KMLvw5KxtgpY1Y9a9sjEUYQhmJd10SSaNmbtsdVeFpAzXZCkbGIxyJnXKiE=
X-CR-MTA-TID: 64aa7808
Received: from Le09c42590d4f.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 6EAF3735-57FC-4B73-9414-F3B89E06CCCD.1;
	Mon, 10 Feb 2025 11:47:10 +0000
Received: from AS8PR04CU009.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id Le09c42590d4f.1
    (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
    Mon, 10 Feb 2025 11:47:10 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xYHHwKcAs6dx4WmNUvsKwVyBxB/PiLhfC1tONt8FHjFz0MB8Zi2wfdEnMmVYUJPF+C1U8onWGhsZDnIYDfISeYFe0Pk7md2VrexxucpLrbdsU0IClwavn+9oMZr3n6jYI2GUloHIxxxQhfFH4C1UXImBeJ3qJsDVYjWGjH3/vhFJbuk3+cc+JZbxyQTpETmQ1YovQkJjBT3fo9sAQEoMszgwrxlVNr3Zcg+hUaig/Vc5dDwb3Zs5PoGMqHJRjrXNNyUTJ7rnMJNAV2EKdFj6nDRcp9D/87er3naZw23Uw5DrQrSMMnhCfBsz7Ymf0b7NcHdhNZTuwWdbQgNeGwMpQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7tYBxxzU+rr1Ue8WAoBO2cJLnDNVlJrUOByrBoFzftU=;
 b=Y4oXEYtkE6xsB+Jct/EFwonmL04IWc7/9xF1swHuBN5YulkZcnLFXkVI2MqSq1KHx5szNi6VHGdx9fihngiXmHsoWZb8sOhFTsmfpA0bckymqmnKvoxJO8rFy4gbqDhpZj1O+6cn7f71VdnY8f/ijP26atpUnIl2ZoC19ONSjXL8Lxcz8CpDmZ6gWZMcHErXIKubdnGF9Rz6gCajYCFzP3fi7KycbINZS5hEHWvWbl1NwfEpKiF5mDiaPQlSx0EEqjqSJdqB6zoviMD/HoBP9ywTZqSJ8Ic7Uu1+CZo2wyAiwuQQpQfuCOrTzHwvmQac+enK7WtzOQmhGyLxp8gtNA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7tYBxxzU+rr1Ue8WAoBO2cJLnDNVlJrUOByrBoFzftU=;
 b=G7ZnEbjNyMan+m8WOz4v6oZN5soDtiOYXwKYD/g36aUJJmrHukw4vGCgjp1rzfT0BBYdDL0K+sFqWTSk2O7JS/SFmCh4hth1r3cPaojwgR2objuzy3FkvaX6LTIIJfNytSU/UFUKFzbCNyiTWozvkTEgRffEEmdlCBXw8j1ZXK8=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by DBBPR08MB10532.eurprd08.prod.outlook.com (2603:10a6:10:530::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.11; Mon, 10 Feb
 2025 11:47:08 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e%4]) with mapi id 15.20.8422.015; Mon, 10 Feb 2025
 11:47:08 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "oobitots@cisco.com" <oobitots@cisco.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH] systemd: move systemctl utility to separate
 subpackage
Thread-Topic: [OE-core] [PATCH] systemd: move systemctl utility to separate
 subpackage
Thread-Index: AQHbeKZWTTI0bMcat0GRjbqhdka/xLNAcbcA
Date: Mon, 10 Feb 2025 11:47:08 +0000
Message-ID: <E631A283-5721-4E5C-A65B-5A8CC986A600@arm.com>
References: <20250206144907.1924993-1-oobitots@cisco.com>
In-Reply-To: <20250206144907.1924993-1-oobitots@cisco.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3826.300.87.4.3)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|DBBPR08MB10532:EE_|DB5PEPF00014B95:EE_|AM8PR08MB5588:EE_
X-MS-Office365-Filtering-Correlation-Id: ae201cae-74e0-4c14-91e3-08dd49c8aaec
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|1800799024|366016|376014|38070700018;
X-Microsoft-Antispam-Message-Info-Original: 
 =?us-ascii?Q?RIQym5NWfVD+shZ1PqjBl8DOSJPRMpvOWj5YgajLXklHbGXVH340gOBauTN6?=
 =?us-ascii?Q?hjc4yN3kO5jEqpGGpHJlVqI7lU0/qdhUw7Or8FnOSJ0dlN6AO3iDmhuLjYVs?=
 =?us-ascii?Q?XSW7ASXcyTxASnEYy5iK/wp++gpRYw5CZFwyzlX3KgiRYkGIHgYJzYArsucX?=
 =?us-ascii?Q?X+1JXO4QaLu5G+AJI6UrU/imYL8oZzA7kYS/mhdoCph5QC7WA3Q1YlnOcINk?=
 =?us-ascii?Q?OuY2ER2GOckfE+ZwjunF9e3D2sumwF4OcbI3lMvUyBGznm17Ln9aRuBXSeq6?=
 =?us-ascii?Q?S60Y66UJ1JuVXX6NHQzFejIAGSlOa1JPyesGitBljzx2ndcCk4bykrnPEc0C?=
 =?us-ascii?Q?pZhE84mAgtk8pSqexEG7RE/G/QEt55ImDxBiASnVgSwhIPjcoCAnT8C3ldec?=
 =?us-ascii?Q?wcIAJTg+P80COkMXpmHm6dJal9injEtu89grBKFBCdisIsHdJY1oduUNPGPJ?=
 =?us-ascii?Q?URbzeadKxqHbTsu6bsZFR47OVHZxhtj+4Sbc8OZSa7kVSeywTXAH/4m0pslO?=
 =?us-ascii?Q?OLGDmuY97mMKV6qYuRQz0wtFdCwDrdztjf0YWxS+kf4lCLipXMozahlOkufk?=
 =?us-ascii?Q?YLRqB7rhcKUh4XghsTzF9nLCjsoGP2FAfLHoO1MukBTjyODcJtJfXX8VcXak?=
 =?us-ascii?Q?AbHUkRFTwsXCvXESlhN4pnQQmg+1MeJmdzbRCTZY9WoVPlKn3JJp5TbSObBB?=
 =?us-ascii?Q?ecdr4RAOzyFyGz9EBxxz67oc3KBypQq3U4+2hRNPBh3W1VXmqsaRGsV0KOk2?=
 =?us-ascii?Q?knr4ir+9XQBU5vFlGnVzOMmHn+IqszqLguWpLO1MjgmsqHRF/ZQl2AUcuYwf?=
 =?us-ascii?Q?eWju4zWYGEBqhk67fuARiKWOVPWDj3c/HXRZuPixx++AHcB8f5OZJXARFXcc?=
 =?us-ascii?Q?mDh0XxUhcj/Y8uaATWRo7oj0j+d9emeJY38SF7mzFtpCt6AtWNUc51JItbsp?=
 =?us-ascii?Q?W2oRc8QLDb13Q0H/tKNiXWayR9DIZvCsrKWs9KUUzxUtp4p4/iOfAh3sIz99?=
 =?us-ascii?Q?vDWfMnNcjZS9jUkrx0ezEG827GpMKfOS+3ixJ85ldYlYe9Xr+bdxrQKUssVv?=
 =?us-ascii?Q?BtVxF0xT60/y4DbWL1um0dg/Kw8DxlLQiMUjrPn8DQ+BfNFSZZtMawEzNY0j?=
 =?us-ascii?Q?HP1FYd44KBsQ1XEwEamWywnI+NuS8xOA0xNaZfcgxhFgXW9SeAEdyMi//u3I?=
 =?us-ascii?Q?vHCxxXkFeGo6yrlvNN2vGKnixIYC6T2CC2/O7+ySoRHYxPLLSf5Vjh3XKmeQ?=
 =?us-ascii?Q?A21dFQIfzpjPecozDDpCKqzG6pSXS776hC6laa2VoodaM8FFATEGfSlrqpTI?=
 =?us-ascii?Q?1QaJLqz7+SCSJGTiWOT776TowHNuhvDQiUXkVo7KgRqGA2JZclSPauRrajeG?=
 =?us-ascii?Q?33Gh23AJoBK8YP0cM+bneCwYw9bAsMs0LW/Mp2C0pHby8xadMAwnh6abWVzU?=
 =?us-ascii?Q?qilspDpgLKMFDXbZWabcfLc46Vv6hEi3?=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <F79EB6BB5DE6BE41AF3BDDCF59D60CD1@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB10532
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-SkipListedInternetSender: 
 ip=[2603:10a6:102:2a3::12];domain=PA4PR08MB7411.eurprd08.prod.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DB5PEPF00014B95.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	93c611bc-1bca-47ee-f071-08dd49c8a5df
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|82310400026|35042699022|36860700013|14060799003|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?0Clgkae2OorV35OcSlfTKDWPfNEDJPUaARXLSNU32r2CDuzq1vMihQ+6lsHU?=
 =?us-ascii?Q?WV+uIQSvoAOf9H25pPz83+DjhjgI6qgVMhii1O37rG9zMXr0jphmLkLES4Ag?=
 =?us-ascii?Q?RqPqQ9F2lUis2QYnmorYeZmpOl8b89hAZ5MmkaZOXNJ4Up7yldULBOGrA0dB?=
 =?us-ascii?Q?PXaKxtwzaRcQG4NH7EsrN2WaGpgTmxKvnwqvEv349aLApZ/LEemEjf12zpR/?=
 =?us-ascii?Q?u+Npr594F2YET/634jIzCny2p3vvJQqe+DcWMMfJ0wPsz1pmR2gLlqaOgw+N?=
 =?us-ascii?Q?A6ZqGmXSC+YbFbWY6TAnib++pZjTmpuElgrcBZO9Rpb9hclZXEyYfuoJg0wC?=
 =?us-ascii?Q?N7qJUbq5F4/uO55WZtctv/z4uQZs0Orq2aw6rWc2A1km1dYwP2/CYLkF0lxS?=
 =?us-ascii?Q?UYW+FgE4P2NF4MYle43B/flmHzZEM6Ccc9ERwkalAx8S9e26UneDtKJcBjiR?=
 =?us-ascii?Q?Ew4OovGk91nuSpk/6e2YyRUv/dT7lT49O8V0auOiFH6pd/q1LfI59Lvp4WEH?=
 =?us-ascii?Q?3LS1ejY0uwRb4iN/WWlFKT0ATQZoBBzmIsJjjZzQggMk1FC21QCU+3yBK3VQ?=
 =?us-ascii?Q?KJj+VRj1UQok8cvFDThAut55cdOobO/d6F3DWkjkSFryBjB1GXenuV9WW8PU?=
 =?us-ascii?Q?GrcsRcjQZDLGKLqPCN/KWpuMBKeQxtQqkQdRAp34enLph8aNDvjkc8F1pft4?=
 =?us-ascii?Q?I5AY+J0oWu0wOhvSGWwCGhJInqecyiTKtCJMbVSKHYfi2LUIAMADMbiKCesV?=
 =?us-ascii?Q?WIkbuBFn2FCnNBYzf9d+0JFDFwz0slEggv2SOelcKigLfTUsIgAR3mZujYGp?=
 =?us-ascii?Q?gukKigsU+5RMyOf9h1HWYvpmHKADAv0uGCPQjPPNRYUbWBKGMz0AFcFnb4WV?=
 =?us-ascii?Q?Mk/TqjVyQmTcl3NIeAv8sTnII0ONRZxWqn1ZZ+rPayIGhZ2qG4CAFzYMLMaX?=
 =?us-ascii?Q?Qn2NX2Swsq/nYurUo52ZZ276/Ab3SeuQ2Y27Tm531LX8H/sCElfAVq0Eru43?=
 =?us-ascii?Q?g4jsp+HXpJJdPTL2Eko9uSAhnELY0RGtNtWGXeihqVYtIb4ehaSNZ1QwteRp?=
 =?us-ascii?Q?yUu9AnupgR523qMLo49uMh1aN+DTVJgfEChKwHsv1YiU5KpjCZ2tDtI3v+UB?=
 =?us-ascii?Q?dfCfR3absD9aiMlBu+MomwCmIcOxDwJIJ+XA224adX3b6rsEOXEl3SASn4EC?=
 =?us-ascii?Q?mfu3FYjvIE/kp+U73PoJFyqwNkwY+TXvXLOhXl6SApVvR3T/jTNvLYz8Vb8e?=
 =?us-ascii?Q?9jQgEfhnpoZc+yN8SbpNmQIXhp2bdDcqdWJkyufF2Kc96k8xtio297+RlzUr?=
 =?us-ascii?Q?i3Jqr4JGLkS83HHy7r0DUmbwCPQ4LkWgZvv0UGYb2v5RPQcZ9jaC3EKWWzKM?=
 =?us-ascii?Q?9d+npKQ3HWKxqGibPvZIU2pKYMv6I3Hv5tWW4pl6rQeevvBWq6jw7PNqI3/h?=
 =?us-ascii?Q?GWmjy6DyML739pwcqNw9OvEdka5/YtR91e7FBnRJ054MBozVMlCZoOTOnXJ7?=
 =?us-ascii?Q?jpO7Sgl13fl4ViU=3D?=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:64aa7808-outbound-1.mta.getcheckrecipient.com;CAT:NONE;SFS:(13230040)(376014)(82310400026)(35042699022)(36860700013)(14060799003)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Feb 2025 11:47:16.6395
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ae201cae-74e0-4c14-91e3-08dd49c8aaec
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB5PEPF00014B95.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR08MB5588
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 10 Feb 2025 11:47:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211092

On 6 Feb 2025, at 14:49, Oleksiy Obitotskyy via lists.openembedded.org <oob=
itots=3Dcisco.com@lists.openembedded.org> wrote:
> Move systemctl into separate subpackage to minimize
> dependencies from core systemd package.

In what situation would you have systemd or systemctl without the other?

Cheers,
Ross=

