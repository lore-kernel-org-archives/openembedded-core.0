Return-Path: <hongxu.jia@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86595C02182
	for <webhook@archiver.kernel.org>; Tue, 21 Jan 2025 08:55:41 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.11836.1737449732124099953
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Jan 2025 00:55:32 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=31163e49e6=hongxu.jia@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50L8ZZWB017946
	for <openembedded-core@lists.openembedded.org>; Tue, 21 Jan 2025 00:55:32 -0800
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 448cpq28ym-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 21 Jan 2025 00:55:31 -0800 (PST)
Received: from ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.43; Tue, 21 Jan 2025 00:55:31 -0800
Received: from pek-lpg-core5.wrs.com (147.11.136.210) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server id
 15.1.2507.43 via Frontend Transport; Tue, 21 Jan 2025 00:55:30 -0800
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH 4/9] script/relocate_sdk.py: check dynamic loader arch before relocating interpreter
Date: Tue, 21 Jan 2025 16:55:21 +0800
Message-ID: <20250121085526.1370937-4-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250121085526.1370937-1-hongxu.jia@windriver.com>
References: <20250121085526.1370937-1-hongxu.jia@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: sby8cerSIaaSULy_A5HqkVe0U2CRZmH_
X-Proofpoint-GUID: sby8cerSIaaSULy_A5HqkVe0U2CRZmH_
X-Authority-Analysis: v=2.4 cv=TdtstQQh c=1 sm=1 tr=0 ts=678f6103 cx=c_pps a=/ZJR302f846pc/tyiSlYyQ==:117 a=/ZJR302f846pc/tyiSlYyQ==:17 a=VdSt8ZQiCzkA:10 a=t7CeM3EgAAAA:8 a=dAzMZrHdxAaOrm8FoQAA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-21_04,2025-01-21_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 phishscore=0
 spamscore=0 priorityscore=1501 mlxscore=0 clxscore=1015 impostorscore=0
 malwarescore=0 lowpriorityscore=0 bulkscore=0 mlxlogscore=730 adultscore=0
 classifier=spam authscore=0 adjust=0 reason=mlx scancount=1
 engine=8.21.0-2411120000 definitions=main-2501210072
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 21 Jan 2025 08:55:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210076

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


