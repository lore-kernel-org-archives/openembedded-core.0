Received: from mail-qt1-f195.google.com (mail-qt1-f195.google.com [209.85.160.195])
 by mx.groups.io with SMTP id smtpd.web10.1336.1592340461731602503
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Jun 2020 13:47:41 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: gmail.com, ip: 209.85.160.195, mailfrom: otavio.salvador@gmail.com)
Received: by mail-qt1-f195.google.com with SMTP id e16so16693627qtg.0
        for <openembedded-core@lists.openembedded.org>; Tue, 16 Jun 2020 13:47:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:organization:content-transfer-encoding;
        bh=6RpM/D0wa5eV8mprbXrjCkmcj4BYK+331ftfWZsrUXk=;
        b=kELBzh7Bd2g6O0jqa72TuJNDtjNJyFc8SgvRC+o84vuMls8XTIeu1zoByqA4QU38Of
         2fYqRqCvBVxCTFdQg8QrpQA3vGPG74KmBWRUsUjFZZXJHYiLZNHa3WFTB2PMKfLA3nPt
         WXs+6b0ehOiur9bgZk9BLTpd0mh950R0clGLKpydWrVYz9qgnw410MIW6IQGue2TqYz2
         RjWRmNU6rzzR6X+LK8YIl/OTSWpeKclw7j+goZ6xWYvPtyM9ykzcke6nKUgV+894F5XQ
         5YdtepLeP8gNC4jYLoVU/1v9RJ5IRhPyecYVQ0JGnMZ/Y44BdCVFQd7l83UKPy8XkhVB
         6PGA==
X-Gm-Message-State: AOAM530n9W4aVMJLKL93jJ8Pizv4vFW5gYKOuUShqLjXXKsBq032nec5
	0oCp0mP8DhlmI46/e+kxQGSm8Wi5bjs=
X-Google-Smtp-Source: ABdhPJyYu3ZKIOdTuEJPeHFS1pRz6p1ZhP+xpl/FZ9un0zWWs1xfHhT9TUDkR+DmwvEyJxy0teZc+g==
X-Received: by 2002:ac8:4143:: with SMTP id e3mr22369146qtm.28.1592340460621;
        Tue, 16 Jun 2020 13:47:40 -0700 (PDT)
Return-Path: <otavio.salvador@gmail.com>
Received: from localhost ([181.220.84.90])
        by smtp.gmail.com with ESMTPSA id n130sm14742773qke.77.2020.06.16.13.47.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jun 2020 13:47:39 -0700 (PDT)
From: "Otavio Salvador" <otavio.salvador@gmail.com>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Cc: Otavio Salvador <otavio.salvador@gmail.com>,
	Otavio Salvador <otavio@ossystems.com.br>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [dunfell-backport PATCH 2/3] systemd: Sync systemd-serialgetty@.service with upstream
Date: Tue, 16 Jun 2020 17:47:24 -0300
Message-Id: <20200616204726.2332101-2-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200616204726.2332101-1-otavio@ossystems.com.br>
References: <20200616204726.2332101-1-otavio@ossystems.com.br>
MIME-Version: 1.0
Organization: O.S. Systems Software LTDA.
Content-Transfer-Encoding: 8bit

From: Otavio Salvador <otavio.salvador@gmail.com>

The systemd upstream has been doing some improvements in the service
which were not in sync, with the forked file. Mainly:

 - Use BindsTo to bind the service with the required serial device
 - Add of getty-pre.target as dependency so we can run things before
   getty@.service and serial-getty@.service
 - Add conflicts to rescue to avoid issues with sulogin

We did not change the ExecStart and Environment fields so we don't have
side effects of this change.

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 63bbff61b78c651339c4b18d8376187379ec3b3c)
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

