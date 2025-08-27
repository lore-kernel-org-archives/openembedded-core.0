Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E23ACA0FFB
	for <webhook@archiver.kernel.org>; Wed, 27 Aug 2025 21:30:29 +0000 (UTC)
Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
 by mx.groups.io with SMTP id smtpd.web10.6605.1756330223121762547
 for <openembedded-core@lists.openembedded.org>;
 Wed, 27 Aug 2025 14:30:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=uxKKFYx3;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.182, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-b4c3c36643aso216580a12.3
        for <openembedded-core@lists.openembedded.org>; Wed, 27 Aug 2025 14:30:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1756330222; x=1756935022; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Z3eLs0spXINi/TSBo0uEssx6cITHA0DTvkk1K3WMLT8=;
        b=uxKKFYx326Bp/3PMXEVDlCkuEv21IiY9IMXF/hm2RHcpc8KJv+jL2+dvQzcPyJRLxI
         XrzsGqHQiLSDGg9xaC05zferNIyVZD0IrWga8cpsRBSW1n0pWEpK4LwVNUu3RFzewWr6
         m7AOS/GlcTUM6X9YnYug8n7qCrLZsP04OyYVhYpSg01xy0CO6pWSCQEaV52Uf4HpDSFo
         +ObfvF5rdVBZUovIaYqkP0YzTcbU6+/EDbs/r+txw4LmjWm6XpIldEhpNjH0hs6Vyt+O
         WcX/kh8wRKiql4L+Sl/mIMHBgAyXuXbNxynXM/VSsjQO46z0PZ8ex7kgDwUgxICIehmR
         qMVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756330222; x=1756935022;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Z3eLs0spXINi/TSBo0uEssx6cITHA0DTvkk1K3WMLT8=;
        b=TOpTFs+JOJNiYyUki2bNJcR6240CVfwn3g1La5AnCPN5ycbiG5S4Rmx+pibvC+sk0B
         fqQpB5va3MvMB3LahHwJ76z0XDOb+ZeSS4/kZ060wUrZS+WbNsTD/moxQ8gVjTmXe2FA
         u1pop8OjAOvLssQpmhGKW6nMAv4HvJLx9qJwNRGZso3qgYi9yjvGx/1gK2WMBbsnIBUX
         SgzygYSieISDxaCsKaMAmlYNaj22pfmU7cfS2+ae1fp7/LYfYZ15ywxv5+2UQ+YrEMIY
         GqGSPe9cg8nEX6kRktKfoKmOhzufPss8CIzSDZv1skukpOIx9lt8TqGbFnenl9ZIri52
         8Wvg==
X-Gm-Message-State: AOJu0Ywyn+ULTbHUkIdhHxbf+wRhJk2U+g0tRGXqh2flzcI/xfRBN4v4
	qs7Cl/ZQ0Y4W7IIJDmTLZtB+fRUTtti1Dbx34C9M/nqQyQOj8r5y4pqCHkcAzny5ZVn53/cVWu9
	3M6pg
X-Gm-Gg: ASbGncvKwA2FPs4FUN7mj0U+mZJkeTWhMmmjI/6TkRNLlXbJJMGxfIoQmI7f8ALvBCw
	N1uGevYc0h4KVPOX9z243HDyTS6b8+oLpjOHuEWNaCI+PGpMHlDFmEDYpRXNcq/x9gQX59OX7qw
	AggUmaWRyA7KGRclegppUxhOoe9P8twdZ7Zoe1SMitK9y9QSgFclpiKEK8/YcqY3SdrZubi6e/t
	xSWt3AXD7snbL8JfRSSSjt7dhckiG2Oi30mn9MGq756S9JfZy2ooMFI05mbJOOZAEbrN4ZsKHcx
	iZ6sFSF/3JHdBx60fzS9XCptSuZLiq9dlzx37eFmftwwJZQ4pIdlhD2q0wc29/gyLF4jw7U1nPx
	i6Ho8Ps+e52+MfSv1jxxqZpBS
X-Google-Smtp-Source: AGHT+IEoFb8xyF805OYeqUAxAnEjfSgoM9l8doWRPZ8MqsFYAFQyI3rhfc9hRi+R5KineNRZrujNag==
X-Received: by 2002:a17:90b:3805:b0:31c:c661:e4e with SMTP id 98e67ed59e1d1-32518997f87mr26401349a91.33.1756330222353;
        Wed, 27 Aug 2025 14:30:22 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:d0c9:1052:20fd:8423])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3276fce1f30sm2905857a91.23.2025.08.27.14.30.21
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Aug 2025 14:30:22 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 16/33] unzip: Fix build with GCC-15
Date: Wed, 27 Aug 2025 14:29:23 -0700
Message-ID: <b84d6ceb89277462d7069defaeb9ecfed9c30d56.1756329972.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1756329972.git.steve@sakoman.com>
References: <cover.1756329972.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 27 Aug 2025 21:30:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222524

From: Khem Raj <raj.khem@gmail.com>

Add a patch to remove redundant declarations

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-extended/unzip/unzip/gcc15.patch | 18 ++++++++++++++++++
 meta/recipes-extended/unzip/unzip_6.0.bb      |  1 +
 2 files changed, 19 insertions(+)
 create mode 100644 meta/recipes-extended/unzip/unzip/gcc15.patch

diff --git a/meta/recipes-extended/unzip/unzip/gcc15.patch b/meta/recipes-extended/unzip/unzip/gcc15.patch
new file mode 100644
index 0000000000..ab06a4713f
--- /dev/null
+++ b/meta/recipes-extended/unzip/unzip/gcc15.patch
@@ -0,0 +1,18 @@
+Do not redefine gmtime(), localtime()
+
+They are already provided by system time.h header
+
+Upstream-Status: Inactive-Upstream [need a new release]
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
+--- a/unix/unxcfg.h
++++ b/unix/unxcfg.h
+@@ -117,7 +117,6 @@ typedef struct stat z_stat;
+ #  endif
+ #else
+ #  include <time.h>
+-   struct tm *gmtime(), *localtime();
+ #endif
+ 
+ #if (defined(BSD4_4) || (defined(SYSV) && defined(MODERN)))
diff --git a/meta/recipes-extended/unzip/unzip_6.0.bb b/meta/recipes-extended/unzip/unzip_6.0.bb
index c13e7a008e..0a88b4c092 100644
--- a/meta/recipes-extended/unzip/unzip_6.0.bb
+++ b/meta/recipes-extended/unzip/unzip_6.0.bb
@@ -32,6 +32,7 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/infozip/UnZip%206.x%20%28latest%29/UnZip%206.0/
         file://CVE-2022-0530.patch \
         file://0001-configure-Add-correct-system-headers-and-prototypes-.patch \
         file://0001-unix-configure-fix-detection-for-cross-compilation.patch \
+        file://gcc15.patch \
 "
 UPSTREAM_VERSION_UNKNOWN = "1"
 
-- 
2.43.0


