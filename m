Return-Path: <gary.robertson@linaro.org>
Received: from mail-oa0-f47.google.com (mail-oa0-f47.google.com
	[209.85.219.47])
	by mail.openembedded.org (Postfix) with ESMTP id 23F506AC9D
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Jul 2014 22:21:06 +0000 (UTC)
Received: by mail-oa0-f47.google.com with SMTP id g18so6311743oah.20
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Jul 2014 15:21:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=2hPtT1rqhWDqv/vWD9WksX17F/WsiIi1s0qgdOob6sQ=;
	b=KX9QSmaIUU1xt/WiHxqXPOTsaEKkzyLmbPjnEAGz5oTuOAafLvz9IA2Mh9vK9VsoWC
	9WKIWxm8LwIPryQF8RbPVqgaQulwSO5kWduQCM1stEUmubm80Br0COX0tg72M+E9uRvV
	icOxH3tOxbxJUz+6t240L9G9c7ysUYqF4/x/HWQ7lowDoEt8M64YvQ7hkLTCxDHkImzu
	Ains+4CvE5M3efx2Rw0cRXSed72DHftXU5K+Fn3bR80eo1U7uQphab6s/gTV3wkPOAsR
	q1PkRUTrgRgIn3k3dn+ZQE9B8ggVXMgX7roBYTJ2/YaOe+dy4F7W6BDRmWJgGRBkiXBZ
	MlIw==
X-Gm-Message-State: ALoCoQm8AwBihWfptn46L70ixTPn6ePPJFxT7/B58TeSiF1julXCfOMluHI1TWVdHa0slaOOanTo
X-Received: by 10.182.24.101 with SMTP id t5mr27334664obf.66.1406326867626;
	Fri, 25 Jul 2014 15:21:07 -0700 (PDT)
Received: from honkintosh.cybertech.lan (65-120-133-114.dia.static.qwest.net.
	[65.120.133.114])
	by mx.google.com with ESMTPSA id q3sm40881371oei.3.2014.07.25.15.21.06
	for <multiple recipients>
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 25 Jul 2014 15:21:07 -0700 (PDT)
From: "Gary S. Robertson" <gary.robertson@linaro.org>
To: openembedded-core@lists.openembedded.org
Date: Fri, 25 Jul 2014 17:20:44 -0500
Message-Id: <1406326845-17506-3-git-send-email-gary.robertson@linaro.org>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1406326845-17506-1-git-send-email-gary.robertson@linaro.org>
References: <1406326845-17506-1-git-send-email-gary.robertson@linaro.org>
Cc: mike.holmes@linaro.org
Subject: [PATCH 2/3] LTP: pthread_cond_many - fix uninitialized return in parse_args
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

The parse_args() function in realtime test pthread_cond_many contains
a switch statement im which some cases failed to initialize the
function return variable prior to returning... added an init clause
to the definition statement for the return variable.

Signed-off-by: Gary S. Robertson <gary.robertson@linaro.org>
---
 ...d_many-fix-uninitialized-return-in-option.patch |   31 ++++++++++++++++++++
 meta/recipes-extended/ltp/ltp_20140422.bb          |    1 +
 2 files changed, 32 insertions(+)
 create mode 100644 meta/recipes-extended/ltp/ltp/0001-pthread_cond_many-fix-uninitialized-return-in-option.patch

diff --git a/meta/recipes-extended/ltp/ltp/0001-pthread_cond_many-fix-uninitialized-return-in-option.patch b/meta/recipes-extended/ltp/ltp/0001-pthread_cond_many-fix-uninitialized-return-in-option.patch
new file mode 100644
index 0000000..90c9d8e
--- /dev/null
+++ b/meta/recipes-extended/ltp/ltp/0001-pthread_cond_many-fix-uninitialized-return-in-option.patch
@@ -0,0 +1,31 @@
+From 409c00bf4484d40380947fd27329b64ebee29874 Mon Sep 17 00:00:00 2001
+From: "Gary S. Robertson" <gary.robertson@linaro.org>
+Date: Fri, 25 Jul 2014 09:41:51 -0500
+Subject: [PATCH] pthread_cond_many: fix uninitialized return in option
+ handling
+
+Some of the cases in the switch statement in parse_args() did not
+initialize the 'handled' variable which is returned by the function.
+Added an initialization to the definition of the variable.
+
+Signed-off-by: Gary S. Robertson <gary.robertson@linaro.org>
+---
+ .../realtime/perf/latency/pthread_cond_many.c      |    2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/testcases/realtime/perf/latency/pthread_cond_many.c b/testcases/realtime/perf/latency/pthread_cond_many.c
+index f9325b5..1d39100 100644
+--- a/testcases/realtime/perf/latency/pthread_cond_many.c
++++ b/testcases/realtime/perf/latency/pthread_cond_many.c
+@@ -256,7 +256,7 @@ void usage(void)
+ 
+ int parse_args(int c, char *v)
+ {
+-	int handled;
++	int handled = 1;
+ 	switch (c) {
+ 	case 'h':
+ 		usage();
+-- 
+1.7.9.5
+
diff --git a/meta/recipes-extended/ltp/ltp_20140422.bb b/meta/recipes-extended/ltp/ltp_20140422.bb
index 2ac2187..f86a195 100644
--- a/meta/recipes-extended/ltp/ltp_20140422.bb
+++ b/meta/recipes-extended/ltp/ltp_20140422.bb
@@ -27,6 +27,7 @@ SRC_URI = "git://github.com/linux-test-project/ltp.git \
     file://ltp-Do-not-link-against-libfl.patch \
     file://automake-foreign.patch \
     file://0001-Allow-mutex-initialization-without-PI-configured.patch \
+    file://0001-pthread_cond_many-fix-uninitialized-return-in-option.patch \
 "
 
 S = "${WORKDIR}/git"
-- 
1.7.9.5


