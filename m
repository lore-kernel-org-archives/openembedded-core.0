Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09429D462D8
	for <webhook@archiver.kernel.org>; Wed, 13 Nov 2024 16:36:43 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.web11.15890.1731515800742813096
 for <openembedded-core@lists.openembedded.org>;
 Wed, 13 Nov 2024 08:36:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=VGKLhSV2;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.45, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-43163667f0eso61219675e9.0
        for <openembedded-core@lists.openembedded.org>; Wed, 13 Nov 2024 08:36:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1731515799; x=1732120599; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=C0zoyFw4a+3Wxb8NESRnsWwxJBGjdMmRVLncq4FA7Cs=;
        b=VGKLhSV2Hkv1d/NPC8EV9QP6sXrmftTPYidSZwYF0qosCK9hDkje0BZkLUey8Eek7o
         3RoL7oP0ckd+6UvZy5OlBa2FH8X6bd6horB0z3xHF4emL5ZwkvIMGvAYlt9i8R4NCwmN
         ZTlPhvGc+W3QsbCkQibKy2t1RdAcY7wddQhMo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731515799; x=1732120599;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=C0zoyFw4a+3Wxb8NESRnsWwxJBGjdMmRVLncq4FA7Cs=;
        b=plnk+RN1lBgWqyj/APZoDLy5Lv/lge2Up1+CNxhrMdgp/YQrG+POifzVZcydGQrao4
         osIXLVekDvmOTlMgcUKYJtrDXnHQO0RzrwV0CZdVu35pwL83dsCEmazBKlC6NkX0TBAF
         fO+SWWXbtJbh0kNsMjbKlAxwdU7v4g3z0S24e2lDQgxtKRuv5e0rPIE9MRn7IIFkBRD6
         3P41vKL0/RX5huVTucVR1+fv8t6zWkU8pyTxnZxBfvHXnsuTbYkyFHTGhaJ/fQZmTpCh
         TI/uMob5gLFS5JvTEw2rDqfx/+LZ2aS4CIPRUidRgr1Ez5J1Ofc2qIBQql7KU8/sGyMc
         XGSg==
X-Gm-Message-State: AOJu0YzRy5FROr//o+NJehDke1Y+D2ctaH56Xx7MSqDCu+e3V8ZxjveM
	xQu615ofXW736xLQRcg6gzh3g21RmqNPs3qlASu0b7UA6tOfCQPG/HD0Gczcu2zgniUBlUzJZ1y
	u7C0=
X-Google-Smtp-Source: AGHT+IGJLqvve9ERUwC0Pt1wvU4THzpfpuRo6bdzPlJMMsacA8dLZR5lY3Go4Hqps6oc6D0b1SV+VQ==
X-Received: by 2002:a05:600c:6987:b0:431:3a6d:b84a with SMTP id 5b1f17b1804b1-432bcafc5a6mr156520145e9.4.1731515798628;
        Wed, 13 Nov 2024 08:36:38 -0800 (PST)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:ab73:49b3:d413:b355])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-381ed99681csm19233552f8f.49.2024.11.13.08.36.37
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Nov 2024 08:36:38 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] insane: Split ERROR_QA into CHECKLAYER_REQUIRED_TESTS
Date: Wed, 13 Nov 2024 16:36:37 +0000
Message-ID: <20241113163637.200429-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 13 Nov 2024 16:36:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207121

We'd like to start requiring some set of checks are enabled for Yocto Project
Compatible Status and to pass yocto-check-layer. Start by splitting ERROR_QA
into two sets, the ones we think can be required and the ones we know have
challenges to implement (e.g. with prebuilt binaries).

To change the required list, the YP TSC would need to approve.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes-global/insane.bbclass | 37 +++++++++++++++---------------
 1 file changed, 18 insertions(+), 19 deletions(-)

diff --git a/meta/classes-global/insane.bbclass b/meta/classes-global/insane.bbclass
index 47c8b9be10a..e54d2c15082 100644
--- a/meta/classes-global/insane.bbclass
+++ b/meta/classes-global/insane.bbclass
@@ -24,28 +24,27 @@
 #   files under exec_prefix
 #  -Check if the package name is upper case
 
+# These tests are required to be enabled and pass for Yocto Project Compatible Status
+# for a layer. To change this list, please contact the Yocto Project TSC.
+CHECKLAYER_REQUIRED_TESTS = "\
+    configure-gettext configure-unsafe debug-files dep-cmp expanded-d files-invalid \
+    host-user-contaminated incompatible-license infodir installed-vs-shipped invalid-chars \
+    invalid-packageconfig la \
+    license-checksum license-exception license-exists license-file-missing license-format license-no-generic license-syntax \
+    mime mime-xdg missing-update-alternatives multilib obsolete-license \
+    packages-list patch-fuzz patch-status perllocalpod perm-config perm-line perm-link \
+    pkgconfig pkgvarcheck pkgv-undefined pn-overrides shebang-size src-uri-bad symlink-to-sysroot \
+    unhandled-features-check unknown-configure-option unlisted-pkg-lics uppercase-pn useless-rpaths \
+    var-undefined virtual-slash xorg-driver-abi"
+
 # Elect whether a given type of error is a warning or error, they may
 # have been set by other files.
 WARN_QA ?= "32bit-time native-last pep517-backend"
-ERROR_QA ?= "dev-so debug-deps dev-deps debug-files arch pkgconfig la \
-            textrel incompatible-license files-invalid \
-            infodir build-deps src-uri-bad symlink-to-sysroot multilib \
-            invalid-packageconfig host-user-contaminated uppercase-pn \
-            mime mime-xdg unlisted-pkg-lics unhandled-features-check \
-            missing-update-alternatives missing-ptest \
-            license-exists license-no-generic license-syntax license-format \
-            license-exception license-file-missing obsolete-license \
-            libdir xorg-driver-abi buildpaths \
-            dep-cmp pkgvarcheck perm-config perm-line perm-link \
-            packages-list pkgv-undefined var-undefined \
-            version-going-backwards expanded-d invalid-chars \
-            license-checksum dev-elf file-rdeps configure-unsafe \
-            configure-gettext perllocalpod shebang-size \
-            already-stripped installed-vs-shipped ldflags \
-            pn-overrides unknown-configure-option \
-            useless-rpaths rpaths staticdev empty-dirs \
-            patch-fuzz patch-status virtual-slash \
-            "
+ERROR_QA ?= "\
+    already-stripped arch buildpaths build-deps debug-deps dev-deps dev-elf dev-so empty-dirs file-rdeps \
+    ldflags libdir missing-ptest rpaths staticdev textrel version-going-backwards \
+    ${CHECKLAYER_REQUIRED_TESTS}"
+
 # Add usrmerge QA check based on distro feature
 ERROR_QA:append = "${@bb.utils.contains('DISTRO_FEATURES', 'usrmerge', ' usrmerge', '', d)}"
 WARN_QA:append:layer-core = " missing-metadata missing-maintainer"

