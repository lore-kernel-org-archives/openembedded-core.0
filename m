Return-Path: <sdoshi@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62C8BC79FB9
	for <webhook@archiver.kernel.org>; Thu, 10 Sep 2026 08:33:34 +0000 (UTC)
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.9072.1789029206842024273
 for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Sep 2026 01:33:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=dR3W9Rs7;
 spf=pass (domain: mvista.com, ip: 209.85.216.54, mailfrom: sdoshi@mvista.com)
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-38ea87caafeso6007501a91.3
        for <openembedded-core@lists.openembedded.org>; Thu, 10 Sep 2026 01:33:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1789029206; x=1789634006; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=idsjKyAoy/FL/pucw5egzpotNz0AE664ZoAGwUQ8xXU=;
        b=dR3W9Rs7cjDA6qr6serth+BRWVkKVeBAjUcrL2leFo1t1K1rEgmW733Ij0VANj4Phe
         HXTH6j15FVFLapeMGz02v5sFgxyX/sKgOe/zvKa7cEXa7+3bOiBMw4c0jFOb8VNr0REv
         TOWdJ51JluFPdKjhoum1zk0/WbnjsYRgFLimo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789029206; x=1789634006;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=idsjKyAoy/FL/pucw5egzpotNz0AE664ZoAGwUQ8xXU=;
        b=dc+lEsZcOKVqmH+WHB6WeH2ozd2A4SNGObuvBjRCjsSpGt5oVXFYhPE5ItShrIVwq/
         bMBJZrIQUljlgkTB0e0JzldplpWWWnbs7yIgVZ5bTB8U2N3Nap3r+QqJE4Dqvf4AW6YD
         JadBpGflos1KJNS3vRR1EbCMRIU0XzDvqwP+yOUMTDCqDZ+vPpJlUBbZJhl92Ix0nNCH
         cvnmvYCGsS/mYpmgQBHgO+CCBYaDQS7aXMQyF4KHoLlqhYqDSN2tHRDOb+VpXg0xVPJl
         pFsfnPriALROumvC96TTPqMP2launnqm8flnZTaHqCY44vX4NbxDaxqEfY6/JL9hXmfu
         SpqA==
X-Gm-Message-State: AFuF++n5fzfCyR8WV80qWUZ3fy2MkAp6yqfV8MCyeDSVzp73YDIlcD+Y
	6CqZOmThlILt5mJ0WI4488keXuadEZhPtX4/ZnU+H/7iwUot8fiSpb/KM8cAwPiDHWBGS+krzRX
	b8e/p
X-Gm-Gg: AYBFou28P20EhZ6gsc38oVsz8ePx93nLQiWi0g3V0tpj6ZkZt0Y7rS3VUP/aw6miDkr
	eAKY6CcwhktYpm3Vgcb9JD2MNuGCS7IeGypempf2MXBpTfFew1Z5QEABxRvrW3PQa//n3ZaWz+6
	tqQotM2q3MyiiNYm73AsMY966NYkc59+lXoFoxHGEfWp/M0E7uOpBcpPNrw62MFHL7sg2fl1r7K
	pmVru3EfDlsEweqA5BDD0UzqUpVkRz2XfnPSOJDTg+yazAKI9nVxxMMDaTkAiMXBaE5cYr6610E
	buL6DzCKiupa4dSdGEEb08dMqz6PqJMxc0bSh49/f0DhfGcx0taipZnqzXsVe1yK+126AK5xwS/
	oQEGxnZTV2yOzGAOYCmT44a8AbZuGiGwORhL+e297GPXYBEhToWqnBnMiMNtHsF9lMG7+CGAeCO
	Qn1phr379v/xLJPwSLTR6biEEE01m2W3ltVmQ2jXt8xLQtaEOb1EGe0ZhKhG85agJ9YQ305Y9h2
	5OmpwCd
X-Received: by 2002:a17:90b:54c3:b0:398:d6e8:f84e with SMTP id 98e67ed59e1d1-39b2612ecebmr62363482a91.9.1789029206101;
        Thu, 10 Sep 2026 01:33:26 -0700 (PDT)
Received: from MVIN00030.mvista.com ([157.32.44.87])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14340a69666sm28004672c88.9.2026.09.10.01.33.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 01:33:25 -0700 (PDT)
From: Siddharth <sdoshi@mvista.com>
To: openembedded-core@lists.openembedded.org
Cc: Siddharth Doshi <sdoshi@mvista.com>
Subject: [OE-core][scarthgap][PATCH 2/3] curl: Security Fix for CVE-2026-18924
Date: Thu, 10 Sep 2026 14:00:54 +0530
Message-Id: <20260910083055.208955-2-sdoshi@mvista.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260910083055.208955-1-sdoshi@mvista.com>
References: <20260910083055.208955-1-sdoshi@mvista.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 10 Sep 2026 08:33:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245542

From: Siddharth Doshi <sdoshi@mvista.com>

Picking patch as per [1], and same patch is mentioned in [2]

[1] https://curl.se/docs/CVE-2026-18924.html
[2] https://security-tracker.debian.org/tracker/CVE-2026-18924

Signed-off-by: Siddharth Doshi <sdoshi@mvista.com>
---
 .../curl/curl/CVE-2026-18924.patch            | 39 +++++++++++++++++++
 meta/recipes-support/curl/curl_8.7.1.bb       |  1 +
 2 files changed, 40 insertions(+)
 create mode 100644 meta/recipes-support/curl/curl/CVE-2026-18924.patch

diff --git a/meta/recipes-support/curl/curl/CVE-2026-18924.patch b/meta/recipes-support/curl/curl/CVE-2026-18924.patch
new file mode 100644
index 0000000000..28934ababe
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
+index 99d7f3b..e6305c9 100644
+--- a/lib/http2.c
++++ b/lib/http2.c
+@@ -47,6 +47,7 @@
+ #include "transfer.h"
+ #include "dynbuf.h"
+ #include "headers.h"
++#include "curl_share.h"
+ /* The last 3 #include files should be in this order */
+ #include "curl_printf.h"
+ #include "curl_memory.h"
+@@ -776,6 +777,8 @@ static struct Curl_easy *h2_duphandle(struct Curl_cfilter *cf,
+       second->req.p.http = http;
+       http2_data_setup(cf, second, &second_stream);
+       second->state.priority.weight = data->state.priority.weight;
++      if(data->share)
++        (void)Curl_share_easy_link(second, data->share);
+     }
+   }
+   return second;
+-- 
+2.34.1
+
diff --git a/meta/recipes-support/curl/curl_8.7.1.bb b/meta/recipes-support/curl/curl_8.7.1.bb
index e75c938938..6fde65d0a6 100644
--- a/meta/recipes-support/curl/curl_8.7.1.bb
+++ b/meta/recipes-support/curl/curl_8.7.1.bb
@@ -42,6 +42,7 @@ SRC_URI = " \
     file://CVE-2026-6253.patch \
     file://CVE-2026-4873.patch \
     file://CVE-2026-13608.patch \
+    file://CVE-2026-18924.patch \
 "
 
 SRC_URI:append:class-nativesdk = " \
-- 
2.34.1


