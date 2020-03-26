Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.web10.32981.1585212882467965507
 for <openembedded-core@lists.openembedded.org>;
 Thu, 26 Mar 2020 01:54:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=IpFVeCwy;
 spf=pass (domain: gmail.com, ip: 209.85.221.44, mailfrom: alex.kiernan@gmail.com)
Received: by mail-wr1-f44.google.com with SMTP id d5so6729954wrn.2
        for <openembedded-core@lists.openembedded.org>; Thu, 26 Mar 2020 01:54:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=uCOe9PudQrw7akoS5KEDN8oD0L9ryzL58abFhf+zSTo=;
        b=IpFVeCwyPioyI6AOl9E3rNxnpg0GShmBfG+6QjYVfBKkcNtwlKWc+QJgOMZOfdaU5b
         q88F5SOI1NCt81djtdCG2/4pYOFSXFYi+T6ARmX4npwglE9EO468k1mHM764qay9Aplt
         RdM/Rj3sjo3VQes8IFRpuG2jU/6+3Owin8tY2s3gPY+o0+Bh3SqqUuRthB3tBMGTFvtq
         Ypx8LYCAym5oeXQSVrkUgqPpPJvFXNWprSDQbNznZmvEtSJrlkWYbHfCFdxCDCnFc5ub
         zeeHAPj98e7A+uerlCSPFMyltz4Qhyyiymi3gj4Q+q1elbURaXu5qQ0v4Np1jGMM6MPh
         UlMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=uCOe9PudQrw7akoS5KEDN8oD0L9ryzL58abFhf+zSTo=;
        b=CQib+xxLep+70b+9ldtfBax5woGKqXdXyn9unjQ1SOLRdIolqD91o+MuQySCO1jfeV
         XuPVaXeVwuPLGJ4EDryUdo0XKD/3aV4cqWhyNzs8UhaMM6hJp665i9I1414108MD1fuw
         W9SXdwBpcH+RN7/3woxOUX0UaUubB+dFBqoqWKF7TL4O9J8d7ITtJefEVfvn3sJ5lEGS
         XE9j5P0whYdwsWI5FTCEqr3Jd6HXh/iQzVC7hU0kN9lLDl1PCQVRN7C9MxZPsuB3qbBn
         Hi7yzOZ9FsjOs6emJNU1GZaLzTINbWD+vE4MWpxWq9Oz4azI+IvhV4YNvxkghAXaeKuI
         k9Dg==
X-Gm-Message-State: ANhLgQ0IITKI6ifwQdFcTkl5JVfMKWPOP8IoGOkKaYqhDhoDbpEpQ14I
	MN3VWti9w3qqu7/TatuDa3YgGaFf
X-Google-Smtp-Source: ADFU+vt8P/9QMfXDVNaDT4j6eghq0ilAY4lKu0Tp0PlXISPGFovWLDSdYBWpcjhheH2nZb8FNkmB/Q==
X-Received: by 2002:a5d:44d0:: with SMTP id z16mr7838885wrr.28.1585212880781;
        Thu, 26 Mar 2020 01:54:40 -0700 (PDT)
Return-Path: <alex.kiernan@gmail.com>
Received: from localhost.localdomain (cust246-dsl91-135-6.idnet.net. [91.135.6.246])
        by smtp.gmail.com with ESMTPSA id h26sm2484107wmb.19.2020.03.26.01.54.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Mar 2020 01:54:40 -0700 (PDT)
From: "Alex Kiernan" <alex.kiernan@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alex Kiernan <alex.kiernan@gmail.com>
Subject: [OE-Core][RFC PATCH 11/13] psplash: Set RemainAfterExit on systemd units
Date: Thu, 26 Mar 2020 08:54:24 +0000
Message-Id: <20200326085426.117209-12-alex.kiernan@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200326085426.117209-1-alex.kiernan@gmail.com>
References: <20200326085426.117209-1-alex.kiernan@gmail.com>

psplash is only expected to run during startup, but if any dependency is
pulled into a transaction and the unit is inactive, then it can be
restarted.

Set RemainAfterExit to ensure that the unit remains active and is not
gratuitously restarted.

Drop the nonexistent systemd-start.service from the unit.

Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
Acked-by: Otavio Salvador <otavio@ossystems.com.br>
---

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

