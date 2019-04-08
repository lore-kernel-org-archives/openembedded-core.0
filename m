Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com
	[209.85.128.68])
	by mail.openembedded.org (Postfix) with ESMTP id 629B57D65D
	for <openembedded-core@lists.openembedded.org>;
	Mon,  8 Apr 2019 11:59:39 +0000 (UTC)
Received: by mail-wm1-f68.google.com with SMTP id v14so14380918wmf.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 08 Apr 2019 04:59:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=HZbCV3OrV5bfWRTKMt+g09I+3wPjGxRpCJDRztRaeOg=;
	b=ImBaOvc3MdnVAoF38rlqJMvgM28jijOGKqszQVeb8xg3BJxvZNSg1cI2qglLGXXSZf
	Kbzjp/BifS9iVaKWiQ/Ydd9OggxsuURaM/5FCRzdy/3kz89IS8dk0gGZrXV+RX8lC94A
	s2gyHF5KD7YvdW2p68QrHVPC8mAGCtD6mutEY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=HZbCV3OrV5bfWRTKMt+g09I+3wPjGxRpCJDRztRaeOg=;
	b=pVZK5dCGMqFbg54dvn9o9AYysMfMD2JldEaApCK8U7ImHn+K9RCothMKSzIZpNLedv
	X9d3Gc2x97amRbsWWmdRGJFJ/Gv7YOoYTEnN8n9TVVBWNqPSoFSXnugSeqevNFYJywQX
	+mn7rjQfZ9ny1bAeUIhZNXXKskRy+9HgpE56S8QceZwHMd2qAB7kkSj2McT71X0tSQ65
	BPlI0yXsIe/ofxbsVoF6JkNbzNM0j9orHmzxEycJTGjTYg3VmDxfoMolooegTg4RonNJ
	Zb1izxKrheUARix2Z9xrRv22818o8SWbPXUt4gCCbK7k1c2hNa/1ZWkczMcKq6ZLwUoX
	b1ew==
X-Gm-Message-State: APjAAAXMvnsvHtoGgCD8QPcTHua2bmtVlqBgPPUkrqCro/CWK4vAeFi6
	dYi5bYYw0i+I97Q5GemLyzXc4wM1hWw=
X-Google-Smtp-Source: APXvYqyrANwFowP5J5y9+F4KxURXRn8pX0TErX/eCIfwNJklvXj2ARYG+m0HFZ1a+90urHk9ZsVgwA==
X-Received: by 2002:a1c:244:: with SMTP id 65mr17845811wmc.42.1554724779714;
	Mon, 08 Apr 2019 04:59:39 -0700 (PDT)
Received: from hex.int.rpsys.net (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	s1sm21654036wrt.43.2019.04.08.04.59.38
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 08 Apr 2019 04:59:38 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Mon,  8 Apr 2019 12:59:35 +0100
Message-Id: <20190408115935.16945-3-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190408115935.16945-1-richard.purdie@linuxfoundation.org>
References: <20190408115935.16945-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Subject: [PATCH 3/3] ptest-runner: Add several logging fixes
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
X-List-Received-Date: Mon, 08 Apr 2019 11:59:39 -0000
Content-Transfer-Encoding: 8bit

This change adds three patches to improve the handling of stdout/stderr and child
processes to try and improve logging reliability in ptest-runner.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 ...ils-Ensure-stdout-stderr-are-flushed.patch | 45 +++++++++++
 ...002-use-process-groups-when-spawning.patch | 35 +++++++++
 ...ils-Ensure-pipes-are-read-after-exit.patch | 76 +++++++++++++++++++
 .../ptest-runner/ptest-runner_2.3.1.bb        |  6 +-
 4 files changed, 161 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-support/ptest-runner/ptest-runner/0001-utils-Ensure-stdout-stderr-are-flushed.patch
 create mode 100644 meta/recipes-support/ptest-runner/ptest-runner/0002-use-process-groups-when-spawning.patch
 create mode 100644 meta/recipes-support/ptest-runner/ptest-runner/0003-utils-Ensure-pipes-are-read-after-exit.patch

diff --git a/meta/recipes-support/ptest-runner/ptest-runner/0001-utils-Ensure-stdout-stderr-are-flushed.patch b/meta/recipes-support/ptest-runner/ptest-runner/0001-utils-Ensure-stdout-stderr-are-flushed.patch
new file mode 100644
index 00000000000..c9a9dd7cf49
--- /dev/null
+++ b/meta/recipes-support/ptest-runner/ptest-runner/0001-utils-Ensure-stdout-stderr-are-flushed.patch
@@ -0,0 +1,45 @@
+From 9b36993794c1de733c521b2477370c874c07b617 Mon Sep 17 00:00:00 2001
+From: Richard Purdie <richard.purdie@linuxfoundation.org>
+Date: Thu, 4 Apr 2019 14:18:55 +0100
+Subject: [PATCH 1/3] utils: Ensure stdout/stderr are flushed
+
+There is no guarantee that the data written with fwrite will be flushed to the
+buffer. If stdout and stderr are the same thing, this could lead to interleaved
+writes. The common case is stdout output so flush the output pipes when writing to
+stderr. Also flush stdout before the function returns.
+
+Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
+Upstream-Status: Pending [code being tested]
+---
+ utils.c | 7 +++++--
+ 1 file changed, 5 insertions(+), 2 deletions(-)
+
+diff --git a/utils.c b/utils.c
+index 504df0b..3ceb342 100644
+--- a/utils.c
++++ b/utils.c
+@@ -295,8 +295,11 @@ wait_child(const char *ptest_dir, const char *run_ptest, pid_t pid,
+ 			}
+ 
+ 			if (pfds[1].revents != 0) {
+-				while ((n = read(fds[1], buf, WAIT_CHILD_BUF_MAX_SIZE)) > 0)
++				while ((n = read(fds[1], buf, WAIT_CHILD_BUF_MAX_SIZE)) > 0) {
++					fflush(fps[0]);
+ 					fwrite(buf, n, 1, fps[1]);
++					fflush(fps[1]);
++				}
+ 			}
+ 
+ 			clock_gettime(clock, &sentinel);
+@@ -315,7 +318,7 @@ wait_child(const char *ptest_dir, const char *run_ptest, pid_t pid,
+ 			break;
+ 	}
+ 
+-
++	fflush(fps[0]);
+ 	return status;
+ }
+ 
+-- 
+2.17.1
+
diff --git a/meta/recipes-support/ptest-runner/ptest-runner/0002-use-process-groups-when-spawning.patch b/meta/recipes-support/ptest-runner/ptest-runner/0002-use-process-groups-when-spawning.patch
new file mode 100644
index 00000000000..5436a3340c4
--- /dev/null
+++ b/meta/recipes-support/ptest-runner/ptest-runner/0002-use-process-groups-when-spawning.patch
@@ -0,0 +1,35 @@
+From f0c42a65633341ad048718c7a6dbd035818e9eaf Mon Sep 17 00:00:00 2001
+From: Richard Purdie <richard.purdie@linuxfoundation.org>
+Date: Thu, 4 Apr 2019 14:20:31 +0100
+Subject: [PATCH 2/3] use process groups when spawning
+
+Rather than just killing the process we've swawned, set the process group
+for spawned children and then kill the group of processes.
+
+Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
+Upstream-Status: Pending [code being tested]
+---
+ utils.c | 9 +++++----
+ 1 file changed, 5 insertions(+), 4 deletions(-)
+
+diff --git a/utils.c b/utils.c
+index 3ceb342..c5b3b8d 100644
+--- a/utils.c
++++ b/utils.c
+@@ -309,7 +309,7 @@ wait_child(const char *ptest_dir, const char *run_ptest, pid_t pid,
+ 			clock_gettime(clock, &time);
+ 			if ((time.tv_sec - sentinel.tv_sec) > timeout) {
+ 				*timeouted = 1;
+-				kill(pid, SIGKILL);
++				kill(-pid, SIGKILL);
+ 				waitflags = 0;
+ 			}
+ 		}
+@@ -371,6 +371,7 @@ run_ptests(struct ptest_list *head, const struct ptest_options opts,
+ 				rc = -1;
+ 				break;
+ 			} else if (child == 0) {
++				setsid();
+ 				run_child(p->run_ptest, pipefd_stdout[1], pipefd_stderr[1]);
+ 			} else {
+ 				int status;
diff --git a/meta/recipes-support/ptest-runner/ptest-runner/0003-utils-Ensure-pipes-are-read-after-exit.patch b/meta/recipes-support/ptest-runner/ptest-runner/0003-utils-Ensure-pipes-are-read-after-exit.patch
new file mode 100644
index 00000000000..f7c3ebe6f2c
--- /dev/null
+++ b/meta/recipes-support/ptest-runner/ptest-runner/0003-utils-Ensure-pipes-are-read-after-exit.patch
@@ -0,0 +1,76 @@
+From e58e4e1a7f854953f823dc5135d35f728f253f31 Mon Sep 17 00:00:00 2001
+From: Richard Purdie <richard.purdie@linuxfoundation.org>
+Date: Thu, 4 Apr 2019 14:24:14 +0100
+Subject: [PATCH 3/3] utils: Ensure pipes are read after exit
+
+There was a race in the code where the pipes may not be read after the process has exited
+and data may be left behind in them. This change to ordering ensures the pipes are read
+after the exit code has been read meaning no data can be left behind and the logs should
+be complete.
+
+Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
+Upstream-Status: Pending [code being tested]
+---
+ utils.c | 29 ++++++++++++++++-------------
+ 1 file changed, 16 insertions(+), 13 deletions(-)
+
+diff --git a/utils.c b/utils.c
+index c5b3b8d..37e88ab 100644
+--- a/utils.c
++++ b/utils.c
+@@ -264,6 +264,7 @@ wait_child(const char *ptest_dir, const char *run_ptest, pid_t pid, pid_t group,
+ 	struct pollfd pfds[2];
+ 	struct timespec sentinel;
+ 	clockid_t clock = CLOCK_MONOTONIC;
++	int looping = 1;
+ 	int r;
+ 
+ 	int status;
+@@ -281,9 +282,23 @@ wait_child(const char *ptest_dir, const char *run_ptest, pid_t pid, pid_t group,
+ 
+ 	*timeouted = 0;
+ 
+-	while (1) {
++	while (looping) {
+ 		waitflags = WNOHANG;
+ 
++		if (timeout >= 0) {
++			struct timespec time;
++
++			clock_gettime(clock, &time);
++			if ((time.tv_sec - sentinel.tv_sec) > timeout) {
++				*timeouted = 1;
++				kill(-pid, SIGKILL);
++				waitflags = 0;
++			}
++		}
++
++		if (waitpid(pid, &status, waitflags) == pid)
++			looping = 0;
++
+ 		r = poll(pfds, 2, WAIT_CHILD_POLL_TIMEOUT_MS);
+ 		if (r > 0) {
+ 			char buf[WAIT_CHILD_BUF_MAX_SIZE];
+@@ -303,19 +318,7 @@ wait_child(const char *ptest_dir, const char *run_ptest, pid_t pid, pid_t group,
+ 			}
+ 
+ 			clock_gettime(clock, &sentinel);
+-		} else if (timeout >= 0) {
+-			struct timespec time;
+-
+-			clock_gettime(clock, &time);
+-			if ((time.tv_sec - sentinel.tv_sec) > timeout) {
+-				*timeouted = 1;
+-				kill(-pid, SIGKILL);
+-				waitflags = 0;
+-			}
+ 		}
+-
+-		if (waitpid(pid, &status, waitflags) == pid)
+-			break;
+ 	}
+ 
+ 	fflush(fps[0]);
+-- 
+2.17.1
+
diff --git a/meta/recipes-support/ptest-runner/ptest-runner_2.3.1.bb b/meta/recipes-support/ptest-runner/ptest-runner_2.3.1.bb
index 4b7992bf2fd..e2eb258d0b0 100644
--- a/meta/recipes-support/ptest-runner/ptest-runner_2.3.1.bb
+++ b/meta/recipes-support/ptest-runner/ptest-runner_2.3.1.bb
@@ -10,7 +10,11 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=751419260aa954499f7abaabaa882bbe"
 SRCREV = "05b112bda7ac2adba8e9b0f088d6e5843b148a38"
 PV = "2.3.1+git${SRCPV}"
 
-SRC_URI = "git://git.yoctoproject.org/ptest-runner2"
+SRC_URI = "git://git.yoctoproject.org/ptest-runner2 \
+ file://0001-utils-Ensure-stdout-stderr-are-flushed.patch \
+ file://0002-use-process-groups-when-spawning.patch \
+ file://0003-utils-Ensure-pipes-are-read-after-exit.patch"
+
 S = "${WORKDIR}/git"
 
 FILES_${PN} = "${bindir}/ptest-runner"
-- 
2.20.1


