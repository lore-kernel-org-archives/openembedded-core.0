Return-Path: <tgamblin@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E906AD7877E
	for <webhook@archiver.kernel.org>; Fri, 19 Dec 2025 13:47:49 +0000 (UTC)
Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.17006.1766152065450821748
 for <openembedded-core@lists.openembedded.org>;
 Fri, 19 Dec 2025 05:47:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20230601.gappssmtp.com header.s=20230601 header.b=bQCckXCH;
 spf=pass (domain: baylibre.com, ip: 209.85.160.177, mailfrom: tgamblin@baylibre.com)
Received: by mail-qt1-f177.google.com with SMTP id d75a77b69052e-4ed9c19248bso14949651cf.1
        for <openembedded-core@lists.openembedded.org>; Fri, 19 Dec 2025 05:47:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1766152063; x=1766756863; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iS2ZO2Mqksk5eMkwDKSrWfZnD+g5uQdPaf42w7JBWko=;
        b=bQCckXCHnaRbVqcjYPenjfO5LT94D122KNr7Cn/xUE5Ni3ZgusGLWSvYCgXsBrdrfb
         1FmnEtWh3DW6Apku28A7nUU6l16CX29oJnXnRHKJ7wYkE6ajAUDCF82l2pmj7HWPKXfc
         Cm0PFiIF+g9pBRhkNqBD6NEPINawgLSWre7x1EQg1db8KDjAqgSlODnNckmDL/Ho/nVm
         aW/bte2FTch4V/Riv6GuBlj+SFNlvw1aGUKTWbKtSQphXyf4EhJI02HkvzTo1r1/aZ+q
         bfEY38kYLCarFuocYMTf+eM2dDmIX1dee4IJzC0PYbpuCbx2gD9k1s4M60xNdV3ab1E0
         hiKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766152063; x=1766756863;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=iS2ZO2Mqksk5eMkwDKSrWfZnD+g5uQdPaf42w7JBWko=;
        b=AJAzfpnHEEFTZtbkbGHV1xGQNVp3XJUiMVKv+GPfBaIynU1DqgtpU39UMn1EqTfOCv
         iJmX5E/ouQVzoiGKHYD/KPGSJe54xam9+nl2eCz8LwDzkDJMscZqwIf8Wh3pYAuejYea
         RvVZBIUjDcAz090jFcLPgjO/ZMKNd5Nj5UCARIKN3ByBvFGGV7JgyJXdNzis02SWVyc9
         LArwNxPZM+D86T7Qn82/xKhjO8ect8/R1gs/zotWveh414VGaZ4KZLGAsjCh48gXra1Q
         sBDAsqsB3nbSpXoMERV719G9nEvJY0U4oCRYB8DkanXUcCPKjJ3u/N5ICew7oylFdya3
         B8hw==
X-Gm-Message-State: AOJu0YzK+CuORgDSnPbYICcpscPdMy+WRxeYT4moULlgxfGSZKq48mU2
	lRboNUzfY4L5F4Yvi1snsNczONg0/k662Y4ctZxLDCPCzQBtYGooTMh4cBOpITQbMun95pAXDDy
	P1u9YOcY=
X-Gm-Gg: AY/fxX55QiEJPB2udtmZwTfYpb7xsLDWyk+zT9aCC80ybkb+N4NWauJgfDWo31+1uVv
	ccxfQgJPyezXLETCMEmY4TaXL9mSwadBw/Umo2O9L408iOoO/MCXwhHB/ay7TDuobp4eKy1pQP8
	tGq78hNwCilQZi76d9yj7CwoejPb5erb4vz0yMK/SQ7Nt5XQ70gbOb2PGjORljRD+/oyvOvEymJ
	XWYnKyhaVrACapcu9A/MgSxjw4mppQFHRHybSXiLu0qzixyFBdd0vQqVX0bnL1Z0bphmyxQVBfi
	MsRYwZKsdrlkq1Mc6jZtICzlipV+trs+ggJ2XUVGQquIbUi+dGi5tU2yqcG/BmMDkkOXBiI9DOK
	qeWHSM0Rj87tXpVLPmtJDgmY+5qowDTxQlD6MLHAVdDoO+kVTiCDYW6afqc7z+KhMlszwuK8lVA
	ix8XwXOrUhxlbcRL4=
X-Google-Smtp-Source: AGHT+IFu+sLIMBZTe4c933Ys+a7KE50huysA8I+43pq8Hetu15X64xRShe2NgkgZ8mWNCpPiKxaJ6A==
X-Received: by 2002:a05:622a:5448:b0:4ee:441c:dfb2 with SMTP id d75a77b69052e-4f4abd34380mr42626971cf.32.1766152062921;
        Fri, 19 Dec 2025 05:47:42 -0800 (PST)
Received: from localhost ([2001:1970:3847:e000:8598:5636:16ad:2a8f])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4f4ac563f66sm16453221cf.15.2025.12.19.05.47.42
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Dec 2025 05:47:42 -0800 (PST)
From: Trevor Gamblin <tgamblin@baylibre.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 3/5 v2] python_pep517: add --prefix to nativepython3 call
Date: Fri, 19 Dec 2025 08:47:32 -0500
Message-ID: <20251219134734.842422-4-tgamblin@baylibre.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251219134734.842422-1-tgamblin@baylibre.com>
References: <20251219134734.842422-1-tgamblin@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 19 Dec 2025 13:47:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228235

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


