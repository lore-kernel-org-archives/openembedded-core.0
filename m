Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
 by mx.groups.io with SMTP id smtpd.web11.159562.1598119079139350980
 for <openembedded-core@lists.openembedded.org>;
 Sat, 22 Aug 2020 10:57:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=dnrUpSRf;
 spf=pass (domain: gmail.com, ip: 209.85.208.43, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f43.google.com with SMTP id c10so4436328edk.6
        for <openembedded-core@lists.openembedded.org>; Sat, 22 Aug 2020 10:57:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Wk/cjXQcRCbzn3n+ua100EEtHNZHuiqbF7xniRGXvb8=;
        b=dnrUpSRfXMRt7LyNCOSrzktPqNo8eoSfliRh/DYJYinrTgQhUt63wjnhBNEBAiMIdU
         uD6CKotyBAmEiUIEHbIqDpe33UbnFFariH/UcoHsJ46Asufk6ZTnNHEyVF114TcOrvtT
         KhXFj+NVxObc39spwq+7uzZC4hKPgmU3oJQMwssDKpT4dm1a766uHwYk6mPgbZNkURDe
         v5l1ebtlpxhlWbpCyQjeKTUt/j49JM2XrZSneH+btUlcHKhIBXusVMZ3xj/eEvrrU775
         nygYzcn7hMsXrFMQTNgEnOWFrZLKpWjMzX4/IQe7+RLt1fSHO1YY4NeYuGTVHR1a3uCC
         Fkng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Wk/cjXQcRCbzn3n+ua100EEtHNZHuiqbF7xniRGXvb8=;
        b=ayk0idIXmfwcnxsvgtcKMIitKWn6VQgR31DQ9uCTLT4Eru3v0nNiVswSTz1ytEaHKA
         R1xFZCm/z0uzRZaxEg3V+t0OAAcl6ee359xtDSl4KSJpVl9QOfFLR9auqNSfMGXnrMzc
         Ryo6rKMtcLNgIajt+5F4GmsgrJmS8SAaSZ1KnupsmAS1aL3GdwKg/MLGpuNoaaUByKSw
         YAiiaAHM/Ic5OwIubpdNZoQHaxidtQhuEeRy3zWogWoJbiFdJSdlRWmjdhp5GG2dKT+o
         mu7Yb8mGjmR988HzYYQQphI44qSeGY16nB3pIOKc8THRM4XDuvdEmxmAyJvT6JkGrcX2
         xLsg==
X-Gm-Message-State: AOAM533GTXrMctWpuUBvnGiM97b7ieXpHPIi0EYfwUvno22rywlIRIM7
	2EGz0ssFIN1IpDMHYhjCY/g8ENWBLK0=
X-Google-Smtp-Source: ABdhPJxmYKS/8HBPNVUrbqq26W4ooSfe3sPb+9FyZMrvJhgkT8xHP8gSTQbgpwjTNTW9m7KjZe0wIA==
X-Received: by 2002:a05:6402:3110:: with SMTP id dc16mr8231967edb.218.1598119077132;
        Sat, 22 Aug 2020 10:57:57 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from linux-f9zs.box (cable-95-168-130-13.cust.telecolumbus.net. [95.168.130.13])
        by smtp.gmail.com with ESMTPSA id a11sm3700311ejk.77.2020.08.22.10.57.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 22 Aug 2020 10:57:56 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH] meta-selftest: correct the virgl test for 5.8 kernels
Date: Sat, 22 Aug 2020 19:57:27 +0200
Message-Id: <20200822175727.17579-1-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta-selftest/lib/oeqa/runtime/cases/virgl.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-selftest/lib/oeqa/runtime/cases/virgl.py b/meta-selftest/lib/oeqa/runtime/cases/virgl.py
index c0abfd1b16..892c19c848 100644
--- a/meta-selftest/lib/oeqa/runtime/cases/virgl.py
+++ b/meta-selftest/lib/oeqa/runtime/cases/virgl.py
@@ -9,7 +9,7 @@ class VirglTest(OERuntimeTestCase):
     def test_kernel_driver(self):
         status, output = self.target.run('dmesg|grep virgl')
         self.assertEqual(status, 0, "Checking for virgl driver in dmesg returned non-zero: %d\n%s" % (status, output))
-        self.assertIn("virgl 3d acceleration enabled", output, "virgl acceleration seems to be disabled:\n%s" %(output))
+        self.assertIn("features: +virgl", output, "virgl acceleration seems to be disabled:\n%s" %(output))
 
     @OETestDepends(['virgl.VirglTest.test_kernel_driver'])
     def test_kmscube(self):
-- 
2.28.0

