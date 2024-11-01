Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8F71E6B245
	for <webhook@archiver.kernel.org>; Fri,  1 Nov 2024 12:03:44 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (EUR05-AM6-obe.outbound.protection.outlook.com [40.107.22.79])
 by mx.groups.io with SMTP id smtpd.web11.35907.1730462620857104598
 for <openembedded-core@lists.openembedded.org>;
 Fri, 01 Nov 2024 05:03:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=KnlG45BL;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=KnlG45BL;
 spf=pass (domain: arm.com, ip: 40.107.22.79, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=WuLO613ZX3UsTo8aCPTcxg7goV7fIcTD//BDvJsVTltA0ilqOs846OJhcvQK/SQBpmcyp71jiPuyr1q2NA4ZHIkj7IlWVD4eMWtEPwGp2L+WEx7ozwvVmcuw5xVi7SB5FmYjRGmaerS92V1ddfF9qhifNzClP2QRaw6vJT/gpiag0HwRdS8KObYz5vuLu+f3FegVHEXrTLxV6SbJCWmoa66St4au+5cABiWDYRTigWxGOnYH5j76vf1Ko9JIsNZpYpFCnyrn60iXLqPXA7cWYZy/tXPXOeEi/7s10X2dalL2Mb0xBF2d2Hbs+TqqkzfJfYDZU1n3PNmlMmmfShyMmA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vXcz9IUyOD7cNvswq0rctIs8xnAaRvfb5NjK5Mh0Kuk=;
 b=MaVcbKzf9NgIwntUYjOG3rVeThR11hXFexi/T5XznQSKqy5udNxEzU4jOpHwl+lc8N1j0Bgf7+wewLaXjxV206fJ4f5vMHhegOwvUwIUlGWTVdIQqZdyyBGWm+y8uk5xeBC55oSFarWqgBcbQ7kcFWlGAb9boUFbl24BJbG+BnJ40mDLA2aHOV+71nbZ2pgFRg/dbdqhhr5kTWtG4SKc3qJkQO4SRtjzPVsCS6YrY/7Hvx+EAcGSVtO6H4lmSfnmLQi8AwpNs6yUulhe2W5f+gvrMnawUOnU+b6aga0NoNVaGJ+XEaA2NcJMKzZuSPc/UHvaQ8fPYzATwFeWlV000Q==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vXcz9IUyOD7cNvswq0rctIs8xnAaRvfb5NjK5Mh0Kuk=;
 b=KnlG45BLHZ1XYyGvjGEZqs41r/EC+IXXRyOiCoYZwMBiSw6QjLUPcz68OpQLawopPDzuqJB7z+TZYn+LP8bdAN2Os8KP4ZfJJeqzenhFDtIoFLpwI4NpaD2WW9vPLJN2hdT/PAfYDjYPhOESHf51tPr+JGWpP2IRqbguwNEcmcc=
Received: from DU2P250CA0013.EURP250.PROD.OUTLOOK.COM (2603:10a6:10:231::18)
 by VI1PR08MB9981.eurprd08.prod.outlook.com (2603:10a6:800:1c5::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.25; Fri, 1 Nov
 2024 12:03:36 +0000
Received: from DU2PEPF00028D0D.eurprd03.prod.outlook.com
 (2603:10a6:10:231:cafe::5c) by DU2P250CA0013.outlook.office365.com
 (2603:10a6:10:231::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.23 via Frontend
 Transport; Fri, 1 Nov 2024 12:03:36 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DU2PEPF00028D0D.mail.protection.outlook.com (10.167.242.21) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8114.16
 via Frontend Transport; Fri, 1 Nov 2024 12:03:34 +0000
Received: ("Tessian outbound 4a86a9c66651:v490"); Fri, 01 Nov 2024 12:03:34 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: e9d18f4403fdbae9
X-TessianGatewayMetadata: 5vf65M5RIjCi6tiT3BcaWGMC81oMeZW3BckRB859awFWdRqNvCAdkmgaYFKO0Dnph0cMsZQT2CLiupuYBl7r+jeU7QCbtW+XHuRE3YPi2f7EZLWjTe4Qd8Sae29Z/+R/V0Q9A0Wn9x6w+RNG5u5D/UlexnX6DWsPxk0BRct31uo=
X-CR-MTA-TID: 64aa7808
Received: from La1c0f731eb8c.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 1FE94882-42A6-4E98-9DFA-C3BBE5DC6CFC.1;
	Fri, 01 Nov 2024 12:03:28 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id La1c0f731eb8c.1
    (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
    Fri, 01 Nov 2024 12:03:28 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kUQOJRnwFtC4Swh+sDCAIy9RjHwSg4hawC8D1PYUvrqisa2bWrYEHGuYNCDuFEF984w/ScIAV0HcYqsu0gDqMaCcMZTq5z6IvSl2enyzRfoB39yVYoYjxww0FFMFdr8qBZjI3y0vTqzfJZxe2rKCbSbbEbQ6S0iKlv7eplwisO1bkvq5lfJKfkj8/qW56+69SN3Vb0X2jtApzK8EIcgLVNRQexlRdpz/Oi3UZB+7i5DIcsyvYrnM5KL2CytCE3pqwcEyGyjrcAbtHbzBYg9+esTHKgg7vZwjuDhPUJyCKQFDfPVWAx4ZlhTkMNBf7lkBs0NQMRUOmetxylKg5NbKdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vXcz9IUyOD7cNvswq0rctIs8xnAaRvfb5NjK5Mh0Kuk=;
 b=C1xNjSIAg70692A5ynEwhNetmWGC3k4MVn5IayS+sBUdmzzEkABf180p11QH3qZIrisbvjlcaJ7Bl9e38uy9IT7HoUbhkcuvnHs65nS9bROwOFLA/t9fwWpdlPhrTQQ9dV0IBPAT92AIbUBapS0Mmtxwcz9u3hy/l66t72pWHS5pQao3aN2lqyi40RnrMBa/iNF7MQKJds6AAuAfcOfkj2zsobEbLOzVfezeu4eqQB5tXhEqy2ld7Q9sWKBp6WUdoJPVjbFbmn56YCR7zQDGqbtwn2sDesnAaCUuG8433ohVOpRu79dYNf4zvX6qR9YcmbNna4L8TiCKUq4Du22yww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vXcz9IUyOD7cNvswq0rctIs8xnAaRvfb5NjK5Mh0Kuk=;
 b=KnlG45BLHZ1XYyGvjGEZqs41r/EC+IXXRyOiCoYZwMBiSw6QjLUPcz68OpQLawopPDzuqJB7z+TZYn+LP8bdAN2Os8KP4ZfJJeqzenhFDtIoFLpwI4NpaD2WW9vPLJN2hdT/PAfYDjYPhOESHf51tPr+JGWpP2IRqbguwNEcmcc=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by DB9PR08MB7820.eurprd08.prod.outlook.com (2603:10a6:10:39c::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.25; Fri, 1 Nov
 2024 12:03:25 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e%3]) with mapi id 15.20.8093.027; Fri, 1 Nov 2024
 12:03:25 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "f_l_k@t-online.de" <f_l_k@t-online.de>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [oe-core][PATCH] u-boot: Add patch to use SWIG_AppendOutput
Thread-Topic: [oe-core][PATCH] u-boot: Add patch to use SWIG_AppendOutput
Thread-Index: AQHbKovPFgwcPg+3QEiKbKGdSccmTbKiVvcA
Date: Fri, 1 Nov 2024 12:03:25 +0000
Message-ID: <6EDDD5DE-CB20-4E1C-BE71-8363D60CA8AA@arm.com>
References: <20241030052443.855752-1-f_l_k@t-online.de>
In-Reply-To: <20241030052443.855752-1-f_l_k@t-online.de>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3776.700.51.11.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|DB9PR08MB7820:EE_|DU2PEPF00028D0D:EE_|VI1PR08MB9981:EE_
X-MS-Office365-Filtering-Correlation-Id: 2e42d480-76c5-4412-195a-08dcfa6d35f5
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|366016|1800799024|376014|38070700018;
X-Microsoft-Antispam-Message-Info-Original: 
 =?us-ascii?Q?4dV3Hw1YlVvf2/UFzEyv+2ooNZxxVqDVLo0qLYx2eqdoQCDGD0A4KL5TYofL?=
 =?us-ascii?Q?HdEn9e20IZXGgDO5ngAMWp338JIzP0bH2+6rTw3NKEFl7Ew4Ygu1DE+5oY8o?=
 =?us-ascii?Q?majfc9jMSYJQa3IuWwFhcmaUm8h8zMETnRGPQMt68ZKTgTimYdPeVG8YI+bq?=
 =?us-ascii?Q?Eq18dtI+LMNO0h8i6ci60OOmcho9PVFggpgJyUbl5OjW/h1UB/nG/DIC8JcR?=
 =?us-ascii?Q?TrIYUZmDzwz01T91YB7NrpjK3eTVuJ8H1DTpaoS4L4WWu+EsTfGFBorQ258I?=
 =?us-ascii?Q?+NxVnPGDgZUdWDzrGNtiAB6R0DHxNdGJIqGUa4xmqt3utiH/nX65KorTqXu1?=
 =?us-ascii?Q?6pR891Mu3tjgmUz+ycQ4+TIROYIcD5wM6F4k/E1FD6Ijl6VDeXSdesrn5ddo?=
 =?us-ascii?Q?tJVEQL6rEm0B19mnKeic0pdyqfC9NQUk4fX7leDMDL5w68pl1xdA3uJVTxRd?=
 =?us-ascii?Q?HM3f0TJtvKF37R7e4otzQn2k0lZP/koyim1jQyO85N9WceghO+raUZW8EpBZ?=
 =?us-ascii?Q?ThwrhieNhL7/bkoJE1LoRnVYTqDuVhAnpAYqAJT0yx7hs6vP16EuofijRUkB?=
 =?us-ascii?Q?kAN5tlAopAqKZWrfQQuUY5sVk+yvMI0UNx5tAI7bKkFrhB+tOdhSQEwz4XLv?=
 =?us-ascii?Q?ifHVqVRtem95HNfaj68VXrb8wHQU7NBVtkWK6i3ipJqY8/NoZ9Htw+RLx1UE?=
 =?us-ascii?Q?d2PcbNj8JhMw8vUsdxNzsXpQ23nBEM/A/9zHVODCDgtRXo23Zx5yXpQ9QvX9?=
 =?us-ascii?Q?kbq5CuHX132ix1YODCpIXMCVWdoqN/pO6WChdRvF3xOzxPr6F9tu9H9TQ3Dp?=
 =?us-ascii?Q?TYUeXc6UFl3WtnqEeYCDxJVo/qCCBHI0WXq/ZIMLZ1StjZ5UsaTLUCHcLRxT?=
 =?us-ascii?Q?0CP6DHOUcFQKYrLcXsWTZ1L/AkU26fkaUp3yH1yisM42hOA5kw5RunClYaYm?=
 =?us-ascii?Q?tg+TxH8eY1kcVA+//9q4sshCyQHzhNJ47ZFXjV4r24aJ31n4jgWuA0E9IXMk?=
 =?us-ascii?Q?Iv+izCco2B2czJPCGrzhowAaDsDdjGmdoza7DS97/cqiLh+hSDO3Thh8VKKz?=
 =?us-ascii?Q?YYLwjGFvyaOn/v6jkoSpktvSKjbq5pcZ0JBNDutky+XPkZ7WZrbDZtLosxpY?=
 =?us-ascii?Q?hBzMzSot1yYiJcS+7wY7mCZHlwspVsgDz7Yh1DjyUb6MERzdpw9TbuK2Wti1?=
 =?us-ascii?Q?bXQlpsvxChs6OEC+PkrRiuIvf4jtCim7OBxZyastSRt5vbk25fVfokiwth+9?=
 =?us-ascii?Q?0nUe17SfhQ9OlgT2PFahg19BknCd5n+I+qoUjjFUoiGzjD2nvDHb+bgvHDJL?=
 =?us-ascii?Q?ZZAfcs0AjvKQyM6S1jGN6Rqevx74RUm1+CiLaekpBjO/TdCHIpu0GaYmjybc?=
 =?us-ascii?Q?mq0pm/4=3D?=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <1963319B3AA2FA4F838978B6E5642E55@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB7820
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-SkipListedInternetSender: 
 ip=[2603:10a6:102:2a3::12];domain=PA4PR08MB7411.eurprd08.prod.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DU2PEPF00028D0D.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	07834312-633d-4700-f230-08dcfa6d308c
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|35042699022|376014|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?Fhqm5/pjzZ1TKAJGXjjPj3Q1H5MKBLDeS0mc6+nzWsIZlcs1F0jhPvT8OddQ?=
 =?us-ascii?Q?hMwDeNQLYIoasnmRLRebXjWdDsoYDRS8w9BgBMMmPdaCutB3eNrsuhZKrI+9?=
 =?us-ascii?Q?/u9E2un/2naK3zFVWl2LxJ8s0FHoX6RC8GfM7RwiDO6lOWseSRgB6IGrIfsu?=
 =?us-ascii?Q?WqVjSdCTvBGDVDJQwe1wB8k5V0ut13SXUNBKjqbOQYx3cpjHLOkYrW0dCm/2?=
 =?us-ascii?Q?wphMN2ZprlF8gvF9Nqw/gR+0DDeqiMVRqwjGSPMdVuHUbn2TjkrqKNoJmcng?=
 =?us-ascii?Q?kotPGaoAlK877DuhamFbjEyPPRhpEJE8GALPtSQFEWvkXnSKfjSCxheF6k6t?=
 =?us-ascii?Q?sMQjUdaKQGzjdoYjVbXEFxuHzbWILCw5eKfiDg4p9KN643ATkARIsnhN/wWM?=
 =?us-ascii?Q?a+bsm5XcA7zOtRD0c24OskjSYsWp8oloVjrTqMrVcjCijaseLIWAASIHkKOj?=
 =?us-ascii?Q?/84Lly1OuG3JBajvKb+6fzrop4eesXCQOS9H21niPTBpL8vBqqqqlKHcLJRN?=
 =?us-ascii?Q?IXkMaJ+M1Uq/wnnkBhr2a7TmbMyzjw12BwwnDP7memi+vgL04HjPXU1g8q91?=
 =?us-ascii?Q?VQZ2yh89d6aX1KJtV5XDIH5U1/MIQmOzmPt9Cj6qQP04ZogsrgwQXIoOZ9MO?=
 =?us-ascii?Q?S+mdw16Knvm/p9dV6Dp9LyGnhMIF8qq/n+Dkg/ygzRW44U3k1wFz9h/Ogojo?=
 =?us-ascii?Q?H5AdmQiccsEeTG0tVLQ5cdqQ7WM8tbho7zYm9SOeHa857MXtBrD+ywle3SOn?=
 =?us-ascii?Q?pnGOU04PZ4f04dZi/NJTmoH//8M72t/YFFiBgllw9sBZwhxMdD0RYDUSxNwe?=
 =?us-ascii?Q?7MbqnOiRQS9rDuSa+kE+XEqVHkccQvbk7TvYISrPr2NjlvaAMkAd9FQ7IvOw?=
 =?us-ascii?Q?mny6QQ8QZg141Swtu0PtgudB4FGyohbPvZ9ZmqWhsDm+04gsQkTZkfiCYJVC?=
 =?us-ascii?Q?Y6whJIiRRmc0tEsalu/bWm39dT0CK4jbqxyzHvYqRiZx4hYQn5+y2amzZSZr?=
 =?us-ascii?Q?BnVOQwvKFTE3zUb6hl9iyAvjI7KbCmFcpgJ9kdo6Lf4gzEo04UsBMrjRFr3R?=
 =?us-ascii?Q?QPpXVHf3cSLrBXsvwLlgfjvWOUxWCrU0y/z1AP0YXgp+dvXNkXXkd5A+4CD8?=
 =?us-ascii?Q?BrMkfp23pVcPodfGIfOMVMuOMI7Qd2LY0Hwpcl0pD9FMRo2wIunkIaYVaUbS?=
 =?us-ascii?Q?G0bovY1yE4H4Kv3gXIGVaU20ON3R/tsYci3FlKVNTICXwBJ1issX0/FXDTXE?=
 =?us-ascii?Q?2QgqcdlEYaXqmupRstmdphx6A7udc4R2iHHwliafBbMM7NYU9Dbbd/KPsU01?=
 =?us-ascii?Q?TLayicGLkH/qXKYSjJ8RjGxInfE5rme0fYsIz7gFkeYjbbb/yZu23HZ2WGz8?=
 =?us-ascii?Q?R/0Nbg19Piv1xTWkhT0gn1TH+K/YQYHGEe6qI3n7110sb6mlPQ=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230040)(82310400026)(35042699022)(376014)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Nov 2024 12:03:34.3402
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2e42d480-76c5-4412-195a-08dcfa6d35f5
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DU2PEPF00028D0D.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB9981
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 01 Nov 2024 12:03:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206618

On 30 Oct 2024, at 05:24, Markus Volk via lists.openembedded.org <f_l_k=3Dt=
-online.de@lists.openembedded.org> wrote:
> +Upstream-Status: Submitted

Please include a link to the submision.

Ross


