Return-Path: <tgamblin@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A16ED5E388
	for <webhook@archiver.kernel.org>; Tue, 16 Dec 2025 14:39:16 +0000 (UTC)
Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com [209.85.222.179])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.24022.1765895950984264902
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Dec 2025 06:39:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20230601.gappssmtp.com header.s=20230601 header.b=QdOF4ds9;
 spf=pass (domain: baylibre.com, ip: 209.85.222.179, mailfrom: tgamblin@baylibre.com)
Received: by mail-qk1-f179.google.com with SMTP id af79cd13be357-8ba3ffd54dbso674257485a.1
        for <openembedded-core@lists.openembedded.org>; Tue, 16 Dec 2025 06:39:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1765895949; x=1766500749; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iS2ZO2Mqksk5eMkwDKSrWfZnD+g5uQdPaf42w7JBWko=;
        b=QdOF4ds9bGtE+zwL9d5mIi0saI+yCQ0VWI2WjTzZA4CfscOeBHe+y0mSD3irMAt787
         0y4zNbnNTzL1HU3wCmq2R+PIYDwL9gzJa2ROO1aHIiNRvNY1g5JW1t+naeEWQbM5H9mO
         DisdF1wX49aR4CJAUOt9CjpaZ4W44fnN8h9Mxb4sJUkdTzpHJo2kvEJS0E73vhheDnAS
         VZDgJOaP5TpAymqAccpJkIFg4s7s+t/diifOsTIUD3rcpVLHMUOo8NzNYRGxTIJLHrGA
         /DPrgI3yVQN8xWsst8I9jWrRRmihf9gWTXPuWS6uIjlsCMTDv/QEyTLZA1TZV25rqgJd
         K5tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765895949; x=1766500749;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=iS2ZO2Mqksk5eMkwDKSrWfZnD+g5uQdPaf42w7JBWko=;
        b=CGzs6w2xQT9cTn7F4ctyeX4akQ/lgZoeI+PDGyIShgQiu0t88co64eYAJHLp4uw4l7
         3kNJLelVwuC56GIcsUyPPLPqaO9MRt0p9RPJRMRqu09RnEiRDeCkDCfdO7YJm6gNIprg
         +qCknoncro1gHF5KgmVSjvigwQ0nM0Kiy1l8fIs9ey17ovKQX9SU6AWiVfVHwG1pw+aT
         CTPpzXR8RbDGpD7OOWJ91Z9OJBWFV23DYOHcQNzrj7lPAVm0fGwBGqU+zkdNbLqfFe/I
         2SBbMnbby7XHkg/3wKcL9Pj5uSOIW0ALwF8S/n00r+nHtQ1ibopf0KYkQsXqRVkEhLO6
         Lvow==
X-Gm-Message-State: AOJu0YyL5SSGKdeD8MYWGFwVHzyxM/NejWpYc3+Gvkq9OlNSe0AtIviU
	ZH7/z2y62UR8sBhcBTogxgSlZzmee1CXttm79k5X9FdwoNB2370YVXkOL9WtRvUv06wsnChPUJ6
	68LLeAUw=
X-Gm-Gg: AY/fxX7LSZvtkL8lljyvqPwastjf/QjBYenEKV/rupO+Lakr+DhferWPjILLJbrw0ws
	J5gUh6R651RH/0q95RgMAdobn4H6LszZCYtO8fwD6N6jMfRDIJlqqR+UAIxVLUb1Azr5DMQYr1g
	4/1wYZzRypHvX8l9NmLQ6YkZkUvazbYyHBIlKSr+ZhCpjoIBJ05ZgbKJWURKI9PntEfT8cwpCMA
	EjPpyolMXz6E5eGAc4fItScPRDOADixs/8aPCEqNfl9lYUmd0HHqQ0axNt7FQDuPZ22xU0CuIq8
	S8bJRb+4AdVvU8BN+Zf8oKVilEbyZ0AlGlmFGUscHESSKS7VhsVUFCBQECk90b/tV6Nx55NSP77
	aMR4Iva4lc4lGVBoT06xhILDXAf96Hee8nCNasiEu1g0VMIrkrzgvLZRZNFM+FzF4LTKL7ZCxrh
	FPvQeAwWuGF7wPWI0=
X-Google-Smtp-Source: AGHT+IEptfrIzzNDmmMuv0mdLemHo6XtaKxx/FmHEh9DZ1DOaAMIe8rfMCCBUaFJNKE7Lu8tibTtHw==
X-Received: by 2002:a05:622a:124b:b0:4ee:26bd:13f3 with SMTP id d75a77b69052e-4f1d047a33dmr175193961cf.8.1765895949232;
        Tue, 16 Dec 2025 06:39:09 -0800 (PST)
Received: from localhost ([2001:1970:3847:e000:8598:5636:16ad:2a8f])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4f345c5bf4dsm17143221cf.28.2025.12.16.06.39.07
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Dec 2025 06:39:08 -0800 (PST)
From: Trevor Gamblin <tgamblin@baylibre.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH 2/6] python_pep517: add --prefix to nativepython3 call
Date: Tue, 16 Dec 2025 09:38:57 -0500
Message-ID: <20251216143901.2542490-3-tgamblin@baylibre.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251216143901.2542490-1-tgamblin@baylibre.com>
References: <20251216143901.2542490-1-tgamblin@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 Dec 2025 14:39:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227957

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


