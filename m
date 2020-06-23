Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
 by mx.groups.io with SMTP id smtpd.web10.2771.1592901069357946248
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Jun 2020 01:31:09 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 147.11.1.11, mailfrom: zhe.he@windriver.com)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com [147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.2) with ESMTPS id 05N8V7xb008420
	(version=TLSv1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Tue, 23 Jun 2020 01:31:08 -0700 (PDT)
Received: from pek-lpg-core3.wrs.com (128.224.153.232) by
 ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
 14.3.487.0; Tue, 23 Jun 2020 01:30:48 -0700
From: "He Zhe" <zhe.he@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH] ltp: Fix copy_file_rang02 for 32-bit arches
Date: Tue, 23 Jun 2020 16:30:47 +0800
Message-ID: <20200623083047.38969-1-zhe.he@windriver.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain

From: He Zhe <zhe.he@windriver.com>

Fix the following error.
copy_file_range02.c:139: FAIL: copy_file_range failed unexpectedly; expected EOVERFLOW, but got: EFBIG (27)

Signed-off-by: He Zhe <zhe.he@windriver.com>
---
 ...le_range02-Expect-EFBIG-in-subcase-m.patch | 57 +++++++++++++++++++
 meta/recipes-extended/ltp/ltp_20200515.bb     |  1 +
 2 files changed, 58 insertions(+)
 create mode 100644 meta/recipes-extended/ltp/ltp/0001-syscalls-copy_file_range02-Expect-EFBIG-in-subcase-m.patch

diff --git a/meta/recipes-extended/ltp/ltp/0001-syscalls-copy_file_range02-Expect-EFBIG-in-subcase-m.patch b/meta/recipes-extended/ltp/ltp/0001-syscalls-copy_file_range02-Expect-EFBIG-in-subcase-m.patch
new file mode 100644
index 0000000000..0c082f04a5
--- /dev/null
+++ b/meta/recipes-extended/ltp/ltp/0001-syscalls-copy_file_range02-Expect-EFBIG-in-subcase-m.patch
@@ -0,0 +1,57 @@
+From 99687ab002f9f750f6f18fa1d70a91f0aa4f8ba2 Mon Sep 17 00:00:00 2001
+From: He Zhe <zhe.he@windriver.com>
+Date: Thu, 18 Jun 2020 17:18:27 +0800
+Subject: [PATCH] syscalls/copy_file_range02: Expect EFBIG in subcase max
+ length on 32-bit architectures
+
+For syscall
+ssize_t copy_file_range(int fd_in, loff_t *off_in,
+                               int fd_out, loff_t *off_out,
+                               size_t len, unsigned int flags);
+off_out is loff_t* that is long long, 64 bits on 32-bit architectures,
+while len is size_t that unsigned int, 32 bits on 32-bit architectures.
+
+In subcase "max length", simplified as below,
+
+dst = tst_max_lfs_filesize();
+TEST(sys_copy_file_range(fd_src, 0, *tc->copy_to_fd, &dst, tc->len, tc->flags));
+
+where dst is 4K*4G and len is 4G, so (4K+1)*4G is always smaller than 4G*4G,
+it can never match the following kernel condition on 32-bit architectures.
+
+if (pos_in + count < pos_in || pos_out + count < pos_out)
+	return -EOVERFLOW;
+
+And thus we would get error like
+copy_file_range02.c:139: FAIL: copy_file_range failed unexpectedly; expected EOVERFLOW, but got: EFBIG (27)
+
+Also correct a typo.
+
+Upstream-Status: Accepted [http://lists.linux.it/pipermail/ltp/2020-June/017716.html]
+
+Signed-off-by: He Zhe <zhe.he@windriver.com>
+Acked-by: Li Wang <liwang@redhat.com>
+---
+ .../kernel/syscalls/copy_file_range/copy_file_range02.c     | 6 +++++-
+ 1 file changed, 5 insertions(+), 1 deletion(-)
+
+diff --git a/testcases/kernel/syscalls/copy_file_range/copy_file_range02.c b/testcases/kernel/syscalls/copy_file_range/copy_file_range02.c
+index fa679c4d3..bc27fbe57 100644
+--- a/testcases/kernel/syscalls/copy_file_range/copy_file_range02.c
++++ b/testcases/kernel/syscalls/copy_file_range/copy_file_range02.c
+@@ -78,7 +78,11 @@ static struct tcase {
+ 	{&fd_chrdev,	0,	EINVAL,		CONTSIZE,	"char device",	0},
+ 	{&fd_fifo,	0,	EINVAL,		CONTSIZE,	"fifo", 	0},
+ 	{&fd_pipe[0],	0,	EINVAL,		CONTSIZE,	"pipe", 	0},
+-	{&fd_copy,	0,	EOVERFLOW,	ULLONG_MAX,	"max length lenght", 	1},
++#ifdef TST_ABI64
++	{&fd_copy,	0,	EOVERFLOW,	ULLONG_MAX,	"max length", 	1},
++#else
++	{&fd_copy,	0,	EFBIG,		ULLONG_MAX,	"max length", 	1},
++#endif
+ 	{&fd_copy,	0,	EFBIG,		MIN_OFF,	"max file size", 	1},
+ };
+ 
+-- 
+2.17.1
+
diff --git a/meta/recipes-extended/ltp/ltp_20200515.bb b/meta/recipes-extended/ltp/ltp_20200515.bb
index f2510baa68..b283add12f 100644
--- a/meta/recipes-extended/ltp/ltp_20200515.bb
+++ b/meta/recipes-extended/ltp/ltp_20200515.bb
@@ -36,6 +36,7 @@ SRC_URI = "git://github.com/linux-test-project/ltp.git \
            file://0001-Add-more-musl-exclusions.patch \
            file://0001-ptrace01-Fix-missing-format-string.patch \
            file://0001-sigwaitinfo-Do-not-run-invalid-undefined-test-cases.patch \
+           file://0001-syscalls-copy_file_range02-Expect-EFBIG-in-subcase-m.patch \
            "
 
 S = "${WORKDIR}/git"
-- 
2.17.1

