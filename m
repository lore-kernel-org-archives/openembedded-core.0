Return-Path: <Zhixiong.Chi@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 47C4874CAF
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Sep 2018 02:26:35 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id w8J2Qa4J022874
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Sep 2018 19:26:36 -0700 (PDT)
Received: from ala-lpggp2.wrs.com (147.11.105.123) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.408.0;
	Tue, 18 Sep 2018 19:26:35 -0700
From: Zhixiong Chi <zhixiong.chi@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 18 Sep 2018 19:26:35 -0700
Message-ID: <20180919022635.73616-1-zhixiong.chi@windriver.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Subject: [PATCH V2] gdb: gdbserver: update ctrl-c handling
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
X-List-Received-Date: Wed, 19 Sep 2018 02:26:35 -0000
Content-Type: text/plain

A) gdbserver sends SIGINT not to the process, but to the process
group (-signal_pid). But the attached process is not always a
process group leader. If not, "kill (-signal_pid, SIGINT)" returns
error and fails to interrupt the attached process. We cannot interrupt
the process attached with gdbserver who is not a process group leader.

This problem was created by the gdb upstream commit 78708b7c8c
The commit fixed the following case B) bug.
B) We cannot interrupt the process attached with gdbserver whose
main thread exits (pthread_exit()).

Now this patch can solve both A) and B).

Signed-off-by: Zhixiong Chi <zhixiong.chi@windriver.com>
---
 meta/recipes-devtools/gdb/gdb-8.2.inc         |  1 +
 .../gdb/gdb/gdbserver-ctrl-c-handling.patch   | 26 +++++++++++++++++++
 2 files changed, 27 insertions(+)
 create mode 100644 meta/recipes-devtools/gdb/gdb/gdbserver-ctrl-c-handling.patch

diff --git a/meta/recipes-devtools/gdb/gdb-8.2.inc b/meta/recipes-devtools/gdb/gdb-8.2.inc
index 999fdde031..dfb0059123 100644
--- a/meta/recipes-devtools/gdb/gdb-8.2.inc
+++ b/meta/recipes-devtools/gdb/gdb-8.2.inc
@@ -16,6 +16,7 @@ SRC_URI = "http://ftp.gnu.org/gnu/gdb/gdb-${PV}.tar.xz \
            file://0009-Change-order-of-CFLAGS.patch \
            file://0010-resolve-restrict-keyword-conflict.patch \
            file://0011-Fix-invalid-sigprocmask-call.patch \
+           file://gdbserver-ctrl-c-handling.patch \
 "
 SRC_URI[md5sum] = "b5a49dbff00d9a87fbe114d14b3101c0"
 SRC_URI[sha256sum] = "c3a441a29c7c89720b734e5a9c6289c0a06be7e0c76ef538f7bbcef389347c39"
diff --git a/meta/recipes-devtools/gdb/gdb/gdbserver-ctrl-c-handling.patch b/meta/recipes-devtools/gdb/gdb/gdbserver-ctrl-c-handling.patch
new file mode 100644
index 0000000000..d1ff5a5d75
--- /dev/null
+++ b/meta/recipes-devtools/gdb/gdb/gdbserver-ctrl-c-handling.patch
@@ -0,0 +1,26 @@
++This problem was created by the upstream commit 78708b7c8c
++After applying the commit, it will send SIGINT to the process group(-signal_pid).
++But if we use gdbserver send SIGINT, and the attached process is not a process
++group leader, then the "kill (-signal_pid, SIGINT)" returns error and fails  to
++interrupt the attached process.
++
++Upstream-Status: Submitted
++[https://sourceware.org/bugzilla/show_bug.cgi?id=18945]
++
++Author: Josh Gao
++Signed-off-by: Zhixiong Chi <zhixiong.chi@windriver.com>
+Index: gdb-8.2/gdb/gdbserver/linux-low.c
+===================================================================
+--- gdb-8.2.orig/gdb/gdbserver/linux-low.c
++++ gdb-8.2/gdb/gdbserver/linux-low.c
+@@ -5940,9 +5940,7 @@ linux_look_up_symbols (void)
+ static void
+ linux_request_interrupt (void)
+ {
+-  /* Send a SIGINT to the process group.  This acts just like the user
+-     typed a ^C on the controlling terminal.  */
+-  kill (-signal_pid, SIGINT);
++  kill (signal_pid, SIGINT);
+ }
+ 
+ /* Copy LEN bytes from inferior's auxiliary vector starting at OFFSET
-- 
2.17.1


