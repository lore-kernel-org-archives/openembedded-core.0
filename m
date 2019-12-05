Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id BAA547F944
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Dec 2019 21:23:42 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 47TTH04s0Rz4s
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Dec 2019 22:23:39 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1575581020;
	bh=DtqFhVYIFneBkPaW52rcMu/ggsufTca8DSYBaUqlCwE=;
	h=From:To:Subject:Date:From;
	b=Af22f26EbsEgfDdrbQo4LgPIVUkHQtUYMlRR1beb/cxCJL74lzjginZsWrWX3/QFh
	Wyw9bkB4LBJd+1nV59T6/X41P+/PBmFbzTPzdgI/YK1y3xNPfHzjkjtpag5mdZqOPr
	kdHz7VXTJAuT8Y/J2ozIj1At+lbdZpXDuX9mhs5SPX3fFU1/4nqCh9PFsnTiG1NfAU
	eoEwqglTFfnNeV/rgqvwuwOXcefeczYJe8XBR7rkOMgUJlOeMzZ0C9kd7IJaLyXUzp
	aU7CFcSv5+CeKYBcHRqLczAuGXhk5GcRJC3M2ernQdfy8xhQRk9s/qez1na0sqd5t+
	BxpNV2dKHX3t+DxYY6TihqD9MM6ZZvwV1Hbz4apLQsM5GcPZjUhasQECgZZ6zmiBNQ
	NzPaj0K5YcJ5u3T3QRBakG0oSQmU7+SXSs0L/TCSCciYfBOd3oihBLT56jmGMbY/VZ
	g42yt/mBERPw26mdi5Sp1SdEDWg6tb0uaz+nfrzpkVSYyRQeI6ii18jxyqpiSbRk/8
	Fl+5lEMAVx6i5PBm0Mo7HNMvnNU1P4dudYZS10XJZ0Fh3K5B6njnWwocf1AjIV6V0R
	hF+q86W2MjJ2x64gfH8BwfOlPepw+y6lZ0SIjztJUtZ2vSCKKy+ncqZ7njiB4lVfXc
	82YCIryQh5k3le0VkQhfHCWY=
From: Adrian Bunk <bunk@stusta.de>
To: openembedded-core@lists.openembedded.org
Date: Thu,  5 Dec 2019 23:23:38 +0200
Message-Id: <20191205212338.26696-1-bunk@stusta.de>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH] systemd: Upgrade 243 -> 243.2
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
X-List-Received-Date: Thu, 05 Dec 2019 21:23:43 -0000

Bugfix-only changes on the 243 stable branch.

Backported patch removed.

Signed-off-by: Adrian Bunk <bunk@stusta.de>
---
 meta/recipes-core/systemd/systemd.inc         |  4 +-
 .../0001-pstore-fix-use-after-free.patch      | 39 -------------------
 meta/recipes-core/systemd/systemd_243.bb      |  1 -
 3 files changed, 2 insertions(+), 42 deletions(-)
 delete mode 100644 meta/recipes-core/systemd/systemd/0001-pstore-fix-use-after-free.patch

diff --git a/meta/recipes-core/systemd/systemd.inc b/meta/recipes-core/systemd/systemd.inc
index 7f3a59c208..6965b3b482 100644
--- a/meta/recipes-core/systemd/systemd.inc
+++ b/meta/recipes-core/systemd/systemd.inc
@@ -14,10 +14,10 @@ LICENSE = "GPLv2 & LGPLv2.1"
 LIC_FILES_CHKSUM = "file://LICENSE.GPL2;md5=751419260aa954499f7abaabaa882bbe \
                     file://LICENSE.LGPL2.1;md5=4fbd65380cdd255951079008b364516c"
 
-SRCREV = "efb536d0cbe2e58f80e501d19999928c75e08f6a"
+SRCREV = "fab6f010ac6c3bc93a10868de722d7c8c3622eb9"
 SRCBRANCH = "v243-stable"
 SRC_URI = "git://github.com/systemd/systemd-stable.git;protocol=git;branch=${SRCBRANCH}"
 
 S = "${WORKDIR}/git"
 
-PV_append = "+${SRCPV}"
+PV_append = ".2"
diff --git a/meta/recipes-core/systemd/systemd/0001-pstore-fix-use-after-free.patch b/meta/recipes-core/systemd/systemd/0001-pstore-fix-use-after-free.patch
deleted file mode 100644
index fd147a18be..0000000000
--- a/meta/recipes-core/systemd/systemd/0001-pstore-fix-use-after-free.patch
+++ /dev/null
@@ -1,39 +0,0 @@
-From 1b3156edd291e0882d80a695d035dd30521345d1 Mon Sep 17 00:00:00 2001
-From: Michael Olbrich <m.olbrich@pengutronix.de>
-Date: Fri, 6 Sep 2019 15:04:01 +0200
-Subject: [PATCH] pstore: fix use after free
-
-The memory is still needed in the sd_journal_sendv() after the 'if' block.
-
-(cherry picked from commit 1e19f5ac0d680a63eccae7ef1fc6ce225dca0bbf)
-
-Upstream-Status: Backport
-
-Signed-off-by: Yongxin Liu <yongxin.liu@windriver.com>
----
- src/pstore/pstore.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/src/pstore/pstore.c b/src/pstore/pstore.c
-index c760b3e899..8ffe523830 100644
---- a/src/pstore/pstore.c
-+++ b/src/pstore/pstore.c
-@@ -117,6 +117,7 @@ static int compare_pstore_entries(const void *_a, const void *_b) {
- 
- static int move_file(PStoreEntry *pe, const char *subdir) {
-         _cleanup_free_ char *ifd_path = NULL, *ofd_path = NULL;
-+        _cleanup_free_ void *field = NULL;
-         const char *suffix, *message;
-         struct iovec iovec[2];
-         int n_iovec = 0, r;
-@@ -138,7 +139,6 @@ static int move_file(PStoreEntry *pe, const char *subdir) {
-         iovec[n_iovec++] = IOVEC_MAKE_STRING(message);
- 
-         if (pe->content_size > 0) {
--                _cleanup_free_ void *field = NULL;
-                 size_t field_size;
- 
-                 field_size = strlen("FILE=") + pe->content_size;
--- 
-2.14.4
-
diff --git a/meta/recipes-core/systemd/systemd_243.bb b/meta/recipes-core/systemd/systemd_243.bb
index b31d0b5ed4..ac7a5f86b3 100644
--- a/meta/recipes-core/systemd/systemd_243.bb
+++ b/meta/recipes-core/systemd/systemd_243.bb
@@ -24,7 +24,6 @@ SRC_URI += "file://touchscreen.rules \
            file://0005-rules-watch-metadata-changes-in-ide-devices.patch \
            file://0001-unit-file.c-consider-symlink-on-filesystems-like-NFS.patch \
            file://99-default.preset \
-           file://0001-pstore-fix-use-after-free.patch \
            "
 
 # patches needed by musl
-- 
2.17.1


