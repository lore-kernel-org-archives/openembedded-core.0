Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45A7EC54E41
	for <webhook@archiver.kernel.org>; Mon, 26 Feb 2024 14:29:10 +0000 (UTC)
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
 by mx.groups.io with SMTP id smtpd.web10.21491.1708957749194224653
 for <openembedded-core@lists.openembedded.org>;
 Mon, 26 Feb 2024 06:29:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=lNoeq5Hq;
 spf=pass (domain: gmail.com, ip: 209.85.208.54, mailfrom: martin.jansa@gmail.com)
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-55a035669d5so5574833a12.2
        for <openembedded-core@lists.openembedded.org>; Mon, 26 Feb 2024 06:29:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708957747; x=1709562547; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=LFrjB8TZQvSLW/cW9zZxCfUKn9u8dgy1r1fx0YOTkuU=;
        b=lNoeq5HqkB0oW9NvdbkR6CjCzh2W09yL3Lp/vZRTI0I+bhVniQ6YJ1tsEEOF256Ejr
         M23NPNxAONeQNK4p5yTb7eux08I3t1EwOMQGjUdqZeOKsBjKirK9Y18imwEOfRD0rYZY
         eoBaUZldVQbcnNULyZ4zkRTgXG4MlEgpusoSqfFCNWL48eUabKvCBxNghcc0EoOZKsmH
         bmgQKQCBBKUVFCTNnGXKHDaqT2g3uoeQNGsVyl74BX3yoCIzHz7R6kAv/08TmezAsOZN
         FTJKDFN4fGDI+Wi1i9mcsIfp1LsLIEjtYRo1sZmJvCGuaMWeLPnRUN05WG3XkQRCbtns
         ktpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708957747; x=1709562547;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LFrjB8TZQvSLW/cW9zZxCfUKn9u8dgy1r1fx0YOTkuU=;
        b=mIbKHLxlEmXvBPmi8F1vKkyernVs/XuFeo4A7+qR11qIJKh8b8YBcdXTLErMSLrlmY
         V4IFRd5761UPow9IICdMiQyf4vo4X7MOleSxiag+/+hGqplitoZ0Avxr+mutqW7jmTo8
         exhyoEjHScrZhG42WJJZR82kE0/k+il9kubl9KDhK+AmvfvLMk3OIVLUTBLfgsEZaqGn
         CC76VgnQIywrrY8rCx773FX4T6RdUOJFiTxjyF3yPfLoeRmsm5K52GBD63qKCJe/tEl0
         jXv0Mla84W6TdIeymy4w6c0I3FhP4Lgqq7gPvzaZTE5j7wNo3XtsQ3iIJ+hmYQh1HZRM
         8Lww==
X-Gm-Message-State: AOJu0YzOlxebAVabmQrAJLvmUFPZkwgrm46qKYZxC0OauVyiGprxt2UA
	QKmPllzHuESr2Kl2pezVPqC3Z8InTKtYZ022hZSg8RFCZx+33e8uJt3jZ9FH
X-Google-Smtp-Source: AGHT+IFR3cbOeHSAp77S2b4DQ/JRr8JjMnthWngOgJaJ50M4jCiIygW6EyOyNj7lrO1azScJwcVlDA==
X-Received: by 2002:aa7:cd42:0:b0:566:de7:ac4a with SMTP id v2-20020aa7cd42000000b005660de7ac4amr1142478edw.6.1708957747253;
        Mon, 26 Feb 2024 06:29:07 -0800 (PST)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id em3-20020a056402364300b0056602b0eb69sm705169edb.82.2024.02.26.06.29.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Feb 2024 06:29:06 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Martin Jansa <martin.jansa@gmail.com>
Subject: [RFC PATCH] rpm: add PACKAGECONFIG for openmp and disable it by default for native builds
Date: Mon, 26 Feb 2024 15:28:55 +0100
Message-ID: <20240226142855.2687016-1-martin.jansa@gmail.com>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 26 Feb 2024 14:29:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196205

* and keep it enabled in target builds unless libc-musl where it was
  disabled since upgrade to 4.15.1 in:
  https://git.openembedded.org/openembedded-core/commit/?id=67257ca87c6fa8e6050a20ecea50daf834c7e869
  and disable it for native builds to be able to reuse rpm-native
  between hosts with libomp and without to avoid do_package failures like:
  recipe-sysroot-native/usr/lib/rpm/rpmdeps: error while loading shared libraries: libgomp.so.1: cannot open shared object file: No such file or directory

* and on hosts without libomp it fails in do_configure:
  | CMake Error at /OE/build/tmp-glibc/work/x86_64-linux/rpm-native/4.19.1/recipe-sysroot-native/usr/share/cmake-3.28/Modules/FindPackageHandleStandardArgs.cmake:230 (message):
  |   Could NOT find OpenMP_C (missing: OpenMP_C_FLAGS OpenMP_C_LIB_NAMES)
  |   (Required is at least version "4.5")

* I've noticed this in new experimental gentoo profiles which don't
  enable openmp by default for gcc-13 and newer, see:
  https://bugs.gentoo.org/890999
  https://gitweb.gentoo.org/repo/gentoo.git/commit/?id=8189b4b48c25dbd7b330b51b53f9023cdbbb29ec
  https://gitweb.gentoo.org/repo/gentoo.git/commit/?id=94d882482714698d6d9b765920cd26bbe849336d

  I'm not sure what other distributions plan with openmp support in future
  (and this profile is just experimental and the decision not to enable
  openmp by default might still change), but having the PACKAGECONFIG
  at least gives easy way to explicitly enable/disable this in bbappend

  openmp is also explicitly disabled in gettext since 2011:
  https://git.openembedded.org/openembedded-core/commit/?id=e897103a58ad672cc87d2bab3ec45501ef09f8f1

Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
---
 meta/recipes-devtools/rpm/rpm_4.19.1.bb | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/rpm/rpm_4.19.1.bb b/meta/recipes-devtools/rpm/rpm_4.19.1.bb
index 1f8611a29c..477e1c2d62 100644
--- a/meta/recipes-devtools/rpm/rpm_4.19.1.bb
+++ b/meta/recipes-devtools/rpm/rpm_4.19.1.bb
@@ -52,7 +52,7 @@ DEPENDS = "lua libgcrypt file popt xz bzip2 elfutils python3 sqlite3 zstd"
 DEPENDS:append:class-native = " file-replacement-native bzip2-replacement-native"
 
 EXTRA_OECMAKE:append = " -D__CURL:FILEPATH=curl"
-EXTRA_OECMAKE:append:libc-musl = " -DENABLE_NLS=OFF -DENABLE_OPENMP=OFF"
+EXTRA_OECMAKE:append:libc-musl = " -DENABLE_NLS=OFF"
 
 # --sysconfdir prevents rpm from attempting to access machine-specific configuration in sysroot/etc; we need to have it in rootfs
 # --localstatedir prevents rpm from writing its database to native sysroot when building images
@@ -64,10 +64,15 @@ OECMAKE_GENERATOR = "Unix Makefiles"
 
 BBCLASSEXTEND = "native nativesdk"
 
-PACKAGECONFIG ??= "internal-openpgp"
+PACKAGECONFIG_OPENMP = "openmp"
+PACKAGECONFIG_OPENMP:libc-musl = ""
+PACKAGECONFIG_OPENMP:class-native = ""
+
+PACKAGECONFIG ??= "internal-openpgp ${PACKAGECONFIG_OPENMP}"
 
 PACKAGECONFIG[plugins] = "-DENABLE_PLUGINS=ON,-DENABLE_PLUGINS=OFF"
 PACKAGECONFIG[testsuite] = "-DENABLE_TESTSUITE=ON,-DENABLE_TESTSUITE=OFF"
+PACKAGECONFIG[openmp] = "-DENABLE_OPENMP=ON,-DENABLE_OPENMP=OFF"
 
 # Deprecated! https://fedoraproject.org/wiki/Changes/RpmSequoia
 PACKAGECONFIG[internal-openpgp] = "-DWITH_INTERNAL_OPENPGP=ON,-DWITH_INTERNAL_OPENPGP=OFF"
-- 
2.44.0


