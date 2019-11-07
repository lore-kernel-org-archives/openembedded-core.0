Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com
	[209.85.128.66])
	by mail.openembedded.org (Postfix) with ESMTP id 0D0757F9A2
	for <openembedded-core@lists.openembedded.org>;
	Thu,  7 Nov 2019 20:07:50 +0000 (UTC)
Received: by mail-wm1-f66.google.com with SMTP id c22so3899811wmd.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 07 Nov 2019 12:07:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:user-agent:mime-version
	:content-transfer-encoding;
	bh=ciFT8rCGZkbjy2RVy7ehYufMAz+MY0KvY6t75xs3cYE=;
	b=F1JFqYLCh3y6Z2sr+TgVEG/HKzDp5JcviZUSt7L7Cm5D9Zz1M4wekkClI77JcWOU4d
	g2LoWcSTTagtKVpSzvpshvKyx2fZsWGacf8vvwbI4jzkqt16QxAaUcKFn7Z8OqisuHAG
	fvj8vH1VPsr64lVOMxwZNvth7xDr1KJ2VSreU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:user-agent
	:mime-version:content-transfer-encoding;
	bh=ciFT8rCGZkbjy2RVy7ehYufMAz+MY0KvY6t75xs3cYE=;
	b=AdBAIdLJiadYLq+JaLwxMBq4/bfKuqtVWU9eLrbo5Dr7uOhH2a4An+l/NPKTwn4eXX
	bmDnf9R+dwmoaunJw1AVd+W1KPS7CAz0WG8LqdNs6+etGWcu12bJ2E37KJ0Ie7I9Y15u
	0xe1F6Qst1/W8vUNqHhSQV11d9ki44tqDadTr8tS8UcgoJkebQyPjza5GdfqrD0xzqIG
	kFKLr4hdf3yO4IQ0MTpzXDU6OuemD1iTbw+LVLXhZxdfQTUOZ/0RaufsZ0nabK8u4beE
	+z3LcHXai1wo/yeuKsHTUYRZfuhVdT6KjTkoCBvTWHUfg53RhTr65z6QAA8ouAXEvRf4
	QoHw==
X-Gm-Message-State: APjAAAW7v20GWUV8gaqxVypc5xnB2Out7P3Pv1qDkJpaWZCPSjewb2MT
	ltmFMrQIL4/wqgUjnv3D+J423T6jx90=
X-Google-Smtp-Source: APXvYqyB57y515uCD6enXTIiRT960+6YFiH7rxfpOmk+U1JU6vOqW4vqTEnW06Rp/ZN+JyyXVJn+YA==
X-Received: by 2002:a1c:9a88:: with SMTP id c130mr4869374wme.164.1573157271448;
	Thu, 07 Nov 2019 12:07:51 -0800 (PST)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id m3sm3848865wrb.67.2019.11.07.12.07.50
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 07 Nov 2019 12:07:50 -0800 (PST)
Message-ID: <a41dc3c3d628586ee015766c2003d1e494e7e4fb.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>, Seebs <seebs@seebs.net>
Date: Thu, 07 Nov 2019 20:07:49 +0000
User-Agent: Evolution 3.34.1-2 
MIME-Version: 1.0
Subject: [pseudo][PATCH] Add statx glibc/syscall support
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
X-List-Received-Date: Thu, 07 Nov 2019 20:07:51 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Modern distros (e.g. fedora30) are starting to use the new statx() syscall through
the newly exposed glibc wrapper function in software like coreutils (e.g. the ls
command). Add support to intercept this to pseudo.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 ports/linux/guts/statx.c | 48 ++++++++++++++++++++++++++++++++++++++++
 ports/linux/portdefs.h   |  1 +
 ports/linux/wrapfuncs.in |  1 +
 3 files changed, 50 insertions(+)
 create mode 100644 ports/linux/guts/statx.c

diff --git a/ports/linux/statx/guts/statx.c b/ports/linux/statx/guts/statx.c
new file mode 100644
index 0000000..a3259c4
--- /dev/null
+++ b/ports/linux/statx/guts/statx.c
@@ -0,0 +1,42 @@
+/*
+ * Copyright (c) 2019 Linux Foundation
+ * Author: Richard Purdie
+ *
+ * SPDX-License-Identifier: LGPL-2.1-only
+ *
+ * int
+ * statx(int dirfd, const char *pathname, int flags, unsigned int mask, struct statx *statxbuf) {
+ *	int rc = -1;
+ */
+	pseudo_msg_t *msg;
+	PSEUDO_STATBUF buf;
+	int save_errno;
+
+	rc = real_statx(dirfd, pathname, flags, mask, statxbuf);
+	save_errno = errno;
+	if (rc == -1) {
+		return rc;
+	}
+
+	buf.st_uid = statxbuf->stx_uid;
+	buf.st_gid = statxbuf->stx_gid;
+	buf.st_dev = makedev(statxbuf->stx_dev_major, statxbuf->stx_dev_minor);
+	buf.st_ino = statxbuf->stx_ino;
+	buf.st_mode = statxbuf->stx_mode;
+	buf.st_rdev = makedev(statxbuf->stx_rdev_major, statxbuf->stx_rdev_minor);
+	buf.st_nlink = statxbuf->stx_nlink;
+	msg = pseudo_client_op(OP_STAT, 0, -1, dirfd, pathname, &buf);
+	if (msg && msg->result == RESULT_SUCCEED) {
+		pseudo_debug(PDBGF_FILE, "statx(path %s), flags %o, stat rc %d, stat uid %o\n", pathname, flags, rc, statxbuf->stx_uid);
+		statxbuf->stx_uid = msg->uid;
+		statxbuf->stx_gid = msg->gid;
+		statxbuf->stx_mode = msg->mode;
+		statxbuf->stx_rdev_major = major(msg->rdev);
+		statxbuf->stx_rdev_minor = minor(msg->rdev);
+	} else {
+		pseudo_debug(PDBGF_FILE, "statx(path %s) failed, flags %o, stat rc %d, stat uid %o\n", pathname, flags, rc, statxbuf->stx_uid);
+	}
+	errno = save_errno;
+/*	return rc;
+ * }
+ */
diff --git a/ports/linux/statx/portdefs.h b/ports/linux/statx/portdefs.h
new file mode 100644
index 0000000..bf934dc
--- /dev/null
+++ b/ports/linux/statx/portdefs.h
@@ -0,0 +1,6 @@
+/*
+ * SPDX-License-Identifier: LGPL-2.1-only
+ *
+ */
+#include <sys/stat.h>
+#include <sys/sysmacros.h>
diff --git a/ports/linux/statx/wrapfuncs.in b/ports/linux/statx/wrapfuncs.in
new file mode 100644
index 0000000..c9cd4c3
--- /dev/null
+++ b/ports/linux/statx/wrapfuncs.in
@@ -0,0 +1 @@
+int statx(int dirfd, const char *pathname, int flags, unsigned int mask, struct statx *statxbuf);
diff --git a/ports/linux/subports b/ports/linux/subports
index a29044a..49081bf 100755
--- a/ports/linux/subports
+++ b/ports/linux/subports
@@ -54,3 +54,13 @@ else
 fi
 rm -f dummy.c dummy.o
 
+cat > dummy.c <<EOF
+#define _GNU_SOURCE
+#include <sys/stat.h>
+struct statx x;
+EOF
+if ${CC} -c -o dummy.o dummy.c >/dev/null 2>&1; then
+	echo "linux/statx"
+fi
+rm -f dummy.c dummy.o
+



