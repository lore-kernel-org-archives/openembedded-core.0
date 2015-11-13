Return-Path: <otavio.salvador@gmail.com>
Received: from mail-qk0-f175.google.com (mail-qk0-f175.google.com
	[209.85.220.175])
	by mail.openembedded.org (Postfix) with ESMTP id AC0D377339
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Nov 2015 16:27:07 +0000 (UTC)
Received: by qkfo3 with SMTP id o3so52009512qkf.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Nov 2015 08:27:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:organization;
	bh=Gk0IkhbIJkNmMAB32mZTe/BCdcPaAS+L4V9i5h53Zx8=;
	b=Qmb371OeFSDynBiaRwFFoU++Hio/7xbWOTuxcLaLHyEOxf+z0ArnYVPV2zELz/vMxg
	FJKxxPnpD3EHsBa9GTvR4wmnRYugQyozKfTbXFelOE8i3JFWQVkJfpuIBvIOnTY9c73N
	ZgnjS23e8WoAe8N5zWSn0qnz+guHOHRxG5OBqCG0lhA4klR5hNycYNjzmn1AYLYQ8/t5
	SgD6PMGgs9cjoHLPlMWAhMqrMMGs0fiJbhYFz2br8JEcWigRs4jKsiLYmkAxYJQ8/qzb
	xgIJSB1ihpA+KCNiOV5fQ8vOhEyBtzEBeXfSOzOT6onOcHdbfUa591YOSqJTwbJmy/0L
	K88Q==
X-Received: by 10.140.128.16 with SMTP id 16mr23370169qha.54.1447432027812;
	Fri, 13 Nov 2015 08:27:07 -0800 (PST)
Received: from localhost ([177.100.174.62]) by smtp.gmail.com with ESMTPSA id
	b20sm2484718qkj.29.2015.11.13.08.27.05
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 13 Nov 2015 08:27:06 -0800 (PST)
Received: by localhost (sSMTP sendmail emulation);
	Fri, 13 Nov 2015 14:27:02 -0200
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Date: Fri, 13 Nov 2015 14:26:49 -0200
Message-Id: <1447432009-9129-3-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.6.2
In-Reply-To: <1447432009-9129-1-git-send-email-otavio@ossystems.com.br>
References: <1447432009-9129-1-git-send-email-otavio@ossystems.com.br>
Organization: O.S. Systems Software LTDA.
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH 3/3] lttng-ust: Upgrade to 2.7 release
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
X-List-Received-Date: Fri, 13 Nov 2015 16:27:09 -0000

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---

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


