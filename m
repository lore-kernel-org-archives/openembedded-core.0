Return-Path: <tgamblin@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24952D2445B
	for <webhook@archiver.kernel.org>; Thu,  4 Dec 2025 18:08:48 +0000 (UTC)
Received: from mail-vk1-f179.google.com (mail-vk1-f179.google.com [209.85.221.179])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.50646.1764871725956509061
 for <openembedded-core@lists.openembedded.org>;
 Thu, 04 Dec 2025 10:08:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20230601.gappssmtp.com header.s=20230601 header.b=jrowmP+O;
 spf=pass (domain: baylibre.com, ip: 209.85.221.179, mailfrom: tgamblin@baylibre.com)
Received: by mail-vk1-f179.google.com with SMTP id 71dfb90a1353d-5599688d06dso372974e0c.2
        for <openembedded-core@lists.openembedded.org>; Thu, 04 Dec 2025 10:08:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1764871724; x=1765476524; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iS2ZO2Mqksk5eMkwDKSrWfZnD+g5uQdPaf42w7JBWko=;
        b=jrowmP+Ocwcm+Ui6YkfbNO1tHps1RTIGdfvq3EQRWvVovCr1aP5sNk2oNiEjmO20Ff
         LxT8nZX17V33Ld2S3QLMVIhJe+/2skHdGCXVVVTgoXG9dpn7hc/jmhxG15KsqvGQL4la
         fxnMyW6CeGuU7nXtgM5yXydnEmwhJrU2Br3S1DzqXDilysM0Odjg6aV0J8CoNabDZ98B
         4TBS1hUI4MU5/IAMkYreBVCyrpQ1b4c5K2CTOXXsBsSHIrUhlsG+l/glSmh9YgosmEmS
         bOFYxGMtcw4hFX+E+h3+UMaIO9W4QjMrjYP/e4jq+lzLsAbmWDYvckAZKdw60xDK7miq
         E0fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764871724; x=1765476524;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=iS2ZO2Mqksk5eMkwDKSrWfZnD+g5uQdPaf42w7JBWko=;
        b=YroCCyrPSEi63lbzryLAtYXTWLNgUuVYtmUxnfP89S46zaL361w7ywmhhgjA7jYCZa
         cE2e0+63bCb6A8hMkLa1KGj0hLnKVUcLJm+9FzOOP2APRLuiryqZS1uxrKnVRRnRtayw
         j+h2PfLIzpiW+lQadpeyYUxHJolSM4MV27DNnVBBVUU73lfZEbnPPLZ/2+BW2cY3FK4l
         Wv5oBIkA1F0tgfEu+NtRLdFChtQPf4W8uNcRmc85T9fbPDfAB0v2/seTDbSVoxqeVGk5
         U2dQ6dAk1MUVT1GM50StHZvGy8tusIKMHidMPqiKjyiCtyVD8LqLURXDGo1ozvT75u6d
         b32Q==
X-Gm-Message-State: AOJu0YwEvGISPuuh4hhisVAlRYfI+jdTfCN4ip/g+uG0wSLT09uugp/M
	ZmKsZz9iIOOdAUiaQkwrXhpdCuZR3PtCZPyYcGs7xyxKmQ8gBd07p0r/l5qSYE9dUxnyLbUyp4S
	XeYWc3gA=
X-Gm-Gg: ASbGnct8bjYKBKEe1q6dmQrD29Gp5g5OCYrr3PSRwQwceOzQ0oUk2xrevh993dnMN61
	vJ5/glnu62PTAG6KSiuLag9R9HYcoIwjrLInMqkQZmuEjoHozsbThSi/7pg3gRFyVKp1aGZGgC3
	nv9jPHDD04vpSbBKfqThsbAPrcrRpiaC9Lwtr0EiF2ljQ5dO68yLYDILyA0+UMOWz7J9XKojPmr
	aUO1bynHK7IYoAwAAlYEKytAVjMHILZKQzSTXcfwxj3nrx6Coj+4UtqQ4exc8stle3x7oYTsqay
	3bXrErHjVU3AHqgTozZ7Y09DYXUlKu0FoQihDXxdV+hx/txY60HNG/J7BoD1rCNanVyY1IMTMYG
	nCCyeLVS81bKs6OjNvEbSWnZgNB/tjllDYXYDWYVapyUcZf5k3LoEVd9EjlSNcHwTpkuNNkyna+
	ueYqASXtGFyg8ha+u4ctBPBsi28g==
X-Google-Smtp-Source: AGHT+IHWJrcXBfSiFG+3Md1l+RpAackfieos/cCV1ipgIG4BloJiBZ9rnOW9OtohkbDH18SbPk5Jsg==
X-Received: by 2002:a05:6122:8b85:b0:559:6d45:9a1c with SMTP id 71dfb90a1353d-55e5be4f04emr2833407e0c.3.1764871724184;
        Thu, 04 Dec 2025 10:08:44 -0800 (PST)
Received: from localhost ([2001:1970:3847:e000:8598:5636:16ad:2a8f])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-888287d56b9sm15653826d6.47.2025.12.04.10.08.43
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Dec 2025 10:08:43 -0800 (PST)
From: Trevor Gamblin <tgamblin@baylibre.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH 2/6] python_pep517: add --prefix to nativepython3 call
Date: Thu,  4 Dec 2025 13:08:33 -0500
Message-ID: <20251204180837.3112045-3-tgamblin@baylibre.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251204180837.3112045-1-tgamblin@baylibre.com>
References: <20251204180837.3112045-1-tgamblin@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 04 Dec 2025 18:08:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227312

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


