Return-Path: <Jinfeng.Wang.CN@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4124E98FBE
	for <webhook@archiver.kernel.org>; Thu,  9 Apr 2026 06:16:49 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.126100.1775715405040007076
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Apr 2026 23:16:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=dgLIqQK2;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=8559144404=jinfeng.wang.cn@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6395P2AA550304
	for <openembedded-core@lists.openembedded.org>; Wed, 8 Apr 2026 23:16:44 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=PPS06212021;
	 bh=BPY0r689Td4XeV8FYXxQC7ufEn33GlyHQp2bqbMRw9A=; b=dgLIqQK2MO62
	fWURvF6S86JRMBXtjh/X0mN+VXIjxKfqZnwvPPxtNdB7zInVCkErzykstKnk1A4b
	G2bvsfvEP92O9AmseUbVuOTrAfKwJY11rYCmSbqgZipMnm95YdsDyg6MO58T1M2W
	R0+afrMoA+wcCY/TZwZYuM478VYGcD5ietLiA7gBtpD33uFpfS6RCOAXMznx6vXw
	ej72uTCswSgisiWmqbBBaARPZZtD3kSvGCenxwzxbB4M8OqOSM/kgVXPs33xPjJL
	JVKyJoV+g7yeLxd/FLJaT/KYFTAZg/ELRnfLZiyibkh8N4LDTDjMfcHvrOxSqD8h
	wQJurOBDiw==
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [128.224.246.37])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4dcmrmkpj1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 08 Apr 2026 23:16:44 -0700 (PDT)
Received: from ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.61; Wed, 8 Apr 2026 23:16:43 -0700
Received: from pek-lpg-core4.wrs.com (10.11.232.110) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server id
 15.1.2507.61 via Frontend Transport; Wed, 8 Apr 2026 23:16:43 -0700
From: <jinfeng.wang.cn@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [scarthgap][PATCH 03/12] libsoup-2.4: fix CVE-2025-14523/CVE-2025-32049
Date: Thu, 9 Apr 2026 14:16:30 +0800
Message-ID: <20260409061639.1688205-4-jinfeng.wang.cn@windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260409061639.1688205-1-jinfeng.wang.cn@windriver.com>
References: <20260409061639.1688205-1-jinfeng.wang.cn@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: 8tfsN6CpumWwZS53XssKYR-g0I5Llwrz
X-Proofpoint-GUID: 8tfsN6CpumWwZS53XssKYR-g0I5Llwrz
X-Authority-Analysis: v=2.4 cv=PpWjqQM3 c=1 sm=1 tr=0 ts=69d7444c cx=c_pps
 a=Lg6ja3A245NiLSnFpY5YKQ==:117 a=Lg6ja3A245NiLSnFpY5YKQ==:17
 a=A5OVakUREuEA:10 a=VkNPw1HP01LnGYTKEx00:22 a=bi6dqmuHe4P4UrxVR6um:22
 a=iKiJcTA2PjBS6x5JeXcw:22 a=GHR8O2WEAAAA:20 a=t7CeM3EgAAAA:8
 a=eJUJbGhbfUxm8WMFQAoA:9 a=xq5tANASL-no6zqz:21 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA5MDA1NCBTYWx0ZWRfX/8QchCPJmkii
 uLXYFhfytWcbQpGHKBrNOVQ3VTbUcyPxtAmbZecoo4tGqwHvCckh+WnkgC0F8A8XsM+r2WJd7+9
 p5+Gny2s5DdTba17eZw9fiVVsc84YYyuSO80ZHrBH5zFOYhQCc6QXfPWlizhvazXBLv7JJ5TDeV
 N1T7d/0Arn49jDCbc8q/uHtL6ZiANsE88b+tcePEjNFEbsR0POCT+s/lit5AU/7yVIdS/RR7XWo
 8omLgFBANXSEi4XmW4Ep9qHkkO9iw2epI/FKh2ciATH2x0eZ8S7DMLTYhfKCabra25KMJWCqLuP
 y8s5kGVrwI/v/nDqwkRLxEF4T7v0dUAqODHU2o2OyXqWfJW4c//Oy7707hL2+3ekOu4JCVsztan
 PaMjI8cjuejEb5uAF0ytEZpE9jhhTd+psapjLc6tHFVALSdUqoAittEGmio9eUuV3BpOKsaWGvP
 3lmuUZxXSJnqmVOJxxQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-09_01,2026-04-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 malwarescore=0 spamscore=0 priorityscore=1501
 adultscore=0 suspectscore=0 lowpriorityscore=0 phishscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604090054
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 09 Apr 2026 06:16:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234878

From: Changqing Li <changqing.li@windriver.com>

Refer:
https://gitlab.gnome.org/GNOME/libsoup/-/issues/472
https://gitlab.gnome.org/GNOME/libsoup/-/issues/390

Signed-off-by: Changqing Li <changqing.li@windriver.com>
Signed-off-by: Jinfeng Wang <jinfeng.wang.cn@windriver.com>
---
 .../libsoup/libsoup-2.4/CVE-2025-14523.patch  |  52 ++++
 .../libsoup-2.4/CVE-2025-32049-1.patch        | 229 ++++++++++++++++++
 .../libsoup-2.4/CVE-2025-32049-2.patch        | 131 ++++++++++
 .../libsoup/libsoup-2.4_2.74.3.bb             |   3 +
 4 files changed, 415 insertions(+)
 create mode 100644 meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-14523.patch
 create mode 100644 meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-32049-1.patch
 create mode 100644 meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-32049-2.patch

diff --git a/meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-14523.patch b/meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-14523.patch
new file mode 100644
index 0000000000..7815dba55a
--- /dev/null
+++ b/meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-14523.patch
@@ -0,0 +1,52 @@
+From d6028a6e6a8417b7fb6c89f6c10fb94781435ee6 Mon Sep 17 00:00:00 2001
+From: Changqing Li <changqing.li@windriver.com>
+Date: Wed, 4 Feb 2026 15:08:50 +0800
+Subject: [PATCH] Reject duplicate Host headers (for libsoup 2)
+
+This is a simplified version of my patch for libsoup 3:
+
+!491
+
+Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/libsoup/-/commit/d3db5a6f8f03e1f0133754872877c92c0284c472]
+CVE: CVE-2025-14523
+
+This patch is a MR for branch 2-74, but not merged yet, maybe it will
+not be merged.
+
+Signed-off-by: Changqing Li <changqing.li@windriver.com>
+---
+ libsoup/soup-headers.c         | 3 +++
+ libsoup/soup-message-headers.c | 3 +++
+ 2 files changed, 6 insertions(+)
+
+diff --git a/libsoup/soup-headers.c b/libsoup/soup-headers.c
+index ea2f986..6cd3dad 100644
+--- a/libsoup/soup-headers.c
++++ b/libsoup/soup-headers.c
+@@ -138,6 +138,9 @@ soup_headers_parse (const char *str, int len, SoupMessageHeaders *dest)
+ 		for (p = strchr (value, '\r'); p; p = strchr (p, '\r'))
+ 			*p = ' ';
+ 
++		if (g_ascii_strcasecmp (name, "Host") == 0 && soup_message_headers_get_one (dest, "Host"))
++			goto done;
++
+ 		soup_message_headers_append (dest, name, value);
+         }
+ 	success = TRUE;
+diff --git a/libsoup/soup-message-headers.c b/libsoup/soup-message-headers.c
+index f612bff..bb20bbb 100644
+--- a/libsoup/soup-message-headers.c
++++ b/libsoup/soup-message-headers.c
+@@ -220,6 +220,9 @@ soup_message_headers_append (SoupMessageHeaders *hdrs,
+ 	}
+ #endif
+ 
++	if (g_ascii_strcasecmp (name, "Host") == 0 && soup_message_headers_get_one (hdrs, "Host"))
++		return;
++
+ 	header.name = intern_header_name (name, &setter);
+ 	header.value = g_strdup (value);
+ 	g_array_append_val (hdrs->array, header);
+-- 
+2.34.1
+
diff --git a/meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-32049-1.patch b/meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-32049-1.patch
new file mode 100644
index 0000000000..64e87cb1ec
--- /dev/null
+++ b/meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-32049-1.patch
@@ -0,0 +1,229 @@
+From c574e659c41c18fad3973bbaa3b3ec75664b3137 Mon Sep 17 00:00:00 2001
+From: Changqing Li <changqing.li@windriver.com>
+Date: Thu, 5 Feb 2026 16:20:02 +0800
+Subject: [PATCH 1/2] websocket: add a way to restrict the total message size
+
+Otherwise a client could send small packages smaller than
+total-incoming-payload-size but still to break the server
+with a big allocation
+
+Fixes: #390
+
+Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/libsoup/-/commit/db87805ab565d67533dfed2cb409dbfd63c7fdce]
+CVE: CVE-2025-32049
+
+libsoup2 is not maintained, the patch is backported from libsoup3, and
+change accordingly
+
+Signed-off-by: Changqing Li <changqing.li@windriver.com>
+---
+ libsoup/soup-websocket-connection.c | 104 ++++++++++++++++++++++++++--
+ libsoup/soup-websocket-connection.h |   7 ++
+ 2 files changed, 107 insertions(+), 4 deletions(-)
+
+diff --git a/libsoup/soup-websocket-connection.c b/libsoup/soup-websocket-connection.c
+index 9d5f4f8..3dad477 100644
+--- a/libsoup/soup-websocket-connection.c
++++ b/libsoup/soup-websocket-connection.c
+@@ -85,7 +85,8 @@ enum {
+ 	PROP_STATE,
+ 	PROP_MAX_INCOMING_PAYLOAD_SIZE,
+ 	PROP_KEEPALIVE_INTERVAL,
+-	PROP_EXTENSIONS
++	PROP_EXTENSIONS,
++	PROP_MAX_TOTAL_MESSAGE_SIZE,
+ };
+ 
+ enum {
+@@ -120,6 +121,7 @@ struct _SoupWebsocketConnectionPrivate {
+ 	char *origin;
+ 	char *protocol;
+ 	guint64 max_incoming_payload_size;
++	guint64 max_total_message_size;
+ 	guint keepalive_interval;
+ 
+ 	gushort peer_close_code;
+@@ -152,6 +154,7 @@ struct _SoupWebsocketConnectionPrivate {
+ };
+ 
+ #define MAX_INCOMING_PAYLOAD_SIZE_DEFAULT   128 * 1024
++#define MAX_TOTAL_MESSAGE_SIZE_DEFAULT   128 * 1024
+ #define READ_BUFFER_SIZE 1024
+ #define MASK_LENGTH 4
+ 
+@@ -664,7 +667,7 @@ bad_data_error_and_close (SoupWebsocketConnection *self)
+ }
+ 
+ static void
+-too_big_error_and_close (SoupWebsocketConnection *self,
++too_big_incoming_payload_error_and_close (SoupWebsocketConnection *self,
+                          guint64 payload_len)
+ {
+ 	GError *error;
+@@ -680,6 +683,23 @@ too_big_error_and_close (SoupWebsocketConnection *self,
+ 	emit_error_and_close (self, error, TRUE);
+ }
+ 
++static void
++too_big_message_error_and_close (SoupWebsocketConnection *self,
++                                 guint64 len)
++{
++	GError *error;
++
++	error = g_error_new_literal (SOUP_WEBSOCKET_ERROR,
++				     SOUP_WEBSOCKET_CLOSE_TOO_BIG,
++				     self->pv->connection_type == SOUP_WEBSOCKET_CONNECTION_SERVER ?
++				     "Received WebSocket payload from the client larger than configured max-total-message-size" :
++				     "Received WebSocket payload from the server larger than configured max-total-message-size");
++	g_debug ("%s received message of size %" G_GUINT64_FORMAT " or greater, but max supported size is %" G_GUINT64_FORMAT,
++	         self->pv->connection_type == SOUP_WEBSOCKET_CONNECTION_SERVER ? "server" : "client",
++	         len, self->pv->max_total_message_size);
++	emit_error_and_close (self, error, TRUE);
++}
++
+ static void
+ close_connection (SoupWebsocketConnection *self,
+                   gushort                  code,
+@@ -913,6 +933,12 @@ process_contents (SoupWebsocketConnection *self,
+ 		switch (pv->message_opcode) {
+ 		case 0x01:
+ 		case 0x02:
++			/* Safety valve */
++			if (pv->max_total_message_size > 0 &&
++			    (pv->message_data->len + payload_len) > pv->max_total_message_size) {
++				too_big_message_error_and_close (self, (pv->message_data->len + payload_len));
++				return;
++			}
+ 			g_byte_array_append (pv->message_data, payload, payload_len);
+ 			break;
+ 		default:
+@@ -1050,7 +1076,7 @@ process_frame (SoupWebsocketConnection *self)
+ 	/* Safety valve */
+ 	if (self->pv->max_incoming_payload_size > 0 &&
+ 	    payload_len >= self->pv->max_incoming_payload_size) {
+-		too_big_error_and_close (self, payload_len);
++		too_big_incoming_payload_error_and_close (self, payload_len);
+ 		return FALSE;
+ 	}
+ 
+@@ -1357,6 +1383,10 @@ soup_websocket_connection_get_property (GObject *object,
+ 		g_value_set_pointer (value, pv->extensions);
+ 		break;
+ 
++	case PROP_MAX_TOTAL_MESSAGE_SIZE:
++		g_value_set_uint64 (value, pv->max_total_message_size);
++		break;
++
+ 	default:
+ 		G_OBJECT_WARN_INVALID_PROPERTY_ID (object, prop_id, pspec);
+ 		break;
+@@ -1410,6 +1440,10 @@ soup_websocket_connection_set_property (GObject *object,
+ 		pv->extensions = g_value_get_pointer (value);
+ 		break;
+ 
++	case PROP_MAX_TOTAL_MESSAGE_SIZE:
++		pv->max_total_message_size = g_value_get_uint64 (value);
++		break;
++
+ 	default:
+ 		G_OBJECT_WARN_INVALID_PROPERTY_ID (object, prop_id, pspec);
+ 		break;
+@@ -1631,7 +1665,24 @@ soup_websocket_connection_class_init (SoupWebsocketConnectionClass *klass)
+                                                                G_PARAM_READWRITE |
+                                                                G_PARAM_CONSTRUCT_ONLY |
+                                                                G_PARAM_STATIC_STRINGS));
+-
++	/**
++	 * SoupWebsocketConnection:max-total-message-size:
++	 *
++	 * The total message size for incoming packets.
++	 *
++	 * The protocol expects or 0 to not limit it.
++	 *
++	 */
++	g_object_class_install_property (gobject_class, PROP_MAX_TOTAL_MESSAGE_SIZE,
++					g_param_spec_uint64 ("max-total-message-size",
++					                     "Max total message size",
++					                     "Max total message size ",
++					                     0,
++					                     G_MAXUINT64,
++					                     MAX_TOTAL_MESSAGE_SIZE_DEFAULT,
++					                     G_PARAM_READWRITE |
++					                     G_PARAM_CONSTRUCT |
++					                     G_PARAM_STATIC_STRINGS));
+ 	/**
+ 	 * SoupWebsocketConnection::message:
+ 	 * @self: the WebSocket
+@@ -2145,6 +2196,51 @@ soup_websocket_connection_set_max_incoming_payload_size (SoupWebsocketConnection
+ 	}
+ }
+ 
++/**
++ * soup_websocket_connection_get_max_total_message_size:
++ * @self: the WebSocket
++ *
++ * Gets the maximum total message size allowed for packets.
++ *
++ * Returns: the maximum total message size.
++ *
++ */
++guint64
++soup_websocket_connection_get_max_total_message_size (SoupWebsocketConnection *self)
++{
++   SoupWebsocketConnectionPrivate *pv;
++
++   g_return_val_if_fail (SOUP_IS_WEBSOCKET_CONNECTION (self), MAX_TOTAL_MESSAGE_SIZE_DEFAULT);
++   pv = self->pv;
++
++   return pv->max_total_message_size;
++}
++
++/**
++ * soup_websocket_connection_set_max_total_message_size:
++ * @self: the WebSocket
++ * @max_total_message_size: the maximum total message size
++ *
++ * Sets the maximum total message size allowed for packets.
++ *
++ * It does not limit the outgoing packet size.
++ *
++ */
++void
++soup_websocket_connection_set_max_total_message_size (SoupWebsocketConnection *self,
++                                                      guint64                  max_total_message_size)
++{
++   SoupWebsocketConnectionPrivate *pv;
++
++   g_return_if_fail (SOUP_IS_WEBSOCKET_CONNECTION (self));
++   pv = self->pv;
++
++   if (pv->max_total_message_size != max_total_message_size) {
++       pv->max_total_message_size = max_total_message_size;
++       g_object_notify (G_OBJECT (self), "max-total-message-size");
++   }
++}
++
+ /**
+  * soup_websocket_connection_get_keepalive_interval:
+  * @self: the WebSocket
+diff --git a/libsoup/soup-websocket-connection.h b/libsoup/soup-websocket-connection.h
+index f82d723..d2a60e9 100644
+--- a/libsoup/soup-websocket-connection.h
++++ b/libsoup/soup-websocket-connection.h
+@@ -136,6 +136,13 @@ SOUP_AVAILABLE_IN_2_58
+ void                soup_websocket_connection_set_keepalive_interval (SoupWebsocketConnection *self,
+                                                                       guint                    interval);
+ 
++SOUP_AVAILABLE_IN_2_72
++guint64             soup_websocket_connection_get_max_total_message_size    (SoupWebsocketConnection *self);
++
++SOUP_AVAILABLE_IN_2_72
++void                soup_websocket_connection_set_max_total_message_size    (SoupWebsocketConnection *self,
++                                                                             guint64                  max_total_message_size);
++
+ G_END_DECLS
+ 
+ #endif /* __SOUP_WEBSOCKET_CONNECTION_H__ */
+-- 
+2.34.1
+
diff --git a/meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-32049-2.patch b/meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-32049-2.patch
new file mode 100644
index 0000000000..f9c894aaec
--- /dev/null
+++ b/meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-32049-2.patch
@@ -0,0 +1,131 @@
+From 0bfc66f1082f5d47df99b6fc03f742ef7fa1051e Mon Sep 17 00:00:00 2001
+From: Changqing Li <changqing.li@windriver.com>
+Date: Thu, 5 Feb 2026 17:19:51 +0800
+Subject: [PATCH] Set message size limit in SoupServer rather than 
+ SoupWebsocketConnection
+
+We're not sure about the compatibility implications of having a default
+size limit for clients.
+
+Also not sure whether the server limit is actually set appropriately,
+but there is probably very little server usage of
+SoupWebsocketConnection in the wild, so it's not so likely to break
+things.
+
+Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/libsoup/-/commit/2df34d9544cabdbfdedd3b36f098cf69233b1df7]
+CVE: CVE-2025-32049
+
+Signed-off-by: Changqing Li <changqing.li@windriver.com>
+---
+ libsoup/soup-server.c               | 24 +++++++++++++++++++-----
+ libsoup/soup-websocket-connection.c | 23 ++++++++++++++++-------
+ 2 files changed, 35 insertions(+), 12 deletions(-)
+
+diff --git a/libsoup/soup-server.c b/libsoup/soup-server.c
+index 63875f3..a3f8597 100644
+--- a/libsoup/soup-server.c
++++ b/libsoup/soup-server.c
+@@ -216,6 +216,16 @@ enum {
+ 
+ G_DEFINE_TYPE_WITH_PRIVATE (SoupServer, soup_server, G_TYPE_OBJECT)
+ 
++/* SoupWebsocketConnection by default limits only maximum packet size. But a
++ * message may consist of multiple packets, so SoupServer additionally restricts
++ * total message size to mitigate denial of service attacks on the server.
++ * SoupWebsocketConnection does not do this by default because I don't know
++ * whether that would or would not cause compatibility problems for websites.
++ *
++ * This size is in bytes and it is arbitrary.
++ */
++#define MAX_TOTAL_MESSAGE_SIZE_DEFAULT   128 * 1024
++
+ static SoupClientContext *soup_client_context_ref (SoupClientContext *client);
+ static void soup_client_context_unref (SoupClientContext *client);
+ 
+@@ -1445,11 +1455,15 @@ complete_websocket_upgrade (SoupMessage *msg, gpointer user_data)
+ 
+ 	soup_client_context_ref (client);
+ 	stream = soup_client_context_steal_connection (client);
+-	conn = soup_websocket_connection_new_with_extensions (stream, uri,
+-							      SOUP_WEBSOCKET_CONNECTION_SERVER,
+-							      soup_message_headers_get_one (msg->request_headers, "Origin"),
+-							      soup_message_headers_get_one (msg->response_headers, "Sec-WebSocket-Protocol"),
+-							      handler->websocket_extensions);
++	conn = SOUP_WEBSOCKET_CONNECTION (g_object_new (SOUP_TYPE_WEBSOCKET_CONNECTION,
++						          "io-stream", stream,
++						          "uri", uri,
++						          "connection-type", SOUP_WEBSOCKET_CONNECTION_SERVER,
++						          "origin", soup_message_headers_get_one (msg->request_headers, "Origin"),
++						          "protocol", soup_message_headers_get_one (msg->response_headers, "Sec-WebSocket-Protocol"),
++						          "extensions", handler->websocket_extensions,
++						          "max-total-message-size", (guint64)MAX_TOTAL_MESSAGE_SIZE_DEFAULT,
++                                 NULL));
+ 	handler->websocket_extensions = NULL;
+ 	g_object_unref (stream);
+ 	soup_client_context_unref (client);
+diff --git a/libsoup/soup-websocket-connection.c b/libsoup/soup-websocket-connection.c
+index 3dad477..e7fa9b7 100644
+--- a/libsoup/soup-websocket-connection.c
++++ b/libsoup/soup-websocket-connection.c
+@@ -154,7 +154,6 @@ struct _SoupWebsocketConnectionPrivate {
+ };
+ 
+ #define MAX_INCOMING_PAYLOAD_SIZE_DEFAULT   128 * 1024
+-#define MAX_TOTAL_MESSAGE_SIZE_DEFAULT   128 * 1024
+ #define READ_BUFFER_SIZE 1024
+ #define MASK_LENGTH 4
+ 
+@@ -1615,8 +1614,9 @@ soup_websocket_connection_class_init (SoupWebsocketConnectionClass *klass)
+ 	/**
+ 	 * SoupWebsocketConnection:max-incoming-payload-size:
+ 	 *
+-	 * The maximum payload size for incoming packets the protocol expects
+-	 * or 0 to not limit it.
++	 * The maximum payload size for incoming packets, or 0 to not limit it.
++	 * Each message may consist of multiple packets, so also refer to
++	 * [property@WebSocketConnection:max-total-message-size].
+ 	 *
+ 	 * Since: 2.56
+ 	 */
+@@ -1668,9 +1668,18 @@ soup_websocket_connection_class_init (SoupWebsocketConnectionClass *klass)
+ 	/**
+ 	 * SoupWebsocketConnection:max-total-message-size:
+ 	 *
+-	 * The total message size for incoming packets.
++	 * The maximum size for incoming messages.
++	 * Set to a value to limit the total message size, or 0 to not
++	 * limit it.
+ 	 *
+-	 * The protocol expects or 0 to not limit it.
++	 * [method@Server.add_websocket_handler] will set this to a nonzero
++	 * default value to mitigate denial of service attacks. Clients must
++	 * choose their own default if they need to mitigate denial of service
++	 * attacks. You also need to set your own default if creating your own
++	 * server SoupWebsocketConnection without using SoupServer.
++	 *
++	 * Each message may consist of multiple packets, so also refer to
++	 *[property@WebSocketConnection:max-incoming-payload-size].
+ 	 *
+ 	 */
+ 	g_object_class_install_property (gobject_class, PROP_MAX_TOTAL_MESSAGE_SIZE,
+@@ -1679,7 +1688,7 @@ soup_websocket_connection_class_init (SoupWebsocketConnectionClass *klass)
+ 					                     "Max total message size ",
+ 					                     0,
+ 					                     G_MAXUINT64,
+-					                     MAX_TOTAL_MESSAGE_SIZE_DEFAULT,
++					                     0,
+ 					                     G_PARAM_READWRITE |
+ 					                     G_PARAM_CONSTRUCT |
+ 					                     G_PARAM_STATIC_STRINGS));
+@@ -2210,7 +2219,7 @@ soup_websocket_connection_get_max_total_message_size (SoupWebsocketConnection *s
+ {
+    SoupWebsocketConnectionPrivate *pv;
+ 
+-   g_return_val_if_fail (SOUP_IS_WEBSOCKET_CONNECTION (self), MAX_TOTAL_MESSAGE_SIZE_DEFAULT);
++   g_return_val_if_fail (SOUP_IS_WEBSOCKET_CONNECTION (self), 0);
+    pv = self->pv;
+ 
+    return pv->max_total_message_size;
+-- 
+2.34.1
+
diff --git a/meta/recipes-support/libsoup/libsoup-2.4_2.74.3.bb b/meta/recipes-support/libsoup/libsoup-2.4_2.74.3.bb
index 7e00cd678a..915d735da3 100644
--- a/meta/recipes-support/libsoup/libsoup-2.4_2.74.3.bb
+++ b/meta/recipes-support/libsoup/libsoup-2.4_2.74.3.bb
@@ -41,6 +41,9 @@ SRC_URI = "${GNOME_MIRROR}/libsoup/${SHRT_VER}/libsoup-${PV}.tar.xz \
            file://CVE-2025-4476.patch \
            file://CVE-2025-2784.patch \
            file://CVE-2025-4945.patch \
+           file://CVE-2025-14523.patch \
+           file://CVE-2025-32049-1.patch \
+           file://CVE-2025-32049-2.patch \
 "
 SRC_URI[sha256sum] = "e4b77c41cfc4c8c5a035fcdc320c7bc6cfb75ef7c5a034153df1413fa1d92f13"
 
-- 
2.34.1


