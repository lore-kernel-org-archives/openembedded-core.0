Return-Path: <sundeep.kokkonda@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 861BEC4332F
	for <webhook@archiver.kernel.org>; Thu, 14 Dec 2023 11:32:17 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.19903.1702553527984768597
 for <openembedded-core@lists.openembedded.org>;
 Thu, 14 Dec 2023 03:32:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=S4t2KrB4;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=0712d23c2b=sundeep.kokkonda@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 3BEBBCfJ008424
	for <openembedded-core@lists.openembedded.org>; Thu, 14 Dec 2023 03:32:07 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:cc:subject:date:message-id:content-transfer-encoding
	:content-type:mime-version; s=PPS06212021; bh=K9exzzxVeNRj5H97Sd
	25aawSzq4JwypV0nxcWcjHeoI=; b=S4t2KrB4p24FcsWAyin5Bz9JXySeHEyvfA
	AF+0WokLXAnsst5aaRG5FN2hojnIlkBrJoNaJAv8Cnl1YGSdPxX2cjLn8su0LuvF
	aX4kA9b/d2bjnGrr+FpTEvaDZU/nabuIlgFjDqfJazRggaggDzOoLvp/MDapup72
	/o2K9kx2K7Yl3diWFL3otBLhoOJ+nc4JS32ZO5ZXblgv78kDX77RZOhEn00Bywbf
	qWH4ysVwOLBxePBxKQhXJEFM9O/04elsraR/AtPeOOqhXPz+M1CVuusKhe5uCPex
	kQqSKvZiOjvp1vPmkl8kThqVe8DqCr3yffS/dVfEK8yFSoYgeW+g==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3uyr9k0ctj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 14 Dec 2023 03:32:07 -0800 (PST)
Received: from m0250810.ppops.net (m0250810.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.24/8.17.1.24) with ESMTP id 3BEBW7J5000925
	for <openembedded-core@lists.openembedded.org>; Thu, 14 Dec 2023 03:32:07 -0800
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10lp2101.outbound.protection.outlook.com [104.47.70.101])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3uyr9k0ctg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 14 Dec 2023 03:32:07 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JtSsRW+Uc1Y6AVCUVCqFoJs+QfTTK+OifKQs9p1say9Me5WZSZKki9qPncWEXpS9Vh5Ae9yja+3GrnZNbI2SiGOmg/r/qgzaWu4Ji1AHgo6GjgquItMAIOpY/PdJlF6ai+88M6oJCQEwPSlxkshQXetErQ0Lvq9V6XkmNPxN1meqC5CjjLzlKYdIKvidipwsYs/uNSaYa3bkcuCxrDRqtkxyHJ7tsoyNSxW3l51PH5WvY6w4S7tB4sBhafQap8cF0CtwXmYTjg68vREo5GWzpbeHa28oIJ4iHjzmpG0WFybrENlMVI7C0rQQXP8Y0fNZjmE+D6uxS1jay9wzohK1rA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=K9exzzxVeNRj5H97Sd25aawSzq4JwypV0nxcWcjHeoI=;
 b=Lf/ppJytbd5qCfN84dTuMDS85dnAS1cw1HRkC3RnC8vcedRFQt/Ld9vY8cm2qwIHTLKDoOXOjE+E5XyqPvqw7Rb/jyD1y1a4JzgwGJomKYFRV6zQJ+se+RR5T05QMGxwvFfIyDsVMBHGjL/tEHrU1ECxLnhzAR86g6lTmy9OksEJtW3gxAQQyIz9bI2j96vF69hJVXkoqyrhWr02qOZ4zgiqjGRAWIrsxXp9VUnW/bu3GQvvSu+d6GCxs4m9MS9TiwNJ61idHTtN/TQGESS+J5Yq6wEX9CU07tGFaXZNY8BiUmYpB1ImnKzL6ww6WmE36j0KdHsTOBQXrRuVZbhd0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CH2PR11MB4470.namprd11.prod.outlook.com (2603:10b6:610:4a::32)
 by CH3PR11MB8185.namprd11.prod.outlook.com (2603:10b6:610:159::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7091.28; Thu, 14 Dec
 2023 11:32:05 +0000
Received: from CH2PR11MB4470.namprd11.prod.outlook.com
 ([fe80::e78c:8c06:e457:7b40]) by CH2PR11MB4470.namprd11.prod.outlook.com
 ([fe80::e78c:8c06:e457:7b40%3]) with mapi id 15.20.7091.028; Thu, 14 Dec 2023
 11:32:05 +0000
From: sundeep.kokkonda@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: randy.macleod@windriver.com, naveen.gowda@windriver.com,
        shivaprasad.moodalappa@windriver.com, yash.shinde@windriver.com,
        deepthi.hemraj@windriver.com, umesh.kallapa@windriver.com,
        steve@sakoman.com
Subject: [nanbield][PATCH] binutils: stable 2.41 branch updates
Date: Thu, 14 Dec 2023 03:31:39 -0800
Message-ID: <20231214113139.3810372-1-sundeep.kokkonda@windriver.com>
X-Mailer: git-send-email 2.42.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR05CA0069.namprd05.prod.outlook.com
 (2603:10b6:a03:332::14) To CH2PR11MB4470.namprd11.prod.outlook.com
 (2603:10b6:610:4a::32)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR11MB4470:EE_|CH3PR11MB8185:EE_
X-MS-Office365-Filtering-Correlation-Id: bf9085c4-71a2-44f3-333c-08dbfc984c3a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	2lM2she4kmOQvzwxDRAfYKHVCA0pEscKZy+8PUPmdhF7OAWN7cb/YmRvup3Bfz/99aFEVWqHb40Lb4EUrg557mqxFFHtF1Wwo2rP//xErcJNR6NYobqytiHbNC9XTx5yHOGfe7lCHWZKW2cPUt9EhX40o+tjLbtF1uMxk7tUTmUH1T/APEMVU6vjP1haz84rpUOGTe0v1jGkC7Q32plsuxBaZ5C8u17zo7Vk058ONI96rihZDUtP8b68kJ+L02avVSnPgHJMjY2hKdYXN8CuI3VbvC2TFligKY2X0/F4TllHubHUhpXRFbq9dyd3VPaIGUanbB0jGVcPFF+BPWjXC1g1H9JDR2Ip5Lk2POhTv/XyS1QtPOypSvu1BYMtDZqOvcNeDQiTWcxqt06wSJngHyaa5/tczkboj9cVKM+i0nMZrj7pbLzcGLuIBHZfB4H3sVR5kyUur8QeTgDqdjihl+ntfBBVCw11T2ZACYh2s2zFczmidhM8+ZeV9rFyvTEmzzMAAs5vJMeO5NVAQHqpaDbyLygWrWoWOYCmgCYeojQWue5Cd5NR/JgPaSB2f0suoINY0+9AnxQkJQGnDL55S71b06TS+yZQlcEVtaNTb5Gye9jdVjIIGsliHyVFizuf
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR11MB4470.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(376002)(39850400004)(366004)(346002)(136003)(230922051799003)(1800799012)(186009)(451199024)(64100799003)(26005)(83380400001)(6506007)(52116002)(1076003)(9686003)(2616005)(6512007)(38100700002)(6486002)(4326008)(8936002)(8676002)(41300700001)(15650500001)(2906002)(5660300002)(6666004)(478600001)(316002)(66556008)(66476007)(6916009)(66946007)(36756003)(86362001)(38350700005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?bzjCoOJHrnFpjWXKRs2CewLU96czHDn0xOdMut/cSOLjaBhIq3wFf2DN7CrM?=
 =?us-ascii?Q?j1WBfvYVsGsyLpAu7dzGAzYasm3MiK7UJ1uHW3mBrVSCJxf93UGD5Z+JUL8g?=
 =?us-ascii?Q?vqM0qOeTwILX8JMJthkCduTDTb9bBxwdHZLOeznPBAbBMSyXKrbW/OlSco1M?=
 =?us-ascii?Q?Kq65iHfWyI8OQv3w1iryMxhaKUrwnWqgphSISJQpuCTGKtoMemoflCN5iR6k?=
 =?us-ascii?Q?JZEftEcWT1THLSTVKFphr87EptwFfBVVPugO0L4mWgo5wL1vD73vKPSpADcb?=
 =?us-ascii?Q?0A9cab19feWurdSUj9i/m4pXz5aB1+gKJCIK/+owwvniNqF0R2hYEU4id5Da?=
 =?us-ascii?Q?I1HaCMWjccRwzciZCee1qR1pjliuJhPOsNx1wyZapGj2RrEuNc7o2exS9gAp?=
 =?us-ascii?Q?/3bKgfIOmsm70yh8+y8iWosjwFX7JYLR/tispFOqyAEdCYx0Cpdlv73Rc7Nr?=
 =?us-ascii?Q?MgVXXihdNt4qxKvTBoTqTHvpmx++NubJIxSQAWz1p0qI4cFjE+LVX4Zf340u?=
 =?us-ascii?Q?wixZyzfdGgBWjoSpge6VUn6vsvaaLnDiI1ecpdZL61MQ14NFYFCA9NACVqmv?=
 =?us-ascii?Q?GyXIrXZd9wBRJMuCiHZs6Mm4SPoE+JM87Wxn1Zx6JQWk03xWfuN6DCBNqvhV?=
 =?us-ascii?Q?kOCfnG67u93/5kxXKkPlpxNeLkP0MygVBRFBWtniMrGcWsMYEF19dnNEsYwD?=
 =?us-ascii?Q?7+4myla9imR5qQWBKx7EETGOdW3tHJRxR4sHmW1NzdTIemvkgJkKycv9gEDX?=
 =?us-ascii?Q?Fx8QfOOyqZwllUwR2Lg5u38YK6yXlDatPJTw5tGWf19Q4gOc2QVAIfZXz4sF?=
 =?us-ascii?Q?JJOD3XoXvpvJf3HBh9XQo2KJcGYLQNYd7hAp/rZZY/piu2icv7kngIwx+7g4?=
 =?us-ascii?Q?fmlwDXD4/11XTrpv9Pxng8OQTHSvcd+CFh9Sz57nKoFkzxYpx34dveartrG6?=
 =?us-ascii?Q?ztQE+HVHQL1VUFFiraB/R3Tg2F3MHcD2OacIJRqwQJ3F/RAliDHWR+jNcfbO?=
 =?us-ascii?Q?1Ky8HrlbhN0UDK5hpSuJCrt4tHi6/y+6ZIxSXkBYMsOZqXDIMP6ZZFoqFv//?=
 =?us-ascii?Q?MuhCBmto8KauXsF64vtbCLwWger2fjUgSNVJuRmkN2Vmku2HbCry/t9saQ2v?=
 =?us-ascii?Q?53chRys1brT1g09aNlXoT7PnOOAd+D3GQf4V2BUATPjYBSySDEd2TGEIKSzd?=
 =?us-ascii?Q?TwR1E7mOsDtXDMyXoWE7TFe6q2jmkbLxGgsqqoZojVzgxmJB+Hy+3nV4RuYM?=
 =?us-ascii?Q?sdQEuGyNku/gpwx2VvQhDaE97tb7BjU6N6MqSoU6qagw4tTmBPTctGTPNsRm?=
 =?us-ascii?Q?HcnVx/1f11y3aXwQFbx6nXQ/lWRxCiW2t8FvNBXPcbBSsp7UKfaLJKutH7gf?=
 =?us-ascii?Q?Iwm4iFjnlNfsdGY3H81JIRWxsPQlwnDHvJp/dEExCGfQCRRIkBI3ESP1U1Bm?=
 =?us-ascii?Q?yqhjoAMoFB6+1rrgLltC8jL621A1rNFz+ZGvu/ANZug+1Q1TmPucvfICEY++?=
 =?us-ascii?Q?fy2gw1csHpDuAqEeCIAa5Tqu0HCVVsb55dW9yh6moWXJgcAuEcC9nSem+mwG?=
 =?us-ascii?Q?sQ8n9jz1BDAF4XABSIt3yz6rEKlOweWORkRt6COmyaNt20UPS3UtWDHNicA/?=
 =?us-ascii?Q?yVq+RPEuHx/Wuqcoz6fr8Ec=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bf9085c4-71a2-44f3-333c-08dbfc984c3a
X-MS-Exchange-CrossTenant-AuthSource: CH2PR11MB4470.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Dec 2023 11:32:04.9340
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cSK2Kxx8ytiHcR9cNqm5ZNv6fX4CiKcycLV0yUcu/11OVP+uHgrGvwt5ddm3TN4fh/830ZKVcrqy5yTw+1AcBgq2yMnl1767fLx55Is82r8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8185
X-Proofpoint-ORIG-GUID: 74o78qW7wE4vgJtHkbEfvuCVK-Om3cpH
X-Proofpoint-GUID: -FfWhHPT_06kqD-NJzKw0sq-zz3Lwz28
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-16_25,2023-11-16_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 adultscore=0
 priorityscore=1501 spamscore=0 lowpriorityscore=0 clxscore=1015
 mlxlogscore=666 mlxscore=0 impostorscore=0 malwarescore=0 bulkscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2311290000 definitions=main-2312140078
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 14 Dec 2023 11:32:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192357

From: Sundeep KOKKONDA <sundeep.kokkonda@windriver.com>

Below commits on binutils-2.41 stable branch are updated.
eb49941e7e1 Gold/MIPS: Add targ_extra_size=64 for mips32 triples
c27eff41737 Gold/MIPS: Use EM_MIPS instead of EM_MIPS_RS3_LE for little endian
7fe76f02413 x86-64: fix suffix-less PUSH of symbol address

Signed-off-by: Sundeep KOKKONDA <sundeep.kokkonda@windriver.com>
---
 meta/recipes-devtools/binutils/binutils-2.41.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/binutils/binutils-2.41.inc b/meta/recipes-devtools/binutils/binutils-2.41.inc
index b4934c02a8..d4b239258d 100644
--- a/meta/recipes-devtools/binutils/binutils-2.41.inc
+++ b/meta/recipes-devtools/binutils/binutils-2.41.inc
@@ -18,7 +18,7 @@ SRCBRANCH ?= "binutils-2_41-branch"
 
 UPSTREAM_CHECK_GITTAGREGEX = "binutils-(?P<pver>\d+_(\d_?)*)"
 
-SRCREV ?= "cb4c3555ac4cf8aaf0935cb6e4b09e6882436d21"
+SRCREV ?= "e13f70c7fcb2f4a39ddad4ccb83660dbfee2caeb"
 BINUTILS_GIT_URI ?= "git://sourceware.org/git/binutils-gdb.git;branch=${SRCBRANCH};protocol=https"
 SRC_URI = "\
      ${BINUTILS_GIT_URI} \
-- 
2.42.0


