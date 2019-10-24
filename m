Return-Path: <Haiqing.Bai@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 627847F799
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Oct 2019 02:33:41 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.2) with ESMTPS id x9O2XeAx004098
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Oct 2019 19:33:40 -0700 (PDT)
Received: from pek-lpggp2.wrs.com (128.224.153.75) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.468.0;
	Wed, 23 Oct 2019 19:33:40 -0700
From: Haiqing Bai <Haiqing.Bai@windriver.com>
To: <openembedded-core@lists.openembedded.org>, <haiqing.bai@windriver.com>
Date: Thu, 24 Oct 2019 10:33:04 +0800
Message-ID: <1571884385-3662-1-git-send-email-Haiqing.Bai@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH] unfs3: fixed the issue that unfsd consumes 100% CPU
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
X-List-Received-Date: Thu, 24 Oct 2019 02:33:41 -0000
Content-Type: text/plain

The 'accept' function on the socket of unfsd daemon
is always in below error state:
accept(4, 0x7ffd5e6dddc0, [128]) = -1 EINVAL (Invalid argument)
accept(6, 0x7ffd5e6dddc0, [128]) = -1 EINVAL (Invalid argument)

And 'strace -c -p <the pid of unfsd>' shows:
% time     seconds  usecs/call     calls    errors syscall
------ ----------- ----------- --------- --------- ----------------
 70.87    0.005392           0    513886    513886 accept
 29.13    0.002216           0    256943           poll

This error state is in the 'for' loop of the daemon, so it consumes 100%
CPU. The reason is that 'listen' is not called for the TCP socket before
'accept'. Actually the called 'svc_tli_create' from libtirpc will not call
'listen' on a bound socket.

Signed-off-by: Haiqing Bai <Haiqing.Bai@windriver.com>
---
 .../0001-Add-listen-action-for-a-tcp-socket.patch  | 54 ++++++++++++++++++++++
 meta/recipes-devtools/unfs3/unfs3_git.bb           |  1 +
 2 files changed, 55 insertions(+)
 create mode 100644 meta/recipes-devtools/unfs3/unfs3/0001-Add-listen-action-for-a-tcp-socket.patch

diff --git a/meta/recipes-devtools/unfs3/unfs3/0001-Add-listen-action-for-a-tcp-socket.patch b/meta/recipes-devtools/unfs3/unfs3/0001-Add-listen-action-for-a-tcp-socket.patch
new file mode 100644
index 0000000..e9b9d3d
--- /dev/null
+++ b/meta/recipes-devtools/unfs3/unfs3/0001-Add-listen-action-for-a-tcp-socket.patch
@@ -0,0 +1,54 @@
+From b42ab8e1aca951dd06c113159491b3fd5cf06f2e Mon Sep 17 00:00:00 2001
+From: Haiqing Bai <Haiqing.Bai@windriver.com>
+Date: Thu, 24 Oct 2019 09:39:04 +0800
+Subject: [PATCH] Add "listen" action for a tcp socket which does not call
+ 'listen' after 'bind'
+
+It is found that /usr/bin/unfsd customus 100% cpu after starting qemu with 'nfs'
+option, and below lots of error messages shows when strace the process:
+
+poll([{fd=3, events=POLLIN|POLLPRI|POLLRDNORM|POLLRDBAND},{fd=4, events=POLLIN|POLLPRI|POLLRDNORM|POLLRDBAND},
+{fd=5, events=POLLIN|POLLPRI|POLLRDNORM|POLLRDBAND},{fd=6, events =POLLIN|POLLPRI|POLLRDNORM|POLLRDBAND}],
+4, 2000) = 2 ([{fd=4, revents=POLLHUP},{fd=6, revents=POLLHUP}])
+accept(4, 0x7ffd5e6dddc0, [128]) = -1 EINVAL (Invalid argument)
+accept(6, 0x7ffd5e6dddc0, [128]) = -1 EINVAL (Invalid argument)
+
+% time     seconds  usecs/call     calls    errors syscall
+------ ----------- ----------- --------- --------- ----------------
+ 70.87    0.005392           0    513886    513886 accept
+ 29.13    0.002216           0    256943           poll
+  0.00    0.000000           0         4           read
+
+The root cause is that 'listen' is not called for the binded
+socket. The depended libtipc does not call 'listen' if found
+the incomming socket is binded, so 'accept' reports the error
+in the 'for' loop and cpu consumed.
+
+Upstream-Status: Pending
+
+Signed-off-by: Haiqing Bai <Haiqing.Bai@windriver.com>
+---
+ daemon.c | 7 +++++++
+ 1 file changed, 7 insertions(+)
+
+diff --git a/daemon.c b/daemon.c
+index 028a181..4c85903 100644
+--- a/daemon.c
++++ b/daemon.c
+@@ -814,6 +814,13 @@ static SVCXPRT *create_tcp_transport(unsigned int port)
+ 	    fprintf(stderr, "Couldn't bind to tcp port %d\n", port);
+ 	    exit(1);
+ 	}
++
++	if (listen(sock, SOMAXCONN) < 0) {
++	    perror("listen");
++	    fprintf(stderr, "Couldn't listen on the address \n");
++	    close(sock);
++	    exit(1);
++	}
+     }
+ 
+     transp = svctcp_create(sock, 0, 0);
+-- 
+1.9.1
+
diff --git a/meta/recipes-devtools/unfs3/unfs3_git.bb b/meta/recipes-devtools/unfs3/unfs3_git.bb
index 79d0978..d60cee8 100644
--- a/meta/recipes-devtools/unfs3/unfs3_git.bb
+++ b/meta/recipes-devtools/unfs3/unfs3_git.bb
@@ -23,6 +23,7 @@ SRC_URI = "git://github.com/unfs3/unfs3.git;protocol=https \
            file://tcp_no_delay.patch \
            file://0001-daemon.c-Libtirpc-porting-fixes.patch \
            file://0001-attr-fix-utime-for-symlink.patch \
+           file://0001-Add-listen-action-for-a-tcp-socket.patch \
           "
 SRCREV = "c12a5c69a8d59be6916cbd0e0f41c159f1962425"
 UPSTREAM_CHECK_GITTAGREGEX = "unfs3\-(?P<pver>.+)"
-- 
1.9.1


