Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54E03CD6E60
	for <webhook@archiver.kernel.org>; Tue,  2 Jun 2026 05:54:58 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.18471.1780379691131713114
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Jun 2026 22:54:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=U0Rc2DUP;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=061317d246=qi.chen@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6524DSZT759506
	for <openembedded-core@lists.openembedded.org>; Mon, 1 Jun 2026 22:54:50 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:message-id:mime-version:subject:to; s=PPS06212021; bh=/hNrkNOsB
	YEe3//QweXh0ULMsVri1NwsIARYCsw6dJs=; b=U0Rc2DUPBwEImX01kMPjkMn4l
	Bktz6JnSI8sWSa57KPgI767JAfMWtDVhVaz4SLNjmtOljYrN7dHtQM7wKr5kxnb/
	N9LQJol6pXVZB1gxJ5TiYJJsgLhO204Veh+8wrVba6f7uO0p5QK5olNqh7fPBcsg
	yyk29+V5dmKcJj/8hwfseuKBGS1mwMamYl4oe9+WC3Zj6UuYSoQ6CKDherHOpziU
	FKK595CFwoGZt9yu1qYfdBW3x5bVilwqalEgixLOFuQCReH49XaO8e3sDRJ2NdcN
	ZNBfWnzBRxvyAP2egXXwu/3fcJMXg+cysPsUO4tRyMKx/kpuU8Wxob+njvA1Q==
Received: from sn4pr0501cu005.outbound.protection.outlook.com (mail-southcentralusazon11011032.outbound.protection.outlook.com [40.93.194.32])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4efu61uyxb-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 01 Jun 2026 22:54:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bc4kXGXbfO+QmFP64J/QNpWwXOaogboGLZdP0ie+s4eFfhsvPet+CQfSMUZH7qG4BKnOLOBbQ4TlcGEzoegoAnNDFAzT2wZ0uQ4yZCvVPpzYVmvyroe6WZJ7QLaJzDlt4TjEdhmVAh/VAfbmOGoRkehN1SJVFiJ9LX+bJVeW2VhcleBLMLDZ9pY7glqhiwVtJmgvXEIPFvWYOlycFniHPPkzKKaVTkfFWBB+CA/0ObzaKdrfRDpqfeWQZK9p6wjqzcVfYxGZzAbMnQD41nInvuh7IpBZV1CSuHS5hkpNR+VRY3GQB4K/X5Ecl899fS7eG9DlKOzIGGyEJBR+zU+X0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/hNrkNOsBYEe3//QweXh0ULMsVri1NwsIARYCsw6dJs=;
 b=zCNfjcZaHTeOowm7WRuINbHETIR1mKx4wddLrFfbyTtSQAcCeYDJ9O/z+Q5bBo9B9uaMV5dHTaZ/+Sy+4GAl6vNAHzlrbSOVakB2RVhKRI0w8YMTVEb3aoC3tA30D8LV4Qp6X6eTPUyvzCIhWgpBEhuTg9tNcFZGAnH0nH50PA4Ca8JJN7B/2ebAIDD1uqm9mYktHtmvbQZZm7n9Ke2iR9g2i/ADGsIl6y0LvS/UrExTbVxiCgKeBYhFREF/9FJfvIsF8S70ev+ckbdGNZRvjA6Q0I6pDZ/mjD4uME6+Q/VuLW+EQS5L+ShqCyoBwSHBi9MFDwQuA08j4XXi4LOI/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by SJ5PPF50B3E12BC.namprd11.prod.outlook.com (2603:10b6:a0f:fc02::828) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.7; Tue, 2 Jun 2026
 05:54:46 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::5ad6:8f90:b01d:2c62]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::5ad6:8f90:b01d:2c62%3]) with mapi id 15.21.0092.006; Tue, 2 Jun 2026
 05:54:46 +0000
From: Qi.Chen@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: alex.kanavin@gmail.com, randy.macleod@windriver.com
Subject: [OE-core][PATCH] devtool/upgrade.py: add --stable option
Date: Tue,  2 Jun 2026 13:54:27 +0800
Message-Id: <20260602055427.1625365-1-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TY6PR01CA0036.jpnprd01.prod.outlook.com
 (2603:1096:405:3bd::10) To CO6PR11MB5602.namprd11.prod.outlook.com
 (2603:10b6:303:13a::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR11MB5602:EE_|SJ5PPF50B3E12BC:EE_
X-MS-Office365-Filtering-Correlation-Id: 6dfe4a5d-d920-4064-a9b8-08dec06b7325
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|376014|1800799024|366016|18002099003|38350700014|3023799007|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info: 
	zdWIBW/T2T/qDzOmZmvhSTqeLu1DsFlJ3C3H2xF0pGYwrYaJKLVB9utfuLf5vnaYvxp4E+hAfAeuS9wqx8hLA6SfXuwM6DJFdXG5jzjOSbQlMy7o6/YpSHDA6DMjfFY5rS2AM1Mi5c+DHoFtjPYzwaVKSe483fLbwXhZ9TAoE2Qu0BuzyND2GCrZMj9FKxalpLvV9jNFMKhpxrylKu5p9WvgbgY0yoO0xBnUhzqzcy6qYi4TeXDXdD42eDZfPywMC1Fcmhh+6BaD55sWu2UFiExFmIObd6Sy1+M9/kTQzqls4F+i0AnT31nTf4796qHGgTV+/swxywRTeNpeG+k8+R6ky/AWrLyk3b91VqZdywR1P7wKB6OXl7bz8l/WjwN8cLB6sUDAE+U2+UgT1LU4cDhXm/Qkdhn4M+36r/m8XLViqEXBEwkO5urjhX4roioT+T9+4Eo0ZJ51qKZmbIzjVzaoZMG9YgfM8lBZQPGYORHp5U7yy8uQdapF58anaySnB8uRs+85yO5XqSlpfJf9OMHVrFO16HDw5sKZ4pqP34/gjftRbGVkmRMYOiNIQkNLKcoixOMZDq27MtQpTPsY//apSjZ3gq0p9e4nxC6xc6YXp5obSitGjfc2SFFH7ikpCMRUOJtVF2RYH+lmUp9z9aIRfYPaCnrWuMZ8hueaLSPgh24iAeV1euEJekPBntcdd7c13Jg6nevVWDd97DmsG2V3EYecm0OaYeZwGcjhFo2qv/3QNk2sBj0mijVdUUiX
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(1800799024)(366016)(18002099003)(38350700014)(3023799007)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?63PMgRX5qplfece+y+Ra7xppIepP/wspilDIM3Yk24msDpqlGtO05cyj3h7K?=
 =?us-ascii?Q?/WjCKX6wrmt13eXXHsH8RnEOYry+q6iZnxMpUKPaKDrZ996P9ZMiWBKWhpxa?=
 =?us-ascii?Q?dfmZqEJDx2xWMgl6uR+RkMNkzvashrNGhBnEjJkErGJkNC/34ZoT6lx9tLau?=
 =?us-ascii?Q?xkclIMcokR4VSSGvSt7xnjiq4KKfVTC8+lCfLEA38Dh46lUCHhExPAUpD8iD?=
 =?us-ascii?Q?07ZwuVz+heyV886fZCLgiNlZbMzN9L2gfXR2RzqPJWbblQE/MsLt1PtbcAUc?=
 =?us-ascii?Q?vPhm2k9hzxdj1Al2whey12GFsurDPt04JmYe2L8mdM0r+sSssMKHZKP77E5R?=
 =?us-ascii?Q?ST8JueIFisVs7dXLi2yd+HgmJl0s3X+JriuBhNz0IX0O0OSD9NYmMHdBC099?=
 =?us-ascii?Q?4ChkZ77poZD99X3zrm5971t3dLzVzmqlbJf2rPMXunWCMPeFjlZfjHunMZIq?=
 =?us-ascii?Q?/ws1Jnny+h05J3qY0SQwKsAFteW8pgLyvCNsb/U310GVzsiwdaQp4bv96N3s?=
 =?us-ascii?Q?zqnnkWmRvz1Ul63vHiY4pSPEuRpZ97LqNW+b3wu9Y+w8thdrsX9cFu1zgSp6?=
 =?us-ascii?Q?9cFwv9h79wFeYAYRUomMvaKFfdiJv7Ki2y/4cbWVC/Qq9uqhBQmxi0GIaXxc?=
 =?us-ascii?Q?9S7x5x1kpkzDhrQdCtauDnXnKMpU8WqEc5aBF9LbrUBeFgb/iPNVuha33z5U?=
 =?us-ascii?Q?YlhM2G2q+Xohx3k+ebIbb0yEYV7nl3XWWm7Yf+uoY9WhUmhvs3zwtdf8lucJ?=
 =?us-ascii?Q?V7QBqJslfKjK3atEDy8fHMkSSQtw5P+Ofb+g5COIRMQ2tfRJzGKl9llfDHd/?=
 =?us-ascii?Q?Pr5P7g5y/24HYril3etevpoglrA5AzI6j77rhzirCZgZXMTb8Imn12lVS5Yg?=
 =?us-ascii?Q?YDRru0HrnIo1elNO16K9NaTqJojdG2fIaWQ4myKXly9GfbO9lr1KT7K+MhO2?=
 =?us-ascii?Q?z5K7xiHZt19uTj/CcznJUJT0lZWHaV7AehfWFUDFFqtMjAV3BHq7LOnQfYuG?=
 =?us-ascii?Q?lMjQUe7rTim+zMlDE5jRKJ0XaByYkqixxFV43Nz/uwnBIthV5G00KRepy6m8?=
 =?us-ascii?Q?L7qYR1cGUal0WjaGChdCBtQIv5nG7rauYr1lbOPJdt3wj0jujHYnQD3Zd83D?=
 =?us-ascii?Q?N75oxgYnBiCsMRzKaaQFRvji+4FMIkfNmV9cQGUq/MZ43RIXtJLUCDKUJFgb?=
 =?us-ascii?Q?/udxcHlB9K3CDiYQ8rWepIo1Ff1nRuokQWH4HSxhmuS/m1UkNaVWumWCkth8?=
 =?us-ascii?Q?85rbOlTYeoL/dc5anFHi2/RXB34lbQ0QTtFcKIw01KEi0v8IdL4cPaD4vjy6?=
 =?us-ascii?Q?b35DgfMqbWfSNLHLOUNSPh6oAf52FJ1hhkiVPVxBXse+feKkN6Cxi0yLu1Bk?=
 =?us-ascii?Q?+MvkiO7/p7dnrdL9TzamTkd48XYs4zPP0ZSlqmORSYRZUCgeHNQOUn4Krs/q?=
 =?us-ascii?Q?w0sUr7Ez+f6oKaY8zGjnsxUXCsmlXUxvwmgtYWHibVdMITOTFH0y3TOY3Ejw?=
 =?us-ascii?Q?ipenuwO/oO8018iYrjZmeY2WgJc459MgqE7UIJaUxmGES8Z6U2RpSPML3faq?=
 =?us-ascii?Q?yFnTbN5gVK7j3FzubqhHKNkKV7CEsy2wuMaoR8lhWedV5CDTO43hroDJZbFz?=
 =?us-ascii?Q?Q0IVu1dmRk8a5B9qEF3JEnfJ6wfNprMNIdWJGQ2bZZS/9HWpXozrbl8bndzV?=
 =?us-ascii?Q?kzmqjy6HpEZ9iEp3UuwGnLn1O3RRLXtm+sEgap0ggoyK9a3LJpM4tixgd2e8?=
 =?us-ascii?Q?mI6tqdJS2Q=3D=3D?=
X-Exchange-RoutingPolicyChecked: 
	koUmqkZx2nAbpfENNECLYfIXmtWhJCSBwi5sEWQUIrLxhnxYutWkiOjVCDsUlzoKxTVKMQNlWmrdptVvfI7im8v2bR/yS+53wMoIYLMiHeDZQQNv6hBsDwbt61lg7qOfUp7vgmzGQt7sZACoLVibhRs1LDih267Nv/IiBkFStzO3U162vWIZOnGNMAadOqEjivgCQkE1Mx78RnYx3WaqGKjMq3f3HtbngZXT65mup3vA41rVyZwULXY1hZqM/QLmHK0Ltv9uqSwT8F7WLDqK0ZqEyI76KvP5IcfS5ykWwtrSxWZjbsyoqT2Nft1iYsIRegpZVBGiOpNop9GRDzD9/Q==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6dfe4a5d-d920-4064-a9b8-08dec06b7325
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2026 05:54:46.1574
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LwsuSGk5mxlWg1K9ZFoessbzzPL3OQxOoBCNSZaW5vEDSF2gaYYSKFjXlJn7maXXqhqffASMhXXFtBuQz6ngCA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPF50B3E12BC
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-ORIG-GUID: PkE2Ja4lntynqYwiY-poap-8k6c71ghj
X-Authority-Analysis: v=2.4 cv=PLg/P/qC c=1 sm=1 tr=0 ts=6a1e702a cx=c_pps
 a=9MZ2ugitVzia3XLGoiWL/g==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=FelO9ux0wxsA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=HK-ge7EqtdluswH-FwHe:22 a=t7CeM3EgAAAA:8
 a=2V6DY6BgAAAA:8 a=YY5fHC_nbEPuZvEga4oA:9 a=FdTzh2GWekK77mhwV6Dw:22
 a=ldqKKs2zR4t-S6fqr-1n:22
X-Proofpoint-GUID: X2YE56U8DgDm6fviIJbsjxOovL5TTG83
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAyMDA1MiBTYWx0ZWRfXypQ4gho6YH2k
 OmPgeTsVqCHkQ//Lksx1as1ICKBwxfCwbC7QwnY0FmIDFKRThAJXLjtrACX0VejiHdDiIiVvA2G
 lPfTSAFo7SNQoiICo9w1tKqwuZ+cqSne9Jgc+h/QmLI1YIpiUzD/4GJAPOMWamwoCkk9OfHoAWG
 8RtAir2IInK0uQbhB6liodxnk2qF5U48B94Fbds3XkYNoWrusvIMYBNpHYJkojjdCGNo1YTbYte
 /dputAbH+pGDq8JjhvDlGLXMUoG+7kN6gm52G2nJzpFnr0aoC2DlXR3/yTzKU0WbzNF0xC7hMjT
 ELyI3hofjF50oqUT73/iw93b61NBb03hl/5JD+Q/k7o77IP74IAYYPxIEBPp0AmBPcDDwPjnGrR
 uivm74zetuJeexybtPrNRCd+lowusUEZ8lngZyCbDJ6LymaQ7wFKd0aJ6OdMUMe5NZeM/6LRY5Q
 X14Gn+jeBQNgAv8qObw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-01_07,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 phishscore=0 impostorscore=0 spamscore=0
 lowpriorityscore=0 priorityscore=1501 malwarescore=0 clxscore=1015
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606020052
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 02 Jun 2026 05:54:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237998

From: Chen Qi <Qi.Chen@windriver.com>

Add '--stable' option to the three subcommands:
- latest-version
- check-upgrade-status
- upgrade

The effect of this option is to make the subcommand only consider
stable releases.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 scripts/lib/devtool/upgrade.py | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/scripts/lib/devtool/upgrade.py b/scripts/lib/devtool/upgrade.py
index 8930fde5d6..91cb85403c 100644
--- a/scripts/lib/devtool/upgrade.py
+++ b/scripts/lib/devtool/upgrade.py
@@ -560,7 +560,7 @@ def upgrade(args, config, basepath, workspace):
 
         # try to automatically discover latest version and revision if not provided on command line
         if not args.version and not args.srcrev:
-            version_info = oe.recipeutils.get_recipe_upstream_version(rd)
+            version_info = oe.recipeutils.get_recipe_upstream_version(rd, args.stable)
             if version_info['version'] and not version_info['version'].endswith("new-commits-available"):
                 args.version = version_info['version']
             if version_info['revision']:
@@ -626,7 +626,7 @@ def latest_version(args, config, basepath, workspace):
         rd = parse_recipe(config, tinfoil, args.recipename, True)
         if not rd:
             return 1
-        version_info = oe.recipeutils.get_recipe_upstream_version(rd)
+        version_info = oe.recipeutils.get_recipe_upstream_version(rd, args.stable)
         # "new-commits-available" is an indication that upstream never issues version tags
         if not version_info['version'].endswith("new-commits-available"):
             logger.info("Current version: {}".format(version_info['current_version']))
@@ -649,7 +649,7 @@ def check_upgrade_status(args, config, basepath, workspace):
                                                                "cannot be updated due to: %s" %(recipe['no_upgrade_reason']) if recipe['no_upgrade_reason'] else ""))
     if not args.recipe:
         logger.info("Checking the upstream status for all recipes may take a few minutes")
-    results = oe.recipeutils.get_recipe_upgrade_status(args.recipe)
+    results = oe.recipeutils.get_recipe_upgrade_status(args.recipe, args.stable)
     for recipegroup in results:
         upgrades = [r for r in recipegroup if r['status'] != 'MATCH']
         currents = [r for r in recipegroup if r['status'] == 'MATCH']
@@ -673,6 +673,7 @@ def register_commands(subparsers, context):
                                            group='starting')
     parser_upgrade.add_argument('recipename', help='Name of recipe to upgrade (just name - no version, path or extension)')
     parser_upgrade.add_argument('srctree',  nargs='?', help='Path to where to extract the source tree. If not specified, a subdirectory of %s will be used.' % defsrctree)
+    parser_upgrade.add_argument('--stable', action="store_true", help='Only consider stable upstream releases')
     parser_upgrade.add_argument('--version', '-V', help='Version to upgrade to (PV). If omitted, latest upstream version will be determined and used, if possible.')
     parser_upgrade.add_argument('--srcrev', '-S', help='Source revision to upgrade to (useful when fetching from an SCM such as git)')
     parser_upgrade.add_argument('--srcbranch', '-B', help='Branch in source repository containing the revision to use (if fetching from an SCM such as git)')
@@ -690,11 +691,13 @@ def register_commands(subparsers, context):
                                                   description='Queries the upstream server for what the latest upstream release is (for git, tags are checked, for tarballs, a list of them is obtained, and one with the highest version number is reported)',
                                                   group='info')
     parser_latest_version.add_argument('recipename', help='Name of recipe to query (just name - no version, path or extension)')
+    parser_latest_version.add_argument('--stable', action="store_true", help='Only consider stable upstream releases')
     parser_latest_version.set_defaults(func=latest_version)
 
     parser_check_upgrade_status = subparsers.add_parser('check-upgrade-status', help="Report upgradability for multiple (or all) recipes",
                                                         description="Prints a table of recipes together with versions currently provided by recipes, and latest upstream versions, when there is a later version available",
                                                         group='info')
     parser_check_upgrade_status.add_argument('recipe', help='Name of the recipe to report (omit to report upgrade info for all recipes)', nargs='*')
+    parser_check_upgrade_status.add_argument('--stable', action="store_true", help='Only consider stable upstream releases')
     parser_check_upgrade_status.add_argument('--all', '-a', help='Show all recipes, not just recipes needing upgrade', action="store_true")
     parser_check_upgrade_status.set_defaults(func=check_upgrade_status)
-- 
2.34.1


