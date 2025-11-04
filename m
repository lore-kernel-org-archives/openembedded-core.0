Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7390DCCFA0D
	for <webhook@archiver.kernel.org>; Tue,  4 Nov 2025 14:48:13 +0000 (UTC)
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.19537.1762267685677543907
 for <openembedded-core@lists.openembedded.org>;
 Tue, 04 Nov 2025 06:48:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=xVS+rAq7;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.51, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-3402942e79cso7783573a91.2
        for <openembedded-core@lists.openembedded.org>; Tue, 04 Nov 2025 06:48:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1762267685; x=1762872485; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dRMvCgZ1kO8lO5kMUNb8c2N4hJWezq3q82pp/diUBgY=;
        b=xVS+rAq7aD7dOsl+SBbAwA6McFY3V/QaJyKkcUnAtAue5NsUnPsHXSs1lAu04WfFtB
         Q/cKhHEKPxTodfCvnuAdiAW8eesQRD1k8SpLsw0EEkUGjnu7hTnBopJVJzdPcCW5fL8E
         CpUCCP3aT5O2imvThXDjvtiVUL5N+bLT6jnOTzplwFv1Jwpx+ZOduSKOWWo54TQaWFUd
         gVk7p+wV3G6xY5/uDSTgfzLEvtBh1cB0vITYjcstq8N9ZYiGifdV3+A5IyCtibGKqu54
         r1HtDIhTNMuvwULzqMDkUZ9wt36PKEPKFDTfBaYzqqNmiPENa0GEw3n5+Btsjji1KUww
         whTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762267685; x=1762872485;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dRMvCgZ1kO8lO5kMUNb8c2N4hJWezq3q82pp/diUBgY=;
        b=DIzso0s8u5V/sFR3Lg15WXtSXnWZ5Eh+SgK706mSJvEx0pRapjQ0D+Gm0zGceJkvYX
         jRsT1UDnAn+Ldgi78p9u+bzIGkW+rYwoFY1+D6PbtFqFf267yOJotT8TCnN1FxIiTvP+
         xkS0V8PmLHl4ng+e1xWbCzO9tcRWYf2m+ARrE3XJ5mvrhz4pUEekanlqmMFJ1SHQitWs
         DkgoaT1mM+sT0SqmhpfP3KKihwowwa2JA+T5ZdGJPnDvo6KHQr7CmnSS5pqzjOH04lsp
         siFnvQNwc2GxsKlT9lSXLCja27YhCrvJlZX1yCuUBtPLRojkAAY2kLWVDt24EVKw0Kly
         RwIA==
X-Gm-Message-State: AOJu0YxVNrSetC+84WmpInylUEtShKWpTC6Bo2AgBOZdBMIE8YfWfOsN
	HF/amihtkWJ8P1mqM1ovycVRksb9UjXf1cVHuZuPfi/Y9+dND7/csr1mMDdwizUR2owLdkRtlSY
	b8GtUNyQ=
X-Gm-Gg: ASbGncsp6wXL81nr6RQG4l4ei5ST1YFsT0WDHgwytiED1YOL+b6T845SIQEcW9AtKp5
	hSdm0o91hqv7VFZsWdlthnMao2U1hkNt+3X1wUoGbL/0FQfbM3M4AQpMcYUQHdZVip3aKn1iWVr
	E2uWrZHfeHVy9pqO6L585/UmorC2riInOmAu9Ya0AeMLWDRLIxbGCMydfkABqzmi4ePD948hv8u
	XU08BwTKmsI3qQB2qq8GfhyXJqoGXQHKkrCyFU44hOnSaqefLg+K5jZs0mKXWEHuIxN3AtBHHal
	RzgxAWv40AMrmV42BRNDIUUyCBS9EK2sdRMhqdopFq6YN1SEhEqnLukihY77OXJIs6kpJad6b9P
	mXcHs/LQl6ET3isrzMrDruiFDRlOtrQbj2VdajW6n+umShHzdDIk4Fke3SDfihA4/3PE=
X-Google-Smtp-Source: AGHT+IFeEiB4ALHgHHsY1mWe1J0AqSqCJSG+GDxacgNOIdnwlD7nuCCg6czsxwHEZvrSbB5p0Ds7xg==
X-Received: by 2002:a17:90b:55c8:b0:33b:b453:c900 with SMTP id 98e67ed59e1d1-3408306b9cfmr19950727a91.19.1762267684757;
        Tue, 04 Nov 2025 06:48:04 -0800 (PST)
Received: from hexa.. ([2602:feb4:3b:2100:1f4f:a6d3:d9bf:780d])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3417d40da83sm1341481a91.14.2025.11.04.06.48.04
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Nov 2025 06:48:04 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 1/7] wpa-supplicant: patch CVE-2025-24912
Date: Tue,  4 Nov 2025 06:47:52 -0800
Message-ID: <a157719ab349d9393d5a640bb2e45fc2489d5338.1762267481.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1762267481.git.steve@sakoman.com>
References: <cover.1762267481.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 04 Nov 2025 14:48:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225727

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
index fd98bdcc36..f939945b08 100644
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
 
-- 
2.43.0


