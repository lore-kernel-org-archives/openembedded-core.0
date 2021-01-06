Received: from NAM10-DM6-obe.outbound.protection.outlook.com (NAM10-DM6-obe.outbound.protection.outlook.com [])
 by mx.groups.io with SMTP id smtpd.web10.6936.1609935006756585984
 for <openembedded-core@lists.openembedded.org>;
 Wed, 06 Jan 2021 04:10:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=R2xrlT6G;
 spf=softfail (domain: windriver.com, ip: <nil>, mailfrom: liezhi.yang@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NZ9kh8Ywul/K6G4YTxtNc7WBSjh8Wsl+KD7x/4mNqwaQNnnrjIGeRuuIp66lMrL8Ug1Apnbfe+8lthri9eFVEx0UGiabxp3wMCbW443jod7HQ6dqtAOsofltNUO2VvkWXRHkX7hFlU20g6nV/Rl/E8Naea2V7Kcd/ap7Qvy4NNvVS5WAYR4Il/RFGjxSDIqgqC5jGZlanb61YZ98JPSmLFmqCXL4j6cIf77390vwEF6jRJ0sg7sYw8vrcnfmFgL2n620VhQmt8msdFiIm1vqoJKUJll0vIVYA8XsnSfZaBsxzRgPXytDkpbZZ3RBgfoBUi1yhXFD+6+nzd/EVOC3lA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fLt0MPf71YSxj0dvZbbLYJf1M09vCePW3KPhHogT+uU=;
 b=hSUg9GQJdnXnFYH8nZo8PcHGiNiNppq3tPQHbzPJE/CGvZdQMzNYjKSFmol61hrrkM0dLshNmVUCnHgUfKPIYtaCHKfwZafMKGAjOKSjAX8ggm/T7CczxchGiVihe7FPpec+CztFdLRA0Ofj2SuV+zt3f+8uxUpDAXtxxMcHfRRykuYDFwutwDOANf+umH6lv9rLw+mxpZUENUJbe2xP2bmbAtOFks5lemzG1Rr0/4zBTVVzJsjkSMRjEqE0k27D1zt2xkGRgW4fVUAhTmxE/sNK4xNThks0rtYgA0yjRS+6x3nEqp4fyM04rOw8X/8gSqE7ARMfmE+Ccxm0t8DC3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fLt0MPf71YSxj0dvZbbLYJf1M09vCePW3KPhHogT+uU=;
 b=R2xrlT6GcP5EmWDsIDfpwfdHYHhdFLV1NRprLyJ6JDygr+dSK4ln5vY1eUnC/yQ6LRLwXpg/gcg98aoUSflQtjEICQsEbvew81XwKwop3exxGjzTE6QbHp6i3Mi/D8CQQOs+js9hEvjqELv18+TyzTi/AufsMDR/kSkWE13pmo4=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from SN6PR11MB2909.namprd11.prod.outlook.com (52.135.126.77) by
 SN6PR11MB3088.namprd11.prod.outlook.com (52.135.124.150) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3721.20; Wed, 6 Jan 2021 12:10:07 +0000
Received: from SN6PR11MB2909.namprd11.prod.outlook.com
 ([fe80::acc9:68df:558c:94e1]) by SN6PR11MB2909.namprd11.prod.outlook.com
 ([fe80::acc9:68df:558c:94e1%6]) with mapi id 15.20.3742.006; Wed, 6 Jan 2021
 12:10:07 +0000
From: "Robert Yang" <liezhi.yang@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/3] buildtools-tarball: Add nativesdk-ccache
Date: Wed,  6 Jan 2021 04:09:51 -0800
Message-Id: <0f8505614d5562aa94dea17eb6beea772c25e1d3.1609934927.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1609934927.git.liezhi.yang@windriver.com>
References: <cover.1609934927.git.liezhi.yang@windriver.com>
X-Originating-IP: [147.11.105.124]
X-ClientProxiedBy: YT1PR01CA0110.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2c::19) To SN6PR11MB2909.namprd11.prod.outlook.com
 (2603:10b6:805:d5::13)
Return-Path: liezhi.yang@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from ala-lpggp3.wrs.com (147.11.105.124) by YT1PR01CA0110.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2c::19) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.6 via Frontend Transport; Wed, 6 Jan 2021 12:10:06 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f54dceb9-4074-4430-359d-08d8b23c01d8
X-MS-TrafficTypeDiagnostic: SN6PR11MB3088:
X-Microsoft-Antispam-PRVS: 
	<SN6PR11MB30882F0385B51600D18CD49EFFD00@SN6PR11MB3088.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1201;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	RmXB9CDXltiDD8JWAIU6ia6CWly8aGw8cGTMCSnfsOoN96uiw7G80UdIjkON9FOMsIcq8+0N7Rb3Kw+OkdPcmnGlaEclPDGVA9w8mTwYZiwpigZq6n+zrsCSmVO0MEIAahTfVSKUK/V/5t5m6kIl/6wz8Zc+N8+X+dfh1d3YBfLCKzjTSTNm4L9p0g4+pfaq3xPmNCh2j1bR0T77vM2zBP5i0VaF/htNGcjhyzPU4qhHdX7p1o8v1k8xof1mfZ7p2xAX7CYaovakOsqSOvgKHZt7nLBRf+gHixKjaDBshU/AOepIzl09aEw0ID/E6Fn9kjDkvY1XYZmgSV2JK0pSxAVdzrv6Xzq50YT/Z9EXu//im7KUNGrTtU+/ZI4Al4Fvy6u+WJwzZDSc3Xx6Y/7R4Q==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR11MB2909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(376002)(396003)(39850400004)(366004)(136003)(5660300002)(478600001)(8676002)(956004)(8936002)(2616005)(6486002)(36756003)(6512007)(4744005)(26005)(186003)(66476007)(66556008)(66946007)(6916009)(52116002)(6666004)(16526019)(2906002)(6506007)(86362001)(316002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?us-ascii?Q?C38MVZXLlvlGZhxB6KJgFqxTcrYV01NkzayqZr8r+oJ2rv4ibLojvCO1tjhg?=
 =?us-ascii?Q?aR7awpUwONUr4k39iT00cMn10kACWK3YanTIrF40VfrDDPQ5mOQd8uJhHp/J?=
 =?us-ascii?Q?SIwVuUy1R8ScNPQj4LdKvuDsZ9ia6GMves0EVBSC9qI/GydE6eje/dYPjI/5?=
 =?us-ascii?Q?nu83Uq2ycPb/dtnY53Iy8IcqbVZbcVJ73zBsySyLUR72kATPXGMPa/MSDUp0?=
 =?us-ascii?Q?UGh0Qrsxt2ACdny/+11ypsQgv9Ygiqr3enGaLEjumTiBZjjZy8XEnRmpKIou?=
 =?us-ascii?Q?FlYJVhPbOn9zajJuP2JyLOYPHPErIPlD6oapgkSM/rwpsfLFaTGyrLxffXBQ?=
 =?us-ascii?Q?q4lINveaPBd48okSlaS6JM+qGJYVlKefr+NGNIuSpUMipAgzvkHcEgDoBmPC?=
 =?us-ascii?Q?eqKzpiK5wncTwvMbbB8DWVOse/4LilKLwMVJhs02ZY76aqRRlHGroZvJhLb8?=
 =?us-ascii?Q?trG+oO6uyrlOhril9aFCrMcKx1yb54c3OmRxSB7LXljp+BE5KAyvtde40F5P?=
 =?us-ascii?Q?+uEOpsfOgJb8/g5zN5qJoJiqJ5/R0M+2nzxl3K1RLojKUcO2NSBdqUBwO72O?=
 =?us-ascii?Q?6rVn9aUXKWKtXjWHkG1Orx0dl5fZCmpPvkvzSeGv38obNlTvWgRaDADJyefv?=
 =?us-ascii?Q?ZyGDxgni8LvKyPMJXB8UKL4NA6ii3e3wFO89I6L6s8eC1ZGz/oQpqlhWNJZF?=
 =?us-ascii?Q?qAi41ChYpNMIcUEWTUQvSxUB8zVXtJ4/YXMAlzSJ0IhgOI2Tj8fgPldDsjta?=
 =?us-ascii?Q?JZS9e7o87yLc01eyLI3R6yOStbeqUajhKTs/rbNPBCDnI9T40jQ3IHd7ylPT?=
 =?us-ascii?Q?V+GiY2cD8dXqzfeLnuHOuYzX1yTiWiXhBTpT2TRNt9Bgg3dwRX8mIEfd9o0A?=
 =?us-ascii?Q?muZpCJYffW7HG7JsX4Lg1yzm5vmwHQ3DJToEqucVrNM1t8tGC+kM/NF/4Z7Z?=
 =?us-ascii?Q?zI+IoMp62W/PeTCcsaHqYq0FBurQm2EWuVdDStMnqr7i+LYbQXToYQfosStT?=
 =?us-ascii?Q?GchI?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthSource: SN6PR11MB2909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jan 2021 12:10:07.0794
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-Network-Message-Id: f54dceb9-4074-4430-359d-08d8b23c01d8
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HLE6f4ISVhVoRYmKCBo3JQI22ttvQlH9PO5DdLbpYpoTSPoSkjvTbkf5N3L2Cg1kr5LX91lhm9D++caZGxsCKxHqbfDeipIs9okWV5Rspzk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR11MB3088
Content-Type: text/plain

Add it to buildtools-tarball so that there will be a unify version of ccache,
which can help avoid various compile errors.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/recipes-core/meta/buildtools-tarball.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-core/meta/buildtools-tarball.bb b/meta/recipes-core/meta/buildtools-tarball.bb
index 9da81d55235..2ffdd7c7253 100644
--- a/meta/recipes-core/meta/buildtools-tarball.bb
+++ b/meta/recipes-core/meta/buildtools-tarball.bb
@@ -29,6 +29,7 @@ TOOLCHAIN_HOST_TASK ?= "\
     nativesdk-rpcsvc-proto \
     nativesdk-patch \
     nativesdk-mtools \
+    nativesdk-ccache \
     "
 
 MULTIMACH_TARGET_SYS = "${SDK_ARCH}-nativesdk${SDK_VENDOR}-${SDK_OS}"
-- 
2.17.1

