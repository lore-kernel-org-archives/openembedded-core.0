Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com [209.85.221.65])
 by mx.groups.io with SMTP id smtpd.web12.17623.1585329937397154271
 for <openembedded-core@lists.openembedded.org>;
 Fri, 27 Mar 2020 10:25:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=QsWXjKB5;
 spf=pass (domain: gmail.com, ip: 209.85.221.65, mailfrom: alex.kiernan@gmail.com)
Received: by mail-wr1-f65.google.com with SMTP id t7so12311765wrw.12
        for <openembedded-core@lists.openembedded.org>; Fri, 27 Mar 2020 10:25:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=OouSeP/rM02+5BGj0OE1o+Y0WYI6oPDKtudJDyJo6FI=;
        b=QsWXjKB5rYkvIAiQMZqVs7g+1XPL5grBPovPqFfvmUlTxs5XVM+JHv6Lspd+U87333
         D3/mWvUJvV0jPMppU63iHt4GjCeqgkFy+38kRmJfv36U3S3x9KhtcW9VdUzv/LvWII2T
         8iye38Mb6xpAXqot8MEnEvSN4bqe8uR9M7e6uG4NjdLoZT1PtKRbYC1L/UpNEHFugRqQ
         o8pAfvWWE+tX3egZGmUfsr5VxafAXqRwGhy9RO9oTtadWvgIqKUzllnERBZXOuXARC1L
         Bed2z++WhpVYBFIOeRrc2Ob7PkGkCYrRSfGdvbvw8Yy7uZrHOxP1azwgafk7i9rIFrZe
         9xBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=OouSeP/rM02+5BGj0OE1o+Y0WYI6oPDKtudJDyJo6FI=;
        b=AWsJCSFlwm7GRekLXGKatroDKLOO7RaGHqsrs1lIxOsFmSrnfCL24g7zz6EI58sNB5
         6w9P88rSP1lmGvF7IVjienso8en6xHY7V8bA78vrD32gp/bCUQwhU7uyxDUkhJ84KGVg
         PxvNqzqHFpO7qYaytWqVYwz+GW2Dbt9zq1+Nune0EmB45CsJsrsH4TP6hbKqhtHpChJR
         pPwJw38F9awxug8KuB1S4KRv4sQRt80nrTZeby20nLxuz4bhiSUuHq+L1OGcmOciYg9s
         r+Ns805qmoiy380HzgVF1RusdGxbdF+8Fy2KvV/R/+Yo84UZ0oHiF0+h9Ev8tdXCklgu
         4v4A==
X-Gm-Message-State: ANhLgQ2fHXz6Rhm705gbktpGYwD1rocYtANBiBB9o17S3TnXptHyg7qp
	qtZSQ4kez0wxlmjDi4sJXqKn0J2c
X-Google-Smtp-Source: ADFU+vvYkImhMur6l4WR+wAPM4fjLKIaZfH+VibYXFqPsw0Aoj6+50eYTsym9WCY3t9Wbv3BpHQycg==
X-Received: by 2002:a5d:6044:: with SMTP id j4mr462044wrt.232.1585329935681;
        Fri, 27 Mar 2020 10:25:35 -0700 (PDT)
Return-Path: <alex.kiernan@gmail.com>
Received: from localhost.localdomain (cust246-dsl91-135-6.idnet.net. [91.135.6.246])
        by smtp.gmail.com with ESMTPSA id g186sm9281419wmg.36.2020.03.27.10.25.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Mar 2020 10:25:35 -0700 (PDT)
From: "Alex Kiernan" <alex.kiernan@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alex Kiernan <alex.kiernan@gmail.com>
Subject: [OE-Core][RFC PATCH v3 11/13] psplash: Set RemainAfterExit on systemd units
Date: Fri, 27 Mar 2020 17:25:18 +0000
Message-Id: <20200327172520.62888-12-alex.kiernan@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200327172520.62888-1-alex.kiernan@gmail.com>
References: <20200327172520.62888-1-alex.kiernan@gmail.com>

psplash is only expected to run during startup, but if any dependency is
pulled into a transaction and the unit is inactive, then it can be
restarted.

Set RemainAfterExit to ensure that the unit remains active and is not
gratuitously restarted.

Drop the nonexistent systemd-start.service from the unit.

Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
Acked-by: Otavio Salvador <otavio@ossystems.com.br>
---

Changes in v3: None
Changes in v2: None

 meta/recipes-core/psplash/files/psplash-start.service   | 1 +
 meta/recipes-core/psplash/files/psplash-systemd.service | 2 +-
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-core/psplash/files/psplash-start.service b/meta/recipes-core/psplash/files/psplash-start.service
index a8c97c7a7576..36c2bb38e072 100644
--- a/meta/recipes-core/psplash/files/psplash-start.service
+++ b/meta/recipes-core/psplash/files/psplash-start.service
@@ -6,6 +6,7 @@ RequiresMountsFor=/run
 [Service]
 Type=notify
 ExecStart=/usr/bin/psplash
+RemainAfterExit=yes
 
 [Install]
 WantedBy=sysinit.target
diff --git a/meta/recipes-core/psplash/files/psplash-systemd.service b/meta/recipes-core/psplash/files/psplash-systemd.service
index 4e18980bb271..082207f2324a 100644
--- a/meta/recipes-core/psplash/files/psplash-systemd.service
+++ b/meta/recipes-core/psplash/files/psplash-systemd.service
@@ -1,13 +1,13 @@
 [Unit]
 Description=Start psplash-systemd progress communication helper
 DefaultDependencies=no
-After=systemd-start.service
 After=psplash-start.service
 Requires=psplash-start.service
 RequiresMountsFor=/run
 
 [Service]
 ExecStart=/usr/bin/psplash-systemd
+RemainAfterExit=yes
 
 [Install]
 WantedBy=sysinit.target
-- 
2.17.1

