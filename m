Return-Path: <martin@geanix.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E033C6FD1F
	for <webhook@archiver.kernel.org>; Wed,  3 Apr 2024 07:02:55 +0000 (UTC)
Received: from www530.your-server.de (www530.your-server.de [188.40.30.78])
 by mx.groups.io with SMTP id smtpd.web10.5480.1712127766161566173
 for <openembedded-core@lists.openembedded.org>;
 Wed, 03 Apr 2024 00:02:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@geanix.com header.s=default2211 header.b=mQ9ftZKH;
 spf=pass (domain: geanix.com, ip: 188.40.30.78, mailfrom: martin@geanix.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=geanix.com;
	s=default2211; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=rj69gDcSpBl8Yuk+T5o2QKo6YVW0izjjL5S+MzuB0Y8=; b=mQ9ftZKH/UsIRj/iPkycigZDSH
	YVOFOXg1WVPsBZN72b+x+PDsK2up17zj8TL0DmMSXlShGD7Sr6SE+x0v6reIpiBLSq6ukiJD25frw
	12pbGpuqOMIhcmnlaDNDJ9y63dTj54a+T1hpBtwkT66uyexPubvfESJdbKlTcjBocWjZj65Orkr+m
	g0M4kmTATPJDGY4Poh6eFFz8YMj0kyrK0TkRdtGYn4OSz3nppoFnW5qNpIVgKVZ6cH18PP0UQcB8y
	eatbrFY0DELoObY1n5gaYygfAG0FwujORH0QDpl15htQKTt7gjz2zYJvi4XWVjEB4cgWqh3wbuK7z
	jHqmGg5g==;
Received: from sslproxy01.your-server.de ([78.46.139.224])
	by www530.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <martin@geanix.com>)
	id 1rrudu-0007UT-Q0; Wed, 03 Apr 2024 09:02:42 +0200
Received: from [185.17.218.86] (helo=rap..)
	by sslproxy01.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <martin@geanix.com>)
	id 1rrudv-000NUU-04;
	Wed, 03 Apr 2024 09:02:42 +0200
From: =?UTF-8?q?Martin=20Hundeb=C3=B8ll?= <martin@geanix.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>,
	Khem Raj <raj.khem@gmail.com>,
	Randy MacLeod <randy.macleod@windriver.com>,
	=?UTF-8?q?Martin=20Hundeb=C3=B8ll?= <martin@geanix.com>
Subject: [PATCH 3/5] ninja: build modified version with GNU Make jobserver support
Date: Wed,  3 Apr 2024 09:02:02 +0200
Message-ID: <20240403070204.367470-4-martin@geanix.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240403070204.367470-1-martin@geanix.com>
References: <20240403070204.367470-1-martin@geanix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authenticated-Sender: martin@geanix.com
X-Virus-Scanned: Clear (ClamAV 0.103.10/27233/Tue Apr  2 10:26:21 2024)
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 03 Apr 2024 07:02:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197907

Ninja doesn't (yet) support the GNU Make jobserver out of the box, but
there is a pull request adding that support[1]. Add the pull request
commits as patches to ninja to make it cooperate with the make jobserver
feature.

In order to make the patces apply, the ninja version is bumped to the
unreleased 1.12.0.

[1] https://github.com/ninja-build/ninja/pull/2263

Signed-off-by: Martin Hundebøll <martin@geanix.com>
---
 ...dd-GNU-make-jobserver-client-support.patch |  494 +++++++
 ...l-monitoring-to-SubprocessSet-DoWork.patch |  560 +++++++
 ...er-when-jN-is-forced-on-command-line.patch |  198 +++
 .../files/0004-Honor-lN-from-MAKEFLAGS.patch  |  134 ++
 ...e-LinePrinter-for-TokenPool-messages.patch |  128 ++
 .../files/0006-Prepare-PR-for-merging.patch   |  156 ++
 .../files/0007-Add-tests-for-TokenPool.patch  |  237 +++
 ...0008-Add-tests-for-subprocess-module.patch |  121 ++
 .../0009-Add-tests-for-build-module.patch     |  397 +++++
 ...-implementation-for-GNUmakeTokenPool.patch | 1283 +++++++++++++++++
 .../0011-Prepare-PR-for-merging-part-II.patch |  744 ++++++++++
 ...ename-TokenPool-Setup-to-SetupClient.patch |  109 ++
 ...013-Add-TokenPool-SetupMaster-method.patch |   78 +
 ...mmand-line-option-m-tokenpool-master.patch |  101 ++
 ...plement-GNUmakeTokenPool-SetupMaster.patch |  152 ++
 ...mplement-GNUmakeTokenPool-CreatePool.patch |   87 ++
 ...-Add-tests-for-TokenPool-SetupMaster.patch |  145 ++
 ...-jobserver-fifo-style-client-support.patch |  265 ++++
 ...ional-argument-to-m-tokenpool-master.patch |  368 +++++
 ...-jobserver-fifo-style-master-support.patch |  287 ++++
 meta/recipes-devtools/ninja/ninja_1.11.1.bb   |   33 -
 meta/recipes-devtools/ninja/ninja_1.12.0.bb   |   55 +
 22 files changed, 6099 insertions(+), 33 deletions(-)
 create mode 100644 meta/recipes-devtools/ninja/files/0001-Add-GNU-make-jobserver-client-support.patch
 create mode 100644 meta/recipes-devtools/ninja/files/0002-Add-TokenPool-monitoring-to-SubprocessSet-DoWork.patch
 create mode 100644 meta/recipes-devtools/ninja/files/0003-Ignore-jobserver-when-jN-is-forced-on-command-line.patch
 create mode 100644 meta/recipes-devtools/ninja/files/0004-Honor-lN-from-MAKEFLAGS.patch
 create mode 100644 meta/recipes-devtools/ninja/files/0005-Use-LinePrinter-for-TokenPool-messages.patch
 create mode 100644 meta/recipes-devtools/ninja/files/0006-Prepare-PR-for-merging.patch
 create mode 100644 meta/recipes-devtools/ninja/files/0007-Add-tests-for-TokenPool.patch
 create mode 100644 meta/recipes-devtools/ninja/files/0008-Add-tests-for-subprocess-module.patch
 create mode 100644 meta/recipes-devtools/ninja/files/0009-Add-tests-for-build-module.patch
 create mode 100644 meta/recipes-devtools/ninja/files/0010-Add-Win32-implementation-for-GNUmakeTokenPool.patch
 create mode 100644 meta/recipes-devtools/ninja/files/0011-Prepare-PR-for-merging-part-II.patch
 create mode 100644 meta/recipes-devtools/ninja/files/0012-Rename-TokenPool-Setup-to-SetupClient.patch
 create mode 100644 meta/recipes-devtools/ninja/files/0013-Add-TokenPool-SetupMaster-method.patch
 create mode 100644 meta/recipes-devtools/ninja/files/0014-Add-command-line-option-m-tokenpool-master.patch
 create mode 100644 meta/recipes-devtools/ninja/files/0015-Implement-GNUmakeTokenPool-SetupMaster.patch
 create mode 100644 meta/recipes-devtools/ninja/files/0016-Implement-GNUmakeTokenPool-CreatePool.patch
 create mode 100644 meta/recipes-devtools/ninja/files/0017-Add-tests-for-TokenPool-SetupMaster.patch
 create mode 100644 meta/recipes-devtools/ninja/files/0018-Add-GNU-make-jobserver-fifo-style-client-support.patch
 create mode 100644 meta/recipes-devtools/ninja/files/0019-Add-optional-argument-to-m-tokenpool-master.patch
 create mode 100644 meta/recipes-devtools/ninja/files/0020-Add-GNU-make-jobserver-fifo-style-master-support.patch
 delete mode 100644 meta/recipes-devtools/ninja/ninja_1.11.1.bb
 create mode 100644 meta/recipes-devtools/ninja/ninja_1.12.0.bb

diff --git a/meta/recipes-devtools/ninja/files/0001-Add-GNU-make-jobserver-client-support.patch b/meta/recipes-devtools/ninja/files/0001-Add-GNU-make-jobserver-client-support.patch
new file mode 100644
index 0000000000..c882a57a90
--- /dev/null
+++ b/meta/recipes-devtools/ninja/files/0001-Add-GNU-make-jobserver-client-support.patch
@@ -0,0 +1,494 @@
+From 3e04d21231e64129f6fffba7fd37d94b185dae45 Mon Sep 17 00:00:00 2001
+From: Stefan Becker <stefanb@gpartner-nvidia.com>
+Date: Tue, 22 Mar 2016 13:48:07 +0200
+Subject: [PATCH 01/20] Add GNU make jobserver client support
+
+- add new TokenPool interface
+- GNU make implementation for TokenPool parses and verifies the magic
+  information from the MAKEFLAGS environment variable
+- RealCommandRunner tries to acquire TokenPool
+  * if no token pool is available then there is no change in behaviour
+- When a token pool is available then RealCommandRunner behaviour
+  changes as follows
+  * CanRunMore() only returns true if TokenPool::Acquire() returns true
+  * StartCommand() calls TokenPool::Reserve()
+  * WaitForCommand() calls TokenPool::Release()
+
+Documentation for GNU make jobserver
+
+  http://make.mad-scientist.net/papers/jobserver-implementation/
+
+Fixes https://github.com/ninja-build/ninja/issues/1139
+
+Upstream-Status: Submitted [https://github.com/ninja-build/ninja/pull/1140]
+---
+ configure.py              |   2 +
+ src/build.cc              |  63 ++++++++----
+ src/build.h               |   3 +
+ src/tokenpool-gnu-make.cc | 211 ++++++++++++++++++++++++++++++++++++++
+ src/tokenpool-none.cc     |  27 +++++
+ src/tokenpool.h           |  26 +++++
+ 6 files changed, 310 insertions(+), 22 deletions(-)
+ create mode 100644 src/tokenpool-gnu-make.cc
+ create mode 100644 src/tokenpool-none.cc
+ create mode 100644 src/tokenpool.h
+
+diff --git a/configure.py b/configure.py
+index 588250a..d95fad8 100755
+--- a/configure.py
++++ b/configure.py
+@@ -543,6 +543,7 @@ for name in ['build',
+     objs += cxx(name, variables=cxxvariables)
+ if platform.is_windows():
+     for name in ['subprocess-win32',
++                 'tokenpool-none',
+                  'includes_normalize-win32',
+                  'msvc_helper-win32',
+                  'msvc_helper_main-win32']:
+@@ -552,6 +553,7 @@ if platform.is_windows():
+     objs += cc('getopt')
+ else:
+     objs += cxx('subprocess-posix')
++    objs += cxx('tokenpool-gnu-make')
+ if platform.is_aix():
+     objs += cc('getopt')
+ if platform.is_msvc():
+diff --git a/src/build.cc b/src/build.cc
+index 76ff93a..02ea93b 100644
+--- a/src/build.cc
++++ b/src/build.cc
+@@ -35,6 +35,7 @@
+ #include "state.h"
+ #include "status.h"
+ #include "subprocess.h"
++#include "tokenpool.h"
+ #include "util.h"
+ 
+ using namespace std;
+@@ -149,7 +150,7 @@ void Plan::EdgeWanted(const Edge* edge) {
+ }
+ 
+ Edge* Plan::FindWork() {
+-  if (ready_.empty())
++  if (!more_ready())
+     return NULL;
+   EdgeSet::iterator e = ready_.begin();
+   Edge* edge = *e;
+@@ -448,8 +449,8 @@ void Plan::Dump() const {
+ }
+ 
+ struct RealCommandRunner : public CommandRunner {
+-  explicit RealCommandRunner(const BuildConfig& config) : config_(config) {}
+-  virtual ~RealCommandRunner() {}
++  explicit RealCommandRunner(const BuildConfig& config);
++  virtual ~RealCommandRunner();
+   virtual bool CanRunMore() const;
+   virtual bool StartCommand(Edge* edge);
+   virtual bool WaitForCommand(Result* result);
+@@ -458,9 +459,18 @@ struct RealCommandRunner : public CommandRunner {
+ 
+   const BuildConfig& config_;
+   SubprocessSet subprocs_;
++  TokenPool *tokens_;
+   map<const Subprocess*, Edge*> subproc_to_edge_;
+ };
+ 
++RealCommandRunner::RealCommandRunner(const BuildConfig& config) : config_(config) {
++  tokens_ = TokenPool::Get();
++}
++
++RealCommandRunner::~RealCommandRunner() {
++  delete tokens_;
++}
++
+ vector<Edge*> RealCommandRunner::GetActiveEdges() {
+   vector<Edge*> edges;
+   for (map<const Subprocess*, Edge*>::iterator e = subproc_to_edge_.begin();
+@@ -471,14 +481,18 @@ vector<Edge*> RealCommandRunner::GetActiveEdges() {
+ 
+ void RealCommandRunner::Abort() {
+   subprocs_.Clear();
++  if (tokens_)
++    tokens_->Clear();
+ }
+ 
+ bool RealCommandRunner::CanRunMore() const {
+   size_t subproc_number =
+       subprocs_.running_.size() + subprocs_.finished_.size();
+   return (int)subproc_number < config_.parallelism
+-    && ((subprocs_.running_.empty() || config_.max_load_average <= 0.0f)
+-        || GetLoadAverage() < config_.max_load_average);
++    && (subprocs_.running_.empty() ||
++        ((config_.max_load_average <= 0.0f ||
++          GetLoadAverage() < config_.max_load_average)
++      && (!tokens_ || tokens_->Acquire())));
+ }
+ 
+ bool RealCommandRunner::StartCommand(Edge* edge) {
+@@ -486,6 +500,8 @@ bool RealCommandRunner::StartCommand(Edge* edge) {
+   Subprocess* subproc = subprocs_.Add(command, edge->use_console());
+   if (!subproc)
+     return false;
++  if (tokens_)
++    tokens_->Reserve();
+   subproc_to_edge_.insert(make_pair(subproc, edge));
+ 
+   return true;
+@@ -499,6 +515,9 @@ bool RealCommandRunner::WaitForCommand(Result* result) {
+       return false;
+   }
+ 
++  if (tokens_)
++    tokens_->Release();
++
+   result->status = subproc->Finish();
+   result->output = subproc->GetOutput();
+ 
+@@ -629,31 +648,31 @@ bool Builder::Build(string* err) {
+   // Second, we attempt to wait for / reap the next finished command.
+   while (plan_.more_to_do()) {
+     // See if we can start any more commands.
+-    if (failures_allowed && command_runner_->CanRunMore()) {
+-      if (Edge* edge = plan_.FindWork()) {
+-        if (edge->GetBindingBool("generator")) {
++    if (failures_allowed && plan_.more_ready() &&
++        command_runner_->CanRunMore()) {
++      Edge* edge = plan_.FindWork();
++      if (edge->GetBindingBool("generator")) {
+           scan_.build_log()->Close();
+         }
+ 
+-        if (!StartEdge(edge, err)) {
++      if (!StartEdge(edge, err)) {
++        Cleanup();
++        status_->BuildFinished();
++        return false;
++      }
++
++      if (edge->is_phony()) {
++        if (!plan_.EdgeFinished(edge, Plan::kEdgeSucceeded, err)) {
+           Cleanup();
+           status_->BuildFinished();
+           return false;
+         }
+-
+-        if (edge->is_phony()) {
+-          if (!plan_.EdgeFinished(edge, Plan::kEdgeSucceeded, err)) {
+-            Cleanup();
+-            status_->BuildFinished();
+-            return false;
+-          }
+-        } else {
+-          ++pending_commands;
+-        }
+-
+-        // We made some progress; go back to the main loop.
+-        continue;
++      } else {
++        ++pending_commands;
+       }
++
++      // We made some progress; go back to the main loop.
++      continue;
+     }
+ 
+     // See if we can reap any finished commands.
+diff --git a/src/build.h b/src/build.h
+index 8ec2355..09667aa 100644
+--- a/src/build.h
++++ b/src/build.h
+@@ -52,6 +52,9 @@ struct Plan {
+   /// Returns true if there's more work to be done.
+   bool more_to_do() const { return wanted_edges_ > 0 && command_edges_ > 0; }
+ 
++  /// Returns true if there's more edges ready to start
++  bool more_ready() const { return !ready_.empty(); }
++
+   /// Dumps the current state of the plan.
+   void Dump() const;
+ 
+diff --git a/src/tokenpool-gnu-make.cc b/src/tokenpool-gnu-make.cc
+new file mode 100644
+index 0000000..a8f9b71
+--- /dev/null
++++ b/src/tokenpool-gnu-make.cc
+@@ -0,0 +1,211 @@
++// Copyright 2016 Google Inc. All Rights Reserved.
++//
++// Licensed under the Apache License, Version 2.0 (the "License");
++// you may not use this file except in compliance with the License.
++// You may obtain a copy of the License at
++//
++//     http://www.apache.org/licenses/LICENSE-2.0
++//
++// Unless required by applicable law or agreed to in writing, software
++// distributed under the License is distributed on an "AS IS" BASIS,
++// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
++// See the License for the specific language governing permissions and
++// limitations under the License.
++
++#include "tokenpool.h"
++
++#include <errno.h>
++#include <fcntl.h>
++#include <poll.h>
++#include <unistd.h>
++#include <signal.h>
++#include <stdio.h>
++#include <string.h>
++#include <stdlib.h>
++
++// TokenPool implementation for GNU make jobserver
++// (http://make.mad-scientist.net/papers/jobserver-implementation/)
++struct GNUmakeTokenPool : public TokenPool {
++  GNUmakeTokenPool();
++  virtual ~GNUmakeTokenPool();
++
++  virtual bool Acquire();
++  virtual void Reserve();
++  virtual void Release();
++  virtual void Clear();
++
++  bool Setup();
++
++ private:
++  int available_;
++  int used_;
++
++#ifdef _WIN32
++  // @TODO
++#else
++  int rfd_;
++  int wfd_;
++
++  struct sigaction old_act_;
++  bool restore_;
++
++  static int dup_rfd_;
++  static void CloseDupRfd(int signum);
++
++  bool CheckFd(int fd);
++  bool SetAlarmHandler();
++#endif
++
++  void Return();
++};
++
++// every instance owns an implicit token -> available_ == 1
++GNUmakeTokenPool::GNUmakeTokenPool() : available_(1), used_(0),
++                                       rfd_(-1), wfd_(-1), restore_(false) {
++}
++
++GNUmakeTokenPool::~GNUmakeTokenPool() {
++  Clear();
++  if (restore_)
++    sigaction(SIGALRM, &old_act_, NULL);
++}
++
++bool GNUmakeTokenPool::CheckFd(int fd) {
++  if (fd < 0)
++    return false;
++  int ret = fcntl(fd, F_GETFD);
++  if (ret < 0)
++    return false;
++  return true;
++}
++
++int GNUmakeTokenPool::dup_rfd_ = -1;
++
++void GNUmakeTokenPool::CloseDupRfd(int signum) {
++  close(dup_rfd_);
++  dup_rfd_ = -1;
++}
++
++bool GNUmakeTokenPool::SetAlarmHandler() {
++  struct sigaction act;
++  memset(&act, 0, sizeof(act));
++  act.sa_handler = CloseDupRfd;
++  if (sigaction(SIGALRM, &act, &old_act_) < 0) {
++    perror("sigaction:");
++    return(false);
++  } else {
++    restore_ = true;
++    return(true);
++  }
++}
++
++bool GNUmakeTokenPool::Setup() {
++  const char *value = getenv("MAKEFLAGS");
++  if (value) {
++    // GNU make <= 4.1
++    const char *jobserver = strstr(value, "--jobserver-fds=");
++    // GNU make => 4.2
++    if (!jobserver)
++      jobserver = strstr(value, "--jobserver-auth=");
++    if (jobserver) {
++      int rfd = -1;
++      int wfd = -1;
++      if ((sscanf(jobserver, "%*[^=]=%d,%d", &rfd, &wfd) == 2) &&
++          CheckFd(rfd) &&
++          CheckFd(wfd) &&
++          SetAlarmHandler()) {
++        printf("ninja: using GNU make jobserver.\n");
++        rfd_ = rfd;
++        wfd_ = wfd;
++        return true;
++      }
++    }
++  }
++
++  return false;
++}
++
++bool GNUmakeTokenPool::Acquire() {
++  if (available_ > 0)
++    return true;
++
++#ifdef USE_PPOLL
++  pollfd pollfds[] = {{rfd_, POLLIN, 0}};
++  int ret = poll(pollfds, 1, 0);
++#else
++  fd_set set;
++  struct timeval timeout = { 0, 0 };
++  FD_ZERO(&set);
++  FD_SET(rfd_, &set);
++  int ret = select(rfd_ + 1, &set, NULL, NULL, &timeout);
++#endif
++  if (ret > 0) {
++    dup_rfd_ = dup(rfd_);
++
++    if (dup_rfd_ != -1) {
++      struct sigaction act, old_act;
++      int ret = 0;
++
++      memset(&act, 0, sizeof(act));
++      act.sa_handler = CloseDupRfd;
++      if (sigaction(SIGCHLD, &act, &old_act) == 0) {
++        char buf;
++
++        // block until token read, child exits or timeout
++        alarm(1);
++        ret = read(dup_rfd_, &buf, 1);
++        alarm(0);
++
++        sigaction(SIGCHLD, &old_act, NULL);
++      }
++
++      CloseDupRfd(0);
++
++      if (ret > 0) {
++        available_++;
++        return true;
++      }
++    }
++  }
++  return false;
++}
++
++void GNUmakeTokenPool::Reserve() {
++  available_--;
++  used_++;
++}
++
++void GNUmakeTokenPool::Return() {
++  const char buf = '+';
++  while (1) {
++    int ret = write(wfd_, &buf, 1);
++    if (ret > 0)
++      available_--;
++    if ((ret != -1) || (errno != EINTR))
++      return;
++    // write got interrupted - retry
++  }
++}
++
++void GNUmakeTokenPool::Release() {
++  available_++;
++  used_--;
++  if (available_ > 1)
++    Return();
++}
++
++void GNUmakeTokenPool::Clear() {
++  while (used_ > 0)
++    Release();
++  while (available_ > 1)
++    Return();
++}
++
++struct TokenPool *TokenPool::Get(void) {
++  GNUmakeTokenPool *tokenpool = new GNUmakeTokenPool;
++  if (tokenpool->Setup())
++    return tokenpool;
++  else
++    delete tokenpool;
++  return NULL;
++}
+diff --git a/src/tokenpool-none.cc b/src/tokenpool-none.cc
+new file mode 100644
+index 0000000..602b331
+--- /dev/null
++++ b/src/tokenpool-none.cc
+@@ -0,0 +1,27 @@
++// Copyright 2016 Google Inc. All Rights Reserved.
++//
++// Licensed under the Apache License, Version 2.0 (the "License");
++// you may not use this file except in compliance with the License.
++// You may obtain a copy of the License at
++//
++//     http://www.apache.org/licenses/LICENSE-2.0
++//
++// Unless required by applicable law or agreed to in writing, software
++// distributed under the License is distributed on an "AS IS" BASIS,
++// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
++// See the License for the specific language governing permissions and
++// limitations under the License.
++
++#include "tokenpool.h"
++
++#include <fcntl.h>
++#include <poll.h>
++#include <unistd.h>
++#include <stdio.h>
++#include <string.h>
++#include <stdlib.h>
++
++// No-op TokenPool implementation
++struct TokenPool *TokenPool::Get(void) {
++  return NULL;
++}
+diff --git a/src/tokenpool.h b/src/tokenpool.h
+new file mode 100644
+index 0000000..f560b10
+--- /dev/null
++++ b/src/tokenpool.h
+@@ -0,0 +1,26 @@
++// Copyright 2016 Google Inc. All Rights Reserved.
++//
++// Licensed under the Apache License, Version 2.0 (the "License");
++// you may not use this file except in compliance with the License.
++// You may obtain a copy of the License at
++//
++//     http://www.apache.org/licenses/LICENSE-2.0
++//
++// Unless required by applicable law or agreed to in writing, software
++// distributed under the License is distributed on an "AS IS" BASIS,
++// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
++// See the License for the specific language governing permissions and
++// limitations under the License.
++
++// interface to token pool
++struct TokenPool {
++  virtual ~TokenPool() {}
++
++  virtual bool Acquire() = 0;
++  virtual void Reserve() = 0;
++  virtual void Release() = 0;
++  virtual void Clear() = 0;
++
++  // returns NULL if token pool is not available
++  static struct TokenPool *Get(void);
++};
+-- 
+2.44.0
+
diff --git a/meta/recipes-devtools/ninja/files/0002-Add-TokenPool-monitoring-to-SubprocessSet-DoWork.patch b/meta/recipes-devtools/ninja/files/0002-Add-TokenPool-monitoring-to-SubprocessSet-DoWork.patch
new file mode 100644
index 0000000000..73c361211d
--- /dev/null
+++ b/meta/recipes-devtools/ninja/files/0002-Add-TokenPool-monitoring-to-SubprocessSet-DoWork.patch
@@ -0,0 +1,560 @@
+From 5c8dc535c2bfdfb1d8e1bc62fa34afe536e9533e Mon Sep 17 00:00:00 2001
+From: Stefan Becker <stefanb@gpartner-nvidia.com>
+Date: Fri, 27 May 2016 16:47:10 +0300
+Subject: [PATCH 02/20] Add TokenPool monitoring to SubprocessSet::DoWork()
+
+Improve on the original jobserver client implementation. This makes
+ninja a more aggressive GNU make jobserver client.
+
+- add monitor interface to TokenPool
+- TokenPool is passed down when main loop indicates that more work is
+  ready and would be allowed to start if a token becomes available
+- posix: update DoWork() to monitor TokenPool read file descriptor
+- WaitForCommand() exits when DoWork() sets token flag
+- Main loop starts over when WaitForCommand() sets token exit status
+
+Upstream-Status: Submitted [https://github.com/ninja-build/ninja/pull/1140]
+---
+ src/build.cc              | 53 +++++++++++++++++++++++++++++----------
+ src/build.h               |  3 ++-
+ src/build_test.cc         |  9 +++++--
+ src/exit_status.h         |  3 ++-
+ src/subprocess-posix.cc   | 33 ++++++++++++++++++++++--
+ src/subprocess-win32.cc   |  2 +-
+ src/subprocess.h          |  8 +++++-
+ src/subprocess_test.cc    | 47 +++++++++++++++++++++++-----------
+ src/tokenpool-gnu-make.cc |  5 ++++
+ src/tokenpool.h           |  6 +++++
+ 10 files changed, 134 insertions(+), 35 deletions(-)
+
+diff --git a/src/build.cc b/src/build.cc
+index 02ea93b..01a4b6b 100644
+--- a/src/build.cc
++++ b/src/build.cc
+@@ -48,8 +48,9 @@ struct DryRunCommandRunner : public CommandRunner {
+ 
+   // Overridden from CommandRunner:
+   virtual bool CanRunMore() const;
++  virtual bool AcquireToken();
+   virtual bool StartCommand(Edge* edge);
+-  virtual bool WaitForCommand(Result* result);
++  virtual bool WaitForCommand(Result* result, bool more_ready);
+ 
+  private:
+   queue<Edge*> finished_;
+@@ -59,12 +60,16 @@ bool DryRunCommandRunner::CanRunMore() const {
+   return true;
+ }
+ 
++bool DryRunCommandRunner::AcquireToken() {
++  return true;
++}
++
+ bool DryRunCommandRunner::StartCommand(Edge* edge) {
+   finished_.push(edge);
+   return true;
+ }
+ 
+-bool DryRunCommandRunner::WaitForCommand(Result* result) {
++bool DryRunCommandRunner::WaitForCommand(Result* result, bool more_ready) {
+    if (finished_.empty())
+      return false;
+ 
+@@ -452,8 +457,9 @@ struct RealCommandRunner : public CommandRunner {
+   explicit RealCommandRunner(const BuildConfig& config);
+   virtual ~RealCommandRunner();
+   virtual bool CanRunMore() const;
++  virtual bool AcquireToken();
+   virtual bool StartCommand(Edge* edge);
+-  virtual bool WaitForCommand(Result* result);
++  virtual bool WaitForCommand(Result* result, bool more_ready);
+   virtual vector<Edge*> GetActiveEdges();
+   virtual void Abort();
+ 
+@@ -490,9 +496,12 @@ bool RealCommandRunner::CanRunMore() const {
+       subprocs_.running_.size() + subprocs_.finished_.size();
+   return (int)subproc_number < config_.parallelism
+     && (subprocs_.running_.empty() ||
+-        ((config_.max_load_average <= 0.0f ||
+-          GetLoadAverage() < config_.max_load_average)
+-      && (!tokens_ || tokens_->Acquire())));
++        (config_.max_load_average <= 0.0f ||
++         GetLoadAverage() < config_.max_load_average));
++}
++
++bool RealCommandRunner::AcquireToken() {
++  return (!tokens_ || tokens_->Acquire());
+ }
+ 
+ bool RealCommandRunner::StartCommand(Edge* edge) {
+@@ -507,14 +516,23 @@ bool RealCommandRunner::StartCommand(Edge* edge) {
+   return true;
+ }
+ 
+-bool RealCommandRunner::WaitForCommand(Result* result) {
++bool RealCommandRunner::WaitForCommand(Result* result, bool more_ready) {
+   Subprocess* subproc;
+-  while ((subproc = subprocs_.NextFinished()) == NULL) {
+-    bool interrupted = subprocs_.DoWork();
++  subprocs_.ResetTokenAvailable();
++  while (((subproc = subprocs_.NextFinished()) == NULL) &&
++         !subprocs_.IsTokenAvailable()) {
++    bool interrupted = subprocs_.DoWork(more_ready ? tokens_ : NULL);
+     if (interrupted)
+       return false;
+   }
+ 
++  // token became available
++  if (subproc == NULL) {
++    result->status = ExitTokenAvailable;
++    return true;
++  }
++
++  // command completed
+   if (tokens_)
+     tokens_->Release();
+ 
+@@ -647,9 +665,14 @@ bool Builder::Build(string* err) {
+   // command runner.
+   // Second, we attempt to wait for / reap the next finished command.
+   while (plan_.more_to_do()) {
+-    // See if we can start any more commands.
+-    if (failures_allowed && plan_.more_ready() &&
+-        command_runner_->CanRunMore()) {
++    // See if we can start any more commands...
++    bool can_run_more =
++        failures_allowed   &&
++        plan_.more_ready() &&
++        command_runner_->CanRunMore();
++
++    // ... but we also need a token to do that.
++    if (can_run_more && command_runner_->AcquireToken()) {
+       Edge* edge = plan_.FindWork();
+       if (edge->GetBindingBool("generator")) {
+           scan_.build_log()->Close();
+@@ -678,7 +701,7 @@ bool Builder::Build(string* err) {
+     // See if we can reap any finished commands.
+     if (pending_commands) {
+       CommandRunner::Result result;
+-      if (!command_runner_->WaitForCommand(&result) ||
++      if (!command_runner_->WaitForCommand(&result, can_run_more) ||
+           result.status == ExitInterrupted) {
+         Cleanup();
+         status_->BuildFinished();
+@@ -686,6 +709,10 @@ bool Builder::Build(string* err) {
+         return false;
+       }
+ 
++      // We might be able to start another command; start the main loop over.
++      if (result.status == ExitTokenAvailable)
++        continue;
++
+       --pending_commands;
+       if (!FinishCommand(&result, err)) {
+         Cleanup();
+diff --git a/src/build.h b/src/build.h
+index 09667aa..50b4be3 100644
+--- a/src/build.h
++++ b/src/build.h
+@@ -139,6 +139,7 @@ private:
+ struct CommandRunner {
+   virtual ~CommandRunner() {}
+   virtual bool CanRunMore() const = 0;
++  virtual bool AcquireToken() = 0;
+   virtual bool StartCommand(Edge* edge) = 0;
+ 
+   /// The result of waiting for a command.
+@@ -150,7 +151,7 @@ struct CommandRunner {
+     bool success() const { return status == ExitSuccess; }
+   };
+   /// Wait for a command to complete, or return false if interrupted.
+-  virtual bool WaitForCommand(Result* result) = 0;
++  virtual bool WaitForCommand(Result* result, bool more_ready) = 0;
+ 
+   virtual std::vector<Edge*> GetActiveEdges() { return std::vector<Edge*>(); }
+   virtual void Abort() {}
+diff --git a/src/build_test.cc b/src/build_test.cc
+index 3908761..efa5662 100644
+--- a/src/build_test.cc
++++ b/src/build_test.cc
+@@ -474,8 +474,9 @@ struct FakeCommandRunner : public CommandRunner {
+ 
+   // CommandRunner impl
+   virtual bool CanRunMore() const;
++  virtual bool AcquireToken();
+   virtual bool StartCommand(Edge* edge);
+-  virtual bool WaitForCommand(Result* result);
++  virtual bool WaitForCommand(Result* result, bool more_ready);
+   virtual vector<Edge*> GetActiveEdges();
+   virtual void Abort();
+ 
+@@ -578,6 +579,10 @@ bool FakeCommandRunner::CanRunMore() const {
+   return active_edges_.size() < max_active_edges_;
+ }
+ 
++bool FakeCommandRunner::AcquireToken() {
++  return true;
++}
++
+ bool FakeCommandRunner::StartCommand(Edge* edge) {
+   assert(active_edges_.size() < max_active_edges_);
+   assert(find(active_edges_.begin(), active_edges_.end(), edge)
+@@ -669,7 +674,7 @@ bool FakeCommandRunner::StartCommand(Edge* edge) {
+   return true;
+ }
+ 
+-bool FakeCommandRunner::WaitForCommand(Result* result) {
++bool FakeCommandRunner::WaitForCommand(Result* result, bool more_ready) {
+   if (active_edges_.empty())
+     return false;
+ 
+diff --git a/src/exit_status.h b/src/exit_status.h
+index a714ece..75ebf6a 100644
+--- a/src/exit_status.h
++++ b/src/exit_status.h
+@@ -18,7 +18,8 @@
+ enum ExitStatus {
+   ExitSuccess,
+   ExitFailure,
+-  ExitInterrupted
++  ExitTokenAvailable,
++  ExitInterrupted,
+ };
+ 
+ #endif  // NINJA_EXIT_STATUS_H_
+diff --git a/src/subprocess-posix.cc b/src/subprocess-posix.cc
+index 8e78540..74451b0 100644
+--- a/src/subprocess-posix.cc
++++ b/src/subprocess-posix.cc
+@@ -13,6 +13,7 @@
+ // limitations under the License.
+ 
+ #include "subprocess.h"
++#include "tokenpool.h"
+ 
+ #include <sys/select.h>
+ #include <assert.h>
+@@ -249,7 +250,7 @@ Subprocess *SubprocessSet::Add(const string& command, bool use_console) {
+ }
+ 
+ #ifdef USE_PPOLL
+-bool SubprocessSet::DoWork() {
++bool SubprocessSet::DoWork(struct TokenPool* tokens) {
+   vector<pollfd> fds;
+   nfds_t nfds = 0;
+ 
+@@ -263,6 +264,12 @@ bool SubprocessSet::DoWork() {
+     ++nfds;
+   }
+ 
++  if (tokens) {
++    pollfd pfd = { tokens->GetMonitorFd(), POLLIN | POLLPRI, 0 };
++    fds.push_back(pfd);
++    ++nfds;
++  }
++
+   interrupted_ = 0;
+   int ret = ppoll(&fds.front(), nfds, NULL, &old_mask_);
+   if (ret == -1) {
+@@ -295,11 +302,20 @@ bool SubprocessSet::DoWork() {
+     ++i;
+   }
+ 
++  if (tokens) {
++    pollfd *pfd = &fds[nfds - 1];
++    if (pfd->fd >= 0) {
++      assert(pfd->fd == tokens->GetMonitorFd());
++      if (pfd->revents != 0)
++        token_available_ = true;
++    }
++  }
++
+   return IsInterrupted();
+ }
+ 
+ #else  // !defined(USE_PPOLL)
+-bool SubprocessSet::DoWork() {
++bool SubprocessSet::DoWork(struct TokenPool* tokens) {
+   fd_set set;
+   int nfds = 0;
+   FD_ZERO(&set);
+@@ -314,6 +330,13 @@ bool SubprocessSet::DoWork() {
+     }
+   }
+ 
++  if (tokens) {
++    int fd = tokens->GetMonitorFd();
++    FD_SET(fd, &set);
++    if (nfds < fd+1)
++      nfds = fd+1;
++  }
++
+   interrupted_ = 0;
+   int ret = pselect(nfds, &set, 0, 0, 0, &old_mask_);
+   if (ret == -1) {
+@@ -342,6 +365,12 @@ bool SubprocessSet::DoWork() {
+     ++i;
+   }
+ 
++  if (tokens) {
++    int fd = tokens->GetMonitorFd();
++    if ((fd >= 0) && FD_ISSET(fd, &set))
++    token_available_ = true;
++  }
++
+   return IsInterrupted();
+ }
+ #endif  // !defined(USE_PPOLL)
+diff --git a/src/subprocess-win32.cc b/src/subprocess-win32.cc
+index ff3baac..66d2c2c 100644
+--- a/src/subprocess-win32.cc
++++ b/src/subprocess-win32.cc
+@@ -251,7 +251,7 @@ Subprocess *SubprocessSet::Add(const string& command, bool use_console) {
+   return subprocess;
+ }
+ 
+-bool SubprocessSet::DoWork() {
++bool SubprocessSet::DoWork(struct TokenPool* tokens) {
+   DWORD bytes_read;
+   Subprocess* subproc;
+   OVERLAPPED* overlapped;
+diff --git a/src/subprocess.h b/src/subprocess.h
+index 9e3d2ee..9ea67ea 100644
+--- a/src/subprocess.h
++++ b/src/subprocess.h
+@@ -76,6 +76,8 @@ struct Subprocess {
+   friend struct SubprocessSet;
+ };
+ 
++struct TokenPool;
++
+ /// SubprocessSet runs a ppoll/pselect() loop around a set of Subprocesses.
+ /// DoWork() waits for any state change in subprocesses; finished_
+ /// is a queue of subprocesses as they finish.
+@@ -84,13 +86,17 @@ struct SubprocessSet {
+   ~SubprocessSet();
+ 
+   Subprocess* Add(const std::string& command, bool use_console = false);
+-  bool DoWork();
++  bool DoWork(struct TokenPool* tokens);
+   Subprocess* NextFinished();
+   void Clear();
+ 
+   std::vector<Subprocess*> running_;
+   std::queue<Subprocess*> finished_;
+ 
++  bool token_available_;
++  bool IsTokenAvailable() { return token_available_; }
++  void ResetTokenAvailable() { token_available_ = false; }
++
+ #ifdef _WIN32
+   static BOOL WINAPI NotifyInterrupted(DWORD dwCtrlType);
+   static HANDLE ioport_;
+diff --git a/src/subprocess_test.cc b/src/subprocess_test.cc
+index 073fe86..4bc8083 100644
+--- a/src/subprocess_test.cc
++++ b/src/subprocess_test.cc
+@@ -45,10 +45,12 @@ TEST_F(SubprocessTest, BadCommandStderr) {
+   Subprocess* subproc = subprocs_.Add("cmd /c ninja_no_such_command");
+   ASSERT_NE((Subprocess *) 0, subproc);
+ 
++  subprocs_.ResetTokenAvailable();
+   while (!subproc->Done()) {
+     // Pretend we discovered that stderr was ready for writing.
+-    subprocs_.DoWork();
++    subprocs_.DoWork(NULL);
+   }
++  ASSERT_EQ(false, subprocs_.IsTokenAvailable());
+ 
+   EXPECT_EQ(ExitFailure, subproc->Finish());
+   EXPECT_NE("", subproc->GetOutput());
+@@ -59,10 +61,12 @@ TEST_F(SubprocessTest, NoSuchCommand) {
+   Subprocess* subproc = subprocs_.Add("ninja_no_such_command");
+   ASSERT_NE((Subprocess *) 0, subproc);
+ 
++  subprocs_.ResetTokenAvailable();
+   while (!subproc->Done()) {
+     // Pretend we discovered that stderr was ready for writing.
+-    subprocs_.DoWork();
++    subprocs_.DoWork(NULL);
+   }
++  ASSERT_EQ(false, subprocs_.IsTokenAvailable());
+ 
+   EXPECT_EQ(ExitFailure, subproc->Finish());
+   EXPECT_NE("", subproc->GetOutput());
+@@ -78,9 +82,11 @@ TEST_F(SubprocessTest, InterruptChild) {
+   Subprocess* subproc = subprocs_.Add("kill -INT $$");
+   ASSERT_NE((Subprocess *) 0, subproc);
+ 
++  subprocs_.ResetTokenAvailable();
+   while (!subproc->Done()) {
+-    subprocs_.DoWork();
++    subprocs_.DoWork(NULL);
+   }
++  ASSERT_EQ(false, subprocs_.IsTokenAvailable());
+ 
+   EXPECT_EQ(ExitInterrupted, subproc->Finish());
+ }
+@@ -90,7 +96,7 @@ TEST_F(SubprocessTest, InterruptParent) {
+   ASSERT_NE((Subprocess *) 0, subproc);
+ 
+   while (!subproc->Done()) {
+-    bool interrupted = subprocs_.DoWork();
++    bool interrupted = subprocs_.DoWork(NULL);
+     if (interrupted)
+       return;
+   }
+@@ -102,9 +108,11 @@ TEST_F(SubprocessTest, InterruptChildWithSigTerm) {
+   Subprocess* subproc = subprocs_.Add("kill -TERM $$");
+   ASSERT_NE((Subprocess *) 0, subproc);
+ 
++  subprocs_.ResetTokenAvailable();
+   while (!subproc->Done()) {
+-    subprocs_.DoWork();
++    subprocs_.DoWork(NULL);
+   }
++  ASSERT_EQ(false, subprocs_.IsTokenAvailable());
+ 
+   EXPECT_EQ(ExitInterrupted, subproc->Finish());
+ }
+@@ -114,7 +122,7 @@ TEST_F(SubprocessTest, InterruptParentWithSigTerm) {
+   ASSERT_NE((Subprocess *) 0, subproc);
+ 
+   while (!subproc->Done()) {
+-    bool interrupted = subprocs_.DoWork();
++    bool interrupted = subprocs_.DoWork(NULL);
+     if (interrupted)
+       return;
+   }
+@@ -126,9 +134,11 @@ TEST_F(SubprocessTest, InterruptChildWithSigHup) {
+   Subprocess* subproc = subprocs_.Add("kill -HUP $$");
+   ASSERT_NE((Subprocess *) 0, subproc);
+ 
++  subprocs_.ResetTokenAvailable();
+   while (!subproc->Done()) {
+-    subprocs_.DoWork();
++    subprocs_.DoWork(NULL);
+   }
++  ASSERT_EQ(false, subprocs_.IsTokenAvailable());
+ 
+   EXPECT_EQ(ExitInterrupted, subproc->Finish());
+ }
+@@ -138,7 +148,7 @@ TEST_F(SubprocessTest, InterruptParentWithSigHup) {
+   ASSERT_NE((Subprocess *) 0, subproc);
+ 
+   while (!subproc->Done()) {
+-    bool interrupted = subprocs_.DoWork();
++    bool interrupted = subprocs_.DoWork(NULL);
+     if (interrupted)
+       return;
+   }
+@@ -153,9 +163,11 @@ TEST_F(SubprocessTest, Console) {
+         subprocs_.Add("test -t 0 -a -t 1 -a -t 2", /*use_console=*/true);
+     ASSERT_NE((Subprocess*)0, subproc);
+ 
++    subprocs_.ResetTokenAvailable();
+     while (!subproc->Done()) {
+-      subprocs_.DoWork();
++      subprocs_.DoWork(NULL);
+     }
++    ASSERT_EQ(false, subprocs_.IsTokenAvailable());
+ 
+     EXPECT_EQ(ExitSuccess, subproc->Finish());
+   }
+@@ -167,9 +179,11 @@ TEST_F(SubprocessTest, SetWithSingle) {
+   Subprocess* subproc = subprocs_.Add(kSimpleCommand);
+   ASSERT_NE((Subprocess *) 0, subproc);
+ 
++  subprocs_.ResetTokenAvailable();
+   while (!subproc->Done()) {
+-    subprocs_.DoWork();
++    subprocs_.DoWork(NULL);
+   }
++  ASSERT_EQ(false, subprocs_.IsTokenAvailable());
+   ASSERT_EQ(ExitSuccess, subproc->Finish());
+   ASSERT_NE("", subproc->GetOutput());
+ 
+@@ -200,12 +214,13 @@ TEST_F(SubprocessTest, SetWithMulti) {
+     ASSERT_EQ("", processes[i]->GetOutput());
+   }
+ 
++  subprocs_.ResetTokenAvailable();
+   while (!processes[0]->Done() || !processes[1]->Done() ||
+          !processes[2]->Done()) {
+     ASSERT_GT(subprocs_.running_.size(), 0u);
+-    subprocs_.DoWork();
++    subprocs_.DoWork(NULL);
+   }
+-
++  ASSERT_EQ(false, subprocs_.IsTokenAvailable());
+   ASSERT_EQ(0u, subprocs_.running_.size());
+   ASSERT_EQ(3u, subprocs_.finished_.size());
+ 
+@@ -237,8 +252,10 @@ TEST_F(SubprocessTest, SetWithLots) {
+     ASSERT_NE((Subprocess *) 0, subproc);
+     procs.push_back(subproc);
+   }
++  subprocs_.ResetTokenAvailable();
+   while (!subprocs_.running_.empty())
+-    subprocs_.DoWork();
++    subprocs_.DoWork(NULL);
++  ASSERT_EQ(false, subprocs_.IsTokenAvailable());
+   for (size_t i = 0; i < procs.size(); ++i) {
+     ASSERT_EQ(ExitSuccess, procs[i]->Finish());
+     ASSERT_NE("", procs[i]->GetOutput());
+@@ -254,9 +271,11 @@ TEST_F(SubprocessTest, SetWithLots) {
+ // that stdin is closed.
+ TEST_F(SubprocessTest, ReadStdin) {
+   Subprocess* subproc = subprocs_.Add("cat -");
++  subprocs_.ResetTokenAvailable();
+   while (!subproc->Done()) {
+-    subprocs_.DoWork();
++    subprocs_.DoWork(NULL);
+   }
++  ASSERT_EQ(false, subprocs_.IsTokenAvailable());
+   ASSERT_EQ(ExitSuccess, subproc->Finish());
+   ASSERT_EQ(1u, subprocs_.finished_.size());
+ }
+diff --git a/src/tokenpool-gnu-make.cc b/src/tokenpool-gnu-make.cc
+index a8f9b71..396bb7d 100644
+--- a/src/tokenpool-gnu-make.cc
++++ b/src/tokenpool-gnu-make.cc
+@@ -33,6 +33,7 @@ struct GNUmakeTokenPool : public TokenPool {
+   virtual void Reserve();
+   virtual void Release();
+   virtual void Clear();
++  virtual int GetMonitorFd();
+ 
+   bool Setup();
+ 
+@@ -201,6 +202,10 @@ void GNUmakeTokenPool::Clear() {
+     Return();
+ }
+ 
++int GNUmakeTokenPool::GetMonitorFd() {
++  return(rfd_);
++}
++
+ struct TokenPool *TokenPool::Get(void) {
+   GNUmakeTokenPool *tokenpool = new GNUmakeTokenPool;
+   if (tokenpool->Setup())
+diff --git a/src/tokenpool.h b/src/tokenpool.h
+index f560b10..301e199 100644
+--- a/src/tokenpool.h
++++ b/src/tokenpool.h
+@@ -21,6 +21,12 @@ struct TokenPool {
+   virtual void Release() = 0;
+   virtual void Clear() = 0;
+ 
++#ifdef _WIN32
++  // @TODO
++#else
++  virtual int GetMonitorFd() = 0;
++#endif
++
+   // returns NULL if token pool is not available
+   static struct TokenPool *Get(void);
+ };
+-- 
+2.44.0
+
diff --git a/meta/recipes-devtools/ninja/files/0003-Ignore-jobserver-when-jN-is-forced-on-command-line.patch b/meta/recipes-devtools/ninja/files/0003-Ignore-jobserver-when-jN-is-forced-on-command-line.patch
new file mode 100644
index 0000000000..d0c96350b4
--- /dev/null
+++ b/meta/recipes-devtools/ninja/files/0003-Ignore-jobserver-when-jN-is-forced-on-command-line.patch
@@ -0,0 +1,198 @@
+From a6eec5c72869947f27e13b967897e5a59f25badf Mon Sep 17 00:00:00 2001
+From: Stefan Becker <chemobejk@gmail.com>
+Date: Sun, 12 Nov 2017 16:58:55 +0200
+Subject: [PATCH 03/20] Ignore jobserver when -jN is forced on command line
+
+This emulates the behaviour of GNU make.
+
+- add parallelism_from_cmdline flag to build configuration
+- set the flag when -jN is given on command line
+- pass the flag to TokenPool::Get()
+- GNUmakeTokenPool::Setup()
+  * prints a warning when the flag is true and jobserver was detected
+  * returns false, i.e. jobserver will be ignored
+- ignore config.parallelism in CanRunMore() when we have a valid
+  TokenPool, because it gets always initialized to a default when not
+  given on the command line
+
+Upstream-Status: Submitted [https://github.com/ninja-build/ninja/pull/1140]
+---
+ src/build.cc              | 10 ++++++----
+ src/build.h               |  4 +++-
+ src/ninja.cc              |  1 +
+ src/tokenpool-gnu-make.cc | 34 +++++++++++++++++++---------------
+ src/tokenpool-none.cc     |  4 ++--
+ src/tokenpool.h           |  4 ++--
+ 6 files changed, 33 insertions(+), 24 deletions(-)
+
+diff --git a/src/build.cc b/src/build.cc
+index 01a4b6b..e35dafc 100644
+--- a/src/build.cc
++++ b/src/build.cc
+@@ -470,7 +470,7 @@ struct RealCommandRunner : public CommandRunner {
+ };
+ 
+ RealCommandRunner::RealCommandRunner(const BuildConfig& config) : config_(config) {
+-  tokens_ = TokenPool::Get();
++  tokens_ = TokenPool::Get(config_.parallelism_from_cmdline);
+ }
+ 
+ RealCommandRunner::~RealCommandRunner() {
+@@ -492,9 +492,11 @@ void RealCommandRunner::Abort() {
+ }
+ 
+ bool RealCommandRunner::CanRunMore() const {
+-  size_t subproc_number =
+-      subprocs_.running_.size() + subprocs_.finished_.size();
+-  return (int)subproc_number < config_.parallelism
++  bool parallelism_limit_not_reached =
++    tokens_ || // ignore config_.parallelism
++    ((int) (subprocs_.running_.size() +
++            subprocs_.finished_.size()) < config_.parallelism);
++  return parallelism_limit_not_reached
+     && (subprocs_.running_.empty() ||
+         (config_.max_load_average <= 0.0f ||
+          GetLoadAverage() < config_.max_load_average));
+diff --git a/src/build.h b/src/build.h
+index 50b4be3..111ada8 100644
+--- a/src/build.h
++++ b/src/build.h
+@@ -159,7 +159,8 @@ struct CommandRunner {
+ 
+ /// Options (e.g. verbosity, parallelism) passed to a build.
+ struct BuildConfig {
+-  BuildConfig() : verbosity(NORMAL), dry_run(false), parallelism(1),
++  BuildConfig() : verbosity(NORMAL), dry_run(false),
++                  parallelism(1), parallelism_from_cmdline(false),
+                   failures_allowed(1), max_load_average(-0.0f) {}
+ 
+   enum Verbosity {
+@@ -171,6 +172,7 @@ struct BuildConfig {
+   Verbosity verbosity;
+   bool dry_run;
+   int parallelism;
++  bool parallelism_from_cmdline;
+   int failures_allowed;
+   /// The maximum load average we must not exceed. A negative value
+   /// means that we do not have any limit.
+diff --git a/src/ninja.cc b/src/ninja.cc
+index 887d89f..74c1194 100644
+--- a/src/ninja.cc
++++ b/src/ninja.cc
+@@ -1448,6 +1448,7 @@ int ReadFlags(int* argc, char*** argv,
+         // We want to run N jobs in parallel. For N = 0, INT_MAX
+         // is close enough to infinite for most sane builds.
+         config->parallelism = value > 0 ? value : INT_MAX;
++        config->parallelism_from_cmdline = true;
+         deferGuessParallelism.needGuess = false;
+         break;
+       }
+diff --git a/src/tokenpool-gnu-make.cc b/src/tokenpool-gnu-make.cc
+index 396bb7d..af4be05 100644
+--- a/src/tokenpool-gnu-make.cc
++++ b/src/tokenpool-gnu-make.cc
+@@ -1,4 +1,4 @@
+-// Copyright 2016 Google Inc. All Rights Reserved.
++// Copyright 2016-2017 Google Inc. All Rights Reserved.
+ //
+ // Licensed under the Apache License, Version 2.0 (the "License");
+ // you may not use this file except in compliance with the License.
+@@ -35,7 +35,7 @@ struct GNUmakeTokenPool : public TokenPool {
+   virtual void Clear();
+   virtual int GetMonitorFd();
+ 
+-  bool Setup();
++  bool Setup(bool ignore);
+ 
+  private:
+   int available_;
+@@ -100,7 +100,7 @@ bool GNUmakeTokenPool::SetAlarmHandler() {
+   }
+ }
+ 
+-bool GNUmakeTokenPool::Setup() {
++bool GNUmakeTokenPool::Setup(bool ignore) {
+   const char *value = getenv("MAKEFLAGS");
+   if (value) {
+     // GNU make <= 4.1
+@@ -109,16 +109,20 @@ bool GNUmakeTokenPool::Setup() {
+     if (!jobserver)
+       jobserver = strstr(value, "--jobserver-auth=");
+     if (jobserver) {
+-      int rfd = -1;
+-      int wfd = -1;
+-      if ((sscanf(jobserver, "%*[^=]=%d,%d", &rfd, &wfd) == 2) &&
+-          CheckFd(rfd) &&
+-          CheckFd(wfd) &&
+-          SetAlarmHandler()) {
+-        printf("ninja: using GNU make jobserver.\n");
+-        rfd_ = rfd;
+-        wfd_ = wfd;
+-        return true;
++      if (ignore) {
++        printf("ninja: warning: -jN forced on command line; ignoring GNU make jobserver.\n");
++      } else {
++        int rfd = -1;
++        int wfd = -1;
++        if ((sscanf(jobserver, "%*[^=]=%d,%d", &rfd, &wfd) == 2) &&
++            CheckFd(rfd) &&
++            CheckFd(wfd) &&
++            SetAlarmHandler()) {
++          printf("ninja: using GNU make jobserver.\n");
++          rfd_ = rfd;
++          wfd_ = wfd;
++          return true;
++        }
+       }
+     }
+   }
+@@ -206,9 +210,9 @@ int GNUmakeTokenPool::GetMonitorFd() {
+   return(rfd_);
+ }
+ 
+-struct TokenPool *TokenPool::Get(void) {
++struct TokenPool *TokenPool::Get(bool ignore) {
+   GNUmakeTokenPool *tokenpool = new GNUmakeTokenPool;
+-  if (tokenpool->Setup())
++  if (tokenpool->Setup(ignore))
+     return tokenpool;
+   else
+     delete tokenpool;
+diff --git a/src/tokenpool-none.cc b/src/tokenpool-none.cc
+index 602b331..199b222 100644
+--- a/src/tokenpool-none.cc
++++ b/src/tokenpool-none.cc
+@@ -1,4 +1,4 @@
+-// Copyright 2016 Google Inc. All Rights Reserved.
++// Copyright 2016-2017 Google Inc. All Rights Reserved.
+ //
+ // Licensed under the Apache License, Version 2.0 (the "License");
+ // you may not use this file except in compliance with the License.
+@@ -22,6 +22,6 @@
+ #include <stdlib.h>
+ 
+ // No-op TokenPool implementation
+-struct TokenPool *TokenPool::Get(void) {
++struct TokenPool *TokenPool::Get(bool ignore) {
+   return NULL;
+ }
+diff --git a/src/tokenpool.h b/src/tokenpool.h
+index 301e199..878a093 100644
+--- a/src/tokenpool.h
++++ b/src/tokenpool.h
+@@ -1,4 +1,4 @@
+-// Copyright 2016 Google Inc. All Rights Reserved.
++// Copyright 2016-2017 Google Inc. All Rights Reserved.
+ //
+ // Licensed under the Apache License, Version 2.0 (the "License");
+ // you may not use this file except in compliance with the License.
+@@ -28,5 +28,5 @@ struct TokenPool {
+ #endif
+ 
+   // returns NULL if token pool is not available
+-  static struct TokenPool *Get(void);
++  static struct TokenPool *Get(bool ignore);
+ };
+-- 
+2.44.0
+
diff --git a/meta/recipes-devtools/ninja/files/0004-Honor-lN-from-MAKEFLAGS.patch b/meta/recipes-devtools/ninja/files/0004-Honor-lN-from-MAKEFLAGS.patch
new file mode 100644
index 0000000000..5e4328bc6c
--- /dev/null
+++ b/meta/recipes-devtools/ninja/files/0004-Honor-lN-from-MAKEFLAGS.patch
@@ -0,0 +1,134 @@
+From 3d15060e6b025c5002b56539d59481dcdde696c3 Mon Sep 17 00:00:00 2001
+From: Stefan Becker <chemobejk@gmail.com>
+Date: Sun, 12 Nov 2017 18:04:12 +0200
+Subject: [PATCH 04/20] Honor -lN from MAKEFLAGS
+
+This emulates the behaviour of GNU make.
+
+- build: make a copy of max_load_average and pass it to TokenPool.
+- GNUmakeTokenPool: if we detect a jobserver and a valid -lN argument in
+  MAKEFLAGS then set max_load_average to N.
+
+Upstream-Status: Submitted [https://github.com/ninja-build/ninja/pull/1140]
+---
+ src/build.cc              | 10 +++++++---
+ src/tokenpool-gnu-make.cc | 19 +++++++++++++++----
+ src/tokenpool-none.cc     |  2 +-
+ src/tokenpool.h           |  2 +-
+ 4 files changed, 24 insertions(+), 9 deletions(-)
+
+diff --git a/src/build.cc b/src/build.cc
+index e35dafc..042971e 100644
+--- a/src/build.cc
++++ b/src/build.cc
+@@ -464,13 +464,17 @@ struct RealCommandRunner : public CommandRunner {
+   virtual void Abort();
+ 
+   const BuildConfig& config_;
++  // copy of config_.max_load_average; can be modified by TokenPool setup
++  double max_load_average_;
+   SubprocessSet subprocs_;
+   TokenPool *tokens_;
+   map<const Subprocess*, Edge*> subproc_to_edge_;
+ };
+ 
+ RealCommandRunner::RealCommandRunner(const BuildConfig& config) : config_(config) {
+-  tokens_ = TokenPool::Get(config_.parallelism_from_cmdline);
++  max_load_average_ = config.max_load_average;
++  tokens_ = TokenPool::Get(config_.parallelism_from_cmdline,
++                           max_load_average_);
+ }
+ 
+ RealCommandRunner::~RealCommandRunner() {
+@@ -498,8 +502,8 @@ bool RealCommandRunner::CanRunMore() const {
+             subprocs_.finished_.size()) < config_.parallelism);
+   return parallelism_limit_not_reached
+     && (subprocs_.running_.empty() ||
+-        (config_.max_load_average <= 0.0f ||
+-         GetLoadAverage() < config_.max_load_average));
++        (max_load_average_ <= 0.0f ||
++         GetLoadAverage() < max_load_average_));
+ }
+ 
+ bool RealCommandRunner::AcquireToken() {
+diff --git a/src/tokenpool-gnu-make.cc b/src/tokenpool-gnu-make.cc
+index af4be05..fb654c4 100644
+--- a/src/tokenpool-gnu-make.cc
++++ b/src/tokenpool-gnu-make.cc
+@@ -35,7 +35,7 @@ struct GNUmakeTokenPool : public TokenPool {
+   virtual void Clear();
+   virtual int GetMonitorFd();
+ 
+-  bool Setup(bool ignore);
++  bool Setup(bool ignore, double& max_load_average);
+ 
+  private:
+   int available_;
+@@ -100,7 +100,7 @@ bool GNUmakeTokenPool::SetAlarmHandler() {
+   }
+ }
+ 
+-bool GNUmakeTokenPool::Setup(bool ignore) {
++bool GNUmakeTokenPool::Setup(bool ignore, double& max_load_average) {
+   const char *value = getenv("MAKEFLAGS");
+   if (value) {
+     // GNU make <= 4.1
+@@ -118,9 +118,20 @@ bool GNUmakeTokenPool::Setup(bool ignore) {
+             CheckFd(rfd) &&
+             CheckFd(wfd) &&
+             SetAlarmHandler()) {
++          const char *l_arg = strstr(value, " -l");
++          int load_limit = -1;
++
+           printf("ninja: using GNU make jobserver.\n");
+           rfd_ = rfd;
+           wfd_ = wfd;
++
++          // translate GNU make -lN to ninja -lN
++          if (l_arg &&
++              (sscanf(l_arg + 3, "%d ", &load_limit) == 1) &&
++              (load_limit > 0)) {
++            max_load_average = load_limit;
++          }
++
+           return true;
+         }
+       }
+@@ -210,9 +221,9 @@ int GNUmakeTokenPool::GetMonitorFd() {
+   return(rfd_);
+ }
+ 
+-struct TokenPool *TokenPool::Get(bool ignore) {
++struct TokenPool *TokenPool::Get(bool ignore, double& max_load_average) {
+   GNUmakeTokenPool *tokenpool = new GNUmakeTokenPool;
+-  if (tokenpool->Setup(ignore))
++  if (tokenpool->Setup(ignore, max_load_average))
+     return tokenpool;
+   else
+     delete tokenpool;
+diff --git a/src/tokenpool-none.cc b/src/tokenpool-none.cc
+index 199b222..e8e2542 100644
+--- a/src/tokenpool-none.cc
++++ b/src/tokenpool-none.cc
+@@ -22,6 +22,6 @@
+ #include <stdlib.h>
+ 
+ // No-op TokenPool implementation
+-struct TokenPool *TokenPool::Get(bool ignore) {
++struct TokenPool *TokenPool::Get(bool ignore, double& max_load_average) {
+   return NULL;
+ }
+diff --git a/src/tokenpool.h b/src/tokenpool.h
+index 878a093..f9e8cc2 100644
+--- a/src/tokenpool.h
++++ b/src/tokenpool.h
+@@ -28,5 +28,5 @@ struct TokenPool {
+ #endif
+ 
+   // returns NULL if token pool is not available
+-  static struct TokenPool *Get(bool ignore);
++  static struct TokenPool *Get(bool ignore, double& max_load_average);
+ };
+-- 
+2.44.0
+
diff --git a/meta/recipes-devtools/ninja/files/0005-Use-LinePrinter-for-TokenPool-messages.patch b/meta/recipes-devtools/ninja/files/0005-Use-LinePrinter-for-TokenPool-messages.patch
new file mode 100644
index 0000000000..190e98a165
--- /dev/null
+++ b/meta/recipes-devtools/ninja/files/0005-Use-LinePrinter-for-TokenPool-messages.patch
@@ -0,0 +1,128 @@
+From 1157e43c5172588792d519fc6a64043358161717 Mon Sep 17 00:00:00 2001
+From: Stefan Becker <chemobejk@gmail.com>
+Date: Wed, 6 Dec 2017 22:14:21 +0200
+Subject: [PATCH 05/20] Use LinePrinter for TokenPool messages
+
+- replace printf() with calls to LinePrinter
+- print GNU make jobserver message only when verbose build is requested
+
+Upstream-Status: Submitted [https://github.com/ninja-build/ninja/pull/1140]
+---
+ src/build.cc              |  1 +
+ src/tokenpool-gnu-make.cc | 22 ++++++++++++++++------
+ src/tokenpool-none.cc     |  4 +++-
+ src/tokenpool.h           |  4 +++-
+ 4 files changed, 23 insertions(+), 8 deletions(-)
+
+diff --git a/src/build.cc b/src/build.cc
+index 042971e..da1faa8 100644
+--- a/src/build.cc
++++ b/src/build.cc
+@@ -474,6 +474,7 @@ struct RealCommandRunner : public CommandRunner {
+ RealCommandRunner::RealCommandRunner(const BuildConfig& config) : config_(config) {
+   max_load_average_ = config.max_load_average;
+   tokens_ = TokenPool::Get(config_.parallelism_from_cmdline,
++                           config_.verbosity == BuildConfig::VERBOSE,
+                            max_load_average_);
+ }
+ 
+diff --git a/src/tokenpool-gnu-make.cc b/src/tokenpool-gnu-make.cc
+index fb654c4..b0d3e6e 100644
+--- a/src/tokenpool-gnu-make.cc
++++ b/src/tokenpool-gnu-make.cc
+@@ -23,6 +23,8 @@
+ #include <string.h>
+ #include <stdlib.h>
+ 
++#include "line_printer.h"
++
+ // TokenPool implementation for GNU make jobserver
+ // (http://make.mad-scientist.net/papers/jobserver-implementation/)
+ struct GNUmakeTokenPool : public TokenPool {
+@@ -35,7 +37,7 @@ struct GNUmakeTokenPool : public TokenPool {
+   virtual void Clear();
+   virtual int GetMonitorFd();
+ 
+-  bool Setup(bool ignore, double& max_load_average);
++  bool Setup(bool ignore, bool verbose, double& max_load_average);
+ 
+  private:
+   int available_;
+@@ -100,7 +102,9 @@ bool GNUmakeTokenPool::SetAlarmHandler() {
+   }
+ }
+ 
+-bool GNUmakeTokenPool::Setup(bool ignore, double& max_load_average) {
++bool GNUmakeTokenPool::Setup(bool ignore,
++                             bool verbose,
++                             double& max_load_average) {
+   const char *value = getenv("MAKEFLAGS");
+   if (value) {
+     // GNU make <= 4.1
+@@ -109,8 +113,10 @@ bool GNUmakeTokenPool::Setup(bool ignore, double& max_load_average) {
+     if (!jobserver)
+       jobserver = strstr(value, "--jobserver-auth=");
+     if (jobserver) {
++      LinePrinter printer;
++
+       if (ignore) {
+-        printf("ninja: warning: -jN forced on command line; ignoring GNU make jobserver.\n");
++        printer.PrintOnNewLine("ninja: warning: -jN forced on command line; ignoring GNU make jobserver.\n");
+       } else {
+         int rfd = -1;
+         int wfd = -1;
+@@ -121,7 +127,9 @@ bool GNUmakeTokenPool::Setup(bool ignore, double& max_load_average) {
+           const char *l_arg = strstr(value, " -l");
+           int load_limit = -1;
+ 
+-          printf("ninja: using GNU make jobserver.\n");
++          if (verbose) {
++            printer.PrintOnNewLine("ninja: using GNU make jobserver.\n");
++          }
+           rfd_ = rfd;
+           wfd_ = wfd;
+ 
+@@ -221,9 +229,11 @@ int GNUmakeTokenPool::GetMonitorFd() {
+   return(rfd_);
+ }
+ 
+-struct TokenPool *TokenPool::Get(bool ignore, double& max_load_average) {
++struct TokenPool *TokenPool::Get(bool ignore,
++                                 bool verbose,
++                                 double& max_load_average) {
+   GNUmakeTokenPool *tokenpool = new GNUmakeTokenPool;
+-  if (tokenpool->Setup(ignore, max_load_average))
++  if (tokenpool->Setup(ignore, verbose, max_load_average))
+     return tokenpool;
+   else
+     delete tokenpool;
+diff --git a/src/tokenpool-none.cc b/src/tokenpool-none.cc
+index e8e2542..1c1c499 100644
+--- a/src/tokenpool-none.cc
++++ b/src/tokenpool-none.cc
+@@ -22,6 +22,8 @@
+ #include <stdlib.h>
+ 
+ // No-op TokenPool implementation
+-struct TokenPool *TokenPool::Get(bool ignore, double& max_load_average) {
++struct TokenPool *TokenPool::Get(bool ignore,
++                                 bool verbose,
++                                 double& max_load_average) {
+   return NULL;
+ }
+diff --git a/src/tokenpool.h b/src/tokenpool.h
+index f9e8cc2..4bf477f 100644
+--- a/src/tokenpool.h
++++ b/src/tokenpool.h
+@@ -28,5 +28,7 @@ struct TokenPool {
+ #endif
+ 
+   // returns NULL if token pool is not available
+-  static struct TokenPool *Get(bool ignore, double& max_load_average);
++  static struct TokenPool *Get(bool ignore,
++                               bool verbose,
++                               double& max_load_average);
+ };
+-- 
+2.44.0
+
diff --git a/meta/recipes-devtools/ninja/files/0006-Prepare-PR-for-merging.patch b/meta/recipes-devtools/ninja/files/0006-Prepare-PR-for-merging.patch
new file mode 100644
index 0000000000..60890d29f0
--- /dev/null
+++ b/meta/recipes-devtools/ninja/files/0006-Prepare-PR-for-merging.patch
@@ -0,0 +1,156 @@
+From 610086315e8ba8b819a0c38f84412fcc20debc34 Mon Sep 17 00:00:00 2001
+From: Stefan Becker <chemobejk@gmail.com>
+Date: Sat, 7 Apr 2018 17:11:21 +0300
+Subject: [PATCH 06/20] Prepare PR for merging
+
+- fix Windows build error in no-op TokenPool implementation
+- improve Acquire() to block for a maximum of 100ms
+- address review comments
+
+Upstream-Status: Submitted [https://github.com/ninja-build/ninja/pull/1140]
+---
+ src/build.h               |  2 ++
+ src/tokenpool-gnu-make.cc | 51 ++++++++++++++++++++++++++++++++++-----
+ src/tokenpool-none.cc     |  7 +-----
+ 3 files changed, 48 insertions(+), 12 deletions(-)
+
+diff --git a/src/build.h b/src/build.h
+index 111ada8..c12a085 100644
+--- a/src/build.h
++++ b/src/build.h
+@@ -151,6 +151,8 @@ struct CommandRunner {
+     bool success() const { return status == ExitSuccess; }
+   };
+   /// Wait for a command to complete, or return false if interrupted.
++  /// If more_ready is true then the optional TokenPool is monitored too
++  /// and we return when a token becomes available.
+   virtual bool WaitForCommand(Result* result, bool more_ready) = 0;
+ 
+   virtual std::vector<Edge*> GetActiveEdges() { return std::vector<Edge*>(); }
+diff --git a/src/tokenpool-gnu-make.cc b/src/tokenpool-gnu-make.cc
+index b0d3e6e..4132bb0 100644
+--- a/src/tokenpool-gnu-make.cc
++++ b/src/tokenpool-gnu-make.cc
+@@ -1,4 +1,4 @@
+-// Copyright 2016-2017 Google Inc. All Rights Reserved.
++// Copyright 2016-2018 Google Inc. All Rights Reserved.
+ //
+ // Licensed under the Apache License, Version 2.0 (the "License");
+ // you may not use this file except in compliance with the License.
+@@ -19,6 +19,7 @@
+ #include <poll.h>
+ #include <unistd.h>
+ #include <signal.h>
++#include <sys/time.h>
+ #include <stdio.h>
+ #include <string.h>
+ #include <stdlib.h>
+@@ -153,6 +154,15 @@ bool GNUmakeTokenPool::Acquire() {
+   if (available_ > 0)
+     return true;
+ 
++  // Please read
++  //
++  //   http://make.mad-scientist.net/papers/jobserver-implementation/
++  //
++  // for the reasoning behind the following code.
++  //
++  // Try to read one character from the pipe. Returns true on success.
++  //
++  // First check if read() would succeed without blocking.
+ #ifdef USE_PPOLL
+   pollfd pollfds[] = {{rfd_, POLLIN, 0}};
+   int ret = poll(pollfds, 1, 0);
+@@ -164,33 +174,62 @@ bool GNUmakeTokenPool::Acquire() {
+   int ret = select(rfd_ + 1, &set, NULL, NULL, &timeout);
+ #endif
+   if (ret > 0) {
++    // Handle potential race condition:
++    //  - the above check succeeded, i.e. read() should not block
++    //  - the character disappears before we call read()
++    //
++    // Create a duplicate of rfd_. The duplicate file descriptor dup_rfd_
++    // can safely be closed by signal handlers without affecting rfd_.
+     dup_rfd_ = dup(rfd_);
+ 
+     if (dup_rfd_ != -1) {
+       struct sigaction act, old_act;
+       int ret = 0;
+ 
++      // Temporarily replace SIGCHLD handler with our own
+       memset(&act, 0, sizeof(act));
+       act.sa_handler = CloseDupRfd;
+       if (sigaction(SIGCHLD, &act, &old_act) == 0) {
+-        char buf;
++        struct itimerval timeout;
+ 
+-        // block until token read, child exits or timeout
+-        alarm(1);
+-        ret = read(dup_rfd_, &buf, 1);
+-        alarm(0);
++        // install a 100ms timeout that generates SIGALARM on expiration
++        memset(&timeout, 0, sizeof(timeout));
++        timeout.it_value.tv_usec = 100 * 1000; // [ms] -> [usec]
++        if (setitimer(ITIMER_REAL, &timeout, NULL) == 0) {
++          char buf;
++
++          // Now try to read() from dup_rfd_. Return values from read():
++          //
++          // 1. token read                               ->  1
++          // 2. pipe closed                              ->  0
++          // 3. alarm expires                            -> -1 (EINTR)
++          // 4. child exits                              -> -1 (EINTR)
++          // 5. alarm expired before entering read()     -> -1 (EBADF)
++          // 6. child exited before entering read()      -> -1 (EBADF)
++          // 7. child exited before handler is installed -> go to 1 - 3
++          ret = read(dup_rfd_, &buf, 1);
++
++          // disarm timer
++          memset(&timeout, 0, sizeof(timeout));
++          setitimer(ITIMER_REAL, &timeout, NULL);
++        }
+ 
+         sigaction(SIGCHLD, &old_act, NULL);
+       }
+ 
+       CloseDupRfd(0);
+ 
++      // Case 1 from above list
+       if (ret > 0) {
+         available_++;
+         return true;
+       }
+     }
+   }
++
++  // read() would block, i.e. no token available,
++  // cases 2-6 from above list or
++  // select() / poll() / dup() / sigaction() / setitimer() failed
+   return false;
+ }
+ 
+diff --git a/src/tokenpool-none.cc b/src/tokenpool-none.cc
+index 1c1c499..4c59287 100644
+--- a/src/tokenpool-none.cc
++++ b/src/tokenpool-none.cc
+@@ -1,4 +1,4 @@
+-// Copyright 2016-2017 Google Inc. All Rights Reserved.
++// Copyright 2016-2018 Google Inc. All Rights Reserved.
+ //
+ // Licensed under the Apache License, Version 2.0 (the "License");
+ // you may not use this file except in compliance with the License.
+@@ -14,11 +14,6 @@
+ 
+ #include "tokenpool.h"
+ 
+-#include <fcntl.h>
+-#include <poll.h>
+-#include <unistd.h>
+-#include <stdio.h>
+-#include <string.h>
+ #include <stdlib.h>
+ 
+ // No-op TokenPool implementation
+-- 
+2.44.0
+
diff --git a/meta/recipes-devtools/ninja/files/0007-Add-tests-for-TokenPool.patch b/meta/recipes-devtools/ninja/files/0007-Add-tests-for-TokenPool.patch
new file mode 100644
index 0000000000..e716dac9c3
--- /dev/null
+++ b/meta/recipes-devtools/ninja/files/0007-Add-tests-for-TokenPool.patch
@@ -0,0 +1,237 @@
+From 008bc6ed9213406a24b366d69f560c625369da0f Mon Sep 17 00:00:00 2001
+From: Stefan Becker <chemobejk@gmail.com>
+Date: Fri, 25 May 2018 00:17:07 +0300
+Subject: [PATCH 07/20] Add tests for TokenPool
+
+- TokenPool setup
+- GetMonitorFd() API
+- implicit token and tokens in jobserver pipe
+- Acquire() / Reserve() / Release() protocol
+- Clear() API
+
+Upstream-Status: Submitted [https://github.com/ninja-build/ninja/pull/1140]
+---
+ configure.py          |   1 +
+ src/tokenpool_test.cc | 198 ++++++++++++++++++++++++++++++++++++++++++
+ 2 files changed, 199 insertions(+)
+ create mode 100644 src/tokenpool_test.cc
+
+diff --git a/configure.py b/configure.py
+index d95fad8..41f9428 100755
+--- a/configure.py
++++ b/configure.py
+@@ -611,6 +611,7 @@ for name in ['build_log_test',
+              'string_piece_util_test',
+              'subprocess_test',
+              'test',
++             'tokenpool_test',
+              'util_test']:
+     objs += cxx(name, variables=cxxvariables)
+ if platform.is_windows():
+diff --git a/src/tokenpool_test.cc b/src/tokenpool_test.cc
+new file mode 100644
+index 0000000..6c89064
+--- /dev/null
++++ b/src/tokenpool_test.cc
+@@ -0,0 +1,198 @@
++// Copyright 2018 Google Inc. All Rights Reserved.
++//
++// Licensed under the Apache License, Version 2.0 (the "License");
++// you may not use this file except in compliance with the License.
++// You may obtain a copy of the License at
++//
++//     http://www.apache.org/licenses/LICENSE-2.0
++//
++// Unless required by applicable law or agreed to in writing, software
++// distributed under the License is distributed on an "AS IS" BASIS,
++// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
++// See the License for the specific language governing permissions and
++// limitations under the License.
++
++#include "tokenpool.h"
++
++#include "test.h"
++
++#ifndef _WIN32
++#include <stdio.h>
++#include <stdlib.h>
++#include <unistd.h>
++
++#define ENVIRONMENT_CLEAR() unsetenv("MAKEFLAGS")
++#define ENVIRONMENT_INIT(v) setenv("MAKEFLAGS", v, true);
++#endif
++
++namespace {
++
++const double kLoadAverageDefault = -1.23456789;
++
++struct TokenPoolTest : public testing::Test {
++  double load_avg_;
++  TokenPool *tokens_;
++#ifndef _WIN32
++  char buf_[1024];
++  int fds_[2];
++#endif
++
++  virtual void SetUp() {
++    load_avg_ = kLoadAverageDefault;
++    tokens_ = NULL;
++#ifndef _WIN32
++    ENVIRONMENT_CLEAR();
++    if (pipe(fds_) < 0)
++      ASSERT_TRUE(false);
++#endif
++  }
++
++  void CreatePool(const char *format, bool ignore_jobserver) {
++#ifndef _WIN32
++    if (format) {
++      sprintf(buf_, format, fds_[0], fds_[1]);
++      ENVIRONMENT_INIT(buf_);
++    }
++#endif
++    tokens_ = TokenPool::Get(ignore_jobserver, false, load_avg_);
++  }
++
++  void CreateDefaultPool() {
++    CreatePool("foo --jobserver-auth=%d,%d bar", false);
++  }
++
++  virtual void TearDown() {
++    if (tokens_)
++      delete tokens_;
++#ifndef _WIN32
++    close(fds_[0]);
++    close(fds_[1]);
++    ENVIRONMENT_CLEAR();
++#endif
++  }
++};
++
++} // anonymous namespace
++
++// verifies none implementation
++TEST_F(TokenPoolTest, NoTokenPool) {
++  CreatePool(NULL, false);
++
++  EXPECT_EQ(NULL, tokens_);
++  EXPECT_EQ(kLoadAverageDefault, load_avg_);
++}
++
++#ifndef _WIN32
++TEST_F(TokenPoolTest, SuccessfulOldSetup) {
++  // GNUmake <= 4.1
++  CreatePool("foo --jobserver-fds=%d,%d bar", false);
++
++  EXPECT_NE(NULL, tokens_);
++  EXPECT_EQ(kLoadAverageDefault, load_avg_);
++}
++
++TEST_F(TokenPoolTest, SuccessfulNewSetup) {
++  // GNUmake => 4.2
++  CreateDefaultPool();
++
++  EXPECT_NE(NULL, tokens_);
++  EXPECT_EQ(kLoadAverageDefault, load_avg_);
++}
++
++TEST_F(TokenPoolTest, IgnoreWithJN) {
++  CreatePool("foo --jobserver-auth=%d,%d bar", true);
++
++  EXPECT_EQ(NULL, tokens_);
++  EXPECT_EQ(kLoadAverageDefault, load_avg_);
++}
++
++TEST_F(TokenPoolTest, HonorLN) {
++  CreatePool("foo -l9 --jobserver-auth=%d,%d bar", false);
++
++  EXPECT_NE(NULL, tokens_);
++  EXPECT_EQ(9.0, load_avg_);
++}
++
++TEST_F(TokenPoolTest, MonitorFD) {
++  CreateDefaultPool();
++
++  ASSERT_NE(NULL, tokens_);
++  EXPECT_EQ(kLoadAverageDefault, load_avg_);
++
++  EXPECT_EQ(fds_[0], tokens_->GetMonitorFd());
++}
++
++TEST_F(TokenPoolTest, ImplicitToken) {
++  CreateDefaultPool();
++
++  ASSERT_NE(NULL, tokens_);
++  EXPECT_EQ(kLoadAverageDefault, load_avg_);
++
++  EXPECT_TRUE(tokens_->Acquire());
++  tokens_->Reserve();
++  EXPECT_FALSE(tokens_->Acquire());
++  tokens_->Release();
++  EXPECT_TRUE(tokens_->Acquire());
++}
++
++TEST_F(TokenPoolTest, TwoTokens) {
++  CreateDefaultPool();
++
++  ASSERT_NE(NULL, tokens_);
++  EXPECT_EQ(kLoadAverageDefault, load_avg_);
++
++  // implicit token
++  EXPECT_TRUE(tokens_->Acquire());
++  tokens_->Reserve();
++  EXPECT_FALSE(tokens_->Acquire());
++
++  // jobserver offers 2nd token
++  ASSERT_EQ(1u, write(fds_[1], "T", 1));
++  EXPECT_TRUE(tokens_->Acquire());
++  tokens_->Reserve();
++  EXPECT_FALSE(tokens_->Acquire());
++
++  // release 2nd token
++  tokens_->Release();
++  EXPECT_TRUE(tokens_->Acquire());
++
++  // release implict token - must return 2nd token back to jobserver
++  tokens_->Release();
++  EXPECT_TRUE(tokens_->Acquire());
++
++  // there must be one token in the pipe
++  EXPECT_EQ(1u, read(fds_[0], buf_, sizeof(buf_)));
++
++  // implicit token
++  EXPECT_TRUE(tokens_->Acquire());
++}
++
++TEST_F(TokenPoolTest, Clear) {
++  CreateDefaultPool();
++
++  ASSERT_NE(NULL, tokens_);
++  EXPECT_EQ(kLoadAverageDefault, load_avg_);
++
++  // implicit token
++  EXPECT_TRUE(tokens_->Acquire());
++  tokens_->Reserve();
++  EXPECT_FALSE(tokens_->Acquire());
++
++  // jobserver offers 2nd & 3rd token
++  ASSERT_EQ(2u, write(fds_[1], "TT", 2));
++  EXPECT_TRUE(tokens_->Acquire());
++  tokens_->Reserve();
++  EXPECT_TRUE(tokens_->Acquire());
++  tokens_->Reserve();
++  EXPECT_FALSE(tokens_->Acquire());
++
++  tokens_->Clear();
++  EXPECT_TRUE(tokens_->Acquire());
++
++  // there must be two tokens in the pipe
++  EXPECT_EQ(2u, read(fds_[0], buf_, sizeof(buf_)));
++
++  // implicit token
++  EXPECT_TRUE(tokens_->Acquire());
++}
++#endif
+-- 
+2.44.0
+
diff --git a/meta/recipes-devtools/ninja/files/0008-Add-tests-for-subprocess-module.patch b/meta/recipes-devtools/ninja/files/0008-Add-tests-for-subprocess-module.patch
new file mode 100644
index 0000000000..df8b030fc9
--- /dev/null
+++ b/meta/recipes-devtools/ninja/files/0008-Add-tests-for-subprocess-module.patch
@@ -0,0 +1,121 @@
+From cf02adcc6cdb56dd728f1f4cc02939352635a9a9 Mon Sep 17 00:00:00 2001
+From: Stefan Becker <chemobejk@gmail.com>
+Date: Thu, 24 May 2018 18:52:45 +0300
+Subject: [PATCH 08/20] Add tests for subprocess module
+
+- add TokenPoolTest stub to provide TokenPool::GetMonitorFd()
+- add two tests
+  * both tests set up a dummy GNUmake jobserver pipe
+  * both tests call DoWork() with TokenPoolTest
+  * test 1: verify that DoWork() detects when a token is available
+  * test 2: verify that DoWork() works as before without a token
+- the tests are not compiled in under Windows
+
+Upstream-Status: Submitted [https://github.com/ninja-build/ninja/pull/1140]
+---
+ src/subprocess_test.cc | 76 ++++++++++++++++++++++++++++++++++++++++++
+ 1 file changed, 76 insertions(+)
+
+diff --git a/src/subprocess_test.cc b/src/subprocess_test.cc
+index 4bc8083..6264c8b 100644
+--- a/src/subprocess_test.cc
++++ b/src/subprocess_test.cc
+@@ -13,6 +13,7 @@
+ // limitations under the License.
+ 
+ #include "subprocess.h"
++#include "tokenpool.h"
+ 
+ #include "test.h"
+ 
+@@ -34,8 +35,23 @@ const char* kSimpleCommand = "cmd /c dir \\";
+ const char* kSimpleCommand = "ls /";
+ #endif
+ 
++struct TokenPoolTest : public TokenPool {
++  bool Acquire()     { return false; }
++  void Reserve()     {}
++  void Release()     {}
++  void Clear()       {}
++
++#ifdef _WIN32
++  // @TODO
++#else
++  int _fd;
++  int GetMonitorFd() { return _fd; }
++#endif
++};
++
+ struct SubprocessTest : public testing::Test {
+   SubprocessSet subprocs_;
++  TokenPoolTest tokens_;
+ };
+ 
+ }  // anonymous namespace
+@@ -280,3 +296,63 @@ TEST_F(SubprocessTest, ReadStdin) {
+   ASSERT_EQ(1u, subprocs_.finished_.size());
+ }
+ #endif  // _WIN32
++
++// @TODO: remove once TokenPool implementation for Windows is available
++#ifndef _WIN32
++TEST_F(SubprocessTest, TokenAvailable) {
++  Subprocess* subproc = subprocs_.Add(kSimpleCommand);
++  ASSERT_NE((Subprocess *) 0, subproc);
++
++  // simulate GNUmake jobserver pipe with 1 token
++  int fds[2];
++  ASSERT_EQ(0u, pipe(fds));
++  tokens_._fd = fds[0];
++  ASSERT_EQ(1u, write(fds[1], "T", 1));
++
++  subprocs_.ResetTokenAvailable();
++  subprocs_.DoWork(&tokens_);
++
++  EXPECT_TRUE(subprocs_.IsTokenAvailable());
++  EXPECT_EQ(0u, subprocs_.finished_.size());
++
++  // remove token to let DoWork() wait for command again
++  char token;
++  ASSERT_EQ(1u, read(fds[0], &token, 1));
++
++  while (!subproc->Done()) {
++    subprocs_.DoWork(&tokens_);
++  }
++
++  close(fds[1]);
++  close(fds[0]);
++
++  EXPECT_EQ(ExitSuccess, subproc->Finish());
++  EXPECT_NE("", subproc->GetOutput());
++
++  EXPECT_EQ(1u, subprocs_.finished_.size());
++}
++
++TEST_F(SubprocessTest, TokenNotAvailable) {
++  Subprocess* subproc = subprocs_.Add(kSimpleCommand);
++  ASSERT_NE((Subprocess *) 0, subproc);
++
++  // simulate GNUmake jobserver pipe with 0 tokens
++  int fds[2];
++  ASSERT_EQ(0u, pipe(fds));
++  tokens_._fd = fds[0];
++
++  subprocs_.ResetTokenAvailable();
++  while (!subproc->Done()) {
++    subprocs_.DoWork(&tokens_);
++  }
++
++  close(fds[1]);
++  close(fds[0]);
++
++  EXPECT_FALSE(subprocs_.IsTokenAvailable());
++  EXPECT_EQ(ExitSuccess, subproc->Finish());
++  EXPECT_NE("", subproc->GetOutput());
++
++  EXPECT_EQ(1u, subprocs_.finished_.size());
++}
++#endif  // _WIN32
+-- 
+2.44.0
+
diff --git a/meta/recipes-devtools/ninja/files/0009-Add-tests-for-build-module.patch b/meta/recipes-devtools/ninja/files/0009-Add-tests-for-build-module.patch
new file mode 100644
index 0000000000..fae5552e1a
--- /dev/null
+++ b/meta/recipes-devtools/ninja/files/0009-Add-tests-for-build-module.patch
@@ -0,0 +1,397 @@
+From f99d747d859a10421afedc7e9808a4e3defc2465 Mon Sep 17 00:00:00 2001
+From: Stefan Becker <chemobejk@gmail.com>
+Date: Sat, 26 May 2018 23:17:51 +0300
+Subject: [PATCH 09/20] Add tests for build module
+
+Add tests that verify the token functionality of the builder main loop.
+We replace the default fake command runner with a special version where
+the tests can control each call to AcquireToken(), CanRunMore() and
+WaitForCommand().
+
+Upstream-Status: Submitted [https://github.com/ninja-build/ninja/pull/1140]
+---
+ src/build_test.cc | 364 ++++++++++++++++++++++++++++++++++++++++++++++
+ 1 file changed, 364 insertions(+)
+
+diff --git a/src/build_test.cc b/src/build_test.cc
+index efa5662..0ef6ece 100644
+--- a/src/build_test.cc
++++ b/src/build_test.cc
+@@ -15,6 +15,7 @@
+ #include "build.h"
+ 
+ #include <assert.h>
++#include <stdarg.h>
+ 
+ #include "build_log.h"
+ #include "deps_log.h"
+@@ -4298,3 +4299,366 @@ TEST_F(BuildTest, ValidationWithCircularDependency) {
+   EXPECT_FALSE(builder_.AddTarget("out", &err));
+   EXPECT_EQ("dependency cycle: validate -> validate_in -> validate", err);
+ }
++
++/// The token tests are concerned with the main loop functionality when
++// the CommandRunner has an active TokenPool. It is therefore intentional
++// that the plan doesn't complete and that builder_.Build() returns false!
++
++/// Fake implementation of CommandRunner that simulates a TokenPool
++struct FakeTokenCommandRunner : public CommandRunner {
++  explicit FakeTokenCommandRunner() {}
++
++  // CommandRunner impl
++  virtual bool CanRunMore() const;
++  virtual bool AcquireToken();
++  virtual bool StartCommand(Edge* edge);
++  virtual bool WaitForCommand(Result* result, bool more_ready);
++  virtual vector<Edge*> GetActiveEdges();
++  virtual void Abort();
++
++  vector<string> commands_ran_;
++  vector<Edge *> edges_;
++
++  vector<bool> acquire_token_;
++  vector<bool> can_run_more_;
++  vector<bool> wait_for_command_;
++};
++
++bool FakeTokenCommandRunner::CanRunMore() const {
++  if (can_run_more_.size() == 0) {
++    EXPECT_FALSE("unexpected call to CommandRunner::CanRunMore()");
++    return false;
++  }
++
++  bool result = can_run_more_[0];
++
++  // Unfortunately CanRunMore() isn't "const" for tests
++  const_cast<FakeTokenCommandRunner*>(this)->can_run_more_.erase(
++    const_cast<FakeTokenCommandRunner*>(this)->can_run_more_.begin()
++  );
++
++  return result;
++}
++
++bool FakeTokenCommandRunner::AcquireToken() {
++  if (acquire_token_.size() == 0) {
++    EXPECT_FALSE("unexpected call to CommandRunner::AcquireToken()");
++    return false;
++  }
++
++  bool result = acquire_token_[0];
++  acquire_token_.erase(acquire_token_.begin());
++  return result;
++}
++
++bool FakeTokenCommandRunner::StartCommand(Edge* edge) {
++  commands_ran_.push_back(edge->EvaluateCommand());
++  edges_.push_back(edge);
++  return true;
++}
++
++bool FakeTokenCommandRunner::WaitForCommand(Result* result, bool more_ready) {
++  if (wait_for_command_.size() == 0) {
++    EXPECT_FALSE("unexpected call to CommandRunner::WaitForCommand()");
++    return false;
++  }
++
++  bool expected = wait_for_command_[0];
++  if (expected != more_ready) {
++    EXPECT_EQ(expected, more_ready);
++    return false;
++  }
++  wait_for_command_.erase(wait_for_command_.begin());
++
++  if (edges_.size() == 0)
++    return false;
++
++  Edge* edge = edges_[0];
++  result->edge = edge;
++
++  if (more_ready &&
++      (edge->rule().name() == "token-available")) {
++    result->status = ExitTokenAvailable;
++  } else {
++    edges_.erase(edges_.begin());
++    result->status = ExitSuccess;
++  }
++
++  return true;
++}
++
++vector<Edge*> FakeTokenCommandRunner::GetActiveEdges() {
++  return edges_;
++}
++
++void FakeTokenCommandRunner::Abort() {
++  edges_.clear();
++}
++
++struct BuildTokenTest : public BuildTest {
++  virtual void SetUp();
++  virtual void TearDown();
++
++  FakeTokenCommandRunner token_command_runner_;
++
++  void ExpectAcquireToken(int count, ...);
++  void ExpectCanRunMore(int count, ...);
++  void ExpectWaitForCommand(int count, ...);
++
++private:
++  void EnqueueBooleans(vector<bool>& booleans, int count, va_list ao);
++};
++
++void BuildTokenTest::SetUp() {
++  BuildTest::SetUp();
++
++  // replace FakeCommandRunner with FakeTokenCommandRunner
++  builder_.command_runner_.release();
++  builder_.command_runner_.reset(&token_command_runner_);
++}
++void BuildTokenTest::TearDown() {
++  EXPECT_EQ(0u, token_command_runner_.acquire_token_.size());
++  EXPECT_EQ(0u, token_command_runner_.can_run_more_.size());
++  EXPECT_EQ(0u, token_command_runner_.wait_for_command_.size());
++
++  BuildTest::TearDown();
++}
++
++void BuildTokenTest::ExpectAcquireToken(int count, ...) {
++  va_list ap;
++  va_start(ap, count);
++  EnqueueBooleans(token_command_runner_.acquire_token_, count, ap);
++  va_end(ap);
++}
++
++void BuildTokenTest::ExpectCanRunMore(int count, ...) {
++  va_list ap;
++  va_start(ap, count);
++  EnqueueBooleans(token_command_runner_.can_run_more_, count, ap);
++  va_end(ap);
++}
++
++void BuildTokenTest::ExpectWaitForCommand(int count, ...) {
++  va_list ap;
++  va_start(ap, count);
++  EnqueueBooleans(token_command_runner_.wait_for_command_, count, ap);
++  va_end(ap);
++}
++
++void BuildTokenTest::EnqueueBooleans(vector<bool>& booleans, int count, va_list ap) {
++  while (count--) {
++    int value = va_arg(ap, int);
++    booleans.push_back(!!value); // force bool
++  }
++}
++
++TEST_F(BuildTokenTest, CompleteNoWork) {
++  // plan should not execute anything
++  string err;
++
++  EXPECT_TRUE(builder_.Build(&err));
++  EXPECT_EQ("", err);
++
++  EXPECT_EQ(0u, token_command_runner_.commands_ran_.size());
++}
++
++TEST_F(BuildTokenTest, DoNotAquireToken) {
++  // plan should execute one command
++  string err;
++  EXPECT_TRUE(builder_.AddTarget("cat1", &err));
++  ASSERT_EQ("", err);
++
++  // pretend we can't run anything
++  ExpectCanRunMore(1, false);
++
++  EXPECT_FALSE(builder_.Build(&err));
++  EXPECT_EQ("stuck [this is a bug]", err);
++
++  EXPECT_EQ(0u, token_command_runner_.commands_ran_.size());
++}
++
++TEST_F(BuildTokenTest, DoNotStartWithoutToken) {
++  // plan should execute one command
++  string err;
++  EXPECT_TRUE(builder_.AddTarget("cat1", &err));
++  ASSERT_EQ("", err);
++
++  // we could run a command but do not have a token for it
++  ExpectCanRunMore(1,   true);
++  ExpectAcquireToken(1, false);
++
++  EXPECT_FALSE(builder_.Build(&err));
++  EXPECT_EQ("stuck [this is a bug]", err);
++
++  EXPECT_EQ(0u, token_command_runner_.commands_ran_.size());
++}
++
++TEST_F(BuildTokenTest, CompleteOneStep) {
++  // plan should execute one command
++  string err;
++  EXPECT_TRUE(builder_.AddTarget("cat1", &err));
++  ASSERT_EQ("", err);
++
++  // allow running of one command
++  ExpectCanRunMore(1,   true);
++  ExpectAcquireToken(1, true);
++  // block and wait for command to finalize
++  ExpectWaitForCommand(1, false);
++
++  EXPECT_TRUE(builder_.Build(&err));
++  EXPECT_EQ("", err);
++
++  EXPECT_EQ(1u, token_command_runner_.commands_ran_.size());
++  EXPECT_TRUE(token_command_runner_.commands_ran_[0] == "cat in1 > cat1");
++}
++
++TEST_F(BuildTokenTest, AcquireOneToken) {
++  // plan should execute more than one command
++  string err;
++  EXPECT_TRUE(builder_.AddTarget("cat12", &err));
++  ASSERT_EQ("", err);
++
++  // allow running of one command
++  ExpectCanRunMore(3,     true, false, false);
++  ExpectAcquireToken(1,   true);
++  // block and wait for command to finalize
++  ExpectWaitForCommand(1, false);
++
++  EXPECT_FALSE(builder_.Build(&err));
++  EXPECT_EQ("stuck [this is a bug]", err);
++
++  EXPECT_EQ(1u, token_command_runner_.commands_ran_.size());
++  // any of the two dependencies could have been executed
++  EXPECT_TRUE(token_command_runner_.commands_ran_[0] == "cat in1 > cat1" ||
++              token_command_runner_.commands_ran_[0] == "cat in1 in2 > cat2");
++}
++
++TEST_F(BuildTokenTest, WantTwoTokens) {
++  // plan should execute more than one command
++  string err;
++  EXPECT_TRUE(builder_.AddTarget("cat12", &err));
++  ASSERT_EQ("", err);
++
++  // allow running of one command
++  ExpectCanRunMore(3,     true, true, false);
++  ExpectAcquireToken(2,   true, false);
++  // wait for command to finalize or token to become available
++  ExpectWaitForCommand(1, true);
++
++  EXPECT_FALSE(builder_.Build(&err));
++  EXPECT_EQ("stuck [this is a bug]", err);
++
++  EXPECT_EQ(1u, token_command_runner_.commands_ran_.size());
++  // any of the two dependencies could have been executed
++  EXPECT_TRUE(token_command_runner_.commands_ran_[0] == "cat in1 > cat1" ||
++              token_command_runner_.commands_ran_[0] == "cat in1 in2 > cat2");
++}
++
++TEST_F(BuildTokenTest, CompleteTwoSteps) {
++  ASSERT_NO_FATAL_FAILURE(AssertParse(&state_,
++"build out1: cat in1\n"
++"build out2: cat out1\n"));
++
++  // plan should execute more than one command
++  string err;
++  EXPECT_TRUE(builder_.AddTarget("out2", &err));
++  ASSERT_EQ("", err);
++
++  // allow running of two commands
++  ExpectCanRunMore(2,     true, true);
++  ExpectAcquireToken(2,   true, true);
++  // wait for commands to finalize
++  ExpectWaitForCommand(2, false, false);
++
++  EXPECT_TRUE(builder_.Build(&err));
++  EXPECT_EQ("", err);
++
++  EXPECT_EQ(2u, token_command_runner_.commands_ran_.size());
++  EXPECT_TRUE(token_command_runner_.commands_ran_[0] == "cat in1 > out1");
++  EXPECT_TRUE(token_command_runner_.commands_ran_[1] == "cat out1 > out2");
++}
++
++TEST_F(BuildTokenTest, TwoCommandsInParallel) {
++  ASSERT_NO_FATAL_FAILURE(AssertParse(&state_,
++"rule token-available\n"
++"  command = cat $in > $out\n"
++"build out1: token-available in1\n"
++"build out2: token-available in2\n"
++"build out12: cat out1 out2\n"));
++
++  // plan should execute more than one command
++  string err;
++  EXPECT_TRUE(builder_.AddTarget("out12", &err));
++  ASSERT_EQ("", err);
++
++  // 1st command: token available -> allow running
++  // 2nd command: no token available but becomes available later
++  ExpectCanRunMore(4,     true, true,  true,  false);
++  ExpectAcquireToken(3,   true, false, true);
++  // 1st call waits for command to finalize or token to become available
++  // 2nd call waits for command to finalize
++  // 3rd call waits for command to finalize
++  ExpectWaitForCommand(3, true, false, false);
++
++  EXPECT_FALSE(builder_.Build(&err));
++  EXPECT_EQ("stuck [this is a bug]", err);
++
++  EXPECT_EQ(2u, token_command_runner_.commands_ran_.size());
++  EXPECT_TRUE((token_command_runner_.commands_ran_[0] == "cat in1 > out1" &&
++               token_command_runner_.commands_ran_[1] == "cat in2 > out2") ||
++              (token_command_runner_.commands_ran_[0] == "cat in2 > out2" &&
++               token_command_runner_.commands_ran_[1] == "cat in1 > out1"));
++}
++
++TEST_F(BuildTokenTest, CompleteThreeStepsSerial) {
++  // plan should execute more than one command
++  string err;
++  EXPECT_TRUE(builder_.AddTarget("cat12", &err));
++  ASSERT_EQ("", err);
++
++  // allow running of all commands
++  ExpectCanRunMore(4,     true, true,  true,  true);
++  ExpectAcquireToken(4,   true, false, true,  true);
++  // wait for commands to finalize
++  ExpectWaitForCommand(3, true, false, false);
++
++  EXPECT_TRUE(builder_.Build(&err));
++  EXPECT_EQ("", err);
++
++  EXPECT_EQ(3u, token_command_runner_.commands_ran_.size());
++  EXPECT_TRUE((token_command_runner_.commands_ran_[0] == "cat in1 > cat1"     &&
++               token_command_runner_.commands_ran_[1] == "cat in1 in2 > cat2") ||
++              (token_command_runner_.commands_ran_[0] == "cat in1 in2 > cat2" &&
++               token_command_runner_.commands_ran_[1] == "cat in1 > cat1"    ));
++  EXPECT_TRUE(token_command_runner_.commands_ran_[2] == "cat cat1 cat2 > cat12");
++}
++
++TEST_F(BuildTokenTest, CompleteThreeStepsParallel) {
++  ASSERT_NO_FATAL_FAILURE(AssertParse(&state_,
++"rule token-available\n"
++"  command = cat $in > $out\n"
++"build out1: token-available in1\n"
++"build out2: token-available in2\n"
++"build out12: cat out1 out2\n"));
++
++  // plan should execute more than one command
++  string err;
++  EXPECT_TRUE(builder_.AddTarget("out12", &err));
++  ASSERT_EQ("", err);
++
++  // allow running of all commands
++  ExpectCanRunMore(4,     true, true,  true,  true);
++  ExpectAcquireToken(4,   true, false, true,  true);
++  // wait for commands to finalize
++  ExpectWaitForCommand(4, true, false, false, false);
++
++  EXPECT_TRUE(builder_.Build(&err));
++  EXPECT_EQ("", err);
++
++  EXPECT_EQ(3u, token_command_runner_.commands_ran_.size());
++  EXPECT_TRUE((token_command_runner_.commands_ran_[0] == "cat in1 > out1" &&
++               token_command_runner_.commands_ran_[1] == "cat in2 > out2") ||
++              (token_command_runner_.commands_ran_[0] == "cat in2 > out2" &&
++               token_command_runner_.commands_ran_[1] == "cat in1 > out1"));
++  EXPECT_TRUE(token_command_runner_.commands_ran_[2] == "cat out1 out2 > out12");
++}
+-- 
+2.44.0
+
diff --git a/meta/recipes-devtools/ninja/files/0010-Add-Win32-implementation-for-GNUmakeTokenPool.patch b/meta/recipes-devtools/ninja/files/0010-Add-Win32-implementation-for-GNUmakeTokenPool.patch
new file mode 100644
index 0000000000..5aa74d97e9
--- /dev/null
+++ b/meta/recipes-devtools/ninja/files/0010-Add-Win32-implementation-for-GNUmakeTokenPool.patch
@@ -0,0 +1,1283 @@
+From 71ad7daae069341f1b7827da911288024d208686 Mon Sep 17 00:00:00 2001
+From: Stefan Becker <chemobejk@gmail.com>
+Date: Mon, 8 Oct 2018 17:47:50 +0300
+Subject: [PATCH 10/20] Add Win32 implementation for GNUmakeTokenPool
+
+GNU make uses a semaphore as jobserver protocol on Win32. See also
+
+   https://www.gnu.org/software/make/manual/html_node/Windows-Jobserver.html
+
+Usage is pretty simple and straightforward, i.e. WaitForSingleObject()
+to obtain a token and ReleaseSemaphore() to return it.
+
+Unfortunately subprocess-win32.cc uses an I/O completion port (IOCP).
+IOCPs aren't waitable objects, i.e. we can't use WaitForMultipleObjects()
+to wait on the IOCP and the token semaphore at the same time.
+
+Therefore GNUmakeTokenPoolWin32 creates a child thread that waits on the
+token semaphore and posts a dummy I/O completion status on the IOCP when
+it was able to obtain a token. That unblocks SubprocessSet::DoWork() and
+it can then check if a token became available or not.
+
+- split existing GNUmakeTokenPool into common and platform bits
+- add GNUmakeTokenPool interface
+- move the Posix bits to GNUmakeTokenPoolPosix
+- add the Win32 bits as GNUmakeTokenPoolWin32
+- move Setup() method up to TokenPool interface
+- update Subprocess & TokenPool tests accordingly
+
+Upstream-Status: Submitted [https://github.com/ninja-build/ninja/pull/1140]
+---
+ configure.py                    |   8 +-
+ src/build.cc                    |  11 +-
+ src/subprocess-win32.cc         |   9 ++
+ src/subprocess_test.cc          |  34 ++++-
+ src/tokenpool-gnu-make-posix.cc | 203 +++++++++++++++++++++++++++
+ src/tokenpool-gnu-make-win32.cc | 237 ++++++++++++++++++++++++++++++++
+ src/tokenpool-gnu-make.cc       | 203 ++-------------------------
+ src/tokenpool-gnu-make.h        |  40 ++++++
+ src/tokenpool-none.cc           |   4 +-
+ src/tokenpool.h                 |  18 ++-
+ src/tokenpool_test.cc           | 113 ++++++++++++---
+ 11 files changed, 653 insertions(+), 227 deletions(-)
+ create mode 100644 src/tokenpool-gnu-make-posix.cc
+ create mode 100644 src/tokenpool-gnu-make-win32.cc
+ create mode 100644 src/tokenpool-gnu-make.h
+
+diff --git a/configure.py b/configure.py
+index 41f9428..9bfa02f 100755
+--- a/configure.py
++++ b/configure.py
+@@ -538,12 +538,13 @@ for name in ['build',
+              'state',
+              'status',
+              'string_piece_util',
++             'tokenpool-gnu-make',
+              'util',
+              'version']:
+     objs += cxx(name, variables=cxxvariables)
+ if platform.is_windows():
+     for name in ['subprocess-win32',
+-                 'tokenpool-none',
++                 'tokenpool-gnu-make-win32',
+                  'includes_normalize-win32',
+                  'msvc_helper-win32',
+                  'msvc_helper_main-win32']:
+@@ -552,8 +553,9 @@ if platform.is_windows():
+         objs += cxx('minidump-win32', variables=cxxvariables)
+     objs += cc('getopt')
+ else:
+-    objs += cxx('subprocess-posix')
+-    objs += cxx('tokenpool-gnu-make')
++    for name in ['subprocess-posix',
++                 'tokenpool-gnu-make-posix']:
++        objs += cxx(name)
+ if platform.is_aix():
+     objs += cc('getopt')
+ if platform.is_msvc():
+diff --git a/src/build.cc b/src/build.cc
+index da1faa8..0763dd5 100644
+--- a/src/build.cc
++++ b/src/build.cc
+@@ -473,9 +473,14 @@ struct RealCommandRunner : public CommandRunner {
+ 
+ RealCommandRunner::RealCommandRunner(const BuildConfig& config) : config_(config) {
+   max_load_average_ = config.max_load_average;
+-  tokens_ = TokenPool::Get(config_.parallelism_from_cmdline,
+-                           config_.verbosity == BuildConfig::VERBOSE,
+-                           max_load_average_);
++  if ((tokens_ = TokenPool::Get()) != NULL) {
++    if (!tokens_->Setup(config_.parallelism_from_cmdline,
++                        config_.verbosity == BuildConfig::VERBOSE,
++                        max_load_average_)) {
++      delete tokens_;
++      tokens_ = NULL;
++    }
++  }
+ }
+ 
+ RealCommandRunner::~RealCommandRunner() {
+diff --git a/src/subprocess-win32.cc b/src/subprocess-win32.cc
+index 66d2c2c..ce3e2c2 100644
+--- a/src/subprocess-win32.cc
++++ b/src/subprocess-win32.cc
+@@ -13,6 +13,7 @@
+ // limitations under the License.
+ 
+ #include "subprocess.h"
++#include "tokenpool.h"
+ 
+ #include <assert.h>
+ #include <stdio.h>
+@@ -256,6 +257,9 @@ bool SubprocessSet::DoWork(struct TokenPool* tokens) {
+   Subprocess* subproc;
+   OVERLAPPED* overlapped;
+ 
++  if (tokens)
++    tokens->WaitForTokenAvailability(ioport_);
++
+   if (!GetQueuedCompletionStatus(ioport_, &bytes_read, (PULONG_PTR)&subproc,
+                                  &overlapped, INFINITE)) {
+     if (GetLastError() != ERROR_BROKEN_PIPE)
+@@ -266,6 +270,11 @@ bool SubprocessSet::DoWork(struct TokenPool* tokens) {
+                 // delivered by NotifyInterrupted above.
+     return true;
+ 
++  if (tokens && tokens->TokenIsAvailable((ULONG_PTR)subproc)) {
++    token_available_ = true;
++    return false;
++  }
++
+   subproc->OnPipeReady();
+ 
+   if (subproc->Done()) {
+diff --git a/src/subprocess_test.cc b/src/subprocess_test.cc
+index 6264c8b..f625963 100644
+--- a/src/subprocess_test.cc
++++ b/src/subprocess_test.cc
+@@ -40,9 +40,16 @@ struct TokenPoolTest : public TokenPool {
+   void Reserve()     {}
+   void Release()     {}
+   void Clear()       {}
++  bool Setup(bool ignore_unused, bool verbose, double& max_load_average) { return false; }
+ 
+ #ifdef _WIN32
+-  // @TODO
++  bool _token_available;
++  void WaitForTokenAvailability(HANDLE ioport) {
++    if (_token_available)
++      // unblock GetQueuedCompletionStatus()
++      PostQueuedCompletionStatus(ioport, 0, (ULONG_PTR) this, NULL);
++  }
++  bool TokenIsAvailable(ULONG_PTR key) { return key == (ULONG_PTR) this; }
+ #else
+   int _fd;
+   int GetMonitorFd() { return _fd; }
+@@ -297,34 +304,48 @@ TEST_F(SubprocessTest, ReadStdin) {
+ }
+ #endif  // _WIN32
+ 
+-// @TODO: remove once TokenPool implementation for Windows is available
+-#ifndef _WIN32
+ TEST_F(SubprocessTest, TokenAvailable) {
+   Subprocess* subproc = subprocs_.Add(kSimpleCommand);
+   ASSERT_NE((Subprocess *) 0, subproc);
+ 
+   // simulate GNUmake jobserver pipe with 1 token
++#ifdef _WIN32
++  tokens_._token_available = true;
++#else
+   int fds[2];
+   ASSERT_EQ(0u, pipe(fds));
+   tokens_._fd = fds[0];
+   ASSERT_EQ(1u, write(fds[1], "T", 1));
++#endif
+ 
+   subprocs_.ResetTokenAvailable();
+   subprocs_.DoWork(&tokens_);
++#ifdef _WIN32
++  tokens_._token_available = false;
++  // we need to loop here as we have no conrol where the token
++  // I/O completion post ends up in the queue
++  while (!subproc->Done() && !subprocs_.IsTokenAvailable()) {
++    subprocs_.DoWork(&tokens_);
++  }
++#endif
+ 
+   EXPECT_TRUE(subprocs_.IsTokenAvailable());
+   EXPECT_EQ(0u, subprocs_.finished_.size());
+ 
+   // remove token to let DoWork() wait for command again
++#ifndef _WIN32
+   char token;
+   ASSERT_EQ(1u, read(fds[0], &token, 1));
++#endif
+ 
+   while (!subproc->Done()) {
+     subprocs_.DoWork(&tokens_);
+   }
+ 
++#ifndef _WIN32
+   close(fds[1]);
+   close(fds[0]);
++#endif
+ 
+   EXPECT_EQ(ExitSuccess, subproc->Finish());
+   EXPECT_NE("", subproc->GetOutput());
+@@ -337,17 +358,23 @@ TEST_F(SubprocessTest, TokenNotAvailable) {
+   ASSERT_NE((Subprocess *) 0, subproc);
+ 
+   // simulate GNUmake jobserver pipe with 0 tokens
++#ifdef _WIN32
++  tokens_._token_available = false;
++#else
+   int fds[2];
+   ASSERT_EQ(0u, pipe(fds));
+   tokens_._fd = fds[0];
++#endif
+ 
+   subprocs_.ResetTokenAvailable();
+   while (!subproc->Done()) {
+     subprocs_.DoWork(&tokens_);
+   }
+ 
++#ifndef _WIN32
+   close(fds[1]);
+   close(fds[0]);
++#endif
+ 
+   EXPECT_FALSE(subprocs_.IsTokenAvailable());
+   EXPECT_EQ(ExitSuccess, subproc->Finish());
+@@ -355,4 +382,3 @@ TEST_F(SubprocessTest, TokenNotAvailable) {
+ 
+   EXPECT_EQ(1u, subprocs_.finished_.size());
+ }
+-#endif  // _WIN32
+diff --git a/src/tokenpool-gnu-make-posix.cc b/src/tokenpool-gnu-make-posix.cc
+new file mode 100644
+index 0000000..70d84bf
+--- /dev/null
++++ b/src/tokenpool-gnu-make-posix.cc
+@@ -0,0 +1,203 @@
++// Copyright 2016-2018 Google Inc. All Rights Reserved.
++//
++// Licensed under the Apache License, Version 2.0 (the "License");
++// you may not use this file except in compliance with the License.
++// You may obtain a copy of the License at
++//
++//     http://www.apache.org/licenses/LICENSE-2.0
++//
++// Unless required by applicable law or agreed to in writing, software
++// distributed under the License is distributed on an "AS IS" BASIS,
++// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
++// See the License for the specific language governing permissions and
++// limitations under the License.
++
++#include "tokenpool-gnu-make.h"
++
++#include <errno.h>
++#include <fcntl.h>
++#include <poll.h>
++#include <unistd.h>
++#include <signal.h>
++#include <sys/time.h>
++#include <stdio.h>
++#include <string.h>
++#include <stdlib.h>
++
++// TokenPool implementation for GNU make jobserver - POSIX implementation
++// (http://make.mad-scientist.net/papers/jobserver-implementation/)
++struct GNUmakeTokenPoolPosix : public GNUmakeTokenPool {
++  GNUmakeTokenPoolPosix();
++  virtual ~GNUmakeTokenPoolPosix();
++
++  virtual int GetMonitorFd();
++
++  virtual const char *GetEnv(const char *name) { return getenv(name); };
++  virtual bool ParseAuth(const char *jobserver);
++  virtual bool AcquireToken();
++  virtual bool ReturnToken();
++
++ private:
++  int rfd_;
++  int wfd_;
++
++  struct sigaction old_act_;
++  bool restore_;
++
++  static int dup_rfd_;
++  static void CloseDupRfd(int signum);
++
++  bool CheckFd(int fd);
++  bool SetAlarmHandler();
++};
++
++GNUmakeTokenPoolPosix::GNUmakeTokenPoolPosix() : rfd_(-1), wfd_(-1), restore_(false) {
++}
++
++GNUmakeTokenPoolPosix::~GNUmakeTokenPoolPosix() {
++  Clear();
++  if (restore_)
++    sigaction(SIGALRM, &old_act_, NULL);
++}
++
++bool GNUmakeTokenPoolPosix::CheckFd(int fd) {
++  if (fd < 0)
++    return false;
++  int ret = fcntl(fd, F_GETFD);
++  if (ret < 0)
++    return false;
++  return true;
++}
++
++int GNUmakeTokenPoolPosix::dup_rfd_ = -1;
++
++void GNUmakeTokenPoolPosix::CloseDupRfd(int signum) {
++  close(dup_rfd_);
++  dup_rfd_ = -1;
++}
++
++bool GNUmakeTokenPoolPosix::SetAlarmHandler() {
++  struct sigaction act;
++  memset(&act, 0, sizeof(act));
++  act.sa_handler = CloseDupRfd;
++  if (sigaction(SIGALRM, &act, &old_act_) < 0) {
++    perror("sigaction:");
++    return(false);
++  } else {
++    restore_ = true;
++    return(true);
++  }
++}
++
++bool GNUmakeTokenPoolPosix::ParseAuth(const char *jobserver) {
++  int rfd = -1;
++  int wfd = -1;
++  if ((sscanf(jobserver, "%*[^=]=%d,%d", &rfd, &wfd) == 2) &&
++      CheckFd(rfd) &&
++      CheckFd(wfd) &&
++      SetAlarmHandler()) {
++    rfd_ = rfd;
++    wfd_ = wfd;
++    return true;
++  }
++
++  return false;
++}
++
++bool GNUmakeTokenPoolPosix::AcquireToken() {
++  // Please read
++  //
++  //   http://make.mad-scientist.net/papers/jobserver-implementation/
++  //
++  // for the reasoning behind the following code.
++  //
++  // Try to read one character from the pipe. Returns true on success.
++  //
++  // First check if read() would succeed without blocking.
++#ifdef USE_PPOLL
++  pollfd pollfds[] = {{rfd_, POLLIN, 0}};
++  int ret = poll(pollfds, 1, 0);
++#else
++  fd_set set;
++  struct timeval timeout = { 0, 0 };
++  FD_ZERO(&set);
++  FD_SET(rfd_, &set);
++  int ret = select(rfd_ + 1, &set, NULL, NULL, &timeout);
++#endif
++  if (ret > 0) {
++    // Handle potential race condition:
++    //  - the above check succeeded, i.e. read() should not block
++    //  - the character disappears before we call read()
++    //
++    // Create a duplicate of rfd_. The duplicate file descriptor dup_rfd_
++    // can safely be closed by signal handlers without affecting rfd_.
++    dup_rfd_ = dup(rfd_);
++
++    if (dup_rfd_ != -1) {
++      struct sigaction act, old_act;
++      int ret = 0;
++
++      // Temporarily replace SIGCHLD handler with our own
++      memset(&act, 0, sizeof(act));
++      act.sa_handler = CloseDupRfd;
++      if (sigaction(SIGCHLD, &act, &old_act) == 0) {
++        struct itimerval timeout;
++
++        // install a 100ms timeout that generates SIGALARM on expiration
++        memset(&timeout, 0, sizeof(timeout));
++        timeout.it_value.tv_usec = 100 * 1000; // [ms] -> [usec]
++        if (setitimer(ITIMER_REAL, &timeout, NULL) == 0) {
++          char buf;
++
++          // Now try to read() from dup_rfd_. Return values from read():
++          //
++          // 1. token read                               ->  1
++          // 2. pipe closed                              ->  0
++          // 3. alarm expires                            -> -1 (EINTR)
++          // 4. child exits                              -> -1 (EINTR)
++          // 5. alarm expired before entering read()     -> -1 (EBADF)
++          // 6. child exited before entering read()      -> -1 (EBADF)
++          // 7. child exited before handler is installed -> go to 1 - 3
++          ret = read(dup_rfd_, &buf, 1);
++
++          // disarm timer
++          memset(&timeout, 0, sizeof(timeout));
++          setitimer(ITIMER_REAL, &timeout, NULL);
++        }
++
++        sigaction(SIGCHLD, &old_act, NULL);
++      }
++
++      CloseDupRfd(0);
++
++      // Case 1 from above list
++      if (ret > 0)
++        return true;
++    }
++  }
++
++  // read() would block, i.e. no token available,
++  // cases 2-6 from above list or
++  // select() / poll() / dup() / sigaction() / setitimer() failed
++  return false;
++}
++
++bool GNUmakeTokenPoolPosix::ReturnToken() {
++  const char buf = '+';
++  while (1) {
++    int ret = write(wfd_, &buf, 1);
++    if (ret > 0)
++      return true;
++    if ((ret != -1) || (errno != EINTR))
++      return false;
++    // write got interrupted - retry
++  }
++}
++
++int GNUmakeTokenPoolPosix::GetMonitorFd() {
++  return(rfd_);
++}
++
++struct TokenPool *TokenPool::Get() {
++  return new GNUmakeTokenPoolPosix;
++}
+diff --git a/src/tokenpool-gnu-make-win32.cc b/src/tokenpool-gnu-make-win32.cc
+new file mode 100644
+index 0000000..2719f2c
+--- /dev/null
++++ b/src/tokenpool-gnu-make-win32.cc
+@@ -0,0 +1,237 @@
++// Copyright 2018 Google Inc. All Rights Reserved.
++//
++// Licensed under the Apache License, Version 2.0 (the "License");
++// you may not use this file except in compliance with the License.
++// You may obtain a copy of the License at
++//
++//     http://www.apache.org/licenses/LICENSE-2.0
++//
++// Unless required by applicable law or agreed to in writing, software
++// distributed under the License is distributed on an "AS IS" BASIS,
++// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
++// See the License for the specific language governing permissions and
++// limitations under the License.
++
++#include "tokenpool-gnu-make.h"
++
++// always include first to make sure other headers do the correct thing...
++#include <windows.h>
++
++#include <ctype.h>
++#include <stdlib.h>
++#include <string.h>
++
++#include "util.h"
++
++// TokenPool implementation for GNU make jobserver - Win32 implementation
++// (https://www.gnu.org/software/make/manual/html_node/Windows-Jobserver.html)
++struct GNUmakeTokenPoolWin32 : public GNUmakeTokenPool {
++  GNUmakeTokenPoolWin32();
++  virtual ~GNUmakeTokenPoolWin32();
++
++  virtual void WaitForTokenAvailability(HANDLE ioport);
++  virtual bool TokenIsAvailable(ULONG_PTR key);
++
++  virtual const char *GetEnv(const char *name);
++  virtual bool ParseAuth(const char *jobserver);
++  virtual bool AcquireToken();
++  virtual bool ReturnToken();
++
++ private:
++  // Semaphore for GNU make jobserver protocol
++  HANDLE semaphore_jobserver_;
++  // Semaphore Child -> Parent
++  // - child releases it before entering wait on jobserver semaphore
++  // - parent blocks on it to know when child enters wait
++  HANDLE semaphore_enter_wait_;
++  // Semaphore Parent -> Child
++  // - parent releases it to allow child to restart loop
++  // - child blocks on it to know when to restart loop
++  HANDLE semaphore_restart_;
++  // set to false if child should exit loop and terminate thread
++  bool running_;
++  // child thread
++  HANDLE child_;
++  // I/O completion port from SubprocessSet
++  HANDLE ioport_;
++
++
++  DWORD SemaphoreThread();
++  void ReleaseSemaphore(HANDLE semaphore);
++  void WaitForObject(HANDLE object);
++  static DWORD WINAPI SemaphoreThreadWrapper(LPVOID param);
++  static void NoopAPCFunc(ULONG_PTR param);
++};
++
++GNUmakeTokenPoolWin32::GNUmakeTokenPoolWin32() : semaphore_jobserver_(NULL),
++                                                 semaphore_enter_wait_(NULL),
++                                                 semaphore_restart_(NULL),
++                                                 running_(false),
++                                                 child_(NULL),
++                                                 ioport_(NULL) {
++}
++
++GNUmakeTokenPoolWin32::~GNUmakeTokenPoolWin32() {
++  Clear();
++  CloseHandle(semaphore_jobserver_);
++  semaphore_jobserver_ = NULL;
++
++  if (child_) {
++    // tell child thread to exit
++    running_ = false;
++    ReleaseSemaphore(semaphore_restart_);
++
++    // wait for child thread to exit
++    WaitForObject(child_);
++    CloseHandle(child_);
++    child_ = NULL;
++  }
++
++  if (semaphore_restart_) {
++    CloseHandle(semaphore_restart_);
++    semaphore_restart_ = NULL;
++  }
++
++  if (semaphore_enter_wait_) {
++    CloseHandle(semaphore_enter_wait_);
++    semaphore_enter_wait_ = NULL;
++  }
++}
++
++const char *GNUmakeTokenPoolWin32::GetEnv(const char *name) {
++  // getenv() does not work correctly together with tokenpool_tests.cc
++  static char buffer[MAX_PATH + 1];
++  if (GetEnvironmentVariable("MAKEFLAGS", buffer, sizeof(buffer)) == 0)
++    return NULL;
++  return(buffer);
++}
++
++bool GNUmakeTokenPoolWin32::ParseAuth(const char *jobserver) {
++  // match "--jobserver-auth=gmake_semaphore_<INTEGER>..."
++  const char *start = strchr(jobserver, '=');
++  if (start) {
++    const char *end = start;
++    unsigned int len;
++    char c, *auth;
++
++    while ((c = *++end) != '\0')
++      if (!(isalnum(c) || (c == '_')))
++        break;
++    len = end - start; // includes string terminator in count
++
++    if ((len > 1) && ((auth = (char *)malloc(len)) != NULL)) {
++      strncpy(auth, start + 1, len - 1);
++      auth[len - 1] = '\0';
++
++      if ((semaphore_jobserver_ = OpenSemaphore(SEMAPHORE_ALL_ACCESS, /* Semaphore access setting */
++                                                FALSE,                /* Child processes DON'T inherit */
++                                                auth                  /* Semaphore name */
++                                                )) != NULL) {
++        free(auth);
++        return true;
++      }
++
++      free(auth);
++    }
++  }
++
++  return false;
++}
++
++bool GNUmakeTokenPoolWin32::AcquireToken() {
++  return WaitForSingleObject(semaphore_jobserver_, 0) == WAIT_OBJECT_0;
++}
++
++bool GNUmakeTokenPoolWin32::ReturnToken() {
++  ReleaseSemaphore(semaphore_jobserver_);
++  return true;
++}
++
++DWORD GNUmakeTokenPoolWin32::SemaphoreThread() {
++  while (running_) {
++    // indicate to parent that we are entering wait
++    ReleaseSemaphore(semaphore_enter_wait_);
++
++    // alertable wait forever on token semaphore
++    if (WaitForSingleObjectEx(semaphore_jobserver_, INFINITE, TRUE) == WAIT_OBJECT_0) {
++      // release token again for AcquireToken()
++      ReleaseSemaphore(semaphore_jobserver_);
++
++      // indicate to parent on ioport that a token might be available
++      if (!PostQueuedCompletionStatus(ioport_, 0, (ULONG_PTR) this, NULL))
++        Win32Fatal("PostQueuedCompletionStatus");
++    }
++
++    // wait for parent to allow loop restart
++    WaitForObject(semaphore_restart_);
++    // semaphore is now in nonsignaled state again for next run...
++  }
++
++  return 0;
++}
++
++DWORD WINAPI GNUmakeTokenPoolWin32::SemaphoreThreadWrapper(LPVOID param) {
++  GNUmakeTokenPoolWin32 *This = (GNUmakeTokenPoolWin32 *) param;
++  return This->SemaphoreThread();
++}
++
++void GNUmakeTokenPoolWin32::NoopAPCFunc(ULONG_PTR param) {
++}
++
++void GNUmakeTokenPoolWin32::WaitForTokenAvailability(HANDLE ioport) {
++  if (child_ == NULL) {
++    // first invocation
++    //
++    // subprocess-win32.cc uses I/O completion port (IOCP) which can't be
++    // used as a waitable object. Therefore we can't use WaitMultipleObjects()
++    // to wait on the IOCP and the token semaphore at the same time. Create
++    // a child thread that waits on the semaphore and posts an I/O completion
++    ioport_ = ioport;
++
++    // create both semaphores in nonsignaled state
++    if ((semaphore_enter_wait_ = CreateSemaphore(NULL, 0, 1, NULL))
++        == NULL)
++      Win32Fatal("CreateSemaphore/enter_wait");
++    if ((semaphore_restart_ = CreateSemaphore(NULL, 0, 1, NULL))
++        == NULL)
++      Win32Fatal("CreateSemaphore/restart");
++
++    // start child thread
++    running_ = true;
++    if ((child_ = CreateThread(NULL, 0, &SemaphoreThreadWrapper, this, 0, NULL))
++        == NULL)
++      Win32Fatal("CreateThread");
++
++  } else {
++    // all further invocations - allow child thread to loop
++    ReleaseSemaphore(semaphore_restart_);
++  }
++
++  // wait for child thread to enter wait
++  WaitForObject(semaphore_enter_wait_);
++  // semaphore is now in nonsignaled state again for next run...
++
++  // now SubprocessSet::DoWork() can enter GetQueuedCompletionStatus()...
++}
++
++bool GNUmakeTokenPoolWin32::TokenIsAvailable(ULONG_PTR key) {
++  // alert child thread to break wait on token semaphore
++  QueueUserAPC(&NoopAPCFunc, child_, (ULONG_PTR)NULL);
++
++  // return true when GetQueuedCompletionStatus() returned our key
++  return key == (ULONG_PTR) this;
++}
++
++void GNUmakeTokenPoolWin32::ReleaseSemaphore(HANDLE semaphore) {
++  if (!::ReleaseSemaphore(semaphore, 1, NULL))
++    Win32Fatal("ReleaseSemaphore");
++}
++
++void GNUmakeTokenPoolWin32::WaitForObject(HANDLE object) {
++  if (WaitForSingleObject(object, INFINITE) != WAIT_OBJECT_0)
++    Win32Fatal("WaitForSingleObject");
++}
++
++struct TokenPool *TokenPool::Get() {
++  return new GNUmakeTokenPoolWin32;
++}
+diff --git a/src/tokenpool-gnu-make.cc b/src/tokenpool-gnu-make.cc
+index 4132bb0..92ff611 100644
+--- a/src/tokenpool-gnu-make.cc
++++ b/src/tokenpool-gnu-make.cc
+@@ -12,101 +12,26 @@
+ // See the License for the specific language governing permissions and
+ // limitations under the License.
+ 
+-#include "tokenpool.h"
++#include "tokenpool-gnu-make.h"
+ 
+-#include <errno.h>
+-#include <fcntl.h>
+-#include <poll.h>
+-#include <unistd.h>
+-#include <signal.h>
+-#include <sys/time.h>
++#include <stdlib.h>
+ #include <stdio.h>
+ #include <string.h>
+-#include <stdlib.h>
+ 
+ #include "line_printer.h"
+ 
+-// TokenPool implementation for GNU make jobserver
+-// (http://make.mad-scientist.net/papers/jobserver-implementation/)
+-struct GNUmakeTokenPool : public TokenPool {
+-  GNUmakeTokenPool();
+-  virtual ~GNUmakeTokenPool();
+-
+-  virtual bool Acquire();
+-  virtual void Reserve();
+-  virtual void Release();
+-  virtual void Clear();
+-  virtual int GetMonitorFd();
+-
+-  bool Setup(bool ignore, bool verbose, double& max_load_average);
+-
+- private:
+-  int available_;
+-  int used_;
+-
+-#ifdef _WIN32
+-  // @TODO
+-#else
+-  int rfd_;
+-  int wfd_;
+-
+-  struct sigaction old_act_;
+-  bool restore_;
+-
+-  static int dup_rfd_;
+-  static void CloseDupRfd(int signum);
+-
+-  bool CheckFd(int fd);
+-  bool SetAlarmHandler();
+-#endif
+-
+-  void Return();
+-};
+-
++// TokenPool implementation for GNU make jobserver - common bits
+ // every instance owns an implicit token -> available_ == 1
+-GNUmakeTokenPool::GNUmakeTokenPool() : available_(1), used_(0),
+-                                       rfd_(-1), wfd_(-1), restore_(false) {
++GNUmakeTokenPool::GNUmakeTokenPool() : available_(1), used_(0) {
+ }
+ 
+ GNUmakeTokenPool::~GNUmakeTokenPool() {
+-  Clear();
+-  if (restore_)
+-    sigaction(SIGALRM, &old_act_, NULL);
+-}
+-
+-bool GNUmakeTokenPool::CheckFd(int fd) {
+-  if (fd < 0)
+-    return false;
+-  int ret = fcntl(fd, F_GETFD);
+-  if (ret < 0)
+-    return false;
+-  return true;
+-}
+-
+-int GNUmakeTokenPool::dup_rfd_ = -1;
+-
+-void GNUmakeTokenPool::CloseDupRfd(int signum) {
+-  close(dup_rfd_);
+-  dup_rfd_ = -1;
+-}
+-
+-bool GNUmakeTokenPool::SetAlarmHandler() {
+-  struct sigaction act;
+-  memset(&act, 0, sizeof(act));
+-  act.sa_handler = CloseDupRfd;
+-  if (sigaction(SIGALRM, &act, &old_act_) < 0) {
+-    perror("sigaction:");
+-    return(false);
+-  } else {
+-    restore_ = true;
+-    return(true);
+-  }
+ }
+ 
+ bool GNUmakeTokenPool::Setup(bool ignore,
+                              bool verbose,
+                              double& max_load_average) {
+-  const char *value = getenv("MAKEFLAGS");
++  const char *value = GetEnv("MAKEFLAGS");
+   if (value) {
+     // GNU make <= 4.1
+     const char *jobserver = strstr(value, "--jobserver-fds=");
+@@ -119,20 +44,13 @@ bool GNUmakeTokenPool::Setup(bool ignore,
+       if (ignore) {
+         printer.PrintOnNewLine("ninja: warning: -jN forced on command line; ignoring GNU make jobserver.\n");
+       } else {
+-        int rfd = -1;
+-        int wfd = -1;
+-        if ((sscanf(jobserver, "%*[^=]=%d,%d", &rfd, &wfd) == 2) &&
+-            CheckFd(rfd) &&
+-            CheckFd(wfd) &&
+-            SetAlarmHandler()) {
++        if (ParseAuth(jobserver)) {
+           const char *l_arg = strstr(value, " -l");
+           int load_limit = -1;
+ 
+           if (verbose) {
+             printer.PrintOnNewLine("ninja: using GNU make jobserver.\n");
+           }
+-          rfd_ = rfd;
+-          wfd_ = wfd;
+ 
+           // translate GNU make -lN to ninja -lN
+           if (l_arg &&
+@@ -154,83 +72,14 @@ bool GNUmakeTokenPool::Acquire() {
+   if (available_ > 0)
+     return true;
+ 
+-  // Please read
+-  //
+-  //   http://make.mad-scientist.net/papers/jobserver-implementation/
+-  //
+-  // for the reasoning behind the following code.
+-  //
+-  // Try to read one character from the pipe. Returns true on success.
+-  //
+-  // First check if read() would succeed without blocking.
+-#ifdef USE_PPOLL
+-  pollfd pollfds[] = {{rfd_, POLLIN, 0}};
+-  int ret = poll(pollfds, 1, 0);
+-#else
+-  fd_set set;
+-  struct timeval timeout = { 0, 0 };
+-  FD_ZERO(&set);
+-  FD_SET(rfd_, &set);
+-  int ret = select(rfd_ + 1, &set, NULL, NULL, &timeout);
+-#endif
+-  if (ret > 0) {
+-    // Handle potential race condition:
+-    //  - the above check succeeded, i.e. read() should not block
+-    //  - the character disappears before we call read()
+-    //
+-    // Create a duplicate of rfd_. The duplicate file descriptor dup_rfd_
+-    // can safely be closed by signal handlers without affecting rfd_.
+-    dup_rfd_ = dup(rfd_);
+-
+-    if (dup_rfd_ != -1) {
+-      struct sigaction act, old_act;
+-      int ret = 0;
+-
+-      // Temporarily replace SIGCHLD handler with our own
+-      memset(&act, 0, sizeof(act));
+-      act.sa_handler = CloseDupRfd;
+-      if (sigaction(SIGCHLD, &act, &old_act) == 0) {
+-        struct itimerval timeout;
+-
+-        // install a 100ms timeout that generates SIGALARM on expiration
+-        memset(&timeout, 0, sizeof(timeout));
+-        timeout.it_value.tv_usec = 100 * 1000; // [ms] -> [usec]
+-        if (setitimer(ITIMER_REAL, &timeout, NULL) == 0) {
+-          char buf;
+-
+-          // Now try to read() from dup_rfd_. Return values from read():
+-          //
+-          // 1. token read                               ->  1
+-          // 2. pipe closed                              ->  0
+-          // 3. alarm expires                            -> -1 (EINTR)
+-          // 4. child exits                              -> -1 (EINTR)
+-          // 5. alarm expired before entering read()     -> -1 (EBADF)
+-          // 6. child exited before entering read()      -> -1 (EBADF)
+-          // 7. child exited before handler is installed -> go to 1 - 3
+-          ret = read(dup_rfd_, &buf, 1);
+-
+-          // disarm timer
+-          memset(&timeout, 0, sizeof(timeout));
+-          setitimer(ITIMER_REAL, &timeout, NULL);
+-        }
+-
+-        sigaction(SIGCHLD, &old_act, NULL);
+-      }
+-
+-      CloseDupRfd(0);
+-
+-      // Case 1 from above list
+-      if (ret > 0) {
+-        available_++;
+-        return true;
+-      }
+-    }
++  if (AcquireToken()) {
++    // token acquired
++    available_++;
++    return true;
++  } else {
++    // no token available
++    return false;
+   }
+-
+-  // read() would block, i.e. no token available,
+-  // cases 2-6 from above list or
+-  // select() / poll() / dup() / sigaction() / setitimer() failed
+-  return false;
+ }
+ 
+ void GNUmakeTokenPool::Reserve() {
+@@ -239,15 +88,8 @@ void GNUmakeTokenPool::Reserve() {
+ }
+ 
+ void GNUmakeTokenPool::Return() {
+-  const char buf = '+';
+-  while (1) {
+-    int ret = write(wfd_, &buf, 1);
+-    if (ret > 0)
+-      available_--;
+-    if ((ret != -1) || (errno != EINTR))
+-      return;
+-    // write got interrupted - retry
+-  }
++  if (ReturnToken())
++    available_--;
+ }
+ 
+ void GNUmakeTokenPool::Release() {
+@@ -263,18 +105,3 @@ void GNUmakeTokenPool::Clear() {
+   while (available_ > 1)
+     Return();
+ }
+-
+-int GNUmakeTokenPool::GetMonitorFd() {
+-  return(rfd_);
+-}
+-
+-struct TokenPool *TokenPool::Get(bool ignore,
+-                                 bool verbose,
+-                                 double& max_load_average) {
+-  GNUmakeTokenPool *tokenpool = new GNUmakeTokenPool;
+-  if (tokenpool->Setup(ignore, verbose, max_load_average))
+-    return tokenpool;
+-  else
+-    delete tokenpool;
+-  return NULL;
+-}
+diff --git a/src/tokenpool-gnu-make.h b/src/tokenpool-gnu-make.h
+new file mode 100644
+index 0000000..d385208
+--- /dev/null
++++ b/src/tokenpool-gnu-make.h
+@@ -0,0 +1,40 @@
++// Copyright 2016-2018 Google Inc. All Rights Reserved.
++//
++// Licensed under the Apache License, Version 2.0 (the "License");
++// you may not use this file except in compliance with the License.
++// You may obtain a copy of the License at
++//
++//     http://www.apache.org/licenses/LICENSE-2.0
++//
++// Unless required by applicable law or agreed to in writing, software
++// distributed under the License is distributed on an "AS IS" BASIS,
++// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
++// See the License for the specific language governing permissions and
++// limitations under the License.
++
++#include "tokenpool.h"
++
++// interface to GNU make token pool
++struct GNUmakeTokenPool : public TokenPool {
++  GNUmakeTokenPool();
++  virtual ~GNUmakeTokenPool();
++
++  // token pool implementation
++  virtual bool Acquire();
++  virtual void Reserve();
++  virtual void Release();
++  virtual void Clear();
++  virtual bool Setup(bool ignore, bool verbose, double& max_load_average);
++
++  // platform specific implementation
++  virtual const char *GetEnv(const char *name) = 0;
++  virtual bool ParseAuth(const char *jobserver) = 0;
++  virtual bool AcquireToken() = 0;
++  virtual bool ReturnToken() = 0;
++
++ private:
++  int available_;
++  int used_;
++
++  void Return();
++};
+diff --git a/src/tokenpool-none.cc b/src/tokenpool-none.cc
+index 4c59287..613d168 100644
+--- a/src/tokenpool-none.cc
++++ b/src/tokenpool-none.cc
+@@ -17,8 +17,6 @@
+ #include <stdlib.h>
+ 
+ // No-op TokenPool implementation
+-struct TokenPool *TokenPool::Get(bool ignore,
+-                                 bool verbose,
+-                                 double& max_load_average) {
++struct TokenPool *TokenPool::Get() {
+   return NULL;
+ }
+diff --git a/src/tokenpool.h b/src/tokenpool.h
+index 4bf477f..1be8e1d 100644
+--- a/src/tokenpool.h
++++ b/src/tokenpool.h
+@@ -1,4 +1,4 @@
+-// Copyright 2016-2017 Google Inc. All Rights Reserved.
++// Copyright 2016-2018 Google Inc. All Rights Reserved.
+ //
+ // Licensed under the Apache License, Version 2.0 (the "License");
+ // you may not use this file except in compliance with the License.
+@@ -12,6 +12,10 @@
+ // See the License for the specific language governing permissions and
+ // limitations under the License.
+ 
++#ifdef _WIN32
++#include <windows.h>
++#endif
++
+ // interface to token pool
+ struct TokenPool {
+   virtual ~TokenPool() {}
+@@ -21,14 +25,18 @@ struct TokenPool {
+   virtual void Release() = 0;
+   virtual void Clear() = 0;
+ 
++  // returns false if token pool setup failed
++  virtual bool Setup(bool ignore, bool verbose, double& max_load_average) = 0;
++
+ #ifdef _WIN32
+-  // @TODO
++  virtual void WaitForTokenAvailability(HANDLE ioport) = 0;
++  // returns true if a token has become available
++  // key is result from GetQueuedCompletionStatus()
++  virtual bool TokenIsAvailable(ULONG_PTR key) = 0;
+ #else
+   virtual int GetMonitorFd() = 0;
+ #endif
+ 
+   // returns NULL if token pool is not available
+-  static struct TokenPool *Get(bool ignore,
+-                               bool verbose,
+-                               double& max_load_average);
++  static struct TokenPool *Get();
+ };
+diff --git a/src/tokenpool_test.cc b/src/tokenpool_test.cc
+index 6c89064..8d4fd7d 100644
+--- a/src/tokenpool_test.cc
++++ b/src/tokenpool_test.cc
+@@ -16,13 +16,25 @@
+ 
+ #include "test.h"
+ 
+-#ifndef _WIN32
++#ifdef _WIN32
++#include <windows.h>
++#else
++#include <unistd.h>
++#endif
++
+ #include <stdio.h>
+ #include <stdlib.h>
+-#include <unistd.h>
+ 
++#ifdef _WIN32
++// should contain all valid characters
++#define SEMAPHORE_NAME      "abcdefghijklmnopqrstwxyz01234567890_"
++#define AUTH_FORMAT(tmpl)   "foo " tmpl "=%s bar"
++#define ENVIRONMENT_CLEAR() SetEnvironmentVariable("MAKEFLAGS", NULL)
++#define ENVIRONMENT_INIT(v) SetEnvironmentVariable("MAKEFLAGS", v)
++#else
++#define AUTH_FORMAT(tmpl)   "foo " tmpl "=%d,%d bar"
+ #define ENVIRONMENT_CLEAR() unsetenv("MAKEFLAGS")
+-#define ENVIRONMENT_INIT(v) setenv("MAKEFLAGS", v, true);
++#define ENVIRONMENT_INIT(v) setenv("MAKEFLAGS", v, true)
+ #endif
+ 
+ namespace {
+@@ -32,43 +44,60 @@ const double kLoadAverageDefault = -1.23456789;
+ struct TokenPoolTest : public testing::Test {
+   double load_avg_;
+   TokenPool *tokens_;
+-#ifndef _WIN32
+   char buf_[1024];
++#ifdef _WIN32
++  const char *semaphore_name_;
++  HANDLE semaphore_;
++#else
+   int fds_[2];
+ #endif
+ 
+   virtual void SetUp() {
+     load_avg_ = kLoadAverageDefault;
+     tokens_ = NULL;
+-#ifndef _WIN32
+     ENVIRONMENT_CLEAR();
++#ifdef _WIN32
++    semaphore_name_ = SEMAPHORE_NAME;
++    if ((semaphore_ = CreateSemaphore(0, 0, 2, SEMAPHORE_NAME)) == NULL)
++#else
+     if (pipe(fds_) < 0)
++#endif
+       ASSERT_TRUE(false);
+-#endif
+   }
+ 
+-  void CreatePool(const char *format, bool ignore_jobserver) {
+-#ifndef _WIN32
++  void CreatePool(const char *format, bool ignore_jobserver = false) {
+     if (format) {
+-      sprintf(buf_, format, fds_[0], fds_[1]);
++      sprintf(buf_, format,
++#ifdef _WIN32
++              semaphore_name_
++#else
++              fds_[0], fds_[1]
++#endif
++      );
+       ENVIRONMENT_INIT(buf_);
+     }
+-#endif
+-    tokens_ = TokenPool::Get(ignore_jobserver, false, load_avg_);
++    if ((tokens_ = TokenPool::Get()) != NULL) {
++      if (!tokens_->Setup(ignore_jobserver, false, load_avg_)) {
++        delete tokens_;
++        tokens_ = NULL;
++      }
++    }
+   }
+ 
+   void CreateDefaultPool() {
+-    CreatePool("foo --jobserver-auth=%d,%d bar", false);
++    CreatePool(AUTH_FORMAT("--jobserver-auth"));
+   }
+ 
+   virtual void TearDown() {
+     if (tokens_)
+       delete tokens_;
+-#ifndef _WIN32
++#ifdef _WIN32
++    CloseHandle(semaphore_);
++#else
+     close(fds_[0]);
+     close(fds_[1]);
+-    ENVIRONMENT_CLEAR();
+ #endif
++    ENVIRONMENT_CLEAR();
+   }
+ };
+ 
+@@ -82,10 +111,9 @@ TEST_F(TokenPoolTest, NoTokenPool) {
+   EXPECT_EQ(kLoadAverageDefault, load_avg_);
+ }
+ 
+-#ifndef _WIN32
+ TEST_F(TokenPoolTest, SuccessfulOldSetup) {
+   // GNUmake <= 4.1
+-  CreatePool("foo --jobserver-fds=%d,%d bar", false);
++  CreatePool(AUTH_FORMAT("--jobserver-fds"));
+ 
+   EXPECT_NE(NULL, tokens_);
+   EXPECT_EQ(kLoadAverageDefault, load_avg_);
+@@ -100,19 +128,37 @@ TEST_F(TokenPoolTest, SuccessfulNewSetup) {
+ }
+ 
+ TEST_F(TokenPoolTest, IgnoreWithJN) {
+-  CreatePool("foo --jobserver-auth=%d,%d bar", true);
++  CreatePool(AUTH_FORMAT("--jobserver-auth"), true);
+ 
+   EXPECT_EQ(NULL, tokens_);
+   EXPECT_EQ(kLoadAverageDefault, load_avg_);
+ }
+ 
+ TEST_F(TokenPoolTest, HonorLN) {
+-  CreatePool("foo -l9 --jobserver-auth=%d,%d bar", false);
++  CreatePool(AUTH_FORMAT("-l9 --jobserver-auth"));
+ 
+   EXPECT_NE(NULL, tokens_);
+   EXPECT_EQ(9.0, load_avg_);
+ }
+ 
++#ifdef _WIN32
++TEST_F(TokenPoolTest, SemaphoreNotFound) {
++  semaphore_name_ = SEMAPHORE_NAME "_foobar";
++  CreateDefaultPool();
++
++  EXPECT_EQ(NULL, tokens_);
++  EXPECT_EQ(kLoadAverageDefault, load_avg_);
++}
++
++TEST_F(TokenPoolTest, TokenIsAvailable) {
++  CreateDefaultPool();
++
++  ASSERT_NE(NULL, tokens_);
++  EXPECT_EQ(kLoadAverageDefault, load_avg_);
++
++  EXPECT_TRUE(tokens_->TokenIsAvailable((ULONG_PTR)tokens_));
++}
++#else
+ TEST_F(TokenPoolTest, MonitorFD) {
+   CreateDefaultPool();
+ 
+@@ -121,6 +167,7 @@ TEST_F(TokenPoolTest, MonitorFD) {
+ 
+   EXPECT_EQ(fds_[0], tokens_->GetMonitorFd());
+ }
++#endif
+ 
+ TEST_F(TokenPoolTest, ImplicitToken) {
+   CreateDefaultPool();
+@@ -147,7 +194,13 @@ TEST_F(TokenPoolTest, TwoTokens) {
+   EXPECT_FALSE(tokens_->Acquire());
+ 
+   // jobserver offers 2nd token
++#ifdef _WIN32
++  LONG previous;
++  ASSERT_TRUE(ReleaseSemaphore(semaphore_, 1, &previous));
++  ASSERT_EQ(0, previous);
++#else
+   ASSERT_EQ(1u, write(fds_[1], "T", 1));
++#endif
+   EXPECT_TRUE(tokens_->Acquire());
+   tokens_->Reserve();
+   EXPECT_FALSE(tokens_->Acquire());
+@@ -160,8 +213,14 @@ TEST_F(TokenPoolTest, TwoTokens) {
+   tokens_->Release();
+   EXPECT_TRUE(tokens_->Acquire());
+ 
+-  // there must be one token in the pipe
++  // there must be one token available
++#ifdef _WIN32
++  EXPECT_EQ(WAIT_OBJECT_0, WaitForSingleObject(semaphore_, 0));
++  EXPECT_TRUE(ReleaseSemaphore(semaphore_, 1, &previous));
++  EXPECT_EQ(0, previous);
++#else
+   EXPECT_EQ(1u, read(fds_[0], buf_, sizeof(buf_)));
++#endif
+ 
+   // implicit token
+   EXPECT_TRUE(tokens_->Acquire());
+@@ -179,7 +238,13 @@ TEST_F(TokenPoolTest, Clear) {
+   EXPECT_FALSE(tokens_->Acquire());
+ 
+   // jobserver offers 2nd & 3rd token
++#ifdef _WIN32
++  LONG previous;
++  ASSERT_TRUE(ReleaseSemaphore(semaphore_, 2, &previous));
++  ASSERT_EQ(0, previous);
++#else
+   ASSERT_EQ(2u, write(fds_[1], "TT", 2));
++#endif
+   EXPECT_TRUE(tokens_->Acquire());
+   tokens_->Reserve();
+   EXPECT_TRUE(tokens_->Acquire());
+@@ -189,10 +254,16 @@ TEST_F(TokenPoolTest, Clear) {
+   tokens_->Clear();
+   EXPECT_TRUE(tokens_->Acquire());
+ 
+-  // there must be two tokens in the pipe
++  // there must be two tokens available
++#ifdef _WIN32
++  EXPECT_EQ(WAIT_OBJECT_0, WaitForSingleObject(semaphore_, 0));
++  EXPECT_EQ(WAIT_OBJECT_0, WaitForSingleObject(semaphore_, 0));
++  EXPECT_TRUE(ReleaseSemaphore(semaphore_, 2, &previous));
++  EXPECT_EQ(0, previous);
++#else
+   EXPECT_EQ(2u, read(fds_[0], buf_, sizeof(buf_)));
++#endif
+ 
+   // implicit token
+   EXPECT_TRUE(tokens_->Acquire());
+ }
+-#endif
+-- 
+2.44.0
+
diff --git a/meta/recipes-devtools/ninja/files/0011-Prepare-PR-for-merging-part-II.patch b/meta/recipes-devtools/ninja/files/0011-Prepare-PR-for-merging-part-II.patch
new file mode 100644
index 0000000000..62c5be39e1
--- /dev/null
+++ b/meta/recipes-devtools/ninja/files/0011-Prepare-PR-for-merging-part-II.patch
@@ -0,0 +1,744 @@
+From 05d39cb09c12608249dc0ec18c52ab21299fcb0f Mon Sep 17 00:00:00 2001
+From: Stefan Becker <chemobejk@gmail.com>
+Date: Fri, 14 Dec 2018 13:27:11 +0200
+Subject: [PATCH 11/20] Prepare PR for merging - part II
+
+- remove unnecessary "struct" from TokenPool
+- add PAPCFUNC cast to QueryUserAPC()
+- remove hard-coded MAKEFLAGS string from win32
+- remove useless build test CompleteNoWork
+- rename TokenPoolTest to TestTokenPool
+- add tokenpool modules to CMake build
+- remove unused no-op TokenPool implementation
+- fix errors flagged by codespell & clang-tidy
+- POSIX GNUmakeTokenPool should return same token
+- address review comments from
+
+https://github.com/ninja-build/ninja/pull/1140#discussion_r1004798172
+https://github.com/ninja-build/ninja/pull/1140#pullrequestreview-195195803
+https://github.com/ninja-build/ninja/pull/1140#pullrequestreview-185089255
+https://github.com/ninja-build/ninja/pull/1140#issuecomment-473898963
+https://github.com/ninja-build/ninja/pull/1140#issuecomment-596624610
+
+Upstream-Status: Submitted [https://github.com/ninja-build/ninja/pull/1140]
+---
+ CMakeLists.txt                  |  8 ++++-
+ src/build.cc                    |  2 +-
+ src/build_test.cc               | 12 +------
+ src/subprocess-posix.cc         |  4 +--
+ src/subprocess-win32.cc         |  2 +-
+ src/subprocess.h                |  2 +-
+ src/subprocess_test.cc          | 26 +++++++--------
+ src/tokenpool-gnu-make-posix.cc | 45 ++++++++++++++++----------
+ src/tokenpool-gnu-make-win32.cc | 36 +++++++++++----------
+ src/tokenpool-gnu-make.cc       | 57 +++++++++++++++++----------------
+ src/tokenpool-gnu-make.h        |  6 ++--
+ src/tokenpool-none.cc           | 22 -------------
+ src/tokenpool.h                 |  2 +-
+ src/tokenpool_test.cc           | 22 +++++++++----
+ 14 files changed, 122 insertions(+), 124 deletions(-)
+ delete mode 100644 src/tokenpool-none.cc
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index 98f7948..1a40a88 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -118,6 +118,7 @@ add_library(libninja OBJECT
+ 	src/state.cc
+ 	src/status.cc
+ 	src/string_piece_util.cc
++	src/tokenpool-gnu-make.cc
+ 	src/util.cc
+ 	src/version.cc
+ )
+@@ -129,13 +130,17 @@ if(WIN32)
+ 		src/msvc_helper_main-win32.cc
+ 		src/getopt.c
+ 		src/minidump-win32.cc
++		src/tokenpool-gnu-make-win32.cc
+ 	)
+ 	# Build getopt.c, which can be compiled as either C or C++, as C++
+ 	# so that build environments which lack a C compiler, but have a C++
+ 	# compiler may build ninja.
+ 	set_source_files_properties(src/getopt.c PROPERTIES LANGUAGE CXX)
+ else()
+-	target_sources(libninja PRIVATE src/subprocess-posix.cc)
++	target_sources(libninja PRIVATE
++		src/subprocess-posix.cc
++		src/tokenpool-gnu-make-posix.cc
++	)
+ 	if(CMAKE_SYSTEM_NAME STREQUAL "OS400" OR CMAKE_SYSTEM_NAME STREQUAL "AIX")
+ 		target_sources(libninja PRIVATE src/getopt.c)
+ 		# Build getopt.c, which can be compiled as either C or C++, as C++
+@@ -224,6 +229,7 @@ if(BUILD_TESTING)
+     src/string_piece_util_test.cc
+     src/subprocess_test.cc
+     src/test.cc
++    src/tokenpool_test.cc
+     src/util_test.cc
+   )
+   if(WIN32)
+diff --git a/src/build.cc b/src/build.cc
+index 0763dd5..4bf5557 100644
+--- a/src/build.cc
++++ b/src/build.cc
+@@ -467,7 +467,7 @@ struct RealCommandRunner : public CommandRunner {
+   // copy of config_.max_load_average; can be modified by TokenPool setup
+   double max_load_average_;
+   SubprocessSet subprocs_;
+-  TokenPool *tokens_;
++  TokenPool* tokens_;
+   map<const Subprocess*, Edge*> subproc_to_edge_;
+ };
+ 
+diff --git a/src/build_test.cc b/src/build_test.cc
+index 0ef6ece..4d34066 100644
+--- a/src/build_test.cc
++++ b/src/build_test.cc
+@@ -4406,7 +4406,7 @@ struct BuildTokenTest : public BuildTest {
+   void ExpectWaitForCommand(int count, ...);
+ 
+ private:
+-  void EnqueueBooleans(vector<bool>& booleans, int count, va_list ao);
++  void EnqueueBooleans(vector<bool>& booleans, int count, va_list ap);
+ };
+ 
+ void BuildTokenTest::SetUp() {
+@@ -4452,16 +4452,6 @@ void BuildTokenTest::EnqueueBooleans(vector<bool>& booleans, int count, va_list
+   }
+ }
+ 
+-TEST_F(BuildTokenTest, CompleteNoWork) {
+-  // plan should not execute anything
+-  string err;
+-
+-  EXPECT_TRUE(builder_.Build(&err));
+-  EXPECT_EQ("", err);
+-
+-  EXPECT_EQ(0u, token_command_runner_.commands_ran_.size());
+-}
+-
+ TEST_F(BuildTokenTest, DoNotAquireToken) {
+   // plan should execute one command
+   string err;
+diff --git a/src/subprocess-posix.cc b/src/subprocess-posix.cc
+index 74451b0..3183927 100644
+--- a/src/subprocess-posix.cc
++++ b/src/subprocess-posix.cc
+@@ -250,7 +250,7 @@ Subprocess *SubprocessSet::Add(const string& command, bool use_console) {
+ }
+ 
+ #ifdef USE_PPOLL
+-bool SubprocessSet::DoWork(struct TokenPool* tokens) {
++bool SubprocessSet::DoWork(TokenPool* tokens) {
+   vector<pollfd> fds;
+   nfds_t nfds = 0;
+ 
+@@ -315,7 +315,7 @@ bool SubprocessSet::DoWork(struct TokenPool* tokens) {
+ }
+ 
+ #else  // !defined(USE_PPOLL)
+-bool SubprocessSet::DoWork(struct TokenPool* tokens) {
++bool SubprocessSet::DoWork(TokenPool* tokens) {
+   fd_set set;
+   int nfds = 0;
+   FD_ZERO(&set);
+diff --git a/src/subprocess-win32.cc b/src/subprocess-win32.cc
+index ce3e2c2..2926e9a 100644
+--- a/src/subprocess-win32.cc
++++ b/src/subprocess-win32.cc
+@@ -252,7 +252,7 @@ Subprocess *SubprocessSet::Add(const string& command, bool use_console) {
+   return subprocess;
+ }
+ 
+-bool SubprocessSet::DoWork(struct TokenPool* tokens) {
++bool SubprocessSet::DoWork(TokenPool* tokens) {
+   DWORD bytes_read;
+   Subprocess* subproc;
+   OVERLAPPED* overlapped;
+diff --git a/src/subprocess.h b/src/subprocess.h
+index 9ea67ea..1ec7817 100644
+--- a/src/subprocess.h
++++ b/src/subprocess.h
+@@ -86,7 +86,7 @@ struct SubprocessSet {
+   ~SubprocessSet();
+ 
+   Subprocess* Add(const std::string& command, bool use_console = false);
+-  bool DoWork(struct TokenPool* tokens);
++  bool DoWork(TokenPool* tokens);
+   Subprocess* NextFinished();
+   void Clear();
+ 
+diff --git a/src/subprocess_test.cc b/src/subprocess_test.cc
+index f625963..7b146f3 100644
+--- a/src/subprocess_test.cc
++++ b/src/subprocess_test.cc
+@@ -35,7 +35,7 @@ const char* kSimpleCommand = "cmd /c dir \\";
+ const char* kSimpleCommand = "ls /";
+ #endif
+ 
+-struct TokenPoolTest : public TokenPool {
++struct TestTokenPool : public TokenPool {
+   bool Acquire()     { return false; }
+   void Reserve()     {}
+   void Release()     {}
+@@ -58,7 +58,7 @@ struct TokenPoolTest : public TokenPool {
+ 
+ struct SubprocessTest : public testing::Test {
+   SubprocessSet subprocs_;
+-  TokenPoolTest tokens_;
++  TestTokenPool tokens_;
+ };
+ 
+ }  // anonymous namespace
+@@ -73,7 +73,7 @@ TEST_F(SubprocessTest, BadCommandStderr) {
+     // Pretend we discovered that stderr was ready for writing.
+     subprocs_.DoWork(NULL);
+   }
+-  ASSERT_EQ(false, subprocs_.IsTokenAvailable());
++  ASSERT_FALSE(subprocs_.IsTokenAvailable());
+ 
+   EXPECT_EQ(ExitFailure, subproc->Finish());
+   EXPECT_NE("", subproc->GetOutput());
+@@ -89,7 +89,7 @@ TEST_F(SubprocessTest, NoSuchCommand) {
+     // Pretend we discovered that stderr was ready for writing.
+     subprocs_.DoWork(NULL);
+   }
+-  ASSERT_EQ(false, subprocs_.IsTokenAvailable());
++  ASSERT_FALSE(subprocs_.IsTokenAvailable());
+ 
+   EXPECT_EQ(ExitFailure, subproc->Finish());
+   EXPECT_NE("", subproc->GetOutput());
+@@ -109,7 +109,7 @@ TEST_F(SubprocessTest, InterruptChild) {
+   while (!subproc->Done()) {
+     subprocs_.DoWork(NULL);
+   }
+-  ASSERT_EQ(false, subprocs_.IsTokenAvailable());
++  ASSERT_FALSE(subprocs_.IsTokenAvailable());
+ 
+   EXPECT_EQ(ExitInterrupted, subproc->Finish());
+ }
+@@ -135,7 +135,7 @@ TEST_F(SubprocessTest, InterruptChildWithSigTerm) {
+   while (!subproc->Done()) {
+     subprocs_.DoWork(NULL);
+   }
+-  ASSERT_EQ(false, subprocs_.IsTokenAvailable());
++  ASSERT_FALSE(subprocs_.IsTokenAvailable());
+ 
+   EXPECT_EQ(ExitInterrupted, subproc->Finish());
+ }
+@@ -161,7 +161,7 @@ TEST_F(SubprocessTest, InterruptChildWithSigHup) {
+   while (!subproc->Done()) {
+     subprocs_.DoWork(NULL);
+   }
+-  ASSERT_EQ(false, subprocs_.IsTokenAvailable());
++  ASSERT_FALSE(subprocs_.IsTokenAvailable());
+ 
+   EXPECT_EQ(ExitInterrupted, subproc->Finish());
+ }
+@@ -190,7 +190,7 @@ TEST_F(SubprocessTest, Console) {
+     while (!subproc->Done()) {
+       subprocs_.DoWork(NULL);
+     }
+-    ASSERT_EQ(false, subprocs_.IsTokenAvailable());
++    ASSERT_FALSE(subprocs_.IsTokenAvailable());
+ 
+     EXPECT_EQ(ExitSuccess, subproc->Finish());
+   }
+@@ -206,7 +206,7 @@ TEST_F(SubprocessTest, SetWithSingle) {
+   while (!subproc->Done()) {
+     subprocs_.DoWork(NULL);
+   }
+-  ASSERT_EQ(false, subprocs_.IsTokenAvailable());
++  ASSERT_FALSE(subprocs_.IsTokenAvailable());
+   ASSERT_EQ(ExitSuccess, subproc->Finish());
+   ASSERT_NE("", subproc->GetOutput());
+ 
+@@ -243,7 +243,7 @@ TEST_F(SubprocessTest, SetWithMulti) {
+     ASSERT_GT(subprocs_.running_.size(), 0u);
+     subprocs_.DoWork(NULL);
+   }
+-  ASSERT_EQ(false, subprocs_.IsTokenAvailable());
++  ASSERT_FALSE(subprocs_.IsTokenAvailable());
+   ASSERT_EQ(0u, subprocs_.running_.size());
+   ASSERT_EQ(3u, subprocs_.finished_.size());
+ 
+@@ -278,7 +278,7 @@ TEST_F(SubprocessTest, SetWithLots) {
+   subprocs_.ResetTokenAvailable();
+   while (!subprocs_.running_.empty())
+     subprocs_.DoWork(NULL);
+-  ASSERT_EQ(false, subprocs_.IsTokenAvailable());
++  ASSERT_FALSE(subprocs_.IsTokenAvailable());
+   for (size_t i = 0; i < procs.size(); ++i) {
+     ASSERT_EQ(ExitSuccess, procs[i]->Finish());
+     ASSERT_NE("", procs[i]->GetOutput());
+@@ -298,7 +298,7 @@ TEST_F(SubprocessTest, ReadStdin) {
+   while (!subproc->Done()) {
+     subprocs_.DoWork(NULL);
+   }
+-  ASSERT_EQ(false, subprocs_.IsTokenAvailable());
++  ASSERT_FALSE(subprocs_.IsTokenAvailable());
+   ASSERT_EQ(ExitSuccess, subproc->Finish());
+   ASSERT_EQ(1u, subprocs_.finished_.size());
+ }
+@@ -322,7 +322,7 @@ TEST_F(SubprocessTest, TokenAvailable) {
+   subprocs_.DoWork(&tokens_);
+ #ifdef _WIN32
+   tokens_._token_available = false;
+-  // we need to loop here as we have no conrol where the token
++  // we need to loop here as we have no control where the token
+   // I/O completion post ends up in the queue
+   while (!subproc->Done() && !subprocs_.IsTokenAvailable()) {
+     subprocs_.DoWork(&tokens_);
+diff --git a/src/tokenpool-gnu-make-posix.cc b/src/tokenpool-gnu-make-posix.cc
+index 70d84bf..4f43676 100644
+--- a/src/tokenpool-gnu-make-posix.cc
++++ b/src/tokenpool-gnu-make-posix.cc
+@@ -23,6 +23,7 @@
+ #include <stdio.h>
+ #include <string.h>
+ #include <stdlib.h>
++#include <stack>
+ 
+ // TokenPool implementation for GNU make jobserver - POSIX implementation
+ // (http://make.mad-scientist.net/papers/jobserver-implementation/)
+@@ -32,8 +33,8 @@ struct GNUmakeTokenPoolPosix : public GNUmakeTokenPool {
+ 
+   virtual int GetMonitorFd();
+ 
+-  virtual const char *GetEnv(const char *name) { return getenv(name); };
+-  virtual bool ParseAuth(const char *jobserver);
++  virtual const char* GetEnv(const char* name) { return getenv(name); };
++  virtual bool ParseAuth(const char* jobserver);
+   virtual bool AcquireToken();
+   virtual bool ReturnToken();
+ 
+@@ -44,6 +45,16 @@ struct GNUmakeTokenPoolPosix : public GNUmakeTokenPool {
+   struct sigaction old_act_;
+   bool restore_;
+ 
++  // See https://www.gnu.org/software/make/manual/html_node/POSIX-Jobserver.html
++  //
++  //   It’s important that when you release the job slot, you write back
++  //   the same character you read. Don’t assume that all tokens are the
++  //   same character different characters may have different meanings to
++  //   GNU make. The order is not important, since make has no idea in
++  //   what order jobs will complete anyway.
++  //
++  std::stack<char> tokens_;
++
+   static int dup_rfd_;
+   static void CloseDupRfd(int signum);
+ 
+@@ -64,9 +75,7 @@ bool GNUmakeTokenPoolPosix::CheckFd(int fd) {
+   if (fd < 0)
+     return false;
+   int ret = fcntl(fd, F_GETFD);
+-  if (ret < 0)
+-    return false;
+-  return true;
++  return ret >= 0;
+ }
+ 
+ int GNUmakeTokenPoolPosix::dup_rfd_ = -1;
+@@ -82,14 +91,13 @@ bool GNUmakeTokenPoolPosix::SetAlarmHandler() {
+   act.sa_handler = CloseDupRfd;
+   if (sigaction(SIGALRM, &act, &old_act_) < 0) {
+     perror("sigaction:");
+-    return(false);
+-  } else {
+-    restore_ = true;
+-    return(true);
++    return false;
+   }
++  restore_ = true;
++  return true;
+ }
+ 
+-bool GNUmakeTokenPoolPosix::ParseAuth(const char *jobserver) {
++bool GNUmakeTokenPoolPosix::ParseAuth(const char* jobserver) {
+   int rfd = -1;
+   int wfd = -1;
+   if ((sscanf(jobserver, "%*[^=]=%d,%d", &rfd, &wfd) == 2) &&
+@@ -136,6 +144,7 @@ bool GNUmakeTokenPoolPosix::AcquireToken() {
+     if (dup_rfd_ != -1) {
+       struct sigaction act, old_act;
+       int ret = 0;
++      char buf;
+ 
+       // Temporarily replace SIGCHLD handler with our own
+       memset(&act, 0, sizeof(act));
+@@ -147,8 +156,6 @@ bool GNUmakeTokenPoolPosix::AcquireToken() {
+         memset(&timeout, 0, sizeof(timeout));
+         timeout.it_value.tv_usec = 100 * 1000; // [ms] -> [usec]
+         if (setitimer(ITIMER_REAL, &timeout, NULL) == 0) {
+-          char buf;
+-
+           // Now try to read() from dup_rfd_. Return values from read():
+           //
+           // 1. token read                               ->  1
+@@ -171,8 +178,10 @@ bool GNUmakeTokenPoolPosix::AcquireToken() {
+       CloseDupRfd(0);
+ 
+       // Case 1 from above list
+-      if (ret > 0)
++      if (ret > 0) {
++        tokens_.push(buf);
+         return true;
++      }
+     }
+   }
+ 
+@@ -183,11 +192,13 @@ bool GNUmakeTokenPoolPosix::AcquireToken() {
+ }
+ 
+ bool GNUmakeTokenPoolPosix::ReturnToken() {
+-  const char buf = '+';
++  const char buf = tokens_.top();
+   while (1) {
+     int ret = write(wfd_, &buf, 1);
+-    if (ret > 0)
++    if (ret > 0) {
++      tokens_.pop();
+       return true;
++    }
+     if ((ret != -1) || (errno != EINTR))
+       return false;
+     // write got interrupted - retry
+@@ -195,9 +206,9 @@ bool GNUmakeTokenPoolPosix::ReturnToken() {
+ }
+ 
+ int GNUmakeTokenPoolPosix::GetMonitorFd() {
+-  return(rfd_);
++  return rfd_;
+ }
+ 
+-struct TokenPool *TokenPool::Get() {
++TokenPool* TokenPool::Get() {
+   return new GNUmakeTokenPoolPosix;
+ }
+diff --git a/src/tokenpool-gnu-make-win32.cc b/src/tokenpool-gnu-make-win32.cc
+index 2719f2c..b2bb52f 100644
+--- a/src/tokenpool-gnu-make-win32.cc
++++ b/src/tokenpool-gnu-make-win32.cc
+@@ -14,7 +14,8 @@
+ 
+ #include "tokenpool-gnu-make.h"
+ 
+-// always include first to make sure other headers do the correct thing...
++// Always include this first.
++// Otherwise the other system headers don't work correctly under Win32
+ #include <windows.h>
+ 
+ #include <ctype.h>
+@@ -32,8 +33,8 @@ struct GNUmakeTokenPoolWin32 : public GNUmakeTokenPool {
+   virtual void WaitForTokenAvailability(HANDLE ioport);
+   virtual bool TokenIsAvailable(ULONG_PTR key);
+ 
+-  virtual const char *GetEnv(const char *name);
+-  virtual bool ParseAuth(const char *jobserver);
++  virtual const char* GetEnv(const char* name);
++  virtual bool ParseAuth(const char* jobserver);
+   virtual bool AcquireToken();
+   virtual bool ReturnToken();
+ 
+@@ -98,19 +99,19 @@ GNUmakeTokenPoolWin32::~GNUmakeTokenPoolWin32() {
+   }
+ }
+ 
+-const char *GNUmakeTokenPoolWin32::GetEnv(const char *name) {
++const char* GNUmakeTokenPoolWin32::GetEnv(const char* name) {
+   // getenv() does not work correctly together with tokenpool_tests.cc
+   static char buffer[MAX_PATH + 1];
+-  if (GetEnvironmentVariable("MAKEFLAGS", buffer, sizeof(buffer)) == 0)
++  if (GetEnvironmentVariable(name, buffer, sizeof(buffer)) == 0)
+     return NULL;
+-  return(buffer);
++  return buffer;
+ }
+ 
+-bool GNUmakeTokenPoolWin32::ParseAuth(const char *jobserver) {
++bool GNUmakeTokenPoolWin32::ParseAuth(const char* jobserver) {
+   // match "--jobserver-auth=gmake_semaphore_<INTEGER>..."
+-  const char *start = strchr(jobserver, '=');
++  const char* start = strchr(jobserver, '=');
+   if (start) {
+-    const char *end = start;
++    const char* end = start;
+     unsigned int len;
+     char c, *auth;
+ 
+@@ -119,14 +120,15 @@ bool GNUmakeTokenPoolWin32::ParseAuth(const char *jobserver) {
+         break;
+     len = end - start; // includes string terminator in count
+ 
+-    if ((len > 1) && ((auth = (char *)malloc(len)) != NULL)) {
++    if ((len > 1) && ((auth = (char*)malloc(len)) != NULL)) {
+       strncpy(auth, start + 1, len - 1);
+       auth[len - 1] = '\0';
+ 
+-      if ((semaphore_jobserver_ = OpenSemaphore(SEMAPHORE_ALL_ACCESS, /* Semaphore access setting */
+-                                                FALSE,                /* Child processes DON'T inherit */
+-                                                auth                  /* Semaphore name */
+-                                                )) != NULL) {
++      if ((semaphore_jobserver_ =
++           OpenSemaphore(SEMAPHORE_ALL_ACCESS, /* Semaphore access setting */
++                         FALSE,                /* Child processes DON'T inherit */
++                         auth                  /* Semaphore name */
++                        )) != NULL) {
+         free(auth);
+         return true;
+       }
+@@ -171,7 +173,7 @@ DWORD GNUmakeTokenPoolWin32::SemaphoreThread() {
+ }
+ 
+ DWORD WINAPI GNUmakeTokenPoolWin32::SemaphoreThreadWrapper(LPVOID param) {
+-  GNUmakeTokenPoolWin32 *This = (GNUmakeTokenPoolWin32 *) param;
++  GNUmakeTokenPoolWin32* This = (GNUmakeTokenPoolWin32*) param;
+   return This->SemaphoreThread();
+ }
+ 
+@@ -216,7 +218,7 @@ void GNUmakeTokenPoolWin32::WaitForTokenAvailability(HANDLE ioport) {
+ 
+ bool GNUmakeTokenPoolWin32::TokenIsAvailable(ULONG_PTR key) {
+   // alert child thread to break wait on token semaphore
+-  QueueUserAPC(&NoopAPCFunc, child_, (ULONG_PTR)NULL);
++  QueueUserAPC((PAPCFUNC)&NoopAPCFunc, child_, (ULONG_PTR)NULL);
+ 
+   // return true when GetQueuedCompletionStatus() returned our key
+   return key == (ULONG_PTR) this;
+@@ -232,6 +234,6 @@ void GNUmakeTokenPoolWin32::WaitForObject(HANDLE object) {
+     Win32Fatal("WaitForSingleObject");
+ }
+ 
+-struct TokenPool *TokenPool::Get() {
++TokenPool* TokenPool::Get() {
+   return new GNUmakeTokenPoolWin32;
+ }
+diff --git a/src/tokenpool-gnu-make.cc b/src/tokenpool-gnu-make.cc
+index 92ff611..60e0552 100644
+--- a/src/tokenpool-gnu-make.cc
++++ b/src/tokenpool-gnu-make.cc
+@@ -31,36 +31,37 @@ GNUmakeTokenPool::~GNUmakeTokenPool() {
+ bool GNUmakeTokenPool::Setup(bool ignore,
+                              bool verbose,
+                              double& max_load_average) {
+-  const char *value = GetEnv("MAKEFLAGS");
+-  if (value) {
+-    // GNU make <= 4.1
+-    const char *jobserver = strstr(value, "--jobserver-fds=");
++  const char* value = GetEnv("MAKEFLAGS");
++  if (!value)
++    return false;
++
++  // GNU make <= 4.1
++  const char* jobserver = strstr(value, "--jobserver-fds=");
++  if (!jobserver)
+     // GNU make => 4.2
+-    if (!jobserver)
+-      jobserver = strstr(value, "--jobserver-auth=");
+-    if (jobserver) {
+-      LinePrinter printer;
++    jobserver = strstr(value, "--jobserver-auth=");
++  if (jobserver) {
++    LinePrinter printer;
+ 
+-      if (ignore) {
+-        printer.PrintOnNewLine("ninja: warning: -jN forced on command line; ignoring GNU make jobserver.\n");
+-      } else {
+-        if (ParseAuth(jobserver)) {
+-          const char *l_arg = strstr(value, " -l");
+-          int load_limit = -1;
++    if (ignore) {
++      printer.PrintOnNewLine("ninja: warning: -jN forced on command line; ignoring GNU make jobserver.\n");
++    } else {
++      if (ParseAuth(jobserver)) {
++        const char* l_arg = strstr(value, " -l");
++        int load_limit = -1;
+ 
+-          if (verbose) {
+-            printer.PrintOnNewLine("ninja: using GNU make jobserver.\n");
+-          }
+-
+-          // translate GNU make -lN to ninja -lN
+-          if (l_arg &&
+-              (sscanf(l_arg + 3, "%d ", &load_limit) == 1) &&
+-              (load_limit > 0)) {
+-            max_load_average = load_limit;
+-          }
++        if (verbose) {
++          printer.PrintOnNewLine("ninja: using GNU make jobserver.\n");
++        }
+ 
+-          return true;
++        // translate GNU make -lN to ninja -lN
++        if (l_arg &&
++            (sscanf(l_arg + 3, "%d ", &load_limit) == 1) &&
++            (load_limit > 0)) {
++          max_load_average = load_limit;
+         }
++
++        return true;
+       }
+     }
+   }
+@@ -76,10 +77,10 @@ bool GNUmakeTokenPool::Acquire() {
+     // token acquired
+     available_++;
+     return true;
+-  } else {
+-    // no token available
+-    return false;
+   }
++
++  // no token available
++  return false;
+ }
+ 
+ void GNUmakeTokenPool::Reserve() {
+diff --git a/src/tokenpool-gnu-make.h b/src/tokenpool-gnu-make.h
+index d385208..c94cca5 100644
+--- a/src/tokenpool-gnu-make.h
++++ b/src/tokenpool-gnu-make.h
+@@ -17,7 +17,7 @@
+ // interface to GNU make token pool
+ struct GNUmakeTokenPool : public TokenPool {
+   GNUmakeTokenPool();
+-  virtual ~GNUmakeTokenPool();
++  ~GNUmakeTokenPool();
+ 
+   // token pool implementation
+   virtual bool Acquire();
+@@ -27,8 +27,8 @@ struct GNUmakeTokenPool : public TokenPool {
+   virtual bool Setup(bool ignore, bool verbose, double& max_load_average);
+ 
+   // platform specific implementation
+-  virtual const char *GetEnv(const char *name) = 0;
+-  virtual bool ParseAuth(const char *jobserver) = 0;
++  virtual const char* GetEnv(const char* name) = 0;
++  virtual bool ParseAuth(const char* jobserver) = 0;
+   virtual bool AcquireToken() = 0;
+   virtual bool ReturnToken() = 0;
+ 
+diff --git a/src/tokenpool-none.cc b/src/tokenpool-none.cc
+deleted file mode 100644
+index 613d168..0000000
+--- a/src/tokenpool-none.cc
++++ /dev/null
+@@ -1,22 +0,0 @@
+-// Copyright 2016-2018 Google Inc. All Rights Reserved.
+-//
+-// Licensed under the Apache License, Version 2.0 (the "License");
+-// you may not use this file except in compliance with the License.
+-// You may obtain a copy of the License at
+-//
+-//     http://www.apache.org/licenses/LICENSE-2.0
+-//
+-// Unless required by applicable law or agreed to in writing, software
+-// distributed under the License is distributed on an "AS IS" BASIS,
+-// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
+-// See the License for the specific language governing permissions and
+-// limitations under the License.
+-
+-#include "tokenpool.h"
+-
+-#include <stdlib.h>
+-
+-// No-op TokenPool implementation
+-struct TokenPool *TokenPool::Get() {
+-  return NULL;
+-}
+diff --git a/src/tokenpool.h b/src/tokenpool.h
+index 1be8e1d..931c227 100644
+--- a/src/tokenpool.h
++++ b/src/tokenpool.h
+@@ -38,5 +38,5 @@ struct TokenPool {
+ #endif
+ 
+   // returns NULL if token pool is not available
+-  static struct TokenPool *Get();
++  static TokenPool* Get();
+ };
+diff --git a/src/tokenpool_test.cc b/src/tokenpool_test.cc
+index 8d4fd7d..5858ef6 100644
+--- a/src/tokenpool_test.cc
++++ b/src/tokenpool_test.cc
+@@ -43,13 +43,17 @@ const double kLoadAverageDefault = -1.23456789;
+ 
+ struct TokenPoolTest : public testing::Test {
+   double load_avg_;
+-  TokenPool *tokens_;
++  TokenPool* tokens_;
+   char buf_[1024];
+ #ifdef _WIN32
+-  const char *semaphore_name_;
++  const char* semaphore_name_;
+   HANDLE semaphore_;
+ #else
+   int fds_[2];
++
++  char random() {
++    return int((rand() / double(RAND_MAX)) * 256);
++  }
+ #endif
+ 
+   virtual void SetUp() {
+@@ -65,7 +69,7 @@ struct TokenPoolTest : public testing::Test {
+       ASSERT_TRUE(false);
+   }
+ 
+-  void CreatePool(const char *format, bool ignore_jobserver = false) {
++  void CreatePool(const char* format, bool ignore_jobserver = false) {
+     if (format) {
+       sprintf(buf_, format,
+ #ifdef _WIN32
+@@ -199,7 +203,8 @@ TEST_F(TokenPoolTest, TwoTokens) {
+   ASSERT_TRUE(ReleaseSemaphore(semaphore_, 1, &previous));
+   ASSERT_EQ(0, previous);
+ #else
+-  ASSERT_EQ(1u, write(fds_[1], "T", 1));
++  char test_tokens[1] = { random() };
++  ASSERT_EQ(1u, write(fds_[1], test_tokens, sizeof(test_tokens)));
+ #endif
+   EXPECT_TRUE(tokens_->Acquire());
+   tokens_->Reserve();
+@@ -209,7 +214,7 @@ TEST_F(TokenPoolTest, TwoTokens) {
+   tokens_->Release();
+   EXPECT_TRUE(tokens_->Acquire());
+ 
+-  // release implict token - must return 2nd token back to jobserver
++  // release implicit token - must return 2nd token back to jobserver
+   tokens_->Release();
+   EXPECT_TRUE(tokens_->Acquire());
+ 
+@@ -220,6 +225,7 @@ TEST_F(TokenPoolTest, TwoTokens) {
+   EXPECT_EQ(0, previous);
+ #else
+   EXPECT_EQ(1u, read(fds_[0], buf_, sizeof(buf_)));
++  EXPECT_EQ(test_tokens[0], buf_[0]);
+ #endif
+ 
+   // implicit token
+@@ -243,7 +249,8 @@ TEST_F(TokenPoolTest, Clear) {
+   ASSERT_TRUE(ReleaseSemaphore(semaphore_, 2, &previous));
+   ASSERT_EQ(0, previous);
+ #else
+-  ASSERT_EQ(2u, write(fds_[1], "TT", 2));
++  char test_tokens[2] = { random(), random() };
++  ASSERT_EQ(2u, write(fds_[1], test_tokens, sizeof(test_tokens)));
+ #endif
+   EXPECT_TRUE(tokens_->Acquire());
+   tokens_->Reserve();
+@@ -262,6 +269,9 @@ TEST_F(TokenPoolTest, Clear) {
+   EXPECT_EQ(0, previous);
+ #else
+   EXPECT_EQ(2u, read(fds_[0], buf_, sizeof(buf_)));
++  // tokens are pushed onto a stack, hence returned in reverse order
++  EXPECT_EQ(test_tokens[0], buf_[1]);
++  EXPECT_EQ(test_tokens[1], buf_[0]);
+ #endif
+ 
+   // implicit token
+-- 
+2.44.0
+
diff --git a/meta/recipes-devtools/ninja/files/0012-Rename-TokenPool-Setup-to-SetupClient.patch b/meta/recipes-devtools/ninja/files/0012-Rename-TokenPool-Setup-to-SetupClient.patch
new file mode 100644
index 0000000000..dc2feb3005
--- /dev/null
+++ b/meta/recipes-devtools/ninja/files/0012-Rename-TokenPool-Setup-to-SetupClient.patch
@@ -0,0 +1,109 @@
+From 6ec8fb020884ee638f1d22615ea7fbde3596c7f0 Mon Sep 17 00:00:00 2001
+From: Stefan Becker <chemobejk@gmail.com>
+Date: Sat, 15 Dec 2018 19:29:42 +0200
+Subject: [PATCH 12/20] Rename TokenPool::Setup() to SetupClient()
+
+Make space to add new API to set up token pool master.
+
+Upstream-Status: Submitted [https://github.com/ninja-build/ninja/pull/2260]
+---
+ src/build.cc              | 6 +++---
+ src/subprocess_test.cc    | 3 ++-
+ src/tokenpool-gnu-make.cc | 6 +++---
+ src/tokenpool-gnu-make.h  | 3 ++-
+ src/tokenpool.h           | 3 ++-
+ src/tokenpool_test.cc     | 2 +-
+ 6 files changed, 13 insertions(+), 10 deletions(-)
+
+diff --git a/src/build.cc b/src/build.cc
+index 4bf5557..fbc597a 100644
+--- a/src/build.cc
++++ b/src/build.cc
+@@ -474,9 +474,9 @@ struct RealCommandRunner : public CommandRunner {
+ RealCommandRunner::RealCommandRunner(const BuildConfig& config) : config_(config) {
+   max_load_average_ = config.max_load_average;
+   if ((tokens_ = TokenPool::Get()) != NULL) {
+-    if (!tokens_->Setup(config_.parallelism_from_cmdline,
+-                        config_.verbosity == BuildConfig::VERBOSE,
+-                        max_load_average_)) {
++    if (!tokens_->SetupClient(config_.parallelism_from_cmdline,
++                              config_.verbosity == BuildConfig::VERBOSE,
++                              max_load_average_)) {
+       delete tokens_;
+       tokens_ = NULL;
+     }
+diff --git a/src/subprocess_test.cc b/src/subprocess_test.cc
+index 7b146f3..e526540 100644
+--- a/src/subprocess_test.cc
++++ b/src/subprocess_test.cc
+@@ -40,7 +40,8 @@ struct TestTokenPool : public TokenPool {
+   void Reserve()     {}
+   void Release()     {}
+   void Clear()       {}
+-  bool Setup(bool ignore_unused, bool verbose, double& max_load_average) { return false; }
++  bool SetupClient(bool ignore_unused, bool verbose,
++                   double& max_load_average) { return false; }
+ 
+ #ifdef _WIN32
+   bool _token_available;
+diff --git a/src/tokenpool-gnu-make.cc b/src/tokenpool-gnu-make.cc
+index 60e0552..6fb72a6 100644
+--- a/src/tokenpool-gnu-make.cc
++++ b/src/tokenpool-gnu-make.cc
+@@ -28,9 +28,9 @@ GNUmakeTokenPool::GNUmakeTokenPool() : available_(1), used_(0) {
+ GNUmakeTokenPool::~GNUmakeTokenPool() {
+ }
+ 
+-bool GNUmakeTokenPool::Setup(bool ignore,
+-                             bool verbose,
+-                             double& max_load_average) {
++bool GNUmakeTokenPool::SetupClient(bool ignore,
++                                   bool verbose,
++                                   double& max_load_average) {
+   const char* value = GetEnv("MAKEFLAGS");
+   if (!value)
+     return false;
+diff --git a/src/tokenpool-gnu-make.h b/src/tokenpool-gnu-make.h
+index c94cca5..f4ab8d7 100644
+--- a/src/tokenpool-gnu-make.h
++++ b/src/tokenpool-gnu-make.h
+@@ -24,7 +24,8 @@ struct GNUmakeTokenPool : public TokenPool {
+   virtual void Reserve();
+   virtual void Release();
+   virtual void Clear();
+-  virtual bool Setup(bool ignore, bool verbose, double& max_load_average);
++  virtual bool SetupClient(bool ignore, bool verbose,
++                           double& max_load_average);
+ 
+   // platform specific implementation
+   virtual const char* GetEnv(const char* name) = 0;
+diff --git a/src/tokenpool.h b/src/tokenpool.h
+index 931c227..ce2bf48 100644
+--- a/src/tokenpool.h
++++ b/src/tokenpool.h
+@@ -26,7 +26,8 @@ struct TokenPool {
+   virtual void Clear() = 0;
+ 
+   // returns false if token pool setup failed
+-  virtual bool Setup(bool ignore, bool verbose, double& max_load_average) = 0;
++  virtual bool SetupClient(bool ignore, bool verbose,
++                           double& max_load_average) = 0;
+ 
+ #ifdef _WIN32
+   virtual void WaitForTokenAvailability(HANDLE ioport) = 0;
+diff --git a/src/tokenpool_test.cc b/src/tokenpool_test.cc
+index 5858ef6..d6f8188 100644
+--- a/src/tokenpool_test.cc
++++ b/src/tokenpool_test.cc
+@@ -81,7 +81,7 @@ struct TokenPoolTest : public testing::Test {
+       ENVIRONMENT_INIT(buf_);
+     }
+     if ((tokens_ = TokenPool::Get()) != NULL) {
+-      if (!tokens_->Setup(ignore_jobserver, false, load_avg_)) {
++      if (!tokens_->SetupClient(ignore_jobserver, false, load_avg_)) {
+         delete tokens_;
+         tokens_ = NULL;
+       }
+-- 
+2.44.0
+
diff --git a/meta/recipes-devtools/ninja/files/0013-Add-TokenPool-SetupMaster-method.patch b/meta/recipes-devtools/ninja/files/0013-Add-TokenPool-SetupMaster-method.patch
new file mode 100644
index 0000000000..673e0d911f
--- /dev/null
+++ b/meta/recipes-devtools/ninja/files/0013-Add-TokenPool-SetupMaster-method.patch
@@ -0,0 +1,78 @@
+From 89e4aef000e28fd09d3442d93ef3393f6006f0bf Mon Sep 17 00:00:00 2001
+From: Stefan Becker <chemobejk@gmail.com>
+Date: Sat, 15 Dec 2018 20:16:46 +0200
+Subject: [PATCH 13/20] Add TokenPool::SetupMaster() method
+
+This method will set up to the token pool master.
+
+Upstream-Status: Submitted [https://github.com/ninja-build/ninja/pull/2260]
+---
+ src/subprocess_test.cc    | 3 +++
+ src/tokenpool-gnu-make.cc | 7 +++++++
+ src/tokenpool-gnu-make.h  | 3 +++
+ src/tokenpool.h           | 3 +++
+ 4 files changed, 16 insertions(+)
+
+diff --git a/src/subprocess_test.cc b/src/subprocess_test.cc
+index e526540..9a31f62 100644
+--- a/src/subprocess_test.cc
++++ b/src/subprocess_test.cc
+@@ -42,6 +42,9 @@ struct TestTokenPool : public TokenPool {
+   void Clear()       {}
+   bool SetupClient(bool ignore_unused, bool verbose,
+                    double& max_load_average) { return false; }
++  bool SetupMaster(bool verbose,
++                   int parallelism,
++                   double max_load_average)  { return false; }
+ 
+ #ifdef _WIN32
+   bool _token_available;
+diff --git a/src/tokenpool-gnu-make.cc b/src/tokenpool-gnu-make.cc
+index 6fb72a6..2d84105 100644
+--- a/src/tokenpool-gnu-make.cc
++++ b/src/tokenpool-gnu-make.cc
+@@ -69,6 +69,13 @@ bool GNUmakeTokenPool::SetupClient(bool ignore,
+   return false;
+ }
+ 
++bool GNUmakeTokenPool::SetupMaster(bool verbose,
++                                   int parallelism,
++                                   double max_load_average) {
++  // @TODO
++  return false;
++}
++
+ bool GNUmakeTokenPool::Acquire() {
+   if (available_ > 0)
+     return true;
+diff --git a/src/tokenpool-gnu-make.h b/src/tokenpool-gnu-make.h
+index f4ab8d7..ffb9852 100644
+--- a/src/tokenpool-gnu-make.h
++++ b/src/tokenpool-gnu-make.h
+@@ -26,6 +26,9 @@ struct GNUmakeTokenPool : public TokenPool {
+   virtual void Clear();
+   virtual bool SetupClient(bool ignore, bool verbose,
+                            double& max_load_average);
++  virtual bool SetupMaster(bool verbose,
++                           int parallelism,
++                           double max_load_average);
+ 
+   // platform specific implementation
+   virtual const char* GetEnv(const char* name) = 0;
+diff --git a/src/tokenpool.h b/src/tokenpool.h
+index ce2bf48..f280155 100644
+--- a/src/tokenpool.h
++++ b/src/tokenpool.h
+@@ -28,6 +28,9 @@ struct TokenPool {
+   // returns false if token pool setup failed
+   virtual bool SetupClient(bool ignore, bool verbose,
+                            double& max_load_average) = 0;
++  virtual bool SetupMaster(bool verbose,
++                           int parallelism,
++                           double max_load_average) = 0;
+ 
+ #ifdef _WIN32
+   virtual void WaitForTokenAvailability(HANDLE ioport) = 0;
+-- 
+2.44.0
+
diff --git a/meta/recipes-devtools/ninja/files/0014-Add-command-line-option-m-tokenpool-master.patch b/meta/recipes-devtools/ninja/files/0014-Add-command-line-option-m-tokenpool-master.patch
new file mode 100644
index 0000000000..a99e4a5cb8
--- /dev/null
+++ b/meta/recipes-devtools/ninja/files/0014-Add-command-line-option-m-tokenpool-master.patch
@@ -0,0 +1,101 @@
+From 0ec8c4a8079f1eb205c285afce4753e17810b20d Mon Sep 17 00:00:00 2001
+From: Stefan Becker <chemobejk@gmail.com>
+Date: Sat, 15 Dec 2018 20:23:04 +0200
+Subject: [PATCH 14/20] Add command line option -m/--tokenpool-master
+
+When this option is given on the command line then ninja will set up a
+token pool master instead of being a token pool client.
+
+Upstream-Status: Submitted [https://github.com/ninja-build/ninja/pull/2260]
+---
+ src/build.cc | 12 +++++++++---
+ src/build.h  |  2 ++
+ src/ninja.cc |  8 +++++++-
+ 3 files changed, 18 insertions(+), 4 deletions(-)
+
+diff --git a/src/build.cc b/src/build.cc
+index fbc597a..66d445b 100644
+--- a/src/build.cc
++++ b/src/build.cc
+@@ -474,9 +474,15 @@ struct RealCommandRunner : public CommandRunner {
+ RealCommandRunner::RealCommandRunner(const BuildConfig& config) : config_(config) {
+   max_load_average_ = config.max_load_average;
+   if ((tokens_ = TokenPool::Get()) != NULL) {
+-    if (!tokens_->SetupClient(config_.parallelism_from_cmdline,
+-                              config_.verbosity == BuildConfig::VERBOSE,
+-                              max_load_average_)) {
++    bool setup_ok = config_.tokenpool_master ?
++      tokens_->SetupMaster(config_.verbosity == BuildConfig::VERBOSE,
++                           config_.parallelism,
++                           max_load_average_) :
++      tokens_->SetupClient(config_.parallelism_from_cmdline,
++                           config_.verbosity == BuildConfig::VERBOSE,
++                           max_load_average_);
++
++    if (!setup_ok) {
+       delete tokens_;
+       tokens_ = NULL;
+     }
+diff --git a/src/build.h b/src/build.h
+index c12a085..ab64564 100644
+--- a/src/build.h
++++ b/src/build.h
+@@ -163,6 +163,7 @@ struct CommandRunner {
+ struct BuildConfig {
+   BuildConfig() : verbosity(NORMAL), dry_run(false),
+                   parallelism(1), parallelism_from_cmdline(false),
++                  tokenpool_master(false),
+                   failures_allowed(1), max_load_average(-0.0f) {}
+ 
+   enum Verbosity {
+@@ -175,6 +176,7 @@ struct BuildConfig {
+   bool dry_run;
+   int parallelism;
+   bool parallelism_from_cmdline;
++  bool tokenpool_master;
+   int failures_allowed;
+   /// The maximum load average we must not exceed. A negative value
+   /// means that we do not have any limit.
+diff --git a/src/ninja.cc b/src/ninja.cc
+index 74c1194..5710e87 100644
+--- a/src/ninja.cc
++++ b/src/ninja.cc
+@@ -230,6 +230,8 @@ void Usage(const BuildConfig& config) {
+ "  -k N     keep going until N jobs fail (0 means infinity) [default=1]\n"
+ "  -l N     do not start new jobs if the load average is greater than N\n"
+ "  -n       dry run (don't run commands but act like they succeeded)\n"
++"  -m, --tokenpool-master\n"
++"           enable token pool master for job load balancing with children\n"
+ "\n"
+ "  -d MODE  enable debugging (use '-d list' to list modes)\n"
+ "  -t TOOL  run a subtool (use '-t list' to list subtools)\n"
+@@ -1421,6 +1423,7 @@ int ReadFlags(int* argc, char*** argv,
+   enum { OPT_VERSION = 1, OPT_QUIET = 2 };
+   const option kLongOptions[] = {
+     { "help", no_argument, NULL, 'h' },
++    { "tokenpool-master", no_argument, NULL, 'm' },
+     { "version", no_argument, NULL, OPT_VERSION },
+     { "verbose", no_argument, NULL, 'v' },
+     { "quiet", no_argument, NULL, OPT_QUIET },
+@@ -1429,7 +1432,7 @@ int ReadFlags(int* argc, char*** argv,
+ 
+   int opt;
+   while (!options->tool &&
+-         (opt = getopt_long(*argc, *argv, "d:f:j:k:l:nt:vw:C:h", kLongOptions,
++         (opt = getopt_long(*argc, *argv, "d:f:j:k:l:mnt:vw:C:h", kLongOptions,
+                             NULL)) != -1) {
+     switch (opt) {
+       case 'd':
+@@ -1472,6 +1475,9 @@ int ReadFlags(int* argc, char*** argv,
+         config->max_load_average = value;
+         break;
+       }
++      case 'm':
++        config->tokenpool_master = true;
++        break;
+       case 'n':
+         config->dry_run = true;
+         break;
+-- 
+2.44.0
+
diff --git a/meta/recipes-devtools/ninja/files/0015-Implement-GNUmakeTokenPool-SetupMaster.patch b/meta/recipes-devtools/ninja/files/0015-Implement-GNUmakeTokenPool-SetupMaster.patch
new file mode 100644
index 0000000000..fed6340a6a
--- /dev/null
+++ b/meta/recipes-devtools/ninja/files/0015-Implement-GNUmakeTokenPool-SetupMaster.patch
@@ -0,0 +1,152 @@
+From 8d2191096825929f9e90ed9d02eea50c5fdd14b3 Mon Sep 17 00:00:00 2001
+From: Stefan Becker <chemobejk@gmail.com>
+Date: Sat, 15 Dec 2018 21:07:57 +0200
+Subject: [PATCH 15/20] Implement GNUmakeTokenPool::SetupMaster()
+
+- don't set up token pool for serial builds
+- add implementation specific CreatePool() & SetEnv() methods
+- generate contents for MAKEFLAGS variable to pass down to children
+
+Upstream-Status: Submitted [https://github.com/ninja-build/ninja/pull/2260]
+---
+ src/tokenpool-gnu-make-posix.cc |  9 +++++++++
+ src/tokenpool-gnu-make-win32.cc | 11 +++++++++++
+ src/tokenpool-gnu-make.cc       | 26 +++++++++++++++++++++++++-
+ src/tokenpool-gnu-make.h        |  4 ++++
+ 4 files changed, 49 insertions(+), 1 deletion(-)
+
+diff --git a/src/tokenpool-gnu-make-posix.cc b/src/tokenpool-gnu-make-posix.cc
+index 4f43676..7067495 100644
+--- a/src/tokenpool-gnu-make-posix.cc
++++ b/src/tokenpool-gnu-make-posix.cc
+@@ -34,7 +34,11 @@ struct GNUmakeTokenPoolPosix : public GNUmakeTokenPool {
+   virtual int GetMonitorFd();
+ 
+   virtual const char* GetEnv(const char* name) { return getenv(name); };
++  virtual bool SetEnv(const char* name, const char* value) {
++    return setenv(name, value, 1) == 0;
++  };
+   virtual bool ParseAuth(const char* jobserver);
++  virtual bool CreatePool(int parallelism, std::string* auth);
+   virtual bool AcquireToken();
+   virtual bool ReturnToken();
+ 
+@@ -112,6 +116,11 @@ bool GNUmakeTokenPoolPosix::ParseAuth(const char* jobserver) {
+   return false;
+ }
+ 
++bool GNUmakeTokenPoolPosix::CreatePool(int parallelism, std::string* auth) {
++  // @TODO
++  return false;
++}
++
+ bool GNUmakeTokenPoolPosix::AcquireToken() {
+   // Please read
+   //
+diff --git a/src/tokenpool-gnu-make-win32.cc b/src/tokenpool-gnu-make-win32.cc
+index b2bb52f..ada1c80 100644
+--- a/src/tokenpool-gnu-make-win32.cc
++++ b/src/tokenpool-gnu-make-win32.cc
+@@ -34,7 +34,9 @@ struct GNUmakeTokenPoolWin32 : public GNUmakeTokenPool {
+   virtual bool TokenIsAvailable(ULONG_PTR key);
+ 
+   virtual const char* GetEnv(const char* name);
++  virtual bool SetEnv(const char* name, const char* value);
+   virtual bool ParseAuth(const char* jobserver);
++  virtual bool CreatePool(int parallelism, std::string* auth);
+   virtual bool AcquireToken();
+   virtual bool ReturnToken();
+ 
+@@ -107,6 +109,10 @@ const char* GNUmakeTokenPoolWin32::GetEnv(const char* name) {
+   return buffer;
+ }
+ 
++bool GNUmakeTokenPoolWin32::SetEnv(const char* name, const char* value) {
++  return SetEnvironmentVariable(name, value) != 0;
++}
++
+ bool GNUmakeTokenPoolWin32::ParseAuth(const char* jobserver) {
+   // match "--jobserver-auth=gmake_semaphore_<INTEGER>..."
+   const char* start = strchr(jobserver, '=');
+@@ -140,6 +146,11 @@ bool GNUmakeTokenPoolWin32::ParseAuth(const char* jobserver) {
+   return false;
+ }
+ 
++bool GNUmakeTokenPoolWin32::CreatePool(int parallelism, std::string* auth) {
++  // @TODO
++  return false;
++}
++
+ bool GNUmakeTokenPoolWin32::AcquireToken() {
+   return WaitForSingleObject(semaphore_jobserver_, 0) == WAIT_OBJECT_0;
+ }
+diff --git a/src/tokenpool-gnu-make.cc b/src/tokenpool-gnu-make.cc
+index 2d84105..01e72fb 100644
+--- a/src/tokenpool-gnu-make.cc
++++ b/src/tokenpool-gnu-make.cc
+@@ -20,6 +20,8 @@
+ 
+ #include "line_printer.h"
+ 
++using namespace std;
++
+ // TokenPool implementation for GNU make jobserver - common bits
+ // every instance owns an implicit token -> available_ == 1
+ GNUmakeTokenPool::GNUmakeTokenPool() : available_(1), used_(0) {
+@@ -72,7 +74,29 @@ bool GNUmakeTokenPool::SetupClient(bool ignore,
+ bool GNUmakeTokenPool::SetupMaster(bool verbose,
+                                    int parallelism,
+                                    double max_load_average) {
+-  // @TODO
++  // no need to set up token pool for serial builds
++  if (parallelism == 1)
++    return false;
++
++  string auth;
++  if (CreatePool(parallelism, &auth)) {
++    string value = "--jobserver-auth=" + auth;
++    if (max_load_average > 0.0f) {
++      char buffer[32];
++      snprintf(buffer, sizeof(buffer), "%g", max_load_average);
++      value += " -l";
++      value += buffer;
++    }
++
++    if (SetEnv("MAKEFLAGS", value.c_str())) {
++      if (verbose) {
++        LinePrinter printer;
++        printer.PrintOnNewLine("ninja: simulating GNU make jobserver.\n");
++      }
++      return true;
++    }
++  }
++
+   return false;
+ }
+ 
+diff --git a/src/tokenpool-gnu-make.h b/src/tokenpool-gnu-make.h
+index ffb9852..529321b 100644
+--- a/src/tokenpool-gnu-make.h
++++ b/src/tokenpool-gnu-make.h
+@@ -14,6 +14,8 @@
+ 
+ #include "tokenpool.h"
+ 
++#include <string>
++
+ // interface to GNU make token pool
+ struct GNUmakeTokenPool : public TokenPool {
+   GNUmakeTokenPool();
+@@ -32,7 +34,9 @@ struct GNUmakeTokenPool : public TokenPool {
+ 
+   // platform specific implementation
+   virtual const char* GetEnv(const char* name) = 0;
++  virtual bool SetEnv(const char* name, const char* value) = 0;
+   virtual bool ParseAuth(const char* jobserver) = 0;
++  virtual bool CreatePool(int parallelism, std::string* auth) = 0;
+   virtual bool AcquireToken() = 0;
+   virtual bool ReturnToken() = 0;
+ 
+-- 
+2.44.0
+
diff --git a/meta/recipes-devtools/ninja/files/0016-Implement-GNUmakeTokenPool-CreatePool.patch b/meta/recipes-devtools/ninja/files/0016-Implement-GNUmakeTokenPool-CreatePool.patch
new file mode 100644
index 0000000000..5ee38061df
--- /dev/null
+++ b/meta/recipes-devtools/ninja/files/0016-Implement-GNUmakeTokenPool-CreatePool.patch
@@ -0,0 +1,87 @@
+From 66021553858c5dcfbcf87e66606704d505cf4356 Mon Sep 17 00:00:00 2001
+From: Stefan Becker <chemobejk@gmail.com>
+Date: Sat, 15 Dec 2018 22:49:19 +0200
+Subject: [PATCH 16/20] Implement GNUmakeTokenPool*::CreatePool()
+
+Set up a pipe (POSIX) or semaphore (win32) with N tokens.
+
+Upstream-Status: Submitted [https://github.com/ninja-build/ninja/pull/2260]
+---
+ src/tokenpool-gnu-make-posix.cc | 27 +++++++++++++++++++++++++--
+ src/tokenpool-gnu-make-win32.cc | 15 ++++++++++++++-
+ 2 files changed, 39 insertions(+), 3 deletions(-)
+
+diff --git a/src/tokenpool-gnu-make-posix.cc b/src/tokenpool-gnu-make-posix.cc
+index 7067495..ff76097 100644
+--- a/src/tokenpool-gnu-make-posix.cc
++++ b/src/tokenpool-gnu-make-posix.cc
+@@ -117,8 +117,31 @@ bool GNUmakeTokenPoolPosix::ParseAuth(const char* jobserver) {
+ }
+ 
+ bool GNUmakeTokenPoolPosix::CreatePool(int parallelism, std::string* auth) {
+-  // @TODO
+-  return false;
++  // create jobserver pipe
++  int fds[2];
++  if (pipe(fds) < 0)
++    return false;
++
++  // add N tokens to pipe
++  const char token = '+'; // see make/posixos.c
++  while (parallelism--) {
++    if (write(fds[1], &token, 1) < 1) {
++      close(fds[1]);
++      close(fds[0]);
++      return false;
++    }
++  }
++
++  // initialize file descriptors for this instance
++  rfd_ = fds[0];
++  wfd_ = fds[1];
++
++  // generate auth parameter for child processes
++  char buffer[32];
++  snprintf(buffer, sizeof(buffer), "%d,%d", rfd_, wfd_);
++  *auth = buffer;
++
++  return true;
+ }
+ 
+ bool GNUmakeTokenPoolPosix::AcquireToken() {
+diff --git a/src/tokenpool-gnu-make-win32.cc b/src/tokenpool-gnu-make-win32.cc
+index ada1c80..df5cb47 100644
+--- a/src/tokenpool-gnu-make-win32.cc
++++ b/src/tokenpool-gnu-make-win32.cc
+@@ -21,6 +21,7 @@
+ #include <ctype.h>
+ #include <stdlib.h>
+ #include <string.h>
++#include <process.h>
+ 
+ #include "util.h"
+ 
+@@ -147,7 +148,19 @@ bool GNUmakeTokenPoolWin32::ParseAuth(const char* jobserver) {
+ }
+ 
+ bool GNUmakeTokenPoolWin32::CreatePool(int parallelism, std::string* auth) {
+-  // @TODO
++  char buffer[100];
++  snprintf(buffer, sizeof(buffer), "gmake_semaphore_%d", _getpid());
++
++  if ((semaphore_jobserver_ =
++       CreateSemaphore(NULL,        /* Use default security descriptor */
++                       parallelism, /* Initial count */
++                       parallelism, /* Maximum count */
++                       buffer       /* Semaphore name */
++                      )) != NULL) {
++    *auth = buffer;
++    return true;
++  }
++
+   return false;
+ }
+ 
+-- 
+2.44.0
+
diff --git a/meta/recipes-devtools/ninja/files/0017-Add-tests-for-TokenPool-SetupMaster.patch b/meta/recipes-devtools/ninja/files/0017-Add-tests-for-TokenPool-SetupMaster.patch
new file mode 100644
index 0000000000..aafb82b282
--- /dev/null
+++ b/meta/recipes-devtools/ninja/files/0017-Add-tests-for-TokenPool-SetupMaster.patch
@@ -0,0 +1,145 @@
+From bee56b62adb847e5812c6cf3bf2115cca0aa4702 Mon Sep 17 00:00:00 2001
+From: Stefan Becker <chemobejk@gmail.com>
+Date: Tue, 18 Dec 2018 15:11:24 +0200
+Subject: [PATCH 17/20] Add tests for TokenPool::SetupMaster()
+
+Upstream-Status: Submitted [https://github.com/ninja-build/ninja/pull/2260]
+---
+ src/tokenpool_test.cc | 93 +++++++++++++++++++++++++++++++++++++++++++
+ 1 file changed, 93 insertions(+)
+
+diff --git a/src/tokenpool_test.cc b/src/tokenpool_test.cc
+index d6f8188..76a4846 100644
+--- a/src/tokenpool_test.cc
++++ b/src/tokenpool_test.cc
+@@ -18,12 +18,15 @@
+ 
+ #ifdef _WIN32
+ #include <windows.h>
++#include <ctype.h>
+ #else
++#include <fcntl.h>
+ #include <unistd.h>
+ #endif
+ 
+ #include <stdio.h>
+ #include <stdlib.h>
++#include <string.h>
+ 
+ #ifdef _WIN32
+ // should contain all valid characters
+@@ -31,10 +34,19 @@
+ #define AUTH_FORMAT(tmpl)   "foo " tmpl "=%s bar"
+ #define ENVIRONMENT_CLEAR() SetEnvironmentVariable("MAKEFLAGS", NULL)
+ #define ENVIRONMENT_INIT(v) SetEnvironmentVariable("MAKEFLAGS", v)
++
++static char _env_buffer[MAX_PATH + 1];
++#define ENVIRONMENT_GET()   (                          \
++    GetEnvironmentVariable("MAKEFLAGS",                \
++			   _env_buffer,		       \
++			   sizeof(_env_buffer)) == 0 ? \
++    NULL : _env_buffer)
+ #else
+ #define AUTH_FORMAT(tmpl)   "foo " tmpl "=%d,%d bar"
+ #define ENVIRONMENT_CLEAR() unsetenv("MAKEFLAGS")
+ #define ENVIRONMENT_INIT(v) setenv("MAKEFLAGS", v, true)
++
++#define ENVIRONMENT_GET()   getenv("MAKEFLAGS")
+ #endif
+ 
+ namespace {
+@@ -92,6 +104,51 @@ struct TokenPoolTest : public testing::Test {
+     CreatePool(AUTH_FORMAT("--jobserver-auth"));
+   }
+ 
++  void CreateMaster(int parallelism) {
++    if ((tokens_ = TokenPool::Get()) != NULL) {
++      if (!tokens_->SetupMaster(false, parallelism, load_avg_)) {
++        delete tokens_;
++        tokens_ = NULL;
++      }
++    }
++  }
++
++  void CheckTokens(const char *env, unsigned int tokens) {
++#ifdef _WIN32
++    ASSERT_EQ(env, strstr(env, "--jobserver-auth=gmake_semaphore_"));
++    char *name   = (char *) strchr(env, '=') + 1; // in _env_buffer
++    char c, *end = name;
++    while ((c = *end++) != '\0')
++        if (!(isalnum(c) || (c == '_')))
++          break;
++    end[-1] = '\0';
++
++    HANDLE semaphore =
++      OpenSemaphore(SEMAPHORE_ALL_ACCESS,
++		    FALSE,
++		    name);
++    ASSERT_NE(NULL, semaphore);
++
++    for (unsigned int i = 0; i < tokens; i++)
++      EXPECT_EQ(WAIT_OBJECT_0, WaitForSingleObject(semaphore, 0));
++    EXPECT_NE(WAIT_OBJECT_0, WaitForSingleObject(semaphore, 0));
++
++    CloseHandle(semaphore);
++#else
++    int rfd = -1, wfd = -1;
++    ASSERT_EQ(2u, sscanf(env, "%*[^=]=%d,%d", &rfd, &wfd));
++    EXPECT_NE(-1, rfd);
++    EXPECT_NE(-1, wfd);
++
++    int flags = fcntl(rfd, F_GETFL, 0);
++    ASSERT_NE(-1, flags);
++    ASSERT_NE(-1, fcntl(rfd, F_SETFL, flags | O_NONBLOCK));
++
++    EXPECT_EQ(tokens, read(rfd, buf_, sizeof(buf_)));
++    EXPECT_EQ(-1,     read(rfd, buf_, sizeof(buf_))); // EWOULDBLOCK
++#endif
++  }
++
+   virtual void TearDown() {
+     if (tokens_)
+       delete tokens_;
+@@ -277,3 +334,39 @@ TEST_F(TokenPoolTest, Clear) {
+   // implicit token
+   EXPECT_TRUE(tokens_->Acquire());
+ }
++
++TEST_F(TokenPoolTest, NoPoolForSerialBuild) {
++  CreateMaster(1);
++
++  EXPECT_EQ(NULL, tokens_);
++}
++
++TEST_F(TokenPoolTest, MasterNoLoadAvg) {
++  // kLoadAverageDefault <= 0.0f -> no load averaging
++  CreateMaster(2);
++
++  ASSERT_NE(NULL, tokens_);
++
++  const char *env = ENVIRONMENT_GET();
++  ASSERT_NE(NULL, env);
++
++  EXPECT_EQ(env,  strstr(env, "--jobserver-auth="));
++  EXPECT_EQ(NULL, strstr(env, " -l"));
++
++  CheckTokens(env, 2);
++}
++
++TEST_F(TokenPoolTest, MasterWithLoadAvg) {
++  load_avg_ = 3.1415f;
++  CreateMaster(3);
++
++  ASSERT_NE(NULL, tokens_);
++
++  const char *env = ENVIRONMENT_GET();
++  ASSERT_NE(NULL, env);
++
++  EXPECT_EQ(env,  strstr(env, "--jobserver-auth="));
++  EXPECT_NE(NULL, strstr(env, " -l3.1415"));
++
++  CheckTokens(env, 3);
++}
+-- 
+2.44.0
+
diff --git a/meta/recipes-devtools/ninja/files/0018-Add-GNU-make-jobserver-fifo-style-client-support.patch b/meta/recipes-devtools/ninja/files/0018-Add-GNU-make-jobserver-fifo-style-client-support.patch
new file mode 100644
index 0000000000..8b57932689
--- /dev/null
+++ b/meta/recipes-devtools/ninja/files/0018-Add-GNU-make-jobserver-fifo-style-client-support.patch
@@ -0,0 +1,265 @@
+From e615e63bb294b65bdf021e58d72e0d8f91e90e5a Mon Sep 17 00:00:00 2001
+From: Stefan Becker <chemobejk@gmail.com>
+Date: Mon, 7 Nov 2022 20:45:27 +0200
+Subject: [PATCH 18/20] Add GNU make jobserver fifo style client support
+
+GNU make 4.4 introduced a new jobserver style "fifo" for POSIX systems
+which passes a named pipe down to the clients.
+
+- update auth parser to recognize "fifo:<name>" format
+- open named pipe for reading and writing
+- make sure the file descriptors are closed in the destructor
+- add 2 tests that aren't compiled for WIN32
+
+Upstream-Status: Submitted [https://github.com/ninja-build/ninja/pull/2263]
+---
+ src/tokenpool-gnu-make-posix.cc | 46 ++++++++++++++++-
+ src/tokenpool_test.cc           | 87 ++++++++++++++++++++++++++++++---
+ 2 files changed, 126 insertions(+), 7 deletions(-)
+
+diff --git a/src/tokenpool-gnu-make-posix.cc b/src/tokenpool-gnu-make-posix.cc
+index ff76097..9432bc2 100644
+--- a/src/tokenpool-gnu-make-posix.cc
++++ b/src/tokenpool-gnu-make-posix.cc
+@@ -45,6 +45,7 @@ struct GNUmakeTokenPoolPosix : public GNUmakeTokenPool {
+  private:
+   int rfd_;
+   int wfd_;
++  bool closeFds_;
+ 
+   struct sigaction old_act_;
+   bool restore_;
+@@ -63,14 +64,19 @@ struct GNUmakeTokenPoolPosix : public GNUmakeTokenPool {
+   static void CloseDupRfd(int signum);
+ 
+   bool CheckFd(int fd);
++  bool CheckFifo(const char* fifo);
+   bool SetAlarmHandler();
+ };
+ 
+-GNUmakeTokenPoolPosix::GNUmakeTokenPoolPosix() : rfd_(-1), wfd_(-1), restore_(false) {
++GNUmakeTokenPoolPosix::GNUmakeTokenPoolPosix() : rfd_(-1), wfd_(-1), closeFds_(false), restore_(false) {
+ }
+ 
+ GNUmakeTokenPoolPosix::~GNUmakeTokenPoolPosix() {
+   Clear();
++  if (closeFds_) {
++    close(wfd_);
++    close(rfd_);
++  }
+   if (restore_)
+     sigaction(SIGALRM, &old_act_, NULL);
+ }
+@@ -82,6 +88,36 @@ bool GNUmakeTokenPoolPosix::CheckFd(int fd) {
+   return ret >= 0;
+ }
+ 
++bool GNUmakeTokenPoolPosix::CheckFifo(const char* fifo) {
++  // remove possible junk from end of fifo name
++  char *filename = strdup(fifo);
++  char *end;
++  if ((end = strchr(filename, ' ')) != NULL) {
++    *end = '\0';
++  }
++
++  int rfd = open(filename, O_RDONLY);
++  if (rfd < 0) {
++    free(filename);
++    return false;
++  }
++
++  int wfd = open(filename, O_WRONLY);
++  if (wfd < 0) {
++    close(rfd);
++    free(filename);
++    return false;
++  }
++
++  free(filename);
++
++  rfd_ = rfd;
++  wfd_ = wfd;
++  closeFds_ = true;
++
++  return true;
++}
++
+ int GNUmakeTokenPoolPosix::dup_rfd_ = -1;
+ 
+ void GNUmakeTokenPoolPosix::CloseDupRfd(int signum) {
+@@ -102,6 +138,13 @@ bool GNUmakeTokenPoolPosix::SetAlarmHandler() {
+ }
+ 
+ bool GNUmakeTokenPoolPosix::ParseAuth(const char* jobserver) {
++  // check for jobserver-fifo style
++  const char* fifo;
++  if (((fifo = strstr(jobserver, "=fifo:")) != NULL) &&
++      CheckFifo(fifo + 6))
++    return SetAlarmHandler();
++
++  // check for legacy simple pipe style
+   int rfd = -1;
+   int wfd = -1;
+   if ((sscanf(jobserver, "%*[^=]=%d,%d", &rfd, &wfd) == 2) &&
+@@ -113,6 +156,7 @@ bool GNUmakeTokenPoolPosix::ParseAuth(const char* jobserver) {
+     return true;
+   }
+ 
++  // some jobserver style we don't support
+   return false;
+ }
+ 
+diff --git a/src/tokenpool_test.cc b/src/tokenpool_test.cc
+index 76a4846..1b8e72f 100644
+--- a/src/tokenpool_test.cc
++++ b/src/tokenpool_test.cc
+@@ -22,6 +22,8 @@
+ #else
+ #include <fcntl.h>
+ #include <unistd.h>
++#include <sys/types.h>
++#include <sys/stat.h>
+ #endif
+ 
+ #include <stdio.h>
+@@ -47,6 +49,8 @@ static char _env_buffer[MAX_PATH + 1];
+ #define ENVIRONMENT_INIT(v) setenv("MAKEFLAGS", v, true)
+ 
+ #define ENVIRONMENT_GET()   getenv("MAKEFLAGS")
++
++#define FIFO_NAME "ninja-test-tokenpool-fifo"
+ #endif
+ 
+ namespace {
+@@ -76,11 +80,24 @@ struct TokenPoolTest : public testing::Test {
+     semaphore_name_ = SEMAPHORE_NAME;
+     if ((semaphore_ = CreateSemaphore(0, 0, 2, SEMAPHORE_NAME)) == NULL)
+ #else
++    if (mkfifo(FIFO_NAME, 0600) < 0) {
++      ASSERT_TRUE(false);
++    }
++
+     if (pipe(fds_) < 0)
+ #endif
+       ASSERT_TRUE(false);
+   }
+ 
++  void GetPool(bool ignore_jobserver) {
++    if ((tokens_ = TokenPool::Get()) != NULL) {
++      if (!tokens_->SetupClient(ignore_jobserver, false, load_avg_)) {
++        delete tokens_;
++        tokens_ = NULL;
++      }
++    }
++  }
++
+   void CreatePool(const char* format, bool ignore_jobserver = false) {
+     if (format) {
+       sprintf(buf_, format,
+@@ -92,18 +109,30 @@ struct TokenPoolTest : public testing::Test {
+       );
+       ENVIRONMENT_INIT(buf_);
+     }
+-    if ((tokens_ = TokenPool::Get()) != NULL) {
+-      if (!tokens_->SetupClient(ignore_jobserver, false, load_avg_)) {
+-        delete tokens_;
+-        tokens_ = NULL;
+-      }
+-    }
++    GetPool(ignore_jobserver);
+   }
+ 
+   void CreateDefaultPool() {
+     CreatePool(AUTH_FORMAT("--jobserver-auth"));
+   }
+ 
++#ifndef _WIN32
++  void CreateFifoPool() {
++    // close simple pipe fds...
++    close(fds_[0]);
++    close(fds_[1]);
++
++    // ... and open named pipe instead
++    if ((fds_[0] = open(FIFO_NAME, O_RDONLY|O_NONBLOCK)) < 0)
++      ASSERT_TRUE(false);
++    if ((fds_[1] = open(FIFO_NAME, O_WRONLY)) < 0)
++      ASSERT_TRUE(false);
++
++    ENVIRONMENT_INIT("foo --jobserver-auth=fifo:" FIFO_NAME " bar");
++    GetPool(false);
++  }
++#endif
++
+   void CreateMaster(int parallelism) {
+     if ((tokens_ = TokenPool::Get()) != NULL) {
+       if (!tokens_->SetupMaster(false, parallelism, load_avg_)) {
+@@ -157,6 +186,7 @@ struct TokenPoolTest : public testing::Test {
+ #else
+     close(fds_[0]);
+     close(fds_[1]);
++    unlink(FIFO_NAME);
+ #endif
+     ENVIRONMENT_CLEAR();
+   }
+@@ -228,6 +258,15 @@ TEST_F(TokenPoolTest, MonitorFD) {
+ 
+   EXPECT_EQ(fds_[0], tokens_->GetMonitorFd());
+ }
++
++TEST_F(TokenPoolTest, MonitorFDFifo) {
++  CreateFifoPool();
++
++  ASSERT_NE(NULL, tokens_);
++  EXPECT_EQ(kLoadAverageDefault, load_avg_);
++
++  EXPECT_NE(-1, tokens_->GetMonitorFd());
++}
+ #endif
+ 
+ TEST_F(TokenPoolTest, ImplicitToken) {
+@@ -289,6 +328,42 @@ TEST_F(TokenPoolTest, TwoTokens) {
+   EXPECT_TRUE(tokens_->Acquire());
+ }
+ 
++#ifndef _WIN32
++TEST_F(TokenPoolTest, TwoTokensFifo) {
++  CreateFifoPool();
++
++  ASSERT_NE(NULL, tokens_);
++  EXPECT_EQ(kLoadAverageDefault, load_avg_);
++
++  // implicit token
++  EXPECT_TRUE(tokens_->Acquire());
++  tokens_->Reserve();
++  EXPECT_FALSE(tokens_->Acquire());
++
++  // jobserver offers 2nd token
++  char test_tokens[1] = { random() };
++  ASSERT_EQ(1u, write(fds_[1], test_tokens, sizeof(test_tokens)));
++  EXPECT_TRUE(tokens_->Acquire());
++  tokens_->Reserve();
++  EXPECT_FALSE(tokens_->Acquire());
++
++  // release 2nd token
++  tokens_->Release();
++  EXPECT_TRUE(tokens_->Acquire());
++
++  // release implicit token - must return 2nd token back to jobserver
++  tokens_->Release();
++  EXPECT_TRUE(tokens_->Acquire());
++
++  // there must be one token available
++  EXPECT_EQ(1u, read(fds_[0], buf_, sizeof(buf_)));
++  EXPECT_EQ(test_tokens[0], buf_[0]);
++
++  // implicit token
++  EXPECT_TRUE(tokens_->Acquire());
++}
++#endif
++
+ TEST_F(TokenPoolTest, Clear) {
+   CreateDefaultPool();
+ 
+-- 
+2.44.0
+
diff --git a/meta/recipes-devtools/ninja/files/0019-Add-optional-argument-to-m-tokenpool-master.patch b/meta/recipes-devtools/ninja/files/0019-Add-optional-argument-to-m-tokenpool-master.patch
new file mode 100644
index 0000000000..5a874ca50e
--- /dev/null
+++ b/meta/recipes-devtools/ninja/files/0019-Add-optional-argument-to-m-tokenpool-master.patch
@@ -0,0 +1,368 @@
+From 66350c017b17dbde650a4967f5b68aa5526c2bb0 Mon Sep 17 00:00:00 2001
+From: Stefan Becker <chemobejk@gmail.com>
+Date: Sun, 19 Feb 2023 18:39:49 +0200
+Subject: [PATCH 19/20] Add optional argument to -m/--tokenpool-master
+
+GNU make 4.4 introduced a new command line option --jobserver-style with
+which the user can choose a different style than the default. For ninja
+we make the style an optional argument to the -m/--tokenpool-master
+option instead.
+
+- add argument value to BuildConfig and pass it down via SetupMaster()
+  to CreatePool()
+- POSIX supports the styles "fifo" (default) and "pipe"
+- Win32 only supports the style "sem" (default)
+- an unsupported style causes ninja to abort with a fatal error
+- as the "fifo" style isn't implemented yet, hard-code the tests to the
+  "pipe" style to make them pass
+- replace "OPTIONAL_ARG" with "optional_argument" in the getopt
+  implementation to match the getopt_long() man page.
+
+Upstream-Status: Submitted [https://github.com/ninja-build/ninja/pull/2263]
+---
+ src/build.cc                    |  3 +-
+ src/build.h                     |  3 +-
+ src/getopt.c                    |  4 +--
+ src/getopt.h                    |  2 +-
+ src/ninja.cc                    | 14 ++++++--
+ src/subprocess_test.cc          |  3 +-
+ src/tokenpool-gnu-make-posix.cc | 57 +++++++++++++++++++++------------
+ src/tokenpool-gnu-make-win32.cc | 12 +++++--
+ src/tokenpool-gnu-make.cc       |  5 +--
+ src/tokenpool-gnu-make.h        |  7 ++--
+ src/tokenpool.h                 |  3 +-
+ src/tokenpool_test.cc           | 12 ++++++-
+ 12 files changed, 87 insertions(+), 38 deletions(-)
+
+diff --git a/src/build.cc b/src/build.cc
+index 66d445b..d7d5cae 100644
+--- a/src/build.cc
++++ b/src/build.cc
+@@ -477,7 +477,8 @@ RealCommandRunner::RealCommandRunner(const BuildConfig& config) : config_(config
+     bool setup_ok = config_.tokenpool_master ?
+       tokens_->SetupMaster(config_.verbosity == BuildConfig::VERBOSE,
+                            config_.parallelism,
+-                           max_load_average_) :
++                           max_load_average_,
++                           config_.tokenpool_master_style) :
+       tokens_->SetupClient(config_.parallelism_from_cmdline,
+                            config_.verbosity == BuildConfig::VERBOSE,
+                            max_load_average_);
+diff --git a/src/build.h b/src/build.h
+index ab64564..0d60b0f 100644
+--- a/src/build.h
++++ b/src/build.h
+@@ -163,7 +163,7 @@ struct CommandRunner {
+ struct BuildConfig {
+   BuildConfig() : verbosity(NORMAL), dry_run(false),
+                   parallelism(1), parallelism_from_cmdline(false),
+-                  tokenpool_master(false),
++                  tokenpool_master(false), tokenpool_master_style(NULL),
+                   failures_allowed(1), max_load_average(-0.0f) {}
+ 
+   enum Verbosity {
+@@ -177,6 +177,7 @@ struct BuildConfig {
+   int parallelism;
+   bool parallelism_from_cmdline;
+   bool tokenpool_master;
++  const char* tokenpool_master_style;
+   int failures_allowed;
+   /// The maximum load average we must not exceed. A negative value
+   /// means that we do not have any limit.
+diff --git a/src/getopt.c b/src/getopt.c
+index 861f07f..f0c6a0c 100644
+--- a/src/getopt.c
++++ b/src/getopt.c
+@@ -299,7 +299,7 @@ getopt_internal (int argc, char **argv, char *shortopts,
+           return (optopt = '?');
+         }
+       has_arg = ((cp[1] == ':')
+-                 ? ((cp[2] == ':') ? OPTIONAL_ARG : required_argument) : no_argument);
++                 ? ((cp[2] == ':') ? optional_argument : required_argument) : no_argument);
+       possible_arg = argv[optind] + optwhere + 1;
+       optopt = *cp;
+     }
+@@ -307,7 +307,7 @@ getopt_internal (int argc, char **argv, char *shortopts,
+   arg_next = 0;
+   switch (has_arg)
+     {
+-    case OPTIONAL_ARG:
++    case optional_argument:
+       if (*possible_arg == '=')
+         possible_arg++;
+       if (*possible_arg != '\0')
+diff --git a/src/getopt.h b/src/getopt.h
+index 965dc29..5622908 100644
+--- a/src/getopt.h
++++ b/src/getopt.h
+@@ -6,7 +6,7 @@
+ /* macros defined by this include file */
+ #define no_argument       0
+ #define required_argument 1
+-#define OPTIONAL_ARG      2
++#define optional_argument 2
+ 
+ /* types defined by this include file */
+ 
+diff --git a/src/ninja.cc b/src/ninja.cc
+index 5710e87..466e866 100644
+--- a/src/ninja.cc
++++ b/src/ninja.cc
+@@ -230,7 +230,11 @@ void Usage(const BuildConfig& config) {
+ "  -k N     keep going until N jobs fail (0 means infinity) [default=1]\n"
+ "  -l N     do not start new jobs if the load average is greater than N\n"
+ "  -n       dry run (don't run commands but act like they succeeded)\n"
+-"  -m, --tokenpool-master\n"
++#ifdef _WIN32
++"  -m, --tokenpool-master[=sem]\n"
++#else
++"  -m, --tokenpool-master[=fifo|pipe]\n"
++#endif
+ "           enable token pool master for job load balancing with children\n"
+ "\n"
+ "  -d MODE  enable debugging (use '-d list' to list modes)\n"
+@@ -1423,7 +1427,7 @@ int ReadFlags(int* argc, char*** argv,
+   enum { OPT_VERSION = 1, OPT_QUIET = 2 };
+   const option kLongOptions[] = {
+     { "help", no_argument, NULL, 'h' },
+-    { "tokenpool-master", no_argument, NULL, 'm' },
++    { "tokenpool-master", optional_argument, NULL, 'm' },
+     { "version", no_argument, NULL, OPT_VERSION },
+     { "verbose", no_argument, NULL, 'v' },
+     { "quiet", no_argument, NULL, OPT_QUIET },
+@@ -1432,7 +1436,7 @@ int ReadFlags(int* argc, char*** argv,
+ 
+   int opt;
+   while (!options->tool &&
+-         (opt = getopt_long(*argc, *argv, "d:f:j:k:l:mnt:vw:C:h", kLongOptions,
++         (opt = getopt_long(*argc, *argv, "d:f:j:k:l:m::nt:vw:C:h", kLongOptions,
+                             NULL)) != -1) {
+     switch (opt) {
+       case 'd':
+@@ -1477,6 +1481,10 @@ int ReadFlags(int* argc, char*** argv,
+       }
+       case 'm':
+         config->tokenpool_master = true;
++        if (optarg) {
++          if (*optarg == '=') optarg++;
++          config->tokenpool_master_style = optarg;
++        }
+         break;
+       case 'n':
+         config->dry_run = true;
+diff --git a/src/subprocess_test.cc b/src/subprocess_test.cc
+index 9a31f62..9964f97 100644
+--- a/src/subprocess_test.cc
++++ b/src/subprocess_test.cc
+@@ -44,7 +44,8 @@ struct TestTokenPool : public TokenPool {
+                    double& max_load_average) { return false; }
+   bool SetupMaster(bool verbose,
+                    int parallelism,
+-                   double max_load_average)  { return false; }
++                   double max_load_average,
++                   const char* style)  { return false; }
+ 
+ #ifdef _WIN32
+   bool _token_available;
+diff --git a/src/tokenpool-gnu-make-posix.cc b/src/tokenpool-gnu-make-posix.cc
+index 9432bc2..de6c322 100644
+--- a/src/tokenpool-gnu-make-posix.cc
++++ b/src/tokenpool-gnu-make-posix.cc
+@@ -25,6 +25,8 @@
+ #include <stdlib.h>
+ #include <stack>
+ 
++#include "util.h"
++
+ // TokenPool implementation for GNU make jobserver - POSIX implementation
+ // (http://make.mad-scientist.net/papers/jobserver-implementation/)
+ struct GNUmakeTokenPoolPosix : public GNUmakeTokenPool {
+@@ -38,7 +40,9 @@ struct GNUmakeTokenPoolPosix : public GNUmakeTokenPool {
+     return setenv(name, value, 1) == 0;
+   };
+   virtual bool ParseAuth(const char* jobserver);
+-  virtual bool CreatePool(int parallelism, std::string* auth);
++  virtual bool CreatePool(int parallelism,
++                          const char* style,
++                          std::string* auth);
+   virtual bool AcquireToken();
+   virtual bool ReturnToken();
+ 
+@@ -160,32 +164,43 @@ bool GNUmakeTokenPoolPosix::ParseAuth(const char* jobserver) {
+   return false;
+ }
+ 
+-bool GNUmakeTokenPoolPosix::CreatePool(int parallelism, std::string* auth) {
+-  // create jobserver pipe
+-  int fds[2];
+-  if (pipe(fds) < 0)
++bool GNUmakeTokenPoolPosix::CreatePool(int parallelism,
++                                       const char* style,
++                                       std::string* auth) {
++  if (style == NULL || strcmp(style, "fifo") == 0) {
++    // TBD...
+     return false;
++  }
+ 
+-  // add N tokens to pipe
+-  const char token = '+'; // see make/posixos.c
+-  while (parallelism--) {
+-    if (write(fds[1], &token, 1) < 1) {
+-      close(fds[1]);
+-      close(fds[0]);
++  if (strcmp(style, "pipe") == 0) {
++    // create jobserver pipe
++    int fds[2];
++    if (pipe(fds) < 0)
+       return false;
++
++    // add N tokens to pipe
++    const char token = '+'; // see make/posixos.c
++    while (parallelism--) {
++      if (write(fds[1], &token, 1) < 1) {
++        close(fds[1]);
++        close(fds[0]);
++        return false;
++      }
+     }
++
++    // initialize file descriptors for this instance
++    rfd_ = fds[0];
++    wfd_ = fds[1];
++
++    // generate auth parameter for child processes
++    char buffer[32];
++    snprintf(buffer, sizeof(buffer), "%d,%d", rfd_, wfd_);
++    *auth = buffer;
++
++    return true;
+   }
+ 
+-  // initialize file descriptors for this instance
+-  rfd_ = fds[0];
+-  wfd_ = fds[1];
+-
+-  // generate auth parameter for child processes
+-  char buffer[32];
+-  snprintf(buffer, sizeof(buffer), "%d,%d", rfd_, wfd_);
+-  *auth = buffer;
+-
+-  return true;
++  Fatal("unsupported tokenpool style '%s'", style);
+ }
+ 
+ bool GNUmakeTokenPoolPosix::AcquireToken() {
+diff --git a/src/tokenpool-gnu-make-win32.cc b/src/tokenpool-gnu-make-win32.cc
+index df5cb47..e54a3a4 100644
+--- a/src/tokenpool-gnu-make-win32.cc
++++ b/src/tokenpool-gnu-make-win32.cc
+@@ -37,7 +37,9 @@ struct GNUmakeTokenPoolWin32 : public GNUmakeTokenPool {
+   virtual const char* GetEnv(const char* name);
+   virtual bool SetEnv(const char* name, const char* value);
+   virtual bool ParseAuth(const char* jobserver);
+-  virtual bool CreatePool(int parallelism, std::string* auth);
++  virtual bool CreatePool(int parallelism,
++                          const char* style,
++                          std::string* auth);
+   virtual bool AcquireToken();
+   virtual bool ReturnToken();
+ 
+@@ -147,7 +149,13 @@ bool GNUmakeTokenPoolWin32::ParseAuth(const char* jobserver) {
+   return false;
+ }
+ 
+-bool GNUmakeTokenPoolWin32::CreatePool(int parallelism, std::string* auth) {
++bool GNUmakeTokenPoolWin32::CreatePool(int parallelism,
++                                       const char* style,
++                                       std::string* auth) {
++  // there is only one supported style on Windows: sem(aphores)
++  if (style != NULL && strcmp(style, "sem") != 0)
++    Win32Fatal("CreatePool", "unsupported tokenpool style");
++
+   char buffer[100];
+   snprintf(buffer, sizeof(buffer), "gmake_semaphore_%d", _getpid());
+ 
+diff --git a/src/tokenpool-gnu-make.cc b/src/tokenpool-gnu-make.cc
+index 01e72fb..341125d 100644
+--- a/src/tokenpool-gnu-make.cc
++++ b/src/tokenpool-gnu-make.cc
+@@ -73,13 +73,14 @@ bool GNUmakeTokenPool::SetupClient(bool ignore,
+ 
+ bool GNUmakeTokenPool::SetupMaster(bool verbose,
+                                    int parallelism,
+-                                   double max_load_average) {
++                                   double max_load_average,
++                                   const char* style) {
+   // no need to set up token pool for serial builds
+   if (parallelism == 1)
+     return false;
+ 
+   string auth;
+-  if (CreatePool(parallelism, &auth)) {
++  if (CreatePool(parallelism, style, &auth)) {
+     string value = "--jobserver-auth=" + auth;
+     if (max_load_average > 0.0f) {
+       char buffer[32];
+diff --git a/src/tokenpool-gnu-make.h b/src/tokenpool-gnu-make.h
+index 529321b..bd010f2 100644
+--- a/src/tokenpool-gnu-make.h
++++ b/src/tokenpool-gnu-make.h
+@@ -30,13 +30,16 @@ struct GNUmakeTokenPool : public TokenPool {
+                            double& max_load_average);
+   virtual bool SetupMaster(bool verbose,
+                            int parallelism,
+-                           double max_load_average);
++                           double max_load_average,
++                           const char* style);
+ 
+   // platform specific implementation
+   virtual const char* GetEnv(const char* name) = 0;
+   virtual bool SetEnv(const char* name, const char* value) = 0;
+   virtual bool ParseAuth(const char* jobserver) = 0;
+-  virtual bool CreatePool(int parallelism, std::string* auth) = 0;
++  virtual bool CreatePool(int parallelism,
++                          const char* style,
++                          std::string* auth) = 0;
+   virtual bool AcquireToken() = 0;
+   virtual bool ReturnToken() = 0;
+ 
+diff --git a/src/tokenpool.h b/src/tokenpool.h
+index f280155..4ad47e4 100644
+--- a/src/tokenpool.h
++++ b/src/tokenpool.h
+@@ -30,7 +30,8 @@ struct TokenPool {
+                            double& max_load_average) = 0;
+   virtual bool SetupMaster(bool verbose,
+                            int parallelism,
+-                           double max_load_average) = 0;
++                           double max_load_average,
++                           const char* style) = 0;
+ 
+ #ifdef _WIN32
+   virtual void WaitForTokenAvailability(HANDLE ioport) = 0;
+diff --git a/src/tokenpool_test.cc b/src/tokenpool_test.cc
+index 1b8e72f..6d89733 100644
+--- a/src/tokenpool_test.cc
++++ b/src/tokenpool_test.cc
+@@ -135,7 +135,17 @@ struct TokenPoolTest : public testing::Test {
+ 
+   void CreateMaster(int parallelism) {
+     if ((tokens_ = TokenPool::Get()) != NULL) {
+-      if (!tokens_->SetupMaster(false, parallelism, load_avg_)) {
++      if (!tokens_->SetupMaster(
++        false,
++        parallelism,
++        load_avg_,
++#ifdef _WIN32
++        NULL
++#else
++        // @TODO test "fifo" style
++        "pipe"
++#endif
++      )) {
+         delete tokens_;
+         tokens_ = NULL;
+       }
+-- 
+2.44.0
+
diff --git a/meta/recipes-devtools/ninja/files/0020-Add-GNU-make-jobserver-fifo-style-master-support.patch b/meta/recipes-devtools/ninja/files/0020-Add-GNU-make-jobserver-fifo-style-master-support.patch
new file mode 100644
index 0000000000..cb3c5d372a
--- /dev/null
+++ b/meta/recipes-devtools/ninja/files/0020-Add-GNU-make-jobserver-fifo-style-master-support.patch
@@ -0,0 +1,287 @@
+From c9e21dbbc4c746ba397c0f9bec5f65c99f783c08 Mon Sep 17 00:00:00 2001
+From: Stefan Becker <chemobejk@gmail.com>
+Date: Mon, 20 Feb 2023 21:42:32 +0200
+Subject: [PATCH 20/20] Add GNU make jobserver fifo style master support
+
+GNU make 4.4 introduced a new jobserver style "fifo" for POSIX systems
+which passes a named pipe down to the clients.
+
+- split CreatePool() into CreateFifo(), CreatePipe() & CreateTokens()
+- add implementation to CreateFifo() which creates a named pipe in the
+  temp directory
+- make sure the named pipe ise removed in the destructor
+- update non-WIN32 tests to support "fifo" style as default
+- add a test for "pipe" style that isn't compiled for WIN32
+
+Upstream-Status: Submitted [https://github.com/ninja-build/ninja/pull/2263]
+---
+ src/tokenpool-gnu-make-posix.cc | 125 ++++++++++++++++++++++++--------
+ src/tokenpool_test.cc           |  49 ++++++++++---
+ 2 files changed, 132 insertions(+), 42 deletions(-)
+
+diff --git a/src/tokenpool-gnu-make-posix.cc b/src/tokenpool-gnu-make-posix.cc
+index de6c322..585d04a 100644
+--- a/src/tokenpool-gnu-make-posix.cc
++++ b/src/tokenpool-gnu-make-posix.cc
+@@ -20,6 +20,8 @@
+ #include <unistd.h>
+ #include <signal.h>
+ #include <sys/time.h>
++#include <sys/types.h>
++#include <sys/stat.h>
+ #include <stdio.h>
+ #include <string.h>
+ #include <stdlib.h>
+@@ -50,6 +52,7 @@ struct GNUmakeTokenPoolPosix : public GNUmakeTokenPool {
+   int rfd_;
+   int wfd_;
+   bool closeFds_;
++  std::string fifoName_;
+ 
+   struct sigaction old_act_;
+   bool restore_;
+@@ -69,6 +72,9 @@ struct GNUmakeTokenPoolPosix : public GNUmakeTokenPool {
+ 
+   bool CheckFd(int fd);
+   bool CheckFifo(const char* fifo);
++  bool CreateFifo(int parallelism, std::string* auth);
++  bool CreatePipe(int parallelism, std::string* auth);
++  bool CreateTokens(int parallelism, int rfd, int wfd);
+   bool SetAlarmHandler();
+ };
+ 
+@@ -81,6 +87,8 @@ GNUmakeTokenPoolPosix::~GNUmakeTokenPoolPosix() {
+     close(wfd_);
+     close(rfd_);
+   }
++  if (fifoName_.length() > 0)
++    unlink(fifoName_.c_str());
+   if (restore_)
+     sigaction(SIGALRM, &old_act_, NULL);
+ }
+@@ -122,6 +130,88 @@ bool GNUmakeTokenPoolPosix::CheckFifo(const char* fifo) {
+   return true;
+ }
+ 
++bool GNUmakeTokenPoolPosix::CreateFifo(int parallelism,
++                                       std::string* auth) {
++  const char* tmpdir = getenv("TMPDIR");
++  char pid[32];
++  snprintf(pid, sizeof(pid), "%d", getpid());
++
++  // template copied from make/posixos.c
++  std::string fifoName = tmpdir ? tmpdir : "/tmp";
++  fifoName += "/GMfifo";
++  fifoName += pid;
++
++  // create jobserver named FIFO
++  const char* fifoNameCStr = fifoName.c_str();
++  if (mkfifo(fifoNameCStr, 0600) < 0)
++    return false;
++
++  int rfd;
++  if ((rfd = open(fifoNameCStr, O_RDONLY|O_NONBLOCK)) < 0) {
++    unlink(fifoNameCStr);
++    return false;
++  }
++
++  int wfd;
++  if ((wfd = open(fifoNameCStr, O_WRONLY)) < 0) {
++    close(rfd);
++    unlink(fifoNameCStr);
++    return false;
++  }
++
++  if (!CreateTokens(parallelism, rfd, wfd)) {
++    unlink(fifoNameCStr);
++    return false;
++  }
++
++  // initialize FIFO name for this instance
++  closeFds_ = true;
++  fifoName_ = fifoName;
++
++  // generate auth parameter for child processes
++  *auth = "fifo:" + fifoName;
++
++  return true;
++}
++
++bool GNUmakeTokenPoolPosix::CreatePipe(int parallelism,
++                                       std::string* auth) {
++  // create jobserver pipe
++  int fds[2];
++  if (pipe(fds) < 0)
++    return false;
++
++  if (!CreateTokens(parallelism, fds[0], fds[1]))
++    return false;
++
++  // generate auth parameter for child processes
++  char buffer[32];
++  snprintf(buffer, sizeof(buffer), "%d,%d", rfd_, wfd_);
++  *auth = buffer;
++
++  return true;
++}
++
++bool GNUmakeTokenPoolPosix::CreateTokens(int parallelism,
++                                         int rfd,
++                                         int wfd) {
++  // add N tokens to pipe
++  const char token = '+'; // see make/posixos.c
++  while (parallelism--) {
++    if (write(wfd, &token, 1) < 1) {
++      close(wfd);
++      close(rfd);
++      return false;
++    }
++  }
++
++  // initialize file descriptors for this instance
++  rfd_ = rfd;
++  wfd_ = wfd;
++
++  return true;
++}
++
+ int GNUmakeTokenPoolPosix::dup_rfd_ = -1;
+ 
+ void GNUmakeTokenPoolPosix::CloseDupRfd(int signum) {
+@@ -167,38 +257,11 @@ bool GNUmakeTokenPoolPosix::ParseAuth(const char* jobserver) {
+ bool GNUmakeTokenPoolPosix::CreatePool(int parallelism,
+                                        const char* style,
+                                        std::string* auth) {
+-  if (style == NULL || strcmp(style, "fifo") == 0) {
+-    // TBD...
+-    return false;
+-  }
++  if (style == NULL || strcmp(style, "fifo") == 0)
++    return CreateFifo(parallelism, auth);
+ 
+-  if (strcmp(style, "pipe") == 0) {
+-    // create jobserver pipe
+-    int fds[2];
+-    if (pipe(fds) < 0)
+-      return false;
+-
+-    // add N tokens to pipe
+-    const char token = '+'; // see make/posixos.c
+-    while (parallelism--) {
+-      if (write(fds[1], &token, 1) < 1) {
+-        close(fds[1]);
+-        close(fds[0]);
+-        return false;
+-      }
+-    }
+-
+-    // initialize file descriptors for this instance
+-    rfd_ = fds[0];
+-    wfd_ = fds[1];
+-
+-    // generate auth parameter for child processes
+-    char buffer[32];
+-    snprintf(buffer, sizeof(buffer), "%d,%d", rfd_, wfd_);
+-    *auth = buffer;
+-
+-    return true;
+-  }
++  if (strcmp(style, "pipe") == 0)
++    return CreatePipe(parallelism, auth);
+ 
+   Fatal("unsupported tokenpool style '%s'", style);
+ }
+diff --git a/src/tokenpool_test.cc b/src/tokenpool_test.cc
+index 6d89733..62751b7 100644
+--- a/src/tokenpool_test.cc
++++ b/src/tokenpool_test.cc
+@@ -133,18 +133,13 @@ struct TokenPoolTest : public testing::Test {
+   }
+ #endif
+ 
+-  void CreateMaster(int parallelism) {
++  void CreateMaster(int parallelism, const char *style = NULL) {
+     if ((tokens_ = TokenPool::Get()) != NULL) {
+       if (!tokens_->SetupMaster(
+         false,
+         parallelism,
+         load_avg_,
+-#ifdef _WIN32
+-        NULL
+-#else
+-        // @TODO test "fifo" style
+-        "pipe"
+-#endif
++        style
+       )) {
+         delete tokens_;
+         tokens_ = NULL;
+@@ -152,7 +147,7 @@ struct TokenPoolTest : public testing::Test {
+     }
+   }
+ 
+-  void CheckTokens(const char *env, unsigned int tokens) {
++  void CheckTokens(const char *env, unsigned int tokens, const char *style = NULL) {
+ #ifdef _WIN32
+     ASSERT_EQ(env, strstr(env, "--jobserver-auth=gmake_semaphore_"));
+     char *name   = (char *) strchr(env, '=') + 1; // in _env_buffer
+@@ -174,10 +169,20 @@ struct TokenPoolTest : public testing::Test {
+ 
+     CloseHandle(semaphore);
+ #else
+-    int rfd = -1, wfd = -1;
+-    ASSERT_EQ(2u, sscanf(env, "%*[^=]=%d,%d", &rfd, &wfd));
++    int rfd = -1;
++    if (style) {
++      // pipe style
++      int wfd = -1;
++      ASSERT_EQ(2u, sscanf(env, "%*[^=]=%d,%d", &rfd, &wfd));
++      EXPECT_NE(-1, wfd);
++    } else {
++      // default style (fifo)
++      char fifoName[strlen(env) + 1];
++      ASSERT_EQ(1u, sscanf(env, "%*[^=]=fifo:%s", fifoName));
++      rfd = open(fifoName, O_RDONLY);
++    }
++
+     EXPECT_NE(-1, rfd);
+-    EXPECT_NE(-1, wfd);
+ 
+     int flags = fcntl(rfd, F_GETFL, 0);
+     ASSERT_NE(-1, flags);
+@@ -185,6 +190,11 @@ struct TokenPoolTest : public testing::Test {
+ 
+     EXPECT_EQ(tokens, read(rfd, buf_, sizeof(buf_)));
+     EXPECT_EQ(-1,     read(rfd, buf_, sizeof(buf_))); // EWOULDBLOCK
++
++    if (!style) {
++      // close fifo read side
++      ASSERT_EQ(0, close(rfd));
++    }
+ #endif
+   }
+ 
+@@ -455,3 +465,20 @@ TEST_F(TokenPoolTest, MasterWithLoadAvg) {
+ 
+   CheckTokens(env, 3);
+ }
++
++#ifndef _WIN32
++TEST_F(TokenPoolTest, MasterWithPipeStyle) {
++  // kLoadAverageDefault <= 0.0f -> no load averaging
++  CreateMaster(4, "pipe");
++
++  ASSERT_NE(NULL, tokens_);
++
++  const char *env = ENVIRONMENT_GET();
++  ASSERT_NE(NULL, env);
++
++  EXPECT_EQ(env,  strstr(env, "--jobserver-auth="));
++  EXPECT_EQ(NULL, strstr(env, " -l"));
++
++  CheckTokens(env, 4, "pipe");
++}
++#endif
+-- 
+2.44.0
+
diff --git a/meta/recipes-devtools/ninja/ninja_1.11.1.bb b/meta/recipes-devtools/ninja/ninja_1.11.1.bb
deleted file mode 100644
index 8e297ec4d4..0000000000
--- a/meta/recipes-devtools/ninja/ninja_1.11.1.bb
+++ /dev/null
@@ -1,33 +0,0 @@
-SUMMARY = "Ninja is a small build system with a focus on speed."
-HOMEPAGE = "https://ninja-build.org/"
-DESCRIPTION = "Ninja is a small build system with a focus on speed. It differs from other build systems in two major respects: it is designed to have its input files generated by a higher-level build system, and it is designed to run builds as fast as possible."
-LICENSE = "Apache-2.0"
-LIC_FILES_CHKSUM = "file://COPYING;md5=a81586a64ad4e476c791cda7e2f2c52e"
-
-DEPENDS = "re2c-native ninja-native"
-
-SRCREV = "a524bf3f6bacd1b4ad85d719eed2737d8562f27a"
-
-SRC_URI = "git://github.com/ninja-build/ninja.git;branch=release;protocol=https"
-UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>.*)"
-
-S = "${WORKDIR}/git"
-
-do_configure[noexec] = "1"
-
-do_compile:class-native() {
-	python3 ./configure.py --bootstrap
-}
-
-do_compile() {
-	python3 ./configure.py
-	ninja
-}
-
-do_install() {
-	install -D -m 0755  ${S}/ninja ${D}${bindir}/ninja
-}
-
-BBCLASSEXTEND = "native nativesdk"
-
-CVE_STATUS[CVE-2021-4336] = "cpe-incorrect: This is a different Ninja"
diff --git a/meta/recipes-devtools/ninja/ninja_1.12.0.bb b/meta/recipes-devtools/ninja/ninja_1.12.0.bb
new file mode 100644
index 0000000000..a7dcdc0d1f
--- /dev/null
+++ b/meta/recipes-devtools/ninja/ninja_1.12.0.bb
@@ -0,0 +1,55 @@
+SUMMARY = "Ninja is a small build system with a focus on speed."
+HOMEPAGE = "https://ninja-build.org/"
+DESCRIPTION = "Ninja is a small build system with a focus on speed. It differs from other build systems in two major respects: it is designed to have its input files generated by a higher-level build system, and it is designed to run builds as fast as possible."
+LICENSE = "Apache-2.0"
+LIC_FILES_CHKSUM = "file://COPYING;md5=a81586a64ad4e476c791cda7e2f2c52e"
+
+DEPENDS = "re2c-native ninja-native"
+
+SRCREV = "2d9083b2608bd60c31583193d321d13a81a75beb"
+
+SRC_URI = " \
+    git://github.com/ninja-build/ninja.git;branch=master;protocol=https \
+    file://0001-Add-GNU-make-jobserver-client-support.patch \
+    file://0002-Add-TokenPool-monitoring-to-SubprocessSet-DoWork.patch \
+    file://0003-Ignore-jobserver-when-jN-is-forced-on-command-line.patch \
+    file://0004-Honor-lN-from-MAKEFLAGS.patch \
+    file://0005-Use-LinePrinter-for-TokenPool-messages.patch \
+    file://0006-Prepare-PR-for-merging.patch \
+    file://0007-Add-tests-for-TokenPool.patch \
+    file://0008-Add-tests-for-subprocess-module.patch \
+    file://0009-Add-tests-for-build-module.patch \
+    file://0010-Add-Win32-implementation-for-GNUmakeTokenPool.patch \
+    file://0011-Prepare-PR-for-merging-part-II.patch \
+    file://0012-Rename-TokenPool-Setup-to-SetupClient.patch \
+    file://0013-Add-TokenPool-SetupMaster-method.patch \
+    file://0014-Add-command-line-option-m-tokenpool-master.patch \
+    file://0015-Implement-GNUmakeTokenPool-SetupMaster.patch \
+    file://0016-Implement-GNUmakeTokenPool-CreatePool.patch \
+    file://0017-Add-tests-for-TokenPool-SetupMaster.patch \
+    file://0018-Add-GNU-make-jobserver-fifo-style-client-support.patch \
+    file://0019-Add-optional-argument-to-m-tokenpool-master.patch \
+    file://0020-Add-GNU-make-jobserver-fifo-style-master-support.patch \
+"
+UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>.*)"
+
+S = "${WORKDIR}/git"
+
+do_configure[noexec] = "1"
+
+do_compile:class-native() {
+	python3 ./configure.py --bootstrap
+}
+
+do_compile() {
+	python3 ./configure.py
+	ninja
+}
+
+do_install() {
+	install -D -m 0755  ${S}/ninja ${D}${bindir}/ninja
+}
+
+BBCLASSEXTEND = "native nativesdk"
+
+CVE_STATUS[CVE-2021-4336] = "cpe-incorrect: This is a different Ninja"
-- 
2.44.0


