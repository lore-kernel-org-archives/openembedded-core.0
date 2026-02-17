Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4EA17E68168
	for <webhook@archiver.kernel.org>; Tue, 17 Feb 2026 10:25:15 +0000 (UTC)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.9196.1771323904614418724
 for <openembedded-core@lists.openembedded.org>;
 Tue, 17 Feb 2026 02:25:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=t+KVPo+/;
 spf=pass (domain: smile.fr, ip: 209.85.221.48, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-43638a33157so3913316f8f.1
        for <openembedded-core@lists.openembedded.org>; Tue, 17 Feb 2026 02:25:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1771323903; x=1771928703; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=feykQcPnwDBXZIzg5/UtzprMjEbGFlxFhimrBcjq4Ok=;
        b=t+KVPo+/AE89qvTJ8unJ2fkkABffatS8e5hF4DwBj6F4Z1ZCJL4LjfYdJu76wP6BNN
         r8+9N1HBO5Hn9muZbZZjXv2Rn0DOyHrnR/lB04E4vH5kldrs21PWN1yy5Kq3VxrHcun3
         5NRHNOTuqEuIdlv7iSS3Fi441Q6irGjM0zwis=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771323903; x=1771928703;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=feykQcPnwDBXZIzg5/UtzprMjEbGFlxFhimrBcjq4Ok=;
        b=ti3xmfPJ+xh9H5IsKumg9+0IAJSdCqMdF5qokERcnPJsGZNTI0jnhodk/WS+XgSEtS
         NQ6isBznCrjmXyLftxPaiHKkzA3tPzNMWTwWUIVHPFxtXNchdDsh0EklnI6+DXqQ6oMj
         ZvkqTfGPzXBFJBmvljMO1Tsj2xJszjnMETOgG1Sr2wrUrrWAz6nTJouk8be+iPpw+m9u
         eWLGCf3n0RLceoBKLuUK41W50GFQ8b1kxUJnwOQmZ3ceiCRczcX89m18u0vEix6E0S3F
         olrrte+3rOOFw1F4xcVb5MZdw8TwF/pXYaJAJwwFxZQ23C5hdrRR/dOoPUeQnVIIw8Ue
         osEQ==
X-Gm-Message-State: AOJu0YyOmnUqYAkQJD06UAGfHJ5AHnvo+rIvRJQ7ZEmprXqTA4CBR58b
	RkZZThLIr7X1Hjr5ycCt9XbD5E5bRFA1EMxd1rfJYeU6MGsAko/R2wSGLrdHQAruyF532xFCxUs
	U4FJw
X-Gm-Gg: AZuq6aK0Tng0fdb/CQffwIJ8tU0gQswk0ilFG9ghYmcQTZ0/mUvq9QCH0i9f2x4eCyn
	AplG7hNMUm2HsSgZuV8zaghzXgzDMCl0winq86+Wq92aH+886lmnQEfk1W5060BR973HJqc9yvi
	41Gzzovvj3dZWX8YTY+WJ/McUwaXlurOZt5i14DRKRc2oqUy1iXrVBiLFt+mC4B/XnRmExtsG62
	nA9ldPlVmmcZmjd5F96sJrBmu4aBLZ4uO2DWMQj2i9/KcMZYMa3HLwWhpFcYd6/tMZa0fZp/NAz
	inQxC7pajX0pmA0PiPMeIHUS1RUJdMNd63LsRp3d5r3qpXAw65aXt7ayqz+luq00zl2V9beyhGB
	RwX2psvtDOmJ8HbJ7BTyjt5wIu4QyJx40IEnNfFVtZ/75cXILSkiCcu2Gz8QgOSYOf8pkisE8+v
	3r3q2vK5cpLrdzQNuHCLj7OnVG0kZGouy09CJx+pw5KGhS8VlqV5Rgvnf7Pll9eVi29uWolkK8u
	TPiEixmmH6MmMDdQijZYYy5+zS4Wy1nNlQW0Dd1r2cH
X-Received: by 2002:a05:6000:4285:b0:435:bbd7:18e4 with SMTP id ffacd0b85a97d-4379795efa9mr26870439f8f.63.1771323902572;
        Tue, 17 Feb 2026 02:25:02 -0800 (PST)
Received: from FRSMI25-LASER.idf.intranet (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43796ac8d46sm34399662f8f.32.2026.02.17.02.25.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Feb 2026 02:25:02 -0800 (PST)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Cc: Paul Barker <paul@pbarker.dev>
Subject: [OE-core][whinlatter 00/20] Pull request (cover letter only)
Date: Tue, 17 Feb 2026 11:24:18 +0100
Message-ID: <cover.1771322143.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 17 Feb 2026 10:25:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231238

Those are the patches from the last patch review:
https://lore.kernel.org/openembedded-core/cover.1770968514.git.yoann.congal@smile.fr/T/#t
with backported "pseudo: Update to include an openat2 fix" to fix #16143
(AB-INT: do_image_wic: tar command return exit status 2)

Passed a-full on autobuilder (with errors):
https://autobuilder.yoctoproject.org/valkyrie/?#/builders/29/builds/3229
* meta-intel failed with #16172 – intel-media-driver: ninja: posix_spawn: Argument list too long
  * This failure is independent of this patch series.
* oe-selftest-fedora failed on a temporary github glitch (502 Bad Gateway or Proxy Error)
  * https://autobuilder.yoctoproject.org/valkyrie/?#/builders/48/builds/3104
  * Successfully retried in https://autobuilder.yoctoproject.org/valkyrie/?#/builders/48/builds/3106

The following changes since commit 000a044d285d93ded3280f27360165c943bb5d7e:

  inetutils: patch CVE-2026-24061 (2026-02-10 21:15:17 +0000)

are available in the Git repository at:

  https://git.openembedded.org/openembedded-core-contrib stable/whinlatter-next
  https://git.openembedded.org/openembedded-core-contrib/log/?h=stable/whinlatter-next

for you to fetch changes up to 53c91e6104364029be1b87a0228382a354238f94:

  pseudo: Update to include an openat2 fix (2026-02-16 11:49:42 +0100)

----------------------------------------------------------------

Adarsh Jagadish Kamini (1):
  avahi: Backport fix CVE-2025-68276

Aleksandar Nikolic (1):
  scripts/install-buildtools: Update to 5.3.1

Amaury Couderc (2):
  avahi: patch CVE-2025-68468
  avahi: patch CVE-2025-68471

Ankur Tyagi (3):
  mobile-broadband-provider-info: upgrade 20250613 -> 20251101
  avahi: patch CVE-2026-24401
  vim: ignore CVE-2025-66476

Bruce Ashfield (2):
  linux-yocto/6.12: update to v6.12.69
  linux-yocto/6.12: update CVE exclusions (6.12.69)

Dragomir, Daniel (2):
  wic/engine: fix copying directories into wic image with ext* partition
  oeqa/selftest/wic: test recursive dir copy on ext partitions

Hongxu Jia (2):
  webkitgtk: workaround compile failure for large debug symbols
  webkitgtk: upgrade 2.50.0 -> 2.50.4

Paul Barker (2):
  devtool: deploy: Run pseudo with correct PATH
  devtool: deploy: Reset PATH after strip_execs

Peter Marko (4):
  openssl: upgrade 3.5.4 -> 3.5.5
  ffmpeg: ignore 10 CVEs
  libsndfile1: patch CVE-2025-56226
  go: upgrade 1.25.6 -> 1.25.7

Richard Purdie (1):
  pseudo: Update to include an openat2 fix

 .../distro/include/yocto-space-optimize.inc   |     3 -
 meta/lib/oeqa/selftest/cases/wic.py           |    65 +
 meta/recipes-connectivity/avahi/avahi_0.8.bb  |     4 +
 .../avahi/files/CVE-2025-68276.patch          |    68 +
 .../avahi/files/CVE-2025-68468.patch          |    32 +
 .../avahi/files/CVE-2025-68471.patch          |    36 +
 .../avahi/files/CVE-2026-24401.patch          |    74 +
 ...obile-broadband-provider-info_20251101.bb} |     2 +-
 ...ke-history-reporting-when-test-fails.patch |    23 +-
 .../0001-extend-check_cwm-test-timeout.patch  |     2 +-
 .../{openssl_3.5.4.bb => openssl_3.5.5.bb}    |     2 +-
 .../go/{go-1.25.6.inc => go-1.25.7.inc}       |     2 +-
 ...e_1.25.6.bb => go-binary-native_1.25.7.bb} |     6 +-
 ..._1.25.6.bb => go-cross-canadian_1.25.7.bb} |     0
 ...{go-cross_1.25.6.bb => go-cross_1.25.7.bb} |     0
 ...osssdk_1.25.6.bb => go-crosssdk_1.25.7.bb} |     0
 ...runtime_1.25.6.bb => go-runtime_1.25.7.bb} |     0
 .../go/{go_1.25.6.bb => go_1.25.7.bb}         |     0
 meta/recipes-devtools/pseudo/pseudo_git.bb    |     2 +-
 .../linux/cve-exclusion_6.12.inc              | 13004 ++++++++++------
 .../linux/linux-yocto-rt_6.12.bb              |     6 +-
 .../linux/linux-yocto-tiny_6.12.bb            |     6 +-
 meta/recipes-kernel/linux/linux-yocto_6.12.bb |    28 +-
 meta/recipes-multimedia/ffmpeg/ffmpeg_8.0.bb  |     7 +
 .../libsndfile1/CVE-2025-56226-01.patch       |    36 +
 .../libsndfile1/CVE-2025-56226-02.patch       |    43 +
 .../libsndfile/libsndfile1_1.2.2.bb           |     2 +
 ...able-to-control-macro-__PAS_ALWAYS_I.patch |     8 +-
 ...spection.cmake-prefix-variables-obta.patch |     2 +-
 ...-on-RISCV-https-bugs.webkit.org-show.patch |     4 +-
 .../webkit/webkitgtk/fix-ftbfs-riscv64.patch  |    24 +-
 .../webkitgtk/fix-musl-compilation.patch      |    94 -
 ...ceof_handler_for_32-bit_C-loop_build.patch |   122 -
 .../webkit/webkitgtk/reproducibility.patch    |     2 +-
 .../webkit/webkitgtk/sys_futex.patch          |    11 +-
 .../webkit/webkitgtk/t6-not-declared.patch    |     6 +-
 ...ebkitgtk_2.50.0.bb => webkitgtk_2.50.4.bb} |    15 +-
 meta/recipes-support/vim/vim_9.1.bb           |     2 +
 scripts/install-buildtools                    |     4 +-
 scripts/lib/devtool/__init__.py               |     3 +-
 scripts/lib/devtool/deploy.py                 |     9 +-
 scripts/lib/wic/engine.py                     |    63 +-
 42 files changed, 8391 insertions(+), 5431 deletions(-)
 create mode 100644 meta/recipes-connectivity/avahi/files/CVE-2025-68276.patch
 create mode 100644 meta/recipes-connectivity/avahi/files/CVE-2025-68468.patch
 create mode 100644 meta/recipes-connectivity/avahi/files/CVE-2025-68471.patch
 create mode 100644 meta/recipes-connectivity/avahi/files/CVE-2026-24401.patch
 rename meta/recipes-connectivity/mobile-broadband-provider-info/{mobile-broadband-provider-info_20250613.bb => mobile-broadband-provider-info_20251101.bb} (91%)
 rename meta/recipes-connectivity/openssl/{openssl_3.5.4.bb => openssl_3.5.5.bb} (99%)
 rename meta/recipes-devtools/go/{go-1.25.6.inc => go-1.25.7.inc} (91%)
 rename meta/recipes-devtools/go/{go-binary-native_1.25.6.bb => go-binary-native_1.25.7.bb} (79%)
 rename meta/recipes-devtools/go/{go-cross-canadian_1.25.6.bb => go-cross-canadian_1.25.7.bb} (100%)
 rename meta/recipes-devtools/go/{go-cross_1.25.6.bb => go-cross_1.25.7.bb} (100%)
 rename meta/recipes-devtools/go/{go-crosssdk_1.25.6.bb => go-crosssdk_1.25.7.bb} (100%)
 rename meta/recipes-devtools/go/{go-runtime_1.25.6.bb => go-runtime_1.25.7.bb} (100%)
 rename meta/recipes-devtools/go/{go_1.25.6.bb => go_1.25.7.bb} (100%)
 create mode 100644 meta/recipes-multimedia/libsndfile/libsndfile1/CVE-2025-56226-01.patch
 create mode 100644 meta/recipes-multimedia/libsndfile/libsndfile1/CVE-2025-56226-02.patch
 delete mode 100644 meta/recipes-sato/webkit/webkitgtk/fix-musl-compilation.patch
 delete mode 100644 meta/recipes-sato/webkit/webkitgtk/fix_op_instanceof_handler_for_32-bit_C-loop_build.patch
 rename meta/recipes-sato/webkit/{webkitgtk_2.50.0.bb => webkitgtk_2.50.4.bb} (93%)


