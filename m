Return-Path: <max+openembedded@blarg.de>
X-Greylist: delayed 507 seconds by postgrey-1.34 at layers.openembedded.org;
	Thu, 01 Aug 2019 16:10:37 UTC
Received: from swift.blarg.de (swift.blarg.de [138.201.185.127])
	by mail.openembedded.org (Postfix) with ESMTP id C38647F51C
	for <openembedded-core@lists.openembedded.org>;
	Thu,  1 Aug 2019 16:10:37 +0000 (UTC)
Received: from heron.blarg.de
	(p200300DC6F1521000000000000000FD2.dip0.t-ipconnect.de
	[IPv6:2003:dc:6f15:2100::fd2]) (Authenticated sender: max)
	by swift.blarg.de (Postfix) with ESMTPSA id A4A5F40017;
	Thu,  1 Aug 2019 18:02:10 +0200 (CEST)
From: Max Kellermann <max+openembedded@blarg.de>
To: openembedded-core@lists.openembedded.org
Date: Thu,  1 Aug 2019 18:02:06 +0200
Message-Id: <20190801160206.24078-1-max+openembedded@blarg.de>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Cc: Max Kellermann <max.kellermann@gmail.com>
Subject: [PATCH pseudo] ports/linux: wrap faccessat()
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
X-List-Received-Date: Thu, 01 Aug 2019 16:10:38 -0000
Content-Transfer-Encoding: 8bit

From: Max Kellermann <max.kellermann@gmail.com>

Signed-off-by: Max Kellermann <max.kellermann@gmail.com>
---
 ports/linux/guts/faccessat.c | 33 +++++++++++++++++++++++++++++++++
 ports/linux/wrapfuncs.in     |  1 +
 2 files changed, 34 insertions(+)
 create mode 100644 ports/linux/guts/faccessat.c

diff --git a/ports/linux/guts/faccessat.c b/ports/linux/guts/faccessat.c
new file mode 100644
index 0000000..be13bbc
--- /dev/null
+++ b/ports/linux/guts/faccessat.c
@@ -0,0 +1,33 @@
+/*
+ * Copyright (c) 2019 Max Kellermann <max.kellermann@gmail.com>
+ * guts/COPYRIGHT for information.
+ *
+ * SPDX-License-Identifier: LGPL-2.1-only
+ *
+ * static int
+ * wrap_access(int dirfd, const char *path, int mode, int flags) {
+ *	int rc = -1;
+ */
+	struct stat64 buf;
+
+	/* note:  no attempt to handle the case where user isn't
+	 * root.
+	 */
+	rc = real___fxstatat64(_STAT_VER, dirfd, path, &buf, AT_SYMLINK_NOFOLLOW);
+	if (rc == -1)
+		return rc;
+
+	if (mode & X_OK) {
+		if (buf.st_mode & 0111) {
+			return 0;
+		} else {
+			errno = EPERM;
+			return -1;
+		}
+	} else {
+		return 0;
+	}
+
+/*	return rc;
+ * }
+ */
diff --git a/ports/linux/wrapfuncs.in b/ports/linux/wrapfuncs.in
index a129eba..2a118fc 100644
--- a/ports/linux/wrapfuncs.in
+++ b/ports/linux/wrapfuncs.in
@@ -56,3 +56,4 @@ int getgrent_r(struct group *gbuf, char *buf, size_t buflen, struct group **gbuf
 int capset(cap_user_header_t hdrp, const cap_user_data_t datap); /* real_func=pseudo_capset */
 long syscall(long nr, ...); /* hand_wrapped=1 */
 int renameat2(int olddirfd, const char *oldpath, int newdirfd, const char *newpath, unsigned int flags); /* flags=AT_SYMLINK_NOFOLLOW */
+int faccessat(int dirfd, const char *path, int mode, int flags);
-- 
2.20.1


