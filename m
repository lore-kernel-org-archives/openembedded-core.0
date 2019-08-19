Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id D93C76B3D1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Aug 2019 16:38:02 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id x7JGc2Ti003274
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 19 Aug 2019 09:38:02 -0700 (PDT)
Received: from pek-lpggp1.wrs.com (128.224.153.74) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.468.0;
	Mon, 19 Aug 2019 09:38:01 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <alex.kanavin@gmail.com>, <openembedded-core@lists.openembedded.org>,
	<richard.purdie@linuxfoundation.org>
Date: Mon, 19 Aug 2019 12:36:59 -0400
Message-ID: <1566232619-199878-1-git-send-email-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.8.1
In-Reply-To: <CANNYZj_BxAjV=8OQ+95tk2+KnmJoXKVa71Agk4o5uKzYDraP0A@mail.gmail.com>
References: <CANNYZj_BxAjV=8OQ+95tk2+KnmJoXKVa71Agk4o5uKzYDraP0A@mail.gmail.com>
MIME-Version: 1.0
Subject: [PATCH V2] systemd: add menson option to decrease RLIMIT_NOFILE on qemu bsp
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
X-List-Received-Date: Mon, 19 Aug 2019 16:38:03 -0000
Content-Type: text/plain

Since do_testimage for core-image-sato-sdk has memory limitation (256Mib)
which caused rpc.statd failed with out of memory.
[  531.306146] Out of memory: Kill process 193 (rpc.statd) score 200 or sacrifice child

The rpc.statd allocates memory according to RLIMIT_NOFILE,
so decrease RLIMIT_NOFILE to 4k to keep sync with sysvinit

After applying the patch, the memory cost is the same with sysvinit
rpcuser    340  0.0  1.0   3212  2588 ?        Ss   13:20   0:00 /usr/sbin/rpc.statd -F
root       473  0.0  0.2   3464   496 ?        Ss   13:23   0:00 /usr/sbin/rpc.mountd

For other bsp, still keep RLIMIT_NOFILE to 512k by default

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 ...001-meson-add-option-to-set-RLIMIT_NOFILE.patch | 50 ++++++++++++++++++++++
 meta/recipes-core/systemd/systemd_242.bb           |  5 +++
 2 files changed, 55 insertions(+)
 create mode 100644 meta/recipes-core/systemd/systemd/0001-meson-add-option-to-set-RLIMIT_NOFILE.patch

diff --git a/meta/recipes-core/systemd/systemd/0001-meson-add-option-to-set-RLIMIT_NOFILE.patch b/meta/recipes-core/systemd/systemd/0001-meson-add-option-to-set-RLIMIT_NOFILE.patch
new file mode 100644
index 0000000..e822238
--- /dev/null
+++ b/meta/recipes-core/systemd/systemd/0001-meson-add-option-to-set-RLIMIT_NOFILE.patch
@@ -0,0 +1,50 @@
+From d42d1512402de0d2249e2d68040c5c3887e7ea99 Mon Sep 17 00:00:00 2001
+From: Hongxu Jia <hongxu.jia@windriver.com>
+Date: Mon, 19 Aug 2019 12:06:59 -0400
+Subject: [PATCH] meson: add option to set RLIMIT_NOFILE
+
+Add option to set RLIMIT_NOFILE and keep 512*1024 by default
+
+It is helpful for embedded device which has memory limitation
+to decrease RLIMIT_NOFILE
+
+Upstream-Status: Submitted [https://github.com/systemd/systemd/pull/13359]
+
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+---
+ meson.build       | 2 +-
+ meson_options.txt | 5 +++++
+ 2 files changed, 6 insertions(+), 1 deletion(-)
+
+diff --git a/meson.build b/meson.build
+index 18a7cc5..26d9cf0 100644
+--- a/meson.build
++++ b/meson.build
+@@ -79,7 +79,7 @@ conf.set10('HAVE_SYSV_COMPAT', sysvinit_path != '' and sysvrcnd_path != '',
+ 
+ conf.set10('BUMP_PROC_SYS_FS_FILE_MAX', get_option('bump-proc-sys-fs-file-max'))
+ conf.set10('BUMP_PROC_SYS_FS_NR_OPEN',  get_option('bump-proc-sys-fs-nr-open'))
+-conf.set('HIGH_RLIMIT_NOFILE',          512*1024)
++conf.set('HIGH_RLIMIT_NOFILE',          get_option('high-rlimit-nofile'))
+ 
+ # join_paths ignores the preceding arguments if an absolute component is
+ # encountered, so this should canonicalize various paths when they are
+diff --git a/meson_options.txt b/meson_options.txt
+index d4ec37d..5d4ee18 100644
+--- a/meson_options.txt
++++ b/meson_options.txt
+@@ -56,6 +56,11 @@ option('bump-proc-sys-fs-file-max', type : 'boolean',
+        description : 'bump /proc/sys/fs/file-max to ULONG_MAX')
+ option('bump-proc-sys-fs-nr-open', type : 'boolean',
+        description : 'bump /proc/sys/fs/nr_open to INT_MAX')
++
++# Default is 512*1024
++option('high-rlimit-nofile', type : 'integer', value : 524288,
++       description : 'set RLIMIT_NOFILE')
++
+ option('valgrind', type : 'boolean', value : false,
+        description : 'do extra operations to avoid valgrind warnings')
+ option('log-trace', type : 'boolean', value : false,
+-- 
+2.8.1
+
diff --git a/meta/recipes-core/systemd/systemd_242.bb b/meta/recipes-core/systemd/systemd_242.bb
index 1953fef..96a53dc 100644
--- a/meta/recipes-core/systemd/systemd_242.bb
+++ b/meta/recipes-core/systemd/systemd_242.bb
@@ -28,6 +28,7 @@ SRC_URI += "file://touchscreen.rules \
            file://0001-core-set-fs.file-max-sysctl-to-LONG_MAX-rather-than-.patch \
            file://0001-networkd-fix-link-up.patch \
            file://0002-network-do-not-send-ipv6.patch \
+           file://0001-meson-add-option-to-set-RLIMIT_NOFILE.patch \
            "
 
 # patches needed by musl
@@ -211,6 +212,10 @@ EXTRA_OEMESON += "-Dkexec-path=${sbindir}/kexec \
                   -Dsulogin-path=${base_sbindir}/sulogin \
                   -Dumount-path=${base_bindir}/umount"
 
+EXTRA_OEMESON += "-Dhigh-rlimit-nofile=${RLIMIT_NOFILE}"
+RLIMIT_NOFILE ??= "524288"
+RLIMIT_NOFILE_qemuall ?= "4096"
+
 do_install() {
 	meson_do_install
 	install -d ${D}/${base_sbindir}
-- 
2.8.1


