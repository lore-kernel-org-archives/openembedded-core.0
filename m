Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.web09.29023.1629978325558026114
 for <openembedded-core@lists.openembedded.org>;
 Thu, 26 Aug 2021 04:45:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=alVvdaa1;
 spf=pass (domain: gmail.com, ip: 209.85.221.48, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f48.google.com with SMTP id u9so4549622wrg.8
        for <openembedded-core@lists.openembedded.org>; Thu, 26 Aug 2021 04:45:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=1pP2EqI0f8ez77kz/9KxHk/vYvpDm9Mw3PfEJ2r3wAc=;
        b=alVvdaa1Cgu5KY5o3nD/2OCb4PhycKuk3xr072a8fmj24fPL9wSneFgJiopULvCC0C
         DiR1iBcJ8rP6XizM50meMv0AoNmnnQdD51wufwWBrjXxspLVtFmVRPd7xBEETmPHLD+7
         CeuVMYWwecJdV+etJZcffmNMyIDnKvBOcJjW4bVgVRhIGVtDegqUExz9sQbP1rADvsri
         8DZhWri8i1pf0Kg3fKAwbMi8liBwJ25hQnHrjK8B65A/fExWhF13APPxFK9o6L/yGPEh
         n86dCIFhgPIXqBRjJ96SJ5iTgz+4oY2J/6GK4ov/XYw4KykPOgWTRUbUfKj3Kj3qDXW7
         bUqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=1pP2EqI0f8ez77kz/9KxHk/vYvpDm9Mw3PfEJ2r3wAc=;
        b=jKlqyzRtRkjXINN0fHTW9J0SnM+xfjg6re3fB5UzUBrMYmaXy5bWwB7FgHa4QUuS3D
         uEsURQfsVAjXYgFUTVe3AJO/WKb8B/abbMXbQhGnkIBrIfi+LhApAgUyYR81kl7y9LgZ
         tnVUa5CkrQM0Pp6HZRODKLT1IZScqtnvdng5+0GYIXnpG1q7Nse7FuHzxeN0ZKPqTrq+
         fc/NeA+Ti5CrS3f4NDdOUFw6ufYKI0wqF0g8dck/qiHmtqjYz7/fSWKCCVNxNeEausk6
         9KNSpq1rqVs9SNtKr+EajexD3wRmV1h0/BqQbk+AhOsXYj7nd+SrhMdYwEHUa/tWj0AK
         Lr+A==
X-Gm-Message-State: AOAM530F4LjiKrho6K3XKkdi4P6GvGQqg0U27Kp58gLf+k41RWHf8Xop
	+1hyMXOdP/6fHLjt2p4DGhP0+wPwQL19zw==
X-Google-Smtp-Source: ABdhPJzewG1j5UnE7ZyMqFF3ZDgpYsZmEM5faie3aeEpsEyhuRipYJAtfUht6kjFXm7qXm+Y4wRo+A==
X-Received: by 2002:a5d:4d41:: with SMTP id a1mr3479309wru.76.1629978324032;
        Thu, 26 Aug 2021 04:45:24 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from localhost.localdomain ([2a02:2454:2a1:9900:5e06:8d90:670b:86c8])
        by smtp.gmail.com with ESMTPSA id n3sm2585190wmi.0.2021.08.26.04.45.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Aug 2021 04:45:23 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH] qemurunner.py: print output from runqemu/qemu-system in stop()
Date: Thu, 26 Aug 2021 13:45:17 +0200
Message-Id: <20210826114517.817267-1-alex.kanavin@gmail.com>
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
index 5c9d2b24a3..204ad8b918 100644
--- a/meta/lib/oeqa/utils/qemurunner.py
+++ b/meta/lib/oeqa/utils/qemurunner.py
@@ -535,6 +535,8 @@ class QemuRunner:
             if self.runqemu.poll() is None:
                 self.logger.debug("Sending SIGKILL to runqemu")
                 os.killpg(os.getpgid(self.runqemu.pid), signal.SIGKILL)
+            if not self.runqemu.stdout.closed:
+                self.logger.info("Output from runqemu:\n%s" % self.getOutput(self.runqemu.stdout))
             self.runqemu.stdin.close()
             self.runqemu.stdout.close()
             self.runqemu_exited = True
-- 
2.31.1

