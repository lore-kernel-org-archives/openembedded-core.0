Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B312EEC2B5
	for <webhook@archiver.kernel.org>; Tue, 24 Feb 2026 14:33:23 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.21480.1771943596560569081
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Feb 2026 06:33:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=hwlCeBfI;
 spf=pass (domain: smile.fr, ip: 209.85.128.42, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4836f363d0dso47690415e9.3
        for <openembedded-core@lists.openembedded.org>; Tue, 24 Feb 2026 06:33:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1771943595; x=1772548395; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vlK97Mfm8timj7cMf5ZVtrIpM3yTjoYhmPrAiNAdDM8=;
        b=hwlCeBfIyDR+G3k1GY/eH6ikdUD9ZoUXIynqV/CV2KReJA/b81QGzT9sdpXiAIkcE1
         9Ucd8Ko/FkeUXH3hsycZK4YYheg4oUwRRquuQMf+KA6iJkiWkj9U3uzkulOD3Q8YdBfh
         tcDDJ6YB7PHqYmThXkVFuxO5SlEKR97tDZk7E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771943595; x=1772548395;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=vlK97Mfm8timj7cMf5ZVtrIpM3yTjoYhmPrAiNAdDM8=;
        b=cdwgC7MRwbU9b94u0rOZIyx7s2z5vo7w9d5BvZilMT60Czhz7/yXUNFBrA4WxLs1wa
         vUFY/kdVRvKCN+OfLImT8h1GC1As65nf6yl+higSgahacFPUvK9yrjtBX5ssuJHWmwXF
         FTabisO8450pPl6Lu1sdJItj379IOQI+IjGy+34IUGqR8btJv4md3T2MxZiPhE1aWxeu
         seK5nzMuijVz6XMpnBLD2qOHyTjnqCo8tOUxpVbUxrHDQtZ/fxbiigK1CboPtIlNJXgp
         FlJct26u3O6yZguaxzIVBVB7y+CwY0rFPzfzaQqSQbuNlrAAChEBeqzOC/wN4osqJ23t
         harQ==
X-Gm-Message-State: AOJu0Yz1zqlZp1bIZ3ojqpK42etQBSmOgaHQtdwcqmDr/kS/T0Hes+7v
	299gorYsBrO1zggvz72zmVi0qCTg+M80/5Xtv6yN2VGnw9hGjK0SXVfTyWUSxPwzkmbIq09WQc+
	0yzm4
X-Gm-Gg: AZuq6aLvLDhEqdODG7gs+tZF1bc88uFLFOUaHXEnlWXjb6DSQGjPsTlwdstRnTz5M2z
	P4NxGW8O/T4Xrxz3zzNMaBWcNPfg+JmZMUgWwIVbYbOc9WwLY0T/pQvmbSi0/Fqm/Frvp2gM2n1
	d3dw8YSE/aXl31Lfjxyr1h/7dgELta0hpkob2ZTabTuqKxumqWDaFQidUMJwUQAkbrrhNl368b0
	vtEYbkY1PfEpNniI9v2L5wB2nS4mK8WNhI9YlC8InGmg7DsF06R52pEKktGtrt0pQOPaBkw7VEI
	pik4eHVosh9BxswVlZoczANWEwJm1coutXpiaTo5ujIz9sTESmaGgGaONDM5hR0bkFX9AxbwNBY
	BeKVe27/4euUEZGtgk7YOogy6EOydUzNM2zADMfv+TROWVeI56+kKFxLXzV1litGbZU3ra91tMi
	AZXrLn7Rp4YwTqz4oLUQRmNDOx/6Gf+9Dlh6Ok/hlkBXNIVUAS1jrbG4mY0/djm6/y9nsIcK2VC
	QEaMuo6eppocjY2T+VTkdpkbNguFs+OdA==
X-Received: by 2002:a05:600c:4f94:b0:47e:e20e:bbb0 with SMTP id 5b1f17b1804b1-483a95eb33cmr201486925e9.6.1771943594493;
        Tue, 24 Feb 2026 06:33:14 -0800 (PST)
Received: from FRSMI25-LASER.idf.intranet (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483b88f950esm19819895e9.15.2026.02.24.06.33.13
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Feb 2026 06:33:14 -0800 (PST)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 36/44] glib-2.0: patch CVE-2026-1484
Date: Tue, 24 Feb 2026 15:32:04 +0100
Message-ID: <909a3d7952103826baf7f93926474f2a8b981576.1771943404.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1771943404.git.yoann.congal@smile.fr>
References: <cover.1771943404.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 24 Feb 2026 14:33:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231843

From: Peter Marko <peter.marko@siemens.com>

Pick patches from [1] linked from [2].

[1] https://gitlab.gnome.org/GNOME/glib/-/issues/3870
[2] https://gitlab.gnome.org/GNOME/glib/-/merge_requests/4979

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../glib-2.0/glib-2.0/CVE-2026-1484-01.patch  | 48 +++++++++++++++++++
 .../glib-2.0/glib-2.0/CVE-2026-1484-02.patch  | 45 +++++++++++++++++
 meta/recipes-core/glib-2.0/glib-2.0_2.78.6.bb |  2 +
 3 files changed, 95 insertions(+)
 create mode 100644 meta/recipes-core/glib-2.0/glib-2.0/CVE-2026-1484-01.patch
 create mode 100644 meta/recipes-core/glib-2.0/glib-2.0/CVE-2026-1484-02.patch

diff --git a/meta/recipes-core/glib-2.0/glib-2.0/CVE-2026-1484-01.patch b/meta/recipes-core/glib-2.0/glib-2.0/CVE-2026-1484-01.patch
new file mode 100644
index 00000000000..c5c2f657ccf
--- /dev/null
+++ b/meta/recipes-core/glib-2.0/glib-2.0/CVE-2026-1484-01.patch
@@ -0,0 +1,48 @@
+From 5ba0ed9ab2c28294713bdc56a8744ff0a446b59c Mon Sep 17 00:00:00 2001
+From: Marco Trevisan <mail@3v1n0.net>
+Date: Fri, 23 Jan 2026 18:48:30 +0100
+Subject: [PATCH] gbase64: Use gsize to prevent potential overflow
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Both g_base64_encode_step() and g_base64_encode_close() return gsize
+values, but these are summed to an int value.
+
+If the sum of these returned values is bigger than MAXINT, we overflow
+while doing the null byte write.
+
+Spotted by treeplus.
+Thanks to the Sovereign Tech Resilience programme from the Sovereign
+Tech Agency.
+
+ID: #YWH-PGM9867-168
+Closes: #3870
+
+
+(cherry picked from commit 6845f7776982849a2be1d8c9b0495e389092bff2)
+
+Co-authored-by: Marco Trevisan (Treviño) <mail@3v1n0.net>
+
+CVE: CVE-2026-1484
+Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/glib/-/commit/5ba0ed9ab2c28294713bdc56a8744ff0a446b59c]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ glib/gbase64.c | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/glib/gbase64.c b/glib/gbase64.c
+index 2ea4a4ef4..214b48911 100644
+--- a/glib/gbase64.c
++++ b/glib/gbase64.c
+@@ -264,8 +264,9 @@ g_base64_encode (const guchar *data,
+                  gsize         len)
+ {
+   gchar *out;
+-  gint state = 0, outlen;
++  gint state = 0;
+   gint save = 0;
++  gsize outlen;
+ 
+   g_return_val_if_fail (data != NULL || len == 0, NULL);
+ 
diff --git a/meta/recipes-core/glib-2.0/glib-2.0/CVE-2026-1484-02.patch b/meta/recipes-core/glib-2.0/glib-2.0/CVE-2026-1484-02.patch
new file mode 100644
index 00000000000..a9cf855c6b9
--- /dev/null
+++ b/meta/recipes-core/glib-2.0/glib-2.0/CVE-2026-1484-02.patch
@@ -0,0 +1,45 @@
+From 25429bd0b22222d6986d000d62b44eebf490837d Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Marco=20Trevisan=20=28Trevi=C3=B1o=29?= <mail@3v1n0.net>
+Date: Wed, 21 Jan 2026 20:09:44 +0100
+Subject: [PATCH] gbase64: Ensure that the out value is within allocated size
+
+We do not want to deference or write to it
+
+Related to: #3870
+
+CVE: CVE-2026-1484
+Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/glib/-/commit/25429bd0b22222d6986d000d62b44eebf490837d]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ glib/gbase64.c | 8 +++++++-
+ 1 file changed, 7 insertions(+), 1 deletion(-)
+
+diff --git a/glib/gbase64.c b/glib/gbase64.c
+index 214b48911..0141b3b07 100644
+--- a/glib/gbase64.c
++++ b/glib/gbase64.c
+@@ -267,6 +267,7 @@ g_base64_encode (const guchar *data,
+   gint state = 0;
+   gint save = 0;
+   gsize outlen;
++  gsize allocsize;
+ 
+   g_return_val_if_fail (data != NULL || len == 0, NULL);
+ 
+@@ -274,10 +275,15 @@ g_base64_encode (const guchar *data,
+      +1 is needed for trailing \0, also check for unlikely integer overflow */
+   g_return_val_if_fail (len < ((G_MAXSIZE - 1) / 4 - 1) * 3, NULL);
+ 
+-  out = g_malloc ((len / 3 + 1) * 4 + 1);
++  allocsize = (len / 3 + 1) * 4 + 1;
++  out = g_malloc (allocsize);
+ 
+   outlen = g_base64_encode_step (data, len, FALSE, out, &state, &save);
++  g_assert (outlen <= allocsize);
++
+   outlen += g_base64_encode_close (FALSE, out + outlen, &state, &save);
++  g_assert (outlen <= allocsize);
++
+   out[outlen] = '\0';
+ 
+   return (gchar *) out;
diff --git a/meta/recipes-core/glib-2.0/glib-2.0_2.78.6.bb b/meta/recipes-core/glib-2.0/glib-2.0_2.78.6.bb
index 97618d1d40b..43a28273e9d 100644
--- a/meta/recipes-core/glib-2.0/glib-2.0_2.78.6.bb
+++ b/meta/recipes-core/glib-2.0/glib-2.0_2.78.6.bb
@@ -40,6 +40,8 @@ SRC_URI = "${GNOME_MIRROR}/glib/${SHRT_VER}/glib-${PV}.tar.xz \
            file://CVE-2025-14087-03.patch \
            file://CVE-2025-14512.patch \
            file://CVE-2026-0988.patch \
+           file://CVE-2026-1484-01.patch \
+           file://CVE-2026-1484-02.patch \
            "
 SRC_URI:append:class-native = " file://relocate-modules.patch \
                                 file://0001-meson.build-do-not-enable-pidfd-features-on-native-g.patch \

