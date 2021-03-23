Received: from NAM11-DM6-obe.outbound.protection.outlook.com (NAM11-DM6-obe.outbound.protection.outlook.com [40.107.223.65])
 by mx.groups.io with SMTP id smtpd.web10.569.1616532650229224688
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Mar 2021 13:50:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=YyT4Mpn5;
 spf=pass (domain: windriver.com, ip: 40.107.223.65, mailfrom: yifan.yu@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CSJWDITrfCwo1XBjAl/yDgjDOG9UuQ7rH0YeZa26shZIripa/FoCTS7JfvMvjSz/all3+TJ+jFbWXB4Eyr2b+wqmQybRdhYpoMYw/mUl+OZNbp+neVjWUFspajDJXwj0ADRn2bG1uAPE0v9/hE5qfFv7rOjgo39C7NwCBn9PhQ34VrocHO1Hj/bvZzlTy1+FpZian0ckfCia13+4RearI6tPq+uhLSDTpFL+R0HCLCQFVay7l+OAcHFC4VqV0u609xlJr7TSXlX302/quiDVSUAGiuVsOeAQLx8P16jW3LydBl6OCt9xhbGGhXltAIsXDEVgqV4ttEFT3JawWXgPGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=e4kOZSIEm19LH9kX2iKIoJq1w4EBT72l7G+qfifMU+0=;
 b=GmWwMAtyDPB0N0N1MiTou2NNGiJefBzj/WXROTbGbM+vOvgyrCOHOn/wSyuNrh5MPf3iNFXhxjZHlHwFockvlyn7qTy5MPl0362hQ4dVMreGjF25I9Heyv9FCBtzeLXj1OsQKmNSdN3VVMY0kEMo69wrBE+jRi4hotupOuY/g65iNqA3auE0hTmQnVqQj5CP9Ppq/YBzUujszwm8tWSkT0+ga8+0fWl3NuhiWGZgzyD1W95JbLspj7TdFh8y8RRKk2GzQN2Y2FgB8XsZInmS4GN1XYaRCQTADNUW2sqpEXexYjtfan0BmE/TRe1PLym4gpAL2wHAeY4bomVGYXVG0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=e4kOZSIEm19LH9kX2iKIoJq1w4EBT72l7G+qfifMU+0=;
 b=YyT4Mpn5zxkWgfpt+W4zFoXeV/yh+Qim9E8oqyAILNx38PhRvUAjAic11dSAxSdUwAGM0fyUbQzBTIK4+aIxSfAMvtve2NqyG6I7CActI+npHGmQi1/lPTB9nXsxZ/lU+NeHq9uxIoubJQygTPgPrpO74NBoZKUIuXZ2/RbqUAU=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from SA0PR11MB4719.namprd11.prod.outlook.com (2603:10b6:806:95::17)
 by SA2PR11MB5001.namprd11.prod.outlook.com (2603:10b6:806:118::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.18; Tue, 23 Mar
 2021 20:50:49 +0000
Received: from SA0PR11MB4719.namprd11.prod.outlook.com
 ([fe80::24e6:c5dd:a024:807f]) by SA0PR11MB4719.namprd11.prod.outlook.com
 ([fe80::24e6:c5dd:a024:807f%9]) with mapi id 15.20.3955.027; Tue, 23 Mar 2021
 20:50:49 +0000
From: "Yi Fan Yu" <yifan.yu@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [oe-core][PATCH 2/2] valgrind: Disable ptest swapcontext.vgtest
Date: Tue, 23 Mar 2021 13:50:29 -0700
Message-Id: <20210323205029.87251-2-yifan.yu@windriver.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210323205029.87251-1-yifan.yu@windriver.com>
References: <20210323205029.87251-1-yifan.yu@windriver.com>
X-Originating-IP: [147.11.105.124]
X-ClientProxiedBy: SJ0PR05CA0003.namprd05.prod.outlook.com
 (2603:10b6:a03:33b::8) To SA0PR11MB4719.namprd11.prod.outlook.com
 (2603:10b6:806:95::17)
Return-Path: yifan.yu@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from ala-lpggp3.wrs.com (147.11.105.124) by SJ0PR05CA0003.namprd05.prod.outlook.com (2603:10b6:a03:33b::8) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3977.10 via Frontend Transport; Tue, 23 Mar 2021 20:50:48 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4974bf81-8b34-4106-2fdc-08d8ee3d56c6
X-MS-TrafficTypeDiagnostic: SA2PR11MB5001:
X-Microsoft-Antispam-PRVS: 
	<SA2PR11MB5001B466B3F6D07304D9F06280649@SA2PR11MB5001.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1169;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	7K81aDtI+VtenV2pS1lHBa2cru8ihUO02q5gUEeqFnImajnqe0WyD1uwq66UiaUaPQc+4pZL7JZ+c8bddl7yr/TeYHDyULdKC0jPxNIgZtEFjV5T0L23Zxxa+MTrEssZBGwDCedouVvM2ZCqBq53uTlm3tZfUbDP/8+36vBVjSBhVKR/J1NLzomhklS0yjAy4E/ZHbjlKN5wyFxPkidL4NSiztT3d9OLhFJpOoXDRspPIyBrMRwm6/f0FYnSlXHa4cVR/woCHKDVIeWv1pVVaMMU5K52KjFoI1JWDSmaSxubxvAcMZ0T2+2SjzNRag+04rLibQI2Bpn4nvPkNjjg5uM3NFLUSHSUY6BU1wKYU/b/iHCWOIcNnMupWUYbxhqDY7BQBND+AwZ4060Zid9ce2OTkWW9R0sTmZcMVDk7b+0vuRinFxh+yu0f0GP+dzObIg4z3RzFFqC+SooTP6Q0Bqg4Dv60ndeFwZZ3Bl6mtU1skdkZBRH9927cYSPI5kICmybPeYGKiRD8I2Fed5YKhkfF1kfZa9bw3vXingy5QGfhr2CtAYM7KF5o4MmquUgnUQfcLonlBIzJ6Nldsl2V5703KxEGfXAgMxdGhyL7W76aaO4Oz0eEd88d7SdU91aG122F2i51BjFtsSrOslbJm3SE+r0x9kTYIc/vvMr+KpPb9j9zYVd4nFsuu4w2B8k6X/L+/rAJJonlZGvd6qDdVgSPv/jCc0fdisfULUK9/+Q=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA0PR11MB4719.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(396003)(346002)(39840400004)(376002)(136003)(6506007)(6916009)(5660300002)(6512007)(6486002)(2906002)(478600001)(956004)(66556008)(2616005)(52116002)(36756003)(316002)(66476007)(8936002)(26005)(66946007)(6666004)(1076003)(86362001)(16526019)(186003)(83380400001)(8676002)(38100700001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?us-ascii?Q?4nCH8Yn+Xbi0aeYCxdxnbExUPCImIXxkIINd7Trrwec7b4BUZG9MyXNip2Av?=
 =?us-ascii?Q?iGWEzGk+L3qQjoJ5y4ZII+wwp6VzSKj+CjDdhPfuU6UGWlgPaXoHR3JTodGf?=
 =?us-ascii?Q?BZjrt1A2IdEL1VE4TlmdWEp3JIfMHuUWBhRA6J51r5bP1mz1KMxfJ6u5FvSD?=
 =?us-ascii?Q?15pQelwEBTUqzfqo6dvrv1a8Zkfnl8V1NNmLVTm+PsxnA4F/Q9f7/sApwpuJ?=
 =?us-ascii?Q?vXlIzPRXreke4NwQXSIG+wdx/3AZa+27120rC1Z2iYwOaRRCLVrn+1Au8ZRC?=
 =?us-ascii?Q?rCq31RsM03pqTMZZMb6j0nHtG12S0hb5osTRb9aA6tFT1mANHWNh2sKIlVnl?=
 =?us-ascii?Q?oy8edOujgMN2ybhFXgAT4nSwXZzDV2JndmniVNzvwD4ZKTakYV2F5zrVileG?=
 =?us-ascii?Q?K9GYu91sRa/1Q5p2OEmEw5ic4UcPW+HcCsVU+M7EiN7pmMGfBazFA4dtMJo+?=
 =?us-ascii?Q?Qb26ncqcu8tSIOJUmNZ+hTgdfS2KqYnDmn+fWtoviY4LPCe/6jFct7dbUXmd?=
 =?us-ascii?Q?JkFP/tWspjL92YXq6pt9WuJ/l0lVcNWODlGqmIM69lywvZQqRnRoSKykMl+0?=
 =?us-ascii?Q?oker1OHgb3OUxOfNOVSHgsHk65JD/e+0kED0j6kFeODdU2/R/El3f3nsqzht?=
 =?us-ascii?Q?3ncTOJlYsTJbXMUokPxj7lNWj515cQESw9SfDBh0KOvryDT/S7/5DIKH+plL?=
 =?us-ascii?Q?pm1D6G47xNIkeUw1pwwLyW9p68Bndrdq/YCr3u5TPwQXIcXzr5KJSPrH48Ma?=
 =?us-ascii?Q?kMk19/ICQKox1nqCCLIYhBVvM8pEU4wow+olzt01FIrTLGKYDYOzhmTwXNtX?=
 =?us-ascii?Q?lrVtp3q9TEBNEDhIf9NFlZB7GqZgIEdbunyOnYFZzPaW5D+ZpHQ/VXDRTNO7?=
 =?us-ascii?Q?l0RiOUcMlquLaw9WE0bgy/OGqur2RBPCLyrapgfcSAum28uGsPpqRC9yT6GE?=
 =?us-ascii?Q?Ty8C+rxKRYlbD1R+6akFqm8ZSymtdvd3XAnkNoytEwJisTAc/MfPMWWtwBTx?=
 =?us-ascii?Q?MjV6veqfZj7HDE4y1BQ6AlOqqb9ft9D3JA//A9tAkyYQa8IVG9CgF064AqZm?=
 =?us-ascii?Q?It+Pssqn+blX2si6vNl3i24WbhSWJFU/tlQg5vIjIxXO0v5ld3rEE346yhj8?=
 =?us-ascii?Q?CwoKeK4K3fPJVx4UcQniOIRXw39PFbOTyp2dh5BnigGg1ucNqacwYW1mMOkK?=
 =?us-ascii?Q?N2Z5cf0Wg3bJOp+HLhNlBCjYO2jQUd6KS5QKXcqUHoM2Qoxq+h/YVRN0dat2?=
 =?us-ascii?Q?0nAr5cCjd/xsT+ipUrlAXH6enw/e/APPRLDHInT1vnv9DoksQPHyPam0UCmJ?=
 =?us-ascii?Q?y30eFT63lwtexuuuVKFPHazX?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4974bf81-8b34-4106-2fdc-08d8ee3d56c6
X-MS-Exchange-CrossTenant-AuthSource: SA0PR11MB4719.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Mar 2021 20:50:49.0613
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fk4HNE8U85X+HK3Dtr76rDVvTqnh3cou3poY1baxxKaBJGlanhToEBKrcKkSgG79QzSLdR43EapNvyUU+6mHnQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5001
Content-Type: text/plain

New test introduced in valgrind 3.17.0.
Test fails on both qemuarm64 and qemux64.

Signed-off-by: Yi Fan Yu <yifan.yu@windriver.com>
---
 ...orarily-drd-tests-swapcontext.vgtest.patch | 28 +++++++++++++++++++
 .../valgrind/valgrind_3.17.0.bb               |  1 +
 2 files changed, 29 insertions(+)
 create mode 100644 meta/recipes-devtools/valgrind/valgrind/0001-Disable-temporarily-drd-tests-swapcontext.vgtest.patch

diff --git a/meta/recipes-devtools/valgrind/valgrind/0001-Disable-temporarily-drd-tests-swapcontext.vgtest.patch b/meta/recipes-devtools/valgrind/valgrind/0001-Disable-temporarily-drd-tests-swapcontext.vgtest.patch
new file mode 100644
index 0000000000..f217098650
--- /dev/null
+++ b/meta/recipes-devtools/valgrind/valgrind/0001-Disable-temporarily-drd-tests-swapcontext.vgtest.patch
@@ -0,0 +1,28 @@
+From 0f1814a618eff4233e9e8379a8cb2dededdc5a8b Mon Sep 17 00:00:00 2001
+From: Yi Fan Yu <yifan.yu@windriver.com>
+Date: Tue, 23 Mar 2021 11:09:20 -0700
+Subject: [PATCH] Disable temporarily drd/tests/swapcontext.vgtest
+
+New test introduced in valgrind 3.17.0.
+Test fails on both qemuarm64 and qemux64.
+
+Upstream-Status: Pending [Needs more Investigation]
+
+Signed-off-by: Yi Fan Yu <yifan.yu@windriver.com>
+---
+ drd/tests/swapcontext.vgtest | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/drd/tests/swapcontext.vgtest b/drd/tests/swapcontext.vgtest
+index 98e3712c4..5492da31d 100644
+--- a/drd/tests/swapcontext.vgtest
++++ b/drd/tests/swapcontext.vgtest
+@@ -1,4 +1,4 @@
+-prereq: test -e swapcontext && ./supported_libpthread
++prereq: false
+ vgopts: --read-var-info=yes --check-stack-var=yes --show-confl-seg=no --num-callers=2
+ prog: swapcontext
+ stderr_filter: filter_stderr
+-- 
+2.17.1
+
diff --git a/meta/recipes-devtools/valgrind/valgrind_3.17.0.bb b/meta/recipes-devtools/valgrind/valgrind_3.17.0.bb
index d887f249c4..5cd5d4c264 100644
--- a/meta/recipes-devtools/valgrind/valgrind_3.17.0.bb
+++ b/meta/recipes-devtools/valgrind/valgrind_3.17.0.bb
@@ -43,6 +43,7 @@ SRC_URI = "https://sourceware.org/pub/valgrind/valgrind-${PV}.tar.bz2 \
            file://0001-none-tests-fdleak_cmsg.stderr.exp-adjust-tmp-paths.patch \
            file://0001-memcheck-tests-Fix-timerfd-syscall-test.patch \
            file://0001-Add-missing-musl.supp.patch \
+           file://0001-Disable-temporarily-drd-tests-swapcontext.vgtest.patch \
            "
 SRC_URI[md5sum] = "afe11b5572c3121a781433b7c0ab741b"
 SRC_URI[sha256sum] = "ad3aec668e813e40f238995f60796d9590eee64a16dff88421430630e69285a2"
-- 
2.17.1

