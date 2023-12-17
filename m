Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26794C3DA6E
	for <webhook@archiver.kernel.org>; Sun, 17 Dec 2023 23:00:31 +0000 (UTC)
Received: from mail-oo1-f49.google.com (mail-oo1-f49.google.com [209.85.161.49])
 by mx.groups.io with SMTP id smtpd.web11.29345.1702854028155209601
 for <openembedded-core@lists.openembedded.org>;
 Sun, 17 Dec 2023 15:00:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=MqCxeMpu;
 spf=pass (domain: gmail.com, ip: 209.85.161.49, mailfrom: ticotimo@gmail.com)
Received: by mail-oo1-f49.google.com with SMTP id 006d021491bc7-591a6f1385eso1573977eaf.0
        for <openembedded-core@lists.openembedded.org>; Sun, 17 Dec 2023 15:00:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702854027; x=1703458827; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QbLqZjsWCHN+e2zE5A7nzhfCIICqUQomk60qSRq9Ixs=;
        b=MqCxeMpu+86Vuoq89K55GazM3hTlxEgs2aVKH1q9BLv09cLzBrFqf2yWbMtjDVoptV
         xmTAxyxz5c5YM000Rf4+dJXbf2vhJQ2bZhbfH6LzI2tkbVWwpM60to1IamcGkz/GWCMJ
         /fLjtd2Y1wK+YUPOED6Zs+gMBtfBWfhPlry3EcGbTnDnS6Yu85m6HJduTgkq5zQu/hjj
         +j3n+Fhu9WOn9YuXXa++vgAoHPZ6D8RF+VnQNZyPaVAvoVJQZTE47Sj2ExjbsIunVRDr
         x+oxE41/VvOxLjIS8wG0FYCE/0G8yZcoXV2f+JopWG/nuVo1YEBySqRlzcgyHk9VeFci
         OJKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702854027; x=1703458827;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QbLqZjsWCHN+e2zE5A7nzhfCIICqUQomk60qSRq9Ixs=;
        b=MG2FUUhiKzYBgudoLmnyqV0Ko8itrlPeJ+epjIGYneLTYyu2DpLAnSuFv6mmixNcGK
         cE1lwLvmP88/Kgz28rM3BTLxbNuwHM+QkkBXTs7tMEFQ3iX0jMsEL9IX+xgqUJjVW3SW
         6h5zZB1hp8J0YX3QMylO9J17Tes9IO8DkTYvnPpjnAgHe2g17hiUyiB45FpI7VSTgPbm
         koS00fPXyKB4iXZlTOzy0PfTOG5zhM9rO23Ncj0slUayXGcLwQ+pGM0wJF7fAdE9+umB
         o1g8oKDQQTOFww14WnU05OGGZeaQrhRoyUkVuywp5SxNi12C0Dh2CRRaujIZpSd0xN/f
         SlWw==
X-Gm-Message-State: AOJu0YyYGgXuEd7WCep+WtgGEAxx+iHvvN2cx2dZTGlnwpNM0Wo8HbKm
	IFD8J/TxEM1f+629isj8cb6Rm1iEd4I=
X-Google-Smtp-Source: AGHT+IGo2lQYxiOF6e10kLW+3bbJ6/zqrY8WOTV1BOBePg+er8q7NK3FEgcdcjuHM3U0557PrDu8bA==
X-Received: by 2002:a05:6358:7e09:b0:170:17eb:2052 with SMTP id o9-20020a0563587e0900b0017017eb2052mr16638836rwm.59.1702854026719;
        Sun, 17 Dec 2023 15:00:26 -0800 (PST)
Received: from chiron.hsd1.or.comcast.net ([2601:1c0:ca00:cea0:6e3d:56d2:3c7b:de95])
        by smtp.gmail.com with ESMTPSA id 14-20020a17090a19ce00b0028b92b6c657sm161787pjj.2.2023.12.17.15.00.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Dec 2023 15:00:26 -0800 (PST)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <tim.orling@konsulko.com>
To: openembedded-core@lists.openembedded.org
Cc: Tim Orling <tim.orling@konsulko.com>
Subject: [PATCH v2] oeqa: add runtime 'maturin develop' test case
Date: Sun, 17 Dec 2023 14:58:49 -0800
Message-Id: <20231217225848.24271-1-tim.orling@konsulko.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231217225128.22995-1-tim.orling@konsulko.com>
References: <20231217225128.22995-1-tim.orling@konsulko.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 17 Dec 2023 23:00:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192593

Similar to the sdk test case, build the "guessing-game" example from
https://maturin.rs/tutorial

This test case:
* creates a python3 venv
* echoes "nameserver 8.8.8.8" to /etc/resolv.conf as we need to have
  functional DNS to fetch the crates on target
* fetches crates, builds guessing-game crate and wheel

Put the following in your local.conf:

EXTRA_IMAGE_FEATURES += "tools-sdk"
SDK_INCLUDE_TOOLCHAIN = '1'
SDK_TOOLCHAIN_LANGS += 'rust'

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
Changes in v2:
  Clarify that tools-sdk is required in the image, plus
  we need the 'rust' toolchain lang

Tested on qemuarm64 core-image-full-cmdline

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


