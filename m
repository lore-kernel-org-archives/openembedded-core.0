Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40C3EF357D7
	for <webhook@archiver.kernel.org>; Tue, 24 Feb 2026 14:33:02 +0000 (UTC)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.21654.1771943569822928531
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Feb 2026 06:32:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=RqhOrSfv;
 spf=pass (domain: smile.fr, ip: 209.85.221.51, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-4376de3f128so3991637f8f.0
        for <openembedded-core@lists.openembedded.org>; Tue, 24 Feb 2026 06:32:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1771943568; x=1772548368; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LvXyzR8ZoZphN7Ad2lafQL2FqKXvGpEv0ACJ6Q+V0nE=;
        b=RqhOrSfvOYED+bNN6zM2FShPL/Gby09VOKwkn+8cme2c2so9euHsZIZVax+nsz/SdB
         wT9MlblrochQj8b6npMtVgkZ6fY05u+EnIP2XhFi/dC/8ihjeRM00BTux/3+Alz9dfKd
         3Q/B4Qd1M1on+Zd4DeIjCfmKBRFOF77tOffIk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771943568; x=1772548368;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=LvXyzR8ZoZphN7Ad2lafQL2FqKXvGpEv0ACJ6Q+V0nE=;
        b=UQrphX3Z2oGm+ZvY6R88Gs3xKvnI26GXBSj191Yg204iU7R7a2M1XJE1J9FmRcM8V8
         pvq2pNHDpYjWusiZnNExv2JV5C16A8QzWvjCqo9JQEjVrl82VVjYDBPrE/kqcQZ+weKy
         AV/COObnj5FlGeTojJblL2DgKn54LAnJ86ma9sJdmwVFXKXkSauly8WMQB0WNro8lh54
         NifmZ5YVxK0tYn2qvWRDoYtZpspGKm3pyxarcrSKaCIAMhC/ORnnK3Hlz/pA0wLrF4rg
         4IwWxaeICQtiDYghfQg00z+5zbEYs2KaSnoyLDgxjhxY7AxRZQRYvNG4Y691SZZjR2pn
         NlRQ==
X-Gm-Message-State: AOJu0YybT0G/JiLLgwD5VtOSqh2xXcK1qBcO/kCmddQ0JR1DrJrlN4oB
	tEOVlOeQkMWFPWEPTzFj9eUtyCtYi7ef86CYtp0Rhp20m7lfqEnhYEgsI0tCfwZ84jThH9riGX5
	j+ouY
X-Gm-Gg: AZuq6aJWu/ndx5XUFmlViM8DNs6ptdkQ/C+z3JSeFwq/vewMl9EqlLsjyIFpIyYvTVT
	jUzgBKPwOoR8zl/Rn+z1ZyEkRUQb3KGhMYQc0MlmPILOLEOg/FIb/LX1FjkPohgCt8UF9VTkwt0
	/OiCktqceEVm0RW2JQiYMFX0vUIxhX/Eg73vQ1K3Mrquw3FZ9T8dUOc5wzlUfSZrV6NM2ZxJBFg
	mAfc/Ew5PB560t1Wgf13UFViYCIKDlqGp3yztA7Jd42eRun3KwzJv3e9ZzZk1M1W2JR6SyZ2Vss
	MKwljWGC8bnNgISwN4H7NXaCsoSAvCFsmxA/S7RWcYqZJvgTnWhsFo9XINx8Hwua67KAIjEf0M0
	Nw4tuam0x6aS0HZuXmPlIYWN04bHjUEEj/ZOaVJFUEoHXoLSiiB9SZjXn2XpgQhwDG6yh2b9fmb
	sITesYRbmFKFEO8PY6tjj6k64mzIFdYRCrFGnG00y5kEnhT1/UGNe3+a6+Xu2iJ1texAH7NrfsR
	2+3JMD+xzSlgzfMFulhCTvlFTfdF8ZiHQ==
X-Received: by 2002:a05:600c:8595:b0:483:badb:618b with SMTP id 5b1f17b1804b1-483badb63c6mr25043665e9.24.1771943567795;
        Tue, 24 Feb 2026 06:32:47 -0800 (PST)
Received: from FRSMI25-LASER.idf.intranet (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483b88f950esm19819895e9.15.2026.02.24.06.32.47
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Feb 2026 06:32:47 -0800 (PST)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 04/44] avahi: patch CVE-2025-68471
Date: Tue, 24 Feb 2026 15:31:32 +0100
Message-ID: <174268f9ea710b1da980b45bc88cfe58de1cf26d.1771943404.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1771943404.git.yoann.congal@smile.fr>
References: <cover.1771943404.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 24 Feb 2026 14:33:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231809

From: Amaury Couderc <amaury.couderc@est.tech>

Signed-off-by: Amaury Couderc <amaury.couderc@est.tech>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 5ec4156330c765bc52dbce28dbba6def9868d30f)
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/recipes-connectivity/avahi/avahi_0.8.bb  |  1 +
 .../avahi/files/CVE-2025-68471.patch          | 36 +++++++++++++++++++
 2 files changed, 37 insertions(+)
 create mode 100644 meta/recipes-connectivity/avahi/files/CVE-2025-68471.patch

diff --git a/meta/recipes-connectivity/avahi/avahi_0.8.bb b/meta/recipes-connectivity/avahi/avahi_0.8.bb
index 34d95f48cd6..d349831f16f 100644
--- a/meta/recipes-connectivity/avahi/avahi_0.8.bb
+++ b/meta/recipes-connectivity/avahi/avahi_0.8.bb
@@ -39,6 +39,7 @@ SRC_URI = "${GITHUB_BASE_URI}/download/v${PV}/avahi-${PV}.tar.gz \
            file://CVE-2024-52615.patch \
            file://CVE-2025-68276.patch \
            file://CVE-2025-68468.patch \
+           file://CVE-2025-68471.patch \
            "
 
 GITHUB_BASE_URI = "https://github.com/avahi/avahi/releases/"
diff --git a/meta/recipes-connectivity/avahi/files/CVE-2025-68471.patch b/meta/recipes-connectivity/avahi/files/CVE-2025-68471.patch
new file mode 100644
index 00000000000..210565cdd61
--- /dev/null
+++ b/meta/recipes-connectivity/avahi/files/CVE-2025-68471.patch
@@ -0,0 +1,36 @@
+From 4e84c1d6eb2f54d1643bd7ce62817c722ca36d25 Mon Sep 17 00:00:00 2001
+From: Hugo Muis <198191869+friendlyhugo@users.noreply.github.com>
+Date: Sun, 2 Mar 2025 18:06:24 +0100
+Subject: [PATCH] core: fix DoS bug by changing assert to return
+
+Closes https://github.com/avahi/avahi/issues/678
+
+CVE: CVE-2025-68471
+
+Upstream-Status: Backport
+[https://github.com/avahi/avahi/commit/9c6eb53bf2e290aed84b1f207e3ce35c54cc0aa1]
+
+Signed-off-by: Amaury Couderc <amaury.couderc@est.tech>
+---
+ avahi-core/browse.c | 5 ++++-
+ 1 file changed, 4 insertions(+), 1 deletion(-)
+
+diff --git a/avahi-core/browse.c b/avahi-core/browse.c
+index 2941e57..86e4432 100644
+--- a/avahi-core/browse.c
++++ b/avahi-core/browse.c
+@@ -320,7 +320,10 @@ static int lookup_start(AvahiSRBLookup *l) {
+     assert(l);
+ 
+     assert(!(l->flags & AVAHI_LOOKUP_USE_WIDE_AREA) != !(l->flags & AVAHI_LOOKUP_USE_MULTICAST));
+-    assert(!l->wide_area && !l->multicast);
++    if (l->wide_area || l->multicast) {
++        /* Avoid starting a duplicate lookup */
++        return 0;
++    }
+ 
+     if (l->flags & AVAHI_LOOKUP_USE_WIDE_AREA) {
+ 
+-- 
+2.43.0
+

