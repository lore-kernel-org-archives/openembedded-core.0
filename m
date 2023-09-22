Return-Path: <archana.polampalli@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4671CD4F32
	for <webhook@archiver.kernel.org>; Fri, 22 Sep 2023 08:27:14 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.16619.1695371228998764024
 for <openembedded-core@lists.openembedded.org>;
 Fri, 22 Sep 2023 01:27:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=dC4WaEi6;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=7629d4b6b2=archana.polampalli@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 38M71HP1020436
	for <openembedded-core@lists.openembedded.org>; Fri, 22 Sep 2023 01:27:08 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=PPS06212021; bh=IMw7/
	eQIjjNVs8dZrMGA3CdcoV5XkDXqVWwuV9UjrFM=; b=dC4WaEi6thg42wCpF6HWs
	H5QXyfxZRz9GFSRqlKhBynqqf3tRl/AF4+/ebXpB29pgixOnakANwpRAmVdmrQlv
	e1Zq+si/AJ1mvK1nCVxfJ/3zdg9gHpTQtYhxl+ar2sLtXJy4t1qi4NGE3x0DYgjP
	gQQYImxkxIsQ8IBCWbsb4XuiSAQuRY5w/x7gvhFK+XZhnnlHyOd2BrckTVFaV+fl
	tBiJBv1z6dLaiqHcaS7dtqZ1kixhEE/5CJ8YGJAfVMjnlj36vVmnYWZdwtdDc484
	ye03DWbEdftS7Q3vhFNIWa0tm1vLvwrVrRU32Dg0ZxqzUaavuZLSD3AI9dHomCsN
	w==
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3t8tr5rkub-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 22 Sep 2023 01:27:08 -0700 (PDT)
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Fri, 22 Sep 2023 01:27:05 -0700
From: Archana Polampalli <archana.polampalli@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [oe-core][kirkstone][PATCH 1/1] ghostscript: fix CVE-2023-43115
Date: Fri, 22 Sep 2023 08:26:53 +0000
Message-ID: <20230922082653.1493722-1-archana.polampalli@windriver.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [147.11.136.210]
X-ClientProxiedBy: ala-exchng01.corp.ad.wrs.com (147.11.82.252) To
 ala-exchng01.corp.ad.wrs.com (147.11.82.252)
X-Proofpoint-ORIG-GUID: uCVm58BM7u6CA68BePBJqrMdBDNE6w4I
X-Proofpoint-GUID: uCVm58BM7u6CA68BePBJqrMdBDNE6w4I
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-09-22_07,2023-09-21_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 adultscore=0
 spamscore=0 lowpriorityscore=0 malwarescore=0 bulkscore=0 mlxlogscore=999
 clxscore=1015 suspectscore=0 priorityscore=1501 phishscore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2309180000
 definitions=main-2309220069
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 22 Sep 2023 08:27:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188086

In Artifex Ghostscript through 10.01.2, gdevijs.c in GhostPDL can lead to remote
code execution via crafted PostScript documents because they can switch to the
IJS device, or change the IjsServer parameter, after SAFER has been activated.
NOTE: it is a documented risk that the IJS server can be specified on a gs
command line (the IJS device inherently must execute a command to start the IJS server).

References:
https://nvd.nist.gov/vuln/detail/CVE-2023-43115

Upstream patches:
https://git.ghostscript.com/?p=ghostpdl.git;a=commit;h=8b0f20002536867bd73ff4552408a72597190cbe

Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
---
 .../ghostscript/CVE-2023-43115.patch          | 62 +++++++++++++++++++
 .../ghostscript/ghostscript_9.55.0.bb         |  1 +
 2 files changed, 63 insertions(+)
 create mode 100644 meta/recipes-extended/ghostscript/ghostscript/CVE-2023-43115.patch

diff --git a/meta/recipes-extended/ghostscript/ghostscript/CVE-2023-43115.patch b/meta/recipes-extended/ghostscript/ghostscript/CVE-2023-43115.patch
new file mode 100644
index 0000000000..979f354ed5
--- /dev/null
+++ b/meta/recipes-extended/ghostscript/ghostscript/CVE-2023-43115.patch
@@ -0,0 +1,62 @@
+From 8b0f20002536867bd73ff4552408a72597190cbe Mon Sep 17 00:00:00 2001
+From: Ken Sharp <ken.sharp@artifex.com>
+Date: Thu, 24 Aug 2023 15:24:35 +0100
+Subject: [PATCH] IJS device - try and secure the IJS server startup
+
+Bug #707051 ""ijs" device can execute arbitrary commands"
+
+The problem is that the 'IJS' device needs to start the IJS server, and
+that is indeed an arbitrary command line. There is (apparently) no way
+to validate it. Indeed, this is covered quite clearly in the comments
+at the start of the source:
+
+ * WARNING: The ijs server can be selected on the gs command line
+ * which is a security risk, since any program can be run.
+
+Previously this used the awful LockSafetyParams hackery, which we
+abandoned some time ago because it simply couldn't be made secure (it
+was implemented in PostScript and was therefore vulnerable to PostScript
+programs).
+
+This commit prevents PostScript programs switching to the IJS device
+after SAFER has been activated, and prevents changes to the IjsServer
+parameter after SAFER has been activated.
+
+SAFER is activated, unless explicitly disabled, before any user
+PostScript is executed which means that the device and the server
+invocation can only be configured on the command line. This does at
+least provide minimal security against malicious PostScript programs.
+
+Upstream-Status: Backport [https://git.ghostscript.com/?p=ghostpdl.git;a=commit;h=8b0f20002536867bd73ff4552408a72597190cbe]
+
+CVE: CVE-2023-43115
+
+Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
+---
+ devices/gdevijs.c | 4 +++-
+ 1 file changed, 3 insertions(+), 1 deletion(-)
+
+diff --git a/devices/gdevijs.c b/devices/gdevijs.c
+index 8cbd84b97..16f5a1752 100644
+--- a/devices/gdevijs.c
++++ b/devices/gdevijs.c
+@@ -888,6 +888,8 @@ gsijs_initialize_device(gx_device *dev)
+     static const char rgb[] = "DeviceRGB";
+     gx_device_ijs *ijsdev = (gx_device_ijs *)dev;
+
++    if (ijsdev->memory->gs_lib_ctx->core->path_control_active)
++        return_error(gs_error_invalidaccess);
+     if (!ijsdev->ColorSpace) {
+         ijsdev->ColorSpace = gs_malloc(ijsdev->memory, sizeof(rgb), 1,
+                                        "gsijs_initialize");
+@@ -1326,7 +1328,7 @@ gsijs_put_params(gx_device *dev, gs_param_list *plist)
+     if (code >= 0)
+         code = gsijs_read_string(plist, "IjsServer",
+             ijsdev->IjsServer, sizeof(ijsdev->IjsServer),
+-            dev->LockSafetyParams, is_open);
++            ijsdev->memory->gs_lib_ctx->core->path_control_active, is_open);
+
+     if (code >= 0)
+         code = gsijs_read_string_malloc(plist, "DeviceManufacturer",
+--
+2.40.0
diff --git a/meta/recipes-extended/ghostscript/ghostscript_9.55.0.bb b/meta/recipes-extended/ghostscript/ghostscript_9.55.0.bb
index ad0b008cab..4c4c22cf39 100644
--- a/meta/recipes-extended/ghostscript/ghostscript_9.55.0.bb
+++ b/meta/recipes-extended/ghostscript/ghostscript_9.55.0.bb
@@ -38,6 +38,7 @@ SRC_URI_BASE = "https://github.com/ArtifexSoftware/ghostpdl-downloads/releases/d
                 file://CVE-2023-36664-0001.patch \
                 file://CVE-2023-36664-0002.patch \
                 file://CVE-2023-38559.patch \
+                file://CVE-2023-43115.patch \
 "
 
 SRC_URI = "${SRC_URI_BASE} \
-- 
2.40.0


