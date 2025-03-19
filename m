Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70BBEC36000
	for <webhook@archiver.kernel.org>; Wed, 19 Mar 2025 08:16:49 +0000 (UTC)
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
 by mx.groups.io with SMTP id smtpd.web11.2967.1742372206637997216
 for <openembedded-core@lists.openembedded.org>;
 Wed, 19 Mar 2025 01:16:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=QmXtRnMH;
 spf=pass (domain: gmail.com, ip: 209.85.214.171, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-225df540edcso8862475ad.0
        for <openembedded-core@lists.openembedded.org>; Wed, 19 Mar 2025 01:16:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742372206; x=1742977006; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ftw19h+kZia5z8eykazgmejMJjyL9nIfAhDfR4uaeEA=;
        b=QmXtRnMHm8l/Qj5Fier4zr/MzvWKS3As9H+51wq13eXEC7yFBebS+hshTyFWLmUpV3
         1zZVqR807J8tWUb8qf32WVlzeDnINQ+GlbJuw01aa0lZN2qsPG5wXfiKTEHD7CMsSbwa
         IsPBXzII9FTGZmp0hWQLK71RgSf8GOknsFoSe8EKcN127OS32/NEn0TMlZa5Fy51VOQD
         0UteE7vw4bfQv0FVBKlZH5bCct568tYeVNPk0njMEvYgq1uZ3Yei1fd81Gd4ILDPJ6P1
         NVw2P/IUoaIjleDAbsu1Ojea8V6pXz016YYPMWhg2uw1wwbJGFc3cs05RtgYbEnv2HEp
         x13A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742372206; x=1742977006;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ftw19h+kZia5z8eykazgmejMJjyL9nIfAhDfR4uaeEA=;
        b=QKgpsLuP+gppEeSy9fLm79h2TJ4vnNQN/PFS1qQFHCe8PKnyd6qi/6w44k+YUccLhI
         VXM3cdQ9tNsY1ENUW4GXmzkaa6y1VRngV8q9sJQyZcwLhK+370F+Y4oCnFuqlZ28CXCt
         y+bwTjK767ASko3DZZpCwOF12kbiGrWUWvHcZp8ltFHwuBRdo6FvBoMzLm2YS2VkrkaQ
         dmnU7YJ/teAJYokpJTJFwu2ISCDjPHRnzUln6uSbLplaBfrMFr+9TLvhTFLlpqAjtR46
         OTYwR7qQCTbMYj5X3m1gqxp44iB3t/IRFZNrkCkMTE5yX+uOpmNjWtsulLfTQLbcCrDU
         uE9w==
X-Gm-Message-State: AOJu0YzwETIGVZ0AdQMNvWe9mIiPP76e2Ewaukr4pIpxDsVFYiTxdz3Q
	+VfqF+XaRpCqwGCpKoIyiPlgEQu31R64E71hc5GV1Ut2CqNxe25b2n3CG+Rn
X-Gm-Gg: ASbGncsJc+eTQNnhkMDPp5SkcUlU3ZiEXWVcyQmk8TPbJumRuvYIPjaFMR5tG4RTKPv
	RCGUd1JsWWF+JLwtGS+gMOL8q1GGMV2kz3wNq/SoNRWFiEh1x5aD2YqUK+JDGO4ZcH3gPUjQw0j
	1rJUbMPQH08TVqwOcGsFYCemLzEJrvbvxtuSHFXI0jmBH5Vx9p7EfYUlucWtoFdiem0odT0ShS8
	aJwfEaz3Si2M2ERbPTshsLVDr/D5deODh/0e0CSRxCwVC6ualrInxK04BDDzwPLjFLTOYRZmMHk
	WAW1Gr9hqdUm8Z1gXNRfmNgg2flRzw0xlSHy
X-Google-Smtp-Source: AGHT+IHgGG68PrU6nFLc5THORsm777efElXSd1neWExKNAnBGQ06TQ+KrhYVnwt6Of2mJitWXg6+sw==
X-Received: by 2002:a05:6a20:8402:b0:1ee:47e7:7e00 with SMTP id adf61e73a8af0-1fa513b8de9mr9524901637.13.1742372205840;
        Wed, 19 Mar 2025 01:16:45 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::ac74])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-af56e9c95c5sm8704323a12.4.2025.03.19.01.16.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Mar 2025 01:16:45 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH v3 25/27] oeqa: Build cpio with C17 std
Date: Wed, 19 Mar 2025 01:16:07 -0700
Message-ID: <20250319081610.3536475-39-raj.khem@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250319081610.3536475-1-raj.khem@gmail.com>
References: <20250319081610.3536475-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 19 Mar 2025 08:16:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213305

cpio is not yet buildable with C23 standard which is default with
GCC 15, therefore ensure to apply needed bandage to keep it compiling
in C17 mode even with GCC 15

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/lib/oeqa/runtime/cases/buildcpio.py | 4 ++--
 meta/lib/oeqa/sdk/cases/autotools.py     | 4 ++--
 meta/lib/oeqa/selftest/cases/meta_ide.py | 4 ++--
 3 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/meta/lib/oeqa/runtime/cases/buildcpio.py b/meta/lib/oeqa/runtime/cases/buildcpio.py
index 7be734cb4f4..0c9c57a3cb8 100644
--- a/meta/lib/oeqa/runtime/cases/buildcpio.py
+++ b/meta/lib/oeqa/runtime/cases/buildcpio.py
@@ -29,6 +29,6 @@ class BuildCpioTest(OERuntimeTestCase):
     @OEHasPackage(['autoconf'])
     def test_cpio(self):
         self.project.download_archive()
-        self.project.run_configure()
-        self.project.run_make()
+        self.project.run_configure(configure_args="CFLAGS='-std=gnu17 -Dbool=int -Dtrue=1 -Dfalse=0 -Wno-error=implicit-function-declaration'")
+        self.project.run_make(make_args="CFLAGS='-std=gnu17 -Dbool=int -Dtrue=1 -Dfalse=0 -Wno-error=implicit-function-declaration'")
         self.project.run_install()
diff --git a/meta/lib/oeqa/sdk/cases/autotools.py b/meta/lib/oeqa/sdk/cases/autotools.py
index 4bac28f04df..b3a71f2aa50 100644
--- a/meta/lib/oeqa/sdk/cases/autotools.py
+++ b/meta/lib/oeqa/sdk/cases/autotools.py
@@ -35,8 +35,8 @@ class AutotoolsTest(OESDKTestCase):
             self.assertTrue(os.path.isdir(dirs["source"]))
             os.makedirs(dirs["build"])
 
-            self._run("cd {build} && {source}/configure $CONFIGURE_FLAGS".format(**dirs))
-            self._run("cd {build} && make -j".format(**dirs))
+            self._run("cd {build} && {source}/configure CFLAGS='-std=gnu17 -Dbool=int -Dtrue=1 -Dfalse=0 -Wno-error=implicit-function-declaration' $CONFIGURE_FLAGS".format(**dirs))
+            self._run("cd {build} && make CFLAGS='-std=gnu17 -Dbool=int -Dtrue=1 -Dfalse=0 -Wno-error=implicit-function-declaration' -j".format(**dirs))
             self._run("cd {build} && make install DESTDIR={install}".format(**dirs))
 
             self.check_elf(os.path.join(dirs["install"], "usr", "local", "bin", "cpio"))
diff --git a/meta/lib/oeqa/selftest/cases/meta_ide.py b/meta/lib/oeqa/selftest/cases/meta_ide.py
index 5a17ca52ea1..c3a7df4cdf5 100644
--- a/meta/lib/oeqa/selftest/cases/meta_ide.py
+++ b/meta/lib/oeqa/selftest/cases/meta_ide.py
@@ -47,9 +47,9 @@ class MetaIDE(OESelftestTestCase):
                         "https://ftp.gnu.org/gnu/cpio/cpio-2.15.tar.gz",
                         self.tmpdir_metaideQA, self.td['DATETIME'], dl_dir=dl_dir)
         self.project.download_archive()
-        self.assertEqual(self.project.run_configure('$CONFIGURE_FLAGS'), 0,
+        self.assertEqual(self.project.run_configure('CFLAGS="-std=gnu17 -Dbool=int -Dtrue=1 -Dfalse=0 -Wno-error=implicit-function-declaration" $CONFIGURE_FLAGS'), 0,
                         msg="Running configure failed")
-        self.assertEqual(self.project.run_make(), 0,
+        self.assertEqual(self.project.run_make(make_args="CFLAGS='-std=gnu17 -Dbool=int -Dtrue=1 -Dfalse=0 -Wno-error=implicit-function-declaration'"), 0,
                         msg="Running make failed")
         self.assertEqual(self.project.run_install(), 0,
                         msg="Running make install failed")

