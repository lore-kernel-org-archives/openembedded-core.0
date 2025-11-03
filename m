Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A485BCCFA09
	for <webhook@archiver.kernel.org>; Mon,  3 Nov 2025 20:59:37 +0000 (UTC)
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2245.1762203572819207014
 for <openembedded-core@lists.openembedded.org>;
 Mon, 03 Nov 2025 12:59:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=apZEDkrX;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.45, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-340c39ee02dso2127428a91.1
        for <openembedded-core@lists.openembedded.org>; Mon, 03 Nov 2025 12:59:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1762203572; x=1762808372; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8yYRl+fm3yp25/jQWj+Erez1PvA+Tpu7oWuqCN6Pya8=;
        b=apZEDkrXtm3H8dYM6Ldbx7l+zdwKPKE6V8pFAEOq5NnRXZclUhfoihR16FAwQF7itS
         9UojhpF9q3yHxu/2z979W2OXaFsXxvxL5Tyk11lcpNWuEl2fxvfA5qqzAF5Gikft1gVt
         QHaPKIoWQ1lYLE3FNOnuGAmEvoWvfH1dmvqNBPy6UcouBrW4xHBLgV2Q980u1UHdKEad
         X0DfCNydWZ4L0FBYUDcKd6QtcLmCLJgDTvrxaZf0lIO65vbcfiGvZuHQ5w8UlprAftja
         FHe2PlEjxTmKmzukYPPnnaIakPW/2EE3XJNh/RMiLohaTSxaWWbCmR/jWU6M0I25WkgZ
         jAfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762203572; x=1762808372;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8yYRl+fm3yp25/jQWj+Erez1PvA+Tpu7oWuqCN6Pya8=;
        b=Ql7sELjpEGIqwSnHoObw5MpYo7VTdDDfFDk47dI1FU3zvUqUTin7F94HmFefarhuPa
         Dp/LCy+GPXmiWMa7DI8WMMg+iwYfh+z+a2rPUoFUu+OngjQJU8jDjfiD+xdNUjyKuEsI
         XmU0BxP0ffXpqT3YwIdhDXIxRRvEQ5xmFikQn+Ut6zDCqCiIUJZ2XbQupXZc8XfJvRZK
         Rj+z2UeVEtfLSv9SqeTTqgDtu9lh7ZVV6uSmH7QopQqwz5hVuaXh+V1132rxxWmsPi4V
         8oB1VAO2eKK2n0eOcwvCzvRLFKGJZ2K7Hsw1AZ3kgNYkMOtw8sgI87Fmes5zleXa+9PK
         hhHw==
X-Gm-Message-State: AOJu0Yw+feP22ql/dH81384Y/WxreZVmHz/35Z0wA2kEr3cxJ0EOmHlr
	7gmB4ecdLQLFhjuxy0NA1KGGxjk/dBBSM3VcXCFWCH2Qzk6hQRoVBY+i2+clRrhsMiXUpcsYHmB
	HJa+Ob0w=
X-Gm-Gg: ASbGncuV1cQOTulyr/fs03LTfLThUzWjRgd6UvL7mW5ScJVBLWHukz4cpTII13al+uE
	HY9znut2SDJAgQvuzxcwrsh2/u0gkeWVDNSFtHUAUOQ5oRdE5eYeJ37PHyCRlkboVkhUjNhZV83
	oKn1BYyfrdv1us+4HPckkvEMAgipL1DKYSENUEFHfbosSipcz8Fiklu3+6C4xnVOglnkIxToLs0
	T+edngR5NSVWMiFLUy1dcZh5IagQsNfYveKpFfQEhhBiPGqRNaB29uBaoTtx59UewiOcG/LPnjS
	yeFarNVRi+12Yte3sEYEisB2EMt/fBTfH6Y6BbMvRPYqA5BtjxXb8vrOf/jUm/ZlHjkAHMlgp4i
	kkGHksJKYx9tlHuGY1SnYLgp26Tzv4wEM8tFMsTLiJWPbjybQ8WE6czT5SLx1KXociQg=
X-Google-Smtp-Source: AGHT+IF/QUNsqvZMGpjkL51h+rOAPJlk8UAEJQOfPHXpISSw1sm7AurzrGzmXPpRnAkbC/VKYnohVg==
X-Received: by 2002:a17:90a:ec84:b0:329:d8d2:3602 with SMTP id 98e67ed59e1d1-340830745a8mr19743949a91.17.1762203571971;
        Mon, 03 Nov 2025 12:59:31 -0800 (PST)
Received: from hexa.. ([2602:feb4:3b:2100:6a2d:a521:f4d2:20a3])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3415b02891asm2024911a91.9.2025.11.03.12.59.31
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Nov 2025 12:59:31 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 3/8] wpa-supplicant: patch CVE-2025-24912
Date: Mon,  3 Nov 2025 12:59:10 -0800
Message-ID: <d0907754e0b44c5e41242bc1603278f86101fa31.1762203396.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1762203396.git.steve@sakoman.com>
References: <cover.1762203396.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 03 Nov 2025 20:59:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225699

From: Peter Marko <peter.marko@siemens.com>

Pick patches as listed in NVD CVE report.

Note that Debian lists one of the patches as introducing the
vulnerability. This is against what the original report [1] says.
Also the commit messages provide hints that the first patch fixes this
issue and second is fixing problem with the first patch.

[1] https://jvn.jp/en/jp/JVN19358384/

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../wpa-supplicant/CVE-2025-24912-01.patch    | 79 +++++++++++++++++++
 .../wpa-supplicant/CVE-2025-24912-02.patch    | 70 ++++++++++++++++
 .../wpa-supplicant/wpa-supplicant_2.10.bb     |  2 +
 3 files changed, 151 insertions(+)
 create mode 100644 meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/CVE-2025-24912-01.patch
 create mode 100644 meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/CVE-2025-24912-02.patch

diff --git a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/CVE-2025-24912-01.patch b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/CVE-2025-24912-01.patch
new file mode 100644
index 0000000000..8976047f68
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
index 0000000000..f3cecd6d5f
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
index fbbbebc450..50ac901cba 100644
--- a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.10.bb
+++ b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.10.bb
@@ -43,6 +43,8 @@ SRC_URI = "http://w1.fi/releases/wpa_supplicant-${PV}.tar.gz \
            file://CVE-2022-37660-0003.patch \
            file://CVE-2022-37660-0004.patch \
            file://CVE-2022-37660-0005.patch \
+           file://CVE-2025-24912-01.patch \
+           file://CVE-2025-24912-02.patch \
            "
 SRC_URI[sha256sum] = "20df7ae5154b3830355f8ab4269123a87affdea59fe74fe9292a91d0d7e17b2f"
 
-- 
2.43.0


