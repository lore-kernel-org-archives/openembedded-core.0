Return-Path: <Randy.MacLeod@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 623C66C45D
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Jun 2019 20:26:38 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id x56KQYnI009803
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 6 Jun 2019 13:26:35 -0700 (PDT)
Received: from [172.25.44.4] (172.25.44.4) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.439.0;
	Thu, 6 Jun 2019 13:26:34 -0700
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	<openembedded-core@lists.openembedded.org>, Sakib Sajal
	<sakib.sajal@windriver.com>, =?UTF-8?B?QW7DrWJhbCBMaW3Ds24=?=
	<anibal.limon@linaro.org>
References: <20190408115935.16945-1-richard.purdie@linuxfoundation.org>
	<20190408115935.16945-3-richard.purdie@linuxfoundation.org>
From: Randy MacLeod <randy.macleod@windriver.com>
Message-ID: <34dd04af-bb37-b64f-4721-f48103f3ce63@windriver.com>
Date: Thu, 6 Jun 2019 16:26:33 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190408115935.16945-3-richard.purdie@linuxfoundation.org>
X-Originating-IP: [172.25.44.4]
Subject: Re: [PATCH 3/3] ptest-runner: Add several logging fixes
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
X-List-Received-Date: Thu, 06 Jun 2019 20:26:38 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

On 4/8/19 7:59 AM, Richard Purdie wrote:
> This change adds three patches to improve the handling of stdout/stderr and child
> processes to try and improve logging reliability in ptest-runner.
> 
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
>   ...ils-Ensure-stdout-stderr-are-flushed.patch | 45 +++++++++++
>   ...002-use-process-groups-when-spawning.patch | 35 +++++++++
>   ...ils-Ensure-pipes-are-read-after-exit.patch | 76 +++++++++++++++++++

Sakib and I found another problem with ptest-runner and job control.
When bash runs some ptests, there's a warning:

< bash: cannot set terminal process group (2980): Inappropriate ioctl 
for device
< bash: no job control in this shell

This only happens when being run under ptest-runner instead of say
under /usr/lib/bash/ptest/run-ptest. There may also be some problems
with su'ing to the bash_user account but we'll see.

So we're working on this and we'd like to know if the three patches here
are considered stable and should therefore be merged to ptest-runner?

Sakib is testing a patch to detach in the parent and hand the 
controlling terminal to the child using a couple of
ioctl(0, TIOCSCTTY, NULL) type of calls.

../Randy

>   .../ptest-runner/ptest-runner_2.3.1.bb        |  6 +-
>   4 files changed, 161 insertions(+), 1 deletion(-)
>   create mode 100644 meta/recipes-support/ptest-runner/ptest-runner/0001-utils-Ensure-stdout-stderr-are-flushed.patch
>   create mode 100644 meta/recipes-support/ptest-runner/ptest-runner/0002-use-process-groups-when-spawning.patch
>   create mode 100644 meta/recipes-support/ptest-runner/ptest-runner/0003-utils-Ensure-pipes-are-read-after-exit.patch
> 
> diff --git a/meta/recipes-support/ptest-runner/ptest-runner/0001-utils-Ensure-stdout-stderr-are-flushed.patch b/meta/recipes-support/ptest-runner/ptest-runner/0001-utils-Ensure-stdout-stderr-are-flushed.patch
> new file mode 100644
> index 00000000000..c9a9dd7cf49
> --- /dev/null
> +++ b/meta/recipes-support/ptest-runner/ptest-runner/0001-utils-Ensure-stdout-stderr-are-flushed.patch
> @@ -0,0 +1,45 @@
> +From 9b36993794c1de733c521b2477370c874c07b617 Mon Sep 17 00:00:00 2001
> +From: Richard Purdie <richard.purdie@linuxfoundation.org>
> +Date: Thu, 4 Apr 2019 14:18:55 +0100
> +Subject: [PATCH 1/3] utils: Ensure stdout/stderr are flushed
> +
> +There is no guarantee that the data written with fwrite will be flushed to the
> +buffer. If stdout and stderr are the same thing, this could lead to interleaved
> +writes. The common case is stdout output so flush the output pipes when writing to
> +stderr. Also flush stdout before the function returns.
> +
> +Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> +Upstream-Status: Pending [code being tested]
> +---
> + utils.c | 7 +++++--
> + 1 file changed, 5 insertions(+), 2 deletions(-)
> +
> +diff --git a/utils.c b/utils.c
> +index 504df0b..3ceb342 100644
> +--- a/utils.c
> ++++ b/utils.c
> +@@ -295,8 +295,11 @@ wait_child(const char *ptest_dir, const char *run_ptest, pid_t pid,
> + 			}
> +
> + 			if (pfds[1].revents != 0) {
> +-				while ((n = read(fds[1], buf, WAIT_CHILD_BUF_MAX_SIZE)) > 0)
> ++				while ((n = read(fds[1], buf, WAIT_CHILD_BUF_MAX_SIZE)) > 0) {
> ++					fflush(fps[0]);
> + 					fwrite(buf, n, 1, fps[1]);
> ++					fflush(fps[1]);
> ++				}
> + 			}
> +
> + 			clock_gettime(clock, &sentinel);
> +@@ -315,7 +318,7 @@ wait_child(const char *ptest_dir, const char *run_ptest, pid_t pid,
> + 			break;
> + 	}
> +
> +-
> ++	fflush(fps[0]);
> + 	return status;
> + }
> +
> +--
> +2.17.1
> +
> diff --git a/meta/recipes-support/ptest-runner/ptest-runner/0002-use-process-groups-when-spawning.patch b/meta/recipes-support/ptest-runner/ptest-runner/0002-use-process-groups-when-spawning.patch
> new file mode 100644
> index 00000000000..5436a3340c4
> --- /dev/null
> +++ b/meta/recipes-support/ptest-runner/ptest-runner/0002-use-process-groups-when-spawning.patch
> @@ -0,0 +1,35 @@
> +From f0c42a65633341ad048718c7a6dbd035818e9eaf Mon Sep 17 00:00:00 2001
> +From: Richard Purdie <richard.purdie@linuxfoundation.org>
> +Date: Thu, 4 Apr 2019 14:20:31 +0100
> +Subject: [PATCH 2/3] use process groups when spawning
> +
> +Rather than just killing the process we've swawned, set the process group
> +for spawned children and then kill the group of processes.
> +
> +Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> +Upstream-Status: Pending [code being tested]
> +---
> + utils.c | 9 +++++----
> + 1 file changed, 5 insertions(+), 4 deletions(-)
> +
> +diff --git a/utils.c b/utils.c
> +index 3ceb342..c5b3b8d 100644
> +--- a/utils.c
> ++++ b/utils.c
> +@@ -309,7 +309,7 @@ wait_child(const char *ptest_dir, const char *run_ptest, pid_t pid,
> + 			clock_gettime(clock, &time);
> + 			if ((time.tv_sec - sentinel.tv_sec) > timeout) {
> + 				*timeouted = 1;
> +-				kill(pid, SIGKILL);
> ++				kill(-pid, SIGKILL);
> + 				waitflags = 0;
> + 			}
> + 		}
> +@@ -371,6 +371,7 @@ run_ptests(struct ptest_list *head, const struct ptest_options opts,
> + 				rc = -1;
> + 				break;
> + 			} else if (child == 0) {
> ++				setsid();
> + 				run_child(p->run_ptest, pipefd_stdout[1], pipefd_stderr[1]);
> + 			} else {
> + 				int status;
> diff --git a/meta/recipes-support/ptest-runner/ptest-runner/0003-utils-Ensure-pipes-are-read-after-exit.patch b/meta/recipes-support/ptest-runner/ptest-runner/0003-utils-Ensure-pipes-are-read-after-exit.patch
> new file mode 100644
> index 00000000000..f7c3ebe6f2c
> --- /dev/null
> +++ b/meta/recipes-support/ptest-runner/ptest-runner/0003-utils-Ensure-pipes-are-read-after-exit.patch
> @@ -0,0 +1,76 @@
> +From e58e4e1a7f854953f823dc5135d35f728f253f31 Mon Sep 17 00:00:00 2001
> +From: Richard Purdie <richard.purdie@linuxfoundation.org>
> +Date: Thu, 4 Apr 2019 14:24:14 +0100
> +Subject: [PATCH 3/3] utils: Ensure pipes are read after exit
> +
> +There was a race in the code where the pipes may not be read after the process has exited
> +and data may be left behind in them. This change to ordering ensures the pipes are read
> +after the exit code has been read meaning no data can be left behind and the logs should
> +be complete.
> +
> +Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> +Upstream-Status: Pending [code being tested]
> +---
> + utils.c | 29 ++++++++++++++++-------------
> + 1 file changed, 16 insertions(+), 13 deletions(-)
> +
> +diff --git a/utils.c b/utils.c
> +index c5b3b8d..37e88ab 100644
> +--- a/utils.c
> ++++ b/utils.c
> +@@ -264,6 +264,7 @@ wait_child(const char *ptest_dir, const char *run_ptest, pid_t pid, pid_t group,
> + 	struct pollfd pfds[2];
> + 	struct timespec sentinel;
> + 	clockid_t clock = CLOCK_MONOTONIC;
> ++	int looping = 1;
> + 	int r;
> +
> + 	int status;
> +@@ -281,9 +282,23 @@ wait_child(const char *ptest_dir, const char *run_ptest, pid_t pid, pid_t group,
> +
> + 	*timeouted = 0;
> +
> +-	while (1) {
> ++	while (looping) {
> + 		waitflags = WNOHANG;
> +
> ++		if (timeout >= 0) {
> ++			struct timespec time;
> ++
> ++			clock_gettime(clock, &time);
> ++			if ((time.tv_sec - sentinel.tv_sec) > timeout) {
> ++				*timeouted = 1;
> ++				kill(-pid, SIGKILL);
> ++				waitflags = 0;
> ++			}
> ++		}
> ++
> ++		if (waitpid(pid, &status, waitflags) == pid)
> ++			looping = 0;
> ++
> + 		r = poll(pfds, 2, WAIT_CHILD_POLL_TIMEOUT_MS);
> + 		if (r > 0) {
> + 			char buf[WAIT_CHILD_BUF_MAX_SIZE];
> +@@ -303,19 +318,7 @@ wait_child(const char *ptest_dir, const char *run_ptest, pid_t pid, pid_t group,
> + 			}
> +
> + 			clock_gettime(clock, &sentinel);
> +-		} else if (timeout >= 0) {
> +-			struct timespec time;
> +-
> +-			clock_gettime(clock, &time);
> +-			if ((time.tv_sec - sentinel.tv_sec) > timeout) {
> +-				*timeouted = 1;
> +-				kill(-pid, SIGKILL);
> +-				waitflags = 0;
> +-			}
> + 		}
> +-
> +-		if (waitpid(pid, &status, waitflags) == pid)
> +-			break;
> + 	}
> +
> + 	fflush(fps[0]);
> +--
> +2.17.1
> +
> diff --git a/meta/recipes-support/ptest-runner/ptest-runner_2.3.1.bb b/meta/recipes-support/ptest-runner/ptest-runner_2.3.1.bb
> index 4b7992bf2fd..e2eb258d0b0 100644
> --- a/meta/recipes-support/ptest-runner/ptest-runner_2.3.1.bb
> +++ b/meta/recipes-support/ptest-runner/ptest-runner_2.3.1.bb
> @@ -10,7 +10,11 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=751419260aa954499f7abaabaa882bbe"
>   SRCREV = "05b112bda7ac2adba8e9b0f088d6e5843b148a38"
>   PV = "2.3.1+git${SRCPV}"
>   
> -SRC_URI = "git://git.yoctoproject.org/ptest-runner2"
> +SRC_URI = "git://git.yoctoproject.org/ptest-runner2 \
> + file://0001-utils-Ensure-stdout-stderr-are-flushed.patch \
> + file://0002-use-process-groups-when-spawning.patch \
> + file://0003-utils-Ensure-pipes-are-read-after-exit.patch"
> +
>   S = "${WORKDIR}/git"
>   
>   FILES_${PN} = "${bindir}/ptest-runner"
> 


-- 
# Randy MacLeod
# Wind River Linux

