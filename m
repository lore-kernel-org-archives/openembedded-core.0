Received: from mail-ej1-f67.google.com (mail-ej1-f67.google.com [209.85.218.67])
 by mx.groups.io with SMTP id smtpd.web11.16239.1598526020357451303
 for <openembedded-core@lists.openembedded.org>;
 Thu, 27 Aug 2020 04:00:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=jCFtbLgi;
 spf=pass (domain: gmail.com, ip: 209.85.218.67, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f67.google.com with SMTP id bo3so7022828ejb.11
        for <openembedded-core@lists.openembedded.org>; Thu, 27 Aug 2020 04:00:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=d+tm/25OIgcpDF7Or9PlAkYr1dnd0r7HcVPgD4vN92Q=;
        b=jCFtbLgihhL0pKHolN5s7HNTE0gaTrXsru9gymVccs28/KeYEtcZSviABSlwi8ykmt
         j/TSmsmixf5ybJGzjBLVE5X6cFODkfA2xbAyftG188mlOhM/DdoNi91fCl8u8O7/A3wK
         ar+UQXNl0om7a+lxsTXUUomaUGf3SNoZfxJrSgfUmihsxS4KTx6ACndiqaQ2Y5bXXGR8
         AiA9CMpfqX3VY06mu8n6ed60+UUZSSvi7U6BTu0BRe1ZCBD4DObUwIXDkaxRQbcfngIe
         3hwVaEBPWFLarREjO5FBf+w2sOD4RQs9mgdGWLehya5fAhfEJ9gIkRrjzntKqVI6Erg3
         nxEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=d+tm/25OIgcpDF7Or9PlAkYr1dnd0r7HcVPgD4vN92Q=;
        b=ZaiOgPlxy0E6j8+VDTYOXv3+YaZ56UpXQ7VnXttvOrvHBE4l31z4/1rtBFHe8CmFF2
         bwcKCyrnGR3jk5TWMwjhK3yEMyApGV7q9veOkldbQrZ/KJ5mP3bz7cQief/CyS1QEGlX
         Irw1ZBHbDKbjVznzZIcwB0X1NL0AUoGNDoyvjce5tsqirD7AtLXSynWEZ/cfVHGKo+A0
         ErKHWXXp8heKXxlOvBDf6Ah0GhHwmrvQgI+cLVXNJ1rO7gTg/g+uTM5MBemXR3iRCocU
         jSeAHWtMp42xk1Jl4izbjccTbtncVhWK9eObtpyh0zirVh6kamiLPGzRMtFzvvBDt6lf
         FmzA==
X-Gm-Message-State: AOAM530Awqx+iS4VePWbA+oSJ9wIEWR4kGw2Dr3wGb6I/UAq1Q+nlrJT
	Y/EWTaG0sbgscxgumzrnYoSsi3ejCB8=
X-Google-Smtp-Source: ABdhPJx/9CZobF3pz7vfDGqdvTou5SVDoMPQKNUO9jOukAeZbaOjxMWp/z3sCys9mmd01304gW+kCw==
X-Received: by 2002:a17:906:b09a:: with SMTP id x26mr6315115ejy.162.1598526018561;
        Thu, 27 Aug 2020 04:00:18 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from linux-f9zs.site ([2a02:2450:1011:56f:b652:c378:b428:fdf])
        by smtp.gmail.com with ESMTPSA id eb5sm1623132ejc.94.2020.08.27.04.00.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2020 04:00:18 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 4/6] oeqa/x32lib: rework to use readelf from the host
Date: Thu, 27 Aug 2020 12:59:31 +0200
Message-Id: <20200827105933.3575-4-alex.kanavin@gmail.com>
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
 meta/lib/oeqa/runtime/cases/x32lib.py | 17 +++++++++++------
 1 file changed, 11 insertions(+), 6 deletions(-)

diff --git a/meta/lib/oeqa/runtime/cases/x32lib.py b/meta/lib/oeqa/runtime/cases/x32lib.py
index ddf220140e..f419c8f181 100644
--- a/meta/lib/oeqa/runtime/cases/x32lib.py
+++ b/meta/lib/oeqa/runtime/cases/x32lib.py
@@ -6,16 +6,21 @@ from oeqa.runtime.case import OERuntimeTestCase
 from oeqa.core.decorator.depends import OETestDepends
 from oeqa.core.decorator.data import skipIfNotInDataVar
 
+import subprocess
+
 class X32libTest(OERuntimeTestCase):
 
     @skipIfNotInDataVar('DEFAULTTUNE', 'x86-64-x32',
                         'DEFAULTTUNE is not set to x86-64-x32')
     @OETestDepends(['ssh.SSHTest.test_ssh'])
     def test_x32_file(self):
-        cmd = 'readelf -h /bin/ls | grep Class | grep ELF32'
-        status1 = self.target.run(cmd)[0]
-        cmd = 'readelf -h /bin/ls | grep Machine | grep X86-64'
-        status2 = self.target.run(cmd)[0]
-        msg = ("/bin/ls isn't an X86-64 ELF32 binary. readelf says: %s" % 
-                self.target.run("readelf -h /bin/ls")[1])
+        dest = self.td.get('T', '') + "/ls.x32test"
+        self.target.copyFrom("/bin/ls", dest)
+        cmd = 'readelf -h {} | grep Class | grep ELF32'.format(dest)
+        status1 = subprocess.call(cmd, shell=True)
+        cmd = 'readelf -h {} | grep Machine | grep X86-64'.format(dest)
+        status2 = subprocess.call(cmd, shell=True)
+        msg = ("/bin/ls isn't an X86-64 ELF32 binary. readelf says:\n{}".format(
+                subprocess.check_output("readelf -h {}".format(dest), shell=True).decode()))
+        os.remove(dest)
         self.assertTrue(status1 == 0 and status2 == 0, msg=msg)
-- 
2.28.0

