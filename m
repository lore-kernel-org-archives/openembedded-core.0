Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.web11.22740.1629930961815371710
 for <openembedded-core@lists.openembedded.org>;
 Wed, 25 Aug 2021 15:36:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=JMI2tzC3;
 spf=pass (domain: gmail.com, ip: 209.85.221.48, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f48.google.com with SMTP id f5so1652513wrm.13
        for <openembedded-core@lists.openembedded.org>; Wed, 25 Aug 2021 15:36:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=R2Fr9AaZlDoa75wL3kd/BHN9tg31NZtSRXGDQ2nKV/A=;
        b=JMI2tzC3TTPamP+qI6x7xgYBnMISd7xJIENglBa3xB6opXeTOHc3ypgjPuPGVXQYM/
         zxcVKd/JGwft51MGawRO4dsijxod4MrSBrTLi8Vm5G7kIQFwIuUQnNYs7uGWr2eyPB5p
         sdeYAhmz2SS96XLo01ZRxjHdMp13/YuQhOJpP5tDCP8phiLvly8xIbJj6dAApngdTULT
         zVyd0zXH+NCA95mGAuivZ/N6Twe+7RojJlNbr1ZllL6qtlYwK/PrbiDQhb2Dwt5wRN6r
         kWf1vWxHS2d1uVJMzklGYhoHvt/3v0hfywNdYWPjcgUcremBzEjy9gGBWYtYR38cwwpg
         46ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=R2Fr9AaZlDoa75wL3kd/BHN9tg31NZtSRXGDQ2nKV/A=;
        b=CWWbp0gpVAcWPgEkIToKYB1zZaTbSWAMJxt2pe8cbDXmF6mWiL2M1a15ZmBrg70BRS
         UTyTYzf5aIzV4QZlJ9qpmblIEo/0SSveq4kJ+a1+5PN7etaBT6XyF1e+P7PCNpElweq7
         iHEq8e8xVVAHYHoZ7oKr2MeLSvF00xML+rVqbqoCduSvtIThs+inYqxqJEQgK4jIYZ0E
         iRBWEMZeAqkyUE/Dsaj3w+ldAdyhCWoH55tKR7mHnEyfWzdXMTalV4SGe5k2CiLVss+/
         2pN8449VzbP80mCiih67/oTPq8mfhtcxXHzwhWJvFhWkTNdK41fIT14wfsR33ZVx9qhz
         Xg9Q==
X-Gm-Message-State: AOAM532BTns9+NRfTwX+Zilg96tetXkYKkBioqvUumz9/qdRPT/o4e5B
	qugf2okb9bEAFW1pQsCQxKmS2G2MM1Qg7w==
X-Google-Smtp-Source: ABdhPJzwlHWuaZaM0C6uPO/hz6LZdXEuSb7t1rQDoJHbd3iKAurfm0wX5OufH/8hvL+AMhv9pgKaSg==
X-Received: by 2002:adf:808e:: with SMTP id 14mr373068wrl.339.1629930960190;
        Wed, 25 Aug 2021 15:36:00 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from localhost.localdomain ([2a02:2454:2a1:9900:5e06:8d90:670b:86c8])
        by smtp.gmail.com with ESMTPSA id f17sm1337206wrt.63.2021.08.25.15.35.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Aug 2021 15:35:59 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH] qemurunner.py: print output from runqemu/qemu-system in stop()
Date: Thu, 26 Aug 2021 00:35:52 +0200
Message-Id: <20210825223552.802130-1-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This is done when starting up qemu has failed, but is not done
when qemu started ok, but fails later in QMP communication.

Output from runqemu does contain valuable information to find out
why, so rather than fix all the QMP fails to include it, let's just
print it in stop().

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/lib/oeqa/utils/qemurunner.py | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/lib/oeqa/utils/qemurunner.py b/meta/lib/oeqa/utils/qemurunner.py
index 5c9d2b24a3..e099c6e2a7 100644
--- a/meta/lib/oeqa/utils/qemurunner.py
+++ b/meta/lib/oeqa/utils/qemurunner.py
@@ -535,6 +535,8 @@ class QemuRunner:
             if self.runqemu.poll() is None:
                 self.logger.debug("Sending SIGKILL to runqemu")
                 os.killpg(os.getpgid(self.runqemu.pid), signal.SIGKILL)
+            if not self.runqemu.stdout.closed:
+                self.logger.warning("Output from runqemu:\n%s" % self.getOutput(self.runqemu.stdout))
             self.runqemu.stdin.close()
             self.runqemu.stdout.close()
             self.runqemu_exited = True
-- 
2.31.1

