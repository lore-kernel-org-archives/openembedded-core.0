Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3A40F88072
	for <webhook@archiver.kernel.org>; Thu, 16 Apr 2026 06:48:31 +0000 (UTC)
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com [209.85.221.66])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7572.1776322103926353249
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Apr 2026 23:48:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=ZBDsHByl;
 spf=pass (domain: smile.fr, ip: 209.85.221.66, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f66.google.com with SMTP id ffacd0b85a97d-43d6fbd0954so3445609f8f.1
        for <openembedded-core@lists.openembedded.org>; Wed, 15 Apr 2026 23:48:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1776322102; x=1776926902; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WaYkrZqYD3QKvU1M3QQz1qp/jXduDv3dzKI5FWKlIdw=;
        b=ZBDsHBylGiysHYjP8JE0rblyoKXAaf8B3pNuQ94agK5TqKhs9HUcd4Ms9idOzGR6dS
         vjtgUhL8RmSVAT0oHWKp2slDVuo7wQwEnllCnctghO1xDYWDUb45QCwAlb90ZjgDlcTy
         8MEjew81EM40wXylp46VJwlkkblv1PWgj+Tz4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776322102; x=1776926902;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=WaYkrZqYD3QKvU1M3QQz1qp/jXduDv3dzKI5FWKlIdw=;
        b=pm6s7GjG/bUn70DateTCGmNVUqvJP7BAoraZbRERHkZ/gTK0MMlaDyA1jUJpkWNFzS
         xaU3JIyQcP6sM8Ki5U3mjolBV4nrpqR7PqAmTOhciIVqSl2CnWhyXMtBWOtZKYuGvNIG
         dgDjIJKdMX4yz8OJuhlmdTfjXbLadvHU3gIbE7eVgTAcmFWxu91CpIMzOl0EQ68sV7J0
         8s55xSLr36zLIy6mbGBv3AFZq8/Tg+aj8V7GirGbPmrKpMwozaG9167DE8mKySGz6Zpb
         5GJZazxd4HxrQmgYBnlZy0Z4ZM7aXGN3qOz5lYFPtZYWLJoGnnwaW4XMGrfG9PYGpL9Q
         1mZQ==
X-Gm-Message-State: AOJu0YxCxfab623YGt+R0NK/GVpgNPFtvOLmhGrNqgS8eaTpPb920Auv
	OuPQABnwe9NOVf8w2IN1nBtB3yP7bGakGn+lfbOOHl20IfI68th9rN9bdgeu/KypHFau1x414qN
	JkyNvkz9mm4fF
X-Gm-Gg: AeBDies3YQnKlsTCsEYxzDX5LfkHGNwrLfebmbpafullc9mjCi5e+OcHxbBfzbFQ4vb
	KHrfCHh399NEAULbnIgFXI9y+EgVVVub8Gq/IUt4wT/LI0ehuxbplsQcN05cOxE28x8NjgGJhnD
	eHB+iurGsAtSKjPyCVxcsri2JgP0MCBc5eecHD0NDmQRTmaj01EbADpCuVU/UzyjpScAQINlBYG
	vi0K6lFMow2CJWDi5vH2FJl1ozZRY3LrHH+zrEIJGEvS0MMkb8URJO4fXfhGsjKdEMt6CuUQ/P8
	Ad7oHC3WAShTpUzuGGArUt+3LSiHFIKl5NCuaYYjHoR/1J1aIAOi+UKE53tehuR5hy1TAcFMuY8
	peNOS/OEo3Ur+haKUw644yHG+KJw4bphfCZsxusH57jseIBPRLLmjMaF+E7CGDS23VHhfKevuME
	2loRecyJV/tPsXZMdiVQZr5qah7QWmI0GVg/6/S3WReBG2/KytQhoLSBWYbOcSLhD1q/Ydcpaak
	B60i7Pn+vAwVYjtLJrsMhwuvowZp2TgHzj2LA==
X-Received: by 2002:a05:6000:288c:b0:43e:ab21:3697 with SMTP id ffacd0b85a97d-43eab2136bemr9178207f8f.29.1776322101724;
        Wed, 15 Apr 2026 23:48:21 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43ead3d5ea9sm11200017f8f.21.2026.04.15.23.48.21
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Apr 2026 23:48:21 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][whinlatter 07/47] sqlite3: Fix CVE-2025-70873
Date: Thu, 16 Apr 2026 08:47:08 +0200
Message-ID: <57de3882a93f624caf6d72391f896d6e317da44d.1776321810.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1776321810.git.yoann.congal@smile.fr>
References: <cover.1776321810.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 16 Apr 2026 06:48:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235349

From: Vijay Anusuri <vanusuri@mvista.com>

Pick patch as per [1]

[1] https://sqlite.org/src/info/3d459f1fb1bd1b5e
[2] https://sqlite.org/forum/forumpost/761eac3c82
[3] https://gist.github.com/cnwangjihe/f496393f30f5ecec5b18c8f5ab072054

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../sqlite/files/CVE-2025-70873.patch         | 33 +++++++++++++++++++
 meta/recipes-support/sqlite/sqlite3_3.48.0.bb |  1 +
 2 files changed, 34 insertions(+)
 create mode 100644 meta/recipes-support/sqlite/files/CVE-2025-70873.patch

diff --git a/meta/recipes-support/sqlite/files/CVE-2025-70873.patch b/meta/recipes-support/sqlite/files/CVE-2025-70873.patch
new file mode 100644
index 00000000000..5c8c429a157
--- /dev/null
+++ b/meta/recipes-support/sqlite/files/CVE-2025-70873.patch
@@ -0,0 +1,33 @@
+From 5a05c59d4d75c03f23d5fb70feac9f789954bf8a Mon Sep 17 00:00:00 2001
+From: drh <>
+Date: Sat, 6 Dec 2025 20:41:24 +0000
+Subject: [PATCH] In the zipfile extension, only return as many bytes as
+ Inflate actually generated.  [forum:/forumpost/761eac3c82|Forum post
+ 761eac3c82]. Adjust ./configure so that it builds zipfile into testfixture if
+ ZLIB is available, so that tests get run on unix platforms.
+
+FossilOrigin-Name: 3d459f1fb1bd1b5e723629c463ab392af7b206ece3388bda216c6a4c26160909
+
+Upstream-Status: Backport [https://github.com/sqlite/sqlite/commit/5a05c59d4d75c03f23d5fb70feac9f789954bf8a]
+CVE: CVE-2025-70873
+Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
+---
+ shell.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/shell.c b/shell.c
+index ca26f8a..a3f7898 100644
+--- a/shell.c
++++ b/shell.c
+@@ -11141,7 +11141,7 @@ static void zipfileInflate(
+       if( err!=Z_STREAM_END ){
+         zipfileCtxErrorMsg(pCtx, "inflate() failed (%d)", err);
+       }else{
+-        sqlite3_result_blob(pCtx, aRes, nOut, zipfileFree);
++        sqlite3_result_blob(pCtx, aRes, (int)str.total_out, zipfileFree);
+         aRes = 0;
+       }
+     }
+-- 
+2.43.0
+
diff --git a/meta/recipes-support/sqlite/sqlite3_3.48.0.bb b/meta/recipes-support/sqlite/sqlite3_3.48.0.bb
index c9ff062255f..df261bdbf86 100644
--- a/meta/recipes-support/sqlite/sqlite3_3.48.0.bb
+++ b/meta/recipes-support/sqlite/sqlite3_3.48.0.bb
@@ -6,6 +6,7 @@ LIC_FILES_CHKSUM = "file://sqlite3.h;endline=11;md5=786d3dc581eff03f4fd9e4a77ed0
 SRC_URI = "http://www.sqlite.org/2025/sqlite-autoconf-${SQLITE_PV}.tar.gz \
            file://CVE-2025-3277.patch \
            file://CVE-2025-6965.patch \
+           file://CVE-2025-70873.patch \
 "
 SRC_URI[sha256sum] = "ac992f7fca3989de7ed1fe99c16363f848794c8c32a158dafd4eb927a2e02fd5"
 

