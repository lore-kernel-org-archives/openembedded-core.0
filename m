Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8417BD41D7A
	for <webhook@archiver.kernel.org>; Thu, 11 Dec 2025 17:57:54 +0000 (UTC)
Received: from PA4PR04CU001.outbound.protection.outlook.com (PA4PR04CU001.outbound.protection.outlook.com [40.107.162.4])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.16093.1765475867501719003
 for <openembedded-core@lists.openembedded.org>;
 Thu, 11 Dec 2025 09:57:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=o3G0JVXT;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=o3G0JVXT;
 spf=pass (domain: arm.com, ip: 40.107.162.4, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=e5WfIZ327kGdUedqcAqP1sX3go+Mp53weV7Urgz50fzCpBxsmSwzQfPoofBBCcUv9dYTKWYHhPwk+yhq6X8SzciKrAF4s26eKhh2fM4HkGCgqFBLUFzaaoSbzmEv4S6xLmN7cylBSv7lfbJWprEyGSHXqf+WP7VR6g/EATfVdC6USjcqak5i22MSFiv0bmLi4BH+TyyNfBa2il/bd2mmA52F07BFwx2g/r8UczIIgth8GLGzwU1KvYQzE6jJsjrH+hDJsrV9OvDGbrzZUlUkxK0cCL9/ele8UKsX+Cb5epbCzEFrNsaOo/u4f4UKLwbtALoXSOFG+SGNZqwBh62t5Q==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=M6zAysRl3C/7+U8iH22wZ1qKyFAJQR1UlocdBdAW1UE=;
 b=jIi5A0opMirZoZUZJ8H4txAxbTBjWZgLLyRLEafY6CrSacpp0espV6kLlDex04vLheWtv6kKfQxrv9JMHHgSR3kGIOwtZZWbaG+C31g7VKhoe6GRzst69ltUnzpCWjY0O8d5OTf5zv9yQzgH+Op8BGgYEfuzYJMN0Q+mORLiYoWGnPK7PEJPKv631MiICeep1of1fl4dCH5E6Z0DuupUUoM1Hd2j8IX+rwaLjexjzW9KiFguJheNmcysDH8dItOz7wLWg9yADzBQtMMAmcLcF6zypAwnMFstycPhVpVCTBS3jLQlW0ez+0bpPvIfL6kSGOegsReEC+YFTwFgIR3Q/Q==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=bootlin.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=M6zAysRl3C/7+U8iH22wZ1qKyFAJQR1UlocdBdAW1UE=;
 b=o3G0JVXTPtnb5Q1dXwvzMTHZMgzDKOACEBzkEXPUnxjCh7OIqaoyZuLF+8Hr/nLUmvyLd/DPSS1gRYK2fvSkjGdElIazx22F6b0Dho4E1QWm8OtAxk9MH6VaGqDeCgwM5mF4IqM6m8YXZqgSMkleUiGcAv70rnwiT7LvCLBOE2I=
Received: from AS4P189CA0066.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:659::14)
 by GV1PR08MB8401.eurprd08.prod.outlook.com (2603:10a6:150:a6::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.9; Thu, 11 Dec
 2025 17:57:38 +0000
Received: from AMS1EPF00000041.eurprd04.prod.outlook.com
 (2603:10a6:20b:659:cafe::e9) by AS4P189CA0066.outlook.office365.com
 (2603:10a6:20b:659::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9388.16 via Frontend Transport; Thu,
 11 Dec 2025 17:57:37 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AMS1EPF00000041.mail.protection.outlook.com (10.167.16.38) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9412.4
 via Frontend Transport; Thu, 11 Dec 2025 17:57:38 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jCpBI/82x1uHnPkMW1arHiQSqf6f9gLczlQQjltYHZ0C4A1AiwMFypwpLfrjbLKmJUtfgQO+15EcAj9VRRi/L6GCdZBYGW44WTfsOZH69uuPf3BBKr+qR+RZiB3oNHfkFwXK5wig+YgX/O/npBCeJe6IpQqvUDv+p8Az7D5ifF5kS2Im7UdVrCBuy8YJXkos6uMpkL1mu9vWkru4t5QR5QVDk97YMCb+xnIAp0j6FgMZsCkZ8Vaada7wCZ2hptNx6GvnIL4kdNn5Ox8BNLt+Xau7NnUz94LdtP7i/cd34bWoVOsGfGiA5zXz9/NweLLwh9Gda77+amiT8YIBtcFGNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=M6zAysRl3C/7+U8iH22wZ1qKyFAJQR1UlocdBdAW1UE=;
 b=L2iuPMXPiUpXhnWnjPUzI1JguNz2+33aEA2e3ydqlVuwvlPDW/YXPB7lyeBSnRXTdm9IMVGfFd0oyVqyxP5TrY8tqTnq0+f5w6Uqp6Ub9Y/7UZsnVf+d3MkDHHC8yy9/HHHwfVQPisK6wCXnfXz3OuQkaCYNbtwCmND2gP95LzL4zXd/f8Q1ZvYUl8gjLcuLGrFNFsJ+4DfqDQf09GWN7qEagLg7jLekIPyGV1uq5AtELFI0F8vD77hM6P79tnzczTnnriQVWkZ64LJ+LPQCMmyrifBimhL4AXC8G6AxFQwJ0p5/6zDaXD4n+UmSTk5Qu9wns0bovCdQ33CesehkgA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=M6zAysRl3C/7+U8iH22wZ1qKyFAJQR1UlocdBdAW1UE=;
 b=o3G0JVXTPtnb5Q1dXwvzMTHZMgzDKOACEBzkEXPUnxjCh7OIqaoyZuLF+8Hr/nLUmvyLd/DPSS1gRYK2fvSkjGdElIazx22F6b0Dho4E1QWm8OtAxk9MH6VaGqDeCgwM5mF4IqM6m8YXZqgSMkleUiGcAv70rnwiT7LvCLBOE2I=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by DB9PR08MB7400.eurprd08.prod.outlook.com (2603:10a6:10:370::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.8; Thu, 11 Dec
 2025 17:56:36 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::7f73:806a:3493:7d50]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::7f73:806a:3493:7d50%4]) with mapi id 15.20.9412.005; Thu, 11 Dec 2025
 17:56:35 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH 1/8] iputils: just set bindir, not prefix
Thread-Topic: [OE-core] [PATCH 1/8] iputils: just set bindir, not prefix
Thread-Index: AQHcagN7JmcCJVoLbkO5sOzRPSWRKLUcgtCAgAA4GIA=
Date: Thu, 11 Dec 2025 17:56:35 +0000
Message-ID: <0220727C-2395-4213-BFF6-F8A830A0AF6A@arm.com>
References: <20251210183308.4022909-1-ross.burton@arm.com>
 <DEVGNXKKHGE4.33IGD9YYUULD5@bootlin.com>
In-Reply-To: <DEVGNXKKHGE4.33IGD9YYUULD5@bootlin.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3826.700.81.1.3)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|DB9PR08MB7400:EE_|AMS1EPF00000041:EE_|GV1PR08MB8401:EE_
X-MS-Office365-Filtering-Correlation-Id: 8c38b3c4-7c40-4d8c-caa5-08de38dec588
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|366016|376014|1800799024|38070700021;
X-Microsoft-Antispam-Message-Info-Original: 
 =?us-ascii?Q?jVAL1FAVxyoJYZJNSe6CZjMlvNhmrXv3PNgeDQUaFt3dVOXUzdcsejpFIhj/?=
 =?us-ascii?Q?EE/BisBU8SSr2PGBxFMwKdLHmeGjnzrOtHchespQ9pxzziK+HV9ps3H15iTu?=
 =?us-ascii?Q?vRL1f73Hwhv7pq5Ds7R1rf+CBvxCkRxEDvTmaPSVwgY8iYEg6ja1dQFVdKqM?=
 =?us-ascii?Q?IE3Z/6to7BpFwSCFm0PbvimDAWOpm9i6g89wBYkyppXoXurBYorQt54Cv/4e?=
 =?us-ascii?Q?L/oU8TS0A57pQoE+dZ1fWa+/3DTZj1AlpAyI6Ea+i62h/1y5fVKpaG51Lvy8?=
 =?us-ascii?Q?WKQarq0nYfdvW8SdwRT0GKIfEkEOBfPG/cZlg51fwe8Vo66R9D67P8VSX+BQ?=
 =?us-ascii?Q?kC/jQolT0n/NuQZLFrUeUdeI4q/D6du0w1QjjFr+R8S4/eiW/y/Y60ZJx0YO?=
 =?us-ascii?Q?1RpHccQCC9ZTl67yWm58V2/Idx0V83hnTD65U1A8mXG76kN4xO1Y+sf++jdm?=
 =?us-ascii?Q?MjHevR3SpaMOXq7YQiJH5kpqfEL8USGF148G7+sUrX5nD2wJC5eRSutl2vxN?=
 =?us-ascii?Q?8MFf48X9wtBFv9Bh9c4gFCtyCaA/jxzOIe/Bfq8IwjmjNYvQEzxEx75yPtOe?=
 =?us-ascii?Q?H5B20ntxKCt4klyhd5vRLli2Kl/gctiQl2GI6h0c587eMOgVKtB3hBCl6LxK?=
 =?us-ascii?Q?FrLJ80CqZIdH2/phMEId4o30nRpy0FuVasYey8ICIZolC0hS2ANfegnw7j2U?=
 =?us-ascii?Q?YmTgC9mNHRk5FbCob9O1KelRXUjwlIV2h/eOENEwqZlbXbUG1vjy+SEKdLeq?=
 =?us-ascii?Q?NNDi1YbAcepKEG8TejSXnYYmpyAfJmIaEH50ElHbdHSRub8Gt6egiY97eCOM?=
 =?us-ascii?Q?SWnD3UrbM5IhU6TVOXJvs1uR9qRq2TimacVVuPd6t5D58G5TGjAftgKFNhU/?=
 =?us-ascii?Q?1SbtKHsg4CZlpF52CXbP7akx7w6VFW+cNuM73wjB/u3MWsqkdmqubRU/p068?=
 =?us-ascii?Q?Fu8K3mOegLtiHWAiNOGt7U5EHCP6ChTEuBGv2XCE6zpHv4DDMaD34dqJubJZ?=
 =?us-ascii?Q?pob3Gz7VFAh4qaSSvHnKWGkfBiw1UUdMxUwE5cFcSgEFtC+wpaK9NyFIFi8s?=
 =?us-ascii?Q?cwjeOiWE/3sM10UE2JcRDnOko6brErJD0D7Kxwn2X0s/mM9Zt0gSxVAaSzxn?=
 =?us-ascii?Q?9zKCg0BjoRD4bUB61Cx1X5ARdL8feNhkxzgH6UWLnacnZtuz8kznL1X+nFdY?=
 =?us-ascii?Q?t7/w/5cUUhxJ4JZ0vyh2o15KMxaQz+9HQUwGyeHjyndgDyBMHscmm1q3hsxX?=
 =?us-ascii?Q?DTocQdc26Fz6QXKoAQ03LO3NHwfGOsgyp7Zuup0g4nK5p09DenajwF5Jd5Mb?=
 =?us-ascii?Q?VQH/j3TnWixAnb7kj1fzT6Olfmu0mat4CxwlYAeKuVYNyF+aNJJz+/peHcY6?=
 =?us-ascii?Q?U+4mpiRkDiB3JEmcKb2Aq8QFFMFNA6l/jYS8/a7+9P30yVIM+f9XasT3QxHl?=
 =?us-ascii?Q?5UqAL7wr7wPE0Hc54U/ubiz/7QtW0hh7wJvn5JVYl15hZTwFacIKnuoLk01U?=
 =?us-ascii?Q?gFnamqS5P/D73PknPS32awg+eU6SOhXZ+aV+?=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700021);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <6965FC7B3522A94AB447D2FAFFDC8D43@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB7400
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AMS1EPF00000041.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	bc18fbfd-c058-475f-a2cd-08de38dea075
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|36860700013|35042699022|14060799003|1800799024|82310400026|7053199007;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?8KP1TQ+xRV+BBTxzzh7Bg+Q0BcS73msdcfM/Whk3avskokv3skrufn8yRxLx?=
 =?us-ascii?Q?oo+lEXkV5psP/gsOvI4nuDsltJn8zIfrPyvt7KjFE7zqJLlh8rpdP375s7NU?=
 =?us-ascii?Q?fkbh3L2hLC3bIBH+AvgpBL+iwXboZgy+lGnzZXO/Huu1GskhU/+QUjOhmlXO?=
 =?us-ascii?Q?+YYndRtTMLPCgWTu4RWyrk18Ka3cJCLoujitLDhhwE89PuaWQcCGxXasRBcA?=
 =?us-ascii?Q?ez4VkK3et8wxeSMi2HtRABIgQ9nZsEj4Bez22QT2fMkJMUxTaCC6h9BsFoGt?=
 =?us-ascii?Q?aWiHZqtpBeZ3qN3zoCMwdX0irfgFU0/K8yumEu8rU/OEE0OE7GCS1G0rRisX?=
 =?us-ascii?Q?yaMzSkbIfzmE3TIOBhItUm595bKU/8Oru6dql21FC1LWIQcHHLjiWsnJRlzK?=
 =?us-ascii?Q?IV0HBzsxg9662kcMTRoSuPJlmvzoFFVZV9uEZ6UFnHnBHsrNr2HVvK3S5xH9?=
 =?us-ascii?Q?lRY9oYjmh4JFjDiMbveyaWlF1hTTc8qLB+e1Agz5v/e4jGlcX4vLxJkybDQX?=
 =?us-ascii?Q?ZoGFJ9iimlJ9tiwQm9Ac7lBBX4R1xkfN9t4sq6WS4tQxLhSKVizSN17srtel?=
 =?us-ascii?Q?kLLixU5nSfKPWmzRXV6yP19TW5kRWzhfCTD1g6oclPy9l4TZaV2YrK2pWGJh?=
 =?us-ascii?Q?XHM6XI7Eqznx7XlBOLiO+9Igx47jjtk40zGDtklo/5dObKD2/odm1nvDx3Aa?=
 =?us-ascii?Q?YRcaZTX8MeEnTREEziH2pn7YXggwPs0r4oO8Q44DOuarRqRmNePg4pLGMNcg?=
 =?us-ascii?Q?NMKrLs+4C1uOhiuG7ZPgVzOIdPB78DVSs6LNPNnQr2f2piqYG/igAeVJ7GPP?=
 =?us-ascii?Q?2P6mLOXp/LkxZmrVvhb0B6eK6dAO8xgazgS9pj36M96rB/9ps/CAnvi7d1Hk?=
 =?us-ascii?Q?U8q9y8rDaQHSb11YFHYzn/FVWV3EoY84u9uI/nMPBgnfzbIs+FsRkBgsuxKy?=
 =?us-ascii?Q?Sw30ORc+6fwY24ylsZAZgimOcRDBTFl9v5vQbKRIDHL6ck1nYHtfHuUkgPxW?=
 =?us-ascii?Q?ntnRW97qIEH5PXnG3HXZ87kx3ZGY6JYpQcixkUectvZFz0VIYxN3GmYpx+Mp?=
 =?us-ascii?Q?OmlBzctZkxhROv+6DMto7Eday4YW9tQxatcV4quHQhRQionRrTCLyFnhxZi3?=
 =?us-ascii?Q?U71ao7dLfrqmOZnHv4Qh1L+oWKTMb372H3N+zZEpAumdnJFWycIWi4YOr9zx?=
 =?us-ascii?Q?B+N6h+v991F2veAYTg9LaJtOX/VJ4CISYiuH+2BUN6T+LScRnI0VOS6lO4/I?=
 =?us-ascii?Q?5u6VOpD3HG2fhVcFpkg/RR2sVYG1CpAOJCYzQej55Ck54rGuxltiBlqfvSaI?=
 =?us-ascii?Q?WmtYahegZTr8WeygTcdvhmLfpjIwVVkSRkMOphhVLsUtJuSyCbHelC7MH2mS?=
 =?us-ascii?Q?nbMZyIfm4uidLvrTvC1qo/JORWeLnjs9qAQkhVBLGtV5lRFDri8vE9jBPVt8?=
 =?us-ascii?Q?8RcVmCmdvggsjZVIZtxTa+x4Z8oXAd7QNUIjKzzNRwQnwc8888JOQEHG/awW?=
 =?us-ascii?Q?RX7f+5h7GVKBOdwqy8nswghK7xTcTqx9rF82i7X4qmvDUrj/UkULqQDNzZKH?=
 =?us-ascii?Q?EDnq3nqkxMAR394A7iQ=3D?=
X-Forefront-Antispam-Report: 
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700013)(35042699022)(14060799003)(1800799024)(82310400026)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Dec 2025 17:57:38.0751
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8c38b3c4-7c40-4d8c-caa5-08de38dec588
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AMS1EPF00000041.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR08MB8401
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 11 Dec 2025 17:57:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227560

On 11 Dec 2025, at 14:35, Mathieu Dubois-Briand <mathieu.dubois-briand@boot=
lin.com> wrote:
> We got a configure error on iputils:
>=20
> oeqa.utils.subprocesstweak.OETestCalledProcessError: Command '. /srv/poky=
build/yocto-worker/pkgman-non-rpm/build/build/tmp/work/qemux86_64-poky-linu=
x/core-image-minimal/1.0/testimage-sdk/environment-setup-x86-64-v3-poky-lin=
ux > /dev/null; meson setup --warnlevel 1 /srv/pokybuild/yocto-worker/pkgma=
n-non-rpm/build/build/tmp/work/qemux86_64-poky-linux/core-image-minimal/1.0=
/testimage-sdk/iputilsfzhd8meu/build /srv/pokybuild/yocto-worker/pkgman-non=
-rpm/build/build/tmp/work/qemux86_64-poky-linux/core-image-minimal/1.0/test=
image-sdk/iputilsfzhd8meu/iputils-20250605 ;' returned non-zero exit status=
 1.
> ...
> tmp/work/qemux86_64-poky-linux/core-image-minimal/1.0/testimage-sdk/iputi=
lsfzhd8meu/iputils-20250605/meson.build:103:14: ERROR: C shared or static l=
ibrary 'cap' not found

That will teach me to test in a core-image-base instead of -minimal.

v2 sent.

Ross=

