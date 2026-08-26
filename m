Return-Path: <anis.bougrine10@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82605C61DC2
	for <webhook@archiver.kernel.org>; Wed, 26 Aug 2026 23:35:17 +0000 (UTC)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.25441.1787787311340118641
 for <openembedded-core@lists.openembedded.org>;
 Wed, 26 Aug 2026 16:35:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=f0wA8Kda;
 spf=pass (domain: gmail.com, ip: 209.85.221.48, mailfrom: anis.bougrine10@gmail.com)
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-4798bea72f9so12358f8f.1
        for <openembedded-core@lists.openembedded.org>; Wed, 26 Aug 2026 16:35:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787787309; x=1788392109; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aFoaCGU/E7r35Ev/015AJ40oWtNKX5BLk/CBSImuQ+k=;
        b=f0wA8Kdaoz8/tJW/DCA8WbjkxYAn2nyHTjveBUyqGsDQDy4eCGWKXd1kyBQw2pOUDY
         ugsiqYPwQH9ozUGrtNcXu04sNrvUVaiCMjGmp2WYw4EzuM8mSO+va25+t9YMcBcPVasG
         /BwYMl6kds2rNAjsjknBio+gf3gKu3hyLA82c/WfqfYdriGjavdLtE+7dxlyj2uB7ij4
         rt/Z2CpXxdXA0Q4oMkXqo65HvKipm/bRgZX5MN+ipbs8IxHx0NRXMwonNdH/Mk8z19fa
         Y7HZm1dCCyhMPl/EuoTj5PUAN8MwyVQhtm41nblXvnGnwZ76MlL7hJzd8aUFXN1axTOy
         5pug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787787309; x=1788392109;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=aFoaCGU/E7r35Ev/015AJ40oWtNKX5BLk/CBSImuQ+k=;
        b=kuG0XgPaQ4GBuQvk5q74rcBxb42VWUT4QQd2OBj8eC0Sa9GfzvTcHmmBmB5NazoLT8
         1aigLNFtHJM+UTPFukdUnIXnYrUMKJdp7u+vKSpMypOUleuPxgr9rsUGEakguNRlBINL
         4G1q0pk12jpUfzbPw19h0NHfgUGhDmL0OMmHgV+zfdkAv+aMFh24urIfnsILto8NwNvd
         4jYEYw45tCUiX8CCGJls4JtCeNgCZWNgxyWkB/6Rh3iphNALiHfV3ZL/ria/EtNpRxDv
         qugOXHi7QYeASVU3evRkgl6ecwYDGEdtk/Mk0uEPedYU1/QNpAiSiAmP8EGRydMYJFL/
         JExA==
X-Gm-Message-State: AFuF++kCTPom+lxOjuMfdU+VkILl6+njZj2t5GVmDc6xHDaPY1dq9K+o
	+7npY+PYlx2dcsmomQscSwz+kNpzxeMeuPb3QHLBI29dQpDIOzehChFaSXPsP5WTgrs=
X-Gm-Gg: AR+sD113mpyy8M7Dxyk/Rng+mcmjBE5SQziwa2QgOiYtPiC/0UPJzDt7+GQsyegZrBO
	tLdiipbroghcbgHyDwb96NHOn8sjXh9r2YroY22G9x7e2gUrHJ+Wvj1C/fXHTVB1pDlICngRlHb
	eTus/LXQp7D2/qOjHkGecifZUdfORDb0mypCvKtU7zVaa/MOos+THAPZjObkPGBFkK3ip1lgq6U
	pAVCgCJnvW2iRumuO7Oe8D1WQgwct3/lXieIxeBe9OSmbHVjyecTOYvXCwnxqSTMkyhvZeSoEnZ
	QyZUpbTWTP/L2GCHuqUjj7LNiOSHKXYa58eShylz7mULCY3BmzwGsK2i5X0Po3P4oLuWiiffbDp
	InYZkifriNTyHGA1MbCbeGsFF5Ta5tGNgrEOvPuviqte+1zw/nIyItifWgwB+swrvEgfhp3IT5G
	LVCXUj0sv97eS8w+mzQ1ZbwVb+4X3F/+X5kunyJheKt5MKAVtKqiM8JoFRwRMFf/ylhYXHXnl7o
	VF/a/ipT4UGmRk7057hE2GE1/Sl9bSpIACAw8bCGNOFvXo++xvwih8z7DRQjlSlbZ1zl6NjqnPQ
	Hu0gHZW5uc8=
X-Received: by 2002:a05:6000:2889:b0:47f:96f9:a99f with SMTP id ffacd0b85a97d-482e26b375cmr10909377f8f.13.1787787309391;
        Wed, 26 Aug 2026 16:35:09 -0700 (PDT)
Received: from device-137.home ([2a01:cb15:80cf:2100:f9af:e499:eded:1124])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482e27ab569sm4586872f8f.16.2026.08.26.16.35.08
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 26 Aug 2026 16:35:09 -0700 (PDT)
From: Anis Bougrine <anis.bougrine10@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: richard.purdie@linuxfoundation.org,
	Anis Bougrine <anis.bougrine10@gmail.com>,
	Ross Burton <ross.burton@arm.com>
Subject: [OE-core][PATCH v7 1/5] lib/oe/kernel_module.py: add get_ext_mod function for module signing
Date: Thu, 27 Aug 2026 01:34:12 +0200
Message-ID: <20260826233416.37047-2-anis.bougrine10@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260826233416.37047-1-anis.bougrine10@gmail.com>
References: <20260826233416.37047-1-anis.bougrine10@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 26 Aug 2026 23:35:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244436

Fixes [YOCTO #12927]

Out-of-tree module Makefiles invoke the kernel Makefile by appending
the M= (the module directory) variable to the MAKEFLAGS.
However, they usually do not provide a modules_sign target. Therefore,
the kernel modules_sign target has to be invoked manually after retrieving
M= variable from package source code Makefile.

This function retrieves the M= variable from an external module Makefile.

Reported-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Anis Bougrine <anis.bougrine10@gmail.com>
---
 meta/lib/oe/__init__.py      |  2 +-
 meta/lib/oe/kernel_module.py | 21 +++++++++++++++++++++
 2 files changed, 22 insertions(+), 1 deletion(-)

diff --git a/meta/lib/oe/__init__.py b/meta/lib/oe/__init__.py
index d8db84dc9a..7357a71f27 100644
--- a/meta/lib/oe/__init__.py
+++ b/meta/lib/oe/__init__.py
@@ -12,4 +12,4 @@ __path__ = extend_path(__path__, __name__)
 BBIMPORTS = ["qa", "data", "path", "utils", "types", "package", "packagedata", \
              "packagegroup", "sstatesig", "lsb", "cachedpath", "license", "qemu", \
              "reproducible", "rust", "buildcfg", "go", "spdx30_tasks", "spdx_common", \
-             "cve_check", "tune", "classextend", "purl", "kernel", "sanity"]
+             "cve_check", "tune", "classextend", "purl", "kernel", "kernel_module", "sanity"]
diff --git a/meta/lib/oe/kernel_module.py b/meta/lib/oe/kernel_module.py
index 0d27fbaa57..edf723033f 100644
--- a/meta/lib/oe/kernel_module.py
+++ b/meta/lib/oe/kernel_module.py
@@ -25,3 +25,24 @@ def kernel_module_os_env(d, env_dict):
         env_dict['KBUILD_EXTRA_SYMBOLS'] = kbuild_extra_symbols
     else:
         env_dict['KBUILD_EXTRA_SYMBOLS'] = ''
+
+def get_ext_mod(d):
+    """
+    Extract the resolved Kbuild M= variable from an out of tree module Makefile variable database.
+    """
+    import re
+    import bb.process
+
+    try:
+        output = bb.process.run(
+            "make -C %s --dry-run --print-data-base" % d.getVar("B")
+        )[0]
+    except bb.process.ExecutionError:
+        return d.getVar("S")
+
+    for line in output.splitlines():
+        m = re.match(r'^M\s*=\s*(.*)$', line)
+        if m:
+            return m.group(1).strip()
+
+    return d.getVar("S")
-- 
2.50.1 (Apple Git-155)


