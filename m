Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A134FF8851
	for <webhook@archiver.kernel.org>; Fri, 24 Apr 2026 20:57:03 +0000 (UTC)
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com [209.85.128.68])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.31972.1777064212827576691
 for <openembedded-core@lists.openembedded.org>;
 Fri, 24 Apr 2026 13:56:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=O3Aae69Z;
 spf=pass (domain: smile.fr, ip: 209.85.128.68, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f68.google.com with SMTP id 5b1f17b1804b1-483487335c2so80856935e9.2
        for <openembedded-core@lists.openembedded.org>; Fri, 24 Apr 2026 13:56:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1777064211; x=1777669011; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qozM4YuVB+E8yz5SkZyKTb9/T6T5zkYDAMFZ/1shzak=;
        b=O3Aae69ZvIZsj5k73KKHIi3k/v7iw5biwpXmtk548dcD07kL0XcTJ3vNfXHw7FWHns
         TNfAZzzDMmc4Q3jwSUGlUfHG2pVSXZhgURQAb3kA5T5vzJPu3JZ1pO49DnKqMyEnPbsf
         y2EMb+GpUAG3CI8iIsDS8yz3Wo1mGuBq/tqwY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777064211; x=1777669011;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=qozM4YuVB+E8yz5SkZyKTb9/T6T5zkYDAMFZ/1shzak=;
        b=khc6UcoLwNTQLFOGd3W6LaqjTZP9tWh7zdoH6rzscbr3OyAcEt1ORv6bpgAMQ6vlk9
         0juhrKRmPBfvItI9FZKogurBMhCXkZ1v+GGO3nN34D4vTmr2FcBQ1u93SBC7tmvagbpp
         x2bzoBK3SBAO/OTVULmfYFtQdaOMldRzUNjbn76T6JID1jLDudQE1EsrnTBt59aCnlWk
         p2lea4zNxY4fHYq9jhgTT40wYO2oGvP7nvDTF2TrKYfl4v/KwyVeuM6IGckunDY4nQT6
         bvbP86GX1bERB4KSaoEoRkch209HssXAAROwtvOF1gjIhtvtmLc0d8qQ+nX7nwgJ4WrH
         wKgA==
X-Gm-Message-State: AOJu0YyQLvMWKWQDzFGInNAbd2PmCKZ/6tgzIpgbsX9CqbLVpAY9FR6u
	GdPE6513zsUQyQrBckaa/qiRzD4prodiMamrTjZyrnYd6jozHKXy8Qf8lFytXR68bTL62OcbQf2
	1/yn6dQ15gDWx
X-Gm-Gg: AeBDiesLYnOUCcvJSueQFj8NFWyUBKkQg5pHx7MoxUWqY2ZNxFJG9qORZHhQM1z0hzH
	6iMKxjsjtYtE4Q2uuCiqZlRTx0wyNuOb5ABtiQ00QLw3Upn7b9IZY43eSy4bXHQKDY2GlgydAzO
	Lfnk4z7i01VyJGa30UyZPgwYd6PdC7TQ35T3PNKgOUHPhv1xd17Gqz5xeeZaZTBRjgc9PfUqOCR
	TqyUQ1VC1VewivQ6n20Qc9n4Rh4tOLhW+DZLs1ykS8JUTp5LDfIRcbhipTvYAriBcmztEaDfthv
	VkphNbMKr63F8mKhGy25t/Fkn5933QrgsYrWEkiKrNIR0Q4qETlmMHLapl8rvuI4vi6ykhxR3X0
	zPz0GQd7T4kyOZEE2sQSnJJ2JznYo6JqgImhYoIWmLzDOiQIB0IkGXNgUVKkhX2s5oLNA5Dde1c
	2PQeDhRPfYhMx0HtemXHi2pOua624fyXX93CVCkVMkhnPodpaLPzLxpmZQGoVTQa92ru7FL2QfO
	xGX2N6NBixAz6tqlp4F/8gZpl5UqCWVBmoiFA==
X-Received: by 2002:a05:600c:8284:b0:489:1f3e:5f69 with SMTP id 5b1f17b1804b1-4891f3e629bmr326672205e9.18.1777064210980;
        Fri, 24 Apr 2026 13:56:50 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4891cca5743sm394841005e9.9.2026.04.24.13.56.50
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Apr 2026 13:56:50 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 24/66] python3-wheel: fix CVE-2026-24049
Date: Fri, 24 Apr 2026 22:55:23 +0200
Message-ID: <aa7465ce6a3d82629abeaa9b6d199b465b449d43.1777064068.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1777064068.git.yoann.congal@smile.fr>
References: <cover.1777064068.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 24 Apr 2026 20:57:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235897

From: Guocai He <guocai.he.cn@windriver.com>

Backport patch to fix CVE-2026-24049 per reference [1] [2].

[1] https://security-tracker.debian.org/tracker/CVE-2026-24049
[2] https://github.com/pypa/wheel/commit/7a7d2de96b

Signed-off-by: Guocai He <guocai.he.cn@windriver.com>
Signed-off-by: Jinfeng Wang <jinfeng.wang.cn@windriver.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../python/python3-wheel/CVE-2026-24049.patch | 73 +++++++++++++++++++
 .../python/python3-wheel_0.42.0.bb            |  2 +
 2 files changed, 75 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3-wheel/CVE-2026-24049.patch

diff --git a/meta/recipes-devtools/python/python3-wheel/CVE-2026-24049.patch b/meta/recipes-devtools/python/python3-wheel/CVE-2026-24049.patch
new file mode 100644
index 00000000000..89a848c1007
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-wheel/CVE-2026-24049.patch
@@ -0,0 +1,73 @@
+From 363aef740d670c37d76b6fd86e2a28886de23f45 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Alex=20Gr=C3=B6nholm?= <alex.gronholm@nextday.fi>
+Date: Thu, 22 Jan 2026 01:41:14 +0200
+Subject: [PATCH] Fixed security issue around wheel unpack (#675)
+
+A maliciously crafted wheel could cause the permissions of a file outside the unpack tree to be altered.
+
+Fixes CVE-2026-24049.
+
+CVE: CVE-2026-24049
+
+In test case, the API "run_command" is not defined and use "unpack" directly.
+ 
+Upstream-Status: Backport [https://github.com/pypa/wheel/commit/7a7d2de96b]
+
+Signed-off-by: Guocai He <guocai.he.cn@windriver.com>
+---
+ src/wheel/cli/unpack.py  |  4 ++--
+ tests/cli/test_unpack.py | 22 ++++++++++++++++++++++
+ 2 files changed, 24 insertions(+), 2 deletions(-)
+
+diff --git a/src/wheel/cli/unpack.py b/src/wheel/cli/unpack.py
+index d48840e..83dc742 100644
+--- a/src/wheel/cli/unpack.py
++++ b/src/wheel/cli/unpack.py
+@@ -19,12 +19,12 @@ def unpack(path: str, dest: str = ".") -> None:
+         destination = Path(dest) / namever
+         print(f"Unpacking to: {destination}...", end="", flush=True)
+         for zinfo in wf.filelist:
+-            wf.extract(zinfo, destination)
++            target_path = Path(wf.extract(zinfo, destination))
+ 
+             # Set permissions to the same values as they were set in the archive
+             # We have to do this manually due to
+             # https://github.com/python/cpython/issues/59999
+             permissions = zinfo.external_attr >> 16 & 0o777
+-            destination.joinpath(zinfo.filename).chmod(permissions)
++            target_path.chmod(permissions)
+ 
+     print("OK")
+diff --git a/tests/cli/test_unpack.py b/tests/cli/test_unpack.py
+index ae584af..96d1391 100644
+--- a/tests/cli/test_unpack.py
++++ b/tests/cli/test_unpack.py
+@@ -34,3 +34,25 @@ def test_unpack_executable_bit(tmp_path):
+     unpack(str(wheel_path), str(tmp_path))
+     assert not script_path.is_dir()
+     assert stat.S_IMODE(script_path.stat().st_mode) == 0o755
++
++@pytest.mark.skipif(
++    platform.system() == "Windows", reason="Windows does not support chmod()"
++)
++def test_chmod_outside_unpack_tree(tmp_path_factory: TempPathFactory) -> None:
++    wheel_path = tmp_path_factory.mktemp("build") / "test-1.0-py3-none-any.whl"
++    with WheelFile(wheel_path, "w") as wf:
++        wf.writestr(
++            "test-1.0.dist-info/METADATA",
++            "Metadata-Version: 2.4\nName: test\nVersion: 1.0\n",
++        )
++        wf.writestr("../../system-file", b"malicious data")
++
++    extract_root_path = tmp_path_factory.mktemp("extract")
++    system_file = extract_root_path / "system-file"
++    extract_path = extract_root_path / "subdir"
++    system_file.write_bytes(b"important data")
++    system_file.chmod(0o755)
++    unpack(str(wheel_path), str(extract_path))
++
++    assert system_file.read_bytes() == b"important data"
++    assert stat.S_IMODE(system_file.stat().st_mode) == 0o755
+--
+2.34.1
+
diff --git a/meta/recipes-devtools/python/python3-wheel_0.42.0.bb b/meta/recipes-devtools/python/python3-wheel_0.42.0.bb
index 807888e6c00..934f258a93d 100644
--- a/meta/recipes-devtools/python/python3-wheel_0.42.0.bb
+++ b/meta/recipes-devtools/python/python3-wheel_0.42.0.bb
@@ -8,6 +8,8 @@ SRC_URI[sha256sum] = "c45be39f7882c9d34243236f2d63cbd58039e360f85d0913425fbd7cee
 
 inherit python_flit_core pypi
 
+SRC_URI += "file://CVE-2026-24049.patch"
+
 BBCLASSEXTEND = "native nativesdk"
 
 # This used to use the bootstrap install which didn't compile. Until we bump the

