Return-Path: <changqing.li@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4D5CC54E64
	for <webhook@archiver.kernel.org>; Mon, 25 Mar 2024 04:47:19 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.45128.1711342035222223344
 for <openembedded-core@lists.openembedded.org>;
 Sun, 24 Mar 2024 21:47:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=HcZGC1KD;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=381448aa7f=changqing.li@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 42P3iiAk029358
	for <openembedded-core@lists.openembedded.org>; Mon, 25 Mar 2024 04:47:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=PPS06212021; bh=/F8f7
	4axr5jzelMVzCxX2X42AvpAvaUhoMp1FQIMZEg=; b=HcZGC1KDJhvLtgfF1b4lQ
	pSlpIDcTeilx3KEQWtUi18LvK7e15QcXRBX7rXBqROd8wQb+wOUD8thh5HDVMCD4
	o9o9cYpYgMdYlF29YPL4z9hcUDYmXRPQMv4d7UE5uzQnRKHvHhDnVwAvPJAiqL5X
	UNDSSr3DQ7yOkhT4oGPgEik7wD2NS4UKgCrd7bfb2zhHD322hFB8PUNxEWmJGOYx
	+iEToCdJjk+/ZZAmAAA2xNdFcYgZ8S4uB+TQ0Yy3o6CNA/AFgkr6zzKxE55sUGnh
	UvHHA9pmENd6RTrIWnZD+wCrFy3AiZuda51yL/HPf85nLrRhESECHWLRkvkkgBiC
	w==
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3x1p26j0gu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 25 Mar 2024 04:47:14 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.37; Sun, 24 Mar 2024 21:47:13 -0700
Received: from pek-lpg-core2.wrs.com (128.224.153.41) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.37 via Frontend Transport; Sun, 24 Mar 2024 21:47:12 -0700
From: <changqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH] dnf: fix Exception handling for class ProcessLock
Date: Mon, 25 Mar 2024 12:47:11 +0800
Message-ID: <20240325044711.819158-1-changqing.li@windriver.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: QqAZd5hMxn988IzI9lFZerqgcCU2TbY2
X-Proofpoint-GUID: QqAZd5hMxn988IzI9lFZerqgcCU2TbY2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-03-25_01,2024-03-21_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999
 impostorscore=0 adultscore=0 mlxscore=0 priorityscore=1501 malwarescore=0
 lowpriorityscore=0 clxscore=1015 phishscore=0 bulkscore=0 suspectscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2403210001 definitions=main-2403250024
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 25 Mar 2024 04:47:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197480

From: Changqing Li <changqing.li@windriver.com>

Yocto based systems will sometimes have log_lock.pid left in target
filesystems.  Users typing 'ls /' will notice it, and will never be
removed.

It happened when log rotate happened, refer [1], since the problem
descripted in patch 0001-lock.py-fix-Exception-handling.patch, file
log_lock.pid will not be removed after dnf exit. For target system,
refer [4], dnf have a solution to remove it. But for OE, refer commit
[2][3], for fix another issue, OE changed log_lock.pid to root dir for
native dnf, so solution in [4] not works for log_lock.pid under "/", so
it will always exist under "/" of target system.

Use patch 0001-lock.py-fix-Exception-handling.patch to fix the problem.

[1] https://github.com/rpm-software-management/dnf/blob/a6d82221ae32045f0f788708a52d2f2bf5c5740b/dnf/logging.py#L127C31-L127C42
[2] https://git.openembedded.org/openembedded-core/commit/?id=742a1b71249f4da1c8d8e13e270b0eb6128a3f66
[3] https://git.openembedded.org/openembedded-core/commit/?id=7610f81586bd475f28fd3d89a7350771720c3264
[4] https://github.com/rpm-software-management/dnf/blob/master/etc/tmpfiles.d/dnf.conf

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 .../0001-lock.py-fix-Exception-handling.patch | 62 +++++++++++++++++++
 meta/recipes-devtools/dnf/dnf_4.19.0.bb       |  1 +
 2 files changed, 63 insertions(+)
 create mode 100644 meta/recipes-devtools/dnf/dnf/0001-lock.py-fix-Exception-handling.patch

diff --git a/meta/recipes-devtools/dnf/dnf/0001-lock.py-fix-Exception-handling.patch b/meta/recipes-devtools/dnf/dnf/0001-lock.py-fix-Exception-handling.patch
new file mode 100644
index 0000000000..6bffe9af0a
--- /dev/null
+++ b/meta/recipes-devtools/dnf/dnf/0001-lock.py-fix-Exception-handling.patch
@@ -0,0 +1,62 @@
+From 3881757eabfde2ff54400ab127b106ab085d83f0 Mon Sep 17 00:00:00 2001
+From: Changqing Li <changqing.li@windriver.com>
+Date: Wed, 13 Mar 2024 11:22:05 +0800
+Subject: [PATCH] lock.py: fix Exception handling
+
+Before, when logdir is not writable, _try_lock will raise an Exception
+like "Permission denied: '/var/log/log_lock.pid'", and in this case,
+_unlock_thread will not be called and the variable count will not be
+handled, it maybe cause log_lock.pid not be deleted in case like [1].
+
+For [1], it is an cross compile case, when dnf install some packages to
+rootfs, seems like some threads don't do chroot like work, some threads
+do chroot like work. so for the threads don't do chroot, "Permission denied"
+Exception happend, for the threads that do chroot, log_lock.pid will be
+created under installroot/var/log/log_lock.pid, since variable count not
+handled correct before, log_lock.pid may not be deleted correctly.
+
+So fixed like this, if _try_lock raise Exception, _unlock_thread first,
+then raise the Exception.
+
+[1] https://github.com/rpm-software-management/dnf/issues/1963
+
+Upstream-Status: Submitted [ https://github.com/rpm-software-management/dnf/pull/2065 ]
+
+Signed-off-by: Changqing Li <changqing.li@windriver.com>
+---
+ dnf/lock.py | 12 ++++++++++--
+ 1 file changed, 10 insertions(+), 2 deletions(-)
+
+diff --git a/dnf/lock.py b/dnf/lock.py
+index 6817aac9..5718062a 100644
+--- a/dnf/lock.py
++++ b/dnf/lock.py
+@@ -128,7 +128,11 @@ class ProcessLock(object):
+         self._lock_thread()
+         prev_pid = -1
+         my_pid = os.getpid()
+-        pid = self._try_lock(my_pid)
++        try:
++            pid = self._try_lock(my_pid)
++        except Exception:
++            self._unlock_thread()
++            raise
+         while pid != my_pid:
+             if pid != -1:
+                 if not self.blocking:
+@@ -140,7 +144,11 @@ class ProcessLock(object):
+                     logger.info(msg)
+                     prev_pid = pid
+             time.sleep(1)
+-            pid = self._try_lock(my_pid)
++            try:
++                pid = self._try_lock(my_pid)
++            except Exception:
++                self._unlock_thread()
++                raise
+ 
+     def __exit__(self, *exc_args):
+         if self.count == 1:
+-- 
+2.25.1
+
diff --git a/meta/recipes-devtools/dnf/dnf_4.19.0.bb b/meta/recipes-devtools/dnf/dnf_4.19.0.bb
index 784d7a94b3..184dbea963 100644
--- a/meta/recipes-devtools/dnf/dnf_4.19.0.bb
+++ b/meta/recipes-devtools/dnf/dnf_4.19.0.bb
@@ -15,6 +15,7 @@ SRC_URI = "git://github.com/rpm-software-management/dnf.git;branch=master;protoc
            file://0029-Do-not-set-PYTHON_INSTALL_DIR-by-running-python.patch \
            file://0030-Run-python-scripts-using-env.patch \
            file://0001-set-python-path-for-completion_helper.patch \
+           file://0001-lock.py-fix-Exception-handling.patch \
            "
 
 SRC_URI:append:class-native = "file://0001-dnf-write-the-log-lock-to-root.patch"
-- 
2.25.1


