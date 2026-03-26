Return-Path: <adam.duskett@amarulasolutions.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0BDE710A1E7F
	for <webhook@archiver.kernel.org>; Thu, 26 Mar 2026 11:44:32 +0000 (UTC)
Received: from mail-ej1-f68.google.com (mail-ej1-f68.google.com [209.85.218.68])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.45422.1774525467625340594
 for <openembedded-core@lists.openembedded.org>;
 Thu, 26 Mar 2026 04:44:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@amarulasolutions.com header.s=google header.b=MTcCUT+Q;
 spf=pass (domain: amarulasolutions.com, ip: 209.85.218.68, mailfrom: adam.duskett@amarulasolutions.com)
Received: by mail-ej1-f68.google.com with SMTP id a640c23a62f3a-b980cc0ab21so6955466b.3
        for <openembedded-core@lists.openembedded.org>; Thu, 26 Mar 2026 04:44:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1774525466; x=1775130266; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ufgabvYoQf2JxjQ43fyHhN56IjCHWheDC5jc9K5qbns=;
        b=MTcCUT+Q8r5g4XODgvKXTo05Kscqq+GYFtRuXhUUadrb5ccgONlou7iR4ZcUtK5GOh
         EqZqV5mrQTSVxgNvZFs36C11SPwt6NUBT4uGYIZgnp4pzGqiV/J4GAfdAL0X+75BSsN1
         P16wLAulFpvk+xzU7pzVqi/SG//unkw532GeU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774525466; x=1775130266;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ufgabvYoQf2JxjQ43fyHhN56IjCHWheDC5jc9K5qbns=;
        b=S2YasZyO7q4ALS7z3SsONFsuQ8U0FWyUzmwmhzDhnlzkWiEOIYibO0j82v5jqrw1uf
         /uhNG9k0ut9Dxi2MXAdkpNR82TpFCLMF6TfCyZODPAp34RzYrn0mJJdJ3i1bcdD5kSha
         dDF/UpYIkueMMolmhPOxEFDUN53SdN6BELvA/tzjz9VnxsWTdT2jp0okNqZ/7vHCeQQQ
         aX96vFZlXgg5cJKYKyO6UObAcEJVnrkFNK8KQ0IGhy2GmiGAPm8EB6vtZG/9w/owqQbm
         YlAoH/Shl+XXcrFf7Vsewx4HMD7OQXS5fLnC3wATZNWWmrxwAF0PwkxLIdAOsfHQkOoe
         sNAw==
X-Gm-Message-State: AOJu0Yx8O9bpL8Jd25uLUqYe7RtS7dcSKnRydisRAGf5FLkgiNa2BL84
	q6zY9Gjh4mZyBUGxXD6M9CPZtqi9mktCkQut7wB1k00mLyzk833w2igPcLXAU3dX5+JMVbm86qa
	3eQgGMhmLuA==
X-Gm-Gg: ATEYQzw5dCAitAe9YGJsOdebXMfN4SKQoVuM1csdSGzBcNoxYkjvpkFIZR1Wn51L6yd
	30o4aQrn4oMdegPIDfbufsA5gkKfPTw5ZMRHj+X4RdnznnLT6Ea+yDqveXazFlPBhDOvjmAZXvI
	McHD97CD1ZC5e63XwcvXlukaMFFRQcaCLbyQFzI1ngavIf9l+FOIhjxko2EOSZZ+nsfUxo/gTB6
	qLiGWkuEos1vNjtfHBml36RH8Lr7dIRi/oIJSqjJ+olqGRLCyPiLD5q+1GMReWnO8+WrhEVdGls
	kOt+NHr8kJNdvzSmcon9S0kV600G+6sDHFJCwfBHLngpcMR42lF+BiWTTN8IIHOu0k4Le/9i7ek
	4dVVmGfJ9XYUGnMk1wYQWcwDhkF2MwJpRBBSSvV0aEJtl+5oc++Y0NcCXw5em0CY8ZXpWckQsBr
	2PUPSuPeHMpZFAypzXtJKdc1otvtbCLZ3lz9MXPlJx7cHpcLzt88AdDSAjRFpvdhBRAw9333uBD
	yfwoPfckvofm8IzHHqWDbPLZCdhbvh/Dg6Tn6eqEm/bQh2dBLxzrLBbQiFxpH8RLFhksA==
X-Received: by 2002:a17:906:490f:b0:b9b:151b:8601 with SMTP id a640c23a62f3a-b9b151b9254mr130891966b.5.1774525465725;
        Thu, 26 Mar 2026 04:44:25 -0700 (PDT)
Received: from adam.amarulasolutions.com (2001-1c00-8183-9900-dfb4-52e9-0b83-429b.cable.dynamic.v6.ziggo.nl. [2001:1c00:8183:9900:dfb4:52e9:b83:429b])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9b203c10b5sm102840366b.29.2026.03.26.04.44.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Mar 2026 04:44:25 -0700 (PDT)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: openembedded-core@lists.openembedded.org
Cc: Adam Duskett <adam.duskett@amarulasolutions.com>
Subject: [PATCH 1/1] libsolv: add fix for musl segfaults
Date: Thu, 26 Mar 2026 12:44:23 +0100
Message-ID: <20260326114423.271000-1-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 26 Mar 2026 11:44:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233979

By default, musl has a stack size of 128K, while the compress_buf
method uses 256KB of stack space, causing a segfault when the
repopagestore_compress_page method is called.

Pull request: https://github.com/openSUSE/libsolv/pull/612

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
---
 ...0001-compress_buf-fix-musl-segfaults.patch | 44 +++++++++++++++++++
 1 file changed, 44 insertions(+)
 create mode 100644 meta/recipes-extended/libsolv/libsolv/0001-compress_buf-fix-musl-segfaults.patch

diff --git a/meta/recipes-extended/libsolv/libsolv/0001-compress_buf-fix-musl-segfaults.patch b/meta/recipes-extended/libsolv/libsolv/0001-compress_buf-fix-musl-segfaults.patch
new file mode 100644
index 0000000000..cf87b3c4c6
--- /dev/null
+++ b/meta/recipes-extended/libsolv/libsolv/0001-compress_buf-fix-musl-segfaults.patch
@@ -0,0 +1,44 @@
+From 23e2d4c5064ddb023ed1a9d364793dbe0d20717f Mon Sep 17 00:00:00 2001
+From: Adam Duskett <adam.duskett@amarulasolutions.com>
+Date: Thu, 26 Mar 2026 12:11:42 +0100
+Subject: [PATCH] compress_buf: fix musl segfaults
+
+By default, musl has a stack size of 128K, while the compress_buf
+method uses 256KB of stack space!
+
+The easiest course of action is to add `static thread_local`
+to htab and hnext.
+
+Upstream-Status: Submitted [https://github.com/openSUSE/libsolv/pull/612]
+
+Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
+---
+ src/repopage.c | 5 +++--
+ 1 file changed, 3 insertions(+), 2 deletions(-)
+
+diff --git a/src/repopage.c b/src/repopage.c
+index 77c7fcc7..470e4f34 100644
+--- a/src/repopage.c
++++ b/src/repopage.c
+@@ -29,6 +29,7 @@
+ #include <assert.h>
+ #include <fcntl.h>
+ #include <time.h>
++#include <threads.h>
+ 
+ #ifdef _WIN32
+   #include <windows.h>
+@@ -100,8 +101,8 @@ compress_buf(const unsigned char *in, unsigned int in_len,
+   unsigned int oo = 0;		/* out-offset */
+   unsigned int io = 0;		/* in-offset */
+ #define HS (65536)
+-  Ref htab[HS];
+-  Ref hnext[BLOCK_SIZE];
++  static thread_local Ref htab[HS];
++  static thread_local Ref hnext[BLOCK_SIZE];
+   unsigned int litofs = 0;
+   memset(htab, -1, sizeof (htab));
+   memset(hnext, -1, sizeof (hnext));
+-- 
+2.53.0
+
-- 
2.53.0


