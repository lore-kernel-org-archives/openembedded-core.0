Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0598CC433F5
	for <webhook@archiver.kernel.org>; Thu, 24 Feb 2022 15:03:14 +0000 (UTC)
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com
 [209.85.218.46])
 by mx.groups.io with SMTP id smtpd.web10.11341.1645714993262056324
 for <openembedded-core@lists.openembedded.org>;
 Thu, 24 Feb 2022 07:03:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=RXqNyDH/;
 spf=pass (domain: gmail.com, ip: 209.85.218.46,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f46.google.com with SMTP id a8so4946369ejc.8
        for <openembedded-core@lists.openembedded.org>;
 Thu, 24 Feb 2022 07:03:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Krp3x8lm8FZG+9vk/AKSMipPtcDLYmKJxDMCkvmF2BE=;
        b=RXqNyDH/4gmaW7sWx9EryqUM9YOE0cx8Dg0lrF0Mlv8RZ/SAZaLmCqeTAZcJ0cltp9
         2rwZicwAWyy1mQgvsW9gWCcdl6cOgUCfy4ymSPhzCgvMR/fLc/gISBakfoo6QdVw7e1A
         m46Alo/KdbGWx2EDWVsiwdGcCOMTHmGL8qRve1gIiHoiuHikaWQqcdLZ5Wj74kbXcvBD
         8czyxumgAzpmobvbVQPGmOD9ERye2Szqy+ly67I+xQOwCfy6c51LeVznRStNsO9fSAbO
         /4Aau3gWpzTi5+/Ndgv0eo/2dPbzKrnETO4ySkApOFLdvoaYNN6RoWnkEHhs0CxxgHhX
         vPug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Krp3x8lm8FZG+9vk/AKSMipPtcDLYmKJxDMCkvmF2BE=;
        b=ZESQZuOLZ9mr4e2fMpkgTy36YaH/auyaTYphNoFoeBGwTFRN/PXY1/+gxEUrR6ArVj
         NZM7Z7+NKssGVE/6S4YURX5SmSm7D/vn9FzkoN8wG+K3W/i9AVdSkqb+AA9KZb43SsNB
         S0Qsd0JnWQ8D7TK7AajsrvpUtbKNw4uaSJBCXHA4WHcaa6EexXJxwpIe9tlq5Rz3IJ0k
         vKqYtq42MZUlC9CulH/a65cnPJnUMeJ91rk1sOv/0HuhR8guh8SvdNBOZkeeW7aQc/xe
         sucGvMrNx8t4bL44InzetJE5yg9nd0qv8hfPwMTSyUZQ+L2QBFghg8ThlG2qhQT4VltU
         GhTA==
X-Gm-Message-State: AOAM531AkhT25B7poGj3seyQtw3Nj40G+xzHetTFSO/4gZG9bpHwTptx
	4qASFemh9r0Qm9TdXA4n/zz9qO5m93s=
X-Google-Smtp-Source: 
 ABdhPJzso8l6YjQvq+mR069+xfDvsyJdBVcJH10wpest+QInxZkVDqF8m+sHjJSNigIwoBaDMzborQ==
X-Received: by 2002:a17:906:940d:b0:6d0:ee09:6b66 with SMTP id
 q13-20020a170906940d00b006d0ee096b66mr2600778ejx.19.1645714991576;
        Thu, 24 Feb 2022 07:03:11 -0800 (PST)
Received: from nereus.lab.linutronix.de.
 (ip-109-090-143-203.um36.pools.vodafone-ip.de. [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 z12sm1573173edb.77.2022.02.24.07.03.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Feb 2022 07:03:11 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 1/3] base/staging: use HOST_PREFIX, not TARGET_PREFIX
Date: Thu, 24 Feb 2022 16:03:00 +0100
Message-Id: <20220224150302.1341776-2-alex@linutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20220224150302.1341776-1-alex@linutronix.de>
References: <20220224150302.1341776-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 24 Feb 2022 15:03:14 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162316

This matters when cross-compiling a cross-toolchain:
we need to specify the system where the toolchain
will run, not the system it will produce output for.

For everything else, HOST and TARGET are the same.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/classes/base.bbclass    | 2 +-
 meta/classes/staging.bbclass | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/classes/base.bbclass b/meta/classes/base.bbclass
index 227f1f5a75..af00b35ca4 100644
--- a/meta/classes/base.bbclass
+++ b/meta/classes/base.bbclass
@@ -71,7 +71,7 @@ def get_base_dep(d):
         return ""
     return "${BASE_DEFAULT_DEPS}"
 
-BASE_DEFAULT_DEPS = "virtual/${TARGET_PREFIX}gcc virtual/${TARGET_PREFIX}compilerlibs virtual/libc"
+BASE_DEFAULT_DEPS = "virtual/${HOST_PREFIX}gcc virtual/${HOST_PREFIX}compilerlibs virtual/libc"
 
 BASEDEPENDS = ""
 BASEDEPENDS:class-target = "${@get_base_dep(d)}"
diff --git a/meta/classes/staging.bbclass b/meta/classes/staging.bbclass
index 65499283da..ab827766be 100644
--- a/meta/classes/staging.bbclass
+++ b/meta/classes/staging.bbclass
@@ -119,8 +119,8 @@ do_populate_sysroot[vardeps] += "${SYSROOT_PREPROCESS_FUNCS}"
 do_populate_sysroot[vardepsexclude] += "BB_MULTI_PROVIDER_ALLOWED"
 
 POPULATESYSROOTDEPS = ""
-POPULATESYSROOTDEPS:class-target = "virtual/${MLPREFIX}${TARGET_PREFIX}binutils:do_populate_sysroot"
-POPULATESYSROOTDEPS:class-nativesdk = "virtual/${TARGET_PREFIX}binutils-crosssdk:do_populate_sysroot"
+POPULATESYSROOTDEPS:class-target = "virtual/${MLPREFIX}${HOST_PREFIX}binutils:do_populate_sysroot"
+POPULATESYSROOTDEPS:class-nativesdk = "virtual/${HOST_PREFIX}binutils-crosssdk:do_populate_sysroot"
 do_populate_sysroot[depends] += "${POPULATESYSROOTDEPS}"
 
 SSTATETASKS += "do_populate_sysroot"
-- 
2.20.1


