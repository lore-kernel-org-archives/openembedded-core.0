Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 60ADF6D6A0
	for <openembedded-core@lists.openembedded.org>;
	Mon,  4 Nov 2013 09:57:02 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id rA49v4uo006638
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 4 Nov 2013 01:57:04 -0800 (PST)
Received: from pek-hjia-d1.corp.ad.wrs.com (128.224.162.194) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.2.347.0; Mon, 4 Nov 2013 01:57:03 -0800
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 4 Nov 2013 17:56:50 +0800
Message-ID: <6c79b4f19987602bbc7b421f95c688ca9a47222e.1383558655.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <cover.1383558655.git.hongxu.jia@windriver.com>
References: <cover.1383558655.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
Cc: saul.wold@intel.com
Subject: [PATCH 5/5] nfs-utils: fix QA issue
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
X-List-Received-Date: Mon, 04 Nov 2013 09:57:02 -0000
Content-Type: text/plain

...
WARNING: QA Issue: nfs-utils: Found a reference to /usr/ in /home/jiahongxu/yocto/build-20131025-gcc5/bitbake_build/tmp/work/x86_64-wrs-linux/nfs-utils/1.2.8-r1/packages-split/nfs-utils/sbin/osd_login
WARNING: QA Issue: Shell scripts in base_bindir and base_sbindir should not reference anything in exec_prefix
...

Install osd_login in ${sbindir} rather than ${base_sbindir} fixed this issue

[YOCTO #5142]

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 ...et-sbindir-can-be-overridden-at-config-ti.patch | 24 ++++++++++++++++++++++
 .../nfs-utils/nfs-utils_1.2.8.bb                   |  1 +
 2 files changed, 25 insertions(+)
 create mode 100644 meta/recipes-connectivity/nfs-utils/nfs-utils/osd_login-let-sbindir-can-be-overridden-at-config-ti.patch

diff --git a/meta/recipes-connectivity/nfs-utils/nfs-utils/osd_login-let-sbindir-can-be-overridden-at-config-ti.patch b/meta/recipes-connectivity/nfs-utils/nfs-utils/osd_login-let-sbindir-can-be-overridden-at-config-ti.patch
new file mode 100644
index 0000000..ffa5b2f
--- /dev/null
+++ b/meta/recipes-connectivity/nfs-utils/nfs-utils/osd_login-let-sbindir-can-be-overridden-at-config-ti.patch
@@ -0,0 +1,24 @@
+osd_login: let sbindir can be overridden at config time
+
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+Upstream-Status: Pending
+---
+ utils/osd_login/Makefile.am | 4 ----
+ 1 file changed, 4 deletions(-)
+
+diff --git a/utils/osd_login/Makefile.am b/utils/osd_login/Makefile.am
+--- a/utils/osd_login/Makefile.am
++++ b/utils/osd_login/Makefile.am
+@@ -1,9 +1,5 @@
+ ## Process this file with automake to produce Makefile.in
+ 
+-# These binaries go in /sbin (not /usr/sbin), and that cannot be
+-# overridden at config time.
+-sbindir = /sbin
+-
+ sbin_SCRIPTS = osd_login
+ 
+ MAINTAINERCLEANFILES = Makefile.in
+-- 
+1.8.1.2
+
diff --git a/meta/recipes-connectivity/nfs-utils/nfs-utils_1.2.8.bb b/meta/recipes-connectivity/nfs-utils/nfs-utils_1.2.8.bb
index e3e8136..84dd623 100644
--- a/meta/recipes-connectivity/nfs-utils/nfs-utils_1.2.8.bb
+++ b/meta/recipes-connectivity/nfs-utils/nfs-utils_1.2.8.bb
@@ -15,6 +15,7 @@ RRECOMMENDS_${PN} = "kernel-module-nfsd"
 SRC_URI = "${KERNELORG_MIRROR}/linux/utils/nfs-utils/${PV}/nfs-utils-${PV}.tar.bz2 \
            file://nfs-utils-1.0.6-uclibc.patch \
            file://nfs-utils-1.2.3-sm-notify-res_init.patch \
+           file://osd_login-let-sbindir-can-be-overridden-at-config-ti.patch \
            file://nfsserver \
            file://nfs-utils.conf \
            file://nfs-server.service \
-- 
1.8.1.2


