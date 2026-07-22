Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50050C531C8
	for <webhook@archiver.kernel.org>; Wed, 22 Jul 2026 17:24:10 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5526.1784741046477470958
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Jul 2026 10:24:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=dBJthZxf;
 spf=pass (domain: smile.fr, ip: 209.85.128.41, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4956869750eso14381265e9.2
        for <openembedded-core@lists.openembedded.org>; Wed, 22 Jul 2026 10:24:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1784741045; x=1785345845; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=hQdxzCmPw+AZsm8mOT3l9VKapbbWIaFhv9ieF2rK/14=;
        b=dBJthZxfhYldrA/6YEFxncAkswKbXd1fpqbOnKgYdkw9cowAs8O7z01zDH897p0Lm4
         2wo6xLIlph0fh3pc66B+UAxtIL58Gx5YHOMhec5ppcytcP7Xmag5kaHovhHNG+LEYsHR
         fLlLPAXECRD9enCk61Kz4Wf8lDATXKpQoVGK8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784741045; x=1785345845;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=hQdxzCmPw+AZsm8mOT3l9VKapbbWIaFhv9ieF2rK/14=;
        b=QtiE2idzHzKzNYyjhDhBJQcRH6vVOxIBVwp9VnVN98cZcsu5mPy5pkSJh5sUIPjVTy
         bUSFqqPlRpi8ABsDfQ+KLmo5xFUxAxKJ9Zx4zWA7ZpbKvvHlYBMC3DX4FzMogMphhm9y
         9L8ZMmaJCO+cBWoj+o1QuSFrK+D2WzVe1X9GjP8zU3qQ7v3sXCouxLkiiF9mc/Dw+9FT
         8vZAVah1c90e+SYxOS6uVSHL9wUnIIQ7ki2F35O7KdD4IlVZJavZN9Xab5QPi+k9bVto
         LVZooczwDYQOL1tnNLnYvSKSYAKo29EtvLBvCqJMZ0VFPKsv2xo+w2qJCd2HPd5WuRq3
         chvA==
X-Gm-Message-State: AOJu0YxxSkYABh5M/9KhmVyBiAmqNG9/PmwNSlgc9N7CO4EpKLsA/ksy
	33nHCy0eTNzur8pTWRwm2pRqE0Zo+KQAM8rnJ/LW25uGsupUUTiZf3JjWAh+dVpALc7AS+GVU+o
	8zpqcagw=
X-Gm-Gg: AR+sD10hXn5ArbsKJGyGl4uQZY5Fq6NbfU7eVdN0DA9sK8w2oMOOQePLcI0bn1ouvqj
	QOy6lBPWr3FVs45g0m/aoMfFZwlaQSXjJUoi+WkrhtmvO0XoNpLC/w/oNUVgm4gAWhpOk912RL9
	RkhvlLn0cry7kHJMO9op4y6HISjD2ivUvFR7m8KBNJIHKh10P6ioqVM/4Jip3u4pWLn6qJ0i73Z
	zUaHv3CNv8zpL7yf00zdBAXaOvSnAWsB8HOumO1l0D8sa1eivRZPxmHa5zP+FYxgIPYJ7LQZ64l
	5ZHKl48GyuY0rXpoqKqza8WNrU+6i85FN9Xc0yF348GK+JEzn7ibG9k+Jy3y5q5NrzWUPt6WEPe
	fhqtWOgkefNJj/fPb+CD6ja/V/2YRS5AVrmlPhSIsAKRZe36OHUmolKOzY0bsA0U6xgW+8bjWv5
	wQQKBAy/DLz/ODrgYlQgCPkxTLgD3+rKErMgCE1p/tB+D+2QPgT+6BrAYU/m8ipOGgnXcD9QCiE
	CQ7vmQdvlZv5W74IZ6ORa8UvVNH6f15qQ==
X-Received: by 2002:a05:600c:4fc2:b0:495:5b02:23b0 with SMTP id 5b1f17b1804b1-4955b0224c7mr215196185e9.26.1784741044594;
        Wed, 22 Jul 2026 10:24:04 -0700 (PDT)
Received: from FRSMI25-LASER.idf.intranet (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-495653c8760sm148275275e9.14.2026.07.22.10.24.03
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 10:24:04 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 12/27] gnutls: Fix CVE-2026-42009
Date: Wed, 22 Jul 2026 19:23:25 +0200
Message-ID: <864ca75b27e3b080286ba4c97cdbed9d540a83de.1784740870.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1784740870.git.yoann.congal@smile.fr>
References: <cover.1784740870.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 Jul 2026 17:24:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241722

From: Deepak Rathore <deeratho@cisco.com>

This patch applies upstream fixes [1] and [2], as referenced in [3],
to address a DTLS packet reordering flaw where duplicate sequence
numbers could lead to unstable ordering or undefined behavior.

Rebase CVE-2026-42009_p1.patch on top of the Wrynose
CVE-2026-33846 backport stack, which already includes the recv_buf
helper from upstream commit 9deffca528c23bbb218f5ec3bd4bb1bf4cbd1fc0.

[1] https://gitlab.com/gnutls/gnutls/-/commit/f01e21441e29052a6f0963840794c41d3b3ee66d
[2] https://gitlab.com/gnutls/gnutls/-/commit/f341441fad91142897d83b44a175ffc8f925b76f
[3] https://security-tracker.debian.org/tracker/CVE-2026-42009

Reference:
https://nvd.nist.gov/vuln/detail/CVE-2026-42009

Signed-off-by: Deepak Rathore <deeratho@cisco.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../gnutls/gnutls/CVE-2026-42009_p1.patch     | 62 +++++++++++++++++++
 .../gnutls/gnutls/CVE-2026-42009_p2.patch     | 48 ++++++++++++++
 meta/recipes-support/gnutls/gnutls_3.8.12.bb  |  2 +
 3 files changed, 112 insertions(+)
 create mode 100644 meta/recipes-support/gnutls/gnutls/CVE-2026-42009_p1.patch
 create mode 100644 meta/recipes-support/gnutls/gnutls/CVE-2026-42009_p2.patch

diff --git a/meta/recipes-support/gnutls/gnutls/CVE-2026-42009_p1.patch b/meta/recipes-support/gnutls/gnutls/CVE-2026-42009_p1.patch
new file mode 100644
index 00000000000..e01fcc19acc
--- /dev/null
+++ b/meta/recipes-support/gnutls/gnutls/CVE-2026-42009_p1.patch
@@ -0,0 +1,62 @@
+From d1191b910e63149a10647a089995d3cd85e16400 Mon Sep 17 00:00:00 2001
+From: Alexander Sosedkin <asosedkin@redhat.com>
+Date: Tue, 21 Apr 2026 16:52:48 +0200
+Subject: [PATCH] lib/buffers: ensure packets have differing sequence
+ numbers
+
+There should normally be no packets with same sequence number and
+differing handshake type, unless an adversary crafts them.
+Discarding them allows to get rid of packets
+with duplicate sequence ID in the buffer,
+relieving us from the question of how to sort them later.
+
+Reported-by: Joshua Rogers of AISLE Research Team <joshua@joshua.hu>
+Fixes: #1848
+Fixes: CVE-2026-42009
+Fixes: GNUTLS-SA-2026-04-29-2
+CVSS: 7.5 High CVSS:3.1/AV:N/AC:L/PR:N/UI:N/S:U/C:N/I:N/A:H
+
+CVE: CVE-2026-42009
+Upstream-Status: Backport [https://gitlab.com/gnutls/gnutls/-/commit/f01e21441e29052a6f0963840794c41d3b3ee66d]
+
+Backport Changes:
+- Rebased on top of the Wrynose CVE-2026-33846 backport stack, which
+  already includes the recv_buf helper and sequence-number matching
+  prerequisite patches.
+
+Signed-off-by: Alexander Sosedkin <asosedkin@redhat.com>
+(cherry picked from commit f01e21441e29052a6f0963840794c41d3b3ee66d)
+Signed-off-by: Deepak Rathore <deeratho@cisco.com>
+---
+ lib/buffers.c | 16 ++++++++++++++--
+ 1 file changed, 14 insertions(+), 2 deletions(-)
+
+diff --git a/lib/buffers.c b/lib/buffers.c
+index 62f140ed3..e7f08b5625 100644
+--- a/lib/buffers.c
++++ b/lib/buffers.c
+@@ -971,8 +971,20 @@ static int merge_handshake_packet(gnutls_session_t session,
+ 		session->internals.handshake_recv_buffer;
+ 
+ 	for (i = 0; i < session->internals.handshake_recv_buffer_size; i++) {
+-		if (recv_buf[i].htype == hsk->htype &&
+-		    recv_buf[i].sequence == hsk->sequence) {
++		if (recv_buf[i].sequence == hsk->sequence) {
++			if (recv_buf[i].htype != hsk->htype) {
++				_gnutls_audit_log(
++					session,
++					"Discarded unexpected handshake packet "
++					"with duplicate sequence %d, but "
++					"mismatched type %s (previously %s)\n",
++					hsk->sequence,
++					_gnutls_handshake2str(hsk->htype),
++					_gnutls_handshake2str(
++						recv_buf[i].htype));
++				_gnutls_handshake_buffer_clear(hsk);
++				return 0;
++			}
+ 			exists = 1;
+ 			pos = i;
+ 			break;
+-- 
+2.51.0
diff --git a/meta/recipes-support/gnutls/gnutls/CVE-2026-42009_p2.patch b/meta/recipes-support/gnutls/gnutls/CVE-2026-42009_p2.patch
new file mode 100644
index 00000000000..d834d3da203
--- /dev/null
+++ b/meta/recipes-support/gnutls/gnutls/CVE-2026-42009_p2.patch
@@ -0,0 +1,48 @@
+From 5374a6d584b8598511f7880b4e64ee52ee1f0cc5 Mon Sep 17 00:00:00 2001
+From: Joshua Rogers <joshua@joshua.hu>
+Date: Tue, 21 Apr 2026 18:11:39 +0200
+Subject: [PATCH] buffers: fix handshake_compare when sequence numbers
+ match
+
+The comparator function used for ordering DTLS packets
+by sequence numbers did not follow qsort comparator contracts
+in case of packets with duplicate sequence numbers,
+which could lead to unstable ordering or undefined behaviour.
+Returning 0 in such cases makes the sorting stable.
+
+Reported-by: Joshua Rogers of AISLE Research Team <joshua@joshua.hu>
+Fixes: #1848
+Fixes: CVE-2026-42009
+Fixes: GNUTLS-SA-2026-04-29-2
+CVSS: 7.5 High CVSS:3.1/AV:N/AC:L/PR:N/UI:N/S:U/C:N/I:N/A:H
+
+CVE: CVE-2026-42009
+Upstream-Status: Backport [https://gitlab.com/gnutls/gnutls/-/commit/f341441fad91142897d83b44a175ffc8f925b76f]
+
+Signed-off-by: Joshua Rogers <joshua@joshua.hu>
+(cherry picked from commit f341441fad91142897d83b44a175ffc8f925b76f)
+Signed-off-by: Deepak Rathore <deeratho@cisco.com>
+---
+ lib/buffers.c | 6 +-----
+ 1 file changed, 1 insertion(+), 5 deletions(-)
+
+diff --git a/lib/buffers.c b/lib/buffers.c
+index e7f08b5625..1ac27e4e96 100644
+--- a/lib/buffers.c
++++ b/lib/buffers.c
+@@ -844,11 +844,7 @@ static int handshake_compare(const void *_e1, const void *_e2)
+ {
+ 	const handshake_buffer_st *e1 = _e1;
+ 	const handshake_buffer_st *e2 = _e2;
+-
+-	if (e1->sequence <= e2->sequence)
+-		return 1;
+-	else
+-		return -1;
++	return (e1->sequence < e2->sequence) - (e1->sequence > e2->sequence);
+ }
+ 
+ #define SSL2_HEADERS 1
+-- 
+2.51.0
+
diff --git a/meta/recipes-support/gnutls/gnutls_3.8.12.bb b/meta/recipes-support/gnutls/gnutls_3.8.12.bb
index 03eee5c50e9..3085a62310a 100644
--- a/meta/recipes-support/gnutls/gnutls_3.8.12.bb
+++ b/meta/recipes-support/gnutls/gnutls_3.8.12.bb
@@ -34,6 +34,8 @@ SRC_URI = "https://www.gnupg.org/ftp/gcrypt/gnutls/v${SHRT_VER}/gnutls-${PV}.tar
            file://0008-tests-mini-dtls-framents-link-to-gnulib.patch \
            file://CVE-2026-3832_p1.patch \
            file://CVE-2026-3832_p2.patch \
+           file://CVE-2026-42009_p1.patch \
+           file://CVE-2026-42009_p2.patch \
            "
 
 SRC_URI[sha256sum] = "a7b341421bfd459acf7a374ca4af3b9e06608dcd7bd792b2bf470bea012b8e51"

