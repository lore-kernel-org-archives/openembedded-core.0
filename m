Return-Path: <tgamblin@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D5D6D24468
	for <webhook@archiver.kernel.org>; Thu,  4 Dec 2025 18:10:08 +0000 (UTC)
Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com [209.85.219.48])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.50687.1764871798013968110
 for <openembedded-core@lists.openembedded.org>;
 Thu, 04 Dec 2025 10:09:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20230601.gappssmtp.com header.s=20230601 header.b=pj4MCRRf;
 spf=pass (domain: baylibre.com, ip: 209.85.219.48, mailfrom: tgamblin@baylibre.com)
Received: by mail-qv1-f48.google.com with SMTP id 6a1803df08f44-8826b83e405so16293736d6.0
        for <openembedded-core@lists.openembedded.org>; Thu, 04 Dec 2025 10:09:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1764871796; x=1765476596; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iS2ZO2Mqksk5eMkwDKSrWfZnD+g5uQdPaf42w7JBWko=;
        b=pj4MCRRffVQFaMWdByxmEOBb4pzKDrU60Aq1XfRPVUayjoCJ7UFiSIDd9spmdhG5ap
         l0COugZmescdL63wAy2ht2PxEb1TpWQnZN7cJJnT0NM4wt4PfgOpHY50R4WfrxYJiRyk
         R5cYQ5OJwGNODUe5P/pLR10kTRuZhHsoWemN5TszZpmorlzbKJko7zWSMRUicN9vhICB
         qJEnge2/4ZEC8meSYz78eBly7hMKnhdWJd1FlbsB8HICk75HsPuMnYKhsjP+a/vng9ox
         DkbK4x/NIIscUfLS/PUiH89uz0sUGS+QA18IB5V8hXijlnuZYh1ATRLiv1NvqkgrMqZ/
         s8rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764871796; x=1765476596;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=iS2ZO2Mqksk5eMkwDKSrWfZnD+g5uQdPaf42w7JBWko=;
        b=lpdj8Hfmp59C2ikWn5Ndo8rPWeeqk8tW23aw07L/0xfdL/NOYC5QH2yuVxwXonZJ2K
         a8+Qwpj3Rb58T2KBCyJH6YnSM+yXqLTSfL3euUvSjejRlqMS7AV5DCfhe0cIwTDTZnpD
         mlVsnuFyC2NNrn3JWFD91IF8eulw+ApVEBm6occI5mvSQ8yOsmC4Tudbnbcqqarf24Hz
         6uKfGKaX4faKO1yVTeUNW+xgDD/sA1VMxpkysYHXW/6/y7nKxToEq8oap7se9RvVMCA5
         Z8nLCHtuddCXU+hCYniqV4JnMi+gJWsUk+As7YT0p5JGmdh7Mb06z3jBl824JU0hNRbJ
         Idjw==
X-Gm-Message-State: AOJu0YxRZehdX65yTdo4F3il2HYNOVyVcb+x9WBHmTNfHRY4xCj8DD8U
	ZHQUmGPZywRwYXJcxZIW8yFfPqC2svZyZL0tBSE439Ws81pPQ2HFt2XxqaIV4eI6QPoD2Q1sQ0H
	1uj0F0bI=
X-Gm-Gg: ASbGnctE97xXvE+OzkWvF9Pq7ykWMVZkoa5g2uON9AEW0ncHBd+Lo4EeBkgGARp5VNF
	sRhFahAhwcdeVmUmtlYSDV6tXAp0grMl2J3OTxEjbz7Ym78sxTZau+ts4kbT7O37R/47V8jzbGN
	SS2pYrKAcuFVZIAIyV8hUJpri33rfGe2s01jUwSyG4Nl+JXKSucj57go2MjwKboTbB+FMywSKHo
	oQqOCx6EEFBwzMzwpTwbFIYc/4Hlm+TaeAzh4bBq9RUZNG4sqb443Mm2UW4EnhCP39wo8uSEapu
	d7HpymvLpllW9EsOWl+2gVr6mGBWTunBWxf7CR+pJOXNOxa43TZBzdhnj24zwXwzi0vcOL6oakP
	VA4yu0a+xLwReBHnHfQNfDwBjWLYwGPHRMJfpE/1hvzAN4+fB4MTqtim5qEl29A0WOb1jW/DB8W
	PdKicXGyDO3dm4nTA=
X-Google-Smtp-Source: AGHT+IFPn0jrmmj7o6v/Roi4hwjhxZLZfwQNxw0yJQ8TM9uGw1yVNeAD70d9sXEOp7n9KQKvt7KVfw==
X-Received: by 2002:a05:6214:519b:b0:880:834d:ff69 with SMTP id 6a1803df08f44-888194c9ccamr93592236d6.1.1764871796076;
        Thu, 04 Dec 2025 10:09:56 -0800 (PST)
Received: from localhost ([2001:1970:3847:e000:8598:5636:16ad:2a8f])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-88827f49097sm16162576d6.14.2025.12.04.10.09.55
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Dec 2025 10:09:55 -0800 (PST)
From: Trevor Gamblin <tgamblin@baylibre.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH 2/6] python_pep517: add --prefix to nativepython3 call
Date: Thu,  4 Dec 2025 13:09:41 -0500
Message-ID: <20251204180945.3112334-3-tgamblin@baylibre.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251204180945.3112334-1-tgamblin@baylibre.com>
References: <20251204180945.3112334-1-tgamblin@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 04 Dec 2025 18:10:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227317

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


