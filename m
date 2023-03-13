Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7396BC7618B
	for <webhook@archiver.kernel.org>; Mon, 13 Mar 2023 12:16:04 +0000 (UTC)
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
 by mx.groups.io with SMTP id smtpd.web10.17701.1678709761506297772
 for <openembedded-core@lists.openembedded.org>;
 Mon, 13 Mar 2023 05:16:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=E6LywRHs;
 spf=pass (domain: gmail.com, ip: 209.85.208.45, mailfrom: martin.jansa@gmail.com)
Received: by mail-ed1-f45.google.com with SMTP id x3so47782359edb.10
        for <openembedded-core@lists.openembedded.org>; Mon, 13 Mar 2023 05:16:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678709760;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=57WaDLJG9kvhgQCcZ9Eyd3zHWgrC1gV3xBCF+F7P/Lc=;
        b=E6LywRHsQ+Zk5KBBhliAFgxTNSGeDEN+VG8s3/WQZU/+0JAvHuthJINJQPYMQdlnDp
         XGWTIqBqgvNTskXHRNBK+iE7mEaLJBA6iZXLsrUuORmK4sEDecV+B7x9MABo25iId5O/
         NIfYtVhjMjw1OxoAkXkO8dFGGBrVAXyX+XOKeCz7YxXMEAmDbhSIfWNJ0apTLeiD2PjA
         pLoK9OsNmxBCcsjCY8iKU3DXeVfarY9vblw2RBpZ53WsL9sXzuEQXY4bKz96UDqLt87Q
         IBVSigL2qMm/EXagDKg0Sieam9kersSPhPGLROboqk18pmzaM1Ug0kbz/eZveWNXWoTq
         CUAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678709760;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=57WaDLJG9kvhgQCcZ9Eyd3zHWgrC1gV3xBCF+F7P/Lc=;
        b=NEs1X7f7TIZT0p4Pu/Ox6qQToO7P3e5YEgQhc8IADIgRb6VNm+6liBH9mULPi3HEw8
         OMElMWiEHbSTJG/+ZuLUxf1g+ZZAhLmbeDgsK35dD29Oi/iVQThearkFT+Yspi718uhZ
         9HtITE5oYQg3Gu5F0BEn7FeFPyf8rzO8gxXSV6G9b4IXVlTv4rKtcg0xGAn/WTZRUTIA
         Qgo/Fghm+4ag0/XG3aBym9jnNZ7Y8wfO6LVCaXIVtztLPpZPNRLpJW0LocZCYbtYD2GU
         r95B5151rv4DRbKMb9CImeqIYLVdpXBBWVqeu/JQ59NrMUghivSvH32ospKItoXGelNH
         403g==
X-Gm-Message-State: AO0yUKVnzklckFIAJx0HtCise6PY8JLvNudS3FZqklrqaMYkzjB3z/Df
	xtnsRIUMvW78nnYQP50Euk/w3s7LyrQ=
X-Google-Smtp-Source: AK7set8YUtUVoan8WRlf+pzmALxWTdL6QT5OYMYLyNs9OZrLZ+s5bDG10zx2DOT7shk2/L/m3Ep1GA==
X-Received: by 2002:a17:906:66d8:b0:872:b17a:9b59 with SMTP id k24-20020a17090666d800b00872b17a9b59mr32505477ejp.38.1678709760058;
        Mon, 13 Mar 2023 05:16:00 -0700 (PDT)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id hb1-20020a170906b88100b008e385438c76sm3393559ejb.55.2023.03.13.05.15.59
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Mar 2023 05:15:59 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 11/14] selftest: minidebuginfo.py respect IMAGE_LINK_NAME
Date: Mon, 13 Mar 2023 13:15:38 +0100
Message-Id: <7e8b511f1c9772a23c7666062883f15dac90a472.1678709427.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1678709427.git.Martin.Jansa@gmail.com>
References: <cover.1678709427.git.Martin.Jansa@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 13 Mar 2023 12:16:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178443

* use IMAGE_LINK_NAME instead of hardcoding
  core-image-minimal-${MACHINE} assumption

[YOCTO #12937]

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/lib/oeqa/selftest/cases/minidebuginfo.py | 15 ++++++++-------
 1 file changed, 8 insertions(+), 7 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/minidebuginfo.py b/meta/lib/oeqa/selftest/cases/minidebuginfo.py
index 7947c3803c..aa1f9fa1f7 100644
--- a/meta/lib/oeqa/selftest/cases/minidebuginfo.py
+++ b/meta/lib/oeqa/selftest/cases/minidebuginfo.py
@@ -9,7 +9,7 @@ import tempfile
 import shutil
 
 from oeqa.selftest.case import OESelftestTestCase
-from oeqa.utils.commands import bitbake, get_bb_var, runCmd
+from oeqa.utils.commands import bitbake, get_bb_var, get_bb_vars, runCmd
 
 
 class Minidebuginfo(OESelftestTestCase):
@@ -17,27 +17,28 @@ class Minidebuginfo(OESelftestTestCase):
         target_sys = get_bb_var("TARGET_SYS")
         binutils = "binutils-cross-{}".format(get_bb_var("TARGET_ARCH"))
 
+        image = 'core-image-minimal'
+        bb_vars = get_bb_vars(['DEPLOY_DIR_IMAGE', 'IMAGE_LINK_NAME', 'READELF'], image)
+
         self.write_config("""
 PACKAGE_MINIDEBUGINFO = "1"
 IMAGE_FSTYPES = "tar.bz2"
 """)
-        bitbake("core-image-minimal {}:do_addto_recipe_sysroot".format(binutils))
+        bitbake("{} {}:do_addto_recipe_sysroot".format(image, binutils))
 
-        deploy_dir = get_bb_var("DEPLOY_DIR_IMAGE")
         native_sysroot = get_bb_var("RECIPE_SYSROOT_NATIVE", binutils)
-        readelf = get_bb_var("READELF", "core-image-minimal")
 
         # confirm that executables and shared libraries contain an ELF section
         # ".gnu_debugdata" which stores minidebuginfo.
         with tempfile.TemporaryDirectory(prefix = "unpackfs-") as unpackedfs:
-            filename = os.path.join(deploy_dir, "core-image-minimal-{}.tar.bz2".format(self.td["MACHINE"]))
+            filename = os.path.join(bb_vars['DEPLOY_DIR_IMAGE'], "{}.tar.bz2".format(bb_vars['IMAGE_LINK_NAME']))
             shutil.unpack_archive(filename, unpackedfs)
 
-            r = runCmd([readelf, "-W", "-S", os.path.join(unpackedfs, "bin", "busybox")],
+            r = runCmd([bb_vars['READELF'], "-W", "-S", os.path.join(unpackedfs, "bin", "busybox")],
                     native_sysroot = native_sysroot, target_sys = target_sys)
             self.assertIn(".gnu_debugdata", r.output)
 
-            r = runCmd([readelf, "-W", "-S", os.path.join(unpackedfs, "lib", "libc.so.6")],
+            r = runCmd([bb_vars['READELF'], "-W", "-S", os.path.join(unpackedfs, "lib", "libc.so.6")],
                     native_sysroot = native_sysroot, target_sys = target_sys)
             self.assertIn(".gnu_debugdata", r.output)
 
-- 
2.39.2


