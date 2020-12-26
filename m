Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
 by mx.groups.io with SMTP id smtpd.web10.19481.1608974864931003826
 for <openembedded-core@lists.openembedded.org>;
 Sat, 26 Dec 2020 01:27:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=S4A41Q7n;
 spf=pass (domain: gmail.com, ip: 209.85.208.44, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f44.google.com with SMTP id c7so5571334edv.6
        for <openembedded-core@lists.openembedded.org>; Sat, 26 Dec 2020 01:27:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=M/cTTFS+MkA3C84s02lzcW6j6O7K9lJX2gjF995Cqjw=;
        b=S4A41Q7nsgxxXK09lG15C/PSBdSZ9A/ePLoTwL1AV8W9wx6dEbyJdgf4mjRXz54rJf
         R2zpyaq+w633E2g3bA9FH4vDZXppkFEmLphpqJpbgyJ4iRceoPdtZ24aTRmVTaS1RVqY
         RIMbItKYF79uyCEeyb/4C1v6Nsi7nnv6dyI4ImwszALqZjPlkkAeDpp/0mf5Gydq60ow
         CyD70+rXYpg4wG3fHIHfJHD9TD0O3WpAL0YwJlTJgETQETbyAkcNUO9T3Sb6Hv38BkoK
         dG3G4ElL4L7ww4m5fzxUf9qoUXDltjg+LfCnxTydCS+gSARH6YtQ/vUrk0OLBNJk8Epy
         L/jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=M/cTTFS+MkA3C84s02lzcW6j6O7K9lJX2gjF995Cqjw=;
        b=YT6k1J91kg5ZyaQoSOBqrFwh5mW2Xrp6wcexdIqWExsakeDeGymbEGw2qp43kfxWYv
         CYcLzWlBp7WRbgcbS2m1A5A6U12rDrC/KHSju9+axb77L3XSk4C3StI7/8sVpEkKDG7/
         JUsc+2kAaTfFT7lFCeGH3QsvXoTpAtFn9Tp1cV7BxF9il3CwmziQE4D3K+MhBzb0mcfN
         6InmSfdgDYxhkxyJjfudJpGmHtaouph/s+cl/vSOmsCKZHauI9JlgRfxjCgjZi+UcPoL
         l0LU6Mrf4HQC7MW2qbrltKyT16pgOjk/1VPYkgiLNSctWBX+6JWWpHAwtsKOlA/xeJ+8
         gpPQ==
X-Gm-Message-State: AOAM531Hty6uze9UBLjP2SboT/g7/MyA4fM/5ARM+oSxI3YaOtC/9WQs
	hhTrD9RuDZkbI5l9LlAXJVtOeOBluuw=
X-Google-Smtp-Source: ABdhPJyxl0is7saCZCZk/ysYteoHzoqV+RK/Xem5bgP+3kjuUD1/QbZ5hcZJ14006eAvskCdIkQx6Q==
X-Received: by 2002:a05:6402:1045:: with SMTP id e5mr35075561edu.40.1608974863419;
        Sat, 26 Dec 2020 01:27:43 -0800 (PST)
Return-Path: <alex.kanavin@gmail.com>
Received: from localhost-live.fritz.box ([2a02:2450:1011:4f7:a0c9:fd7f:e532:e1ec])
        by smtp.gmail.com with ESMTPSA id u2sm14828406ejb.65.2020.12.26.01.27.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Dec 2020 01:27:42 -0800 (PST)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 01/48] oeqa/ptest: print a warning if ptests failed
Date: Sat, 26 Dec 2020 10:26:45 +0100
Message-Id: <20201226092732.52323-1-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This allows spotting ptest regressions without having hard ptest failures
(for that full ptest stability should be achieved).

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/lib/oeqa/runtime/cases/ptest.py | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/lib/oeqa/runtime/cases/ptest.py b/meta/lib/oeqa/runtime/cases/ptest.py
index a9572c81f0..0800f3c27f 100644
--- a/meta/lib/oeqa/runtime/cases/ptest.py
+++ b/meta/lib/oeqa/runtime/cases/ptest.py
@@ -108,4 +108,5 @@ class PtestRunnerTest(OERuntimeTestCase):
             failmsg = failmsg + "Failed ptests:\n%s" % pprint.pformat(failed_tests)
 
         if failmsg:
+            self.logger.warning("There were failing ptests.")
             self.fail(failmsg)
-- 
2.29.2

