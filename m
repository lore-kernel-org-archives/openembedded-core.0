Return-Path: <tgamblin@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8F8ED26D61
	for <webhook@archiver.kernel.org>; Fri,  9 Jan 2026 15:07:09 +0000 (UTC)
Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com [209.85.222.177])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.11928.1767971222043411012
 for <openembedded-core@lists.openembedded.org>;
 Fri, 09 Jan 2026 07:07:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20230601.gappssmtp.com header.s=20230601 header.b=hGpjZmKQ;
 spf=pass (domain: baylibre.com, ip: 209.85.222.177, mailfrom: tgamblin@baylibre.com)
Received: by mail-qk1-f177.google.com with SMTP id af79cd13be357-8bc53dae8c2so607793885a.2
        for <openembedded-core@lists.openembedded.org>; Fri, 09 Jan 2026 07:07:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1767971220; x=1768576020; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iS2ZO2Mqksk5eMkwDKSrWfZnD+g5uQdPaf42w7JBWko=;
        b=hGpjZmKQEtkyVqZUizg77Lm14RoxAmjORBqT4CIrd12bUCLNX8FOGqI6PYFWlZWiuE
         yeN10vMxrDun+QQ+jKcT/ncpjpVV3SaELDNXfLkWT5TNfBk+JRtEUAAJI1GmaU7d5uWV
         FPMT6tvNDo/W8YIzL12g9K+ar0Ayq0Ya8moSu4hnnAqKeUjvo2Oaa18Vl4B8PO8YklNU
         dr8mUNYu/09BN5z2fWp17VVmHZVION1QG/ahqCKKdMz5kaDhNjaft9oQLMpMLMc9hVZi
         tn83a6Oxa691hg7tv7utS8mPZlBPfKXlzMfBaGyvx2ganbWzDNopP2Mgx0XY2xiFNSWH
         95AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767971220; x=1768576020;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=iS2ZO2Mqksk5eMkwDKSrWfZnD+g5uQdPaf42w7JBWko=;
        b=SKDLYCCGA3p/NI41FEuWmH2NiqiGUvJ80dp2uWsZ3E8rvzUyinMxwpRj9s4UHxbJOE
         Wf3AbWaTJfPNyACrqfW73zRGA2tpHFTEliumhfHAfiO+LnujhmYBhP/Y37peb50wKWzE
         54rFZjRPXRy9j/y8Xnv9qx4OL9bq8XwJkWMCbaT7olCQ6JVrSBR3YxEC0u/JS5lfjHCY
         byhDGzhSvjMeJtKGZJ5LSGbS5xWqQvZbBptp/4ntULOm1QWeDECkrKYnbPVtTYUrIq/x
         av8Z0hTZ2ZIFYAYF9zjrLCfu7i22F6JkTldsi/2K4S92F6hHHWCgttqV06y3A0wOboAC
         yALA==
X-Gm-Message-State: AOJu0YwzF1rCp9ZqSQcI1kDEOHShIEQcQUzE3n+vJgE36o/k3QLInObK
	jRuXK3/yo1RZoTqePaqTa8r/0KNvkcBN6SGFMZmbRQYQlWdaUxKDXDq1fuIMNlIZ3Y4VkQe+Iuw
	EDXqLmF4=
X-Gm-Gg: AY/fxX4aAMG5+g7Rg/eT4edMBRN1VbYP9mftrcMahCnP6JeIMqjDr/BqmtrcKehceCW
	JVx4GnvzcdDDo7eK0Igauiljx1Pb6CZpmeRRJJ0L2xH1oNleQV4YmvrCk4O7vLe9415g72xSCC4
	2qsgVbdsn0+DWAkihxDpWH6S8XTUfYyiRaFN+UgUxmB1HnpxxzFROI/VXAaQrMm4/XTbUalf6jd
	J01WmllfQFaN5PjNs3xAmXlSDxd6sHR6zEE5NyL4tAY1dkGedVwTHV+23spEKuVuv9wGgJrWt3e
	uxL8oz7TN63Sez0DTvmnaeywRQpPyPkhowv7b5ndS6LFOrPD27Zk6VeV+kinebNSr2JdEHPl1V7
	V7yCYrhqa2cjaDabxnfN85/UyiGEwq4ksaIBk6yal9/nLWq2mb3Tij1qlJcTijk8oFaXdISUkdO
	q4Ax5Zo0j8+Sh5Y26Ergfj4XR08g==
X-Google-Smtp-Source: AGHT+IF8gk8tmvT6CJ87kSwwrqG4nu0+yFMQpojr/Xq3RHGQHsi+2UB7tKg5FyD9NlktTd7LO8JZng==
X-Received: by 2002:a05:620a:1924:b0:8b2:dd0a:8807 with SMTP id af79cd13be357-8c38941c5edmr1377003585a.80.1767971220204;
        Fri, 09 Jan 2026 07:07:00 -0800 (PST)
Received: from localhost ([2001:1970:3847:e000:8598:5636:16ad:2a8f])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8c37f540650sm834180485a.47.2026.01.09.07.06.59
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Jan 2026 07:06:59 -0800 (PST)
From: Trevor Gamblin <tgamblin@baylibre.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH 3/6 v3] python_pep517: add --prefix to nativepython3 call
Date: Fri,  9 Jan 2026 10:06:48 -0500
Message-ID: <20260109150651.469332-4-tgamblin@baylibre.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260109150651.469332-1-tgamblin@baylibre.com>
References: <20260109150651.469332-1-tgamblin@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 09 Jan 2026 15:07:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229129

With Python 3.14, the default assumptions about install path in
python_pep517 no longer seem to apply, and as a result we see QA errors
during Python package builds like:

|ERROR: python3-unittest-automake-output-0.3-r0 do_package: QA Issue: python3-unittest-automake-output: Files/directories were installed but not shipped in any package:
|  /home
|  /home/tgamblin
|  /home/tgamblin/workspace
|  /home/tgamblin/workspace/yocto
|  /home/tgamblin/workspace/yocto/openembedded-core
|  /home/tgamblin/workspace/yocto/openembedded-core/build
|  /home/tgamblin/workspace/yocto/openembedded-core/build/tmp
|  /home/tgamblin/workspace/yocto/openembedded-core/build/tmp/work
|  /home/tgamblin/workspace/yocto/openembedded-core/build/tmp/work/x86-64-v3-poky-linux
|  /home/tgamblin/workspace/yocto/openembedded-core/build/tmp/work/x86-64-v3-poky-linux/python3-unittest-automake-output
|  /home/tgamblin/workspace/yocto/openembedded-core/build/tmp/work/x86-64-v3-poky-linux/python3-unittest-automake-output/0.3
|  /home/tgamblin/workspace/yocto/openembedded-core/build/tmp/work/x86-64-v3-poky-linux/python3-unittest-automake-output/0.3/recipe-sysroot-native
|  /home/tgamblin/workspace/yocto/openembedded-core/build/tmp/work/x86-64-v3-poky-linux/python3-unittest-automake-output/0.3/recipe-sysroot-native/usr
|  /home/tgamblin/workspace/yocto/openembedded-core/build/tmp/work/x86-64-v3-poky-linux/python3-unittest-automake-output/0.3/recipe-sysroot-native/usr/lib
|  /home/tgamblin/workspace/yocto/openembedded-core/build/tmp/work/x86-64-v3-poky-linux/python3-unittest-automake-output/0.3/recipe-sysroot-native/usr/lib/python3.14
|  /home/tgamblin/workspace/yocto/openembedded-core/build/tmp/work/x86-64-v3-poky-linux/python3-unittest-automake-output/0.3/recipe-sysroot-native/usr/lib/python3.14/site-packages
|  /home/tgamblin/workspace/yocto/openembedded-core/build/tmp/work/x86-64-v3-poky-linux/python3-unittest-automake-output/0.3/recipe-sysroot-native/usr/lib/python3.14/site-packages/putao
|  /home/tgamblin/workspace/yocto/openembedded-core/build/tmp/work/x86-64-v3-poky-linux/python3-unittest-automake-output/0.3/recipe-sysroot-native/usr/lib/python3.14/site-packages/putao-0.3.dist-info
|  /home/tgamblin/workspace/yocto/openembedded-core/build/tmp/work/x86-64-v3-poky-linux/python3-unittest-automake-output/0.3/recipe-sysroot-native/usr/lib/python3.14/site-packages/putao/__init__.py
|  /home/tgamblin/workspace/yocto/openembedded-core/build/tmp/work/x86-64-v3-poky-linux/python3-unittest-automake-output/0.3/recipe-sysroot-native/usr/lib/python3.14/site-packages/putao/pytest.py
|  /home/tgamblin/workspace/yocto/openembedded-core/build/tmp/work/x86-64-v3-poky-linux/python3-unittest-automake-output/0.3/recipe-sysroot-native/usr/lib/python3.14/site-packages/putao/unittest
|  /home/tgamblin/workspace/yocto/openembedded-core/build/tmp/work/x86-64-v3-poky-linux/python3-unittest-automake-output/0.3/recipe-sysroot-native/usr/lib/python3.14/site-packages/putao/__pycache__
|  /home/tgamblin/workspace/yocto/openembedded-core/build/tmp/work/x86-64-v3-poky-linux/python3-unittest-automake-output/0.3/recipe-sysroot-native/usr/lib/python3.14/site-packages/putao/unittest/__init__.py
|  /home/tgamblin/workspace/yocto/openembedded-core/build/tmp/work/x86-64-v3-poky-linux/python3-unittest-automake-output/0.3/recipe-sysroot-native/usr/lib/python3.14/site-packages/putao/unittest/__main__.py
|  /home/tgamblin/workspace/yocto/openembedded-core/build/tmp/work/x86-64-v3-poky-linux/python3-unittest-automake-output/0.3/recipe-sysroot-native/usr/lib/python3.14/site-packages/putao/unittest/__pycache__
|  /home/tgamblin/workspace/yocto/openembedded-core/build/tmp/work/x86-64-v3-poky-linux/python3-unittest-automake-output/0.3/recipe-sysroot-native/usr/lib/python3.14/site-packages/putao/unittest/__pycache__/__init__.cpython-314.pyc
|  /home/tgamblin/workspace/yocto/openembedded-core/build/tmp/work/x86-64-v3-poky-linux/python3-unittest-automake-output/0.3/recipe-sysroot-native/usr/lib/python3.14/site-packages/putao/unittest/__pycache__/__main__.cpython-314.pyc
|  /home/tgamblin/workspace/yocto/openembedded-core/build/tmp/work/x86-64-v3-poky-linux/python3-unittest-automake-output/0.3/recipe-sysroot-native/usr/lib/python3.14/site-packages/putao/__pycache__/__init__.cpython-314.pyc
|  /home/tgamblin/workspace/yocto/openembedded-core/build/tmp/work/x86-64-v3-poky-linux/python3-unittest-automake-output/0.3/recipe-sysroot-native/usr/lib/python3.14/site-packages/putao/__pycache__/pytest.cpython-314.pyc
|  /home/tgamblin/workspace/yocto/openembedded-core/build/tmp/work/x86-64-v3-poky-linux/python3-unittest-automake-output/0.3/recipe-sysroot-native/usr/lib/python3.14/site-packages/putao-0.3.dist-info/entry_points.txt
|  /home/tgamblin/workspace/yocto/openembedded-core/build/tmp/work/x86-64-v3-poky-linux/python3-unittest-automake-output/0.3/recipe-sysroot-native/usr/lib/python3.14/site-packages/putao-0.3.dist-info/WHEEL
|  /home/tgamblin/workspace/yocto/openembedded-core/build/tmp/work/x86-64-v3-poky-linux/python3-unittest-automake-output/0.3/recipe-sysroot-native/usr/lib/python3.14/site-packages/putao-0.3.dist-info/METADATA
|  /home/tgamblin/workspace/yocto/openembedded-core/build/tmp/work/x86-64-v3-poky-linux/python3-unittest-automake-output/0.3/recipe-sysroot-native/usr/lib/python3.14/site-packages/putao-0.3.dist-info/licenses
|  /home/tgamblin/workspace/yocto/openembedded-core/build/tmp/work/x86-64-v3-poky-linux/python3-unittest-automake-output/0.3/recipe-sysroot-native/usr/lib/python3.14/site-packages/putao-0.3.dist-info/licenses/LICENSE
|Please set FILES such that these items are packaged. Alternatively if they are unneeded, avoid installing them or delete them within do_install.
|python3-unittest-automake-output: 34 installed and not shipped files. [installed-vs-shipped]

We need to add the --prefix flag to the nativepython3 call so that it
avoids using the native Python's sysconfig prefix.

Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
---
 meta/classes-recipe/python_pep517.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes-recipe/python_pep517.bbclass b/meta/classes-recipe/python_pep517.bbclass
index 128c943794..d6246af5c2 100644
--- a/meta/classes-recipe/python_pep517.bbclass
+++ b/meta/classes-recipe/python_pep517.bbclass
@@ -51,7 +51,7 @@ python_pep517_do_install () {
         bbfatal More than one wheel found in ${PEP517_WHEEL_PATH}, this should not happen
     fi
 
-    nativepython3 -m installer ${INSTALL_WHEEL_COMPILE_BYTECODE} --interpreter "${USRBINPATH}/env ${PEP517_INSTALL_PYTHON}" --destdir=${D} ${PEP517_WHEEL_PATH}/*.whl
+    nativepython3 -m installer ${INSTALL_WHEEL_COMPILE_BYTECODE} --interpreter "${USRBINPATH}/env ${PEP517_INSTALL_PYTHON}" --prefix=${prefix} --destdir=${D} ${PEP517_WHEEL_PATH}/*.whl
 
     find ${D} -path *.dist-info/RECORD -delete
 }
-- 
2.52.0


