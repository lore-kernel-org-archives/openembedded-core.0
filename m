Received: from mga01.intel.com (mga01.intel.com [])
 by mx.groups.io with SMTP id smtpd.web09.5034.1612961449989319010
 for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Feb 2021 04:50:50 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: intel.com, ip: <nil>, mailfrom: chee.yang.lee@intel.com)
IronPort-SDR: piMEAgAQlp/yfUoIyi5pHHf2ekzm9A1bL8+4ztVnznH/Oeg9X6+4qI2bMMq6usRxI5xpgQR8/M
 apqQ7tvAPeyQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9890"; a="201170143"
X-IronPort-AV: E=Sophos;i="5.81,168,1610438400"; 
   d="scan'208";a="201170143"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Feb 2021 04:50:50 -0800
IronPort-SDR: 1SFo0/hyNYQTudvirgKuG4i6ZmDy8UVouWoXTUx7L1viMaeOcWcXla9RXHDIEq6PcONusLCyb1
 d6Ke5jQnEKbA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,168,1610438400"; 
   d="scan'208";a="421037418"
Received: from unknown (HELO guest1-ubuntu1804.png.intel.com) ([10.221.183.51])
  by fmsmga002.fm.intel.com with ESMTP; 10 Feb 2021 04:50:49 -0800
From: "Lee Chee Yang" <chee.yang.lee@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH][gatesgarth 2/2] qemu: fix CVE-2020-29443 CVE-2020-35517
Date: Wed, 10 Feb 2021 20:50:47 +0800
Message-Id: <20210210125047.42657-2-chee.yang.lee@intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210210125047.42657-1-chee.yang.lee@intel.com>
References: <20210210125047.42657-1-chee.yang.lee@intel.com>

From: Lee Chee Yang <chee.yang.lee@intel.com>

Signed-off-by: Lee Chee Yang <chee.yang.lee@intel.com>
---
 meta/recipes-devtools/qemu/qemu.inc           |   2 +
 .../qemu/qemu/CVE-2020-29443.patch            |  46 +++++++
 .../qemu/qemu/CVE-2020-35517.patch            | 126 ++++++++++++++++++
 3 files changed, 174 insertions(+)
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2020-29443.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2020-35517.patch

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index 69b9a5f89e..97f110cde5 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -37,6 +37,8 @@ SRC_URI = "https://download.qemu.org/${BPN}-${PV}.tar.xz \
            file://CVE-2020-25624.patch \
            file://CVE-2020-25723.patch \
            file://CVE-2020-28916.patch \
+	   file://CVE-2020-35517.patch \
+	   file://CVE-2020-29443.patch \
            "
 UPSTREAM_CHECK_REGEX = "qemu-(?P<pver>\d+(\.\d+)+)\.tar"
 
diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2020-29443.patch b/meta/recipes-devtools/qemu/qemu/CVE-2020-29443.patch
new file mode 100644
index 0000000000..5a3b99bb23
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/CVE-2020-29443.patch
@@ -0,0 +1,46 @@
+
+m 813212288970c39b1800f63e83ac6e96588095c6 Mon Sep 17 00:00:00 2001
+From: Paolo Bonzini <pbonzini@redhat.com>
+Date: Tue, 1 Dec 2020 13:09:26 +0100
+Subject: [PATCH] ide: atapi: assert that the buffer pointer is in range
+
+A case was reported where s->io_buffer_index can be out of range.
+The report skimped on the details but it seems to be triggered
+by s->lba == -1 on the READ/READ CD paths (e.g. by sending an
+ATAPI command with LBA = 0xFFFFFFFF).  For now paper over it
+with assertions.  The first one ensures that there is no overflow
+when incrementing s->io_buffer_index, the second checks for the
+buffer overrun.
+
+Note that the buffer overrun is only a read, so I am not sure
+if the assertion failure is actually less harmful than the overrun.
+
+Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
+Message-id: 20201201120926.56559-1-pbonzini@redhat.com
+Reviewed-by: Kevin Wolf <kwolf@redhat.com>
+Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
+
+Upstream-Status: Backport [https://git.qemu.org/?p=qemu.git;a=patch;h=813212288970c39b1800f63e83ac6e96588095c6]
+CVE: CVE-2020-29443
+Signed-off-by: Chee Yang Lee <chee.yang.lee@intel.com>
+
+---
+ hw/ide/atapi.c | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/hw/ide/atapi.c b/hw/ide/atapi.c
+index 14a2b0b..e791578 100644
+--- a/hw/ide/atapi.c
++++ b/hw/ide/atapi.c
+@@ -276,6 +276,8 @@ void ide_atapi_cmd_reply_end(IDEState *s)
+         s->packet_transfer_size -= size;
+         s->elementary_transfer_size -= size;
+         s->io_buffer_index += size;
++        assert(size <= s->io_buffer_total_len);
++        assert(s->io_buffer_index <= s->io_buffer_total_len);
+ 
+         /* Some adapters process PIO data right away.  In that case, we need
+          * to avoid mutual recursion between ide_transfer_start
+-- 
+1.8.3.1
+
diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2020-35517.patch b/meta/recipes-devtools/qemu/qemu/CVE-2020-35517.patch
new file mode 100644
index 0000000000..f818eb3bf5
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/CVE-2020-35517.patch
@@ -0,0 +1,126 @@
+From ebf101955ce8f8d72fba103b5151115a4335de2c Mon Sep 17 00:00:00 2001
+From: Stefan Hajnoczi <stefanha@redhat.com>
+Date: Tue, 6 Oct 2020 10:58:26 +0100
+Subject: [PATCH] virtiofsd: avoid /proc/self/fd tempdir
+
+In order to prevent /proc/self/fd escapes a temporary directory is
+created where /proc/self/fd is bind-mounted. This doesn't work on
+read-only file systems.
+
+Avoid the temporary directory by bind-mounting /proc/self/fd over /proc.
+This does not affect other processes since we remounted / with MS_REC |
+MS_SLAVE. /proc must exist and virtiofsd does not use it so it's safe to
+do this.
+
+Path traversal can be tested with the following function:
+
+  static void test_proc_fd_escape(struct lo_data *lo)
+  {
+      int fd;
+      int level = 0;
+      ino_t last_ino = 0;
+
+      fd = lo->proc_self_fd;
+      for (;;) {
+          struct stat st;
+
+          if (fstat(fd, &st) != 0) {
+              perror("fstat");
+              return;
+          }
+          if (last_ino && st.st_ino == last_ino) {
+              fprintf(stderr, "inode number unchanged, stopping\n");
+              return;
+          }
+          last_ino = st.st_ino;
+
+          fprintf(stderr, "Level %d dev %lu ino %lu\n", level,
+                  (unsigned long)st.st_dev,
+                  (unsigned long)last_ino);
+          fd = openat(fd, "..", O_PATH | O_DIRECTORY | O_NOFOLLOW);
+          level++;
+      }
+  }
+
+Before and after this patch only Level 0 is displayed. Without
+/proc/self/fd bind-mount protection it is possible to traverse parent
+directories.
+
+Fixes: 397ae982f4df4 ("virtiofsd: jail lo->proc_self_fd")
+Cc: Miklos Szeredi <mszeredi@redhat.com>
+Cc: Jens Freimann <jfreimann@redhat.com>
+Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
+Message-Id: <20201006095826.59813-1-stefanha@redhat.com>
+Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
+Tested-by: Jens Freimann <jfreimann@redhat.com>
+Reviewed-by: Jens Freimann <jfreimann@redhat.com>
+Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
+
+
+Upstream-Status: Backport
+[https://github.com/qemu/qemu/commit/ebf101955ce8f8d72fba103b5151115a4335de2c]
+CVE: CVE-2020-35517
+Signed-off-by: Chee Yang Lee <chee.yang.lee@intel.com>
+
+---
+ tools/virtiofsd/passthrough_ll.c | 34 +++++++++++---------------------
+ 1 file changed, 11 insertions(+), 23 deletions(-)
+
+diff --git a/tools/virtiofsd/passthrough_ll.c b/tools/virtiofsd/passthrough_ll.c
+index 477e6ee0b53..ff53df44510 100644
+--- a/tools/virtiofsd/passthrough_ll.c
++++ b/tools/virtiofsd/passthrough_ll.c
+@@ -2393,8 +2393,6 @@ static void setup_wait_parent_capabilities(void)
+ static void setup_namespaces(struct lo_data *lo, struct fuse_session *se)
+ {
+     pid_t child;
+-    char template[] = "virtiofsd-XXXXXX";
+-    char *tmpdir;
+ 
+     /*
+      * Create a new pid namespace for *child* processes.  We'll have to
+@@ -2458,33 +2456,23 @@ static void setup_namespaces(struct lo_data *lo, struct fuse_session *se)
+         exit(1);
+     }
+ 
+-    tmpdir = mkdtemp(template);
+-    if (!tmpdir) {
+-        fuse_log(FUSE_LOG_ERR, "tmpdir(%s): %m\n", template);
+-        exit(1);
+-    }
+-
+-    if (mount("/proc/self/fd", tmpdir, NULL, MS_BIND, NULL) < 0) {
+-        fuse_log(FUSE_LOG_ERR, "mount(/proc/self/fd, %s, MS_BIND): %m\n",
+-                 tmpdir);
++    /*
++     * We only need /proc/self/fd. Prevent ".." from accessing parent
++     * directories of /proc/self/fd by bind-mounting it over /proc. Since / was
++     * previously remounted with MS_REC | MS_SLAVE this mount change only
++     * affects our process.
++     */
++    if (mount("/proc/self/fd", "/proc", NULL, MS_BIND, NULL) < 0) {
++        fuse_log(FUSE_LOG_ERR, "mount(/proc/self/fd, MS_BIND): %m\n");
+         exit(1);
+     }
+ 
+-    /* Now we can get our /proc/self/fd directory file descriptor */
+-    lo->proc_self_fd = open(tmpdir, O_PATH);
++    /* Get the /proc (actually /proc/self/fd, see above) file descriptor */
++    lo->proc_self_fd = open("/proc", O_PATH);
+     if (lo->proc_self_fd == -1) {
+-        fuse_log(FUSE_LOG_ERR, "open(%s, O_PATH): %m\n", tmpdir);
++        fuse_log(FUSE_LOG_ERR, "open(/proc, O_PATH): %m\n");
+         exit(1);
+     }
+-
+-    if (umount2(tmpdir, MNT_DETACH) < 0) {
+-        fuse_log(FUSE_LOG_ERR, "umount2(%s, MNT_DETACH): %m\n", tmpdir);
+-        exit(1);
+-    }
+-
+-    if (rmdir(tmpdir) < 0) {
+-        fuse_log(FUSE_LOG_ERR, "rmdir(%s): %m\n", tmpdir);
+-    }
+ }
+ 
+ /*
-- 
2.17.1

