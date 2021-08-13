Received: from avasout04.plus.net (avasout04.plus.net [212.159.14.19])
 by mx.groups.io with SMTP id smtpd.web09.35129.1628852720859422984
 for <openembedded-core@lists.openembedded.org>;
 Fri, 13 Aug 2021 04:05:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mcrowe.com header.s=20191005 header.b=GR/TRu5y;
 spf=pass (domain: mcrowe.com, ip: 212.159.14.19, mailfrom: mac@mcrowe.com)
Received: from deneb.mcrowe.com ([80.229.24.9])
	by smtp with ESMTP
	id EUzymFXEGOQhvEUzzmWMPK; Fri, 13 Aug 2021 12:05:16 +0100
X-Clacks-Overhead: "GNU Terry Pratchett"
X-CM-Score: 0.00
X-CNFS-Analysis: v=2.3 cv=IvmFjI3g c=1 sm=1 tr=0
 a=E/9URZZQ5L3bK/voZ0g0HQ==:117 a=E/9URZZQ5L3bK/voZ0g0HQ==:17
 a=MhDmnRu9jo8A:10 a=-An2I_7KAAAA:8 a=dYqGrdaxLsnGZbgIspcA:9
 a=Sq34B_EcNBM9_nrAYB9S:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mcrowe.com;
	 s=20191005; h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject
	:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:
	In-Reply-To:References; bh=Bw4H4gQPKxj7Sesc3UTPBBwxfN83ZD2v6Im+Z51TQbc=; b=GR
	/TRu5yLTzxq7LhAk0NJq09FeVZ+YohMB/pBRknDV8YWIShQUkDamQvPEYd2rPYdWK7Sh1ydY6OZMD
	8TywuabR0EqNfyLmXdqsEQhRH4DmIxiueoyAfqiFlrAKCHyHqDPkX97HfFQRASe5+lTgZ88qp3ON5
	54rY73vsauzx8VcaQ9y+CD0Wp8R/mJCBrnOERv3uKW4JrY1YzEMm/RE/l9P3Sq4r/1xdPkc/eWnRU
	Z8hrsqmRqWCBH87+0W7HfNGUWN005dyJagqyhGOEQsZM91Gq20dqPrKHQVDU9G08B8ISd4hfh8Zm+
	eveaMahuvdXO6+YWdh5BWxMDwLhjuHAA==;
Received: from mac by deneb.mcrowe.com with local (Exim 4.92)
	(envelope-from <mac@mcrowe.com>)
	id 1mEUzx-0003eG-7r; Fri, 13 Aug 2021 12:05:13 +0100
From: "Mike Crowe" <yocto@mac.mcrowe.com>
To: openembedded-core@lists.openembedded.org
Cc: Mike Crowe <mac@mcrowe.com>
Subject: [pseudo][PATCH v2] fcntl: Add support for fcntl F_GETPIPE_SZ and F_SETPIPE_SZ
Date: Fri, 13 Aug 2021 12:05:09 +0100
Message-Id: <20210813110509.1430860-1-mac@mcrowe.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-CMAE-Envelope: MS4wfEykf1ZVn3cMBWj4GYl9vALFfBfvg0HzAK3ajEPKyfg5d1ESf0Kn+3X5rC10pAhaWp4WwE24HjMvmv4uvAqorDS9fO/SoNYqDm5lG/KZL13VNj+IXDQH
 5ANz/41Eq+JkGNAnmMVkr9SmXX6ceqQh3Dn/cYuys1u7yIY/oF5BBmg4gbr9NVQ5k56ti5RSjUMOvg==
Content-Transfer-Encoding: 8bit

When running the test suite on my Debian 11 box I see many occurrences
of:

 unknown fcntl argument 1032, assuming long argument.

(for example from test-execl.sh.)

It appears that this is F_GETPIPE_SZ and it takes no arguments. Let's
add it and the corresponding F_SETPIPE_SZ too to avoid the warning
messages.

F_SETPIPE_SZ accepts an int argument, which strictly speaking isn't the
same as the long that the wrapper expects. However, this is also true
for F_DUPFD which seems to be working correctly on all the targets that
people care about.

We need to define the command constants if the system headers don't
provide them to ensure that a binary built on an old system works
without the new commands works correctly only a newer one that tries to
use them. If the system values differ from the expected ones then such a
binary would also be incompatible, so fail the build in that case too.

Signed-off-by: Mike Crowe <mac@mcrowe.com>
---
 Makefile.in              |  1 +
 ports/linux/guts/fcntl.c | 21 +++++++++++++++
 test/test-fcntl.c        | 58 ++++++++++++++++++++++++++++++++++++++++
 test/test-fcntl.sh       |  5 ++++
 4 files changed, 85 insertions(+)
 create mode 100644 test/test-fcntl.c
 create mode 100755 test/test-fcntl.sh

diff --git a/Makefile.in b/Makefile.in
index 10441ef..4ebe5da 100644
--- a/Makefile.in
+++ b/Makefile.in
@@ -79,6 +79,7 @@ test: all | $(BIN) $(LIB) $(LOCALSTATE)
 	$(CC) $(CFLAGS) $(CFLAGS_PSEUDO) -o test/test-openat test/test-openat.c
 	$(CC) $(CFLAGS) $(CFLAGS_PSEUDO) -o test/test-statx test/test-statx.c
 	$(CC) $(CFLAGS) $(CFLAGS_PSEUDO) -o test/test-fstat test/test-fstat.c
+	$(CC) $(CFLAGS) $(CFLAGS_PSEUDO) -o test/test-fcntl test/test-fcntl.c
 	@./run_tests.sh -v
 
 install-lib: $(LIBPSEUDO)
diff --git a/ports/linux/guts/fcntl.c b/ports/linux/guts/fcntl.c
index 434c7f3..ffb50be 100644
--- a/ports/linux/guts/fcntl.c
+++ b/ports/linux/guts/fcntl.c
@@ -8,6 +8,22 @@
  * wrap_fcntl(int fd, int cmd, ...struct flock *lock) {
  *	int rc = -1;
  */
+#if !defined(F_GETPIPE_SZ)
+#define F_GETPIPE_SZ (1032)
+#endif
+
+#if F_GETPIPE_SZ != 1032
+#error System F_GETPIPE_SZ has unexpected value
+#endif
+
+#if !defined(F_SETPIPE_SZ)
+#define F_SETPIPE_SZ (1031)
+#endif
+
+#if F_SETPIPE_SZ != 1031
+#error System F_SETPIPE_SZ has unexpected value
+#endif
+
  	long arg;
 	int save_errno;
 
@@ -31,12 +47,17 @@
 		}
 		errno = save_errno;
 		break;
+	case F_SETPIPE_SZ:
+		/* actually do something */
+		rc = real_fcntl(fd, cmd, arg);
+		break;
 	/* no argument: */
 	case F_GETFD:
 	case F_GETFL:
 	case F_GETOWN:
 	case F_GETSIG:
 	case F_GETLEASE:
+	case F_GETPIPE_SZ:
 		rc = real_fcntl(fd, cmd);
 		break;
 	/* long argument */
diff --git a/test/test-fcntl.c b/test/test-fcntl.c
new file mode 100644
index 0000000..b593d50
--- /dev/null
+++ b/test/test-fcntl.c
@@ -0,0 +1,58 @@
+/* fcntl-linux.h doesn't define F_GETPIPE_SZ and F_SETPIPE_SZ without
+ * this */
+#define _GNU_SOURCE
+
+#include <sys/types.h>
+#include <sys/stat.h>
+#include <fcntl.h>
+#include <stdio.h>
+#include <stdlib.h>
+#include <limits.h>
+#include <unistd.h>
+#include <string.h>
+
+int test_pipe_sz()
+{
+#if defined(F_GETPIPE_SZ) && defined(F_SETPIPE_SZ)
+	int pipefd[2];
+
+	if (pipe(pipefd) < 0) {
+		perror("pipe");
+		return 1;
+	}
+
+	const int orig_size = fcntl(pipefd[0], F_GETPIPE_SZ);
+	if (orig_size < 0) {
+		perror("F_GETPIPE_SZ");
+		return 1;
+	}
+
+	const int new_size = orig_size * 2;
+
+	if (fcntl(pipefd[0], F_SETPIPE_SZ, new_size) < 0) {
+		perror("F_SETPIPE_SZ");
+		return 1;
+	}
+
+	const int final_size = fcntl(pipefd[0], F_GETPIPE_SZ);
+	if (final_size < 0) {
+		perror("Second F_GETPIPE_SZ");
+		return 1;
+	}
+
+	if (final_size < new_size) {
+		fprintf(stderr, "Unexpected final pipe size: %d\n", final_size);
+		return 1;
+	}
+#else
+	printf("Host too old for F_GETPIPE_SZ and F_SETPIPE_SZ tests\n");
+#endif
+	return 0;
+}
+
+int main()
+{
+	int result = 0;
+	result += test_pipe_sz();
+	return result;
+}
diff --git a/test/test-fcntl.sh b/test/test-fcntl.sh
new file mode 100755
index 0000000..7112620
--- /dev/null
+++ b/test/test-fcntl.sh
@@ -0,0 +1,5 @@
+#!/bin/bash
+#
+# SPDX-License-Identifier: LGPL-2.1-only
+#
+./test/test-fcntl
-- 
2.30.2

