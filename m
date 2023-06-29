Return-Path: <changqing.li@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D39ADEB64D9
	for <webhook@archiver.kernel.org>; Thu, 29 Jun 2023 10:10:44 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.4953.1688033443106032955
 for <openembedded-core@lists.openembedded.org>;
 Thu, 29 Jun 2023 03:10:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=XRth2HoP;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=65441b46f9=changqing.li@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id 35T8oWpn032154
	for <openembedded-core@lists.openembedded.org>; Thu, 29 Jun 2023 10:10:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=PPS06212021; bh=YOvvn
	hn3/TBhdlsaIBO06nVBS+t34Vo9C8Ny2ENTYSU=; b=XRth2HoPmDciArkLTZvpv
	LXK+8mgPPpfpEoeOrFdjVM0mhunyHOhVlao03m8etMjWLmrXcrlQTjkYiUoSmPXK
	vktuI10Hyqa+iIMoCW3Dq88tAUYbCtK5j1gYewXHrdfnLmltOz/x1Q6EBGBjApK4
	DVD+YQ/i6bqN4x/Vt0JDw1/6+0trdYu99mZo89d0czLhOdqk1NjGtjA17if2KXHV
	U9YKKYyf+ElHzkNcHtXMFnlt0y8D2iisIaSqniqGvQMOcTUym4GxWB5kZN/pM49/
	OFgmJGdsGpzf0BpZN4y/69HwbQJCpJy/sVp5uNtb+J5uYHB8+cEMzS+/O15dczZY
	w==
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3rdqf4cq9e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 29 Jun 2023 10:10:41 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Thu, 29 Jun 2023 03:10:39 -0700
Received: from pek-lpg-core2.wrs.com (128.224.153.41) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.27 via Frontend Transport; Thu, 29 Jun 2023 03:10:39 -0700
From: <changqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [master][PATCH V2] systemd: fix a dead link under /var/log
Date: Thu, 29 Jun 2023 18:10:38 +0800
Message-ID: <20230629101038.3772750-1-changqing.li@windriver.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: TIf9DPdDkyGacx3rUwfjT4P3AgenejZz
X-Proofpoint-GUID: TIf9DPdDkyGacx3rUwfjT4P3AgenejZz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-06-29_02,2023-06-27_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 adultscore=0
 phishscore=0 clxscore=1015 mlxlogscore=596 lowpriorityscore=0
 malwarescore=0 mlxscore=0 suspectscore=0 bulkscore=0 priorityscore=1501
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2305260000 definitions=main-2306290090
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 29 Jun 2023 10:10:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183616

From: Changqing Li <changqing.li@windriver.com>

Commit 6fe23ff31c0 changed README to a symlink to README.logs, and
install README.logs under systemd doc dir.

But for OE, systemd doc dir is splited into package systemd-doc, when it
is not installed on the target, there will be an dead link:
Eg:
root@intel-x86-64:/var/log# ls -l README
lrwxrwxrwx 1 root root 39 Jun 20 08:57 README -> ../../usr/share/doc/systemd/README.logs
root@intel-x86-64:/var/log# ls -l ../../usr/share/doc/systemd/README.logs
ls: cannot access '../../usr/share/doc/systemd/README.logs': No such file or directory

Meantime, relative path for a symlink also will meet issue like
"No such file or directory"

Since OE have set ForwardToSyslog=yes, this README is not needed.
So remove this symlink from package systemd

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 ...on-t-create-symlink-README-in-this-f.patch | 42 +++++++++++++++++++
 meta/recipes-core/systemd/systemd_253.3.bb    |  2 +-
 2 files changed, 43 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-core/systemd/systemd/0001-legacy.conf.in-Don-t-create-symlink-README-in-this-f.patch

diff --git a/meta/recipes-core/systemd/systemd/0001-legacy.conf.in-Don-t-create-symlink-README-in-this-f.patch b/meta/recipes-core/systemd/systemd/0001-legacy.conf.in-Don-t-create-symlink-README-in-this-f.patch
new file mode 100644
index 0000000000..a2644bba8e
--- /dev/null
+++ b/meta/recipes-core/systemd/systemd/0001-legacy.conf.in-Don-t-create-symlink-README-in-this-f.patch
@@ -0,0 +1,42 @@
+From b17826490c1db2051dda23550ebdcd7f10e23479 Mon Sep 17 00:00:00 2001
+From: Changqing Li <changqing.li@windriver.com>
+Date: Wed, 28 Jun 2023 13:49:41 +0800
+Subject: [PATCH 1/2] legacy.conf.in: Don't create symlink README in this file
+
+Commit 6fe23ff31c0 changed README to an symlink to README.logs, and
+install README.logs under systemd doc dir.
+
+But for OE, systemd doc dir is splited into package systemd-doc, when it
+is not installed on the target, there will be an dead link:
+Eg:
+root@intel-x86-64:/var/log# ls -l README
+lrwxrwxrwx 1 root root 39 Jun 20 08:57 README -> ../../usr/share/doc/systemd/README.logs
+root@intel-x86-64:/var/log# ls -l ../../usr/share/doc/systemd/README.logs
+ls: cannot access '../../usr/share/doc/systemd/README.logs': No such file or directory
+
+So remove this symlink from package systemd
+
+Upstream-Status: Inappropriate [oe specific]
+
+Signed-off-by: Changqing Li <changqing.li@windriver.com>
+---
+ tmpfiles.d/legacy.conf.in | 3 ---
+ 1 file changed, 3 deletions(-)
+
+diff --git a/tmpfiles.d/legacy.conf.in b/tmpfiles.d/legacy.conf.in
+index 4f2c0d7c43..62e2ae0986 100644
+--- a/tmpfiles.d/legacy.conf.in
++++ b/tmpfiles.d/legacy.conf.in
+@@ -12,9 +12,6 @@
+ 
+ d /run/lock 0755 root root -
+ L /var/lock - - - - ../run/lock
+-{% if CREATE_LOG_DIRS %}
+-L /var/log/README - - - - ../..{{DOC_DIR}}/README.logs
+-{% endif %}
+ 
+ # /run/lock/subsys is used for serializing SysV service execution, and
+ # hence without use on SysV-less systems.
+-- 
+2.25.1
+
diff --git a/meta/recipes-core/systemd/systemd_253.3.bb b/meta/recipes-core/systemd/systemd_253.3.bb
index 87fbf6f785..d8b94e370c 100644
--- a/meta/recipes-core/systemd/systemd_253.3.bb
+++ b/meta/recipes-core/systemd/systemd_253.3.bb
@@ -28,6 +28,7 @@ SRC_URI += " \
            file://0004-Move-sysusers.d-sysctl.d-binfmt.d-modules-load.d-to-.patch \
            file://27254.patch \
            file://27253.patch \
+           file://0001-legacy.conf.in-Don-t-create-symlink-README-in-this-f.patch \
            "
 
 # patches needed by musl
@@ -760,7 +761,6 @@ FILES:udev += "${base_sbindir}/udevd \
 
 FILES:udev-hwdb = "${rootlibexecdir}/udev/hwdb.d \
                    "
-
 RCONFLICTS:${PN} = "tiny-init ${@bb.utils.contains('PACKAGECONFIG', 'resolved', 'resolvconf', '', d)}"
 
 INITSCRIPT_PACKAGES = "udev"
-- 
2.25.1


