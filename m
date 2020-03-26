Received: from mga04.intel.com (mga04.intel.com [])
 by mx.groups.io with SMTP id smtpd.web10.32965.1585212831047026777
 for <openembedded-core@lists.openembedded.org>;
 Thu, 26 Mar 2020 01:53:54 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: intel.com, ip: <nil>, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: r0mNX/sLz13q2v1/9aWfVTr4jr4AIPifAL1kKx1cW7qOfjHH3IIdrLBxlWCiM0/fZenkZ7bFZW
 cJSRyrgz4u4Q==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Mar 2020 01:53:55 -0700
IronPort-SDR: tl2Itj7fcC2cqg24MI3/Pw/EGv1XqN6OcDhTxlE5O6iDnwyTQv2NXJ3B5JqYgvTKmDAgjLqpe4
 SYwuPidUW6ZQ==
X-IronPort-AV: E=Sophos;i="5.72,307,1580803200"; 
   d="scan'208";a="420621853"
Received: from andromeda02.png.intel.com ([10.221.183.11])
  by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-SHA; 26 Mar 2020 01:53:53 -0700
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [zeus][PATCH 4/9] nfs-utils: Disable statx if using glibc emulation
Date: Thu, 26 Mar 2020 16:53:31 +0800
Message-Id: <8cbd6f6f7f10c57b27a1388883a6dc5715610600.1585211896.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1585211896.git.anuj.mittal@intel.com>
References: <cover.1585211896.git.anuj.mittal@intel.com>
In-Reply-To: <cover.1585211896.git.anuj.mittal@intel.com>
References: <cover.1585211896.git.anuj.mittal@intel.com>

From: Julius Hemanth Pitti <jpitti@cisco.com>

nfs-utils 2.4.1, moves from "stat" to "statx
with AT_STATX_DONT_SYNC" in parts of the code.

statx is supported in Linux kernel v4.11 and above.
For all older kernels glibc emulates statx, and it
doesn't support AT_STATX_DONT_SYNC and will return
EINVAL.

When server uses nfs-utils 2.4.1 on kernel v4.10
and older, mount.nfs4 would fail with error
"reason given by server: No such file or directory".

Since Linux v4.4 and v4.9 are LTS, its more likely
that people would use above combination.

This issue has been fixed in nfs-utils 2.4.3 and
above. Backporting fix to 2.4.1.

Signed-off-by: Julius Hemanth Pitti <jpitti@cisco.com>
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 ...01-Disable-statx-if-using-glibc-emulation.patch | 34 ++++++++++++++++++++++
 .../nfs-utils/nfs-utils_2.4.1.bb                   |  1 +
 2 files changed, 35 insertions(+)
 create mode 100644 meta/recipes-connectivity/nfs-utils/nfs-utils/0001-Disable-statx-if-using-glibc-emulation.patch

diff --git a/meta/recipes-connectivity/nfs-utils/nfs-utils/0001-Disable-statx-if-using-glibc-emulation.patch b/meta/recipes-connectivity/nfs-utils/nfs-utils/0001-Disable-statx-if-using-glibc-emulation.patch
new file mode 100644
index 0000000..98b1391
--- /dev/null
+++ b/meta/recipes-connectivity/nfs-utils/nfs-utils/0001-Disable-statx-if-using-glibc-emulation.patch
@@ -0,0 +1,34 @@
+From ff3ad88c233ecd87f7983ad13836323f944540ec Mon Sep 17 00:00:00 2001
+From: Doug Nazar <nazard@nazar.ca>
+Date: Mon, 9 Dec 2019 10:53:37 -0500
+Subject: [PATCH] Disable statx if using glibc emulation
+
+On older kernels without statx, glibc with statx support will attempt
+to emulate the call. However it doesn't support AT_STATX_DONT_SYNC and
+will return EINVAL. This causes all xstat/xlstat calls to fail.
+
+Upstream-Status: Backport
+
+Signed-off-by: Doug Nazar <nazard@nazar.ca>
+Signed-off-by: Steve Dickson <steved@redhat.com>
+---
+ support/misc/xstat.c | 3 +++
+ 1 file changed, 3 insertions(+)
+
+diff --git a/support/misc/xstat.c b/support/misc/xstat.c
+index 661e29e4..a438fbcc 100644
+--- a/support/misc/xstat.c
++++ b/support/misc/xstat.c
+@@ -51,6 +51,9 @@ statx_do_stat(int fd, const char *pathname, struct stat *statbuf, int flags)
+ 			statx_copy(statbuf, &stxbuf);
+ 			return 0;
+ 		}
++		/* glibc emulation doesn't support AT_STATX_DONT_SYNC */
++		if (errno == EINVAL)
++			errno = ENOSYS;
+ 		if (errno == ENOSYS)
+ 			statx_supported = 0;
+ 	} else
+-- 
+2.19.1
+
diff --git a/meta/recipes-connectivity/nfs-utils/nfs-utils_2.4.1.bb b/meta/recipes-connectivity/nfs-utils/nfs-utils_2.4.1.bb
index 7e80354..3ae8f96 100644
--- a/meta/recipes-connectivity/nfs-utils/nfs-utils_2.4.1.bb
+++ b/meta/recipes-connectivity/nfs-utils/nfs-utils_2.4.1.bb
@@ -33,6 +33,7 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/utils/nfs-utils/${PV}/nfs-utils-${PV}.tar.x
            file://0001-Makefile.am-fix-undefined-function-for-libnsm.a.patch \
            file://0001-Don-t-build-tools-with-CC_FOR_BUILD.patch \
            file://0001-Fix-include-order-between-config.h-and-stat.h.patch \
+           file://0001-Disable-statx-if-using-glibc-emulation.patch \
 "
 SRC_URI_append_libc-glibc = " file://0001-configure.ac-Do-not-fatalize-Wmissing-prototypes.patch"
 SRC_URI_append_libc-musl = " file://nfs-utils-musl-res_querydomain.patch"
-- 
2.7.4

