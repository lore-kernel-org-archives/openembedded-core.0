Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 31545C4345F
	for <webhook@archiver.kernel.org>; Thu, 25 Apr 2024 11:31:00 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
 by mx.groups.io with SMTP id smtpd.web10.14564.1714044658141421108
 for <openembedded-core@lists.openembedded.org>;
 Thu, 25 Apr 2024 04:30:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=LHnzjZC4;
 spf=pass (domain: bootlin.com, ip: 217.70.183.200, mailfrom: alexandre.belloni@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 876E020002;
	Thu, 25 Apr 2024 11:30:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1714044656;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Y69wV5nxyKDYp2/G5MPHHt2uM9lJXI5Tw5eBTfnkzZU=;
	b=LHnzjZC4q6jB+dTscpuPFt8rBfCwF4cRVoc2Vn4nbj/QREs/iD11jeoqWpOC6hUsuxsPUm
	VEO6TCwNP/+Oq+KMQqnnakc4E7mTuENmH8/aGSS4IqDlS3gVWs2fNDe7jDhNFl5mbn51Nh
	HA+M8No6q+7H03SvG+9m34eUHY/SJsd4uPcw7mYVSQAX4q2s9j8MFUzobMr59VLuXiLItK
	SQ2vwmg/TIU9QxCMWhSmL+vhzS54xH9ICPrJy/2+z6dDJvHbt04pRNxjiIUFhyQPybrIOX
	ovJxkJAsVhWeF4WRbwYuXJcHUyDk5HYG4Px/4wdrzsUDiQOAby2i58PSV8BXiw==
Date: Thu, 25 Apr 2024 13:30:55 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Martin Hundeb?ll <martin@geanix.com>
Cc: openembedded-core@lists.openembedded.org,
	Alexander Kanavin <alex.kanavin@gmail.com>,
	Khem Raj <raj.khem@gmail.com>,
	Randy MacLeod <randy.macleod@windriver.com>,
	Andreas Helbech Kleist <andreaskleist@gmail.com>
Subject: Re: [OE-core] [PATCH v2 3/5] ninja: build modified version with GNU
 Make jobserver support
Message-ID: <202404251130553913ebd5@mail.local>
References: <20240404111613.2574424-1-martin@geanix.com>
 <20240404111613.2574424-4-martin@geanix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240404111613.2574424-4-martin@geanix.com>
X-GND-Sasl: alexandre.belloni@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 25 Apr 2024 11:31:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198700

Hello,

This patch doesn't apply on master anymore because ninja has been updated.


On 04/04/2024 13:16:11+0200, Martin Hundeb?ll wrote:
> Ninja doesn't (yet) support the GNU Make jobserver out of the box, but
> there is a pull request adding that support[1]. Since that pull request
> (and its derived three-part pull requests) seem to be ignored by
> upstream, kitware (creator/maintainer of cmake) has created a fork[2]
> only to carry the jobserver patches. Change the source uri to point at
> the kitware fork of ninja, and add two patches from the original pull
> request to also support the new-style fifo jobserver feature.
> 
> Note that the kitware fork of ninja is also used by buildroot[3].
> 
> [1] https://github.com/ninja-build/ninja/pull/2263
> [2] https://github.com/Kitware/ninja
> [3] https://gitlab.com/buildroot.org/buildroot/-/blob/master/package/ninja/ninja.mk
> 
> Signed-off-by: Martin Hundeb�ll <martin@geanix.com>
> ---
>  ...ename-TokenPool-Setup-to-SetupClient.patch | 113 ++++++++
>  ...-jobserver-fifo-style-client-support.patch | 271 ++++++++++++++++++
>  meta/recipes-devtools/ninja/ninja_1.11.1.bb   |   8 +-
>  3 files changed, 390 insertions(+), 2 deletions(-)
>  create mode 100644 meta/recipes-devtools/ninja/files/0001-Rename-TokenPool-Setup-to-SetupClient.patch
>  create mode 100644 meta/recipes-devtools/ninja/files/0002-Add-GNU-make-jobserver-fifo-style-client-support.patch
> 
> diff --git a/meta/recipes-devtools/ninja/files/0001-Rename-TokenPool-Setup-to-SetupClient.patch b/meta/recipes-devtools/ninja/files/0001-Rename-TokenPool-Setup-to-SetupClient.patch
> new file mode 100644
> index 0000000000..a503f8c75f
> --- /dev/null
> +++ b/meta/recipes-devtools/ninja/files/0001-Rename-TokenPool-Setup-to-SetupClient.patch
> @@ -0,0 +1,113 @@
> +From f5642d8b49688dfc84679451b531d92f3b6e7cb0 Mon Sep 17 00:00:00 2001
> +From: Stefan Becker <chemobejk@gmail.com>
> +Date: Sat, 15 Dec 2018 19:29:42 +0200
> +Subject: [PATCH 1/2] Rename TokenPool::Setup() to SetupClient()
> +MIME-Version: 1.0
> +Content-Type: text/plain; charset=UTF-8
> +Content-Transfer-Encoding: 8bit
> +
> +Make space to add new API to set up token pool master.
> +
> +Signed-off-by: Martin Hundeb�ll <martin@geanix.com>
> +Upstream-Status: Submitted [https://github.com/Kitware/ninja/pull/2]
> +---
> + src/build.cc              | 6 +++---
> + src/subprocess_test.cc    | 3 ++-
> + src/tokenpool-gnu-make.cc | 6 +++---
> + src/tokenpool-gnu-make.h  | 3 ++-
> + src/tokenpool.h           | 3 ++-
> + src/tokenpool_test.cc     | 2 +-
> + 6 files changed, 13 insertions(+), 10 deletions(-)
> +
> +diff --git a/src/build.cc b/src/build.cc
> +index 53e4405..d8a6dff 100644
> +--- a/src/build.cc
> ++++ b/src/build.cc
> +@@ -474,9 +474,9 @@ struct RealCommandRunner : public CommandRunner {
> + RealCommandRunner::RealCommandRunner(const BuildConfig& config) : config_(config) {
> +   max_load_average_ = config.max_load_average;
> +   if ((tokens_ = TokenPool::Get()) != NULL) {
> +-    if (!tokens_->Setup(config_.parallelism_from_cmdline,
> +-                        config_.verbosity == BuildConfig::VERBOSE,
> +-                        max_load_average_)) {
> ++    if (!tokens_->SetupClient(config_.parallelism_from_cmdline,
> ++                              config_.verbosity == BuildConfig::VERBOSE,
> ++                              max_load_average_)) {
> +       delete tokens_;
> +       tokens_ = NULL;
> +     }
> +diff --git a/src/subprocess_test.cc b/src/subprocess_test.cc
> +index eddc110..222b59b 100644
> +--- a/src/subprocess_test.cc
> ++++ b/src/subprocess_test.cc
> +@@ -40,7 +40,8 @@ struct TestTokenPool : public TokenPool {
> +   void Reserve()     {}
> +   void Release()     {}
> +   void Clear()       {}
> +-  bool Setup(bool ignore_unused, bool verbose, double& max_load_average) { return false; }
> ++  bool SetupClient(bool ignore_unused, bool verbose,
> ++                   double& max_load_average) { return false; }
> + 
> + #ifdef _WIN32
> +   bool _token_available;
> +diff --git a/src/tokenpool-gnu-make.cc b/src/tokenpool-gnu-make.cc
> +index 60e0552..6fb72a6 100644
> +--- a/src/tokenpool-gnu-make.cc
> ++++ b/src/tokenpool-gnu-make.cc
> +@@ -28,9 +28,9 @@ GNUmakeTokenPool::GNUmakeTokenPool() : available_(1), used_(0) {
> + GNUmakeTokenPool::~GNUmakeTokenPool() {
> + }
> + 
> +-bool GNUmakeTokenPool::Setup(bool ignore,
> +-                             bool verbose,
> +-                             double& max_load_average) {
> ++bool GNUmakeTokenPool::SetupClient(bool ignore,
> ++                                   bool verbose,
> ++                                   double& max_load_average) {
> +   const char* value = GetEnv("MAKEFLAGS");
> +   if (!value)
> +     return false;
> +diff --git a/src/tokenpool-gnu-make.h b/src/tokenpool-gnu-make.h
> +index c94cca5..f4ab8d7 100644
> +--- a/src/tokenpool-gnu-make.h
> ++++ b/src/tokenpool-gnu-make.h
> +@@ -24,7 +24,8 @@ struct GNUmakeTokenPool : public TokenPool {
> +   virtual void Reserve();
> +   virtual void Release();
> +   virtual void Clear();
> +-  virtual bool Setup(bool ignore, bool verbose, double& max_load_average);
> ++  virtual bool SetupClient(bool ignore, bool verbose,
> ++                           double& max_load_average);
> + 
> +   // platform specific implementation
> +   virtual const char* GetEnv(const char* name) = 0;
> +diff --git a/src/tokenpool.h b/src/tokenpool.h
> +index 931c227..ce2bf48 100644
> +--- a/src/tokenpool.h
> ++++ b/src/tokenpool.h
> +@@ -26,7 +26,8 @@ struct TokenPool {
> +   virtual void Clear() = 0;
> + 
> +   // returns false if token pool setup failed
> +-  virtual bool Setup(bool ignore, bool verbose, double& max_load_average) = 0;
> ++  virtual bool SetupClient(bool ignore, bool verbose,
> ++                           double& max_load_average) = 0;
> + 
> + #ifdef _WIN32
> +   virtual void WaitForTokenAvailability(HANDLE ioport) = 0;
> +diff --git a/src/tokenpool_test.cc b/src/tokenpool_test.cc
> +index 1bc1c84..9d07146 100644
> +--- a/src/tokenpool_test.cc
> ++++ b/src/tokenpool_test.cc
> +@@ -77,7 +77,7 @@ struct TokenPoolTest : public testing::Test {
> +       ENVIRONMENT_INIT(buf_);
> +     }
> +     if ((tokens_ = TokenPool::Get()) != NULL) {
> +-      if (!tokens_->Setup(ignore_jobserver, false, load_avg_)) {
> ++      if (!tokens_->SetupClient(ignore_jobserver, false, load_avg_)) {
> +         delete tokens_;
> +         tokens_ = NULL;
> +       }
> +-- 
> +2.44.0
> +
> diff --git a/meta/recipes-devtools/ninja/files/0002-Add-GNU-make-jobserver-fifo-style-client-support.patch b/meta/recipes-devtools/ninja/files/0002-Add-GNU-make-jobserver-fifo-style-client-support.patch
> new file mode 100644
> index 0000000000..770a53fbc9
> --- /dev/null
> +++ b/meta/recipes-devtools/ninja/files/0002-Add-GNU-make-jobserver-fifo-style-client-support.patch
> @@ -0,0 +1,271 @@
> +From 830b7fb396383171c5fac2aae7de880ac83ce955 Mon Sep 17 00:00:00 2001
> +From: Stefan Becker <chemobejk@gmail.com>
> +Date: Mon, 7 Nov 2022 20:45:27 +0200
> +Subject: [PATCH 2/2] Add GNU make jobserver fifo style client support
> +MIME-Version: 1.0
> +Content-Type: text/plain; charset=UTF-8
> +Content-Transfer-Encoding: 8bit
> +
> +GNU make 4.4 introduced a new jobserver style "fifo" for POSIX systems
> +which passes a named pipe down to the clients.
> +
> +- update auth parser to recognize "fifo:<name>" format
> +- open named pipe for reading and writing
> +- make sure the file descriptors are closed in the destructor
> +- add 2 tests that aren't compiled for WIN32
> +
> +Signed-off-by: Martin Hundeb�ll <martin@geanix.com>
> +Upstream-Status: Submitted [https://github.com/Kitware/ninja/pull/2]
> +---
> + src/tokenpool-gnu-make-posix.cc | 46 ++++++++++++++++-
> + src/tokenpool_test.cc           | 88 ++++++++++++++++++++++++++++++---
> + 2 files changed, 127 insertions(+), 7 deletions(-)
> +
> +diff --git a/src/tokenpool-gnu-make-posix.cc b/src/tokenpool-gnu-make-posix.cc
> +index 8447070..a82cce4 100644
> +--- a/src/tokenpool-gnu-make-posix.cc
> ++++ b/src/tokenpool-gnu-make-posix.cc
> +@@ -40,6 +40,7 @@ struct GNUmakeTokenPoolPosix : public GNUmakeTokenPool {
> +  private:
> +   int rfd_;
> +   int wfd_;
> ++  bool closeFds_;
> + 
> +   struct sigaction old_act_;
> +   bool restore_;
> +@@ -48,14 +49,19 @@ struct GNUmakeTokenPoolPosix : public GNUmakeTokenPool {
> +   static void CloseDupRfd(int signum);
> + 
> +   bool CheckFd(int fd);
> ++  bool CheckFifo(const char* fifo);
> +   bool SetAlarmHandler();
> + };
> + 
> +-GNUmakeTokenPoolPosix::GNUmakeTokenPoolPosix() : rfd_(-1), wfd_(-1), restore_(false) {
> ++GNUmakeTokenPoolPosix::GNUmakeTokenPoolPosix() : rfd_(-1), wfd_(-1), closeFds_(false), restore_(false) {
> + }
> + 
> + GNUmakeTokenPoolPosix::~GNUmakeTokenPoolPosix() {
> +   Clear();
> ++  if (closeFds_) {
> ++    close(wfd_);
> ++    close(rfd_);
> ++  }
> +   if (restore_)
> +     sigaction(SIGALRM, &old_act_, NULL);
> + }
> +@@ -69,6 +75,36 @@ bool GNUmakeTokenPoolPosix::CheckFd(int fd) {
> +   return true;
> + }
> + 
> ++bool GNUmakeTokenPoolPosix::CheckFifo(const char* fifo) {
> ++  // remove possible junk from end of fifo name
> ++  char *filename = strdup(fifo);
> ++  char *end;
> ++  if ((end = strchr(filename, ' ')) != NULL) {
> ++    *end = '\0';
> ++  }
> ++
> ++  int rfd = open(filename, O_RDONLY);
> ++  if (rfd < 0) {
> ++    free(filename);
> ++    return false;
> ++  }
> ++
> ++  int wfd = open(filename, O_WRONLY);
> ++  if (wfd < 0) {
> ++    close(rfd);
> ++    free(filename);
> ++    return false;
> ++  }
> ++
> ++  free(filename);
> ++
> ++  rfd_ = rfd;
> ++  wfd_ = wfd;
> ++  closeFds_ = true;
> ++
> ++  return true;
> ++}
> ++
> + int GNUmakeTokenPoolPosix::dup_rfd_ = -1;
> + 
> + void GNUmakeTokenPoolPosix::CloseDupRfd(int signum) {
> +@@ -89,6 +125,13 @@ bool GNUmakeTokenPoolPosix::SetAlarmHandler() {
> + }
> + 
> + bool GNUmakeTokenPoolPosix::ParseAuth(const char* jobserver) {
> ++  // check for jobserver-fifo style
> ++  const char* fifo;
> ++  if (((fifo = strstr(jobserver, "=fifo:")) != NULL) &&
> ++      CheckFifo(fifo + 6))
> ++    return SetAlarmHandler();
> ++
> ++  // check for legacy simple pipe style
> +   int rfd = -1;
> +   int wfd = -1;
> +   if ((sscanf(jobserver, "%*[^=]=%d,%d", &rfd, &wfd) == 2) &&
> +@@ -100,6 +143,7 @@ bool GNUmakeTokenPoolPosix::ParseAuth(const char* jobserver) {
> +     return true;
> +   }
> + 
> ++  // some jobserver style we don't support
> +   return false;
> + }
> + 
> +diff --git a/src/tokenpool_test.cc b/src/tokenpool_test.cc
> +index 9d07146..e15da6c 100644
> +--- a/src/tokenpool_test.cc
> ++++ b/src/tokenpool_test.cc
> +@@ -19,7 +19,10 @@
> + #ifdef _WIN32
> + #include <windows.h>
> + #else
> ++#include <fcntl.h>
> + #include <unistd.h>
> ++#include <sys/types.h>
> ++#include <sys/stat.h>
> + #endif
> + 
> + #include <stdio.h>
> +@@ -35,6 +38,8 @@
> + #define AUTH_FORMAT(tmpl)   "foo " tmpl "=%d,%d bar"
> + #define ENVIRONMENT_CLEAR() unsetenv("MAKEFLAGS")
> + #define ENVIRONMENT_INIT(v) setenv("MAKEFLAGS", v, true)
> ++
> ++#define FIFO_NAME "ninja-test-tokenpool-fifo"
> + #endif
> + 
> + namespace {
> +@@ -60,11 +65,24 @@ struct TokenPoolTest : public testing::Test {
> +     semaphore_name_ = SEMAPHORE_NAME;
> +     if ((semaphore_ = CreateSemaphore(0, 0, 2, SEMAPHORE_NAME)) == NULL)
> + #else
> ++    if (mkfifo(FIFO_NAME, 0600) < 0) {
> ++      ASSERT_TRUE(false);
> ++    }
> ++
> +     if (pipe(fds_) < 0)
> + #endif
> +       ASSERT_TRUE(false);
> +   }
> + 
> ++  void GetPool(bool ignore_jobserver) {
> ++    if ((tokens_ = TokenPool::Get()) != NULL) {
> ++      if (!tokens_->SetupClient(ignore_jobserver, false, load_avg_)) {
> ++        delete tokens_;
> ++        tokens_ = NULL;
> ++      }
> ++    }
> ++  }
> ++
> +   void CreatePool(const char* format, bool ignore_jobserver = false) {
> +     if (format) {
> +       sprintf(buf_, format,
> +@@ -76,18 +94,30 @@ struct TokenPoolTest : public testing::Test {
> +       );
> +       ENVIRONMENT_INIT(buf_);
> +     }
> +-    if ((tokens_ = TokenPool::Get()) != NULL) {
> +-      if (!tokens_->SetupClient(ignore_jobserver, false, load_avg_)) {
> +-        delete tokens_;
> +-        tokens_ = NULL;
> +-      }
> +-    }
> ++    GetPool(ignore_jobserver);
> +   }
> + 
> +   void CreateDefaultPool() {
> +     CreatePool(AUTH_FORMAT("--jobserver-auth"));
> +   }
> + 
> ++#ifndef _WIN32
> ++  void CreateFifoPool() {
> ++    // close simple pipe fds...
> ++    close(fds_[0]);
> ++    close(fds_[1]);
> ++
> ++    // ... and open named pipe instead
> ++    if ((fds_[0] = open(FIFO_NAME, O_RDONLY|O_NONBLOCK)) < 0)
> ++      ASSERT_TRUE(false);
> ++    if ((fds_[1] = open(FIFO_NAME, O_WRONLY)) < 0)
> ++      ASSERT_TRUE(false);
> ++
> ++    ENVIRONMENT_INIT("foo --jobserver-auth=fifo:" FIFO_NAME " bar");
> ++    GetPool(false);
> ++  }
> ++#endif
> ++
> +   virtual void TearDown() {
> +     if (tokens_)
> +       delete tokens_;
> +@@ -96,6 +126,7 @@ struct TokenPoolTest : public testing::Test {
> + #else
> +     close(fds_[0]);
> +     close(fds_[1]);
> ++    unlink(FIFO_NAME);
> + #endif
> +     ENVIRONMENT_CLEAR();
> +   }
> +@@ -167,6 +198,15 @@ TEST_F(TokenPoolTest, MonitorFD) {
> + 
> +   EXPECT_EQ(fds_[0], tokens_->GetMonitorFd());
> + }
> ++
> ++TEST_F(TokenPoolTest, MonitorFDFifo) {
> ++  CreateFifoPool();
> ++
> ++  ASSERT_NE(NULL, tokens_);
> ++  EXPECT_EQ(kLoadAverageDefault, load_avg_);
> ++
> ++  EXPECT_NE(-1, tokens_->GetMonitorFd());
> ++}
> + #endif
> + 
> + TEST_F(TokenPoolTest, ImplicitToken) {
> +@@ -226,6 +266,42 @@ TEST_F(TokenPoolTest, TwoTokens) {
> +   EXPECT_TRUE(tokens_->Acquire());
> + }
> + 
> ++#ifndef _WIN32
> ++TEST_F(TokenPoolTest, TwoTokensFifo) {
> ++  CreateFifoPool();
> ++
> ++  ASSERT_NE(NULL, tokens_);
> ++  EXPECT_EQ(kLoadAverageDefault, load_avg_);
> ++
> ++  // implicit token
> ++  EXPECT_TRUE(tokens_->Acquire());
> ++  tokens_->Reserve();
> ++  EXPECT_FALSE(tokens_->Acquire());
> ++
> ++  // jobserver offers 2nd token
> ++  char test_tokens[1] = { '+' };
> ++  ASSERT_EQ(1u, write(fds_[1], test_tokens, sizeof(test_tokens)));
> ++  EXPECT_TRUE(tokens_->Acquire());
> ++  tokens_->Reserve();
> ++  EXPECT_FALSE(tokens_->Acquire());
> ++
> ++  // release 2nd token
> ++  tokens_->Release();
> ++  EXPECT_TRUE(tokens_->Acquire());
> ++
> ++  // release implicit token - must return 2nd token back to jobserver
> ++  tokens_->Release();
> ++  EXPECT_TRUE(tokens_->Acquire());
> ++
> ++  // there must be one token available
> ++  EXPECT_EQ(1u, read(fds_[0], buf_, sizeof(buf_)));
> ++  EXPECT_EQ(test_tokens[0], buf_[0]);
> ++
> ++  // implicit token
> ++  EXPECT_TRUE(tokens_->Acquire());
> ++}
> ++#endif
> ++
> + TEST_F(TokenPoolTest, Clear) {
> +   CreateDefaultPool();
> + 
> +-- 
> +2.44.0
> +
> diff --git a/meta/recipes-devtools/ninja/ninja_1.11.1.bb b/meta/recipes-devtools/ninja/ninja_1.11.1.bb
> index 8e297ec4d4..dbff2e191a 100644
> --- a/meta/recipes-devtools/ninja/ninja_1.11.1.bb
> +++ b/meta/recipes-devtools/ninja/ninja_1.11.1.bb
> @@ -6,9 +6,13 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=a81586a64ad4e476c791cda7e2f2c52e"
>  
>  DEPENDS = "re2c-native ninja-native"
>  
> -SRCREV = "a524bf3f6bacd1b4ad85d719eed2737d8562f27a"
> +SRCREV = "95dee2a91d96c409d54f9fa0b70ea9aa2bdf8e63"
>  
> -SRC_URI = "git://github.com/ninja-build/ninja.git;branch=release;protocol=https"
> +SRC_URI = " \
> +    git://github.com/kitware/ninja.git;branch=kitware-staged-features;protocol=https \
> +    file://0001-Rename-TokenPool-Setup-to-SetupClient.patch \
> +    file://0002-Add-GNU-make-jobserver-fifo-style-client-support.patch \
> +"
>  UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>.*)"
>  
>  S = "${WORKDIR}/git"
> -- 
> 2.44.0
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#197956): https://lists.openembedded.org/g/openembedded-core/message/197956
> Mute This Topic: https://lists.openembedded.org/mt/105326967/3617179
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alexandre.belloni@bootlin.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

