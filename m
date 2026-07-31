Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75AB0C55172
	for <webhook@archiver.kernel.org>; Fri, 31 Jul 2026 10:46:13 +0000 (UTC)
Received: from GVXPR05CU001.outbound.protection.outlook.com (GVXPR05CU001.outbound.protection.outlook.com [52.101.83.26])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3631.1785494115885396813
 for <openembedded-core@lists.openembedded.org>;
 Fri, 31 Jul 2026 03:35:16 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=xC04B5mX;
 spf=pass (domain: est.tech, ip: 52.101.83.26, mailfrom: adarsh.jagadish.kamini@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YXiDGY40ODVkT4H2ayUaycKt6c9Usxa3/dAFpi4QrvGIiQS4fs+XtZXDNG5QLPAis9Y8ZA+PeB3VMoLU5Tge9PFlS05J8zmMFhxz232wk4u2wQfwC4NyEn3+VdqA+8HYcDRA50xRXDeB3MtYJrX5IzWsXolywdM445HrLmjxBTQA+N9eOpWoCijjk4ebBsC54CsK7HZjo7pYTR8y6KEg8W5xMIVfRAR8ixZKjg38onWRv4JWoTcbLQsQma/Djw1F/TrgOY4ecUMK2Rd5GNHBe3j/BySBR+afB2NG3vmbgFNQZuuLyzwRUhkAb12ycOycwjLtLnV8mnJ9QHYcrBiXNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=T4gsKaDhoMQBYsfX2TikWZr9NWuiopIdVRK95dJofDM=;
 b=FpQC0mW4AeQjG/MfvVVJODcLXH/zOygQVa346M6ZojSboYV9HYJoJB9B8M1QvkJrEukr+mJ5j7PU6UruczwWfKY2yl1PWFQSvGZm9g5YTt5UM2CFUCFzuz7QKeREPeEttNdtUYDlB/7tBJLyma3JYEXZXDea1B1gWmZJewiyQR0psrP+JrQWhx3XOUT2eY9+G0QGDLLaEv/oIkUMdI8RpjbOM5plKYucAwaD6V6qsywp9gNNEmFMb0cRXXZzYkVU2Wls+EH7KDi5mW6f/jqlYGpkGhkNlJLie21Cf5wWgfv0dzraStUmEj82I8f8cQc08/DdUs2EiUfJhlUv9KqmDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=T4gsKaDhoMQBYsfX2TikWZr9NWuiopIdVRK95dJofDM=;
 b=xC04B5mXvDia4T3+ShGxZnfGrfm9qTsI692aR4aPOtuF69rX8HNc9Poe1QeXOdehV+xrI/vnii7BDimDUxZEO1gkiQhSmaKdO4BMVPZGrOTOoLgWeE7f52v2pY8AB5tDmbJyWCHRGAA0cwNVzsAKIN95CYaWT6BZIMsLqKGVDNseuaLKbHfM7mG71dlANtbW762RzFSbgW8XKooV29U3kTj43WLYbytLJ6KvqqYGU1/cYlyEKqbQ/9RfGR0hkpqTGg0gdQI1NgvzAB0UAx0nNGShNlMp475wUYt+ASjMtOtFekolwi3ySkosQL37WkL+qiYAVJ4VKJx4I3XihowDqA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from AS8P189MB1672.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:396::9)
 by AS1P189MB1909.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:4a5::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.8; Fri, 31 Jul
 2026 10:35:10 +0000
Received: from AS8P189MB1672.EURP189.PROD.OUTLOOK.COM
 ([fe80::f147:85e5:34de:eeff]) by AS8P189MB1672.EURP189.PROD.OUTLOOK.COM
 ([fe80::f147:85e5:34de:eeff%4]) with mapi id 15.21.0292.009; Fri, 31 Jul 2026
 10:35:10 +0000
From: "Adarsh Jagadish Kamini" <adarsh.jagadish.kamini@est.tech>
To: openembedded-core@lists.openembedded.org
Subject: [wrynose][PATCH] glibc: CVE-2026-5358 add CVE_STATUS
Date: Fri, 31 Jul 2026 12:34:55 +0200
Message-ID: <20260731103505.617192-1-adarsh.jagadish.kamini@est.tech>
X-Mailer: git-send-email 2.43.0
X-ClientProxiedBy: DU2PR04CA0192.eurprd04.prod.outlook.com
 (2603:10a6:10:28d::17) To AS8P189MB1672.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:396::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8P189MB1672:EE_|AS1P189MB1909:EE_
X-MS-Office365-Filtering-Correlation-Id: 86e50357-bd5b-4697-064b-08deeeef6554
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|1800799024|366016|10070799003|23010399003|10067099003|11063799006|56012099006|18002099003;
X-Microsoft-Antispam-Message-Info: 
	ETkZhCyafkVyXFgULi0kHWOmmB866xX1K52oyKnXxWoaF0bkcwigTw55fTTgwyPFoWGWaKhvg2l+p0BHaVe8WtfF/RvP+Ty5STs7WZ0Um0owoE5lxt/sdS7VmSoFN3fvm04Yw+1fjt5TDkHakdP/VBQYKbuy8/d68NjerlvKJrlmhfJq0mTcIOHjNm05LCZTyZicIvfpzmVD5Cmcui/5oRZt6HXR/Qd24SSatbYjx5qpiI8LEgDRv+q/AqxEomi/03ddIp4JNE7GwSlMo7ie4c8yQr9ODwwQoF8EJapQeg0pewhQxqsZEQ8s46PsgHFW9mZi6TVk3Yr6GiLOw48Gja+Ae94+5j5CWRGAW2sTqSRhzTztlv9Su+7dJ1R5RQFM4w8PGoM1UcSCU70YIyxLHoOUP0gGPSj1B3VU/IUx7yFVxnpMxo4aAYmke9Twdb+IRUDN3UITnSNjbGkm6hGiY+jNosBgzvc07igwTGn4H1FHOzCt0IFuqEkxQh19fDK6ZFlqz5hqlrubkkLrKDL8AhTHbAxmSynM2Gmb09gHroaPT7SR9Dh5L5P8/OhpQDAYPNUGqUG1vQcggwj7w130v3U/LKza1GMXVDChtnwHZUHLQSCUXRqe/LwOs60aAakh5kWp19mHpR8PTaofGxJ9+IsjEdIU2EUOtTTG2ow7Qqc=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8P189MB1672.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(10070799003)(23010399003)(10067099003)(11063799006)(56012099006)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?2VYQncmL/KtEKalUt/Es6SDP+gzi0/Xl/wrhtoWKo3jcRDqstjX/LMZNVJbU?=
 =?us-ascii?Q?rW43UPCWHn2XoisCGA8lSHFLln2LP6fQN22Zpwp6362pL5NKYODMOuJTGEWw?=
 =?us-ascii?Q?C014AqT/0GIa6QbDn9Tzf3SrFP0TacdGPlsi7AZuThxjGP/IWkhnvVp+CZF5?=
 =?us-ascii?Q?7tvPIyDBl3PUACuDVtwy6BrSlfEtXZ35+u2LBB+x3eILsx/LR4XGjJW0MmR4?=
 =?us-ascii?Q?uhJ7JK0wzTmB4r6hcFbUSfz2g49o2kCmxJ4RvXjElUW2wmhH74Mtf7mZQxEC?=
 =?us-ascii?Q?5ByIrg4LFH+O8HZ8sf5Hzt81yf/H+kznYIoIC2n70+N3ga2zslfyaXkBUaZF?=
 =?us-ascii?Q?+JACT61vepHqzFVWFABCq9PCSPbfT0hxtbdpSGJYIAgHJ3k0vSf/U/wmg+x0?=
 =?us-ascii?Q?bC7FIYD0jDLDQ2G9cpgNhtlfmvVz8U3Cb/zTC72lfyQo+WgMpzPfk0hNOwuZ?=
 =?us-ascii?Q?MCGTmtJitGOHxw5cfWUlix/lk4XqlIcy9F0I2xddtQCbaK4PcwfpHltSEm7w?=
 =?us-ascii?Q?oEMn5k67C268GyxxVB4bdKTZDoRVjeCltGT1DKl7vuggieAdEL7Np/s+P1aN?=
 =?us-ascii?Q?lg6xciCh2wbBeJZUK2wD3IZlkhkgaiU9KPeIJKuQ2b+cSieaRxuoKCzKDEWv?=
 =?us-ascii?Q?qFTlfYVzt7cQs3z/TZp2P51E0TfwP6mKcHOd7XX0ONyRStKtEpsr4Q3A+wew?=
 =?us-ascii?Q?z4mq4S4GpnhpMpmQc9KuhKa2m0dwchmHj8y49mQlERgTERAnfW/caLpjER9f?=
 =?us-ascii?Q?zffOwbNNnkjMdzo/HZujhzgkWxtod9/ShxADu90yN0mK3jFosgo9DPR9kVNg?=
 =?us-ascii?Q?bK6EbxXLH7bVaMwbzV8aueyPKmS2lIM5nhr2FdcJ6golqsh1+HobTbFIcbJ7?=
 =?us-ascii?Q?JEAPVCA0exCXBPSQgGrHY4T4iHYi9DXgUcW4X1Omju5vQlMIwyeiy+sK8nOU?=
 =?us-ascii?Q?NFcH7u95TwznXXS4xj4veVr6pzKKpuiT5cq+YPA+Qi9bMXyKzvvAjQIQOMgZ?=
 =?us-ascii?Q?KOM0qszj5pcvAfdxmd7i9TX7Dag0niG/rzkOCrUlIUx1Z6kGVpcJNsSvLUs8?=
 =?us-ascii?Q?1NgDNncZNIf/ersgMaEHQH3AXo5Oo7CEhS2GAf6G1zU/rmyklaYYjO5Onres?=
 =?us-ascii?Q?DAF4Ae2DKmBo/VKqSJLHvo6B2qFsTsW1l7UexdPoKKJpQ5F6eE6ROkLBQegH?=
 =?us-ascii?Q?OqHbKS9BKl8ByWguAx1+jjBafqdhTDMLAfzvfiKyV1bvskKxJE8bN2MBu/bZ?=
 =?us-ascii?Q?twfdCpnY1h0w/DikiBSy/51ky/Ny9qQvsXiqGxvE937PUXNI9hsRZPDfR0Z4?=
 =?us-ascii?Q?XKFu8XWEYjsMiGPUGdmBv4nKiZgCmTejHN6AguXa2DPi8FZkMLqOHmlQahPd?=
 =?us-ascii?Q?qDGouxjF5DqYS5+S72lS2aulogtNdSFh6tNF55bn77+A/Z0TZ4NFfxobJrYh?=
 =?us-ascii?Q?gTXkHbwPheMuVH7MdaIVvaS8Y7kVtGkP4LA34SotqN2oLytHSXN1s2b5vG6G?=
 =?us-ascii?Q?skrETwjJt7AaHEzA/NwavI+sooTcRg/nVmr2Sa1vOYgsN1Xni+Kjr69oXc2v?=
 =?us-ascii?Q?ZQhAAhy1E9a7qbf24d2UisboNbBoIimCgrVEmdpaYpEziluQ0I8Q4lk7IPMh?=
 =?us-ascii?Q?EqDy7r1J6GCBXpyvNmGLd7WUO/4nnoOEIarbKmFbHScO6BsxPddiTM9kUVBn?=
 =?us-ascii?Q?Y1PyOSfYpniWY9Yj2ODYdjlhgWQuoj/KPjkBHn5W+4kYN6Pucj8cydqYr925?=
 =?us-ascii?Q?XRX1X/YfvBxGbGnSAxorNJdAjsuRFoHVOq5uGWnUbi0/A5PfywlsdElWoYA4?=
X-MS-Exchange-AntiSpam-MessageData-1: 
	UO8lLd13+QAbjOdzEMu0/3L5jUxtXl5L8h2r+7y1LRCVk7ntNnc/PdfM
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 86e50357-bd5b-4697-064b-08deeeef6554
X-MS-Exchange-CrossTenant-AuthSource: AS8P189MB1672.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jul 2026 10:35:10.4303
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iCLsN4RJA+ytTsjYsIfQFzl7rahdXwrz6s5lUPhNZZBLJYm2957sQZwvvtnSotn0oz0dkxxR6ylBafwKMuTsh9PoCt1ADE9i5dODpcrYPLY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1P189MB1909
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 31 Jul 2026 10:46:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242427

CVE-2026-5358 has been marked rejected.
https://sourceware.org/bugzilla/show_bug.cgi?id=3D34067#c6

https://inbox.sourceware.org/libc-alpha/20260421164416.4031726-1-carlos@red=
hat.com/T/#mf76c27025e603294611196b90e428769c9fc5a4e

Add CVE-2026-5358 to CVE_STATUS_RECIPE group as the CVE is disputed
by upstream glibc maintainers.

Signed-off-by: Adarsh Jagadish Kamini <adarsh.jagadish.kamini@est.tech>
---
 meta/recipes-core/glibc/glibc_2.43.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/glibc/glibc_2.43.bb b/meta/recipes-core/glib=
c/glibc_2.43.bb
index 9f3a3814d0..7721cc3f13 100644
--- a/meta/recipes-core/glibc/glibc_2.43.bb
+++ b/meta/recipes-core/glibc/glibc_2.43.bb
@@ -5,7 +5,7 @@ require glibc-version.inc
 # glibc https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2019-101002=
3
 # glibc https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2019-101002=
4
 CVE_STATUS_GROUPS =3D "CVE_STATUS_RECIPE"
-CVE_STATUS_RECIPE =3D "CVE-2019-1010022 CVE-2019-1010023 CVE-2019-1010024"
+CVE_STATUS_RECIPE =3D "CVE-2019-1010022 CVE-2019-1010023 CVE-2019-1010024 =
CVE-2026-5358"
 CVE_STATUS_RECIPE[status] =3D "disputed: \
 Upstream glibc maintainers dispute there is any issue and have no plans to=
 address it further. \
 this is being treated as a non-security bug and no real threat."

