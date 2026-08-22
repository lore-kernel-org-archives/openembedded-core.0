Return-Path: <twoerner@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CAAB5C5DF9B
	for <webhook@archiver.kernel.org>; Sat, 22 Aug 2026 14:38:24 +0000 (UTC)
Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7665.1787409498548329574
 for <openembedded-core@lists.openembedded.org>;
 Sat, 22 Aug 2026 07:38:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=Jnbtw/tm;
 spf=pass (domain: gmail.com, ip: 209.85.160.182, mailfrom: twoerner@gmail.com)
Received: by mail-qt1-f182.google.com with SMTP id d75a77b69052e-52d7a3defe8so13841961cf.0
        for <openembedded-core@lists.openembedded.org>; Sat, 22 Aug 2026 07:38:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787409497; x=1788014297; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=asdd0pPS8UJyCMvLGtbIoI2R59+v1KuHwG0INji3Duo=;
        b=Jnbtw/tmt0u2vQXgwuin9DQRMzFRu/vraVGkMji/gg0PPiu0jz1ih05fCC/NB8Y+x6
         MnLdvfOrs9pbeM2ForCkQO9I9Jd54ghCx540T8vOllOzksboTU26VZUdP4Y5rGsvIhVQ
         KWAv4bh/bR8unEsR8wR7H0aAhC/i34ElhwMAWTQHTfgIvqYUsOo+ZUXmG7zWwlusOIx+
         n5wuEj1cuUgJGmr1ygBxTi321Mqa+CwoIuFLhcag7cDCip12BqikCKRhjhBEDhZFqxdO
         frbEihHzHIl1ZwAtxCfaruwjOO1GXCJ7xK0TqhL7fX6hTIVE9bkF8XbGjPLk18+eCN9g
         e1kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787409497; x=1788014297;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=asdd0pPS8UJyCMvLGtbIoI2R59+v1KuHwG0INji3Duo=;
        b=KQgtaeafL7PY5sYt/4KcUQl1F23DDBPGRzWMHXCNJGqQh0EJEmAEg6jfh3F0LEplBn
         uHL0qTxvbia5p92rZLAsPHDhkF9fKT+tChOGHaa2bdv79kr5F4hpRpXRoEy7dMnfPmjA
         XapRcgLcCtePIQU2WKkJig8BecvlBv3CcgURgncEFyBWbXEwEw9evagj1FcT6UI5U/GQ
         gAqZPBBLC7HT34jOknI+fwN6TwKF+LNHUm5VKlvYGmBqGWWSfCcqb2SfLcA2mWU9+c1D
         5N0NvMLM82/H58VRolPQiXAn/vZNq8F4oSxMXHu6MJHsc+cAVv+TUwIZGiMEobj/Sfa6
         LcqA==
X-Gm-Message-State: AFuF++me+nMYQlmT5r3cksYnch533ZqZT5FiKkrHEvSJpYfyI0N3zHCa
	Z4/euK4biUPv8E0EbHQKD3pdcWVre0FHbrBYgcfsUfaVmw9OM6/3A7ILOZ3EKYmj
X-Gm-Gg: AR+sD12OeNMYKtlAuNpqvU9wD0dB15kvkRnl5GLusrWx13emDAnfFeVvfv7k3ku01s2
	GpSYi769j842mFy3TDjs9nI0Y9Mil4KQ6tF//5c4TpNq24n7vHuk3yMUt+/rGA9ou3kfyd6Hlwt
	Ao9H4eY2MmwbDx9Z+qxiKltR/eT4rXIxrDxIeANgbHOCoRlzC7UtUQUSgV2C5WPA0IHGexzrpGi
	QQPTH/j3hmHTlszeEfiMSYiLj4d7fqTZHsgFO9ShVO1RdkuCMqcMnfk+jy4Kl8l8HUXe6mSfboW
	MrNIiO8/YYXhavcOm9Z3jrdMsctsGJMcyz3SC6fdn0z5xjQhw1ZtGH8/DYqXNJVyv2DyscSoNWw
	NKXsdsuBnF+HvpdQnO2rmnLY1h1AMjqRo6k5Et9iUSSmh3rW4lVkYWF43iWcEURKBaP9PqAG1LB
	OXwbGd5RdAcKwcJs6Y2tSVWPDqFDuhYYYr+tnRlkkcOhffUulcw/XeZxDyO9aJz6xDTG2E+BKCN
	tlPVOQ4v6PW3K4u+7rP5ScGlhfKORg=
X-Received: by 2002:a05:622a:1b07:b0:51c:1bcd:5cc3 with SMTP id d75a77b69052e-52df5a011f3mr145652501cf.25.1787409497449;
        Sat, 22 Aug 2026 07:38:17 -0700 (PDT)
Received: from localhost.localdomain (pppoe-209-91-167-254.vianet.ca. [209.91.167.254])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-52e099c38c0sm14728811cf.13.2026.08.22.07.38.16
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 22 Aug 2026 07:38:16 -0700 (PDT)
From: Trevor Woerner <twoerner@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v3 2/2] oeqa/sdk: build the kernel's host tools with a host pkg-config
Date: Sat, 22 Aug 2026 10:38:07 -0400
Message-ID: <20260822143807.2256028-3-twoerner@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260822143807.2256028-1-twoerner@gmail.com>
References: <20260822143807.2256028-1-twoerner@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 22 Aug 2026 14:38:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243985

The SDK environment sets PKG_CONFIG_SYSROOT_DIR, PKG_CONFIG_PATH and
PKG_CONFIG_LIBDIR so that pkg-config answers for the target. That is
right for everything built to run there and wrong for a program built to
run on the SDK host.

The kernel build compiles host tools of its own, and objtool queries
pkg-config for the libelf include path. The answer is the target's
include directory, so a host tool is compiled against the target's C
library headers, and the build stops on warnings that
-Wno-system-headers would otherwise have covered:

  usr/include/sys/cdefs.h:486: error: "__attribute_const__" redefined

Pass pkg-config-native on the make command line when the test builds an
external module. The SDK already ships that wrapper, it already answers
for the build machine, and kernel.bbclass already gives its own host
tools the same one, so the two agree rather than each undoing the
environment in its own way. It has to be a command line assignment: the
kernel assigns HOSTPKG_CONFIG with '=', so an exported value is ignored.

Fixes [YOCTO #16239].

AI-Generated: codex/claude-opus 5 (xhigh)
Signed-off-by: Trevor Woerner <twoerner@gmail.com>
---
changes in v3:
- use pkg-config-native, the wrapper kernel.bbclass already gives its
  own host tools, instead of spelling out an env -u invocation of the
  SDK's pkg-config

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
 meta/lib/oeqa/sdk/cases/kmod.py | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/meta/lib/oeqa/sdk/cases/kmod.py b/meta/lib/oeqa/sdk/cases/kmod.py
index 1be23e994fd2..a55071a3e79a 100644
--- a/meta/lib/oeqa/sdk/cases/kmod.py
+++ b/meta/lib/oeqa/sdk/cases/kmod.py
@@ -26,8 +26,12 @@ class KernelModuleTest(OESDKTestCase):
         parallel_make = "-j %d" % (pmv) if pmv else ""
 
         self.ensure_target_package("kernel-devsrc")
+        # the kernel assigns HOSTPKG_CONFIG with '=', so it has to come from
+        # the make command line, and kernel.bbclass already gives its own
+        # host tools this same wrapper
+        host_pkg_config = 'HOSTPKG_CONFIG="pkg-config-native"'
         # These targets need to be built before kernel modules can be built.
-        self._run("make %s -C $OECORE_TARGET_SYSROOT/usr/src/kernel prepare scripts" % (parallel_make))
+        self._run("make %s %s -C $OECORE_TARGET_SYSROOT/usr/src/kernel prepare scripts" % (parallel_make, host_pkg_config))
 
         with tempfile.TemporaryDirectory(prefix="cryptodev", dir=self.tc.sdk_dir) as testdir:
             git_url = "https://github.com/cryptodev-linux/cryptodev-linux"
@@ -39,5 +43,5 @@ class KernelModuleTest(OESDKTestCase):
             self.assertTrue(os.path.isdir(sourcedir))
             subprocess.check_output(["git", "-C", sourcedir, "checkout", git_sha], stderr=subprocess.STDOUT)
 
-            self._run("make -C %s V=1 KERNEL_DIR=$OECORE_TARGET_SYSROOT/usr/src/kernel" % sourcedir)
+            self._run("make -C %s V=1 %s KERNEL_DIR=$OECORE_TARGET_SYSROOT/usr/src/kernel" % (sourcedir, host_pkg_config))
             self.check_elf(os.path.join(sourcedir, "cryptodev.ko"))
-- 
2.50.0.173.g8b6f19ccfc3a


