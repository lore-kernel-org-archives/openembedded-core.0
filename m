Return-Path: <jpitti@cisco.com>
X-Greylist: delayed 425 seconds by postgrey-1.34 at layers.openembedded.org;
	Thu, 19 Mar 2020 23:40:39 UTC
Received: from rcdn-iport-4.cisco.com (rcdn-iport-4.cisco.com [173.37.86.75])
	by mail.openembedded.org (Postfix) with ESMTP id D6F8260FF1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Mar 2020 23:40:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=cisco.com; i=@cisco.com; l=3345; q=dns/txt; s=iport;
	t=1584661241; x=1585870841;
	h=from:to:cc:subject:date:message-id:mime-version:
	content-transfer-encoding;
	bh=ELlHhxhzmkGZ05aflattNuSbKPuSAzA1hTIMC517tYM=;
	b=dsVEv3iL8JpzkFeTBLXSb+oTUbBztRkIuqC4Gvz8k8YY8a5LFTd5psRQ
	J+wNwTVHLK6WSldaTUqictuMnYpptIOZiysoq5Fej4atAvELu7X13iIYG
	qFASXwUFL4re9XccDLPar6aQtbsso0qXBxBE0l/ACxo4yp3/N7leiGJDO 8=;
X-IronPort-AV: E=Sophos;i="5.70,573,1574121600"; d="scan'208";a="740867036"
Received: from rcdn-core-2.cisco.com ([173.37.93.153])
	by rcdn-iport-4.cisco.com with ESMTP/TLS/DHE-RSA-SEED-SHA;
	19 Mar 2020 23:33:35 +0000
Received: from sjc-ads-5706.cisco.com (sjc-ads-5706.cisco.com [10.28.88.220])
	by rcdn-core-2.cisco.com (8.15.2/8.15.2) with ESMTP id
	02JNXY1d006236; Thu, 19 Mar 2020 23:33:35 GMT
From: Julius Hemanth Pitti <jpitti@cisco.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 19 Mar 2020 16:33:30 -0700
Message-Id: <20200319233330.65306-1-jpitti@cisco.com>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-Outbound-SMTP-Client: 10.28.88.220, sjc-ads-5706.cisco.com
X-Outbound-Node: rcdn-core-2.cisco.com
Cc: xe-linux-external@cisco.com
Subject: [zeus][PATCH] nfs-utils: Disable statx if using glibc emulation
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 19 Mar 2020 23:40:40 -0000
Content-Transfer-Encoding: 8bit

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
---
 ...sable-statx-if-using-glibc-emulation.patch | 34 +++++++++++++++++++
 .../nfs-utils/nfs-utils_2.4.1.bb              |  1 +
 2 files changed, 35 insertions(+)
 create mode 100644 meta/recipes-connectivity/nfs-utils/nfs-utils/0001-Disable-statx-if-using-glibc-emulation.patch

diff --git a/meta/recipes-connectivity/nfs-utils/nfs-utils/0001-Disable-statx-if-using-glibc-emulation.patch b/meta/recipes-connectivity/nfs-utils/nfs-utils/0001-Disable-statx-if-using-glibc-emulation.patch
new file mode 100644
index 0000000000..b8f96f3fba
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
+Upstream Status: Backport
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
index 7e80354e4e..3ae8f965c8 100644
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
2.18.1


