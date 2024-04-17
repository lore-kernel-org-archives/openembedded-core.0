Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B581DC4345F
	for <webhook@archiver.kernel.org>; Wed, 17 Apr 2024 20:35:55 +0000 (UTC)
Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
 by mx.groups.io with SMTP id smtpd.web11.24879.1713386146014729150
 for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Apr 2024 13:35:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=AsLZvX2s;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.176, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-5dcc4076c13so140666a12.0
        for <openembedded-core@lists.openembedded.org>; Wed, 17 Apr 2024 13:35:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1713386145; x=1713990945; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DOKRNVZvRvqZ7o0+CDwYfQ/AoXU35i3jMyRGEyO4FpU=;
        b=AsLZvX2scgBGGGntXf9LjisiqObm66ab/xZDiHfMHAlj3Id030w6iJasNFBv3VTnRq
         12bn+V7Sh8SU/hyVSW+F85Z/x3Bb80cK/Oy2ItmMrRGeIUG1PpeTDIDutNYWsTfE6KZy
         6xGcoxNrIx3NQfkV6wGfSextWoxX+dhEH0khMIzl/U65x3uqQuYuecHadZrs8pqTYyRg
         obUIv2IqA4xwJwFmB8eGghYXAWMW9HX65nolDTks/SBDk+TS7NYfU1SPbKSngdsdHoSQ
         +AIkTlM8XXd7uQS/4URRsZSpQkVsHmUOO1jQ4a6Ecoswh7UyqUPOBk307/nRAnp2TdRO
         iwzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713386145; x=1713990945;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DOKRNVZvRvqZ7o0+CDwYfQ/AoXU35i3jMyRGEyO4FpU=;
        b=BmJbRPfHTUDHBUOsCzeQctiXi34pzQp7BDsREUe7yeTeYGvSZ/78T4T1RRzzx2kutB
         lvsDmssce8iG9ezC/2npOkcK7SMtvr4GXWKQYG6Dc9DteFR5G8vgCfcl74XJVxQFgQoX
         yyS1IPPY80GnyC+y71xnFwPxNnFRBwd/2w6eaQm3gKmSn3T8vblUXj6V0/+AwSPozNDf
         o7lOlVwqaUPJ1Ueb5FRXszbgCBRLr/MH2axD+53NSCs25aCumlLDw0JPvW3uUVnhLNvr
         9Se9GocHFRvJSQ0YiAC3fdZFKqx3tWIOJ5mi+xEYM4vSfGDUc/jCZqvQNrzyX9ggqxtp
         8bvw==
X-Gm-Message-State: AOJu0YzXGgDJ45Q7ktQylB7ATHo8g/csxBbpcpMhUO7pOyyJfj5Tw8wn
	+aF69vP3mBOKEVV2lArTFmUao5XbMh89qSXL4eVGqSUDQdPx8XXDC+Rk0G47N3tzrG7Icw7xG2X
	cZqU=
X-Google-Smtp-Source: AGHT+IEpHe5F5EsnzIOAxSGPCwTtAqhc1fChQVt4nIKwno5zn75KPJi1ANhZNWezNWbO0WTQolyOgQ==
X-Received: by 2002:a17:90b:400d:b0:2a5:5f9f:6733 with SMTP id ie13-20020a17090b400d00b002a55f9f6733mr286158pjb.20.1713386145228;
        Wed, 17 Apr 2024 13:35:45 -0700 (PDT)
Received: from xps13.. ([199.58.97.236])
        by smtp.gmail.com with ESMTPSA id s22-20020a17090aa11600b002ab664e5e17sm76876pjp.1.2024.04.17.13.35.44
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Apr 2024 13:35:44 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 4/7] nghttp2: Fix CVE-2024-28182
Date: Wed, 17 Apr 2024 13:35:28 -0700
Message-Id: <85e65af4727695d61c225a5911325764f423c331.1713385733.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1713385733.git.steve@sakoman.com>
References: <cover.1713385733.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 17 Apr 2024 20:35:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198481

From: Soumya Sambu <soumya.sambu@windriver.com>

nghttp2 is an implementation of the Hypertext Transfer Protocol
version 2 in C. The nghttp2 library prior to version 1.61.0 keeps
reading the unbounded number of HTTP/2 CONTINUATION frames even
after a stream is reset to keep HPACK context in sync. This
causes excessive CPU usage to decode HPACK stream. nghttp2 v1.61.0
mitigates this vulnerability by limiting the number of CONTINUATION
frames it accepts per stream. There is no workaround for this
vulnerability.

References:
https://nvd.nist.gov/vuln/detail/CVE-2024-28182

Signed-off-by: Soumya Sambu <soumya.sambu@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../nghttp2/nghttp2/CVE-2024-28182-0001.patch | 110 ++++++++++++++++++
 .../nghttp2/nghttp2/CVE-2024-28182-0002.patch | 105 +++++++++++++++++
 .../recipes-support/nghttp2/nghttp2_1.47.0.bb |   2 +
 3 files changed, 217 insertions(+)
 create mode 100644 meta/recipes-support/nghttp2/nghttp2/CVE-2024-28182-0001.patch
 create mode 100644 meta/recipes-support/nghttp2/nghttp2/CVE-2024-28182-0002.patch

diff --git a/meta/recipes-support/nghttp2/nghttp2/CVE-2024-28182-0001.patch b/meta/recipes-support/nghttp2/nghttp2/CVE-2024-28182-0001.patch
new file mode 100644
index 0000000000..e1d909b0d1
--- /dev/null
+++ b/meta/recipes-support/nghttp2/nghttp2/CVE-2024-28182-0001.patch
@@ -0,0 +1,110 @@
+From 00201ecd8f982da3b67d4f6868af72a1b03b14e0 Mon Sep 17 00:00:00 2001
+From: Tatsuhiro Tsujikawa <tatsuhiro.t@gmail.com>
+Date: Sat, 9 Mar 2024 16:26:42 +0900
+Subject: [PATCH] Limit CONTINUATION frames following an incoming HEADER frame
+
+CVE: CVE-2024-28182
+
+Upstream-Status: Backport [https://github.com/nghttp2/nghttp2/commit/00201ecd8f982da3b67d4f6868af72a1b03b14e0]
+
+Signed-off-by: Soumya Sambu <soumya.sambu@windriver.com>
+---
+ lib/includes/nghttp2/nghttp2.h |  7 ++++++-
+ lib/nghttp2_helper.c           |  2 ++
+ lib/nghttp2_session.c          |  7 +++++++
+ lib/nghttp2_session.h          | 10 ++++++++++
+ 4 files changed, 25 insertions(+), 1 deletion(-)
+
+diff --git a/lib/includes/nghttp2/nghttp2.h b/lib/includes/nghttp2/nghttp2.h
+index 2bd35f4..6cc8c0c 100644
+--- a/lib/includes/nghttp2/nghttp2.h
++++ b/lib/includes/nghttp2/nghttp2.h
+@@ -440,7 +440,12 @@ typedef enum {
+    * exhaustion on server side to send these frames forever and does
+    * not read network.
+    */
+-  NGHTTP2_ERR_FLOODED = -904
++  NGHTTP2_ERR_FLOODED = -904,
++  /**
++   * When a local endpoint receives too many CONTINUATION frames
++   * following a HEADER frame.
++   */
++  NGHTTP2_ERR_TOO_MANY_CONTINUATIONS = -905,
+ } nghttp2_error;
+
+ /**
+diff --git a/lib/nghttp2_helper.c b/lib/nghttp2_helper.c
+index 588e269..98989f6 100644
+--- a/lib/nghttp2_helper.c
++++ b/lib/nghttp2_helper.c
+@@ -336,6 +336,8 @@ const char *nghttp2_strerror(int error_code) {
+            "closed";
+   case NGHTTP2_ERR_TOO_MANY_SETTINGS:
+     return "SETTINGS frame contained more than the maximum allowed entries";
++  case NGHTTP2_ERR_TOO_MANY_CONTINUATIONS:
++    return "Too many CONTINUATION frames following a HEADER frame";
+   default:
+     return "Unknown error code";
+   }
+diff --git a/lib/nghttp2_session.c b/lib/nghttp2_session.c
+index 5c834fa..537127c 100644
+--- a/lib/nghttp2_session.c
++++ b/lib/nghttp2_session.c
+@@ -464,6 +464,7 @@ static int session_new(nghttp2_session **session_ptr,
+   (*session_ptr)->max_send_header_block_length = NGHTTP2_MAX_HEADERSLEN;
+   (*session_ptr)->max_outbound_ack = NGHTTP2_DEFAULT_MAX_OBQ_FLOOD_ITEM;
+   (*session_ptr)->max_settings = NGHTTP2_DEFAULT_MAX_SETTINGS;
++  (*session_ptr)->max_continuations = NGHTTP2_DEFAULT_MAX_CONTINUATIONS;
+
+   if (option) {
+     if ((option->opt_set_mask & NGHTTP2_OPT_NO_AUTO_WINDOW_UPDATE) &&
+@@ -6307,6 +6308,8 @@ ssize_t nghttp2_session_mem_recv(nghttp2_session *session, const uint8_t *in,
+           }
+         }
+         session_inbound_frame_reset(session);
++
++        session->num_continuations = 0;
+       }
+       break;
+     }
+@@ -6428,6 +6431,10 @@ ssize_t nghttp2_session_mem_recv(nghttp2_session *session, const uint8_t *in,
+       }
+ #endif /* DEBUGBUILD */
+
++      if (++session->num_continuations > session->max_continuations) {
++        return NGHTTP2_ERR_TOO_MANY_CONTINUATIONS;
++      }
++
+       readlen = inbound_frame_buf_read(iframe, in, last);
+       in += readlen;
+
+diff --git a/lib/nghttp2_session.h b/lib/nghttp2_session.h
+index 5f71a16..9a00b0e 100644
+--- a/lib/nghttp2_session.h
++++ b/lib/nghttp2_session.h
+@@ -107,6 +107,10 @@ typedef struct {
+ #define NGHTTP2_DEFAULT_STREAM_RESET_BURST 1000
+ #define NGHTTP2_DEFAULT_STREAM_RESET_RATE 33
+
++/* The default max number of CONTINUATION frames following an incoming
++   HEADER frame. */
++#define NGHTTP2_DEFAULT_MAX_CONTINUATIONS 8
++
+ /* Internal state when receiving incoming frame */
+ typedef enum {
+   /* Receiving frame header */
+@@ -279,6 +283,12 @@ struct nghttp2_session {
+   size_t max_send_header_block_length;
+   /* The maximum number of settings accepted per SETTINGS frame. */
+   size_t max_settings;
++  /* The maximum number of CONTINUATION frames following an incoming
++     HEADER frame. */
++  size_t max_continuations;
++  /* The number of CONTINUATION frames following an incoming HEADER
++     frame.  This variable is reset when END_HEADERS flag is seen. */
++  size_t num_continuations;
+   /* Next Stream ID. Made unsigned int to detect >= (1 << 31). */
+   uint32_t next_stream_id;
+   /* The last stream ID this session initiated.  For client session,
+--
+2.40.0
diff --git a/meta/recipes-support/nghttp2/nghttp2/CVE-2024-28182-0002.patch b/meta/recipes-support/nghttp2/nghttp2/CVE-2024-28182-0002.patch
new file mode 100644
index 0000000000..fee19465d5
--- /dev/null
+++ b/meta/recipes-support/nghttp2/nghttp2/CVE-2024-28182-0002.patch
@@ -0,0 +1,105 @@
+From d71a4668c6bead55805d18810d633fbb98315af9 Mon Sep 17 00:00:00 2001
+From: Tatsuhiro Tsujikawa <tatsuhiro.t@gmail.com>
+Date: Sat, 9 Mar 2024 16:48:10 +0900
+Subject: [PATCH] Add nghttp2_option_set_max_continuations
+
+CVE: CVE-2024-28182
+
+Upstream-Status: Backport [https://github.com/nghttp2/nghttp2/commit/d71a4668c6bead55805d18810d633fbb98315af9]
+
+Signed-off-by: Soumya Sambu <soumya.sambu@windriver.com>
+---
+ doc/Makefile.am                |  1 +
+ lib/includes/nghttp2/nghttp2.h | 11 +++++++++++
+ lib/nghttp2_option.c           |  5 +++++
+ lib/nghttp2_option.h           |  5 +++++
+ lib/nghttp2_session.c          |  4 ++++
+ 5 files changed, 26 insertions(+)
+
+diff --git a/doc/Makefile.am b/doc/Makefile.am
+index b9d5a2d..83cfdfd 100644
+--- a/doc/Makefile.am
++++ b/doc/Makefile.am
+@@ -70,6 +70,7 @@ APIDOCS= \
+	nghttp2_option_set_no_recv_client_magic.rst \
+	nghttp2_option_set_peer_max_concurrent_streams.rst \
+	nghttp2_option_set_user_recv_extension_type.rst \
++	nghttp2_option_set_max_continuations.rst \
+	nghttp2_option_set_max_outbound_ack.rst \
+	nghttp2_option_set_max_settings.rst \
+	nghttp2_option_set_stream_reset_rate_limit.rst \
+diff --git a/lib/includes/nghttp2/nghttp2.h b/lib/includes/nghttp2/nghttp2.h
+index 6cc8c0c..c77cca9 100644
+--- a/lib/includes/nghttp2/nghttp2.h
++++ b/lib/includes/nghttp2/nghttp2.h
+@@ -2724,6 +2724,17 @@ NGHTTP2_EXTERN void nghttp2_option_set_max_outbound_ack(nghttp2_option *option,
+ NGHTTP2_EXTERN void nghttp2_option_set_max_settings(nghttp2_option *option,
+                                                     size_t val);
+
++/**
++ * @function
++ *
++ * This function sets the maximum number of CONTINUATION frames
++ * following an incoming HEADER frame.  If more than those frames are
++ * received, the remote endpoint is considered to be misbehaving and
++ * session will be closed.  The default value is 8.
++ */
++NGHTTP2_EXTERN void nghttp2_option_set_max_continuations(nghttp2_option *option,
++                                                         size_t val);
++
+ /**
+  * @function
+  *
+diff --git a/lib/nghttp2_option.c b/lib/nghttp2_option.c
+index 0d9a404..f3659c1 100644
+--- a/lib/nghttp2_option.c
++++ b/lib/nghttp2_option.c
+@@ -133,3 +133,8 @@ void nghttp2_option_set_stream_reset_rate_limit(nghttp2_option *option,
+   option->stream_reset_burst = burst;
+   option->stream_reset_rate = rate;
+ }
++
++void nghttp2_option_set_max_continuations(nghttp2_option *option, size_t val) {
++  option->opt_set_mask |= NGHTTP2_OPT_MAX_CONTINUATIONS;
++  option->max_continuations = val;
++}
+diff --git a/lib/nghttp2_option.h b/lib/nghttp2_option.h
+index e6ba910..c1b48c7 100644
+--- a/lib/nghttp2_option.h
++++ b/lib/nghttp2_option.h
+@@ -69,6 +69,7 @@ typedef enum {
+   NGHTTP2_OPT_MAX_OUTBOUND_ACK = 1 << 11,
+   NGHTTP2_OPT_MAX_SETTINGS = 1 << 12,
+   NGHTTP2_OPT_STREAM_RESET_RATE_LIMIT = 1 << 15,
++  NGHTTP2_OPT_MAX_CONTINUATIONS = 1 << 16,
+ } nghttp2_option_flag;
+
+ /**
+@@ -96,6 +97,10 @@ struct nghttp2_option {
+    * NGHTTP2_OPT_MAX_SETTINGS
+    */
+   size_t max_settings;
++  /**
++   * NGHTTP2_OPT_MAX_CONTINUATIONS
++   */
++  size_t max_continuations;
+   /**
+    * Bitwise OR of nghttp2_option_flag to determine that which fields
+    * are specified.
+diff --git a/lib/nghttp2_session.c b/lib/nghttp2_session.c
+index 537127c..b390cd5 100644
+--- a/lib/nghttp2_session.c
++++ b/lib/nghttp2_session.c
+@@ -539,6 +539,10 @@ static int session_new(nghttp2_session **session_ptr,
+                            option->stream_reset_burst,
+                            option->stream_reset_rate);
+     }
++
++    if (option->opt_set_mask & NGHTTP2_OPT_MAX_CONTINUATIONS) {
++      (*session_ptr)->max_continuations = option->max_continuations;
++    }
+   }
+
+   rv = nghttp2_hd_deflate_init2(&(*session_ptr)->hd_deflater,
+--
+2.40.0
diff --git a/meta/recipes-support/nghttp2/nghttp2_1.47.0.bb b/meta/recipes-support/nghttp2/nghttp2_1.47.0.bb
index b67313b5c2..79b1cf95c5 100644
--- a/meta/recipes-support/nghttp2/nghttp2_1.47.0.bb
+++ b/meta/recipes-support/nghttp2/nghttp2_1.47.0.bb
@@ -11,6 +11,8 @@ SRC_URI = "\
     file://0001-fetch-ocsp-response-use-python3.patch \
     file://CVE-2023-35945.patch \
     file://CVE-2023-44487.patch \
+    file://CVE-2024-28182-0001.patch \
+    file://CVE-2024-28182-0002.patch \
 "
 SRC_URI[sha256sum] = "68271951324554c34501b85190f22f2221056db69f493afc3bbac8e7be21e7cc"
 
-- 
2.34.1


