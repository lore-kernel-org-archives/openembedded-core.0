Received: from mail-ed1-f65.google.com (mail-ed1-f65.google.com [209.85.208.65])
 by mx.groups.io with SMTP id smtpd.web10.13007.1602248302079847618
 for <openembedded-core@lists.openembedded.org>;
 Fri, 09 Oct 2020 05:58:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=kTL3zwoC;
 spf=pass (domain: gmail.com, ip: 209.85.208.65, mailfrom: martin.jansa@gmail.com)
Received: by mail-ed1-f65.google.com with SMTP id t20so2928674edr.11
        for <openembedded-core@lists.openembedded.org>; Fri, 09 Oct 2020 05:58:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=i1vb+ykgZv6jThkfPvTCfkbPUDT4C8NwRGKMetRAIKQ=;
        b=kTL3zwoCnkTZrM8zGBHikePkl0ftVorBNAIWoPUu+umOmh2w035WNBGpDekD3r1u29
         h/Uw3IEeUuwPAnBs+eYZKUa3OgTjry/wOijL6NBlI0RJ+FUFE9diYMO68iuPLP4FwX8V
         DVcNbq6epKmcfOn4O8Z9ELvnF2JraTGm4MKeH3FzpEKvYsr9JNDKQuMe6ftTxl6oi3os
         F0W4L1jX5V7d6QsCv313ROwetg94DqsKIzCZ1bTcpZlhZ8UG6bxNVWwP5HfOE3bWKCRv
         n4qgqEUwztR2HFFskkhTQ6j5tcXqLJLrLtSNNnVF9mDwyfMIrnKx2UV2wwn4pknTww89
         vsNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=i1vb+ykgZv6jThkfPvTCfkbPUDT4C8NwRGKMetRAIKQ=;
        b=be4JgWYTDUJp1vRQhw/NGfz9ET5hRDFlJO7cDBjmuV7V4v60Zl5cvqCgpaibh1DQk6
         Aj+mr1Y+10cdXWO4Wmi4wtKoOSSeyEryNlmvqWum8emlk+PdBq5kzLXlEvHcXpM4SQnD
         8pDiaHSWtu1F/QdhRs9v5vtkpXonxizb1fw+HJulZY0yqQXgNpVEWgQJyipETEPZlV4r
         E9mx2uoLhzprEOXiJTxOPSuYU663URoDU72zqNsCCpfF6w1ajmRiWPEvYg40dN5MwVlu
         CjJ7PJksnE/XWa0/YXU08VwBBWZ90PCGxCPZFp8cMRr0+g2S2iAQoWU+uHIigjLl/gmr
         cpZA==
X-Gm-Message-State: AOAM531INre25mABcaIjPSCo+iSM9p5AlurnrrILvcwg0GysmLpEv0fC
	jsZAKXzxPeUVlohVz83Rmw/W4q++Qac=
X-Google-Smtp-Source: ABdhPJz3I/RNA9orFgNyg+zVmnzWF8EC+neM9TJN1efa/eWFhqpUJkFyLjQVeUWiiy5O4ALFu3HuyQ==
X-Received: by 2002:a05:6402:21fd:: with SMTP id ce29mr4246272edb.383.1602248300147;
        Fri, 09 Oct 2020 05:58:20 -0700 (PDT)
Return-Path: <martin.jansa@gmail.com>
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id b6sm6651708edu.21.2020.10.09.05.58.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2020 05:58:18 -0700 (PDT)
From: "Martin Jansa" <Martin.Jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Martin Jansa <Martin.Jansa@gmail.com>
Subject: [PATCH 1/3] base.bbclass: use os.path.normpath instead of just comparing WORKDIR and S as strings
Date: Fri,  9 Oct 2020 14:58:12 +0200
Message-Id: <20201009125814.3035266-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

* cannot use os.path.samefile, because S/B might not exist at this time yet

* there is issue with PSEUDO_IGNORE_PATHS when some recipe sets e.g.
  S = "${WORKDIR}/"
  whole WORKDIR gets added to PSEUDO_IGNORE_PATHS and then the build
  can fail with various strange errors, in my case do_package was
  failing when do_package calls:
  fix_perms(.../1.0-r0/package/etc, 755, 0, 0, /etc)
  and fails with "[Errno 1] Operation not permitted:"

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/classes/base.bbclass | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/classes/base.bbclass b/meta/classes/base.bbclass
index 6309d709b8..62e34d0079 100644
--- a/meta/classes/base.bbclass
+++ b/meta/classes/base.bbclass
@@ -388,9 +388,9 @@ python () {
     oe.utils.features_backfill("DISTRO_FEATURES", d)
     oe.utils.features_backfill("MACHINE_FEATURES", d)
 
-    if d.getVar("WORKDIR") != d.getVar("S"):
+    if os.path.normpath(d.getVar("WORKDIR")) != os.path.normpath(d.getVar("S")):
         d.appendVar("PSEUDO_IGNORE_PATHS", ",${S}")
-    if d.getVar("WORKDIR") != d.getVar("B"):
+    if os.path.normpath(d.getVar("WORKDIR")) != os.path.normpath(d.getVar("B")):
         d.appendVar("PSEUDO_IGNORE_PATHS", ",${B}")
 
     # Handle PACKAGECONFIG
-- 
2.25.1

