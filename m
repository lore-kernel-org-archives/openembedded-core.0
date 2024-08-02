Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9EC42C3DA4A
	for <webhook@archiver.kernel.org>; Fri,  2 Aug 2024 12:25:43 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (EUR05-DB8-obe.outbound.protection.outlook.com [40.107.20.86])
 by mx.groups.io with SMTP id smtpd.web11.91342.1722601540064167713
 for <openembedded-core@lists.openembedded.org>;
 Fri, 02 Aug 2024 05:25:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=nUKgV6sw;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=nUKgV6sw;
 spf=pass (domain: arm.com, ip: 40.107.20.86, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=SiJajmWXoS2Y8RA96wSD+C2QDnBe4YRTkV1/BcmOJ67NQm6otIm7LX8TccJNHDt/jHoZvaYZhkNpuM02CnEprEv4ch4tnV9KX3y2SPTTJ7wxBR+aY70+1HMz+/AtQldw1klN4s++Ui21T3gPke+e2H3AXokmIRXftgPJs3jPjY1epwnAoT8HSECAUGnxgPSY0lk7V6ToAhD2zgn0OOvjrlIanmxWuo5DCQD0zesDjGTDNq3jMeO1OGfBWitLsM5eTlDmMuVH863wmgx9OLaPTDgrsGQHWuBCRxc+Oa6KGvAsYxCftz812ymPC+CTBiVYs1vecDrFlObUrgJ0DbPHnw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1Cbtxld/qdORgXPKUbKcY2PJEiTHDlGDeGoukzuDbOw=;
 b=VKPlJ8V1Ub9bhE8gvhMP7vEmyol0udwD6kAkTi5nsOImWH8Ig663cLC332oQw/fAhQ0XwiTrWgsrSFG1FN5zBdCxkA25L6/3qaP3F8STgcwBrX24sEyY1nRfwe1rT4dHhOin7mqMaj8Z/NPCaEyXDaRfDWRD+oBDJDvx1tt6UUA0Th7oKaE0tSFFYEy01wZaVjrIjKcIAJKvv+Zb+ScgnMcjKKVyYIJTUpwG7X6Ffbos/CXpfR09wvcnK1aS6Mxz0YDQtwaQrHkiFnL0Def11CE0ifWa/2EhIfbrEli4LIbr1FO/3/z02qF/XI9YrS2TqznPH5omto3EhjUCrm6tsA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1Cbtxld/qdORgXPKUbKcY2PJEiTHDlGDeGoukzuDbOw=;
 b=nUKgV6swhXer54HNy9b7XN/lSDVL3D8f3fsk9O3+RrP9GhFbp5kex07/0twya2SUTUC+utudH75b3AUqXQ7DB+tQalNAJ3skLvskyqAveljSZBDpqtYAqyO5zHSoZ1xKhjsUgvjfCQbe8Kh2mZkEVE8BTnTQ7lMvvHwEhl3kmYE=
Received: from AS9PR04CA0044.eurprd04.prod.outlook.com (2603:10a6:20b:46a::22)
 by AM0PR08MB5489.eurprd08.prod.outlook.com (2603:10a6:208:18e::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.23; Fri, 2 Aug
 2024 12:25:35 +0000
Received: from AMS1EPF00000048.eurprd04.prod.outlook.com
 (2603:10a6:20b:46a:cafe::83) by AS9PR04CA0044.outlook.office365.com
 (2603:10a6:20b:46a::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.22 via Frontend
 Transport; Fri, 2 Aug 2024 12:25:35 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AMS1EPF00000048.mail.protection.outlook.com (10.167.16.132) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.7828.19
 via Frontend Transport; Fri, 2 Aug 2024 12:25:35 +0000
Received: ("Tessian outbound ca8e5f27f95f:v365"); Fri, 02 Aug 2024 12:25:35 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 1cfc2d05369d045f
X-CR-MTA-TID: 64aa7808
Received: from Lce950fac5a00.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id CB47A8F1-2DEF-418E-B69B-DD28C84EC703.1;
	Fri, 02 Aug 2024 12:25:28 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id Lce950fac5a00.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Fri, 02 Aug 2024 12:25:28 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wPEszCnsx4GUcSRlIVLophQEQeB/0rs+V35rbShpnQkq3jz3gS1MIZ7hh8eeyD2TSf72d/tA9kjq6NtllixazXek6fsWLsNOr6oENNApPlQs675Xv03isv25jN6md6ZAXUcJMCeQqyWl3ww02JgeHGjQnN4CA/mPwSWCPE1pKfj77gkXBKEknKewZXIn7Zz/poUDu/lY0ioC6Di+Yolf8iEZIU9DT1dzWbSE5lFXHPigzGGpubwdolPxa/DzAnSie+pPyiHF5XfeX3Jli3SYpsWwKtS7Icy82YiHul3FFLjQFI3SK9qP2D8MTefThOeyW1x7p506LdjWry0BuA2qaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1Cbtxld/qdORgXPKUbKcY2PJEiTHDlGDeGoukzuDbOw=;
 b=fjRsCzypYxe3ScZ4I29WOoajW3oL8IyimOSlJ867bIfQatNWquQPPyYltXfXp3GWus70lwiwZaxXVkwb2OcrUmU7Xsgpo/WZHsLYI9Tijd714bPlFL5gMTSgeYUyNSgj/ts1uaSd1wehIsGpE9CUnpVTKuaMkU0CsWozVOm3JAXeo1gjtuaEgTkOyS3Ab42XIvseSQNftUJe5BzbfyGvEEPZ7HQ4eeadha+Wa7DPjpK58kJznHkRxbXa6XWFAHXrSf6g3EoFCmijDdJ+Ph2TD83GVFEai2lc0L6KN0FPpv+xNA9g8KKOAyxiMKIr6S5Sdn3dHvk7oWnXt+aeO4zPyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1Cbtxld/qdORgXPKUbKcY2PJEiTHDlGDeGoukzuDbOw=;
 b=nUKgV6swhXer54HNy9b7XN/lSDVL3D8f3fsk9O3+RrP9GhFbp5kex07/0twya2SUTUC+utudH75b3AUqXQ7DB+tQalNAJ3skLvskyqAveljSZBDpqtYAqyO5zHSoZ1xKhjsUgvjfCQbe8Kh2mZkEVE8BTnTQ7lMvvHwEhl3kmYE=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by AS8PR08MB6597.eurprd08.prod.outlook.com (2603:10a6:20b:334::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.23; Fri, 2 Aug
 2024 12:25:27 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e%6]) with mapi id 15.20.7828.016; Fri, 2 Aug 2024
 12:25:26 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "Mingyu Wang (Fujitsu)" <wangmy@fujitsu.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH v2] cryptodev: upgrade 1.13 -> 1.14
Thread-Topic: [OE-core] [PATCH v2] cryptodev: upgrade 1.13 -> 1.14
Thread-Index: AQHa49ViGVq6GCJ8B0mFe/FFujYIhrIT5mQA
Date: Fri, 2 Aug 2024 12:25:26 +0000
Message-ID: <03D7F36D-DA56-4313-84AC-BEA7E47DC330@arm.com>
References: <1722490823-21846-1-git-send-email-wangmy@fujitsu.com>
In-Reply-To: <1722490823-21846-1-git-send-email-wangmy@fujitsu.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3774.600.62)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|AS8PR08MB6597:EE_|AMS1EPF00000048:EE_|AM0PR08MB5489:EE_
X-MS-Office365-Filtering-Correlation-Id: 1ad130a2-e153-4bbc-c601-08dcb2ee35b9
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|1800799024|376014|366016|38070700018;
X-Microsoft-Antispam-Message-Info-Original: 
 =?us-ascii?Q?PzaWJ03KAEh9D/lvtO1Iv5kQybYs6wh6pYFZ2O+eGL7bIOeW9FXiNZwNJqRv?=
 =?us-ascii?Q?tbKcflls4McF9nJriapANFur9W68e6D9nVcO1NXdNAXD15ae/TTC49ORsNLk?=
 =?us-ascii?Q?M+10f0BeuBhd2NvKljbhZ+ejSaH9lENlcjvzOFUr/SoZaqRGKyOf4pxMMTQN?=
 =?us-ascii?Q?FDFX+a2pUVVMMiwvrshi8RsaS27clOHadl8H7udwOpU+Dkr+HN/1Wtrumz5U?=
 =?us-ascii?Q?hwZythOZgIZFPVyCpHnUgtbGTK9EdlEPf8DhsG7lHHm6zrHKaDL3XeNT5UP9?=
 =?us-ascii?Q?FuGFM0+ssaSbjWYN+DaLkctwi7MrAf7icoRuJsyU031C+ZMZAJeaRAcIso7E?=
 =?us-ascii?Q?2ynS3gS1fV/U4HHwn5ld+Tv26pPsqdQlNXJPwwCKTBkbSKD+XK+je+BaWYmi?=
 =?us-ascii?Q?5PSZ45yFta7OMr8bx/qQfuUQx0XGo5sXhQamaOrqHPuhfH3SPolenBt9j+5F?=
 =?us-ascii?Q?EWl7Yd+nLbPaUK96jA6ee/jdzs/GTpmNVV7JYvgHyNZdaCB4bQUsGBo5YGxz?=
 =?us-ascii?Q?dXlITvVoXqz0iUGOiLI76HYebzjb8W8F70J44y6H7OWnrCuJF5cTlH5BwMj+?=
 =?us-ascii?Q?BZpMqRlMkuSz96Dp2BZQyV1ofXNVw5A/Zk2iicIi7zS+eeTXQqv1bfYBdJ8G?=
 =?us-ascii?Q?PTMlXyDKVFEhL9WiqK4tUFpM5yDkHA4jZnAM7VsKdvncweQl733qgCBpkS5z?=
 =?us-ascii?Q?87BJ0EQYQK8Xe6P5xgFMo9koSZKd8xGhB5bv1fj7us4KjWxcWHxbBSJOT204?=
 =?us-ascii?Q?z59+2ykWgVwAceSucTqncta2J9y05T9mk19Psv0Smk2iTAy1+PYB7cXSKKP0?=
 =?us-ascii?Q?VE8xXzHkl4PjmmNwa2cd/XN+cX3Q+yps5mg9zMCZCuRe2dn53DKSlOGXCQgH?=
 =?us-ascii?Q?GCcuQnnHpyyGDCnfe1MSmhAfIjwbvRgjslc2bwSKWf1dSpDIMkglIqSB4zqO?=
 =?us-ascii?Q?29FNP0n4Ux9lIJWm3N3sWEpjcx0kYXr1Wa9BLMxE4outdzYzwRNowFz9kKRM?=
 =?us-ascii?Q?Oe3JE+5VzzAud7c2vX+8YZeErkp0YrzYHIyx2I5YmvODaFzs0pYLPsep1mu3?=
 =?us-ascii?Q?KK8ZcqGMNoN0qq3/SrEZPgGw3R9TxH+TDVwr2SLQMd38jfWfoy2ETTFY3S7B?=
 =?us-ascii?Q?cPBQ2BxX9FOxVzBJxBphT3/OWMGlg51EW3dr4jV1DYV2hMY69GLlW+S5Y4TZ?=
 =?us-ascii?Q?8d6/2o9MMKpuvWGuGCpqiVb4ctPOH7Vcu9cvnDhgKYEOPWBF2DN9fyhgHqju?=
 =?us-ascii?Q?JNvssnxjekMQHaZwT/kSt1tV35DPUYlKOFUTKc4dY+HiOmc5bM4n7sg2BKl5?=
 =?us-ascii?Q?VEE9aT4ZXq6+VRkt99StGOqhVlT2FmWYMOTKab/lhUlGN7lVJkkW1AGawdR3?=
 =?us-ascii?Q?q2egX2o=3D?=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <EADFC901C202BD4B9B0A881EA3180C1C@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6597
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-SkipListedInternetSender: 
 ip=[2603:10a6:102:2a3::12];domain=PA4PR08MB7411.eurprd08.prod.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AMS1EPF00000048.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	d071c441-b827-4116-5435-08dcb2ee30bd
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|35042699022|36860700013|82310400026|376014|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?xc2drDaG3hC/lKAPwwVdDot2MRfLOmdm6A9iQIgiafRGjgqQuBv3ACnHucnx?=
 =?us-ascii?Q?W6rzGFedOW3zR2steOhQzQFwJm6QyrLeyrEH25+MhFZfvyZKJM/fJ4fnQdLQ?=
 =?us-ascii?Q?DxCvHHvMO0MjpP/lkNr0DZ6+xtiXPaK6sxuFA1bJcKhzhQgodnrNS3oSaWvt?=
 =?us-ascii?Q?ZXQYGDOe511z2BF3LGj/l4AhEJwC3tQpGiN+MsUH8t0eZCr0tluHV1wtIseP?=
 =?us-ascii?Q?fBRXcE3BI9CiI1X+1nuXvtmG/P+t7bfKzc2tSWp+ApTL16sRqtNDQllUiqh2?=
 =?us-ascii?Q?RcWcaJ6FYgAOkx+cr7JFXkOw8Itl3MJURxmn9eW+yQjKVC3JjF3mZXjOl0LL?=
 =?us-ascii?Q?T18OhQ0ppb9lObC5Q1gp6v3BIPyCODgeqUnawTBMKE09c3gXRCug3OoaXY9s?=
 =?us-ascii?Q?kqyNejhWGzI9c8ojGKRaubg1rDJnthqUpEUTwfiIEkYCDzT7XJqnJgJJIgTs?=
 =?us-ascii?Q?SU8PUne0P2tqEyFXuedUks6gywdAyshY1qOhCrfnisSJI9OKYIayaRUTA+Vk?=
 =?us-ascii?Q?Oy8TJjmsjFYOPz3YYxs1HRbmcdyaBhTtoRvzDrqNJ25kdvX7rMACs/8ZhF5y?=
 =?us-ascii?Q?KNRVhKSVHPSPwtFsm94RX6tdRVUy+lhCzElDpZfgxkiHMU8jfDdRs4jv84xx?=
 =?us-ascii?Q?X/puelIfNMjLhDPxeLXfzovemnY7CX2ZNP078lwRI6gX7mypf9eiNz65o1xM?=
 =?us-ascii?Q?2+wAbofMXUCzE2nbrJY1h1JqajT/hZb9G03QGVt2E4xNiD/Q7HlnerD2ykZd?=
 =?us-ascii?Q?XYFPwCCYs3aHdueZE78aC8qTg9IETyM0mab46z7ER5CRXNvzbmWN3KYbHPNT?=
 =?us-ascii?Q?s0HXfLWjyM9lBbh+mT0Wjrt7+7oJ5mSrJwQwh1qouP9pnjn97rsfszjBpxnf?=
 =?us-ascii?Q?uGbcSE8/dNsIHvE/jyF5sHSVmu1QSA4FccYWU2KfzLUGIR7ZSC7kM0JTuOuC?=
 =?us-ascii?Q?0rKkR6R4tRNGiV2J+Nzf1I6Hn6Ulqlhq7QjimqPCKmtw/b/uSAD8TiVrzXF4?=
 =?us-ascii?Q?VbaKC+PV/UzZ9oPaMxaVVJbTtc+1fRM1/EKyq324Oa1f90OIItSk1ervlR9p?=
 =?us-ascii?Q?gi9waJmehdI7bBCOvjgKgiDZeSX0idZyfikEbpAtLoSiPQRmWNR11SVrRXoy?=
 =?us-ascii?Q?AC1JS0Mnl/LWoKpBkvC3auyOn3wvpCiI2L0SXvJsCotGDigw1rGEwf5q545a?=
 =?us-ascii?Q?rrJEkQ/fHPBrXgPJBRLG6NKrrIf5zxK5z3oeFzEWw24SlWsaR9Rue3MPojmH?=
 =?us-ascii?Q?DSkHTQcJratRQMapBrKTTQwcly46VJhTAOn+NI2QETnACMIJix2KjsfSokAe?=
 =?us-ascii?Q?EV8jbLDIR7cEa7r/nEBYx2PBNgjZ9TMvAQAlGzkYpMNSyeYFK2ysEKCI/awg?=
 =?us-ascii?Q?hkCbFnkwiTJHKJ9l8C/toR4vInUx?=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230040)(35042699022)(36860700013)(82310400026)(376014)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Aug 2024 12:25:35.2470
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1ad130a2-e153-4bbc-c601-08dcb2ee35b9
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AMS1EPF00000048.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB5489
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 02 Aug 2024 12:25:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202903

On 1 Aug 2024, at 06:40, wangmy via lists.openembedded.org <wangmy=3Dfujits=
u.com@lists.openembedded.org> wrote:
>=20
> 0001-Disable-installing-header-file-provided-by-another-p.patch
> 0001-tests-Makefile-do-not-use-Werror.patch
> removed since they're included in 1.14

These being submitted upstream means we can also change the cryptodev-linux=
 recipe and replace this:

# Just install cryptodev.h which is the only header file needed to be expor=
ted
do_install() {
    install -D ${S}/crypto/cryptodev.h ${D}${includedir}/crypto/cryptodev.h
}

With simply:

do_install() {
  oe_runmake headers_install DESTDIR=3D${D}
}

(see https://github.com/cryptodev-linux/cryptodev-linux/commit/e3962fea4e18=
16df420c36ad72845f90dfcfb611)

Ross=

