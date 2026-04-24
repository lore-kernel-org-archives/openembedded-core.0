Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F2B5FED3FA
	for <webhook@archiver.kernel.org>; Fri, 24 Apr 2026 20:56:50 +0000 (UTC)
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com [209.85.128.66])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.32578.1777064208519229303
 for <openembedded-core@lists.openembedded.org>;
 Fri, 24 Apr 2026 13:56:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=AVo4W+zf;
 spf=pass (domain: smile.fr, ip: 209.85.128.66, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f66.google.com with SMTP id 5b1f17b1804b1-488e1a8ac40so101193445e9.2
        for <openembedded-core@lists.openembedded.org>; Fri, 24 Apr 2026 13:56:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1777064207; x=1777669007; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ti+aFxRA6CDGxD/PuP5GG5RdOqM0hd3VXI1YRahzRTM=;
        b=AVo4W+zfMIEPy/eTmSMQt7OZdcwPOHYKZzGQWFyp6PeoDO2kLtzYmOnNw/dywR5low
         mHNjK8LhKNBxWecLWK1FuTjPfYEeIynNFvyQqg3GCkw5mq01ptQSu2QipwYJjWZI8b0k
         sTSgQdYAVTs0kOSXP1MRO8QIj3qG0gf/qKgas=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777064207; x=1777669007;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ti+aFxRA6CDGxD/PuP5GG5RdOqM0hd3VXI1YRahzRTM=;
        b=Hb9rVAl+a2H1KH69EF1RdB2s/3ElbBe66U7jPx7cR7IzDZezIgkDCFcKn96oWq6EQo
         Dv7oGxQ7c4FFY1ZvUFBjlj0HWTxQRM8cDQf4B1I/EgqLpYbahxKNex9pOVlOdU+c6/aL
         gmeV4U7bUFK4hffip9y8RH2iVGBUx1CAR7fHdePDM6jV4BRjlFTo3hMkQYyaZGIIQ8bR
         TCjaTUOiDKS+Jg/LgjcSHjxKEyNNAUBqAE60gUHNNuIDwful2rrrpcp4tS4WGSGNnR3/
         Gq4l6eD2HTBen6JKEptX670vl5aXbPFXArrL4dZMzkYWUEbPfjt1L7PKTCCDs1wSZpfx
         a71A==
X-Gm-Message-State: AOJu0Yx+t+nIfo0n04J73+LjlvbLUAYYdBPijPy0Qut6SMp8zA9f/oN7
	f68IjcsZlXO8ScFzp6CxFlGtdbUpOXyWhdSLOOCa9gtbMT0TgNr1ZBLPhSb98Uf1ozeV47RAGQz
	c9Jj+udy+XAff
X-Gm-Gg: AeBDievt+63XQQyXqO2THHt6Sm1QM7ghdX/9zQsCGBA8r3YaBpYG/4AmxJMKloFGAr6
	qSSMDhGXBEJxNlAfBshf5jNIvBrzXemN1WlBQ6mLtD78le3CDyJSOwY/3LYBljPr0RVxdnIckZF
	SDarn0G9+tZ9LnmsuZJvAZi3yiQMIAqufEzK3Iv0gylbEC4IshJTm7luuZrPovxs9tT3hBah2gF
	MiDGqYV9AOjPLWDjEp3t9Rm0WngXmdkrCwKWSTrwj9aaC+6Ra3UfaE9po6EJtIxd4ECo8AgZujH
	FebCFxhW40SJU30dFF7ywnLRYUp7I8qLZN6k4l85cV5XYadEBD3h5Yd9VR4djEPzPCGtgXiXaAx
	/OzrJIrDVd1VU6vZEPqI6m3yg9cfwyC+RczOvE05Fx8P148y7bs1F0k0ZO3vYKqVxH9ujr6g+SB
	XFo7cXroIaSKHexT8uUU38+apNAyp8Z2v05qPE4D+tkPKfIefCjAG9PeuCtLwx1nMPMtTecUy1d
	6N7U3BRBzBpbPKWi0kMPsA+4LGp5knO8CnY96QMXnvqX2Iw
X-Received: by 2002:a05:600c:3f0c:b0:48a:563c:c8e0 with SMTP id 5b1f17b1804b1-48a563cd16bmr236799215e9.1.1777064206618;
        Fri, 24 Apr 2026 13:56:46 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4891cca5743sm394841005e9.9.2026.04.24.13.56.46
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Apr 2026 13:56:46 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 16/66] nghttp2: Fix CVE-2026-27135
Date: Fri, 24 Apr 2026 22:55:15 +0200
Message-ID: <892fdc819660ab67d9930e0ccb71e4138fcf1750.1777064068.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1777064068.git.yoann.congal@smile.fr>
References: <cover.1777064068.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 24 Apr 2026 20:56:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235889

From: Anil Dongare <adongare@cisco.com>

Pick patch from [1] also mentioned in [2]
[1] https://github.com/nghttp2/nghttp2/commit/5c7df8fa815ac1004d9ecb9d1f7595c4d37f46e1
[2] https://nvd.nist.gov/vuln/detail/CVE-2026-27135

Signed-off-by: Anil Dongare <adongare@cisco.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../nghttp2/nghttp2/CVE-2026-27135.patch      | 110 ++++++++++++++++++
 .../recipes-support/nghttp2/nghttp2_1.61.0.bb |   4 +-
 2 files changed, 113 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-support/nghttp2/nghttp2/CVE-2026-27135.patch

diff --git a/meta/recipes-support/nghttp2/nghttp2/CVE-2026-27135.patch b/meta/recipes-support/nghttp2/nghttp2/CVE-2026-27135.patch
new file mode 100644
index 00000000000..c4977cded01
--- /dev/null
+++ b/meta/recipes-support/nghttp2/nghttp2/CVE-2026-27135.patch
@@ -0,0 +1,110 @@
+From f9812d447b14435de77751077ef48214ebf252ec Mon Sep 17 00:00:00 2001
+From: Tatsuhiro Tsujikawa <tatsuhiro.t@gmail.com>
+Date: Wed, 18 Feb 2026 18:04:30 +0900
+Subject: [PATCH] Fix missing iframe->state validations to avoid assertion
+ failure
+
+CVE: CVE-2026-27135
+Upstream-Status: Backport [https://github.com/nghttp2/nghttp2/commit/5c7df8fa815ac1004d9ecb9d1f7595c4d37f46e1]
+
+(cherry picked from commit 5c7df8fa815ac1004d9ecb9d1f7595c4d37f46e1)
+Signed-off-by: Anil Dongare <adongare@cisco.com>
+---
+ lib/nghttp2_session.c | 32 ++++++++++++++++++++++++++++++++
+ 1 file changed, 32 insertions(+)
+
+diff --git a/lib/nghttp2_session.c b/lib/nghttp2_session.c
+index 004a4dff..54312588 100644
+--- a/lib/nghttp2_session.c
++++ b/lib/nghttp2_session.c
+@@ -6079,6 +6079,10 @@ nghttp2_ssize nghttp2_session_mem_recv2(nghttp2_session *session,
+           return rv;
+         }
+ 
++        if (iframe->state == NGHTTP2_IB_IGN_ALL) {
++          return (nghttp2_ssize)inlen;
++        }
++
+         on_begin_frame_called = 1;
+ 
+         rv = session_process_headers_frame(session);
+@@ -6445,6 +6449,9 @@ nghttp2_ssize nghttp2_session_mem_recv2(nghttp2_session *session,
+           if (nghttp2_is_fatal(rv)) {
+             return rv;
+           }
++          if (iframe->state == NGHTTP2_IB_IGN_ALL) {
++            return (nghttp2_ssize)inlen;
++          }
+         }
+       }
+ 
+@@ -6701,6 +6708,10 @@ nghttp2_ssize nghttp2_session_mem_recv2(nghttp2_session *session,
+           return rv;
+         }
+ 
++        if (iframe->state == NGHTTP2_IB_IGN_ALL) {
++          return (nghttp2_ssize)inlen;
++        }
++
+         session_inbound_frame_reset(session);
+ 
+         break;
+@@ -7004,6 +7015,10 @@ nghttp2_ssize nghttp2_session_mem_recv2(nghttp2_session *session,
+         if (nghttp2_is_fatal(rv)) {
+           return rv;
+         }
++
++        if (iframe->state == NGHTTP2_IB_IGN_ALL) {
++          return (nghttp2_ssize)inlen;
++        }
+       } else {
+         iframe->state = NGHTTP2_IB_IGN_HEADER_BLOCK;
+       }
+@@ -7169,6 +7184,11 @@ nghttp2_ssize nghttp2_session_mem_recv2(nghttp2_session *session,
+             rv = session->callbacks.on_data_chunk_recv_callback(
+                 session, iframe->frame.hd.flags, iframe->frame.hd.stream_id,
+                 in - readlen, (size_t)data_readlen, session->user_data);
++
++            if (iframe->state == NGHTTP2_IB_IGN_ALL) {
++              return (nghttp2_ssize)inlen;
++            }
++
+             if (rv == NGHTTP2_ERR_PAUSE) {
+               return (nghttp2_ssize)(in - first);
+             }
+@@ -7256,6 +7276,10 @@ nghttp2_ssize nghttp2_session_mem_recv2(nghttp2_session *session,
+           return rv;
+         }
+ 
++        if (iframe->state == NGHTTP2_IB_IGN_ALL) {
++          return (nghttp2_ssize)inlen;
++        }
++
+         if (rv != 0) {
+           busy = 1;
+ 
+@@ -7274,6 +7298,10 @@ nghttp2_ssize nghttp2_session_mem_recv2(nghttp2_session *session,
+         return rv;
+       }
+ 
++      if (iframe->state == NGHTTP2_IB_IGN_ALL) {
++        return (nghttp2_ssize)inlen;
++      }
++
+       session_inbound_frame_reset(session);
+ 
+       break;
+@@ -7302,6 +7330,10 @@ nghttp2_ssize nghttp2_session_mem_recv2(nghttp2_session *session,
+         return rv;
+       }
+ 
++      if (iframe->state == NGHTTP2_IB_IGN_ALL) {
++        return (nghttp2_ssize)inlen;
++      }
++
+       session_inbound_frame_reset(session);
+ 
+       break;
+-- 
+2.43.7
+
diff --git a/meta/recipes-support/nghttp2/nghttp2_1.61.0.bb b/meta/recipes-support/nghttp2/nghttp2_1.61.0.bb
index ad85576dcbc..ebba15db282 100644
--- a/meta/recipes-support/nghttp2/nghttp2_1.61.0.bb
+++ b/meta/recipes-support/nghttp2/nghttp2_1.61.0.bb
@@ -4,7 +4,9 @@ SECTION = "libs"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=764abdf30b2eadd37ce47dcbce0ea1ec"
 
-SRC_URI = "${GITHUB_BASE_URI}/download/v${PV}/nghttp2-${PV}.tar.xz"
+SRC_URI = "${GITHUB_BASE_URI}/download/v${PV}/nghttp2-${PV}.tar.xz \
+           file://CVE-2026-27135.patch \
+           "
 SRC_URI[sha256sum] = "c0e660175b9dc429f11d25b9507a834fb752eea9135ab420bb7cb7e9dbcc9654"
 
 inherit cmake manpages python3native github-releases

