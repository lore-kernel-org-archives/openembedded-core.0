Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8EC4AC48286
	for <webhook@archiver.kernel.org>; Sun,  4 Feb 2024 05:28:56 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.33400.1707024526623948118
 for <openembedded-core@lists.openembedded.org>;
 Sat, 03 Feb 2024 21:28:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=OHBxIKIZ;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=276424a97d=qi.chen@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 4145QNwg031013
	for <openembedded-core@lists.openembedded.org>; Sun, 4 Feb 2024 05:28:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:content-transfer-encoding
	:content-type:mime-version; s=PPS06212021; bh=vnm5+7D/IvAdJTtPMA
	GSWO+cXqSEQyqdNyQgoHdUf6A=; b=OHBxIKIZXoGgQ7YFuOU0L6iy6B8PbEauI6
	kDshQOiXP1vKmkdHUVWZ1oRMn/CEjh5q7g3sNYsbc/lHUjwiJlaHPITznN7mJ9jo
	/R9QUWxzHwXmtFnTUO7FcVrL+lKnCRs4EEuM3fLvUHrcYXIRdcTWPLBkKtADx7EB
	04PHeQRArjerR6qcf0hNkuxfOKwdqvbBpz73C0H15rKPWCcZGHsZizmvHtVXMsJk
	/7WUpE+OmnvpZLLDDEqKtn/pEHFQ24afC0rXh+gaKGapwbu4Co+pjfCjg86oOi6h
	UsYvqs1hFgFubovNeXvJ8zPtpGE9+H6vT/h89rjj7UOU+QeZuszA==
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2101.outbound.protection.outlook.com [104.47.58.101])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3w1cq0gsuy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Sun, 04 Feb 2024 05:28:45 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mp/KdNArx8iMjeic4CIPkDnkEbfStPq7vHwBYjeG15sllCJWIoXxd0bwa6YnkQiFB0cYnKAZqPD0j4d4OXmWPPn/geW9m5tcQdrL9IaNMVvbIShSRVHAB3pWw3MGcLW2h9LA93eh/8+CklHkFg8VqyTX1bVicELDd8Fc03+WvxxqB9lp7l5Eqsrgrsh1mdxi/y9xCzpkv5OjJogfX3UoYmPZVS6Q5hkUvUaCVVo6BjKB2XauKV2Gw5k5SB9iRbH661Yi3svYUDD1G7/KrsllMGUCl9CiW4wGCvBBOsSkzGupVVHdBCqJs1wIMdW7LKOZS3wZE9scWvy2GdvWkVPG6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vnm5+7D/IvAdJTtPMAGSWO+cXqSEQyqdNyQgoHdUf6A=;
 b=fQ6sHX3DQj5pNAA84s47V6gejpY1ucFZu89VCbcHVruG9gDNtGyeySupqY6piSiLvMIg0aB85LuJxz/vXph23qsSJOnMtC4NHFXN1Vn1ERh6rmDMtWuO/L3jdRviQkuYZsvVNT/GgbfB2xMfpZrfwdxQwcgBLVnJu6DGnM9ubwhpVIpGIFH5B2rGs1MRRXVqXBQF0USx8QWO6QHTNydyBFWVByalwso5vxRiuhi5opUJ9dduNkOUSidjHGmPVgVCBFAltx7t0gYX8wbTMJHTHJMtxYlLRY/BG2awBzbvJ/Sds6lRu4Hk3cejPHVG33O3AgepzOUb5yLpbWBw6pHejA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by SA2PR11MB5130.namprd11.prod.outlook.com (2603:10b6:806:11d::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7249.33; Sun, 4 Feb
 2024 05:28:42 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::5d84:2b01:5029:9315]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::5d84:2b01:5029:9315%7]) with mapi id 15.20.7249.032; Sun, 4 Feb 2024
 05:28:41 +0000
From: Qi.Chen@windriver.com
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH] kernel.bbclass: fix parsing error with KERNEL_SPLIT_MODULES = '0' and multilib enabled
Date: Sun,  4 Feb 2024 13:28:26 +0800
Message-Id: <20240204052826.1282577-1-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR04CA0172.apcprd04.prod.outlook.com (2603:1096:4::34)
 To CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR11MB5602:EE_|SA2PR11MB5130:EE_
X-MS-Office365-Filtering-Correlation-Id: 6bb19fa6-b8dc-49fe-02d0-08dc25422612
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	zD9h9vPesYh8lZD6Iol32cIZqTqfUrdZxhvaF5gZk+/6Fll1lS8mEunWcdGzupZTkqRzyym6s8DEkDoRgwimisPER8KPKckbiWwp9j8Bv2JP9CMuZ9JIqj5Gpl+vF6w3TZSMkFPucfSORm3x6I9oFZvQqDJ5AqVLsu2LoEP1HYw6rc2xmk7h4RBQA6RtemWJc25ukTmc1VfXc43tWgxUxJH1R3u8naH8QQYhzvDVHpW8jPy5jt9jnOysf++PJAceR7KT2mnF7Q4CNb/OrCC2sMSzuKfE7/NVi5Dkb2k3tVR3nfNtYAMrLGzZQck+iEe18lJNJ0gM/Fza+Wb/QdroZK1EMkYzJ5duXUXYmN8Z8jbySPX+0RR4q+cW9AKqi42x6coNIucUFDaVT7rvpgs99zuaFDIu5IjdmvS6q2+qT52KRJeGj9DGpdgGNHe3tUBKLZTjtpKFTqtgXuWIAEafDGwU8ZXcvez2N9BKjSHPSy7DBpOBgpCliv5jd80oAUvS7I2TEOfCQOPs1v0NQXGjzC6D15cmmFLsTBeDM0SeNmd+VPbrhdqf6ymt9foqDv7m2OLu4HtpEFKsYjKcmF/UxdNYQ/i2IE7FdiOvPT8pq1/9/0LRYP8WEfrRyY6pNIMV
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(376002)(366004)(136003)(346002)(39840400004)(230922051799003)(451199024)(1800799012)(64100799003)(186009)(36756003)(5660300002)(2906002)(41300700001)(38350700005)(2616005)(1076003)(26005)(6512007)(9686003)(83380400001)(478600001)(6486002)(86362001)(52116002)(6506007)(6666004)(38100700002)(66476007)(66556008)(66946007)(316002)(8676002)(6916009)(8936002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?pvqriNvfSpHgUGyC9Sv4CC4JjYvkVcUVQVKadUEk/DwB95VplV+JijRmeINO?=
 =?us-ascii?Q?9/R93dYe1r1UqjKiMn+3N8e0K1+KBBIXBmDkXeLSuuE05Ci+UwvU3uG1/hfX?=
 =?us-ascii?Q?7vKyA3DdZXmx4qKUuj9QC1ehio8V7eDmoFrPvSddtObjGidf9l7fnXVxCfjq?=
 =?us-ascii?Q?L6nwwyXZA7iPMHwysqzOyH4h02QFKOgSVNLelUvwgoIGJQdlI8kbkeIq28S8?=
 =?us-ascii?Q?urXoKOlXphUPB+aQOxTyVf4RotY3lYUDYN7JfjXRRKQmjiJL79+PgwLsBNqB?=
 =?us-ascii?Q?mvU7NLlJtARswnvejOnfREQPhtOfZmFtLuwK+p6kKLIaNEj1ZqQf0Ub3cXX9?=
 =?us-ascii?Q?lytkjWXJOFEc3sG7yid8bH5copXxWpigWh6ceHjhpy/PJqMX9r5twNtlBwTv?=
 =?us-ascii?Q?+zwMTloN7TcoSH+FD8EnjFH1Ingjlw6GzreSivcy+J+OhPVsY+4hWeoWqTFi?=
 =?us-ascii?Q?pauXaNZvb6PEAed5W7QTK+XnBVR0uZs0yreYzfag0T1GB4wU7fr6ecTgJqfJ?=
 =?us-ascii?Q?OjBtG0oG1dGIwxtBuF2dPZ+LXbsSaR6P8/3AFhPZflkdr+d2jkKyYcoVwIfH?=
 =?us-ascii?Q?sCaavbwU/6Ja+yYGj9nCTkQiY4ezM9Q0bqm14sQ/STJdAa7EgjWoMzk3xQZk?=
 =?us-ascii?Q?d19A3zhX04xjJXdBUxc1xXauC0si91kAgr87NSnv6QWWiRPWcMMGlSxkMrB/?=
 =?us-ascii?Q?CWTaHV54YQlQ0QRYvMEluv/Baz5l3qwXoR8/3jBIKLCFbH/fm9MY6/XryOQg?=
 =?us-ascii?Q?SifZ+NdmsDkaLhD84eMyXOpCVFOKESyO2VnwNY8rENmihJLJBF0Nt1vlpu/4?=
 =?us-ascii?Q?OroEmm7pUpln361MrIb7z3L/CqzxqmHYU7PnaU2Z12qh+/paipex8I90mTh9?=
 =?us-ascii?Q?u6IeuUyZRzu4+ZsQdf0o1P4Zpa+zUL9wRCjsflcKRN2KWIHlUXEdrk0oiyD6?=
 =?us-ascii?Q?5Oy4cguUkZ1vysqytehSTamGKsVH3eQTek+cm+nmCM+hj2fvDX67gh44DL+s?=
 =?us-ascii?Q?OsvB+ePfmItfLn/kZgxS5DUvJfGCwRWDonoSjViWAYJPC1ZR4k41h7dWhSA+?=
 =?us-ascii?Q?vVL9uOkPTxpWqBoVxZ95CRz1+PRpM3etKqgQHvaybSHVVdD4EtINvI9l86xW?=
 =?us-ascii?Q?ApzMNZGevvBBmQEzdqQpyTaT+fNmTOlsBdHl31mdHtusFuOekcxRnZYeIptJ?=
 =?us-ascii?Q?XDGTPM5aSbne2QR60wm37hFu1bx+uC++tuyTOcsoxfuqdEu3zf16IDzs7wYr?=
 =?us-ascii?Q?8QIPT77MWBZi7BsTlsGQXoTP7AZSZW3rKydMOdBKEd/bPkq5tKTN7K0RtO1C?=
 =?us-ascii?Q?n7puu8Ez9716uXfJ3vGkOYNA5mWlkAVw+uSFbDhSY9BmPNd1VM/BDpPJy3Kb?=
 =?us-ascii?Q?z153UqBn/V/5pheQevcsUOhSZ+PKFw4kXLCetg/2rVswdQmnRy7KFFUBhSjL?=
 =?us-ascii?Q?kHRtN4zCkXQGpmXGXbvLu3UjwpZ+uWJF7NgwNm1HbzF0OV3ZY2IASXA0YIFz?=
 =?us-ascii?Q?yB918asDT9bIK4ItE3uilRHpjJIR2NIkNqgPp9kCgYpKkFG0Y9PIZpPRYBKZ?=
 =?us-ascii?Q?rtiiYhhwJasxURZHOu/bBA1UwOVRaSNh+iiQ0sSg?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6bb19fa6-b8dc-49fe-02d0-08dc25422612
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Feb 2024 05:28:41.8858
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gt8Q8vW/1SgclpFZyC8oxl8D+Mltg3YFHhIEpuDuXkKQbhbIEzsgC+73HtA2Gs/EI2GkkgynFUpQnbkXhk29vg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5130
X-Proofpoint-ORIG-GUID: qdM8cd9hbu-OYpGiFLlQAO9Nj0-XQ1sd
X-Proofpoint-GUID: qdM8cd9hbu-OYpGiFLlQAO9Nj0-XQ1sd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-04_02,2024-01-31_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 malwarescore=0
 phishscore=0 mlxscore=0 impostorscore=0 adultscore=0 priorityscore=1501
 lowpriorityscore=0 bulkscore=0 spamscore=0 mlxlogscore=999 clxscore=1015
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2401310000
 definitions=main-2402040039
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 04 Feb 2024 05:28:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194873

From: Chen Qi <Qi.Chen@windriver.com>

The problem could be reproduced with the following settings:
MACHINE = "qemux86-64"
KERNEL_SPLIT_MODULES = "0"
require conf/multilib.conf
MULTILIBS ?= "multilib:lib32"
DEFAULTTUNE:virtclass-multilib-lib32 ?= "core2-32"

The error message is as below:
  bb.data_smart.ExpansionError: Failure expanding variable KERNEL_VERSION_PKG_NAME, expression was ${@legitimize_package_name(d.getVar('KERNEL_VERSION'))} which triggered exception TypeError: expected string or bytes-like object
  The variable dependency chain for the failure is: KERNEL_VERSION_PKG_NAME -> RPROVIDES:kernel-modules

This is because multilib_virtclass_handler_global function in
multilib_global.bbclass deletes KERNEL_VERSION. So we need to handle
such situation.

The KERNEL_VERSION is defined as:
KERNEL_VERSION = "${@get_kernelversion_headers('${B}')}"
So in a clean build directory, its initial value is "None". We should
sync other settings to this value. If we use '', then what we'll get
error like below with the above settings:

  ERROR: Required build target 'core-image-minimal' has no buildable providers.
  Missing or unbuildable dependency chain was: ['core-image-minimal', 'virtual/kernel', 'kernel-modules-none']

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/classes-recipe/kernel.bbclass | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/classes-recipe/kernel.bbclass b/meta/classes-recipe/kernel.bbclass
index a76aaee5ba..7c1cb0ec77 100644
--- a/meta/classes-recipe/kernel.bbclass
+++ b/meta/classes-recipe/kernel.bbclass
@@ -44,9 +44,9 @@ INITRAMFS_MULTICONFIG ?= ""
 # number and cause kernel to be rebuilt. To avoid this, make
 # KERNEL_VERSION_NAME and KERNEL_VERSION_PKG_NAME depend on
 # LINUX_VERSION which is a constant.
-KERNEL_VERSION_NAME = "${@d.getVar('KERNEL_VERSION') or ""}"
+KERNEL_VERSION_NAME = "${@d.getVar('KERNEL_VERSION') or 'None'}"
 KERNEL_VERSION_NAME[vardepvalue] = "${LINUX_VERSION}"
-KERNEL_VERSION_PKG_NAME = "${@legitimize_package_name(d.getVar('KERNEL_VERSION'))}"
+KERNEL_VERSION_PKG_NAME = "${@legitimize_package_name(d.getVar('KERNEL_VERSION') or 'None')}"
 KERNEL_VERSION_PKG_NAME[vardepvalue] = "${LINUX_VERSION}"
 
 python __anonymous () {
-- 
2.34.1


