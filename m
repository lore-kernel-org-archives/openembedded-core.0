Return-Path: <Saul.Wold@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96C6FC433F5
	for <webhook@archiver.kernel.org>; Mon, 27 Sep 2021 17:22:35 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com
 [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.2290.1632763353945624429
 for <openembedded-core@lists.openembedded.org>;
 Mon, 27 Sep 2021 10:22:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=rIxVR8mY;
 spf=pass (domain: windriver.com, ip: 205.220.178.238,
 mailfrom: prvs=4904b47dfe=saul.wold@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 18RDx5gR020554
	for <openembedded-core@lists.openembedded.org>; Mon, 27 Sep 2021 17:22:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version; s=PPS06212021;
 bh=JeusoOXXc0kVJeFlRsZ+g9sfCRzXKtu/A06crqJjXSo=;
 b=rIxVR8mY2cy84Q/iCMdzTBWr7lzXn3JDk11a8Nw0HaZGz2z8j7mGaRI6cCKlsuWYdmEB
 th6Y1x0dIF54StD6PmY+84doyy7d8dotg25xVaULRYl7rkZukEW1WH/D5IomlZ2a7vgf
 5HujgBxKKeysJwGYiUyd01JsnzOJo7AUORfYOF98Q7WQtvrgUJyUCNBCWwiQroA5lhNe
 mEWZFEHVFhdhsqI4efoZm3Ebd6ExVU74jI+3tIMrheUxJJcgQywNhIQ7VARZsI3Nb17b
 2y4WiY4dMgs+vIiKtGFOFWvu/X/WVtuhEtdFwp5U5Xqj272L/qDVxz2hA+G05q05IAgc Tg==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com with ESMTP id 3bb8nhre0y-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
 Mon, 27 Sep 2021 17:22:32 +0000
Received: from m0250811.ppops.net (m0250811.ppops.net [127.0.0.1])
	by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 18RHHqKD009893
	for <openembedded-core@lists.openembedded.org>; Mon, 27 Sep 2021 17:22:32 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com
 (mail-co1nam11lp2177.outbound.protection.outlook.com [104.47.56.177])
	by mx0a-0064b401.pphosted.com with ESMTP id 3bb8nhre0v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 27 Sep 2021 17:22:32 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=d4Jjm8k6lVSkJVFEVBMxMSiEoxQtVsjRCW2roCfZhoC0fF3Ja2HDDK0HUhAv2+An4CSx5oT3mHVhYnh1SEG1fnLCDAZxmhhI9KduS6tIWqx+eNEqOuukl2qZAm0P3UmEPEqGkUvqK2eHyuwzF2FN2mBT4BcBr2cun+mQ0JKwDJuwCvTnUrrDQ9pqYKQMfR1tRbFaCZPi5TJubhGlhj7QEOAGQhAqtNpBi2sT4eTRWVhl81n20kwHEkP2alQcb0Nur9UqHvA+K6aFXFGCevYVvaGoonet2aqbiUoGEFeFADW2HCIxk5aA94N68Qox2rdFFv0T2Yl5MdAsIqDyzYPdOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=JeusoOXXc0kVJeFlRsZ+g9sfCRzXKtu/A06crqJjXSo=;
 b=d8orxVoEXvX10Ydwi30V/JIGb6PaGmac3yNsMW21HoLS9c5Xp1tt3O8fmfsGamaCcPVQgMstpKTfZJIXMDmtj0XRGn+b5efML2hVivMlQ+erZHg79MH7kR+KfXxL4kwpSl8iqe+uI2InXkYg3m72ejXk5VUUn9G9ru2sQpwdnZvEJD5Dc4FtgL8oCDidCPBMi0rS7P3gXjiHwwt7TYbhNqnbRJyWnfh1AN7zQy01HFb6UFS9J5ZdtTeZUOoQpapl24PRVxwFXa7QbBI/caaYuCRD/KEKA3RL4HdSulcoMlT9pDSBLy/xlnF/xjt0e3MJTtB16X4EFPdwGBrJeJdeDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from CO1PR11MB5076.namprd11.prod.outlook.com (2603:10b6:303:90::7)
 by MWHPR11MB1488.namprd11.prod.outlook.com (2603:10b6:301:c::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.18; Mon, 27 Sep
 2021 17:22:30 +0000
Received: from CO1PR11MB5076.namprd11.prod.outlook.com
 ([fe80::20bb:b9a1:85a1:44c7]) by CO1PR11MB5076.namprd11.prod.outlook.com
 ([fe80::20bb:b9a1:85a1:44c7%5]) with mapi id 15.20.4544.021; Mon, 27 Sep 2021
 17:22:30 +0000
From: Saul Wold <saul.wold@windriver.com>
To: openembedded-core@lists.openembedded.org, jpewhacker@gmail.com,
        ross@burtonini.com
Subject: [PATCH 2/2] create-spdx: Use SPDXAnnotation to track native recipes
Date: Mon, 27 Sep 2021 10:22:17 -0700
Message-Id: <20210927172217.3640059-2-saul.wold@windriver.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210927172217.3640059-1-saul.wold@windriver.com>
References: <20210927172217.3640059-1-saul.wold@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MWHPR1201CA0016.namprd12.prod.outlook.com
 (2603:10b6:301:4a::26) To CO1PR11MB5076.namprd11.prod.outlook.com
 (2603:10b6:303:90::7)
MIME-Version: 1.0
Received: from yocto-hs.bigsur.com.bigsur.com (71.238.119.71) by
 MWHPR1201CA0016.namprd12.prod.outlook.com (2603:10b6:301:4a::26) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.13 via Frontend
 Transport; Mon, 27 Sep 2021 17:22:30 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a5f71e45-355d-4a3d-b3ed-08d981db62b2
X-MS-TrafficTypeDiagnostic: MWHPR11MB1488:
X-Microsoft-Antispam-PRVS: 
	<MWHPR11MB14889C921D0672F996550C9FEEA79@MWHPR11MB1488.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1417;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	V7Qq/RJHrHMzm28s0JciQ1FcUUgy+DQvpuRpSZ7qJGoA8Xu3sS96GHxIqVPOZjCcslNwsdHgkCfKnVmFCc40OQ9uuHgtkj5D6aEATTSmu+wd88URAJaUyERhq73VH+mUp+87/HxX5/gjUPD9HzbsZFyzGyQSJgkilA0Ou6jDqx/JEl9LwyPpKyjAiXef97bLITHD9n1jRbvInQW52RzGQqTtSkmcTVryYxU1GkufEHBaa44/Kp0ZIISpyeINlN7Mi3rZOpyETYTh+X17xDXcosuUzA+GL8bYVHtoUYWgsAD4bTBbAJZsa3R6k+feMxgjvoX7tnZuLNo6XRlKF26gO2nA984+lRK+BD2n2opvAT1J9+QhsuZ0M2LVRiiECaX0gXtwXWr1aGPB4fTlINr4N0m/pk91pvif1ECXavaUG+hukD3lXBbiMRlVowPsebaIn3JqiyXkBj/UoawBpts5OfcA/SN5MLERuyNYoG3m/AWkiR1A/sHkucGU7XZezk1eMjlnMXn0wKzVTS6TBQsffomoIB+Jykhlqg2lNfoRjKsGCu3M4eXRSgCbRFajl43K0vwuiVeB/g60wMT7PJwYLLFudr/SUuFs1mlf7rPjSKAgYgO6T+/Q7zKcgjTiWTQhrZBghpRbxkWXYcy+mzXHhaxhEazXcVL3MEID3X/iv6aanYd6UUHWstr49490Kv/RqZI84/Xr6zCxUFwNaan0mw==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5076.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(52116002)(83380400001)(316002)(186003)(508600001)(5660300002)(6506007)(8936002)(6666004)(86362001)(6486002)(66476007)(66946007)(38100700002)(38350700002)(2616005)(44832011)(36756003)(1076003)(956004)(26005)(66556008)(2906002)(8676002)(6512007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?VLxtyjGqzd2fqKjZEbggfHytfzEAwdV4HHs4XbeHfbFmh8UErCx45Z2QZ70G?=
 =?us-ascii?Q?MDBJFBm30iqxFEhint3inZHALSxRjuGDGCba/uFvFsQRArmlqES7UclPJVPZ?=
 =?us-ascii?Q?09pB5WxnW+7hdy3XCQecCopv4s42Mn9NGqtmKcbvnhyoo+w4agvi9Xwv6OG2?=
 =?us-ascii?Q?euhaoAuT6NGKR0f1st0DX9ARbDbBHwsVgeRFupy0a7VnTffKRIxqpkbWRMTL?=
 =?us-ascii?Q?La/Xa1h9AdwmVH2VegEiac8nUCU6zveIZD1eoN3v99y09JmiXzum6fKsBMpc?=
 =?us-ascii?Q?xPw6eQFnCsmCPLGUZ+/stTWXU1TwRHAQy6lgsZBxeSm6V/8KVxg//GWCTfTk?=
 =?us-ascii?Q?mNvi1wlv6EDfKirD+gmGs2tLrH1nKG1oQgurKUFkSo99/hymMGy6wVsukt+l?=
 =?us-ascii?Q?guC46s3zxB9PVrfFA69AAl2V0U3XbzvDiOt1AoQngDqIW/SqJR3+827f1ich?=
 =?us-ascii?Q?WDdVsk/jRVld7ZFyjGYJ4ClNF5D2addBh20WG3eB8hPCMq8eQ9VbUBeFU7hA?=
 =?us-ascii?Q?8QjUhgW1ww4o+G28g6rEYNYiaYWTqBb0lOftVsCij6R8VjhGuktYZ6Ylhe+h?=
 =?us-ascii?Q?OjnJuIzMB/nkDXyx/MjilU74vMvbZVFb0VZwaHDqr4R08DJi5goevMyy+txg?=
 =?us-ascii?Q?H5Wevkvt5qIDj/lu3lagp8szrftmW1b85lT5sl46Lxn0JXy8Ah89T9xCGy7/?=
 =?us-ascii?Q?n4xmtEsXJlAgM6SqqiW0aC5xeJRfxCheTeHQ63Z46798tgdhFYzUOBRXIw2t?=
 =?us-ascii?Q?/kPMBO3z7LtIFuIgIY1DkPYG++tt/qt1f5X2vIuUjxBe5Muwe2DH5PCdWzXn?=
 =?us-ascii?Q?5PaVfHFgUkeXSwt/jJiVe7gBvc3PfqbyMU6pmFFwQHAcSy+JCO5XMOi+j3aB?=
 =?us-ascii?Q?VzHI4XCJns+vv/07QqQUBDVgX8jwVEbnNFukJveiTNlCpR+3iYodzQ+aQTVQ?=
 =?us-ascii?Q?zlySu3F7c9tu0HL7Wb8WTCwsmVlEGKWVecGWFTvW52O2PHIhVlnoV+vi5ynZ?=
 =?us-ascii?Q?jNwVvuS1rAtpLI/e5bOC3YCqKSc2cXSY9eZBabptD96FmYjaKWN6DIU6H+qz?=
 =?us-ascii?Q?ZMEqdVnPmewu0k6QJKeLNAp6jDOe3bFNEmDovcV0QcfmgfEwfn3Sm6Vt69Pq?=
 =?us-ascii?Q?Xo9tuJ/1nBiQ6hfwuHvoWyBhLZ+q/1Mc7QuQeILwt1gH05kFnh8NaiAR8IUV?=
 =?us-ascii?Q?cr7IO10YpsGI8sQ4oGvy85UOwy8tc1etAd0lQaPIqF0/zwei9htVLneAOUQS?=
 =?us-ascii?Q?oYwaWChE9/YGyOPX2080rfqm1BcEFuPEBxQJ4q3Q1/ZxzYJNFebF62MnkVrK?=
 =?us-ascii?Q?30LjeBlQSuyqdRgFSCFE0EBA?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 a5f71e45-355d-4a3d-b3ed-08d981db62b2
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5076.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Sep 2021 17:22:30.5227
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 pWXzzv3dTkTPxf1daFyDrrXZLbmlKCqH+VVf+WXwDpK7qHeH35hZ/KnR4UPgB2fLBuzaxG/2NtgE/4PrB3zpCQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR11MB1488
X-Proofpoint-GUID: hgS5Gr7WXRZBcPfKncgoDvrbb3ecYmdt
X-Proofpoint-ORIG-GUID: 9GHx6nX1wXw6MUqP9ZqI8L7f0Hzsge-B
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-09-27_07,2021-09-24_02,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0
 priorityscore=1501 suspectscore=0 mlxlogscore=999 malwarescore=0
 adultscore=0 impostorscore=0 phishscore=0 clxscore=1015 mlxscore=0
 bulkscore=0 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2109230001 definitions=main-2109270118
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 27 Sep 2021 17:22:35 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/156394

Create a small function that checks for 'isNative' as part of an Annotation

When the collect_dep_sources() runs, it collects sources from both native
and non-native recipes. Later when the GENERATED_FROM matching occurs it
may find the file (via checksum) from the native recipe since it's the
same checksum as the target file. The that are generated DocumentRefs
point to the native recipe rather than the target recipe DocumentRef.

Signed-off-by: Saul Wold <saul.wold@windriver.com>
---
 meta/classes/create-spdx.bbclass | 21 +++++++++++++++++++--
 1 file changed, 19 insertions(+), 2 deletions(-)

diff --git a/meta/classes/create-spdx.bbclass b/meta/classes/create-spdx.bbclass
index 3c73c21c04..739b46e9b3 100644
--- a/meta/classes/create-spdx.bbclass
+++ b/meta/classes/create-spdx.bbclass
@@ -13,6 +13,9 @@ SPDXDIR ??= "${WORKDIR}/spdx"
 SPDXDEPLOY = "${SPDXDIR}/deploy"
 SPDXWORK = "${SPDXDIR}/work"
 
+SPDX_TOOL_NAME ??= "oe-spdx-creator"
+SPDX_TOOL_VERSION ??= "1.0"
+
 SPDXRUNTIMEDEPLOY = "${SPDXDIR}/runtime-deploy"
 
 SPDX_INCLUDE_SOURCES ??= "0"
@@ -32,6 +35,10 @@ def get_doc_namespace(d, doc):
     namespace_uuid = uuid.uuid5(uuid.NAMESPACE_DNS, d.getVar("SPDX_UUID_NAMESPACE"))
     return "%s/%s-%s" % (d.getVar("SPDX_NAMESPACE_PREFIX"), doc.name, str(uuid.uuid5(namespace_uuid, doc.name)))
 
+def recipe_spdx_is_native(d, recipe):
+    return any(a.annotationType == "OTHER" and
+      a.annotator == "Tool: %s - %s" % (d.getVar("SPDX_TOOL_NAME"), d.getVar("SPDX_TOOL_VERSION")) and
+      a.comment == "isNative" for a in recipe.annotations)
 
 def is_work_shared(d):
     pn = d.getVar('PN')
@@ -336,6 +343,10 @@ def collect_dep_sources(d, dep_recipes):
 
     sources = {}
     for dep in dep_recipes:
+        # Don't collect sources from native recipes as they
+        # match non-native sources also.
+        if recipe_spdx_is_native(d, dep.recipe):
+            continue
         recipe_files = set(dep.recipe.hasFiles)
 
         for spdx_file in dep.doc.files:
@@ -382,7 +393,6 @@ python do_create_spdx() {
     include_sources = d.getVar("SPDX_INCLUDE_SOURCES") == "1"
     archive_sources = d.getVar("SPDX_ARCHIVE_SOURCES") == "1"
     archive_packaged = d.getVar("SPDX_ARCHIVE_PACKAGED") == "1"
-    is_native = bb.data.inherits_class("native", d)
 
     creation_time = datetime.now(tz=timezone.utc).strftime("%Y-%m-%dT%H:%M:%SZ")
 
@@ -401,6 +411,13 @@ python do_create_spdx() {
     recipe.name = d.getVar("PN")
     recipe.versionInfo = d.getVar("PV")
     recipe.SPDXID = oe.sbom.get_recipe_spdxid(d)
+    if bb.data.inherits_class("native", d):
+        annotation = oe.spdx.SPDXAnnotation()
+        annotation.annotationDate = creation_time
+        annotation.annotationType = "OTHER"
+        annotation.annotator = "Tool: %s - %s" % (d.getVar("SPDX_TOOL_NAME"), d.getVar("SPDX_TOOL_VERSION"))
+        annotation.comment = "isNative"
+        recipe.annotations.append(annotation)
 
     for s in d.getVar('SRC_URI').split():
         if not s.startswith("file://"):
@@ -480,7 +497,7 @@ python do_create_spdx() {
     sources = collect_dep_sources(d, dep_recipes)
     found_licenses = {license.name:recipe_ref.externalDocumentId + ":" + license.licenseId for license in doc.hasExtractedLicensingInfos}
 
-    if not is_native:
+    if not recipe_spdx_is_native(d, recipe):
         bb.build.exec_func("read_subpackage_metadata", d)
 
         pkgdest = Path(d.getVar("PKGDEST"))
-- 
2.25.1


