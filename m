Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
 by mx.groups.io with SMTP id smtpd.web12.16373.1598526021105315808
 for <openembedded-core@lists.openembedded.org>;
 Thu, 27 Aug 2020 04:00:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=ZPF644mR;
 spf=pass (domain: gmail.com, ip: 209.85.218.45, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f45.google.com with SMTP id l2so7060856eji.3
        for <openembedded-core@lists.openembedded.org>; Thu, 27 Aug 2020 04:00:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ADU3VY1RLZ/8xKJO228J5XQV5SPk1vp+GAXLrZVVn1c=;
        b=ZPF644mRyRxAZVdbX3hxe2GJer5z4EXwGyKJNw0jySyBQSd3OYRG6M+mOk9XH04QC6
         EruvSN15EUryr1JrxuloReTewy999XOWRGgZiEFEmzFVcUD5LXz2G3mGM69311P11raN
         1qJ11/OAIQBdEPKDuoq0hVgDP2LiYMEufEmwlqP1YADTIW8zZZzUp/kHgoG9ENTs0Qfv
         P+DN2Vb0eBI+WV8PQiY6vYvEBzuXLzS/wvuMnqj3+HbEzbHPMT+n205EgVW3PVtsqDxd
         QFSLGiYlCsxl7usF4xiYZmQf63G+YIBcVeCrurWrN1HYPrWe3NBLQaHL1xbKU6uNfPNb
         2mFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ADU3VY1RLZ/8xKJO228J5XQV5SPk1vp+GAXLrZVVn1c=;
        b=b4vNl9zRKdpI5yGXLaYfR+hq/LHzV23PVqBd+kvlEVK5RB+z6js8i9C9v3sladHY9V
         wJQfuM4Up78ytvFisM9vXrvcH7uOLUq7Xmc1dr/dsWEPxuR8hVTUy4t71wAOwknX87MX
         T3I1vTerRVPll05NK5ojjpOQ7tvnxSKqnNBm42K4dumVKnulIZmmKGmF0rwrowJzY3gl
         ZLGGmU4Yc5qcl8iJ/q7w8cnAigXHWB/YmbULFmigdysLRrp6DQUnETpxLHLv1/wAeNkg
         uYapNtfGDPBQe8CtlKtJDK6DF215ClEkQ0wHVlG9N5pjyYyPDbkTXrrzkPZ33RX+e+rt
         Z2+A==
X-Gm-Message-State: AOAM531rtEFynauj8sCAGTKWsPbyl956irfBOy/Vy4o0HGtXWA4XBlvh
	EYdtn8EszIvX5kPq4RUVFHXjKxMAYkQ=
X-Google-Smtp-Source: ABdhPJySZOAsWN2bWeUcg2cRA1inh1P5FMvwlwumevlX9R//r0S27FRYtmjYHysJjZOl1yJTwUdfVg==
X-Received: by 2002:a17:906:4ad5:: with SMTP id u21mr12577152ejt.468.1598526019353;
        Thu, 27 Aug 2020 04:00:19 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from linux-f9zs.site ([2a02:2450:1011:56f:b652:c378:b428:fdf])
        by smtp.gmail.com with ESMTPSA id eb5sm1623132ejc.94.2020.08.27.04.00.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2020 04:00:18 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 5/6] oeqa/multilib: rework to use readelf from the host
Date: Thu, 27 Aug 2020 12:59:32 +0200
Message-Id: <20200827105933.3575-5-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200827105933.3575-1-alex.kanavin@gmail.com>
References: <20200827105933.3575-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

It is difficult and error-prone to ensure binutils gets
installed into target images where this test may run;
on the other hand readelf is always present on the
host, as it is a part of HOSTTOOLS.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/lib/oeqa/runtime/cases/multilib.py | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/meta/lib/oeqa/runtime/cases/multilib.py b/meta/lib/oeqa/runtime/cases/multilib.py
index 62e662b01c..56aed62eea 100644
--- a/meta/lib/oeqa/runtime/cases/multilib.py
+++ b/meta/lib/oeqa/runtime/cases/multilib.py
@@ -7,6 +7,8 @@ from oeqa.core.decorator.depends import OETestDepends
 from oeqa.core.decorator.data import skipIfNotInDataVar
 from oeqa.runtime.decorator.package import OEHasPackage
 
+import subprocess
+
 class MultilibTest(OERuntimeTestCase):
 
     def archtest(self, binary, arch):
@@ -14,8 +16,10 @@ class MultilibTest(OERuntimeTestCase):
         Check that ``binary`` has the ELF class ``arch`` (e.g. ELF32/ELF64).
         """
 
-        status, output = self.target.run('readelf -h %s' % binary)
-        self.assertEqual(status, 0, 'Failed to readelf %s' % binary)
+        dest = "{}/test_binary".format(self.td.get('T', ''))
+        self.target.copyFrom(binary, dest)
+        output = subprocess.check_output("readelf -h {}".format(dest), shell=True).decode()
+        os.remove(dest)
 
         l = [l.split()[1] for l in output.split('\n') if "Class:" in l]
         if l:
@@ -29,7 +33,6 @@ class MultilibTest(OERuntimeTestCase):
     @skipIfNotInDataVar('MULTILIBS', 'multilib:lib32',
                         "This isn't a multilib:lib32 image")
     @OETestDepends(['ssh.SSHTest.test_ssh'])
-    @OEHasPackage(['binutils'])
     @OEHasPackage(['lib32-libc6'])
     def test_check_multilib_libc(self):
         """
-- 
2.28.0

