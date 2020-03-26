Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.web10.32980.1585212878948868245
 for <openembedded-core@lists.openembedded.org>;
 Thu, 26 Mar 2020 01:54:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=dw5Y3NP5;
 spf=pass (domain: gmail.com, ip: 209.85.221.42, mailfrom: alex.kiernan@gmail.com)
Received: by mail-wr1-f42.google.com with SMTP id 31so6697728wrs.3
        for <openembedded-core@lists.openembedded.org>; Thu, 26 Mar 2020 01:54:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=KGAaXE8QOSL7DtkEVFAwZqXMTObz1SScX5djqDFbinc=;
        b=dw5Y3NP586DpSi4N3Yhdhl2Qa92uXFkPJAmqlhb4sbY9Nj8tbJ5f3pg81WrQGrOmq5
         kkmGlnF0ylGgAeUFILkkjBMaxEWHX9zr0ARE4zddz8cH2T2PTCtJu+oUYB1s0oWWQd1J
         KEdMSiWfWDwEthuqVSqUThBF5DtTsm1zVLp1JxADGNdtmPOjI85OE880h/yVdRvpWVVX
         pYinzZ7UrIq/ykWgi8QsnCNzNxkyntZGf0cu5i6sWa/YOr8uc+N6qnA6DLLUqziqyIud
         Ce5O9G1swVJydemE7wC0z17XIkxDyeHcZQ38q7Q/QInl7EZ4vy7YyIJp11XbFl1iNgae
         A47w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=KGAaXE8QOSL7DtkEVFAwZqXMTObz1SScX5djqDFbinc=;
        b=HjcIt18zs+ZNUc/OmdeIDHdyhGFRxPoNBwIv8wweYfBzDg6Jdtgj9+9JOd7kcGjxnb
         LWrFgPo/GSKejk6+EutDrIVBY5SQefTmTj6YCjlkhn+Dun073UWQXZIB9rJtF4zI3qB7
         8GSKjR+oWKoOU1Ih/y7gmu1lQuStjqDMmJO3krkEUyuTchX/VBi9UuFL1wCSTnhbhLIS
         E16wBaP3Yirx1HdX05Jtzlo0lMHR7pMynFuO2wFCkX7YgiLhZ05BegkSJITcRhm9bV+p
         KgZUKrbxtHQwkB2NaOnLrpQKj2cWilfxvfulB79GpwzUz+uy+2x5/ZlpjhVMGycqfwQo
         UJ9Q==
X-Gm-Message-State: ANhLgQ3UhfkEC+ESpHDirSIj6gBoPeRU2yDPvkfP1poKQBB6bR9VeOTb
	IqTjmppwC+X36zNKgikOS+T29dFd
X-Google-Smtp-Source: ADFU+vspaJsd6JOqIZM9SFtAXj4egrr9ZnBhFe9UPtzqGJcgbs5EfnXGDTarc86mb8ETR0rW8x5t7Q==
X-Received: by 2002:a05:6000:10d1:: with SMTP id b17mr8433775wrx.360.1585212877304;
        Thu, 26 Mar 2020 01:54:37 -0700 (PDT)
Return-Path: <alex.kiernan@gmail.com>
Received: from localhost.localdomain (cust246-dsl91-135-6.idnet.net. [91.135.6.246])
        by smtp.gmail.com with ESMTPSA id h26sm2484107wmb.19.2020.03.26.01.54.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Mar 2020 01:54:36 -0700 (PDT)
From: "Alex Kiernan" <alex.kiernan@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alex Kiernan <alex.kiernan@gmail.com>
Subject: [OE-Core][RFC PATCH 08/13] systemd: Enable smack based on DISTRO_FEATURES
Date: Thu, 26 Mar 2020 08:54:21 +0000
Message-Id: <20200326085426.117209-9-alex.kiernan@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200326085426.117209-1-alex.kiernan@gmail.com>
References: <20200326085426.117209-1-alex.kiernan@gmail.com>

Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
Acked-by: Otavio Salvador <otavio@ossystems.com.br>
---

Changes in v2: None

 meta/recipes-core/systemd/systemd_244.3.bb | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/meta/recipes-core/systemd/systemd_244.3.bb b/meta/recipes-core/systemd/systemd_244.3.bb
index db41791cdf24..d398cdef18a4 100644
--- a/meta/recipes-core/systemd/systemd_244.3.bb
+++ b/meta/recipes-core/systemd/systemd_244.3.bb
@@ -56,7 +56,7 @@ PAM_PLUGINS = " \
 "
 
 PACKAGECONFIG ??= " \
-    ${@bb.utils.filter('DISTRO_FEATURES', 'efi ldconfig pam selinux sysvinit usrmerge polkit', d)} \
+    ${@bb.utils.filter('DISTRO_FEATURES', 'efi ldconfig pam selinux smack sysvinit usrmerge polkit', d)} \
     ${@bb.utils.contains('DISTRO_FEATURES', 'wifi', 'rfkill', '', d)} \
     ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'xkbcommon', '', d)} \
     acl \
@@ -80,7 +80,6 @@ PACKAGECONFIG ??= " \
     randomseed \
     resolved \
     set-time-epoch \
-    smack \
     sysusers \
     timedated \
     timesyncd \
@@ -97,7 +96,6 @@ PACKAGECONFIG_remove_libc-musl = " \
     nss \
     nss-mymachines \
     nss-resolve \
-    smack \
     sysusers \
     utmp \
 "
-- 
2.17.1

