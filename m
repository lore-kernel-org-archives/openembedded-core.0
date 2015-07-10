Return-Path: <Jianchuan.Wang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id BCF0E607A4
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Jul 2015 06:33:40 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.1/8.15.1) with ESMTPS id t6A6Xe3Y007201
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 9 Jul 2015 23:33:41 -0700 (PDT)
Received: from PEK-JWANG7-D1.wrs.com (128.224.162.190) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.224.2; Thu, 9 Jul 2015 23:33:40 -0700
From: <jianchuan.wang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 10 Jul 2015 14:33:12 +0800
Message-ID: <1436509992-20896-1-git-send-email-jianchuan.wang@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH] lttng: Fix timer calculation error
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
X-List-Received-Date: Fri, 10 Jul 2015 06:33:43 -0000
Content-Type: text/plain

From: Jianchuan Wang <jianchuan.wang@windriver.com>

Fix timer calculation error in the lttng-tools/lttng-ust

Signed-off-by: Jianchuan Wang <jianchuan.wang@windriver.com>
---
 ...ng-tools-Fix-live-timer-calculation-error.patch | 42 ++++++++++++++++++++++
 meta/recipes-kernel/lttng/lttng-tools_2.6.0.bb     |  1 +
 ...ttng-ust-Fix-live-timer-calculation-error.patch | 42 ++++++++++++++++++++++
 meta/recipes-kernel/lttng/lttng-ust_2.6.1.bb       |  1 +
 4 files changed, 86 insertions(+)
 create mode 100644 meta/recipes-kernel/lttng/lttng-tools/lttng-tools-Fix-live-timer-calculation-error.patch
 create mode 100644 meta/recipes-kernel/lttng/lttng-ust/lttng-ust-Fix-live-timer-calculation-error.patch

diff --git a/meta/recipes-kernel/lttng/lttng-tools/lttng-tools-Fix-live-timer-calculation-error.patch b/meta/recipes-kernel/lttng/lttng-tools/lttng-tools-Fix-live-timer-calculation-error.patch
new file mode 100644
index 0000000..4719d95
--- /dev/null
+++ b/meta/recipes-kernel/lttng/lttng-tools/lttng-tools-Fix-live-timer-calculation-error.patch
@@ -0,0 +1,42 @@
+From 161496fbe1465817a77a50a1172734dae81a13ef Mon Sep 17 00:00:00 2001
+From: Mikael Beckius <mikael.beckius@windriver.com>
+Date: Tue, 12 May 2015 11:11:48 +0200
+Subject: [PATCH] lttng-tools: Fix live timer calculation error
+
+There is an calculation error for live timer. Variable switch_timer_interval is
+based on microsecond, and it is not right to assign switch_timer_interval mod
+1000000 to var tv_nsec which is based on nanosecond.
+
+Upstream-Status: Pending
+
+Signed-off-by: Mikael Beckius <mikael.beckius@windriver.com>
+Signed-off-by: Jianchuan Wang <jianchuan.wang@windriver.com>
+---
+ src/common/consumer-timer.c | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/src/common/consumer-timer.c b/src/common/consumer-timer.c
+index 1408052..c6202ba 100644
+--- a/src/common/consumer-timer.c
++++ b/src/common/consumer-timer.c
+@@ -368,7 +368,7 @@ void consumer_timer_switch_start(struct lttng_consumer_channel *channel,
+ 	channel->switch_timer_enabled = 1;
+ 
+ 	its.it_value.tv_sec = switch_timer_interval / 1000000;
+-	its.it_value.tv_nsec = switch_timer_interval % 1000000;
++	its.it_value.tv_nsec = (switch_timer_interval % 1000000) * 1000;
+ 	its.it_interval.tv_sec = its.it_value.tv_sec;
+ 	its.it_interval.tv_nsec = its.it_value.tv_nsec;
+ 
+@@ -425,7 +425,7 @@ void consumer_timer_live_start(struct lttng_consumer_channel *channel,
+ 	channel->live_timer_enabled = 1;
+ 
+ 	its.it_value.tv_sec = live_timer_interval / 1000000;
+-	its.it_value.tv_nsec = live_timer_interval % 1000000;
++	its.it_value.tv_nsec = (live_timer_interval % 1000000) * 1000;
+ 	its.it_interval.tv_sec = its.it_value.tv_sec;
+ 	its.it_interval.tv_nsec = its.it_value.tv_nsec;
+ 
+-- 
+1.9.1
+
diff --git a/meta/recipes-kernel/lttng/lttng-tools_2.6.0.bb b/meta/recipes-kernel/lttng/lttng-tools_2.6.0.bb
index 8cc4220..6397a98 100644
--- a/meta/recipes-kernel/lttng/lttng-tools_2.6.0.bb
+++ b/meta/recipes-kernel/lttng/lttng-tools_2.6.0.bb
@@ -27,6 +27,7 @@ SRC_URI = "git://git.lttng.org/lttng-tools.git;branch=stable-2.6 \
            file://runtest-2.4.0.patch \
            file://extern-decls.patch \
            file://run-ptest \
+           file://lttng-tools-Fix-live-timer-calculation-error.patch \
 	  "
 
 S = "${WORKDIR}/git"
diff --git a/meta/recipes-kernel/lttng/lttng-ust/lttng-ust-Fix-live-timer-calculation-error.patch b/meta/recipes-kernel/lttng/lttng-ust/lttng-ust-Fix-live-timer-calculation-error.patch
new file mode 100644
index 0000000..03120fe
--- /dev/null
+++ b/meta/recipes-kernel/lttng/lttng-ust/lttng-ust-Fix-live-timer-calculation-error.patch
@@ -0,0 +1,42 @@
+From 6d02a6c1aeb1d050ffe7c6624bab9acfa76fc05f Mon Sep 17 00:00:00 2001
+From: Mikael Beckius <mikael.beckius@windriver.com>
+Date: Tue, 12 May 2015 11:04:34 +0200
+Subject: [PATCH] lttng-ust:Fix live timer calculation error
+
+There is an calculation error for live timer. Variable chan->switch_timer_interval is
+based on microsecond, and it is not right to assign chan->switch_timer_interval mod
+1000000 to var tv_nsec which is based on nanosecond.
+
+Upstream-Status: Pending
+
+Signed-off-by: Mikael Beckius <mikael.beckius@windriver.com>
+Signed-off-by: Jianchuan Wang <jianchuan.wang@windriver.com>
+---
+ libringbuffer/ring_buffer_frontend.c | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/libringbuffer/ring_buffer_frontend.c b/libringbuffer/ring_buffer_frontend.c
+index eb4e486..e0377a3 100644
+--- a/libringbuffer/ring_buffer_frontend.c
++++ b/libringbuffer/ring_buffer_frontend.c
+@@ -528,7 +528,7 @@ void lib_ring_buffer_channel_switch_timer_start(struct channel *chan)
+ 	}
+ 
+ 	its.it_value.tv_sec = chan->switch_timer_interval / 1000000;
+-	its.it_value.tv_nsec = chan->switch_timer_interval % 1000000;
++	its.it_value.tv_nsec = (chan->switch_timer_interval % 1000000) * 1000;
+ 	its.it_interval.tv_sec = its.it_value.tv_sec;
+ 	its.it_interval.tv_nsec = its.it_value.tv_nsec;
+ 
+@@ -582,7 +582,7 @@ void lib_ring_buffer_channel_read_timer_start(struct channel *chan)
+ 	}
+ 
+ 	its.it_value.tv_sec = chan->read_timer_interval / 1000000;
+-	its.it_value.tv_nsec = chan->read_timer_interval % 1000000;
++	its.it_value.tv_nsec = (chan->read_timer_interval % 1000000) * 1000;
+ 	its.it_interval.tv_sec = its.it_value.tv_sec;
+ 	its.it_interval.tv_nsec = its.it_value.tv_nsec;
+ 
+-- 
+1.9.1
+
diff --git a/meta/recipes-kernel/lttng/lttng-ust_2.6.1.bb b/meta/recipes-kernel/lttng/lttng-ust_2.6.1.bb
index 590ec4a..d083f86 100644
--- a/meta/recipes-kernel/lttng/lttng-ust_2.6.1.bb
+++ b/meta/recipes-kernel/lttng/lttng-ust_2.6.1.bb
@@ -24,6 +24,7 @@ PE = "2"
 SRC_URI = "git://git.lttng.org/lttng-ust.git;branch=stable-2.6 \
            file://lttng-ust-doc-examples-disable.patch \
            file://add-aarch64.patch \
+           file://lttng-ust-Fix-live-timer-calculation-error.patch \
 	   "
 
 S = "${WORKDIR}/git"
-- 
1.9.1


