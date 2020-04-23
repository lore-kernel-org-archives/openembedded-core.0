Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com [209.85.221.65])
 by mx.groups.io with SMTP id smtpd.web12.4002.1587639903350644247
 for <openembedded-core@lists.openembedded.org>;
 Thu, 23 Apr 2020 04:05:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=SGtdz+oI;
 spf=pass (domain: gmail.com, ip: 209.85.221.65, mailfrom: alex.kiernan@gmail.com)
Received: by mail-wr1-f65.google.com with SMTP id d17so6314265wrg.11
        for <openembedded-core@lists.openembedded.org>; Thu, 23 Apr 2020 04:05:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=WLs4SNQrgMTM2hjKrS0dkUgaK9VnGe3UbITljDOZH98=;
        b=SGtdz+oIUmdM7Q8+QnumJ7uT75v1R8MumpMcEEiGkkJ3xxAnoK6QpOefRIb1hQqK3h
         et19gQl2NBb9WEZ7qoppYrFQkp4vILv6uLr2rpoPIvL6g9RA2wWG5OYEQ24z6uE6DmfY
         6GvY+RCSbNbjEb59oyqaVCmoYVSTC2qNmUDi25+hZFoJ3MMZ76Qju2U4LSHHECmXAwoj
         K3D5eGfKyg7ABMAEKHshkN79mpk1Pkqtbazvg4xg/T1Hol29gXIV2CAQvCqDh+CwYGyu
         pxYpLJrAcHULPPODKC0JvgwN2fxkD9m7noOCe8SB+TZwV0SPF2vVKkezyOElrBcjBFmY
         JaAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=WLs4SNQrgMTM2hjKrS0dkUgaK9VnGe3UbITljDOZH98=;
        b=opYrhuxbGMAJ8KvxLMCAjugTn96kYiaKpoe3mRbwcuySAtwolmvxJ25fEt47rNtEzE
         PvEiP+Cv6ko6BqHGAek6+jQSYJeRwfD/fSa8iF8QDN8s2T7EuWdsvRsPvoM8kdx+kMu4
         7QOpan40gD9g7pz86PbX8yd6jh4ILCt9XXbzeKMKgZfLrLHI1jYvTRReGRsygpmoFLri
         IOAfCjfxNUvZ+9NZI9GHQ1eBOISsYcuZzqPGTAqE1u7BckJozcO6qUt/TToj9nU0ZJKy
         0CTvyk2HlSaWpKGVgn7ZGK57Rrxs9+IuEFBWXnd89ynvJQsfCBPL4CtsijBRpD5lfKen
         KkzA==
X-Gm-Message-State: AGi0PuaHGtnnJjJzVJ/tSbOxjYNnlrq0jjq1SIFGMS8R7AUngb6pdpV+
	A3qZk0cdihHVNBK1kL5k3rP1KPDi
X-Google-Smtp-Source: APiQypIS/NIp88ARO2ZgBZkAQAvQwXwof7kvAZ1Foei8z1WTNfUv8jr42TyFeCJ5webRbWuu6QIRWQ==
X-Received: by 2002:a5d:474b:: with SMTP id o11mr4268813wrs.391.1587639901354;
        Thu, 23 Apr 2020 04:05:01 -0700 (PDT)
Return-Path: <alex.kiernan@gmail.com>
Received: from localhost.localdomain (cust246-dsl91-135-6.idnet.net. [91.135.6.246])
        by smtp.gmail.com with ESMTPSA id c10sm2984842wru.48.2020.04.23.04.05.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Apr 2020 04:05:00 -0700 (PDT)
From: "Alex Kiernan" <alex.kiernan@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alex Kiernan <alex.kiernan@gmail.com>
Subject: [OE-Core][PATCH v2] rng-tools: Restrict rngd.service
Date: Thu, 23 Apr 2020 12:04:57 +0100
Message-Id: <20200423110457.81750-1-alex.kiernan@gmail.com>
X-Mailer: git-send-email 2.17.1

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

