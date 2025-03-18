Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75BF2C282EC
	for <webhook@archiver.kernel.org>; Tue, 18 Mar 2025 11:07:34 +0000 (UTC)
Received: from PA4PR04CU001.outbound.protection.outlook.com (PA4PR04CU001.outbound.protection.outlook.com [40.107.162.1])
 by mx.groups.io with SMTP id smtpd.web10.9169.1742296042860882122
 for <openembedded-core@lists.openembedded.org>;
 Tue, 18 Mar 2025 04:07:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=PiWaUBmW;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=PiWaUBmW;
 spf=pass (domain: arm.com, ip: 40.107.162.1, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=uGwKbAzDQ4m1NOK35e31OA130X1bN4Va4uq4B/Dozg0ZaHASOPPN5weNHTHCkkaKaslOF6YNmdDnY3ZTUm5wvL8BSTTgwzu2PtimDNNeScpZeYyi/VqQuk6vtOSILYgV+OdJ/tsYhUREj+MCoZKpvp64epflDqj+V0/FhIJHIAm8e/Ymdlt6JmBrHVQsJvA8RrbBB5/ggsXa6dA9FqmCnH3B9d14vs34rA9JxXCvu22BYnpj0W77HqQgyqgLyHSFYAz5OY+EO4OzvUaikMNfxznuOffCi1UafAFpobJsUWTXtWkVitz2T1YCVlGB6ZKPbCvqzWeCFXl0vb6VvEpplw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HqWLh4K5C2vrR7tYxc45NXwgB/lB/sWfQr/DmFwgPv4=;
 b=J5y/ccmj9g2/VLOheiqfie1K4jnPkIlhVoQgjWEg0DueecdNPc3BBK4unjvdQwIXV09rJivTlAr4jK8+/SaitoMNjJ4VxOcjHBcTcZWtA79SKFjNJyg0w7oXRA1zKr8T1MvgVvqVLo6Lm+eRv9EE9+GjAKFlH3QWZSb5AqKPzxWzlcZE80nLNW4nSyR1sqgrZgDR9p6OglaR0KkOl/KytFUwmKFymx5l1fTQWRPfuKD76vXZxT4hwild/UxmeTqyMEB30fOcG5V8CIBRYjJXzBpnnYhYZDlMAgbJSeIG+Dd8pkUN1jajTCxiVJQr9oLoAA7doC/c+k9gqLYV7nHEoQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HqWLh4K5C2vrR7tYxc45NXwgB/lB/sWfQr/DmFwgPv4=;
 b=PiWaUBmW1tC5Xa7pmhpHk3NKTNsnChgNQrbZiBvcR8ZCmSquHth3bjl/7jyS1LGidTWwPK8V7Jdozq85GzUC4KdTl4cKoIwpj7c/JrRD0Er0dagsrN1ux4+VOxHJTnj8mA7+V1S8xmE38FaYybL9Y8io8n1ygZZR4TniVZqQe4I=
Received: from AS9PR04CA0115.eurprd04.prod.outlook.com (2603:10a6:20b:531::25)
 by GV1PR08MB7850.eurprd08.prod.outlook.com (2603:10a6:150:5d::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.33; Tue, 18 Mar
 2025 11:07:18 +0000
Received: from AMS0EPF0000019B.eurprd05.prod.outlook.com
 (2603:10a6:20b:531:cafe::66) by AS9PR04CA0115.outlook.office365.com
 (2603:10a6:20b:531::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8534.33 via Frontend Transport; Tue,
 18 Mar 2025 11:07:18 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AMS0EPF0000019B.mail.protection.outlook.com (10.167.16.247) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8534.20
 via Frontend Transport; Tue, 18 Mar 2025 11:07:18 +0000
Received: ("Tessian outbound f89894bb7c0d:v594"); Tue, 18 Mar 2025 11:07:17 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 29d9c7d836b064c7
X-TessianGatewayMetadata: BWEpVQ4H6JA4R3u8PZOcVQyrxhsMAVrHi23Dnd4IIqBYgs9d1Y/ojwHrSc/idK+7JsYeEh5UkJq5B06tbMCvyuwiSWjNRP1T5tcYRqfHbIHT+X3tTRFzO9xfbk0V9yu6SD6tNyDSeYyg0YkEV4YGO2mdnlUyY4T6OmNs+YkqbZc=
X-CR-MTA-TID: 64aa7808
Received: from L4cf3154e39be.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 03431AB5-F1E0-4C3B-8DDF-252F59EA1B79.1;
	Tue, 18 Mar 2025 11:07:11 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id L4cf3154e39be.1
    (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
    Tue, 18 Mar 2025 11:07:11 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=stfEQQP+n4AsCxjqqHdlQhaOxU3qJrc4W3kbqYhd/2f3IEE2+zGxSOJNtWjO0yjEE2qggcPajSoHQikEN2SViX5k+LiAW0TWwVNAN7tz156NkXv7WJ3vTWcEz8KOX1CkDVWQbVmFAtWsxe5u39QSAIfwrmqQ7A96ci9NMbqvZjkCdXJ53gZ4J05IZ02+IZl14bn14qKuArrHzQmT6bju7MepcmDFqzuTkqZUvzlI9mTirfQQ/vvKpei4jYmy2KI1PUGlDjOo6ZcdHKG6ZrTlkIMtWnBo06a1p9ssXo9loGDdvddr3HWS249I6ks2CtC81vj60Xv4ai/seyFfGC6Y9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HqWLh4K5C2vrR7tYxc45NXwgB/lB/sWfQr/DmFwgPv4=;
 b=iejIEfGP/ujDanXhp8kO9J9XHjJZo8gnpF/zrOUaabVDD/BXKcfkSGIK3V/IuY5f1FkQuVnozieD2NF7t23LjyMBoSfGB0rz6Fi/Vzr4b4BR8sfjt19h4SKvQavLgviqvvvxDfQLPRW0viYVEF/wnnHDdLLD0JrOJaZeQq86SqMetqV0v105OT18kjnX9K9jMOelgeyg62OURpZLlNgM4nf1d6WeZgJtT62srJQNlllFcxSLC/+n/4c70Wmm5AQCdcIbJpiHMrr4df4nEFAUqRJy6qocLF0X6MblVBQKStUtSZHbD7xWHrK57IHAT+8bWCyZsEn88zP0Gy6F0JuKIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HqWLh4K5C2vrR7tYxc45NXwgB/lB/sWfQr/DmFwgPv4=;
 b=PiWaUBmW1tC5Xa7pmhpHk3NKTNsnChgNQrbZiBvcR8ZCmSquHth3bjl/7jyS1LGidTWwPK8V7Jdozq85GzUC4KdTl4cKoIwpj7c/JrRD0Er0dagsrN1ux4+VOxHJTnj8mA7+V1S8xmE38FaYybL9Y8io8n1ygZZR4TniVZqQe4I=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by AS4PR08MB8071.eurprd08.prod.outlook.com (2603:10a6:20b:58a::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.33; Tue, 18 Mar
 2025 11:07:08 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e%5]) with mapi id 15.20.8534.031; Tue, 18 Mar 2025
 11:07:08 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: Marta Rybczynska <rybczynska@gmail.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, Marta Rybczynska
	<marta.rybczynska@ygreky.com>, Richard Purdie
	<richard.purdie@linuxfoundation.org>
Subject: Re: [PATCH] cve-check: change the default feed
Thread-Topic: [PATCH] cve-check: change the default feed
Thread-Index: AQHbl9LbHm4/9We/I0CrcEja2El187N4vBUA
Date: Tue, 18 Mar 2025 11:07:08 +0000
Message-ID: <04A13835-A7EB-4FCC-9B3D-A59A7986C084@arm.com>
References: <20250318065403.8198-1-marta.rybczynska@ygreky.com>
 <CAApg2=SHr+uahMKSudWA605zHHpt2mCCGuxvT8i1-xvZGzP-xA@mail.gmail.com>
In-Reply-To: 
 <CAApg2=SHr+uahMKSudWA605zHHpt2mCCGuxvT8i1-xvZGzP-xA@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3826.400.131.1.6)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|AS4PR08MB8071:EE_|AMS0EPF0000019B:EE_|GV1PR08MB7850:EE_
X-MS-Office365-Filtering-Correlation-Id: 367871c5-0056-42ea-182e-08dd660d0c44
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|376014|366016|1800799024|38070700018;
X-Microsoft-Antispam-Message-Info-Original: 
 =?us-ascii?Q?UALX7YXfDJp5DeaU2jo0XXx1J/vC4jEMBlFjWbM11qUD0e4chgXk1J8oXYNo?=
 =?us-ascii?Q?jdEtqnfCD+k102NfwhdeViqlmYNs3fzGe9+IiVl3fTP6kldSZJEyUJqqRmg6?=
 =?us-ascii?Q?lSUmkkNd/nRhNRrMCvXPg3Sm19arGi7o/zC+HJl20pbCih/oWwFrgsThrwjZ?=
 =?us-ascii?Q?QTL2mTRREZxUJ97SZ5LqQyjdRyvVM0phh3V2xtgwxfS+B7PdPb5YhfRy9VTf?=
 =?us-ascii?Q?MiGAC2mcHbtH/glGjEG9aMslsVGE06y1T6DLDxxi5DbNBAMolB/xCILvBvB4?=
 =?us-ascii?Q?sGJe/6mutmqNBMf/WcckMRI2m6l7w1fdl8qpHJS3sF51mxHGG3KdReARvLbf?=
 =?us-ascii?Q?wfdZpvxWcwxrXC1l4vOw5Nd6OYbhOzVloQJ3mJuDeUEaICfgblzkUWnUR276?=
 =?us-ascii?Q?csDPz7xpmRJOQjRMiaA2TsWkNa0LUUqO4/kBkoGNxaK7EoQow8Ij2NiNXxhb?=
 =?us-ascii?Q?X5fqOEX+UFGHIKC5k0NHY33iUoT3LOaS2/2x84Lfe3mLKzUZ4xQUuG+3foNU?=
 =?us-ascii?Q?ddyvSLIR7tEapM4YniK5177t8lBs7PSJ85tCw/cWXvRRf+v8TTx/MxnGB25E?=
 =?us-ascii?Q?dbX+UmimpD3YKZFsiLhTQhpxLKdb0l++DY33RdwUZhjmoMwug0dXpaSUcyde?=
 =?us-ascii?Q?bXrQCK1OlH/SqjrersUrGFGNX9qgUDA7QfMs7l2zIIEgGtn2g1XqmH5IlHhW?=
 =?us-ascii?Q?46cXvWoQIN3rLbEPQy9Ky4Lws9zFXGSXvKqynr8hbKUOixQ+yUpbqrBF8IJo?=
 =?us-ascii?Q?NOaQVr+f9+YILrYIIsRzpDOr2ascMWQwgrNQdN6bRnwlvWTAcNfv0KKcPVET?=
 =?us-ascii?Q?aaiom0UomfhZ7xr4odrkhFvFQXxEKSH0JTduvKwv1snv5mY4DfT3w+L9RU04?=
 =?us-ascii?Q?V6gIOkzLhzet7SKWH7DdokTc5ppyv/IIVL4GmzK2K3V1BVUN0qpl201/ssmb?=
 =?us-ascii?Q?dG8/i83to3JM5sx4CZod0LGqfGatYXBuIiJOJWtvE6Q6phId3CUnu5BPzt2j?=
 =?us-ascii?Q?c7g7ZG2no6SDQiu26iXYgNaXL7PvNrTzvDZZ1caVSgBHrWxQiz1uJN76yfjB?=
 =?us-ascii?Q?BTtKPYxoJ/9Mvi4miGR3F/gF8z22H/LYLepjr/vrrEk7IyHCng7+kYHjprGs?=
 =?us-ascii?Q?llWEs2oPccD5NYgSXsr8BCttHx74HWj16MEagJMZdKarrli6igrfRJw1ff9b?=
 =?us-ascii?Q?nskOIgGHZwTWeA3U9YrNmzyb1CvkDfIr7lSabnbTBSvmH5nQP5gtimclnq+L?=
 =?us-ascii?Q?qrHIphl8hdQNz/g+B2rYgHXPzjIvGhMMgbh18Cseuvw3tKDFJ5JB0YjW9svo?=
 =?us-ascii?Q?q7nU7cBTHqgnkLK5qqy0EWcAHZwgb/juoFBxPCrp8ZoVITZiscusUUndqOyr?=
 =?us-ascii?Q?jNWICkKcoIJYXtjzKk2JVTm96E7UsKeyGNqo1LqhqSjHRz9asCOBSomf945p?=
 =?us-ascii?Q?77svEDTsZhY2Xf1d3FSJsx8KSqEVz4qO?=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <A1920D35CDB98048BBFFDA36FC952821@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR08MB8071
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-SkipListedInternetSender: 
 ip=[2603:10a6:102:2a3::12];domain=PA4PR08MB7411.eurprd08.prod.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AMS0EPF0000019B.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	eb05f6cc-7434-4671-5afa-08dd660d0655
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|35042699022|82310400026|36860700013|14060799003|1800799024|376014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?+slSzxBhvQOV9CqRcfrGVBsFaeZv2ld1PkzYLs/UhXEdlyJqcUTzkV4wG9OC?=
 =?us-ascii?Q?EEY1J5V/6QlPY44/pFAj31ql9VLs9pPKaLOcG0nBxTmdMqhrGvyRDrUWyZXJ?=
 =?us-ascii?Q?Imn/C46FJwrb0xWahXzcqPdRGJTA9A7OQIgka5lL+deJVaTu6DKOIojtDFOH?=
 =?us-ascii?Q?XVicURVtRpSZCbhUT3gJR6AByVsPgZ4AEGSNzAi+/eljR6S1P2UVa0zl6cQd?=
 =?us-ascii?Q?L26ieJEfc9FIOke9ObnKhbBieD6qgWrgCKxehIEXzYtzTpwA68xin3STGrDq?=
 =?us-ascii?Q?l3w6ttOo+MhnGmt9nLckv+FDdXHHWc1NszEMfuLXPfXzIoNPBGorYIba7CoM?=
 =?us-ascii?Q?IYQ5z0Nv7CewzwEUTdhDFUxGFVQWpCRDjI+HeLqCaVwg0fyBqrNpi72mAtiw?=
 =?us-ascii?Q?ulXHhsf09gi81nit0O3IlQGKOatBPvdo5yq387R0KR1FORVL4JqORWPbf7cF?=
 =?us-ascii?Q?Lepgg8X0+ll+cTpjOSfDO3sKIkuhAd40sF695/VBUb/lIvHQX2V0TzmLczFt?=
 =?us-ascii?Q?Lpb5dWcP9g7Pi74I14jjYCgk7BnmcFhOweehJsLhrSwbxVfdKijGOCjAvi9G?=
 =?us-ascii?Q?uNiyMuenBYaxja2rgqp7xMd7UGKNFs2e1GVtkGGlK6HCzfwos9BJFON8d4eE?=
 =?us-ascii?Q?N+QneZnNPl0w3YA9j6TQYJ1jDRMijSncRLhNWkAe+0Z/yIkD9xw7AcLRjjcl?=
 =?us-ascii?Q?2DB86qj4JDYfDuOdRDl7jr+ZHxtiCg6QUIMYXLm1GYjiOxcf721ouuAFCtym?=
 =?us-ascii?Q?13SE4ubtQOrAG4XIktITBMy77MbtIsD1F9LfQyqjlUkaxEe64GIFy+EBmWLJ?=
 =?us-ascii?Q?UBIjq94t0frvSBH0eRtKZcS1Mchqd3sLlNhK7dDMKX/94TNcPWfdUpkfGq0L?=
 =?us-ascii?Q?J4EDtAK+ZPDYUil0LdJveAfVPkCpdYL4eeRcRb3vvNJKQdZ23kxbheriYxFI?=
 =?us-ascii?Q?V/hYLFGIEH/BC5Mm+ylhe77Y6rYFtSpPC7tDLeqvU+W30bIKv8C/p54QuWHA?=
 =?us-ascii?Q?YAf6QKLZcw7jsTzBw83I/KgfcnF1FlCNa8wu+LPcZ2oSgfaKxOq82TpEuzbr?=
 =?us-ascii?Q?yOAYrJmlDtKU96OKMRjqXccNEBDa0bH/um2x7UoGMOGcyrZj+8sXB0HciWQ+?=
 =?us-ascii?Q?HD+USMRNrLzdifVyBPi3pBFzZGUMcEZ6l/5jhGPVQ/6e3gUp+rPr5xreki1q?=
 =?us-ascii?Q?jL7a9X2bsv3UHC235NNRv0PXXFD9jiF6wsKqx1E5bDYycdPvN1aYgfkiWWEY?=
 =?us-ascii?Q?RzRKHqSy1IIV/PW3JPVWYynz4OrCOSKRgZCNb3bqtz759oMk5toWiKNd+DFp?=
 =?us-ascii?Q?VYF82Tgxb+6PFWh89Mpy5CtIe02t4Jvixi6XplyKmxEyMubOJhBc1qcA5A2o?=
 =?us-ascii?Q?C0ukBII4dPCr+lNR1BPrXcyipEBtQPcS4m7tKQF+X92WqIn6IHUi09frjW01?=
 =?us-ascii?Q?PsMMtgXCpNM0phhT/cg0Qhe2YxHBqXkSv7hKqFQfHVRmYOr8a7Ug1ouxwKGy?=
 =?us-ascii?Q?lw10Tf+e31DfUkA=3D?=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:64aa7808-outbound-1.mta.getcheckrecipient.com;CAT:NONE;SFS:(13230040)(35042699022)(82310400026)(36860700013)(14060799003)(1800799024)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Mar 2025 11:07:18.1313
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 367871c5-0056-42ea-182e-08dd660d0c44
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AMS0EPF0000019B.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR08MB7850
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 18 Mar 2025 11:07:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213203

On 18 Mar 2025, at 06:56, Marta Rybczynska <rybczynska@gmail.com> wrote:
> This is late for the release, but I think it might be a reasonable choice=
 for months ahead of us.
> To be discussed.

Given the fetch speed improvements, I think this is acceptable for M4.

Ross=

