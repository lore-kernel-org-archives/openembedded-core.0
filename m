Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A5A1CD3420
	for <webhook@archiver.kernel.org>; Sun, 17 Sep 2023 09:39:16 +0000 (UTC)
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
 by mx.groups.io with SMTP id smtpd.web10.27140.1694943554435055392
 for <openembedded-core@lists.openembedded.org>;
 Sun, 17 Sep 2023 02:39:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=HzJUYNAG;
 spf=pass (domain: gmail.com, ip: 209.85.208.173, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-2bff7d81b5eso10984061fa.0
        for <openembedded-core@lists.openembedded.org>; Sun, 17 Sep 2023 02:39:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1694943552; x=1695548352; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kM4QCJVgLPEynIgaF/BptlcRuGDuQKPSNpynwY1DMxM=;
        b=HzJUYNAGlVkyXw2wgMOag2B7xxX+I+eVXqRp3o4WOVJugMK4A8Yt3hlkTNPRAWsuIF
         Hfvpx8r66PLrqDNDe91LdRhO3RDTEZLQO67T5h8Iv6i5npwT93KBAeW8kxeCZf9OjP2Z
         2WP2aq9glUtpFF51+K9QfKAJi39e3lm617Nx5AI0bClM+39hcmW5EmupfaHc452VrRis
         0LDXgMwmi/M2WfSb7LLDdxxB7WfPASTtLAp/YbsjSFdt3rPlhI0/m2IgUnVLumpghj8D
         bMYmnnp4DkYjAEollJDrYMMxu2Ax8ZVS7eY3xKRX5OYBwGGlUEowZhKsBPxrfHHNNKHs
         jIZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694943552; x=1695548352;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kM4QCJVgLPEynIgaF/BptlcRuGDuQKPSNpynwY1DMxM=;
        b=oJEdpoU9fSwTcf8tlDF/WiKy2GeFn1q4xyJiBIShEVqKdhczC0PTh9ECAHEmiOCJPT
         2X+XIMuOmoffoVFo5SAvef6DaMsoJvP83cgkElFnS8lP0JZgl6uzeXo6FLcP6ihiSrnk
         dWBMuAHOXGUfAJD/hUgJEcinBvZ8WnX2M/WnPqsUIBuQ9J7PeFWJWLha7sXspGudVRcN
         qN/nktDJuJ37igM5WswVQv7O0bM7GiCBR/BOOcNm7DIcra8YUmzuTOtauP3rPDHt5/3c
         zyoWPsbOGgyosBmZza8YZQbUkdaBXBMvPB4fh5oVPuBPJUAJSetVP3dAQsWREDUOZhg+
         z6yQ==
X-Gm-Message-State: AOJu0YylQKbetJgoB9CaAtrD40YDu7cHd/LFB9YOBnDvs8x7r0Y/6nux
	+5Q6Bkp5SfYoiiTNQ5/ZDX4hHosoGXs=
X-Google-Smtp-Source: AGHT+IHFAcrhhzRjCipjWWxJHlZT8NtSzs5Za1RVGJcO1VcrJ2iZ/dbTUoFZUdEA4g3DDq5Pmxbl8A==
X-Received: by 2002:a2e:8816:0:b0:2b6:cff1:cd1c with SMTP id x22-20020a2e8816000000b002b6cff1cd1cmr5044595ljh.34.1694943552536;
        Sun, 17 Sep 2023 02:39:12 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id d8-20020a17090694c800b0099ce188be7fsm4779683ejy.3.2023.09.17.02.39.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Sep 2023 02:39:12 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 13/29] glibc-tests: rename to glibc-y2038-tests
Date: Sun, 17 Sep 2023 11:38:45 +0200
Message-Id: <20230917093901.428214-13-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230917093901.428214-1-alex@linutronix.de>
References: <20230917093901.428214-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 17 Sep 2023 09:39:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187786

The recipe originates from meta-y2038 where the name was not
confusing, but in oe-core it is.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/conf/distro/include/maintainers.inc                      | 2 +-
 meta/conf/distro/include/ptest-packagelists.inc               | 4 ++--
 meta/conf/distro/include/time64.inc                           | 4 ++--
 .../glibc/{glibc-tests_2.38.bb => glibc-y2038-tests_2.38.bb}  | 2 +-
 4 files changed, 6 insertions(+), 6 deletions(-)
 rename meta/recipes-core/glibc/{glibc-tests_2.38.bb => glibc-y2038-tests_2.38.bb} (96%)

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
index 3619588ae66..fece29e4c54 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -208,7 +208,7 @@ RECIPE_MAINTAINER:pn-glibc = "Khem Raj <raj.khem@gmail.com>"
 RECIPE_MAINTAINER:pn-glibc-locale = "Khem Raj <raj.khem@gmail.com>"
 RECIPE_MAINTAINER:pn-glibc-mtrace = "Khem Raj <raj.khem@gmail.com>"
 RECIPE_MAINTAINER:pn-glibc-scripts = "Khem Raj <raj.khem@gmail.com>"
-RECIPE_MAINTAINER:pn-glibc-tests = "Lukasz Majewski <lukma@denx.de>"
+RECIPE_MAINTAINER:pn-glibc-y2038-tests = "Lukasz Majewski <lukma@denx.de>"
 RECIPE_MAINTAINER:pn-glibc-testsuite = "Khem Raj <raj.khem@gmail.com>"
 RECIPE_MAINTAINER:pn-gmp = "Khem Raj <raj.khem@gmail.com>"
 RECIPE_MAINTAINER:pn-glslang = "Jose Quaresma <quaresma.jose@gmail.com>"
diff --git a/meta/conf/distro/include/ptest-packagelists.inc b/meta/conf/distro/include/ptest-packagelists.inc
index 9160103cb0a..e023891b7b2 100644
--- a/meta/conf/distro/include/ptest-packagelists.inc
+++ b/meta/conf/distro/include/ptest-packagelists.inc
@@ -77,8 +77,8 @@ PTESTS_FAST = "\
     zlib \
     libexif \
 "
-PTESTS_FAST:append:libc-glibc = " glibc-tests"
-PTESTS_PROBLEMS:remove:libc-glibc = "glibc-tests"
+PTESTS_FAST:append:libc-glibc = " glibc-y2038-tests"
+PTESTS_PROBLEMS:remove:libc-glibc = "glibc-y2038-tests"
 PTESTS_FAST:remove:mips64 = "qemu"
 PTESTS_PROBLEMS:append:mips64 = " qemu"
 PTESTS_FAST:remove:riscv32 = "qemu"
diff --git a/meta/conf/distro/include/time64.inc b/meta/conf/distro/include/time64.inc
index 83b0dfae6cb..2e85753e55a 100644
--- a/meta/conf/distro/include/time64.inc
+++ b/meta/conf/distro/include/time64.inc
@@ -19,7 +19,7 @@ TARGET_CC_ARCH:append:powerpc = "${@bb.utils.contains('TUNE_FEATURES', 'm32', '$
 TARGET_CC_ARCH:append:x86 = "${@bb.utils.contains('TUNE_FEATURES', 'm32', '${GLIBC_64BIT_TIME_FLAGS}', '', d)}"
 
 GLIBC_64BIT_TIME_FLAGS:pn-glibc = ""
-GLIBC_64BIT_TIME_FLAGS:pn-glibc-tests = ""
+GLIBC_64BIT_TIME_FLAGS:pn-glibc-y2038-tests = ""
 GLIBC_64BIT_TIME_FLAGS:pn-glibc-testsuite = ""
 # pipewire-v4l2 explicitly sets _FILE_OFFSET_BITS=32 to get access to
 # both 32 and 64 bit file APIs.  But it does not handle the time side?
@@ -36,7 +36,7 @@ GLIBC_64BIT_TIME_FLAGS:pn-gcc-sanitizers = ""
 # Caused by the flags exceptions above
 INSANE_SKIP:append:pn-gcc-sanitizers = " 32bit-time"
 INSANE_SKIP:append:pn-glibc = " 32bit-time"
-INSANE_SKIP:append:pn-glibc-tests = " 32bit-time"
+INSANE_SKIP:append:pn-glibc-y2038-tests = " 32bit-time"
 INSANE_SKIP:append:pn-pulseaudio = " 32bit-time"
 
 # Strace has tests that call 32 bit API directly, which is fair enough, e.g.
diff --git a/meta/recipes-core/glibc/glibc-tests_2.38.bb b/meta/recipes-core/glibc/glibc-y2038-tests_2.38.bb
similarity index 96%
rename from meta/recipes-core/glibc/glibc-tests_2.38.bb
rename to meta/recipes-core/glibc/glibc-y2038-tests_2.38.bb
index 95eb774db70..be49ca4cb73 100644
--- a/meta/recipes-core/glibc/glibc-tests_2.38.bb
+++ b/meta/recipes-core/glibc/glibc-y2038-tests_2.38.bb
@@ -8,7 +8,7 @@ SRC_URI += "\
 	file://run-ptest \
 "
 
-SUMMARY = "glibc tests to be run with ptest"
+SUMMARY = "glibc tests using time32/time64 interfaces to be run with ptest for the purpose of checking y2038 compatiblity"
 
 # Erase some variables already set by glibc_${PV}
 python __anonymous() {
-- 
2.30.2


