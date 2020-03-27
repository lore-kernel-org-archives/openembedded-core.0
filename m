Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com [209.85.221.65])
 by mx.groups.io with SMTP id smtpd.web10.17633.1585329936223932965
 for <openembedded-core@lists.openembedded.org>;
 Fri, 27 Mar 2020 10:25:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=lOEaT1Jl;
 spf=pass (domain: gmail.com, ip: 209.85.221.65, mailfrom: alex.kiernan@gmail.com)
Received: by mail-wr1-f65.google.com with SMTP id t7so12311690wrw.12
        for <openembedded-core@lists.openembedded.org>; Fri, 27 Mar 2020 10:25:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=ybddTn+jjiwDKN+fuP4YhPjb+btfb7UCueaYScqhp2Q=;
        b=lOEaT1JlrL+FWSNUZcDpSX3v3v+HA3ZL3Suylm2lT3ewDu8WbwKRYOzDJBgPWs4PVp
         XlEygG7plGPQ/UetJrdMDIP9IbocYKFf5j8bMgc0zEPUx04/AWWsVmvwnlHoFygOV+NE
         2z/bJTBWsCgC9J37SYR8c+NyR2lH95TCtOYcabdoCSDhQLwvzCzdqEXVhslMWufyPrrN
         ZbjgmR5agP6R9KD763uaNmbc44mA1Yhf7GRB4braWyNFkHdHDGzqu5bpKvZ5u5m8moa1
         23nRjnYWm45pgE1bImZv98XR9CpZWRo0tBOTgewPAqLeUr4+ON+nOWPce7X/ndDwA69R
         5bYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=ybddTn+jjiwDKN+fuP4YhPjb+btfb7UCueaYScqhp2Q=;
        b=koWDu4NwR0gjxBKN5MYzuH8jXXGT5gAiSEcHYzqr0i8BO4A1SuA4oy4OtA592pwi1v
         hwLx1iRu87VrHzwl8WXLM9apV2yQkhm2RlSCWm6FcGOFS3e5bT8EKA9JmNMI71BbougX
         vYa4strAyC7//c3y+Mk3DF6Lltv5mlDUB5vNILpouOGENcmhSuNU9sP8eNdJTGK+AvGI
         XH1wigA03dGsITGFu7XWIWwzjO3rGei8bv4ujgg7uOGxTxTEKvtg4/izXOfdJJJ6VxgK
         KJ+p877dx0wzK1+eH7rbLXXjTW8XeVk5m9BOQWV+Q96/Arovlln4NOppEKi40tHELbIi
         H21g==
X-Gm-Message-State: ANhLgQ1oh+sZ4FpU93QnqHl+X6hwfnB9+yiDN3A5i6eC/1BnoqmtbZOH
	inAx1SDbx9u9AWDc3yr6Gb48p/nW
X-Google-Smtp-Source: ADFU+vvspmJ6u3gRjUQYSUUvyTjZeQAIOnhLLUwWPcXyZFhr5MBSogFGNZD2Xzz2RoLumJIN91NYaA==
X-Received: by 2002:adf:dfce:: with SMTP id q14mr501694wrn.326.1585329934645;
        Fri, 27 Mar 2020 10:25:34 -0700 (PDT)
Return-Path: <alex.kiernan@gmail.com>
Received: from localhost.localdomain (cust246-dsl91-135-6.idnet.net. [91.135.6.246])
        by smtp.gmail.com with ESMTPSA id g186sm9281419wmg.36.2020.03.27.10.25.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Mar 2020 10:25:34 -0700 (PDT)
From: "Alex Kiernan" <alex.kiernan@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alex Kiernan <alex.kiernan@gmail.com>
Subject: [OE-Core][RFC PATCH v3 10/13] systemd: Enable acl based on DISTRO_FEATURES
Date: Fri, 27 Mar 2020 17:25:17 +0000
Message-Id: <20200327172520.62888-11-alex.kiernan@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200327172520.62888-1-alex.kiernan@gmail.com>
References: <20200327172520.62888-1-alex.kiernan@gmail.com>

Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
Acked-by: Otavio Salvador <otavio@ossystems.com.br>
---

Changes in v3: None
Changes in v2: None

 meta/recipes-core/systemd/systemd_244.3.bb | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/meta/recipes-core/systemd/systemd_244.3.bb b/meta/recipes-core/systemd/systemd_244.3.bb
index 8283f2cdc65f..a68597284eff 100644
--- a/meta/recipes-core/systemd/systemd_244.3.bb
+++ b/meta/recipes-core/systemd/systemd_244.3.bb
@@ -56,10 +56,9 @@ PAM_PLUGINS = " \
 "
 
 PACKAGECONFIG ??= " \
-    ${@bb.utils.filter('DISTRO_FEATURES', 'audit efi ldconfig pam selinux smack usrmerge polkit', d)} \
+    ${@bb.utils.filter('DISTRO_FEATURES', 'acl audit efi ldconfig pam selinux smack usrmerge polkit', d)} \
     ${@bb.utils.contains('DISTRO_FEATURES', 'wifi', 'rfkill', '', d)} \
     ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'xkbcommon', '', d)} \
-    acl \
     backlight \
     binfmt \
     gshadow \
-- 
2.17.1

