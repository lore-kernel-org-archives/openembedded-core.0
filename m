Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE74FD1F9BD
	for <webhook@archiver.kernel.org>; Tue, 15 Oct 2024 18:52:10 +0000 (UTC)
Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
 by mx.groups.io with SMTP id smtpd.web10.4758.1729018321368309814
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Oct 2024 11:52:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=Wm+MKsy6;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.182, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-7ea78037b7eso2612604a12.0
        for <openembedded-core@lists.openembedded.org>; Tue, 15 Oct 2024 11:52:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1729018321; x=1729623121; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oSNu9m1EWefviKNDfFxAOteKGwrHvJycJ7vM9XedQTw=;
        b=Wm+MKsy6k2754zqst9ZLKRdGcRlWMhWFIJpNsnlSyWtNkaNt/6mLRB+3zQCP7i4CGs
         2jA/S97SKMYKjuQRZ4ylyP2No8cfvGtOwXuHL9K+7pC2Kbx6G7jKaDvbcRVvl6vhZno6
         wZnH4vp7rNl0dGlyEdF3Urj8VVOrLb3mg3kvsVxx98HFQ3ODuu0AAjkn4SW+0KeJVwIR
         AlgHMKDU0SI+NhQy19uYrVakfiEd0Oi7ad2x4ub1WcxpvUvXN/vHu5b9V9gYt3HqVSIb
         uczfuZniOHYFPkE8mlWh95vUhaz8i+E+KYRvrWlvkEw8OY/bvH4AtRw28qjbq6xY516L
         l3Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729018321; x=1729623121;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oSNu9m1EWefviKNDfFxAOteKGwrHvJycJ7vM9XedQTw=;
        b=ZW3RPloml9eKxIyy0EnLXkivcQ3Vs+HG0e2dkestmUjnHgAg/LpsYAImtMpUxL7+QO
         ANgpEDvnw/RYmSEapi/+/b+YQv9Tp4saBL+rI8a9wdYPU9BGtrRhiBBpOom+/IdRN1bl
         BZ+Mn0IdoZPfQ6kD/3eJABhM2XiEO9Df7+XJpBi4sQsixsEfRPa3iK5QzhbhkzV0PpQT
         UNhgiyOnZ8YuZzMcaSaipUtoCDkuEyJh7Ip90qLpVKBTRSUUfJrSPNJAXJs5kcooZnsf
         th8ulr0N8oY2tPy3E7FqeVRNPjA+CD+7bZMTwTGUBG6h93ceBtEoD8ZRFq+zV3R2Eo6I
         BEYA==
X-Gm-Message-State: AOJu0YyHSJUgYQTVtJXMi+5urGOxuW8iumHRi7Nozp5g37OYbBYnkmMI
	Pv0IMt99k+6Ne/aTgNGH28amGEsVvBsiGHiAJRzRUs3rkt+xhnJMFm12oNlPx4cTEwB4Ak4Izv/
	k
X-Google-Smtp-Source: AGHT+IEYcQNzD1ce+PgAhHNC7mMVDlSgasdSBES+DhZJU1ARVRrQxW8iuzXSQM3MgDsYPNM38hrXBw==
X-Received: by 2002:a05:6a21:3947:b0:1d9:2a8:ce2a with SMTP id adf61e73a8af0-1d902a8d057mr1824014637.45.1729018290727;
        Tue, 15 Oct 2024 11:51:30 -0700 (PDT)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71e773717b9sm1616187b3a.9.2024.10.15.11.51.30
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Oct 2024 11:51:30 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 18/18] meta-ide-support: Mark recipe as MACHINE-specific
Date: Tue, 15 Oct 2024 11:50:54 -0700
Message-Id: <bec6b535c9a817a5ed51453bcb9ecae0b81a8590.1729018153.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1729018153.git.steve@sakoman.com>
References: <cover.1729018153.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 15 Oct 2024 18:52:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205942

From: Paul Barker <paul.barker.ct@bp.renesas.com>

meta-ide-support:do_write_test_data dumps the bitbake data dictionary to
a file using export2json(). As this obviously includes the value of
MACHINE, and other MACHINE-specific variables, the recipe needs to be
marked as MACHINE-specific.

RP: Note that this patch does change the name of the environment script
since it is no longer package arch specific but machine arch specific.

[RP: Fix selftest to reference new environment file]
Signed-off-by: Paul Barker <paul.barker.ct@bp.renesas.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 3be2bc8a9b0c9d6a178329c8b451a6bedf255d6c)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/lib/oeqa/selftest/cases/meta_ide.py   | 4 ++--
 meta/recipes-core/meta/meta-ide-support.bb | 1 +
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/meta_ide.py b/meta/lib/oeqa/selftest/cases/meta_ide.py
index ffe0d2604d..5a17ca52ea 100644
--- a/meta/lib/oeqa/selftest/cases/meta_ide.py
+++ b/meta/lib/oeqa/selftest/cases/meta_ide.py
@@ -20,8 +20,8 @@ class MetaIDE(OESelftestTestCase):
         bitbake('meta-ide-support')
         bitbake('build-sysroots -c build_native_sysroot')
         bitbake('build-sysroots -c build_target_sysroot')
-        bb_vars = get_bb_vars(['MULTIMACH_TARGET_SYS', 'DEPLOY_DIR_IMAGE', 'COREBASE'])
-        cls.environment_script = 'environment-setup-%s' % bb_vars['MULTIMACH_TARGET_SYS']
+        bb_vars = get_bb_vars(['MACHINE_ARCH', 'TARGET_VENDOR', 'TARGET_OS', 'DEPLOY_DIR_IMAGE', 'COREBASE'])
+        cls.environment_script = 'environment-setup-%s%s-%s' % (bb_vars['MACHINE_ARCH'], bb_vars['TARGET_VENDOR'], bb_vars['TARGET_OS'])
         cls.deploydir = bb_vars['DEPLOY_DIR_IMAGE']
         cls.environment_script_path = '%s/%s' % (cls.deploydir, cls.environment_script)
         cls.corebasedir = bb_vars['COREBASE']
diff --git a/meta/recipes-core/meta/meta-ide-support.bb b/meta/recipes-core/meta/meta-ide-support.bb
index d85aa120c0..7ed422ce4d 100644
--- a/meta/recipes-core/meta/meta-ide-support.bb
+++ b/meta/recipes-core/meta/meta-ide-support.bb
@@ -1,6 +1,7 @@
 SUMMARY = "Integrated Development Environment support"
 DESCRIPTION = "Meta package for ensuring the build directory contains all appropriate toolchain packages for using an IDE"
 LICENSE = "MIT"
+PACKAGE_ARCH = "${MACHINE_ARCH}"
 
 DEPENDS = "virtual/libc gdb-cross-${TARGET_ARCH} qemu-native qemu-helper-native unfs3-native cmake-native autoconf-native automake-native meson-native intltool-native pkgconfig-native"
 RM_WORK_EXCLUDE += "${PN}"
-- 
2.34.1


