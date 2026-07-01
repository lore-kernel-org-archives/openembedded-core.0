Return-Path: <tgaige.opensource@witekio.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 90CBBC43458
	for <webhook@archiver.kernel.org>; Wed,  1 Jul 2026 10:47:08 +0000 (UTC)
Received: from relay-r19-hz12.hornetsecurity.com (relay-r19-hz12.hornetsecurity.com [94.100.138.219])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.42165.1782902820498917866
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Jul 2026 03:47:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@witekio.com header.s=selector1 header.b=bU4WstTX;
 spf=permerror, err=parse error for token &{10 18 spf.hornetsecurity.com}: limit exceeded (domain: witekio.com, ip: 94.100.138.219, mailfrom: tgaige@witekio.com)
ARC-Authentication-Results: i=2; mx-gate91-hz12.hornetsecurity.com 1;
 spf=pass reason=mailfrom (ip=52.101.84.124, headerfrom=witekio.com)
 smtp.mailfrom=witekio.com
 smtp.helo=db3pr0202cu003.outbound.protection.outlook.com; dkim=pass
 header.d=witekio.com header.s=selector1 header.a=rsa-sha256; dmarc=pass
 header.from=witekio.com orig.disposition=pass
ARC-Message-Signature: a=rsa-sha256;
 bh=10d82+LoPZTt7Da5/ukCuSSlmSjzBqLWNuw653narBs=; c=relaxed/relaxed;
 d=hornetsecurity.com; h=from:to:date:subject:mime-version:; i=2; s=hse1;
 t=1782902818;
 b=pO1zmpd7F/Z1rYPMdHh0pC1o9DTPF4RtJjWMS2MbVa7N0WQAId4zXiH+17Wq/HD4ugb2A6iB
 i3QG4IgnhCPg1dJMEVmtl/AYsw3q215XXHUiPzILr+YEr9sXiyMZr3ZWszPZhxDrUCpKXROK2dD
 WBDbczjku6Y0YzIQN29jVmHsHKxk9OCP8Q1fr+kG6Q2B67d3bGgL1oKL5G2QMswTkX0ESrnRipp
 AVB12KdcxubLc+6PMKT7hET3o5apnnbexhBOpXbTlzKmqWabL0BvjILRM7ebh7WgRUiv0Qd3v2O
 amBk7H/wh7K37+3oGZddyyckWJEWLS2N+V4Eh5AwCklTw==
ARC-Seal: a=rsa-sha256; cv=pass; d=hornetsecurity.com; i=2; s=hse1;
 t=1782902818;
 b=AvVIkW/8Wu1hcq3nEU8zZp+FO5S4i5f7Ke2QE7vNVyYkpte+Ss8sTV1x+B12Elox1dMfB09y
 jdnnVQO1xYdxpJFLNYijRi8ir9sYH2KybrxKcuCvAOuUCQwefAHbC9e9u3fxB5Ur87uEdREmL+W
 KlUqrT60KxeFTH5svh85JE7NQ2BTI2PCQr6SGciFv7of5La8VPbiH8F2xvTK218l2PUJawo2OrY
 h58iwfDgcsxjknwK0t8i/MtOaDAvWtVg0PyTn8NRer8kwAL0maFW8QtcW2xF5nU1wkpm7NuP1eH
 ruxs077DliY5RMuyoUvfMe1VRY55ZhaGzPqC5srkpu55A==
Received: from mail-northeuropeazon11020124.outbound.protection.outlook.com ([52.101.84.124]) by mx-gate91-hz12.hornetsecurity.com;
 Wed, 01 Jul 2026 12:46:58 +0200
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=f9F/SvIqbSPlgsrIetJXh4ESRImvoZ7bZ2Vhw0Cv0sVHGUWhROiMj3hef55xP0rTpQVAFNE/67Hy3GSFI8tLGrHK/SJh2otx/1ful7YOyfoce0sATy2k6jUq3WNb/jbHsLwbl6ZOeg/7Q6xHX5fTxNJsFGut/hMDArRR/8EsQV7YggV4Yy3FhZcsNs0DtEu7QZSRD00z55LWrsaidTZCoKQGhsuTpZfcZt7TvJXkpda2ZqRV4SyDBQJJwWWyfdCin1pJ5PZE9bhEy71qukWiqnjBo4EhnCM13NH/5j+gFo+v3RiE+PujCUvsLwZAEvyDJJQk0o/+XbLiFrAjLKc7JA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=10d82+LoPZTt7Da5/ukCuSSlmSjzBqLWNuw653narBs=;
 b=JXrrrFfiUUlQJyJV7o9Oik8W8KH4lXQ8OPDeBPOAusXNHTx0RGedi1lYa6o/7P1kRr8aHddu+zStoq5e2r7Mg6HOy9qoWRnO/Q17pvzroYLoi1vrlmSbOTbSLpvrEcw8f2y+zx3yrU40K3l5a8/uikzQnRpAKdmv91t5mxWdnwMtE9u2Gy9ttsqicwDFyy+GlTjUVSall7dL1rOaYQzhNG8AFnUZ39haflp9BbegW+5fsLsqwXDAjGtWWYgaIheIC/Lq9M0mq3SqRt0BTa0L1j0rSopImp5OYoQzdGs0bya+lMzB60ZFUlgokuFXB1CpBevXQgUl3u/D8gbycS6p9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=witekio.com; dmarc=pass action=none header.from=witekio.com;
 dkim=pass header.d=witekio.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=witekio.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=10d82+LoPZTt7Da5/ukCuSSlmSjzBqLWNuw653narBs=;
 b=bU4WstTX3NVtS8ydD0JqFFszh6Bmy1sBGUHaNMm2vSTTHqJVr2ZyCEQZQ0cwAsRxKvKsanETxlBW/gEGPBXKTKUJfkUKY+LM3yxwZHhv4Uq/hy9G9Hon3wSTIeUBppejTtqu1xsjfyhu15smUL92TO/1MW6dCLWRkdRgvHJicTa47DUOzTOtkED4ihx1PvnbWqRwEm56COxoSV+EYoix48dkj8uPaiV+5orPyHVe3fwJ/hgLSXWOLsCI1JAXpX1cHVLrXiC2pozM9uP+ijkeU6GhcCJED8DzlCRdPO9L8wwyEHfyAtFzMTGlWgYNsV0hZXgZ5D/UvlnWtr8/0dmTIw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=witekio.com;
Received: from PAXP192MB1405.EURP192.PROD.OUTLOOK.COM (2603:10a6:102:1ad::24)
 by VI2P192MB3195.EURP192.PROD.OUTLOOK.COM (2603:10a6:800:2df::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.19; Wed, 1 Jul
 2026 10:46:50 +0000
Received: from PAXP192MB1405.EURP192.PROD.OUTLOOK.COM
 ([fe80::a160:226a:5870:e1d6]) by PAXP192MB1405.EURP192.PROD.OUTLOOK.COM
 ([fe80::a160:226a:5870:e1d6%5]) with mapi id 15.21.0181.008; Wed, 1 Jul 2026
 10:46:50 +0000
From: tgaige.opensource@witekio.com
To: openembedded-core@lists.openembedded.org
Cc: hsimeliere.opensource@witekio.com,
	"Theo Gaige (Schneider Electric)" <tgaige.opensource@witekio.com>
Subject: [PATCH 2/4] dhcpcd: patch CVE-2026-56114
Date: Wed,  1 Jul 2026 12:46:35 +0200
Message-ID: <20260701104638.3576579-2-tgaige.opensource@witekio.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260701104638.3576579-1-tgaige.opensource@witekio.com>
References: <20260701104638.3576579-1-tgaige.opensource@witekio.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0275.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:195::10) To PAXP192MB1405.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:102:1ad::24)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXP192MB1405:EE_|VI2P192MB3195:EE_
X-MS-Office365-Filtering-Correlation-Id: e278dfaf-4995-4549-ecbc-08ded75e0ec7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|23010399003|10070799003|1800799024|366016|376014|52116014|18002099003|13003099007|6133799003|56012099006|3023799007|22082099003;
X-Microsoft-Antispam-Message-Info: 
	BhSWv1PYn9meXNd4CQbhlXMktcMnSm1lAaEa07xKkEiRYXwlW56Oi5wt0b3rmS2Q4OD9HgoiGj5T2tHyXAn4nghdqWjzr3L+HYIkO9VLAvuSX2AKxWQEM9g5BMsbXQfJKE0djDeirNMfo7xzMws+JYmCD2cA+IiPw+bQaXami9rwvr0QsoIC16nTBq2C/i/VLLrXMuddp5JE4sxeRKQx3LNRDJVx8ogRoqdBIbxivqmLbNAZOAbvpgx/BoXjV0s3Pl/TdMSIUWi6tViXnkWhgGx05uo4DFPp/etixGAKbG7QCm2EGEa339bnLP6CifqlI5+ZHyPKkfls7sFv1OpjOVMeFzhYGuhU2TinASI4SyUbzJHBDbxfraJIhJPqeUoL6VEnGUSk83yGvG6dpskbxra3pCaC8oT35cTwhbZnpeAjAE8W9UBdBVfnz5+LY3c3bwsfHL/vr6tlrlxS/apOAv9XIT2oKDfRy8Le2f5migTRf9k35XgLigeN/RX0FXCFAi7Js8RvFBTsVu01Y0Q21NjUsaZDHptRYltRgORpT6CPkBzkaRSOA3GnQEqeOByS0OIKjIMHeqrVG3sWHSYiozm6beU1plgVvx0jwdqSU2WqDavzDS1FG/+1JJdq3knV8uQV8wagG0Ur/Me3iUflquwwClVhXA1+e++zDVdIkqs=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXP192MB1405.EURP192.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(10070799003)(1800799024)(366016)(376014)(52116014)(18002099003)(13003099007)(6133799003)(56012099006)(3023799007)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?W8pVqo5yqMwr6kFbBTk7FS/cvwDPZQgDjtoG/Q9qjjSYrZN4KMHM+O0sQr7e?=
 =?us-ascii?Q?36S2IRk1+kD/1oKUvmhVMUH6OWzLxuH1ZwZxmBgs3ZGvwy1Dcxt6rULKJwzf?=
 =?us-ascii?Q?SPVBcwwwLBLfx+stfsJcQRxZuEVqvqCg4Et/+2FmjzP1Tru8S630YWBHbvAs?=
 =?us-ascii?Q?ausRFvV0pSp6Hssf5VGB5k/qPVWwuTF+GK//gSqr/9Gye6aDasTblD/jwcM0?=
 =?us-ascii?Q?Mc0zCA1b6NHNXiNnthk3lMUglsQ8DPpinkAk8sy38ksC+douLyQ00cVUF5l6?=
 =?us-ascii?Q?MTMCxoY1UGZMYtY2fvyCHIjNmt/8EFN0ComG+o46u6OYazQjFRP8Z7TWay9j?=
 =?us-ascii?Q?Ig7MV3bV9Cj1Pi8CU2fhpkBMUc1bHHsuCuRlkLXkSq/qza4qEleq0832AW+J?=
 =?us-ascii?Q?011vEA0sShfFoddKXr9WEPjtfqF8Ep1wYliqWLzYdv2Bf78NQLUYuoj6w2qV?=
 =?us-ascii?Q?EQ7hvpqDOLaVrNgQyoaXn6wJvmR4sj7aefPYo4uMK45+K+1pd/9DpVHZSTUh?=
 =?us-ascii?Q?tdRN69aCvSObxSm0cbwYkW5Ii4rGCC0GPzX40yL9bYsS8RrhtTBHgGCZZFJC?=
 =?us-ascii?Q?jeqpjSdcSAraDk/pC6JAcuJhVZYzYAmI+AWJLEMsDAade7sZFGOm4oBMtzwk?=
 =?us-ascii?Q?t/i9tLmFcOYLk/ICTXVLNq/EXk+Y7bJMpFXWepzfqwJKnRz48QF7WoS6Inqr?=
 =?us-ascii?Q?PH49nw4RccLv4l3UF2SIxC/q4Ip1/TQXIxZUS+laJjMY9XvXuhf/Unnbpn+9?=
 =?us-ascii?Q?GY9BWiwAXWspP3N8sHmmKg5OEzGYMdaMDh8PgjSPOacgNGDy0XRHARPf+p1i?=
 =?us-ascii?Q?XmDA4ZGSHjrnBcUacU0/0hZMCuhYEzL2k8XexmbWxA4yIcmoYf8+rtp6wu6H?=
 =?us-ascii?Q?3+xeZVO7qubn2nspSY42akak1WwQO92F4DSrnGEYwordJ9YQLwv4jQ0R8j3V?=
 =?us-ascii?Q?zhJ7NJB/wlwtJEO8XuOAd9C3D/0qO9VHaS3szZKO2HIp96yidd68gc5nRaPY?=
 =?us-ascii?Q?To47B3h16iWlWjZJWEY1f8MRS36BwROw65wRJuOr3QCSapUX4BaBAIbiYiSA?=
 =?us-ascii?Q?0s9zqV0AOXqi/UQkGsHtHJHHc6KFF0H8kqpQUpdnDF+lzH8vQQ7QcT0iN3k3?=
 =?us-ascii?Q?WdwDmGwaOFx2r3oJlpnSmfgAle/g266ZYoBiZb1k/RlrAds1tLOnSchmsYwh?=
 =?us-ascii?Q?FKN5PTEMsHSGY+FZgWLywCTOc9RrrtCc0jT0BsbXjq/bk0fanC97VAyW8Fsi?=
 =?us-ascii?Q?EdMjuNYL5KENTX37Cezz0LffR0s2iYvKdPSnweDtkIfmyyPvkDtXCy0jsZsQ?=
 =?us-ascii?Q?2z6doc/SGzKJFHjweoLKQnTZg10lm1wRAHJIAPSN8td/rOuK5l8WTW+MybHV?=
 =?us-ascii?Q?IPMD9+wfFxjLxrUArw88J45j1TpfJIYnHvxjCCEO7/k1c315G/m0CxVv0xnc?=
 =?us-ascii?Q?iwEaTvE46Rd6Ajqzk4jb0etiP0BbyCB5KJYEo9gcTIb2299JSvLkZZnxT2vW?=
 =?us-ascii?Q?WBMXN1vdrJKWfeiS6DAzWqDtBkF+Awv+igR7TqT1Yj503+eHWS+RkMwUii0Z?=
 =?us-ascii?Q?PDJO/baMda7kMPkF4lvO52TVxLwvmY7+uTIy/fNj+NG91rxJanUSk3rQNn04?=
 =?us-ascii?Q?SxOW+Deo0ZftRtfXnZC1f7uA3VBtSZ0shhee2ASCzdgSPSep03a7YUmYibce?=
 =?us-ascii?Q?Ofvt2tdGoQArwXwiEf2XQe0/xcNfga3B0N6K4IXaigmAgpmPz6hCMqLwaItN?=
 =?us-ascii?Q?NquSxJMfQZrHGtfpfBN5jVzlljNKExcsWJ4GvgntitxNwwPMRL7bk2pbXAa0?=
X-MS-Exchange-AntiSpam-MessageData-1: R+S46hQvYiwSRA==
X-Exchange-RoutingPolicyChecked: 
	gaZbm552NBt9EUD7g0aKdaCpVBgDFKvoPaWpPjkPlC9uY/0yMr+AglhvXTDKjgeRuI/VkYfNfQiQAUmsdyxX3x8PhW2qoxhedhxF4AvNoMXWA1IgLXKrzX7naZnXYMitfWnsbkYToI8EqBXL+Re4BXXfMDykCr/PW09fh2va9d9109vdxIVyepG/RGj//fSy9hWtoXaGGm5IK5uBQ7ApmCAqDOACIeHVPbJwZ0W++I7mYfMPunV5YV9rmWNGggBJrpg8yedOLVRC5ihRHSAxuRGEZ88ekj+Fv4ifgnYemnm/FoppZiv5d5N5QzWEQILajNHDoQwyBwefzegUP3bNyg==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	PvCP9CbcyFRi1b+GAGFVXT0PiXn5zbBGR50a3NKKjaARBF3a0iE/qNwLmhPIjyjeoLoF33/W0UW+n40DEAAFLIA9cMQ12cXW4gUV6aEsqxIes144ms/AOakTxa5S8gtS6MeKPz9HmBnkHfE/j9wl7tZyLeV7NuALohjZAOB4pMPMdTy4YkFLCvH92iA+BBue35j0PHFi9pP4OrXJ6+uQ0UhUJ6FK3hrNev/4rxCTfslXrXgBvhlaV9/Nrw8kiMev8K6upsziNOUdw0ej+DlEMx3057PtzP3yI7UQ/bdlSweVcr4yp03Bo8zht6aQgBAj7DMeuzYoGTN/bnt8WpGdPxomGwfovhyxvGyBmhtr5pZmWSfo7j+aX6weplkXlPtxkiSvdM0Ys4/J4knhAFYYgA/eyfe3WuWkEpF4RL1Li3y5TmfEy+ta4aY27Lf4o7QioV4Wbk6bqK9+3oruw6sDRsNBFX+3zAtcOxu1Q5yt0KrZ66C0+Kfxrtwl3CwMB9+U95PC0GeMy3vIWjsa0pnoyEkut49cFdOExWmNkl7oWwsvzOteH8k3S/EUD9gvlNYJYn6SsDXCWsU22CbpCVuEmIhh/OfiA5z6ZldD44YU1AYaU3RymbrymLFzRP/aPdUU
X-OriginatorOrg: witekio.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e278dfaf-4995-4549-ecbc-08ded75e0ec7
X-MS-Exchange-CrossTenant-AuthSource: PAXP192MB1405.EURP192.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jul 2026 10:46:50.8914
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 317e086a-301a-49af-9ea4-48a1c458b903
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0fxU/lIqnyan3fsTcXu9jGayGVvIr7oFLCElg8swQ9mOKReE1WngTfUGpW5RWGjPlo3yVUU4kwGgXY9vUs6iNA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI2P192MB3195
X-cloud-security-sender: tgaige@witekio.com
X-cloud-security-recipient: openembedded-core@lists.openembedded.org
X-cloud-security-crypt: load encryption module
X-cloud-security-Mailarchiv: E-Mail archived for: tgaige.opensource@witekio.com
X-cloud-security-Mailarchivtype: outbound
X-cloud-security-Virusscan: CLEAN
X-cloud-security-disclaimer: This E-Mail was scanned by E-Mailservice on mx-gate91-hz12.hornetsecurity.com with 4gqxXb0bCHz8FwrW
X-cloud-security-connect: mail-northeuropeazon11020124.outbound.protection.outlook.com[52.101.84.124], TLS=1, IP=52.101.84.124
X-cloud-security-Digest: e1ec32142fe0e57bb724313c8c154b33
X-cloud-security: scantime:1.088
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Jul 2026 10:47:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239963

From: "Theo Gaige (Schneider Electric)" <tgaige.opensource@witekio.com>

Backport patch [1] mentionned in [2]

[1] https://github.com/NetworkConfiguration/dhcpcd/commit/2f00c7bfc408b6582d331932dfa47829c4819029

[2] https://security-tracker.debian.org/tracker/CVE-2026-56114

Signed-off-by: Theo Gaige (Schneider Electric) <tgaige.opensource@witekio.com>
---
 .../dhcpcd/dhcpcd_10.3.2.bb                   |  1 +
 .../dhcpcd/files/CVE-2026-56114.patch         | 34 +++++++++++++++++++
 2 files changed, 35 insertions(+)
 create mode 100644 meta/recipes-connectivity/dhcpcd/files/CVE-2026-56114.patch

diff --git a/meta/recipes-connectivity/dhcpcd/dhcpcd_10.3.2.bb b/meta/recipes-connectivity/dhcpcd/dhcpcd_10.3.2.bb
index 12ba7a1152..3a6e967657 100644
--- a/meta/recipes-connectivity/dhcpcd/dhcpcd_10.3.2.bb
+++ b/meta/recipes-connectivity/dhcpcd/dhcpcd_10.3.2.bb
@@ -16,6 +16,7 @@ SRC_URI = "git://github.com/NetworkConfiguration/dhcpcd;protocol=https;branch=ma
            file://dhcpcd@.service \
            file://0001-dhcpcd.8-Fix-conflict-error-when-enable-multilib.patch \
            file://CVE-2026-56113.patch \
+           file://CVE-2026-56114.patch \
            "
 
 SRCREV = "243ad84ac67a87d631ff7eb83b2eed2727acebb5"
diff --git a/meta/recipes-connectivity/dhcpcd/files/CVE-2026-56114.patch b/meta/recipes-connectivity/dhcpcd/files/CVE-2026-56114.patch
new file mode 100644
index 0000000000..a6b8a44515
--- /dev/null
+++ b/meta/recipes-connectivity/dhcpcd/files/CVE-2026-56114.patch
@@ -0,0 +1,34 @@
+From 2e27969699676e664898c8f82e2c047762fc426f Mon Sep 17 00:00:00 2001
+From: Roy Marples <roy@marples.name>
+Date: Tue, 23 Jun 2026 02:06:55 +0100
+Subject: [PATCH] DHCPv6: Prefix exclude option can be 17 octets (#671)
+
+Well that's a simple off by one error
+
+Reported-by: CuB3y0nd <root@cubeyond.net>
+
+(cherry picked from commit 2f00c7bfc408b6582d331932dfa47829c4819029)
+
+CVE: CVE-2026-56114
+Upstream-Status: Backport [https://github.com/NetworkConfiguration/dhcpcd/commit/2f00c7bfc408b6582d331932dfa47829c4819029]
+Signed-off-by: Theo Gaige (Schneider Electric) <tgaige.opensource@witekio.com>
+---
+ src/dhcp6.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/dhcp6.c b/src/dhcp6.c
+index 8a8a20a0..5e497cfd 100644
+--- a/src/dhcp6.c
++++ b/src/dhcp6.c
+@@ -1093,7 +1093,7 @@ dhcp6_makemessage(struct interface *ifp)
+ 
+ 				/* RFC6603 Section 4.2 */
+ 				if (ap->prefix_exclude_len) {
+-					uint8_t exb[16], *ep, u8;
++					uint8_t exb[17], *ep, u8;
+ 					const uint8_t *pp;
+ 
+ 					n = (size_t)((ap->prefix_exclude_len -
+-- 
+2.43.0
+
-- 
2.43.0


