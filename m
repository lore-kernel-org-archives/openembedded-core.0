Return-Path: <raj.khem@gmail.com>
Received: from mail-pl1-f196.google.com (mail-pl1-f196.google.com
	[209.85.214.196])
	by mail.openembedded.org (Postfix) with ESMTP id D9AA76C3B2
	for <openembedded-core@lists.openembedded.org>;
	Wed,  6 Nov 2019 02:48:03 +0000 (UTC)
Received: by mail-pl1-f196.google.com with SMTP id w8so10706347plq.5
	for <openembedded-core@lists.openembedded.org>;
	Tue, 05 Nov 2019 18:48:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=HUVaLh14KY0druBQX8TDY5p7lS4qxqWDq3R11oQN7/w=;
	b=lz4lq2jkQHWgXUU1Ymi9Ptvoe9X8Xu98PT1b7YskA0VPM09K3CS2EtZ4OOnV7c7z+r
	IRXO39B04xKKit6tCWTZ65K/mdvrf2SXTYM518TxBjqJJJ1fcmF/xcBOdaAkQlfxlT4/
	0T69Ll6JN6i1a+jRdzg21PexRtB/XiK//nxT8/UZT7fg+GkCIklGAP5SCzeaBCtIoreM
	bqI6B190qoEERNPQsX4HyVl9TExfrdp9sASIJoRfjW0RT/I//04IXlNDv/jXTlBXwEV4
	+2LwYhmlM/OsU+9f1ZgWBsnkrkSO1OaGpsaf6L4hL6YpbRu7YURZiaW8eEIdS4tkX3g8
	EbDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=HUVaLh14KY0druBQX8TDY5p7lS4qxqWDq3R11oQN7/w=;
	b=gC7AQU5Me6ELGGqG1/17nnabb0hm6zoK2veUFelLL2BvfnkKWrdVR1NcecfbHJugHi
	5fMg0pSEgYwy1BjmFCiqs9rCeOiTEHXtLZETxyo7oT+xdxwbVXgXxBlYWXd40Wly7dvh
	PPEmwWfQR5onM1aO9j3iP+EcG73XiCnEscIkuQ0x3zIcUFM4dfWK3cS62Yzqszi0Vufh
	WwXqDtRtzzZMs5oqLeHmS2ofsrs04vYK6oHdqnu/L1PWqZaHXvThVI2RpwauU0kaQ/r2
	78+ql0/MFP/OVgEglv8kGV9sgMs24FJygdGo+JnGPyOhT11Gtjb5/G8GnR2kehDg6aCP
	WLbw==
X-Gm-Message-State: APjAAAU8yIfCITBZmRG3AdeRIVA9uVrYka9WAwrQhrXT7rq7Rwz1oOcz
	ljFfFworGXXZQeDL7c24+QtruYD52+Y=
X-Google-Smtp-Source: APXvYqzGSYdDVpJCz0+KEIGKPZExX4PpoUqdnTd04NYji16ZLbIR/111Rk78Le/VSAcI9QMgfA6G6A==
X-Received: by 2002:a17:902:9a8b:: with SMTP id w11mr94716plp.9.1573008483990; 
	Tue, 05 Nov 2019 18:48:03 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:8500:1c20::5caf])
	by smtp.gmail.com with ESMTPSA id
	m13sm18973202pga.70.2019.11.05.18.48.03
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 05 Nov 2019 18:48:03 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  5 Nov 2019 18:47:48 -0800
Message-Id: <20191106024748.1398912-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
Subject: [PATCH] libtirpc: Do not include bits/endian.h directly
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 06 Nov 2019 02:48:04 -0000
Content-Transfer-Encoding: 8bit

this file is supposed be included via endian.h indirectly, moreover
Future musl versions does not have this file

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../libtirpc/libtirpc/musl.patch               | 18 +++++++++++++++---
 1 file changed, 15 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-extended/libtirpc/libtirpc/musl.patch b/meta/recipes-extended/libtirpc/libtirpc/musl.patch
index 0c3ce603ea..21cd9f9588 100644
--- a/meta/recipes-extended/libtirpc/libtirpc/musl.patch
+++ b/meta/recipes-extended/libtirpc/libtirpc/musl.patch
@@ -1,13 +1,14 @@
 Consider musl provided built-in defines
 
 Helps compile libtirpc with musl
+bits/endian.h is not supposed to be included directly
 
 Upstream-Status: Pending
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 
---- ./tirpc/rpc/types.h.orig	2018-03-17 10:23:10.022055255 +0100
-+++ ./tirpc/rpc/types.h	2018-03-17 10:23:30.877751656 +0100
-@@ -66,7 +66,7 @@
+--- a/tirpc/rpc/types.h
++++ b/tirpc/rpc/types.h
+@@ -66,7 +66,7 @@ typedef   int32_t rpc_inline_t;
  #define mem_free(ptr, bsize)	free(ptr)
  
  
@@ -16,3 +17,14 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  # define __u_char_defined
  # define __daddr_t_defined
  #endif
+--- a/src/xdr_float.c
++++ b/src/xdr_float.c
+@@ -83,7 +83,7 @@ static struct sgl_limits {
+ };
+ #else
+ 
+-#include <bits/endian.h>
++#include <endian.h>
+ #define IEEEFP
+ 
+ #endif /* vax */
-- 
2.24.0


