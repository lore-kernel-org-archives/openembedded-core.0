Return-Path: <liezhi.yang@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7E54C46CA2
	for <webhook@archiver.kernel.org>; Tue, 19 Dec 2023 18:52:21 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.4098.1703011933408792615
 for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Dec 2023 10:52:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=TFTkrHll;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=0717d84f99=liezhi.yang@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 3BJBGGSQ027231
	for <openembedded-core@lists.openembedded.org>; Tue, 19 Dec 2023 10:52:13 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:content-type; s=
	PPS06212021; bh=V49Eu7MSZwU9lB5yngd6jYWwsMyC8m9Pg+KScotKrAI=; b=
	TFTkrHllzcNts28Z1IEe7qVuLZX14Q2hD9V+5gnGyI9UWfUTEUPho5cKBro7hJ7W
	6q2+HHaPXZMdN8v5cxKRJsgO9GfYbtNcE/drW1fiisPlQl6UBCMk/JSnMOZim1C+
	EBd+WqgrInJqSNXmpOwRNAdWvwt5p5LECuVc1LNCqFTgG+2RSZu5yEUNQOkRDtFu
	gE3IrOIAiruWcZETOwOlvHhOpRN7kxd85jzYW3hcY7YCy6zP1JR2yroujwmb1/PN
	sB7ewcEMwGngxHNlLeMJF4x0NZNPejePP6ScW81d1t5+aI55N+jpLY9i/McDNDsF
	E0m1Yfp2aQVPrULzAqxCYg==
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3v1824kden-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 19 Dec 2023 10:52:12 -0800 (PST)
Received: from ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 19 Dec 2023 10:52:18 -0800
Received: from ala-lpggp3.wrs.com (147.11.136.210) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server id
 15.1.2507.35 via Frontend Transport; Tue, 19 Dec 2023 10:52:18 -0800
From: <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH 1/1] archiver.bbclass: Drop tarfile module to improve performance
Date: Tue, 19 Dec 2023 10:52:11 -0800
Message-ID: <692606bf032e2ffc29bd3283156449a7747fe793.1703011843.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <cover.1703011843.git.liezhi.yang@windriver.com>
References: <cover.1703011843.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: 8s9HktEcFvG3IkKSnhLrMOfXrA5M4Xom
X-Proofpoint-GUID: 8s9HktEcFvG3IkKSnhLrMOfXrA5M4Xom
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-16_25,2023-11-16_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 phishscore=0
 mlxscore=0 impostorscore=0 mlxlogscore=932 lowpriorityscore=0 bulkscore=0
 adultscore=0 suspectscore=0 priorityscore=1501 clxscore=1015
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2311290000 definitions=main-2312190141
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 19 Dec 2023 18:52:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192756

From: Robert Yang <liezhi.yang@windriver.com>

* The tarfile module doesn't support xz options or environment varible
  XZ_DEFAULTS, this makes do_ar_patched incrediblely slow when the file is
  large, for example, chromium-x11 is about 3GB:
  - "bitbake chromium-x11 -car_patched" hasn't been done after 3 hours on my
     host, I checked the partial tar.xz file is only 1.5GB, so maybe more than 6
     hours is required to complete the task.

  - Now only less than 4 minutes is needed on the same host.

* Need add xz to HOSTTOOLS when archiver.bbclass is enabled and compression is xz.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/classes/archiver.bbclass | 28 ++++++++++++++++------------
 meta/conf/bitbake.conf        |  3 +++
 2 files changed, 19 insertions(+), 12 deletions(-)

diff --git a/meta/classes/archiver.bbclass b/meta/classes/archiver.bbclass
index 80a69cf31db..2d0bbfbd422 100644
--- a/meta/classes/archiver.bbclass
+++ b/meta/classes/archiver.bbclass
@@ -401,19 +401,11 @@ python do_ar_mirror() {
         subprocess.check_call(cmd, shell=True)
 }
 
-def exclude_useless_paths(tarinfo):
-    if tarinfo.isdir():
-        if tarinfo.name.endswith('/temp') or tarinfo.name.endswith('/patches') or tarinfo.name.endswith('/.pc'):
-            return None
-        elif tarinfo.name == 'temp' or tarinfo.name == 'patches' or tarinfo.name == '.pc':
-            return None
-    return tarinfo
-
 def create_tarball(d, srcdir, suffix, ar_outdir):
     """
     create the tarball from srcdir
     """
-    import tarfile
+    import subprocess
 
     # Make sure we are only creating a single tarball for gcc sources
     if (d.getVar('SRC_URI') == ""):
@@ -425,6 +417,16 @@ def create_tarball(d, srcdir, suffix, ar_outdir):
     srcdir = os.path.realpath(srcdir)
 
     compression_method = d.getVarFlag('ARCHIVER_MODE', 'compression')
+    if compression_method == "xz":
+        compression_cmd = "xz %s" % d.getVar('XZ_DEFAULTS')
+    # To keep compatibility with ARCHIVER_MODE[compression]
+    elif compression_method == "gz":
+        compression_cmd = "gzip"
+    elif compression_method == "bz2":
+        compression_cmd = "bzip2"
+    else:
+        bb.fatal("Unsupported compression_method: %s" % compression_method)
+
     bb.utils.mkdirhier(ar_outdir)
     if suffix:
         filename = '%s-%s.tar.%s' % (d.getVar('PF'), suffix, compression_method)
@@ -433,9 +435,11 @@ def create_tarball(d, srcdir, suffix, ar_outdir):
     tarname = os.path.join(ar_outdir, filename)
 
     bb.note('Creating %s' % tarname)
-    tar = tarfile.open(tarname, 'w:%s' % compression_method)
-    tar.add(srcdir, arcname=os.path.basename(srcdir), filter=exclude_useless_paths)
-    tar.close()
+    dirname = os.path.dirname(srcdir)
+    basename = os.path.basename(srcdir)
+    exclude = "--exclude=temp --exclude=patches --exclude='.pc'"
+    tar_cmd = "tar %s -cf - %s | %s > %s" % (exclude, basename, compression_cmd, tarname)
+    subprocess.check_call(tar_cmd, cwd=dirname, shell=True)
 
 # creating .diff.gz between source.orig and source
 def create_diff_gz(d, src_orig, src, ar_outdir):
diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index e7826e7af96..681af512bfa 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -528,6 +528,9 @@ HOSTTOOLS += " \
 # Tools needed to run testimage runtime image testing
 HOSTTOOLS += "${@'ip ping ps scp ssh stty' if (bb.utils.contains_any('IMAGE_CLASSES', 'testimage testsdk', True, False, d) or any(x in (d.getVar("BBINCLUDED") or "") for x in ["testimage.bbclass", "testsdk.bbclass"])) else ''}"
 
+# Used by archiver.bbclass when compression is xz
+HOSTTOOLS += "${@'xz' if (('archiver.bbclass' in d.getVar('BBINCLUDED')) and (d.getVarFlag('ARCHIVER_MODE', 'compression') == 'xz')) else ''}"
+
 # Link to these if present
 HOSTTOOLS_NONFATAL += "aws gcc-ar gpg gpg-agent ld.bfd ld.gold nc pigz sftp socat ssh sudo"
 
-- 
2.42.0


