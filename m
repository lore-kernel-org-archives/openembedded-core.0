Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B46CC61DA4
	for <webhook@archiver.kernel.org>; Mon, 13 Mar 2023 19:38:12 +0000 (UTC)
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
 by mx.groups.io with SMTP id smtpd.web10.3808.1678736288713904507
 for <openembedded-core@lists.openembedded.org>;
 Mon, 13 Mar 2023 12:38:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=awsaajSC;
 spf=pass (domain: gmail.com, ip: 209.85.208.53, mailfrom: martin.jansa@gmail.com)
Received: by mail-ed1-f53.google.com with SMTP id y4so23732636edo.2
        for <openembedded-core@lists.openembedded.org>; Mon, 13 Mar 2023 12:38:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678736287;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=LQexagwarVNOir6NGA/wb1SWUA6xRp0I+058FPFmG84=;
        b=awsaajSCGO6YPQdDxjRj+/DJ9HKyU2Pq2P2dFLSFzcQ7ng2cyB9PUVOuv1cEZEAWRo
         h/u0b4yU6hpyUFxDriuWRRvMvQEm4GePCPU7AFX2rKr5MzTuw1BpBx27iSwwoVBbuQAi
         1S+vHBSjQGjwNLWSl+CvvabKVfm/GkDUfI705RltapU7gTyp5XCuBHNg7btPIS683YcA
         6y05bCEDKJiZ20S7GTe79G5YcKPa+3NetkVAMJtLer1OOA3bWyvtJwpD4NZDfxWm3wNn
         x+263wj5qwrJNcLbfA+Tn8JBMExBOTSfXj/p4FBnAXWLaJzDMCoNYa10ZX1c/um3OyH8
         QNOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678736287;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LQexagwarVNOir6NGA/wb1SWUA6xRp0I+058FPFmG84=;
        b=utMhmFGSs4uJQzwSvxgRvKGYX92ftkf3wqr5ReW2swd74qVCt60TrNZQWTiZalRbTy
         XOoOBOkpOzS0FfVkQVbBEAsBPUjJoMziTWUjcu753XaA1UfDqPoEkmwmWGcw47U3fdys
         e7bGpZ+MlHuHblpe0SouNH1cKeu+ngC2e1kTfPfwPaH/hdo3A6TfLno3RnPlQ1XxaeFY
         7gJIGSu9aGhftolGQFf2fTS/TFrA6pz1dClr3DqvyJJ7zXFwPagMcf/+p5xe339TyTGz
         tWLaOOPWlo4wmSwP1+y9ys3ow5ySweOVSz8L7n01VbMMDmgMJvkCyxmXymd1jQOyBfxY
         BVRQ==
X-Gm-Message-State: AO0yUKVkWUlzoAlH7gZyXlinDzZC8Ox9h9TpkXvPvUz+av3iB6viQKyG
	Y/OkKDI/sQ91c/5PZl/wx0jG4MP6/zY=
X-Google-Smtp-Source: AK7set80iodqWlMPbHJyr0AUD0kNh/JtgOUaiRqrbnfys63N+Y7GoK8YmESnO5YdOVCaOmDXrT/Ccg==
X-Received: by 2002:a17:907:8a1c:b0:91e:212e:6338 with SMTP id sc28-20020a1709078a1c00b0091e212e6338mr12809166ejc.73.1678736287089;
        Mon, 13 Mar 2023 12:38:07 -0700 (PDT)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id v20-20020a17090690d400b008c5075f5331sm153249ejw.165.2023.03.13.12.38.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Mar 2023 12:38:06 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Martin Jansa <Martin.Jansa@gmail.com>
Subject: [PATCH] file: add few more PACKAGECONFIGs to avoid autodetected deps from host
Date: Mon, 13 Mar 2023 20:37:59 +0100
Message-Id: <20230313193759.915629-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 13 Mar 2023 19:38:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178464

* there are few more autodetected compression libs
  --disable-zlib          disable zlib compression support [default=auto]
  --disable-bzlib         disable bz2lib compression support [default=auto]
  --disable-xzlib         disable liblzma/xz compression support
  --disable-zstdlib       disable zstdlib compression support [default=auto]
  --disable-lzlib         disable liblz (lzip) compression support

  and lzlib was detected on my gentoo (even when it doesn't say that default
  is auto detection)

  I've noticed this, because I've reused sstate-cache from my gentoo build
  in docker container with ubuntu-23.04 and esdk.oeSDKExtSelfTest.test_install_libraries_headers
  test was now failing with:

  Exception: subprocess.CalledProcessError: Command '/OE/build/poky/build/build-st-2023-03-12-esdk-patch1/esdk.oeSDKExtSelfTest.test_install_libraries_headers/build-st/tmp/work/x86_64-nativesdk-pokysdk-linux/buildtools-tarball/1.0-r0/recipe-sysroot-native/usr/bin/createrepo_c --update -q /OE/build/poky/build/build-st-2023-03-12-esdk-patch1/esdk.oeSDKExtSelfTest.test_install_libraries_headers/build-st/tmp/work/x86_64-nativesdk-pokysdk-linux/buildtools-tarball/1.0-r0/oe-sdk-repo' returned non-zero exit status 127.

  Subprocess output:
  /OE/build/poky/build/build-st-2023-03-12-esdk-patch1/esdk.oeSDKExtSelfTest.test_install_libraries_headers/build-st/tmp/work/x86_64-nativesdk-pokysdk-linux/buildtools-tarball/1.0-r0/recipe-sysroot-native/usr/bin/createrepo_c: error while loading shared libraries: liblz.so.1: cannot open shared object file: No such file or directory

  and liblz.so.1 ended in createrepo_c.real because of libmagic.so from file-native-replacement.

* use PACKAGECONFIG for seccomp as well and keep it disabled as it was
  explicitly disabled before (${@bb.utils.filter('DISTRO_FEATURES', 'seccomp', d)}
  can be added to default PACKAGECONFIG later if someone finds it useful)

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/recipes-devtools/file/file_5.44.bb | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/file/file_5.44.bb b/meta/recipes-devtools/file/file_5.44.bb
index d4b49341b7..3090d346ed 100644
--- a/meta/recipes-devtools/file/file_5.44.bb
+++ b/meta/recipes-devtools/file/file_5.44.bb
@@ -22,8 +22,9 @@ PACKAGECONFIG ??= "bz2 lzma zlib"
 PACKAGECONFIG[bz2] = "--enable-bzlib, --disable-bzlib, bzip2"
 PACKAGECONFIG[lzma] = "--enable-xzlib, --disable-xzlib, xz"
 PACKAGECONFIG[zlib] = "--enable-zlib, --disable-zlib, zlib"
-
-EXTRA_OECONF += "--disable-libseccomp"
+PACKAGECONFIG[zstdlib] = "--enable-zstdlib, --disable-zstdlib, zstd"
+PACKAGECONFIG[lzlib] = "--enable-lzlib, --disable-lzlib, lzip"
+PACKAGECONFIG[seccomp] = "--enable-libseccomp, --disable-libseccomp, libseccomp"
 
 ALTERNATIVE:${PN} = "file"
 ALTERNATIVE_LINK_NAME[file] = "${bindir}/file"
-- 
2.39.2


