Return-Path: <xiangyu.chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A0A8CC4332F
	for <webhook@archiver.kernel.org>; Wed, 12 Oct 2022 02:25:45 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web09.16191.1665541543170139306
 for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Oct 2022 19:25:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=VoH3hlaq;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=7284d77dd1=xiangyu.chen@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.5) with ESMTP id 29C1ekkA001102
	for <openembedded-core@lists.openembedded.org>; Tue, 11 Oct 2022 19:25:42 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to :
 subject : date : message-id : content-type : mime-version; s=PPS06212021;
 bh=UMyhFL9RzSTgPRR2jGq+tlaYAoiN9AU6+znuz7rMjdY=;
 b=VoH3hlaq5dmQa4/M3BVgIy1e1TkJb9v4Yxt1+6claeVkSJcg/F6H8HzeTtl9S5xEt/GA
 Y5SeNFA5SgTZEa9v+zuy3l8ZU5SHtdzWkxGclIwdZdFr24UVed3Csh1STB0RkR9MBqSK
 vkS72XN0eqMJijvB0ZW92DsPve9/fYlx/7AOHYzOlQsBjAG5gkIqdVly6aWQW6f4LXC+
 mRemkj9fKVIyc/z4WvT8h2Ur6ZarBYkrBTU0DXsvxUD4W1cpvSC67nj+PaLrUED7XKaI
 DIgep8Y1ngOlvxGRHjxmSqxcYghgNZ0iQrZpqvh3lbHNxgZUrRADSML9QBdV1s0VI2uB TA== 
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10lp2104.outbound.protection.outlook.com [104.47.70.104])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3k34g2asvd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 11 Oct 2022 19:25:42 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JHU4E0sr6phE4Bb4inFey9CrOtxuoBwsbmm10d8MFgZI2F06br0kuoXsJeZihkor46whLhbbV5ChhpDjxpW8/U4IUwakd3wJ+qKrc3hUcV001s2c4O/VaMmtlVkxhVUObktXll+oh0mqCESS2uppUJtfLyqaIW0FHttOAG6C+x59hogynibDa96XwODclCZMjrO+6RAzqwKZO7n/w8+W6l12TCM7JMm7wkd1ApIjJRaDa6rEZM/lYifMCRMS/R4wcxU6hZTqX35YeIeZaheOtOT6hkGghI5pcI3hys6JYp3T1f3gKhBhGG9PyQatBtv/F6dI7yPSpaILZF8ffK1xww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UMyhFL9RzSTgPRR2jGq+tlaYAoiN9AU6+znuz7rMjdY=;
 b=HmfR9a5vX/O3o56Lp/OvekMdbsI1pNP4z31dXulXHUPiXzv4rKMGzStHbiSsGp8o+bhx3nlFbElhoqv10eOYL3FydjDARNE1tT32JQW4o3g92tWVDhwZnUgthvYZsWOAwQXe1zsAm1L5Pwzbw5HD5EPx7p/4p293qNJAoJcAxM1D3j3HYiWH0f9E10+rIaD3Rd43u3YXFVw+1xm49sPNMl1ML70htrbJnsqIJWydWmC2nDcZfbyIQqfkx8O8Ui/H+DbT5/Na1qOACCO8vK3LVqAG9uzhS8deupeKflU1Ud324ynnXNvoWf7ml2F6llGQGemf+nHM95wFUcRV+WQJjQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from MW4PR11MB5824.namprd11.prod.outlook.com (2603:10b6:303:187::19)
 by DM4PR11MB6381.namprd11.prod.outlook.com (2603:10b6:8:bd::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5709.15; Wed, 12 Oct
 2022 02:25:40 +0000
Received: from MW4PR11MB5824.namprd11.prod.outlook.com
 ([fe80::99b5:140d:8487:5f3]) by MW4PR11MB5824.namprd11.prod.outlook.com
 ([fe80::99b5:140d:8487:5f3%7]) with mapi id 15.20.5676.032; Wed, 12 Oct 2022
 02:25:40 +0000
From: Xiangyu Chen <xiangyu.chen@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-Core][PATCH] linux-yocto-dev: add qemuarm64
Date: Wed, 12 Oct 2022 10:34:36 +0800
Message-Id: <20221012023436.114599-1-xiangyu.chen@windriver.com>
X-Mailer: git-send-email 2.17.1
Content-Type: text/plain
X-ClientProxiedBy: SL2P216CA0097.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:3::12) To MW4PR11MB5824.namprd11.prod.outlook.com
 (2603:10b6:303:187::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB5824:EE_|DM4PR11MB6381:EE_
X-MS-Office365-Filtering-Correlation-Id: a2b54ada-e95d-4e3b-f369-08daabf90e11
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	o8kJLLkj1YFQT7YPoyeJ8L0rfQFuhonKcroKo4zrsAJdSbTXab9XTpiKRDbZs8PstScVafeRI6tirP+/wpViMAYr+/7T/ideHt45OIxYSI3h3t4I1hnxBQCokZB6prT9178LINEjkUlC2eqbS5/hiq9RWv5JyHXkSKMp73O0mSdQFAYUbu0lT415YsHZJikqOwmCghEBZYGSrXIyIismP6udppp9MUz2EtzkPqanaDX5VKOXkn/Fa6xWS72Plit6KJ6Y3DwYYWRIgcJ+t/zwkJPDQcnkRVgE8b637od1PBaPTk1XSQO8qzRgTnbfZk97xUr7eRoZ5q6DZPoEy6O04GEKjXO3Cj8LbETkKYxcRLVNWNOHWXZaDPybYyGmFod6rdvPxBx8kJHPQchJd2aTz4y8Dug609CPedXqZCtt60ywnYuhXMSTjOzPR+VLmP/AATpX55elGEWKsM/pzxG4iTnn97xsk/RqbURzLE9zdHZMw3vnenQy3ChEebRCDlvLkjr24+Z1oVB1hFyv4UbDSaAfS6mkgOVi1rqa0vbfsNrmTsHuIYlmSf13JCME/Dw5iC89D4THmo8x7O/RtFEiil9IZj3mtMBfXyz+TnOZ+WTo9lpGJTvkXtR9mbH44W/Os4FFHAXMzRe/zeAmB8sX874w78LfEyHWtWuBFkgXvS+kdJpZ6aR1BWq/wT3takt1xNUb3d8pIyZKFCBUTAeBPhmK5Uk/qVcaZ02/SQavCn7BNXDM2BFK5ZjxaB0yALhe
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR11MB5824.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(366004)(376002)(136003)(396003)(346002)(39850400004)(451199015)(38100700002)(86362001)(36756003)(38350700002)(26005)(66556008)(6512007)(66946007)(8676002)(66476007)(1076003)(52116002)(41300700001)(6486002)(478600001)(6506007)(2616005)(5660300002)(8936002)(6666004)(316002)(83380400001)(186003)(6916009)(4744005)(2906002)(44832011);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?tVVzfbjs6NXDy34bS+eD5/2FjoQjdK784Q8hz9ewzYTZRASPQzvanYMttREg?=
 =?us-ascii?Q?4l24WSWSHbNHLlnxM7TETbur0+eySZEpqGPxQFnqDufPF86ZbGo5IJb37uWZ?=
 =?us-ascii?Q?Go+N4y4NpuJ5OxJKbIN8CpsharwMFmsPSHXXbGaAlkRyh5LK3y3+s9qTQxlP?=
 =?us-ascii?Q?2EA0fnsjFuQARjhGmCywzJQ/pJ3C/QPuMDMknq3WHrseTijCubBHpMjuM0RT?=
 =?us-ascii?Q?W4y/Djj4nySESXDJRj+fVE/NHUE+tlvCFNpF3CK//+bSwC/wzuSav3eXdML3?=
 =?us-ascii?Q?RZX4vJA52iAnKIRG1/zo7p77XzDghoN0psZGiavXFIsCbGHcU7j4/p2ixLDm?=
 =?us-ascii?Q?ZgcZGUAgTrG/kE2yHWHsHDFlnGhTyMT2MzXopJx4lUKUJN3EA7xncMnZ+l6L?=
 =?us-ascii?Q?OM31fMKuxTYDiul8Y+aO7Myz+hTtsMzqj7XIl5lWTrzAOlZygkkAgW4TaRtA?=
 =?us-ascii?Q?QcaW3K3ODXPdNT0ywdVwuRklaf2sHtg2KlVzahBfmHhaO/zJqn+8ECLfgvKN?=
 =?us-ascii?Q?Kiy/wHdQakcWEd8NKGkQCIidTupi6tGnnJB1Vi8Ay/Cu9BRzNlTbMQdMf5hr?=
 =?us-ascii?Q?eo1mVddJHGr6Z5YhbjC1yhIqn/PIgd4f6hovNXZ6hNoWbcndFiojXMfQU5KT?=
 =?us-ascii?Q?98Jt24PTjLrnEH/+z9rzWeqTeD/cnv5k+Cm1Ud8ip19YH5pevO2BJySir7u9?=
 =?us-ascii?Q?EI7ShNISByFmzFGQ6/snikpYSppoif9TyUhPHuXeuIkxjVjbNqyWljs7dvIQ?=
 =?us-ascii?Q?uPqL8WlJadk+L48PONQURjDghTfFuHZGko+b1+0htsnM0DpFICZbAksUDV3p?=
 =?us-ascii?Q?Eu6NJxqebmeHdrYJJjZWvBQe7kMNBM4BIRpNd3eH0dvH+dQas2AvOP0nC5Cb?=
 =?us-ascii?Q?BWFjaxNmODYfWIrCuueoyi6a6+HsC3h8Ts6rQbMuixdy4N7YcirGhHXzHJmF?=
 =?us-ascii?Q?DUDFMQUf13VOOJV+jdTS73rljDVhrz0mn7bY9VTtUz+oEar20Ap/qU3NVC/A?=
 =?us-ascii?Q?Iq+pHtoiHJRwoiLwbTXza6QtZU/g3UG0Mq9xK88BMS2bLR6peyFlBLi45DjB?=
 =?us-ascii?Q?wdELvQEmNjI0i54MHjE2vwgFmONCNDjj+bWHbOr11oEopVA6TW0suNhT9Mmy?=
 =?us-ascii?Q?6q0PVljCgxpErKHW9/NNIEpzzdnTTs0d+F7AVbbYTQx/jNYmMlhqMM3uaXkp?=
 =?us-ascii?Q?iMCd2SXbIigA1rcvGYwUKaxYLV+nAYqXApNRCm92MTGzDG+Bjm/Yp7gK4e0x?=
 =?us-ascii?Q?xEjua6UVw8+Hk30WqbKCHWnwyuROt8U1waFONdc/WiEvUB5dPkR4Wwy6t86I?=
 =?us-ascii?Q?tdMOFlcdEREhtRtZEgzSMlLfriKC00z+x+0LSOulFwlXMKINjkNzv5wUGgwI?=
 =?us-ascii?Q?VG7FN1FAeCgtdnv+LMsCBFPiSdkbseAUMZgHS+nU8yhbmF8AGErNk1MZfjuH?=
 =?us-ascii?Q?qYIx5WIVlWcjuZmC5D5P5XqZfrs8YF2ZEYHjOW9rOW0p4imU/2ZqjP2oOP8P?=
 =?us-ascii?Q?tqF1vrhdE3Uc+jYPsiNZQ7Upgja+bSjuVasMo0vcGAq7K9W4BkSi3WAvqDT6?=
 =?us-ascii?Q?JbLuUQHUTOKbwF7dSArmstOUeQdHKbwgHTyuLndQv2M75tW0fd0o3j+qnf6D?=
 =?us-ascii?Q?bA=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a2b54ada-e95d-4e3b-f369-08daabf90e11
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB5824.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Oct 2022 02:25:40.0578
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6iPLG2WRavFiY+k/pU3H4X6MO9sczUg+r24fxIhLZ+Y/0UgNl4AP8EoKmsU1rvLWmagZZQs4WCL18z1yKCu+FDCx8+e+3SSNjHATnqHIkQA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6381
X-Proofpoint-ORIG-GUID: YL4u7tsnaXZiEqYCCiy7IEB8y__1QK4u
X-Proofpoint-GUID: YL4u7tsnaXZiEqYCCiy7IEB8y__1QK4u
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-10-12_01,2022-10-11_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 priorityscore=1501
 bulkscore=0 lowpriorityscore=0 adultscore=0 mlxlogscore=604 clxscore=1015
 malwarescore=0 spamscore=0 phishscore=0 suspectscore=0 impostorscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2209130000
 definitions=main-2210120015
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 12 Oct 2022 02:25:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/171644

Mark the qemuarm64 as compatible

Signed-off-by: Xiangyu Chen <xiangyu.chen@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto-dev.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-dev.bb b/meta/recipes-kernel/linux/linux-yocto-dev.bb
index 75b1cb2a49..403993486b 100644
--- a/meta/recipes-kernel/linux/linux-yocto-dev.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-dev.bb
@@ -50,7 +50,7 @@ PACKAGECONFIG[dt-validation] = ",,python3-dtschema-native"
 # we need the wrappers if validation isn't in the packageconfig
 DEPENDS += "${@bb.utils.contains('PACKAGECONFIG', 'dt-validation', '', 'python3-dtschema-wrapper-native', d)}"
 
-COMPATIBLE_MACHINE = "^(qemuarm|qemux86|qemuppc|qemumips|qemumips64|qemux86-64|qemuriscv32|qemuriscv64)$"
+COMPATIBLE_MACHINE = "^(qemuarm|qemuarm64|qemux86|qemuppc|qemumips|qemumips64|qemux86-64|qemuriscv32|qemuriscv64)$"
 
 KERNEL_DEVICETREE:qemuarmv5 = "versatile-pb.dtb"
 
-- 
2.17.1


