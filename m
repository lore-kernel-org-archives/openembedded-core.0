Return-Path: <Saul.Wold@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82CBBC433EF
	for <webhook@archiver.kernel.org>; Mon, 21 Feb 2022 23:39:24 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com
 [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web08.6337.1645486763389438416
 for <openembedded-core@lists.openembedded.org>;
 Mon, 21 Feb 2022 15:39:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=nYdVu+kP;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.166.238,
 mailfrom: prvs=905187c151=saul.wold@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id
 21LNIB0A001732
	for <openembedded-core@lists.openembedded.org>;
 Mon, 21 Feb 2022 15:39:22 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to : cc :
 subject : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=PPS06212021;
 bh=qSIXLDZLN/LSNXmsC8c41RxwnEDX4y2n++FLD90OuJ0=;
 b=nYdVu+kPpW85Oz9EYMzko8w2Rzx9Mj8gGnAwtalr/VM3tCkm8dsXQKwH2rVRcXtx233B
 on4xXnYbmmBBckrkb89tH1oUNrKdFCGXi8AnUlGeydpbUOPtTFKUZjghNK2HBvhwLJsp
 MVdmTzDP6TFWcW4feGV5J3A9z7j1Obei63WLqZ24646bXzQoZZ+TGaaCAxYkhCuMoNvI
 4eXfCdfmGsRH4tdGkJtEFTsbrAfy/Utr1V250gyqYDIWXEXgy4WiD6ltxV6PEvMFiRrO
 y+mqUhND2eBQQbnPlcXlsXIGZc/TXAoeY0sm4E9901SXwBFAYbZRxDocRl2y6A5kjy8W Bw==
Received: from nam12-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam12lp2170.outbound.protection.outlook.com [104.47.59.170])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3eb0xq9pkj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
 Mon, 21 Feb 2022 15:39:22 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Taq6ti4QZUpi8GByP2YHRQzXqPSNCRnt272PG8Hswac77LOak66WJS7ivSZ7hf5O9tV/UQet64hzwXSWjOxS1h0O+xfsQ5Wi3yz0I9ZR4SjhbrBsXMhyLa42cQK5qDInmLBbOIWG3XweZOyubBaBVzLP23SZdLYOzDrwcxoFjoqBc6JCuYglzN+p6aoOlySdU/YQ+TYwK7z8i0OZhSnTUVTPtpLcQhQwL1lil1rxqkN7rUlmKrkSW5nrfcqfMuXoy1FyulTiEUysB1OWYXV3xlL/gT3bUuqI+oCU9n4Y/6cy84mrGeBokKK1X1cTV9E2+/21TROQ/ap8lkB/gpD0+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qSIXLDZLN/LSNXmsC8c41RxwnEDX4y2n++FLD90OuJ0=;
 b=kYScNPSalIGTsLOy0M/xZ5XsVC2WSy0/hkUoQ5NuGAkHeJiqg9nJvw/2GRmfc4xxQiscG5Xpz8Mt50gdHjuBIZYY4lJUYCZKF64jBs71d0iURGyfaLgPitAB91aehquHk2dHfevq7hCKZjPywGGD2yiRkO/HY0m0cowwdFP3is2hfCMkOknye2xhBEDeBvG1nwPr3PbaRlkVI7nDoiceVIznSNTZvZjhAYkZzCi8W7Sg5I5FCZhFbe0Af9r7LBX8O8VeaKFYvVYpUzaIupP50pmVjQI1UtMII/XbisdwS9B3UToOMmsgEo7CeDgCEBMuTpoTiJhMGBFeFgVMVeBv7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO1PR11MB5076.namprd11.prod.outlook.com (2603:10b6:303:90::7)
 by DM6PR11MB4363.namprd11.prod.outlook.com (2603:10b6:5:14f::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4995.16; Mon, 21 Feb
 2022 23:39:20 +0000
Received: from CO1PR11MB5076.namprd11.prod.outlook.com
 ([fe80::3dab:fd3e:8d8:4e36]) by CO1PR11MB5076.namprd11.prod.outlook.com
 ([fe80::3dab:fd3e:8d8:4e36%6]) with mapi id 15.20.4995.027; Mon, 21 Feb 2022
 23:39:20 +0000
From: Saul Wold <saul.wold@windriver.com>
To: openembedded-core@lists.openembedded.org
Cc: Saul Wold <Saul.Wold@windriver.com>
Subject: [PATCH v2] Rename LICENSE_FLAGS variable
Date: Mon, 21 Feb 2022 15:39:03 -0800
Message-Id: <20220221233903.1603442-1-saul.wold@windriver.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: CO2PR07CA0047.namprd07.prod.outlook.com (2603:10b6:100::15)
 To CO1PR11MB5076.namprd11.prod.outlook.com (2603:10b6:303:90::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a8af8e63-db1b-4f97-a4ac-08d9f59361d9
X-MS-TrafficTypeDiagnostic: DM6PR11MB4363:EE_
X-Microsoft-Antispam-PRVS: 
	<DM6PR11MB43632CD8C392AC66F8795219EE3A9@DM6PR11MB4363.namprd11.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	pIcxBkit1zNOy9Z5ws1NlUaS2XRLyE2gpOQMy9MXj4irj1QXmuudZjrX/eTMf0VBCSnuiyV5QeJ2jCfwr6cedQr1EyHcuvuXBsYfF2pwcb0sxDN1wWZ/HdAX5g25A181R10UfBVarR39E/k85u4FyHsWHfCMqemaTlcyX41Hi+EuXsv/dmPXoLmatijeob6nbxAMxrxtzsxHG7wytG46tsfiqUTZ2zvq+Pba8XMznkE+GCM3fEuumtiuGVX+CHXjpmZJeeg3betrDyxue74aImX5P7lp7hQ8xOtmOTBtcKJ5etjb9Fj9S+xq4tJb58I89SjIuFer88w4X3ujPcyBQyaXCATnZ8wlUr6r7vYX5seuhKC4vjJlLVUD3hnN4EGMzAioogrGMzM3icMtqrE1wUeodBJ4Lv3MQJTtAzhLK0cUwdlk1ayZF+MngoTKsu2ERYJegyeEacqrY+OjlHrGVQpFaHAvmkt/TmlGBxTnVDYB/D1LQ9peNbS0JgB1Wzz68aA7JlIXo+HNmMXQF9EQPdL/ZS6fUhYEOwREFRZHZPf/mB/C/pYY/y7CyME2Rcuno1gCuvr/+W4K2U6VQh6PpEebNBdQCBHsiv4UL8ttNZG8Txv2IXKGndSNukgWDDVxWSYfeHbxrxbsRTnHHAO2xWoxJrHc+iLnoyaf1RASc+RMYx/jGGweslm/hVCXiufj/tbP6coMwqMUFVOiOafLdw==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5076.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(66476007)(83380400001)(66556008)(36756003)(44832011)(66946007)(26005)(186003)(2906002)(6916009)(107886003)(86362001)(38350700002)(38100700002)(8936002)(2616005)(1076003)(5660300002)(4326008)(52116002)(6506007)(6666004)(8676002)(508600001)(6486002)(6512007)(316002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?DvbJO0SfaPHGvRVMNHem8ywn837HVFb0f2KqF/LxLniF+C501x2w39rWEU/u?=
 =?us-ascii?Q?7Gar5EBD1egMQZeslzTo3w+4jrIWhEa8+r/+taOCziWWCHDICvZBo2LcEMYb?=
 =?us-ascii?Q?yqsWdZ2qp91bZI6LWYTZyobycW/CuJBDYtw5wamtaJTIlB4Dku7yBCu6rhW/?=
 =?us-ascii?Q?QDuqxSkNFxV4O85o5+VPRr62uFyIaUFWBfTDN+k6exonl1R5rJRo0ksda8Kt?=
 =?us-ascii?Q?Ipr3GHN8Z3DR6SMmI9I1MI7Qgg1BL8yIxgSzaLXMqOKAbm0gp6ufXBJLCwn4?=
 =?us-ascii?Q?CDZmyplg5e3pZEtTIyX9ANQgAOmEy/Pbl/ofYlezI7ebCbvOHKpl3/h2vrbh?=
 =?us-ascii?Q?9QrUvTv6pg78bZeBehy8/GfS+LWLm46KYlKJ9II+ExJg+zZT5Ym852VlKQa1?=
 =?us-ascii?Q?xnkaOQUSD4uEaJXFnWnFJ8yGJb8oSwLZ/rXffoY5hVB97v8HWEhwKYhCCBO5?=
 =?us-ascii?Q?IDNF7SNRye7jfzkRO4oRWU8reHzvV4KVxjaVYLeGDiApp2xbgdPcBNZxj7SX?=
 =?us-ascii?Q?sjEaNu8G59WC4UtLcy6F+H8XdzZ5TaGFLCfNnp/1wSyWuxkeirDbgh88JBMx?=
 =?us-ascii?Q?MCkhRRAG+qIHr4ZpR3f8rZcR2y5GBz09EgtLFbvQT6WUIz1/GLs8UoCKlg7e?=
 =?us-ascii?Q?bRhKrE1fmUJicJg+LVPrET/4ERMEIfniby6BPmcYXLnqdzvSov5MZAufgBQp?=
 =?us-ascii?Q?gMSRaSWTZK5n8XlZZhkimzyVJeT1PiqiyOgL+JJpukJEkBRIfxy1kd3jF0SH?=
 =?us-ascii?Q?ObwmtGo1AXFvRVlMUZ/bacAEc6s9UpxuvKDbLWmgGRw4K6SOceu0/h3agtA+?=
 =?us-ascii?Q?jeUkfq2+FjSWzoAe/NUVyNkgZ72H85xDnW+kTAW2e0eShXlyTztgE+peNeYP?=
 =?us-ascii?Q?dnaKDgINEkCUBKyf8D0nLx8E6ljh4xCLS65gDhuL8CQMWE/dmlRqJLpG0TUu?=
 =?us-ascii?Q?lJaXEzAHzl5WohfiTuhEVzWAXg4zSYGzItZUGe9yOxEDUHUbngaCQSvLrqZ9?=
 =?us-ascii?Q?3/qOb/vH5BIcE5I5NG4JFaS56EFbgYGMfrhAUvRQPdkyzOMdYNW0ABtbPKFe?=
 =?us-ascii?Q?Xo6ZVMAw5CduiT9kFQuFWLqqhVY5TJwQhAJysdEcqIJaLt17ScgDqS0iF+sD?=
 =?us-ascii?Q?CpGZAUJou+6LPXFoGV5BgNNsk8fPyWM1cmCL3wVLwXzmu2ueizKk/o7HiEMK?=
 =?us-ascii?Q?dXI1HTaYTvhtZEIoC3TEJitxGUcnVtJC3qcp6Oj/IXxRkNSev6XBWQB2UHcP?=
 =?us-ascii?Q?ozw8EXNQ17xXZ2HKdlWYjfa5fYSXX/2F8WYkY/ZhmXMm/apU3HXIuCY8zQOj?=
 =?us-ascii?Q?eGsPjMV8eRNFeS7wwm6ih4Hj6AH/I4g7MqL3JLYBS4QXYl2gqEebvV7JZR3W?=
 =?us-ascii?Q?cZM3v1lI0c576TEy++PtuxXHXxutkyDT1Npm1Ue95HvG7TBq4+mQ8ouoV27X?=
 =?us-ascii?Q?MFVDVCutqa0Cw0rT9EC+fxSSndD2f6GtnFaz9IAN0Ad6vC24VqqwXpWUkW4M?=
 =?us-ascii?Q?agiy7RQNSX0pzBmEGrDo0/55jfeUjyLrBImkKR7Gf3//Fvfs6rc0/I+yFR21?=
 =?us-ascii?Q?PJSehvifS6oVhN9ge52UdyXBIKs+Ody9h1NrrsJRSIgMSVM7lZJO9rfiY6xf?=
 =?us-ascii?Q?vKZN5/3NhFgGtepaW11H40c=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 a8af8e63-db1b-4f97-a4ac-08d9f59361d9
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5076.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Feb 2022 23:39:20.3723
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 r1VhHongpPiTMAvXmnt4LgS6AhPRjx6mfloPNZQbkZ4GcXMSqia82AEmpiFQmiMIglZuYY/p/fhxyK1MTstUSw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4363
X-Proofpoint-GUID: hpplJxxWLhmDJUEOIQqfPihSIvNwpuiT
X-Proofpoint-ORIG-GUID: hpplJxxWLhmDJUEOIQqfPihSIvNwpuiT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-02-21_11,2022-02-21_02,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0
 clxscore=1015 impostorscore=0 phishscore=0 lowpriorityscore=0 bulkscore=0
 malwarescore=0 spamscore=0 mlxlogscore=709 priorityscore=1501 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2201110000
 definitions=main-2202210140
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 21 Feb 2022 23:39:24 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162111

From: Saul Wold <Saul.Wold@windriver.com>

(From meta-yocto rev: e937a42996c046baca7ce502c6ce0ee3c7ed38e3)

Signed-off-by: Saul Wold <saul.wold@windriver.com>
---
v2: rename internal variables and fix comments and messages

 meta-poky/conf/local.conf.sample.extended |  2 +-
 meta/classes/base.bbclass                 |  4 +--
 meta/classes/license.bbclass              | 35 ++++++++++++-----------
 3 files changed, 21 insertions(+), 20 deletions(-)

diff --git a/meta-poky/conf/local.conf.sample.extended b/meta-poky/conf/local.conf.sample.extended
index 1e3699ef8e6..bc2dec9f528 100644
--- a/meta-poky/conf/local.conf.sample.extended
+++ b/meta-poky/conf/local.conf.sample.extended
@@ -177,7 +177,7 @@ DISTRO_FEATURES:remove = "x11"
 # product. If shipped as part of an image these packages may have
 # implications so they are disabled by default.  To enable them,
 # un-comment the below as appropriate.
-#LICENSE_FLAGS_WHITELIST = "commercial_gst-fluendo-mp3 \
+#LICENSE_FLAGS_ACCEPTED = "commercial_gst-fluendo-mp3 \
 #                           commercial_gst-openmax \
 #                           commercial_gst-plugins-ugly \
 #                           commercial_lame \
diff --git a/meta/classes/base.bbclass b/meta/classes/base.bbclass
index be820ddb2c2..227f1f5a756 100644
--- a/meta/classes/base.bbclass
+++ b/meta/classes/base.bbclass
@@ -542,9 +542,9 @@ python () {
         unmatched_license_flags = check_license_flags(d)
         if unmatched_license_flags:
             if len(unmatched_license_flags) == 1:
-                message = "because it has a restricted license '{0}'. Which is not whitelisted in LICENSE_FLAGS_ACCEPTED".format(unmatched_license_flags[0])
+                message = "because it has a restricted license '{0}'. Which is not listed in LICENSE_FLAGS_ACCEPTED".format(unmatched_license_flags[0])
             else:
-                message = "because it has restricted licenses {0}. Which are not whitelisted in LICENSE_FLAGS_ACCEPTED".format(
+                message = "because it has restricted licenses {0}. Which are not listed in LICENSE_FLAGS_ACCEPTED".format(
                     ", ".join("'{0}'".format(f) for f in unmatched_license_flags))
             bb.debug(1, "Skipping %s %s" % (pn, message))
             raise bb.parse.SkipRecipe(message)
diff --git a/meta/classes/license.bbclass b/meta/classes/license.bbclass
index dd1e07ee377..dec98672096 100644
--- a/meta/classes/license.bbclass
+++ b/meta/classes/license.bbclass
@@ -341,30 +341,31 @@ def incompatible_license(d, dont_want_licenses, package=None):
 def check_license_flags(d):
     """
     This function checks if a recipe has any LICENSE_FLAGS that
-    aren't whitelisted.
+    aren't acceptable.
 
-    If it does, it returns the all LICENSE_FLAGS missing from the whitelist, or
-    all of the LICENSE_FLAGS if there is no whitelist.
+    If it does, it returns the all LICENSE_FLAGS missing from the list
+    of acceptable license flags, or all of the LICENSE_FLAGS if there
+    is no list of acceptable flags.
 
-    If everything is is properly whitelisted, it returns None.
+    If everything is is acceptable, it returns None.
     """
 
-    def license_flag_matches(flag, whitelist, pn):
+    def license_flag_matches(flag, acceptlist, pn):
         """
-        Return True if flag matches something in whitelist, None if not.
+        Return True if flag matches something in acceptlist, None if not.
 
-        Before we test a flag against the whitelist, we append _${PN}
+        Before we test a flag against the acceptlist, we append _${PN}
         to it.  We then try to match that string against the
-        whitelist.  This covers the normal case, where we expect
+        acceptlist.  This covers the normal case, where we expect
         LICENSE_FLAGS to be a simple string like 'commercial', which
-        the user typically matches exactly in the whitelist by
+        the user typically matches exactly in the acceptlist by
         explicitly appending the package name e.g 'commercial_foo'.
         If we fail the match however, we then split the flag across
         '_' and append each fragment and test until we either match or
         run out of fragments.
         """
         flag_pn = ("%s_%s" % (flag, pn))
-        for candidate in whitelist:
+        for candidate in acceptlist:
             if flag_pn == candidate:
                     return True
 
@@ -375,27 +376,27 @@ def check_license_flags(d):
             if flag_cur:
                 flag_cur += "_"
             flag_cur += flagment
-            for candidate in whitelist:
+            for candidate in acceptlist:
                 if flag_cur == candidate:
                     return True
         return False
 
-    def all_license_flags_match(license_flags, whitelist):
+    def all_license_flags_match(license_flags, acceptlist):
         """ Return all unmatched flags, None if all flags match """
         pn = d.getVar('PN')
-        split_whitelist = whitelist.split()
+        split_acceptlist = acceptlist.split()
         flags = []
         for flag in license_flags.split():
-            if not license_flag_matches(flag, split_whitelist, pn):
+            if not license_flag_matches(flag, split_acceptlist, pn):
                 flags.append(flag)
         return flags if flags else None
 
     license_flags = d.getVar('LICENSE_FLAGS')
     if license_flags:
-        whitelist = d.getVar('LICENSE_FLAGS_ACCEPTED')
-        if not whitelist:
+        acceptlist = d.getVar('LICENSE_FLAGS_ACCEPTED')
+        if not acceptlist:
             return license_flags.split()
-        unmatched_flags = all_license_flags_match(license_flags, whitelist)
+        unmatched_flags = all_license_flags_match(license_flags, acceptlist)
         if unmatched_flags:
             return unmatched_flags
     return None
-- 
2.25.1


