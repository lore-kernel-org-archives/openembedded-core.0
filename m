Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com [209.85.128.67])
 by mx.groups.io with SMTP id smtpd.web12.6956.1587651138087372090
 for <openembedded-core@lists.openembedded.org>;
 Thu, 23 Apr 2020 07:12:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=h3No/NkQ;
 spf=pass (domain: gmail.com, ip: 209.85.128.67, mailfrom: alex.kiernan@gmail.com)
Received: by mail-wm1-f67.google.com with SMTP id h2so6588642wmb.4
        for <openembedded-core@lists.openembedded.org>; Thu, 23 Apr 2020 07:12:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=WLs4SNQrgMTM2hjKrS0dkUgaK9VnGe3UbITljDOZH98=;
        b=h3No/NkQUwfy4lCPyWM4BhaTiC2Vau/dLqZrp+iS2lDgvMB0MlGXA0d3pN8kY0oxgA
         tPpNvAMRzU7p73y0G54GRgdM0WZvlR0bSGDarWAKGGXSsIzGjH1I99DZSdl/1MKFTZhu
         wZrs5uR8clgcCmZQjyl0jnVHfglCVghBVI8XH/bNMCbrWfoPOATyBUS0s5M2pEEuh0wC
         0nNVW7vT8NxT09bpFzo/zZ+AudTGRFIadfG2WPkHGtKf0XVz4wfkY1GzHvbtTpHAoVq9
         QAyK1a/ApAbcS1ly7pbnDVxReY2m7T6+UNtt80lk+UIze5PlX5m9cCCqHDJy4HpPOZHY
         Vitg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=WLs4SNQrgMTM2hjKrS0dkUgaK9VnGe3UbITljDOZH98=;
        b=aW4c/gJnY7PSuuhNXd7ga0Ga0aoPAZN3V7qybC98kDNvAuB9k9Cztl6npSIVut+0C6
         7VrW3QZ6VNdGlUazXHSiWZqCLHo/HbmXukZRrrRU3SFXMAAph0GLZ4yiB44rxd1JRM18
         Dxvm8FA3DXQPenBpeYlTiFe+dHNAfROck2brSTRamFDI7GBY33xW4i/7zKICeJyC7nzM
         bQObqU91jE0E0c52j5x1qH454W7zmZdf+OWISw3FHAv7QGM2my2tpeb12NIKfTxXSKjz
         ichDl6Pkb8C317gqyzOWIYMykgi9j3yS6z6LWI9RZ17p4ql1JbM/mK1JkvFO0O80Zmwx
         OLFg==
X-Gm-Message-State: AGi0PubH2gyKwUmtOB58MyBj2BDlPFVhTTEczcz9dS/vXQ0Br8fFD5Fw
	KFi58UvDb3T5QHadTiN2hlpNZ7IA
X-Google-Smtp-Source: APiQypITxGJ9MLRcW4R2KSfIakadkV8sPccaAxCb6bMM4iAjkN2JlN0PfZUEItP8NiTcLrWjNdW6Iw==
X-Received: by 2002:a7b:c181:: with SMTP id y1mr4628954wmi.83.1587651136050;
        Thu, 23 Apr 2020 07:12:16 -0700 (PDT)
Return-Path: <alex.kiernan@gmail.com>
Received: from localhost.localdomain (cust246-dsl91-135-6.idnet.net. [91.135.6.246])
        by smtp.gmail.com with ESMTPSA id a125sm3854726wme.3.2020.04.23.07.12.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Apr 2020 07:12:15 -0700 (PDT)
From: "Alex Kiernan" <alex.kiernan@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alex Kiernan <alex.kiernan@gmail.com>
Subject: [OE-Core][PATCH v2 3/6] rng-tools: Restrict rngd.service
Date: Thu, 23 Apr 2020 15:12:06 +0100
Message-Id: <20200423141209.82595-3-alex.kiernan@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200423141209.82595-1-alex.kiernan@gmail.com>
References: <20200423141209.82595-1-alex.kiernan@gmail.com>

Whilst rngd has to run as root, we can significantly constrain its
permissions (network is only required if nistbeacon is enabled).

Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
---

Changes in v2:
- fix network access

 .../rng-tools/rng-tools/rngd.service          | 19 +++++++++++++++++++
 .../rng-tools/rng-tools_6.9.bb                |  7 +++++++
 2 files changed, 26 insertions(+)

diff --git a/meta/recipes-support/rng-tools/rng-tools/rngd.service b/meta/recipes-support/rng-tools/rng-tools/rngd.service
index 084322ac40aa..0559b9799154 100644
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
+RestrictAddressFamilies=AF_UNIX
+RestrictNamespaces=yes
+RestrictRealtime=yes
+RestrictSUIDSGID=yes
+SystemCallArchitectures=native
+SystemCallErrorNumber=EPERM
+SystemCallFilter=@system-service
 
 [Install]
 WantedBy=sysinit.target
diff --git a/meta/recipes-support/rng-tools/rng-tools_6.9.bb b/meta/recipes-support/rng-tools/rng-tools_6.9.bb
index 913342c315de..8c98a9aa3ae2 100644
--- a/meta/recipes-support/rng-tools/rng-tools_6.9.bb
+++ b/meta/recipes-support/rng-tools/rng-tools_6.9.bb
@@ -49,4 +49,11 @@ do_install_append() {
         -e 's,@SBINDIR@,${sbindir},g' \
         ${D}${sysconfdir}/init.d/rng-tools \
         ${D}${systemd_system_unitdir}/rngd.service
+
+    if [ "${@bb.utils.contains('PACKAGECONFIG', 'nistbeacon', 'yes', 'no', d)}" = "yes" ]; then
+        sed -i \
+            -e '/^IPAddressDeny=any/d' \
+            -e '/^RestrictAddressFamilies=/ s/$/ AF_INET AF_INET6/' \
+            ${D}${systemd_system_unitdir}/rngd.service
+    fi
 }
-- 
2.17.1

