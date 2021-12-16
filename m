Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 958F7C433EF
	for <webhook@archiver.kernel.org>; Thu, 16 Dec 2021 05:09:31 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com
 [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.6285.1639631370193127490
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Dec 2021 21:09:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=QVfCrpiv;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.166.238,
 mailfrom: prvs=7984e022ba=qi.chen@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id
 1BG58LZY031852
	for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Dec 2021 21:09:29 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to :
 subject : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=PPS06212021;
 bh=hpv6jksVMR3qwsOD+TE6nBgXdVULCNoC9F04woM4bu4=;
 b=QVfCrpivV0eWwCughzxhGwb/e/uyu67yIHyJZy6MCsuCDWwzBciWx2C72qqzIUR4WfUN
 QxwhBjTcseVIVfhHLe2wf57nAbsRMPAd9oFVhgLGOf25XFLDch5QXT9L5hQWCyGNH2uG
 3ZwLGj+AvhOYEmPSeJxn3Ka09PQjkGZWZHjxS+0+Wm0cvM85gWgJoPmcMRdYJqQbNl2J
 2wCZtBOvp8V3rRGVZkNDHor5NvyPFFMUDxHElWY4ebUK0orqYMxFqL5fEPTwQ9FW2jNi
 SwnvqcIIbvK5rCn9Db8dvMKLVmJNHC9/nWfqG9pMFYc31kiYTV4PFgc9QlHSkp1wX9Q3 Cg==
Received: from nam12-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam12lp2176.outbound.protection.outlook.com [104.47.55.176])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3cypc1gbqj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Dec 2021 21:09:29 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cWUe7GmnXQsmk8Ufz9x1sv6ZXXVykomfdF9ktMZsesn5QnuJBbRPKldlt6CuhcY9vwRKmZNrB9p7PIYlna873unlknbhMDqejM8dPfTNma0DkZgNC9dOXE0UFF5+zgXDPYCPdtOAVZPTJ5ma9gCWmOnJDgeSoW7WP5xyuzk+QaQlNNUw5IH+oLanGmc30FCubLEG2w7aQluXJckUnae9RnaLZ/m1/Gs+oobFgSa+1Km2NYLLUbLgP474/zgFLOofUBC7bSJMMAE+AEvWN30ZxIri41ANdCNQTNNseLj4qfzKR6J3/Ru0lcsmW+6VklBBolrypqKnc16wxuwo5vhyAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hpv6jksVMR3qwsOD+TE6nBgXdVULCNoC9F04woM4bu4=;
 b=bLAWJiWH+P6Gh6ujKMfH7icsY/scmWW/mpVCMEw8ymqZpKRnSM/T0+zkEeuPMGcwCSsE8cUup6sLNcd0QWKFbHSIIWNnkYRcd5PaCOBbpt7mKrIv7aXLLRF+ZWW4xUZi8Jpa+9LeT8Mn4K1MiYXvRprAV+5DPACEFrD2mm9zc7vBo60Ry49HwEZ54p0gTdPaDQ4pKHZXFxTnVWAjAocpOvYUPVS13//QzqZHs9PEVkeTGEB78m398QXt776uEHUINrH5MGfxf8QQBSWavz9QiL4OZRMWInakL3YPDvJhoTQs3VmJJmKNEA07kX5FYM3rXOC92WYsgWyEOtMOvj+53w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by CO6PR11MB5570.namprd11.prod.outlook.com (2603:10b6:303:138::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4801.14; Thu, 16 Dec
 2021 05:09:27 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::e4bd:c128:9168:b142]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::e4bd:c128:9168:b142%3]) with mapi id 15.20.4778.018; Thu, 16 Dec 2021
 05:09:27 +0000
From: Chen Qi <Qi.Chen@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH] core-image-tiny-initramfs: delete populate_sdk task
Date: Wed, 15 Dec 2021 21:09:14 -0800
Message-Id: <20211216050914.90422-1-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.33.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0079.namprd03.prod.outlook.com
 (2603:10b6:a03:331::24) To CO6PR11MB5602.namprd11.prod.outlook.com
 (2603:10b6:303:13a::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7008260e-1249-4c3d-290d-08d9c0523b7e
X-MS-TrafficTypeDiagnostic: CO6PR11MB5570:EE_
X-Microsoft-Antispam-PRVS: 
	<CO6PR11MB5570B604AD6664EB14F07DBDED779@CO6PR11MB5570.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	LzMS7EKwKgZI2rRmHvV0Cq1B1UT9PCiCaJoF/ow/14CSgAPeCnp6OlcxZUAfVm/KEO+kbQPp2zmd3CHoDgv/WLx20Gl9WpU5ZVWWAnT0ItLB+ORDkC8KCPhCg3la0o6Omax7gfAwud+4cPixzCYGDINWGdqH0BN7DG4VkRvppEppg2MylCQJK/ebEdhCjcBdUdEftWQUwmet+guEMxj5RyNUjvInSbszkNVcgoZbB8VcXPlwAAheEen3ZEuehViFhRhX9KvPzLcgebf6YTpT14Uput8hly8dNm6Tn5nvqUN1ZmxzQLKCVt2DwHMLvI1q/+LMlwcrh8TlxO0uSQ4K1f4uIb8WWmBVVZB61ZwnIwdqtiuAQMu9No2/SfPERwI92GfDqvV1AaszR4dtAAy8Uea4OZyvoCn1M9kt5pleTsUwtHYnNue9o5mm0seJQGWQPODjZJYLBxprd2XaBFLEL/pSZ2jjafCLOK0zVYGNIgguxTb0XQDhEsTnN/xEybLxtACIxcWO3P9Lg8a3K3bh7ocvT/j55jTCpQDoRpMHi58wDXWJEvIavJgfyFpxCOdwgsasnKSZWRCd7gylPjo6ijirnKAXJlsjwALpNmV1utXt+SFGTi1IiGk3fwlUTGXvZCLVVZtgqKTKM0SL0HA4MB/9a3yd+vCezxz/iwLVNPbODq+QIq+abd3bnMqsnhuaJh9YXa4UzR3w06BPA19W0Q==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(4744005)(6916009)(66556008)(5660300002)(66946007)(6506007)(8936002)(8676002)(83380400001)(66476007)(38100700002)(38350700002)(1076003)(6486002)(86362001)(316002)(52116002)(2906002)(6512007)(2616005)(36756003)(508600001)(26005)(186003)(6666004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?lYiVUleeGjLv4JtEDOCYSfs3XYQBtmplnPgXjWC8yo5OeNmvZaexKAOySOXr?=
 =?us-ascii?Q?g4od6vCX2Ddl1dsnrjH/WT0GZkOn4Rd/LYvbvKqhAagDg7jkxKvt6fwfFrYH?=
 =?us-ascii?Q?NiFepiQ06/e2sKJI94g6OHOBRDcuYErg6xrTXvESdt2wlzfMFG/YjAYjR54L?=
 =?us-ascii?Q?9CvAE7fcnNqwowjM3deFUEdEk7i/tqgz6C9A2lxgGDLrF6jE2TAp8FOkIla1?=
 =?us-ascii?Q?rLSX0jyzGiQw+zgN4rOXuzI8wQDOFO9ZMWt6dE/gJmHM5980iGlxKigbqLXm?=
 =?us-ascii?Q?MgkYjWYX2zsulc4lrXUegXW9RD0CO3hAT93eF4jcbnnicV8AAJSdPmmJDmKC?=
 =?us-ascii?Q?dOKSTZjfVl0o3SoU7TbZIq9JhkTYm2SR0ucClEF5wS7yGlsB9gA5m1NDYG4D?=
 =?us-ascii?Q?mOgg/r4Ggd55BPxn7ImQLLnbspZR8qYKtLEM3Z5RfjLqJuOgzn8/xENAtrRw?=
 =?us-ascii?Q?nceVUQRfVk+q/w7+EGU/QU1u5id841cEmKUmjgS6Uav5n+P+mtEegPpuC0py?=
 =?us-ascii?Q?VZoTTxZjC/X/0DGoqQlCl0GlybYDJfENFjjnwPQj3Wcrf+AyzTjlePf8qSwX?=
 =?us-ascii?Q?6N36BrIZ1cMw1ySzvWi4X5Y4BrKCmJAkbZlX5EAtONU3bzwUnq3HXfwm5Iwx?=
 =?us-ascii?Q?YOssComQIwSYu2wts9DuUesCDuLNWl6nOTWt3EfCh1uM98YQ1E5VodlI6npo?=
 =?us-ascii?Q?Vm8eZzXnI9HnPSPhzTn2An1lqHccCjPoE+0DQNJbnIbIbvkMfDuR8PBYdwpd?=
 =?us-ascii?Q?/FTmJ5cjtFin8p52AIZyrOLBTh41fGmWBZmUJrO3C0/0N7tL7vBXHGGyixDA?=
 =?us-ascii?Q?1ou8ml4DOAvgES0KCHJkjprwEg2vfv2owgyUVG+mugfogu55rGeJ2SwqOwN2?=
 =?us-ascii?Q?PJP0ga2nhWB8SfhC72HAPSfs//ZxeRaRmwKIbfgeg4g2XK7lGulx4ivuhpMl?=
 =?us-ascii?Q?DphGzOtcb3Jt/uqlZRytHoNc+31uZxpKCZEo+ZziBevlDeq2v8VY3Idwl10D?=
 =?us-ascii?Q?ZygfG6OHu0u6NRIlVl7mVG1QHY2/y+We6GKBDLd2cO20kS4HQyrs2bTQDX36?=
 =?us-ascii?Q?rtM4XipoQL/ZnSoImvARFWryh/L9Idi2t/G+V7+HYOUn4dAw8iqwigOcw+G/?=
 =?us-ascii?Q?zgJnrkWCyaKFIKnRziMaqWKgPvGDx+4rsAqOZJtfC3Ra0hYM698sCLIw1+qe?=
 =?us-ascii?Q?i/vb6lBubZlEYNfDNABSXEzPUnAbsx1xRXTAdTKdpWAlP/86OotF+Xr4Uh5I?=
 =?us-ascii?Q?RxQE5GXbmWMR3Y+uK6sbE/2yvovDIdO6mcNGPgrJLJmajU3a0v2jl31tC5pt?=
 =?us-ascii?Q?1rt4zTbiU4axFrI3tK9JEG1/Gtlkg5+NfHIl/bQLyW0QJavc6DoRbZ7FhXIx?=
 =?us-ascii?Q?BBqDKhOeZJpt5YEfDu2VJ2OkIYldlcNHt5fZyZbNrug4+OUGxE21at03J93M?=
 =?us-ascii?Q?Z9eEB3Nxr2jdkt8A8/iQpgfjQQaQDWIvUcd/onHxF8U82kWLp+/l/mW+Ma83?=
 =?us-ascii?Q?Dn4qaZF+zC0L6L1cf5gf80voFlyyoKe6aqKYk3unM9adDgAFTV0yuNarkpyR?=
 =?us-ascii?Q?z7WxmZTov/HgeCbhzawF6n8RguiQA2HKVCn8HDsJNKgV9Q7iEs+J6fSp6Zs3?=
 =?us-ascii?Q?Y8juy64MStyuIr12qORirJU=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 7008260e-1249-4c3d-290d-08d9c0523b7e
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Dec 2021 05:09:26.9954
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 vx9nHLSYpyLf7SOU/lW7gY57H0ScWYPIUyBa29wDCc+z9nNWFOIjHIpX2S17JcLwURKF1ZP6IX01Ro1C3oTtUw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR11MB5570
X-Proofpoint-GUID: u4L7nv8G1JoBH9jgnfwqjfJklIXTA--i
X-Proofpoint-ORIG-GUID: u4L7nv8G1JoBH9jgnfwqjfJklIXTA--i
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2021-12-16_01,2021-12-14_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=635
 impostorscore=0 malwarescore=0 clxscore=1015 mlxscore=0 spamscore=0
 lowpriorityscore=0 adultscore=0 suspectscore=0 priorityscore=1501
 phishscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2112160029
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 16 Dec 2021 05:09:31 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159771

Currently, if we do `bitbake core-image-tiny-initramfs' and then
install the generated SDK, the following error appears.

  tar: ./sysroots/core2-64-poky-linux/dev/console: Cannot mknod: Operation not permitted

The populate_sdk task does not make much sense for this recipe and
considering the fact the its SDK cannot be installed, we'd better just
delete the task.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/recipes-core/images/core-image-tiny-initramfs.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-core/images/core-image-tiny-initramfs.bb b/meta/recipes-core/images/core-image-tiny-initramfs.bb
index 47470849ed..66c73e4261 100644
--- a/meta/recipes-core/images/core-image-tiny-initramfs.bb
+++ b/meta/recipes-core/images/core-image-tiny-initramfs.bb
@@ -23,6 +23,8 @@ IMAGE_FSTYPES = "${INITRAMFS_FSTYPES}"
 
 inherit core-image
 
+deltask do_populate_sdk
+
 IMAGE_ROOTFS_SIZE = "8192"
 IMAGE_ROOTFS_EXTRA_SPACE = "0"
 
-- 
2.33.0


