Return-Path: <Saul.Wold@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02BF9C433EF
	for <webhook@archiver.kernel.org>; Fri,  7 Jan 2022 21:25:06 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com
 [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web12.39.1641590705493466848
 for <openembedded-core@lists.openembedded.org>;
 Fri, 07 Jan 2022 13:25:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=lIol23D1;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.166.238,
 mailfrom: prvs=80063e4491=saul.wold@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id
 207L8hX4031554
	for <openembedded-core@lists.openembedded.org>;
 Fri, 7 Jan 2022 13:25:04 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version; s=PPS06212021;
 bh=eNp9o2iO8sAczHCnmvNTBLmQv1sOjLFNd1z21kldYqk=;
 b=lIol23D1GZ/mFU3O0dXZce8ODMJHpz3luI4eHH0dtfb5uO8mBjSi9bQ3BO/LxJVGW990
 eYFsoUyPdf//w93AGekChDGHhP2GqVcw2bPM7ubgtGN3I8xpR1P2aZjSPZfp8V2EqKjl
 DNTCrCbga6vNLohrAIQJy2trrH3CAeidzpGiG7Anq2D1GXchsO8ebFyQEO3DcdYiras3
 cBEQIiLJEgxY7t+LJBj6nSNQQ/6FfdScYfMnGdLVJ4Vi4NwOFhZWcA5/MVsjr6WB59qz
 NTfFmsHjcVc0t+ygKNGMdhsJXnT8uCiszzicvMSRaxwFssTtdJBpg8dxv2EskAzrC5CE TQ==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3de4wagwad-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
 Fri, 07 Jan 2022 13:25:04 -0800
Received: from m0250810.ppops.net (m0250810.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 207LP3Ov001096
	for <openembedded-core@lists.openembedded.org>;
 Fri, 7 Jan 2022 13:25:04 -0800
Received: from nam10-bn7-obe.outbound.protection.outlook.com
 (mail-bn7nam10lp2106.outbound.protection.outlook.com [104.47.70.106])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3de4wagwa5-4
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 07 Jan 2022 13:25:04 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=J5ZVs9/wnKmsir9YD8ZELNxPTqaQN06QFj6jH7/J87Y8/mATZ/0OrDOciu+28Om64XOc1gQUJlLZlfHrvk9Oo71DwHYTcB/575GCbBqNAGNcfFrdh+y3U3OigVv/qYphqF9hK9gFh5ncv97JZeuP/Oh/McO7R4Gbs7fvLLVAeXn5xNqOHl6n8KmB/nMORCIxtE93LYn0CYKeF5xzsyaMRgnS4D6GWfn4RtCEFu9U9wfpF5bk5MoF4TNGovFUsc+IBYNDJf0YXyJoS30Ubl1cItD/i6XNXw9yQYEkCbN4HGkrWsXbNtYAiCHzZRRGt+mkyfYOIrMjOviIt9kcoWPE5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eNp9o2iO8sAczHCnmvNTBLmQv1sOjLFNd1z21kldYqk=;
 b=XTc2NdPKJsgTUMR9YyqU3yR4l+FKEiKN6v7597zih2I70wFhhpLGGTLw1XuGFeEHZNeB5DwB4dVnN60RgofiU6nzwak+FwsR+xlcme/v9aQIuimd2KuI1k0h7bpQCeF5tjmn3NCC1N640SmsBnTa0CCIaWs7QAHocOTJWpesAS5oGj38YLT8Hmb3lJ5Wbaku4zKhyunda3q6bPj1OHzny+lpeGFIa5P9D58cM9iJQLuVfXtG81P0+kPd4egwtko/11noanlSgwpWWWEN8kYzIEEN1JidisEzZFB2AifzShwhcnyqMLbSAGY1Oxw6UKYLw+7Qmnirs09sMyPtbP/duw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO1PR11MB5076.namprd11.prod.outlook.com (2603:10b6:303:90::7)
 by MW3PR11MB4602.namprd11.prod.outlook.com (2603:10b6:303:52::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4867.11; Fri, 7 Jan
 2022 21:25:03 +0000
Received: from CO1PR11MB5076.namprd11.prod.outlook.com
 ([fe80::2027:9b43:472b:13ac]) by CO1PR11MB5076.namprd11.prod.outlook.com
 ([fe80::2027:9b43:472b:13ac%4]) with mapi id 15.20.4867.011; Fri, 7 Jan 2022
 21:25:02 +0000
From: Saul Wold <saul.wold@windriver.com>
To: openembedded-core@lists.openembedded.org, JPEWhacker@gmail.com,
        bruce.ashfield@gmail.com
Cc: Saul Wold <saul.wold@windriver.com>
Subject: [RFC PATCH 3/3] package: Add support for kernel stripping
Date: Fri,  7 Jan 2022 13:24:46 -0800
Message-Id: <20220107212446.132386-4-saul.wold@windriver.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220107212446.132386-1-saul.wold@windriver.com>
References: <20220107212446.132386-1-saul.wold@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY5PR13CA0025.namprd13.prod.outlook.com
 (2603:10b6:a03:180::38) To CO1PR11MB5076.namprd11.prod.outlook.com
 (2603:10b6:303:90::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 705f27f7-b33b-4bfc-1da7-08d9d2242a48
X-MS-TrafficTypeDiagnostic: MW3PR11MB4602:EE_
X-Microsoft-Antispam-PRVS: 
	<MW3PR11MB4602571EAEC2BD3E5676D961EE4D9@MW3PR11MB4602.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1923;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	NjSmz45wjokxt0FSyYmAat+IxAjfAnTA9oFXOCEosf3edICCrcQ+Bx/wbRe1oT0gFGlHqBvoW8y5oXKrjqfyTDLH7nGTpeiXbTlvKW1em/O+oYIbm0i6LwCctzTjFhbMT1DrsOg5hIKYOt+U4K/zcZL3BxEXf71BySYk09J6z0LRk6WTJe+iuXZF56n3ZjG1oQ1HuyxwwEi3kPAt5KlLYibQXXkHoSP36xwxjA7c9Mxx80H/Iq1i5PoA5/5hZRAn33UjsIlvKhaZV7sfz8R+PliWuWpHvX+pCvTxT5whGEv26zW5otfsJuTMFtnSqjjzGB6rcgy2s4V5Cg067tiOqcp6pkpikiaw8jSWIX0bWnzFF84M2/PZQqxK6oPkWa2dJEcOt/WNhadG5OK/1pvr6DLqswWtqn/92/5au4wkRPukFTcVxQzPo8UwVcaF6atmD0hKsMTL5nxVEDLGh9S5A33uDH9O80m+rLmxModpI0iIo5ttgcBf6sxzVXVKT58ec6cNpd6T71KPUn3VZ50MbbvP0Dd7x1QmzC5XKm21zwPEmvMnFb7FIFP5puNgP8QE3V5WiQFmoPU8CVWH93IG6qWztcVrNlD0nT1nvySywSU/MfY6m8xuJLH6ml8e9hhaWbUlIJpisvhKXp8AMRUFhMT7Wd3+fh6IC+tzSOdzNUCFFcccRIS6SzOfgGFWYtjbkNlRFwUxUpw3ofxaWcwpsvUwbAcxd9QCGnRdapgygG8=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5076.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(66476007)(44832011)(66556008)(1076003)(66946007)(508600001)(6666004)(6486002)(8676002)(5660300002)(26005)(6512007)(36756003)(186003)(6506007)(4326008)(38350700002)(52116002)(316002)(83380400001)(86362001)(2616005)(2906002)(107886003)(38100700002)(8936002)(168613001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?kLgB9Ydvvvtv6nHc8U4lhh1EYaIlm7DDvcDTMgjTiaJSUtKtIrEVyk9n3e7w?=
 =?us-ascii?Q?k/iWrWyozCIxgeJnF8Pq+o78mgFEsK9UrIWOLZcU3/7VKrlaqqX1nqvjeTam?=
 =?us-ascii?Q?66MjnB3AYuAt3q190zIO8lFpf3+3nzSLXmYVMHOhHYWcCQxpv/gRpvbCEDxB?=
 =?us-ascii?Q?86lyn2MUujPC1JJVEunVFT8okPF2zJyDdwBxg6khpEYZZ91jMq1IDTkXDXbs?=
 =?us-ascii?Q?DS/uCnfGKrkQ/MpJ3nLcfZBcmoy9EZAdo+MMBeLGCCkyToiZrS1SDKELk2/M?=
 =?us-ascii?Q?oft+B7klhgvyHUkYDY5yaefTN21j864FyRTGdBrQV6FTPBV0yHYMb1EsxSg8?=
 =?us-ascii?Q?VOLOpJ8NfCCv9SQKk9Hy+9RTvQTBkD+hHoj9nxlEsgaHrZreABYeRFvKLqap?=
 =?us-ascii?Q?W5hUNo/bXtSAC7zbGvwPJ5UHgJ2JrsKeajHUXTW/7y4SdqvSewtnRboj8F7e?=
 =?us-ascii?Q?T8lNylzjGfEiuf8YjIlogqoxy/B1rcgjSem9U804ZlTmoM9CX+obP1iF24bZ?=
 =?us-ascii?Q?sERfWWGqyYOoG5D97CUSf9f93BlGfI47yzZSP/qA0kymTUGYyodmZE6/jGYn?=
 =?us-ascii?Q?9eLZ1EcoJ0MWK90U0OgDhYNBcgZlostElPlnoE/Beop1sWgfD+cMS/8phZXk?=
 =?us-ascii?Q?zRzZiWJ/fCceWb498b9h/RBMsDxOxxPVAYI7Hyyw7ZSDMG04dzREuQHOEnBu?=
 =?us-ascii?Q?Fv4a1q/c1C6LNWsqvHL1Ev6GF6pRwAEmSCIOXho72BA1jpOLA+qd6j7U1XFa?=
 =?us-ascii?Q?vnDE/erBKXT71rziUvuQEyP2GoZyN+V/Ezpp1YWxlTcp7BOcRN0tJk6fqc+t?=
 =?us-ascii?Q?5mLTU18dLg7L6+bDZWSEm8KGQn46OoVThFWVCbuxZjrENdHG78YzXEeDPfMA?=
 =?us-ascii?Q?R6FyGVRzCf2p7lY/KtJulhKVKdbjHTjj+n7n0iV+nON3n7GbdTUXdyZtcMRR?=
 =?us-ascii?Q?1fW8iE63ovOHJtdh0WfQJRT1bhUUVWMbgj+e2L4SKozV11N8MlUl7hUVl0sO?=
 =?us-ascii?Q?RHduSYUl8jxFY6pJcqLTQXIKZcENBFFCaL0VhuMdfVTx2qKldrYEc3A8SEaI?=
 =?us-ascii?Q?SejBr1pNdeKy1G1dyBtzOwrn2HQPFM7qmiPx8m+eXGfEercAnA1+duArM05R?=
 =?us-ascii?Q?mjv6popMZ7dz+yosc3zwQpmZVImSHjts/k0uSvq4UpDZwOxywtSHJjw9SFBs?=
 =?us-ascii?Q?dRWyQ4dG8HHIMSN5ug1hZJZXFZvpgJiPB91At+r7Msc/+rdU4/qpUhy12wKE?=
 =?us-ascii?Q?vtTAkZMTzq7NHRmxbBiwuGJG/2wGUUPAjJKI+39fkQAE5PMaFNtCmsMdKeia?=
 =?us-ascii?Q?hpB0Pg3pxdocRatjms2GAiuAUxgGCRbvsKfPh6hf8jW7WfnkImymIFffAo7y?=
 =?us-ascii?Q?YslAmY7X70Ye6VEOa1EA2Vansy/AN9+bWkXq3PHTH/dBYaqGu2ywhKgt+H7+?=
 =?us-ascii?Q?C+Cd4+IwINWUoXCWUKEogWElFWB164mTDpV0ia/43R0LxcogMR7Ic0D66Ux1?=
 =?us-ascii?Q?ct1jZXY/6A/VYylzr+pPXsXe9W488ecudxl+JaWO/BbP5gYhqSfSrD/3///7?=
 =?us-ascii?Q?xZ+LKKMxaVJbkZY44iRPqLpuWT0IqItXRPuSjOUHnZdJX1syBK/96RomOp0N?=
 =?us-ascii?Q?khre2gJxOS3Pzg5nQWbM0Gs=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 705f27f7-b33b-4bfc-1da7-08d9d2242a48
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5076.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jan 2022 21:25:02.0441
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 dFEkbnte8Ls6s4WPutPGp4qivXjtfc6PjcHxoh8jsnDC4JktwjmK5eXu6n6zTDU1YayhtVi5swDQImpxga5Rpg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4602
X-Proofpoint-ORIG-GUID: yQwB46J6HZOtmoT7qQIVRIos9IRlBTyQ
X-Proofpoint-GUID: OYbTLXUZ2e2VyIlLadx9Yvb16bvNu8eh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-07_09,2022-01-07_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0
 mlxlogscore=999 priorityscore=1501 impostorscore=0 bulkscore=0
 lowpriorityscore=0 adultscore=0 mlxscore=0 phishscore=0 clxscore=1015
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2201070128
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 07 Jan 2022 21:25:05 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160267

This moves the KERNEL_IMAGE_STRIP_EXTRA_SECTIONS from kernel.bbclass
to the split_and_strip_files() flow. Since the multiprocess_launch is
used here the variable needs to be passed as an argument.

Since is_elf() understands kernel modules there is no need to keep a
seperate list for kernmodules or hardcode the values to runstrip.

Signed-off-by: Saul Wold <saul.wold@windriver.com>
---
 meta/classes/package.bbclass | 23 ++++++++++++-----------
 meta/lib/oe/package.py       |  7 +++++--
 2 files changed, 17 insertions(+), 13 deletions(-)

diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
index 09cd376f4af..2f6863be7ac 100644
--- a/meta/classes/package.bbclass
+++ b/meta/classes/package.bbclass
@@ -1122,7 +1122,6 @@ python split_and_strip_files () {
     #
     elffiles = {}
     symlinks = {}
-    kernmods = []
     staticlibs = []
     inodes = {}
     libdir = os.path.abspath(dvar + os.sep + d.getVar("libdir"))
@@ -1145,9 +1144,6 @@ python split_and_strip_files () {
                 if file in skipfiles:
                     continue
 
-                if file.endswith(".ko") and file.find("/lib/modules/") != -1:
-                    kernmods.append(file)
-                    continue
                 if oe.package.is_static_lib(file):
                     staticlibs.append(file)
                     continue
@@ -1164,8 +1160,11 @@ python split_and_strip_files () {
                 if not s:
                     continue
                 # Check its an executable
-                if (s[stat.ST_MODE] & stat.S_IXUSR) or (s[stat.ST_MODE] & stat.S_IXGRP) or (s[stat.ST_MODE] & stat.S_IXOTH) \
-                        or ((file.startswith(libdir) or file.startswith(baselibdir)) and (".so" in f or ".node" in f)):
+                if (s[stat.ST_MODE] & stat.S_IXUSR) or (s[stat.ST_MODE] & stat.S_IXGRP) \
+                        or (s[stat.ST_MODE] & stat.S_IXOTH) \
+                        or ((file.startswith(libdir) or file.startswith(baselibdir)) \
+                        and (".so" in f or ".node" in f)) \
+                        or (f.startswith('vmlinux') or ".ko" in f):
 
                     if cpath.islink(file):
                         checkelflinks[file] = ltarget
@@ -1310,13 +1309,15 @@ python split_and_strip_files () {
         sfiles = []
         for file in elffiles:
             elf_file = int(elffiles[file])
-            #bb.note("Strip %s" % file)
-            sfiles.append((file, elf_file, strip))
-        for f in kernmods:
-            sfiles.append((f, 16, strip))
+            bb.note("Strip %s" % file)
+            extra_sections = d.getVar('KERNEL_IMAGE_STRIP_EXTRA_SECTIONS')
+            if (extra_sections is not None and file.find('boot/vmlinux')):
+                sfiles.append((file, elf_file, strip, extra_sections))
+            else:
+                sfiles.append((file, elf_file, strip, ''))
         if (d.getVar('PACKAGE_STRIP_STATIC') == '1' or d.getVar('PACKAGE_DEBUG_STATIC_SPLIT') == '1'):
             for f in staticlibs:
-                sfiles.append((f, 16, strip))
+                sfiles.append((f, 16, strip, ''))
 
         oe.utils.multiprocess_launch(oe.package.runstrip, sfiles, d)
 
diff --git a/meta/lib/oe/package.py b/meta/lib/oe/package.py
index dd700cbb0c9..47bc85a4266 100644
--- a/meta/lib/oe/package.py
+++ b/meta/lib/oe/package.py
@@ -16,7 +16,7 @@ def runstrip(arg):
     # 8 - shared library
     # 16 - kernel module
 
-    (file, elftype, strip) = arg
+    (file, elftype, strip, extra_strip_sections) = arg
 
     newmode = None
     if not os.access(file, os.W_OK) or os.access(file, os.R_OK):
@@ -40,6 +40,9 @@ def runstrip(arg):
     # shared or executable:
     elif elftype & 8 or elftype & 4:
         stripcmd.extend(["--remove-section=.comment", "--remove-section=.note"])
+        if "boot/vmlinux" in file and extra_strip_sections != '':
+            for section in extra_strip_sections.split():
+                stripcmd.extend(["--remove-section=" + section])
 
     stripcmd.append(file)
     bb.debug(1, "runstrip: %s" % stripcmd)
@@ -172,7 +175,7 @@ def strip_execs(pn, dstdir, strip_cmd, libdir, base_libdir, d, qa_already_stripp
     sfiles = []
     for file in elffiles:
         elf_file = int(elffiles[file])
-        sfiles.append((file, elf_file, strip_cmd))
+        sfiles.append((file, elf_file, strip_cmd, ''))
 
     oe.utils.multiprocess_launch(runstrip, sfiles, d)
 
-- 
2.31.1


