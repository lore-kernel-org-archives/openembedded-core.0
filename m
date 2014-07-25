Return-Path: <gary.robertson@linaro.org>
Received: from mail-oi0-f53.google.com (mail-oi0-f53.google.com
	[209.85.218.53])
	by mail.openembedded.org (Postfix) with ESMTP id 5E640706C6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Jul 2014 22:21:05 +0000 (UTC)
Received: by mail-oi0-f53.google.com with SMTP id e131so3908210oig.40
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Jul 2014 15:21:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=PULX4Cgx64rKqq6OwUljeyhietlULvRms6fW/A8DPrc=;
	b=HxIiqxnhJyCPEo4cqgIkXlMFYhSgeCwfRD3cHTCdA85F6JypphEvHZMCmxuLfDEKXu
	EI/kSTT+OoVCCCCqwCi1tIyA3M+5w+F9OXveZ5Q+jBGuldMXu/4sCQht260xCMEwYmt0
	SSOlEaGmhrZPe/n5AQ7YdeKPk/vCyfklJm/tcDmSNYrqaHIfOW8xbDxZDELVmY3wuz+m
	GvYSNDEVBajOd2GPLJ8DYUVpntvbSCpKlvuj6Po/aoo9+wjtlU0DJXz23MEyrMgr3TqT
	2wn4ax3BpZcxi/JVm57j0ZQbFUy4MdElu3CU3bZoU+FjKLkSJKgzdcKT++6OS7zsghLL
	6Sxg==
X-Gm-Message-State: ALoCoQmWR/RpfzwhmZpkPWnKcyVrg+V33M82jPYggc/UAwt55yDSp5fzY3UCWwn7ivlIowrnGpP3
X-Received: by 10.182.199.5 with SMTP id jg5mr26954240obc.75.1406326866932;
	Fri, 25 Jul 2014 15:21:06 -0700 (PDT)
Received: from honkintosh.cybertech.lan (65-120-133-114.dia.static.qwest.net.
	[65.120.133.114])
	by mx.google.com with ESMTPSA id q3sm40881371oei.3.2014.07.25.15.21.06
	for <multiple recipients>
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 25 Jul 2014 15:21:06 -0700 (PDT)
From: "Gary S. Robertson" <gary.robertson@linaro.org>
To: openembedded-core@lists.openembedded.org
Date: Fri, 25 Jul 2014 17:20:43 -0500
Message-Id: <1406326845-17506-2-git-send-email-gary.robertson@linaro.org>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1406326845-17506-1-git-send-email-gary.robertson@linaro.org>
References: <1406326845-17506-1-git-send-email-gary.robertson@linaro.org>
Cc: mike.holmes@linaro.org
Subject: [PATCH 1/3] LTP: Realtime tests - Allow-mutex-initialization-without-PI-configured
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
X-List-Received-Date: Fri, 25 Jul 2014 22:21:12 -0000

From: "Gary S. Robertson" <gary.robertson@linaro.org>

In the OE build environment the features on the build host
may not match those of the runtime host -so- the conditional
compilation clauses were deleted which required the presence
of priority inheriting mutexes in order to compile initialization
of a mutex with priority inheritance.  This allows this code to
execute and fail if the runtime host lacks priority inheritance,
while eliminating any dependence on PI mutexes in the build host.

Signed-off-by: Gary S. Robertson <gary.robertson@linaro.org>
---
 ...utex-initialization-without-PI-configured.patch |   66 ++++++++++++++++++++
 meta/recipes-extended/ltp/ltp_20140422.bb          |    1 +
 2 files changed, 67 insertions(+)
 create mode 100644 meta/recipes-extended/ltp/ltp/0001-Allow-mutex-initialization-without-PI-configured.patch

diff --git a/meta/recipes-extended/ltp/ltp/0001-Allow-mutex-initialization-without-PI-configured.patch b/meta/recipes-extended/ltp/ltp/0001-Allow-mutex-initialization-without-PI-configured.patch
new file mode 100644
index 0000000..2de6e22
--- /dev/null
+++ b/meta/recipes-extended/ltp/ltp/0001-Allow-mutex-initialization-without-PI-configured.patch
@@ -0,0 +1,66 @@
+From 62dfb25fa3b6e71650bc3fff9a4a0eaec0f5ac8e Mon Sep 17 00:00:00 2001
+From: "Gary S. Robertson" <gary.robertson@linaro.org>
+Date: Fri, 25 Jul 2014 09:25:13 -0500
+Subject: [PATCH] Allow mutex initialization without PI configured
+
+LTP is primarily intended to be built and run on the same machine,
+and uses autotools / autoconf to determine the features of the host
+machine's environment prior to compilation.  However in the OE
+environment, LTP may get built into a generic filesystem image
+which will be used with a variety of different kernels later...
+so for the OE environment it is better not to disable features
+based on the compile-time environment.  This patch removes
+compile-time dependencies on priority-inheriting mutexes and
+allows the code to attempt initialization of PI mutexes even
+if the runtime environment lacks that feature... in which case
+the associated test should fail.
+
+Signed-off-by: Gary S. Robertson <gary.robertson@linaro.org>
+---
+ testcases/realtime/lib/librttest.c            |    2 --
+ testcases/realtime/stress/pi-tests/testpi-3.c |    2 --
+ 2 files changed, 4 deletions(-)
+
+diff --git a/testcases/realtime/lib/librttest.c b/testcases/realtime/lib/librttest.c
+index 0dd6019..9f37d08 100644
+--- a/testcases/realtime/lib/librttest.c
++++ b/testcases/realtime/lib/librttest.c
+@@ -586,7 +586,6 @@ void *busy_work_us(int us)
+ 
+ void init_pi_mutex(pthread_mutex_t * m)
+ {
+-#if HAVE_DECL_PTHREAD_PRIO_INHERIT
+ 	pthread_mutexattr_t attr;
+ 	int ret;
+ 	int protocol;
+@@ -609,7 +608,6 @@ void init_pi_mutex(pthread_mutex_t * m)
+ 	if ((ret = pthread_mutex_init(m, &attr)) != 0) {
+ 		printf("Failed to init mutex: %d (%s)\n", ret, strerror(ret));
+ 	}
+-#endif
+ 
+ 	/* FIXME: does any of this need to be destroyed ? */
+ }
+diff --git a/testcases/realtime/stress/pi-tests/testpi-3.c b/testcases/realtime/stress/pi-tests/testpi-3.c
+index 30f38f6..807c9cc 100644
+--- a/testcases/realtime/stress/pi-tests/testpi-3.c
++++ b/testcases/realtime/stress/pi-tests/testpi-3.c
+@@ -365,7 +365,6 @@ int main(int argc, char *argv[])
+ 
+ 	printf("Start %s\n", argv[0]);
+ 
+-#if HAVE_DECL_PTHREAD_PRIO_INHERIT
+ 	if (!nopi) {
+ 		pthread_mutexattr_t mutexattr;
+ 		int protocol;
+@@ -386,7 +385,6 @@ int main(int argc, char *argv[])
+ 			printf("Failed to init mutex: %d\n", retc);
+ 		}
+ 	}
+-#endif
+ 
+ 	startThread(&arg1);
+ 	startThread(&arg2);
+-- 
+1.7.9.5
+
diff --git a/meta/recipes-extended/ltp/ltp_20140422.bb b/meta/recipes-extended/ltp/ltp_20140422.bb
index 30761fd..2ac2187 100644
--- a/meta/recipes-extended/ltp/ltp_20140422.bb
+++ b/meta/recipes-extended/ltp/ltp_20140422.bb
@@ -26,6 +26,7 @@ SRC_URI = "git://github.com/linux-test-project/ltp.git \
     file://0001-Rename-runtests_noltp.sh-script-so-have-unique-name.patch \
     file://ltp-Do-not-link-against-libfl.patch \
     file://automake-foreign.patch \
+    file://0001-Allow-mutex-initialization-without-PI-configured.patch \
 "
 
 S = "${WORKDIR}/git"
-- 
1.7.9.5


