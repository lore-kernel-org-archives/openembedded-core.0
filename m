Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.web11.29996.1629982827550853161
 for <openembedded-core@lists.openembedded.org>;
 Thu, 26 Aug 2021 06:00:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=ZVc6Zywz;
 spf=pass (domain: gmail.com, ip: 209.85.221.45, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f45.google.com with SMTP id n5so4876519wro.12
        for <openembedded-core@lists.openembedded.org>; Thu, 26 Aug 2021 06:00:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=nzFFPM3kAKjSfl9ItwGEjd0XB9l2S40wleMJtOxTHnY=;
        b=ZVc6ZywzSC9BpqhEzwzKaZ0O8kY6ASFR1lRZEAPuH/aMaEydvNUE0iG9Iu+uinhFEh
         VGpfttiTj08Hrbo6srC8iyfj41TXSDJqEEaydquKHbXIrFBRx17Q+oiBydds3/ftWnJu
         XKl/O4DGm8gIj9vUtzIWoVMyyYlnyFlQt/933FyWwd2e6UaDwrB5vxHTd7F2RbdGwunP
         n0N+1UpEqvsYBpoYt1WioMDI2zxNq35q12tNZ8L4sGHmCJRVn9zCxWpw1yj8Cwy02iZU
         FSaK858mL+UYXSp4nlZvDYBatTLAZ42BmmXCGoZyfX9g89P/ACeGBvLTtY0Aybp5GDiP
         T59A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=nzFFPM3kAKjSfl9ItwGEjd0XB9l2S40wleMJtOxTHnY=;
        b=CZTWAbH/EV+S8756/OVTSnHGfMHSr4xrSKcsmV/GWW7dk9JFprUVj0Ppy1TbDWc6Gs
         TDneY1+YQa10NWy43HC8Z3ukVEc3inAVgYJOyzCm35Pd9DFgWF8bbawj6s+mv135RfbO
         Kew4Flg0BywD3pcEpHA18agnky4ILLXKrHNc0qLTQNrpB95DNqQa68iX/29jx5CfpDpJ
         l3UnxMq8rxl30/VH443yNIzdrZmWmHo0aPcEDqulXFAkj+R+K+sYRQtFEbOaXRBdWmhM
         HRCTdACc6MDhfBkpxiBMR6ZCFKfA9pQqZC0IfiZc2k2Z/Mox8v8EzT1TlSdpSKyj/gVv
         89zg==
X-Gm-Message-State: AOAM532Ggf+h9Z9Kmuw2KlwpfeieMe/AG1QNJacSfFKdECnQDbdm/7Te
	3uXyBZ6aYNIfX109M+Tzb5W7Maaqmg46Iw==
X-Google-Smtp-Source: ABdhPJxelZiRjHNymSGeuOGCpTt4xHD78mjmQ8y2B7HfJ2zl2INNES7+Hk5qOo+7B+1XT3ALPabZ1A==
X-Received: by 2002:a5d:58e9:: with SMTP id f9mr3934873wrd.154.1629982826175;
        Thu, 26 Aug 2021 06:00:26 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from localhost.localdomain ([2a02:2454:2a1:9900:5e06:8d90:670b:86c8])
        by smtp.gmail.com with ESMTPSA id f7sm8255396wmh.20.2021.08.26.06.00.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Aug 2021 06:00:25 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 2/2] qemurunner.py: handle getOutput() having nothing to read
Date: Thu, 26 Aug 2021 15:00:19 +0200
Message-Id: <20210826130019.818320-2-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210826130019.818320-1-alex.kanavin@gmail.com>
References: <20210826130019.818320-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/lib/oeqa/utils/qemurunner.py | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/utils/qemurunner.py b/meta/lib/oeqa/utils/qemurunner.py
index 204ad8b918..d55248c497 100644
--- a/meta/lib/oeqa/utils/qemurunner.py
+++ b/meta/lib/oeqa/utils/qemurunner.py
@@ -123,7 +123,10 @@ class QemuRunner:
         import fcntl
         fl = fcntl.fcntl(o, fcntl.F_GETFL)
         fcntl.fcntl(o, fcntl.F_SETFL, fl | os.O_NONBLOCK)
-        return os.read(o.fileno(), 1000000).decode("utf-8")
+        try:
+            return os.read(o.fileno(), 1000000).decode("utf-8")
+        except BlockingIOError:
+            return ""
 
 
     def handleSIGCHLD(self, signum, frame):
-- 
2.31.1

