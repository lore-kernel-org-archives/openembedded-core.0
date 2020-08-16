Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
 by mx.groups.io with SMTP id smtpd.web12.19839.1597560142158862642
 for <openembedded-core@lists.openembedded.org>;
 Sat, 15 Aug 2020 23:42:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=lmX2/Ngd;
 spf=pass (domain: gmail.com, ip: 209.85.214.181, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f181.google.com with SMTP id k13so5944056plk.13
        for <openembedded-core@lists.openembedded.org>; Sat, 15 Aug 2020 23:42:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=fERJJ8eHf9le/ULUDLkEsMDMgNi0fBTfLzEElWbEDdo=;
        b=lmX2/Ngd6cUXs3y1PSXl3hJ00qrX20/CExkCZ/HIz5kf5w6iaO3JcfPDl0z+3sBLdG
         1WRUgWnY7dntB9sUynPGXMTSpUBs2BrnEC79DW3TfjoVO3M8ao3r9mXiKWukipj1LZpb
         BGb9nzcBhv4BX88Snp16STahGVGP7yWd5Lg9OOVIyCQC0y3soyoWgBM//+moMaiYxg8I
         UPjMr2ezszGAcKvmEFAs1WetT91G6kZh54q1UHgN24YvMC8Rfq52MKsQYDpxfpCN7zif
         vSJ8ZBAnysIRi8OZ9hU/E2/GWQh6PfWRV2OeOYJd1NEnt/4h3CDFB0Z0jVU9jnQNbu/z
         4tdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=fERJJ8eHf9le/ULUDLkEsMDMgNi0fBTfLzEElWbEDdo=;
        b=NiDUzfxVMwOiIeNwWjBcvAALcFkjHDdO3DcaGsTLI8ZTi5roXEqgyQsGUtlgWuf2jW
         TCN2uz2OQHGVZi5gU5dwNrV7bXLnnDDTzKuzWdktaub6RGcQMgG1PqcCmlnrxlO63GJB
         61ZeesxZ6btfcBPRP+exgwJjbFjMzqPYfvbZ7vj83C1I2BA1TjGckmBxY6dVEsXFSIPc
         vVrJy0Bw3JaxcdXsmw3TgZ7lOOYML6arWlWNwQy2Hls6gm1U5nAaWm2D5VBY/QXNMzde
         T48JR7FRj7jvriVCXBERFA8Se6i84s6wGmWSopDkXAeNPGQ0eGBI8gE977d8R1XBIrh7
         pl0w==
X-Gm-Message-State: AOAM531EH3dxP6W16c08dtHPNW/sHrLRubQRfnncToApGT+LqQxXo3OI
	mTlhz9thU7jLRyaS+gF+AQah7XWmk0dI4g==
X-Google-Smtp-Source: ABdhPJzsiwPQMaOLnLkkEqBxudkk7S7rKmp6f9zrPqWzKHRBtiId4Pewb4KrBOPzmqbn6tOphPL3Vg==
X-Received: by 2002:a17:902:b60d:: with SMTP id b13mr7107083pls.48.1597560141437;
        Sat, 15 Aug 2020 23:42:21 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::37ae])
        by smtp.gmail.com with ESMTPSA id v128sm14544305pfc.14.2020.08.15.23.42.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Aug 2020 23:42:20 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 2/2] buildcpio.py: Apply patch to fix build with -fno-common
Date: Sat, 15 Aug 2020 23:42:16 -0700
Message-Id: <20200816064216.1142587-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200816064216.1142587-1-raj.khem@gmail.com>
References: <20200816064216.1142587-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This sed expression implements the needed patch to fix compilation with
-fno-common, hopefully this patch will get included in 2.14 release and
we can remove this operation

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
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
index 902e93f623..6fce47d953 100644
--- a/meta/lib/oeqa/sdk/cases/buildcpio.py
+++ b/meta/lib/oeqa/sdk/cases/buildcpio.py
@@ -28,6 +28,7 @@ class BuildCpioTest(OESDKTestCase):
             self.assertTrue(os.path.isdir(dirs["source"]))
             os.makedirs(dirs["build"])
 
+            self._run("cd {source} && sed -i -e '/char \*program_name/d' src/global.c".format(**dirs))
             self._run("cd {build} && {source}/configure --disable-maintainer-mode $CONFIGURE_FLAGS".format(**dirs))
             self._run("cd {build} && make -j".format(**dirs))
             self._run("cd {build} && make install DESTDIR={install}".format(**dirs))
-- 
2.28.0

