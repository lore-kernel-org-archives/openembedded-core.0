Return-Path: <yi.zhao@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D57CC47074
	for <webhook@archiver.kernel.org>; Tue,  2 Jan 2024 15:06:58 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.30739.1704208016656673437
 for <openembedded-core@lists.openembedded.org>;
 Tue, 02 Jan 2024 07:06:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=Ir+AJYnu;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=1731eb5038=yi.zhao@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 402CfGOM003864
	for <openembedded-core@lists.openembedded.org>; Tue, 2 Jan 2024 07:06:56 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:content-transfer-encoding
	:content-type:mime-version; s=PPS06212021; bh=kXYYzP2K5rYhPRSNb3
	8S6l4+NwKYSDccH4BNqngHaKk=; b=Ir+AJYnu7yaygxw2RQHE0MF5Spab/xP4L4
	Qm/ie/h61QDRN9AnC9p3C6gxW5p8NxoD26fLFoiasyazKF8/etCKdNVwrFs/oyZ0
	Mzan7yZpwahtMhtdRZtcyAcTtDr1jBFk5mPxLgK+dIB1eZV9zYnjVaGUsSR+it9M
	C9GTp613s/P1FgbtqhOu1TRfC0APZxJQTPf5RD6gzoLj8pdq1c5FozTKk5KDh4+P
	qQmHMWf5NOr422X2INqjcFDg5a2aFB9QTdj8e2lV8gkSSkr40JyQSsT3mtDwNTpM
	Cjmxu+8DCYmxJ3VXd1CiLkc+0dXEUoNf4ZuHjSok5WX+ET6iK01A==
Received: from nam04-bn8-obe.outbound.protection.outlook.com (mail-bn8nam04lp2040.outbound.protection.outlook.com [104.47.74.40])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3vafc4apw2-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 02 Jan 2024 07:06:56 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XEKq6AS+y+EuoptlDV7d+qZqXxuOrdCbZNF04uRe5XRMA90u9Xr+65KUIzHckRle4whRYWiJViIIz0GwGfbRphyM/CQkVtwZ0GJC1G3doKxtp1mEp7u5V6Mtv5bl71YS6yEzMOgdMOKGyobGdl4SUuLOntt0bL2OhDnQEbLhFXWNgZzgfFqpfM1WLXWLeCForcn5TOgI2Bf0+Cbb2gM34uWnRHGNs8nNdPpUYECypUw41gWsNqKYyl61FSEObUMskHboL8f0LKRryxT3esx++aijcE69CM2A4oPBOaN3UU5x3wPCGgYeo6308QV63rjR1V0SUT0jBxO3bnhssKguRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kXYYzP2K5rYhPRSNb38S6l4+NwKYSDccH4BNqngHaKk=;
 b=SxDrr8zKtZGwT5b1KvSVm4exN5OH56SjJ8CCat+gZUZhyABYNJEbGf1ctrrSZmkl7VZ1RbxkmwT8GrJvy7d68dJe6tcxv2wFPUsiKwe4AuleD4/m+ggYXc4RdFHY4O/2S1q0dk8UAhkpdSFIpQD/HsKVBJp/TKyaqpNeghVQA6TfcUuHsWHeztoE8cPINH3B6dWLXh36r4AK7cR/aH9SDSxvT5LNXKaB7KktOoVpgL62Ko5Yz3oh0U+iFbcOcNCYDgOOcAsJohCpNIB6p3okAoADoKj/ygQWT3YPJU8Ldo2/aLfZdTQr2yh4Kbn9MzPVp/vUOcCBl7c4R9KRO6d8cQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB7484.namprd11.prod.outlook.com (2603:10b6:8:14c::10)
 by DS0PR11MB8135.namprd11.prod.outlook.com (2603:10b6:8:155::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7135.25; Tue, 2 Jan
 2024 15:06:51 +0000
Received: from DS0PR11MB7484.namprd11.prod.outlook.com
 ([fe80::c56:aece:e7ef:6cb3]) by DS0PR11MB7484.namprd11.prod.outlook.com
 ([fe80::c56:aece:e7ef:6cb3%3]) with mapi id 15.20.7135.026; Tue, 2 Jan 2024
 15:06:51 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/2] libcap-ng: upgrade 0.8.3 -> 0.8.4
Date: Tue,  2 Jan 2024 23:06:40 +0800
Message-Id: <20240102150641.865548-1-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYAPR03CA0017.apcprd03.prod.outlook.com
 (2603:1096:404:14::29) To DS0PR11MB7484.namprd11.prod.outlook.com
 (2603:10b6:8:14c::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7484:EE_|DS0PR11MB8135:EE_
X-MS-Office365-Filtering-Correlation-Id: 1fcae120-da18-4c78-02e8-08dc0ba472f0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	6fefRJr6xopw7rm+YuSJ0uUidVlvusTHcG38947mqILua1HLbdx9kcTsQ2kyoEbsatm6R/YYqiHpcX+cbIg88FO0MC82ICXX9JdME/dpCaezL1SIQZWHH/DoIiaVykbJ0JQGUXRECYF6ndOWjEGWSnQbldjiLGCb3ecGiiDUzARYfG2KZPCqmgLY51QX0fyXLJnW30lzHynPlRnBmf/CD/02Egddwo9vWWEyDXOmg71ODZDVpdd1mR9LlMoT2ZYxkpDf8Hlg6jzfoyQzjjquEyQjrW5kON2HBthUixnHHiwzQn87zDX/dNN0bAsrSIjjowtGuwrEqCDh83Ktf9j7cm1oB1HzJTg9GJZrwAXn7I48XtX0ZIrhEtTi4tcYu/8PCmNdEfL7YgzpKAo06P6pZs3tWYWwtzxs4yLs/Ds6I5llxuXRfzK5IN5iyG9LClXfh4UOj+oC4BNIgoKrF1GeLK7uCHeQE1PIilVqV8ovhsn3CEo9BSx5lDav13jRe423Kgm1zXAE4BX3tOdIf4uyF6qXQCMkY0NJLZsPr5jJUh8aMWtTA+rmNiLaTESlhAE0c7cxVY23k+i5oyAoyfXZqnQQfxbpuu4VyhrjJ1mowVc=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB7484.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39850400004)(376002)(136003)(366004)(346002)(396003)(230922051799003)(64100799003)(1800799012)(186009)(451199024)(26005)(41300700001)(1076003)(83380400001)(2616005)(38100700002)(316002)(8936002)(8676002)(2906002)(44832011)(5660300002)(478600001)(6666004)(6916009)(66556008)(52116002)(66476007)(6506007)(6512007)(6486002)(66946007)(86362001)(38350700005)(36756003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?sE+L6HrR3d3++tpFxFTQCga3lQoxvDUhzbgGYUIEJQt68TZXIMR8Ksi1qU/9?=
 =?us-ascii?Q?dCGnz9CDByKWeaCuLaqNokhrq4TN/OZ1ZdwOTTWe4TMhNQUu3HUxrynqZsOR?=
 =?us-ascii?Q?IjBjlKOSxPUFyFZNlG7bxewPXrf3Ly7I3hRAu5zpE2toVgQ1aDv26MLS7y+E?=
 =?us-ascii?Q?ttePm+vUYQrdxXtIjHSMv3LdrwT+dpkps6ZNXgbmVhg06pWZNvQwWcp0MKZX?=
 =?us-ascii?Q?5+8/BvP4vVssKmm3wZOSxhqMohzTPcGHWtBCFfS6RYKzaXD0Pj1RGXlNz1qA?=
 =?us-ascii?Q?E4rnai3pQP7g9Ln68Dfce0MGIFPLTjwWFGgAlJZMbXQYS806LEDJOrnLyUH5?=
 =?us-ascii?Q?FHE5GY6HGoUIdAW69aOE5kW7z/2knokkFPQlh44VsKjcNbZhmtIT+/fZ/dJ7?=
 =?us-ascii?Q?gZxIo9OMEbCE+1H27OvK4SWXmqHNicDrxtPFaxaDZHq7tByYWK+4fsA4CGTB?=
 =?us-ascii?Q?LxqTJwR5LitNO+du+G8o8cYowAQTxe6Oby2D3FFVqNCFzfxRTIJHj5FjGaAm?=
 =?us-ascii?Q?dAEF2FjDUaTgsv4QvIIaRb2j6PiT498xzDKxvGTM5Qbf9GKkwmmHInL66WQF?=
 =?us-ascii?Q?KeJiQxvuFwORAZY2QQfW4F+OxyaJGLQPo33VSKFdHGb8ITK0GNbreh6F9MCi?=
 =?us-ascii?Q?fr1hv4OciqefYvktf0S1p50LfapZNwrZqmUikIogKugF0aL1uZjIT52RvwAg?=
 =?us-ascii?Q?/pniLa+lm52Vtjyjg1/lkLqeUcst8f2HcotKb+wWen43JwQSk+ydreXj5EC8?=
 =?us-ascii?Q?qEl/mmi/8QAMdI9MKyrokDw7YvHf51r6vCS2HolDzbh76ZYTrU+NfoN/h50L?=
 =?us-ascii?Q?cVdSbmlT8lC4tf32GxjEbK7ThUEtxOIFDcBlddC/+yf2RpJ3MQ2UVCHCSbVV?=
 =?us-ascii?Q?mU9t4BugMqmgA8Uiv1Vb+aYD2eDyNTt9zXeL9/p3zMoH5ijdKhAzmZqFCD+q?=
 =?us-ascii?Q?IBCbzsRh6v0KvL2RgrWP95Djewv8Z2Rv99ZIafFPxS73BZ9zwnR5XUcc++W4?=
 =?us-ascii?Q?HxHbBXHz99xRNpKqbDSa5QbMZhuaRYKWcIgSCzMkGr1B0joq0fhvBx7K8y+n?=
 =?us-ascii?Q?ZWXo177MYTk8hBO1Eo+BvthCcOwydBTIjYm3Mz2O64R5P/qYURqKNajlmcM0?=
 =?us-ascii?Q?Xd9qgULuMGlgFbiiJTdVQWctH4gO/NWLS7OyVVbBnEHqt7AFNFOMi5Lq+08M?=
 =?us-ascii?Q?3cxXPD+3/+MANfhkugdLK0XRJMZA/TbswOSuemWSTdV/+a5iCqDM5yNEpOQM?=
 =?us-ascii?Q?7xsYNSmTPmRUYP1NYfI1tlbtNYCU092YbPfTbD5Hag5G4vm9RGWf5R1K44tJ?=
 =?us-ascii?Q?+VhIR5NFp+x1wRlP74ehxVPkirWB3s4BSp8n9ThUvKahKPP/PD9eg1ZBdg39?=
 =?us-ascii?Q?MsEUFm16ms/xQbJDcSOGgFoTfisa0s4DInqz8HRCmgZSvZkiSgUQlFahWzSP?=
 =?us-ascii?Q?RFU0TvuAOQBULNZxXBBSHf588y7PWK5Jge6K6BMDjI5YMgKNCOQW2E06Tpl2?=
 =?us-ascii?Q?3E9SlS6qHcBvTDmGd9xwYPvEWQSj0Li5PECtveNPcghDUOv0UqKCi+44GFQq?=
 =?us-ascii?Q?PNRU1CLlQxlmT2DL0dD6kbdYMd5ZykwZE9iyQl3I?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1fcae120-da18-4c78-02e8-08dc0ba472f0
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7484.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jan 2024 15:06:51.2656
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cXnysp23DTbFYo4mMwbGCIOE9zy2eMPoHOcf549wDtsb1a/EbI0nqY57muDNLQRawSApruNYxavMDe/dhwD9SQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB8135
X-Proofpoint-GUID: 1doUoY4NMIczYbq8h-VcKm8FZaDgyaGj
X-Proofpoint-ORIG-GUID: 1doUoY4NMIczYbq8h-VcKm8FZaDgyaGj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-16_25,2023-11-16_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 mlxlogscore=832
 mlxscore=0 lowpriorityscore=0 spamscore=0 malwarescore=0 adultscore=0
 suspectscore=0 priorityscore=1501 impostorscore=0 phishscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2311290000 definitions=main-2401020116
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 02 Jan 2024 15:06:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193238

ChangeLog:
  - In capng_change_id, clear PR_SET_KEEPCAPS if returning an error
  - pscap: add -p option for reporting a specified process
  - Annotate function prototypes to warn if results are unused
  - Drop python2 support

* Remove "--with-python" option as python2 support was dropped.

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 meta/recipes-support/libcap-ng/libcap-ng.inc                    | 2 +-
 .../libcap-ng/{libcap-ng_0.8.3.bb => libcap-ng_0.8.4.bb}        | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-support/libcap-ng/{libcap-ng_0.8.3.bb => libcap-ng_0.8.4.bb} (88%)

diff --git a/meta/recipes-support/libcap-ng/libcap-ng.inc b/meta/recipes-support/libcap-ng/libcap-ng.inc
index 55e3287396..a6b5dcf452 100644
--- a/meta/recipes-support/libcap-ng/libcap-ng.inc
+++ b/meta/recipes-support/libcap-ng/libcap-ng.inc
@@ -9,7 +9,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f \
 
 SRC_URI = "https://people.redhat.com/sgrubb/libcap-ng/libcap-ng-${PV}.tar.gz"
 
-SRC_URI[sha256sum] = "bed6f6848e22bb2f83b5f764b2aef0ed393054e803a8e3a8711cb2a39e6b492d"
+SRC_URI[sha256sum] = "68581d3b38e7553cb6f6ddf7813b1fc99e52856f21421f7b477ce5abd2605a8a"
 
 EXTRA_OECONF:append:class-target = " --with-capability_header=${STAGING_INCDIR}/linux/capability.h"
 EXTRA_OECONF:append:class-nativesdk = " --with-capability_header=${STAGING_INCDIR}/linux/capability.h"
diff --git a/meta/recipes-support/libcap-ng/libcap-ng_0.8.3.bb b/meta/recipes-support/libcap-ng/libcap-ng_0.8.4.bb
similarity index 88%
rename from meta/recipes-support/libcap-ng/libcap-ng_0.8.3.bb
rename to meta/recipes-support/libcap-ng/libcap-ng_0.8.4.bb
index 6e16e886b9..3dbe3e2ffd 100644
--- a/meta/recipes-support/libcap-ng/libcap-ng_0.8.3.bb
+++ b/meta/recipes-support/libcap-ng/libcap-ng_0.8.4.bb
@@ -2,7 +2,7 @@ require libcap-ng.inc
 
 inherit lib_package autotools
 
-EXTRA_OECONF += "--without-python --without-python3"
+EXTRA_OECONF += "--without-python3"
 
 BBCLASSEXTEND = "native nativesdk"
 
-- 
2.25.1


