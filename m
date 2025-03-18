Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19533C282EC
	for <webhook@archiver.kernel.org>; Tue, 18 Mar 2025 09:44:14 +0000 (UTC)
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
 by mx.groups.io with SMTP id smtpd.web11.7684.1742291046339834296
 for <openembedded-core@lists.openembedded.org>;
 Tue, 18 Mar 2025 02:44:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=cAWYNcce;
 spf=pass (domain: gmail.com, ip: 209.85.208.44, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-5e5b6f3025dso7843470a12.1
        for <openembedded-core@lists.openembedded.org>; Tue, 18 Mar 2025 02:44:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742291045; x=1742895845; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=p4FvqLLjEX5GLg5wpTkF8IqSdCnZ8LHO7Dr+3PtbsvU=;
        b=cAWYNcce9le5E8BKHGPIOyHfwT+GBbWFll9x/wu4E2BhBXdJ0ohIiqSa91+Di+YCFL
         1YL7szjZvcHxuCMTqT7bbPsfG3k9QMc/+JCjnaVkbvv8P4pyT1/A6ZQO51kbPZ9agEmy
         TGMSJzri5JtNO7Ir+rCG5tRwIjCG45y9pK3TZvtQnHSMIPX737bSvp5ogh6uZaISd7Xx
         xKhIkEHue9bdL6o9p5ZIdyQX5/7O7IPJeEN6/zd6JiKiXuxX1iwWq1r4d/b8OOHHQhjv
         hz3rkj1GU+vxRpld8CSkqdUh0T1dw9dold3Eb7df6uDz49V1Xwt3D5zSY6THGZb5DyTN
         suqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742291045; x=1742895845;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=p4FvqLLjEX5GLg5wpTkF8IqSdCnZ8LHO7Dr+3PtbsvU=;
        b=TvX15yvvAHku8vR7KkBnuUbM/oSK9mG/9/nvkDZu+KIVgeoxihF81jEQc0+moONnBa
         vI5e+DKu3CAcXQEMeXkgFcR+I8bRTdDpm5Vc+1kJ8An5B6EUsNKy3yn73uBaOPtEH0Ar
         pMi9fM1JJSUZbWRtia6NXGfs4LR7sIBDKshPRkzvvmCMYYVCcwpOhRZ/SaTzQelB+9K7
         h5on407pxmAwUOa75nDqStrbWlmq2M2w9CLwCZNiqs0KIAHekjM4EqNf+fDApeq1FQJa
         FZc+V4lcQx6lM/qJP58Ys4Y+uVcUa+aOLGkS0lJPbvsy0yHCPt0M+EwR7tWiDp+dbky8
         ZrWw==
X-Gm-Message-State: AOJu0YxOiEZWjxMCj0wqBFD8QqBuSEoifQqCGiJgSJa6FG9XohGfbQOj
	KRfAj09dEiY4wqQKrDa5aUzzoHRM9XxlExBLSD4obPnHk5c+KOm+R4tjuw==
X-Gm-Gg: ASbGncu8zL4KxKWKl7Uf0o49e9+eXgaS18g10bV0mQJMWmQCUlW5Re0KjZoY33Kuocd
	GsvLoawJTEf0miZMLo5dabAJrWWs+Qx+dcNhz8p4vj9kd5kX9kWDYaqbmqTW1QHfFV4sDDhM+RE
	359+bniwB7YI2eVrxom/LVK4X33hI6ceIYUZEVpI0bBJ/33TCS8H0qefC6kHrlbGXDOXXJX4/PE
	3o61krTWFv54DmFzvDHh45tljP9joJHa3qrOu7lIRykR+eArBvtfF3+L/fm+yfw424Ly3ZA2KOg
	w2vcFCFDClPhY50LQagXSPryEqXSVmH1jCsBkD8v8XdIMhItLBsofgR5Hoatj7beg/9zBoPtqOC
	+XN/46g==
X-Google-Smtp-Source: AGHT+IFGTTG37mdrTbD0A+kcC5+X1yEve8MOTWadknNuXoWTp3vSxmmtLlJQMk7Bv8nN4siznwv1oA==
X-Received: by 2002:a05:6402:5201:b0:5e7:8848:f567 with SMTP id 4fb4d7f45d1cf-5eb1df62a3fmr2174090a12.20.1742291044205;
        Tue, 18 Mar 2025 02:44:04 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5e8169b160dsm7481827a12.41.2025.03.18.02.44.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Mar 2025 02:44:03 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH v3] ppp: remove erroneous generated header from the source tree
Date: Tue, 18 Mar 2025 10:43:40 +0100
Message-Id: <20250318094340.4134898-1-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 18 Mar 2025 09:44:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213192

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
v3: rebase on changes in master
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
index 5565ce51cff..aed4a9a7700 100644
--- a/meta/recipes-connectivity/ppp/ppp_2.5.2.bb
+++ b/meta/recipes-connectivity/ppp/ppp_2.5.2.bb
@@ -24,13 +24,14 @@ SRC_URI = "https://download.samba.org/pub/${BPN}/${BP}.tar.gz \
            file://provider \
            file://ppp@.service \
            file://0001-pppdump-Fixed-building-with-GCC-15-548.patch \
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


