Return-Path: <otavio.salvador@gmail.com>
Received: from mail-qk0-f181.google.com (mail-qk0-f181.google.com
	[209.85.220.181])
	by mail.openembedded.org (Postfix) with ESMTP id D0383763F8
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Nov 2015 11:39:51 +0000 (UTC)
Received: by qkao63 with SMTP id o63so108719251qka.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Nov 2015 03:39:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:organization;
	bh=nOaxDI+gavHenC1x0EjDKQRS14/VLt9N6i2iWab6gaY=;
	b=MDOAdMNv+3RFE1lUdBNaxWHRLmqG3vLSH8DXSY6ze368hBPVz6ZT7838bfeX8yetyU
	ZCeLzUJRX0AcReJLYUdNIu8hhTB+hVc90RT27nmM4C//l2LLXm3Xf5OsDXJjxz3TvIoM
	aEIavyU4IQhaq8PdCniSutO+K3jjphKWGoKdp7taqgy/C3ovfBXtJQb4X6bRtqPg3MIG
	dSAw/wJeOuAZLqgwPBjzHj05rNebR1/tWC9QYXwaz3xjBB9zOr8ysPChoXqrbqcFQRuH
	zxP0BbMkyrjfv7jrHV8end6j9PVkyBwxQLYj3yq5WbYie4kbRy2OGNCETf6xgYK9/gAA
	bUjw==
X-Received: by 10.55.203.20 with SMTP id d20mr35334910qkj.57.1447673991427;
	Mon, 16 Nov 2015 03:39:51 -0800 (PST)
Received: from localhost ([177.100.174.62])
	by smtp.gmail.com with ESMTPSA id 5sm8578811qgk.10.2015.11.16.03.39.48
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 16 Nov 2015 03:39:50 -0800 (PST)
Received: by localhost (sSMTP sendmail emulation);
	Mon, 16 Nov 2015 09:39:45 -0200
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Date: Mon, 16 Nov 2015 09:39:32 -0200
Message-Id: <1447673972-31812-3-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.6.2
In-Reply-To: <1447673972-31812-1-git-send-email-otavio@ossystems.com.br>
References: <1447673972-31812-1-git-send-email-otavio@ossystems.com.br>
Organization: O.S. Systems Software LTDA.
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH v2 3/3] lttng-ust: Upgrade to 2.7 release
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
X-List-Received-Date: Mon, 16 Nov 2015 11:39:52 -0000

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---

Changes in v2: None

 ...ttng-ust-Fix-live-timer-calculation-error.patch | 42 ----------------------
 meta/recipes-kernel/lttng/lttng-ust_git.bb         | 10 +++---
 2 files changed, 4 insertions(+), 48 deletions(-)
 delete mode 100644 meta/recipes-kernel/lttng/lttng-ust/lttng-ust-Fix-live-timer-calculation-error.patch

diff --git a/meta/recipes-kernel/lttng/lttng-ust/lttng-ust-Fix-live-timer-calculation-error.patch b/meta/recipes-kernel/lttng/lttng-ust/lttng-ust-Fix-live-timer-calculation-error.patch
deleted file mode 100644
index 03120fe..0000000
--- a/meta/recipes-kernel/lttng/lttng-ust/lttng-ust-Fix-live-timer-calculation-error.patch
+++ /dev/null
@@ -1,42 +0,0 @@
-From 6d02a6c1aeb1d050ffe7c6624bab9acfa76fc05f Mon Sep 17 00:00:00 2001
-From: Mikael Beckius <mikael.beckius@windriver.com>
-Date: Tue, 12 May 2015 11:04:34 +0200
-Subject: [PATCH] lttng-ust:Fix live timer calculation error
-
-There is an calculation error for live timer. Variable chan->switch_timer_interval is
-based on microsecond, and it is not right to assign chan->switch_timer_interval mod
-1000000 to var tv_nsec which is based on nanosecond.
-
-Upstream-Status: Pending
-
-Signed-off-by: Mikael Beckius <mikael.beckius@windriver.com>
-Signed-off-by: Jianchuan Wang <jianchuan.wang@windriver.com>
----
- libringbuffer/ring_buffer_frontend.c | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/libringbuffer/ring_buffer_frontend.c b/libringbuffer/ring_buffer_frontend.c
-index eb4e486..e0377a3 100644
---- a/libringbuffer/ring_buffer_frontend.c
-+++ b/libringbuffer/ring_buffer_frontend.c
-@@ -528,7 +528,7 @@ void lib_ring_buffer_channel_switch_timer_start(struct channel *chan)
- 	}
- 
- 	its.it_value.tv_sec = chan->switch_timer_interval / 1000000;
--	its.it_value.tv_nsec = chan->switch_timer_interval % 1000000;
-+	its.it_value.tv_nsec = (chan->switch_timer_interval % 1000000) * 1000;
- 	its.it_interval.tv_sec = its.it_value.tv_sec;
- 	its.it_interval.tv_nsec = its.it_value.tv_nsec;
- 
-@@ -582,7 +582,7 @@ void lib_ring_buffer_channel_read_timer_start(struct channel *chan)
- 	}
- 
- 	its.it_value.tv_sec = chan->read_timer_interval / 1000000;
--	its.it_value.tv_nsec = chan->read_timer_interval % 1000000;
-+	its.it_value.tv_nsec = (chan->read_timer_interval % 1000000) * 1000;
- 	its.it_interval.tv_sec = its.it_value.tv_sec;
- 	its.it_interval.tv_nsec = its.it_value.tv_nsec;
- 
--- 
-1.9.1
-
diff --git a/meta/recipes-kernel/lttng/lttng-ust_git.bb b/meta/recipes-kernel/lttng/lttng-ust_git.bb
index ae4afd3..1c08403 100644
--- a/meta/recipes-kernel/lttng/lttng-ust_git.bb
+++ b/meta/recipes-kernel/lttng/lttng-ust_git.bb
@@ -18,14 +18,12 @@ RPROVIDES_${PN} = "lttng2-ust"
 RREPLACES_${PN} = "lttng2-ust"
 RCONFLICTS_${PN} = "lttng2-ust"
 
-SRCREV = "c49ee9040ada6984c880756614e8a6f7fd645bd6"
+SRCREV = "826c6c686f16b9aeb3100f3f880d630911691cf1"
 PE = "2"
-PV = "2.6.2+git${SRCPV}"
+PV = "2.7.0+git${SRCPV}"
 
-SRC_URI = "git://git.lttng.org/lttng-ust.git;branch=stable-2.6 \
-           file://lttng-ust-doc-examples-disable.patch \
-           file://lttng-ust-Fix-live-timer-calculation-error.patch \
-        "
+SRC_URI = "git://git.lttng.org/lttng-ust.git;branch=stable-2.7 \
+           file://lttng-ust-doc-examples-disable.patch"
 
 S = "${WORKDIR}/git"
 
-- 
2.6.2


