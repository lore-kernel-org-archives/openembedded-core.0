Return-Path: <soumya.sambu@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD62AC4345F
	for <webhook@archiver.kernel.org>; Tue, 16 Apr 2024 12:49:01 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.19790.1713271740794995894
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Apr 2024 05:49:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=Pp7HDdyL;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=48365af789=soumya.sambu@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 43GAPTRP023835
	for <openembedded-core@lists.openembedded.org>; Tue, 16 Apr 2024 12:49:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=PPS06212021; bh=5bPN0
	/ObOnpdtAO7YDAaBk1d2FKFWU8kCZNCEa0ws3w=; b=Pp7HDdyLnxx8RW8fhqoGP
	2hDNWuvRle6+jKDQz/+NM3Cc/JuOy5T2RO3eU2CRWm2bJgPWFhFhwiDq9XqDYj0X
	NOTkMtDmicvRiak5K+Rskvk4Qgrhun8/8REuvAmsop01qX8A+ufGJz2zQMVBykPS
	LYqDBR7N0rT9MRJivb/Ae5b5/O3ekyNriLH7H6aOKz0gemJA/HSc34lWUOvG9YTM
	4MILgPAMvMRw0Bjgbyj78yBdMn2OpOZ3fYpKQps4/uXbHN+LnWMMQ3vPA5uZBhWs
	xnkYMl5wBjXASGE0iYuEMc1a9WK2F685aN69gRyM4EUW5u/4a8Gxe2004vyJQsrq
	g==
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3xfh16jrmf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 16 Apr 2024 12:48:59 +0000 (GMT)
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.37; Tue, 16 Apr 2024 05:48:57 -0700
From: ssambu <soumya.sambu@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [OE-core][kirkstone][PATCH 1/1] nghttp2: Fix CVE-2024-28182
Date: Tue, 16 Apr 2024 12:48:35 +0000
Message-ID: <20240416124835.3564415-1-soumya.sambu@windriver.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [147.11.136.210]
X-ClientProxiedBy: ala-exchng01.corp.ad.wrs.com (147.11.82.252) To
 ala-exchng01.corp.ad.wrs.com (147.11.82.252)
X-Proofpoint-ORIG-GUID: S3QkaaRXOFW_r5ATWfVRUtnOnjazP1HF
X-Proofpoint-GUID: S3QkaaRXOFW_r5ATWfVRUtnOnjazP1HF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-04-16_09,2024-04-16_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 malwarescore=0
 suspectscore=0 impostorscore=0 bulkscore=0 mlxscore=0 lowpriorityscore=0
 clxscore=1011 phishscore=0 priorityscore=1501 spamscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2404010003
 definitions=main-2404160077
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 Apr 2024 12:49:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198450

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
2.40.0


