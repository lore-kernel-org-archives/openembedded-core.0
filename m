Return-Path: <Changqing.Li@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 5A6AE79709
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Sep 2018 01:48:54 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id w8A1mtBU012170
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 9 Sep 2018 18:48:55 -0700 (PDT)
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.408.0; Sun, 9 Sep 2018 18:48:54 -0700
From: <changqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 10 Sep 2018 09:48:53 +0800
Message-ID: <1536544133-34165-1-git-send-email-changqing.li@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [PATCH] qemu: patch for CVE-2018-15746
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
X-List-Received-Date: Mon, 10 Sep 2018 01:48:54 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

From: Changqing Li <changqing.li@windriver.com>

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 .../qemu/qemu/CVE-2018-15746.patch                 | 64 ++++++++++++++++++++++
 meta/recipes-devtools/qemu/qemu_3.0.0.bb           |  1 +
 2 files changed, 65 insertions(+)
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2018-15746.patch

diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2018-15746.patch b/meta/recipes-devtools/qemu/qemu/CVE-2018-15746.patch
new file mode 100644
index 0000000..2f61ea0
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/CVE-2018-15746.patch
@@ -0,0 +1,64 @@
+From 9acf4c64dd4560bd268006d7356c7455fab7e5b1 Mon Sep 17 00:00:00 2001
+From: Changqing Li <changqing.li@windriver.com>
+Date: Thu, 6 Sep 2018 14:52:12 +0800
+Subject: [PATCH] seccomp: set the seccomp filter to all threads
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+When using "-seccomp on", the seccomp policy is only applied to the
+main thread, the vcpu worker thread and other worker threads created
+after seccomp policy is applied; the seccomp policy is not applied to
+e.g. the RCU thread because it is created before the seccomp policy is
+applied and SECCOMP_FILTER_FLAG_TSYNC isn't used.
+
+This can be verified with
+for task in /proc/`pidof qemu`/task/*; do cat $task/status | grep Secc ; done
+Seccomp:	2
+Seccomp:	0
+Seccomp:	0
+Seccomp:	2
+Seccomp:	2
+Seccomp:	2
+
+Starting with libseccomp 2.2.0 and kernel >= 3.17, we can use
+seccomp_attr_set(ctx, > SCMP_FLTATR_CTL_TSYNC, 1) to update the policy
+on all threads.
+
+libseccomp requirement was bumped to 2.2.0 in previous patch.
+libseccomp should fail to set the filter if it can't honour
+SCMP_FLTATR_CTL_TSYNC (untested), and thus -sandbox will now fail on
+kernel < 3.17.
+
+Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
+Acked-by: Eduardo Otubo <otubo@redhat.com>
+
+Upstream-Status: Backport[https://github.com/qemu/qemu/commit/
+70dfabeaa79ba4d7a3b699abe1a047c8012db114#diff-18106d3b47a2d249f9d41e772b7db22d]
+
+CVE: CVE-2018-15746
+
+Signed-off-by: Changqing Li <changqing.li@windriver.com>
+---
+ qemu-seccomp.c | 5 +++++
+ 1 file changed, 5 insertions(+)
+
+diff --git a/qemu-seccomp.c b/qemu-seccomp.c
+index 9cd8eb9..ba5500a 100644
+--- a/qemu-seccomp.c
++++ b/qemu-seccomp.c
+@@ -120,6 +120,11 @@ static int seccomp_start(uint32_t seccomp_opts)
+         goto seccomp_return;
+     }
+ 
++    rc = seccomp_attr_set(ctx, SCMP_FLTATR_CTL_TSYNC, 1);
++    if (rc != 0) {
++        goto seccomp_return;
++    }
++
+     for (i = 0; i < ARRAY_SIZE(blacklist); i++) {
+         if (!(seccomp_opts & blacklist[i].set)) {
+             continue;
+-- 
+2.7.4
+
diff --git a/meta/recipes-devtools/qemu/qemu_3.0.0.bb b/meta/recipes-devtools/qemu/qemu_3.0.0.bb
index 80da081..6b14786 100644
--- a/meta/recipes-devtools/qemu/qemu_3.0.0.bb
+++ b/meta/recipes-devtools/qemu/qemu_3.0.0.bb
@@ -21,6 +21,7 @@ SRC_URI = "https://download.qemu.org/${BPN}-${PV}.tar.xz \
            file://0009-apic-fixup-fallthrough-to-PIC.patch \
            file://0010-linux-user-Fix-webkitgtk-hangs-on-32-bit-x86-target.patch \
            file://0011-Revert-linux-user-fix-mmap-munmap-mprotect-mremap-sh.patch \
+           file://CVE-2018-15746.patch \
            "
 UPSTREAM_CHECK_REGEX = "qemu-(?P<pver>\d+\..*)\.tar"
 
-- 
2.7.4


