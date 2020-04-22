Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.web10.2131.1587563543553998559
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Apr 2020 06:52:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=tw8BL8P/;
 spf=pass (domain: gmail.com, ip: 209.85.221.47, mailfrom: alex.kiernan@gmail.com)
Received: by mail-wr1-f47.google.com with SMTP id k13so2490580wrw.7
        for <openembedded-core@lists.openembedded.org>; Wed, 22 Apr 2020 06:52:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=N3czqbx1GjwcJT36K2pJNyDX3N7VhTuY6QdioBhsW24=;
        b=tw8BL8P/S643xx/ocExfc6RlCdgMmh4RobSKUFKBGS8NVzRgtWmWnyxfm0EsnRqFAk
         GM06MOY4eiEmZtN1c/EbGxUBvarpMzNIv/fJVB+uZVF8sVbJ86bRhkZz1pNkBCHgWtR0
         yeTXAWGtoHk442LXPeWyYIjxkphyJaeVcmaoV5bNinR4D0lcxiClVRiLIsHASBk95ixj
         +kAEYjytBNkO96jjEUrTMCw0QhvCtiyCRfwD0HxhEp8iXb5+rShoElxG8v9YakmSM/pc
         sksGwnfB3RC6fngJjaO6C7Ci4Cjj2Aqe5qDAYIB/NxqT4SaF/2372k//W0/dnwcycBsa
         dBrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=N3czqbx1GjwcJT36K2pJNyDX3N7VhTuY6QdioBhsW24=;
        b=RTha3UzwfiiRrVM5zmiqFiukwp71PyPmTAZfMuUl7Xev7A0wbYzhwwsTF5ojptZ/F+
         L9yOcfLsI1fJZpW77eDCaMm2tGAoIe7quosC7oIGYiXiHybjLzFlYU79vzDkPL7LZvG7
         G2Ox11Os12rZxgGutVwcMjmch3tIn8IIsYGABHwxbMKsubRQHXNDShiFmoozxXb5xiig
         QQsSmdz7X44CgMpYKmo2JOszOjGQAr5LorDHayL8YJ5Q7e2DuP004ce0pfcEz0ctY/Xu
         36VSipASyDcO2le9OTAwONrxQ6Qq9L1bfb7JDDHIs51uOW9my8Lpo6Q88N9a6OPp/htD
         L4Uw==
X-Gm-Message-State: AGi0PuaoywHpcSubVrD9GgXFDPD5Jc1wHJ8IQGR4LSPFCcwlsIeulUM+
	ARfO0xBKbPhzgyrhUYtEQOn+CyvN
X-Google-Smtp-Source: APiQypI9N+4EgfYlYLpWeljvEyryGhCpFDZJuuHr7fCPFwSPBvpRqP/7kIbz1mw4Hus67N3xV1NJNA==
X-Received: by 2002:a5d:5147:: with SMTP id u7mr28954743wrt.290.1587563541669;
        Wed, 22 Apr 2020 06:52:21 -0700 (PDT)
Return-Path: <alex.kiernan@gmail.com>
Received: from localhost.localdomain (cust246-dsl91-135-6.idnet.net. [91.135.6.246])
        by smtp.gmail.com with ESMTPSA id d7sm8155846wrn.78.2020.04.22.06.52.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Apr 2020 06:52:20 -0700 (PDT)
From: "Alex Kiernan" <alex.kiernan@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alex Kiernan <alex.kiernan@gmail.com>
Subject: [OE-Core][PATCH 3/6] rng-tools: Restrict rngd.service
Date: Wed, 22 Apr 2020 14:52:08 +0100
Message-Id: <20200422135211.121292-3-alex.kiernan@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200422135211.121292-1-alex.kiernan@gmail.com>
References: <20200422135211.121292-1-alex.kiernan@gmail.com>

Whilst rngd has to run as root, we can significantly constrain its
permissions (AF_INET AF_INET6 are only required if nistbeacon is
enabled).

Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
---

 .../rng-tools/rng-tools/rngd.service          | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/meta/recipes-support/rng-tools/rng-tools/rngd.service b/meta/recipes-support/rng-tools/rng-tools/rngd.service
index 084322ac40aa..604e9500665e 100644
--- a/meta/recipes-support/rng-tools/rng-tools/rngd.service
+++ b/meta/recipes-support/rng-tools/rng-tools/rngd.service
@@ -8,6 +8,25 @@ Conflicts=shutdown.target
 [Service]
 EnvironmentFile=-@SYSCONFDIR@/default/rng-tools
 ExecStart=@SBINDIR@/rngd -f $EXTRA_ARGS
+CapabilityBoundingSet=CAP_SYS_ADMIN
+IPAddressDeny=any
+LockPersonality=yes
+MemoryDenyWriteExecute=yes
+NoNewPrivileges=yes
+PrivateTmp=yes
+ProtectControlGroups=yes
+ProtectHome=yes
+ProtectHostname=yes
+ProtectKernelModules=yes
+ProtectKernelLogs=yes
+ProtectSystem=strict
+RestrictAddressFamilies=AF_UNIX AF_INET AF_INET6
+RestrictNamespaces=yes
+RestrictRealtime=yes
+RestrictSUIDSGID=yes
+SystemCallArchitectures=native
+SystemCallErrorNumber=EPERM
+SystemCallFilter=@system-service
 
 [Install]
 WantedBy=sysinit.target
-- 
2.17.1

