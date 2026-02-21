Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED0C4C61DDA
	for <webhook@archiver.kernel.org>; Sat, 21 Feb 2026 08:42:44 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.16676.1771663354512019304
 for <openembedded-core@lists.openembedded.org>;
 Sat, 21 Feb 2026 00:42:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=SLEaL4Bc;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.51, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-483770e0b25so27873125e9.0
        for <openembedded-core@lists.openembedded.org>; Sat, 21 Feb 2026 00:42:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1771663352; x=1772268152; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=5uZlY0dp44qhx5ifCa2rbRkn0/35l+gjFz9cQHe/gkE=;
        b=SLEaL4BcH6aYCSJ2weZ7+1BFpVXGDRgyzuyrbPobckiNQX9AY7CRrkamAwLoifm1I1
         9RbkjbitTO87p94bwEqOWQ3ERAy8uES2K5I0vCvisuL7E2lZWpyQbdt94bV0/1hciFIR
         mLy2uHei3Rvv+bIkT1r/tGcJ8gdb5NkoZQsNc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771663352; x=1772268152;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5uZlY0dp44qhx5ifCa2rbRkn0/35l+gjFz9cQHe/gkE=;
        b=YSXIb+A32i2CEVCd33e7VvTpXTTGdc+LwOy8TAetKQ1gnsmCSoIWwTFh0KlA65iwFh
         cAm5ZE2BwhJ+px6AfHq4huU49cpVyL0wTtCiLqVbWBWt/yU61lsdDFwD7FJM1hu53+rF
         A3IPkEp3a/Ixlyj6qBw0qIZLH0TLQ7+UHtZE5htmK87dD0RRrUPdziEGb9+zyiMcCEO/
         KlkKknkJ/j0lv4wWwARv8/aEghPQJlg5RSH5lGLy75sb/itZlwB3Y7ev5sW9TF2WuUND
         FqqU+McohXmr53uW0PSAO9XOsiaGHKJe2aDHE7RrVfL5TdPf8cAIaQwR6kNhlSKTeg+Q
         0njQ==
X-Gm-Message-State: AOJu0YxbRRJpYmHPZf2jt2Y1hJpX8MP1ePyIk3baIf11oSkEsSDG1tP6
	cwCooNfTQJFrOuabMARAVd9EdXQVoyQSwk3/TtQ6EB5+g8cGzjaXPbKgTK+Ikimb9XKXHIUJaQm
	Xbq8tWhk=
X-Gm-Gg: AZuq6aJgeo0UEaFHy6CpOhwCyIDnubVuadhLLyyuloizHYLcN5tLA3s2E2JVGL+w9Zc
	MnfHiYeIuUZEczXM8X5v080tXA8oNEQE7PCTlfUbMXlf59jJWgjbGUVHgTDnhv9aiNUWv8+45JC
	aWyHM7/QaRRImLWoidYmUFDLB/GCnyHPFb4AXWQa08NNJAENNP02YiIOEFAF1eVeSV1hQdOqqdo
	nKC6x1lzgQpXJTD/uhYmFE6rhwkk+I1LwdTXX8dhA+CFWpfsnXXFPAA/VoaUriiEPlS0WcOZBGB
	p2WyKJpn8c/qHZF8btZRU3+RjNOEqxIfAt/srcZjRsiagLpNQsMkERTs7XdbFljk4aiWJPAVceS
	XhGZ8ZAF0qly9Fd2TlHopOGjecB16l5CbbytxTG6KoqI5dnwixlK6IuUGi3It8p1QhhivxF1KCt
	03ZhiVbYL5At6gFLQY1zxNa0MmI43xXvPgOz/rdS3E32sQ2gAf/Sg=
X-Received: by 2002:a05:600c:3516:b0:480:2521:4d92 with SMTP id 5b1f17b1804b1-483a96377c9mr34818695e9.24.1771663352087;
        Sat, 21 Feb 2026 00:42:32 -0800 (PST)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:4b64:9a04:85e4:d902])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483a31b3e0dsm205898295e9.1.2026.02.21.00.42.31
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Feb 2026 00:42:31 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/6] conf: Switch to systemd by default and simplify init manager selection
Date: Sat, 21 Feb 2026 08:42:25 +0000
Message-ID: <20260221084230.3219379-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 21 Feb 2026 08:42:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231608

This change effectively switches things to use INIT_MANAGER to select the init
system and drops the old compatibility 'none' method. The init manager selection
is now complex enough that requiring users to select it makes sense.

The new default is systemd, which reflects popular opinion. This is known to have
issues in some of our configurations such as musl but is also frequently asked for.

Anyone replacing defaultsetup.conf in their own setup will need to provide
equivalent functionality but that is execpted for any of the settings in there.

This change drops sysvinit from the default distro features backfill, meaning
we no longer need to remove it in systemd setups and places the init managers
on a more equal and equivalent standing.

This is a behaviour change for anyone using nodistro and anyone not already
setting INIT_MANAGER explictly.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/conf/bitbake.conf                                 | 2 +-
 meta/conf/distro/defaultsetup.conf                     | 2 +-
 meta/conf/distro/include/init-manager-mdev-busybox.inc | 1 -
 meta/conf/distro/include/init-manager-none.inc         | 4 ----
 meta/conf/distro/include/init-manager-systemd.inc      | 1 -
 meta/conf/distro/include/init-manager-sysvinit.inc     | 1 -
 6 files changed, 2 insertions(+), 9 deletions(-)
 delete mode 100644 meta/conf/distro/include/init-manager-none.inc

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index be76c88cce1..aa6b5bbf9a0 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -920,7 +920,7 @@ DISTRO_FEATURES_NATIVESDK:mingw32 = "x11 ipv6"
 DISTRO_FEATURES_FILTER_NATIVE ?= "api-documentation debuginfod opencl opengl wayland"
 DISTRO_FEATURES_FILTER_NATIVESDK ?= "api-documentation debuginfod opencl opengl wayland"
 
-DISTRO_FEATURES_BACKFILL = "pulseaudio sysvinit gobject-introspection-data ldconfig"
+DISTRO_FEATURES_BACKFILL = "pulseaudio gobject-introspection-data ldconfig"
 MACHINE_FEATURES_BACKFILL = "rtc qemu-usermode"
 
 COMBINED_FEATURES = "${@oe.utils.set_intersect('DISTRO_FEATURES', 'MACHINE_FEATURES', d)}"
diff --git a/meta/conf/distro/defaultsetup.conf b/meta/conf/distro/defaultsetup.conf
index 62a5849c77e..269c3ad3f7b 100644
--- a/meta/conf/distro/defaultsetup.conf
+++ b/meta/conf/distro/defaultsetup.conf
@@ -12,5 +12,5 @@ PACKAGE_CLASSES ?= "package_ipk"
 INHERIT_DISTRO ?= "debian devshell sstate license remove-libtool create-spdx buildstats"
 INHERIT += "${PACKAGE_CLASSES} ${USER_CLASSES} ${INHERIT_DISTRO}"
 
-INIT_MANAGER ??= "none"
+INIT_MANAGER ??= "systemd"
 require conf/distro/include/init-manager-${INIT_MANAGER}.inc
diff --git a/meta/conf/distro/include/init-manager-mdev-busybox.inc b/meta/conf/distro/include/init-manager-mdev-busybox.inc
index d9b05e1781b..9b44e3e529c 100644
--- a/meta/conf/distro/include/init-manager-mdev-busybox.inc
+++ b/meta/conf/distro/include/init-manager-mdev-busybox.inc
@@ -1,5 +1,4 @@
 # enable mdev/busybox for init
-DISTRO_FEATURES_BACKFILL_CONSIDERED:append = " systemd sysvinit"
 VIRTUAL-RUNTIME_dev_manager ??= "busybox-mdev"
 VIRTUAL-RUNTIME_init_manager ??= "busybox"
 VIRTUAL-RUNTIME_initscripts ??= "initscripts"
diff --git a/meta/conf/distro/include/init-manager-none.inc b/meta/conf/distro/include/init-manager-none.inc
deleted file mode 100644
index 6ece5c99061..00000000000
--- a/meta/conf/distro/include/init-manager-none.inc
+++ /dev/null
@@ -1,4 +0,0 @@
-VIRTUAL-RUNTIME_init_manager ??= "sysvinit"
-VIRTUAL-RUNTIME_initscripts ??= "initscripts"
-VIRTUAL-RUNTIME_login_manager ??= "busybox"
-VIRTUAL-RUNTIME_dev_manager ??= "udev"
diff --git a/meta/conf/distro/include/init-manager-systemd.inc b/meta/conf/distro/include/init-manager-systemd.inc
index 1e64b8ad226..63fd225ca50 100644
--- a/meta/conf/distro/include/init-manager-systemd.inc
+++ b/meta/conf/distro/include/init-manager-systemd.inc
@@ -1,6 +1,5 @@
 # Use systemd for system initialization
 DISTRO_FEATURES:append = " systemd usrmerge"
-DISTRO_FEATURES_BACKFILL_CONSIDERED:append = " sysvinit"
 VIRTUAL-RUNTIME_init_manager ??= "systemd"
 VIRTUAL-RUNTIME_initscripts ??= ""
 VIRTUAL-RUNTIME_login_manager ??= "shadow-base"
diff --git a/meta/conf/distro/include/init-manager-sysvinit.inc b/meta/conf/distro/include/init-manager-sysvinit.inc
index e2d17b358d4..9ff5fed877c 100644
--- a/meta/conf/distro/include/init-manager-sysvinit.inc
+++ b/meta/conf/distro/include/init-manager-sysvinit.inc
@@ -1,6 +1,5 @@
 # Use sysvinit for system initialization
 DISTRO_FEATURES:append = " sysvinit"
-DISTRO_FEATURES_BACKFILL_CONSIDERED:append = " systemd"
 VIRTUAL-RUNTIME_init_manager ??= "sysvinit"
 VIRTUAL-RUNTIME_initscripts ??= "initscripts"
 VIRTUAL-RUNTIME_login_manager ??= "busybox"

