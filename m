Received: from mail-qk1-f194.google.com (mail-qk1-f194.google.com [209.85.222.194])
 by mx.groups.io with SMTP id smtpd.web12.25368.1591983055597839901
 for <openembedded-core@lists.openembedded.org>;
 Fri, 12 Jun 2020 10:30:55 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: gmail.com, ip: 209.85.222.194, mailfrom: otavio.salvador@gmail.com)
Received: by mail-qk1-f194.google.com with SMTP id b27so9722915qka.4
        for <openembedded-core@lists.openembedded.org>; Fri, 12 Jun 2020 10:30:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :organization:content-transfer-encoding;
        bh=SGiJv9c7tfC6Ui+i9kBhiWp7ITpPcdpxKSKjx6+d9m4=;
        b=raZKjKRFPD5wUfmDnfxYHDYYykF/ekVCMxNZqUalt80TGmZ2OR31jJnCw/PQCeHF8B
         0/+smAHXEajS04mdccryiX+PwUPPtsIwfzyOk/jbePytcKNHP3CExmGQcWX/EXs1nSlx
         2QO75l7+lUg/2VXrb51s3tGNvKDoPdrNmIUX+ebnF3UJ1A2O4KqdkTtTPKivIZECTtCf
         B78S/y/ZVs87eoz8wE1NhnTj0JM4GS83p1wU2DpSUHolWAlzp506XOVEHVrIuIkTmn/U
         y//slAopW4dkhCoTjaMRZrqJVSVrhpnLRuz8YQFAkPpaQU3Zln+Uopi047QASy6zHwnM
         jRRQ==
X-Gm-Message-State: AOAM533YDpmL1TzgUNP1UsR7gKP2DJtiYF3v0Rg4f05TG9vIQxF8A6Gd
	Iid1Nb4NGmmkmEcWEiBTGH7KlrSXdOE=
X-Google-Smtp-Source: ABdhPJxfykn6baUCDKwPX0zwHMzZrOlYN69lQ/DWJzQOb8XH3juL8vTugRhfHH9hJrqHnuipNVQQqQ==
X-Received: by 2002:a37:6188:: with SMTP id v130mr4175273qkb.138.1591983054429;
        Fri, 12 Jun 2020 10:30:54 -0700 (PDT)
Return-Path: <otavio.salvador@gmail.com>
Received: from localhost ([181.220.84.90])
        by smtp.gmail.com with ESMTPSA id w13sm4972691qkb.91.2020.06.12.10.30.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jun 2020 10:30:53 -0700 (PDT)
From: "Otavio Salvador" <otavio.salvador@gmail.com>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH] systemd: Sync systemd-serialgetty@.service with upstream
Date: Fri, 12 Jun 2020 14:30:44 -0300
Message-Id: <20200612173044.102664-1-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Organization: O.S. Systems Software LTDA.
Content-Transfer-Encoding: 8bit

The systemd upstream has been doing some improvements in the service
which were not in sync, with the forked file. Mainly:

 - Use BindsTo to bind the service with the required serial device
 - Add of getty-pre.target as dependency so we can run things before
   getty@.service and serial-getty@.service
 - Add conflicts to rescue to avoid issues with sulogin

We did not change the ExecStart and Environment fields so we don't have
side effects of this change.

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---

 .../systemd-serialgetty/serial-getty@.service      | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-core/systemd/systemd-serialgetty/serial-getty@.service b/meta/recipes-core/systemd/systemd-serialgetty/serial-getty@.service
index 15af16a9f8..542b905795 100644
--- a/meta/recipes-core/systemd/systemd-serialgetty/serial-getty@.service
+++ b/meta/recipes-core/systemd/systemd-serialgetty/serial-getty@.service
@@ -1,3 +1,5 @@
+#  SPDX-License-Identifier: LGPL-2.1+
+#
 #  This file is part of systemd.
 #
 #  systemd is free software; you can redistribute it and/or modify it
@@ -9,9 +11,8 @@
 Description=Serial Getty on %I
 Documentation=man:agetty(8) man:systemd-getty-generator(8)
 Documentation=http://0pointer.de/blog/projects/serial-console.html
-PartOf=dev-%i.device
-ConditionPathExists=/dev/%i
-After=dev-%i.device systemd-user-sessions.service plymouth-quit-wait.service
+BindsTo=dev-%i.device
+After=dev-%i.device systemd-user-sessions.service plymouth-quit-wait.service getty-pre.target
 After=rc-local.service
 
 # If additional gettys are spawned during boot then we should make
@@ -20,12 +21,17 @@ After=rc-local.service
 Before=getty.target
 IgnoreOnIsolate=yes
 
+# IgnoreOnIsolate causes issues with sulogin, if someone isolates
+# rescue.target or starts rescue.service from multi-user.target or
+# graphical.target.
+Conflicts=rescue.service
+Before=rescue.service
+
 [Service]
 Environment="TERM=xterm"
 ExecStart=-/sbin/agetty -8 -L %I @BAUDRATE@ $TERM
 Type=idle
 Restart=always
-RestartSec=0
 UtmpIdentifier=%I
 TTYPath=/dev/%I
 TTYReset=yes
-- 
2.27.0

