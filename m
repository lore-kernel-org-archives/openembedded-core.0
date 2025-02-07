Return-Path: <hongxu.jia@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1EC47C02192
	for <webhook@archiver.kernel.org>; Fri,  7 Feb 2025 05:28:00 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.62241.1738906071274764757
 for <openembedded-core@lists.openembedded.org>;
 Thu, 06 Feb 2025 21:27:51 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=4133875e34=hongxu.jia@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51750ICj027610
	for <openembedded-core@lists.openembedded.org>; Thu, 6 Feb 2025 21:27:51 -0800
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 44hfs8p7ej-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 06 Feb 2025 21:27:50 -0800 (PST)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.43; Thu, 6 Feb 2025 21:27:50 -0800
Received: from pek-lpg-core5.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.43 via Frontend Transport; Thu, 6 Feb 2025 21:27:49 -0800
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH V2 2/2] script/relocate_sdk.py: check dynamic loader arch before relocating interpreter
Date: Fri, 7 Feb 2025 13:27:47 +0800
Message-ID: <20250207052747.1816659-2-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250207052747.1816659-1-hongxu.jia@windriver.com>
References: <20250207052747.1816659-1-hongxu.jia@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Authority-Analysis: v=2.4 cv=JrcLrN4C c=1 sm=1 tr=0 ts=67a599d6 cx=c_pps a=K4BcnWQioVPsTJd46EJO2w==:117 a=K4BcnWQioVPsTJd46EJO2w==:17 a=T2h4t0Lz3GQA:10 a=t7CeM3EgAAAA:8 a=dAzMZrHdxAaOrm8FoQAA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: F-RM6_l7qz6HmLYRqoOPrJ9OaMZrA569
X-Proofpoint-GUID: F-RM6_l7qz6HmLYRqoOPrJ9OaMZrA569
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-07_02,2025-02-07_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 malwarescore=0 adultscore=0 spamscore=0 mlxlogscore=758 suspectscore=0
 lowpriorityscore=0 phishscore=0 priorityscore=1501 mlxscore=0
 clxscore=1015 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2501170000
 definitions=main-2502070042
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 07 Feb 2025 05:28:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210969

While multiple dynamic loader existed, in order to make executable file is
interpreted by the expected dynamic loader, relocating interpreter only if
the new dynamic loader and executable file have the same arch

[ YOCTO #15722 ]

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 scripts/relocate_sdk.py | 32 +++++++++++++++++++++++++++++++-
 1 file changed, 31 insertions(+), 1 deletion(-)

diff --git a/scripts/relocate_sdk.py b/scripts/relocate_sdk.py
index 8a728720ba..9e01c09cb0 100755
--- a/scripts/relocate_sdk.py
+++ b/scripts/relocate_sdk.py
@@ -49,6 +49,34 @@ def get_arch():
     elif ei_class == 2:
         return 64
 
+def get_dl_arch(dl_path):
+    try:
+        with open(dl_path, "r+b") as f:
+            e_ident =f.read(16)
+    except IOError:
+        exctype, ioex = sys.exc_info()[:2]
+        if ioex.errno == errno.ETXTBSY:
+            print("Could not open %s. File used by another process.\nPlease "\
+                  "make sure you exit all processes that might use any SDK "\
+                  "binaries." % e)
+        else:
+            print("Could not open %s: %s(%d)" % (e, ioex.strerror, ioex.errno))
+        sys.exit(-1)
+
+    ei_mag0,ei_mag1_3,ei_class,ei_data,ei_version = struct.unpack("<B3sBBB9x", e_ident)
+
+    if (ei_mag0 != 0x7f and ei_mag1_3 != "ELF") or ei_class == 0:
+        print("ERROR: unknow %s" % dl_path)
+        sys.exit(-1)
+
+    if ei_class == 1:
+        arch = 32
+    elif ei_class == 2:
+        arch = 64
+
+    return arch
+
+
 def parse_elf_header():
     global e_type, e_machine, e_version, e_entry, e_phoff, e_shoff, e_flags,\
            e_ehsize, e_phentsize, e_phnum, e_shentsize, e_shnum, e_shstrndx
@@ -223,6 +251,8 @@ else:
 
 executables_list = sys.argv[3:]
 
+dl_arch = get_dl_arch(new_dl_path)
+
 errors = False
 for e in executables_list:
     perms = os.stat(e)[stat.ST_MODE]
@@ -247,7 +277,7 @@ for e in executables_list:
     old_size = os.path.getsize(e)
     if old_size >= 64:
         arch = get_arch()
-        if arch:
+        if arch and arch == dl_arch:
             parse_elf_header()
             if not change_interpreter(e):
                 errors = True
-- 
2.34.1


