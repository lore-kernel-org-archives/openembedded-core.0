Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D5C24C282EC
	for <webhook@archiver.kernel.org>; Mon, 17 Mar 2025 17:47:51 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (EUR05-AM6-obe.outbound.protection.outlook.com [40.107.22.52])
 by mx.groups.io with SMTP id smtpd.web11.59651.1742233662859820755
 for <openembedded-core@lists.openembedded.org>;
 Mon, 17 Mar 2025 10:47:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=ZKgyR6s3;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=ZKgyR6s3;
 spf=pass (domain: arm.com, ip: 40.107.22.52, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=sC8s5C6vPIGQW+m+dmpfPhqI+6TlijZDBaYQj2Vv4MlgZzYk/EJWe6yOxd6dJT2/TOdMejfKSrzpSDpab7FsJj9TuU4SJIqgeb9p4lAvyjbddcPBNt192gSKlBnDyRQrM9SlFgWFZyztnqNwMIZQZTD8Hag7GvX8/HTRidcLME7GttmBE6vAUEGyqdNOdVGrKHAtPVN6WKCkrBv+djrci4dEGOjuPXTBs8TaWXoz+0lKY2FTZoVSNUv67qrbkykRMqFwz4mNywOhdDGrtGrKOn0cDMXjXgI/VQhzAV9xRmDpP+xA193vkG43F8KDXPiBso129Pp8x7snITrMHtb8yw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7WEDWbHYPZrzzNihpo6ogMhUbm/s0nk2oHrNAyIps0I=;
 b=WblQ2jLy/bC3KUbJmsvpdqFPCJ8kap7X8qBaKswdMTsGCXSSmIJRdNw7Lyh2YH9IAsMmNNp9VmyfYOWsZ0kHX2sdOnHPhtNCMSOwtckbM8cnJtHUHaq0qNQN75DOS0256nUa9LSVnMim03Q5Q6lxC81JKMvaTPLLyxzBd40zjHEBYg9KIXn3sKjPHljwAa+Brk603ogvBxzqqAUYX9r9VKsvyGBWkPm50I6whucCO7v7AqVQJvjmZ/rDSMyLVjd9q6q/YyIBJgxE0ufeT64cxsJZLDmjPFNG1VRSWsH3kKrhTEd4OmLrtzaRzxTxPbSM/Fefk9tOftGxIbqQU6zsvg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7WEDWbHYPZrzzNihpo6ogMhUbm/s0nk2oHrNAyIps0I=;
 b=ZKgyR6s3bWrWNzqUSv4PL8040aTeIi4PvQRmD2HgvUPR1IvH6S3f1AQTs4tztuZwf0RTIcaEdcyuqoMz4JoIrcjWppY7ALeTODOUQg4D4E/Jze/AWyltxwhoto+bMqVikT6FPuMqzUaVWM6BYLxyQx+C4oBCpArLbtl8c61Z0L0=
Received: from DU7P189CA0016.EURP189.PROD.OUTLOOK.COM (2603:10a6:10:552::28)
 by DB4PR08MB9358.eurprd08.prod.outlook.com (2603:10a6:10:3f2::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.33; Mon, 17 Mar
 2025 17:47:38 +0000
Received: from DB1PEPF00050A00.eurprd03.prod.outlook.com
 (2603:10a6:10:552:cafe::f0) by DU7P189CA0016.outlook.office365.com
 (2603:10a6:10:552::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8534.33 via Frontend Transport; Mon,
 17 Mar 2025 17:47:38 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB1PEPF00050A00.mail.protection.outlook.com (10.167.242.42) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8534.20
 via Frontend Transport; Mon, 17 Mar 2025 17:47:38 +0000
Received: ("Tessian outbound 382ef3f7fe27:v594"); Mon, 17 Mar 2025 17:47:38 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: b0eb57c617fd923f
X-TessianGatewayMetadata: uxUv/fCGdBOe88CQZgnvusUvxIpkGSprZOGPMbhdtF5iRUt0i+ddzXdRKcqjg2Uwonux9MGuJQgqeggH/zJdqHcIx8Fv67n58rK0BMohFTpksxxpBNumc/0Tgn9Crk/xnituJKmIElpLJ/qGMb9NNZaAindc/RdEJ7nfrmk6aDI=
X-CR-MTA-TID: 64aa7808
Received: from L6bfb14ebe650.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 97D24251-CA50-45A4-B3E9-DE5F57589C19.1;
	Mon, 17 Mar 2025 17:47:30 +0000
Received: from PA4PR04CU001.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id L6bfb14ebe650.1
    (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
    Mon, 17 Mar 2025 17:47:30 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hk4vImZ8lFIZQJVvrqBndsAkzbS1hpVpMcJlO8+kRUSP1e+l4SCmnxbfKh/BYfk8dn43GW5pMH607QDmYvZjY/iA0Z7aCTfAeoadAR0yWhtJs5ytHJnqUk59I1szrS+W9z0/w2YaNgRScsNuGBN01EGoWuS7DtRrneVbUSvcyuH+6veHvXe7nJU7QcP524iLVpH5JthSJk23mPTNLDaEtHV087dhqwxZbUtzRljzQD/NHnqvk03cCN62AnNhUnXTLjJL0VcXsI7+pl1XiVAYAa6Wtdg24UHSj1SLbqtfN2lUyvc1eu3mxaxnq5/PKO8nQB0+zuBgXTUFbTtvVsTZEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7WEDWbHYPZrzzNihpo6ogMhUbm/s0nk2oHrNAyIps0I=;
 b=mRBebgELdcvxgdWelQs9YPoWtJInR78L9/sCnMdW4oFse3sguJW/RN3pDxVe5HKvD0oX2GwW4/MATCPROmtmbtwSBiOOFqmKTvLaNzibUWtV0wZekzqJvBu4EYt3v4V3gLa1vX9HGCoz1Uzx9515HeIZZZFJSaPd3vvF7d+Filxq9lMi/jwSp4rY/3ZOAnz3OdIRJvYasKjhhZGxqozR7yr5Zmh/7GshYZibb+YXlPRtxiSfRCWwQDfkRxAr+YlUyo9jsy+gY0ypsg/YZdSP8U/T37SDW0bjmekW3aoOLk1bZfU1OeWmYjTqw10FfQwQtAUQ99xx+R7D9tKS6/N6vQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7WEDWbHYPZrzzNihpo6ogMhUbm/s0nk2oHrNAyIps0I=;
 b=ZKgyR6s3bWrWNzqUSv4PL8040aTeIi4PvQRmD2HgvUPR1IvH6S3f1AQTs4tztuZwf0RTIcaEdcyuqoMz4JoIrcjWppY7ALeTODOUQg4D4E/Jze/AWyltxwhoto+bMqVikT6FPuMqzUaVWM6BYLxyQx+C4oBCpArLbtl8c61Z0L0=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by AM9PR08MB5874.eurprd08.prod.outlook.com (2603:10a6:20b:281::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.33; Mon, 17 Mar
 2025 17:47:29 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e%5]) with mapi id 15.20.8534.031; Mon, 17 Mar 2025
 17:47:29 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "Qi.Chen@windriver.com" <Qi.Chen@windriver.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core][PATCH] systemd: check SERIAL_CONSOLES for
 serial-getty-generator PACKAGECONFIG
Thread-Topic: [OE-core][PATCH] systemd: check SERIAL_CONSOLES for
 serial-getty-generator PACKAGECONFIG
Thread-Index: AQHbk9i2AsIt5uC0jk2+eH5G5FCMjrN3oZCA
Date: Mon, 17 Mar 2025 17:47:29 +0000
Message-ID: <1F0B1D07-29C5-47BE-BA11-A49EA1022B82@arm.com>
References: <20250313052729.1809525-1-Qi.Chen@windriver.com>
In-Reply-To: <20250313052729.1809525-1-Qi.Chen@windriver.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3826.400.131.1.6)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|AM9PR08MB5874:EE_|DB1PEPF00050A00:EE_|DB4PR08MB9358:EE_
X-MS-Office365-Filtering-Correlation-Id: 28405705-4524-4873-e301-08dd657bced7
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|1800799024|376014|366016|38070700018;
X-Microsoft-Antispam-Message-Info-Original: 
 =?us-ascii?Q?dCx/TNqeqoEVlLMYWmrvwxyV87OgeQ7N4PdK4H3Pr9ycGtLU/BqldDjdD17R?=
 =?us-ascii?Q?7bYJFEemFqulKIN2DVul5tsNBSSWmJcVYYpHc6CbEuMkQM7H8/k6J8ew+Cl+?=
 =?us-ascii?Q?sZ78ORJB64f77GbAhdScl4ZaMqdA5ygPtvt9DJ8PyexYKzLe5+nO6MoEkgw+?=
 =?us-ascii?Q?tnGSbxhIsbRfPb76QYcXPnhG22iQhorezgShwFNXw9cMS0+5UC5nkXfFkfiv?=
 =?us-ascii?Q?splGl5oxwiPrymFUx9LFj3qfmigprKSCCC+3IYJDD01oexn/HkgF644UrK/p?=
 =?us-ascii?Q?Gy27dunVqRYwKm+QQehPOicI93LFtULHCEi8DW3yckIxrrOUQ9gIKb71Y6M3?=
 =?us-ascii?Q?OcApM45wOLeombzzfnlhSGp+baqzwnPu2rzEhYK11Yduasnq69hCfmYcRlqy?=
 =?us-ascii?Q?xFCDEX0rzInOHC+aOgXw7sMPTlw28KR22NNnteQQLcBTSxTNUOEbx7yQccpi?=
 =?us-ascii?Q?WxATjn07xlKfRxUrRr/CfSEZ2ZeRXMqgO/Z6s6RGyX6kH3Ef1RilTs+HiHnL?=
 =?us-ascii?Q?wq2TNHbwJYdxj74llE9KTK2FyjksUclhIAhrbJ/O2oR/FGrVjWyV2hVMPgJw?=
 =?us-ascii?Q?qjN5Og6Xj9yixHRS1LhqTpj//T0NNCOiaaf4cMK+eL2S72Apzy/Sno0U3goA?=
 =?us-ascii?Q?uyrtnw1azEgqeK/j3WjR+0C/92biT2RCFnEnuJ+uiBaXhYo/P0GvBmaqe8H2?=
 =?us-ascii?Q?vyghLM8RASUdLKwMKkq/fowX0AKoVYneYY7GFQFU0vPkyZB53m+xKfbvrpa5?=
 =?us-ascii?Q?wRBvuILJ2LS5jWa153dP8w3wO7gyKtqR8HMHEw5+FBHCZMNhhYgePr8qCMcK?=
 =?us-ascii?Q?caRzCuF94D9m8M+kzmvLPUFTKo+OddvstVBY9ARkA9F/dk4RRSVLucepToxh?=
 =?us-ascii?Q?M/9nrD8nVqB+DTjOclzYn+kndUU3rMZbVHFxYhK5677cv+DDfoRI041SSs1B?=
 =?us-ascii?Q?YSYt5XGNgzlYBuDG2CvVJHSlsZIWrA8R5+8eIVKnQl3sel7BDOdcJISEB3aV?=
 =?us-ascii?Q?ahAG2aQ1iTdpHHEfQ14cnBiiI9AMP9rPhKkw4mJ7ukoKC5Ppn8T7mile6ub0?=
 =?us-ascii?Q?V39dvUPQiddUwdf76KONweuYmOrfpoCWYqYL6XcNvqm6myrgfy7O/3B+3BFg?=
 =?us-ascii?Q?A6NYmqlImM0RQBcAIqR+RY5lziUzGcpaJUB9lRcGtvobH+usrBbErH2rIGEL?=
 =?us-ascii?Q?nY0VoLO/ad7sfL17CR6XK/RuFpXRL9yi6m6E+OiDASlQfYcRzIkGFsg+uw16?=
 =?us-ascii?Q?Bc9XRzvubE1s/Exe1UHaZ919PUuN4cBA/DDbOjarH5RsNOAt5CVoPIHkyKYz?=
 =?us-ascii?Q?UZJNcNBnHXIdzphrA0YU5Y8DGr6L9IWCs23/3KlqkzxV83cyAVqjOaFyr37j?=
 =?us-ascii?Q?kuQcVF+kzGIUdYBbDzXgolzP2qAyS5fgSji+YiqBxj3vwf+NUFCYfytsOZHD?=
 =?us-ascii?Q?v23Gw1tl1FoFHr6fVo44P+yHtJJltyzU?=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <9F322A02B193744285410B2297A0E7EE@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR08MB5874
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-SkipListedInternetSender: 
 ip=[2603:10a6:102:2a3::12];domain=PA4PR08MB7411.eurprd08.prod.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DB1PEPF00050A00.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	90f57027-955b-4963-2119-08dd657bc9ae
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|36860700013|14060799003|82310400026|35042699022;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?EQv+w1soaBqOjPO8FQ3I+QQXQGMBQxe6iQBFFgnGFRBPc1e/TZakYfitRmVL?=
 =?us-ascii?Q?uhaRwFkEYdOnqhbSqmmhkcnlOkoAYJ1QcoFjoiLP6SlFNCElX8q0L0yu73Us?=
 =?us-ascii?Q?KWl1HJAUGcazvWdpD5MEgTC+8/NjZfKgNFaVr+p1QXt3Rw2AtoJCn0Tn9VaX?=
 =?us-ascii?Q?OaR19trymtXKqkmLZM2xDnXcpEtP0QGyPwAEuzlrAhKF3DBEp4Nf4NJ1zAoY?=
 =?us-ascii?Q?FlZHoFsfIDFKQFVc3r4//g53xJ2rBYVbOaWLaUdNqxMuvsSxNpMdNpDPnHas?=
 =?us-ascii?Q?ETocZl8PhH0TvO3UhTfuI/paSKYgZvSvnO/QrWeZnhGu9wXAi5XrdYRvTE+w?=
 =?us-ascii?Q?WgCNBNJ3/vq38c0ELBkgQpB9LGpQv+Ebc7RNV9c9mT5wehKe7KJ3NzUMEXOh?=
 =?us-ascii?Q?niNRiKa4o10y4Sx8/R4QXPEMDr+a1w2bTXPbJ+a3CY0jusVWOPayj+LkRSBP?=
 =?us-ascii?Q?wl98WS9Nknid+bT1Q8xnZUpm+OzCESvIC3lK00zCivpM3ujXYXHxd/BYOG12?=
 =?us-ascii?Q?AgCRQcKrrYz6uJhc9SxzkbQtAV3T5oXmz3faoJ2K44akcSYmkCEA5Az4piCK?=
 =?us-ascii?Q?RNWSuMfsfcPnAO5Fyy322w4td8cfU3HkKVuDwEWVyf8teDaVKaV1dCTB5iGz?=
 =?us-ascii?Q?CgGA0v9qQzMAZYFNNxTIIHRY2FO5l4sbDY5H3IBq54YqbKPrpRHwDQobMkDZ?=
 =?us-ascii?Q?EZVOowDaaiOrmT1jJWEGUw5anxIOCf3CArCcR02+Zro0ndy4R9Q/RwA03XwT?=
 =?us-ascii?Q?fEi6BC8WcyaMZNumKGx3B9CpoPnsM6mNgAiya6WY+D5uCCswgesJ+LRP8S+3?=
 =?us-ascii?Q?8q7V31eQVHQZSWFYAcclQydmO6QabacEFfp1MuilCHoiAinTLCusjxwMto4b?=
 =?us-ascii?Q?Hsacw3+SMxeurXaGd+tXpvcLn9WKEBqmsjjUo7tBfb4a5KAJGmFMRtTyBHcr?=
 =?us-ascii?Q?OuIv5MY3keWb1oyZ8+MAjllX4jsdNfy//2ztM/VkKlpqkqOH0lizhqf13aQT?=
 =?us-ascii?Q?YnVP7C1pjajRrRNxBghXe56ZGra4iIHRBQTbGD2l0TCbYCAsb+xpYPGui3KY?=
 =?us-ascii?Q?LJdi+DD9FK7Liat/HBuVgyPTCT1C1DyS6Rxfa7IguJ8QFy2cXK9PRjkgAVGu?=
 =?us-ascii?Q?IHXdkiLCEJ06B+gsQZaUZ0AcIV9IXUdDUdEKPvc2gp0GZAC88eIlvKZh/Aak?=
 =?us-ascii?Q?6lJmJZ8tq4jiHTZU9jBJydaUE1F31Lo8vZQM5WXHldAnXYYTzQEYVh4GQ5/D?=
 =?us-ascii?Q?6s71eGBf3YcSZtY+EHm8vfEWm6xRy0KrtpuHjn8vDrzuARgo7WnVnL4ITOUf?=
 =?us-ascii?Q?8VawyRs1zH7hmCaLd9/JS8et/k5FS0KpWN38C6HmfNcMX7TNs0zev2u0OKoF?=
 =?us-ascii?Q?DjV7eTJeGazNUr7Ohll5TeJJZ+Tj1yVDdVy/DI4xRh/24gDJ+GidLkHhtqjI?=
 =?us-ascii?Q?slYYWJfR6guNdohVdJfBLuL3hLQ0+5KIpYsIyzWFRM7pXN2eBjDSOQ=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:64aa7808-outbound-1.mta.getcheckrecipient.com;CAT:NONE;SFS:(13230040)(1800799024)(376014)(36860700013)(14060799003)(82310400026)(35042699022);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2025 17:47:38.1959
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 28405705-4524-4873-e301-08dd657bced7
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB1PEPF00050A00.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB4PR08MB9358
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 17 Mar 2025 17:47:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213123

On 13 Mar 2025, at 05:27, Chen Qi via lists.openembedded.org <Qi.Chen=3Dwin=
driver.com@lists.openembedded.org> wrote:
> So a better default behavior is that if SERIAL_CONSOLES is empty, then
> we put serial-getty-generator in PACKAGECONFIG which let systemd to
> generate corresponding service instances.

Whilst this seems like a good idea, it would also make the systemd recipe m=
achine-specific.  Considering systemd provides libsystemd and libudev, this=
 is not a good idea.

Ross=

