Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EACDBC433EF
	for <webhook@archiver.kernel.org>; Fri,  7 Jan 2022 02:16:37 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com
 [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web08.1516.1641521797291617132
 for <openembedded-core@lists.openembedded.org>;
 Thu, 06 Jan 2022 18:16:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=hiVEV82p;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.166.238,
 mailfrom: prvs=80064149fc=qi.chen@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id
 2072EuxE030408
	for <openembedded-core@lists.openembedded.org>;
 Thu, 6 Jan 2022 18:16:37 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to :
 subject : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=PPS06212021;
 bh=6WpnCF6FrPi50sxXltwskokWVIYdF0hX9SXRr6lImWk=;
 b=hiVEV82pXYhSKPmqe1VNXLDYuyarDTWlSCSiIP774JvquoA8NhLgoQ15aNsqunguRLlk
 zXolhZl04tKdKZnmXBfa8nkoO4RogLELFhjyjMut3CuwaRg/aHjZRQlatDLI2GAxYZ7b
 Rvx8pRM7VTxU36uQqtraqM5g4CA5FdbvTeXrGnfSfoh8vb/iKrloHQoZR2wLC9YL5uKG
 JDtATEEsweafajVJHfTP++lzcfkSLC7gfFHOrKOI965uhw7t33jv73ZEEk1YE5pDiZwk
 qNq0jaL6yBUfPOQi0lU5HhuPJtezfZ2QMubaH489UScJvG/8QL88I6aDkRmr3msK0y2h Rw==
Received: from nam12-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam12lp2168.outbound.protection.outlook.com [104.47.55.168])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3de4wbg9f7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
 Thu, 06 Jan 2022 18:16:36 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=W+JBf19yLG+KxRxempjBP+gQaMIjmc6o0BwHCzHRasOUSRZo1xtzycKIZnkEISY5d80RZzszWSeOA3JU6vemzMBWQKTGhYKHJx6rKDCB3843vt6BP45xx+8HOgkukpZSSnz1JhVyOJwoodBabFJEAVNMfugr0HaPd5Kx2ThkbSoIVOW80zrDVs76ZKXcysE6ejmaI8ObVvz3IvhLIbaula3Be4s1WHECsyBJSOAgGbMfjjsYrQTKOufXKEmLCMRPVLA1ikMeswicOCJRZ0R69inFqwx/4FIMEcrVHFpL4b0gU4qKB0exR5uZQ3VdXLSbEL/45By+6mWfI8sYBgIq0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6WpnCF6FrPi50sxXltwskokWVIYdF0hX9SXRr6lImWk=;
 b=kqFRtNnt/859L5Erc3IpIRvAEkTt94fOwkolYGldZlkBFWtSKjzDSGHdOC5eMQm+Nm9QUTkg4w6ocPpWx783HsW/TA72rbZAyRN2i8med6ACCkZLgcMyNda6chj4H6kgTz4gdOdLkMuZwbS+9jaYL7HjdszuobSSJoB1AqPBRxhb8tgfwk4y/4hxnt5dJtjlGR42y9WRBaPM35JRzlNQi8lnCSd+Wyk7q7oJS9//BhGv+S6YSfk9UhCwQi623yAKpBva6UHR9IMnJBiR/4y8ytW6GatkKUB5S+yDtnshz5MVZuYXSsviAoWT51G8GVCvMnKLBZocpwBRM7xWaorf+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by CO6PR11MB5651.namprd11.prod.outlook.com (2603:10b6:5:356::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4867.7; Fri, 7 Jan
 2022 02:16:35 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::f1ef:f6f5:d3e4:27cc]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::f1ef:f6f5:d3e4:27cc%5]) with mapi id 15.20.4867.011; Fri, 7 Jan 2022
 02:16:35 +0000
From: Chen Qi <Qi.Chen@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH V2] populate_sdk_base: remove unneeded dirs such as
 /dev
Date: Thu,  6 Jan 2022 18:16:24 -0800
Message-Id: <20220107021624.77495-1-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.33.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR11CA0072.namprd11.prod.outlook.com
 (2603:10b6:a03:80::49) To CO6PR11MB5602.namprd11.prod.outlook.com
 (2603:10b6:303:13a::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8c1ae886-1072-488d-91bf-08d9d183ba74
X-MS-TrafficTypeDiagnostic: CO6PR11MB5651:EE_
X-Microsoft-Antispam-PRVS: 
	<CO6PR11MB56512CF098CB3B74CB201C13ED4D9@CO6PR11MB5651.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:862;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	VaBc/FZUIPBtYNEoH5KY7/7cUxiABgbKw0lgGHNAqVUFVxAPipGpopmdpfWvKKEIDe1GcJPVwRW/WrqyH8osn/ogRVT9/wdxLN65/C639BZODb4nyCFVleVMb7eazsX3qGW3DcP03vR+WqLYDkp+Aqk/edtiy+jwvxJW05/CFqpMBhr8o3r6d9jYHUgQ68xOpFGPC/b8LGmQlIy5vU3TPW8rxDCTluKeCDCRb6cW6ZB6zP4YBfJN2Raa7j0FpJPtsxCY60UBfhMGQY4PcWNgHxn8QYdbGDb3ewmCEfk4/wk+gy6ZJz1bfD7eOxqTe1OVpHj9MfXWxBB2htIGljMeO4dHF7lh+2n3hP/PVuxccKd9HCJhIBrJrchwsUUPOWmEtxKqa7n6/xFfy+WjWdT023p44pAmeWl30PJ7nc+0Re64hNhzgQtHqc71pd4muwKA13u/xc94rTHeneAs8CfapE9J4FeiwSZwlgRvr0q2VFPzGxQtV9s6pHHNJzxR3jobohgRJkHaQz065pSXyNVq1DPGseICO3nyi5VP8l8l1XQzypYacMeuyZEMx08k/7v0u0wfSbd/l29oGzuOM9oycQWt0whWMI2WnVTvaxhk5xh4N0ZWrspwZsHJWufvtoOr6MQOz/bGA8RKz5YVanMkqk9rq5MX5iMw/mbEMc6azf2P+LxtuuHs4ggvhGWQrorIGhhBlz3En38iCnNy/mTKEQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(6916009)(6666004)(38350700002)(6486002)(2906002)(26005)(6512007)(316002)(38100700002)(8936002)(8676002)(1076003)(5660300002)(186003)(6506007)(508600001)(52116002)(86362001)(36756003)(83380400001)(66946007)(2616005)(66476007)(66556008);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?Q3/enIRTwCB5UqoWQCOGpognPPaQng2AFvRMPkHN/RlnAnl/y6wF8UTM1JQG?=
 =?us-ascii?Q?/6QHlybjDtZRFnLUPkhKnFhO9BwY0P5o6QtvGqCLalL6whWyOn7mmkb4/hNB?=
 =?us-ascii?Q?QpEBxFofUUMar3jbkgX8HQce6mqjeLvu0QaGGZ0G4q5iULzD1dc7n7ena6KL?=
 =?us-ascii?Q?rzoYH1C3q8zy42H9c6K8ADW/SbACkztL/5fpLUTMdpNcV33mJeAZpf8PxVHo?=
 =?us-ascii?Q?vV/lviTF3RDFaRgSG6FCdGBKtjnikPukH8ZryQn2giFqb1dVFDaEXY8xfhCQ?=
 =?us-ascii?Q?ou8iG1pdqrm9fOSIQ8CRsin3pKKYMi7lbhZUDqsg0d3ojsY4nJki9v2ioy37?=
 =?us-ascii?Q?qmnax9zcTHRMhRo5jGzU23nJxZ7Px4ELZBaf4x908weqvLLCcFeLj2SQ+SkR?=
 =?us-ascii?Q?eqQo4ISKrq1wauFcsDX0UsEDJLqjcAKRzQcheIimeasDiWT0STqc46IrG1Ev?=
 =?us-ascii?Q?LG4/kUEJOeTAk+o+rd7LLGnk7BswuYL7hDo0JMN6qcQE5C1DNetMzz5VzlQ5?=
 =?us-ascii?Q?HX+BajCUeeNtoQQZ/tWT6U+FELAHIWAJNaJ0O7QA5ljSgiZNcM3ijjmR0yw2?=
 =?us-ascii?Q?qMSYPoGodH3KciC+FZtduunVKGpA2DuKTRVHx68mch4faIjFiRCZ4dmHfzgr?=
 =?us-ascii?Q?oWZKVounlpndpuu3S62tmABFUN01rloK87f1ZH4aV5Gl/+1QeEGTRhaTgnvD?=
 =?us-ascii?Q?JtsZ6eXaFhwPhMimyLIoyeHIrGHe6W1zqqcGM9aYgcxX2kfgqctcnq/FHL6B?=
 =?us-ascii?Q?yxeMo9IS7jWL5uvMzhvJ+ljRSmQ6+/Y+pxUW4o/C+SMHOTXqZAM4GVFI5jZ6?=
 =?us-ascii?Q?WMRycHxx231KxqtB+jDQXquc+FNr8yvNxyM2Yl32ZEUcX4j3zAwXdgNBoEL+?=
 =?us-ascii?Q?V9goTt3SeWcDlEX/SXkzzltAs3YgtZDpzXRC1GVi1+ZQ4c0tJ7ve3QaEq1g5?=
 =?us-ascii?Q?n6FbJ08y0FdoJe6BNUS9jHoFwqvXGWqHpLkIT3AQaM2Ux6FfiD9cJFfWBMr6?=
 =?us-ascii?Q?XEpRJl2JGm3Yp9ZptkGaoXPa4w0TSwzspdZ4C+HiyE6073BfXtlgSj4yyqUb?=
 =?us-ascii?Q?/CvuTR7INlbC7IPQhVgVAt8lGetralSw9XxDUPLNnkwaN/+RlOuF7EiFL5Rr?=
 =?us-ascii?Q?ZKrMiNeqMHRVmhO4koCKsjdg1eU/eCxaQhfJEnMHTPLxe/hYvk2lVLsbyeKu?=
 =?us-ascii?Q?OMZZ68uc7D77/jQ2n67SFl13SXitE8WVdfghu1QQs8GITOKwKhBrceUfGzV4?=
 =?us-ascii?Q?7GEnti3yDJYPKMtoNXx3iAyLr2TVmfSuUy/H6J4wWlywEej3UlhqEgGoZfG4?=
 =?us-ascii?Q?CsNnLhSGNKQjwMYCZ60NwVyBeBaEe2B4PqhENaWg4ZVTFdR6UB0SLHcRWnNv?=
 =?us-ascii?Q?f4DBnTD47sXXx9AJjwaKEAWDws+C3ZafJY0lR1AVLpUjqYD/+sDFEKAS9Mok?=
 =?us-ascii?Q?xf/99ogJnqIR6LKyGnBW6cmurfph+FAjw+JBfJ/hNtbLhahgYrQWUPV+7/bK?=
 =?us-ascii?Q?9m7oGrgbDYVMvGPOA8gwvCemuA2a75XYG54H1oknnn6O8LAzQWypqV8SGZCQ?=
 =?us-ascii?Q?bQs5qNPljuUz7KTENtGH5HPku1HHomamwGk82KRIDVemRNiaqXSAaceRr4wi?=
 =?us-ascii?Q?vOihyKGuFfAi2cFIokBQak8=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 8c1ae886-1072-488d-91bf-08d9d183ba74
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jan 2022 02:16:35.0164
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 tcddhNHs5qJrnCtP3kmW0en+xILDCRrewBlk2l1rPe/B0DshzSbELNUzf2rTjKp1kG3rj+TDYQkHp+BVUViUUQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR11MB5651
X-Proofpoint-ORIG-GUID: 8GBWlLhc9o8Y-ejfxBWhwzPDLvwrQsX8
X-Proofpoint-GUID: 8GBWlLhc9o8Y-ejfxBWhwzPDLvwrQsX8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-06_10,2022-01-06_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0
 lowpriorityscore=0 spamscore=0 malwarescore=0 adultscore=0
 priorityscore=1501 bulkscore=0 mlxlogscore=800 clxscore=1011 mlxscore=0
 suspectscore=0 impostorscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2110150000 definitions=main-2201070013
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 07 Jan 2022 02:16:37 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160246

We met a problem that core-image-tiny-initramfs's SDK cannot be
installed. The error message is like below.

  tar: ./sysroots/core2-64-poky-linux/dev/console: Cannot mknod: Operation not permitted

In fact, the '/dev' direcotry is not needed by SDK. So remove it.

This patches uses a variable, SDK_PRUNE_SYSROOT_DIRS, to hold useless dir entries
so that it could be extended. For example, '/usr/bin' could be added if wanted.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/classes/populate_sdk_base.bbclass | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/meta/classes/populate_sdk_base.bbclass b/meta/classes/populate_sdk_base.bbclass
index fafdd96749..16f929bf59 100644
--- a/meta/classes/populate_sdk_base.bbclass
+++ b/meta/classes/populate_sdk_base.bbclass
@@ -92,6 +92,8 @@ SDK_HOST_MANIFEST = "${SDKDEPLOYDIR}/${TOOLCHAIN_OUTPUTNAME}.host.manifest"
 SDK_EXT_TARGET_MANIFEST = "${SDK_DEPLOY}/${TOOLCHAINEXT_OUTPUTNAME}.target.manifest"
 SDK_EXT_HOST_MANIFEST = "${SDK_DEPLOY}/${TOOLCHAINEXT_OUTPUTNAME}.host.manifest"
 
+SDK_PRUNE_SYSROOT_DIRS ?= "/dev"
+
 python write_target_sdk_manifest () {
     from oe.sdk import sdk_list_installed_packages
     from oe.utils import format_pkg_list
@@ -103,6 +105,12 @@ python write_target_sdk_manifest () {
         output.write(format_pkg_list(pkgs, 'ver'))
 }
 
+sdk_prune_dirs () {
+    for d in ${SDK_PRUNE_SYSROOT_DIRS}; do
+        rm -rf ${SDK_OUTPUT}${SDKTARGETSYSROOT}$d
+    done
+}
+
 python write_sdk_test_data() {
     from oe.data import export2json
     testdata = "%s/%s.testdata.json" % (d.getVar('SDKDEPLOYDIR'), d.getVar('TOOLCHAIN_OUTPUTNAME'))
@@ -122,8 +130,9 @@ python write_host_sdk_manifest () {
 }
 
 POPULATE_SDK_POST_TARGET_COMMAND:append = " write_sdk_test_data ; "
-POPULATE_SDK_POST_TARGET_COMMAND:append:task-populate-sdk  = " write_target_sdk_manifest ; "
+POPULATE_SDK_POST_TARGET_COMMAND:append:task-populate-sdk  = " write_target_sdk_manifest; sdk_prune_dirs; "
 POPULATE_SDK_POST_HOST_COMMAND:append:task-populate-sdk = " write_host_sdk_manifest; "
+
 SDK_PACKAGING_COMMAND = "${@'${SDK_PACKAGING_FUNC};' if '${SDK_PACKAGING_FUNC}' else ''}"
 SDK_POSTPROCESS_COMMAND = " create_sdk_files; check_sdk_sysroots; archive_sdk; ${SDK_PACKAGING_COMMAND} "
 
-- 
2.33.0


