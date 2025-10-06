Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A9B1CAC5B8
	for <webhook@archiver.kernel.org>; Mon,  6 Oct 2025 10:39:18 +0000 (UTC)
Received: from MRWPR03CU001.outbound.protection.outlook.com (MRWPR03CU001.outbound.protection.outlook.com [40.107.130.51])
 by mx.groups.io with SMTP id smtpd.web11.31052.1759747139583450188
 for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Oct 2025 03:39:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=hkwwNktB;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=hkwwNktB;
 spf=pass (domain: arm.com, ip: 40.107.130.51, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=dOXFjj8c5sqA7EUxPQVWXchGhnOVip0M/jphmIEMdYPaBxfCCpP6TIJpEmwDebiytTQqrzW9puFbwSliZUO7eFTwa5f2g4Cf3TFFTCysAbrQZvYjMjds0ibenjILcdMMUdIZhKg3R7t7e/eICgAAZ77oYqueXbrThgDHyXW9oHpg56ItjFA2wgqF0kW0OgA1P9K+E06wGAK+Ax1OTP3qk+6u+k6xa7inQ9Eg8k6vVlLC2B5HfcKbbxoDQF/6C8tkNmXUod9fazGq95ApoGTwpRuNPDoTgQnIcE831dF552q6YuypC6GGfxB8A8PE0LH00m/u3rO7Y8EwJx07jZ+nkw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kPHzHrK7VN/GQHiuP+Hpgsi6kZDFFLYcQIZvSIVa0nU=;
 b=a35yl/0HkvvW2im2RqWpUDTlkUy4jpXhN2n0RdCUh5PGef4+dO6am/1aD47GiXK1AbSjJh66xnD2pR5vOAkDaontic/LQ8UUtvVcW4JCMkS6A8FN664Vwz5OjvocCDve4MlISyTO7LPz0rtydOD5HFxfsSBsBCV9PthDhwsVVqrijXXfqsbZfa6JV0C7lbnvPiujPNbX/D7FciGTCcaQAa5xRYU9QTdkgNYvZ1OVdnsYg5kYvCrGrjIFZ0m9lMr3yKvkdAZy3zr9rUtkg89pmdorY1hiW3Li0TKFqYJ8HCX/POsCnL4lUWkEWJNb3sdYugo6LrwQrS8QwmlLmFhStg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=ti.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kPHzHrK7VN/GQHiuP+Hpgsi6kZDFFLYcQIZvSIVa0nU=;
 b=hkwwNktB3RLJHlq2gB9czkFmSI0mq+qBJbH0HSKa4D1b/GkUManPyUS6A0PtCD3A5IIWiQBzS8pSSEAsM6Dw/AqYLNkN8oahZoqJjWsE7+iROdn0cVWoiFS1LdwNdbbBkgunG0jLWOG6u8DAUkz6gwCWFZTxd8S60cOjo8Zxn7Y=
Received: from AS4P191CA0028.EURP191.PROD.OUTLOOK.COM (2603:10a6:20b:5d9::20)
 by AS2PR08MB10153.eurprd08.prod.outlook.com (2603:10a6:20b:64c::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9182.20; Mon, 6 Oct
 2025 10:38:50 +0000
Received: from AMS0EPF00000198.eurprd05.prod.outlook.com
 (2603:10a6:20b:5d9:cafe::4c) by AS4P191CA0028.outlook.office365.com
 (2603:10a6:20b:5d9::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9182.14 via Frontend Transport; Mon,
 6 Oct 2025 10:38:46 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AMS0EPF00000198.mail.protection.outlook.com (10.167.16.244) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9203.9
 via Frontend Transport; Mon, 6 Oct 2025 10:38:49 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vX8k9qk56HFpZptcsToCOC9erig0tdqxtJCAbNqt1AELpF0z6ST95Da4sv97uAJfHk0nvnSvIhoeDx/vF7vdi1RHicdqb0VZ8ELzDNIgp70HFtjPO+TAVg/XeAH/aWjsSF7z4Shc2wjgwK3DpdzXcxGWqfMQr2YwS6oEJMj4mHUIX+rhDH573SL6dYuVrBOMf7HoGEHyNp0/lAER0j0NzJCOw3yqH+LbwHNLV7NBaJFIo250ni3l/wy6hxoCC/nwJsS1xlzNNf/n7dhJyoDBJnAYb1Yg+k6VKTqKkP18ZZVc4xSQ7altV5idv6L1VQ83xqADpT+d7BPIxIikOeqrNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kPHzHrK7VN/GQHiuP+Hpgsi6kZDFFLYcQIZvSIVa0nU=;
 b=RnWiMuVb26/Aen1JrqMKtSV+MUNFyU+IotD/9AgKG+qWpo7iZke5c8kK6XB9qP1u/Bvd9USNl8fQerQkGzOjQvfABz4PQJe1hfeUek8zBkq/xOyXjUjOzYIqB1+xQ5HQDj5c9hISDqSUVDdgOf0jfLRuPTC72Z4zSXo6HCLln/qbOl+NUZC4SCEkEr/5+DeEiam5cAodVWmiCoPl8ODvQxPU+VsYSGU2OaDn1ACMj2QdqKtNUrJtdw2IjtLLoWMuPaMbz5U6+KmZke+t2FeiFFnWzOXLBUC9559s9GHYBzFQ5j+uZOMQzQ5KXv83gSsNgDhnl3vMIWDPDXpphGKShg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kPHzHrK7VN/GQHiuP+Hpgsi6kZDFFLYcQIZvSIVa0nU=;
 b=hkwwNktB3RLJHlq2gB9czkFmSI0mq+qBJbH0HSKa4D1b/GkUManPyUS6A0PtCD3A5IIWiQBzS8pSSEAsM6Dw/AqYLNkN8oahZoqJjWsE7+iROdn0cVWoiFS1LdwNdbbBkgunG0jLWOG6u8DAUkz6gwCWFZTxd8S60cOjo8Zxn7Y=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by DU0PR08MB8953.eurprd08.prod.outlook.com (2603:10a6:10:464::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9182.20; Mon, 6 Oct
 2025 10:38:12 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::7f73:806a:3493:7d50]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::7f73:806a:3493:7d50%4]) with mapi id 15.20.9182.017; Mon, 6 Oct 2025
 10:38:12 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "rs@ti.com" <rs@ti.com>
CC: Richard Purdie <richard.purdie@linuxfoundation.org>,
	"mathieu.dubois-briand@bootlin.com" <mathieu.dubois-briand@bootlin.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [oe-core][PATCH] libx11: create tmpfile dir for x11 domain socket
Thread-Topic: [oe-core][PATCH] libx11: create tmpfile dir for x11 domain
 socket
Thread-Index: AQHcMzPOncWa6hpH2EuKL4UvJwBNsrS09CyA
Date: Mon, 6 Oct 2025 10:38:12 +0000
Message-ID: <CE558C16-AD4F-401B-9734-E57067101F56@arm.com>
References: <20251002003034.344992-1-rs@ti.com>
In-Reply-To: <20251002003034.344992-1-rs@ti.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3826.700.81)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|DU0PR08MB8953:EE_|AMS0EPF00000198:EE_|AS2PR08MB10153:EE_
X-MS-Office365-Filtering-Correlation-Id: 1e604a0d-6b0e-4c82-29a9-08de04c48969
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|376014|366016|1800799024|7053199007|38070700021;
X-Microsoft-Antispam-Message-Info-Original: 
 =?us-ascii?Q?wNUp6A8jvvFvSBsHlMZ+SaKT96oQUXuoUK9zTiV1F4EDEcSq6m1nAAaBLK5A?=
 =?us-ascii?Q?/SDPup/hnOk+k1+urvd0icQpxdT7/6UJ534BKUEpr5uGph3kZ40q1vYbA21k?=
 =?us-ascii?Q?DJxBejTpC631nKjGykndbUt/kMoelaavskGuKL0q5Utbsk2/mixn23k114Rt?=
 =?us-ascii?Q?MZpZ9HxUfAJPpyHG+qc/kggyqGgbBLeDiF1fdA6vw6IUMDVYTvRXvOrgtsFw?=
 =?us-ascii?Q?hz85TBbjD/j27A2uJ8XWthf3+YI2lER1ZpNd2LmIlvQPsNB7UGoc0Zik+ga/?=
 =?us-ascii?Q?Jxq1F15krkrEn1FTVspWAqVgJdrHwWZu/WYKSYZIBeONJ+IVz49wtS1bTf6y?=
 =?us-ascii?Q?JYsCOdVPa4kmGeHY8G+OnIbxDFXw+ibAZGZhLj+HFgMvohMxFwxgWCZUA564?=
 =?us-ascii?Q?m9K8mjQ53RX/ts+VNNDG91VdAf6I7b+IiAyZrQPHNN6MD8fblUDes1EN2RVN?=
 =?us-ascii?Q?UZL7tQ5IsBCVNr2Afm8mf9YhXjJrak+wnfgYfXek6j2ApD889+rKEASd7S8y?=
 =?us-ascii?Q?RrHHw+CQlAvE0HgQU6i/I6kZRkYK0jBrqnZVmu1HcUrKsREsvGX4gvYxYazW?=
 =?us-ascii?Q?CD1JVHC0SmdETxH3Qd5UEh5OTwV/PZVLVrarz3Qow0gpyBUtzIoRcakAh4aE?=
 =?us-ascii?Q?21rwZDuiiLEq6Q7usvQL6zwNGp6bIPVEg6Nbw5KjNMRN405CQXsb76ZxOyCu?=
 =?us-ascii?Q?XwbmcG7Gjxx2hjfJYNzalMoy/uDYcgpJ4nJvQHOfUL8gIhXPZMcjAF/o/+l6?=
 =?us-ascii?Q?ayIqpO/dEwXxORwdCU9yIqEGoeZDeSeu0+gbRscvMaxf+y7Xuafh3d9pSllN?=
 =?us-ascii?Q?dzjJXdne7D66cVJitCndAWh1R6NqOI9YeAwcqVDxs1ctD0vzn0E1swRRHenF?=
 =?us-ascii?Q?vzy/Hr5zN+VE7wYnWqR9ooogP+ZK7GI4B+xH5okPvt5gK/pbYH5drMLvbCUp?=
 =?us-ascii?Q?eaECS8yNTiOgnE7k5Q0QNgLYgThcmaGiGZUW3vwENCsXLFdfGNfsRFnAHYLz?=
 =?us-ascii?Q?DAWayQlanHyDtC88mQ+XWT/I+yBDeRTwvOkWtP1KFKMUSiDi2s8m+q+Cdk+z?=
 =?us-ascii?Q?Kc9nCbp/Dm/3ziU+et+auSf4Ga3mfDtWNeAkSDWp6ui+rz0EmFEtCAhMpnfP?=
 =?us-ascii?Q?SHSkOsDnKqV6/tOgJ1f+YzLH/XtcGQ+iODnYAaC0W684xTbH8rQkfIjFUNME?=
 =?us-ascii?Q?qAkiHWcCAC2uU3BxpNiQ8M+Jqlc/2zNPGSyz6fekfvPye9wcuIVLOppUQcjs?=
 =?us-ascii?Q?gXe80ArnVif2dg0JxmTkOlyk3vBVY4axjEgG9kqFMUH/ssvMfhrBrE//iZTJ?=
 =?us-ascii?Q?huye3iaYX4poXzINoEkTHA5J2E8Jf+iOY5Yf1rLV0R+MNtdAvO07XeWBurdg?=
 =?us-ascii?Q?ZFOSgb6rbHlcQqAZSMGFLJrfbWuUrXRVXHhULB+hJrgBpQ+doDZzGTmL43N7?=
 =?us-ascii?Q?Cim6xQEP0GAn59S1lqZpkuiiaHa/za4gj7GBpHDwV+r0JBEs12JK4voJnJmu?=
 =?us-ascii?Q?5qdoTxknH2BqhvUGPbsaqIjxPiLpWsV/iHst?=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(7053199007)(38070700021);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <B18AC28961056845AB4B15E424C0DC30@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB8953
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AMS0EPF00000198.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	5220e622-5577-413a-27c4-08de04c4730a
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|14060799003|376014|35042699022|82310400026|36860700013|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?kfAn0nk+Yt0SBe66673b4hHXjgYreYWMaQ7cfIHF15sRSWRjfcTq/pGOeTvO?=
 =?us-ascii?Q?sZ2jWS/V6s8whV/UTSIICHFD6f2Qo9AE1y6ED90eVEF0upbygVOjXYm7oD+M?=
 =?us-ascii?Q?v/c2GwA8R4+ky5ZmEMNGg1K0ZQQmEkW6aCnTfoBSyZV1f90WPVnv5VSbvdiL?=
 =?us-ascii?Q?8CfbZHxWfJD8+otBl35IvNlxaDvtqAVZDB3sit2QSiOP2F8wLSIFrb6X99G6?=
 =?us-ascii?Q?Rlr4s9pnhnq8qcaa1UR4sC4NteLr5XVbCA3hwaVLOieO1IhnHVKPwrALqhJ+?=
 =?us-ascii?Q?xvfUoJgDkpbOjJa8gAD0SvrjtYlKscdi4cCRxPZvW9UgbrFh7Jf1os7Erxho?=
 =?us-ascii?Q?bxGflRMpXOKUU9FcQef3XuHKPTbn5I97pU6t0T6k5h1MNuHjt6KSJKtITFTz?=
 =?us-ascii?Q?qQsKVLqI/0XhgF0GqNZ9MYNxaqFqF3LdVmU5JllAvHO3yE8mltHaoTVmyTey?=
 =?us-ascii?Q?qG6hrYZAq9CkpnqCC9Aic8gF/R9hghRSTcf/gEwyWuXvkiAGM+JIu8pQmEoI?=
 =?us-ascii?Q?VPVZXCMmvjJTwrebsORBwjxwMXGTjiZwiKyXe5vmZQDyNIrtxEVvceV8tHgv?=
 =?us-ascii?Q?/VbzSNet3LV/fXPhqFWpfJon0sKpdeTQqcowrjQ41N2K7FJ6ibZlakjboRId?=
 =?us-ascii?Q?zjRhKtTaxRkPzTSYsPPZNvj+lw+7AKiD5m4F4u/0alZHxQOQcZozeDQiLIFo?=
 =?us-ascii?Q?gghzUkkvFYNtFnlk6DQXSQP74LO4FKwJ8OtUJS4Ll3vYLRRfFDHWeZZHFNz4?=
 =?us-ascii?Q?txAcglvskQvQ6qJyUOtZPbaDvcox7xIzpzLl6Rp130ReaJ162xovkDvEY4AY?=
 =?us-ascii?Q?TFn8ACoMHy7tJNSLPswg52jn9Ui9J6PFCj4Rgv3tnsxmFlw6BG/L8QRi5DgG?=
 =?us-ascii?Q?hzEztrMuyK+1HhqCZ7+9RtLM9MGOs22t8bAaz80QQlNqZQbhidIygCoHv2ew?=
 =?us-ascii?Q?5KQzAftok9eh/mAxkU1ra/8eiGX5FCv3pVjMdvKXMVsJP3R3m4nrTPVejrJU?=
 =?us-ascii?Q?AO9cc8IfalvR1peq1sAScJewpY4Uj1ZQN1AH3AQkpNaVw6Pv0SPc9ttWpdrp?=
 =?us-ascii?Q?8rcSsQDQJ2hDDL6bg+1E7r1J4zv8fpQMnV7g0CpZf8QTOcz7x09ue0wGxqc9?=
 =?us-ascii?Q?6fOHcCwFX5C345NFpK1QhHLTv5v9SCdo7Ad5IvStulKsUICXiE+YiCisos+l?=
 =?us-ascii?Q?tfYtPpbeFkHexzHa4GTWQdjNEKKIaa/5SKPmZSQx81IYnWecQ/4Yfg6vFKhH?=
 =?us-ascii?Q?Zhvvmm/s8NZTFZA3N4WfqQJq07YC0k5Bv1Ud5dZb67kin8B1xyBROTaCQkxw?=
 =?us-ascii?Q?ZcIfxxTH4iNgnZFMvv34cUQqvJRR8WrnEUnRTB8E6iYmlEK59IxZEWmg5ix/?=
 =?us-ascii?Q?yx6RzEsF4s0erUl8/mBQ2K3AffKFelY/gwIffcMraWjZStVZx8uGidbU+qYV?=
 =?us-ascii?Q?K9bzOq17dBxAipQth4yDe6HLlEMpqxEqMOcPIU4UWl0+NzzozGhkteegMBkX?=
 =?us-ascii?Q?v/Aqhble502XW9LlfST8Zg++i/NZDyHiGgE5eQEddbm/NKXUIONBuT42JMuy?=
 =?us-ascii?Q?c/0SR/jSDCIgEngzfSE=3D?=
X-Forefront-Antispam-Report: 
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(14060799003)(376014)(35042699022)(82310400026)(36860700013)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Oct 2025 10:38:49.7721
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1e604a0d-6b0e-4c82-29a9-08de04c48969
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AMS0EPF00000198.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB10153
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 06 Oct 2025 10:39:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224475

On 2 Oct 2025, at 01:30, rs@ti.com wrote:
>=20
> From: Randolph Sapp <rs@ti.com>
>=20
> Register a volatile directory entry for the x11 domain socket when not
> using systemd. This will make sure the directory is always created with
> the correct permissions. Systemd already provides their own tmpfile.d
> entry for the same behavior.
>=20
> Currently some x11 related applications will create this directory if it
> doesn't already exist, but this is not true for everything. In addition,
> if the application in question isn't started as root, it's possible this
> directory can be owned by a non-root user. This isn't an issue by
> itself, but it can potentially lead to problems in a multi-user
> environment.

Feel like this should be in xserver (as the xserver is the one creating the=
 sockets), not libx11.

Ross=

