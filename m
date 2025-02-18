Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4FDCC02198
	for <webhook@archiver.kernel.org>; Tue, 18 Feb 2025 15:22:31 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.web10.21923.1739892151179661220
 for <openembedded-core@lists.openembedded.org>;
 Tue, 18 Feb 2025 07:22:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=ImqE4cLr;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.43, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-43932b9b09aso62526715e9.3
        for <openembedded-core@lists.openembedded.org>; Tue, 18 Feb 2025 07:22:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1739892149; x=1740496949; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vSVK1JRI/DPBiK8FJD47Y6nB3Eut/2n4np7dv+f0gPA=;
        b=ImqE4cLrZc7e7RUVOOmPfVhXrgyVb2ZNZrTbgqMo97vXgaRACbiLxqZkY6H3D6iFSy
         Onri1qWiZgX17oyi+nCDHv0Lwx09FNDdWbyfYNPukKPwzKyO8OLmCNme9fjaBxuA2Iax
         SYXP99uaxfP3dHiDKJGaFwQQP2JGIT9CLWtF8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739892149; x=1740496949;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vSVK1JRI/DPBiK8FJD47Y6nB3Eut/2n4np7dv+f0gPA=;
        b=DD0Tq+sc8OprA0W9rXaPrjJb9zmbU5qeijGRc4GtWSgv86W5Ejjwx6kyP/NPJzSQi2
         h+g1h1Bfogs6sUjpNLuQ4pJdKMPW+K/Rp4JNQ8cRnztZ5TsEQVpCShRjQLa2tF4olr+p
         L5PYPPA6Qtc2AtsLZtSjdBtYOFlL6mype/HskcIrJpclbDa23r8Oy7b4tGq95YzQDRoM
         QeqVm5O0tn42l+Tq67SMvsugmESb61HJ8IWS+KMmlcBGbKQ7g66VHQIWOGXeljSPHvVQ
         AlthPmRdyLyx4l4fD3h8ztHZ0zcTu+6CKeAJ7u9XkUyoZn5kIvtdxCbHTVQvR5bLhpr+
         cwzQ==
X-Gm-Message-State: AOJu0YxQeJ8aE5D+wA3N0lNPe5yjf4d3JrQOO89PP7DpbQNsOq2xXWYf
	+YjP5KjGiO557ei1xwf0P/bxL8ya/H6DVEN8e3lO7NNC0dH640MQzIqnFAwjs4bBkldmjZWeYu6
	S
X-Gm-Gg: ASbGncvSqhrxnAAbZPYbkjAdKhEAlJ6Cc3k18quPXXKtB9cVGUTB+cltbPuwUS0K9xA
	eF9XI0jxUiczTD7ZOQeWEBT0oeGPpZBAnj+JhUsIMD6XH7OWbXSQSaSe9zwk1C5kWPY/wHFbVt1
	56WobMkuwcB/OdWvBL48t5Q0PWNF8Qe2jMs7ss6ejgzifrbQLS4FVN3JjzSs6a4UqN5tqaXFgVv
	ZHWlYi+vL2xaQmeKuZn+FUcNQ5bUCECNK/I6RAmgOGQPdsOgm2ve/qeYfRs3Tt/HN8pFMJjUgsQ
	/ESGnEHkpfrj1eqMIl2IlH6CyIBgj59WxH5M8JVWRg==
X-Google-Smtp-Source: AGHT+IEJ+eB3aXilWSzbu/DsbJFXlV2gtvwTGm7PibP7IieYhv7Q+0q9yKonHZn6BJFlWrsPgmKV5w==
X-Received: by 2002:a05:600c:4588:b0:439:48f6:dd6e with SMTP id 5b1f17b1804b1-4396e717cbdmr125572605e9.19.1739892149111;
        Tue, 18 Feb 2025 07:22:29 -0800 (PST)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:a6c8:42:fd4f:69d2])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-439963099b0sm16532385e9.27.2025.02.18.07.22.27
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Feb 2025 07:22:28 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/2] gdb: Include xz support by default and clean up PACKAGECONFIG
Date: Tue, 18 Feb 2025 15:22:26 +0000
Message-ID: <20250218152226.1410852-2-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250218152226.1410852-1-richard.purdie@linuxfoundation.org>
References: <20250218152226.1410852-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 18 Feb 2025 15:22:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211629

Firstly, just include xz support in all gdb configurations to simplify config.
Most systems would already have the shared library so this isn't a big problem
for a larger debugging tool.

The PACKAGECONFIG duplication is also confusing. The only PACKAGECONFIG which
needs special handking is the python one due to the differing modules needed
in the nativesdk case. Remove all the other duplicate entries which should work
through our usual class extension code.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-devtools/gdb/gdb-common.inc         | 4 +---
 meta/recipes-devtools/gdb/gdb-cross-canadian.inc | 6 +-----
 meta/recipes-devtools/gdb/gdb-cross.inc          | 4 ----
 3 files changed, 2 insertions(+), 12 deletions(-)

diff --git a/meta/recipes-devtools/gdb/gdb-common.inc b/meta/recipes-devtools/gdb/gdb-common.inc
index ea1fc27a61b..c0312f0f05c 100644
--- a/meta/recipes-devtools/gdb/gdb-common.inc
+++ b/meta/recipes-devtools/gdb/gdb-common.inc
@@ -30,9 +30,7 @@ EXTRA_OECONF = "--disable-gdbtk --disable-x --disable-werror \
                 --with-libgmp-prefix=${STAGING_EXECPREFIXDIR} \
 "
 
-PACKAGECONFIG ??= "readline ${@bb.utils.filter('DISTRO_FEATURES', 'debuginfod', d)} python \
-                   ${@bb.utils.contains('DISTRO_FEATURES', 'minidebuginfo', 'xz', '', d)} \
-                  "
+PACKAGECONFIG ??= "readline ${@bb.utils.filter('DISTRO_FEATURES', 'debuginfod', d)} python xz"
 # Use --without-system-readline to compile with readline 5.
 PACKAGECONFIG[readline] = "--with-system-readline,--without-system-readline,readline"
 PACKAGECONFIG[python] = "--with-python=${WORKDIR}/python,--without-python,python3,python3-codecs"
diff --git a/meta/recipes-devtools/gdb/gdb-cross-canadian.inc b/meta/recipes-devtools/gdb/gdb-cross-canadian.inc
index 9150c196a85..7b4a7719e44 100644
--- a/meta/recipes-devtools/gdb/gdb-cross-canadian.inc
+++ b/meta/recipes-devtools/gdb/gdb-cross-canadian.inc
@@ -12,13 +12,9 @@ DEPENDS = "nativesdk-ncurses nativesdk-expat nativesdk-gettext nativesdk-gmp nat
 GDBPROPREFIX = "--program-prefix='${TARGET_PREFIX}'"
 
 # Overrides PACKAGECONFIG variables in gdb-common.inc
-PACKAGECONFIG ??= "python readline ${@bb.utils.filter('DISTRO_FEATURES', 'debuginfod', d)}"
 PACKAGECONFIG[python] = "--with-python=${WORKDIR}/python,--without-python,nativesdk-python3, \
                          nativesdk-python3-core \
-                         nativesdk-python3-codecs nativesdk-python3-netclient \
-                         "
-PACKAGECONFIG[readline] = "--with-system-readline,--without-system-readline,nativesdk-readline"
-PACKAGECONFIG[debuginfod] = "--with-debuginfod, --without-debuginfod, nativesdk-elfutils"
+                         nativesdk-python3-codecs nativesdk-python3-netclient"
 
 SSTATE_ALLOW_OVERLAP_FILES += "${STAGING_DATADIR}/gdb"
 
diff --git a/meta/recipes-devtools/gdb/gdb-cross.inc b/meta/recipes-devtools/gdb/gdb-cross.inc
index 399f4bba97a..110a536db72 100644
--- a/meta/recipes-devtools/gdb/gdb-cross.inc
+++ b/meta/recipes-devtools/gdb/gdb-cross.inc
@@ -4,11 +4,7 @@ DEPENDS = "expat-native gmp-native mpfr-native ncurses-native flex-native bison-
 
 inherit python3native pkgconfig
 
-# Overrides PACKAGECONFIG variables in gdb-common.inc
-PACKAGECONFIG ??= "python readline ${@bb.utils.filter('DISTRO_FEATURES', 'debuginfod', d)}"
 PACKAGECONFIG[python] = "--with-python=${PYTHON},--without-python,python3-native"
-PACKAGECONFIG[readline] = "--with-system-readline,--without-system-readline,readline-native"
-PACKAGECONFIG[debuginfod] = "--with-debuginfod, --without-debuginfod, elfutils-native"
 
 do_compile:prepend() {
     export STAGING_LIBDIR="${STAGING_LIBDIR_NATIVE}"

