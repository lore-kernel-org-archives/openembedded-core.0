Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87F3DC5DF81
	for <webhook@archiver.kernel.org>; Mon, 24 Aug 2026 22:21:18 +0000 (UTC)
Received: from mta-65-225.siemens.flowmailer.net (mta-65-225.siemens.flowmailer.net [185.136.65.225])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.9391.1787610068323933410
 for <openembedded-core@lists.openembedded.org>;
 Mon, 24 Aug 2026 15:21:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm2 header.b=PLdUAgXq;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.225, mailfrom: fm-256628-2026082422210179e7825cd200020732-eqfovd@rts-flowmailer.siemens.com)
Received: by mta-65-225.siemens.flowmailer.net with ESMTPSA id 2026082422210179e7825cd200020732
        for <openembedded-core@lists.openembedded.org>;
        Tue, 25 Aug 2026 00:21:05 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=1TEwrfa1kSdS7iq85q7QuIKVZ9LkVmwcF6ITydCDD7A=;
 b=PLdUAgXqgV2ORhxVpGn/DHWRKQRKO5voQvFeLajC8a1Cj3gYrzPw3JY89UunyCN3dlNI6d
 Op21bbW9glCP3etGBegsVGg5m3K3uawQF6RX/14nKCdfCnGItT5txrsxppt1hoUT0hmy7fRn
 u5ZaF9SuJpKtNnIdGCv32dVWaKfuzeTSjXFpv4o7wKMCZT/k/P9N+X63m0PTSnKzJKgC3xAj
 1aIYRHCELYX2H7x8Rw0Lgwl6CHvYKNW9ooi3ZCQ/t5Jh4YOf4PK2vNv8r80Pi5vjW+kjT2TP
 vKc3WOVsc24ZeWGgcAswM5O1JuVmTIwrr39n0/fwoIStzAHPtTobWkPA==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [wrynose][PATCH 1/2] curl: patch CVE-2026-11352
Date: Tue, 25 Aug 2026 00:20:49 +0200
Message-ID: <20260824222050.1754160-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 24 Aug 2026 22:21:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244153

From: Peter Marko <peter.marko@siemens.com>

Pick patch per [1].

[1] https://curl.se/docs/CVE-2026-11352.html

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 .../curl/curl/CVE-2026-11352.patch            | 48 +++++++++++++++++++
 meta/recipes-support/curl/curl_8.19.0.bb      |  1 +
 2 files changed, 49 insertions(+)
 create mode 100644 meta/recipes-support/curl/curl/CVE-2026-11352.patch

diff --git a/meta/recipes-support/curl/curl/CVE-2026-11352.patch b/meta/recipes-support/curl/curl/CVE-2026-11352.patch
new file mode 100644
index 0000000000..df414b9112
--- /dev/null
+++ b/meta/recipes-support/curl/curl/CVE-2026-11352.patch
@@ -0,0 +1,48 @@
+From 56eca2afb4806f1032872fa97d1834b3c1385276 Mon Sep 17 00:00:00 2001
+From: Stefan Eissing <stefan@eissing.org>
+Date: Fri, 5 Jun 2026 08:34:46 +0200
+Subject: [PATCH] quic: count zero length packets against max
+
+With a flood of zero lenght UDP packets to curl, the receive loop might
+run longer than intended to. Count such packets against the max to
+terminate the loop as intended.
+
+URL: https://hackerone.com/reports/3783438
+Reported-by: vectorqueue on hackerone
+Closes #21869
+
+CVE: CVE-2026-11352
+Upstream-Status: Backport [https://github.com/curl/curl/commit/56eca2afb4806f1032872fa97d1834b3c1385276]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ lib/vquic/vquic.c | 8 ++++++--
+ 1 file changed, 6 insertions(+), 2 deletions(-)
+
+diff --git a/lib/vquic/vquic.c b/lib/vquic/vquic.c
+index 2f0e072951..475f18e04a 100644
+--- a/lib/vquic/vquic.c
++++ b/lib/vquic/vquic.c
+@@ -454,8 +454,10 @@ static CURLcode recvmmsg_packets(struct Curl_cfilter *cf,
+     VERBOSE(++calls);
+     for(i = 0; i < mcount; ++i) {
+       /* A zero-length UDP packet is no QUIC packet. Ignore. */
+-      if(!mmsg[i].msg_len)
++      if(!mmsg[i].msg_len) {
++        ++pkts;
+         continue;
++      }
+       total_nread += mmsg[i].msg_len;
+ 
+       gso_size = vquic_msghdr_get_udp_gro(&mmsg[i].msg_hdr);
+@@ -538,8 +540,10 @@ static CURLcode recvmsg_packets(struct Curl_cfilter *cf,
+     ++calls;
+ 
+     /* A 0-length UDP packet is no QUIC packet */
+-    if(!nread)
++    if(!nread) {
++      ++pkts;
+       continue;
++    }
+ 
+     gso_size = vquic_msghdr_get_udp_gro(&msg);
+     if(gso_size == 0)
diff --git a/meta/recipes-support/curl/curl_8.19.0.bb b/meta/recipes-support/curl/curl_8.19.0.bb
index 5ba881bd76..cf1d65c3a3 100644
--- a/meta/recipes-support/curl/curl_8.19.0.bb
+++ b/meta/recipes-support/curl/curl_8.19.0.bb
@@ -23,6 +23,7 @@ SRC_URI = " \
     file://CVE-2026-6429.patch \
     file://CVE-2026-7168.patch \
     file://CVE-2026-4873.patch \
+    file://CVE-2026-11352.patch \
 "
 
 SRC_URI:append:class-nativesdk = " \

