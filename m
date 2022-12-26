Return-Path: <zhe.he@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 636CAC4167B
	for <webhook@archiver.kernel.org>; Mon, 26 Dec 2022 02:44:57 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.130045.1672022690409929921
 for <openembedded-core@lists.openembedded.org>;
 Sun, 25 Dec 2022 18:44:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=TaKZSUWB;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=9359eacd80=zhe.he@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2BQ2hW2U005090
	for <openembedded-core@lists.openembedded.org>; Mon, 26 Dec 2022 02:44:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to :
 subject : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=PPS06212021;
 bh=Mh/4xoHnVinBXCTzVWZ5BzqAJilGdvX7qKu6BR+MJH8=;
 b=TaKZSUWBHNmDWOmk4SoSxktTWCB+b8iK1vamKAws4XS+A/7GpdOBo00JZUvu+RmtRYbo
 c05KyTylk05WR0AAjOT9vfvPjqTngkbFzcJyw1tZ7Vpp1YTLMUsOZ/UeJGQlEz3d0/b/
 q0hpc++fs7TCVvrKgFuEN8pD9aUqMCVH5qUKQV+BwyfTNgTdoTUAS5Ry711SYG2fGPEf
 JrJg5l6xsORukI1N8d//5VwZU6PUwWIQQ8873XtlobZ5PxJnlj4fqrmC1ugWB7q0CiPA
 ufAqTrGMYPN/ZKpQf66V1dXEkO7Z/9pWUvIU0864jbswUlqduuXZBCP910rTHEWvjN1o ZQ== 
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2107.outbound.protection.outlook.com [104.47.55.107])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3mnrda0xya-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 26 Dec 2022 02:44:49 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Uq++t1kViQ/Hg9ARR9MaV3gL3m0aOTiJ9fTrOSBJXaYZ5QdrKnC1b9vjkhWwV6+lHL4lyhJziqrfczagDh+af8Y+475k8LOFabT6XCCcN9472NDpEzUWBOPQVmjHvV9c78RFOVd3oDdbrkWkyeycDK8VAjgKtCmhJMqHJaDv3KQXUO7djn7VgbpYp1acd7VJjuoFjl0VFN7b6q5CmHEfb/8FKusC8yS9tCzon8dhwnwUuWiFOD4G87+McNeMn5KQ7XUqOJLfUviMDVwxVJnS5+gLq46ne0DoztdDkCGGGeL1oy5Xr4mWkoa3CkuB6lWkHXigCCOvL9GuWvBGqc2kFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Mh/4xoHnVinBXCTzVWZ5BzqAJilGdvX7qKu6BR+MJH8=;
 b=Wj9/S03kQhvGzx2LXvbyJxPPCNn0WWqIHU6xjx4wo/cLYo32j1EIZ9QGFtstuRgih8ixFQBCtAd6pkhQoVYxqjMrOi9D/XQNfjUu0Cvz9DhyZBO6szx2Ws5AVlGhSQWNVpiDter1n5Pax/FZooC0PzVd2V0712pDkooeYmZ+kb4YCZ8k4CnQL/9Pvu3QNM+UAP/4qwvOlwSAZZM+BwlpqGf30KXV1JL+OgLD6OJJ9gktYsWG76CoIiZjB4sHhUzKFsAw6n2l+JyD9CEg27Ryx4/VwGkOEncnHHt938b/IZnQ38A7I1oFuBb9vLoZBgIypxPAike5oj3PG421hjMaFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from MWHPR11MB1358.namprd11.prod.outlook.com (2603:10b6:300:23::8)
 by CH3PR11MB7298.namprd11.prod.outlook.com (2603:10b6:610:14c::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5944.16; Mon, 26 Dec
 2022 02:44:47 +0000
Received: from MWHPR11MB1358.namprd11.prod.outlook.com
 ([fe80::c5d7:fdca:caeb:3e50]) by MWHPR11MB1358.namprd11.prod.outlook.com
 ([fe80::c5d7:fdca:caeb:3e50%7]) with mapi id 15.20.5944.016; Mon, 26 Dec 2022
 02:44:46 +0000
From: He Zhe <zhe.he@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone][PATCH] kernel.bbclass: remove empty module directories to prevent QA issues
Date: Mon, 26 Dec 2022 10:44:30 +0800
Message-Id: <20221226024430.3534721-1-zhe.he@windriver.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR05CA0024.namprd05.prod.outlook.com
 (2603:10b6:a03:33b::29) To MWHPR11MB1358.namprd11.prod.outlook.com
 (2603:10b6:300:23::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWHPR11MB1358:EE_|CH3PR11MB7298:EE_
X-MS-Office365-Filtering-Correlation-Id: 08c3a08d-bdde-4b01-731f-08dae6eb2672
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	U6SiwEXiMi6EY/lLXJi4mtZ3tnQfbgApZYudJ1RbA/2cMl2nmIVqMTfDzBTRj1jEswV3mmP+MmrWe9R4fawDDqa/yTeDeVNV8OxOmhtsRq4hDrN8zZRW4gPeAFvaZlXuTnyhIoJQ9txS7kLSRW+tvVXh2Rid4+2i3Ik1HIJ7/Y2ogxRRX/ftCa0Rkpmr6wHlKdljBktJqlXv2AvXIoO7PYDuDRlcAYtPZ/GHDNpCVDeW1b/1z5N3u5cG4wz3mbebhZQF81j6BSvbUBut4KD+wFv9bh0GF7ynKLaI2zH5xO5g16fPW+finQ/b6J/QeNQnoD7N4KKMDIZJtaABh8tr7Mb1EdvAhD5lwFOJbw8wR865kYA7SGsYSNtG6kywL90WcJ/JiTf+g+1hO69v9S5P8spFtEkdfIVI/xZlFwVau+GGa/349K8do9vNdraIjXArJSmMCNr8WifR1frYLT3knld9ZY/5owc1ADmYCUZV0fsLXszSWqGeTD322ZiXQ99PeXwA494S3bjAuJhk7VjMSOHu4jQtQYXSHO5Iw6hOCepSgQHs92cbUvztLNqHAMTAwVm9JZboWT+bjOQPqUXlV1yQf5H5uBjWWRPB7nLqu80GWMNKA5CnbR0/yQ4CroMpkOFw0qzBOifes/Zku5r66nEt5yhltHFeIWXZZBNDQMygJtip7WuRGishApcs7dNKTnmhmeNnHyHjwrvUq3bNbw==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MWHPR11MB1358.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(366004)(136003)(396003)(39840400004)(346002)(376002)(451199015)(478600001)(6486002)(6666004)(2906002)(6916009)(316002)(52116002)(36756003)(38100700002)(83380400001)(38350700002)(1076003)(2616005)(26005)(6506007)(186003)(6512007)(86362001)(5660300002)(41300700001)(8676002)(66476007)(66556008)(8936002)(66946007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?9eDNZOkQm0XJ5ftwNXCwlc/Q2snPjD62roZV1RHZa5BLM5rkEAzoj8vSTuIl?=
 =?us-ascii?Q?kV1LTEqJF8jy/XZzMrkPHlQEJoYcOaYrmDC0huc9eU3GSuX5tK6PCnN7gOsV?=
 =?us-ascii?Q?HqAnVascOmktBJYpUzSuJajQytsvr3IP/mg33kxfYXACFBrfSXGMmUn7BNbJ?=
 =?us-ascii?Q?iiI1dUUvsjeObNmnJZPoZ8cp4QEcebGUrml1n3CXBb2aVFFWkKuHUcVtwanF?=
 =?us-ascii?Q?9oY358jT+7RErKLANF7JwB2L5NZIS8rzjuxP8Hjfz124exJ3KDbmq3BcO9My?=
 =?us-ascii?Q?le3VmEsyLJYM5YpVowKq6urtQZmaJ2AmuWSit1a2HMMDLLCOF0b0JWCyVqM9?=
 =?us-ascii?Q?vZlp3s+lH41rsEjcD81BpgXbF+G5Sei8VT1UFMUiOiouAucSzGegPHPLlWoB?=
 =?us-ascii?Q?AnNp2IIUPHyH9K96Dl2rhOBtOmnRgO9l1qdjFnWBmEFRhVAmsgW3f0wWzmUu?=
 =?us-ascii?Q?LA7h9G/jJm4/Znnl4FWP0TZiWh09ZxAOZKEjNHJr+O8g5cYquBvKgClBI0I6?=
 =?us-ascii?Q?/oKN8AgjRwBEgg2GD6ypLwiib0GAP5gSLDoL/g/grc3Z8OVroCtfW5tnqBxR?=
 =?us-ascii?Q?pvdOsjwCaq/v7uGoFF981N477oQu8lKQEitg/dL5p8x1t8jL1YXCTwOs+W3W?=
 =?us-ascii?Q?oxtwMgAt8X4PoXWmEfwmK0rs0GfH3Q5lJE0lLLToJIr6tOyj+b9+bl9w7x6W?=
 =?us-ascii?Q?55rUrP4wq7lIaZSzeysJgWYtmPP4yPlreDdHcvVkeUm1gmapDgaPB5Rt8HR3?=
 =?us-ascii?Q?blua0NtuRY7fRM2+Cts8bsPayPzqBh5nmRkLWJuHyWS0zqGIjRtNv/lnfOp/?=
 =?us-ascii?Q?Alz1anLTdmRMaYo1xAlYPHPIOZ6+NiZqIJIBvUFtFuDv3QnQ2b5sv+a9OSJB?=
 =?us-ascii?Q?yuNoswL/cdcXieRCZp3LbgOJZBSLwtc9cJ3+NiCkunup5x9jtSyERniYnVVD?=
 =?us-ascii?Q?rLuVmnOPcyw1JYXFnwZ/tejFSyOLRZdL5sPY07+jPry4/iF7mOLgbiA4QLMa?=
 =?us-ascii?Q?oG83CjJ1/Cv0A/AlKsUXfnpQLW1fTPXCrKpzmkgpeCOhYEbvxnbuKMLUM4hc?=
 =?us-ascii?Q?mCP6P8wk0TWAmwTOOihFLdLmONbWfMbr7ZUoNxSW2V+w4CFQEJ42qwzL8Rgq?=
 =?us-ascii?Q?dGiWIa051U6khCs8HmPgVx0IY6JNnqnSku4lp6ZrfasQ3ObrFmYSaWUBVCqn?=
 =?us-ascii?Q?EC6NumojEfQDiZ+XtB3FO8//NqdskG+kmyD/vMbEuO9EBXYLGVn+kX8/s/ri?=
 =?us-ascii?Q?8WVGV+dDGyR4RtvZACCKno1EwCu56xG41nYpevCSAMUB/UMU8FByx2Z9jKPk?=
 =?us-ascii?Q?6gv8qw2dKc4x5Xb0DEUZqpuAF8OJmBi7VoPLcvMRzL8fZJjXy+xhu7QBgomE?=
 =?us-ascii?Q?/etKECebQ0RjoGxdrny06k0Y5YpCacDZBSQZ55OQ1Yx5ApZwLBPDKPjZYzZ9?=
 =?us-ascii?Q?Jvw+F1Vwpl4cKGXHjCk1MYAUuRh15buLd484alWdT4uekm7aVTWMRSi5Ry3T?=
 =?us-ascii?Q?6W/kiFRGVJAEMmAE9TYGyt16x6AQoF7XItUwNdbB5e0w2G/wJ8neBO3d30pS?=
 =?us-ascii?Q?JCqgIN9CJFQWbZkSKfvN9L3T30EPFuffXJtm3Eyw?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 08c3a08d-bdde-4b01-731f-08dae6eb2672
X-MS-Exchange-CrossTenant-AuthSource: MWHPR11MB1358.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Dec 2022 02:44:46.6209
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5UD6kraYFi+9ggm/BuA9cQ+d8LzcdYVBueqh74hHggsiCiJ1NPXGL/ZCWQ/SZ7vnqmPl0R0R5yUSDoouZ+Ztag==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7298
X-Proofpoint-ORIG-GUID: Fhmck9GIbVLfwlzT23aFze2wl5L0DIzx
X-Proofpoint-GUID: Fhmck9GIbVLfwlzT23aFze2wl5L0DIzx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-12-25_20,2022-12-23_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 phishscore=0
 bulkscore=0 clxscore=1015 malwarescore=0 spamscore=0 adultscore=0
 mlxlogscore=999 lowpriorityscore=0 priorityscore=1501 mlxscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2212260020
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 26 Dec 2022 02:44:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175008

From: Ovidiu Panait <ovidiu.panait@windriver.com>

Currently, allyesconfig test runs for x86_64 fail with:
ERROR: linux-yocto-5.19.17+gitAUTOINC+0cba9aa404_aaf4490d18-r0 do_package:
QA Issue: linux-yocto: Files/directories were installed but not shipped in any
package:
  /lib/modules/5.19.17/kernel/drivers/nvdimm

With CONFIG_NVDIMM_TEST_BUILD=m, an empty nvdimm directory is created during
modules_install, which triggers the QA issue.

Extend kernel_do_install() to also remove inner empty directories that might
get created by modules_install.

Signed-off-by: Ovidiu Panait <ovidiu.panait@windriver.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>

Backport from master
Signed-off-by: He Zhe <zhe.he@windriver.com>
---
 meta/classes/kernel.bbclass | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
index 3e7264fb98..54b006550d 100644
--- a/meta/classes/kernel.bbclass
+++ b/meta/classes/kernel.bbclass
@@ -444,8 +444,8 @@ kernel_do_install() {
 		oe_runmake DEPMOD=echo MODLIB=${D}${nonarch_base_libdir}/modules/${KERNEL_VERSION} INSTALL_FW_PATH=${D}${nonarch_base_libdir}/firmware modules_install
 		rm "${D}${nonarch_base_libdir}/modules/${KERNEL_VERSION}/build"
 		rm "${D}${nonarch_base_libdir}/modules/${KERNEL_VERSION}/source"
-		# If the kernel/ directory is empty remove it to prevent QA issues
-		rmdir --ignore-fail-on-non-empty "${D}${nonarch_base_libdir}/modules/${KERNEL_VERSION}/kernel"
+		# Remove empty module directories to prevent QA issues
+		find "${D}${nonarch_base_libdir}/modules/${KERNEL_VERSION}/kernel" -type d -empty -delete
 	else
 		bbnote "no modules to install"
 	fi
-- 
2.25.1


