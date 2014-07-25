Return-Path: <gary.robertson@linaro.org>
Received: from mail-oa0-f51.google.com (mail-oa0-f51.google.com
	[209.85.219.51])
	by mail.openembedded.org (Postfix) with ESMTP id 975C7706C7
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Jul 2014 22:21:07 +0000 (UTC)
Received: by mail-oa0-f51.google.com with SMTP id o6so6309299oag.38
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Jul 2014 15:21:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=ph9C8Penl08pQguflz8HEGooESInI4H3nHoxKLj5yfY=;
	b=jEMpKvNcPtyOW9+4tQARN+WUZniqiLb6TIr4ZuEKP9bSXIhQMBklvm3suH04cO4VdA
	VAPLHRKDzH16jze1yywH+hSbknWUiESrVEs6+7NlpPLSD2kGE+vOGnaq3m4XzfkEKv/R
	ywzJr+uyD+YqsLgqfdqtcT4VkyqMprkLcxkHT5OaQ30B0yuxAOMulsDqy1vaX4l5Eif4
	qzq4jopXU+L3xB2FsNSINiiS3NCAwi9phcuRcfT9JJARexi3xI2+nV2SxS55zSWAMnKw
	BCgR1wr7f3cvkRkS2op1WxqGsG9U9BdDBvOYYzOMS7xmqUhTJz2Smtg26fI+Xn8iAcfZ
	R0Vw==
X-Gm-Message-State: ALoCoQkoJg4mvYX/dCQqdqTNSNBFvC2O1ZGayfF42DFOhdZ0LrUV9muISJZDDdm73KfCsFIMUjQ7
X-Received: by 10.60.52.115 with SMTP id s19mr26920111oeo.21.1406326868353;
	Fri, 25 Jul 2014 15:21:08 -0700 (PDT)
Received: from honkintosh.cybertech.lan (65-120-133-114.dia.static.qwest.net.
	[65.120.133.114])
	by mx.google.com with ESMTPSA id q3sm40881371oei.3.2014.07.25.15.21.07
	for <multiple recipients>
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 25 Jul 2014 15:21:07 -0700 (PDT)
From: "Gary S. Robertson" <gary.robertson@linaro.org>
To: openembedded-core@lists.openembedded.org
Date: Fri, 25 Jul 2014 17:20:45 -0500
Message-Id: <1406326845-17506-4-git-send-email-gary.robertson@linaro.org>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1406326845-17506-1-git-send-email-gary.robertson@linaro.org>
References: <1406326845-17506-1-git-send-email-gary.robertson@linaro.org>
Cc: mike.holmes@linaro.org
Subject: [PATCH 3/3] LTP: prio-wake- eliminate deprecated usleep calls
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

Minor cleanup on realtime test prio-wake.
Replaced deprecated usleep calls with calls to rt_nanosleep,
which has no potentially adverse interactions with signals.

Signed-off-by: Gary S. Robertson <gary.robertson@linaro.org>
---
 ...io-wake-eliminate-deprecated-usleep-calls.patch |   33 ++++++++++++++++++++
 meta/recipes-extended/ltp/ltp_20140422.bb          |    1 +
 2 files changed, 34 insertions(+)
 create mode 100644 meta/recipes-extended/ltp/ltp/0001-prio-wake-eliminate-deprecated-usleep-calls.patch

diff --git a/meta/recipes-extended/ltp/ltp/0001-prio-wake-eliminate-deprecated-usleep-calls.patch b/meta/recipes-extended/ltp/ltp/0001-prio-wake-eliminate-deprecated-usleep-calls.patch
new file mode 100644
index 0000000..4a43703
--- /dev/null
+++ b/meta/recipes-extended/ltp/ltp/0001-prio-wake-eliminate-deprecated-usleep-calls.patch
@@ -0,0 +1,33 @@
+From 38283c837a56d64f3d23b57e082956916fe085b2 Mon Sep 17 00:00:00 2001
+From: "Gary S. Robertson" <gary.robertson@linaro.org>
+Date: Fri, 25 Jul 2014 09:50:35 -0500
+Subject: [PATCH] prio-wake: eliminate deprecated usleep calls
+
+Replaced deprecated usleep calls with calls to rt_nanosleep,
+which has no potentially adverse interactions with signals.
+
+Signed-off-by: Gary S. Robertson <gary.robertson@linaro.org>
+---
+ testcases/realtime/func/prio-wake/prio-wake.c |    4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/testcases/realtime/func/prio-wake/prio-wake.c b/testcases/realtime/func/prio-wake/prio-wake.c
+index 18c0405..f34ae30 100644
+--- a/testcases/realtime/func/prio-wake/prio-wake.c
++++ b/testcases/realtime/func/prio-wake/prio-wake.c
+@@ -108,10 +108,10 @@ void *master_thread(void *arg)
+ 
+ 	/* make sure children are started */
+ 	while (running_threads < rt_threads)
+-		usleep(1000);
++		rt_nanosleep(1000000);
+ 	/* give the worker threads a chance to get to sleep in the kernel
+ 	 * in the unlocked broadcast case. */
+-	usleep(1000);
++	rt_nanosleep(1000000);
+ 
+ 	start = rt_gettime() - beginrun;
+ 
+-- 
+1.7.9.5
+
diff --git a/meta/recipes-extended/ltp/ltp_20140422.bb b/meta/recipes-extended/ltp/ltp_20140422.bb
index f86a195..77c79f5 100644
--- a/meta/recipes-extended/ltp/ltp_20140422.bb
+++ b/meta/recipes-extended/ltp/ltp_20140422.bb
@@ -28,6 +28,7 @@ SRC_URI = "git://github.com/linux-test-project/ltp.git \
     file://automake-foreign.patch \
     file://0001-Allow-mutex-initialization-without-PI-configured.patch \
     file://0001-pthread_cond_many-fix-uninitialized-return-in-option.patch \
+    file://0001-prio-wake-eliminate-deprecated-usleep-calls.patch \
 "
 
 S = "${WORKDIR}/git"
-- 
1.7.9.5


