Return-Path: <changqing.li@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8ACEEB64D9
	for <webhook@archiver.kernel.org>; Thu, 29 Jun 2023 10:15:44 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.5001.1688033734472602133
 for <openembedded-core@lists.openembedded.org>;
 Thu, 29 Jun 2023 03:15:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=qvAAXT9/;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=65441b46f9=changqing.li@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id 35T9i1bb017967
	for <openembedded-core@lists.openembedded.org>; Thu, 29 Jun 2023 10:15:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=PPS06212021; bh=OPiHo
	w5qrDDEkxiEOF+6ZVj7s26YWM6Ec830tMnQYpI=; b=qvAAXT9/u5vsx5n8rYUQH
	NNl6mwVAuEWuYCt1FDFbxUxMWj3ybhJqPQSZnD7cOfimlq92d9FZaas7EDTppDjL
	jPEaIVZ1dFCRBL+6QS8qry9qScPJFYQL87roaIB2r0JhdmqZS+M7jPDBommtogRi
	eCCSmhIzgNx29OMe1loDQCP0Bxsy1pgZAW98PF7Zqv7IC9wySj37kgKGJRHunYmJ
	sL17QDQILuxkEaOYhBxo8cOAs7UVLJLj7DBpjQ6M/+nJcFeDHHbtWMUL8Hkr8CyL
	khq6Xy6zwpxoJ2iHEuHYbDAwWVW6B985vaxom3wO2xMhpCmp3m+8CBKqb92ipZjZ
	g==
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3rdpqb4qy5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 29 Jun 2023 10:15:33 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Thu, 29 Jun 2023 03:15:32 -0700
Received: from pek-lpg-core2.wrs.com (128.224.153.41) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.27 via Frontend Transport; Thu, 29 Jun 2023 03:15:31 -0700
From: <changqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [mickledore][PATCH V2] systemd: fix a dead link under /var/log
Date: Thu, 29 Jun 2023 18:15:30 +0800
Message-ID: <20230629101530.4039561-1-changqing.li@windriver.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: Phu8CT5NLgTT-Fc47Sdm7VnbapLSTt-g
X-Proofpoint-GUID: Phu8CT5NLgTT-Fc47Sdm7VnbapLSTt-g
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-06-29_02,2023-06-27_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 adultscore=0
 spamscore=0 phishscore=0 impostorscore=0 lowpriorityscore=0 malwarescore=0
 suspectscore=0 clxscore=1015 mlxlogscore=454 bulkscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2305260000 definitions=main-2306290091
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 29 Jun 2023 10:15:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183617

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
 meta/recipes-core/systemd/systemd_253.1.bb    |  1 +
 2 files changed, 43 insertions(+)
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
diff --git a/meta/recipes-core/systemd/systemd_253.1.bb b/meta/recipes-core/systemd/systemd_253.1.bb
index f306765168..59a0ab757f 100644
--- a/meta/recipes-core/systemd/systemd_253.1.bb
+++ b/meta/recipes-core/systemd/systemd_253.1.bb
@@ -25,6 +25,7 @@ SRC_URI += " \
            file://0002-binfmt-Don-t-install-dependency-links-at-install-tim.patch \
            file://0008-implment-systemd-sysv-install-for-OE.patch \
            file://0004-Move-sysusers.d-sysctl.d-binfmt.d-modules-load.d-to-.patch \
+           file://0001-legacy.conf.in-Don-t-create-symlink-README-in-this-f.patch \
            "
 
 # patches needed by musl
-- 
2.25.1


