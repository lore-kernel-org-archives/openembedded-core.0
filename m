Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id C14F17DFBE
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Aug 2019 13:34:25 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id x7JDYPff002622
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 19 Aug 2019 06:34:25 -0700 (PDT)
Received: from pek-lpggp1.wrs.com (128.224.153.74) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.468.0;
	Mon, 19 Aug 2019 06:34:24 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>,
	<richard.purdie@linuxfoundation.org>
Date: Mon, 19 Aug 2019 09:33:22 -0400
Message-ID: <1566221602-123706-1-git-send-email-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.8.1
MIME-Version: 1.0
Subject: [PATCH] systemd: decreasing default RLIMIT_NOFILE on qemu bsp
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
X-List-Received-Date: Mon, 19 Aug 2019 13:34:26 -0000
Content-Type: text/plain

Since do_testimage for core-image-sato-sdk has memory limitation (256Mib)
which caused rpc.statd failed with out of memory.
[  531.306146] Out of memory: Kill process 193 (rpc.statd) score 200 or sacrifice child

The rpc.statd allocates memory according to RLIMIT_NOFILE,
so decrease it to 4k to keep sync with sysvinit

After applying the patch, the memory cost is the same with sysvinit
rpcuser    340  0.0  1.0   3212  2588 ?        Ss   13:20   0:00 /usr/sbin/rpc.statd -F
root       473  0.0  0.2   3464   496 ?        Ss   13:23   0:00 /usr/sbin/rpc.mountd

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 ...0001-decreasing-the-default-RLIMIT_NOFILE.patch | 35 ++++++++++++++++++++++
 meta/recipes-core/systemd/systemd_242.bb           |  4 +++
 2 files changed, 39 insertions(+)
 create mode 100644 meta/recipes-core/systemd/systemd/0001-decreasing-the-default-RLIMIT_NOFILE.patch

diff --git a/meta/recipes-core/systemd/systemd/0001-decreasing-the-default-RLIMIT_NOFILE.patch b/meta/recipes-core/systemd/systemd/0001-decreasing-the-default-RLIMIT_NOFILE.patch
new file mode 100644
index 0000000..fb8e2c9
--- /dev/null
+++ b/meta/recipes-core/systemd/systemd/0001-decreasing-the-default-RLIMIT_NOFILE.patch
@@ -0,0 +1,35 @@
+From 55c7196163e481c508fa708b9b8f5e7bf2d2f007 Mon Sep 17 00:00:00 2001
+From: Hongxu Jia <hongxu.jia@windriver.com>
+Date: Mon, 19 Aug 2019 07:16:47 -0400
+Subject: [PATCH] decreasing the default RLIMIT_NOFILE
+
+Since do_testimage for core-image-sato-sdk has memory limits (256Mib)
+which caused rpc.statd failed with out of memory.
+[  531.306146] Out of memory: Kill process 193 (rpc.statd) score 200 or sacrifice child
+
+The rpc.statd allocates memory according to RLIMIT_NOFILE,
+so decrease it to 4k which keep sync with sysvinit
+
+Upstream-Status: Inappropriate [oe specific]
+
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+---
+ meson.build | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/meson.build b/meson.build
+index 18a7cc5..e30894b 100644
+--- a/meson.build
++++ b/meson.build
+@@ -79,7 +79,7 @@ conf.set10('HAVE_SYSV_COMPAT', sysvinit_path != '' and sysvrcnd_path != '',
+ 
+ conf.set10('BUMP_PROC_SYS_FS_FILE_MAX', get_option('bump-proc-sys-fs-file-max'))
+ conf.set10('BUMP_PROC_SYS_FS_NR_OPEN',  get_option('bump-proc-sys-fs-nr-open'))
+-conf.set('HIGH_RLIMIT_NOFILE',          512*1024)
++conf.set('HIGH_RLIMIT_NOFILE',          4*1024)
+ 
+ # join_paths ignores the preceding arguments if an absolute component is
+ # encountered, so this should canonicalize various paths when they are
+-- 
+2.8.1
+
diff --git a/meta/recipes-core/systemd/systemd_242.bb b/meta/recipes-core/systemd/systemd_242.bb
index 1953fef..ab15ad2 100644
--- a/meta/recipes-core/systemd/systemd_242.bb
+++ b/meta/recipes-core/systemd/systemd_242.bb
@@ -58,6 +58,10 @@ SRC_URI_MUSL = "file://0001-Use-getenv-when-secure-versions-are-not-available.pa
                file://0001-do-not-disable-buffer-in-writing-files.patch \
                "
 
+SRC_URI_append_qemuall = " \
+               file://0001-decreasing-the-default-RLIMIT_NOFILE.patch \
+"
+
 PAM_PLUGINS = " \
     pam-plugin-unix \
     pam-plugin-loginuid \
-- 
2.8.1


