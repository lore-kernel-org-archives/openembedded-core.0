Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49C0CC982DE
	for <webhook@archiver.kernel.org>; Thu, 17 Sep 2026 22:08:28 +0000 (UTC)
Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1597.1789682902706543506
 for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Sep 2026 15:08:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=wg6J/cEk;
 spf=pass (domain: smile.fr, ip: 74.125.225.141, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49cd38e0e5dso1337495e9.2
        for <openembedded-core@lists.openembedded.org>; Thu, 17 Sep 2026 15:08:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1789682901; x=1790287701; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=ADqnn1iF7YT+dyVklB58tlGILiqXaspMRyJQWu9HjOI=;
        b=wg6J/cEkA1GiVuwMA0nVBYNuoMInwEeT6o6UmuxsumOkOWyw9eOxXV10IssjhNannN
         e8mtN4f81tJl6U0vR/dljq/hSR6Tn66BoJ8Rwn2DPlNn3RMISFVqqmI97lddRpKZnGk8
         LefdztfhC02XoPt3VGeolHy19KqnGO/9CspRo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789682901; x=1790287701;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=ADqnn1iF7YT+dyVklB58tlGILiqXaspMRyJQWu9HjOI=;
        b=pQ7KoYb9SxlFZAWKSY8pSUlIaGkTy+0AAwVkkOBWLh9sq3A7I9uO2Newe5Z+2th0Yo
         QQKSJ66/QjuwCKGRCwEi4HxE2buoDOWYIybBARVrtYdCZVCB63VQGmOT0unxZQfVxWPZ
         +2OzkOFQwHIMR0w4AH2/Nlc0cJq5H53pHLpQ3y4b+1HBfsXZwD5kxN3ZuJMLYu+HzwIn
         toJOCC6GzJv68UQ2bzvQAfUcr7oIa6aG0KGBC0y38QQcg+I31Y3JcTU3SU0AhoRu/4BF
         8FwgCGJrAz8ALdnZ9qzGi3f1O5TrTd11YnL2jjFzRJk2Pu5V1hxOPl84/LzBZO1BqGV/
         Umaw==
X-Gm-Message-State: AFuF++kjyBrU6N4O3huUCLWzqvKPl977jdCiGibWCv/NADqKrVQKlR4k
	afyVLUd52pi06kZSft8Q3jCUl1DVxIbawHlQZvkQtTVia3EZefv7RpTK/p3GPLsvHat1cZAebPG
	co/ZfzNo=
X-Gm-Gg: AYBFou3PoUS+l1wShUhee0vksztALckR9FaNWh2woMobpqlqzDvvt15usUR1Lv1UF9e
	gjpz1dYs9KPno23wN9khVA6tV6em6C/f66qvCzFT2PGhDbVwvzwCm+RcQXMuei5a5dC+HGA7N71
	PQ4q8TQgv6kJtV/JPRd2bUOZRAW46KgUWzFIS76T+isA+yquYUQ8WQMR/ImhEYHm4C2siMePhuA
	dJw6IoaHl9zyg80P3fKE4MRwGU4wK4BeQvt1JBipuYdArhnnNDpQYLrRpCVlhqikNpwm9aVMv8j
	z/rcox32SFw37+bmEE/lS8gkYdSxcoZ1PlLJlcsgJKtEJRAusaMeNiPpwt0XtMeLv/B8XaHoVAx
	PXFw4vd1CpdiMN+yHYuKZpNkAitIsR118n/T1XBhkUoTPWAfqfGwnRJECTkzRz3QsjXs4KieXTj
	Qj8NmDXeOAsEDExUsFwSpr6ea2zu0wnIGw30K6ASIBeb8LnsAb3PXRlwpM4sz4ztjw2Va5mLc7+
	SUom6bpnXAg3j1o8ga8hTL2Dw1AgyXDIKuv8d5ZX/qu+Yxq2gf2AKrcNHRpWRWtEre22qVOWyo=
X-Received: by 2002:a05:600c:1c09:b0:49f:bd3c:bc24 with SMTP id 5b1f17b1804b1-49fc57479c9mr4034725e9.31.1789682900797;
        Thu, 17 Sep 2026 15:08:20 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fc471b9a2sm8984075e9.0.2026.09.17.15.08.20
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 15:08:20 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 58/79] curl: Security Fix for CVE-2026-18924
Date: Fri, 18 Sep 2026 00:06:43 +0200
Message-ID: <9e18a7cafc1b5ef69205d36dd50e4f1c7eb89228.1789681419.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1789681419.git.yoann.congal@smile.fr>
References: <cover.1789681419.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 17 Sep 2026 22:08:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246153

From: Siddharth Doshi <sdoshi@mvista.com>

Picking patch as per [1], and same patch is mentioned in [2]

[1] https://curl.se/docs/CVE-2026-18924.html
[2] https://security-tracker.debian.org/tracker/CVE-2026-18924

Signed-off-by: Siddharth Doshi <sdoshi@mvista.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../curl/curl/CVE-2026-18924.patch            | 39 +++++++++++++++++++
 meta/recipes-support/curl/curl_8.19.0.bb      |  1 +
 2 files changed, 40 insertions(+)
 create mode 100644 meta/recipes-support/curl/curl/CVE-2026-18924.patch

diff --git a/meta/recipes-support/curl/curl/CVE-2026-18924.patch b/meta/recipes-support/curl/curl/CVE-2026-18924.patch
new file mode 100644
index 00000000000..fbf452e4e9c
--- /dev/null
+++ b/meta/recipes-support/curl/curl/CVE-2026-18924.patch
@@ -0,0 +1,39 @@
+From 90325ff0444cbdff368bda5d26d6405a0bb6ee43 Mon Sep 17 00:00:00 2001
+From: Daniel Stenberg <daniel@haxx.se>
+Date: Wed, 5 Aug 2026 10:02:53 +0200
+Subject: [PATCH] http2: make server push transfers inherit share from parent
+
+Reported-by: Stephan Zeisberg
+Closes #22488
+
+Upstream-Status: Backport [https://github.com/curl/curl/commit/90325ff0444cbdff368bda5d26d6405a0bb6ee43]
+CVE: CVE-2026-18924
+Signed-off-by: Siddharth Doshi <sdoshi@mvista.com>
+---
+ lib/http2.c | 3 +++
+ 1 file changed, 3 insertions(+)
+
+diff --git a/lib/http2.c b/lib/http2.c
+index e1c5798..2ef1c28 100644
+--- a/lib/http2.c
++++ b/lib/http2.c
+@@ -46,6 +46,7 @@
+ #include "bufref.h"
+ #include "curlx/dynbuf.h"
+ #include "headers.h"
++#include "curl_share.h"
+ 
+ #if (NGHTTP2_VERSION_NUM < 0x010c00)
+ #error too old nghttp2 version, upgrade!
+@@ -709,6 +710,8 @@ static struct Curl_easy *h2_duphandle(struct Curl_cfilter *cf,
+     struct h2_stream_ctx *second_stream;
+     http2_data_setup(cf, second, &second_stream);
+     second->state.priority.weight = data->state.priority.weight;
++    if(data->share)
++      (void)Curl_share_easy_link(second, data->share);
+   }
+   return second;
+ }
+-- 
+2.34.1
+
diff --git a/meta/recipes-support/curl/curl_8.19.0.bb b/meta/recipes-support/curl/curl_8.19.0.bb
index 21d887cb399..ccf8de0b90e 100644
--- a/meta/recipes-support/curl/curl_8.19.0.bb
+++ b/meta/recipes-support/curl/curl_8.19.0.bb
@@ -36,6 +36,7 @@ SRC_URI = " \
     file://CVE-2026-9545-02.patch \
     file://CVE-2026-9079.patch \
     file://CVE-2026-13608.patch \
+    file://CVE-2026-18924.patch \
 "
 
 SRC_URI:append:class-nativesdk = " \

