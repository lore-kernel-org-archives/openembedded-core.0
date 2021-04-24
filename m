Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
 by mx.groups.io with SMTP id smtpd.web08.337.1619279805496255193
 for <openembedded-core@lists.openembedded.org>;
 Sat, 24 Apr 2021 08:56:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=W0rr6Lrx;
 spf=pass (domain: gmail.com, ip: 209.85.215.180, mailfrom: akuster808@gmail.com)
Received: by mail-pg1-f180.google.com with SMTP id f29so103550pgm.8
        for <openembedded-core@lists.openembedded.org>; Sat, 24 Apr 2021 08:56:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=pRF5ObUcQIPXrFl3G7+OMN6GR5B6lZnQKWU4TNHbMHk=;
        b=W0rr6LrxxLkGQqfTcbaRtAQ4yg+OQhM96+DOFgx89Yoi61IU+ZNWLoyA3guTtI8nsg
         9Zz/999xnHp11SfMdqljRE/JXBDp5P9vHbljPqxJIV8ZyiSV37yZZYDlh9l9YVwKiMlJ
         g1vHO2BGSJYqrKdRdWAntNwmB+i33y6Z4L7ZK77IseoorLlsA18QaofiurrbSgaKjNLY
         mTYuNpEYcZtnrJ+0WLrqua/LZykuVbjLm1ZLZ7KP4e1PuinJqrnJx4V9C2coP2LsQ+G8
         96fkmpq/v91TeFWUq1mZjaYMBcbWTcOCXbsiYZExMVh55nq1lag8JcPIt4S0KDDdcJE/
         OoQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=pRF5ObUcQIPXrFl3G7+OMN6GR5B6lZnQKWU4TNHbMHk=;
        b=P7vkbv9igcVMFNdB9dxe+XEAhhL2qrWfkJ3lbO7ZhoVmohAZDSI1CfVfowO78iwjt4
         QOQTdB0NCqgSl0VQcV/xX5M8LV2G4Fz0TF5g8tjLrpfF+l58zI5IUt/lrepIzHPh2Nj1
         2QXIYzlUFbmsSnuUaPFROqpVUzzl6pq/p66+ldtOF463BkjxF41LxXBcSt7gvvUnnTWY
         X+cO/FRJHv81sjVx/passrVU8gJyPkQPNNgxC7dUYxKTM1dUlUPD/YuJfrDJ6G74BFws
         6Me09LE/G2WbZUUyvAaJWq0mJyPCtueGrh3mq5vDOvsTv57/JcvLw/Ene0EsrIGLaUyK
         7afQ==
X-Gm-Message-State: AOAM531eeK5aC1ds7OypOdM+U+48x6eFCmiUNfkRj2UT32vWxYsOs0WE
	+tgS2LKB0pAX57EA0pDlpmFde86u2L/VbQ==
X-Google-Smtp-Source: ABdhPJwp7tTnYEaR5qU/9GfT4suvTpxvUdLvRTfOTBx3AUNJOeD4HIg7OUFrvqFCbrtVpZ66loSYiA==
X-Received: by 2002:a62:2904:0:b029:25c:13f2:47d4 with SMTP id p4-20020a6229040000b029025c13f247d4mr9323445pfp.4.1619279804879;
        Sat, 24 Apr 2021 08:56:44 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from hilo.hsdl.ca.comcast.net (c-67-181-203-136.hsd1.ca.comcast.net. [67.181.203.136])
        by smtp.gmail.com with ESMTPSA id a20sm7198299pfi.138.2021.04.24.08.56.44
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Apr 2021 08:56:44 -0700 (PDT)
From: "Armin Kuster" <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 4/6] systemd: Enable seccomp if FEATURE is set
Date: Sat, 24 Apr 2021 15:56:37 +0000
Message-Id: <20210424155639.1131482-5-akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210424155639.1131482-1-akuster808@gmail.com>
References: <20210424155639.1131482-1-akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/recipes-core/systemd/systemd_247.6.bb | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/meta/recipes-core/systemd/systemd_247.6.bb b/meta/recipes-core/systemd/systemd_247.6.bb
index 32afa159ec3..ce6ac7ebaa0 100644
--- a/meta/recipes-core/systemd/systemd_247.6.bb
+++ b/meta/recipes-core/systemd/systemd_247.6.bb
@@ -65,7 +65,7 @@ PAM_PLUGINS = " \
 "
 
 PACKAGECONFIG ??= " \
-    ${@bb.utils.filter('DISTRO_FEATURES', 'acl audit efi ldconfig pam selinux smack usrmerge polkit', d)} \
+    ${@bb.utils.filter('DISTRO_FEATURES', 'acl audit efi ldconfig pam selinux smack usrmerge polkit seccomp', d)} \
     ${@bb.utils.contains('DISTRO_FEATURES', 'wifi', 'rfkill', '', d)} \
     ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'xkbcommon', '', d)} \
     backlight \
@@ -177,7 +177,6 @@ PACKAGECONFIG[quotacheck] = "-Dquotacheck=true,-Dquotacheck=false"
 PACKAGECONFIG[randomseed] = "-Drandomseed=true,-Drandomseed=false"
 PACKAGECONFIG[resolved] = "-Dresolve=true,-Dresolve=false"
 PACKAGECONFIG[rfkill] = "-Drfkill=true,-Drfkill=false"
-# libseccomp is found in meta-security
 PACKAGECONFIG[seccomp] = "-Dseccomp=true,-Dseccomp=false,libseccomp"
 PACKAGECONFIG[selinux] = "-Dselinux=true,-Dselinux=false,libselinux,initscripts-sushell"
 PACKAGECONFIG[smack] = "-Dsmack=true,-Dsmack=false"
-- 
2.25.1

