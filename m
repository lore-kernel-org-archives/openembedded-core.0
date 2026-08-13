Return-Path: <twoerner@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48668C5DF64
	for <webhook@archiver.kernel.org>; Thu, 13 Aug 2026 03:05:28 +0000 (UTC)
Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.11349.1786590324485899756
 for <openembedded-core@lists.openembedded.org>;
 Wed, 12 Aug 2026 20:05:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=Kcco9xbt;
 spf=pass (domain: gmail.com, ip: 209.85.160.177, mailfrom: twoerner@gmail.com)
Received: by mail-qt1-f177.google.com with SMTP id d75a77b69052e-51c04bf4711so1827141cf.2
        for <openembedded-core@lists.openembedded.org>; Wed, 12 Aug 2026 20:05:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786590323; x=1787195123; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=QirHiywQjsG19JcUJ9KLCnhUGdgjFbu54BG+q4PtAhk=;
        b=Kcco9xbtDkCZ70wueNxw4uTaTX5IC53sh1uh2CWIgifqBUXxyGqAQjcdMk4qJazZHh
         fh+l5SKCIa/fJT3Z5sgwQhcLzGhfMkVsLhyDibeq9ExPYufh+sfxr+GQf1xoJj2aRiZT
         J7rdQEQ6mTyB2Miv33QwU5dSgt3qFL408n5ljmukmm6MfJyTH6VQUF45FMgaI00cl9Lm
         X87xF95ng23Bk+CYBO3vtOU7lW+yZEAbVo7EugB9A1P4eq1nLpcDEHcCNMY5QCl7Jsf8
         YQTdJ7e4OKd1m3K7OKqmVBanYWMLP2FM6KbPnkVBkXHvt0+sFaqoa21pUv+vQz9E6D6l
         UWGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786590323; x=1787195123;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=QirHiywQjsG19JcUJ9KLCnhUGdgjFbu54BG+q4PtAhk=;
        b=QX1zF5sbpzTyTVvQDU35z0fP4XueewlSMIWrMbdDC87qpqhM0Ypoh5+ziCDysMFHDF
         3D2rnazG7LP+6nJKuhHhek9x6ZvBFAl/tUnQzFB/J1xV4CucziK5A/mDnJ23u6nl3ugu
         xqBbNw/hlo4u/DvDhhttj/iA4SUbbrwgRBzHKyAiHQs8j8i3GNANrjchOF4z+n1I7vTF
         2/cfpx4ACIoaKdor3gRHZT+xCxuGoOvTrM62stgyEmPAXs2xF2tfSBgkzItqpPSHVYLl
         BlBcgiPTsVYidElFK9ZiiXojWXKJnPYk36aNY/tPRmw4zbc+2Ft6Swm57KAJv3nyxHuE
         RVtg==
X-Gm-Message-State: AOJu0YywkNWII1A9gUMI6P+DxBHJp9B9mTaSlqFQXMCye2pi1Wqz5kJx
	TVR3cRUMfWz0LuKNa7ZgwXo/8O3z3K2HlfV9GMdAwSw2nFrVm2Z0STsV9Pp7Pq5u
X-Gm-Gg: AR+sD10tqTv9Pva952MdmWLb7VY3gxhES5r0lbUlOql6Bha8xu6EBhLtm07R9W614ui
	vXghMUSxnzweYIjwoipuSoEsutXf2Bz+Fs9Khi74drj4iHx3acwuB2lHsP9lcxn1aJeJpV+WV1/
	aXd5TfaQNNwjlSSWGO2UG18HdFMNLBjSoS3RcSJdrylQiG9LTjxItcTHsU1L7F7FCI4ZLmCeZcO
	txH1r7p4a0GaXUcYgZPP3sr3HcEID08dqol95+jxxK5N/bulSm8g075FLfZTAYuzUTCAZn1B3Ac
	Q+jAMkpYbeFj8sJToZa71J7mG8tLvLVbySQAE0TkxdDBH0ghg6JxByWJ3etPdhcOtu0VvbAp7do
	ab43YvsJbEwu3Ef9+p+z/JYgeU5MMvdvLCKtkPtNEvLapbA9rvAR79yK6ojIcfyPE6GJXxKI0ro
	FLkRJqGMcjUCGCrr/aPtwPES+oCNCNMEPcNso7oB6fFxE8ReYm/l8jzAJc6vQtMyj6LULej8YZC
	WFkpnR9jzjCECby8fJhZ7ZTMk1KoFk=
X-Received: by 2002:ac8:7f03:0:b0:51a:6feb:dc8a with SMTP id d75a77b69052e-52d73c9533dmr29326821cf.18.1786590323340;
        Wed, 12 Aug 2026 20:05:23 -0700 (PDT)
Received: from localhost.localdomain (pppoe-209-91-167-254.vianet.ca. [209.91.167.254])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-52d73e2e596sm8013921cf.9.2026.08.12.20.05.20
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Aug 2026 20:05:21 -0700 (PDT)
From: Trevor Woerner <twoerner@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v2 2/2] oeqa/sdk: build the kernel's host tools with a host pkg-config
Date: Wed, 12 Aug 2026 23:05:15 -0400
Message-ID: <20260813030515.1028627-3-twoerner@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260813030515.1028627-1-twoerner@gmail.com>
References: <20260813030515.1028627-1-twoerner@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 13 Aug 2026 03:05:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243323

The SDK environment sets PKG_CONFIG_SYSROOT_DIR, PKG_CONFIG_PATH and
PKG_CONFIG_LIBDIR so that pkg-config answers for the target. That is
right for everything built to run there and wrong for a program built to
run on the SDK host.

The kernel build compiles host tools of its own, and objtool asks
pkg-config where libelf is. It gets the target's include directory,
compiles a host tool against the target's C library headers, and stops
on warnings that -Wno-system-headers would otherwise have covered:

  usr/include/sys/cdefs.h:486: error: "__attribute_const__" redefined

Pass a pkg-config that undoes those three variables on the make command
line when the test builds an external module. It has to be a command
line assignment: the kernel assigns HOSTPKG_CONFIG with '=', so an
exported value is ignored. OE-Core already does the same thing for its
own kernel builds, in kernel.bbclass.

Fixes [YOCTO #16239].

AI-Generated: codex/claude-opus 5 (xhigh)
Signed-off-by: Trevor Woerner <twoerner@gmail.com>
---
changes in v2:
- drop the HOSTPKG_CONFIG export from the SDK environment script. It
  only ever took effect against a proposed kernel change that has since
  been abandoned, so no kernel honours it and it was dead weight. The
  make command line assignment, which is what makes the test work, is
  unchanged
- the subject loses its toolchain-scripts prefix, since that file is no
  longer touched
- drop the paragraph citing the kernel proposal
---
 meta/lib/oeqa/sdk/cases/kmod.py | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/meta/lib/oeqa/sdk/cases/kmod.py b/meta/lib/oeqa/sdk/cases/kmod.py
index 1be23e994fd2..1d73f076e552 100644
--- a/meta/lib/oeqa/sdk/cases/kmod.py
+++ b/meta/lib/oeqa/sdk/cases/kmod.py
@@ -26,8 +26,11 @@ class KernelModuleTest(OESDKTestCase):
         parallel_make = "-j %d" % (pmv) if pmv else ""
 
         self.ensure_target_package("kernel-devsrc")
+        # the kernel assigns HOSTPKG_CONFIG with '=', so it has to come from
+        # the make command line, as kernel.bbclass does
+        host_pkg_config = 'HOSTPKG_CONFIG="env -u PKG_CONFIG_SYSROOT_DIR -u PKG_CONFIG_PATH -u PKG_CONFIG_LIBDIR pkg-config"'
         # These targets need to be built before kernel modules can be built.
-        self._run("make %s -C $OECORE_TARGET_SYSROOT/usr/src/kernel prepare scripts" % (parallel_make))
+        self._run("make %s %s -C $OECORE_TARGET_SYSROOT/usr/src/kernel prepare scripts" % (parallel_make, host_pkg_config))
 
         with tempfile.TemporaryDirectory(prefix="cryptodev", dir=self.tc.sdk_dir) as testdir:
             git_url = "https://github.com/cryptodev-linux/cryptodev-linux"
@@ -39,5 +42,5 @@ class KernelModuleTest(OESDKTestCase):
             self.assertTrue(os.path.isdir(sourcedir))
             subprocess.check_output(["git", "-C", sourcedir, "checkout", git_sha], stderr=subprocess.STDOUT)
 
-            self._run("make -C %s V=1 KERNEL_DIR=$OECORE_TARGET_SYSROOT/usr/src/kernel" % sourcedir)
+            self._run("make -C %s V=1 %s KERNEL_DIR=$OECORE_TARGET_SYSROOT/usr/src/kernel" % (sourcedir, host_pkg_config))
             self.check_elf(os.path.join(sourcedir, "cryptodev.ko"))
-- 
2.50.0.173.g8b6f19ccfc3a


