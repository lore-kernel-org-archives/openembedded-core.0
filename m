Return-Path: <Saul.Wold@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CABE2C43217
	for <webhook@archiver.kernel.org>; Tue, 11 Jan 2022 23:59:05 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com
 [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web08.16301.1641945545220746733
 for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Jan 2022 15:59:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=sksYAk6i;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.166.238,
 mailfrom: prvs=8010f76d9b=saul.wold@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id
 20BNvHWd021464
	for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Jan 2022 15:59:04 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version; s=PPS06212021;
 bh=s7SP3oKq6DSGwlqKS2vFvS6w+grurkB2q6KX8k4lPtw=;
 b=sksYAk6iN20XPSY5qLKCkUKFkMjOasMLGqdJLPBMVPJlZOAiQlJLuAEIIT0Nv0hEyXSC
 IFObsV/aSh15ZxPDpT+lKdBI0Q1a423Se0VDaOs2oScHvEkiWIevbWV42ocij6lRrTvT
 J08RcVHXDpimKUJB5fBqYYKT/pLlLB5FWblSfH4ORbD+7EqrZI6lWHq9nrlnyERPzohP
 en4PaYxOPuS+y2ZFhcFmgKpFCtPg/B90iWXlj5pefwzc2KWhkAN3nFyaB/sCRT9kawEl
 OdnwmX79OgFQ4yzbd35FYbi1XnC3Q8BNSi97NfU8sP5lsGrJTthKTbsKGir7joUrnVNE ww==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3dggv39dbm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Jan 2022 15:59:04 -0800
Received: from m0250810.ppops.net (m0250810.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 20BNx4Hg024136
	for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Jan 2022 15:59:04 -0800
Received: from nam12-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam12lp2169.outbound.protection.outlook.com [104.47.59.169])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3dggv39dbj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 11 Jan 2022 15:59:04 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BDuQ93SEamcrKttBR61bXWMKJgAgjZdjAXZLhhkGbtFrvas1Kc+zw0d+8sArZeGk6AudHHeuBEs3yclRKVLm20ZlmOCzmr3Pl2KDnAOIapaKQkeAEO87YVv7AU8+7f1w8zz9rIYTdVp0zSF5DzHTeZo+WxfeIH/GZEUz7A12CEHNzfHcbUaxh4hIjqFBs4N4x2h9993PO28xxXpXYpXWLEA0eXcRAG4PhsIwaUkHuX/lauD2r836aPhpYVLoBdVX7vF3JWAGxgxfh3ECtixAARfUZdjQemkGCron0QG+BdNZDxJNMVtVAsHfuydNqiAhGZIDUWMs2GwYKjJn8ul1UQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=s7SP3oKq6DSGwlqKS2vFvS6w+grurkB2q6KX8k4lPtw=;
 b=hXLZSYQ32B3VP2shd8YsGZmxEc/gpZkCdHClH15qTiEIzMPAHtqcsvm+cUDrm5ZOh7cjru/qWgbHT/q83OfvA+yIM89tXY3XfXNZZduG+LS6etqqBRYWhQd+jLAio5pYY1a00D4DtvjSFMzuf0SRL1z/KOg1PfUgdoO4XB6epcWHbp4YA3Rx6cEeMLp9M9mppA2ptFd9dRl8GwBCNK+XBdjpu97mnFDfwdYfart8V6CHAvQ2LahkStfsGoZhzIng8eM1PkpdcntGrKkoN87QT85qOkzMIu7uT+VulY1gV98XxUdAUmMbmlQdCxQXFyy1nwCnWDpt+rC+e974Yl1bMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO1PR11MB5076.namprd11.prod.outlook.com (2603:10b6:303:90::7)
 by CO1PR11MB4995.namprd11.prod.outlook.com (2603:10b6:303:9f::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4888.9; Tue, 11 Jan
 2022 23:59:01 +0000
Received: from CO1PR11MB5076.namprd11.prod.outlook.com
 ([fe80::2027:9b43:472b:13ac]) by CO1PR11MB5076.namprd11.prod.outlook.com
 ([fe80::2027:9b43:472b:13ac%4]) with mapi id 15.20.4888.009; Tue, 11 Jan 2022
 23:59:01 +0000
From: Saul Wold <saul.wold@windriver.com>
To: openembedded-core@lists.openembedded.org, bruce.ashfield@gmail.com,
        JPEWhacker@gmail.com
Cc: Saul Wold <saul.wold@windriver.com>
Subject: [RFC PATCH v2 3/3] kernel.bbclass: use common strip()
Date: Tue, 11 Jan 2022 15:58:40 -0800
Message-Id: <20220111235840.81471-4-saul.wold@windriver.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220111235840.81471-1-saul.wold@windriver.com>
References: <20220111235840.81471-1-saul.wold@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: DM6PR11CA0018.namprd11.prod.outlook.com
 (2603:10b6:5:190::31) To CO1PR11MB5076.namprd11.prod.outlook.com
 (2603:10b6:303:90::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a62836bf-38dd-4c07-d904-08d9d55e5700
X-MS-TrafficTypeDiagnostic: CO1PR11MB4995:EE_
X-Microsoft-Antispam-PRVS: 
	<CO1PR11MB49958058E5956CBD40024974EE519@CO1PR11MB4995.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1443;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	hOS9DYHhQIqKVBS095/QKOuNKo2XwvF7DKRsYVPg5YffMP5IHrdLryCEdvV0+1h/V3oJSg8visPJQpwtv1+72/lgF4PQYHZwQ3PmTouNuQknvUuWseMn8hIgMS7U8oqiwoLlMVgFOarCCK5Cuy/56XvHCknMqQ2/ARnxSHuAf2ZWVklYhDzo9Gec+bEC/8n0vaH+YKm8YGyr0E6RW69j+cpf9inFIdLwqMA3YMfXpk8RWD/qFLJsRxkQiLUL4YrUfqRBDHLQbXM79nqkVAtSmn04PFruNAupg5uqdivqBFtqcwcLdo8UZ3o0jBv4nKwxxR3gdVe8qp/PLUKmgSlYrr7hD9VnNQq8pWVgb5X22uj39PSG2zDEqnTq/kFAXPSNEJjrKc8IB9NSvynk/Oql1e0zVSSuheIfTQh8EcIUBiTxQsOhQuEyV4busWsjWboguHv+vb8zMnvwvjW/mshS4TU4d6S7+4VgMscBwTol5pWLdt4v+zIlf1jnNL56P77OahzTrmmI277ZtpH6X6qoBI/nD+asEaG6bzh11I714ICK5Bi0CRPbA0G0MyQtgknuy/sMSOf0FjXfIFoB2mOhVJBwh3UKdANuRySttAXq2XpFc0VL8GQIxbpSc2/o2NRz6wHutDxUqIAJAtvVrOOTX2Rj4RC32WhoeYSV/OrsZDr8dokx4oKDK95o1Y6yviWQ4NficKTTGMeXSvrTwooRvQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5076.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(186003)(5660300002)(26005)(52116002)(6486002)(66556008)(8936002)(508600001)(66946007)(66476007)(8676002)(4326008)(6506007)(316002)(83380400001)(2906002)(44832011)(107886003)(2616005)(6666004)(86362001)(36756003)(38350700002)(38100700002)(1076003)(6512007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?pxbsoT/9+v+k8a7QI0tiA+aySYItiP1IXUAf8XjYaVK9ccAnqehxxjStWBVt?=
 =?us-ascii?Q?7O5xv+GdKza6h49KJP2JbVpqdd70RlspJF8zuFScqWdzcavmhybfG7/dPquJ?=
 =?us-ascii?Q?MbVsSOGujtGuKOWz5sbIRpSzr51OTw0tK9ew8n7ykdtiKay2LIDb8hhoU2az?=
 =?us-ascii?Q?z+6XX8tSbTeOk+0QgUx7bZLFcSaqWiETjKcLJjf/MD7b+icgUNM4jq/2lIsv?=
 =?us-ascii?Q?w+NSoM4NzSOs7Qd2LbjKFAnCSIg3A4AjzpZzpjLxWRMhP28i3k8XU60cib8x?=
 =?us-ascii?Q?icgc8PxcMNFRx9INhakMBmu9wQSwSk+FVuvrFoVKOtx5nXyP3gVbWpa5FzYX?=
 =?us-ascii?Q?xaRjQcDfUS7hFDLjL16/XUGapEC3xTzweLNBVFwPa0wvOkVxW3GG4FsOmrAQ?=
 =?us-ascii?Q?nk8L1S+1y2bF/paA0qM6RlVVsuSlG2THfUL2xlAJt7IEB7ewdR4kZ8MOhhOC?=
 =?us-ascii?Q?WtHdIC9/pJKFg6WnhGeCxFl3l/iDKjakeNu5+dqEUjs+qRkvyRB7pz9WS+hF?=
 =?us-ascii?Q?LAr8aL/8oEsS6CkHHmI5cagVoy48Gev2z26kXmFLDIxpNNPktp8kyn/qbHcO?=
 =?us-ascii?Q?dQuu5fk6LoLpGabLIwTj25eUz80glI1Vx4wi6Dr1ik3GPGyc6EIpa0isHEvr?=
 =?us-ascii?Q?3pk7Wv8uUBsK1E/S7L/IgYKKOpazrssdl8nuwqClGw1OiISJ8bGn+9iIhmPU?=
 =?us-ascii?Q?8OPSs2VE+2PMLSEE3UKWDcNjAHlUadhDqeferS5SgbKEMv4IFGLfDTw6zCUB?=
 =?us-ascii?Q?tVXgMG3aP4SkmOCUk74WgL0zQ+Ffc9W4nColbA0hJN1n3l5okcnmChQG2qed?=
 =?us-ascii?Q?ULBVDSWJeQmXux+zYinzR/WVq3mG78UPRW3SGQOs/FSLvbsY0MSAuwnvIOOW?=
 =?us-ascii?Q?OVEfAzVpa0jmoeGy/6wjHsfrGaVgxA9I1z4RPFvudKWqNp0gAbuEZSgt5/hO?=
 =?us-ascii?Q?wNXTixTZqzg0vIcFx/LEX6x8iswf1x6HJUvMF577nBQc0EFS4roQRglW7tC7?=
 =?us-ascii?Q?rI3GV3tAf15DMvUQuCJqBUhghn/6+2DJqJSg5kJMAC4Ahqx0rLvuEM7X9VcU?=
 =?us-ascii?Q?pfbxUN8Y7pnjaqKWwJROK+qAtIuwyxSwNLlo/xyLrnlcbT7dGEa9xkStbf8K?=
 =?us-ascii?Q?01xIqItcSisOKZhx3SIETUSfV6cSVLipUQdDdavh6oelff2S3jTrLg0tRfNF?=
 =?us-ascii?Q?EJ3Jorp5RNUOtY2Q+5l0qw89KhU5ijm618pftrD3DuWahoqPr7dS7QmvNVNI?=
 =?us-ascii?Q?TTgtJuV5CGR7AkSRldVhj/xLiPOpiOx0ApOZQeM2MXgv0SEwics/PTO+rd2C?=
 =?us-ascii?Q?BOyRg7WjIonuiYTyDY4XnIVgx8Kd9WPxRA/dHJAN8uSDxu7SBTm3VzrwPvik?=
 =?us-ascii?Q?Orx6gpWXjaVsKjO5NctRoOjBEgwZ3NuFiAlYsmHigFDCe004R/J/C+aYfXdI?=
 =?us-ascii?Q?STDoIF1OkoFfOtyXMgUzOkE2S2+uXQZyIT2SHKYjv1j0NMjHbZIqmI3KXFzy?=
 =?us-ascii?Q?lSwZjkF4EOkxm9kUdKF3rIQb7jiVqB3fp+otpH6f5ki6p57v2x58VOGmPY1F?=
 =?us-ascii?Q?zfPlXGbPKm/XXM1pCrvYD+lcOW7yLO51ClnU+DM18FnhcgwI9qdAiWgIExUD?=
 =?us-ascii?Q?bPMbsg4vIPEd2MlSme7AKec=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 a62836bf-38dd-4c07-d904-08d9d55e5700
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5076.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jan 2022 23:59:01.4995
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 uOVUokoRd+JzpZSWp6rlau3Yhm8pn9473t/qIkrL642SACixLrw5ZdU2JkWA5ozggGDN3t1ntLFzxhGRhJ5BbQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4995
X-Proofpoint-ORIG-GUID: AdM7OTPENhg1lF0RPGo5AMxlTq60CbKq
X-Proofpoint-GUID: b4oixX0UQNX4O__vqKyVjxmTvXk8Z8Tb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-11_04,2022-01-11_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 bulkscore=0 suspectscore=0 phishscore=0 mlxlogscore=999 priorityscore=1501
 spamscore=0 clxscore=1015 mlxscore=0 malwarescore=0 impostorscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2201110124
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 11 Jan 2022 23:59:05 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160475

Re-use the runstrip() code from oe.packaging, for the kernel
stripping process. Since runstrip() is python the kernel do_strip()
need to be converted to Python also. The stripped kernel image
will be used for deployment in do_deploy(). This will allow the
package.bbclass to split an unstripped kernel binary for the debug
information and extended packagedata. The extended package data is
used by create-spdx.

Signed-off-by: Saul Wold <saul.wold@windriver.com>
---
 meta/classes/kernel.bbclass | 44 ++++++++++++++++---------------------
 1 file changed, 19 insertions(+), 25 deletions(-)

diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
index 7685c6921fa..b2f9e3c8071 100644
--- a/meta/classes/kernel.bbclass
+++ b/meta/classes/kernel.bbclass
@@ -700,30 +700,19 @@ do_kernel_link_images() {
 }
 addtask kernel_link_images after do_compile before do_strip
 
-do_strip() {
-	if [ -n "${KERNEL_IMAGE_STRIP_EXTRA_SECTIONS}" ]; then
-		if ! (echo "${KERNEL_IMAGETYPES}" | grep -wq "vmlinux"); then
-			bbwarn "image type(s) will not be stripped (not supported): ${KERNEL_IMAGETYPES}"
-			return
-		fi
-
-		cd ${B}
-		headers=`"$CROSS_COMPILE"readelf -S ${KERNEL_OUTPUT_DIR}/vmlinux | \
-			  grep "^ \{1,\}\[[0-9 ]\{1,\}\] [^ ]" | \
-			  sed "s/^ \{1,\}\[[0-9 ]\{1,\}\] //" | \
-			  gawk '{print $1}'`
-
-		for str in ${KERNEL_IMAGE_STRIP_EXTRA_SECTIONS}; do {
-			if ! (echo "$headers" | grep -q "^$str$"); then
-				bbwarn "Section not found: $str";
-			fi
-
-			"$CROSS_COMPILE"strip -s -R $str ${KERNEL_OUTPUT_DIR}/vmlinux
-		}; done
-
-		bbnote "KERNEL_IMAGE_STRIP_EXTRA_SECTIONS is set, stripping sections:" \
-			"${KERNEL_IMAGE_STRIP_EXTRA_SECTIONS}"
-	fi;
+python do_strip() {
+    import shutil
+
+    strip = d.getVar('STRIP')
+    extra_sections = d.getVar('KERNEL_IMAGE_STRIP_EXTRA_SECTIONS')
+    kernel_image = d.getVar('B') + "/" + d.getVar('KERNEL_OUTPUT_DIR') + "/vmlinux"
+
+    if (extra_sections is not None and kernel_image.find('boot/vmlinux') != -1):
+        kernel_image_stripped = kernel_image + ".stripped"
+        shutil.copy2(kernel_image, kernel_image_stripped)
+        oe.package.runstrip((kernel_image_stripped, 8, strip, extra_sections))
+        bb.note ("KERNEL_IMAGE_STRIP_EXTRA_SECTIONS is set, stripping sections: " + \
+            extra_sections)
 }
 do_strip[dirs] = "${B}"
 
@@ -768,7 +757,12 @@ kernel_do_deploy() {
 
 	for imageType in ${KERNEL_IMAGETYPES} ; do
 		baseName=$imageType-${KERNEL_IMAGE_NAME}
-		install -m 0644 ${KERNEL_OUTPUT_DIR}/$imageType $deployDir/$baseName${KERNEL_IMAGE_BIN_EXT}
+
+		if [ -s ${KERNEL_OUTPUT_DIR}/$imageType.stripped ] ; then
+			install -m 0644 ${KERNEL_OUTPUT_DIR}/$imageType.stripped $deployDir/$baseName${KERNEL_IMAGE_BIN_EXT}
+		else
+			install -m 0644 ${KERNEL_OUTPUT_DIR}/$imageType $deployDir/$baseName${KERNEL_IMAGE_BIN_EXT}
+		fi
 		if [ -n "${KERNEL_IMAGE_LINK_NAME}" ] ; then
 			ln -sf $baseName${KERNEL_IMAGE_BIN_EXT} $deployDir/$imageType-${KERNEL_IMAGE_LINK_NAME}${KERNEL_IMAGE_BIN_EXT}
 		fi
-- 
2.31.1


