Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 348AEC77B7A
	for <webhook@archiver.kernel.org>; Tue, 23 May 2023 03:36:27 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.13217.1684812978459948876
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 May 2023 20:36:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=SEMd1MX0;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=4507380cc4=qi.chen@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 34N3KFsg001390
	for <openembedded-core@lists.openembedded.org>; Mon, 22 May 2023 20:36:18 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to :
 subject : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=PPS06212021;
 bh=D758bVbJDl9d5nCdAJ0F6KwcYiXS84yDecnEhh49ycw=;
 b=SEMd1MX0ck7ViwbRcL6IUj6jGq4i7yyuIZVjxijY8byUKT1ucQ1V+4Gx+SU1Q3JS64iw
 phALCKEykz+fiJre4bDpH9ku3ZUGe6/BJMPAihXGp7QmHDYLsZO5TaedxmnS3mpCujxL
 eVk01dwxal8cTbFK8DvAxmZFA6ZtjaOf8GVxmQ1Uc5hdeumwNuXTyF6LhuGq6FvRf2aN
 7TXTxG98j/mtjJj6v0inry98Cd5B+enqYdPXMMn3Ai6HFrqvuY6ke8jpKCHUHCOpqToF
 1GJoQ7ab0eDQwG08lQQHhCkAaF+7eauAkg4nqGWZIkideM7KqRxcg+zo6HkVuRMo/IOH dg== 
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2042.outbound.protection.outlook.com [104.47.66.42])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3qpwqha56g-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 22 May 2023 20:36:17 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HN4OKiXNBmr33Dsmx/TWLjPVYGlCkSQXKrg6E3xb51e8KTPNRUAZwth+flQYXIvc5mP8RTW9eE7abVAU+bOpWyg2Gmj2kBFjnFQU00WTtuKKGzGIqAzha1Orpxi/mvGotlaFBkLEsRLhqEqDy9ZD5oSJWitmJU2DhKz4wqdYCz4wVR0AdY/o4+5pDjbG8qP+XNiltLkInUu7xeJitw1NyJG+QuFVXdcV8GzIwxcjAivW1gZJzDDB/YDbAX7jk6eY400huX+/ZvJsXJ4xAjacTyknkoNOZ/jqslJimOMAl7eyiylRzKiPwc/6BdLEwBcivPgzeYgSesTh6YTEj4TC2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=D758bVbJDl9d5nCdAJ0F6KwcYiXS84yDecnEhh49ycw=;
 b=nn/ewQT5C6H6w5DmCFPhh7qPNoa6MmviWo0CaxccqJvMQZnorXikW7FxbjehTEIVfvq9pu+nPgF3wDFyE0/R74IbZ1gTQtEa9qj8tenhv5a2oOu33iBq+Kb/ooZey//9rbUdN9XdHP3kISjTFvmjC1TvXdIlkIAhkSJ0s+nMFnl0cNhYOIwTYCtF+XOsMWdSoWgHZnQ2GByEdyBDoJ8ZjdGPXmUx0DfR9RDhhyg1jHv0E+mTW+LD6gxhi4i8ouCh27QawC1tYGjSr2B84SkfYvxekuMyAMKIRUPHaPi7cS0IwWTZTPNIY0yiHZFPFmwaDuUq8xRVtSMbztkwsm0Yeg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH0PR11MB5611.namprd11.prod.outlook.com (2603:10b6:510:ed::9)
 by PH7PR11MB6794.namprd11.prod.outlook.com (2603:10b6:510:1b8::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.28; Tue, 23 May
 2023 03:36:02 +0000
Received: from PH0PR11MB5611.namprd11.prod.outlook.com
 ([fe80::b74b:9743:5e32:116a]) by PH0PR11MB5611.namprd11.prod.outlook.com
 ([fe80::b74b:9743:5e32:116a%7]) with mapi id 15.20.6411.028; Tue, 23 May 2023
 03:36:01 +0000
From: Qi.Chen@windriver.com
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH] staging.bbclass: do not add extend_recipe_sysroot to prefuncs of prepare_recipe_sysroot
Date: Mon, 22 May 2023 20:35:48 -0700
Message-Id: <20230523033548.3590514-1-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.40.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR05CA0121.namprd05.prod.outlook.com
 (2603:10b6:a03:33d::6) To PH0PR11MB5611.namprd11.prod.outlook.com
 (2603:10b6:510:ed::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5611:EE_|PH7PR11MB6794:EE_
X-MS-Office365-Filtering-Correlation-Id: 011e0e17-c6ea-4d84-dc39-08db5b3ed473
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	l6tgxgDVXcfy5xtwt+wSry2RdKHgLgMM3NUDbFNDM8LYanH6bkoMu73QaRwJFacaFV2szjt0LOjYDGYfSfhQZeZCjTm38tmsTTiCRGLEsVGNy0aUuc4vWuEiX6Af7sTKmJ8lbdrnv5vM5FxWcQ4STAmyTu7U1HktBlFVJczHD3vMqU3wXTwaJb5/kgr7x401imoG0gJJAcaApBXWUZYpLOLJ8NHlZ6N79shfjZqeu4c/zoCYxQhDgGJ/JTA+eTmyKMSuFCy9d6yM3SmHIOvjPndwWhpCraJsfhzTqJXrYiNC22599DPaXqXdhTb37Ju3W7YPaSAyKuNU3SkMyL2xbPrZ3sxVc2/5Ly7udpaf1qWHDmR0Ck90nNIpPtwQLO3dQn+atSCW9kvfCfPC3VFU3iRqAPWkrZ1jfVVJQYxk6CstQjRE0IG1NXDKx7J3i8N2D9pqSyCm9jT/xKSqjU/G/28ZUbMT5hb/9EnDobAN5avv6HtUu+dN5TssqEpRsExqU83abp1LueIxv4a0N2jSfxz0NzoEMaxGFGhFIskBNofvLQHffwflq8ZapdiDiVOXI1WI3rM0dbGX6jDpInq/O7k1Or8m9Bj5OCtHrGI3ovnF/ValqcgbsYP0XDDCVOs0
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5611.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(136003)(346002)(39850400004)(366004)(396003)(376002)(451199021)(2906002)(5660300002)(8676002)(8936002)(6666004)(41300700001)(478600001)(316002)(66476007)(66556008)(66946007)(36756003)(6916009)(52116002)(6486002)(6512007)(6506007)(38350700002)(1076003)(26005)(38100700002)(2616005)(86362001)(9686003)(186003)(83380400001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?iHGaemTlezMwSx3kkBHHfwG2m9Joj8g+znpAWPPp496B6yHsMUhu6JUvore+?=
 =?us-ascii?Q?Y4b3bSPZ4FxvBfy+0WoXUQKc0T/EeukSQcqtftXCNQtkKhKlriCp9OhwIuGH?=
 =?us-ascii?Q?0MS7ssS8zvJB14AKEAPxWJtfKdDNIqPeYLF/FnIXazWhjASGxI7kNjmD0VIm?=
 =?us-ascii?Q?f5QXgr5u4njxjZygqznMXsiaHiKE2mldHyL0lvSD8jgBQw94hlvJHYnB/dc5?=
 =?us-ascii?Q?zgK1PLsE3FI5P9UN/42Y21ZFlB7/rrlyKZcOMf73Sc045232OPwQF80uKbBz?=
 =?us-ascii?Q?+YKWGDcbjlT7I9IlMlwHyPptGAvSibCRb7J3A0Gx157RatyqbN1VVYKaOsIP?=
 =?us-ascii?Q?ah64lxjNZPeWWFsd5MBt/uDeiZ/1HXguzcz626hcI8pJARjwRRuujjOoZu5n?=
 =?us-ascii?Q?wgj7FtvKJxM3JrykSlmKh+/pOF2Zi5NPTtHXQ+bjZVaqK0vj543sI5MrhK1A?=
 =?us-ascii?Q?TCHbs4aVl87BTodEMBBlQb+rQbnIAdQEKO+alb7nRPMT2nGuofQEWn/4H/QY?=
 =?us-ascii?Q?Yjv9DCE49NP1K9w67l6p3kQ5J058VdKzpBDswMbiNdLYbUkA6+2TUUdJWiDc?=
 =?us-ascii?Q?OIHFqj4Mq59fce5tiNvAgTu7Ecs+jXROnDRxfhucEayfw3rsRuV9LUBKO4g5?=
 =?us-ascii?Q?pb1olWDOPIj+9q73MBhrTtGGMkVYpwK18djfsTmOtui6booHx/jrtLmV2AbG?=
 =?us-ascii?Q?xRjH25phdSGHt4rERLm3uDflkKwHOL7nC6RUmPPMfX56zBuokRoQMUesaq3P?=
 =?us-ascii?Q?dB7zx39W1SftfRI+0Kirh8Qsp/LwKG90YKStlIsqEJY75U9J+kx2EghxEFW7?=
 =?us-ascii?Q?WEDud3t2cCM87Ii+irYvJH4qxW/5rFM4MjeHsAgNWZg+G5j3jZkUSv32DVLg?=
 =?us-ascii?Q?NvP5tDqrXxBeGu6KUZnCoKF5v5Pg699jL24vnlIWGacVdghJMBSXPFapN3fi?=
 =?us-ascii?Q?7gpt8bhTydssbzCJQoPGdq5Blb9h+ESdf5gBxl0ntFytW6sEmXXvdk//NW0r?=
 =?us-ascii?Q?PRAh0gJ8XAb8L8FKFjlxqLdPe8PCani0RifzZiPgO2+yRHhAMQNIdmyF73Ck?=
 =?us-ascii?Q?lqyAYSBdPp/hZ2oqke9oXULDSoxtDtVNG9h7n5+PasIzK0YkK1IxazZMQWa0?=
 =?us-ascii?Q?mVRVUHVQpo49CyxCxCYKOU5/j43tSAqYcFqgz01W0RLCCFvpgGJgsyGS/+gs?=
 =?us-ascii?Q?6H123fwVQn9XavsWcKnp4tMj5rWlSKSP33tl/GnFS4PTihWmt38AmJez3jG5?=
 =?us-ascii?Q?47eJ3IzzrmvzthzE71iucnRMq3szSGfDKan+gbR4Z+nD5QvIWgLTmzqva7KQ?=
 =?us-ascii?Q?sWzRWmtRNgh12X1OP8OhPpKNmcw3gh6Mc0mM0fJEUrz6cbFt3H4r5PNBkQQb?=
 =?us-ascii?Q?+FUTxNCi+llAmgZ+mPSNm1iINwwglOQRtExISF+A22v95+/o3krd5Q/1P1Mm?=
 =?us-ascii?Q?LhCke6luBXfZrirF8+/WtcZkjLysdA9D/JGsypFyrt9zoj6A7zAoOkABYo24?=
 =?us-ascii?Q?6byMAgsJmS/5oD4FNjD1QgzmKUFQ4MMEde4rBsoSmpqTbwCKWfjAVHpvZ0GD?=
 =?us-ascii?Q?LfM3vdEC38tp8UUPtTy3qWFxkOy6hbKNTvGayNbezGWSgzI04tOHiPq+1Ryx?=
 =?us-ascii?Q?6g=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 011e0e17-c6ea-4d84-dc39-08db5b3ed473
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5611.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 May 2023 03:36:01.6559
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: t+TRg2qjyOOMec0OXlHALaxjnb+cy+lYHnDkWPoZqo3dKBZq59tf/5+liSj+7TVWqIphLGG1wjpHQ3gMVVcJfA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6794
X-Proofpoint-GUID: hBib7AH5eV-m7QGzsopH8rQw4YOrgdFq
X-Proofpoint-ORIG-GUID: hBib7AH5eV-m7QGzsopH8rQw4YOrgdFq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.176.26
 definitions=2023-05-23_01,2023-05-22_03,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 mlxscore=0
 adultscore=0 spamscore=0 impostorscore=0 mlxlogscore=773
 lowpriorityscore=0 clxscore=1015 bulkscore=0 priorityscore=1501
 phishscore=0 malwarescore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2304280000 definitions=main-2305230028
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 23 May 2023 03:36:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181625

From: Chen Qi <Qi.Chen@windriver.com>

When running prepare_recipe_sysroot task, the extend_recipe_sysroot
is run twice.

What prepare_recipe_sysroot does is executing extend_recipe_sysroot,
there's no need to add extend_recipe_sysroot to its prefuncs.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/classes-global/staging.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes-global/staging.bbclass b/meta/classes-global/staging.bbclass
index 6eefba4d73..3a300c32e7 100644
--- a/meta/classes-global/staging.bbclass
+++ b/meta/classes-global/staging.bbclass
@@ -654,7 +654,7 @@ python staging_taskhandler() {
     bbtasks = e.tasklist
     for task in bbtasks:
         deps = d.getVarFlag(task, "depends")
-        if task == "do_configure" or (deps and "populate_sysroot" in deps):
+        if task != 'do_prepare_recipe_sysroot' and (task == "do_configure" or (deps and "populate_sysroot" in deps)):
             d.prependVarFlag(task, "prefuncs", "extend_recipe_sysroot ")
 }
 staging_taskhandler[eventmask] = "bb.event.RecipeTaskPreProcess"
-- 
2.40.0


