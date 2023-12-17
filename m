Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B394C3DA6E
	for <webhook@archiver.kernel.org>; Sun, 17 Dec 2023 22:52:41 +0000 (UTC)
Received: from mail-il1-f171.google.com (mail-il1-f171.google.com [209.85.166.171])
 by mx.groups.io with SMTP id smtpd.web11.29097.1702853553109358928
 for <openembedded-core@lists.openembedded.org>;
 Sun, 17 Dec 2023 14:52:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=TUGuqxfX;
 spf=pass (domain: gmail.com, ip: 209.85.166.171, mailfrom: ticotimo@gmail.com)
Received: by mail-il1-f171.google.com with SMTP id e9e14a558f8ab-35fb3f49bf6so340365ab.2
        for <openembedded-core@lists.openembedded.org>; Sun, 17 Dec 2023 14:52:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702853552; x=1703458352; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=iY8bvQ6ZUTttP2WRQb3H1CXPzXobrCe7wtRw+vktuzU=;
        b=TUGuqxfXGNOKrvOxHLqutjGBoiNA+w5iO4fe9+kjVdUEa+tDPW3qhvv5jJMOG926zh
         uDovMcvkd5XyhCT/WefUAELLGmB6o+xq+tThlMhZ8jstQnFYDgV67WHmCsJ0lTE8OZWz
         ZLAm4pbm9dYIO+XtQizV/MSwOc8/3aDBhLoo3G089MLHiDAyrkoDfTc7sGGodxoWaJBZ
         ZfiLl7eamqVbROPHz4UCipfu6eo3iyTm2jIyETL2U+sbR2bbJr0GFC1r9Nf2JGjUKqJ+
         2rHn59z9X+2mEJOz+yGYvRaAtG0JGGtdCDwsbhOVJjYj7bKN8RDy4JPvVPTqvwaiDZwC
         Wi1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702853552; x=1703458352;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iY8bvQ6ZUTttP2WRQb3H1CXPzXobrCe7wtRw+vktuzU=;
        b=bNjaMQq6gldX1klXBt7yDWZ3r0OIdPtdAzpl/rLHzdPsv5So3E9Ar2Vx2HTDpLNvJW
         RtE7bpxLjca4VuKtQKkOd6yOf9nHYWX0HMbzJC3coyeTHUDs2f4pR8PP4b8/OxKQ0QOF
         m21uqbjWSv8gZ6fPXBDZFkLEbpS95tdr/OeP3BdqCzFDhhNz+5VV5Rl+mDRkt5c27DZA
         V8psh1wynBHee5lee7kvkM1L0x9vcWqivg70LRWNWIDT3za6Dn5fx2P+Q3gNUa9AdWeI
         qiBFebRpGKMpuhKp948+uV4pdTLLo99UIxr2Pc7TQ5dboiY+WgeHc0+T3PV7sGlbt7j7
         GVOQ==
X-Gm-Message-State: AOJu0YwNjXrnx8B4qnCQxdNQneL0RhZULB9ajQZRiFmAMHSTQFChMXze
	CRbBOJmwRIYAV0EIv47/zoK2ioWlQHU=
X-Google-Smtp-Source: AGHT+IFp5VtVBxPtqdFuhkO1FvHH63BvgAGkLpO4MGtBq4iLxqbkxoBeBmt8G1xFARI2wunAJPHD/w==
X-Received: by 2002:a05:6e02:12e4:b0:35d:58ce:2322 with SMTP id l4-20020a056e0212e400b0035d58ce2322mr23107628iln.5.1702853551722;
        Sun, 17 Dec 2023 14:52:31 -0800 (PST)
Received: from chiron.hsd1.or.comcast.net ([2601:1c0:ca00:cea0:6e3d:56d2:3c7b:de95])
        by smtp.gmail.com with ESMTPSA id 29-20020a17090a005d00b0028b470be8b6sm3769944pjb.8.2023.12.17.14.52.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Dec 2023 14:52:31 -0800 (PST)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <tim.orling@konsulko.com>
To: openembedded-core@lists.openembedded.org
Cc: Tim Orling <tim.orling@konsulko.com>
Subject: [PATCH] oeqa: add runtime 'maturin develop' test case
Date: Sun, 17 Dec 2023 14:51:29 -0800
Message-Id: <20231217225128.22995-1-tim.orling@konsulko.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 17 Dec 2023 22:52:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192592

Similar to the sdk test case, build the "guessing-game" example from
https://maturin.rs/tutorial

This test case:
* creates a python3 venv
* echoes "nameserver 8.8.8.8" to /etc/resolv.conf as we need to have
  functional DNS to fetch the crates on target
* fetches crates, builds guessing-game crate and wheel

Put the following in your local.conf:

IMAGE_INSTALL:append = " python3-maturin"

IMAGE_CLASSES += "testimage"
TEST_QEMUPARAMS ?= "-m 8192 -smp 4"
IMAGE_ROOTFS_EXTRA_SPACE = "10000000"
NOHDD="1"
NOISO="1"

TEST_SUITES = "ping ssh python maturin"

Test with:

bitbake core-image-full-cmdline
bitbake -c testimage core-image-full-cmdline

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
 meta/lib/oeqa/runtime/cases/maturin.py | 35 ++++++++++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/meta/lib/oeqa/runtime/cases/maturin.py b/meta/lib/oeqa/runtime/cases/maturin.py
index b9a3b4acbcd..4e6384fe5e6 100644
--- a/meta/lib/oeqa/runtime/cases/maturin.py
+++ b/meta/lib/oeqa/runtime/cases/maturin.py
@@ -10,6 +10,7 @@ from oeqa.runtime.case import OERuntimeTestCase
 from oeqa.core.decorator.depends import OETestDepends
 from oeqa.runtime.decorator.package import OEHasPackage
 
+
 class MaturinTest(OERuntimeTestCase):
     @OETestDepends(['ssh.SSHTest.test_ssh', 'python.PythonTest.test_python3'])
     @OEHasPackage(['python3-maturin'])
@@ -21,3 +22,37 @@ class MaturinTest(OERuntimeTestCase):
         python_version = "%s.%s" % (py_major, py_minor)
         self.assertEqual(output, "🐍 1 python interpreter found:\n"
                                  " - CPython %s at /usr/bin/python%s" % (python_version, python_version))
+
+
+class MaturinDevelopTest(OERuntimeTestCase):
+    @classmethod
+    def setUp(cls):
+        dst = '/tmp'
+        src = os.path.join(cls.tc.files_dir, "maturin/guessing-game")
+        cls.tc.target.copyTo(src, dst)
+
+    @classmethod
+    def tearDown(cls):
+        cls.tc.target.run('rm -rf %s' %  '/tmp/guessing-game/target')
+
+    @OETestDepends(['ssh.SSHTest.test_ssh', 'python.PythonTest.test_python3'])
+    @OEHasPackage(['python3-maturin'])
+    def test_maturin_develop(self):
+        """
+        This test case requires:
+          (1) that a .venv can been created.
+          (2) DNS nameserver to resolve crate URIs for fetching
+          (3) a functional 'rustc' and 'cargo'
+        """
+        targetdir = os.path.join("/tmp", "guessing-game")
+        self.target.run("cd %s; python3 -m venv .venv" % targetdir)
+        self.target.run("echo 'nameserver 8.8.8.8' > /etc/resolv.conf")
+        cmd = "cd %s; maturin develop" % targetdir
+        status, output = self.target.run(cmd)
+        self.assertRegex(output, r"🔗 Found pyo3 bindings with abi3 support for Python ≥ 3.8")
+        self.assertRegex(output, r"🐍 Not using a specific python interpreter")
+        self.assertRegex(output, r"📡 Using build options features from pyproject.toml")
+        self.assertRegex(output, r"Compiling guessing-game v0.1.0")
+        self.assertRegex(output, r"📦 Built wheel for abi3 Python ≥ 3.8")
+        self.assertRegex(output, r"🛠 Installed guessing-game-0.1.0")
+        self.assertEqual(status, 0)
-- 
2.34.1


