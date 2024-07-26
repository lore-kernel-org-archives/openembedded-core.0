Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1BA3C3DA7F
	for <webhook@archiver.kernel.org>; Fri, 26 Jul 2024 09:51:07 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (EUR05-VI1-obe.outbound.protection.outlook.com [40.107.21.40])
 by mx.groups.io with SMTP id smtpd.web11.58047.1721987459660737499
 for <openembedded-core@lists.openembedded.org>;
 Fri, 26 Jul 2024 02:51:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=dlXHRVbD;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=dlXHRVbD;
 spf=pass (domain: arm.com, ip: 40.107.21.40, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=RbVR56DWvH16t9/XB3VSFH1SsnaduJ8C4ZWnWQ6mYqQivIzwzSbFzhrXBsBtpeLVsuq1XSIriV/J/uUsXHaVrmoXEP/Yywf/XKqvhMg7XKEdsTEB4l8paVtD9ffLt2KjKgqbqNGODSxWxwvVrnCAit2DSmE+BF86dG2v04b6/H4VuXDEdJ4Mu3LbnORNnl3AQ0MCSPYXqwAQPyI3sEO6exl4x9yJwKZ/gZIXK9nqzy0BrT7UA383y6LTQA21PYfI+nnIr8YFF3fB+q+0pyqyBTRatJ2ynrxuF3Fc+Frg/CT3eCiVosGWV+9Trp/MZ/H0TyuBxiD1euypGlkTG9HF4w==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=POWlOpV985Y88oNS4tVj8vUrIkiM/vBpRbwoqCkEq2k=;
 b=VHxhZkSvY/5CLh9YXW4WoyaClucHZ/DolodBWOCh7taqmRY+oB8WzGiL3J3xApCocQtrYKdleUAOXCb6tu/2HYFX80Ruvo3t9lXdMC+Wum0tLOIYSylzsUw+ZnZEHm4EcyRB+t9hl5rRLUbVTKS9Egw17gPkxezMXDVo2QUt0mu5t2hjq1KPew6ywCrTf9DrIWK2t8Ixs4mxma0l0SbKiODL8akYSUc21bRipTtulgn4vSKR1QJEh2gl3GNtAnuy3J/WmzaQl3+Hfh+72tn/tGfCdr6hzPZ2JLJYvyJeX0CGE7X8ZMZtzQ7MdqFGQkP5esEdKKMv1fGeix+ZCjb9mw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=POWlOpV985Y88oNS4tVj8vUrIkiM/vBpRbwoqCkEq2k=;
 b=dlXHRVbDbpjReeTOk03Y4SNWhGm+rgxx+fnKHFYjpiPACCkpvSwRFbAn+uFDDzxJ9V14RVTaHS3yxvEdZxLNkbv9mBGjNuhJ/zVK5Yls5G9bZX2AQ1MALFnhF0Syujoaf34Ueu63i6HWsnxnEXUbF4EqdsoyJFtfvwf/pdA27ZA=
Received: from AM0PR01CA0144.eurprd01.prod.exchangelabs.com
 (2603:10a6:208:168::49) by DBBPR08MB6076.eurprd08.prod.outlook.com
 (2603:10a6:10:1f5::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.29; Fri, 26 Jul
 2024 09:50:54 +0000
Received: from AMS0EPF00000191.eurprd05.prod.outlook.com
 (2603:10a6:208:168:cafe::69) by AM0PR01CA0144.outlook.office365.com
 (2603:10a6:208:168::49) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.28 via Frontend
 Transport; Fri, 26 Jul 2024 09:50:54 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AMS0EPF00000191.mail.protection.outlook.com (10.167.16.216) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.7784.11
 via Frontend Transport; Fri, 26 Jul 2024 09:50:54 +0000
Received: ("Tessian outbound ab09e808a502:v365"); Fri, 26 Jul 2024 09:50:54 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: d8b80cec66661165
X-CR-MTA-TID: 64aa7808
Received: from Lb48c8b4c7672.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 249765D3-CC5F-4546-8926-7AF8AC2983EE.1;
	Fri, 26 Jul 2024 09:50:46 +0000
Received: from EUR03-VI1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id Lb48c8b4c7672.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Fri, 26 Jul 2024 09:50:46 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zE0EWwFMOANspeiZJ5G8/P+Tuwrsee9sQvvPpeajZ+faObsGAP0RKdJCdR7lpTPO11UCyYcwMElLEJdxGFFqdcyF42itHRlquw0ndutuGUc6fCGv0LBWotCAg2gw5KTXamlGFYUZRWo+MTmK7Kul5D2Fc7G0VI7j0kRgwIp6WGxkf/oxEmrsEgBuhn8krIsLKUUdQ+2q4HBx+Ce97Uavm3rL/ip3iCPb58DDe96VnxpT1i5JFi4qeUOE3iAKzzc9ezA5CS4p4iCur1Yq2witXoja94HOJUZcTOjUao5ay5vxOCp2GAFm0puGXE/I6m+LogK93dEdr1pn+GN0QF5mEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=POWlOpV985Y88oNS4tVj8vUrIkiM/vBpRbwoqCkEq2k=;
 b=MnQG1wFpynWVLJH1W/hSzkWDAAkw8JZ7PCNQaetL9PUC9YLJIya+1rgXDcHw3/kF6ICEgsFy87QlAeUAJaYOn0IYCMoFywEqGE1ZHdMD97RP+57fV4F7/H3PjVWLRAr/NzhnCqHSnpJ9GCXKFlZPCjM9+yjPkrC+S0trxQ5NB7RxfX/GNrFkHZ9STMkRbOscSoNtzJ0xTCrm1afWkG75NQ1fVh+hl/+aPzBZLa56QzdnwhQdCBVZ1CV2Jymb9ci91NQ00hXEPnxmR424hE2Xe8uqDOrRGqDO2a+CoEZLERBzChrTnAtr/cFaFeWqoasucq+H79G56UYbtx2aytgn8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=POWlOpV985Y88oNS4tVj8vUrIkiM/vBpRbwoqCkEq2k=;
 b=dlXHRVbDbpjReeTOk03Y4SNWhGm+rgxx+fnKHFYjpiPACCkpvSwRFbAn+uFDDzxJ9V14RVTaHS3yxvEdZxLNkbv9mBGjNuhJ/zVK5Yls5G9bZX2AQ1MALFnhF0Syujoaf34Ueu63i6HWsnxnEXUbF4EqdsoyJFtfvwf/pdA27ZA=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by DU0PR08MB7715.eurprd08.prod.outlook.com (2603:10a6:10:3bd::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.16; Fri, 26 Jul
 2024 09:50:43 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e%5]) with mapi id 15.20.7784.017; Fri, 26 Jul 2024
 09:50:43 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: Joao Marcos Costa <joaomarcos.costa@bootlin.com>
CC: ",openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH 23/37] python3-beartype: use
 python_setuptools_build_meta build class
Thread-Topic: [OE-core] [PATCH 23/37] python3-beartype: use
 python_setuptools_build_meta build class
Thread-Index: AQHa3RB03BabK01z2EyWtIOFm5OwWLIIpmSAgAAh/oA=
Date: Fri, 26 Jul 2024 09:50:43 +0000
Message-ID: <6EC1806B-0043-467C-87F4-588F2197231C@arm.com>
References: <20240723145137.74198-1-ross.burton@arm.com>
 <20240723145137.74198-23-ross.burton@arm.com>
 <561ea044-054b-4e27-82bc-452ee2f17df3@bootlin.com>
In-Reply-To: <561ea044-054b-4e27-82bc-452ee2f17df3@bootlin.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3774.600.62)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|DU0PR08MB7715:EE_|AMS0EPF00000191:EE_|DBBPR08MB6076:EE_
X-MS-Office365-Filtering-Correlation-Id: f96ea027-9283-4fc8-38d8-08dcad5870ee
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|1800799024|366016|376014|38070700018;
X-Microsoft-Antispam-Message-Info-Original: 
 =?us-ascii?Q?I0RtUMONJHW7AAlXEUPRCL1XFzcfaOBy3lRkWjNawrLRi0ZVFZva/kSU6CVo?=
 =?us-ascii?Q?G5ysJBvZ343iZR/jnWLuQ8m9SYXxWaPvFrkRFazOUXfSwFvCHS9jUwcZE29k?=
 =?us-ascii?Q?EOOY/kraH4k6ff7aYtiG42CddcJt6hYolvdiASJ7a5ZYP1Z5mEZOa6SvDDLV?=
 =?us-ascii?Q?zIAnj7PZisr0Mdx36vpGL/5S4/gmP4fKpnCXTx3EXBZOvzllax/ZY3LcYHbG?=
 =?us-ascii?Q?FU9k24AhmGVtgWZWYgsexO8Oxq8q1eEkr2c8AGWh39cr/gDlRYkDns/R3O45?=
 =?us-ascii?Q?WvRNJcV+GiWaiD15CRnjGIZhuLoTI0N/wZtw+dEdvfZTrhNFhNGW7yU4fNEb?=
 =?us-ascii?Q?4rnNSBVc/Yn41fwd1lvk600hN7TEtHC3TlrwAuUBcG4xsuYq/bjS87UzcN8W?=
 =?us-ascii?Q?uU4Qe2C/btu4gvBzc1mNhBYKV7qajivDJz+hL+vuDrA9byQ6nEMjJJ5YHb6R?=
 =?us-ascii?Q?sh7isKa6j0Rklcob/6AT3NPtG6SvSQ8BGoGpqC9nWaoCgSxSCBbsISzWvh07?=
 =?us-ascii?Q?oYoEj0dQ1DO4/M+E+1cOWQvwDTE7s1YglYRD1Bi5N7zYqsu3Ni3HSJdHQubC?=
 =?us-ascii?Q?RAnSEy7+omEHd8mUTnHXpwnwgFhbXG4ZITwJVy/TqlNu4SFAK0LXhOnqAGul?=
 =?us-ascii?Q?0JAFaRkVNb0l326l9PVt/987XGmZlMBVJpalnSgJOtbxVCOOcSWBBh4uxnC/?=
 =?us-ascii?Q?NLaNsZ2dTzpH7OdaMYpbNuk496rU4vA0fEwn0djERwySon1MjL8y+ZHXwdA5?=
 =?us-ascii?Q?Ae6/QNnEuUoDm6mYuF3/ErVOhabEZLRBnQ+5bLc7PJ7EZUgsPCemj2U3q56H?=
 =?us-ascii?Q?ZtT83TjJhvokn8GbLpZRSzm7vFGDgth2DI0s1fK12n+rjLAtq20s/tz48dHl?=
 =?us-ascii?Q?4+hOoZpofDIvW1Ykud1e/ZHrr4+d+uwNGJ3yh0h8uXPKe347e48D9+/0xJ0T?=
 =?us-ascii?Q?+WWTk9TkrMmhvEXafTEJ7wiSV+D2r7k/lSmsSkdMtgdRQqn1Rz5sbsmqqTCm?=
 =?us-ascii?Q?qBK/PM/B0kCZO6cpEe4hPZrKemjWgpZvd08nYD3tVtdUCgHwFu5T59X1JA+T?=
 =?us-ascii?Q?Vx2BtjCUgk9NGyaZIRrntB/NC2NjqzB8Z/tbt4OEJA3Ra1vwFru9od2AGq0s?=
 =?us-ascii?Q?uGsGglGw6OHof8xwgwPYxzmyuM2QDDOymMTfbAXzElKN0lweZbUr+UZdOjy6?=
 =?us-ascii?Q?1mdKAUjGYY8MdvM04riRJpxQfJB2cxQiTFylNPBYsjexgxhWWxrmaVQcWPDh?=
 =?us-ascii?Q?BQEtWpcf5HH0M5JaRgXxgJIsTlRi53C9OvtqMYjRKpqQujQPT8jyUwbN5oLU?=
 =?us-ascii?Q?qu5l2p6DyWeRWve0yOKirBKQTJ8FOYY//j6nl6iPa0VMezSdlsEquJ0PIulg?=
 =?us-ascii?Q?TPnAg74=3D?=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <152272A62961474FA82DB39294F9D99A@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB7715
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-SkipListedInternetSender: 
 ip=[2603:10a6:102:2a3::12];domain=PA4PR08MB7411.eurprd08.prod.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AMS0EPF00000191.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	b1949867-7e98-4ce7-5cc0-08dcad586a8e
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|35042699022|36860700013|34020700016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?0+gfbKXzWPPcwIJMOoN92uD3xMmE3zRu50/Bm1IZB9FKUdspFrFf7kve7vWc?=
 =?us-ascii?Q?bPP8TmqO7bs4FuKdfGiVPY/8UD3+z6dJdR/GS8NDXgP1M1pKGLcvGi3tZreS?=
 =?us-ascii?Q?lCccInyLbMq+VDPppeQgnHNXk1tkZnwkmkToGUhKMn8cnvE/+Qi0lKvp51jM?=
 =?us-ascii?Q?Ohkq+qclLhFXUFeEQUG39cIfzgQ2tV0iF5GXZzWcTPf4sShVa4geEVezHUNv?=
 =?us-ascii?Q?Cjxe44wfUZcsw5RTcJtr6KYw9tPa1m/rgMeMJUBNk5X/BoU+Vf07/LW3q7jK?=
 =?us-ascii?Q?s9dyHBFanVC8XielEczkBZKbdcKvDJoGuxuXGzc0YNnGtORCu9klN9O1MjQe?=
 =?us-ascii?Q?smFvZvFml+3jzEgd/aX9IsZmShIWa6d9ZHu9fQbWDPKcpdzX2G6KbYo3NExl?=
 =?us-ascii?Q?/0ZMIs8BpU46ptpprHmOzN3X3r6RU4rJEOItu/FigpAdJfqZoDcDB0II+XjS?=
 =?us-ascii?Q?jMradO4fcME2d29aTSRogwk2KIzX2QgGGkkUu4N8ld3Z47scteIviG9a7bI1?=
 =?us-ascii?Q?0xyUIaSZtdx0Z+kFbXOkzv9pM7CsLxFp+j4M1aQoj2o1JbiyOe5Ko2ZwoRp2?=
 =?us-ascii?Q?aOAXyFG8TrY3aez09OgDWgnfT+yxV82IAKPCGtTyv7NrTNqM+SOj4MlxAwTe?=
 =?us-ascii?Q?kX2EgyRCH54xANtQDrvry2Ii1hntWls+BN/Gt/V/mmBKj4IYy/Fck6UyWM2+?=
 =?us-ascii?Q?IRGlmWeRP5bjngmzVtF4O+tY3xY9cQARjxm+yQTnEHmr6UmftqnqlMDXuibh?=
 =?us-ascii?Q?+LodU1Ok7ttz+isk8rUx88Dbh76yol6hjnLNHTbuNqRRvj2AEZLUhNQm12Z6?=
 =?us-ascii?Q?Ox+mVlU74EN8pOMgXvFjjJu3aMX4desEyw4s6wb1KeKXRfiNdwclUTLjLkku?=
 =?us-ascii?Q?xyOQa1gE4Mfuq6ylqagPTvse2QslCyCilG8Fjk1NhsftAKgCfEnsw1mx4USo?=
 =?us-ascii?Q?asuxMaSnuLi72SNrUqgXsCM28pXW25PLzKQ+BJqTyxz57Ydp+WzsFVvpb4g0?=
 =?us-ascii?Q?3MZ/6Mlm2kIe0LcevNT+PHjZjWIeo1dN3ovAi/BUkZanTMV82dEBE74sghzh?=
 =?us-ascii?Q?/0N+SWi8Ov91oWZzx2Uo/vL/6PSydgoXX4/4LpLIaeT72psKt0xtmPBiCjuJ?=
 =?us-ascii?Q?rppCBXWMJzpCrjkMWnlC0CjAnDcUnWD/ov/HJbHUPvkeX7GgOGcvsZ3E6d5p?=
 =?us-ascii?Q?voQacerkpbYPKmYyzP0OK+juyL3OsnLe5f6YauBGznomRjXnpC+/XZML3QeF?=
 =?us-ascii?Q?zuBjB/96x1tIAxeSipwKHp+7bDp/JMmCCu0Xf8psPv8DmwF6TplRb4Y7qV44?=
 =?us-ascii?Q?Wm9AZAM9YX7hir0dl1TPuCMs1ROq4spuezDJoBV8B+N/p5OSkNGSjDcr7LVE?=
 =?us-ascii?Q?UDt6H5MrKuYRZzlvHebPIdx5UFKE?=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230040)(82310400026)(35042699022)(36860700013)(34020700016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jul 2024 09:50:54.2686
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f96ea027-9283-4fc8-38d8-08dcad5870ee
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AMS0EPF00000191.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB6076
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 26 Jul 2024 09:51:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202519



> On 26 Jul 2024, at 08:48, Joao Marcos Costa <joaomarcos.costa@bootlin.com=
> wrote:
>=20
> Hello, Ross
> On 7/23/24 16:51, Ross Burton wrote:
>> This package can be built using pep517 classes now.
>>=20
>> Signed-off-by: Ross Burton <ross.burton@arm.com>
>> ---
>> meta/recipes-devtools/python/python3-beartype_0.18.5.bb | 2 +-
>> 1 file changed, 1 insertion(+), 1 deletion(-)
>>=20
>> diff --git a/meta/recipes-devtools/python/python3-beartype_0.18.5.bb b/m=
eta/recipes-devtools/python/python3-beartype_0.18.5.bb
>> index 00554dd60c5..95d947c90ee 100644
>> --- a/meta/recipes-devtools/python/python3-beartype_0.18.5.bb
>> +++ b/meta/recipes-devtools/python/python3-beartype_0.18.5.bb
>> @@ -6,7 +6,7 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3De71f94261c1b3=
9896cacacfeaf60560e"
>>=20
>> SRC_URI[sha256sum] =3D "264ddc2f1da9ec94ff639141fbe33d22e12a9f75aa863b83=
b7046ffff1381927"
>>=20
>> -inherit setuptools3 pypi
>> +inherit pypi python_setuptools_build_meta
>>=20
>> RDEPENDS:${PN} +=3D "python3-numbers python3-io"
>>=20
> Could this patch be causing such an error in the autobuilder?
> https://autobuilder.yoctoproject.org/typhoon/#/builders/82/builds/6663/st=
eps/11/logs/stdio

No, that was a different issue that RP already fixed.

Ross


