Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E79BDC77B7F
	for <webhook@archiver.kernel.org>; Fri,  5 May 2023 04:17:41 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.19736.1683260259311728829
 for <openembedded-core@lists.openembedded.org>;
 Thu, 04 May 2023 21:17:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=l9M6XzXa;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=4489daff9e=qi.chen@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3454HYK4005229
	for <openembedded-core@lists.openembedded.org>; Thu, 4 May 2023 21:17:39 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to :
 subject : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=PPS06212021;
 bh=ZpNTtMqaCzTUJtZNesrSyMlQXhBSbvN+yNDFlQB4Lrc=;
 b=l9M6XzXaKQGJb6OO/gDjGCJS/DWgFjuLR0NpxefIOe0CyDlLoA4wHZxfDgLOZinApAKk
 seRQ097RxVDLv40NXr7UseKVM+kJMz/Iaa0TR2Vn+6IkxWTKz/D3Z3cq5t2KM/g6UeFL
 J6ydbjOIv1iDbW+Jx17sSewJ1l710gj0hXxNc8zN4VVI4qEztcnlzzpRe6GaumfeDDXr
 kFM69jQz6NoQLZENxo7ib0N6xz2/bEYJp2Ke56fq2ubPTF3158ZWBpGjowBPCkuRkt6W
 TvzPj2IuYq+tLqvlvV/HZAljn1amymPy1navLS/QyBk55JVDuQaDebjEA4lZ26RyA/c4 Aw== 
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2107.outbound.protection.outlook.com [104.47.58.107])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3q8xh5nbbc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 04 May 2023 21:17:38 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aqPxnjQkso0k4qJLzrUZZtCdnt+KQUF4JVO821i3GINsS53gtcDfQ9Kc/z8tOvvtXiNsaccc7Ha/XOwO4HXNWyO/w/AyHPDSloXmVnXv099yS/moQzp+Xl8G9pPg7p+RP3RnSHEMmEQHfUjT+cHczZ/OLcrtkDh9fA4mdca/K6MZJjkhHSsXZC3qqthzrJ6lTahwfxFsPE+Ve1jR78FguaprzNB8rRnk7PRtYpz87S745CFwgHoLpCnAVpQIjYxbTIOqB+fE/9Q5pakNFZZ1wQrlHIm7nylc/9bkVbkFigw5V5Oah3GnYdAJzVt71sG7NYzxAgdVk9GjwBwb29U79g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZpNTtMqaCzTUJtZNesrSyMlQXhBSbvN+yNDFlQB4Lrc=;
 b=EyHvC9YpHzlPVF/gb6avyu5WMytO1qp3mzwiA+u6w7xT2vt4cc9Bu7w+ctQwjZcXggf4s6RFwMB3Chqp5DruWMXf3Z3B740pEJadjgOrc1Yxwa3S2rPnLcsvrMT8Rxs44Z21EPXaR5RznzzyNrfPORVucl2385vmUNgrHCWKtnxt/uMiIBmkXeDPqYE9dB3M8LkHzx79BDt7hpCoLQWrYD1mQTEvQamHh3Xw2LE/ybzRH3EAuce3CIhfd21DkDFwLxVR/+MiDPQA+Xgt4n3d/5UMKCe7XQjxEPWcfN0GW7BEHbvDMtFQlOcuId1mQy2x5dfPCCX0o5wQrxkhMn122w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by BL1PR11MB5256.namprd11.prod.outlook.com (2603:10b6:208:30a::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.27; Fri, 5 May
 2023 04:17:35 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::fa8:8cc5:a5da:7e07]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::fa8:8cc5:a5da:7e07%5]) with mapi id 15.20.6363.027; Fri, 5 May 2023
 04:17:35 +0000
From: Qi.Chen@windriver.com
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH] image_types_wic.bbclass: remove MLPREFIX for binutils
Date: Thu,  4 May 2023 21:17:25 -0700
Message-Id: <20230505041725.3186569-1-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.40.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR08CA0009.namprd08.prod.outlook.com
 (2603:10b6:a03:100::22) To CO6PR11MB5602.namprd11.prod.outlook.com
 (2603:10b6:303:13a::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR11MB5602:EE_|BL1PR11MB5256:EE_
X-MS-Office365-Filtering-Correlation-Id: 2a06c608-b328-458b-538a-08db4d1fa769
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	1TRN1ILyMAkChVjcopMCffyWH1xIYSBul03LnzGDzexVP+3vD65kQtdsOp91i0EmAlT+Z6IxclBz1fLOeflQ0drcXX8TA8J4InAy5ebm3h9Kyxzmyg2vrYJijKXYl8+3vlh/bcAZtfSmzBelBPLk1iZ3N1y3asN+xewVOjSbZfe0RZuxRdxElAP3DYSID7tndeY5qGbMGWhfY7NsvjQB21P2k9y9XqOyRj7I8dmWA+e0vydcJf2otHY4Nw2p8pD4TkzpSDVlKmcuOsDNoosCuEq1raX4wLw8MpzPzERlGoynBHu4l5wDPh88rm7izywdujGJqlX6uTYGcI+0Qi/G5tLeNhFGJPCMua4iFwNpyY12DOUOab9fPLWNZbfzKySRu2t7R1xUCCcmyVkNrtC2V6dmHtajR5c5KleuOIfNT481fiyjcCsgXkG5IyfgnJNwste6Z0mbkCUcdkIkExghr0XqPmqVdAVUk8ppbiiznshF20WsPMVfdjxt/FXklwzJ0k72ktbkGkXcSPxxrH2dxPw9fvQTqw9LLqokaSqdDWMbnTMzfO+5KzQqABLYV/G81upLFpHqCcQeGlSwACc3FTMWGVuNNtd0YXGHrPb0/m7DsCK+3JAwUbbfXyt4A5k1
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(366004)(39830400003)(346002)(136003)(376002)(451199021)(52116002)(66946007)(66556008)(66476007)(6916009)(6666004)(478600001)(6486002)(316002)(36756003)(86362001)(83380400001)(2616005)(6512007)(6506007)(1076003)(26005)(9686003)(8936002)(8676002)(5660300002)(2906002)(41300700001)(186003)(38100700002)(38350700002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?Igvb0s2lISdF/7rEyb30D3ShxIGp74ylC/1jKCwi1Qo0syJ1QJk2JsQHQfDO?=
 =?us-ascii?Q?IDwgW6YzdOfBz4hMzKk44lYzMqCUGq3s/JmGwUMagmQm+pacV+CeezZEui7U?=
 =?us-ascii?Q?BtVFokrruJvXzgtRskQotiLkecvbzPV1NzIEgF6+TYQaT89vY1XIKTwX1A3q?=
 =?us-ascii?Q?+t/t7YDl2W8mSFD9IrYw5ezvncl+UHAh4b+rBwf7jwpKnFS/V1VVTIcGTVYB?=
 =?us-ascii?Q?ImLPpU/PojgUBw7gSgm7WX4bO8FFDRLntgDLN29zvkdh2UIdlCzuXOvWPf2O?=
 =?us-ascii?Q?Qwf5sj7m8Cj1ocIEYdqYB/G2ytcEcuY/3tGhteIPuiGG2NIJO+bYI/rbMoOC?=
 =?us-ascii?Q?S4h+N/n3axrV1plFdAREVgeu3B1saYAWwws3oAQEWka4nCjlZw6KyaNxjsQM?=
 =?us-ascii?Q?lj19V4ED9ybEzi9TtITiiLbjNgi0NVXtK9KCS9C/2aXIWbLsiiv7/dG9V0F2?=
 =?us-ascii?Q?8yNQ+yoSZNSDpq5TWzFsjAaIuoqew094cHWiGBhhGl9TGJPie6MwIRxWTAlJ?=
 =?us-ascii?Q?RuQB5x7aFTP9ATdzqyC/nr18/iZzd6YQFfG5EbO8+02Sv2kj91sjSxrZs9yA?=
 =?us-ascii?Q?j4sobmI/eA3y+M/1QcgrEdKyF4HjLUrfRjdJNTQlSRTeobSJIjIus24aZdHA?=
 =?us-ascii?Q?42cK+W5eJHjgQl+Br7saTZkbDtCekAs0XMvgm53teUPiZ3LTRLVgnIKC/t+u?=
 =?us-ascii?Q?nC/KXXVmm/9e1jXdwrdfowoXcyRZBvtRWS4t0ozfXOKzffXnC5lHOL5rmqkj?=
 =?us-ascii?Q?FndCrw6/NL5ks22HIfSXtTyN8L0k4D3BUQEnjdNwaGKPuTqW6myQXjay9qPw?=
 =?us-ascii?Q?wSaVNu2H0XcC88y3qKh97qfyGs+IUoGQXQzzxJ3mn6DXME0hzfJ4LHZhIHkh?=
 =?us-ascii?Q?DAc8KlQP6v69iLJz+QiJg/QElFt2W+yM7BB5d4uQ/eN8ttva8Yvlk6snquLn?=
 =?us-ascii?Q?0BsB1/KZS3vKJHaTAu/VtkKXwYOdzIRlImWjOIeV6a3qOOYMvxYnmgR0P62c?=
 =?us-ascii?Q?bEmyUxSbzjmNdFt5Oe3Q/1sSfgy0yTgi4V9UZE2UfENJtYJ1xxMYMps/Ion6?=
 =?us-ascii?Q?wYGQJ2eKMihaXFb513Bj6Kej2u12TRR8SvM1b06fbaGKzXGhmUL1ie/DUE/+?=
 =?us-ascii?Q?XWMgIazBLlV1yHOe7Cy9TOBdMGH26DPyhfULk0vuaIR7JJfbdI2jDuCFHpMc?=
 =?us-ascii?Q?sbE1XlrljPW0mKZgTNCu337SAU9C2XgoxxaArxFkvshes84IcAlkLal9/62J?=
 =?us-ascii?Q?3HAIWAmuhbGglvmzaI/g8/A+eo2kZiWvdcGdDjT/rf13PHSYdmHCCkZrCW+m?=
 =?us-ascii?Q?pOJWSGwD8NN1VV4bKHweBY/8KTdYH1MrPB2Af5pNkgRmKNuJy494UW1kCqCt?=
 =?us-ascii?Q?OAu7BfW8qPaYo5q04VfOIlOciuaUzlKDh92leKAYYVE5pTHVX47vf2P7xoHu?=
 =?us-ascii?Q?FUIGOlBCSxAAqIxwa7bRMOgr/qFoxgaav6z1Y/9DCzBfGM939dVBduICg0Lv?=
 =?us-ascii?Q?0TCbI2D/rfRVGhMa91Yh0LNYop/2nzlwbUb4nOnSBZj8vS6t9evFu92SaCO6?=
 =?us-ascii?Q?gGzKZxHnBk3zNET46r2xLILvze+QFPOmrUYWmtjW?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2a06c608-b328-458b-538a-08db4d1fa769
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 May 2023 04:17:35.2995
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tJ+qpSks7Md3NoQZmNuZ5lIL2S3+Y8nHQursQHtAy8NAGV2IJsisP7BCR/RPcIyHr4MfMlhMwd/R/98fEvymRA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB5256
X-Proofpoint-ORIG-GUID: oMDKBhVrLeq1d-6AfSeDtF0CyDrHJXgC
X-Proofpoint-GUID: oMDKBhVrLeq1d-6AfSeDtF0CyDrHJXgC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-05-04_15,2023-05-04_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 lowpriorityscore=0 spamscore=0 clxscore=1015 suspectscore=0 mlxscore=0
 phishscore=0 priorityscore=1501 mlxlogscore=685 adultscore=0 bulkscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2305050036
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 05 May 2023 04:17:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180901

From: Chen Qi <Qi.Chen@windriver.com>

With the following two commits, the MLPREFIX needs to be removed
to avoid the 'nothing provides' error.

  gcc/go: Drop crosssdk suffix from virtual provides to improve dependency handling
  binutils: Drop crosssdk suffix from virtual provides to improve dependency handling

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/classes-recipe/image_types_wic.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes-recipe/image_types_wic.bbclass b/meta/classes-recipe/image_types_wic.bbclass
index c339b9bdfb..be31fbf94f 100644
--- a/meta/classes-recipe/image_types_wic.bbclass
+++ b/meta/classes-recipe/image_types_wic.bbclass
@@ -91,7 +91,7 @@ do_image_wic[deptask] += "do_image_complete"
 WKS_FILE_DEPENDS_DEFAULT = '${@bb.utils.contains_any("BUILD_ARCH", [ 'x86_64', 'i686' ], "syslinux-native", "",d)}'
 WKS_FILE_DEPENDS_DEFAULT += "bmap-tools-native cdrtools-native btrfs-tools-native squashfs-tools-native e2fsprogs-native erofs-utils-native"
 # Unified kernel images need objcopy
-WKS_FILE_DEPENDS_DEFAULT += "virtual/${MLPREFIX}${TARGET_PREFIX}binutils"
+WKS_FILE_DEPENDS_DEFAULT += "virtual/${TARGET_PREFIX}binutils"
 WKS_FILE_DEPENDS_BOOTLOADERS = ""
 WKS_FILE_DEPENDS_BOOTLOADERS:x86 = "syslinux grub-efi systemd-boot os-release"
 WKS_FILE_DEPENDS_BOOTLOADERS:x86-64 = "syslinux grub-efi systemd-boot os-release"
-- 
2.40.0


