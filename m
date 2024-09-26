Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 404B9CCFA1C
	for <webhook@archiver.kernel.org>; Thu, 26 Sep 2024 11:51:06 +0000 (UTC)
Received: from EUR02-VI1-obe.outbound.protection.outlook.com (EUR02-VI1-obe.outbound.protection.outlook.com [40.107.241.52])
 by mx.groups.io with SMTP id smtpd.web11.40793.1727351460452813758
 for <openembedded-core@lists.openembedded.org>;
 Thu, 26 Sep 2024 04:51:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=F7Xs4Yq4;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=F7Xs4Yq4;
 spf=pass (domain: arm.com, ip: 40.107.241.52, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=hhLdwc6YUN18HLrAIKjggXmuAYDQgGJvAYyTpyuxhbEE5ED9n2ImHYiJmErsykMlXg0/A+Hbe5I+jHtJzpqNU/vVLglRw6jEvqGyTzq0sGPxXtj3Sa93Z/OQyBjvZAQlThbQLuJh1HpyYOS/v8qvbhGuz8Kg/re8gak5pgxfO0O+h0q44Fj2gV97lG+PjJbIbq0zw0zmCVO0H9OEqBO2Q67QrGXJBhTD9ljZ5OoXBKXVZ7MX2LneodEDboqJAXEQYTe0tA/j6a2rYfWkfslwKNtcdCpZrl7skhyX5/qfYKjV7dmOXo/a7JKt1IBPYFROyBoxNj2Odb+gyPmEEhLGBw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=odFqmnZCSYFvSx67Fw+iOlf8KWXT3DpBw3AHq/gyy6s=;
 b=N6v6vUf+n4Jz9IO4WyCr7WK0QAGLMmibszDtfhLIerPK5oh+aJFjDB+asSCyGnslD5/b0StFt8zOl3qpv6UgEA3rplgWnKickNsLNI7gL+bA+ImyU1TvisbOeOHn1ZQFRUD6odOx4eLZpruI8Suy6aehlwpYTrtlwOlTDuvOvfXyoOQTnddHI3pX9OqQAYlgP5ZTS4Z+y9hzL9ZqQTvAFyT95tJW1y8iFoRpkrJGFr7Jk4XSGEizlMMIouGX/cUgWEpTKO8ucr05wO0XpDTOP1tJqOToSagME3cLYeTRG77OLr8as29KFDgvuSNko25GT9mdRtkaFkt+Bueq8Xcczg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=odFqmnZCSYFvSx67Fw+iOlf8KWXT3DpBw3AHq/gyy6s=;
 b=F7Xs4Yq4I3Q7uy2rjEH11m6D4qKXyPa1RGGykua4MJbN00jP6uDIqFFAVIwkOgQ5hoouwfCAMAqenbuZ5baoWVJl6iaLscsdabWtTwMxZOx7WrHX/znAJw6flO6gIe5vdpZMi0udBuQau41FT//22vqZ3HPA+/yGlwEwtR1m8Eg=
Received: from DB9PR01CA0011.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:1d8::16) by DU0PR08MB9933.eurprd08.prod.outlook.com
 (2603:10a6:10:413::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.8; Thu, 26 Sep
 2024 11:50:48 +0000
Received: from DB1PEPF000509F8.eurprd02.prod.outlook.com
 (2603:10a6:10:1d8:cafe::9d) by DB9PR01CA0011.outlook.office365.com
 (2603:10a6:10:1d8::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8005.17 via Frontend
 Transport; Thu, 26 Sep 2024 11:50:48 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB1PEPF000509F8.mail.protection.outlook.com (10.167.242.154) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8005.15
 via Frontend Transport; Thu, 26 Sep 2024 11:50:47 +0000
Received: ("Tessian outbound 245dacdadcd4:v465"); Thu, 26 Sep 2024 11:50:47 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: c31476733ed49a26
X-TessianGatewayMetadata: YmX6Y01Vh5/MSh6/ogWRquguUvMhAD97R9MXLpGRBztajooxkqiRVpc1bcFfZttzSvsGV3LUtPs/+zUth1S1OWx83OmJ3WiJOXblnHXaISZRpV/LSV7xPkw4eKl8YlmggskvzZ3GRyZREJ6oEi+uhLi/IRzrRCXfMlPcnCbAlDs=
X-CR-MTA-TID: 64aa7808
Received: from La90fb078a6c1.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 3CB73A93-0823-4AEB-B0BC-D4D5E1C913AE.1;
	Thu, 26 Sep 2024 11:50:41 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id La90fb078a6c1.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Thu, 26 Sep 2024 11:50:41 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KhHRcKSAIoPrSyCh+UQ8JJwwJ1hezDqTCWxjBlniVX65XML/qVieUj2lkcAnFugBEc47j9znj680qjOnXbyZJiFt+5i9Z6bQ3sbJIvu9ul9RIQTSHBDnySSgQHyM88Es6QmDgKkt0ZswF8TYTGp65r4MCf/heTeM2BWyR8sVQPQBfEoDOkN8e6YPIAEwOq5M1HjIoZI6ojhyytZ8KGD8yNzTsSwZRlr8p8lhaeSFR+RW8DuyaptsowTOEaAeHgkxEB792UG2CGD2l54k7sudIkqsU0GldGkJ2VkmF0NgGgYiQjLEZHLVNstEiMidO3IDF53rmqersTocqe+0oCUTog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=odFqmnZCSYFvSx67Fw+iOlf8KWXT3DpBw3AHq/gyy6s=;
 b=I89fk5gANyv27rjFRN9R+bHEIC/MzbrPeDUqLl3oCvVrVpDqsMFNV0eWbJzboVYrzOXRGGheEwiCP8ZrXoXAsYR2nsh3Z4mVb/JmSHwg4F57BqBocEJIbTwCIHsirCGZt5Dc22m0J7DETDE6BOmOHyP4ctwmYqCIh2SjYExftI2IYxgC1tryRZ8iVnfi5Zu6qBVxnR21+cpjRVOmSmdnWFGP7m33/FEvI+psQpFt+9kV1ZU43zz7ueP1+sV2F40NmHzBKFTFrvKEu+ItVf7UeuKPlaYvKQqtxAsn7zSpuwv3rmuSeBWPoN97cwDPGHh7nEDO2Olji4oARMwaSdVF5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=odFqmnZCSYFvSx67Fw+iOlf8KWXT3DpBw3AHq/gyy6s=;
 b=F7Xs4Yq4I3Q7uy2rjEH11m6D4qKXyPa1RGGykua4MJbN00jP6uDIqFFAVIwkOgQ5hoouwfCAMAqenbuZ5baoWVJl6iaLscsdabWtTwMxZOx7WrHX/znAJw6flO6gIe5vdpZMi0udBuQau41FT//22vqZ3HPA+/yGlwEwtR1m8Eg=
Received: from AS4PR08MB7429.eurprd08.prod.outlook.com (2603:10a6:20b:4e1::9)
 by FRZPR08MB10951.eurprd08.prod.outlook.com (2603:10a6:d10:136::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.8; Thu, 26 Sep
 2024 11:50:38 +0000
Received: from AS4PR08MB7429.eurprd08.prod.outlook.com
 ([fe80::8db5:7772:a426:2afe]) by AS4PR08MB7429.eurprd08.prod.outlook.com
 ([fe80::8db5:7772:a426:2afe%2]) with mapi id 15.20.8005.010; Thu, 26 Sep 2024
 11:50:38 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: Trevor Gamblin <tgamblin@baylibre.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core][PATCH 4/4 v2] python3-dtc: upgrade 1.7.0 -> 1.7.1
Thread-Topic: [OE-core][PATCH 4/4 v2] python3-dtc: upgrade 1.7.0 -> 1.7.1
Thread-Index: AQHbDpKQ3jUQCG5xUk6fDIH3alnDo7Jp92oA
Date: Thu, 26 Sep 2024 11:50:38 +0000
Message-ID: <5E176A0E-4995-428E-AF5A-F625EF7A2000@arm.com>
References: <20240924150001.2586819-1-tgamblin@baylibre.com>
 <20240924150001.2586819-4-tgamblin@baylibre.com>
In-Reply-To: <20240924150001.2586819-4-tgamblin@baylibre.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3776.700.51)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	AS4PR08MB7429:EE_|FRZPR08MB10951:EE_|DB1PEPF000509F8:EE_|DU0PR08MB9933:EE_
X-MS-Office365-Filtering-Correlation-Id: d9ff9d0a-76f9-465b-98d2-08dcde21763e
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|366016|1800799024|376014|4022899009|38070700018;
X-Microsoft-Antispam-Message-Info-Original: 
 =?us-ascii?Q?2CExRjaW62rvAAUFpyfiRyeRvNDvwDCYlB0ufuMGzedEav7vv4ZgbgCg4vIj?=
 =?us-ascii?Q?OA2/jafQAaeoryvrbWD1Npdht1JNBdx3ygmkPGjaBti1RD6CyyoLwv8g/9NX?=
 =?us-ascii?Q?wqphBT5F3W9+3CAI+qFY8iKQmLae6U60PevPeHk/rdpcc5/mD5MHWZrn9J81?=
 =?us-ascii?Q?g0PiXyP0TUCptnKtS8pMcpm4YRw9O/Xjdvsy12mDJIN3aBTJMgM5XxLg2SYx?=
 =?us-ascii?Q?P3NUsnpYuPMF67iz/96/fbMHceJCqMFGL2nff/kyCzDF7bnx3VDUKsTiYslL?=
 =?us-ascii?Q?ez/yqYpVbGnF4+mJGyh/eObFpnfOXIKg0+PP9ZP9cdhbuyAqG9iXRfIMj4RC?=
 =?us-ascii?Q?gRi6jVn4+FAx28xlTHAihudzuDT53C9toA/WMNL2AxlNg1q2UAt7kri6ZHgY?=
 =?us-ascii?Q?X7AOAFtFCfdEdWNAe+fYqc8QuXeZ0obb4hAECRBrGCXU/2RKTcK997JygQOs?=
 =?us-ascii?Q?Hmt9XJ1SPi4eWoFlT8JgiC7S2uk4rk1k/NOcI9nRf0fzmqYi/EfAXJJLAQv6?=
 =?us-ascii?Q?onp2ef6KsRVUClPTMQbwevYk87BOqrRFarMNplc4XBXBcyb8RUTSdGixj7La?=
 =?us-ascii?Q?5mq81UmqObUEkEMLzk+flLhKDsVbjvqYuFzFwYusWc2OBp602q/Pw1omTIoF?=
 =?us-ascii?Q?fbmz9ds16edKDWtsGZXInE73Brg9yw4QYTrv0WflgJUYgJA5z9uZgxPeEzvL?=
 =?us-ascii?Q?HDCbxLCDav3cYaTfWaTXEcC2i5NqQCePQu52c9KU1DaLhFURtbXduqvG9xrV?=
 =?us-ascii?Q?4a/kf4zicVtz2GzRVWWXmLM6MIwXnIHL5JUwHkvUCxBCKG+hzfA7tHu3y8x1?=
 =?us-ascii?Q?PPQWsIZt7gtAJ4JhoGGluwg3pkXdCK473QK+l+jKl/ZHX+v+ZuFJWegm5U/F?=
 =?us-ascii?Q?1txLrySeoBKm2nRXKlngiDpy6KcbICtJ0V4CqR5SYdOLmL+owH3SJKzN2FDG?=
 =?us-ascii?Q?rkkS+pFhDR/D8yYoaDtshzrhzGlCKXd7vHp/cs4eCaerwEAbn4hFJzmeGAp/?=
 =?us-ascii?Q?qgorEYWVnLdjr1QHZ2Q73DZkMAg5ycR+w/onjxwuiL+wLB/YFXTVGosZNy9K?=
 =?us-ascii?Q?6gnnznMOOKjlmJ0nUwCYzv8RVAM64REwKyzfj9ktPkXBTg2IidmbARSnvQio?=
 =?us-ascii?Q?i+hgE/0qxp6P5qrStc1rbGsbxB/QQxRFehrto7f02ubdMnPr5YJQVazM8exZ?=
 =?us-ascii?Q?SgfWRMYTPJKoST/KrbA3s7930nIDROOzopAK68V9Tci3bAc94m3exrK3YRP4?=
 =?us-ascii?Q?8PtnRvMvXNzZDxkYxThQjnWfd3hUm/dkUo9c9OmXDkmAXMvJuFjsYvtKWs0y?=
 =?us-ascii?Q?6I93r1XdnR/4XzUeiymQqRQ4C8KcKyjbJwaXmOtFzcOkPLQsLBjfc2LYwBKU?=
 =?us-ascii?Q?Ul8SgkY=3D?=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR08MB7429.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(4022899009)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <470AF69EBC97624A8F2F67AD0EAFBAB6@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: FRZPR08MB10951
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-SkipListedInternetSender: 
 ip=[2603:10a6:20b:4e1::9];domain=AS4PR08MB7429.eurprd08.prod.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DB1PEPF000509F8.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	1e1f4be3-e95c-408e-0115-08dcde2170e1
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|4022899009|35042699022|376014|1800799024|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?miZjMWx0qoBT14A/+vWxUTYDY3JoZG+sJllw72bPxXc8LOaVWGjr6F+C3DQI?=
 =?us-ascii?Q?0wYKmNJA+is+Tfm2FUru8CTkSuWhd/EUG4U2ITZuuZ4DIV5SkEZqAzILM5/T?=
 =?us-ascii?Q?PESgAkS0bvGkR9lyPg+4+6ocJ6qAl19dQgghfU3wTflTgAx/rf3IvkuDbk3G?=
 =?us-ascii?Q?LntB2s8fkwVXpFpOcx76qo4q2kXzC33Aq8R6k4V5RAbfQCt0Ehdgkna5vyCG?=
 =?us-ascii?Q?x16LH7/kLyG2C+J76I+P2ncv7KLs5rYn0U3M/GX/nImx2nlZLoQVOLu9SaCv?=
 =?us-ascii?Q?4EPMQugQMicFOEZYB+yU0v9bCKnbsMmAmhiZgs52GUQlNufkl6o5I9q6NgzI?=
 =?us-ascii?Q?Rwy0yom1G/ur+8Ray91ETZIQskxn3xfuQtl4qjH7lZHinWx3GVN/4N9WhREe?=
 =?us-ascii?Q?xe4QNdK53hQoohPZwIO8YSSGLxDI+5S+ikkBPHNUqL0xD2QNYPOl7aXVuTY8?=
 =?us-ascii?Q?SxzkayjNfFznIpccmq8cjuLJijE/u0OwKFjnkD5d5o5tI5u3IR3ZxTOcJ6Wu?=
 =?us-ascii?Q?bpeBv+nAqtoi1LcodzioyT+m/i9TUbU5H2xKoLjV89/mhf+XP7ayWfCJvWQx?=
 =?us-ascii?Q?DOL7Bi3ZZVT3LM0DRSKsiHju5Y2O3H4yzIiQkD0kPFD5mfDCH5p4fVou7MtB?=
 =?us-ascii?Q?RttpY1ohCu6ZNeB3XrymkK7fy1JZ9QYvMRcfxrWik7lRZr8UxEP1MJcm244F?=
 =?us-ascii?Q?qhA90p66LTryOoj09v3CSErP7I/Brj9WOStwdVqiw+eallwwjV6BcrFh5F3F?=
 =?us-ascii?Q?jmSkO1QyXCDYi0g7IGMOMNLwUW0UCa28wYyFXhQZ2gIQLkJL8rUKza859R9o?=
 =?us-ascii?Q?DKnD/PQD91r0nejzKB7Tf+dYqtAn5LKeLwwbmrnEB6EIUDHlc7YJsGir9w1/?=
 =?us-ascii?Q?PA7pdzg1Y1HLvEOKPavsB2g7IwmGtoa8wlNs8ld5f7eYF2AQPNz/O7dluHTG?=
 =?us-ascii?Q?Z76fKdfqt8bWtFPzsWpQL5wIn4zObEnPed7d8IqNKZXefxTjQYyN4en4cM6m?=
 =?us-ascii?Q?5j9qZeFEKhmKxDBCOyO73mnjmqg6i2WErTB+qp/dO5P+5kGlz1qIy8qmRSn2?=
 =?us-ascii?Q?h8QlZfVqu2muoNAPN+9XDX2l0NuEn6/Gp9ADXGAiageupluUivHshymy/wmg?=
 =?us-ascii?Q?rUMXdI9UEsfSivSAdePqYtZpvqA1Mq3Lk21izPUMgg2QyMOttJSskW0uIceW?=
 =?us-ascii?Q?To1TNpDGQtxIIK1oWhpu0H6Szx8HerZi9Ky9ibJUkzhy6PhzGCUwX9WAgx++?=
 =?us-ascii?Q?K4WV2DPOU4IW0mwXAXY9thPk6RODEk4PxJqdWxJH5ojEvL55OkAOMGMAbdsg?=
 =?us-ascii?Q?DKEAIRFKY6q+MqIdCQz7HWRbNQcWDrvI2f4xt5BLwx2h9A=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230040)(4022899009)(35042699022)(376014)(1800799024)(36860700013)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Sep 2024 11:50:47.8399
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d9ff9d0a-76f9-465b-98d2-08dcde21763e
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB1PEPF000509F8.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB9933
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 26 Sep 2024 11:51:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204978

This breaks meta-virt, which uses python3-dtc in its build:

Traceback (most recent call last):
File "[...]/work/qemuarm64-poky-linux/xen-image-minimal/1.0/recipe-sysroot-=
native/usr/bin/lopper", line 8, in <module>
sys.exit(main())
^^^^^^
File "[...]/work/qemuarm64-poky-linux/xen-image-minimal/1.0/recipe-sysroot-=
native/usr/lib/python3.12/site-packages/lopper/__main__.py", line 220, in m=
ain
import lopper.fdt
File "[...]/work/qemuarm64-poky-linux/xen-image-minimal/1.0/recipe-sysroot-=
native/usr/lib/python3.12/site-packages/lopper/fdt.py", line 46, in <module=
>
import libfdt
File "[...]/work/qemuarm64-poky-linux/xen-image-minimal/1.0/recipe-sysroot-=
native/usr/lib/python3.12/site-packages/libfdt.py", line 12, in <module>
import _libfdt
ImportError: [...]/work/qemuarm64-poky-linux/xen-image-minimal/1.0/recipe-s=
ysroot-native/usr/lib/python3.12/site-packages/_libfdt.cpython-312-x86_64-l=
inux-gnu.so: undefined symbol: fdt_get_symbol

Ross

> On 24 Sep 2024, at 16:00, Trevor Gamblin via lists.openembedded.org <tgam=
blin=3Dbaylibre.com@lists.openembedded.org> wrote:
>=20
> Patch '0001-Revert-libfdt-overlay-make-overlay_get_target-public.patch'
> had to be adjusted to apply on the latest version.
>=20
> Changelog:
>=20
> 99031e3 (tag: v1.7.1, origin/master, origin/main, origin/HEAD, master) Bu=
mp version to v1.7.1
> 3d5e376 setup: Move setting of srcdir down to the bottom
> e277553 setup: Collect top-level code together
> 7e5a889 setup: Move version and full_description into a function
> 78b6a85 Tidy up some pylint warnings
> 3501d37 Require Python 3
> bcd02b5 fdtoverlay: remove wrong singular article in a comment
> 84b056a checks: relax graph checks for overlays
> 1df7b04 pylibfdt/Makefile.pylibfdt: use project's flags to compile the ex=
tension
> 61e88fd libfdt: overlay: Fix phandle overwrite check for new subtrees
> 49d3089 meson: fix installation with meson-python
> d54aaf9 pylibfdt: clean up python build directory
> ab86f1e pylibfdt: add VERSION.txt to Python sdist
> 7b8a30e pylibfdt: fix Python version
> ff4f17e pylibfdt/Makefile.pylibfdt: fix Python library being rebuild duri=
ng install
> 9e313b1 pylibfdt/meson.build: fix Python library being rebuilt during ins=
tall
> d598fc3 tests/run_tests.sh: fix Meson library path being dropped
> b98239d tests/meson.build: fix python and yaml tests not running
> c17d76a checks: Check the overall length of "interrupt-map"
> ae26223 libfdt: overlay: Refactor overlay_fixup_phandle
> 4dd831a libfdt: tests: Update test case for overlay_bad_fixup
> e6d2942 tests: Remove two_roots and named_root from LIBTREE_TESTS_L and a=
dd all dtb filenames generated by dumptrees to TESTS_TREES_L in Makefile.te=
sts
> 855c934 tests: fix tests broken under Meson
> 4fd3f4f github: enforce testing pylibfdt and yaml support
> 9ca7d62 meson: split run-tests by type
> bb51223 meson: fix dependencies of tests
> e819006 meson: fix pylibfdt missing dependency on libfdt
> 8221238 pylibfdt: fix get_mem_rsv for newer Python versions
> 1fad065 libfdt: overlay: ensure that existing phandles are not overwritte=
n
> b0aacd0 github: add windows/msys CI build
> ae97d97 github: Don't accidentally suppress test errors
> 057a7db github: Display meson test logs on failure
> 92b5d4e pylibfdt: Remove some apparently deprecated options from setup.py
> 417e329 github: Update to newer checkout action
> 5e6cefa fix MinGW format attribute
> 24f6001 libfdt: Simplify adjustment of values for local fixups
> da39ee0 libfdt: rework shared/static libraries
> a669223 Makefile: do not hardcode the `install` program path
> 3fbfdd0 libfdt: fix duplicate meson target
> dcef5f8 tests: use correct pkg-config when cross compiling
> 0b8026f meson: allow building from shallow clones
> 95c74d7 treesource: Restore string list output when no type markers
> 2283dd7 libfdt: fdt_path_offset_namelen: Reject empty path
> 79b9e32 libfdt: fdt_get_alias_namelen: Validate aliases
> 52157f1 pylibfdt: Support boolean properties
> d774337 dtc: fix missing string in usage_opts_help
> ad8bf9f libfdt: Fix fdt_appendprop_addrrange documentation
> 6c5e189 github: add workflow for Meson builds
> a3dc9f0 libfdt: rename libfdt-X.Y.Z.so to libfdt.so.X.Y.Z
> 3501994 workflows: build: remove setuptools_scm hack
> cd3e230 pylibfdt: use fallback version in tarballs
> 0f58645 move release version into VERSION.txt
> 3816595 libfdt: add missing version symbols
> 5e98b59 editorconfig: use tab indentation for version.lds
> d030a89 tests: generate dtbs in Meson build directory
> 8d8372b tests: fix use of deprecated meson methods
> 761114e pylibtfdt: fix use of deprecated meson method
> bf6377a meson: set minimum Meson version to 0.56.0
> 4c68e4b libfdt: fix library version to match project version
> bdc5c87 meson: allow disabling tests
> f088e38 Makefile: allow to install libfdt without building executables
> 6df5328 Fix use of <ctype.h> functions
> ccf1f62 libfdt: Fix a typo in libfdt.h
> 71a8b8e libfdt: meson: Fix linking on macOS linker
> 589d8c7 dtc: Add an option to generate __local_fixups__ and __fixups__
> e836466 CI: Add build matrix with multiple Linux distributions
> 3b02a94 dtc: Correct invalid dts output with mixed phandles and integers
> d488895 tests: Add additional tests for device graph checks
> ea3b9a1 checks: Fix crash in graph_child_address if 'reg' cell size !=3D =
1
> b2b9671 livetree: fix off-by-one in propval_cell_n() bounds check
> ab481e4 Add definition for a GitHub Actions CI job
> c88038c Drop obsolete/broken CI definitions
> 0ac8b30 yaml: Depend on libyaml >=3D 0.2.3
> f1657b2 tests: Add test cases for bad endpoint node and remote-endpoint p=
rop checks
> 44bb89c checks: Fix segmentation fault in check_graph_node
> 60bcf1c improve documentation for fdt_path_offset()
> a6f997b add fdt_get_symbol() and fdt_get_symbol_namelen() functions
> 18f5ec1 use fdt_path_getprop_namelen() in fdt_get_alias_namelen()
> df09327 add fdt_path_getprop_namelen() helper
> 129bb4b doc: dt-object-internal: Fix a typo
> 390f481 fdtoverlay: Drop a a repeated article
> 9f8b382 manual: Fix and improve documentation about -@
> 2cdf93a fdtoverlay: Fix usage string to not mention "<type>"
> 72fc810 build-sys: add -Wwrite-strings
> 083ab26 tests: fix leaks spotted by ASAN
> 6f8b28f livetree: fix leak spotted by ASAN
> fd68bb8 Make name_node() xstrdup its name argument
> 4718189 Delay xstrdup() of node and property names coming from a flat tre=
e
> 0b842c3 Make build_property() xstrdup its name argument
> 9cceabe checks: correct I2C 10-bit address check
> 0d56145 yamltree.c: fix -Werror=3Ddiscarded-qualifiers & -Werror=3Dcast-q=
ual
> 61fa22b checks: make check.data const
> 7a1d72a checks.c: fix check_msg() leak
> ee57999 checks.c: fix heap-buffer-overflow
> 44c9b73 tests: fix -Wwrite-strings
> 5b60f51 srcpos.c: fix -Wwrite-strings
> 32174a6 meson: Fix cell overflow tests when running from meson
> 64a907f meson.build: bump version to 1.7.0
> e3cde06 Add -Wsuggest-attribute=3Dformat warning, correct warnings thus g=
enerated
> 4182182 Use #ifdef NO_VALGRIND
> 71c19f2 Do not redefine _GNU_SOURCE if already set
>=20
> Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
> ---
> v2 adds my signoff to the carried patch, which was adjusted to apply on
> v1.7.1.
>=20
> ...erlay-make-overlay_get_target-public.patch | 25 +++++++++++--------
> ...hon3-dtc_1.7.0.bb =3D> python3-dtc_1.7.1.bb} |  2 +-
> 2 files changed, 15 insertions(+), 12 deletions(-)
> rename meta/recipes-devtools/python/{python3-dtc_1.7.0.bb =3D> python3-dt=
c_1.7.1.bb} (94%)
>=20
> diff --git a/meta/recipes-devtools/python/python3-dtc/0001-Revert-libfdt-=
overlay-make-overlay_get_target-public.patch b/meta/recipes-devtools/python=
/python3-dtc/0001-Revert-libfdt-overlay-make-overlay_get_target-public.patc=
h
> index a2df482e3aa..70dd93f7471 100644
> --- a/meta/recipes-devtools/python/python3-dtc/0001-Revert-libfdt-overlay=
-make-overlay_get_target-public.patch
> +++ b/meta/recipes-devtools/python/python3-dtc/0001-Revert-libfdt-overlay=
-make-overlay_get_target-public.patch
> @@ -1,4 +1,4 @@
> -From 4d4703e0199fb3556c37694e4d951785abca22fd Mon Sep 17 00:00:00 2001
> +From 20b224b8ab1837778dfd0e7171643a5d26675f95 Mon Sep 17 00:00:00 2001
> From: Bruce Ashfield <bruce.ashfield@gmail.com>
> Date: Wed, 19 Jan 2022 12:46:42 -0500
> Subject: [PATCH] Revert "libfdt: overlay: make overlay_get_target() publi=
c"
> @@ -7,6 +7,9 @@ This reverts commit 45f3d1a095dd3440578d5c6313eba555a791f=
3fb.
>=20
> Upstream-Status: Inappropriate [embedded specific]
>=20
> +Adjust to apply on v1.7.1.
> +
> +Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
> ---
>  libfdt/fdt_overlay.c | 29 ++++++++++++++++++++++-------
>  libfdt/libfdt.h      | 18 ------------------
> @@ -14,7 +17,7 @@ Upstream-Status: Inappropriate [embedded specific]
>  3 files changed, 22 insertions(+), 26 deletions(-)
>=20
> diff --git a/libfdt/fdt_overlay.c b/libfdt/fdt_overlay.c
> -index 5c0c398..d217e79 100644
> +index 28b667f..e6e9382 100644
> --- a/libfdt/fdt_overlay.c
> +++ b/libfdt/fdt_overlay.c
> @@ -40,22 +40,37 @@ static uint32_t overlay_get_target_phandle(const void=
 *fdto, int fragment)
> @@ -59,7 +62,7 @@ index 5c0c398..d217e79 100644
>   if (path)
>   ret =3D fdt_path_offset(fdt, path);
>   else
> -@@ -621,7 +636,7 @@ static int overlay_merge(void *fdt, void *fdto)
> +@@ -848,7 +863,7 @@ static int overlay_merge(void *fdt, void *fdto)
>   if (overlay < 0)
>   return overlay;
>=20
> @@ -68,7 +71,7 @@ index 5c0c398..d217e79 100644
>   if (target < 0)
>   return target;
>=20
> -@@ -764,7 +779,7 @@ static int overlay_symbol_update(void *fdt, void *fd=
to)
> +@@ -991,7 +1006,7 @@ static int overlay_symbol_update(void *fdt, void *f=
dto)
>   return -FDT_ERR_BADOVERLAY;
>=20
>   /* get the target of the fragment */
> @@ -77,7 +80,7 @@ index 5c0c398..d217e79 100644
>   if (ret < 0)
>   return ret;
>   target =3D ret;
> -@@ -786,7 +801,7 @@ static int overlay_symbol_update(void *fdt, void *fd=
to)
> +@@ -1013,7 +1028,7 @@ static int overlay_symbol_update(void *fdt, void *=
fdto)
>=20
>   if (!target_path) {
>   /* again in case setprop_placeholder changed it */
> @@ -87,10 +90,10 @@ index 5c0c398..d217e79 100644
>   return ret;
>   target =3D ret;
> diff --git a/libfdt/libfdt.h b/libfdt/libfdt.h
> -index a7f432c..7f117e8 100644
> +index 0677fea..c72337b 100644
> --- a/libfdt/libfdt.h
> +++ b/libfdt/libfdt.h
> -@@ -2116,24 +2116,6 @@ int fdt_del_node(void *fdt, int nodeoffset);
> +@@ -2184,24 +2184,6 @@ int fdt_del_node(void *fdt, int nodeoffset);
>   */
>  int fdt_overlay_apply(void *fdt, void *fdto);
>=20
> @@ -116,7 +119,7 @@ index a7f432c..7f117e8 100644
>  /* Debugging / informational functions                                */
>  /**********************************************************************/
> diff --git a/libfdt/version.lds b/libfdt/version.lds
> -index cbce5d4..7ab85f1 100644
> +index 989cd89..ae5f8c6 100644
> --- a/libfdt/version.lds
> +++ b/libfdt/version.lds
> @@ -77,7 +77,6 @@ LIBFDT_1.2 {
> @@ -124,9 +127,9 @@ index cbce5d4..7ab85f1 100644
>   fdt_setprop_inplace_namelen_partial;
>   fdt_create_with_flags;
> - fdt_overlay_target_offset;
> + fdt_get_symbol;
> + fdt_get_symbol_namelen;
>   local:
> - *;
> - };
> --=20
> -2.19.1
> +2.39.5
>=20
> diff --git a/meta/recipes-devtools/python/python3-dtc_1.7.0.bb b/meta/rec=
ipes-devtools/python/python3-dtc_1.7.1.bb
> similarity index 94%
> rename from meta/recipes-devtools/python/python3-dtc_1.7.0.bb
> rename to meta/recipes-devtools/python/python3-dtc_1.7.1.bb
> index 85e48d46942..269095bd8c9 100644
> --- a/meta/recipes-devtools/python/python3-dtc_1.7.0.bb
> +++ b/meta/recipes-devtools/python/python3-dtc_1.7.1.bb
> @@ -14,7 +14,7 @@ UPSTREAM_CHECK_GITTAGREGEX =3D "v(?P<pver>\d+(\.\d+)+)"
>=20
> LIC_FILES_CHKSUM =3D "file://pylibfdt/libfdt.i;beginline=3D1;endline=3D6;=
md5=3Dafda088c974174a29108c8d80b5dce90"
>=20
> -SRCREV =3D "039a99414e778332d8f9c04cbd3072e1dcc62798"
> +SRCREV =3D "99031e3a4a6e479466ae795790b44727434ca27d"
>=20
> S =3D "${WORKDIR}/git"
>=20
> --=20
> 2.39.5
>=20
>=20
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#204876): https://lists.openembedded.org/g/openembedde=
d-core/message/204876
> Mute This Topic: https://lists.openembedded.org/mt/108629987/6875888
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ro=
ss.burton@arm.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>=20


