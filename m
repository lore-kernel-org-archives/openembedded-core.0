Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com [209.85.219.49])
 by mx.groups.io with SMTP id smtpd.web10.1769.1616180325134351534
 for <openembedded-core@lists.openembedded.org>;
 Fri, 19 Mar 2021 11:58:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=FGOlvyvs;
 spf=pass (domain: gmail.com, ip: 209.85.219.49, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qv1-f49.google.com with SMTP id x27so5572208qvd.2
        for <openembedded-core@lists.openembedded.org>; Fri, 19 Mar 2021 11:58:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=PYB3FXxT7zWLKF9pY4kl3468L3tsxLDG2sexAaG116A=;
        b=FGOlvyvs7dyRnd87eMLmN5veZZaNNehBvQNFiAtX58wgPfUd+YKGCnuRvyRvgI4I8M
         urNc7qxPRMEtOXrGPIll/1emQQqU7u7xKG2+QrL8mIIPws73VZQYkLjGn/gcjqe9xvop
         BR5ctn2QG1YD/Xa4SdqRY8aMhGP2cYJ6cOIL/vs+S0UzaGQniNdV4l0+d5UntmPgZPXT
         bceN/NnaLEXrVd9T+h/CdyVFf4np+TFD9+55u9eT0JafxqP0Jbes97LDdZGrtt+gRQ3G
         wdVVyzqiUREUlJyCSCjLUlt5lhHDZjVvmLlgt1SK7mYu9xcrAJ/hXfHRpIYOQ6kqRvZG
         AexQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=PYB3FXxT7zWLKF9pY4kl3468L3tsxLDG2sexAaG116A=;
        b=lk9Ghd6sigfcbThBNHJC43/NDO/jjuXMNjYLwwLgmXlp9QtEH39uIs/9lID0f6W7vi
         2ZvYDI3I9bMrhsCXWi2itlDFMOqWPEXVAx4e1KhNFjzHzLoibI/VBIBuSNzoCl2rYYvr
         NCUIXr24QjUVGGlarvZvNzq2HMnYnZoIi4vs9HRAyfUOvLPeUJjghopHav19I9m1m3Sb
         EuSMZt+NYJ+7GHMFgjHvXyYZ6cjS6pRJrjGSlaC3Ct2OZlPlHzq44u3APfZtyw9VmJJt
         vBQC1S1dQ0WazZbJghEZBlHGtJ8WbzAxf5JAtwuA9Ba8T2RCm6g5N8HjxHm+DL43D3RU
         6KXQ==
X-Gm-Message-State: AOAM532z/s2NVfb9V5MH6HQdjnmkR2ZWwJ48uaByMYbGUI4Ok0NzUlaH
	NSSz6UQsBI1F2xXPMP/ucQ4=
X-Google-Smtp-Source: ABdhPJylDBI28bFL4FUiLNr2LHcz3h4Bu1demCQqxEELDGOJIz5P/YkWQftOMTjd9tz7No4x3aupoA==
X-Received: by 2002:a05:6214:d4b:: with SMTP id 11mr10806525qvr.42.1616180323723;
        Fri, 19 Mar 2021 11:58:43 -0700 (PDT)
Return-Path: <bruce.ashfield@gmail.com>
Received: from build.lan (cpe04d4c4975b80-cmf4c11490699b.cpe.net.cable.rogers.com. [174.112.159.151])
        by smtp.gmail.com with ESMTPSA id j1sm4402191qti.55.2021.03.19.11.58.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Mar 2021 11:58:43 -0700 (PDT)
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 5/8] kern-tools: add dropped options to audit output
Date: Fri, 19 Mar 2021 14:58:34 -0400
Message-Id: <4cdaa9c6d433a297a29af810236d9999d3d2154a.1616180065.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <cover.1616180065.git.bruce.ashfield@gmail.com>
References: <cover.1616180065.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bruce Ashfield <bruce.ashfield@gmail.com>

The rewrite of the configuration audit code dropped the ability to
generate warnings for configuration options that didn't make it into
the final .config.

We integrated the following commit to restore those warnings:

    symbol_why: classify based on config.queue hints

    The config.queue has typing hints inline with each fragment,
    we should be using them to further classify the options, and
    not only relying on the special hardware.cfg, etc, files that
    are part of the meta data

    We also should be checking for options that were set to a
    non 'no' value, and that don't make it into the final .config,
    since without that check it means we are missing some warnings.

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 meta/recipes-kernel/kern-tools/kern-tools-native_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb b/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb
index 1d900d85fa..2c76fbae2d 100644
--- a/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb
+++ b/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb
@@ -8,7 +8,7 @@ LIC_FILES_CHKSUM = "file://tools/kgit;beginline=5;endline=9;md5=9c30e971d435e249
 
 DEPENDS = "git-native"
 
-SRCREV = "8f6aaab7f64c6de30d267e31a73f7c3bb30125a9"
+SRCREV = "1c2fa6c4ecb9fdc3b5b495845141a424b59db33f"
 PR = "r12"
 PV = "0.2+git${SRCPV}"
 
-- 
2.19.1

