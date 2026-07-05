Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17EF3C44503
	for <webhook@archiver.kernel.org>; Sun,  5 Jul 2026 22:42:57 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.140020.1783291371586049783
 for <openembedded-core@lists.openembedded.org>;
 Sun, 05 Jul 2026 15:42:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=axoDdjb1;
 spf=pass (domain: smile.fr, ip: 209.85.128.48, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-493c2b3dc8bso16237555e9.2
        for <openembedded-core@lists.openembedded.org>; Sun, 05 Jul 2026 15:42:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1783291370; x=1783896170; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0/hL7uobbIbgpviv2YQsidqT4LNZ5G5BnKqcPG+VyjQ=;
        b=axoDdjb1jaHJEbmF1jujGyhpuQ8AmfUgbFQTYgJuMomWtnHCXEsW2SbIVOAllVYZei
         pDoUY6GnOpUQRbwn3zYEgG/l5CLRS54qheMJtlAZYKbpJkdTjt8oXJD0Mdb1lhGq9nYC
         lk+y5116+4IjHnpJuF0dCZFDGPVj29EN7yAOQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783291370; x=1783896170;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=0/hL7uobbIbgpviv2YQsidqT4LNZ5G5BnKqcPG+VyjQ=;
        b=CenIpsZG57Sw00OyqH/Xz4C7HzF9BLkJFVRDkPYtd0Ax7c/ymt49yNLXl3WCi6pfEe
         f6hwZYuOmW+lbUwjFMmu/rtfLjoOABRJdSmGdpSTxik4qegGCHgwOaz5/YfMYeTxH01T
         Qhm1ybej44nChLCZYfjuwMMWRGZRYiT+QszQBHf/48xeln6G5rlbKX9qtpwKmg4G0kHW
         xj7rZVCyLRI8fZk+2hiyupEu+7ho206jQpUAU3weKwvsnD08/VeO3041n+DKA5dNluy4
         nXIyWGomMHqS2k+t43Tw3u+w3B2KOrLXtofJ7tyUjN4Hcg165rY8YsUGXiOKFmuSJx4g
         qYsQ==
X-Gm-Message-State: AOJu0YxGOc8joBwIrBmZVP0sr4zGtZlB8ysyCl2L0YP3t5FoNgJThL0l
	za9QfIYUf57bZdXZBo+ZWU5XryLLy9BV8tQ8FWcZe035HO0vtBZmfcGHGzZ6nRB+xG6iITLpdUL
	G7dj3Z7M=
X-Gm-Gg: AfdE7cnq81kmfesETAgngcKwCEeIhUdwJy62+SflCZu8jggBoxK3OC93eLoaIOzHPxV
	ZqXlMCplThQ054gqFU4KeMt1kvQSrRSzh/Uj43isKiJ/ra6IsJ/XNIHMlEqosiL/pctmc35tYUL
	xZtRsa0/f+JOc9Fv3GXDMi0lHZ2Zb+bfLuEZVUyQyVRidYCBbaH5DJwCHAy7AqUivVmgenZSLK2
	a1EzW/8s0XkQRug+HJGgPdj2JnaNMzMVQQmGhlHv4FmkhwF8ODxIuok7BfFmY+RTCp3jQK2VP8J
	tGEFZfZZR+VqyynDU2ecSGSyXXH9ask4XJsvKD/2tr/MMYqQ/eg0/ZVGMHxUGhP96xfYdyAOqjI
	XeVAv9xkkZIHCQ055P7STESkgbFrktEoKtuK8losl9vnljpBueJ4jG0nIiVeMsIM0PM/oz/aAFM
	f2y2LoQk8LUrdkiKaa70vYil+/Dw==
X-Received: by 2002:adf:d006:0:b0:473:24e3:fa8f with SMTP id ffacd0b85a97d-47aae0da7f2mr6967956f8f.47.1783291369775;
        Sun, 05 Jul 2026 15:42:49 -0700 (PDT)
Received: from FRSMI25-LASER.lan ([2001:861:8010:5750:6d3a:72ff:5857:d2a8])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47aa0960af0sm17943606f8f.30.2026.07.05.15.42.49
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jul 2026 15:42:49 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 14/55] libssh2: fix CVE-2026-55199
Date: Mon,  6 Jul 2026 00:41:04 +0200
Message-ID: <a45940722142878efdec770c0a4b61d4d6c91751.1783289522.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1783289522.git.yoann.congal@smile.fr>
References: <cover.1783289522.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 05 Jul 2026 22:42:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240168

From: Daniel Turull <daniel.turull@ericsson.com>

Backport patch to fix CVE-2026-55199.
https://nvd.nist.gov/vuln/detail/CVE-2026-55199

Upstream fix:
  https://github.com/libssh2/libssh2/commit/17626857d20b3c9a1addfa45979dadcee1cd84a4

Tested with ptest:
Before: PASSED: 3, FAILED: 0, SKIPPED: 0
After: PASSED: 3, FAILED: 0, SKIPPED: 0

Reviewed-by: Anders Heimer <anders.heimer@est.tech>
Signed-off-by: Daniel Turull <daniel.turull@ericsson.com>
(cherry picked from commit 5b52af4a02849c1ce74491056a2d13e4e3b6ad2d)
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../libssh2/libssh2/CVE-2026-55199.patch      | 44 +++++++++++++++++++
 .../recipes-support/libssh2/libssh2_1.11.1.bb |  1 +
 2 files changed, 45 insertions(+)
 create mode 100644 meta/recipes-support/libssh2/libssh2/CVE-2026-55199.patch

diff --git a/meta/recipes-support/libssh2/libssh2/CVE-2026-55199.patch b/meta/recipes-support/libssh2/libssh2/CVE-2026-55199.patch
new file mode 100644
index 00000000000..81815486ada
--- /dev/null
+++ b/meta/recipes-support/libssh2/libssh2/CVE-2026-55199.patch
@@ -0,0 +1,44 @@
+From b5cb1c1781ba5f275485f65855d61faaba6542b2 Mon Sep 17 00:00:00 2001
+From: TristanInSec <tristan.mtn@gmail.com>
+Date: Wed, 15 Apr 2026 14:51:08 -0400
+Subject: [PATCH] packet: check `_libssh2_get_string()` return in `EXT_INFO`
+ handler
+
+The `SSH_MSG_EXT_INFO` handler discards the return values from
+`_libssh2_get_string()` when parsing extension name/value pairs. When
+the buffer is exhausted before all claimed extensions are parsed,
+the loop continues with no-op iterations until `nr_extensions` reaches
+zero.
+
+The `nr_extensions >= 1024` cap limits the worst case, but the loop
+should still break on parse failure for correctness and consistency
+with other parsers in this file (e.g. `SSH_MSG_CHANNEL_OPEN`,
+`SSH_MSG_KEXINIT`) that check `_libssh2_get_string()` return values.
+
+Closes #1864
+
+CVE: CVE-2026-55199
+Upstream-Status: Backport [https://github.com/libssh2/libssh2/commit/17626857d20b3c9a1addfa45979dadcee1cd84a4]
+
+Signed-off-by: Daniel Turull <daniel.turull@ericsson.com>
+---
+ src/packet.c | 6 ++++--
+ 1 file changed, 4 insertions(+), 2 deletions(-)
+
+diff --git a/src/packet.c b/src/packet.c
+index 6da14e9f..ebaddae5 100644
+--- a/src/packet.c
++++ b/src/packet.c
+@@ -868,8 +868,10 @@ _libssh2_packet_add(LIBSSH2_SESSION * session, unsigned char *data,
+ 
+                     nr_extensions -= 1;
+ 
+-                    _libssh2_get_string(&buf, &name, &name_len);
+-                    _libssh2_get_string(&buf, &value, &value_len);
++                    if(_libssh2_get_string(&buf, &name, &name_len))
++                        break;
++                    if(_libssh2_get_string(&buf, &value, &value_len))
++                        break;
+ 
+                     if(name && value) {
+                         _libssh2_debug((session,
diff --git a/meta/recipes-support/libssh2/libssh2_1.11.1.bb b/meta/recipes-support/libssh2/libssh2_1.11.1.bb
index 5ffc40b8fcf..2407ed34d94 100644
--- a/meta/recipes-support/libssh2/libssh2_1.11.1.bb
+++ b/meta/recipes-support/libssh2/libssh2_1.11.1.bb
@@ -12,6 +12,7 @@ SRC_URI = "http://www.libssh2.org/download/${BP}.tar.gz \
            file://0001-Return-error-if-user-KEX-methods-are-invalid.patch \
            file://CVE-2026-7598.patch \
            file://CVE-2026-55200.patch \
+           file://CVE-2026-55199.patch \
            "
 
 SRC_URI[sha256sum] = "d9ec76cbe34db98eec3539fe2c899d26b0c837cb3eb466a56b0f109cabf658f7"

