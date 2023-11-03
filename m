Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ABCE8C4167D
	for <webhook@archiver.kernel.org>; Fri,  3 Nov 2023 07:23:43 +0000 (UTC)
Received: from esa1.hc1455-7.c3s2.iphmx.com (esa1.hc1455-7.c3s2.iphmx.com [207.54.90.47])
 by mx.groups.io with SMTP id smtpd.web10.37745.1698996217036339948
 for <openembedded-core@lists.openembedded.org>;
 Fri, 03 Nov 2023 00:23:37 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 207.54.90.47, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10882"; a="138277551"
X-IronPort-AV: E=Sophos;i="6.03,273,1694703600"; 
   d="scan'208";a="138277551"
Received: from unknown (HELO yto-r2.gw.nic.fujitsu.com) ([218.44.52.218])
  by esa1.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Nov 2023 16:23:35 +0900
Received: from yto-m2.gw.nic.fujitsu.com (yto-nat-yto-m2.gw.nic.fujitsu.com [192.168.83.65])
	by yto-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 7176BD6187
	for <openembedded-core@lists.openembedded.org>; Fri,  3 Nov 2023 16:23:32 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id BA2BED5EA9
	for <openembedded-core@lists.openembedded.org>; Fri,  3 Nov 2023 16:23:31 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.79])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id D4D2B20050190;
	Fri,  3 Nov 2023 16:23:30 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] strace: upgrade 6.5 -> 6.6
Date: Fri,  3 Nov 2023 15:22:41 +0800
Message-Id: <1698996161-30622-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-27974.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-27974.005
X-TMASE-Result: 10-1.431300-10.000000
X-TMASE-MatchedRID: 19A9OAtP7iyjz0nOeth/yUIIxwDaU5mrWvaFnGMIvOp2HZGDrssVUuMb
	uVzdyYYa9kNGk0VfW+wpD43V2FP3DAbzCeTmmyGa8IK7yRWPRNErYYq12IWZOb42hLbi424DhJZ
	SwHMhdjAILxoCYZ47qepe9co8GDkGZWMJGq5h2T4ReM8i8p3vgFQQ0EgzIoPR/rvCkqsgk0GFCE
	XgvpRi0kt3JMYo6tHpJcXO7GpUNpeFN+rLTUN6BNyBRU/cKn6981hDEI6KFM1gDeovr2tertKfQ
	2mUc6DdWORIf0s6IlYbZCwxx1sbMsWQ1BiO6SCPqoeab9Xgz89wPaoXw5wK6gIZ++dWnH7bnptr
	8PnHpyni8zVgXoAltlPcOF1Vw1gmC24oEZ6SpSmcfuxsiY4QFIrBz7aHw9uVbi9vGPXJThGzWYm
	oXteElCa23wsq3NycFW9RNp7W7IYO1CVM+qV/2ORSYpHKDxv5aLjj8xXd6oEoRJMIyPkNyOx9n1
	XpDqsJmC9SiJioatWbjnu8jwgbwH9jicWwFYB0PpCuffGH9zI=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 03 Nov 2023 07:23:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190122

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
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

License-Update: Copyright year updated to 2023.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta/recipes-devtools/strace/{strace_6.5.bb => strace_6.6.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/strace/{strace_6.5.bb => strace_6.6.bb} (93%)

diff --git a/meta/recipes-devtools/strace/strace_6.5.bb b/meta/recipes-devtools/strace/strace_6.6.bb
similarity index 93%
rename from meta/recipes-devtools/strace/strace_6.5.bb
rename to meta/recipes-devtools/strace/strace_6.6.bb
index d6475e8db9..a7506515b3 100644
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
@@ -16,7 +16,7 @@ SRC_URI = "https://strace.io/files/${PV}/strace-${PV}.tar.xz \
            file://0002-tests-Replace-off64_t-with-off_t.patch \
            file://skip-test-so_peerpidfd.gen.test.patch \
            "
-SRC_URI[sha256sum] = "dfb051702389e1979a151892b5901afc9e93bbc1c70d84c906ade3224ca91980"
+SRC_URI[sha256sum] = "421b4186c06b705163e64dc85f271ebdcf67660af8667283147d5e859fc8a96c"
 
 inherit autotools ptest
 
-- 
2.34.1


