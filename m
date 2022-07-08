Return-Path: <akash.hadke@kpit.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E504C43334
	for <webhook@archiver.kernel.org>; Fri,  8 Jul 2022 11:49:55 +0000 (UTC)
Received: from IND01-MAX-obe.outbound.protection.outlook.com
 (IND01-MAX-obe.outbound.protection.outlook.com [40.107.222.61])
 by mx.groups.io with SMTP id smtpd.web08.6561.1657280986983867522
 for <openembedded-core@lists.openembedded.org>;
 Fri, 08 Jul 2022 04:49:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kpit.com header.s=selector1 header.b=gA/bCOXb;
 spf=pass (domain: kpit.com, ip: 40.107.222.61,
 mailfrom: akash.hadke@kpit.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EtexNm2+j790HxZsYSYzpzUs40Ip3a/xs2k8inf2qmMkJNVFP0vxNJcRPiZrR9yvepi0FrEx6HkhT2wYRgWCvx208M2KoxmfRhRqFvzyOMG9fgoxS2Thzo6WpoVeTx+S9ZIctRVtFNWDSi6zUmEJWNGjfliHX/SUyfQ7lLUUi9kdyt4TPgo0tLELzdrV/NGzNX+sMd3g81m2X76kl2l8UfX0Zkbzx6rp0b/T54orF/glvrytMrvc7gbD2n0Dv5jFKiFGw1o6yJ/aowCW0AQlJODNNy3Wzt7EKlpIDgyF9fHdZzzyKC9QNzDxSxuxR+2qK+xWhQnyrYKx5azqIIkmhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=D3EOcpLXVKNpyyLsPI9KCvh92fLuBr9Atg7G+F9Pm3A=;
 b=hzpii5PqJqc72MumQm7XDwnm6Ql9MEGXd8brgHDHCZDA9lWtZWdh7s3+1+5pAn182z6V7mhF0I/UhkIWSHsumqnAcF5jsrzwvLBzA3TfAkdjEZX4+BYu26RmjHepz8gwZ/brDtTzo0CnhkriYsewU+LEl8GwpEl+L7SamevCJ8qbQS++ZGj1dBRk1xoD9ujeYtxjocrWRVnZzcnKV1kTyBocxHak8dvROIPBadreFkhWGYQIVhYzHaMbpXeHoJ5aX+IQTKvV2BEPOzPiNkuamaWXwpEVO4H4y2O46gF/1C9Ih1FyzTV0ZV0ZkzZx4Y4or0EWzVC7t7Z69Lwa7dJCpA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=kpit.com; dmarc=pass action=none header.from=kpit.com;
 dkim=pass header.d=kpit.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kpit.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D3EOcpLXVKNpyyLsPI9KCvh92fLuBr9Atg7G+F9Pm3A=;
 b=gA/bCOXb7Wdj9rb6a81KCSDSN15cc1zpGgm5CSLNs4IV+QeaMvtnTlVlIbweXOd6imr/vBF1Kum7FVVk0lgyNGKKCJe382BDFNTskn31/8gAIA16r5w0uGtnxx5hxH4hN7HbbUa8tR02zEp0y+y5iUP9VRIge1ZrlmFTVute04o=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=kpit.com;
Received: from PN3PR01MB6712.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:89::13)
 by MA1PR01MB0620.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a00:8::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.19; Fri, 8 Jul
 2022 11:49:41 +0000
Received: from PN3PR01MB6712.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::57:e269:a77f:d5d9]) by PN3PR01MB6712.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::57:e269:a77f:d5d9%4]) with mapi id 15.20.5417.016; Fri, 8 Jul 2022
 11:49:41 +0000
From: Akash Hadke <akash.hadke@kpit.com>
To: openembedded-core@lists.openembedded.org
Cc: ranjitsinh.rathod@kpit.com,
	Joshua Watt <JPEWhacker@gmail.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [poky][dunfell][PATCH] classes/cve-check: Move get_patches_cves to
 library
Date: Fri,  8 Jul 2022 13:47:36 +0200
Message-Id: <20220708114736.5547-1-akash.hadke@kpit.com>
X-Mailer: git-send-email 2.17.1
Content-Type: text/plain
X-ClientProxiedBy: AM6P194CA0085.EURP194.PROD.OUTLOOK.COM
 (2603:10a6:209:8f::26) To PN3PR01MB6712.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:89::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5d3bbb70-e729-452e-a1cc-08da60d7f13c
X-MS-TrafficTypeDiagnostic: MA1PR01MB0620:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	LITZqKCqRLLdDz0yvuXFkYeSZhPxX4vMQlb0OPiSjTZ35hz2V/lSD+rOwe6YkzUA33UIF8xD1PuMDod3r6ju/bh3LHjzihrrimUYkjDlPA6V7xWA7P4tpDQ7O+tddINvMnvOrlOVvBnyh6yqyHAPXJJJBEOuZNz9h9QZS1tYznIheN6uU+XHsYhTdikO5fjk4P8KT7IR89pvDcBHdt+H+Sag3NALDc+RDrIj2xF3eleAe4yWr2NSHMSQeAljXi/jRBO8Drm9mWh0Ms6xO++M/3FFRfIFCNFGBfntAyDC89aiqDP6wVeJMEzqE2Em6wM4BnR3Pi6jh7U9la3Qg06i0iq98mVF7TaMUN68PuX0wJN4glJ86ZrShDeFN19WOxFhuVCkyUS7vRKhr2nH08lQWJhAhsVqJPaDYHzXi0N0n7EviCG2/kMNK8bbVXW4coyNVlP1reobaa/pvd6psTUOtAwlRpZqTjqBJfmRGKU3w8sZJo78wcDFTiDf10sb9ubTryFzMpwFt/d8awbFASVhM+jmbRWjvvJMRO0+VEG3jMZ8xukmvdDoabp9mAISD6dUGk5sKm6J5q7Q2NQkXc2nY998YAoHWdnoSSZTizCYf8ohujdnOwIJ6uxQO4zOUrxqOvUF9esi3eN1F6tT9z79HKOSHlWwSN0eXfyLG80rsVi4WXQ9F/hiJerpzNe7eFkM2ep8sJzZesLbYrqdUr2ZLfgF5KeWXiO5tl2mf+lTpZfcELP5+KCQVSxjZTuJ4JNcYDN8QcsHE5PAy/8Qi+npNXGGmAh4rRizVjAfeIMpHMp6bFO1jdKnuCn045va2jIw
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN3PR01MB6712.INDPRD01.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230016)(4636009)(396003)(39860400002)(346002)(376002)(136003)(366004)(38350700002)(83380400001)(5660300002)(316002)(1076003)(36756003)(2616005)(66556008)(38100700002)(478600001)(6486002)(8676002)(186003)(54906003)(2906002)(6666004)(4326008)(6512007)(66476007)(52116002)(6506007)(8936002)(41300700001)(44832011)(6916009)(26005)(66946007)(86362001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?kNphd2cgVzDIzJPuLernP/hbak34Jjgjv3wkcktrjXz2XfJ5t/NsirA4Qq8q?=
 =?us-ascii?Q?n3JxuxWC1V+EllIgxvpoUYmHHz6caOaGilVyBaxYudjD6Y61CdfiJF4ueJ5K?=
 =?us-ascii?Q?wzpKpQcnId8am9XFYV9ugIaJ6/K2cl1ZXeejzpdFv3coXr5S/906CrMFVj3a?=
 =?us-ascii?Q?1EkdAHcohM7Y5sDpi2JU4DCObi3RXbSA6bFYwuyF/sK5fZNZWTivPsfP7gsY?=
 =?us-ascii?Q?hEWzj4kRbtoOy9Z8g29NYh482ox25sdjVkDbr8qePy2ma8UIeWw1o1veBByA?=
 =?us-ascii?Q?winPGcvut5VR83c8LfRCoECwO2wBqLIf98kw45mO07vgDgLo1lu/E/20j1/v?=
 =?us-ascii?Q?BxHtd6G/ZH2AuzSQTedoqSq/veUqqE2ZVQjDZ4P6VhZGGLeafAtfPm5E3Fxl?=
 =?us-ascii?Q?9lq3teKf+w/vGeKg6rzQ8zMTXGg2JPx+EZrvwFOrgHD9e1/yWvTPA4J26mVW?=
 =?us-ascii?Q?sYf5l/2kVF0uyix9ddRHygBfaKe5CMBZHtbjIKwkxy004auWYfaopBtsIQnd?=
 =?us-ascii?Q?ms/9YDT5cs42sJDp9IQEmiGlDLfDn5CL9G69iXF0+AhD/ukCr9dOV2Xtytwo?=
 =?us-ascii?Q?sppAmvAatO+2h3NSaOsknagLiAbAYmmYGtpUxYBRyyUMezto0vYSk0VryxJ2?=
 =?us-ascii?Q?6i1oIgrZmCrdc0qm5FQZn/aDY4PvzWgilqAFbxRmdZ+kDX/9yf4movBkB7uM?=
 =?us-ascii?Q?78ZcuVcp3C5gLE8aSArA8aOy7OA3gqrDqFLRTIwIfR4SfgIOdwJbevFk30gM?=
 =?us-ascii?Q?AEWJGKUHxeNY+wNnUw24ZrKgufTRn+73WJ+VlS++Lf0uDbhBVth6QBomBCJS?=
 =?us-ascii?Q?o+aZQNhgoaR5bSRKXJHd3x3XNihOGRrjKsp+ZtIEK2wxYxQHaEZVijMCnhy0?=
 =?us-ascii?Q?GPLbrbK9Mv4X4eYPAL74/B6Y6PJgaSEX4O05Zc5HUkYuS+nd7MlD4IxuuA+y?=
 =?us-ascii?Q?TuahwrbUYFW18cRsActT5oTQplpqrkfU3LV+McwUdB7E8rq6qxZl4QLMV5E0?=
 =?us-ascii?Q?yIMkzQ5zOW9cDnCXnWtGgIvddCqm4dBrpHnvQ21+AbP7P6zNwv4BDblCXNrY?=
 =?us-ascii?Q?w6/MgRxwa8KyY+3YB9fe5LDuO0uk7ujlctJ2BSiP/KKf0yZm4N+RMejQO5Dw?=
 =?us-ascii?Q?oEIGJwVEE0G3uSeF/UkhtiY1rMI2D/lvzFREfef2mwi3mRRNrNAU8giRy1YR?=
 =?us-ascii?Q?qX8JGxX4gRKqDGloYGI+W9Fl/CnY9vFpCzz8bxR02HWPMgCTxkezjtzkLJSx?=
 =?us-ascii?Q?lOmzTSL/Z2h99ZTVGI7ngd0sUj/Qy8lumdBOKUQstCH+FXxF2xRl717HutAC?=
 =?us-ascii?Q?+F8p0YJGCt+DsCh2XueQu/zuQsAAvP59w4X1zL5naziRhwpt3t+FptOJ3C4c?=
 =?us-ascii?Q?HzDejYrmIeepxX93+ayM7jxrq4Ykh/b8JAN8PbwtfxXTN81xRwtB/ReEjO29?=
 =?us-ascii?Q?0OX/TaC3n8jhq6xS5uPGvP7hi+4PI94PnbAlW4yWqDou/FN+U+PWdG7y9Imp?=
 =?us-ascii?Q?ljoyRCyAsAJK7TK8XXVintI2LhQjyK4wAlCtEmuiB/lNrQ4iN3psb7GYDC4X?=
 =?us-ascii?Q?Nx5gypOBLC0NTrw01hDZMiIM8rBWrfcltysBrYCr?=
X-OriginatorOrg: kpit.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 5d3bbb70-e729-452e-a1cc-08da60d7f13c
X-MS-Exchange-CrossTenant-AuthSource: PN3PR01MB6712.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jul 2022 11:49:41.0352
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3539451e-b46e-4a26-a242-ff61502855c7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 MB6Y3b7tpwQLsNEeg9x8DPv6hyIduGf/pEhQ6f21o4B3Owfsp5u53nYQvoEN30C0+47FxppKbj6lL8q9CP5XhQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MA1PR01MB0620
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 08 Jul 2022 11:49:55 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167820

From: Joshua Watt <JPEWhacker@gmail.com>

Moving the function will allow other classes to capture which CVEs have
been patched, in particular SBoM generation.

Also add a function to capture the CPE ID from the CVE Product and
Version

(From OE-Core rev: 75d34259a715120be1d023e4fd7b6b4b125f2443)

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit fa6c07bc1a585f204dbdc28704f61448edb8fdc8)
Signed-off-by: Akash Hadke <akash.hadke@kpit.com>
---
 meta/classes/cve-check.bbclass | 62 +------------------------
 meta/lib/oe/cve_check.py       | 82 ++++++++++++++++++++++++++++++++++
 2 files changed, 84 insertions(+), 60 deletions(-)

diff --git a/meta/classes/cve-check.bbclass b/meta/classes/cve-check.bbclass
index d0f6970db8..290fcb3316 100644
--- a/meta/classes/cve-check.bbclass
+++ b/meta/classes/cve-check.bbclass
@@ -136,10 +136,11 @@ python do_cve_check () {
     """
     Check recipe for patched and unpatched CVEs
     """
+    from oe.cve_check import get_patched_cves
 
     if os.path.exists(d.getVar("CVE_CHECK_DB_FILE")):
         try:
-            patched_cves = get_patches_cves(d)
+            patched_cves = get_patched_cves(d)
         except FileNotFoundError:
             bb.fatal("Failure in searching patches")
         whitelisted, patched, unpatched, status = check_cves(d, patched_cves)
@@ -247,65 +248,6 @@ ROOTFS_POSTPROCESS_COMMAND_prepend = "${@'cve_check_write_rootfs_manifest; ' if
 do_rootfs[recrdeptask] += "${@'do_cve_check' if d.getVar('CVE_CHECK_CREATE_MANIFEST') == '1' else ''}"
 do_populate_sdk[recrdeptask] += "${@'do_cve_check' if d.getVar('CVE_CHECK_CREATE_MANIFEST') == '1' else ''}"
 
-def get_patches_cves(d):
-    """
-    Get patches that solve CVEs using the "CVE: " tag.
-    """
-
-    import re
-
-    pn = d.getVar("PN")
-    cve_match = re.compile("CVE:( CVE\-\d{4}\-\d+)+")
-
-    # Matches the last "CVE-YYYY-ID" in the file name, also if written
-    # in lowercase. Possible to have multiple CVE IDs in a single
-    # file name, but only the last one will be detected from the file name.
-    # However, patch files contents addressing multiple CVE IDs are supported
-    # (cve_match regular expression)
-
-    cve_file_name_match = re.compile(".*([Cc][Vv][Ee]\-\d{4}\-\d+)")
-
-    patched_cves = set()
-    bb.debug(2, "Looking for patches that solves CVEs for %s" % pn)
-    for url in src_patches(d):
-        patch_file = bb.fetch.decodeurl(url)[2]
-
-        if not os.path.isfile(patch_file):
-            bb.error("File Not found: %s" % patch_file)
-            raise FileNotFoundError
-
-        # Check patch file name for CVE ID
-        fname_match = cve_file_name_match.search(patch_file)
-        if fname_match:
-            cve = fname_match.group(1).upper()
-            patched_cves.add(cve)
-            bb.debug(2, "Found CVE %s from patch file name %s" % (cve, patch_file))
-
-        with open(patch_file, "r", encoding="utf-8") as f:
-            try:
-                patch_text = f.read()
-            except UnicodeDecodeError:
-                bb.debug(1, "Failed to read patch %s using UTF-8 encoding"
-                        " trying with iso8859-1" %  patch_file)
-                f.close()
-                with open(patch_file, "r", encoding="iso8859-1") as f:
-                    patch_text = f.read()
-
-        # Search for one or more "CVE: " lines
-        text_match = False
-        for match in cve_match.finditer(patch_text):
-            # Get only the CVEs without the "CVE: " tag
-            cves = patch_text[match.start()+5:match.end()]
-            for cve in cves.split():
-                bb.debug(2, "Patch %s solves %s" % (patch_file, cve))
-                patched_cves.add(cve)
-                text_match = True
-
-        if not fname_match and not text_match:
-            bb.debug(2, "Patch %s doesn't solve CVEs" % patch_file)
-
-    return patched_cves
-
 def check_cves(d, patched_cves):
     """
     Connect to the NVD database and find unpatched cves.
diff --git a/meta/lib/oe/cve_check.py b/meta/lib/oe/cve_check.py
index b17390de90..a4b831831b 100644
--- a/meta/lib/oe/cve_check.py
+++ b/meta/lib/oe/cve_check.py
@@ -89,3 +89,85 @@ def update_symlinks(target_path, link_path):
         if os.path.exists(os.path.realpath(link_path)):
             os.remove(link_path)
         os.symlink(os.path.basename(target_path), link_path)
+
+def get_patched_cves(d):
+    """
+    Get patches that solve CVEs using the "CVE: " tag.
+    """
+
+    import re
+    import oe.patch
+
+    pn = d.getVar("PN")
+    cve_match = re.compile("CVE:( CVE\-\d{4}\-\d+)+")
+
+    # Matches the last "CVE-YYYY-ID" in the file name, also if written
+    # in lowercase. Possible to have multiple CVE IDs in a single
+    # file name, but only the last one will be detected from the file name.
+    # However, patch files contents addressing multiple CVE IDs are supported
+    # (cve_match regular expression)
+
+    cve_file_name_match = re.compile(".*([Cc][Vv][Ee]\-\d{4}\-\d+)")
+
+    patched_cves = set()
+    bb.debug(2, "Looking for patches that solves CVEs for %s" % pn)
+    for url in oe.patch.src_patches(d):
+        patch_file = bb.fetch.decodeurl(url)[2]
+
+        if not os.path.isfile(patch_file):
+            bb.error("File Not found: %s" % patch_file)
+            raise FileNotFoundError
+
+        # Check patch file name for CVE ID
+        fname_match = cve_file_name_match.search(patch_file)
+        if fname_match:
+            cve = fname_match.group(1).upper()
+            patched_cves.add(cve)
+            bb.debug(2, "Found CVE %s from patch file name %s" % (cve, patch_file))
+
+        with open(patch_file, "r", encoding="utf-8") as f:
+            try:
+                patch_text = f.read()
+            except UnicodeDecodeError:
+                bb.debug(1, "Failed to read patch %s using UTF-8 encoding"
+                        " trying with iso8859-1" %  patch_file)
+                f.close()
+                with open(patch_file, "r", encoding="iso8859-1") as f:
+                    patch_text = f.read()
+
+        # Search for one or more "CVE: " lines
+        text_match = False
+        for match in cve_match.finditer(patch_text):
+            # Get only the CVEs without the "CVE: " tag
+            cves = patch_text[match.start()+5:match.end()]
+            for cve in cves.split():
+                bb.debug(2, "Patch %s solves %s" % (patch_file, cve))
+                patched_cves.add(cve)
+                text_match = True
+
+        if not fname_match and not text_match:
+            bb.debug(2, "Patch %s doesn't solve CVEs" % patch_file)
+
+    return patched_cves
+
+
+def get_cpe_ids(cve_product, version):
+    """
+    Get list of CPE identifiers for the given product and version
+    """
+
+    version = version.split("+git")[0]
+
+    cpe_ids = []
+    for product in cve_product.split():
+        # CVE_PRODUCT in recipes may include vendor information for CPE identifiers. If not,
+        # use wildcard for vendor.
+        if ":" in product:
+            vendor, product = product.split(":", 1)
+        else:
+            vendor = "*"
+
+        cpe_id = f'cpe:2.3:a:{vendor}:{product}:{version}:*:*:*:*:*:*:*'
+        cpe_ids.append(cpe_id)
+
+    return cpe_ids
-- 
2.17.1


