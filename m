Received: from NAM10-MW2-obe.outbound.protection.outlook.com (NAM10-MW2-obe.outbound.protection.outlook.com [40.107.94.84])
 by mx.groups.io with SMTP id smtpd.web09.4969.1617187591703212317
 for <openembedded-core@lists.openembedded.org>;
 Wed, 31 Mar 2021 03:46:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=L2tpSDeo;
 spf=pass (domain: windriver.com, ip: 40.107.94.84, mailfrom: qi.chen@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DQb/z9JaJi6XINffdvcamS2JgSw7m89RiRBwarxnbDQAF1PP9lSSMIcPthLnypKUku81XHwaX/HKtzjIhN9YLz6ZRNI6/q7dSsZSll5myJLFXKXbDEQdKCEIY/052fS3032I+qkOFzkDF37paX/ZHyhMr/7aiTYUKAIlL0HBcGchAeK8Xh9ToVcr9i3sm024h3Q/kQ1ziDXQ5MQSjJHL2doEHEJC0/Qpt2pG6whRt5Ta5wwJsFgr4m2b1RCXnHNEdtsu8buk90Hv5i8U9dwQjD6zJuEN3sY7L2KHzIfIE6i05SALlfDeKVozl4WNfDOTHhGiWCCkkD0DD+VB/H9c7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xk1AhhLumlRKt4LAmo/INC5b/bwf/R/l/JIIBY9teOA=;
 b=iDNaJzxog97HR2JiQWcHbssMmHJHwXovpkh+z3d7oq2c+voqZYNzEUB6y4QPC46DTv+nmSeEyJyfd3H19L9G/z93PWZ9KETJGyEQzdEt1pLdql7OEEGvriVnI8EeSrXTLnujCm1UlLMZTHR0aKP/p+qHAkysJbwt5Y8/DvllmBz2AJpPo3jT7j1opLHRHk7SQ+QCRV2r3thLewCg6P8ecfIl2Dxvjr97vdMqUr/ZXCBGkliPtiKqLmCj+39EnmUcTTNVJeqKJr1cHsw1MthhliNzl4F6LQHg0fmYye1Z4biujoqYvyRVEgdgToZXna6xRZ1Aed+dCOeIJM5RhbqYnQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xk1AhhLumlRKt4LAmo/INC5b/bwf/R/l/JIIBY9teOA=;
 b=L2tpSDeoQ0DYWeW7B5tK4sXBBSOXVpewIH4NTIrq9d0XNTMYB9gVoBNAG9Xuv8wBqOpoO/MClumwmSktpAnOz6KkykFAsRdIVKTJNkIeUPVuKZkqf7yp/BhxkAk3n3S4kcOf57XRnkBqy7zHNxBk+EWwNjvmZ7TQ8J9DVs/iS5M=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BYAPR11MB3480.namprd11.prod.outlook.com (2603:10b6:a03:79::27)
 by BY5PR11MB4308.namprd11.prod.outlook.com (2603:10b6:a03:1b9::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3977.25; Wed, 31 Mar
 2021 10:46:29 +0000
Received: from BYAPR11MB3480.namprd11.prod.outlook.com
 ([fe80::5091:f32:2586:572b]) by BYAPR11MB3480.namprd11.prod.outlook.com
 ([fe80::5091:f32:2586:572b%7]) with mapi id 15.20.3999.027; Wed, 31 Mar 2021
 10:46:29 +0000
From: "Chen Qi" <Qi.Chen@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH] apt: Fix do_compile error when enable ccache
Date: Wed, 31 Mar 2021 18:46:08 +0800
Message-Id: <20210331104608.7047-1-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [60.247.85.82]
X-ClientProxiedBy: HK2PR02CA0160.apcprd02.prod.outlook.com
 (2603:1096:201:1f::20) To BYAPR11MB3480.namprd11.prod.outlook.com
 (2603:10b6:a03:79::27)
Return-Path: Qi.Chen@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from pek-lpg-core3.wrs.com (60.247.85.82) by HK2PR02CA0160.apcprd02.prod.outlook.com (2603:1096:201:1f::20) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3999.26 via Frontend Transport; Wed, 31 Mar 2021 10:46:28 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8be40d51-4e62-417f-0f6c-08d8f4323db8
X-MS-TrafficTypeDiagnostic: BY5PR11MB4308:
X-Microsoft-Antispam-PRVS: 
	<BY5PR11MB430843A810A5A951F372345AED7C9@BY5PR11MB4308.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:747;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	gEiLovpTzqGbS/9FcsUs/d1aZyPiR/i9RuLHt16qtK7LTV6GXWIhQpleqj7q7xJTXXgzB96dRNZu1Ge2q22lDXn4D+ciKEUMlEmN8WIbA9WtecfrfiH3PavrZRU2We6+5tr6pDEi0ANKDYSPjqmnYjKFdey2z2HON+l2ucxg+TWLNsqcrmHU4os+KY/rYA+soMZmJQqIfH23DcweZknw1mN9UBD3OmN385XJ+0DrB4nnK7rw20/Mh0nWckO79u25Fo4zQvaW7bpgOM/3RbEj32mAIphqhHGaVpzr4mShSRYl1pC+HwiakSu15pMOppBvIpdJWDseiLh6rb3Xpf4YXgFs53fcK0ScDKUtu1GB1fRJOx3SmdGuMlfiVxuuxwh4bcOoJK10Zh0Cr2XxsPVNit/ThU1o6flzZKrmZe+TJHFn0qguoWtbVy4i3EGEPIEagBpGk8XvqUKoZs3lOFC0zfTvIK8nPGo/XdEysAzD87mv9W3g0sQgnitHEP3GU/BS6EilBfFh6YQmRMPhlZA3ztZ816JdurfTG5wjMG4hqYLmiEZ2oGPVtfYos9pzBe9TBTpovpm+IaXM6/0gHK+wKUjImbMIptAlvv0iuENnGJFd53sd8XvI8GVryAGiJj1wWRdYZheR6ZDEx7PfTuq4CXltFHm84X7MO0ZogmE2X+A=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR11MB3480.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(396003)(346002)(376002)(136003)(39850400004)(36756003)(5660300002)(478600001)(52116002)(956004)(6666004)(6512007)(66556008)(66476007)(66946007)(83380400001)(316002)(16526019)(2616005)(86362001)(38100700001)(2906002)(186003)(6916009)(1076003)(6486002)(26005)(8936002)(8676002)(6506007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?us-ascii?Q?ghlvb3gu7WHitGB0//YfgpudSRxQodWaNwI4CWY40QeBqfqrasbJhv1NIY94?=
 =?us-ascii?Q?EGjmrT1Ll2lNNK9Ib7C8EquCfpzjDQzyZka58xpVxYU2+eP0tXoLflsaR3WM?=
 =?us-ascii?Q?FD9+Cqly2DAJYKdtPBYMa9+3BaOAHwfCYeZ4JvZnmA05+U52srTCcVKCocuE?=
 =?us-ascii?Q?Z0Hf2jCK7L3926vZvCPLbZEUuqIfBDlMJ+C8QKpmoJkrMU8K6UY1OJp2qfxy?=
 =?us-ascii?Q?1q/mGiD5fo0UXbTf8aEMkWOr69flrBQ3vdLCVyixTS1IAA/M6CjP/iRCaWYD?=
 =?us-ascii?Q?BsBNocmEIuSLBYcvh21UHbc5f8mcTG4TCBt76OBe8JD9LE/UWpdZHrTz2keJ?=
 =?us-ascii?Q?ktobiw+LvVTFf2yE6zBKFsstdghS/BU2ZN0Hxmfc4FPa/2Kl7cQK2zGeJSYc?=
 =?us-ascii?Q?IMHUQZev4BcWHGr5lgh2vHLi8hm9mPb7G+CUHx7NbqPvTn/AZM2OFU/IVRim?=
 =?us-ascii?Q?ms0NO4W8k334pqBq830xOhBnMxF+Zd0i7CWhEQxV2lCApz61vQJEm4SIyRyY?=
 =?us-ascii?Q?a8QYHbV72rkhNM9J2vABRO5wGZdzFOIAVHMveSFXVjyjvwUiaUDBmrhmtMHl?=
 =?us-ascii?Q?oucsRFO08BIn4eS1c2YThk/gjv8WvFPbTurz9OdyXa55ksG9f2RxoFY7xGNp?=
 =?us-ascii?Q?MWkZ4dog/0KE+6dITRJbYsnJjPu2dXQU/pIvko7Vq7TFHFPlRnJs073B4xwM?=
 =?us-ascii?Q?qamg5njLIBiNSA87tZeB8tDxjmOxcQWGvyMyJ68ZGC5OBo6d2NJTxC2WWzWP?=
 =?us-ascii?Q?1HrW0enEIzJhq4+oaUal1PW8WQgtG3TlchtyzfRhi/9eYE0qw6IaUtfTqN93?=
 =?us-ascii?Q?2vkvjyMd6UIzVA+QfsGG5U+c4BqN3J7LLwWL+glxFgqh9hVIkW1is48BIYev?=
 =?us-ascii?Q?w8SWGBoNgXMXq1/QUad6DmEyr/25Jef7OpG+k8RcKNo8JaqoBYkK1mwDHGIw?=
 =?us-ascii?Q?gFXDexLIM6XqvG7iBUxlkFFv6zD2hSTle+4fjzYF+lUZXXguzJNCrfGOIPCK?=
 =?us-ascii?Q?Ywae39CReaG4Sr2u8OCT3RNUIGkhX4L9A5r2L6UlVb1jUypXYXwDl7mmlRtr?=
 =?us-ascii?Q?tAfdSlkLZAghC2QdZrmFuOYVPd1UYa1aPP1SL5mhmKC/YiJoGsSS6gmJ/Y6f?=
 =?us-ascii?Q?cxGN3Fd70S66zTtNSsj7gA+3mIx7zuSQb0DzIMWvrUx8fc1vxRjxVqtNOJm+?=
 =?us-ascii?Q?dZyLJzgmKAJA/tbi4M3Y+uZFfKtoza2QV74lJnf9OQ6XStBysJ/VRS5nC33+?=
 =?us-ascii?Q?DLZJzpqpZ9UGe2MYqbN2MCK7PXHH3eV2UxUIsDEu0F4zlyQHLX315GkTF7Rt?=
 =?us-ascii?Q?dv6DnFCiBLhkz3SHAhg7PeMJ?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8be40d51-4e62-417f-0f6c-08d8f4323db8
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB3480.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Mar 2021 10:46:29.5809
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ozoTemg2FEr0JZlz+hOvMSKvqHON1XzSmfFDmd42QSRF6+8IesytSGBBXPbyMVNFz/MRq1dZqKbBhDTgxALnhQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR11MB4308
Content-Type: text/plain

When apt was upgraded, the '-DCMAKE_DISABLE_FIND_PACKAGE_Zstd=True'
was dropped. However, it was there to fix do_compile error when ccache is
enabled. See details in the following commit.

"""
commit 0aa7d612b8b7e5f14b4ed38f2a32b3f7eefca31c
Author: Robert Yang <liezhi.yang@windriver.com>
Date:   Tue Jan 19 01:23:45 2021 -0800

    apt: Fix do_compile error when enable ccache

    Fixed:
        apt-pkg/libapt-pkg.so.5.0.2: undefined reference to `ZSTD_endStream'
	    collect2: error: ld returned 1 exit status

    This is because ccache-native depends on zstd-native which makes apt wronly
        find it. Disable zstd for apt to fix the problem.
"""

Now we are meeting do_compile failure again when enabling ccache, so add it
back to solve the problem.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/recipes-devtools/apt/apt_2.2.2.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-devtools/apt/apt_2.2.2.bb b/meta/recipes-devtools/apt/apt_2.2.2.bb
index d1aa5de8df..7d1bce558d 100644
--- a/meta/recipes-devtools/apt/apt_2.2.2.bb
+++ b/meta/recipes-devtools/apt/apt_2.2.2.bb
@@ -44,6 +44,7 @@ DEPENDS += "db gnutls lz4 zlib bzip2 xz libgcrypt xxhash"
 EXTRA_OECMAKE_append = " -DCURRENT_VENDOR=debian -DWITH_DOC=False \
     -DDPKG_DATADIR=${datadir}/dpkg \
     -DTRIEHASH_EXECUTABLE=${WORKDIR}/triehash \
+    -DCMAKE_DISABLE_FIND_PACKAGE_ZSTD=True \
     -DWITH_TESTS=False \
 "
 
-- 
2.17.1

