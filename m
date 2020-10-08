Received: from mail-oi1-f180.google.com (mail-oi1-f180.google.com [209.85.167.180])
 by mx.groups.io with SMTP id smtpd.web12.11940.1602163437232235327
 for <openembedded-core@lists.openembedded.org>;
 Thu, 08 Oct 2020 06:23:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=W64kU3E+;
 spf=pass (domain: gmail.com, ip: 209.85.167.180, mailfrom: jpewhacker@gmail.com)
Received: by mail-oi1-f180.google.com with SMTP id m7so6301746oie.0
        for <openembedded-core@lists.openembedded.org>; Thu, 08 Oct 2020 06:23:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=8yJj0zOBO87dXPCnVXlV3aUx5UJiqcvx7BaaN8ATLpk=;
        b=W64kU3E+dNLmLknWVMyNydVJgk7BlgYbsmGakT+D4HCK44M9d75apyUZFHz6DI7d8Q
         kpIE8aY3I7Q60fSZyN9n9MZ/gHm2MQNz2KdF4X4kJ38+edflSdLJF2Lzu+K8HOXYL9L4
         JbfbjvsKCJZhGxReB0OshShKvTFsg1C84qUVf93OLOlnOKF9RfGg3AhKfG+lQvBJKXlT
         HH+2V6czHCNw8117oy2p45IWz5/vSQXoY3fw2l9z2RJafswMn4sUgfEbS16DdmV6ut/f
         9UIskgAyxkn3cNB9uUXrr5FjQWuYWQ0Cx4SCIsSWYKTQs/vbRhlcBOZEBxoWHR2r19VF
         8NEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=8yJj0zOBO87dXPCnVXlV3aUx5UJiqcvx7BaaN8ATLpk=;
        b=adzj2E9j3b7fKBNBE6pnMm6Y7urbS8p14yxf5b+MWpjxxl0Mi+AAhJrI2moyOW8dNQ
         xZNteWS/93ksuEdQFODs4aYLVxKfaMMEc9qAoAySyqLNtbsCHP9Oh0JFykyYY5CrtYBi
         +nP+LiAIfO8iAyDp4Kj8LFTFO2rWsL/MK2ZxBgyWgkLGP0uOP/HgB9smWo7pHH8tmdPC
         U0OX5O7iww2FPmV3GmBjDBpFUIoKLGjarHtFW3EQBtRz6wI9gH1F0hhKRZkq8SpiDEvE
         TJeukmJGxDLnrnCkNGrqXKjhOv+H+Rg0rkNchG4BgoFDdS+fZXIaVwKhOGipAdiDnzAE
         nfaQ==
X-Gm-Message-State: AOAM532u/m14IpDXXHxExce4q9+q15A7D3YjOFcjTEWcGeDqRkQfaeZU
	APklDJbV2yYLcRh/fcrNkfOzf21N0jw=
X-Google-Smtp-Source: ABdhPJwd7q4e6f4E/108ks017GhmBMurux+yumb56f6+svfeTNy3vdu7N1LrzI4FHqX0HNB4Eh4vow==
X-Received: by 2002:aca:d17:: with SMTP id 23mr5269572oin.9.1602163436178;
        Thu, 08 Oct 2020 06:23:56 -0700 (PDT)
Return-Path: <jpewhacker@gmail.com>
Received: from localhost.localdomain ([2605:a601:ac3d:c100:e3e8:d9:3a56:e27d])
        by smtp.gmail.com with ESMTPSA id a22sm4639467oie.13.2020.10.08.06.23.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2020 06:23:55 -0700 (PDT)
From: "Joshua Watt" <JPEWhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Joshua Watt <JPEWhacker@gmail.com>
Subject: [OE-core][PATCH] classes/waf: Add build and install arguments
Date: Thu,  8 Oct 2020 08:23:50 -0500
Message-Id: <20201008132350.1143-1-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Adds variables that can be used to allow a recipe to pass extra
arguments to `waf build` and `waf install`. In most cases, you want to
pass the same arguments to `build` and `install` (since install is a
superset of `build`), so by default setting EXTRA_OEWAF_BUILD also
affects `waf install`, but this can be overridded.

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 meta/classes/waf.bbclass | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/meta/classes/waf.bbclass b/meta/classes/waf.bbclass
index 900244004e..309f625a40 100644
--- a/meta/classes/waf.bbclass
+++ b/meta/classes/waf.bbclass
@@ -5,6 +5,11 @@ B = "${WORKDIR}/build"
 
 EXTRA_OECONF_append = " ${PACKAGECONFIG_CONFARGS}"
 
+EXTRA_OEWAF_BUILD ??= ""
+# In most cases, you want to pass the same arguments to `waf build` and `waf
+# install`, but you can override it if necessary
+EXTRA_OEWAF_INSTALL ??= "${EXTRA_OEWAF_BUILD}"
+
 def waflock_hash(d):
     # Calculates the hash used for the waf lock file. This should include
     # all of the user controllable inputs passed to waf configure. Note
@@ -55,11 +60,11 @@ waf_do_configure() {
 
 do_compile[progress] = "outof:^\[\s*(\d+)/\s*(\d+)\]\s+"
 waf_do_compile()  {
-	(cd ${S} && ./waf build ${@oe.utils.parallel_make_argument(d, '-j%d', limit=64)})
+	(cd ${S} && ./waf build ${@oe.utils.parallel_make_argument(d, '-j%d', limit=64)} ${EXTRA_OEWAF_BUILD})
 }
 
 waf_do_install() {
-	(cd ${S} && ./waf install --destdir=${D})
+	(cd ${S} && ./waf install --destdir=${D} ${EXTRA_OEWAF_INSTALL})
 }
 
 EXPORT_FUNCTIONS do_configure do_compile do_install
-- 
2.28.0

