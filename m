Return-Path: <hongxu.jia@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73A0DC71135
	for <webhook@archiver.kernel.org>; Mon, 16 Jun 2025 08:12:52 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.25468.1750061567883240603
 for <openembedded-core@lists.openembedded.org>;
 Mon, 16 Jun 2025 01:12:47 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=82628a79e0=hongxu.jia@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55G51q5C002814
	for <openembedded-core@lists.openembedded.org>; Mon, 16 Jun 2025 01:12:47 -0700
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4794c3sen2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 16 Jun 2025 01:12:47 -0700 (PDT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.43; Mon, 16 Jun 2025 01:12:46 -0700
Received: from pek-lpg-core5.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.57 via Frontend Transport; Mon, 16 Jun 2025 01:12:45 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH] scripts/wic: fix calling wic ls|cp|rm|write hung in bitbake task
Date: Mon, 16 Jun 2025 16:12:45 +0800
Message-ID: <20250616081245.1565935-1-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: I1Z2SL3HDDC4fBfs3SGvPEqFQYrlXJLo
X-Authority-Analysis: v=2.4 cv=b9Gy4sGx c=1 sm=1 tr=0 ts=684fd1ff cx=c_pps a=K4BcnWQioVPsTJd46EJO2w==:117 a=K4BcnWQioVPsTJd46EJO2w==:17 a=6IFa9wvqVegA:10 a=NEAV23lmAAAA:8 a=t7CeM3EgAAAA:8 a=CZXMRsi8dIlG5Bd59bsA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: I1Z2SL3HDDC4fBfs3SGvPEqFQYrlXJLo
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjE2MDA1MyBTYWx0ZWRfXwwRK4/01sfQ3 DUtaDh1Z0GN+kSKJgrHO62g6Qdc8I8tEKaai5y/la1pHwU6W9irFZ8iWw3mzMpNMY2h1zAYkGMZ aEcRb8lzN+hHjK2jKb4qunR+39GCwF3/VuFqnlHaR+mJEMVwVI2yK5d/cjIe2yfiS/FTlpZZ5XT
 IaYwPFkMgaJEODJerkZEoVEs1Pj0tjZpk2/hHCFDnDRI9FFf5vB7LQbhoqSuhd0C7SPvPmUZs7U YHLWjeNTbxnKYYiDqWQwH/F4zRQ5ejWOx4hNy0z0d7FslNxYRdOJSZACu/1Rq0BA61PFkdVYIBe uaWx1iM16dQAlFZua5fUUUGUYT6wDa7yvfKqOqCKJPXDBvlf/SFvqlpTscxG/uZKByz+Zq4esHH
 ib40aKDkpH364pFkTN+faqZ9WkitqOqYZ5E8FU42kgdn93EDrSpEFVzX78OFvwlA4/PDOXj5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-16_03,2025-06-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 suspectscore=0
 spamscore=0 clxscore=1015 impostorscore=0 malwarescore=0
 priorityscore=1501 lowpriorityscore=0 bulkscore=0 phishscore=0
 mlxlogscore=999 adultscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.21.0-2505280000 definitions=main-2506160053
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 16 Jun 2025 08:12:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218772

While calling wic ls/cp/rm/write in bitbake task along with do_image_wic,
it hung without return.

Due to commit [2255f28b57 wic: add WIC_SECTOR_SIZE variable][1] applied,
It calls get_bitbake_var in `wic ls|cp|rm|write' to define sector size.
By default, get_bitbake_var starts a `bitbake -e' to get variables which
triggers nested bitbake in this situation

Refer `wic create', adds option --vars and --image-name to support to
read bitbake variables from <image>.env files

NOTE: This commit does not add -e for `wic write' to avoid confliction
with existed option -e/--expand

[1] https://github.com/openembedded/openembedded-core/commit/2255f28b579bc5db4138bcacbb829661ae0ee721

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 scripts/wic | 49 +++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 49 insertions(+)

diff --git a/scripts/wic b/scripts/wic
index 06e0b48db07..9137208f5e8 100755
--- a/scripts/wic
+++ b/scripts/wic
@@ -237,6 +237,13 @@ def wic_ls_subcommand(args, usage_str):
     Command-line handling for list content of images.
     The real work is done by engine.wic_ls()
     """
+
+    if args.image_name:
+        BB_VARS.default_image = args.image_name
+
+    if args.vars_dir:
+        BB_VARS.vars_dir = args.vars_dir
+
     engine.wic_ls(args, args.native_sysroot)
 
 def wic_cp_subcommand(args, usage_str):
@@ -244,6 +251,12 @@ def wic_cp_subcommand(args, usage_str):
     Command-line handling for copying files/dirs to images.
     The real work is done by engine.wic_cp()
     """
+    if args.image_name:
+        BB_VARS.default_image = args.image_name
+
+    if args.vars_dir:
+        BB_VARS.vars_dir = args.vars_dir
+
     engine.wic_cp(args, args.native_sysroot)
 
 def wic_rm_subcommand(args, usage_str):
@@ -251,6 +264,12 @@ def wic_rm_subcommand(args, usage_str):
     Command-line handling for removing files/dirs from images.
     The real work is done by engine.wic_rm()
     """
+    if args.image_name:
+        BB_VARS.default_image = args.image_name
+
+    if args.vars_dir:
+        BB_VARS.vars_dir = args.vars_dir
+
     engine.wic_rm(args, args.native_sysroot)
 
 def wic_write_subcommand(args, usage_str):
@@ -258,6 +277,12 @@ def wic_write_subcommand(args, usage_str):
     Command-line handling for writing images.
     The real work is done by engine.wic_write()
     """
+    if args.image_name:
+        BB_VARS.default_image = args.image_name
+
+    if args.vars_dir:
+        BB_VARS.vars_dir = args.vars_dir
+
     engine.wic_write(args, args.native_sysroot)
 
 def wic_help_subcommand(args, usage_str):
@@ -390,6 +415,12 @@ def wic_init_parser_ls(subparser):
                         help="image spec: <image>[:<vfat partition>[<path>]]")
     subparser.add_argument("-n", "--native-sysroot",
                         help="path to the native sysroot containing the tools")
+    subparser.add_argument("-e", "--image-name", dest="image_name",
+                      help="name of the image to use the artifacts from "
+                           "e.g. core-image-sato")
+    subparser.add_argument("-v", "--vars", dest='vars_dir',
+                      help="directory with <image>.env files that store "
+                           "bitbake variables")
 
 def imgpathtype(arg):
     img = imgtype(arg)
@@ -404,6 +435,12 @@ def wic_init_parser_cp(subparser):
                         help="image spec: <image>:<vfat partition>[<path>] or <file>")
     subparser.add_argument("-n", "--native-sysroot",
                         help="path to the native sysroot containing the tools")
+    subparser.add_argument("-e", "--image-name", dest="image_name",
+                      help="name of the image to use the artifacts from "
+                           "e.g. core-image-sato")
+    subparser.add_argument("-v", "--vars", dest='vars_dir',
+                      help="directory with <image>.env files that store "
+                           "bitbake variables")
 
 def wic_init_parser_rm(subparser):
     subparser.add_argument("path", type=imgpathtype,
@@ -413,6 +450,12 @@ def wic_init_parser_rm(subparser):
     subparser.add_argument("-r", dest="recursive_delete", action="store_true", default=False,
                         help="remove directories and their contents recursively, "
                         " this only applies to ext* partition")
+    subparser.add_argument("-e", "--image-name", dest="image_name",
+                      help="name of the image to use the artifacts from "
+                           "e.g. core-image-sato")
+    subparser.add_argument("-v", "--vars", dest='vars_dir',
+                      help="directory with <image>.env files that store "
+                           "bitbake variables")
 
 def expandtype(rules):
     """
@@ -454,6 +497,12 @@ def wic_init_parser_write(subparser):
                         help="expand rules: auto or <partition>:<size>[,<partition>:<size>]")
     subparser.add_argument("-n", "--native-sysroot",
                         help="path to the native sysroot containing the tools")
+    subparser.add_argument("--image-name", dest="image_name",
+                      help="name of the image to use the artifacts from "
+                           "e.g. core-image-sato")
+    subparser.add_argument("-v", "--vars", dest='vars_dir',
+                      help="directory with <image>.env files that store "
+                           "bitbake variables")
 
 def wic_init_parser_help(subparser):
     helpparsers = subparser.add_subparsers(dest='help_topic', help=hlp.wic_usage)
-- 
2.34.1


