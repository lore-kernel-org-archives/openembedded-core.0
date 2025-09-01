Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86A73CA0FF0
	for <webhook@archiver.kernel.org>; Mon,  1 Sep 2025 17:09:51 +0000 (UTC)
Received: from DU2PR03CU002.outbound.protection.outlook.com (DU2PR03CU002.outbound.protection.outlook.com [52.101.65.47])
 by mx.groups.io with SMTP id smtpd.web11.57378.1756746586954365781
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Sep 2025 10:09:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=R94YpP3s;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=R94YpP3s;
 spf=pass (domain: arm.com, ip: 52.101.65.47, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=hpZdrtBd7Sejp7HS53dVSkegKYfhe7ld8iyP23F4mnLFg/qUYKK27q5bfVIwHQpSWH5krklqWJoJp3u0ZDxQdEmRclDnJfxtnES3ccaCgkvE+KemiPvBYu+5y0qi8zdPvZBslZu/kHOzTW7cuaypB9DvBvyGjee5wil8tpiXmYvJkLsSw7F7k+fT09xTVpVtcHSSIiYStrzPcwnvTa/VzvKhflP6azG6UhWe2BO+yXzSF6iDxb0IKmvp5yNAYVc8bZL2Dzskt9uY9Z0r/mvpNuRFArXpsDoyc0OjKApfSKO5M/w8i15V99t3cqYEGJWt37MjirEOJk4sEJDYEuczxw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uk60S4wbMoZrW3SixTh5ghkrWsZvgyk9TkR3XniLUsk=;
 b=LwkuIa059rrgYqeGvVm0iPeT1v/U7e5cmeRl6toJ6eikX09oIOiHqeTRzc/5VIW0MGXRiK4MT/3wYgfO70F1bjaw4aXeu5lOeruFdHU8fjDI94WQ81pESA/Sa2Z103bBw231to6dtP4dzeHkNwomhKYhx/iRtS43/cUGm1M+YENmWPm2QNUQtDuqdxFW8WS2KKMhOH/V3I0K20JAog1crZ1U6xpk/Ldf8nsfDp2f2jmlzfp6VdARP9paeK8kLgg7ggnKmHK/4QNTBMXKR7ks3Z93pspoQxfTauAfDDJ1rr823iGREyhkVX85BTfzRO+p2J+LrI9DJYw44fyB7flEiQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=gmail.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uk60S4wbMoZrW3SixTh5ghkrWsZvgyk9TkR3XniLUsk=;
 b=R94YpP3sdO3vXrLvRAj06XMgzCdddCfMqlEy3rtLnCU7XnS9cyHV0SI0wlrXK5dMI8rWXoVgzOK9EnvlyN1TGzIAekiH0twVupdyUlXwi0KprtcndBj4Dj1LZ3+eDoBwsvk3Llu6M0f/TpiG2Gs6EO7xFhuk9lkFH0sguwVECUs=
Received: from DUZPR01CA0248.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b5::21) by GV1PR08MB8426.eurprd08.prod.outlook.com
 (2603:10a6:150:8a::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9073.27; Mon, 1 Sep
 2025 17:09:40 +0000
Received: from DU6PEPF0000B620.eurprd02.prod.outlook.com
 (2603:10a6:10:4b5:cafe::23) by DUZPR01CA0248.outlook.office365.com
 (2603:10a6:10:4b5::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9073.27 via Frontend Transport; Mon,
 1 Sep 2025 17:09:46 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DU6PEPF0000B620.mail.protection.outlook.com (10.167.8.136) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9094.14
 via Frontend Transport; Mon, 1 Sep 2025 17:09:39 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ojoLXxfK03tXc97FjBAThwkfq4aWB8NF30DY9WjbH1g2DI5ki9VYshdDfHPR0bxH5mHC5IfZf2/Ah6wwvnuAb5we5efUULmth6ozBqIwOq9v2SurnUoeACipO0FmVZdZtEAfb796r2ecivKOibP+67B8XVPlh/SmG2bcNEqskz5E431ErugdsqdQdOxBUjP9L3Kwv7YWZJOotzLaL190rrXMdrdzkcIK1dZoAU6wLtgPZ+4/deumVIyS3M7HzNek83528tdAGo9qFmZEs741vgikE/ugfhz5IZ/h80wBdUWD/RE/c9jbWawpgp2RXoo10jXPM2a6nciU3T8J6Zznqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uk60S4wbMoZrW3SixTh5ghkrWsZvgyk9TkR3XniLUsk=;
 b=W2nR3askCC6ROsRtP6H72r9aezVnC+LgyyeneaMysLE9BHCLVsc0tOXBrvTNxETh5ooPWXYydyW2pCyQxTODUi+yIi5zmEZElmH3YmBnYh/GjpfTkXqJok1pIJDvKDUPkM/mQqC6WrI8jR59yB699BjEhO3ZGA486Y7rqdU+efCoQsy0cDpNElzXqVZXs5AeIDnqc/W/F3/5GPZ4q1XbySNOgnfK17jZ3K1agzFRlqza4gbBbqBwt9v5HGIVcp4QZiXMx8BYVGrUoP8myx4R924Kv6k/wrbn9ubh0qmSeB+U3pz+b+C/kkaKNi4lz8RO2/uopR9Cme81rBjT5f2ruQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uk60S4wbMoZrW3SixTh5ghkrWsZvgyk9TkR3XniLUsk=;
 b=R94YpP3sdO3vXrLvRAj06XMgzCdddCfMqlEy3rtLnCU7XnS9cyHV0SI0wlrXK5dMI8rWXoVgzOK9EnvlyN1TGzIAekiH0twVupdyUlXwi0KprtcndBj4Dj1LZ3+eDoBwsvk3Llu6M0f/TpiG2Gs6EO7xFhuk9lkFH0sguwVECUs=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by AS1PR08MB7563.eurprd08.prod.outlook.com (2603:10a6:20b:472::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9073.27; Mon, 1 Sep
 2025 17:09:06 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::7f73:806a:3493:7d50]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::7f73:806a:3493:7d50%4]) with mapi id 15.20.9073.026; Mon, 1 Sep 2025
 17:09:06 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "raj.khem@gmail.com" <raj.khem@gmail.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH] lttng-tools: Filter out regression testsuite on
 musl systems
Thread-Topic: [OE-core] [PATCH] lttng-tools: Filter out regression testsuite
 on musl systems
Thread-Index: AQHcF8axvz5/EgwwO0SITdiItndGbbR+lqUA
Date: Mon, 1 Sep 2025 17:09:06 +0000
Message-ID: <ADF4E6CA-F16A-4F7B-B3C4-114FEA7E673F@arm.com>
References: <20250828025134.3747161-1-raj.khem@gmail.com>
In-Reply-To: <20250828025134.3747161-1-raj.khem@gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3826.700.81)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|AS1PR08MB7563:EE_|DU6PEPF0000B620:EE_|GV1PR08MB8426:EE_
X-MS-Office365-Filtering-Correlation-Id: ec9ea43b-8de9-4cdf-ec1a-08dde97a5603
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|366016|1800799024|376014|38070700018;
X-Microsoft-Antispam-Message-Info-Original: 
 =?us-ascii?Q?I6tacJBTG/5a32U18O5Pnznuv1ac/DhI05EaHc+Nl055GldCOu13OvPr4iBO?=
 =?us-ascii?Q?4GnfdybyHNzZUIQ7fAEFtzFK6Xh55D72LlylNSavuCm8+GKe4yTckXc1UW43?=
 =?us-ascii?Q?mUhkSMtsDmJIvQhXXdp8eddzRp2I9FxmphVH5IqmI8jTzoU+hiNTEz9wFGQe?=
 =?us-ascii?Q?WWZzvlhvGZMaDZQ/kJFT6P7Wn1GW2XVn/X/jHSieeRq1s8BItbnbcX33Snmj?=
 =?us-ascii?Q?l2D860w4+O/pN7t+NfyAmk6ejknAAGgRm7srsf7/GpVZRC6wdX6V0Zrgldzz?=
 =?us-ascii?Q?U+a4hM3N8kwBKtWlsr/XhFk8ekDqfwwAwWt26Dwy3coYPGwERm4B+5nE/ZjT?=
 =?us-ascii?Q?Hq92wG9f0HrOgDeYesc3Cyqbz8qnxRnkkIsoV7KHx0o+mUqnn6yMrt2zeiEY?=
 =?us-ascii?Q?vChwoQEWv9NtvqBZ2dqEPT7oYTEXLfVdQqvts25X6JUBlx5YCHGbanYzNN8Q?=
 =?us-ascii?Q?xey0kiw/yYlgG4Qz99C7sVSsPV6ObsD5aB3cMeoLWdsEUfUBju1CgSfTkyCO?=
 =?us-ascii?Q?eyrvB1oAuKnDXDDXS4+MvJ4IrKWAE4o6XmvdNReRLIkCKINbJT9nfemQWNv0?=
 =?us-ascii?Q?HCT65kJwua0GpyVg0+qIYiOgH1blnbHy4zb5e74Tu4hyOUOrfIz3mcHzWluN?=
 =?us-ascii?Q?ofd8pNLFtTO6GhcQH4I09QSr22VG8n5V6o6MWEEkaGaLJrlkdN0ISlZg87Q7?=
 =?us-ascii?Q?Dzg4wHI5zunXHsxdlhb5Kabqz3zCuf2Dt42AZly0+GCEOzGeKB72e1oqIdXF?=
 =?us-ascii?Q?eTk2hwhuBSbI+KdRl9LkOkm8QYBdf3NlA4ljL+3ehDH1ZQ4D9wL8P4fChTlE?=
 =?us-ascii?Q?QKFyfW6CupIYCnrgyPuloYPZQlLQb2qopaL/9OzfJ2HLmSyk+5yNtHgaatfx?=
 =?us-ascii?Q?C8hZNEe3uTavBO89G4vXSWYPDUVGKCY5wTjMXFXFiPxeiedrLcnjY1HlpZsI?=
 =?us-ascii?Q?6yBgYXRl9naIbxBtnnvpNDHes8UANMqdc4N2i0+/mrRBZZs7WZ+V8mHbwSjl?=
 =?us-ascii?Q?N3eu5jFyk6sMXVQSElyVudm6S2OqXD+kWE5bUWNeX3ac1oFvcHWLjHO+fUvM?=
 =?us-ascii?Q?idcKg3IrDv/8vvIRJjYXwwQ+ujw5Pe6aGw5yQcuZpU5WcSiSYmAJgNSMz4y0?=
 =?us-ascii?Q?A1QuNzbxDaTheoFyylfrMsiHcDM2LamMPNQPn4j3dG8jX27SactO5zwk/P5Z?=
 =?us-ascii?Q?NLAvnHb9eDOIi+YnCLPTwHOV3aSwFDKE0Fj/7jL1IxO9crZ7bjFnYZ3AAl78?=
 =?us-ascii?Q?4wJPDtdbX1vmGfseqIYBZRwT+qLg1kkAIhU8+GDZvO0u2pKXRhkw8tT70bu6?=
 =?us-ascii?Q?EohinSs7KF6M3gqKvCsFqCwVOC8chuXYa52OFEVpW9NPb7eWnU3Cl/XoPhff?=
 =?us-ascii?Q?DRU54jqVV/1fIjXZsdNM+XaozKd6FCRu/+6ZlyhW2IIUTcpA+0NGHN33F0YR?=
 =?us-ascii?Q?TvHYBZoqwIZKcA++dcNh/i75b2FcADYwxaV8S6HTebkSHHMnn9gdsQ=3D=3D?=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <81D85435A2EFEE4F9CD4328EB439D107@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR08MB7563
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DU6PEPF0000B620.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	f41e1d39-16a3-4089-933e-08dde97a4289
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|1800799024|36860700013|82310400026|14060799003|35042699022;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?ymako57m45TFITaDcxe8jeGf/l19ukSrhZ/bc4NCiCnICr3qEDW2A8T38A+B?=
 =?us-ascii?Q?DURe8Y9k5PVYr7RlEXO/yd898p3shF+aCWU6STIBfy+GJ9sUd014xpAeaw5h?=
 =?us-ascii?Q?GAKpg5KXpyRNsIV0SXuz7QwdrxgBC1HIFFD8s3KGGNwPEsgMuwkhqwzrbDwM?=
 =?us-ascii?Q?j16waFDMCh2qrmyVW5cUg2ibpiV0a711XiFyga1UMifmN8TI3H3Rz9jsGmcP?=
 =?us-ascii?Q?O4O6iR0tcNLdgNtYi9ixSaq0r3ZvBSrjPwGQBGRjAsO5sxuCnjzdKrAXGs3v?=
 =?us-ascii?Q?rKeFrxEuilvDpHvL1FMvY5q71FnMK95cT4uSv/6SyppfB1W+25mvKEpOfDhO?=
 =?us-ascii?Q?sGJUEA49jJ/IPFP+J7Qv0xaAHSD5ugOOn7w9O9iWY0OSGcf1UGbcUwCO7iiX?=
 =?us-ascii?Q?b2lE0Z/AyUaZ7YztRy2KveqIqoTv3+RXOvfHYB7hvIfJfvnH18Y1SKVa31DE?=
 =?us-ascii?Q?ESc6OnHRw+uxITxUdHvjMAgRrGcT1BGEd/1shjS5c0BkW/z/Wn96aaUUlvn4?=
 =?us-ascii?Q?O2gjtpbEne/pu5arLsqeNHoyPGKiigVJIasx161L9fDyd01Lhz5yI0lkoEKr?=
 =?us-ascii?Q?P2C/6g+P/2PIaCQvTS15CqQWny2XiWqUWeCcjwHqLiLWCo3iW3PG2ZWGPyC0?=
 =?us-ascii?Q?QkI8VzLntYIROHGM3xKSQzeCbh7NsL/k41foBKHpaFJuJIefo9PfyTjvq4wZ?=
 =?us-ascii?Q?EI7ctCVtyci6s6Hrm9bigTjR9jv+caZo0CEPtigBQJPAXPBR83y40xorpCQ9?=
 =?us-ascii?Q?ufYmV3Ux1mv+v1mV4Mm3Ao3fZGyCHMA5nrq450va6lJOdeYsXQNMZ9bPgcvX?=
 =?us-ascii?Q?r76SOtBtdyZ02z7HzOTRGkbX8Bc2XK22bFcO1RXdTbOzkvJE8RH8pCU+agnS?=
 =?us-ascii?Q?CEguZrLZggGXDlzw0DtQJF7LL4xbWMPpk4n12mBQCz/lwGySkiYXNd18ov7V?=
 =?us-ascii?Q?8mTl5EN1DUHrEB1OVYMMMGLf2qHqmAmcDEnVOS4SfSqmLQJG2tFrtGK+DfpX?=
 =?us-ascii?Q?tm4KDFU0p+X9tIWDMM1KG5LSGE3/2L9EdXuc5FCR8R0oNqN1NwQHBxyWD1j1?=
 =?us-ascii?Q?fP/kgrx/DVzMIvQa2wHnkS2rO4afqrpqaSHX3HDmEXGU5EqH1nESecOQcZwh?=
 =?us-ascii?Q?ktNsz5IngpRNrxcfVZYG98SVITyzUv7AdX6Oe4e6P6w/2miXNybhZghgQ/eC?=
 =?us-ascii?Q?YTgElRmQT3cuLIhWMXbiyNEUols4PmqueHye5p7pQfnA4pV9++0gqhSU51gA?=
 =?us-ascii?Q?ulCVlamrQ20aCjooErsm2ydtHWepIbo6b3/zyEJ6GrL7oW5ZtVbHISyR//Gb?=
 =?us-ascii?Q?z9MN2HaCPiBAreV25qhtGnVYANyWq0zYbs/hi2JKFElGfnE1tfNYSAF66pAX?=
 =?us-ascii?Q?v5gs47yXtuICM+4EJajD7Dn3S7Ixxayj8H1D71tKFGJeDafJ6IYFzJOPS3gP?=
 =?us-ascii?Q?7fluizshsH+P7x3pUW/dUDhEbMbQ4oRSKlp60JFOeSm7LS+UWZLdJVbvnFRx?=
 =?us-ascii?Q?WP8DzoDlHbUPvm/WuXSOLbs/dyBwWsQudusi?=
X-Forefront-Antispam-Report: 
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(36860700013)(82310400026)(14060799003)(35042699022);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Sep 2025 17:09:39.4398
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ec9ea43b-8de9-4cdf-ec1a-08dde97a5603
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DU6PEPF0000B620.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR08MB8426
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 01 Sep 2025 17:09:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222673

On 28 Aug 2025, at 03:51, Khem Raj via lists.openembedded.org <raj.khem=3Dg=
mail.com@lists.openembedded.org> wrote:
>=20
> regression testsuite does not run to finish on musl systems, some of
> the issues seen
>=20
> * python is OOM'ing which is fixed by asking for 8G memory for qemu
> * It hits the timeout limits of ptest-runner even -t 2400 does not finish=
 it
> * Use make -j1 and running run-ptest script directly ( outside
>  ptest-runner to avoid timeout limit) causes it to run forever
>=20
> Lets disable this testsuite for musl systems for now.

Is there a bug filed upstream that we can track to know when to enable the =
tests again?

Ross=

