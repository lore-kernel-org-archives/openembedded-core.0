Received: from mail5.wrs.com (mail5.wrs.com [192.103.53.11])
 by mx.groups.io with SMTP id smtpd.web12.5681.1585991502956687249
 for <openembedded-core@lists.openembedded.org>;
 Sat, 04 Apr 2020 02:11:43 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 192.103.53.11, mailfrom: yi.zhao@windriver.com)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com [147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id 0349BLW5030915
	(version=TLSv1 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Sat, 4 Apr 2020 02:11:31 -0700
Received: from localhost (128.224.162.174) by ALA-HCA.corp.ad.wrs.com
 (147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.487.0; Sat, 4 Apr
 2020 02:11:10 -0700
From: "Yi Zhao" <yi.zhao@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH] busybox: sysctl: ignore EIO of stable_secret below /proc/sys/net/ipv6/conf
Date: Sat, 4 Apr 2020 17:11:08 +0800
Message-ID: <20200404091108.28857-1-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [128.224.162.174]
Content-Type: text/plain

Avoid confusing messages caused by EIO on reading
/proc/sys/net/ipv6/conf/*/stable_secret if those are not set yet.
Make it behave the same as procps(>=3.3.13).

Fixes:
$ sysctl -a | grep ipv6.conf | grep stable_secret
sysctl: error reading key 'net.ipv6.conf.all.stable_secret': Input/output error
sysctl: error reading key 'net.ipv6.conf.default.stable_secret': Input/output error
sysctl: error reading key 'net.ipv6.conf.eth0.stable_secret': Input/output error
sysctl: error reading key 'net.ipv6.conf.lo.stable_secret': Input/output error

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 ...O-of-stable_secret-below-proc-sys-ne.patch | 40 +++++++++++++++++++
 meta/recipes-core/busybox/busybox_1.31.1.bb   |  1 +
 2 files changed, 41 insertions(+)
 create mode 100644 meta/recipes-core/busybox/busybox/0001-sysctl-ignore-EIO-of-stable_secret-below-proc-sys-ne.patch

diff --git a/meta/recipes-core/busybox/busybox/0001-sysctl-ignore-EIO-of-stable_secret-below-proc-sys-ne.patch b/meta/recipes-core/busybox/busybox/0001-sysctl-ignore-EIO-of-stable_secret-below-proc-sys-ne.patch
new file mode 100644
index 0000000000..9f58eaef67
--- /dev/null
+++ b/meta/recipes-core/busybox/busybox/0001-sysctl-ignore-EIO-of-stable_secret-below-proc-sys-ne.patch
@@ -0,0 +1,40 @@
+From 3bee0460d74bad88eca6592e63ca926961b43b67 Mon Sep 17 00:00:00 2001
+From: Yi Zhao <yi.zhao@windriver.com>
+Date: Fri, 6 Mar 2020 16:09:26 +0800
+Subject: [PATCH] sysctl: ignore EIO of stable_secret below
+ /proc/sys/net/ipv6/conf
+
+Avoid confusing messages caused by EIO on reading
+/proc/sys/net/ipv6/conf/*/stable_secret if those are not set yet.
+Make it behave the same as procps(>=3.3.13).
+
+Upstream-Status: Submitted [busybox@busybox.net mailing list]
+
+Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
+---
+ procps/sysctl.c | 9 ++++++++-
+ 1 file changed, 8 insertions(+), 1 deletion(-)
+
+diff --git a/procps/sysctl.c b/procps/sysctl.c
+index 6d77185ca..42c51cc91 100644
+--- a/procps/sysctl.c
++++ b/procps/sysctl.c
+@@ -202,7 +202,14 @@ static int sysctl_act_on_setting(char *setting)
+ 		value = cptr = xmalloc_read(fd, NULL);
+ 		close(fd);
+ 		if (value == NULL) {
+-			bb_perror_msg("error reading key '%s'", outname);
++			switch (errno) {
++				case EIO:
++					/* Ignore stable_secret below /proc/sys/net/ipv6/conf */
++					break;
++				default:
++					bb_perror_msg("error reading key '%s'", outname);
++					break;
++			}
+ 			retval = EXIT_FAILURE;
+ 			goto end;
+ 		}
+-- 
+2.17.1
+
diff --git a/meta/recipes-core/busybox/busybox_1.31.1.bb b/meta/recipes-core/busybox/busybox_1.31.1.bb
index ec5b580442..2bb1d59ba7 100644
--- a/meta/recipes-core/busybox/busybox_1.31.1.bb
+++ b/meta/recipes-core/busybox/busybox_1.31.1.bb
@@ -47,6 +47,7 @@ SRC_URI = "https://busybox.net/downloads/busybox-${PV}.tar.bz2;name=tarball \
            file://0003-runsv-Use-64-prefix-syscall-if-we-have-to.patch \
            file://0001-Remove-syscall-wrappers-around-clock_gettime-closes-.patch \
            file://0001-Remove-stime-function-calls.patch \
+           file://0001-sysctl-ignore-EIO-of-stable_secret-below-proc-sys-ne.patch \
 "
 SRC_URI_append_libc-musl = " file://musl.cfg "
 
-- 
2.17.1

