Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C52C3CF9C6E
	for <webhook@archiver.kernel.org>; Mon, 23 Sep 2024 12:59:53 +0000 (UTC)
Received: from EUR03-AM7-obe.outbound.protection.outlook.com (EUR03-AM7-obe.outbound.protection.outlook.com [40.107.105.84])
 by mx.groups.io with SMTP id smtpd.web10.35894.1727096386978654891
 for <openembedded-core@lists.openembedded.org>;
 Mon, 23 Sep 2024 05:59:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=ewFOGggi;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=ewFOGggi;
 spf=pass (domain: arm.com, ip: 40.107.105.84, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=muIbetZvm1c5UFE0xEC0Qg+n+vTp6BMfQrvhkrw3ujOPRmYVUm+OsrsySrFdJ9JaGezGZEZCeCAoL35NuojfoJPnlM0YjzTIM5FLkk2sIdd1jnAZ2lVZufGzOenZ5zeLHwBmlshsJZWUs9UaysuBYdRprl25oZINsxfIcJgK/o4dNUklW7VEgFRgbtHUws6AVby3Fkq7wB0ED6ZkLbWwDQAtXAJKz0Zrv+4aSIhTleKiK0fOsPttgg/CDtBDnvr1KZDd1kSKRVx/sFFNEe+JOcvBIFEbn5tc7endfyPzGqDK0W46ZFWM2dgHVY5LQwQyg6buUI1d1lqg2/1k1rAZKw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7Qwpp2GToP8AiRGcrofsvpeC5ayAK/IIInzck7qexWY=;
 b=v2FW5hC2zmiRPK84+2H75f2JG1Lb+u5FYbAkOXfcbwOXKwxI3h/Ia6Ll2DDH/LFxIrQg/tUnRuk71SmiVdzTEnruNdOQAu5j+NFk5jjGzsKh7j9L/w5eIaIyvMKOn8qhReQ1LCRH7gMPG9grodVycXngGfk2ZPeWPQv4vq88+207n6I5zHzr/BXFb+hsVc9Ytkin3k1umTqvEHwTsh0bJ1L6nrSDZW3FuODM1cnFCxZINjZinfBdqA/J88jds9yiF69QXHTFa9TFaYppWmVINWjx/qCTziqB8k+sEJE/+NNo4Srra5OT2Lg7G6ai1/ih6SWssH8o5sVR3R8n0IjiNg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7Qwpp2GToP8AiRGcrofsvpeC5ayAK/IIInzck7qexWY=;
 b=ewFOGggiStAwYI1IeKbgMhsYn7RC19JaTOCGeDhCZZcglxsT4yY8N6xwS4JwZ0PozXJ2Mp4Sz719abFMGMy19zBjs9DUE5mSJLoOXUbokNtE5pKG50q78aHhwcyhy6OxWECH3C68rNMUUef/TBUSJ5dDejpVzKS8CiLiPXn+4Qs=
Received: from AS9PR06CA0727.eurprd06.prod.outlook.com (2603:10a6:20b:487::9)
 by VE1PR08MB5613.eurprd08.prod.outlook.com (2603:10a6:800:1a7::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7962.17; Mon, 23 Sep
 2024 12:59:37 +0000
Received: from AM2PEPF0001C70B.eurprd05.prod.outlook.com
 (2603:10a6:20b:487:cafe::16) by AS9PR06CA0727.outlook.office365.com
 (2603:10a6:20b:487::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.25 via Frontend
 Transport; Mon, 23 Sep 2024 12:59:37 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM2PEPF0001C70B.mail.protection.outlook.com (10.167.16.199) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.7918.13
 via Frontend Transport; Mon, 23 Sep 2024 12:59:37 +0000
Received: ("Tessian outbound e9f81699740c:v465"); Mon, 23 Sep 2024 12:59:36 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: d1d7fa74e5bef119
X-TessianGatewayMetadata: HGT0xxq1ahxreKfK/+0qu2TIXxX2BkQLejs2I+ZKD0qGPm+Q7lbexiHsVcNCAg1KRCBCvDV5pGZjwOvTYgnQITrg9W1i84FhW6WgZavwDIxq13WyDOyzA9UUsWHVnmTN2SNFl3yQmzL0kT7VOGXYY26qxIlOjmjbPXL24sIZu1I=
X-CR-MTA-TID: 64aa7808
Received: from L7a2c2df0001c.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 7B094632-0C02-4B9E-928A-2338BF54A2BB.1;
	Mon, 23 Sep 2024 12:55:07 +0000
Received: from EUR02-AM0-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id L7a2c2df0001c.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Mon, 23 Sep 2024 12:55:07 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WQFljgAgYo/HH+LI4OQz84UEsMq5nt9KqEEldXo3mH6oB3qC3Ziet9X+o0ncPFU+1HFW0VClLsXbDKBoN845oRQu8oOKtTZVCOvJtUUIQD5uiY1yvCbtnHylw+d5GU0wTWxRMpDyZigPum96cgf6NwmHOI9WZhEILTX2gkMhTKufo00qB/DvXT1ybwCDVZ1fHgFSfVLuCNQbHAKdOXNuhYoGnDv+qHs6nPBUXWDGKqVHX/Cxwr9bJs2I7iYpdA/7jmzKjJkxfAwKRIhBIUYZXanHwAVzbX2Qdi6WGnBV0Z1lw6JUUt1NeQfqnJNWfFuVOr486kQAixVnLuBp5eflaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7Qwpp2GToP8AiRGcrofsvpeC5ayAK/IIInzck7qexWY=;
 b=GUUXe/QjWR9HGmQ0X1NjuCO4botFbRCtvcg/ooV1nqxlqT7amqWGAg8Yj88LMGSZA96FjG2oCeY6OL6hsVMMthrH1neFNkP0oU1VSx6TG78EyPaf7K2nkSwNe2fr5vGXIhFwszvFuKAFio9YR5DVz8W6xrytCtV6+YxdE3uhvLUdKnjmGUskf+J5+r8DFENmALkKKMv1ycYE1n/aDkZGyXrwzcsqDazj1leTIKT4iLTXMPyCpDP7vpvWsuHQOfekDIDZb3dr3NXupQb10E3syAbUy87K/kvx6lBS70z1lfRfoMxs7MJoUDcCSs6Q61OVS1zou59cigJfGVUUQs2vfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7Qwpp2GToP8AiRGcrofsvpeC5ayAK/IIInzck7qexWY=;
 b=ewFOGggiStAwYI1IeKbgMhsYn7RC19JaTOCGeDhCZZcglxsT4yY8N6xwS4JwZ0PozXJ2Mp4Sz719abFMGMy19zBjs9DUE5mSJLoOXUbokNtE5pKG50q78aHhwcyhy6OxWECH3C68rNMUUef/TBUSJ5dDejpVzKS8CiLiPXn+4Qs=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by DU0PR08MB9800.eurprd08.prod.outlook.com (2603:10a6:10:443::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8005.13; Mon, 23 Sep
 2024 12:54:59 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e%6]) with mapi id 15.20.8005.010; Mon, 23 Sep 2024
 12:54:59 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "adrian.freihofer@gmail.com" <adrian.freihofer@gmail.com>
CC: ",openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH 0/3] some cleanup for s = workdir
Thread-Topic: [OE-core] [PATCH 0/3] some cleanup for s = workdir
Thread-Index: AQHbDQhCE0A2pDsjnECbSUGt82Fjk7JlVXuA
Date: Mon, 23 Sep 2024 12:54:59 +0000
Message-ID: <94775D52-81A5-4B96-B6F4-296731161D51@arm.com>
References: <20240922155810.1139539-1-adrian.freihofer@siemens.com>
In-Reply-To: <20240922155810.1139539-1-adrian.freihofer@siemens.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3776.700.51)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|DU0PR08MB9800:EE_|AM2PEPF0001C70B:EE_|VE1PR08MB5613:EE_
X-MS-Office365-Filtering-Correlation-Id: 9697d026-e796-4e3c-7d2b-08dcdbcf9443
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|376014|366016|1800799024|4022899009|38070700018;
X-Microsoft-Antispam-Message-Info-Original: 
 =?us-ascii?Q?6yOtNrx/drixLWMfuRYGSWK35Gd62dTBcgfiRb8/wYHSPts4mqGKp/Nr7xo8?=
 =?us-ascii?Q?rCF/YSFdc3ce8nmyx6tQOqLQY1ofZSDlp/js2YHDh5M3nrKFDRGcc2IBOg4J?=
 =?us-ascii?Q?IGzcnqiX46ctto6zuTfqV/+9SFCN1GIFRs5tLFXR3aZqdQvxDxMwWsRTQ6Ev?=
 =?us-ascii?Q?XXkXDJzFAwquKlCAdPoFn7Gb8h4wgE/+RsVIwhTJ2EToUHujGJqpM/PoYoch?=
 =?us-ascii?Q?yNJqGzHdsyX6JjndVgyaz4W9m33jOxzYFaUtKqAfDbUCL9lyV+s3+Sxq0ZEU?=
 =?us-ascii?Q?ghIknTtiAxdPyeIGEwGzQxtqrPa7Vno0j1LCq7LCRJj0+AeHfEK8iX+bS/UD?=
 =?us-ascii?Q?Ni4qCsXtU1Km6xBgqiwOUUntv87o/YKHIdTHeH1R/maO56/hqLrAh58iKeVV?=
 =?us-ascii?Q?vteFDPDdevjAjj24syDlZopoRgeaqR2vvHjWOh/SWRxFbnm6zD5NagVNxg8+?=
 =?us-ascii?Q?qPIeC2Q9vGPnn0YF+EkQxOiit77xGbt085w9DRwSp3iH9okJxXQjrRHJXDxB?=
 =?us-ascii?Q?7+GVL31oRLYx7E5nrYA0YkFgN7zMr22uzwfxCDgzXROwQOs4uqiub3nJ4fxG?=
 =?us-ascii?Q?FgOUcbxlddGgO8S++lUKzccv0TrA+93t2rSYhhkF9sWPW6CEBV3ioQw+M30R?=
 =?us-ascii?Q?LY7qjbON/YrxVsT88vwkrsGlnl7qzNARU3PEXCvLE27mp7MrPhKlOJO5oRIi?=
 =?us-ascii?Q?mcFvAmXuvguBOOGfA/snxPFt3RjPhuhGOF33cR9xTwYxwjn2xeL7WkE7iu/4?=
 =?us-ascii?Q?offAAm3bAlsZ1+tFliysLX+NGRp+mCJvKrjnekdEelMYLaD/rVqJF5nVjTko?=
 =?us-ascii?Q?8GLD649cjU5zC8OTq4x9LU9GKunshG5kguRdGP2XwmAdeaFR/y8Eoc90HkG6?=
 =?us-ascii?Q?A30iQv6WnhFg4zO74gMLdvUHSoZh7XqQsmhLLmtRws4Ep/e8EWFfJR4Gyos2?=
 =?us-ascii?Q?QdrVCLXQUqytPfRhTAiqd/h2SU32db1k9A3nirnT/UwLFHLWIcqquqwdQoGR?=
 =?us-ascii?Q?Salq6mhw4VKsnYHVGbtzH2iwPtm5ztgKWlblrTr9JUhuaWhDlBJoQYXZzQTt?=
 =?us-ascii?Q?C2NxFJ01YythAw5ksQse4kfY/HWtekKUdUkGKQAL/zN3stzLNeX/1/6iNbDN?=
 =?us-ascii?Q?LfegUABUtHNUtbkQtEgqUEDHsT/QSE48w/Q6EozTQO1xsQ8ozk0JovbcHlBQ?=
 =?us-ascii?Q?7U1dzgHP37kyp05dtZzDknB3v96tflqbr6xyAe7SmUbEE8cj0qq37anwQz4z?=
 =?us-ascii?Q?fgASdJxu6amBBV43iCdtD8dH79JUJHYR76MkxGvKAiysYrqR+EMp9RlRLw2L?=
 =?us-ascii?Q?lqg=3D?=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(4022899009)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <95FEDDCCE686574396C283D7795235D8@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB9800
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-SkipListedInternetSender: 
 ip=[2603:10a6:102:2a3::12];domain=PA4PR08MB7411.eurprd08.prod.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM2PEPF0001C70B.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	92e7be74-79e5-4576-ec88-08dcdbceeed8
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|82310400026|4022899009|36860700013|35042699022;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?n2V5YUyLEm67NzI5RCjfklEghZCxSTSX2qzULT24fIhU8RS8Sem8qAMoDgSa?=
 =?us-ascii?Q?vPsKWATkqlgMLU3+fCiHkfCj5zU7NFqmEPavJOrrT0tPtFSik6vnI5YyVHl6?=
 =?us-ascii?Q?3ZlbOK/9ZO1dL8fno0PTyYSnW7nm2teMLD7kAdWPC0xWGJGL7eNGjq2PxxBW?=
 =?us-ascii?Q?5uX8Y7UTbX6EKy7UhBotEKWa+3JsiLWigkCimrDKWx44RdIevnOWkxDr9I/2?=
 =?us-ascii?Q?5mE0Eb5ZmRSJQWfKQQ/PR4BPdRlo+HIVHAf7UbmzD8wWp0ikdfih4MKuH/pT?=
 =?us-ascii?Q?7kOBHgEwTczmdgenWL1c95BHc62BVrk5B9O+qWuD5MPNhNCBKVxrp1DuZ8U7?=
 =?us-ascii?Q?apBskhDV9NSUYit4UhKncS6GTxmg/JtIcGTkwdSfG9uZoZuiFMYRca7IZCU6?=
 =?us-ascii?Q?BZqXoy4Pz9Mz0wkydJN85JXa1Bzaa4yJeP3+gJubLu5Lzgs/FtWFN/AMDV7j?=
 =?us-ascii?Q?aPuxTYnq8wmkPjwgg1qsI8NZ+kvAFPVAER3L424BDiZmGtcxbjmEnnzz3tWY?=
 =?us-ascii?Q?jZZamPQrY/Q/Hm2hsEtSkxKSiMyjGRy94t8Tb2AvBr8zEi0QvxahwWfyXxv3?=
 =?us-ascii?Q?F1G+WrCuCi8RQk2+ccaRgfW0Khb4fF17DLc+zCWYZRZ222fxgj2xCU97uS+j?=
 =?us-ascii?Q?fNgZsPk7WGuLNHZP3yh777C5Pd9r1xV1AVPe1oXSOjd9Zlqq6XMKnlf0oUxl?=
 =?us-ascii?Q?SIew//fb4205ox2sSLVsJN3ue9o1ofFQpkviRW6uVTZK2b4Pe44Aym+5JFsx?=
 =?us-ascii?Q?w4KA6SS48ZK7HQaVc/surK24PBKsZXk5RnO/wsFeBZ9b8x2c8y8qeKm8M55t?=
 =?us-ascii?Q?+wBdtXAdw2fed4nRJhYW43kg8keH8QL9uvyXzLB4dpy6od/vkvUO9veWzssi?=
 =?us-ascii?Q?8Xf9T0OsC9LyGWtI8oO7VWN+7li5L4JuhMmHm2XNQj+XM9fUaAtEIs79sv3e?=
 =?us-ascii?Q?EeT+47kg4z7G0OLxTX/GRpLY5zr8YWCWWKrKED40D+2oA1Mf+lrLxkGf1Dj6?=
 =?us-ascii?Q?DBEXT7YJLsQw0Cd97xP1h1mpsSd4tYVutzCd6JMXKW8V+u6qbUOzBBK5/8fD?=
 =?us-ascii?Q?05Cd44RnshA+sT+MG0nkP96+O7kgUlLADu5G3bIGxKi1OUljhZg5GPWD8hLH?=
 =?us-ascii?Q?TUte+ghNPRLuSt/QsWqUttkFWvPuPhtopV899KAcC6zhTlmql9epC49qm+gn?=
 =?us-ascii?Q?8cSCkKNNd/Axk+kDFL5jvKBxtOPegp/n37hOFWR1cGbL7+krjj3FFiotnJZC?=
 =?us-ascii?Q?IcBORAhF+pMB21xEWiIkGYraAfqHUlKKalJDAVABURT7Jm0J3om+0fQoyiP8?=
 =?us-ascii?Q?GluIdkg6+m1OxSUnnE8FxNsmp3nG3AcEhU0vy8ulLKoWEA=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230040)(1800799024)(376014)(82310400026)(4022899009)(36860700013)(35042699022);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2024 12:59:37.1306
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9697d026-e796-4e3c-7d2b-08dcdbcf9443
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM2PEPF0001C70B.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB5613
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 23 Sep 2024 12:59:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204805

Great cleanup, thanks Adrian!

Ross

> On 22 Sep 2024, at 16:43, Adrian Freihofer via lists.openembedded.org <ad=
rian.freihofer=3Dgmail.com@lists.openembedded.org> wrote:
>=20
> Removing support for S =3D ${WORKDIR} allows for the removal of code that
> gave me a headache when writing and testing. Having 2 paths (one
> direct, one via symlinks) to the source files messed up Pseudo.
> The code that is now dropped avoids these corner cases in a very ugly
> and probably not 100% reliable way. In any case, it was much more fun
> to write this remove commit than to write the commit that added this
> function :-).
>=20
> While investigating this issue, I found some lines that also seemed
> useless.
>=20
> Adrian Freihofer (3):
>  devtool: drop S =3D WORKDIR workaround
>  devtool: menuconfig remove useless code
>  devtool: drop useless variables
>=20
> meta/lib/oeqa/selftest/cases/devtool.py |  5 ----
> scripts/lib/devtool/ide_sdk.py          | 38 -------------------------
> scripts/lib/devtool/menuconfig.py       |  7 +----
> scripts/lib/devtool/standard.py         |  3 --
> 4 files changed, 1 insertion(+), 52 deletions(-)
>=20
> --=20
> 2.46.0
>=20
>=20
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#204789): https://lists.openembedded.org/g/openembedde=
d-core/message/204789
> Mute This Topic: https://lists.openembedded.org/mt/108592484/6875888
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ro=
ss.burton@arm.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>=20


