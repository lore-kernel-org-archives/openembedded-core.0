Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39B5ECFC26E
	for <webhook@archiver.kernel.org>; Fri, 21 Nov 2025 12:22:56 +0000 (UTC)
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.10317.1763727774029948674
 for <openembedded-core@lists.openembedded.org>;
 Fri, 21 Nov 2025 04:22:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=J/dgOOv1;
 spf=pass (domain: gmail.com, ip: 209.85.218.44, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-b736ffc531fso292097366b.1
        for <openembedded-core@lists.openembedded.org>; Fri, 21 Nov 2025 04:22:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763727772; x=1764332572; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+N10TrN657uIs6ubT4FENyLoWkRMlrGihwxbMMpIoFs=;
        b=J/dgOOv1F9z3S3OfyC+rSHBZ2qWQGX+7F/EDsOIj4gTAZTWuZNQnDgWf1qIcBxlg/2
         651r+yY3NUklA91Yf0q+8yQPBEvXOtj8pK+POHqLql9pToI8x1WPdzxilvXgMRPAwFJA
         7TVUXtV/tMdVRHNrlGIeN+DiST5+7lqKcC2EaQ2MAXA9+QsDWHcYP5vagW4u/8PKeoS7
         ZiZB9ebELewDfQVQQ1GQNNswnuwP5Qj2LSo7f1iSqsvAeJdT0FndiLyZ1j2K86sfKSuu
         3PeGg5fRWnn9a0TvN87grmxqY0AMVZa2R97B3t52hh9sGConrYJ+4shb2gEyCCZYreaa
         8hIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763727772; x=1764332572;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+N10TrN657uIs6ubT4FENyLoWkRMlrGihwxbMMpIoFs=;
        b=q9T/eJWohzo0joDha+h11plkYPQaPnIDbu632rk+blDm1akWKFnYCRiAO79A6PrXpw
         cOPvbFkSOYXC+X7XLDXtobPs0e22oSkLpJu3LJ4HrPpMXWDAYwoc9HvtdAh6wE89rnMw
         CfzWnwQCuul2NrgsOMNxS2WardcrjPpVdJNgKgomFWV4NuB/gdIAjoIffWOFg1zr7J20
         sfbzWf7oC7Za8G63lfYZajPSujdvs5wQAOCa5oeP01naoMw1N2rqsfW8axY3rn0E00ju
         8G8Tiz9a7qcuxCuA7NYOV6/1yWgV7JZc/OoSo3NbmMVnndp6G1hsNYksMObzYLAZ9ObC
         1UUA==
X-Gm-Message-State: AOJu0YyeqDM3YQjJj7mYYDaHUtnUtnJ58kBjFdhtYen81kMN1NslMZMF
	0iksnvTTa3n14HSKfqtNZW8VYoTr4zv/v4VPuQNc+wJ9+jUbHxU4o0vYqXY6IQ==
X-Gm-Gg: ASbGncv3Yj3xNbKkCci6XuwHR4YZjO8E/YP66QIKI0Hr1J3cCLKDWtGr9GVmtDPy6Xz
	0vn66do+mECv9+kTSL4yNhuvXQnyRmW28PukOGbg5eoZxyJKzcNoOT/r7tCzqrqmmTQVwZGRD2Y
	Z2JUaIZoiMDVxVR0OtIs1T0mL8IXNpBw/L6eeYErU3NF1QnR9YPBCVpEK4xIeZUjr/qmUKdgqhF
	0Ysq62VzJQldxIr80EAmXnof6SCbDA+KnAoXl7yjf123mymIvO3WZWbUtjYDn1L3uAa1lHPAF99
	w2YUUlds3erXzlJe7pPVDsoNjPVzAgO0ZqhtLS3q63dKdFXXBrM6gss6znRvcAx20g+GVOjw3w0
	tx8joiPR/n3FNLvLOSSpOrpn1kE2NeX2/JEnNRe54UX9eo908K8LTC9Se1qrsw2wTlKlZiYFmnF
	L9kCX5O0uHIRGhdYz3Ue8e09E/NEBiBOh2c2A+G9+8ssVbKTQ=
X-Google-Smtp-Source: AGHT+IFgpHap5vZu/Ugl0GpGKSbhgBOxN3T1LCm6Ke+yiSJWrcITWP68MMmNdjShrEX7ktC5wNwlHw==
X-Received: by 2002:a17:907:94cd:b0:b74:983b:4056 with SMTP id a640c23a62f3a-b767150b98dmr179095266b.8.1763727771877;
        Fri, 21 Nov 2025 04:22:51 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b7654d80665sm438813966b.31.2025.11.21.04.22.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Nov 2025 04:22:51 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH] gawk: use native gawk when building glibc and grub
Date: Fri, 21 Nov 2025 13:22:49 +0100
Message-Id: <20251121122249.1768384-1-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 21 Nov 2025 12:22:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226675

From: Alexander Kanavin <alex@linutronix.de>

Different versions of gawk can produce different output,
so depending on which version is installed on the build host,
reproducibility issues can occur:
https://bugzilla.yoctoproject.org/show_bug.cgi?id=16072

So far only glibc and grub have been identified to have
the issue; probably more fixes of similar nature will be
required going forward.

Adjust the gawk recipe to apply target-only tweaks
(particularly the removal of awk symlink to allow for alternatives)
to only target and nativesdk variants, so that native installs
both awk and gawk executables.

[YOCTO #16072]

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/recipes-bsp/grub/grub2.inc          |  2 +-
 meta/recipes-core/glibc/glibc.inc        |  2 +-
 meta/recipes-extended/gawk/gawk_5.3.2.bb | 11 ++++++++++-
 3 files changed, 12 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-bsp/grub/grub2.inc b/meta/recipes-bsp/grub/grub2.inc
index 14edda334ac..f67f0a167a5 100644
--- a/meta/recipes-bsp/grub/grub2.inc
+++ b/meta/recipes-bsp/grub/grub2.inc
@@ -46,7 +46,7 @@ CVE_STATUS[CVE-2023-4001]  = "not-applicable-platform: Applies only to RHEL/Fedo
 CVE_STATUS[CVE-2024-1048]  = "not-applicable-platform: Applies only to RHEL/Fedora"
 CVE_STATUS[CVE-2024-2312]  = "not-applicable-platform: Applies only to Ubuntu"
 
-DEPENDS = "flex-native bison-native gettext-native"
+DEPENDS = "flex-native bison-native gettext-native gawk-replacement-native"
 
 GRUB_COMPATIBLE_HOST = '(x86_64.*|i.86.*|arm.*|aarch64.*|loongarch64.*|riscv.*)-(linux.*|freebsd.*)'
 COMPATIBLE_HOST = "${GRUB_COMPATIBLE_HOST}"
diff --git a/meta/recipes-core/glibc/glibc.inc b/meta/recipes-core/glibc/glibc.inc
index d8f20c87dd6..68fac4cca51 100644
--- a/meta/recipes-core/glibc/glibc.inc
+++ b/meta/recipes-core/glibc/glibc.inc
@@ -1,7 +1,7 @@
 require glibc-common.inc
 require glibc-ld.inc
 
-DEPENDS = "virtual/cross-cc virtual/cross-binutils libgcc-initial linux-libc-headers"
+DEPENDS = "virtual/cross-cc virtual/cross-binutils libgcc-initial linux-libc-headers gawk-replacement-native"
 
 PROVIDES = "virtual/libc"
 PROVIDES += "virtual/libintl virtual/libiconv"
diff --git a/meta/recipes-extended/gawk/gawk_5.3.2.bb b/meta/recipes-extended/gawk/gawk_5.3.2.bb
index 0448d90ba7b..01602f4f27a 100644
--- a/meta/recipes-extended/gawk/gawk_5.3.2.bb
+++ b/meta/recipes-extended/gawk/gawk_5.3.2.bb
@@ -41,13 +41,21 @@ ALTERNATIVE:${PN} = "awk"
 ALTERNATIVE_TARGET[awk] = "${bindir}/gawk"
 ALTERNATIVE_PRIORITY = "100"
 
-do_install:append() {
+target_tweaks() {
 	# remove the link since we don't package it
 	rm ${D}${bindir}/awk
 	# Strip non-reproducible build flags (containing build paths)
 	sed -i -e 's|^CC.*|CC=""|g' -e 's|^CFLAGS.*|CFLAGS=""|g' ${D}${bindir}/gawkbug
 }
 
+do_install:append:class-target() {
+	target_tweaks
+}
+
+do_install:append:class-nativesdk() {
+	target_tweaks
+}
+
 inherit ptest
 
 do_install_ptest() {
@@ -94,4 +102,5 @@ RDEPENDS:${PN}-ptest += "make locale-base-en-us coreutils"
 RDEPENDS:${PN}-ptest:append:libc-glibc = " locale-base-en-us.iso-8859-1"
 RDEPENDS:${PN}-ptest:append:libc-musl = " musl-locales"
 
+PROVIDES:append:class-native = " gawk-replacement-native"
 BBCLASSEXTEND = "native nativesdk"
-- 
2.39.5


