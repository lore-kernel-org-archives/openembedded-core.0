Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.web08.58.1626377998326680894
 for <Openembedded-core@lists.openembedded.org>;
 Thu, 15 Jul 2021 12:39:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Cxm4XPEc;
 spf=pass (domain: gmail.com, ip: 209.85.128.50, mailfrom: uvv.mail@gmail.com)
Received: by mail-wm1-f50.google.com with SMTP id o30-20020a05600c511eb029022e0571d1a0so4354000wms.5
        for <Openembedded-core@lists.openembedded.org>; Thu, 15 Jul 2021 12:39:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=vAEfBaXNse5l7mIe/9xZLHM8pPnmoMNHvjUfTfkzK3k=;
        b=Cxm4XPEcalYRxv309Pfoq0Eij8UlGWgJwoOwCzRkV3j4P7d+PfLLA1TeA/DO7jEq5x
         X9eFM9tWGVIqEzTGGXWpFdiCDOGe5lCrOBi73lE++fc11HlywQtIiT6MkwliRNwjuKZM
         JjtVODHYvChKLo2ux61sSFKrX+KLjdvWZmr48gLbA6RPll2Dti/RHNmu8pRn9LggaHH3
         tHibV6NmSpWD3bMTW9GeOm9m61V7aAtF+yPOVKplQ0z74O+iZIb5GHAPnNe1FMSVKbYQ
         Mk1oA/uCoD7UUbl6qLXSYdnSlRAV2O4z2fRwPNt5ZhMveyG3OCYkQ9If19mt+yxg0KD2
         PJJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=vAEfBaXNse5l7mIe/9xZLHM8pPnmoMNHvjUfTfkzK3k=;
        b=sM36vnc+ujfxa/H1hFwhZ6HBhKuY1g4f9BDpSitZRuME3bV6XKInSwH/XR/ppD6WH8
         9YYGTRGfY8+325377q7vSNr1auN83QtSsMPvmJkvaHsNT3ZP6Nc1EKjIyNRNleUWEGbl
         yuAd1mhK2eVfCDe4q2rzGLMm/fyAvk2QufNBGTZagwyZfvx0WzdCqu/4HBsFuDazqBfc
         O+qzz8KZCqq+eGjsby2+JQhdOhRHmFSgzlxOOWzKX+fU5cjsjihGwx6mMnI0bOcdrOxk
         ogM5efP+ORWOEM4XXytILLOKHYh2yRnj2Vsmcpfe92DAFtv1AAIFsOAEMi7QmfcMqGZ4
         8D3Q==
X-Gm-Message-State: AOAM531FClfMfGjH5VwD4WLWma/VS3asIssS8dQh7JzL1WAmqbUSiju3
	kwlRM5PZBSRkvYTFYRMUhEeXfwLiRU8I3A==
X-Google-Smtp-Source: ABdhPJzhZYoheGy3bZhXFMmvQL1nvczgiHH41B+29EjrFXb9FTarvfhwCdZyV+gbjCNkcjR7Qd2xVg==
X-Received: by 2002:a1c:f016:: with SMTP id a22mr6432088wmb.65.1626377996641;
        Thu, 15 Jul 2021 12:39:56 -0700 (PDT)
Return-Path: <uvv.mail@gmail.com>
Received: from slackware.local ([194.99.105.68])
        by smtp.gmail.com with ESMTPSA id p11sm7533809wrw.53.2021.07.15.12.39.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Jul 2021 12:39:56 -0700 (PDT)
From: "Vyacheslav Yurkov" <uvv.mail@gmail.com>
To: Openembedded-core@lists.openembedded.org
Cc: Vyacheslav Yurkov <uvv.mail@gmail.com>
Subject: [PATCH v3 1/8] overlayfs-qa: common functions for overlayfs
Date: Thu, 15 Jul 2021 21:39:26 +0200
Message-Id: <20210715193933.66120-1-uvv.mail@gmail.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This class provides commom functions for overlayfs and its QA check,
which is performed in ROOTFS_POSTPROCESS_COMMAND

Signed-off-by: Vyacheslav Yurkov <uvv.mail@gmail.com>
---
 meta/classes/overlayfs-qa.bbclass | 14 ++++++++++++++
 1 file changed, 14 insertions(+)
 create mode 100644 meta/classes/overlayfs-qa.bbclass

diff --git a/meta/classes/overlayfs-qa.bbclass b/meta/classes/overlayfs-qa.bbclass
new file mode 100644
index 0000000000..54fa8316a2
--- /dev/null
+++ b/meta/classes/overlayfs-qa.bbclass
@@ -0,0 +1,14 @@
+# This class contains common functions for overlayfs and its QA check,
+# which is performed in ROOTFS_POSTPROCESS_COMMAND
+
+# this function is based on https://github.com/systemd/systemd/blob/main/src/basic/unit-name.c
+def escapeSystemdUnitName(path):
+    escapeMap = {
+        '/': '-',
+        '-': "\\x2d",
+        '\\': "\\x5d"
+    }
+    return "".join([escapeMap.get(c, c) for c in path.strip('/')])
+
+def mountUnitName(unit):
+    return escapeSystemdUnitName(unit) + '.mount'
-- 
2.28.0

