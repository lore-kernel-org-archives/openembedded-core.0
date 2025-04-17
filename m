Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DDDA0C369B2
	for <webhook@archiver.kernel.org>; Thu, 17 Apr 2025 10:11:46 +0000 (UTC)
Received: from EUR02-VI1-obe.outbound.protection.outlook.com (EUR02-VI1-obe.outbound.protection.outlook.com [40.107.241.79])
 by mx.groups.io with SMTP id smtpd.web11.5290.1744884706104797974
 for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Apr 2025 03:11:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=qm18Fo7J;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=qm18Fo7J;
 spf=pass (domain: arm.com, ip: 40.107.241.79, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=b15l3peAgqAh/u10BFxly38C8CrWhT8KaNWn8jYqXXwKTe6bdQftXyLqTs206Z4xJBH2QIth4hl3Oyil1+y/1834zoXAsx1saw1HDgGjSMa1rti6pQxKUlFcVa2L6xODGzZjUJkjvEIs2m5+/XCpDH+pAQXlsrI3jJbJKRuBOLNICH2HiiKlRviRBgXh1+fjeSGhIoKzl1OWR1JS4BIPnN8emDV0o037HLz/b/NUA3qOgK6itZJ8I0yDF+u1iE/YLgkmbDkBnan5VkmuOs478oOY4i67/8xy6en01CSYjw9SJjSx09mXTk+kHYxt2prXGlW4c15TuqpChSkt3iWmkA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cu9wmbU4j3YsG3ZnK4ZO8xe7K9SbjGYKgraq6kvYAec=;
 b=lVJCNuJ5cZXv5fzPBzLDUa6XDyaQ3n45fKF8M99L5CZN4ahMFJtk6sPvPNVe5+XWXgAA/MqhlfzpMTVzRFzby+B3Q2ihyQjpWNPasgR+vPvcr4bwiKjaZsBziv/75wCuR/mDHEk3UQyjUdAwdeA5BZXSU10XeZYXy6oJBGqIXMNqLQbtydiOf/UM76soLvDdVNbcJmdrZhcOt1Qr5fYgj2XUAZ1SQ6sx3cBYVtxWy7kBsch0nnLjNXtDO3WgxUKwf7D7La+ojRM/Rrl6rHxNbjGA+Pfp/NZKJF9KiYYIZAoHlXIlJgQLmAizXZODmYVi+x/SCZJ8Ck7K/YVOHdqwXw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=fujitsu.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cu9wmbU4j3YsG3ZnK4ZO8xe7K9SbjGYKgraq6kvYAec=;
 b=qm18Fo7J6UlVu0GtiKeDlyzOKKXVQWfRbUjx5cfh6PTX4loPdQBVaVp6lS1t1UuXjj7dTkco4SVMM6gcrWrqJqMgsH7Xsxn/Cufh3+PZjbbNx0xBP6SYX0iQ3QRNYD7sBUC9zwmxTgidNlI6blKwbB6MS2mI9YtIBs4Dwa3wUuw=
Received: from AM9P195CA0020.EURP195.PROD.OUTLOOK.COM (2603:10a6:20b:21f::25)
 by GVXPR08MB10451.eurprd08.prod.outlook.com (2603:10a6:150:159::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.33; Thu, 17 Apr
 2025 10:11:42 +0000
Received: from AM4PEPF00027A5F.eurprd04.prod.outlook.com
 (2603:10a6:20b:21f:cafe::b) by AM9P195CA0020.outlook.office365.com
 (2603:10a6:20b:21f::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.18 via Frontend Transport; Thu,
 17 Apr 2025 10:11:42 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AM4PEPF00027A5F.mail.protection.outlook.com (10.167.16.74) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.12
 via Frontend Transport; Thu, 17 Apr 2025 10:11:40 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LQMp3CL7XGxlJoHbiPTYrWp4Ol0cZpV7yxrm7jfR5fql4JU0KJ5ES0X/9DlCVV7JNPGQB2WGfu9j0eg0pKvEDddrvWCn0J07M9VZ7RDay++pJq/yAOzl2HUL/jePFPfPYOZk5BUMaHuZ37aZOaOpnTVV9bUoyt/Qm2pQvpPS1f9p2NfABr9kPAdpJCVkUfklfjVZ/zpqU5OmBI96t6Dg/ANvfOUE8e3EG7SN7k0S6btOWhmaYWb3q1SL4j6bx+K1kaaIkLvHiPLK9RoOBUhq/aMb8quTN55j6JDkn6oIYhfHZZENCrfsmuuWiwcPv08gxXLJL2KrQanrFdyhNm4gRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cu9wmbU4j3YsG3ZnK4ZO8xe7K9SbjGYKgraq6kvYAec=;
 b=YopMJvzE4fJF8/c0Ah/PPu7PowlcFhDHa1jtpsS6+UhR/su/LbhrDnrdqFJdUxgFJ1yzKPLUVurWMMuknrTqs9IrRisIeN9WJLX56yShlphhG5fqAE3tLasNeihNKGuFomgkO0Is38FG+1OviChjG30tEjN8TkR4G23N2cUKKWaIv/sq++6u3fKkcrPDeaR2txU+697u/SHgLDH7EEtq1YNBm/JQrOfwaKZp0QXq3Qp/vIs+OYe0gYM8AsU4h6JBAAeS4DVmcxwwPR6sl/Gzu71ClpW77q8jwN2XpDztOxrO6ljmV0A1eTRJSK1E7z5a+CmKPdjsZKJ/1sWLKvnJdA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cu9wmbU4j3YsG3ZnK4ZO8xe7K9SbjGYKgraq6kvYAec=;
 b=qm18Fo7J6UlVu0GtiKeDlyzOKKXVQWfRbUjx5cfh6PTX4loPdQBVaVp6lS1t1UuXjj7dTkco4SVMM6gcrWrqJqMgsH7Xsxn/Cufh3+PZjbbNx0xBP6SYX0iQ3QRNYD7sBUC9zwmxTgidNlI6blKwbB6MS2mI9YtIBs4Dwa3wUuw=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by AS8PR08MB9387.eurprd08.prod.outlook.com (2603:10a6:20b:5aa::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.32; Thu, 17 Apr
 2025 10:11:07 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e%5]) with mapi id 15.20.8632.035; Thu, 17 Apr 2025
 10:11:07 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "leimaohui@fujitsu.com" <leimaohui@fujitsu.com>
CC: Changhyeok Bae <changhyeok.bae@gmail.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH] ethtool: upgrade 6.11 -> 6.14
Thread-Topic: [OE-core] [PATCH] ethtool: upgrade 6.11 -> 6.14
Thread-Index: AQHbrrP2j489Or4F1ES6udkqvW2fArOnpJ2A
Date: Thu, 17 Apr 2025 10:11:07 +0000
Message-ID: <A83781A6-2965-40E8-954D-96F1C3E3493D@arm.com>
References: <20250416094249.717-1-leimaohui@fujitsu.com>
In-Reply-To: <20250416094249.717-1-leimaohui@fujitsu.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3826.500.181.1.5)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|AS8PR08MB9387:EE_|AM4PEPF00027A5F:EE_|GVXPR08MB10451:EE_
X-MS-Office365-Filtering-Correlation-Id: 6611296e-d9ac-4933-3e70-08dd7d983f75
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|366016|376014|1800799024|38070700018;
X-Microsoft-Antispam-Message-Info-Original: 
 =?us-ascii?Q?hNn1b9QZZSmh8VcCbPFrXDNNHMru64Wv79pWSSys8QlFPrAeOfCOBmBOb0Ao?=
 =?us-ascii?Q?S/lLpuNDNLJQu6jvk2Ypap+9weEJqMAG6QlvnJBrEdcsAUyoDQH4KhQ6EfmU?=
 =?us-ascii?Q?Qc0xb6PjI9HZReYbI00+fGV5clIMJbsHKeBYZlfcBjTks5NtFN7VGfaxGgXC?=
 =?us-ascii?Q?D8Sr3jDwPgm8DrEbBxHVT+g6RnfhTsNvrgCRORs9Z/hQQTErVp2CfGhWqYj1?=
 =?us-ascii?Q?bI9PvFdHLRMqtffbvFdj04jIaCh/X+nTAu/xhc0v9h5/qP2km/IL0dG/Gkuv?=
 =?us-ascii?Q?o8HFD0ow50+p0tU+K06pbwCYWsR96ZT1TX1FH1oNOHwvKtbtM4qX/9mbjVrB?=
 =?us-ascii?Q?H2iYZC7mcRs76JimHLPeXCJM+4aLib9lUzfNSpXe4yLuHt0xbFq9qmcZ3WvQ?=
 =?us-ascii?Q?SCwGPASnQe3js6X7Px6Be0SX7AEiLednDPcyYyu6unjAaAQXQGLwcmILIPqm?=
 =?us-ascii?Q?G7JcdD1kuzcrg55t5N9mfv3papeuu/3RPmP/yPZrVhKk85mGNUF6H4wT7m9g?=
 =?us-ascii?Q?pC7VD3H08Tl57TP5IVc51eSA5dLyhzvQFUUFz8IxU+Ly/SA6SYtd/N7dU0V6?=
 =?us-ascii?Q?b87Y1upMWH8lse43TtgCDzxnBDts+l6rQm2EcGeUS2hDGafieLLiKSTQ/oYF?=
 =?us-ascii?Q?+lCEg6QnqtaJipxgwXCe1gatZAQOFuRBxRD6iQz6JdgUE2wUxrMx/wLzRKAW?=
 =?us-ascii?Q?l+MV5Dp3xwF1qWDEPSKkUPebiwRNh30yk7gUCytJ2oSXuJsCEeFdfWmXbXbK?=
 =?us-ascii?Q?GoE4CWnbakrXv4JWyu4uJvp1iD99r6zc6j7BTBlzjL8p44lkmp7UXvO5dwTK?=
 =?us-ascii?Q?ZPS6Y38xR5lbrcVs06qsV+0RhHl97F3Cec2iUe6lGflq8Lfb/Fepz9yZbuNO?=
 =?us-ascii?Q?gUpNPMBLhU0nRHRzr6G/OYgGO4JfiqwaFw7MUcrlMt8WJTaBPXfqPtV6EeTR?=
 =?us-ascii?Q?LodMkjfGbGz/Xd/hpnAujNxFnPw4ZphVUyOKd37ssUFnq8MMFtzuqTYGIdyN?=
 =?us-ascii?Q?LJCgmkpQAszkumH7vTfmsu9PuiQCLzwbcybEjUbkl0UWrotRqUCry1vqp6Tr?=
 =?us-ascii?Q?tygHr913DzsFX+LgCSCEs0D3f4qTm4+CMjgjdtAZFzY5hbUE4/G0UOkWbqdE?=
 =?us-ascii?Q?lcn5W9UZyQyDw5+o7r6AZnU6j+qb5UKC+hhmMC0gtsYyXRFtX++pXzlZC3Jo?=
 =?us-ascii?Q?mumvpwLwID45mNaNWpc7/TaIUOQxTKnOz1Kxz4NnWD527t0hMBnR1R6IP6IE?=
 =?us-ascii?Q?qQfS9NOYa+BZt8N1CQKQ/DErz5pLXvXB6iSGhyJhIaq5biOZ9S7oMi6NQBuN?=
 =?us-ascii?Q?Qe4QonONjPVUbV+zh3a31GYNayrSRLTIQxMLh+D5KKNuBf4ktIFIPwkPjM6B?=
 =?us-ascii?Q?TJEudwLT8KaieKQmT23dop3CKvDntsLyy5CuuDZUMicqyrYS0sOECRRvGA2u?=
 =?us-ascii?Q?2zSXlSl156sILxiw2uZAZreOYNXKh952PzZ9GAtnJHE8RZ+S/+I1Ew=3D=3D?=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <94B57EC198AE334694F6A02D83730478@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB9387
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM4PEPF00027A5F.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	a23ac3ab-fb43-4dfe-b76b-08dd7d982b91
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700013|14060799003|376014|1800799024|82310400026|35042699022;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?3ztBG3/qGuE4/0yzqL8+sq3y53ojl1O+QXm7Plww5kAuyB80mXBm+Z/OFYx1?=
 =?us-ascii?Q?qoi/OUyPzBj6+iziWpOYtO6CWkkagE8XXTXI2XAknvRjvAL6GvTcYL1RiyAp?=
 =?us-ascii?Q?KaoktoIhFTR6DWV8BXmM1ZPWfictpsVnks2zJ9guFCX9Vg0F44qUBh/wDvoG?=
 =?us-ascii?Q?lYLPl36BS5cJFPS/iokaZrGn1DhX6bEDaDBPpG8fD7NRIWPP8c9Ntimyofnq?=
 =?us-ascii?Q?b08XlaMcKM87dIt7WqVOl79wPcejPJBBsgGDIh6PBnsqSc0gb1qeXZkhe6h2?=
 =?us-ascii?Q?zDhD6j7IMkXHWWZ9pudfx9uoQ/c2EdJkLNo2/iCtaOiCjWIzPjFtkOoA0JSU?=
 =?us-ascii?Q?vERGLf84/jQC7NE5xyJoNOgLxwU79K0DxeNbjhpYo52tEU4AITvRflLApRr6?=
 =?us-ascii?Q?TxI0L6GM9gXu8PUSBq2fBSVCOwQJpGdEshhpfG72FtZZTQHSb/JlQ6ZTeJSb?=
 =?us-ascii?Q?7tjcUvVK+iMAVgl3IDcTGL5q67/+GeFvw1pSBbTaUgsBdLNuARtaYBO/pram?=
 =?us-ascii?Q?+waTzhjBYvvTyJGUwxjuWNCXRBYZGiubvfSnyGN8S13O7+YxZ9BxERytOfrE?=
 =?us-ascii?Q?rZarULZcUR/PIbJClWNqLN4lW4EKmb2morEotBu8Gt7wdgzTA6MJS3Vt6JSv?=
 =?us-ascii?Q?DMohmjcY1rf32rBoVp4ARRvtBrnOL/mF8z4V1KKEE7oH+mIXjaAfxsjhxwIB?=
 =?us-ascii?Q?ffvAT4ClYwYKoCRWsMSsHwpZ1VPxPuFM9fQkAz5O93TyH79VuazzcDFniJfc?=
 =?us-ascii?Q?KEs/HNOUMTQTY9PO72D0J2OIHn9ysHJGjze207Ez1DOtH37AN6hWnHvGh3C8?=
 =?us-ascii?Q?hFQheQXyhQWuGekHOpXreI0rceMivLUUPI21GsCgO/k+1nUR/Xq7pkVrLExn?=
 =?us-ascii?Q?drMCmXtkB11/1eV0gEcfb+aB3GHt5jGMclngI50conuT4aM7waulBcoitkyD?=
 =?us-ascii?Q?LDjYM5S+LfKRAjtbthdg7NcJ9wQgevZ9tQfZoA8bep94+ic2Mt37JtluoUH2?=
 =?us-ascii?Q?XloR1STsI3gRKFMjAcBf/QtyfvS/61a2TN+5+aEmE2motldxIDx5lcjl6ov0?=
 =?us-ascii?Q?8MtZhOS758OEGixzIDdJMY1972zCyCX+h9UC7zP5B14HcqLctosAytlsHZeM?=
 =?us-ascii?Q?/OoxFAmu5OMArTXFOXjiF7tF/9FtpXdV6EG8AusHyP5tsJR/uqeWPKxwyj7f?=
 =?us-ascii?Q?pY7NEOg8enJwPXF+fAkYYdaL4BngcjXcLYOK9eOOX914KW5dmUcrrQB1K+No?=
 =?us-ascii?Q?zCJPLWUd+HOuz4DOti5A7BJAAcoAB7kutayo+jyzMUge3KamrR19bhwCVQtL?=
 =?us-ascii?Q?XyYfufJ8DsiG5Jewz0KS45btWK7n7gbudeoDf75C09LJhkK/6HTriMthN9lZ?=
 =?us-ascii?Q?p39131c37Zi2+GBq5e96bPFLYnXQayXFGqk4HtMGFtM1LRTCls2j80Qu8bH0?=
 =?us-ascii?Q?8XTFM7iHaE1kz0H6X6oWS1LZduOcSzghLMIaiwm4MFj1hVhWLq+qJyLloqqv?=
 =?us-ascii?Q?48P1zx9nQHsclvcBzwnhEmyrKWQuQ/hsQY+p?=
X-Forefront-Antispam-Report: 
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(14060799003)(376014)(1800799024)(82310400026)(35042699022);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Apr 2025 10:11:40.8690
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6611296e-d9ac-4933-3e70-08dd7d983f75
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM4PEPF00027A5F.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR08MB10451
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 17 Apr 2025 10:11:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215053

On 16 Apr 2025, at 10:42, leimaohui via lists.openembedded.org <leimaohui=
=3Dfujitsu.com@lists.openembedded.org> wrote:
> Package metainfo xml to doc, fix the issue that:
>=20
> | ERROR: ethtool-6.14-r0 do_package: QA Issue: ethtool: Files/directories=
 were installed but not shipped in any package:
> |   /usr/share/metainfo
> |   /usr/share/metainfo/org.kernel.software.network.ethtool.metainfo.xml

This .xml is for AppStream, and is not documentation.  It should be in ${PN=
}.

Ross


