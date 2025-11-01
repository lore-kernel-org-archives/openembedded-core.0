Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24441CCFA00
	for <webhook@archiver.kernel.org>; Sat,  1 Nov 2025 21:04:36 +0000 (UTC)
Received: from mta-65-228.siemens.flowmailer.net (mta-65-228.siemens.flowmailer.net [185.136.65.228])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.455.1762031072499074461
 for <openembedded-core@lists.openembedded.org>;
 Sat, 01 Nov 2025 14:04:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=c5XUyBY1;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.228, mailfrom: fm-256628-2025110121043048d936f38f00020784-yg9g_3@rts-flowmailer.siemens.com)
Received: by mta-65-228.siemens.flowmailer.net with ESMTPSA id 2025110121043048d936f38f00020784
        for <openembedded-core@lists.openembedded.org>;
        Sat, 01 Nov 2025 22:04:30 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=dlletkz273MRBGec8PcGk6lATx8WjVD6m7H0TdXKInM=;
 b=c5XUyBY1ZHWoPXF3ojWdtw8KCEbQk3ecLcQcBNpzgQhmPDfIz0WpJFeENju0WynMLmsbWY
 xWjQ5i5kvpbmsF+byIaqEUlgStVKRhmIj2+XavxHsKnjvC3/2Cshs7KPzPI6/pTJ4goOMU4Z
 DsTPDGgoh3K3LhuRxxaY4+iZ8oNzwcF/TiCm94OPbGltMwDE+u6Evm2Yw5A3qukzORWTasEE
 TAndsncgTfB5fftfEm2GTTuuCpW/7UW8gx4BzdV8aX8ojMLTtFG9rsLsE8xRf2UCEYUiVz/8
 GPHJyfVAlz9QyVuavd5/gbRup3xD1kf459qNaHGVDBVRXh5A0WyLq/Xw==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [OE-core][scarthgap][PATCH] wpa-supplicant: patch CVE-2025-24912
Date: Sat,  1 Nov 2025 22:04:21 +0100
Message-Id: <20251101210421.1359593-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 01 Nov 2025 21:04:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225564

From: Peter Marko <peter.marko@siemens.com>

Pick patches as listed in NVD CVE report.

Note that Debian lists one of the patches as introducing the
vulnerability. This is against what the original report [1] says.
Also the commit messages provide hints that the first patch fixes this
issue and second is fixing problem with the first patch.

[1] https://jvn.jp/en/jp/JVN19358384/

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 .../wpa-supplicant/CVE-2025-24912-01.patch    | 79 +++++++++++++++++++
 .../wpa-supplicant/CVE-2025-24912-02.patch    | 70 ++++++++++++++++
 .../wpa-supplicant/wpa-supplicant_2.10.bb     |  2 +
 3 files changed, 151 insertions(+)
 create mode 100644 meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/CVE-2025-24912-01.patch
 create mode 100644 meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/CVE-2025-24912-02.patch

diff --git a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/CVE-2025-24912-01.patch b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/CVE-2025-24912-01.patch
new file mode 100644
index 00000000000..8976047f68f
--- /dev/null
+++ b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/CVE-2025-24912-01.patch
@@ -0,0 +1,79 @@
+From 726432d7622cc0088ac353d073b59628b590ea44 Mon Sep 17 00:00:00 2001
+From: Jouni Malinen <j@w1.fi>
+Date: Sat, 25 Jan 2025 11:21:16 +0200
+Subject: [PATCH] RADIUS: Drop pending request only when accepting the response
+
+The case of an invalid authenticator in a RADIUS response could imply
+that the response is not from the correct RADIUS server and as such,
+such a response should be discarded without changing internal state for
+the pending request. The case of an unknown response (RADIUS_RX_UNKNOWN)
+is somewhat more complex since it could have been indicated before
+validating the authenticator. In any case, it seems better to change the
+state for the pending request only when we have fully accepted the
+response.
+
+Allowing the internal state of pending RADIUS request to change based on
+responses that are not fully validation could have allow at least a
+theoretical DoS attack if an attacker were to have means for injecting
+RADIUS messages to the network using the IP address of the real RADIUS
+server and being able to do so more quickly than the real server and
+with the matching identifier from the request header (i.e., either by
+flooding 256 responses quickly or by having means to capture the RADIUS
+request). These should not really be realistic options in a properly
+protected deployment, but nevertheless it is good to be more careful in
+processing RADIUS responses.
+
+Remove a pending RADIUS request from the internal list only when having
+fully accepted a matching RADIUS response, i.e., after one of the
+registered handlers has confirmed that the authenticator is valid and
+processing of the response has succeeded.
+
+Signed-off-by: Jouni Malinen <j@w1.fi>
+
+CVE: CVE-2025-24912
+Upstream-Status: Backport [https://w1.fi/cgit/hostap/commit/?id=726432d7622cc0088ac353d073b59628b590ea44]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ src/radius/radius_client.c | 15 +++++++--------
+ 1 file changed, 7 insertions(+), 8 deletions(-)
+
+diff --git a/src/radius/radius_client.c b/src/radius/radius_client.c
+index 2a7f36170..7909b29a7 100644
+--- a/src/radius/radius_client.c
++++ b/src/radius/radius_client.c
+@@ -922,13 +922,6 @@ static void radius_client_receive(int sock, void *eloop_ctx, void *sock_ctx)
+ 		       roundtrip / 100, roundtrip % 100);
+ 	rconf->round_trip_time = roundtrip;
+ 
+-	/* Remove ACKed RADIUS packet from retransmit list */
+-	if (prev_req)
+-		prev_req->next = req->next;
+-	else
+-		radius->msgs = req->next;
+-	radius->num_msgs--;
+-
+ 	for (i = 0; i < num_handlers; i++) {
+ 		RadiusRxResult res;
+ 		res = handlers[i].handler(msg, req->msg, req->shared_secret,
+@@ -939,6 +932,13 @@ static void radius_client_receive(int sock, void *eloop_ctx, void *sock_ctx)
+ 			radius_msg_free(msg);
+ 			/* fall through */
+ 		case RADIUS_RX_QUEUED:
++			/* Remove ACKed RADIUS packet from retransmit list */
++			if (prev_req)
++				prev_req->next = req->next;
++			else
++				radius->msgs = req->next;
++			radius->num_msgs--;
++
+ 			radius_client_msg_free(req);
+ 			return;
+ 		case RADIUS_RX_INVALID_AUTHENTICATOR:
+@@ -960,7 +960,6 @@ static void radius_client_receive(int sock, void *eloop_ctx, void *sock_ctx)
+ 		       msg_type, hdr->code, hdr->identifier,
+ 		       invalid_authenticator ? " [INVALID AUTHENTICATOR]" :
+ 		       "");
+-	radius_client_msg_free(req);
+ 
+  fail:
+ 	radius_msg_free(msg);
diff --git a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/CVE-2025-24912-02.patch b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/CVE-2025-24912-02.patch
new file mode 100644
index 00000000000..f3cecd6d5fe
--- /dev/null
+++ b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/CVE-2025-24912-02.patch
@@ -0,0 +1,70 @@
+From 339a334551ca911187cc870f4f97ef08e11db109 Mon Sep 17 00:00:00 2001
+From: Jouni Malinen <quic_jouni@quicinc.com>
+Date: Wed, 5 Feb 2025 19:23:39 +0200
+Subject: [PATCH] RADIUS: Fix pending request dropping
+
+A recent change to this moved the place where the processed RADIUS
+request was removed from the pending list to happen after the message
+handler had been called. This did not take into account possibility of
+the handler adding a new pending request in the list and the prev_req
+pointer not necessarily pointing to the correct entry anymore. As such,
+some of the pending requests could have been lost and that would result
+in not being able to process responses to those requests and also, to a
+memory leak.
+
+Fix this by determining prev_req at the point when the pending request
+is being removed, i.e., after the handler function has already added a
+new entry.
+
+Fixes: 726432d7622c ("RADIUS: Drop pending request only when accepting the response")
+Signed-off-by: Jouni Malinen <quic_jouni@quicinc.com>
+
+CVE: CVE-2025-24912
+Upstream-Status: Backport [https://w1.fi/cgit/hostap/commit/?id=339a334551ca911187cc870f4f97ef08e11db109]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ src/radius/radius_client.c | 10 +++++++---
+ 1 file changed, 7 insertions(+), 3 deletions(-)
+
+diff --git a/src/radius/radius_client.c b/src/radius/radius_client.c
+index 7909b29a7..d4faa7936 100644
+--- a/src/radius/radius_client.c
++++ b/src/radius/radius_client.c
+@@ -824,7 +824,7 @@ static void radius_client_receive(int sock, void *eloop_ctx, void *sock_ctx)
+ 	struct radius_hdr *hdr;
+ 	struct radius_rx_handler *handlers;
+ 	size_t num_handlers, i;
+-	struct radius_msg_list *req, *prev_req;
++	struct radius_msg_list *req, *prev_req, *r;
+ 	struct os_reltime now;
+ 	struct hostapd_radius_server *rconf;
+ 	int invalid_authenticator = 0;
+@@ -887,7 +887,6 @@ static void radius_client_receive(int sock, void *eloop_ctx, void *sock_ctx)
+ 		break;
+ 	}
+ 
+-	prev_req = NULL;
+ 	req = radius->msgs;
+ 	while (req) {
+ 		/* TODO: also match by src addr:port of the packet when using
+@@ -899,7 +898,6 @@ static void radius_client_receive(int sock, void *eloop_ctx, void *sock_ctx)
+ 		    hdr->identifier)
+ 			break;
+ 
+-		prev_req = req;
+ 		req = req->next;
+ 	}
+ 
+@@ -933,6 +931,12 @@ static void radius_client_receive(int sock, void *eloop_ctx, void *sock_ctx)
+ 			/* fall through */
+ 		case RADIUS_RX_QUEUED:
+ 			/* Remove ACKed RADIUS packet from retransmit list */
++			prev_req = NULL;
++			for (r = radius->msgs; r; r = r->next) {
++				if (r == req)
++					break;
++				prev_req = r;
++			}
+ 			if (prev_req)
+ 				prev_req->next = req->next;
+ 			else
diff --git a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.10.bb b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.10.bb
index fd98bdcc363..f939945b08f 100644
--- a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.10.bb
+++ b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.10.bb
@@ -36,6 +36,8 @@ SRC_URI = "http://w1.fi/releases/wpa_supplicant-${PV}.tar.gz \
            file://CVE-2022-37660-0003.patch \
            file://CVE-2022-37660-0004.patch \
            file://CVE-2022-37660-0005.patch \
+           file://CVE-2025-24912-01.patch \
+           file://CVE-2025-24912-02.patch \
            "
 SRC_URI[sha256sum] = "20df7ae5154b3830355f8ab4269123a87affdea59fe74fe9292a91d0d7e17b2f"
 

