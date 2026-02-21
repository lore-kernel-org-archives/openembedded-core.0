Return-Path: <stondo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 778FEC5DF90
	for <webhook@archiver.kernel.org>; Sat, 21 Feb 2026 04:53:43 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.14715.1771649622297448598
 for <openembedded-core@lists.openembedded.org>;
 Fri, 20 Feb 2026 20:53:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ZVxMJ8+Z;
 spf=pass (domain: gmail.com, ip: 209.85.128.43, mailfrom: stondo@gmail.com)
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4838c15e3cbso22807715e9.3
        for <openembedded-core@lists.openembedded.org>; Fri, 20 Feb 2026 20:53:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771649620; x=1772254420; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5Qp++TM/PJWS1Amcuamd4PKGqYeNWD7u0wOhol/5Jgk=;
        b=ZVxMJ8+ZyH87sxHiq2WG+Ls0BAgirAtv/bPUFCJ4gAYSA9mF13Ap0jJ1F9uozr38t0
         Y/7cJjZZoyF9UugBI7EIS/SFEPAJJGECB5SuFBdECZ1doY4axcJ34guoGi34Ls0Ys/UF
         H0pF6HKyCDPTmlMNcJu1VljIVh+AgEUxx42N/zi3NngAu68jmIo06nkGPn58MqdbMfIS
         xMYQCYI+tIR7Rq6MYOjUbAX16LKJtI2fvEsL4QwhrMi+f2Z80JmH+4/CYrN7W+foM7E9
         Rh4bkvb5SLLDE8+ujt9PX49pqQBo3E7WtLszN0tAo6bj9yS7cTIDxD2um9E56ucg3bmw
         29GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771649620; x=1772254420;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=5Qp++TM/PJWS1Amcuamd4PKGqYeNWD7u0wOhol/5Jgk=;
        b=AQsAzV6gQfGh7yuQXHrmHmR2YwcO6kiUcKsVJ0UyZoU3SZO9+zeGuEaw0DRYihU+Ye
         HNJclGS5ME8qqu6dGNTMVtrf85wDZxdGP+pUoqLVS4zVKi50kgnn78NUtUxjdWz25GaS
         dp87pB6qrkoB7xwupP7nJtPp2NvwRqTA8n6npa5UYRlFF30pIGcDDL0/4jJJ3/XMYn3Y
         WVo3mbweSaxPdMKE7EYbPsptocuxlBw9KHK7ZhjEpECF3sNiGPxjk+3l97gji35mm3bR
         3olaEcYxcG4UK9sxLJPfxrFZ948/0I1DbuqoZXVFEExEpu4nNFWjIftogN1shPUwQocG
         Ju0w==
X-Gm-Message-State: AOJu0Yzl3IL1HAqv32KDJ3bdmWl0ZNDC451Aqfg06H0vk/YhtbLJ7pZQ
	1Bkah3Zvp2DHxPgWc63UIqO7u1TKWVyrBWrV5rxKDaUX1kPJnjdhdgGnqwatAw==
X-Gm-Gg: AZuq6aJCl7C/qwZohj+pnPGYshL29QJpoBuHJaZCHgdTBG47puLrjRLBF6DyXMqlJDd
	/Ur+KvFhhp9GueZf21GXZdUuHyyFAU6NGaW6bD/aIV96gqy5tpkrdt+FtZx0TY6Be7K59Tw0jnj
	+RY9NzK4Wb0hYjyRCT/bCDUkXPA2nfxyDXXUw2cCRyqGhRpv5zjvU+6nL/ashJFAkjxKqwJe8/E
	V9wmJZTlIYqS/COx8y2Z3cUS5KPra0Mjwq9Elfe7xdzPQgpnoD6HKuEbE5YsXrCjRsSvyKEfOod
	/fedcZAeQT95TAXbpJuYnf4ICh+xcBPLItutU7IEsuOz+adrgQelxZYFJFz06CJlRE3mxXn1/7z
	60dkyq6C6YITK4FU7BEmU57sMEJR7sU/uE7+F2qQ0t6xrkCASK/G+vtXwSevrS31NHXIOx37CjG
	tVQq4kyfHy9Wb89iCn+e1rcotmm4s50J3O7XY=
X-Received: by 2002:a05:600c:1386:b0:475:da1a:53f9 with SMTP id 5b1f17b1804b1-483a96087d8mr29691965e9.14.1771649620155;
        Fri, 20 Feb 2026 20:53:40 -0800 (PST)
Received: from fedora ([81.6.40.67])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483a4e8d392sm79561495e9.2.2026.02.20.20.53.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Feb 2026 20:53:39 -0800 (PST)
From: Stefano Tondo <stondo@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: stefano.tondo.ext@siemens.com,
	adrian.freihofer@siemens.com,
	Peter.Marko@siemens.com,
	jpewhacker@gmail.com,
	Ross.Burton@arm.com
Subject: [PATCH v2 1/2] spdx-common: Declare SPDX_FORCE_*_SCOPE override variables
Date: Sat, 21 Feb 2026 05:53:36 +0100
Message-ID: <20260221045337.327402-2-stondo@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260221045337.327402-1-stondo@gmail.com>
References: <20260221045337.327402-1-stondo@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 21 Feb 2026 04:53:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231578

From: Stefano Tondo <stefano.tondo.ext@siemens.com>

Add bbclass variable declarations for SPDX_FORCE_BUILD_SCOPE,
SPDX_FORCE_TEST_SCOPE, and SPDX_FORCE_RUNTIME_SCOPE. These optional
variables allow recipes to override the automatic lifecycle scope
classification for dependency relationships.

The scope classification code in spdx30_tasks.py already handles these
variables gracefully when unset. These declarations provide discoverability
and documentation for users who need to correct edge cases in automatic
scope detection.

Signed-off-by: Stefano Tondo <stefano.tondo.ext@siemens.com>
---
 meta/classes/spdx-common.bbclass | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/meta/classes/spdx-common.bbclass b/meta/classes/spdx-common.bbclass
index 81c61e10dc..99f0704caf 100644
--- a/meta/classes/spdx-common.bbclass
+++ b/meta/classes/spdx-common.bbclass
@@ -52,6 +52,19 @@ SPDX_CONCLUDED_LICENSE[doc] = "The license concluded by manual or external \
     Example: SPDX_CONCLUDED_LICENSE = 'MIT & Apache-2.0' or \
     SPDX_CONCLUDED_LICENSE:${PN} = 'MIT & Apache-2.0'"
 
+# Lifecycle scope override variables for dependency classification
+SPDX_FORCE_BUILD_SCOPE ??= ""
+SPDX_FORCE_BUILD_SCOPE[doc] = "Space-separated list of recipe names to force \
+    into build scope, overriding automatic dependency classification."
+
+SPDX_FORCE_TEST_SCOPE ??= ""
+SPDX_FORCE_TEST_SCOPE[doc] = "Space-separated list of recipe names to force \
+    into test scope. By default, test dependencies are classified as build."
+
+SPDX_FORCE_RUNTIME_SCOPE ??= ""
+SPDX_FORCE_RUNTIME_SCOPE[doc] = "Space-separated list of recipe names to force \
+    into runtime scope, overriding automatic dependency classification."
+
 SPDX_MULTILIB_SSTATE_ARCHS ??= "${SSTATE_ARCHS}"
 
 SPDX_FILES_INCLUDED ??= "all"
-- 
2.53.0


