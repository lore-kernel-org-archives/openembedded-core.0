Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F90CEB64D9
	for <webhook@archiver.kernel.org>; Mon, 19 Jun 2023 07:41:42 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.2805.1687160494852636624
 for <openembedded-core@lists.openembedded.org>;
 Mon, 19 Jun 2023 00:41:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=jWjrrahM;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=55343858d1=qi.chen@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 35J6TfgT003709
	for <openembedded-core@lists.openembedded.org>; Mon, 19 Jun 2023 07:41:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version; s=PPS06212021;
 bh=wRpQwiwcUpyxYvWOQINSy7S4gBkaxuKSSMheA0nAcas=;
 b=jWjrrahMz+QdhN+SulOxvC5AUlpKB4S7EA9i9XSRO9K/Dy5Kxi3Qdvdy8qKSkK0XVc0r
 V6DaEbZgh4GS9nVEpRbpBOs2+x/jLBDfv4uNeqtDvRfW1ZoxGUjSiuqs51TL1utlAnL7
 D+oihwjQcJa3OYiitx5RQo0ipDho9nglq7SQIpIX1kz70Xu94dBtSXRTn380FrKV58Kb
 AVifvwhU73lBluEKr2AKhD9EVcW3pKe82wGAQtDQXVOZ0Itx2sVn2C+3puRaAw+VTCos
 aHIJY12jB+so5kVWwekNBwlJ+TdmCj2S+KL48EkyIYehqP34QvXCi71Une8VmksZGeKa Cw== 
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2105.outbound.protection.outlook.com [104.47.55.105])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3r9220he5j-3
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 19 Jun 2023 07:41:34 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jvOIMC+oOHdAZBcpUtNJ+QhWXFNiFjZhMcMBxDpO5EqX5s59qunw8MPfDHcqsJriDve3krSMohaicMm2ov453resDAv2QqqC1uj5t4LMEh74lVRTsF5Vtz02Pzqi4XBC9BRyBN5cFx5RsEwbKE6zbbFkPBNAP0nKWVH5WVGy4+E4ZDMFZLumqfndmfKtS1zIZgMmAxH3NRnl/0d+fs6sF5UTIC0ezWWbfjeoxMxxNJNfTFUBPnf0BbAWs6j4zqwk80W+4FViorwsCv59nJPOvkOsHAKnkj5daWMAi7fl+WwP6eBkEdB6+cFBrzPQvYDCsKuWORWzeZhxAXAxc9MpwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wRpQwiwcUpyxYvWOQINSy7S4gBkaxuKSSMheA0nAcas=;
 b=idGZm1eFGgLl5ZcObqCeS3jCJYgMrpTIgbhiKEp/xQldPwpR5qtLwoedoML2UuECjVGv5Gvb3vCX1bqik9xxQy9dKFInX+/Bc+oLu79dwmL34pC+z/RL5iWw3tMNq27e0YKmSsw7925ANWF8fuZJp61bsQHO1duCvjs/MmwUzYR6Nj2AJnfGFuXQnY1wlIhprXyQ4SBWm6sQ7IeaWTpdviR6LzIFFVwUc+PyqaeU/5BF9UObmyewTzuxZ9OdY/wsLJ1vvDD2fHQ3LEbbhZSHy9d1IyTwW4nRKBbs0098cwVtr6ln7v1t7LIPiSzGGvOFauL1aDN7FUCkfF4NBds2HQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by SA1PR11MB5825.namprd11.prod.outlook.com (2603:10b6:806:234::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6477.29; Mon, 19 Jun
 2023 07:41:22 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::b504:c7a0:9ce8:6f17]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::b504:c7a0:9ce8:6f17%3]) with mapi id 15.20.6500.036; Mon, 19 Jun 2023
 07:41:22 +0000
From: Qi.Chen@windriver.com
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH 3/3] rpm: write macros under libdir
Date: Mon, 19 Jun 2023 00:41:10 -0700
Message-Id: <20230619074110.2831977-3-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230619074110.2831977-1-Qi.Chen@windriver.com>
References: <20230619074110.2831977-1-Qi.Chen@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ2PR07CA0022.namprd07.prod.outlook.com
 (2603:10b6:a03:505::24) To CO6PR11MB5602.namprd11.prod.outlook.com
 (2603:10b6:303:13a::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR11MB5602:EE_|SA1PR11MB5825:EE_
X-MS-Office365-Filtering-Correlation-Id: 5670a9e0-7734-41ba-b0b3-08db70989355
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	Y0JTQ8B/t3dY7NOl1nwQkaTOoceXmb9eBwZYxW483ALHg+sMlsfm0MxaD4FJ0TQW9XbdCu+RquuzrgmD9oix0EyLsv/rIVDqWOjte7UdwL/qiGreg4XfOKcGodlWzNTq6djGpTnFI4kIVSCgLdS3v70+r+VFRMK5T1GcpMXmp8NKy2H07sClEgi2J/vYZRQjvwUGXQ5JdRtcdv8xXsvOd9Ok0fESOJGrv70r4sEhGpdtVV6RM1eGQzaUcEqvH4SFg2JUth5HmKdJKMJNII1dWGlCGroLBvjbMn/LUTp/x69bZLRGjpnb90kzzQVmqTkBiAcGkR7xA9PtXkmqNORdirOWINzJsyd75gFIZLzAp0JF4UYSSn97IRQrG+aaTOak9qEcT9Kp+crZ5i6ogdfNBI3NBYqOrH0hc7hCvmqLNCIA8J343fRfNgi/s54BaYO5dciu9m/dMhfo+bEOrLcmlLNwBo12xfx4bEsr9coLT24Vinn2o1VwUvHtlnXrTq07qnUxUKqpuXGz+ozxskM2o/MY6vxilfjZHtRawsIttbQ83yKnWM5IhRqCGsXIzV9aVinaCzTBcKwiyKD0uavF5D/Whe4S11kvxnLVjzYO6W0i4BNOhZxvulUGqGzamCZx
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(39840400004)(366004)(376002)(346002)(136003)(451199021)(6916009)(66946007)(66556008)(36756003)(186003)(478600001)(2616005)(2906002)(66476007)(316002)(8676002)(41300700001)(6666004)(86362001)(6486002)(6506007)(9686003)(1076003)(8936002)(83380400001)(26005)(38350700002)(38100700002)(52116002)(5660300002)(6512007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?BQDYBeLm4TuJhevHJdjfCrVPFZENT32XJURQxKaX2WMekTYx1M5YWqkIh7lw?=
 =?us-ascii?Q?ZJvOYDccdPggHXEYq/JPTnRGjnadPkBVMtR6EMnUAxbi4WkdPS+JArHATYFT?=
 =?us-ascii?Q?hHveOx97d038opUCYYnq34LJvqoIdgpD+sCC8JRjz5t0E+7wWDGw+FhllVfz?=
 =?us-ascii?Q?cryOZDDGk/Fp2OQLCqYg02TpYfJroUcXm0IrbkhGi0G+oG1spru12lJL8c0c?=
 =?us-ascii?Q?i6fgOn59ZqA5wsao64owZIg5SAumMvXvhkbU8xFewt51lTSD+t7gECMwK8aL?=
 =?us-ascii?Q?j0OyQsVd68V/WXUb1GTP4G7Xrd3VDgRRDUBUyWvZxpPobYBacuR/+EFEbJJD?=
 =?us-ascii?Q?bgR/2rirMCwuDpJ/mwzsDd8AdDYmDbBkkM0RQCFFsSULSFxhIKmea/ocSYTK?=
 =?us-ascii?Q?mMl1TkfVEJt1aYaARgK9uPbdP/rixUTvPdZv5gtQxFr6ZrW8ARZRqi0YkF4q?=
 =?us-ascii?Q?2DOBcWdIkA5FJRT5NSjijNrmsuHsfAt3y0uTERkn9uLQUARNYHOBd52INtIG?=
 =?us-ascii?Q?/ZTr0K8C4lboPtAfhjdcAXraUrdcfPzUImfy1LwYRJoqUXpzHu1jbBFxWolP?=
 =?us-ascii?Q?LZDbaG7vNdLHmHziv4GZVsZLc+zjvkMyl62/5hhl6gog+oPTd26FIeEWzR4H?=
 =?us-ascii?Q?5jSW8waWRRFQF6jBLUwVuGRlaZDLu10niVBL6Ffu6p83NI4cuPiSmCP/cj/1?=
 =?us-ascii?Q?goUXp2MgULIhnxVwNlluyR41fP6pmbSPVW3uHgYbB5EUUZCedr7MvdCelDOp?=
 =?us-ascii?Q?f1S9SxYzkDy2JqprdFZtNqmS1AdK6xabNZXKFFxSfXcyOkyNSY4VkT+eQYAC?=
 =?us-ascii?Q?7eFP00mKZhPQRhZKZEja0s4w2L/MJHgNDbSOUIc2l8M2M60yaukksD2AwOPZ?=
 =?us-ascii?Q?aZ1KQB+McZo1OLEkz/3HUNkE2x3Rwe09VwNjs5VIESbfljI0MRJhRZjUWUIj?=
 =?us-ascii?Q?hR4nAjYS+BDQ0D+s9Wlmhvmb9qI2kBtqp78M1A8Ac9I9ykyd5ZVVlH31Z1P8?=
 =?us-ascii?Q?MTcDzSte8qPHNp5fWx5mmIPrf186KD3meYEeqNWkye9Yznz26d5R7F7Edgv2?=
 =?us-ascii?Q?hJ2HIoJsIkBljULXf1cYS7I4dJROTPMSKi/ZEcivWLG/ToSdoYYEs6zKq54b?=
 =?us-ascii?Q?Iv10L2pOdLkrqYU6gvZefCbxveWa2FN5HCqenTStn4nhfJYuW08b/BZ8ugdd?=
 =?us-ascii?Q?AUg+rXbW7BkoMbPkgZlSnWPhdRLThB/LZYbCOJcdTz9hhcU9zjJRYv3oDatQ?=
 =?us-ascii?Q?VWo9b97tpsKz/CeFf9Anm+5DSe/AhS8hgtoI/NeIHvhgzTEDjkbvoG6QaavV?=
 =?us-ascii?Q?+DdENIV0hwoemp8m928rDAHJegWM2iSugidFAw3eQr41DNuIUD+++gFnGoVd?=
 =?us-ascii?Q?aB2ib709IqdOK8PxJSu0SBaqIRNc3lKsYoV1cMIXyvMYLMxyFOx2zDKFH6Vg?=
 =?us-ascii?Q?Zwtzw/bIUG6V9N8dwJd9PHYITLf6eUHjmD9cwixDQwAgKcyn9MqX0y0HshOD?=
 =?us-ascii?Q?BRrQCFWy/I0qjgdY7UEKWWpfX+xO8MaSQW/LPgNlhZnKPx+k3XePJHcMpX+/?=
 =?us-ascii?Q?yh+mxBWimA5HGzIWdC7dnjAKVF1/6sUTCWc4m70OHVPim/aEEfxp1tPg+Nin?=
 =?us-ascii?Q?6w=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5670a9e0-7734-41ba-b0b3-08db70989355
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jun 2023 07:41:21.3356
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8YgPT2FZiDBDRxsYWLASZfrcFXMC78PYsS1MuWdAJDZ9cHi1vldw7Q/TdHYR79zR2P2nQbdqjEJd/Kaexgaujw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB5825
X-Proofpoint-GUID: h2vGK1ziS7mZxDdyEEMBMdDmXu2HQIhM
X-Proofpoint-ORIG-GUID: h2vGK1ziS7mZxDdyEEMBMdDmXu2HQIhM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-06-19_05,2023-06-16_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0
 lowpriorityscore=0 suspectscore=0 bulkscore=0 impostorscore=0 mlxscore=0
 mlxlogscore=828 clxscore=1015 spamscore=0 adultscore=0 malwarescore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2305260000 definitions=main-2306190069
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 19 Jun 2023 07:41:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183095

From: Chen Qi <Qi.Chen@windriver.com>

If we create a macros file under etc/, the populate_sdk task would
fail if 'package-management' is in SDKIMAGE_FEATURES and nativesdk-rpm-build
is installed.. The error message is like below:

  unable to place /.../sdk/image/etc/rpm in final SDK location

This is because it's trying to move the etc/rpm dictory into the
host sysroot but the <host_sysroot>/etc/rpm has already exists.

To solve this problem, avoid creating /etc/rpm/macros for nativesdk-rpm-build,
use ${libdir}/macros instead. In this way, the macros file is hold
in nativesdk-rpm. As nativesdk-rpm-build depends on nativesdk-rpm,
the 'rpmbuild' command inside SDK can still correctly find find-debuginfo
binary.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/recipes-devtools/rpm/rpm_4.18.1.bb | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-devtools/rpm/rpm_4.18.1.bb b/meta/recipes-devtools/rpm/rpm_4.18.1.bb
index 6da2edddf3..83537d4761 100644
--- a/meta/recipes-devtools/rpm/rpm_4.18.1.bb
+++ b/meta/recipes-devtools/rpm/rpm_4.18.1.bb
@@ -134,8 +134,8 @@ do_install:append:class-target() {
 do_install:append:class-nativesdk() {
     rm -rf ${D}${SDKPATHNATIVE}/var
     # Ensure find-debuginfo is located correctly inside SDK
-    mkdir -p ${D}${SDKPATHNATIVE}/etc/rpm
-    echo "%__find_debuginfo   ${SDKPATHNATIVE}/usr/bin/find-debuginfo" >> ${D}${SDKPATHNATIVE}/etc/rpm/macros
+    mkdir -p ${D}${libdir}/rpm
+    echo "%__find_debuginfo   ${SDKPATHNATIVE}/usr/bin/find-debuginfo" >> ${D}${libdir}/rpm/macros
 }
 
 do_install:append () {
@@ -173,7 +173,6 @@ FILES:${PN}-build = "\
     ${libdir}/rpm/macros.p* \
     ${libdir}/rpm/fileattrs/* \
 "
-FILES:${PN}-build:append:class-nativesdk = " ${SDKPATHNATIVE}/etc/rpm/macros"
 
 FILES:${PN}-sign = "\
     ${bindir}/rpmsign \
-- 
2.40.0


