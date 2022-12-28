Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1BB99C63705
	for <webhook@archiver.kernel.org>; Wed, 28 Dec 2022 07:37:43 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.web11.177174.1672213053177718180
 for <openembedded-core@lists.openembedded.org>;
 Tue, 27 Dec 2022 23:37:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Th4sSoWZ;
 spf=pass (domain: gmail.com, ip: 209.85.128.54, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f54.google.com with SMTP id m26-20020a05600c3b1a00b003d9811fcaafso4227260wms.5
        for <openembedded-core@lists.openembedded.org>; Tue, 27 Dec 2022 23:37:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SmJfARRyhJNNkYJzLnX0d5aH/C1Wfgh7+SQWGIOHPBA=;
        b=Th4sSoWZkrjg7Mmn6URWfO/rfvAp73F7MFyoZLZj3T7XipzqOXL9qbjKPcAP/r2P0t
         uuEJb71YCmin2Qzx244TuOOh0p7rNM9cTGLH9HsvIawTqisnjoNO7VN3GlQqW1XE5nTR
         ++Su4aYjA7Vaq0IYoX94aJBimb/hx7p0jKvc5nee7FKc7nNGN66VOpqgKGjAkb0HjU/2
         pBE3t5WAMXx4X8QhnYHOqgxHsqFNHhFFoxhdFuqLxCVnnNH4j7Qm1r7jZ7bmGa3Q1B3R
         2KKYtYEc4pECukudpAuuuM1d0xVQ07vxInF098S7+r716bIBtjx/5tP55qyb6BuPVKow
         lIDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SmJfARRyhJNNkYJzLnX0d5aH/C1Wfgh7+SQWGIOHPBA=;
        b=mWG9OqNxMC0J5afB6l+OeG/VyWtm2OAky0/KWjlR9H8AWLWL4DNhtYDUWxt+ngdNIh
         wb3aog+uD+Fsm6buV+ZWfCm6E/yAgzkptH5dnpz2UXDbc5Xcs+SZoPig3XbSrOvzZqC9
         nRMVxYVca4JAOV5PSWM4gwxvX1Ka9bJzdGWPoqdMWfh8MmjfOCLMAzLTlLSIyu0F/Z7o
         9G5pqsd13pGjsNqoB47mKOjVrJpIZZM4DJFthe+MLzSo9Uz9kt7eBb8o9mTaK6v4XcJg
         NeSb/OW3XR5eUboIf7qqPyuh7xZD/FNzKhp4M2NYwBJwLophIehlqjvJT77SsR2SgLpT
         HK9w==
X-Gm-Message-State: AFqh2kq0ZX0a8wQlHGInZTlxGsf61ukYHu6SELeK++JgEDgjetCVQRlz
	LYjMCwYJuj1ffCHUxqp/sxEizlw8xwo=
X-Google-Smtp-Source: AMrXdXsC3+8o4Sn80mMX7cTXFc1d/2W59FJtX0fA8OBvq1XRhAL0M7sPBiri6wV+nUnqpjw8WkLXxg==
X-Received: by 2002:a1c:2b04:0:b0:3d3:4f28:40c6 with SMTP id r4-20020a1c2b04000000b003d34f2840c6mr16707053wmr.1.1672213050842;
        Tue, 27 Dec 2022 23:37:30 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id t15-20020a5d534f000000b002365254ea42sm14802040wrv.1.2022.12.27.23.37.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Dec 2022 23:37:30 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 03/25] python3-installer: update 0.5.1 -> 0.6.0
Date: Wed, 28 Dec 2022 08:36:59 +0100
Message-Id: <20221228073721.3454255-3-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20221228073721.3454255-1-alex@linutronix.de>
References: <20221228073721.3454255-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 28 Dec 2022 07:37:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175043

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../python3-installer/interpreter.patch       | 24 +++++++++++++------
 ...er_0.5.1.bb => python3-installer_0.6.0.bb} |  2 +-
 2 files changed, 18 insertions(+), 8 deletions(-)
 rename meta/recipes-devtools/python/{python3-installer_0.5.1.bb => python3-installer_0.6.0.bb} (89%)

diff --git a/meta/recipes-devtools/python/python3-installer/interpreter.patch b/meta/recipes-devtools/python/python3-installer/interpreter.patch
index ef10ef1b45..7906769b90 100644
--- a/meta/recipes-devtools/python/python3-installer/interpreter.patch
+++ b/meta/recipes-devtools/python/python3-installer/interpreter.patch
@@ -1,3 +1,8 @@
+From 74fe171fa4a25c120607e9f8450cbdfee675c959 Mon Sep 17 00:00:00 2001
+From: Ross Burton <ross.burton@arm.com>
+Date: Mon, 14 Mar 2022 14:39:22 +0000
+Subject: [PATCH] python3-installer: add installer module
+
 Let us override the hashbang directly (possibly upstreamable), and don't
 play games with hashbangs: for now assume that even hashbangs with spaces
 are simple (assume the spaces are only used to separate arguments) and
@@ -6,13 +11,18 @@ we don't have long hashbangs.
 Upstream-Status: Inappropriate
 Signed-off-by: Ross Burton <ross.burton@arm.com>
 
+---
+ src/installer/__main__.py |  9 ++++++++-
+ src/installer/scripts.py  | 15 +--------------
+ 2 files changed, 9 insertions(+), 15 deletions(-)
+
 diff --git a/src/installer/__main__.py b/src/installer/__main__.py
-index 3357ec5..d2fd8d2 100644
+index 51014b9..38de286 100644
 --- a/src/installer/__main__.py
 +++ b/src/installer/__main__.py
-@@ -23,6 +23,13 @@ def _get_main_parser() -> argparse.ArgumentParser:
+@@ -30,6 +30,13 @@ def _get_main_parser() -> argparse.ArgumentParser:
          type=str,
-         help="destination directory (prefix to prepend to each file)",
+         help="override prefix to install packages to",
      )
 +    parser.add_argument(
 +        "--interpreter",
@@ -24,10 +34,10 @@ index 3357ec5..d2fd8d2 100644
      parser.add_argument(
          "--compile-bytecode",
          action="append",
-@@ -73,7 +80,7 @@ def _main(cli_args: Sequence[str], program: Optional[str] = None) -> None:
+@@ -86,7 +93,7 @@ def _main(cli_args: Sequence[str], program: Optional[str] = None) -> None:
      with WheelFile.open(args.wheel) as source:
          destination = SchemeDictionaryDestination(
-             scheme_dict=_get_scheme_dict(source.distribution),
+             scheme_dict=_get_scheme_dict(source.distribution, prefix=args.prefix),
 -            interpreter=sys.executable,
 +            interpreter=args.interpreter,
              script_kind=get_launcher_kind(),
@@ -56,6 +66,6 @@ index 7e3c8fc..ba6ed5a 100644
 -    # I don't understand a lick what this is trying to do.
 -    return b"#!/bin/sh\n'''exec' " + quoted + b' "$0" "$@"\n' + b"' '''"
 +    return b"#!" + executable_bytes
-
-
+ 
+ 
  class InvalidScript(ValueError):
diff --git a/meta/recipes-devtools/python/python3-installer_0.5.1.bb b/meta/recipes-devtools/python/python3-installer_0.6.0.bb
similarity index 89%
rename from meta/recipes-devtools/python/python3-installer_0.5.1.bb
rename to meta/recipes-devtools/python/python3-installer_0.6.0.bb
index 07bbafa81f..e728e47cec 100644
--- a/meta/recipes-devtools/python/python3-installer_0.5.1.bb
+++ b/meta/recipes-devtools/python/python3-installer_0.6.0.bb
@@ -8,7 +8,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=5038641aec7a77451e31da828ebfae00"
 
 SRC_URI += "file://interpreter.patch"
 
-SRC_URI[sha256sum] = "f970995ec2bb815e2fdaf7977b26b2091e1e386f0f42eafd5ac811953dc5d445"
+SRC_URI[sha256sum] = "f3bd36cd261b440a88a1190b1becca0578fee90b4b62decc796932fdd5ae8839"
 
 inherit pypi python_flit_core
 
-- 
2.30.2


