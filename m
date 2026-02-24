Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68B02F357B2
	for <webhook@archiver.kernel.org>; Tue, 24 Feb 2026 14:25:31 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.21283.1771943123767322432
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Feb 2026 06:25:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=b+xvEb+o;
 spf=pass (domain: smile.fr, ip: 209.85.128.43, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-48371bb515eso69455875e9.1
        for <openembedded-core@lists.openembedded.org>; Tue, 24 Feb 2026 06:25:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1771943122; x=1772547922; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1FTws9af5/5j1Bc7pIa3fMT1LlLMZjlthEOZ/voOGFc=;
        b=b+xvEb+oXeQ2kbHnaY5+F0RWJD2UOwFd4L4yAdbEP9T1V6jubVkAKwBkCYhG5e0Pgn
         Z3mcnhJLihFLND9U3cLGN8jrnwA95kh57sIL0qSpLxr9x63P3uxHgjb10OxE+OUs/ngN
         J/DUKng0Qk2fbH5WupohU8H8bD2KZTuCB0QGc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771943122; x=1772547922;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=1FTws9af5/5j1Bc7pIa3fMT1LlLMZjlthEOZ/voOGFc=;
        b=p4XJwCGt4DEY9071FM/FsUX18cVT1rzYou/vS4IyMi/vRN+54ymuBgPcouoaX2fi7l
         961Z6H3/436q/SjX9hmOTNMNq3+W5/dEj6ZaQ8+3ktm5QGH2kfXvH7uUJlc/QZUF/vej
         A5Q0Ts6EIeqnhht5eDnFvOvGDXMczXHuup/UZIbUOfVsLveAtdh8efxueoHI5NbK7bN8
         gUmyk+E7czNxFIi214r8p9tMssQw5ukungNnTFqIAAj9RF50tdafYOm3sxHUkR2ewA9x
         RHHUY55OeM99tg5zu/AyE4zqGVJQucc4kzVVIUUxu1Jk0xXsMIfG7gdIiFwieQygeH/8
         M8lA==
X-Gm-Message-State: AOJu0Yw5+tlx4YerzLyhwqSDeQ9yqGfI/b6K0/0qODUIfL7goJfA91aH
	HSR5FprnE8Wax5zWFhuhXhU5M9uS/7MZxYWI1msQZYsN1P8HCXuKrne9NnOEmnJD1Bl3zzPJb+W
	dTe8m
X-Gm-Gg: AZuq6aLASPEqXu4xA1IbB/RPtF7vHXh2E9ckED6gon5NCM1fUWvSxmhJhp18hgVRLW6
	3FGuPq7Gwe7WKZLi9K0F26rsWjgJ2A5w9099iWH0pyjGU8YsUtColnp/ta6t4G8bS4Ly22ItKEi
	4ScdYg2EQDoDt0Y64b8yfn3jM0WF4a5YuiL0zAz9TG+QuXHjFh360FwjhuuA7CP/Wdh4CK7t9OR
	nLVdVK3j562YFafKKDM46Pa0tdbrcR8prLd609WGHYeOxSwYewkzVWDqchm99XFUmSOb9ajl66h
	mobHUJaS+P5+1AqClZzTEji18HPgv2SgNHGfRR4y640qJbt62ktSeLcjRbHWhoQJvUayd6eGUYF
	oK0aiF5ENcvwsAo1km+2atb7uq4QR2mmjjg3oLuRK/HFBEXq5A6C7/OiRhxxvCgAgI3gQtU/Cs8
	l8nkQ6p1cm96nw8Am+SC57CN8i9cke8OpJKdvjqO36V5ho1je673d2q4ZRxMG9ztkBD9hqQdDDw
	S0CefyfxmuiJgOKHSlsOVB1qZ5z8s2JhNHgazYouxtl
X-Received: by 2002:a05:600c:6207:b0:47d:18b0:bb9a with SMTP id 5b1f17b1804b1-483a963d61emr190599495e9.33.1771943121390;
        Tue, 24 Feb 2026 06:25:21 -0800 (PST)
Received: from FRSMI25-LASER.idf.intranet (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483bd7507adsm2047455e9.9.2026.02.24.06.25.20
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Feb 2026 06:25:21 -0800 (PST)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 29/38] avahi: patch CVE-2025-68468
Date: Tue, 24 Feb 2026 15:24:21 +0100
Message-ID: <6d268cc7c8e89a8230b707fa9afd77d15c4b2808.1771942869.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1771942869.git.yoann.congal@smile.fr>
References: <cover.1771942869.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 24 Feb 2026 14:25:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231795

From: Amaury Couderc <amaury.couderc@est.tech>

Signed-off-by: Amaury Couderc <amaury.couderc@est.tech>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 9f2ed8adc37a42b561b3c4853cf8106fba39889e)
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/recipes-connectivity/avahi/avahi_0.8.bb  |  1 +
 .../avahi/files/CVE-2025-68468.patch          | 32 +++++++++++++++++++
 2 files changed, 33 insertions(+)
 create mode 100644 meta/recipes-connectivity/avahi/files/CVE-2025-68468.patch

diff --git a/meta/recipes-connectivity/avahi/avahi_0.8.bb b/meta/recipes-connectivity/avahi/avahi_0.8.bb
index b38fedb38bf..3faebcba832 100644
--- a/meta/recipes-connectivity/avahi/avahi_0.8.bb
+++ b/meta/recipes-connectivity/avahi/avahi_0.8.bb
@@ -38,6 +38,7 @@ SRC_URI = "https://github.com/lathiat/avahi/releases/download/v${PV}/avahi-${PV}
            file://CVE-2024-52616.patch \
            file://CVE-2024-52615.patch \
            file://CVE-2025-68276.patch \
+           file://CVE-2025-68468.patch \
            "
 
 UPSTREAM_CHECK_URI = "https://github.com/lathiat/avahi/releases/"
diff --git a/meta/recipes-connectivity/avahi/files/CVE-2025-68468.patch b/meta/recipes-connectivity/avahi/files/CVE-2025-68468.patch
new file mode 100644
index 00000000000..3635cc8d53e
--- /dev/null
+++ b/meta/recipes-connectivity/avahi/files/CVE-2025-68468.patch
@@ -0,0 +1,32 @@
+From 483f83828cfda965fac914ff1b39c63c256372b2 Mon Sep 17 00:00:00 2001
+From: Hugo Muis <198191869+friendlyhugo@users.noreply.github.com>
+Date: Sun, 2 Mar 2025 18:06:24 +0100
+Subject: [PATCH] core: fix DoS bug by removing incorrect assertion
+
+Closes https://github.com/avahi/avahi/issues/683
+
+CVE: CVE-2025-68468
+
+Upstream-Status: Backport
+[https://github.com/avahi/avahi/commit/f66be13d7f31a3ef806d226bf8b67240179d309a]
+
+Signed-off-by: Amaury Couderc <amaury.couderc@est.tech>
+---
+ avahi-core/browse.c | 1 -
+ 1 file changed, 1 deletion(-)
+
+diff --git a/avahi-core/browse.c b/avahi-core/browse.c
+index 86e4432..79595fe 100644
+--- a/avahi-core/browse.c
++++ b/avahi-core/browse.c
+@@ -295,7 +295,6 @@ static void lookup_multicast_callback(
+                 lookup_drop_cname(l, interface, protocol, 0, r);
+             else {
+                 /* It's a normal record, so let's call the user callback */
+-                assert(avahi_key_equal(b->key, l->key));
+ 
+                 b->callback(b, interface, protocol, event, r, flags, b->userdata);
+             }
+-- 
+2.43.0
+

