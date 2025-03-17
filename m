Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6004C28B28
	for <webhook@archiver.kernel.org>; Mon, 17 Mar 2025 10:21:58 +0000 (UTC)
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
 by mx.groups.io with SMTP id smtpd.web11.49054.1742206914918745910
 for <openembedded-core@lists.openembedded.org>;
 Mon, 17 Mar 2025 03:21:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Z32Iq/Hy;
 spf=pass (domain: gmail.com, ip: 209.85.218.48, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-ac2c663a3daso193472366b.2
        for <openembedded-core@lists.openembedded.org>; Mon, 17 Mar 2025 03:21:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742206913; x=1742811713; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=l31aLd42GYC0A7n0YyT4fAAcUsnpWT6oHanqDl+M16E=;
        b=Z32Iq/HyIryxSy1bNOmsyufh34IdmWQEQAPKhzPTQzBBUf7386UC8YcVpUy6v4rCK/
         sRDeebVFz0OZ9ikjaRXIf4Vzgta4i10xo3eezCRtLngm3D+m+N/iSzy33D8FZj9/RaLl
         OhtqmbjmkSzQzA04BQycp55Owm0hd6Vu3pW1EgoN7atf9xJvc/xB0eCkCaIaiDUxbfty
         v/xZFyQxMUMOO9H4v5t6vBN2rWjsRs+s2k8ZTYgedYwdGVciP2itT4TWtjUrzVL7B3S2
         QzPJqKu74E8PKxT5Q/bDgbgk5oLJcFxhKKBvY8sK4Loh8uZobreXac/uGkx4EsnhmrzI
         h/qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742206913; x=1742811713;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=l31aLd42GYC0A7n0YyT4fAAcUsnpWT6oHanqDl+M16E=;
        b=qKSUaV3wHnioL5RzLsqIF7ng4M8w8q715PGimYhtYPgJxB0YhaJN1DrKRZmwRrG9wz
         4g/xj914koTr5SRucxIiYM9Z9IzVzr1Xoa3R0rodX5Tbx+baJDfjBPqmgyzS1e5gT9UM
         OBHPOSZjJE5UjjZ9tQ6wLuNuL0OHaNMsKpsakuvqvYh0kXPRzVGjMUj0AKFWMcFI8b3r
         mOCx0xHJ/W0pThy2nsztH1S5/sNKx/YKKjdb8av7SwyzLkHP/l7+IH88neHCD9xRSKcy
         ciLMoDKJMdVgbud+UY5OB3tHYAHwwn2HlZzhqQ2DFwbxvi78XcSHg1pQJsfOsCz6/KNm
         bfhA==
X-Gm-Message-State: AOJu0YxG97K1ZslAER+pEaXk4PR5Mo/jsHftaQSgn2omQz9d8fTS1Hb6
	XDwSAfZZjOwT27zjQK69wHT1wFesGdC/YCr9C5JWrPGmXJSXKKi9/MSZBg==
X-Gm-Gg: ASbGncsk/sIFxaz0017QK1/EPNfTlO3qFCSoWZ9DSbG8BcFTW0RUlKiH7of8HQga9zA
	CXaY/NTklIpf/9SbWk4iVrO1n22Ta0ekSjLPRsUJu3nEk12/1zg095o26p+dqKT6a19GscJEISt
	Dx3/HdwjIK2m3CvU66GZntEuFn2NcaIALKIsGhj9aZiHN7HG/2cBaT6QaOhLmjkaRUtRMCNDBoG
	IRBQuV2/RQ8WwVSJ+XvwyiKzoJ+GILecHQ96y4JbkyVa0wsKlpV+lJH7wihPjTvUJ99EvscN9sI
	KbkBjBfCLBKGSpLFBszjrSQ80WPOYO8vi0nZJlOxOfxpX4v7hBo2rllUBbTUjVy8nZDXO4ZpC5R
	WVyJDJw==
X-Google-Smtp-Source: AGHT+IExRU00larOZv7Y1We/VaCTdFb6+yoG+ouuoxsJ96GkNfG4+E7a6hF7PiPnjCGbr8zX9niQug==
X-Received: by 2002:a17:906:c10d:b0:ac2:7cf9:7193 with SMTP id a640c23a62f3a-ac3304195a3mr1271684466b.48.1742206912846;
        Mon, 17 Mar 2025 03:21:52 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac3147efaf4sm646222666b.61.2025.03.17.03.21.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Mar 2025 03:21:52 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH v2] ppp: remove erroneous generated header from the source tree
Date: Mon, 17 Mar 2025 11:21:47 +0100
Message-Id: <20250317102147.2236867-1-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 17 Mar 2025 10:21:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213065

From: Alexander Kanavin <alex@linutronix.de>

ppp-2.5.2 tarball ships a generated header with various
configuration settigns that takes precedence over the same
header generated into the build directory during the actual build.

This resulted in various linking fails that were worked around
by enabling multilink in 2.5.2 version update. The correct fix
that removes all contamination is to remove the bogus header first.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>

---
v2: converted from using rm to a proper patch as suggested by Khem
---
 ....h-remove-erroneous-generated-header.patch | 98 +++++++++++++++++++
 meta/recipes-connectivity/ppp/ppp_2.5.2.bb    |  3 +-
 2 files changed, 100 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-connectivity/ppp/ppp/0001-pppd-pppdconf.h-remove-erroneous-generated-header.patch

diff --git a/meta/recipes-connectivity/ppp/ppp/0001-pppd-pppdconf.h-remove-erroneous-generated-header.patch b/meta/recipes-connectivity/ppp/ppp/0001-pppd-pppdconf.h-remove-erroneous-generated-header.patch
new file mode 100644
index 00000000000..a00706c1847
--- /dev/null
+++ b/meta/recipes-connectivity/ppp/ppp/0001-pppd-pppdconf.h-remove-erroneous-generated-header.patch
@@ -0,0 +1,98 @@
+From a6eb65162db5bcc5ec26cff7361885c0a44cbbfa Mon Sep 17 00:00:00 2001
+From: Alexander Kanavin <alex@linutronix.de>
+Date: Mon, 17 Mar 2025 11:12:07 +0100
+Subject: [PATCH] pppd/pppdconf.h: remove erroneous generated header
+
+Upstream-Status: Inappropriate [tarball generation issue tracked at https://github.com/ppp-project/ppp/issues/541]
+Signed-off-by: Alexander Kanavin <alex@linutronix.de>
+---
+ pppd/pppdconf.h | 80 -------------------------------------------------
+ 1 file changed, 80 deletions(-)
+ delete mode 100644 pppd/pppdconf.h
+
+diff --git a/pppd/pppdconf.h b/pppd/pppdconf.h
+deleted file mode 100644
+index 51a8f02..0000000
+--- a/pppd/pppdconf.h
++++ /dev/null
+@@ -1,80 +0,0 @@
+-/* pppd/pppdconf.h.  Generated from pppdconf.h.in by configure.  */
+-/* 
+- * Copyright (c) 2022 Eivind Næss. All rights reserved.
+- *
+- * Redistribution and use in source and binary forms, with or without
+- * modification, are permitted provided that the following conditions
+- * are met:
+- *
+- * 1. Redistributions of source code must retain the above copyright
+- *    notice, this list of conditions and the following disclaimer.
+- *
+- * 2. Redistributions in binary form must reproduce the above copyright
+- *    notice, this list of conditions and the following disclaimer in
+- *    the documentation and/or other materials provided with the
+- *    distribution.
+- *
+- * 3. The name(s) of the authors of this software must not be used to
+- *    endorse or promote products derived from this software without
+- *    prior written permission.
+- *
+- * THE AUTHORS OF THIS SOFTWARE DISCLAIM ALL WARRANTIES WITH REGARD TO
+- * THIS SOFTWARE, INCLUDING ALL IMPLIED WARRANTIES OF MERCHANTABILITY
+- * AND FITNESS, IN NO EVENT SHALL THE AUTHORS BE LIABLE FOR ANY
+- * SPECIAL, INDIRECT OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES
+- * WHATSOEVER RESULTING FROM LOSS OF USE, DATA OR PROFITS, WHETHER IN
+- * AN ACTION OF CONTRACT, NEGLIGENCE OR OTHER TORTIOUS ACTION, ARISING
+- * OUT OF OR IN CONNECTION WITH THE USE OR PERFORMANCE OF THIS SOFTWARE.
+- */
+-
+-/*
+- * This file is generated by configure and sets the features enabled
+- *   in pppd when configured.
+- */
+-
+-#ifndef PPP_PPPDCONF_H
+-#define PPP_PPPDCONF_H
+-
+-/* Have Microsoft CHAP support */
+-#define PPP_WITH_CHAPMS 1
+-
+-/* Have Microsoft LAN Manager support */
+-/* #undef PPP_WITH_MSLANMAN */
+-
+-/* Have Microsoft MPPE support */
+-#define PPP_WITH_MPPE 1
+-
+-/* Have multilink support */
+-#define PPP_WITH_MULTILINK 1
+-
+-/* Have packet activity filter support */
+-#define PPP_WITH_FILTER 1
+-
+-/* Have support for loadable plugins */
+-#define PPP_WITH_PLUGINS 1
+-
+-/* Have Callback Protocol support */
+-/* #undef PPP_WITH_CBCP */
+-
+-/* Include TDB support */
+-#define PPP_WITH_TDB 1
+-
+-/* Have IPv6 Control Protocol */
+-#define PPP_WITH_IPV6CP 1
+-
+-/* Support for Pluggable Authentication Modules */
+-/* #undef PPP_WITH_PAM */
+-
+-/* Have EAP-SRP authentication support */
+-/* #undef PPP_WITH_SRP */
+-
+-/* Have EAP-TLS authentication support */
+-#define PPP_WITH_EAPTLS 1
+-
+-/* Have PEAP authentication support */
+-#define PPP_WITH_PEAP 1
+-
+-/* The pppd version */
+-#define PPPD_VERSION "2.5.2"
+-
+-#endif
diff --git a/meta/recipes-connectivity/ppp/ppp_2.5.2.bb b/meta/recipes-connectivity/ppp/ppp_2.5.2.bb
index 9ea99cc15a3..f79bde38b34 100644
--- a/meta/recipes-connectivity/ppp/ppp_2.5.2.bb
+++ b/meta/recipes-connectivity/ppp/ppp_2.5.2.bb
@@ -23,13 +23,14 @@ SRC_URI = "https://download.samba.org/pub/${BPN}/${BP}.tar.gz \
            file://ppp_on_boot \
            file://provider \
            file://ppp@.service \
+           file://0001-pppd-pppdconf.h-remove-erroneous-generated-header.patch \
            "
 
 SRC_URI[sha256sum] = "47da358de54a10cb10bf6ff2cf9b1c03c0d3555518f6182e8f701b8e55733cb2"
 
 inherit autotools pkgconfig systemd
 
-PACKAGECONFIG = "${@bb.utils.filter('DISTRO_FEATURES', 'pam', d)} openssl multilink"
+PACKAGECONFIG = "${@bb.utils.filter('DISTRO_FEATURES', 'pam', d)} openssl"
 PACKAGECONFIG[pam] = "--with-pam=yes,--with-pam=no,libpam"
 PACKAGECONFIG[openssl] = "--with-openssl=yes,--with-openssl=no,openssl"
 PACKAGECONFIG[multilink] = "--enable-multilink,--disable-multilink"
-- 
2.39.5


