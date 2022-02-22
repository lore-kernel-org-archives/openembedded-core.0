Return-Path: <Saul.Wold@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9ED42C433EF
	for <webhook@archiver.kernel.org>; Tue, 22 Feb 2022 19:24:08 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com
 [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web08.2082.1645557846565220465
 for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Feb 2022 11:24:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=Z87QougG;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.178.238,
 mailfrom: prvs=90522e81cd=saul.wold@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id
 21MCgf7c021086
	for <openembedded-core@lists.openembedded.org>; Tue, 22 Feb 2022 19:24:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to :
 subject : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=PPS06212021;
 bh=56AN1pLQFSqtgacLKHaPL1wDtz5QfKoo3pI9wxv0a/4=;
 b=Z87QougGehpo+IjvjXvgLqu4OJMQMY23uxe4PTL2t1NHpZbECHNlwD18CYvRCytOp0Mt
 +eDntqce2QUpi7O7vHMw+BEPffgpY44EJYyt7hKDZFVn+yh07t+z9+3EtVyKhob5xfUD
 /xdteobRB94oFbwcnbBJ7qmqLcYBXZC20DzJhqV/3QAZdK1aCP+VdwgjpqfXkABXZB44
 TolUPjAqdTIzhZ1rPU+PiecKVd1y4SPHo7SSspCzHGMHIgtJlqW121wp8fWPmBThdux4
 Ujv/4BzSKvHAc/nYr8LFIH8bsZ+ycxXe/tC+W8egqbu0FjvMvo953SVDdVMKibLzrzCt 2A==
Received: from nam12-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam12lp2177.outbound.protection.outlook.com [104.47.55.177])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3ec6r31es1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Feb 2022 19:24:04 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nbuZDHkQThce9PgGetFI03qsZ2a8Jfct9NpE0bnPUf8KQ3ITxwk15Y6y/sEAvoBK/l9imhUmXgGXFxOpbdXJSqG29xyjDcbLZUdV0ZphRUtkJkF1ffchq3NrneVkqLdDu+NqxrCrXBZJJcSN1PgN6Ul+lC/WCPdeJoPCz7tuJ+LaHDdZ00rjHJpSryuKepCa5C0FgeQtELTaYVJiKLKd60s+OODjEBG2cEdJyKn+qRu4S5A0FPo+loBPPEwwd/vYgdJwYKS9Xjj7/hnL4NnCsk5BI+3TQ85D2/tlc8OFYLHgaL+V2MvXiAWu2itUkTzjNei3Q8Gny+pf8XfVrj07tQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=56AN1pLQFSqtgacLKHaPL1wDtz5QfKoo3pI9wxv0a/4=;
 b=HIv2jYee2GfiK0CuIp5Go5seu7fCDvJlGRM6dN+j5WKzJgoPDpmmAxqaFF1uxtcoA86FR0njxzl5P//I/NrAKCE3bv1Nse8NYAIM/7ijM+DEUBu2s98BXosYTnNV97tO/EqmqW9o1gXMK8sca8bG+tWxffZdkQdMLmJsHfXLXp2ktnfPJAR4LcCFTos3DZDUssstb/WRFMotJuU0vG/HRKiYP9yBFaDaBELXPr200Sl5cy3eBY/Od3QmMUIZPwtJUYuNjazGE3+CqC5BN0MzlJ9jdwAxGLYos9LsK+TuxSj9vrImPaLGZmYa51bEO6x8CY6WU795wnSc4KFDbmi5iQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO1PR11MB5076.namprd11.prod.outlook.com (2603:10b6:303:90::7)
 by BN6PR11MB1665.namprd11.prod.outlook.com (2603:10b6:405:f::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5017.22; Tue, 22 Feb
 2022 19:24:03 +0000
Received: from CO1PR11MB5076.namprd11.prod.outlook.com
 ([fe80::3dab:fd3e:8d8:4e36]) by CO1PR11MB5076.namprd11.prod.outlook.com
 ([fe80::3dab:fd3e:8d8:4e36%8]) with mapi id 15.20.5017.021; Tue, 22 Feb 2022
 19:24:03 +0000
From: Saul Wold <saul.wold@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] package: rename LICENSE_EXCLUSION
Date: Tue, 22 Feb 2022 11:23:45 -0800
Message-Id: <20220222192345.3988578-1-saul.wold@windriver.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MWHPR18CA0038.namprd18.prod.outlook.com
 (2603:10b6:320:31::24) To CO1PR11MB5076.namprd11.prod.outlook.com
 (2603:10b6:303:90::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: eac15737-39ce-4b9a-a087-08d9f638e28b
X-MS-TrafficTypeDiagnostic: BN6PR11MB1665:EE_
X-Microsoft-Antispam-PRVS: 
	<BN6PR11MB1665315E40D6BC26CF6F979CEE3B9@BN6PR11MB1665.namprd11.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	/hmJmLdELByY7Vz95IaDn10Ssak7eyy66dwgFovkLT2eIWQt99p3gYYEZUByO90q885x+Q5niMnUIfCWe3SnJDuVxMylhfnybLyAgOz4HidI0XoeYxVvrUUC7dklvglzCC9WZA1YiAwq2aqIA7J6KzJGffMlYokCLTZT/yQSGd/VnZ/lnK+eBXIzerQ5xsvu68Ks8ZZzZq1mnFO+C5P2qNwydnFxLszxXwS2zrui4gr7wtUtHu9ejZa4a9SY7qPY1XrF8U3bGcFmIRmTAcaf9nNgn1zvzJBLnRYAB6KfyfJ57n7qXRjCgA0Z+aw+KHGpsqZdyEIBXnK2F6Nc+p4fSDNGyCu7pVULAQtC1anrd7GLTRhesPwoazObITqcEiLUWYZHAxn5QRLktjR6w52KxLQxXZ+1QVO0Gto/k/H5ZzjgnzFa47sKC1kdFnUYzC5JqnFkCI8ThzT0AMmE+hdqtby5QnBFsBhYT8wQZUMavdDzD/TJp0RmEnzC3s+PYdKotbN5ysvhrQ3Cy4hrXPei2K3VtbjFsid/py+zuxzz1yHd/a0J7nng6ARVu+IAYkZI2qoOx23Jyrcbih4qdnRe/eztuV82/9h3E6zJ+D0mrfRkVZXbTcbF4LdGa1iB/xhxlU4QlEYYvfzUJEA84epZ9lnnviOFKu4jdvFccK1Xd21Gq19OIwe6C60FDTK/tAKXPleMn+AXchk2p/RXmrXifg==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5076.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(6486002)(83380400001)(52116002)(38350700002)(508600001)(6506007)(6512007)(6666004)(2616005)(86362001)(26005)(186003)(1076003)(66556008)(8676002)(6916009)(66946007)(316002)(66476007)(36756003)(38100700002)(2906002)(44832011)(8936002)(5660300002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?+3AS+jpwOGl2evzqU+5OoIqsZ7LnK9OQf1+VhatJPMSbtM4l3ne5KUDcSKGq?=
 =?us-ascii?Q?NmDZU8xxPka32/XNMmpS+Tjz6ALYL+HpEYKu4IVT54eyIkQgPLHVjhA1Dxqw?=
 =?us-ascii?Q?4IWQj8nSW3s+JaBT+YZFp7Hd7W/AEBFNfkrSghXJxe6vI4LJ1Cvoo+71fMcH?=
 =?us-ascii?Q?RnOxteFxPOMvkNiuaplOMTg8sWnkQX56EIic7QxHHC68bWhCI/e8mEpc23mb?=
 =?us-ascii?Q?5BOSAonvmiEvgRzxXi/HL5KrSXVkqZxHbYTyzSGkPskpS8LbpRLy0RQYtMOr?=
 =?us-ascii?Q?TiqnWycqNu8EI1S08kyewnpa9R3k7w8uTBK13Zf23SIetu98iSgYE4Tum2CN?=
 =?us-ascii?Q?Vjc4whAlYFsxaN46XfEB56U/7Ld3NuDVC06VLov9BAphjo9VmJZhu3Xh9/HF?=
 =?us-ascii?Q?p0RIJX6M6Wnlep4wUZIiS6kzO+wP3l19CugoEldTDdvP5XczQLh1a+X3areJ?=
 =?us-ascii?Q?GtuXgzYwkgIDRKkPrRlvLQS1jLJDLrHgj8kNEbeN9e+JYEzsdYWFufwxsP4H?=
 =?us-ascii?Q?JIx/pUVMGlQfCeBMFaK+x7Ydeyq3t/Mudai/K4uOQZxIfAgw8gvLH47c9rP9?=
 =?us-ascii?Q?TH0HGOv4fg3kq5faHcOo/o+huEVGvfvbW3DNPtqJz6g1YX89ila1UUQEqwmj?=
 =?us-ascii?Q?We4ehqxkIllJWc9yOm6SBqshfgVDeTs1NpiPZ/HmsLolwFvXC30wlEWTRaxF?=
 =?us-ascii?Q?j35qZ3gYc1pUSjJW4F/YPJLdKTvHcX74Pwad9VdcbNwSQm4jt42oLp5cqpPS?=
 =?us-ascii?Q?eXX7cxx5ggeC5YcM+CM1g9i9NvGnjGMEDEGkB0uNQTUfGCHN1XX5oPrPi7BX?=
 =?us-ascii?Q?6ADjYYHs/a+mL+B83Wygf5FdR4KLSNWIZEUn3STS6mYPCDOVd6hRuGcqsymS?=
 =?us-ascii?Q?r2TqvFiveyaCt+H+ChmRahcELrgxq/4Kp51N+mfucHnHXnHvray0eQx6WELM?=
 =?us-ascii?Q?+Z+lrAB9C2oZwnYVCA0YgJmm2coGVr0SdqpycDtuAqoajU71PzwfxgL8H909?=
 =?us-ascii?Q?G/0viFIJo39jN30NhlKye5oMTKZnuwkLFBr3Q79j/b0G48BzCidVwo+HBvn8?=
 =?us-ascii?Q?kdV7l/NW7z0ryHHh8M6m9l+/tDiStdgrc6HfoIBOECJIpVRj4DdOs8HfAuo7?=
 =?us-ascii?Q?XwpkOjAjZ43wPOLNTeLZXXzANI7tjD8TJigDkoX3wZS3Q3Rq4YN694TAPFxC?=
 =?us-ascii?Q?rXoByrGFxiapuhrhzA3h94rMIhjOamqNnMtBxy9BV1eeMbBd8MjvS8H+tl8F?=
 =?us-ascii?Q?VKe8QuAlsaeHNHxvg6TLN126PO8cNgXYLupeeQ/OLcVWU7qzj1UWmWj8uxUr?=
 =?us-ascii?Q?hdJ4EuPyQqWHBNjzMTUbm6F1V20Zg5QzsL12GACCWkrESMBL6/FZ/He0JhUd?=
 =?us-ascii?Q?7bUtpRSaxbUOlTkV0JAD3n0Y1eWsv15JLcL7uTxbXwfxsReR1LrErid4hd/x?=
 =?us-ascii?Q?jiMofkMoqt8l345H3TDWCcBbeozKWcrt8kiPQV0IR67LQyviPbWTkbenCqIq?=
 =?us-ascii?Q?Vfv/Ob8q5/FxjpGzGL4hnaDXcvnrdQqs183lukj+SBvClORKwUm/S3bXgvas?=
 =?us-ascii?Q?Aw9dokmhLA+K1Sczpu4hdbQjEKZDt1QubdgWoaFENaYdgSV97Ary4xoP6ug/?=
 =?us-ascii?Q?wDJyJgg1+rJnvO0jhuUD0Lo=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 eac15737-39ce-4b9a-a087-08d9f638e28b
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5076.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Feb 2022 19:24:03.0757
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 gRWOA3Gice8BX+wJiUcoK1DxUTz2ay7apy2+9uqiR05K3+iVF3Yv/e47YxbVQ/tCQiNFT6n+yOCOs5dkqIPpJA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR11MB1665
X-Proofpoint-GUID: 4RTOl8mqOIdnS7dX69OX_hRTFgYVEP-4
X-Proofpoint-ORIG-GUID: 4RTOl8mqOIdnS7dX69OX_hRTFgYVEP-4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-02-22_06,2022-02-21_02,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0
 adultscore=0 spamscore=0 bulkscore=0 priorityscore=1501 impostorscore=0
 phishscore=0 clxscore=1015 mlxscore=0 lowpriorityscore=0 mlxlogscore=818
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2201110000
 definitions=main-2202220118
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 22 Feb 2022 19:24:08 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162226

By renaming LICENSE_EXCLUSION to _exclude_incompatible, it makes it
clear that this is an internal variable.

Signed-off-by: Saul Wold <saul.wold@windriver.com>
---
 meta/classes/base.bbclass    | 2 +-
 meta/classes/package.bbclass | 6 +++---
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta/classes/base.bbclass b/meta/classes/base.bbclass
index 227f1f5a756..d0e669db00d 100644
--- a/meta/classes/base.bbclass
+++ b/meta/classes/base.bbclass
@@ -623,7 +623,7 @@ python () {
                 if unskipped_pkgs:
                     for pkg in skipped_pkgs:
                         bb.debug(1, "Skipping the package %s at do_rootfs because of incompatible license(s): %s" % (pkg, ' '.join(skipped_pkgs[pkg])))
-                        d.setVar('LICENSE_EXCLUSION-' + pkg, ' '.join(skipped_pkgs[pkg]))
+                        d.setVar('_exclude_incompatible-' + pkg, ' '.join(skipped_pkgs[pkg]))
                     for pkg in unskipped_pkgs:
                         bb.debug(1, "Including the package %s" % pkg)
                 else:
diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
index f4a661ba25a..f8222581502 100644
--- a/meta/classes/package.bbclass
+++ b/meta/classes/package.bbclass
@@ -1468,10 +1468,10 @@ python populate_packages () {
     os.umask(oldumask)
     os.chdir(workdir)
 
-    # Handle LICENSE_EXCLUSION
+    # Handle excluding packages with incompatible licenses
     package_list = []
     for pkg in packages:
-        licenses = d.getVar('LICENSE_EXCLUSION-' + pkg)
+        licenses = d.getVar('_exclude_incompatible-' + pkg)
         if licenses:
             msg = "Excluding %s from packaging as it has incompatible license(s): %s" % (pkg, licenses)
             oe.qa.handle_error("incompatible-license", msg, d)
@@ -2353,7 +2353,7 @@ def gen_packagevar(d, pkgvars="PACKAGEVARS"):
 
         # Ensure that changes to INCOMPATIBLE_LICENSE re-run do_package for
         # affected recipes.
-        ret.append('LICENSE_EXCLUSION-%s' % p)
+        ret.append('_exclude_incompatible-%s' % p)
     return " ".join(ret)
 
 PACKAGE_PREPROCESS_FUNCS ?= ""
-- 
2.25.1


