Return-Path: <randy.macleod@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34FF0C4332F
	for <webhook@archiver.kernel.org>; Wed,  1 Nov 2023 00:54:36 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.11988.1698800066452207074
 for <openembedded-core@lists.openembedded.org>;
 Tue, 31 Oct 2023 17:54:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=tDLdHrCi;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=96695488e0=randy.macleod@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id 3A10K2lf016129
	for <openembedded-core@lists.openembedded.org>; Wed, 1 Nov 2023 00:54:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:content-type; s=
	PPS06212021; bh=t4+rlaHzms+qdBDAeileOWmMtLeBFKfZH1l9aKc8m54=; b=
	tDLdHrCiR+pMhNQ3dSyN1M8n/njLkX7yt8FTzJrGkJmdNVXL7giG2Uq6tr0jXF3j
	N2L/eYCfXIWV1Coz8G0GGma/quAMPTgkpwv8yQH35EOrJWNGhRXR1snOunjQ3P7T
	7UCk+MDNoihZgcfOJNKdZgNmWAUeLTCSgTf3jkR88fzZDv7tGQb6bzGv5veDoNkP
	hTv3fxVp5JN+YBVyLrfwWJ5+2piShLHS5RygSjqlvNhpmRsyknn1C38lF3JsHZxH
	YG5Yoqfw68zQ7ZkDwwsODYhrE7MZ13bVpD4NF620AporUyP6AUKueEeyA+JHV1Tq
	J/iAe+EBSVwevjL4jQI00A==
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3u0s96cakx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 01 Nov 2023 00:54:25 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Tue, 31 Oct 2023 17:54:26 -0700
Received: from ala-lpggp3.wrs.com (147.11.105.124) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.34 via Frontend Transport; Tue, 31 Oct 2023 17:54:26 -0700
From: <Randy.MacLeod@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH] strace: upgrade 6.5 -> 6.6
Date: Tue, 31 Oct 2023 17:54:23 -0700
Message-ID: <20231101005423.470940-1-Randy.MacLeod@windriver.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <179355FD3F4001E8.25237@lists.openembedded.org>
References: <179355FD3F4001E8.25237@lists.openembedded.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: PnAk1UgO9b0E5ILNc0WgXlLAzcN_cjBk
X-Proofpoint-GUID: PnAk1UgO9b0E5ILNc0WgXlLAzcN_cjBk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-31_10,2023-10-31_03,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 phishscore=0
 spamscore=0 priorityscore=1501 malwarescore=0 suspectscore=0
 lowpriorityscore=0 impostorscore=0 bulkscore=0 mlxlogscore=906 mlxscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2310240000 definitions=main-2311010005
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Nov 2023 00:54:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189892

From: Randy MacLeod <Randy.MacLeod@windriver.com>

Update the COPYING checksum; only the copyright date changed.

Noteworthy changes in strace 6.6 (2023-10-31)
=============================================

* Improvements
  * Implemented --kill-on-exit option that instructs the tracer to set
    PTRACE_O_EXITKILL option to all tracee processes and not to detach them
    on cleanup so they will not be left running after the tracer exit.
  * Implemented automatic activation of --kill-on-exit option when
    --seccomp-bpf is enabled and -p/--attach option is not used.
  * Implemented decoding of map_shadow_stack syscall.
  * Implemented decoding of FSCONFIG_CMD_CREATE_EXCL fsconfig command.
  * Implemented decoding of IFLA_BRPORT_BACKUP_NHID netlink attribute.
  * Implemented decoding of SECCOMP_IOCTL_NOTIF_SET_FLAGS ioctl.
  * Implemented decoding of UFFDIO_CONTINUE, UFFDIO_POISON, and
    UFFDIO_WRITEPROTECT ioctls.
  * Updated lists of ARCH_*, BPF_*, DEVCONF_*, IORING_*, KEXEC_*, MAP_*, NT_*,
    PTRACE_*, QFMT_*, SEGV_*, UFFD_*, V4L2_*, and XDP_* constants.
  * Updated lists of ioctl commands from Linux 6.6.

ptest-runner results on qemux86-64/kvm with qemuparms="-m 1024 -smp 4":
============================================================================
Testsuite summary for strace 6.6
============================================================================
============================================================================

Signed-off-by: Randy MacLeod <Randy.MacLeod@windriver.com>
---
 .../strace/tests-fix-so_peerpidfd-test.patch  | 32 -------------------
 .../strace/{strace_6.5.bb => strace_6.6.bb}   |  5 ++-
 2 files changed, 2 insertions(+), 35 deletions(-)
 delete mode 100644 meta/recipes-devtools/strace/strace/tests-fix-so_peerpidfd-test.patch
 rename meta/recipes-devtools/strace/{strace_6.5.bb => strace_6.6.bb} (90%)

diff --git a/meta/recipes-devtools/strace/strace/tests-fix-so_peerpidfd-test.patch b/meta/recipes-devtools/strace/strace/tests-fix-so_peerpidfd-test.patch
deleted file mode 100644
index 62f73d3643..0000000000
--- a/meta/recipes-devtools/strace/strace/tests-fix-so_peerpidfd-test.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-From 44cf51a38cce1e90bb6c22208fa45f95cdcc8f5d Mon Sep 17 00:00:00 2001
-From: "Dmitry V. Levin" <ldv@strace.io>
-Date: Sat, 14 Oct 2023 08:00:00 +0000
-Subject: [PATCH] tests: fix so_peerpidfd test
-
-* tests/so_peerpidfd.c (print_pidfd): Fix expected output.
-
-Fixes: v6.5~38 "net: implement decoding of SO_PEERPIDFD socket option"
-Resolves: https://bugzilla.redhat.com/show_bug.cgi?id=2243631
-
-Upstream-Status: Backport [https://github.com/strace/strace/commit/44cf51a38cce1e90bb6c22208fa45f95cdcc8f5d]
-Signed-off-by: Randy MacLeod <Randy.MacLeod@windriver.com>
----
- tests/so_peerpidfd.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/tests/so_peerpidfd.c b/tests/so_peerpidfd.c
-index 33988edec..dfad1c434 100644
---- a/tests/so_peerpidfd.c
-+++ b/tests/so_peerpidfd.c
-@@ -37,7 +37,7 @@ print_pidfd(int *p)
- 	if (rc < 0)
- 		printf("%p", p);
- 	else
--		printf("%d%s", *p, pidfd_suffix);
-+		printf("[%d%s]", *p, pidfd_suffix);
- }
- 
- static void
--- 
-2.34.1
-
diff --git a/meta/recipes-devtools/strace/strace_6.5.bb b/meta/recipes-devtools/strace/strace_6.6.bb
similarity index 90%
rename from meta/recipes-devtools/strace/strace_6.5.bb
rename to meta/recipes-devtools/strace/strace_6.6.bb
index d1536b1e8d..a3de7941cf 100644
--- a/meta/recipes-devtools/strace/strace_6.5.bb
+++ b/meta/recipes-devtools/strace/strace_6.6.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "http://strace.io"
 DESCRIPTION = "strace is a diagnostic, debugging and instructional userspace utility for Linux. It is used to monitor and tamper with interactions between processes and the Linux kernel, which include system calls, signal deliveries, and changes of process state."
 SECTION = "console/utils"
 LICENSE = "LGPL-2.1-or-later & GPL-2.0-or-later"
-LIC_FILES_CHKSUM = "file://COPYING;md5=59a33f0a3e6122d67c0b3befccbdaa6b"
+LIC_FILES_CHKSUM = "file://COPYING;md5=63c8c3eb5c71b4362edac1397f40bdc7"
 
 SRC_URI = "https://strace.io/files/${PV}/strace-${PV}.tar.xz \
            file://update-gawk-paths.patch \
@@ -14,9 +14,8 @@ SRC_URI = "https://strace.io/files/${PV}/strace-${PV}.tar.xz \
            file://skip-load.patch \
            file://0001-configure-Use-autoconf-macro-to-detect-largefile-sup.patch \
            file://0002-tests-Replace-off64_t-with-off_t.patch \
-           file://tests-fix-so_peerpidfd-test.patch \
            "
-SRC_URI[sha256sum] = "dfb051702389e1979a151892b5901afc9e93bbc1c70d84c906ade3224ca91980"
+SRC_URI[sha256sum] = "421b4186c06b705163e64dc85f271ebdcf67660af8667283147d5e859fc8a96c"
 
 inherit autotools ptest
 
-- 
2.42.0


