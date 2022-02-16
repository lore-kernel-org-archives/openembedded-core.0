Return-Path: <Saul.Wold@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7BE30C433EF
	for <webhook@archiver.kernel.org>; Wed, 16 Feb 2022 19:11:27 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com
 [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.3533.1645038686100135454
 for <openembedded-core@lists.openembedded.org>;
 Wed, 16 Feb 2022 11:11:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=SBeONHZH;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.166.238,
 mailfrom: prvs=9046cebeea=saul.wold@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id
 21GIdmRh009018
	for <openembedded-core@lists.openembedded.org>;
 Wed, 16 Feb 2022 11:11:25 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to :
 subject : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=PPS06212021;
 bh=S/TMeorXfKtzkeQm4CwduQLIrp4NUdPZgsFsb5NHxfo=;
 b=SBeONHZHGG2fIRrnTqaLWDy7/c2pHEGEOecZ3Ur4OLXeRWmaY3n4e5PDP8tKxHJKJtkX
 t0s92FQtvBZrZ8LcnfgWiIRxWZakUfR7kbKDu+Il4ECQuVMsn2dQAulJLVucNLYRc7jl
 Rsg+Lucjfl2CoNkfS8HcciIWyeUndy3y2f4ycA0wAg5I9FemjUMli+9FXNILKAAqysAv
 jwQcqTVV5+pfid3mOm5e+IgxDLRb9AGx1y5HKcGKbOo/AOieJql3WGKiUY4J1hZbkEMa
 aE8wZ8nFGRGnqTU5tXs3aDn7l9kFT6Zc9IwccxfJhNpJurOHBiRsmnJhVszFqAkG1EkO Ag==
Received: from nam12-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam12lp2177.outbound.protection.outlook.com [104.47.55.177])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3e8nncrruk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
 Wed, 16 Feb 2022 11:11:25 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UpCrBDPcKFfo6zrGvIwlVeeewRyCymxrLCMBwemxbg2QzbNyt92QqoEjm8iZWDcHBP7AIV08b3I2Rjh3Kj9Q3WoZcDabqyhnqeyRAmCw+jTg+lJb3Ppym5PirKj90pobRZ8XQehWX2jrTFYvh0QRwSlqjZ1QhhoUp+rr9EZAJbDv0rjd/zRlLztMTk0SPlhOgXcpNCoifJ2KYf/yjfSehMKr0XsO8SvbiWd73xzIgVRVfGtdQ/KX/AiJnGxWGmEI4HgUmFVpL/IK3oEZGyDcF9YqzzToFI/NEMca4qEpwN+9oY0SAU3lPVx/mMISLqeDI4Wfwj3rOEnUs5sI/ZaaTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=S/TMeorXfKtzkeQm4CwduQLIrp4NUdPZgsFsb5NHxfo=;
 b=DpgxveOYHTcv4TWLkqe6Ot6iN3oJvbqwMnsYi4eUWTWHA7XpOHj7GUP32o6fl5DtWvhD5l08quHa5npvqjlNrNg19RhchFmRO7wGhkF16lScuF48g52ZGLoRgzlUMrp3m/cPGgXEW6aDBX3LtYWd6xSlTPUsNnOvbTGDoqf7dxKmDhjnm/Kulj3/OjjpEMtj2gIn+rHf2+y7In8AIYEdgKqPtpHPSYznh07JAbBmDHn5lDRD6UyG0x8OgToKcbGgMRQRJsmLoiI87U84sWL0iTSZVqsSB0uwFF8NpOj1uY5iV3KVpCxyn1G+8kyXyjZTWQfDK+eV3ZFy28iZJk8kNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Received: from CO1PR11MB5076.namprd11.prod.outlook.com (2603:10b6:303:90::7)
 by BN9PR11MB5482.namprd11.prod.outlook.com (2603:10b6:408:103::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4975.15; Wed, 16 Feb
 2022 19:11:22 +0000
Received: from CO1PR11MB5076.namprd11.prod.outlook.com
 ([fe80::3dab:fd3e:8d8:4e36]) by CO1PR11MB5076.namprd11.prod.outlook.com
 ([fe80::3dab:fd3e:8d8:4e36%6]) with mapi id 15.20.4995.016; Wed, 16 Feb 2022
 19:11:22 +0000
From: Saul Wold <saul.wold@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [WIP] descriptive_rename: Script for Inclusive Language variable
 renames
Date: Wed, 16 Feb 2022 11:10:44 -0800
Message-Id: <20220216191044.425781-1-saul.wold@windriver.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MW4PR04CA0060.namprd04.prod.outlook.com
 (2603:10b6:303:6a::35) To CO1PR11MB5076.namprd11.prod.outlook.com
 (2603:10b6:303:90::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 218a8de3-1651-4150-2b3d-08d9f1801e63
X-MS-TrafficTypeDiagnostic: BN9PR11MB5482:EE_
X-Microsoft-Antispam-PRVS: 
	<BN9PR11MB5482B0E6A92847DC4A7321EAEE359@BN9PR11MB5482.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4125;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	YDE1ArWr22yQQieDrs24uQKfihTEDhj5FG1gPFd1ZmHpWiLcxXTgxmwnQfYHWq8e2DTWwuHZgeLnNyFVehBeWu1GG09ahWYP3ZoGl0FhC+8Q74k7JluH9bTeM1UEJP9ki1g4/IJduZKlMFKSAaYN1gUIWvUKD1ibN/op5z6yOW1toS+3hz2L2hTQnbg4VfLqWaeLY3Lb5ni8SyXijEdp7v7NuF+lZmkMipP3KRgxyOI030Is//rNf8qnF7UYRG7kHaEYFu/VSpMiyzC0pYrwsrVqx8U8qJlsQbkwtVlPwkjQJwxBkaiVXQYvKRrWLnfBZ/5rntlqSQolkxTBWa0tz5EdtYqL4GjfIyltMLbZL4Fbxw8bysGsrBLorbv+arsQff7lkjDYOEUhw97ttvc/emEhVHL+Rvm+/Sg7JvLffh/Misg1t2hHr5BMH/LqAjnan1Wzg8QDkl8ymvEdXNakqLTYPivmRodAVM8a3DUirS1MwPTzwVWEcqkpifJ+Gm1Qw1XRru1NO9on50y6BwOXRayyV93AzLkXNIuMdcNVdcr0bvm1PsDFGQ472iTS/HuW1tAKc09LGU3GOJH17iOEfHwsBSr7q7nW+lK5mhQN/KTtKSBn+p44cSiyCKLrB9Lbsys9LvC15HECcTuq1rBo+9H5Jeip/IcZ7R18jsEcFr1RPqIwN6CplFLSrXpTh8+46zWXA58zFELt6bB6qa+RYw==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5076.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(6512007)(52116002)(86362001)(2616005)(44832011)(1076003)(6666004)(6506007)(508600001)(38100700002)(36756003)(2906002)(6486002)(38350700002)(83380400001)(186003)(26005)(316002)(66556008)(6916009)(8936002)(66946007)(66476007)(8676002)(5660300002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?ZwEWmgDo5YWjEbURnyvxvHSBvLKLN0tojUiqhxnE85wT1RvjGHXDYZloK9yj?=
 =?us-ascii?Q?i6NEizMpiHN4Wov+jCRw0qUPChNTGOzFQS1icBZ/N11JmuiAll7yYjZjD+xM?=
 =?us-ascii?Q?35r3m/639skhGWU2TNSxYc8E4NOrjGiCAZx6miOhbxKO0K5f/D83t7f8DEj4?=
 =?us-ascii?Q?n9GJ3rSUzPOtZSnuYNoTjwDTVP4MkBKXyvlTMGd3WacNA4hdq3xMV0ZKiPJw?=
 =?us-ascii?Q?QxXA8F5OtTntDWUbDIWQMJGrzA0vKgga6IcFZLGbCCWn9BduW8zeuiL2kowf?=
 =?us-ascii?Q?Yvqfit5TemNq/Fds88lNJeGh6nXs6mdgyxEB9S+Q2Fyx8z6yS/YIbg5hhcX/?=
 =?us-ascii?Q?NdHOT5TcLja0SIz6oM1tVCgUn8/sA2tIiHb69O8b5D3sepyc4nQQj0HmlGrs?=
 =?us-ascii?Q?XlGpcsooJx3S0RFdfJaknXyTp1mlMmygMaDU6J6n5ITnSG3u1oqczjujb3gf?=
 =?us-ascii?Q?//PVqVxWR+dYADt4BGLYOyruX5l3RSEJ0mM0aIbNWnzMo8ZYTJ5UoFei3L2s?=
 =?us-ascii?Q?9JOfHIvpRxi+NZU6qig/mC6oIhxjWsFq1VRb9TSaTHstPXK8CE8+tSNiET3z?=
 =?us-ascii?Q?6R0PuD8TCZlN6CG16u1+vaiFLNb+7seP7ErJWF8qmLhISOSmoCJTMZ+AbDoY?=
 =?us-ascii?Q?sKyGXKFJVVqe7brV185WoBP0Nm3HPEIf1SKcSbiPIA0YrTIspVwmAnPSMwkV?=
 =?us-ascii?Q?+I/KEBJ0lrNUeuMEYd7VQcVuHzmnQT3SMLGpKxf5wA+GM19MnvbK0I115ZVv?=
 =?us-ascii?Q?KVao3FhOOb+Zu4aIYtcbCVxjg+lcOPGdyPC5wGUsWX2l2thxiw99wl2WK8rz?=
 =?us-ascii?Q?fXaT51PdcDDmsq/RhzdbNJWWsfijtimheZTrVaVKK0ort+/rprv99NEz7laG?=
 =?us-ascii?Q?W0dJQB+qx5+4At6KgfnYzknpkQIGYW0vUO4SSQGRp4KLQaXuridSOui3zPvG?=
 =?us-ascii?Q?mnWFKwT/D+cnAC3b29nTvrUoc5lVsooHTR4f7nR1n6S7HSCEehdc4u6cOWfT?=
 =?us-ascii?Q?CRCAWYnGh4ir/M6jATzezBqtZ5EqKZrK01O5zI0VqTWWsmeAzK6kUBRphY4Y?=
 =?us-ascii?Q?KTKOlUJ1VZyv7RF9aoriflHRDrYIHAg3Ady0jDDa/WMMxDdB8Y+SJuepgnj/?=
 =?us-ascii?Q?Ow+zyVNRvMl7/XvpSF4emjgjhTRFQNNCif4L7IuzzrZaRAzZGA2SYsteqnMV?=
 =?us-ascii?Q?XZ154osB51qLjUWlSUncWYFGRW+EEIcUnf/wjcHqfCyYzNaGDZF51nYkSXTo?=
 =?us-ascii?Q?CsfjmMjyQRha3J+HSKRfIgk6/l2qtjXiH+D6hgg1J3uqy95CVpcrZTeT8ttO?=
 =?us-ascii?Q?xFIQpzSHks/TLeduIElWYf0BBw36TME09IiSEqrT/Lgr4S6JAeZE1puAK1iz?=
 =?us-ascii?Q?4ekqnGdeopuoa8wItYVBLUP5lSaM6h/0S7L1LWNi06pm+lCgr3gC5yjNNkHO?=
 =?us-ascii?Q?5Kt0/T00xM6csh/CiNSCyWgjna64nIeA6kgFUQXDuxs5lpuv/2RKAMN5RnX+?=
 =?us-ascii?Q?t2PoE2nPX6bRYODNquPwIFu1sUaL37jEB8zp7GwM2uyId8zOR2ei30LkhjzY?=
 =?us-ascii?Q?a7Q8H0K+hAjXu8wK42sw0lnIHhCh3l+6vnG4a8km7T4738fe8eDn6VtqhVAc?=
 =?us-ascii?Q?+pJFaltaiUJ+lIafNvn1J9M=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 218a8de3-1651-4150-2b3d-08d9f1801e63
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5076.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Feb 2022 19:11:22.0202
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 5jEdL44LaMQ8kzwCA8HDUHEUeoYPX5sAfdpNOUwAFrWKR+xZmEYoms34KiOlj7E0SIGxc/SJrYTyM/zILKL5RQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR11MB5482
X-Proofpoint-ORIG-GUID: Wp4ELSk7avF5RGPnFw9IVfKFeTEu3e9o
X-Proofpoint-GUID: Wp4ELSk7avF5RGPnFw9IVfKFeTEu3e9o
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-02-16_09,2022-02-16_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 impostorscore=0
 suspectscore=0 phishscore=0 spamscore=0 clxscore=1015 malwarescore=0
 priorityscore=1501 lowpriorityscore=0 mlxlogscore=999 bulkscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2202160108
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 16 Feb 2022 19:11:27 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161783

This script searches for a list of variable that have been renamed
and converts them to their more descriptive names. It also searches
for a list of variables that have been removed or deprecated and
prints a message.

It will print a message to inform the user that there are terms that
need to be updated in their files. Many of these changes are context
sensitive and may not be modified as they might be existing calls to
other libraries. This message is informational only.

I have tested this on poky and meta-openembedded so far.


Signed-off-by: Saul Wold <saul.wold@windriver.com>
---
 scripts/contrib/descriptive-rename.py | 113 ++++++++++++++++++++++++++
 1 file changed, 113 insertions(+)
 create mode 100755 scripts/contrib/descriptive-rename.py

diff --git a/scripts/contrib/descriptive-rename.py b/scripts/contrib/descriptive-rename.py
new file mode 100755
index 0000000000..f036328647
--- /dev/null
+++ b/scripts/contrib/descriptive-rename.py
@@ -0,0 +1,113 @@
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
+"basewhitelist":"basehash_ignore_vars",
+"taskwhitelist":"taskhash_ignore_tasks",
+}
+
+removed_list = [
+"BB_STAMP_WHITELIST",
+"BB_STAMP_POLICY",
+"ICECC_USER_CLASS_BL",
+"ICECC_USER_PACKAGE_BL",
+"ICECC_USER_PACKAGE_WL",
+"INHERIT_BLACKLIST",
+"WHITELIST_",
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
+            if "ChangeLog" in fn or "/.git/" in fn or fn.endswith(".html") or fn.endswith(".patch") or fn.endswith(".m4") or fn.endswith(".diff"):
+                continue
+            processfile(fn)
+
+print("All files processed with version %s" % ourversion)
-- 
2.25.1


