Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92DD2C36001
	for <webhook@archiver.kernel.org>; Wed, 19 Mar 2025 21:42:30 +0000 (UTC)
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
 by mx.groups.io with SMTP id smtpd.web11.7379.1742420544300597638
 for <openembedded-core@lists.openembedded.org>;
 Wed, 19 Mar 2025 14:42:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=jfuTJFFG;
 spf=pass (domain: gmail.com, ip: 209.85.214.176, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-225fbdfc17dso435785ad.3
        for <openembedded-core@lists.openembedded.org>; Wed, 19 Mar 2025 14:42:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742420543; x=1743025343; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ftw19h+kZia5z8eykazgmejMJjyL9nIfAhDfR4uaeEA=;
        b=jfuTJFFGHvvELxdV9kVmehrzj61vdN5Zjss9uoACp4wVR6eileg6voBKurW2TumWjE
         38/Bzoratw4Dtj/wac+9stjMfvbrLo5IK5fz7g1Tb2KQJm3aknl4UfV5EeV+L/UMuPiK
         Gw6o1aoANd/kcWKz6N5qVrMZJnDPjoiaX5OKOuhGrLmZM7gB4o6FrMx0FPz4YsM04PIX
         fcyksY4T3eAPcyBlLXsiVYDyxKbnFfTkPKO0ggI6qkQiO/9CAdQRgI7k6iK5K1WknbhJ
         P0w+m+p5yRLyN1ahvJ3miIEzEtUbdivSiz4UEoCOepp4QFSod6m4MkAnFCM1rEZTiV+b
         e6sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742420543; x=1743025343;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ftw19h+kZia5z8eykazgmejMJjyL9nIfAhDfR4uaeEA=;
        b=dOA8O2aYxMkrWmzFOPTUzNWJLtjFMyZekOPqO+4wGBpof/DD0U12fOAiplGzW+M5eV
         7v9USoRYgUuxQFGbUrGPqbxgONkZJJ2daltGgOlDMVBKyCUyqY20QW5nmwPHqAbe8/O5
         ENEkVTgCMwXSTuJgNv4YL98gl0UThf5mZLqM/vsxqVmeo81cBcszS1ckGzHCZLWa2zJq
         TCIcseqo876Xl07CNF2+nOk9fBzI9GOUUYF0jYOJcoLP/SpX8iPu0yAZfH2+wgh96RUP
         gPqdd/Rs9NIfrAl6faxOsZukFgIwgEEKm7gthyk58e+IUrKmcCodYSulWbVPL9TdNHLF
         WMGA==
X-Gm-Message-State: AOJu0YwynLDdVxYyArDQGLf1OL9Z2DzzSZRC0GBPFnmoU6yGvy2cr6EA
	AaS5fCJU9v4NYBJdU99Wy6lqdiJeKUC/mt6GSrV49EVnk8kR33+qyGp7BPaP
X-Gm-Gg: ASbGncsatY/ELxduqcq+QTV9QpRJfRx82stXpDZpzVr6g/ffSRoqgL8hPaqTG65rR+i
	m4oSplrkgVgIqJB58k9YrVDPNOHZdKf7AiKJgm+GSzZvr26u//Jt91YjVsVyGgmZv9zV6dorbIU
	GTOIxGOJp8Lv39hbmYm6bOO7Mr3bmph4dwQYYUw2AOzqxMoY03nZN/WLXaXT4gCzTvf7uV8m7Ni
	qogpI8s5s7lqHtLKbfsJbjQVFf34prd2Rizd+SuPnUpxyVVd51rOki292zifqhkAqVQCybQuMdA
	BaQFmF6XgcBQG937yW/wtsZBjSoPq951wiVc
X-Google-Smtp-Source: AGHT+IGEuh4sham9Qfbu516n8sQ5JsmoxIdeHfMqMDIfqiIvZyRGBs/J+GuH4HAU3TEJFk3CH6jEng==
X-Received: by 2002:a05:6a20:4387:b0:1f3:36f7:c0d2 with SMTP id adf61e73a8af0-1fbed5fe86bmr7868847637.41.1742420543442;
        Wed, 19 Mar 2025 14:42:23 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::ac74])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73766322e03sm3604964b3a.99.2025.03.19.14.42.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Mar 2025 14:42:22 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH v4 7/9] oeqa: Build cpio with C17 std
Date: Wed, 19 Mar 2025 14:42:10 -0700
Message-ID: <20250319214213.2505249-7-raj.khem@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250319214213.2505249-1-raj.khem@gmail.com>
References: <20250319214213.2505249-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 19 Mar 2025 21:42:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213362

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

