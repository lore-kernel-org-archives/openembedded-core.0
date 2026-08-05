Return-Path: <twoerner@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12A93C55174
	for <webhook@archiver.kernel.org>; Wed,  5 Aug 2026 06:57:53 +0000 (UTC)
Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com [209.85.219.51])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.34752.1785913061298159129
 for <openembedded-core@lists.openembedded.org>;
 Tue, 04 Aug 2026 23:57:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=E30yn/vN;
 spf=pass (domain: gmail.com, ip: 209.85.219.51, mailfrom: twoerner@gmail.com)
Received: by mail-qv1-f51.google.com with SMTP id 6a1803df08f44-9061a795d76so6791526d6.3
        for <openembedded-core@lists.openembedded.org>; Tue, 04 Aug 2026 23:57:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785913060; x=1786517860; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vVhWTVzl8tk/ykAwxbZGTJmUpXEdyAljRO4dRMpOeZM=;
        b=E30yn/vNXnuEZazBqID9YoVkaPfIm9i1R6XdMcrTFvNtc+aJ7ZKjwIxdpFVnHKqfjY
         4Ouz9Yx4tuEBLBAn3H0FeUVyYAPaBgRE+ICy0IJCX3fy+eqyNHuEcKzBI3WZtcl3d81T
         +BZAZI1eMc/TgBRU2oOSOZpRk70DG0FSDQVADEyyHHfoFFAgiIhNHrZN9azjSUf/Ci9r
         reBWFOszo9z970t50qC5IMZZBow+VzOFrTwQqbhXJq3Y6xnAbqsSnA+nNLJ4uwqfyX8+
         U6PyXuDBEkO2wFafEvDrQOtBD6G+Rxva0SZz4L6M4cR0uk1FsU9qHtn8tgKvua1rrZyW
         ONlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785913060; x=1786517860;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=vVhWTVzl8tk/ykAwxbZGTJmUpXEdyAljRO4dRMpOeZM=;
        b=JURd2Qeybf0cKfbXabvYa7azWy2R2Y7TGB8mGyxAvhDmIR7myLXspJ6mft3G4iv7kn
         baslyL1oaobK+SAB/Ejh/S8lXQg/ilMulG41zPbWGrEqRAfTlAbcMKTtWFBrMCgJIQZj
         QALLyzcYVVbapAtSdOmJKaV0gqPGUwyelTtKHO/Wapo5T3B3S3O7jX2FyAXqX2nhFanO
         /fX1E1ivW5gAAEkXVYtr3XYDnAOFzquzdUGeE6fd+DFUPTuf+FMYFfteAJVU9DElT9a0
         oeCjR8VHTfftTeAltnWKAARoEBXh1i8RYLC4kZiNH8zK111jnRirw/Iaz8Aj7PsieCIf
         jLTg==
X-Gm-Message-State: AOJu0YzWeUJAJnJIiGAQLHTeEXoqBfqY2en9L1PUrUHxPpFsYd+XjZ/w
	sK90nubn4y6BRMIGZrboGgJqWerbBTpNgYfhyj/hraga2ZUBFcJg5+BFi/321Q==
X-Gm-Gg: AR+sD11LmiMSYIwH7IpwSFLiHvPB+kjLofJR8oFNeYtSZ9a27t1CO8obuACW5L/WGRj
	QnvQ8ljsg7eCL3T9mggUqsOC3XP6/42nwut8PgwBnKPSgw4qNbmBol7sEZcrLPojy6hb4WSnPUm
	peDNPVerGZH5fr1hqnDyd4W52j9oQt9fxAaHb4GAKtwlclpDVwEKd8pnjutMY9DHf9ZbpwLINHk
	A7sHScu3yWJgd7fSkib+u4FuPSlqnJPoJPxlEQzK9pB4DsvHv1+QL75ypg/MiFbLM5pAiq+dxki
	w6PMlBeSx3/q/yKTGMho39938oVyeeiEoIobqXE9gHQzNwZwqRxlyKbM6/bsZnvdm2aRKyh0HEq
	YrjjAIWyoi2YTT53PM7KU062zJ6Njt+EyCMiKeOVvsrHcgiB+klVqQH3FzeqUsx2jjOuOZPF2pn
	2+KG6aQALUXHbqdrqnVZxDMw4jU+fqPkFYhwMYSXQurzUR4lcUyWZn4+ZO6AlzwB9mAhraUF3NA
	+GzZ0TBgCb/Vq+LIto8m8Fmn6H59ew=
X-Received: by 2002:a05:6214:f08:b0:8f0:a849:f392 with SMTP id 6a1803df08f44-90881203d0cmr53456966d6.14.1785913060168;
        Tue, 04 Aug 2026 23:57:40 -0700 (PDT)
Received: from localhost.localdomain (pppoe-209-91-167-254.vianet.ca. [209.91.167.254])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-9087ffbcc9esm19264546d6.12.2026.08.04.23.57.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Aug 2026 23:57:37 -0700 (PDT)
From: Trevor Woerner <twoerner@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: randy.macleod@windriver.com,
	Harish.Sadineni@windriver.com
Subject: [PATCH 2/2] toolchain-scripts, oeqa/sdk: build the kernel's host tools with a host pkg-config
Date: Wed,  5 Aug 2026 02:57:18 -0400
Message-ID: <20260805065718.3497815-3-twoerner@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260805065718.3497815-1-twoerner@gmail.com>
References: <20260805065718.3497815-1-twoerner@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 05 Aug 2026 06:57:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242828

The SDK environment sets PKG_CONFIG_SYSROOT_DIR, PKG_CONFIG_PATH and
PKG_CONFIG_LIBDIR so that pkg-config answers for the target. That is
right for everything built to run there and wrong for a program built to
run on the SDK host.

The kernel build compiles host tools of its own, and objtool asks
pkg-config where libelf is. It gets the target's include directory,
compiles a host tool against the target's C library headers, and stops
on warnings that -Wno-system-headers would otherwise have covered:

  usr/include/sys/cdefs.h:486: error: "__attribute_const__" redefined

Export a HOSTPKG_CONFIG that undoes those three variables, and pass the
same value on the make command line when the test builds an external
module. Both halves are needed: the kernel assigns HOSTPKG_CONFIG with
'=', so only a command line assignment takes effect today, and the
export is there for kernels that assign it with '?=', which is proposed
in

  https://lore.kernel.org/linux-kbuild/20260805055438.3482019-1-twoerner@gmail.com/

OE-Core already does the command line half for its own kernel builds, in
kernel.bbclass.

Fixes [YOCTO #16239].

AI-Generated: codex/claude-opus 5 (xhigh)
Signed-off-by: Trevor Woerner <twoerner@gmail.com>
---
 meta/classes-recipe/toolchain-scripts.bbclass | 3 +++
 meta/lib/oeqa/sdk/cases/kmod.py               | 7 +++++--
 2 files changed, 8 insertions(+), 2 deletions(-)

diff --git a/meta/classes-recipe/toolchain-scripts.bbclass b/meta/classes-recipe/toolchain-scripts.bbclass
index d94dcdee39b3..54d05c242c4b 100644
--- a/meta/classes-recipe/toolchain-scripts.bbclass
+++ b/meta/classes-recipe/toolchain-scripts.bbclass
@@ -63,6 +63,9 @@ toolchain_create_sdk_env_script () {
 	echo "export PATH=$sdkpathnative$bindir:$sdkpathnative$sbindir:$sdkpathnative$base_bindir:$sdkpathnative$base_sbindir:$sdkpathnative$bindir/../${HOST_SYS}/bin:$sdkpathnative$bindir/${TARGET_SYS}"$EXTRAPATH':"$PATH"' >> $script
 	echo 'export PKG_CONFIG_SYSROOT_DIR=$SDKTARGETSYSROOT' >> $script
 	echo 'export PKG_CONFIG_PATH=$SDKTARGETSYSROOT'"$libdir"'/pkgconfig:$SDKTARGETSYSROOT'"$prefix"'/share/pkgconfig' >> $script
+	# pkg-config here answers for the target, which is wrong for the host
+	# tools the kernel build compiles. Honoured by kernels using '?='.
+	echo 'export HOSTPKG_CONFIG="env -u PKG_CONFIG_SYSROOT_DIR -u PKG_CONFIG_PATH -u PKG_CONFIG_LIBDIR pkg-config"' >> $script
 	echo 'export CONFIG_SITE=${SDKPATH}/site-config-'"${multimach_target_sys}" >> $script
 	echo "export OECORE_NATIVE_SYSROOT=\"$sdkpathnative\"" >> $script
 	echo 'export OECORE_TARGET_SYSROOT="$SDKTARGETSYSROOT"' >> $script
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


