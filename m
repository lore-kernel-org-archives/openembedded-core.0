Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9279FF357BB
	for <webhook@archiver.kernel.org>; Tue, 24 Feb 2026 14:25:31 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.21484.1771943124122936546
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Feb 2026 06:25:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=PVOTIFmj;
 spf=pass (domain: smile.fr, ip: 209.85.128.41, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-48371119eacso65983005e9.2
        for <openembedded-core@lists.openembedded.org>; Tue, 24 Feb 2026 06:25:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1771943122; x=1772547922; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fJiU2EKlPioah+zpad3pxqYZvZkJQV0Iv6VkBsipY1Q=;
        b=PVOTIFmj8iuH9F7ViMOdbzxACCG+syNvHuQhYZlFgwr+BclSa8Cgbt70Dg/ccR780m
         kWmrDLMmJ1ecGq7PfhGwuUGzec6r8zANiXtZlPqtv0+DDLg2yoEsB7i5Fhv0kJMDy2qg
         88XKMCad+aiFwXzdURNWbLH/SPnjoP6/Rs2wI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771943122; x=1772547922;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=fJiU2EKlPioah+zpad3pxqYZvZkJQV0Iv6VkBsipY1Q=;
        b=jN7cDGzrORvNrqPREC4Xq0KIP+L9vl8AYvPeAjn89tigT8nEHNmTbgRs/BNvONWkDw
         LWrv4RENdxnZDkdI/rsQpqDYJMDSVZv9WkiFc5p38ckzlo6espQyAUoVbrtb3pznz/X5
         zeurujp6zvs98n01JQFL7pJFE24S3W4zzG5ZPJXMJXS3/WS6ZqztHH2Qr2qvS4HG5FA+
         VPQ48fTdTvk8GzEfLnvf4UJ9ToyPEhNV++e/mqSlbVejLUVmgzd6JfSSnF4K8ln1Vhch
         okx1hXImd26In0fxWDae12RMwmM2DvTT+RLarrLPgxFRcAAbyrWbwLBwQRjV/NAy0Zh1
         g3Mw==
X-Gm-Message-State: AOJu0YzcLCcN4rl9ZaKUyP6wZQV2OZ181MsfWhcSta0ESyTf8dEQjxoU
	IcgkACNCXi2oofsHDc1HHnzy/A9C/K92tBd4wm76au3g+pjRCqlwjFqYdWBJCDPrYwCM4rPUyze
	odLiC
X-Gm-Gg: AZuq6aKNrfvMUdkO2cIbCyNFKmAX4sc+KYh2yuCaX1soqfCEejsABg4TrEiHHjo/jI6
	Nm7vON/rB+ZwgEKiTYrOBGF0yEX68vcsbx/8zmKd51QmugEcW4HyPwAMqYARNNMN0m5JzT0ooX2
	Y2L+bVor+LkcE7BWgRtTLNUdcMiCpdEoQsx5t6aD+vP4JiLrDYalzs+kFG30f3Z3GWWrIZavNMd
	oZwFZ8i9ykbtPD6vFHS4Syx14cTj2+7d7zQkPOQ6wU5WGDVA+rZayRvjB5XFvBnZ66hKtnefeNz
	YplUdwn++CPJDXgIFKblSWTTFlrW0F0xiSXxtj+vLNFZKh1XNwNAeW0sciVCp1MCbN84llgZGMb
	YJ0tmIMrIy5OZzgAEQj5pT5rNG450A8lZ+GwX7T6VAPwwJOaGNF8Zgcn0k0dHREPQBhiT41VVsx
	5vSewYSsx9H+BXcozTOyQfUrn6FMgqxQHG30Cg1iqFEjGln8fI0DB+nCzjWxc8KsnW4Ymh6q8aH
	QQ48RGIT/ove2SLQEyxBDK6s2R6ah/FOeUVM6rYe+1g
X-Received: by 2002:a05:600c:8109:b0:483:8e43:6dce with SMTP id 5b1f17b1804b1-483a963a003mr192529495e9.29.1771943122114;
        Tue, 24 Feb 2026 06:25:22 -0800 (PST)
Received: from FRSMI25-LASER.idf.intranet (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483bd7507adsm2047455e9.9.2026.02.24.06.25.21
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Feb 2026 06:25:21 -0800 (PST)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 30/38] avahi: patch CVE-2025-68471
Date: Tue, 24 Feb 2026 15:24:22 +0100
Message-ID: <68227c85ecde97d52f0533c22a14595da73bef97.1771942869.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1771942869.git.yoann.congal@smile.fr>
References: <cover.1771942869.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 24 Feb 2026 14:25:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231796

From: Amaury Couderc <amaury.couderc@est.tech>

Signed-off-by: Amaury Couderc <amaury.couderc@est.tech>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 5ec4156330c765bc52dbce28dbba6def9868d30f)
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/recipes-connectivity/avahi/avahi_0.8.bb  |  1 +
 .../avahi/files/CVE-2025-68471.patch          | 36 +++++++++++++++++++
 2 files changed, 37 insertions(+)
 create mode 100644 meta/recipes-connectivity/avahi/files/CVE-2025-68471.patch

diff --git a/meta/recipes-connectivity/avahi/avahi_0.8.bb b/meta/recipes-connectivity/avahi/avahi_0.8.bb
index 3faebcba832..c1d919783c1 100644
--- a/meta/recipes-connectivity/avahi/avahi_0.8.bb
+++ b/meta/recipes-connectivity/avahi/avahi_0.8.bb
@@ -39,6 +39,7 @@ SRC_URI = "https://github.com/lathiat/avahi/releases/download/v${PV}/avahi-${PV}
            file://CVE-2024-52615.patch \
            file://CVE-2025-68276.patch \
            file://CVE-2025-68468.patch \
+           file://CVE-2025-68471.patch \
            "
 
 UPSTREAM_CHECK_URI = "https://github.com/lathiat/avahi/releases/"
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

