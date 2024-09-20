Return-Path: <liezhi.yang@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8DCE8CF58F1
	for <webhook@archiver.kernel.org>; Fri, 20 Sep 2024 08:53:28 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.13749.1726822405966669664
 for <openembedded-core@lists.openembedded.org>;
 Fri, 20 Sep 2024 01:53:25 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=999393e395=liezhi.yang@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48K3swlH022587
	for <openembedded-core@lists.openembedded.org>; Fri, 20 Sep 2024 01:53:25 -0700
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 41na0mpb53-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 20 Sep 2024 01:53:25 -0700 (PDT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 20 Sep 2024 01:53:15 -0700
Received: from ala-lpggp7.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.39 via Frontend Transport; Fri, 20 Sep 2024 01:53:15 -0700
From: <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
CC: <david.reyna@windriver.com>
Subject: [PATCH 1/2] enable-vendor-revision.bbclass: Add it to append VENDOR_REVISION to PR
Date: Fri, 20 Sep 2024 01:53:14 -0700
Message-ID: <3cd16735ca4ddfae1dbb041c392f1bf2bdde4237.1726821150.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1726821150.git.liezhi.yang@windriver.com>
References: <cover.1726821150.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: zZnuyKISlYOJDlAqqivikG2ntiiF0n0l
X-Authority-Analysis: v=2.4 cv=d6+nygjE c=1 sm=1 tr=0 ts=66ed3805 cx=c_pps a=/ZJR302f846pc/tyiSlYyQ==:117 a=/ZJR302f846pc/tyiSlYyQ==:17 a=EaEq8P2WXUwA:10 a=t7CeM3EgAAAA:8 a=6fFWy2STr2stsUwB1ZYA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: zZnuyKISlYOJDlAqqivikG2ntiiF0n0l
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-20_04,2024-09-19_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0
 priorityscore=1501 mlxlogscore=999 spamscore=0 mlxscore=0 phishscore=0
 malwarescore=0 suspectscore=0 bulkscore=0 impostorscore=0
 lowpriorityscore=0 clxscore=1015 classifier=spam authscore=0 adjust=0
 reason=mlx scancount=1 engine=8.21.0-2408220000
 definitions=main-2409200063
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 20 Sep 2024 08:53:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204727

From: Robert Yang <liezhi.yang@windriver.com>

This bbclass is used for appending VENDOR_REVISION to PR from
vendor-revision.conf for the recipes which have patches.

The vendor-revision.conf is not a must, but without it, all the recipes which
patches will have a VR, there is no different in the first release such as
Yocto 5.1, but all the VRs will be updated from "vr51" to "vr511" in Yocto
5.1.1 since there is no history data (vendor-revision.conf).

Check the comments in the header of gen-vendor-revision.bbclass for more details.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 .../enable-vendor-revision.bbclass            | 125 ++++++++++++++++++
 1 file changed, 125 insertions(+)
 create mode 100644 meta/classes-global/enable-vendor-revision.bbclass

diff --git a/meta/classes-global/enable-vendor-revision.bbclass b/meta/classes-global/enable-vendor-revision.bbclass
new file mode 100644
index 00000000000..14cb5ee811d
--- /dev/null
+++ b/meta/classes-global/enable-vendor-revision.bbclass
@@ -0,0 +1,125 @@
+#
+# Copyright (C) 2024 Wind River Systems, Inc
+#
+# SPDX-License-Identifier: GPL-2.0-only
+#
+
+# This bbclass is used for appending VENDOR_REVISION to PR from
+# vendor-revision.conf for the recipes which have patches.
+# To enable it:
+# 1. Generate vendor-revision.conf with gen-vendor-revision.bbclass
+# 2. Remove 'gen-vendor-revision' from conf/local.conf if it is there
+# 3. Add the following lines to conf/local.conf
+# require /path/to/vendor-revision.conf
+# INHERIT += "enable-vendor-revision"
+#
+# The vendor-revision.conf is not a must, but without it, all the recipes which
+# patches will have a VR, there is no different in the first release such as
+# Yocto 5.1, but all the VRs will be updated from "vr51" to "vr511" in Yocto
+# 5.1.1 since there is no history data (vendor-revision.conf).
+#
+# The VENDOR_REVISION_PREFIX is used for:
+# - Avoid confusions with PR Server
+# - Customize for your own distro
+VENDOR_REVISION_PREFIX ??= ".vr"
+
+def get_src_patches(d):
+    import oe.patch
+    local_patches = set()
+    bb.fetch.get_hashvalue(d)
+    for patch in oe.patch.src_patches(d):
+        _, _, local, _, _, parm = bb.fetch.decodeurl(patch)
+        local_patches.add(local)
+    return local_patches
+
+def is_work_shared(d):
+    sharedworkdir = os.path.join(d.getVar('TMPDIR'), 'work-shared')
+    return d.getVar('S').startswith(sharedworkdir)
+
+def vr_need_skip(d):
+
+    if is_work_shared(d):
+        return False
+
+    packages = d.getVar('PACKAGES')
+    if (not packages) or bb.data.inherits_class('nopackages', d) or \
+             bb.data.inherits_class('nativesdk', d):
+        return True
+
+    # Skip VR when no patches
+    if get_src_patches(d):
+        return False
+    else:
+        return True
+
+def get_var_short(var):
+    return '/'.join(var.split('/')[-4:]).replace('/', '_')
+
+def get_file_short(d):
+    return get_var_short(d.getVar('FILE'))
+
+# Allow users to customize the VR format since different Distro may have
+# different DISTRO_VERSIONs
+GET_CURRENT_VENDOR_REVISION ??= "get_current_vendor_revision(d)"
+
+def get_current_vendor_revision(d):
+    distro_version = d.getVar('DISTRO_VERSION')
+    vendor_revision = distro_version.replace('.', '')
+
+    vr_prefix = d.getVar('VENDOR_REVISION_PREFIX') or ''
+    if vr_prefix:
+        vendor_revision = vr_prefix + vendor_revision
+
+    vr_suffix = d.getVar('VENDOR_REVISION_SUFFIX') or ''
+    if vr_suffix:
+        vendor_revision += vr_suffix
+
+    return vendor_revision
+
+python() {
+    """
+    Set PR:append = "VENDOR_REVISION" for the recipes
+    """
+
+    # Skip when gen-vendor-revision is inherited
+    if bb.data.inherits_class('gen-vendor-revision', d):
+        bb.debug(1, 'Skipping enabling VR for %s since gen-vendor-revision is inherited' % d.getVar('PN'))
+        return
+
+    if vr_need_skip(d):
+        return
+
+    # Directly use VENDOR_REVISION if the recipe sets it.
+    vr = d.getVar('VENDOR_REVISION')
+    if not vr:
+        file_short = get_file_short(d)
+        val = d.getVarFlag('VENDOR_REVISION', file_short)
+        if val:
+            # The first item is VENDOR_REVISION
+            vr = val.split()[0]
+            # The d.getVarFlag("VENDOR_REVISION", "tmp_work-shared_qemux86-64_kernel-source")
+            # return None when kernel doesn't have patches, and vr_need_skip()
+            # can't skip work-shared recipes. The None is a string here.
+            if vr == 'None':
+                return
+
+    if not vr:
+        # It's a new recipe, defult to current VR
+        vr = eval(d.getVar('GET_CURRENT_VENDOR_REVISION'))
+
+    bb.debug(1, 'Appending VENDOR_REVISION %s to PR' % vr)
+    d.appendVar('PR', vr)
+}
+
+GLOBAL_VENDOR_REVISION_WARN ??= '1'
+addhandler warn_for_global_vr
+warn_for_global_vr[eventmask] = "bb.event.ConfigParsed"
+python warn_for_global_vr() {
+    # The VENDOR_REVISION should be set via recipe level, otherwise, there
+    # might be PR bombs or no effect, so warn for global VENDOR_REVISION
+    global_vr = d.getVar('VENDOR_REVISION')
+    if global_vr and bb.utils.to_boolean(d.getVar('GLOBAL_VENDOR_REVISION_WARN')):
+        bb.warn('The global VENDOR_REVISION (%s) may cause unneeded packages upgrading,' % global_vr)
+        bb.warn('or make VENDOR_REVISION invalid.')
+        bb.warn('The above warning can be disabled by GLOBAL_VENDOR_REVISION_WARN = "0"\n')
+}
-- 
2.25.1


