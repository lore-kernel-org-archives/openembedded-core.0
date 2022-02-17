Return-Path: <Saul.Wold@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DDCF9C433F5
	for <webhook@archiver.kernel.org>; Thu, 17 Feb 2022 00:34:16 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com
 [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.1635.1645058050507180125
 for <openembedded-core@lists.openembedded.org>;
 Wed, 16 Feb 2022 16:34:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=RDnizT85;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.166.238,
 mailfrom: prvs=9047f6eb5b=saul.wold@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id
 21H0NT3x031714
	for <openembedded-core@lists.openembedded.org>;
 Wed, 16 Feb 2022 16:34:10 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to : cc :
 subject : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=PPS06212021;
 bh=hp61osApkV4WuX1eEROcBdPKP5txwxYWgyKbSoL3ZQc=;
 b=RDnizT858BrQhHBvzedVRWqByQVGoXt55sgUiG9wCTx1LsuQQO7wpEqH9V/mC3uKko8P
 h3CZj9JB/gpnn1mfHkm/Sdnl58BiC5ZPVq5C8gARl0cFikkPuZ+Q+9o/lBS0afORITU9
 vklzi4YwyZeb2fdwJUnHfWJOhtfXzSpEQkh0ZgrjzFASuar5rpaseZWSNXHIHYkl4loa
 pu6/nV39rKOQw0LT8taHlCZrZam+XVvVGzCvF3/QFncRtXontN+zav8Jw4yf0MjCr/bT
 fS3YEC1xeX14YG1426YN2A3tVFMvC+Qzuj81FA/1vQnwv+e6DMd1N98LtZeDEl8q0JP0 8w==
Received: from nam10-bn7-obe.outbound.protection.outlook.com
 (mail-bn7nam10lp2103.outbound.protection.outlook.com [104.47.70.103])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3e8n1x0yy9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
 Wed, 16 Feb 2022 16:34:09 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=chb/Gfz2MJjzRVlEpxG8BKXvRp6QhLOoLW+ypSgzKtmoCvGdynY4iPn0oHYpbJv+KLi5hcfiP7ZqK8+C1ZN55DHXp83kBbfmUP/gYE337r20dTKTVCKdQvpstYAvvfauyXn3qJtT/FSEnI5h7+vB+o/wNiOoLqQd93gmnGkNZUUsRYwyJa1PzJ2n59NOayPqPe0JYNhuUkRKN7elfpWzKKzRgXSMAUXbYoB9KvU40pTh8lkJ15mMHYqcmJw/wJAGcPN95pqd9OYbQq7NeIRRSriQSa+/r464L+tc09DI/OH0pYITLzwj2SVGJsiCZpoOpGLM2XWh91cKAfjp1wHYKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hp61osApkV4WuX1eEROcBdPKP5txwxYWgyKbSoL3ZQc=;
 b=FUQAours/P/PLHsmVG/444eWUE3EPYPaQCVWFCou3ZHmxPU9Vr7Hg661jmNqZHmLR2btVqf6tE/QSxmXxv+CYA9xWZxzoXLGxkkO/JudnAobdKryar+bWl62OitsMKIzK+kDrgh+rh5YETbiduCgUgSRNMlw83SToIgYwRzogNjjACXAQE7tmzJy/CF+XUsOLjCOVz/IWCVqYN67aTupXITpGPvuhXXTBJ6gRQ+CLx/9GvjA/xjA0YcRFs2ydR8bosU2pPoiKpy0RvfOMVKq3IOKOa0qN7tbJVqJKiz7k0pHr8LB1cyywzAw4oiYI8ijxnAxbj2fW+vd0wem2beGJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Received: from CO1PR11MB5076.namprd11.prod.outlook.com (2603:10b6:303:90::7)
 by DM8PR11MB5640.namprd11.prod.outlook.com (2603:10b6:8:3f::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4975.17; Thu, 17 Feb
 2022 00:34:07 +0000
Received: from CO1PR11MB5076.namprd11.prod.outlook.com
 ([fe80::3dab:fd3e:8d8:4e36]) by CO1PR11MB5076.namprd11.prod.outlook.com
 ([fe80::3dab:fd3e:8d8:4e36%6]) with mapi id 15.20.4995.016; Thu, 17 Feb 2022
 00:34:07 +0000
From: Saul Wold <saul.wold@windriver.com>
To: openembedded-core@lists.openembedded.org
Cc: Saul Wold <Saul.Wold@windriver.com>
Subject: [PATCH v2] convert-variables: Script for Inclusive Language variable
 renames
Date: Wed, 16 Feb 2022 16:32:48 -0800
Message-Id: <20220217003248.581903-1-saul.wold@windriver.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MWHPR2001CA0021.namprd20.prod.outlook.com
 (2603:10b6:301:15::31) To CO1PR11MB5076.namprd11.prod.outlook.com
 (2603:10b6:303:90::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 58a6fd6d-82dd-4535-196c-08d9f1ad34b5
X-MS-TrafficTypeDiagnostic: DM8PR11MB5640:EE_
X-Microsoft-Antispam-PRVS: 
	<DM8PR11MB564095F1DC3ECAEA4B6B76A8EE369@DM8PR11MB5640.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4125;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	FdDu7GE8WbJEsuNIe3S/L88l5WUOt2cz4hN+VOpDzN9M6OvcletpRGQgoH/JdSBpW7W43joqg5pXRRiJshRRdMLKmyLguBq/byZensIqeAo8Ar2xgTEzeqPTPBxPp+pXQrrlReI5+sLnWxZUAzjVF5mK0mG12Xvtv2xlIKZ3BLNCptE63+a+1c5eeLMkkOTogWe+iscstd0lOUWu9KPSzwrX7Ue9+Si8DYYcdtXfQQv7C3XLXQmEb+/GemVp6cF7n/e2/uRcPYsHnIpC3G9w9q5UgmQUopEm8WpT/ruyfrZ8jh+OCE8TrlUooGIoqmI4kRPnO3ha4kkMaV5Dr5gOtkmCoMiUFC2b6pcQ8lxAfPHTQw0mGfm1IcjUZuX6S00uag1OJZJB+4o6NCzXysw7I4LVk+3c2m+a1g4spKZishp+j3YdSixDqJLjf+W5n1vdfG4gLYGCGq6+e0EE3M3rQ0lWS9aQ80lphHqJ4saTgOyjWLC91BmS+rqB3+hBVFikG3SCGllIYPK7i60SPePeLidGMl5FHjWvypsJ7Pk1r7I74/8nP1byLxZAmNjCbqKoL6CsMVvyzygF1/QayD9rfliRmaZNm5iL0GMuCVg9UrxlI0kVF+ZsyqFOVHVHRybfmQAD9EZOXcVJUzQeMpjubdVM3BemNqYydmCt9NaNTD/qfp9JlTFP4PV4RvhgF5FN3uI+2uVTmrDF+FZ2PmI7gg==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5076.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(86362001)(4326008)(8676002)(66476007)(6486002)(8936002)(36756003)(6916009)(66556008)(38100700002)(5660300002)(316002)(66946007)(38350700002)(6666004)(83380400001)(6506007)(2616005)(44832011)(107886003)(6512007)(26005)(508600001)(186003)(1076003)(2906002)(52116002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?GSG4VIO4oeIvRix+cuqCED6HZomlzgcj8YSR3xSUJn1i0dds+M3C80bw/vTY?=
 =?us-ascii?Q?PMjNy+vCfVbF/Td+HqCU5GOFXse1Sn6bwBVSuH7/BMXi8VPhInG8LvwbWXrt?=
 =?us-ascii?Q?5JgAz4s4H4Crbv/9M8bjhBxRXmFNcGR4e3NKj9tIpVuTz5yx03iJvQkVGAkR?=
 =?us-ascii?Q?gvq3ycyQMoyoLWUQNr+TFNwcXdShUH4RcgscqwtNNoOjjWiPsxjWDPD0CUZm?=
 =?us-ascii?Q?vpi+5470EIPwZVQB6+kS2dtIcwLU83pcMisyfEML3DPkFakxQuVCjWEQDHeN?=
 =?us-ascii?Q?GA6qo/rC/57gviUIcey3TZ0df97TtqoBacjlqnXdq+4yvopg12Se4meIRCxJ?=
 =?us-ascii?Q?IGND52NjM5z+GLh4+zuCN9iI5YsywKbLwQf7aBvXXhEidldR1yvtt0VIFPMc?=
 =?us-ascii?Q?JkLjdVr0SIoX0xE7FjIRdd7u0xeiJ/qHiwZHef03G8sRC135b4FTj9DyACPB?=
 =?us-ascii?Q?FOdB8zPn1NIzKGzku+WU+V43YiYid0DbhyCVBt1KZh7N7vspHE/7VP7J+aau?=
 =?us-ascii?Q?xXZZcWvdi/mujIdm7ouljXGUv2z14EFnhVQZ24BEVt0UIz1PdrUarQR+6XE2?=
 =?us-ascii?Q?yPSuW1tIkuayOASojykmMFi6qZ0roLzOOiKE5AtA+Qq9lkS8fLxF5R8s/FAo?=
 =?us-ascii?Q?QPLVPYh8WB5PIQk4lX5Ngnw/r8nDOOL3xu+vJj/5DbqA/VuQe4ITRS8hOKEO?=
 =?us-ascii?Q?rZFbqqHSG6S+ypSVjE2M5pszS3kVkGd3d2GjO+yLxWpaaRwHSqFkG7gFVwts?=
 =?us-ascii?Q?l5Sda4130F/N3NAX49wr4RjH8dNT/x0nj1ndUAH7wSmbxanUYeYbu7Xf2hcx?=
 =?us-ascii?Q?8PhNWCRNto+/si2vv13pkoc/PnOYybvOkg/HJrNhLL2Ymss8Pq6+ihXmQJpG?=
 =?us-ascii?Q?9KpJz0q/dh7yH4eS9FzBYM1s0cyyN9IzJDIkMtEkf9i1Ii8FMqhB+jFvNnTV?=
 =?us-ascii?Q?Xpquepr8oyCDtS/Ow1C5aNE+OaZRljRkVrdnbK61pKEw/Je/pKJz+ax1pIaG?=
 =?us-ascii?Q?TeGBcboVoB4+v3VTfxI1P0nw1LT69LwO+HEHPCPx6wOeqEzE4f/FZfA27xmR?=
 =?us-ascii?Q?UGEQaJgL/IbkDrtbNM7cKe4oK4tGSIUZ8tmTkPYi+cILdrr2GFLCTwouNFnS?=
 =?us-ascii?Q?NOp4L/rhxomxQbwYEW3TCEvLzd3ZKLAhfDr8EB41+yqIoRrrC44WQuqKAyCF?=
 =?us-ascii?Q?vclrPpAbpUz59WzvFZdoEGf/o+i4AGSkGILtDQ0zqL1Pu+gdArUQ4pbIEKXJ?=
 =?us-ascii?Q?NNhD0kv9DI2jRAkGSVI8HdyRm76vqeu2YA/6uhTtGwiPPZ3/57ES9AfPjqpz?=
 =?us-ascii?Q?jdxqGv09PQlgfaiQshzsL87SsXlPdEoNThs9CmFx9OwWnRjq35KBEyF3tOzq?=
 =?us-ascii?Q?6xZUOepmwhz4a0PoeqB3b4udl4nCmLjpxnEx91kgexVpQTln2aKGRXmlyChZ?=
 =?us-ascii?Q?Nx5pOjSZ5vBWYk1AhNEW7aG+9m9cBTNpX20YT628L6VleKRJ+EApkh9qLDx7?=
 =?us-ascii?Q?g5nglH37bpllycMI2jkRVCyeks9nVTcZWTItpSCZMpX8FVUf1oQyMDhAXZbP?=
 =?us-ascii?Q?UljQr2T0blswqxWTx6sFTvn5pWjyilbReLb4ywY3yRNhHAkmmhSyDgBqLilN?=
 =?us-ascii?Q?9/lJ4M+u+YOXVNeBAVD+mdE=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 58a6fd6d-82dd-4535-196c-08d9f1ad34b5
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5076.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Feb 2022 00:34:06.8223
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 McVyh2JfCqeExYlmgYKXmhgydvKQAdviX8AYyGs6E5VI+kOavoobke/rQG3S7F5FT8v01a4ODU7BtoPdg0bkYA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM8PR11MB5640
X-Proofpoint-ORIG-GUID: m-9Cr9NW5mwbaZxiXsZ4CFViN5aTz1iO
X-Proofpoint-GUID: m-9Cr9NW5mwbaZxiXsZ4CFViN5aTz1iO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-02-16_11,2022-02-16_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0
 mlxscore=0 phishscore=0 clxscore=1015 adultscore=0 lowpriorityscore=0
 bulkscore=0 priorityscore=1501 malwarescore=0 mlxlogscore=999
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2202170000
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 17 Feb 2022 00:34:16 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161791

From: Saul Wold <Saul.Wold@windriver.com>

This script searches for a list of variable that have been renamed
and converts them to their more descriptive names. It also searches
for a list of variables that have been removed or deprecated and
prints a message.

It will print a message to inform the user that there are terms that
need to be updated in their files. Many of these changes are context
sensitive and may not be modified as they might be existing calls to
other libraries. This message is informational only.

I have tested this on poky and meta-openembedded so far.

(From OE-Core rev: 50fe7ba8dba05a9681c9095506f798796cfc2750)

Signed-off-by: Saul Wold <saul.wold@windriver.com>
---
v2: renamed script, removed bitbake internal vars, added WHITELIST_ option

 scripts/contrib/convert-variables.py | 110 +++++++++++++++++++++++++++
 1 file changed, 110 insertions(+)
 create mode 100755 scripts/contrib/convert-variables.py

diff --git a/scripts/contrib/convert-variables.py b/scripts/contrib/convert-variables.py
new file mode 100755
index 0000000000..a632fd4d5c
--- /dev/null
+++ b/scripts/contrib/convert-variables.py
@@ -0,0 +1,110 @@
+#!/usr/bin/env python3
+#
+# Conversion script to rename variables with more descriptive terms
+#
+#
+# SPDX-License-Identifier: GPL-2.0-only
+#
+
+import re
+import os
+import sys
+import tempfile
+import shutil
+import mimetypes
+
+if len(sys.argv) < 2:
+    print("Please specify a directory to run the conversion script against.")
+    sys.exit(1)
+
+renames = {
+"BB_ENV_WHITELIST":"BB_ENV_PASSTHROUGH",
+"BB_ENV_EXTRAWHITE":"BB_ENV_PASSTHROUGH_ADDITIONS",
+"BB_HASHCONFIG_WHITELIST":"BB_HASHCONFIG_IGNORE_VARS",
+"BB_SETSCENE_ENFORCE_WHITELIST":"BB_SETSCENE_ENFORCE_IGNORE_TASKS",
+"BB_HASHBASE_WHITELIST":"BB_BASEHASH_IGNORE_VARS",
+"BB_HASHTASK_WHITELIST":"BB_TASKHASH_IGNORE_TASKS",
+"CVE_CHECK_PN_WHITELIST":"CVE_CHECK_SKIP_RECIPE",
+"CVE_CHECK_WHITELIST":"CVE_CHECK_IGNORE",
+"MULTI_PROVIDER_WHITELIST":"BB_MULTI_PROVIDER_ALLOWED",
+"PNBLACKLIST":"SKIP_RECIPE",
+"SDK_LOCAL_CONF_BLACKLIST":"ESDK_LOCAL_CONF_ALLOW",
+"SDK_LOCAL_CONF_WHITELIST":"ESDK_LOCAL_CONF_REMOVE",
+"SDK_INHERIT_BLACKLIST":"ESDK_CLASS_INHERIT_DISABLE",
+"SSTATE_DUPWHITELIST":"SSTATE_ALLOW_OVERLAP_FILES",
+"SYSROOT_DIRS_BLACKLIST":"SYSROOT_DIRS_IGNORE",
+"UNKNOWN_CONFIGURE_WHITELIST":"UNKNOWN_CONFIGURE_OPT_IGNORE",
+"WHITELIST_":"INCOMPATIBLE_LICENSE_ALLOWED_RECIPE_",
+}
+
+removed_list = [
+"BB_STAMP_WHITELIST",
+"BB_STAMP_POLICY",
+"ICECC_USER_CLASS_BL",
+"ICECC_USER_PACKAGE_BL",
+"ICECC_USER_PACKAGE_WL",
+"INHERIT_BLACKLIST",
+"TUNEABI_WHITELIST",
+]
+
+context_check_list = [
+"blacklist",
+"whitelist",
+"abort",
+]
+
+def processfile(fn):
+
+    print(f"processing file '{fn}'")
+    try:
+        fh, abs_path = tempfile.mkstemp()
+        modified = False
+        with os.fdopen(fh, 'w') as new_file:
+            with open(fn, "r") as old_file:
+                lineno = 0
+                for line in old_file:
+                    lineno += 1
+                    if not line or "BB_RENAMED_VARIABLE" in line:
+                        continue
+                    # Do the renames
+                    for old_name, new_name in renames.items():
+                        if old_name in line:
+                            line = line.replace(old_name, new_name)
+                            modified = True
+                    # Find removed names
+                    for removed_name in removed_list:
+                        if removed_name in line:
+                            print(f"{fn} needs further work at line {lineno} because {removed_name} has been deprecated")
+                    for check_word in context_check_list:
+                        if re.search(check_word, line, re.IGNORECASE):
+                            print(f"{fn} needs further work at line {lineno} since it contains {check_word}")
+                    new_file.write(line)
+            if modified:
+                print(f"*** Modified file '{fn}'")
+                shutil.copymode(fn, abs_path)
+                os.remove(fn)
+                shutil.move(abs_path, fn)
+    except UnicodeDecodeError:
+        pass
+
+ourname = os.path.basename(sys.argv[0])
+ourversion = "0.1"
+
+if os.path.isfile(sys.argv[1]):
+    processfile(sys.argv[1])
+    sys.exit(0)
+
+for targetdir in sys.argv[1:]:
+    print("processing directory '%s'" % targetdir)
+    for root, dirs, files in os.walk(targetdir):
+        for name in files:
+            if name == ourname:
+                continue
+            fn = os.path.join(root, name)
+            if os.path.islink(fn):
+                continue
+            if "ChangeLog" in fn or "/.git/" in fn or fn.endswith(".html") or fn.endswith(".patch") or fn.endswith(".m4") or fn.endswith(".diff") or fn.endswith(".orig"):
+                continue
+            processfile(fn)
+
+print("All files processed with version %s" % ourversion)
-- 
2.25.1


