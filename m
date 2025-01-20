Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2DD8DC02182
	for <webhook@archiver.kernel.org>; Mon, 20 Jan 2025 17:51:35 +0000 (UTC)
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
 by mx.groups.io with SMTP id smtpd.web11.42139.1737395494404212248
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Jan 2025 09:51:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=sIbbGpn/;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.182, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2166360285dso89478045ad.1
        for <openembedded-core@lists.openembedded.org>; Mon, 20 Jan 2025 09:51:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1737395494; x=1738000294; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pZXQ6TUsE8OSVCgq+8L2o1GL29kDKEhGCkMVpGRWnww=;
        b=sIbbGpn/elBXlRH2mx6WMGkGtV7mvQUiDLLxOhqX7DQYBImRvPuWIC8ms5Tot0AkaX
         kQ9rxia6Ktqxo3FWtjYDceAyi97bF84PzC5DuemuMufLzPqmG6GCTn3LY3wvcqRt2LcU
         EWIEOv+dGN6OqWQ635ZEZ50YRIOVEnLK2SpqbNoOhDf+gszKXG10drsvW5/GhEqbwufy
         kDkUk8NTlJqAxp3uDmYURfOsFzpBCbllkfnU9OxJFP1sgEd767Sk3pxGVuaDP2eqQY+n
         FOjXfzlg5wea4Z3cDTXRkafRU4CEicTsEEUT6ZtEMwE0/4CR8MPYYZxAidklQ0rqjcB4
         SkhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737395494; x=1738000294;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pZXQ6TUsE8OSVCgq+8L2o1GL29kDKEhGCkMVpGRWnww=;
        b=VIAcOaxsxwUGHKSMizWcI3Om0NBIkbiwXCWf8BketLOHmggzf0MlZEv8GmK70Zwm+P
         0QjZ/sew3Azya08k9WHooeBS/nREmo5e3U99XaT+uGl/tKAG6ftBkjp4G5lS9eyBh9Tu
         AyrB12+aItbUMdgP7y/T3Tzd+bzF8KvgSfU1ilq3suc+XoJ8F+FtXZe9MVAo3f9M+QD+
         dV3UIl4Gg43s9cXKSiqQKDwViPLCHDFbgGVBrZfqNQX9SlTskoj7pge+PRS2Jx4akc8K
         PQWnCQRvgjfDrpgBO9HLBuWLfgLhmn1HmBS73N0T0Wlm/O4RQ5ApbIDoArzFD4uzQGzx
         3NpA==
X-Gm-Message-State: AOJu0Yw9xxHSXt3kIqivcREkprhePOGHm+qxiZdZEocpcUpMjWQRTcJP
	PjOwpXSJuKm0X1fnSpCAifUTXl9ROknBCI2a7rvQRBUdpKn2hz+26EzEJz4rNE17jgKGZtTFuBe
	+A1g=
X-Gm-Gg: ASbGncuzyfD5EkAvgwEmZ9W7VNVk9tfhUAQdOj0EgJbsGcHuBVDecQUHRkPVoplWMGi
	Xnklv0RfXUROAO5BTqKm9WZp4/EI5Jfk2PYxXSsdSFzJqaTC8nIDkJPSHw2ujFRPwr2kx6zj4ux
	uL0WPLLBkgmj7VLVmNNhfKdRN2aN7gAi7m3W3wrBgfPND9jEG/WrvGHLXji70pnYRqOWtbfZpdw
	iOQ1MI7gJd7CL6Zs8VypB0pgF3+le3qMVhxDrpkQMLd03Wc5+01efx56iY=
X-Google-Smtp-Source: AGHT+IG5U8CCdFeTHtw4Dr5xuN/sMQFbPS265NfOIPrFeuCpTsBIcekaHXKl2fYH9h5cIuaVWK9G6g==
X-Received: by 2002:a05:6a20:2591:b0:1e1:e2d9:3f31 with SMTP id adf61e73a8af0-1eb2148df72mr20131790637.16.1737395493615;
        Mon, 20 Jan 2025 09:51:33 -0800 (PST)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-a9bcdcf643esm6155565a12.38.2025.01.20.09.51.33
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jan 2025 09:51:33 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 16/16] classes/qemu: use tune to select QEMU_EXTRAOPTIONS, not package architecture
Date: Mon, 20 Jan 2025 09:51:00 -0800
Message-ID: <077aab43f2c928eb8da71934405c62327010f552.1737395091.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1737395091.git.steve@sakoman.com>
References: <cover.1737395091.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 20 Jan 2025 17:51:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210060

From: Ross Burton <ross.burton@arm.com>

Using the package architecture to select the right qemu options to pass
to qemu-user is incorrect, and fails for recipes that set PACKAGE_ARCH
to MACHINE_ARCH (as the qemuppc workarounds suggest) because there are
not typically any options set for the machine name.

Solve this by using TUNE_PKGARCH instead: for the majority of recipes
this is the same value, but for machine-specific recipes it remains the
same instead of changing to the machine name.

This means we can remove the qemuppc workarounds, as they're obsolete.

Also update the gcc-testsuite recipe which uses the same pattern to use
TUNE_PKGARCH, and generalise the else codepath to avoid needing to
update the list of architectures.

[ YOCTO #15647 ]

Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes/qemu.bbclass                   | 8 ++------
 meta/recipes-devtools/gcc/gcc-testsuite.inc | 6 ++++--
 2 files changed, 6 insertions(+), 8 deletions(-)

diff --git a/meta/classes/qemu.bbclass b/meta/classes/qemu.bbclass
index 7493ac34d4..1b888f4699 100644
--- a/meta/classes/qemu.bbclass
+++ b/meta/classes/qemu.bbclass
@@ -54,8 +54,8 @@ def qemu_run_binary(data, rootfs_path, binary):
 # this dance). For others (e.g. arm) a -cpu option is not necessary, since the
 # qemu-arm default CPU supports all required architecture levels.
 
-QEMU_OPTIONS = "-r ${OLDEST_KERNEL} ${@d.getVar("QEMU_EXTRAOPTIONS_%s" % d.getVar('PACKAGE_ARCH')) or ""}"
-QEMU_OPTIONS[vardeps] += "QEMU_EXTRAOPTIONS_${PACKAGE_ARCH}"
+QEMU_OPTIONS = "-r ${OLDEST_KERNEL} ${@d.getVar("QEMU_EXTRAOPTIONS_%s" % d.getVar('TUNE_PKGARCH')) or ""}"
+QEMU_OPTIONS[vardeps] += "QEMU_EXTRAOPTIONS_${TUNE_PKGARCH}"
 
 QEMU_EXTRAOPTIONS_ppce500v2 = " -cpu e500v2"
 QEMU_EXTRAOPTIONS_ppce500mc = " -cpu e500mc"
@@ -65,7 +65,3 @@ QEMU_EXTRAOPTIONS_ppce6500 = " -cpu e500mc"
 QEMU_EXTRAOPTIONS_ppc64e6500 = " -cpu e500mc"
 QEMU_EXTRAOPTIONS_ppc7400 = " -cpu 7400"
 QEMU_EXTRAOPTIONS_powerpc64le = " -cpu POWER9"
-# Some packages e.g. fwupd sets PACKAGE_ARCH = MACHINE_ARCH and uses meson which
-# needs right options to usermode qemu
-QEMU_EXTRAOPTIONS_qemuppc = " -cpu 7400"
-QEMU_EXTRAOPTIONS_qemuppc64 = " -cpu POWER9"
diff --git a/meta/recipes-devtools/gcc/gcc-testsuite.inc b/meta/recipes-devtools/gcc/gcc-testsuite.inc
index 64f60c730f..eaac98f9ba 100644
--- a/meta/recipes-devtools/gcc/gcc-testsuite.inc
+++ b/meta/recipes-devtools/gcc/gcc-testsuite.inc
@@ -53,8 +53,10 @@ python check_prepare() {
         #   - valid for x86*, powerpc, arm, arm64
         if qemu_binary.lstrip("qemu-") in ["x86_64", "i386", "arm", "aarch64"]:
             args += ["-cpu", "max"]
-        elif qemu_binary.lstrip("qemu-") in ["ppc"]:
-            args += d.getVar("QEMU_EXTRAOPTIONS_%s" % d.getVar('PACKAGE_ARCH')).split()
+        else:
+            extra = d.getVar("QEMU_EXTRAOPTIONS_%s" % d.getVar('TUNE_PKGARCH'))
+            if extra:
+                args += extra.split()
         sysroot = d.getVar("RECIPE_SYSROOT")
         args += ["-L", sysroot]
         # lib paths are static here instead of using $libdir since this is used by a -cross recipe
-- 
2.43.0


