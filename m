Return-Path: <changqing.li@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96234EB64D9
	for <webhook@archiver.kernel.org>; Thu, 29 Jun 2023 09:13:24 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.4356.1688030001407886774
 for <openembedded-core@lists.openembedded.org>;
 Thu, 29 Jun 2023 02:13:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=s/nEDedQ;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=65441b46f9=changqing.li@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id 35T8bMu0008564
	for <openembedded-core@lists.openembedded.org>; Thu, 29 Jun 2023 02:13:21 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=PPS06212021; bh=sC/sF
	Ja4n0pDtNwkJebExmxpXBWkCs80ic9ug024ckA=; b=s/nEDedQdGvloqTh3p4iI
	a7o1nbrnQoYP9EY3FVSne39kZffvxkoQJPMw+pw5I+8mAKn1ZQ/mwB8ryUG7iabU
	dCIjs7vI8XZB5Mv/f1WAmb7zGcF1XWbMk/QEkMUTzK2BLxHWCKh6U7Y3tHTAsqCL
	asG3m/Io6Y6Ygf/f3+1qBwb8gPhNgAwGvkmyW/yjaBGWqv9tHJ7Dch9Mmq5iAIx4
	g5HprhsPnmGzQDtQ2KFXUV4fedyteS6Lm/3yAHxPNGoEyd5xHz6NuHdG/hkmaUnR
	3mV/0zyx/5u0c1SPbKtA53iyoJGXQwPci/w0U/5eD4RJI7PI9DglJyYiJ/AvD4tQ
	A==
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3regfb3w7f-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 29 Jun 2023 02:13:20 -0700 (PDT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Thu, 29 Jun 2023 02:13:20 -0700
Received: from pek-lpg-core2.wrs.com (128.224.153.41) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.27 via Frontend Transport; Thu, 29 Jun 2023 02:13:19 -0700
From: <changqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [master][PATCH] systemd: fix a dead link under /var/log
Date: Thu, 29 Jun 2023 17:13:18 +0800
Message-ID: <20230629091318.1038965-1-changqing.li@windriver.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: KKkTDB4ulnqjFQFTXXjMnX1yCLHzkJUo
X-Proofpoint-ORIG-GUID: KKkTDB4ulnqjFQFTXXjMnX1yCLHzkJUo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-06-29_01,2023-06-27_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999 spamscore=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 phishscore=0
 bulkscore=0 impostorscore=0 mlxscore=0 suspectscore=0 malwarescore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2305260000 definitions=main-2306290081
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 29 Jun 2023 09:13:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183612

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

So remove this symlink from package systemd, and create legacy-doc.conf,
only create the symlink when systemd-doc is installed.

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 ...on-t-create-symlink-README-in-this-f.patch | 42 +++++++++++++++++++
 ....in-split-out-the-doc-related-config.patch | 41 ++++++++++++++++++
 meta/recipes-core/systemd/systemd_253.3.bb    |  3 ++
 3 files changed, 86 insertions(+)
 create mode 100644 meta/recipes-core/systemd/systemd/0001-legacy.conf.in-Don-t-create-symlink-README-in-this-f.patch
 create mode 100644 meta/recipes-core/systemd/systemd/0002-legacy-doc.conf.in-split-out-the-doc-related-config.patch

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
diff --git a/meta/recipes-core/systemd/systemd/0002-legacy-doc.conf.in-split-out-the-doc-related-config.patch b/meta/recipes-core/systemd/systemd/0002-legacy-doc.conf.in-split-out-the-doc-related-config.patch
new file mode 100644
index 0000000000..47af64f12f
--- /dev/null
+++ b/meta/recipes-core/systemd/systemd/0002-legacy-doc.conf.in-split-out-the-doc-related-config.patch
@@ -0,0 +1,41 @@
+From 865974a2f268ae6b4dab4f37ba39d86e6600180d Mon Sep 17 00:00:00 2001
+From: Changqing Li <changqing.li@windriver.com>
+Date: Wed, 28 Jun 2023 16:00:13 +0800
+Subject: [PATCH 2/2] legacy-doc.conf.in: split out the doc related config
+
+split out the doc related config, only install this when
+package systemd-doc is installed.
+
+Upstream-Status: Inappropriate [oe specific]
+
+Signed-off-by: Changqing Li <changqing.li@windriver.com>
+---
+ tmpfiles.d/legacy-doc.conf.in | 3 +++
+ tmpfiles.d/meson.build        | 1 +
+ 2 files changed, 4 insertions(+)
+ create mode 100644 tmpfiles.d/legacy-doc.conf.in
+
+diff --git a/tmpfiles.d/legacy-doc.conf.in b/tmpfiles.d/legacy-doc.conf.in
+new file mode 100644
+index 0000000000..9b1cef5a18
+--- /dev/null
++++ b/tmpfiles.d/legacy-doc.conf.in
+@@ -0,0 +1,3 @@
++{% if CREATE_LOG_DIRS %}
++L /var/log/README - - - - {{DOC_DIR}}/README.logs
++{% endif %}
+diff --git a/tmpfiles.d/meson.build b/tmpfiles.d/meson.build
+index 4d94e3743f..f78bddf136 100644
+--- a/tmpfiles.d/meson.build
++++ b/tmpfiles.d/meson.build
+@@ -31,6 +31,7 @@ endforeach
+ 
+ in_files = [['etc.conf',                      ''],
+             ['legacy.conf',                   'HAVE_SYSV_COMPAT'],
++            ['legacy-doc.conf',               'HAVE_SYSV_COMPAT'],
+             ['static-nodes-permissions.conf', ''],
+             ['systemd.conf',                  ''],
+             ['var.conf',                      ''],
+-- 
+2.25.1
+
diff --git a/meta/recipes-core/systemd/systemd_253.3.bb b/meta/recipes-core/systemd/systemd_253.3.bb
index 87fbf6f785..7db25db617 100644
--- a/meta/recipes-core/systemd/systemd_253.3.bb
+++ b/meta/recipes-core/systemd/systemd_253.3.bb
@@ -28,6 +28,8 @@ SRC_URI += " \
            file://0004-Move-sysusers.d-sysctl.d-binfmt.d-modules-load.d-to-.patch \
            file://27254.patch \
            file://27253.patch \
+           file://0001-legacy.conf.in-Don-t-create-symlink-README-in-this-f.patch \
+           file://0002-legacy-doc.conf.in-split-out-the-doc-related-config.patch \
            "
 
 # patches needed by musl
@@ -760,6 +762,7 @@ FILES:udev += "${base_sbindir}/udevd \
 
 FILES:udev-hwdb = "${rootlibexecdir}/udev/hwdb.d \
                    "
+FILES:${PN}-doc += "${exec_prefix}/lib/tmpfiles.d/legacy-doc.conf"
 
 RCONFLICTS:${PN} = "tiny-init ${@bb.utils.contains('PACKAGECONFIG', 'resolved', 'resolvconf', '', d)}"
 
-- 
2.25.1


