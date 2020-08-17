Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
 by mx.groups.io with SMTP id smtpd.web10.36537.1597635023676794505
 for <openembedded-core@lists.openembedded.org>;
 Sun, 16 Aug 2020 20:30:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Gry3fv57;
 spf=pass (domain: gmail.com, ip: 209.85.216.41, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f41.google.com with SMTP id t6so7035832pjr.0
        for <openembedded-core@lists.openembedded.org>; Sun, 16 Aug 2020 20:30:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=mxCOsa5eW7WggV3SzCd8J+k21m52DbALs5wFka8+0L8=;
        b=Gry3fv57eanNgO4p26r5UTHHJV0cDYi3uq8dFV0BJy/UsOl1/q0JAtsxv5hxGHojIV
         PksOgxSI+4O0Br5tLR/FKIdUVnr/N2oClmibv8S84TnjpxwdF9erIENCciWXtNLFj20e
         HVazDi3QOVnhtMh4c2LzE7XGXxf/9TZQTcX8LG0Uawj4NBmEr5O6eeRg3tRMYtVruXyR
         EHhyIByB2dCjapbR319zrSfGfiOm+AFN1zJ+Ww6dZlllTlVKFLFbHJYUc7QzetWc+q0A
         BM8SNRGBseMauKkYg3zzKMiCyYIXKzUmFxDGowB0lBmd5OFyDSqg5Z04W7pv3640zxym
         9T8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=mxCOsa5eW7WggV3SzCd8J+k21m52DbALs5wFka8+0L8=;
        b=fy6k6RcECRs8BKPoPffj1Q2tqTZDKEZHAmsVC63INEydRDXdeNNkbFYlwAQSkaJ+NX
         crOLfTvRz8Rk2T/Js6K4/+mpHpnT2kBzeS69IIlKSH3/uJWZhEt+tLStXJvOWpcJi+e1
         ofxjSWGo+A6mKLo+f8G1mCsT53wOYRgL4npsoZrmPG2GbRZLPtL4JhVJdiRSpGo3CxXM
         J6EQPNhNie1qdDkv7LIGEo68dpNnHivGKOmOnvJspaM2OsnCbR886gB11wJIDa+yKNEv
         3osuDcKXd7UjhV23dWHTXxxmVKN7PMlzX+GzscilI7o7AzILhx+nOvAJhRsYrTRRdNuR
         4CZg==
X-Gm-Message-State: AOAM532y+vYNHE31YFXtg9cMXDB2YCcZEAIjLXprlVIs6//SetMuC6rf
	kr+0dksivRMkDUzqPWsPwbbniy6nH74Wug==
X-Google-Smtp-Source: ABdhPJx7gW83Ci0iwq5xX+KlOq3TO6L2zh8zO1O7gAZnC+6pj6CXoMpggWp328L4bq2eYheR4CzPLQ==
X-Received: by 2002:a17:902:ed4a:: with SMTP id y10mr9871207plb.106.1597635022804;
        Sun, 16 Aug 2020 20:30:22 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net (c-73-63-224-124.hsd1.ca.comcast.net. [73.63.224.124])
        by smtp.gmail.com with ESMTPSA id i11sm14563247pjg.50.2020.08.16.20.30.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Aug 2020 20:30:22 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH V2 1/2] buildcpio.py: Apply patch to fix build with -fno-common
Date: Sun, 16 Aug 2020 20:30:15 -0700
Message-Id: <20200817033016.1539073-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This sed expression implements the needed patch to fix compilation with
-fno-common, hopefully this patch will get included in 2.14 release and
we can remove this operation

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
v2: Fix the sdk sed expression, which seems to not work on v1

 meta/lib/oeqa/runtime/cases/buildcpio.py | 3 ++-
 meta/lib/oeqa/sdk/cases/buildcpio.py     | 1 +
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/runtime/cases/buildcpio.py b/meta/lib/oeqa/runtime/cases/buildcpio.py
index d0f91668b2..e29bf16ccb 100644
--- a/meta/lib/oeqa/runtime/cases/buildcpio.py
+++ b/meta/lib/oeqa/runtime/cases/buildcpio.py
@@ -27,6 +27,7 @@ class BuildCpioTest(OERuntimeTestCase):
     @OEHasPackage(['autoconf'])
     def test_cpio(self):
         self.project.download_archive()
-        self.project.run_configure('--disable-maintainer-mode','')
+        self.project.run_configure('--disable-maintainer-mode',
+                                   'sed -i -e "/char \*program_name/d" src/global.c;')
         self.project.run_make()
         self.project.run_install()
diff --git a/meta/lib/oeqa/sdk/cases/buildcpio.py b/meta/lib/oeqa/sdk/cases/buildcpio.py
index 902e93f623..e565826541 100644
--- a/meta/lib/oeqa/sdk/cases/buildcpio.py
+++ b/meta/lib/oeqa/sdk/cases/buildcpio.py
@@ -28,6 +28,7 @@ class BuildCpioTest(OESDKTestCase):
             self.assertTrue(os.path.isdir(dirs["source"]))
             os.makedirs(dirs["build"])
 
+            self._run("sed -i -e '/char.*program_name/d' {source}/src/global.c".format(**dirs))
             self._run("cd {build} && {source}/configure --disable-maintainer-mode $CONFIGURE_FLAGS".format(**dirs))
             self._run("cd {build} && make -j".format(**dirs))
             self._run("cd {build} && make install DESTDIR={install}".format(**dirs))
-- 
2.28.0

