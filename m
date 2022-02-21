Return-Path: <Saul.Wold@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C455BC433F5
	for <webhook@archiver.kernel.org>; Mon, 21 Feb 2022 18:36:32 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com
 [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web08.2581.1645468591061714950
 for <openembedded-core@lists.openembedded.org>;
 Mon, 21 Feb 2022 10:36:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=bPjZzboD;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.166.238,
 mailfrom: prvs=905187c151=saul.wold@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id
 21LFtR9m011727
	for <openembedded-core@lists.openembedded.org>;
 Mon, 21 Feb 2022 10:36:30 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to :
 subject : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=PPS06212021;
 bh=Gsb4cDFy+hJ9ojGX/HGOMIu5tw8h8/aoJ4K6JKqFQ5Q=;
 b=bPjZzboDsBxozSXF7evIZNIH6WejaOQFTZnnB2rNH68CIeFWGfPjVH5ShcJTdlhf7ZeP
 9ppVgFeNeS8lZsN1jO+/jWvaX5I/OKPf/VoB+HPd0evlR9AyWCFkDKnN9fFAKyH0cZdD
 8OYUYQVQij+CA9rzh6Hubazo2CSzZofUzMe51pCGvUv+H4Xwg8CfuqDedG2y/uvo9keM
 0F2fEkBNcawR48uxOog7myqsOxmAIGEFWhFjezjdO2YILV/Rk4TGSzk1PyGbN4wCpecL
 WQWbA4+wxMWESIC95O0LtT+zDdmjvI+QcRmliMKyPBTtbU5paiprrFa0iWGlZn0lgm0V 6Q==
Received: from nam12-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam12lp2168.outbound.protection.outlook.com [104.47.59.168])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3eavq7hmft-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
 Mon, 21 Feb 2022 10:36:30 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=j5hbYxQFW7V7ZCSojg8KPpqNtY0fz9o0qjB8Rl3TvSryixL5YHthoib4wI0Ke8J6h9fu4HgGWeTljsdtq3+Wi6/JK62oLzz0YkuJBWL5pnIfQi8tBG2DC1XQBgtOTi/UhMaRoT27nW+EJ6BHPEbpF8ytA3NT9pf8RvuJTwbSIjNNh20+2jrjqG/PZUX2CLnHSw5bafu4V5GuC6mD9lkeB+qMd+QFKmNjs/7b1GzlDfJ0A5rttdQM+MZoh14mvQD4QMljlil5INCJtuy5pfeJXJ1k7MVmJ8v67EIaA/F9BQeMK9geK8IHtx3EEU55bb8IQcvw80qr6cjqhqvPIvLYCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Gsb4cDFy+hJ9ojGX/HGOMIu5tw8h8/aoJ4K6JKqFQ5Q=;
 b=VPt/PMQ21t6ywo97K65tVGFqKOx+v9Dymq/1qfzLXmhrR2TBNZ8hYq7f+xGGaSus/8c+ceFksqoKsPymSFqrQmPzn86BJU7wRB0eNnToSQ8bEin1W2EgZ0z0T4rgneerhi3Wci9HCQCDeS1GeiY3KojJxaw78mxlCSu1UtPdNIb2A2+SpqgmIkMwAVnI/p59mSNCH991bfqA9GM9kwy4OaJJkIMi23BXolepyzkyazeMrVsjPPd22Q+wdnre7s4kuCrfrPmy1U2twYxEMkK7ssz5OupnTVHSMxWTbiG3hf4miWTCxG/8T6hUrhv2iVIQbJmkS09gjgSpgD3kfBW5rg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO1PR11MB5076.namprd11.prod.outlook.com (2603:10b6:303:90::7)
 by DM5PR11MB1419.namprd11.prod.outlook.com (2603:10b6:3:c::21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4995.26; Mon, 21 Feb 2022 18:36:27 +0000
Received: from CO1PR11MB5076.namprd11.prod.outlook.com
 ([fe80::3dab:fd3e:8d8:4e36]) by CO1PR11MB5076.namprd11.prod.outlook.com
 ([fe80::3dab:fd3e:8d8:4e36%6]) with mapi id 15.20.4995.027; Mon, 21 Feb 2022
 18:36:27 +0000
From: Saul Wold <saul.wold@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] Rename LICENSE_FLAGS variable
Date: Mon, 21 Feb 2022 10:36:13 -0800
Message-Id: <20220221183613.1558157-1-saul.wold@windriver.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR05CA0104.namprd05.prod.outlook.com
 (2603:10b6:a03:334::19) To CO1PR11MB5076.namprd11.prod.outlook.com
 (2603:10b6:303:90::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: fd248b5a-b268-4c8d-4902-08d9f56911e8
X-MS-TrafficTypeDiagnostic: DM5PR11MB1419:EE_
X-Microsoft-Antispam-PRVS: 
	<DM5PR11MB14195307C69B380B0B03D9D7EE3A9@DM5PR11MB1419.namprd11.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	CTPWUAYZc6Kkt+Uu/X8x1LFCPmmo7+6FGoc/8ZRN2LCu2B5m7FuMjfg0tu77x7IxlUXjjKg7egV4NeGSdKWVquOn7xSC8jI0Gxx+6044nYEKWndWgGI3/6sHY/ZTxPISTn6ZpWD8s3PyeQSOcC6MnUeqnqa3QxGM/3HGpuS7sZFVTSDbFOnwvcr8/c6dBXS3Lcu0tdFQNz4lCIhyHvs33Zu6lnCmIR04LMslPf/d8/UPsbC6OnSNjDjgdKRtgz85Kmu8CNMTB7GcUOvsbBylmHYopYoZ6+5q5fxvGjA/JpJkhqaH9NMX50OKh2glrJkiJkDagfzrhQ4PunycUAbOV5KzUB8fyrOGKCvazAaUeGRUGQeJn1By+PqI9rmb2SaiAgL5onKaHucmxPeRN15z3RaQQkErEaX7tv9+Fu2nrdFnHozUCfb63O9ygjRb264woYzv07EirfslO6pNusO+xTTutVHQGIQaOx036+6807Rd5DHcEtTtlw7aqLcz49egPvyvZOfGMIIcks8qoCGJbsTaSG0g3UmaJ0wxTCzftS1VGKhNfb8vdfPQ5KzD/NzL5Q+NPduoxEFhuJap8iOEo8fmzJOPkg1BOhBqRJV0AMUnIP0W52Nl+4vZ3c4+Da0ryc/1AYtbnl0ZEIc+2F+G2k/AZC9srcEas1ZGr6rHdjAknDYJqtoeVP+xS8RMJEF+N83r2YKPwG+7L2viiD+eYw==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5076.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(2906002)(38350700002)(38100700002)(86362001)(52116002)(6506007)(508600001)(6512007)(36756003)(66946007)(2616005)(66476007)(6486002)(6916009)(1076003)(66556008)(5660300002)(6666004)(8676002)(44832011)(8936002)(26005)(316002)(83380400001)(186003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?Qjw3YVIqBVq66PvxLXE4nc5iY2TP7C6AmxF3RAOkQPM62a2wlM1x3Tlo677e?=
 =?us-ascii?Q?/oLuYQj/+iQCi5ohiwND/GK4iwf4/7b1w5ciqcfwN6xY9V5FAnPohrgrvg6N?=
 =?us-ascii?Q?VxyScIVwYfSgu05ODB3KCswRFzpV56koJJTAvFo7p2SsCZEGWd7HXoFXBsp9?=
 =?us-ascii?Q?lG1FUtQaoLS2U1zBZyJlkZrTdGOO4HRs3YZcWiQ99RaTu30fXaMDPGXOtKsU?=
 =?us-ascii?Q?S+CqnADlIoTdSSLPAsfL1pL+um25mgecXH721TnqDUYuuIICnbE4XHKdYK8l?=
 =?us-ascii?Q?5Xv1M8LtAWKRQyQbnJcV2wYRWJH9+FB53G0dSxxGm8AOOBWqb8XFQ7CbeyfR?=
 =?us-ascii?Q?6rK2LrTQASQChKHueh4hHqWxJ2EakGGstJrrEs/fF2e7DJdnCDDhK3K1mlwP?=
 =?us-ascii?Q?kSVwsjbKpWYJxJd40sZR8b+G9xwy9I0QjI6rLqev/nyH/kKkc4ySj5Bj7D2C?=
 =?us-ascii?Q?HIny1f2Cx89cbOXvQwwfyv1Ga8zJcGtMNWaMdi2HlTEr7h7PjawFPf0CS09W?=
 =?us-ascii?Q?wE5awm6GcNy1ets8MyWYHR3lR4iBO5LRF6Kfp2Gnfv8thR/kUc2jrYw+1Za9?=
 =?us-ascii?Q?B+eidyFzUYRv+DDN7gJ5KbAHjG9yDIMylpo+uEFNC5XT/ubh66FCXjC74J1O?=
 =?us-ascii?Q?34CX8lT4lSmjstqAbGDS7SI03Km1iZncLQKcJazwwdICEJmxNIpsgg1TtOkk?=
 =?us-ascii?Q?efDopn41ubCvI6z5dpBZXIVo+iNY72H2EPXM1/GxWKns75OOSH5a+K2KATgO?=
 =?us-ascii?Q?Qc9p00vow0BDvfGsHLDpN0ziW8svRY6MnE14vOF+iTvtsXMLN62k2BPSGGIZ?=
 =?us-ascii?Q?kSaLLvEIZOtfZqn1yxsWUAX4p9eLRGLBb/fvsXRCwteNWiRwSDY9MzbG11a9?=
 =?us-ascii?Q?gibEZDgdIJ4GqnRusDJGg1bXXaecNps58ysgywUP1lLJ0xNGHa2nmIEcdwv8?=
 =?us-ascii?Q?i2EGBQZkscbEC1F00I+euLvZpO8FzhazOTZvhuV9MDPJdeH+MQg9veOsKUtu?=
 =?us-ascii?Q?C89eqAuUbQKafwl8QUUNEKBAQ6NXTfK4ldmtVOpuw5jlGyayiuaWH3FymjiL?=
 =?us-ascii?Q?McZL1jLc8h9rJ/gLnNtWXHqmRP+T/IWO3/z0jM/1b37fCFWaeEW7K1Z1m0+7?=
 =?us-ascii?Q?UbDvtnw/OY4oR7ZQycdt9Civ1M8XhlA9RR2XbYVrIG1n74S0DI1UB+H3cV1D?=
 =?us-ascii?Q?dOiJtVFgFse9McT+GwWvS6kUqz6Wm5xglNJtBAItHOr4qqloglZpmWG1HqVZ?=
 =?us-ascii?Q?2cJHMTZqNElMGrJ0D0vJ46FI+wQ4gH+ECDUxbXyKsLMBI/ExBwn4lXNgy0VU?=
 =?us-ascii?Q?pWGlQak2GKu0tTAwcR5tOiJOWz+HPAjw5dtFxG72CqwB6f9P+uH8FrxFQI27?=
 =?us-ascii?Q?VVx4Ee5MGd7/AFYUpHNDovPEMfdKfOmP32KI3hM8HrTsMBMTLajh140cxHDH?=
 =?us-ascii?Q?fRQoJalJB6N6yPQEK+P0vBOdOdbnYoCrGoERVT3+G+ddzQMnZQMoQWZq3y0i?=
 =?us-ascii?Q?ZTH35E+gFWdhPRy4GDPCKumyBnGFNp4l7Gv13ZFJASkInNJo6/h7UQEuXNoq?=
 =?us-ascii?Q?6ycfb2Zj3jTAHAS8jtXxdpZigRpkUEjAG9VWaYOssZYhCcpZJJkwG0+rdnqe?=
 =?us-ascii?Q?d65cZd54DWOSoNtEmEsW0ww=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 fd248b5a-b268-4c8d-4902-08d9f56911e8
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5076.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Feb 2022 18:36:27.3098
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 x9U0wkbbRJ7n1ppuv2bZtJ3aka3TwZ4RzfCB+X1Z6hvReR7In1bd2EojPOJ/hk0W2CkCRc4fYsikqTTXgrSgAA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR11MB1419
X-Proofpoint-GUID: xME-laKNbgHSqHIQBsXRNdGJkcqESu6Q
X-Proofpoint-ORIG-GUID: xME-laKNbgHSqHIQBsXRNdGJkcqESu6Q
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-02-21_08,2022-02-21_02,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0
 priorityscore=1501 adultscore=0 mlxlogscore=999 bulkscore=0 mlxscore=0
 impostorscore=0 spamscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2201110000
 definitions=main-2202210110
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 21 Feb 2022 18:36:32 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162065

Signed-off-by: Saul Wold <saul.wold@windriver.com>
---
 meta-poky/conf/local.conf.sample.extended                | 2 +-
 meta/classes/base.bbclass                                | 4 ++--
 meta/classes/license.bbclass                             | 2 +-
 meta/conf/bitbake.conf                                   | 1 +
 meta/lib/oeqa/selftest/cases/distrodata.py               | 4 ++--
 meta/lib/oeqa/selftest/cases/reproducible.py             | 2 +-
 meta/recipes-multimedia/gstreamer/gst-examples_1.18.6.bb | 4 ++--
 scripts/contrib/convert-variable-renames.py              | 1 +
 8 files changed, 11 insertions(+), 9 deletions(-)

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
index 87a4cb5fc77..be820ddb2c2 100644
--- a/meta/classes/base.bbclass
+++ b/meta/classes/base.bbclass
@@ -542,9 +542,9 @@ python () {
         unmatched_license_flags = check_license_flags(d)
         if unmatched_license_flags:
             if len(unmatched_license_flags) == 1:
-                message = "because it has a restricted license '{0}'. Which is not whitelisted in LICENSE_FLAGS_WHITELIST".format(unmatched_license_flags[0])
+                message = "because it has a restricted license '{0}'. Which is not whitelisted in LICENSE_FLAGS_ACCEPTED".format(unmatched_license_flags[0])
             else:
-                message = "because it has restricted licenses {0}. Which are not whitelisted in LICENSE_FLAGS_WHITELIST".format(
+                message = "because it has restricted licenses {0}. Which are not whitelisted in LICENSE_FLAGS_ACCEPTED".format(
                     ", ".join("'{0}'".format(f) for f in unmatched_license_flags))
             bb.debug(1, "Skipping %s %s" % (pn, message))
             raise bb.parse.SkipRecipe(message)
diff --git a/meta/classes/license.bbclass b/meta/classes/license.bbclass
index d5480d87e24..dd1e07ee377 100644
--- a/meta/classes/license.bbclass
+++ b/meta/classes/license.bbclass
@@ -392,7 +392,7 @@ def check_license_flags(d):
 
     license_flags = d.getVar('LICENSE_FLAGS')
     if license_flags:
-        whitelist = d.getVar('LICENSE_FLAGS_WHITELIST')
+        whitelist = d.getVar('LICENSE_FLAGS_ACCEPTED')
         if not whitelist:
             return license_flags.split()
         unmatched_flags = all_license_flags_match(license_flags, whitelist)
diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index 3af649ce594..6fb7bfeb23c 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -108,6 +108,7 @@ BB_RENAMED_VARIABLES[ICECC_USER_PACKAGE_BL] = "ICECC_RECIPE_DISABLE"
 BB_RENAMED_VARIABLES[ICECC_SYSTEM_PACKAGE_BL] = "ICECC_RECIPE_DISABLE"
 BB_RENAMED_VARIABLES[INHERIT_BLACKLIST] = "is a deprecated variable and no longer needed"
 BB_RENAMED_VARIABLES[TUNEABI_WHITELIST] = "is a deprecated variable and support has been removed"
+BB_RENAMED_VARIABLES[LICENSE_FLAGS_WHITELIST] = "LICENSE_FLAGS_ACCEPTED"
 
 ##################################################################
 # Architecture-dependent build variables.
diff --git a/meta/lib/oeqa/selftest/cases/distrodata.py b/meta/lib/oeqa/selftest/cases/distrodata.py
index 908979804ab..03f31e9fcbf 100644
--- a/meta/lib/oeqa/selftest/cases/distrodata.py
+++ b/meta/lib/oeqa/selftest/cases/distrodata.py
@@ -18,7 +18,7 @@ class Distrodata(OESelftestTestCase):
         Product:     oe-core
         Author:      Alexander Kanavin <alex.kanavin@gmail.com>
         """
-        feature = 'LICENSE_FLAGS_WHITELIST += " commercial"\n'
+        feature = 'LICENSE_FLAGS_ACCEPTED += " commercial"\n'
         self.write_config(feature)
 
         pkgs = oe.recipeutils.get_recipe_upgrade_status()
@@ -99,7 +99,7 @@ The following recipes do not have a DESCRIPTION. Please add an entry for DESCRIP
                      return True
             return False
 
-        feature = 'require conf/distro/include/maintainers.inc\nLICENSE_FLAGS_WHITELIST += " commercial"\nPARSE_ALL_RECIPES = "1"\nPACKAGE_CLASSES = "package_ipk package_deb package_rpm"\n'
+        feature = 'require conf/distro/include/maintainers.inc\nLICENSE_FLAGS_ACCEPTED += " commercial"\nPARSE_ALL_RECIPES = "1"\nPACKAGE_CLASSES = "package_ipk package_deb package_rpm"\n'
         self.write_config(feature)
 
         with bb.tinfoil.Tinfoil() as tinfoil:
diff --git a/meta/lib/oeqa/selftest/cases/reproducible.py b/meta/lib/oeqa/selftest/cases/reproducible.py
index e539365031d..7caf8c3e7d5 100644
--- a/meta/lib/oeqa/selftest/cases/reproducible.py
+++ b/meta/lib/oeqa/selftest/cases/reproducible.py
@@ -206,7 +206,7 @@ class ReproducibleTests(OESelftestTestCase):
             PACKAGE_CLASSES = "{package_classes}"
             INHIBIT_PACKAGE_STRIP = "1"
             TMPDIR = "{tmpdir}"
-            LICENSE_FLAGS_WHITELIST = "commercial"
+            LICENSE_FLAGS_ACCEPTED = "commercial"
             DISTRO_FEATURES:append = ' systemd pam'
             USERADDEXTENSION = "useradd-staticids"
             USERADD_ERROR_DYNAMIC = "skip"
diff --git a/meta/recipes-multimedia/gstreamer/gst-examples_1.18.6.bb b/meta/recipes-multimedia/gstreamer/gst-examples_1.18.6.bb
index 8b4e3394360..02282ac5d9a 100644
--- a/meta/recipes-multimedia/gstreamer/gst-examples_1.18.6.bb
+++ b/meta/recipes-multimedia/gstreamer/gst-examples_1.18.6.bb
@@ -30,6 +30,6 @@ RDEPENDS:${PN} = "gstreamer1.0-plugins-base-playback"
 RRECOMMENDS:${PN} = "gstreamer1.0-plugins-base-meta \
                      gstreamer1.0-plugins-good-meta \
                      gstreamer1.0-plugins-bad-meta \
-                      ${@bb.utils.contains("LICENSE_FLAGS_WHITELIST", "commercial", "gstreamer1.0-libav", "", d)} \
-                     ${@bb.utils.contains("LICENSE_FLAGS_WHITELIST", "commercial", "gstreamer1.0-plugins-ugly-meta", "", d)}"
+                      ${@bb.utils.contains("LICENSE_FLAGS_ACCEPTED", "commercial", "gstreamer1.0-libav", "", d)} \
+                     ${@bb.utils.contains("LICENSE_FLAGS_ACCEPTED", "commercial", "gstreamer1.0-plugins-ugly-meta", "", d)}"
 RPROVIDES:${PN} += "gst-player gst-player-bin"
diff --git a/scripts/contrib/convert-variable-renames.py b/scripts/contrib/convert-variable-renames.py
index bc3e01887c5..fca59ca9e1f 100755
--- a/scripts/contrib/convert-variable-renames.py
+++ b/scripts/contrib/convert-variable-renames.py
@@ -42,6 +42,7 @@ renames = {
 "ICECC_USER_PACKAGE_WL" : "ICECC_RECIPE_ENABLE",
 "ICECC_USER_PACKAGE_BL" : "ICECC_RECIPE_DISABLE",
 "ICECC_SYSTEM_PACKAGE_BL" : "ICECC_RECIPE_DISABLE",
+"LICENSE_FLAGS_WHITELIST" : "LICENSE_FLAGS_ACCEPTED",
 }
 
 removed_list = [
-- 
2.25.1


