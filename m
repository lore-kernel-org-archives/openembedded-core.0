Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 07699C54FD4
	for <webhook@archiver.kernel.org>; Tue, 28 Jul 2026 22:22:17 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2708.1785277336196950718
 for <openembedded-core@lists.openembedded.org>;
 Tue, 28 Jul 2026 15:22:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=muUvgdxg;
 spf=pass (domain: smile.fr, ip: 209.85.128.48, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-49557167508so2752015e9.1
        for <openembedded-core@lists.openembedded.org>; Tue, 28 Jul 2026 15:22:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1785277334; x=1785882134; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=0Oac/VvdswcAYTGoKQ7LJScN7xzt668rZuQwaFDtCDc=;
        b=muUvgdxgVCtvUPisPyMwjd3Pys1AL2i+sSqWEUG39WmdT8U0SxtvNskgogJXlz+Y/8
         M3yHPb/5bCpKC1P0DX/ro8iLTar5tddQgxXMIO/kjvPsacOMmntKIrOrLg0FElt/z/ZQ
         lBw6qP+pKlANqJkDJoUcbK5LwOdRCdUrzO4xQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785277334; x=1785882134;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=0Oac/VvdswcAYTGoKQ7LJScN7xzt668rZuQwaFDtCDc=;
        b=Hp+OsFkcIHtZ1Qbxp1o7bnq5OuDj5hXl1m6Sf/hQnckpgBne/vHof+x4QXdSJv7e6A
         lkNLudgrLZ5P+R7GT2Rfb232W+jaPMlfAkjBAjB8z7gpwqe55wsX1nQ8tgwC79Vzw9WY
         Wy5iXirXzkO7X4xgUYtSPR24W+0frC+kGOZAJtmJUjUZ1g7GMDPOi16nSKD4W6Kh7ZD2
         V4qDE297MZCV3/AVUmuxFE7kCH3CuVwVbXx5vnL4UN1Bij+SKiN04iGTgp8pp73HxEXr
         m4kponptn7EGm/mrI51DbB50W3kL8ShyCKzeE9pqLSHLHP7mfXjfgP0xPAVGGmIO2MqU
         KvVA==
X-Gm-Message-State: AOJu0Yzr5rOXSG4qgrm1aCVrrMwnvZ+lJwiVJXVgG8ic33njwUUdQY6a
	D2yPRlquVI4pKFq+4OIGh2PjwRxHvJRwMUjC+RHnEB4UJTcxXNmCtMZkYCWSHbBFMwsGO485+wb
	8Q5pqD/U=
X-Gm-Gg: AR+sD13OU/kICoc4ojHlTU8JsIYXzTqoOrntyRU5guYdq0H4Ol9ualonJby0Vb5AMih
	jyZFvRbMLXAvUnIBwSwwSwJVwXtESOnyjVXFvsJIm2MMo2C+W4F+MLSk3BR7BVaX0jceezLaVgJ
	zcB2E+Ic79nHeP5rly2/K4i1uIr4LzXLVL5BdJUbTNLqoxzDECy/YjvzRNS8cS3MJYvMDVvTqmg
	zfOyZpOpxHvReWD3Ih/O6QX7Z+Z0ulbR5QihCLhRQiKj4hK2ijketGgN+6gHUtGdzkr2bKFya0U
	KRTSAdUHC490K+/cAmznjy40FEuZMWlq5OwPVBufvaJg6Ow7voFgD4HTFqJquEy9ZFlJMFfiVin
	U6M6aCVQDzJyQrKnr6zc8JGidcNlW0Mqsnu2Y88DT3+vXJ7sS1usaY/lzpVKRAif+O5V1kwpQuE
	g9aqEogaY+/F9V003vbyvry9TuT+VaJLnI+4UXnBHis9CW1uoUxzSvlfkOCw5XieDmbJRBUZiy+
	HeN5ln3swl2StT72MP1i6EbtlXqfH1EhaOsKvBTN7TwkKCsINlrPKt6yx5EQ2CZ
X-Received: by 2002:a05:600c:45d2:b0:495:5d5b:7533 with SMTP id 5b1f17b1804b1-496c642d775mr47584855e9.13.1785277334429;
        Tue, 28 Jul 2026 15:22:14 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4976bd6da4asm7669405e9.1.2026.07.28.15.22.14
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2026 15:22:14 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 18/19] cargo-update-recipe-crates: Don't fail for partially empty Cargo.lock
Date: Wed, 29 Jul 2026 00:21:53 +0200
Message-ID: <59f1965358f59457857c920ed836998509450d9a.1785277157.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1785277157.git.yoann.congal@smile.fr>
References: <cover.1785277157.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 28 Jul 2026 22:22:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242221

From: Martin Schwan <m.schwan@phytec.de>

Do not fail if only some Cargo.lock files are empty. Only fail, if there
are absolutely no dependencies found in any Cargo.lock.

This fixes the following error message, which would occur with "bitbake
-c update_crates python3-orjson":

    ERROR: python3-orjson-3.10.17-r0 do_update_crates: Execution of '.../python3-orjson/3.10.17/temp/run.do_update_crates.70693' failed with exit code 1
    ERROR: Logfile of failure stored in: .../python3-orjson/3.10.17/temp/log.do_update_crates.70693
    Log data follows:
    | DEBUG: Executing python function extend_recipe_sysroot
    | NOTE: Direct dependencies are ['.../sources/oe-core/../oe-core/meta/recipes-devtools/quilt/quilt-native_0.69.bb:do_populate_sysroot', 'virtual:native:.../sources/oe-core/../oe-core/meta/recipes-devtools/patch/patch_2.8.bb:do_populate_sysroot', 'virtual:native:.../sources/oe-core/../oe-core/meta/recipes-devtools/python/python3_3.13.9.bb:do_populate_sysroot']
    | NOTE: Installed into sysroot: []
    | NOTE: Skipping as already exists in sysroot: ['gettext-minimal-native', 'cmake-native', 'libtool-native', 'quilt-native', 'texinfo-dummy-native', 'openssl-native', 'expat-native', 'ncurses-native', 'util-linux-libuuid-native', 'zlib-native', 'libedit-native', 'make-native', 'patch-native', 'perl-native', 'python3-native', 'bzip2-native', 'xz-native', 'zstd-native', 'attr-native', 'gdbm-native', 'libffi-native', 'sqlite3-native']
    | DEBUG: Python function extend_recipe_sysroot finished
    | DEBUG: Executing shell function do_update_crates
    | Traceback (most recent call last):
    |   File "<stdin>", line 41, in <module>
    |   File "<stdin>", line 12, in get_crates
    | ValueError: Unable to find any candidate crates that use crates.io
    |
    | The above exception was the direct cause of the following exception:
    |
    | Traceback (most recent call last):
    |   File "<stdin>", line 43, in <module>
    | ValueError: Cannot parse '.../python3-orjson/3.10.17/sources/orjson-3.10.17/include/cargo/simdutf8-0.1.5/Cargo.lock'
    | WARNING: exit code 1 from a shell command.
    ERROR: Task (.../sources/oe-core/../meta-openembedded/meta-python/recipes-devtools/python/python3-orjson_3.10.17.bb:do_update_crates) failed with exit code '1'

Signed-off-by: Martin Schwan <m.schwan@phytec.de>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 1ef39b3fa731fb121d338aea2b1ac004620063e0)
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../cargo-update-recipe-crates.bbclass           | 16 +++++++---------
 1 file changed, 7 insertions(+), 9 deletions(-)

diff --git a/meta/classes-recipe/cargo-update-recipe-crates.bbclass b/meta/classes-recipe/cargo-update-recipe-crates.bbclass
index 8980137d02c..ac76fa3279a 100644
--- a/meta/classes-recipe/cargo-update-recipe-crates.bbclass
+++ b/meta/classes-recipe/cargo-update-recipe-crates.bbclass
@@ -36,7 +36,8 @@ def get_crates(f):
     crates_candidates = list(filter(lambda c: 'crates.io' in c.get('source', ''), crates['package']))
 
     if not crates_candidates:
-        raise ValueError("Unable to find any candidate crates that use crates.io")
+        print("WARNING: Unable to find any candidate crates that use crates.io")
+        return None
 
     # Update crates uri and their checksum, to avoid name clashing on the checksum
     # we need to rename crates with name and version to have a unique key
@@ -63,14 +64,11 @@ for root, dirs, files in os.walk('${CARGO_LOCK_SRC_DIR}'):
         continue
     for file in files:
         if file == 'Cargo.lock':
-            try:
-                cargo_lock_path = os.path.join(root, file)
-                crates += get_crates(os.path.join(root, file))
-            except Exception as e:
-                raise ValueError("Cannot parse '%s'" % cargo_lock_path) from e
-            else:
-                found = True
-if not found:
+            cargo_lock_path = os.path.join(root, file)
+            c = get_crates(cargo_lock_path)
+            if c is not None:
+                crates += c
+if crates is None:
     raise ValueError("Unable to find any Cargo.lock in ${CARGO_LOCK_SRC_DIR}")
 open("${TARGET_FILE}", 'w').write(crates)
 EOF

