Return-Path: <Deepthi.Hemraj@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19895EB64D9
	for <webhook@archiver.kernel.org>; Thu, 15 Jun 2023 12:35:11 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.16995.1686832507665154053
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Jun 2023 05:35:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=dKHW8tWc;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=55308c5f0f=deepthi.hemraj@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 35FBJbCl004963
	for <openembedded-core@lists.openembedded.org>; Thu, 15 Jun 2023 05:35:07 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to : cc :
 subject : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=PPS06212021;
 bh=2VziMqolVjnddvvhCE4Ae4yUKRpv0gLJv+MqNL75N3g=;
 b=dKHW8tWcNBo1U4sG5aASmqn51sYBQgKDD9TZ5QEi9amIT6ByvuzI4fdeRM+kT11eyMcV
 OglEhRJXLzs3ojC9ryDodLoI/Zpv0S4KFgkFsxeGqva3i5tXvTv7IKiuUo5m04/SHAUk
 bn8kQVEvpemJWe1pQmJiqsdBwRcRiHPypNeOsuqHFwDvJLkB4KpePH7r9VXS2PzISh7E
 cwcllboAFhiM2YDFisU6i6G/TvLle2r0cSX3dkqmbfW7XSlBLy/NB1js9ZNosZR2AyVE
 HpLosZR2igXgai3q/qycCVuTHTYeEkvS9JjD6TrIE4jMhmhUgXGhWf3nyVevvOt5qkgl 7A== 
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11lp2171.outbound.protection.outlook.com [104.47.57.171])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3r4mf34qqh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 15 Jun 2023 05:35:06 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=L04UGFB/IQ7mijuYqRnCIdk9DZEqRNrcJaTCS/pTgPnRbPjVJX+tonMAbeuXizZmEexJ485tl5oDIGwuzrCAXpuJtWKn5ViftEhwOcGahMsW9xdPF0TP6XWb4z6Y+onvFPek+A0+2dTYAqFUm/ZMQnUAFRvKuBgHDd5HWYeR5cRrDanCY1nOz+DeyFmPTLuwWwfeD66O8S9E+GeVpsVMakHwfPEFsCBn9eMHIIocZn3yyEKtf90XvTPCu5eVNL0+UTEnBY3vp+oTT9azYZwJzw633yHnRixEH2KYMBma/A3wbckGXpoi6yjiVXbvyOIPNEIPdaJJH2+NBXyX2VEeng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2VziMqolVjnddvvhCE4Ae4yUKRpv0gLJv+MqNL75N3g=;
 b=jx5a2SDFjzkFxwluhE7dr01C8JmPAFfmfvmqMZCq4yZfFD6I9jgiUSk7G93rFdY3wDgSWoQZ4LkgHhVVfdKR5XwvIx5K8ladSJ9H9W+39zX1RMsvQwz2fZelVLmV0LfTSLNcs+HyC8RveIZFU0AIHoSRQtUkkOFoIv2ysQoYYhY2SCzLTM821/JTP4hMjj97/oFy482vDUE778YT4gGE/pqiv0RjWl24sVnd5ZmYiB8/TarOEd9oCXhitM6Y/e2S88tVY3ivW6LE4IIwyi2IVmwkIAy/rxIs7AfPEElQFcY/wCQ7SvsAAASimh/cB4Xs6sIWK57MrvOVygCPfpcgNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH7PR11MB6449.namprd11.prod.outlook.com (2603:10b6:510:1f7::17)
 by BL1PR11MB5349.namprd11.prod.outlook.com (2603:10b6:208:308::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6500.25; Thu, 15 Jun
 2023 12:35:04 +0000
Received: from PH7PR11MB6449.namprd11.prod.outlook.com
 ([fe80::8017:7ce0:9b2d:6f04]) by PH7PR11MB6449.namprd11.prod.outlook.com
 ([fe80::8017:7ce0:9b2d:6f04%4]) with mapi id 15.20.6500.026; Thu, 15 Jun 2023
 12:35:04 +0000
From: Deepthi Hemraj <Deepthi.Hemraj@windriver.com>
To: openembedded-core@lists.openembedded.org
Cc: Randy.MacLeod@windriver.com, Umesh.Kalappa@windriver.com,
        Naveen.Gowda@windriver.com, Shivaprasad.Moodalappa@windriver.com,
        Sundeep.Kokkonda@windriver.com
Subject: [mickledore][PATCH] glibc: stable 2.37 branch updates.
Date: Thu, 15 Jun 2023 05:34:24 -0700
Message-Id: <20230615123424.2247492-1-Deepthi.Hemraj@windriver.com>
X-Mailer: git-send-email 2.39.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0134.namprd13.prod.outlook.com
 (2603:10b6:a03:2c6::19) To PH7PR11MB6449.namprd11.prod.outlook.com
 (2603:10b6:510:1f7::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6449:EE_|BL1PR11MB5349:EE_
X-MS-Office365-Filtering-Correlation-Id: 31be4742-3267-4941-1e1d-08db6d9cf1a2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	cAImnOEA/248MqptzsRSG/XCOsYy1YYxx2++fGPCmcwxEPicghn/qJ9mtKmbljQk8cTH7SWygPS/X5Mw+XUAZV09SNJI23/YS68IK2XI11tClAClcUCEIMmoLNVY/3uhVuNheGgSR2iIMXbSI22IEgIDLgyhwYNlTMuRjEZaZY+yCN3cE1yXE9bI2YA32sCse1X2nJWnSnUY0wO2U6Sizn0cF7FLGWnd7VLTWLA/ekS9YNrZF6Ukp/1yk3WrpM0eWRFJRSoZz9VQ6gDfsao4xpxJUGom1EPpU/HUXMCA6lYuATZbbBDKOfJBHGVzDUvfVauGmSwQ6MNnRo3fFrT/jdyS2wO7tf9Xl8lZ2JKDCJ64ah129V6ncuPcL9eW+bMVauDfBRFjF/Bcej1zEX90UL8CCaE7dgWO5X1GEbSOyY5M5vk8ZzO/pDAsQlJtUiGz1gYGYc1mEP29gHlNoU5j2CjzRLW3g35F3LzHNtGO+6mfvKTACH92J0NWi1lLtGsyVfpQRwqYEE+H/lzf681dP/rioFSn1NOGjsB3Et+BoJ3cTdwM+4nMuZAsYBCt/jy3qUvim7eka5AvOY/Yoeaptzt6u9xi81mU09c/aeEfQwvdoVntYafKnfMCGKZZnGXVmkMrm8lekuW6dB7VZozyfdZOzhMMRGM8DjBf4WYXdHo=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR11MB6449.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(346002)(136003)(376002)(396003)(39850400004)(366004)(451199021)(5660300002)(38350700002)(38100700002)(2616005)(6506007)(83380400001)(1076003)(186003)(2906002)(15650500001)(6512007)(26005)(107886003)(478600001)(6666004)(66556008)(6916009)(66946007)(66476007)(316002)(8936002)(6486002)(8676002)(41300700001)(86362001)(52116002)(36756003)(4326008);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?SEj5C0DHFpTjTXnnf3LxZpziZuqiwoDwJiQhrW26cr9aKWChoOvu/dcw4IXy?=
 =?us-ascii?Q?6WiNKE+aKPG6dWAGxg68DcsEDXPvRbhndyE2+KaryZ/ysLHKm7I9PQuNT+Tc?=
 =?us-ascii?Q?3K8QEoB1RdN7GBUrhWw4+53lbzs+kf5aW2TUcLMeuWfybkq0VE94wVpgQW/C?=
 =?us-ascii?Q?i+qp7aPrciXdOLGCNKlsaza3rBPWfQ03+cpq6tWo37Fm4fiJcCERI8RdYOyh?=
 =?us-ascii?Q?oUSG+MXGv5nBzqj0uERgmHh5NX6efJKly8mnWztyoNy4QVI4sv1n2pI1KHnB?=
 =?us-ascii?Q?+L5fWHUw05lQe9LLmjkTvI+/EaxvMFA40ikJR6TGRVKrP9vbNTsN6c/Su0W6?=
 =?us-ascii?Q?57qRggOXe/itUsE77nA+nPJ1PZCYrHtl9Bl27Pq62qTAVkb0A7LRjzI3+SHz?=
 =?us-ascii?Q?q4M18KPm7eZxrAlvXJxLsngoY5qnSaGlQ2JKy8qc2VQKcLh3y50t74lBzjTW?=
 =?us-ascii?Q?wsHuSOchWki0KEDTZOMfxQANBtU10chHx0uCkw0qrsibJjwlUBRnU1xNkGO5?=
 =?us-ascii?Q?jFOswZCkq75XOP+qNiro6eyQPZPM+XOwYFQ1/3nFHPNPDYANvKVKKv6o1Ar8?=
 =?us-ascii?Q?XRSxPWzs5QHz6kZFLfnH3gCexKW/cypz+R/snJkHI+hR4b0zC9Au9c8Xj/3I?=
 =?us-ascii?Q?qQ1Y552o850itw9Q6RC89y+8tMb3Rl0oglsJtweUDT3CMvp6OjIj8Rx766Iw?=
 =?us-ascii?Q?cKyarZ3lRezltIStov49iPv/z7FqYmGQxiDeG0cBWNXVh7HX2FqDtdZsTcg9?=
 =?us-ascii?Q?5Q40BEZw+8e2eFIAs6XLovLl/R01tFyggn4SNjotL1IXa3GfxzGQARwW2L25?=
 =?us-ascii?Q?xHJsQSpLBMHjcgzSFlIjRfRHH/BcB6NeImFIk65E/+tS8M8yVHWcAKSdP3bg?=
 =?us-ascii?Q?2vDJ/Ai6yP78tpk42Ip20R8If9r+ed6fVIVoVQQSXntLb1tmw/Lz/eXw+Z7t?=
 =?us-ascii?Q?24giYOSDEGOSq2gMFxbD6CbkXQSbhQJUiL13Gd5gckj+8+pVwI9Y5Ov+Fw4Z?=
 =?us-ascii?Q?6VHXmJRapZzlgZAtwaczD33u2s/O8AP/h0/yIfM7pL3KRnHq+dCZ+1zRUTLm?=
 =?us-ascii?Q?jkxTQgZyfHbdykUaHHhWP7fchzP3zbs0byiS4lTbVfM/5TDyee2Rgk+DIzU0?=
 =?us-ascii?Q?FoolD7wfq7UFkU1XVfa2hepP+N5k9KtjMOpa2n/EUbEbsKmmG35KYFypveOR?=
 =?us-ascii?Q?IRY7aXaCt68uPpEPBbWPesshH6NKW5G9CwcmJMf/aa6h+rCyLFAo3Fjxgqe8?=
 =?us-ascii?Q?l6PiC3filMyrfCohx9WSzS9ogprYk6lbZWs+K0zEP8a32H0mTUG0KJxMSqkq?=
 =?us-ascii?Q?V05gJR1MNkezPGqMIPIbNu9cM+BVpC59rIctV3GHSTKuKFncW/V3tMQRSBkE?=
 =?us-ascii?Q?/NtWSg4RGYgix0CwbEeHmPo6unynHt9W7Ev5NgQg5/6Gps3OOAllpu91Pj6q?=
 =?us-ascii?Q?VwVDcy4u89uwLUbTc8r85MfuVAsb2QzpCif+BkCbBZskvjtMAbHfb/3tKpiD?=
 =?us-ascii?Q?syaQFTMteu+Qsp1wEmH8TzpexoYUPqQFJrqLI1w1PdRvczb8qu7QdHm0Rmvm?=
 =?us-ascii?Q?SEX2gUwEY+RTlU6K1tP98JT4ZB5s/Wv9OcJBw3Gpc6qdsa5QSd1H9lSKeatk?=
 =?us-ascii?Q?Hg=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 31be4742-3267-4941-1e1d-08db6d9cf1a2
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6449.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jun 2023 12:35:04.1577
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pEK1gppa3YgJFjk7n/4Rywj1MLNI58M42lDnObrpXntPJEB01fVgH4EB/z8A+6itNSERvQlR6JNU/vSjegbVpT2ZvJHZo/5min2a9aAsf4E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB5349
X-Proofpoint-ORIG-GUID: pRvnkf-S7G3QzsOXKLO05UIht2wkatzf
X-Proofpoint-GUID: pRvnkf-S7G3QzsOXKLO05UIht2wkatzf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.176.26
 definitions=2023-06-15_08,2023-06-14_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 bulkscore=0
 clxscore=1015 spamscore=0 suspectscore=0 lowpriorityscore=0 phishscore=0
 malwarescore=0 impostorscore=0 mlxscore=0 mlxlogscore=535
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2305260000 definitions=main-2306150110
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 Jun 2023 12:35:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182853

From: Deepthi Hemraj <Deepthi.Hemraj@eng.windriver.com>

Below commits on glibc-2.37 stable branch are updated.
3593050c27 (HEAD -> release/2.37/master, origin/release/2.37/master) io: Fix F_GETLK, F_SETLK, and F_SETLKW for powerpc64
e2974d26ce io: Fix record locking contants on 32 bit arch with 64 bit default time_t 0e3e9dbb0e Document BZ #20975 fix
f5d377c896 __check_pf: Add a cancellation cleanup handler [BZ #20975]
b4f76ecc9e Ignore MAP_VARIABLE in tst-mman-consts.py
7c32cb7dd8 gmon: Revert addition of tunables to the manual
a908c18d47 gmon: Revert addition of tunables to preserve GLIBC_PRIVATE ABI
ff3a71ec1f gmon: fix memory corruption issues [BZ# 30101]
d230623264 gmon: improve mcount overflow handling [BZ# 27576]
5d750495db gmon: Fix allocated buffer overflow (bug 29444)
78ab913eab posix: Fix system blocks SIGCHLD erroneously [BZ #30163]
9cc2f41e52 x86_64: Fix asm constraints in feraiseexcept (bug 30305)
97ad4c64b9 gshadow: Matching sgetsgent, sgetsgent_r ERANGE handling (bug 30151)
1d63573f81 stdio-common: tests: don't double-define _FORTIFY_SOURCE
590d0e089b elf: Restore ldconfig libc6 implicit soname logic [BZ #30125]
790e504a17 stdlib: Undo post review change to 16adc58e73f3 [BZ #27749]

Signed-off-by: Deepthi Hemraj <Deepthi.Hemraj@windriver.com>
---
 meta/recipes-core/glibc/glibc-version.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/glibc/glibc-version.inc b/meta/recipes-core/glibc/glibc-version.inc
index 37bb9fd34f..69e637e810 100644
--- a/meta/recipes-core/glibc/glibc-version.inc
+++ b/meta/recipes-core/glibc/glibc-version.inc
@@ -1,6 +1,6 @@
 SRCBRANCH ?= "release/2.37/master"
 PV = "2.37"
-SRCREV_glibc ?= "d8e1a7590d375159fb5aac07ad8111ab4699e994" 
+SRCREV_glibc ?= "3593050c27dcf691f670fd3fa9d347c99351ed2f" 
 SRCREV_localedef ?= "794da69788cbf9bf57b59a852f9f11307663fa87"
 
 GLIBC_GIT_URI ?= "git://sourceware.org/git/glibc.git;protocol=https"
-- 
2.39.0


