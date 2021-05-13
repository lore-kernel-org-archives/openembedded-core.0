Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
 by mx.groups.io with SMTP id smtpd.web12.177.1620939405917191639
 for <openembedded-core@lists.openembedded.org>;
 Thu, 13 May 2021 13:56:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=pAEQQfBW;
 spf=pass (domain: gmail.com, ip: 209.85.208.41, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f41.google.com with SMTP id s6so32390252edu.10
        for <openembedded-core@lists.openembedded.org>; Thu, 13 May 2021 13:56:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=lExu/ZVvJhet/V3BNlVtEoN+R6OvFWbZWfZK0T+cegA=;
        b=pAEQQfBWrP7A92pYcIpErpNWdr4i/3Ud0gVwbEnAv89e7MGMZ2CFE8KCeNsFc0T2Rg
         EXcPsaQLRPBVCWzhGhYxymvKyCZD04bqiOiTQMdeybTw+QyCJi4bYeVqpYPqZTfbEvNz
         1b4iYXjyC4mojKZ+Cx+q1rojOJd73vJtm+afrI/IqFmFETQkI1+7Dhj4XDZmtfPymp5n
         nSIuTgOA8qUbon0fe9weFuXsoSw35BJr0xi4bHGzx+f1786+YHVJkCWGc93SapmmxlBU
         5YjW94wllug5Xttr75PrjDmeUh6tTWko7nQXt5uFpHaRCKdgTvfz4hhMvGNMmGxGSq2j
         MH+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=lExu/ZVvJhet/V3BNlVtEoN+R6OvFWbZWfZK0T+cegA=;
        b=o/Wz2sSCEE3/0KMkaYHVSihAgJWCdR67BAEpMhDISC7UqcHXJvg0Bak/ZNpPb9bmiW
         kK/H40Edlcwr2Bl7XAIikydyJkiaULYLPMj4MiN4Mr+oD6WLCghSWfOUetlz8q5B5SOm
         lji/83iQKMkWtFxpQ5R/RX9Xaz3dP7B77jSr6Q14DSU5OxI/GZSaosoyHMqKENpoP7Bn
         0c5DD7T+e/o4Jcb8g8eJEceZ11ES11HC4ETOUZOi/4KKgIydAENzlNMrC4mPV94nyU/f
         /p+uZN2nuLwLZbyaigKnhaHUwYn9wG9YtXrrUO42l5wJlJV/qDSdgkL+6Xnpg/m5qabN
         Gj3w==
X-Gm-Message-State: AOAM530Vgc8QhRAOEBdwCxafgrmGUJb7S+40vYwQJFeaq6GF31rIWwAk
	V56bPB5MG8GaHHzoadwFcgjWH4bp+YU=
X-Google-Smtp-Source: ABdhPJyS7rHQTu2x+RgKDXwQ1GA/kk6KOcFPGXcy/7Dyjl0wZK045vCKc/XRpF8Qfshcgke1UPrnWA==
X-Received: by 2002:a50:fe8c:: with SMTP id d12mr53159284edt.336.1620939404506;
        Thu, 13 May 2021 13:56:44 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from localhost.localdomain ([2a02:2454:2a0:cb00:eb83:2e01:3dda:5d46])
        by smtp.gmail.com with ESMTPSA id y11sm2934768edd.91.2021.05.13.13.56.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 May 2021 13:56:44 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 6/8] nativesdk-meson: correctly set cpu_family
Date: Thu, 13 May 2021 22:56:20 +0200
Message-Id: <20210513205622.60879-6-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210513205622.60879-1-alex.kanavin@gmail.com>
References: <20210513205622.60879-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This was a warning before, but with the patch
that turns it into an error, it needs to be properly addressed.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../meson/nativesdk-meson_0.58.0.bb                | 14 ++------------
 1 file changed, 2 insertions(+), 12 deletions(-)

diff --git a/meta/recipes-devtools/meson/nativesdk-meson_0.58.0.bb b/meta/recipes-devtools/meson/nativesdk-meson_0.58.0.bb
index 8778cab124..74e1a7104a 100644
--- a/meta/recipes-devtools/meson/nativesdk-meson_0.58.0.bb
+++ b/meta/recipes-devtools/meson/nativesdk-meson_0.58.0.bb
@@ -1,21 +1,11 @@
 include meson.inc
 
-inherit siteinfo
+inherit meson-routines
 inherit nativesdk
 
 SRC_URI += "file://meson-setup.py \
             file://meson-wrapper"
 
-def meson_endian(prefix, d):
-    arch, os = d.getVar(prefix + "_ARCH"), d.getVar(prefix + "_OS")
-    sitedata = siteinfo_data_for_machine(arch, os, d)
-    if "endian-little" in sitedata:
-        return "little"
-    elif "endian-big" in sitedata:
-        return "big"
-    else:
-        bb.fatal("Cannot determine endianism for %s-%s" % (arch, os))
-
 # The cross file logic is similar but not identical to that in meson.bbclass,
 # since it's generating for an SDK rather than a cross-compile. Important
 # differences are:
@@ -44,7 +34,7 @@ sys_root = @OECORE_TARGET_SYSROOT
 
 [host_machine]
 system = '${SDK_OS}'
-cpu_family = '${SDK_ARCH}'
+cpu_family = '${@meson_cpu_family("SDK_ARCH", d)}'
 cpu = '${SDK_ARCH}'
 endian = '${@meson_endian("SDK", d)}'
 EOF
-- 
2.31.1

