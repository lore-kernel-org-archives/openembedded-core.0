Return-Path: <hongxu.jia@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B71ABD2AB08
	for <webhook@archiver.kernel.org>; Tue, 29 Oct 2024 09:17:30 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.14826.1730193450163705881
 for <openembedded-core@lists.openembedded.org>;
 Tue, 29 Oct 2024 02:17:30 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=103298b06a=hongxu.jia@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49T4cLXr031504;
	Tue, 29 Oct 2024 09:17:29 GMT
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 42gqd8kau1-7
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Tue, 29 Oct 2024 09:17:28 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 29 Oct 2024 02:17:24 -0700
Received: from ala-lpggp7.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.39 via Frontend Transport; Tue, 29 Oct 2024 02:17:24 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>
CC: <JPEWhacker@gmail.com>
Subject: [oe-core][PATCH V2 6/7] create-spdx-{2.2,3.0}: support SPDX include source for work-share directory
Date: Tue, 29 Oct 2024 02:17:22 -0700
Message-ID: <20241029091723.2851061-7-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241029091723.2851061-1-hongxu.jia@windriver.com>
References: <20241029091723.2851061-1-hongxu.jia@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: 7ZLsfA7ga3N8M6zjRImZmvwc32tGh8Ed
X-Authority-Analysis: v=2.4 cv=dKj0m/Zb c=1 sm=1 tr=0 ts=6720a828 cx=c_pps a=K4BcnWQioVPsTJd46EJO2w==:117 a=K4BcnWQioVPsTJd46EJO2w==:17 a=DAUX931o1VcA:10 a=iGHA9ds3AAAA:8 a=t7CeM3EgAAAA:8 a=HEwNEoMtOsuOwCeMpPQA:9 a=aAh4nC1LCUkA:10 a=nM-MV4yxpKKO9kiQg6Ot:22
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: 7ZLsfA7ga3N8M6zjRImZmvwc32tGh8Ed
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-29_04,2024-10-28_02,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 priorityscore=1501 lowpriorityscore=0 phishscore=0 mlxlogscore=999
 adultscore=0 impostorscore=0 malwarescore=0 bulkscore=0 clxscore=1015
 spamscore=0 mlxscore=0 classifier=spam authscore=0 adjust=0 reason=mlx
 scancount=1 engine=8.21.0-2409260000 definitions=main-2410290072
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 29 Oct 2024 09:17:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206483

Originally, while SPDX_INCLUDE_SOURCES = "1" [1], there is bug in scan
for gcc, libgcc in which the sources locates in work-share directory.
Copy source from ${WORKDIR} to ${SPDXWORK} did not satisfy the situation
while ${S} was not included in ${WORKDIR}

This commit aim to support SPDX include source for work-share directory

1. If is_work_shared_spdx, Copy source from ${S} to ${SPDXWORK},
normally the dest dir in ${SPDXWORK} has the same basename dir of ${S};
but for kernel source, rename basename dir 'kernel-source' to ${BP} (${BPN}-${PV})

2. For SPDX source copy, do hard link copy to save copy time

3. Move do_patch to no work shared situation along with do_unpack

4. Tweak task do_create_spdx dependencies to assure the patched source
in work share is ready for SPDX source copy

5. Remove bb.data.inherits_class('kernel', d) from is_work_shared_spdx,
the kernel source locates in 'work-shared', test kernel.bbclass is not
necessary

[1] https://docs.yoctoproject.org/dev/ref-manual/variables.html#term-SPDX_INCLUDE_SOURCES

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta/classes/spdx-common.bbclass |  9 +++++++
 meta/lib/oe/spdx_common.py       | 41 ++++++++++++--------------------
 2 files changed, 24 insertions(+), 26 deletions(-)

diff --git a/meta/classes/spdx-common.bbclass b/meta/classes/spdx-common.bbclass
index ad02da5cd6..d3cdc8b6ce 100644
--- a/meta/classes/spdx-common.bbclass
+++ b/meta/classes/spdx-common.bbclass
@@ -57,6 +57,15 @@ def create_spdx_source_deps(d):
             if oe.spdx_common.has_task(d, "do_shared_workdir"):
                 deps.append("%s:do_shared_workdir" % pn)
 
+            # For gcc-source-${PV} source code
+            if oe.spdx_common.has_task(d, "do_preconfigure"):
+                deps.append("%s:do_preconfigure" % pn)
+            elif oe.spdx_common.has_task(d, "do_patch"):
+                deps.append("%s:do_patch" % pn)
+            # For gcc-cross-x86_64 source code
+            elif oe.spdx_common.has_task(d, "do_configure"):
+                deps.append("%s:do_configure" % pn)
+
     return " ".join(deps)
 
 
diff --git a/meta/lib/oe/spdx_common.py b/meta/lib/oe/spdx_common.py
index 7a85579f64..ff18d91780 100644
--- a/meta/lib/oe/spdx_common.py
+++ b/meta/lib/oe/spdx_common.py
@@ -38,7 +38,7 @@ def extract_licenses(filename):
 
 
 def is_work_shared_spdx(d):
-    return bb.data.inherits_class("kernel", d) or ("work-shared" in d.getVar("WORKDIR"))
+    return '/work-shared/' in d.getVar('S')
 
 
 def load_spdx_license_data(d):
@@ -74,11 +74,6 @@ def process_sources(d):
     if d.getVar("PN") == "shadow-sysroot":
         return False
 
-    # We just archive gcc-source for all the gcc related recipes
-    if d.getVar("BPN") in ["gcc", "libgcc"]:
-        bb.debug(1, "spdx: There is bug in scan of %s is, do nothing" % pn)
-        return False
-
     return True
 
 
@@ -190,34 +185,28 @@ def get_patched_src(d):
             bb.utils.mkdirhier(d.getVar("B"))
 
             bb.build.exec_func("do_unpack", d)
-        # Copy source of kernel to spdx_workdir
+
+            if d.getVar("SRC_URI") != "":
+                bb.build.exec_func("do_patch", d)
+
+        # Copy source from work-share to spdx_workdir
         if is_work_shared_spdx(d):
-            share_src = d.getVar("WORKDIR")
+            share_src = d.getVar('S')
             d.setVar("WORKDIR", spdx_workdir)
             d.setVar("STAGING_DIR_NATIVE", spdx_sysroot_native)
+            # Copy source to ${SPDXWORK}, same basename dir of ${S};
             src_dir = (
                 spdx_workdir
                 + "/"
-                + d.getVar("PN")
-                + "-"
-                + d.getVar("PV")
-                + "-"
-                + d.getVar("PR")
+                + os.path.basename(share_src)
             )
-            bb.utils.mkdirhier(src_dir)
+            # For kernel souce, rename suffix dir 'kernel-source'
+            # to ${BP} (${BPN}-${PV})
             if bb.data.inherits_class("kernel", d):
-                share_src = d.getVar("STAGING_KERNEL_DIR")
-            cmd_copy_share = "cp -rf " + share_src + "/* " + src_dir + "/"
-            cmd_copy_shared_res = os.popen(cmd_copy_share).read()
-            bb.note("cmd_copy_shared_result = " + cmd_copy_shared_res)
-
-            git_path = src_dir + "/.git"
-            if os.path.exists(git_path):
-                shutils.rmtree(git_path)
-
-        # Make sure gcc and kernel sources are patched only once
-        if not (d.getVar("SRC_URI") == "" or is_work_shared_spdx(d)):
-            bb.build.exec_func("do_patch", d)
+                src_dir = spdx_workdir + "/" + d.getVar('BP')
+
+            bb.note(f"copyhardlinktree {share_src} to {src_dir}")
+            oe.path.copyhardlinktree(share_src, src_dir)
 
         # Some userland has no source.
         if not os.path.exists(spdx_workdir):
-- 
2.25.1


