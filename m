Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4EA3C25B77
	for <webhook@archiver.kernel.org>; Wed, 22 May 2024 09:58:42 +0000 (UTC)
Received: from EUR02-AM0-obe.outbound.protection.outlook.com (EUR02-AM0-obe.outbound.protection.outlook.com [40.107.247.82])
 by mx.groups.io with SMTP id smtpd.web11.6205.1716371918418724905
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 May 2024 02:58:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=MQmQjVCX;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=MQmQjVCX;
 spf=pass (domain: arm.com, ip: 40.107.247.82, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=TR/lHj7g2BzTlfRsqo7JMH1WFd3daKCVlgdRzk+rLs1n6czMi3Cp/XBF8ZgSFHFh28/I68+NfBHbN07SemN+IDufgCQqUI8a/yrx7f0qjmBzFQl0dgpBLPVMpeAycbLFsHzVDh3jsbpg8Oq7OON9AqtVLnCoCPVFfpLXTB2NRuVxR73YoJPU9iQw9Im7kqhTGD7+1BKe19jwKh2X5i8fpSMgPyeW56op9OJFGoStAhFU/WQN4asDh6w63err0S2yFEVhDQIcax/ocUqlo4R8Nh60vzLspPyEwP8RhHYz2ci2L9cXLnDm2//k1FC8+qs1lElWwSfQTjUZVYIjUkvjkA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pvJlPy+H+JLFhFVrpiKYMIrx/pqiX212WXRnzWgoVak=;
 b=TJ3WlPup0H02lVrjtuw760Dz3QvI7kuqDcLyQlH5ECsTxohtXzH0qojSGBgWvyApq0j+XpKi+W/NCBxpF9aT+5NUf10EBmHVNhENmVm9TOwr/VzKqYjvIt2LdVPshmZES+Cndglru7Amf3/aaeI+dripnAxsdx3bBjw2yM+u+GD0uDkHwBdzXqcZszFWy+4wT6xdX7sZztCf0ytTGmGfeigzuRNkso/w0YuyLdQUTkU3m5isAU+jEh6aBxNp4Eupd+WYt1Yn0+eKXqVvLYXOTIT8gsZD4E2o64eB1YEUAGsbmpun6O8f+TnHZgaLUHKLT/D8PzzbPTA2Wle29UgxWA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pvJlPy+H+JLFhFVrpiKYMIrx/pqiX212WXRnzWgoVak=;
 b=MQmQjVCXOB/QD72GxxUL8ssPkQq9qJVbnmDwG6fFD3zATYNmJcdmCg6JBkoATZOSUt+rd0kf+LE9rySQ5/1DCFE2Px+PdY/hEGh9UrWs57Qs0rrUUwHWfb8pzHKYaXQqNpMxmYd15PD8vOSI+CLEYN4lk9NpDa3QoYYzHWAWTxE=
Received: from DU2PR04CA0233.eurprd04.prod.outlook.com (2603:10a6:10:2b1::28)
 by AS8PR08MB6456.eurprd08.prod.outlook.com (2603:10a6:20b:336::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7611.19; Wed, 22 May
 2024 09:58:33 +0000
Received: from DU2PEPF0001E9C2.eurprd03.prod.outlook.com
 (2603:10a6:10:2b1:cafe::33) by DU2PR04CA0233.outlook.office365.com
 (2603:10a6:10:2b1::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7611.19 via Frontend
 Transport; Wed, 22 May 2024 09:58:33 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DU2PEPF0001E9C2.mail.protection.outlook.com (10.167.8.71) with Microsoft SMTP
 Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.7611.14 via
 Frontend Transport; Wed, 22 May 2024 09:58:33 +0000
Received: ("Tessian outbound fffbb209f6c2:v327"); Wed, 22 May 2024 09:58:33 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 92ab3861414ec1c9
X-CR-MTA-TID: 64aa7808
Received: from 427484180d8c.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 6B22964F-4FC8-4B31-9739-5F7147FC1996.1;
	Wed, 22 May 2024 09:58:26 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 427484180d8c.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Wed, 22 May 2024 09:58:26 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dqULv/JMRRlfduqoCTARyloA0hj9KP90lpRT5j4DKo1toZ7Si+WOsdhg5jPEtOIUYzjfLXaHvLguvU29VKiPgp8lPh5C5wuh2no7z+8/vGgPoApKDOAnUlieQFk1aYO0ph5hpB4dbiZ9NHYkXtwMHpy1+8pBiIH9sOS1DAlc7jtgYLdFso5fzwqMpvh782ICXfRTwmBhDeTgAjJid0w2OBj64B2EA8bGmfcYg+8I293YlTiDP1gpblk26OqKs7htZ3iNmWI1O/J9WGmi6GPIdrxDK7hKdJ52ux/Pyfne/L7Q+0Pev2dFtARO0DLVa5ziTISs9kDhjS30+6rTqINwnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pvJlPy+H+JLFhFVrpiKYMIrx/pqiX212WXRnzWgoVak=;
 b=KHZ6/PdOWo6cgh2fyc59jXi9Ac9alAN7fvp5GclZE9xdSypjaO9QNPX7opk8zxuGVI6Z45TefljlxSGMAIGsvxu/VBHDIaW2D3od33zsMn5+Hwf+qXo2QDCQPMBYN+vif2tiZ9Aupy8dJNQpach1lhbCnPEMPp4Zc5yt7hI8iHLfEo/K2Qqd9ii3LP1L7uQRCb7ltKEjIAQZLw5HqB3KogrPgIuUBswLm4u54wdG8ogfXx5iiaxiCdey/qqS3584+y+lH9pO9gwkXgoJ5cXJkPe4eCSWZ/SBo3AJQIe/6wG0INMrosMvL5YEjWMF/s1BOK+HgLWx2xkR607btvq7IA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pvJlPy+H+JLFhFVrpiKYMIrx/pqiX212WXRnzWgoVak=;
 b=MQmQjVCXOB/QD72GxxUL8ssPkQq9qJVbnmDwG6fFD3zATYNmJcdmCg6JBkoATZOSUt+rd0kf+LE9rySQ5/1DCFE2Px+PdY/hEGh9UrWs57Qs0rrUUwHWfb8pzHKYaXQqNpMxmYd15PD8vOSI+CLEYN4lk9NpDa3QoYYzHWAWTxE=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by GV2PR08MB8317.eurprd08.prod.outlook.com (2603:10a6:150:bf::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7611.20; Wed, 22 May
 2024 09:58:24 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e%4]) with mapi id 15.20.7587.035; Wed, 22 May 2024
 09:58:24 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: Khem Raj <raj.khem@gmail.com>
CC: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH] gawk: fix readline detection
Thread-Topic: [OE-core] [PATCH] gawk: fix readline detection
Thread-Index: AQHaq5IR9U0v2YGYMkSTjpGALppwarGiO/8AgADJ+4A=
Date: Wed, 22 May 2024 09:58:24 +0000
Message-ID: <7D72E0BE-39E2-4604-90FC-3FC898CE9B2C@arm.com>
References: <20240521151739.591124-1-ross.burton@arm.com>
 <CAMKF1sr+aDaN5FpbpUVeWa1pGmCKVb=7Yynd+S7iQu83dgoNrw@mail.gmail.com>
In-Reply-To: 
 <CAMKF1sr+aDaN5FpbpUVeWa1pGmCKVb=7Yynd+S7iQu83dgoNrw@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3774.600.62)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|GV2PR08MB8317:EE_|DU2PEPF0001E9C2:EE_|AS8PR08MB6456:EE_
X-MS-Office365-Filtering-Correlation-Id: a29dde3c-65ca-4015-047f-08dc7a45bdb9
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230031|376005|1800799015|366007|38070700009;
X-Microsoft-Antispam-Message-Info-Original: 
 =?us-ascii?Q?tt59Zv19sl9dwfwCIShoLrwnEkEkWbCR4LpZIFVGuvguS2kyA9r9E2VWtUQd?=
 =?us-ascii?Q?Uu+QgAh1/2xlZCByP1MjqN0s5S0l1vCIcBdKPUFyzTfUwsQuWTCdlr8xFk/6?=
 =?us-ascii?Q?9Lu5lKsFKbs0UX1PNnIk66mHSmkA/v4iKzg5tCRJjif9alBFWKbMe3rJiyKO?=
 =?us-ascii?Q?jPpQxFp5Q4oo35Lgc/q+t9HTL5W8JiwZDBNzNt3ozGj+mRoJENW/XOOym1gd?=
 =?us-ascii?Q?8xMpo3cBt4u83oC2rlV0PSR2VbJzBnZSboFvisl8+UvLZ+FHO4FaG/E3pgdm?=
 =?us-ascii?Q?kUtc3/5Fl4FKh1TlSfRqq5hXEr2duZaqpwHN0BsiOD+YRzWYqk00llfGdKVx?=
 =?us-ascii?Q?dnO+Fu1lAvEtOXVPPnTK3wiu9rY4yRAk19GNgqa9a9rQxLvFBXxWRsk9EMPj?=
 =?us-ascii?Q?y8hRvTDWbtutZ1uFT7oLDB27VNdJ/xqA6WBtaH4maDfKjVz8NXvOi98OZS0S?=
 =?us-ascii?Q?D/2rYzur56VRxRt/7vVpS2/KUOsOhtDzm6LFvHVCbgPocqbPW0S8wl8PcRtx?=
 =?us-ascii?Q?W3FnS3ftB+yCCe5T5k0xYuZKvgz7YjvN5RQyKkVpObYFk5ocjUWtQqI4c09y?=
 =?us-ascii?Q?qtffGFtgXlKmms35s/5c/pyOJnEAF/WjT5sxdnHdr1FsVxM0r+xBWOACohJR?=
 =?us-ascii?Q?UENK4QNwMo3ByRdJu3RYEH4WbhxJ0LCYM/fELx09rQXUEj/9Y0ovAMdgUiQz?=
 =?us-ascii?Q?IZS6YTsFCz7fIHzAHzfHhyZOmW5MbyeNx3aLTQ+FNPoQQt2srCuL23RAKjhe?=
 =?us-ascii?Q?ZC9lZA4/H8uHkHudrgCkzVLfFDaSQqwtmBVKEI0fprZ2G8UqsN04rvGkBOWH?=
 =?us-ascii?Q?9SBf4SiOxcHsqB2xaAZ57CFcTgTs99dkVivbEAB9gsImwUEOWcxw+vhqYJZk?=
 =?us-ascii?Q?oduBqzeF7VB2j6TZ/14Z9suVB6BWBkhlijvK30usonCFwrFr2UO4t3SzqW5f?=
 =?us-ascii?Q?HLUt8JHIokPy1itYkYqA0KSLeXM5dMNwBgOfq0P2ubwcKIjbuNU4WKDaRg7Y?=
 =?us-ascii?Q?vBGeB6uipTx2iZ69rMh6Caqnvm5MyMR/6S30KtzUgM1sshPTUBnhq3yoVj6a?=
 =?us-ascii?Q?sSqCH/h43Atm5/y4wQ54BQopzP75tjuy9QVqjCLx+cFrJckYYqMuMhE9RwmG?=
 =?us-ascii?Q?z+jm3jluxP8kiBD4Yt7poJ3Q6gUPGlVUnWrU/GMWHngfkPHDKDM0TjmMrWRZ?=
 =?us-ascii?Q?vUSY6cp1/DoyafR1Fj33HBjtLPxRtaijZGe7aOnHDIILKWl87lgeZVjEteOY?=
 =?us-ascii?Q?lgWBUntE0r5Y/syL0Aqx/oI9FlGR8MEmdme4xlKtm7t/k6oFAjRMYpV7Mkej?=
 =?us-ascii?Q?J2GCOvzzwst4hu2X5oL6fyN/+ZbPtkD8vURxUhI4fsWlrA=3D=3D?=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005)(1800799015)(366007)(38070700009);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <6D2D7B96E0B73C49B992F4010234FF5A@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR08MB8317
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DU2PEPF0001E9C2.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	179a1328-440c-4bf9-13f8-08dc7a45b83f
X-Microsoft-Antispam: 
	BCL:0;ARA:13230031|1800799015|82310400017|35042699013|36860700004|376005;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?6kCDLpdytrDdgSMInS5uBExlu1++HpFM3xefwV6HGzWORp2awrWdSv1KncDs?=
 =?us-ascii?Q?oBjhWtraoGFyzt43tPunNMEitFosUdoCr4UJ9491L0ATaHUaUDTadnHIOTo5?=
 =?us-ascii?Q?S1mO6CJ++K4HPqxkH+ZGarH7nEZKyE8RV2S1osgsb1IfroMdig5LMeban/ep?=
 =?us-ascii?Q?rYSXYNKF564qZkQFMP8C3BR3oSrNzl0y35jhTuF6xO7jCUt7ep1PE6uYAhSu?=
 =?us-ascii?Q?KWhjAe7ixBf4ECb2nyA82ktxcd605OAlR0ss9DGCsrtN0QudbWeHuq6E9FFo?=
 =?us-ascii?Q?kLqc3Bo7blqCC2hgiH47G0qR5ZcLsWfgKiZZmZH5dls27BzdiItFZfNQ4SeE?=
 =?us-ascii?Q?Aj+cR2m+cosq7kkyPtdAZeENSPQscWGezRLvFjN9mA1wlTCb3UGi4MFpsMLS?=
 =?us-ascii?Q?OKKglLG9kx/bYIWCaHwi145988pXSNnGHz1Ej6BVvsYnifz4iv4DgMP9ut2h?=
 =?us-ascii?Q?EKDLpyzN/jXOC5r+Wm2V2I+T9I3DeYcJTpSUJi44HIi/G83ik9Do8FhQhp13?=
 =?us-ascii?Q?4LjZbd5QNJ3yXEvzDlt6Fn4ujbp2+D79vryXaNyifqnuqCXndUuj2eERByND?=
 =?us-ascii?Q?s37w/4Q46V8nVZpWxCqVnD3YX2Bpgjw5w8EF4k9gkXCZ7zGqedMsIyhfGH9Z?=
 =?us-ascii?Q?JsuY3A1MeQ+qTC2/bmw+iatHGqWonlEobarVkzlI1I8vealk9gmyeA6TrlQH?=
 =?us-ascii?Q?RV1MPry54oBRmTl7bUAJI6zVlCa4JiPMfwigotn7BHo7AlvZ6/+xp+g4V6kQ?=
 =?us-ascii?Q?gVLhEpKpqllJh4khSbvdDCCwckreFijZPnoIZeJljmFWDWbGjwxatuA/i6Gj?=
 =?us-ascii?Q?FDpVasYnvTETWvoa/aJrNpjpK4XAK1Um8l59MthEh5ZhgnMrhIaaYC07e45H?=
 =?us-ascii?Q?SsCXKi8MGVrjD4z6xlciH85UisbLtvzgpVpoB64PgYLb8O6wsYK4z/D4HcLn?=
 =?us-ascii?Q?vbSv3FUlhZv4r8rg77Pe5fXyyUcCz2YnxnZQJICmuPZKWkCg7yW9UJlfOZSb?=
 =?us-ascii?Q?P4t+LmNqCBh32p6N1HCYBI0HUk9dFcjf+eDfK1KmSsEIb+rkWPDTJpKf3KuX?=
 =?us-ascii?Q?JQCgCdrvwDPJ8qfL2I7LT7n2hEn9g5UPpV1vOvzlk2j6DlAeDgPaDaQFGhod?=
 =?us-ascii?Q?fOmrE0xRLNUlHaeklEKnOJsrTKREC9ph+BDZgRnhXURoqfUlmLyfn7HF80An?=
 =?us-ascii?Q?d0dhxhS+uZW+9/7U7yNunBbdJXjUaGVUNsNfVgleKHPfUDePyvxNbMn53/sJ?=
 =?us-ascii?Q?O7psDIVJonqKxrp4mN/FXQzGxt2UDCvDiG1weKi2RRXLXrJ0TLCYRxzLw64W?=
 =?us-ascii?Q?4/buRbiDUNP2bOiZtDuOgwYz9T964QKXmqvKoB57dkFl0aSPV50kr2Cc4ked?=
 =?us-ascii?Q?BAQBgas=3D?=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(1800799015)(82310400017)(35042699013)(36860700004)(376005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 May 2024 09:58:33.4119
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a29dde3c-65ca-4015-047f-08dc7a45bdb9
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DU2PEPF0001E9C2.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6456
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 May 2024 09:58:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199744

On 21 May 2024, at 22:55, Khem Raj <raj.khem@gmail.com> wrote:
> This kinds of errors are something I worry about, where configure may
> silently decide to take another path for wrong or
> insufficient tests. I wonder if we have a way to cache and compare
> configure outcomes.

buildhistory-diff is the easy solution (and how I spotted this).

Ross

