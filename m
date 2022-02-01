Return-Path: <stefan.herbrechtsmeier-oss@weidmueller.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 069A1C433FE
	for <webhook@archiver.kernel.org>; Tue,  1 Feb 2022 16:17:11 +0000 (UTC)
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
 (EUR02-HE1-obe.outbound.protection.outlook.com [40.107.1.76])
 by mx.groups.io with SMTP id smtpd.web12.50389.1643732224178235699
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Feb 2022 08:17:10 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify"
 header.i=@weidmueller.onmicrosoft.com
 header.s=selector1-weidmueller-onmicrosoft-com header.b=W5LUHvCB;
 spf=pass (domain: weidmueller.com, ip: 40.107.1.76,
 mailfrom: stefan.herbrechtsmeier-oss@weidmueller.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gJbQ3SDfbS2Z6hGZ4H719OL0mVOmk4SaKqSB70EoWRFglu5JFuNe4DVxeZG4lRjVqkOh4LgB6OBuqzDKOUsQO9VsIdQg6NkAcwOmFg58zdnCemhygrpcUeiB35kPs9ZlfAo9jyhb9CnCLA/IDkAwaEsDhP+M63uAS8yqkxAWUEAbtJOCBOThByfiq7X59nLl2ZNMvCF35bmAszCZXk16rX76aeDPDWOu9oac5LiWXNczatFuUSgK74W1BXtz9Qys0/INOyz/l/CGQXF9Q26LnAb0aL05zdM7bYicnmSE/MWfcJB8aNa/UOkb1YE3GEjJZWi9X/r9nmw90Br2IO79nA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8FhxUP41UY2BNF0QqB7IwO5U/GSiNy27D1B+lU8BjB0=;
 b=H/jBUBzbHUZlnusn9/UNKc1UNcl6gX4T7bOv0xaWjuovL8y3MWjKI5TiMhMA7s8au05bTKu3/7159MNkkqf09IE3qVmcLdPyPbGtZzrFruilFYzjDdBHbZNyTL423yyExbsT2URFQe9rKTZwrrOnoiLewqQVQl1iQeP0a9FlWKIbSxJ93Ho43cltvxHYXHTgA05aAp03ZwaIfYtTNSaHt0fC6/opfhWafYrOGNHEDFfKIlN3g3QTzDSMtB2DdrxMlDClm7B+CEJmEvW9mZSZQwndYObHIaKzZANQAvyRyT8RbdwppflvL3eH6HRM9+Y+d1Tx94NTHXHyQEobzO2RsA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=weidmueller.onmicrosoft.com; s=selector1-weidmueller-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8FhxUP41UY2BNF0QqB7IwO5U/GSiNy27D1B+lU8BjB0=;
 b=W5LUHvCBdmkjDJ2o7LRFj2LV5QDhBuXQQJU1CACKfutrl9PVBXCX81LyutMAQd+akCBHSgMVUbPnNpJ8uzHd5xd61f3qf2vYWuJTie0nN9LaA4+oAoxGG1vh3FW5cosEn7/l0dUxPIDtLqO/9sJU5ANyzXbFrAjPAChoHxpWnRY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=weidmueller.com;
Received: from PAXPR08MB6969.eurprd08.prod.outlook.com (2603:10a6:102:1d8::23)
 by AM0PR08MB5188.eurprd08.prod.outlook.com (2603:10a6:208:165::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.15; Tue, 1 Feb
 2022 16:17:01 +0000
Received: from PAXPR08MB6969.eurprd08.prod.outlook.com
 ([fe80::245e:139f:5d4d:1dc2]) by PAXPR08MB6969.eurprd08.prod.outlook.com
 ([fe80::245e:139f:5d4d:1dc2%3]) with mapi id 15.20.4930.022; Tue, 1 Feb 2022
 16:17:01 +0000
From: Stefan Herbrechtsmeier <stefan.herbrechtsmeier-oss@weidmueller.com>
To: openembedded-core@lists.openembedded.org
CC: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>
Subject: [PATCH 3/3] systemd: Minimize udev package size if DISTRO_FEATURES
 contains systemd
Date: Tue,  1 Feb 2022 17:16:38 +0100
Message-ID: 
 <20220201161638.25531-3-stefan.herbrechtsmeier-oss@weidmueller.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: 
 <20220201161638.25531-1-stefan.herbrechtsmeier-oss@weidmueller.com>
References: 
 <20220201161638.25531-1-stefan.herbrechtsmeier-oss@weidmueller.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: AM5PR04CA0023.eurprd04.prod.outlook.com
 (2603:10a6:206:1::36) To PAXPR08MB6969.eurprd08.prod.outlook.com
 (2603:10a6:102:1d8::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c4589a84-f466-461e-1cca-08d9e59e46b2
X-MS-TrafficTypeDiagnostic: AM0PR08MB5188:EE_
X-Microsoft-Antispam-PRVS: 
	<AM0PR08MB51888F00CCFC2759F63B3208D7269@AM0PR08MB5188.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1728;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	aA5eplrMc9uRj7+VSVGAj0J/gjQekTgfrTLMoO9lniCK2d6Tg8NgKpPIYTZgilrpoIztUu5EzAxSJRubLUagqyzf84n69m1r+zyAFIjbUGx4VLg2v98PZ/zvfIo67+WUYXjM4t76M1fm/ny7povnIMkyCcL0ct4Hv0O9pEl6criJOCl+FpX/On+nLEGPF4LpBu2hlhhnCDRVQJ02msbS5E1+lu1mp2IzAErIL8gauUOgh5YmQxKtKQwSM/ND6QVifOkF3TZN6SG1itr6KWGEF7MCTevGCQyRKio2IpeYkfmFC4GWvCeb6fUCbwQZ8iZfXO7b6+7YC2nIaMJqBFGfCwrcNyAeMquyJqzh6r3tT1xnrG4svypMGQ2hw++EgbcHPEAVjX+jepr6n5JvWBlGdo3pkijBHKC6KQdRV3KQ6WQfYnpvhgnnkDRZTIVAV8iAKmznz40iFvhak3GQQEMC3NuLTuxiflHD/W9JBDi1UylISRVRE3tPYbS7afct3k2lF8AhC4JyVvW0GHHD8+8iZ5auW2LN5ZsYVmXsa5Fb8TWu59/ULslZ2TSocQbF0nTbJuSBzfjjMsXEavfblCd6nnwTbyvy/C5qn5oAOAxThWAYtA2CKs6LhkkIp5RtV//pA/9dt2P2gSHK1yCjjR7ZUhfBeNeJ3sctgzzKo1Z8eI8+DcvnBQN5Kd+rnIOr2yaeXep3qb2uE1Thj1u2G0Pf4g==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR08MB6969.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(8936002)(2616005)(316002)(186003)(107886003)(38350700002)(66476007)(66556008)(66946007)(4326008)(8676002)(26005)(38100700002)(36756003)(1076003)(6916009)(2906002)(508600001)(6486002)(6666004)(6506007)(52116002)(6512007)(5660300002)(86362001)(20210929001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?1utG3t2rKqtyjQAZ2O9CwrgQH6Kwr+Y3KetC/dqExSH69yKuDSQYHJe1Jkf6?=
 =?us-ascii?Q?VMkJkZVihnU77JD0Le4okzNmVjuHx0aUhcg0MynwOinPlr1NyiB4iso9nfMS?=
 =?us-ascii?Q?fUOh4PA3OV4vzeo6xqYoCETPtP7ke3S4Rdnk8VftdCoCI02o6Tex3tyeFnMV?=
 =?us-ascii?Q?5ZscS7nzI8ULBsm3L65bmwy4/tj/gLA2xN9XLmUy1uMGUa25izZfhZDXxpPB?=
 =?us-ascii?Q?CEf8y/+In+78FY3pSbQ2Fb66wZkPZpA0F2aV4n4F4c4tVMN0dYqU9032HSG+?=
 =?us-ascii?Q?NkzCcBOiZwoGGIZgFzPt+yO2eLJLePFLo7ZBLBFzYn43RbyRxvrr55IzDMtA?=
 =?us-ascii?Q?AY26BhdNVfRquFO/vomqPNe9zii3EJREO6/QZvS0QHUQHxBkAMsTCN+eczwU?=
 =?us-ascii?Q?PwTyOynTJwCkKesYwzyQzWXb4ZRMFfOhxEqZLIhtTUvwWVkqjD7rCKnyWRU+?=
 =?us-ascii?Q?iSvfsshDVKo8PHCqDhLnHi3WtE0K34b8jb4osnxJ00M1ZOW84eVwkkKvsmJG?=
 =?us-ascii?Q?V4NROU53AuXGZDqKypK/KTLJstjcNfu7zIWLCnJ9V+tod6Gl0Dr+iLUeFyjQ?=
 =?us-ascii?Q?77z5VmeghPv7XceBnv/6H0eldywkDZy8289Byd0QQ0oI90ePkmfi/OIT1NQt?=
 =?us-ascii?Q?xP/V9BAzC3Tceqxlcev8JMzisrUJcr9G9WgV9BlTAhkKo7Zg0Ned1NQk0szm?=
 =?us-ascii?Q?uQzZafBIyxsAIlc76hm6+IymKGvqQNP9GLEeSGNtn+ZU3nUgFn6+YjUKGx7V?=
 =?us-ascii?Q?217Pj88+DduNDYiJ7+xx15jbtTCJZHrYWwe2gsAU5UruCQQZy0TSgiwAOmWz?=
 =?us-ascii?Q?UmgJ8J4q+O0GALUtifylwumGjVgHzDraz0t4SPUkrMbC1SemjfOvVB3Zx3Id?=
 =?us-ascii?Q?ab1knp0wU4x03rgoonrYYvqYGrcNd8O9mRuyf6QH68ueUuTDvWquvZ4MORYg?=
 =?us-ascii?Q?Ja5GzKuqnJ2OqEkADFqc8BC7DcN9urkvsWpz6MLZcWhygFbH5rpxldCHcGYG?=
 =?us-ascii?Q?V1eUC/TfZL3Q+VctdOXolHTkOaPuAiYNTb8/CxnREshXRF2sNlDR1KZ4gwZC?=
 =?us-ascii?Q?1cFeMWjGJXvBStbaHMN7Q5IMCctIeiVfKoPaJrexFZPdnn7BYCrR6s2RFLxd?=
 =?us-ascii?Q?OQZqoYQqJwZPakYshcxSWxBXtjlI+62K/fNWGMAdLeHhb+1skDulpfVs9abp?=
 =?us-ascii?Q?aOMHBE1pLG3t8Y9PC6H0Vp4XXbmAiltO5224XHbJH3/ikF035Z0JENnXE1Rd?=
 =?us-ascii?Q?4X24pg5Ussf9dGcNAQHbvN5sPteu3osyob577EqqOnW31oGV8FkpBigfpLp9?=
 =?us-ascii?Q?9KRLJP5bcYkVHUqMQIdBdxP+0uYt6BHjrVoBNyqImwAnqoQH7S4e5oxtBiut?=
 =?us-ascii?Q?2maVSPpU3NQUkkdWcC1P0u7R6k1ys015D+RSra8dAB3eiS8GuDbFGSxs+lNZ?=
 =?us-ascii?Q?swTCYoMXbyUQbgZXzQu9t1ZYVEI2nOW+cT17PcSS+jN2qW1BuyEVpr9GYsL+?=
 =?us-ascii?Q?AtV9Ooj9PKZJ8VtgUHYiUxoZVuRDNBj302UuWE9v2t2D5IuQy6R5JG9NbXrk?=
 =?us-ascii?Q?15HLU5S6DX5BabOrHY1cWXjM7G44jq5pq5wfawp54a/b9ZdfrgkNfj0h2TT1?=
 =?us-ascii?Q?Bqrq/RqJnkHZXpUu96pTIx8=3D?=
X-OriginatorOrg: weidmueller.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 c4589a84-f466-461e-1cca-08d9e59e46b2
X-MS-Exchange-CrossTenant-AuthSource: PAXPR08MB6969.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Feb 2022 16:17:00.4725
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e4289438-1c5f-4c95-a51a-ee553b8b18ec
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 dc72aTDOMQ4sToApTRWC5Z/Cg7UGhfp9YeevkHKY3MfoOLRKmoe+VjQD0oTB5bi1a1WNWBtgZUtm8nMsHx0N0Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB5188
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 01 Feb 2022 16:17:11 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161161

From: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>

Link udev shared with systemd helper to minimize the udev package size
if DISTRO_FEATURES contains systemd.

It is only usefull to link udev static with systemd helper if udev
should be installed without systemd.

Signed-off-by: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.c=
om>

---

 meta/recipes-core/systemd/systemd_249.7.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-core/systemd/systemd_249.7.bb b/meta/recipes-core=
/systemd/systemd_249.7.bb
index 739f3aae86..431781e6c7 100644
--- a/meta/recipes-core/systemd/systemd_249.7.bb
+++ b/meta/recipes-core/systemd/systemd_249.7.bb
@@ -66,6 +66,7 @@ PACKAGECONFIG ??=3D " \
     ${@bb.utils.filter('DISTRO_FEATURES', 'acl audit efi ldconfig pam seli=
nux smack usrmerge polkit seccomp', d)} \
     ${@bb.utils.contains('DISTRO_FEATURES', 'wifi', 'rfkill', '', d)} \
     ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'xkbcommon', '', d)} \
+    ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'link-udev-shared',=
 '', d)} \
     backlight \
     binfmt \
     gshadow \
--=20
2.30.2


