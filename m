Return-Path: <otavio.salvador@gmail.com>
Received: from mail-qk0-f178.google.com (mail-qk0-f178.google.com
	[209.85.220.178])
	by mail.openembedded.org (Postfix) with ESMTP id 8F6CE60745
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Nov 2015 15:48:58 +0000 (UTC)
Received: by qkda6 with SMTP id a6so26876999qkd.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Nov 2015 07:48:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:organization;
	bh=qUXjXSi+tf7v82x4xXxYMPHMuVng/w3UJfyWAXXeUoU=;
	b=bOezK6xhmdx+VcE8e8VPGV7BCSc/YZSX38uWvJsG7FwzOGHpHaEZwn6Si594jqSrOy
	IPqWLGvCRRf2QZ8PcAkfarK+ZRkRAnO69Ko7YkCBTMSM3uFbEYVwh3wX41q8aGyaLNIV
	XdS/e14bW7svx7MJ6LEBJOBk7w8tCctL3HRd1e0CnEn61gUKOARh6OLRrPQTbACKW1Fi
	t5jbAzS2QXfmNx/FHglRIkWu4YMofOI4n/XGPqWs1R+VZGMVsBbC0yH/+8ytSRAF+l7h
	5Hixqimvi9YGaVXRFas9no7w9IGKJ/WzW4fdnVuazT6JPfYnEkAhRvp4ssigNGhkKA5b
	d7Mw==
X-Received: by 10.55.74.145 with SMTP id x139mr7907327qka.9.1447948138882;
	Thu, 19 Nov 2015 07:48:58 -0800 (PST)
Received: from localhost ([177.100.174.62])
	by smtp.gmail.com with ESMTPSA id 86sm2494701qky.24.2015.11.19.07.48.55
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 19 Nov 2015 07:48:57 -0800 (PST)
Received: by localhost (sSMTP sendmail emulation);
	Thu, 19 Nov 2015 13:48:53 -0200
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Date: Thu, 19 Nov 2015 13:48:33 -0200
Message-Id: <1447948114-30329-4-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.6.2
In-Reply-To: <1447948114-30329-1-git-send-email-otavio@ossystems.com.br>
References: <1447948114-30329-1-git-send-email-otavio@ossystems.com.br>
Organization: O.S. Systems Software LTDA.
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH v4 4/4] lttng-ust: Upgrade to 2.7 release
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
X-List-Received-Date: Thu, 19 Nov 2015 15:48:58 -0000

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---

Changes in v4: None
Changes in v3: None
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


