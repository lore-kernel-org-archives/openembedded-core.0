Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.web10.17630.1585329934313613806
 for <openembedded-core@lists.openembedded.org>;
 Fri, 27 Mar 2020 10:25:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=avpGa8BJ;
 spf=pass (domain: gmail.com, ip: 209.85.128.47, mailfrom: alex.kiernan@gmail.com)
Received: by mail-wm1-f47.google.com with SMTP id a81so13222201wmf.5
        for <openembedded-core@lists.openembedded.org>; Fri, 27 Mar 2020 10:25:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=CKoDETPJSX/CEEKHbytCE9+MWDMkBcxoW6xpBFgTQyA=;
        b=avpGa8BJzjjtA74u1mYx32mxSYv5gsanFHRf07Z4wBw7/gdGf4vHJbZvJaPCSq5Rbm
         Y81NxeyqSVFx0K0bEndK1EYKBAFrPDuTCygbIZglBEFI7AuyLXYUhnmregcCVNPKzY9R
         G3rq/y3OatRCD/znpVgCVdtIryzypkNtWj3Ba8GM1kZ11wqRFPozq7Oxnv90n683D119
         +fLdkqNgRlitWe7NcILPkGlLLqno4RvJTEd+beAb6xFA5cRwP65WDWMB/TdnBs3p82cG
         aJnggWRDrsGl7ZSFQZYEISabW9ZJF0tzAZ2dTP+vygZYkqS9byAlXNq4YBb7a9zbWkpC
         vCcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=CKoDETPJSX/CEEKHbytCE9+MWDMkBcxoW6xpBFgTQyA=;
        b=XU+zmz3FAv58UsfnB60SZT84ceYik1fll2tMJI1BBm3nY7CiHgpO4mEmMvp9kUAK8m
         7YTz+i3o/Ynkjhwt6cWaxY2Cry/U6hVZDJkMl7VLmWBRCwx8lzE7MIMNlLkyrHeDIYzv
         Vx9OMOiJOk08U7yZp2/kt36esTFz2VQ/sZ6WyXodeX2SSdMW+EWAocMy5UXdtGe/k5oL
         mCcI0x77R+9LwOP2/1y8RDYanbTn39iM5416rTveTt9qJAH3A/BmIzeaEYu6Kc9oEzCX
         BP5izY3+WN3fkB3xsxtZBByDiGkkMKBI2ASQgEFu/2U3GA2SQdbehk4wREo8c72AW8Qn
         WS2A==
X-Gm-Message-State: ANhLgQ03sRrZfKgldn83idJM88rKiSpBmoHnsN5fSwN3tv5t2iKPF1wL
	Bb8tMvgtUajN6vUehbUB1GSz0Zbx
X-Google-Smtp-Source: ADFU+vsmsPcZP0UYoHUQluXBfIBEXtlwLv4lbOEi5RHXz1R5do8OUXxSqNy8Zw0y82hi+98181CUHQ==
X-Received: by 2002:a05:600c:21da:: with SMTP id x26mr249677wmj.47.1585329932573;
        Fri, 27 Mar 2020 10:25:32 -0700 (PDT)
Return-Path: <alex.kiernan@gmail.com>
Received: from localhost.localdomain (cust246-dsl91-135-6.idnet.net. [91.135.6.246])
        by smtp.gmail.com with ESMTPSA id g186sm9281419wmg.36.2020.03.27.10.25.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Mar 2020 10:25:32 -0700 (PDT)
From: "Alex Kiernan" <alex.kiernan@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alex Kiernan <alex.kiernan@gmail.com>
Subject: [OE-Core][RFC PATCH v3 08/13] systemd: Enable smack based on DISTRO_FEATURES
Date: Fri, 27 Mar 2020 17:25:15 +0000
Message-Id: <20200327172520.62888-9-alex.kiernan@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200327172520.62888-1-alex.kiernan@gmail.com>
References: <20200327172520.62888-1-alex.kiernan@gmail.com>

Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
Acked-by: Otavio Salvador <otavio@ossystems.com.br>
---

Changes in v3: None
Changes in v2: None

 meta/recipes-core/systemd/systemd_244.3.bb | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/meta/recipes-core/systemd/systemd_244.3.bb b/meta/recipes-core/systemd/systemd_244.3.bb
index a0d65237bc7d..38c5b9ed9127 100644
--- a/meta/recipes-core/systemd/systemd_244.3.bb
+++ b/meta/recipes-core/systemd/systemd_244.3.bb
@@ -56,7 +56,7 @@ PAM_PLUGINS = " \
 "
 
 PACKAGECONFIG ??= " \
-    ${@bb.utils.filter('DISTRO_FEATURES', 'efi ldconfig pam selinux usrmerge polkit', d)} \
+    ${@bb.utils.filter('DISTRO_FEATURES', 'efi ldconfig pam selinux smack usrmerge polkit', d)} \
     ${@bb.utils.contains('DISTRO_FEATURES', 'wifi', 'rfkill', '', d)} \
     ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'xkbcommon', '', d)} \
     acl \
@@ -80,7 +80,6 @@ PACKAGECONFIG ??= " \
     randomseed \
     resolved \
     set-time-epoch \
-    smack \
     sysusers \
     sysvinit \
     timedated \
@@ -98,7 +97,6 @@ PACKAGECONFIG_remove_libc-musl = " \
     nss \
     nss-mymachines \
     nss-resolve \
-    smack \
     sysusers \
     utmp \
 "
-- 
2.17.1

