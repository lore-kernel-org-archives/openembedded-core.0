Return-Path: <twoerner@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E239C61DE1
	for <webhook@archiver.kernel.org>; Sun, 30 Aug 2026 18:36:27 +0000 (UTC)
Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com [209.85.219.42])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.13831.1788114983948718254
 for <openembedded-core@lists.openembedded.org>;
 Sun, 30 Aug 2026 11:36:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=OqkqFyH5;
 spf=pass (domain: gmail.com, ip: 209.85.219.42, mailfrom: twoerner@gmail.com)
Received: by mail-qv1-f42.google.com with SMTP id 6a1803df08f44-90e8372bba7so6694346d6.0
        for <openembedded-core@lists.openembedded.org>; Sun, 30 Aug 2026 11:36:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788114983; x=1788719783; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=fr/llnMj/qpH6crRKrp0FvfIC30Op5jU/FYiZnV19yo=;
        b=OqkqFyH51l0J21gT1HXvNlVNY6cIBumhBVuocsl11Iz2q0H/HDdDd5/vkOSXHQ9g+W
         Gak4X7WHvHLiWC/AcoLhPLJTg2f+5p2alAb099YI3Smp7YauVweMxrWZno47eXu+Ux3N
         Z144OlvESumJmjgQ+XDYmOEVxTwDR+i7eH8kwlBflwyQ/Rofr/S1L49iHy0bKYWaZ6tf
         QCgi+AYaRID74yZVrE0xcdYMtXmDLghUyd/Mte9sK87W1SgqCOEGgeNFTsCSubFFuNrZ
         TuR2wGfp6xajbMrXMJWB4rhwv2zvLZrahQAviCUxRy+Va/+hpR+u0QPDkHsi37w+qKAb
         87Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788114983; x=1788719783;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=fr/llnMj/qpH6crRKrp0FvfIC30Op5jU/FYiZnV19yo=;
        b=GzqTOFfIOCwkdHHhBoHw8GaKBtDpZLd7oaF1yMXsgAIVGDU+ITPVTi8O2lfm+K19wo
         T9i0OMzSiSVCNV9CByB1+mRUTJTDzYO/MuJMifrpBD2EVRtYrYxTMH3XkqTwmwtbGQMR
         7sMx2wqJLJCdS4LYmxfgRA39pAO9XPXBECUR6cH4ZohgJ7wC37n2B4QRoCevYsT10fZ5
         ME31JBrjWCi9EjLgbx+IAaAnWGqpHcztO9cUDIEGlXCKY5CtktiYm7dco9w/kOz99RmT
         9d/nvIaLPsXcRAhrVVCP3F5Zj9PuLMzkoWQF37MH40hkgyR2sfu3PDHUZPybTUi+vkdv
         RtFA==
X-Gm-Message-State: AFuF++naiKgHvn2VkLJtrzqRYiIdr7KfjThaZE3pQrhyBnXLA51Z3/g9
	oAhL24HCb15xn9HtkBjpGx/+GHbj+FJ8qj9mFNWw6g0an9FXFOXSSrZ1KNMAAck7
X-Gm-Gg: AYBFou2MdS+3v4tSE86EvYa079+yYSGmuvxTANZuliQsLb864XaauyZzGk56nuvcUVk
	B+WoSGe9zAJ6kKi6+P2eYAjQGSfADorC/Muf9Q27A7m3tYrdyZM6cfPIjnlr+mLDQa5G+dZ5j0Z
	YcTXYXijvaMC1tWznED12+k2BaUQqBWph8Var0aYDZbCNsEyRgMrgH1x5thUAkJqbu1pqS+v9fR
	mnGNnBF5Do8FFkTi9AjxuZ/yIqvO1G77Ilb7DkHwQs256cizwtbkV+O2hgW71LmvNJu9Do6IcJ5
	U2LuTeNvMqGEZy6Gq91LkCuflqZrL+CaadE5j3EuflkrOeTfy7Xzp9cxJF9Y134P0/W5x2DIm12
	AUBxv0+6giDSfrDiMWHNPpRchKeBtGtrlALM8zkHdjO6Z8CIodbzJZinZcCIjcuWxYk41TK1ilM
	f7nKPC24M+6z2L6m1xBDoRxJSdD0B0A3VWK2IeNW8cm33/isevtGAjkTm2QhrfC9zL9zhOCasd9
	4TKK/hgoava0+S/IvmNG2sAjC/Bkg==
X-Received: by 2002:a05:6214:258d:b0:8f2:4100:8613 with SMTP id 6a1803df08f44-90ce0b52752mr258661886d6.0.1788114982543;
        Sun, 30 Aug 2026 11:36:22 -0700 (PDT)
Received: from localhost.localdomain (pppoe-209-91-167-254.vianet.ca. [209.91.167.254])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-90ce444dae0sm67267116d6.4.2026.08.30.11.36.21
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Aug 2026 11:36:21 -0700 (PDT)
From: Trevor Woerner <twoerner@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/3] oeqa/sdk: run the SDK's own copy of a host tool
Date: Sun, 30 Aug 2026 14:36:14 -0400
Message-ID: <20260830183616.4026354-1-twoerner@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 30 Aug 2026 18:36:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244690

ensure_host_package() decides whether a test can run by looking for a
package name in the SDK's host manifest, which establishes neither that
the package is present nor that the command the test runs is the SDK's
own. On an extensible SDK the manifest lists what the shipped sstate
could provide, so a case can pass the check and then run a command that
is not there, or one belonging to the build host.

Ask the SDK for the command instead. An eSDK ships sstate for more than
it installs, so when the command is missing devtool installs the recipe
and the lookup runs again. A command that resolves outside the SDK now
fails rather than reporting a result about the build host.

AI-Generated: codex/claude-opus 5 (xhigh)
Signed-off-by: Trevor Woerner <twoerner@gmail.com>
---
 meta/lib/oeqa/sdk/case.py | 96 ++++++++++++++++++++++++++++-----------
 1 file changed, 69 insertions(+), 27 deletions(-)

diff --git a/meta/lib/oeqa/sdk/case.py b/meta/lib/oeqa/sdk/case.py
index 03cfde88ff42..5f269161f4e1 100644
--- a/meta/lib/oeqa/sdk/case.py
+++ b/meta/lib/oeqa/sdk/case.py
@@ -18,38 +18,80 @@ class OESDKTestCase(OETestCase):
                 (self.tc.sdk_env, cmd), shell=True, executable="/bin/bash",
                 stderr=subprocess.STDOUT, universal_newlines=True)
 
-    def ensure_host_package(self, *packages, recipe=None):
+    def find_sdk_binary(self, binaries):
         """
-        Check that the host variation of one of the packages listed is available
-        in the SDK (nativesdk-foo for SDK, foo-native for eSDK). The package is
-        a list for the case where debian-renaming may have occured, and the
-        manifest could contain 'foo' or 'libfoo'.
+        (name, outside) for the first of binaries that resolves.
 
-        If testing an eSDK and the package is not found, then try to install the
-        specified recipe to install it from sstate.
+        name is the command to run when it came from the SDK, and outside
+        lists what resolved beyond it otherwise. Callers run the name
+        returned: an eSDK stages native recipes, which need not name a
+        command the way their nativesdk counterparts do. perl-native keeps
+        its interpreter at bindir/perl-native/perl, reached as nativeperl.
+        """
+        if isinstance(binaries, str):
+            binaries = (binaries,)
+        sdk_root = os.path.dirname(self.tc.sdk_env)
+
+        outside = []
+        for binary in binaries:
+            try:
+                path = self._run("command -v %s" % binary).strip()
+            except subprocess.CalledProcessError:
+                continue
+            if path.startswith(sdk_root + os.sep):
+                return binary, []
+            outside.append("%s is %s" % (binary, path))
+        return None, outside
+
+    def ensure_sdk_binary(self, binaries, packages=()):
         """
+        Return the first of binaries that resolves inside the SDK.
 
-        # In a SDK the manifest is correct. In an eSDK the manifest may be
-        # correct (type=full) or not include packages that exist in sstate but
-        # not installed yet (minimal) so we should try to install the recipe.
-        for package in packages:
-            if isinstance(self.tc, OESDKExtTestContext):
-                package = package + "-native"
-            else:
-                package = "nativesdk-" + package
+        Fail when one resolves outside it, because a result from the build
+        host describes the host and not the SDK. Skip when none resolves.
+        """
+        if isinstance(binaries, str):
+            binaries = (binaries,)
+        if isinstance(packages, str):
+            packages = (packages,)
+        name, outside = self.find_sdk_binary(binaries)
+        if name:
+            return name
+        need = ", ".join(packages) or ", ".join(binaries)
+        if outside:
+            self.fail("Test %s needs one of %s from the SDK, but found %s"
+                      % (self.id(), need, "; ".join(outside)))
+        raise unittest.SkipTest("Test %s needs one of %s: the SDK has no %s"
+                                % (self.id(), need, " or ".join(binaries)))
+
+    def ensure_host_package(self, *packages, recipe=None, binary=None):
+        """
+        Return the command the test should run, having confirmed it comes
+        from the SDK rather than the build host.
 
-            if self.tc.hasHostPackage(package):
-                break
-        else:
-            if isinstance(self.tc, OESDKExtTestContext):
-                recipe = (recipe or packages[0]) + "-native"
-                print("Trying to install %s..." % recipe)
-                try:
-                    self._run('devtool sdk-install %s' % recipe)
-                except subprocess.CalledProcessError:
-                    raise unittest.SkipTest("Test %s needs one of %s" % (self.id(), ", ".join(packages)))
-            else:
-                raise unittest.SkipTest("Test %s needs one of %s" % (self.id(), ", ".join(packages)))
+        An eSDK ships sstate for more than it installs, so a tool can be
+        available without being present. When the command is missing, ask
+        devtool to install the recipe and look again.
+
+        binary names the commands the packages provide, and is needed only
+        where a command is not named after its package: pkgconf provides
+        pkg-config, and an eSDK reaches perl as nativeperl.
+        """
+        binaries = binary or packages
+
+        name, _ = self.find_sdk_binary(binaries)
+        if name:
+            return name
+
+        if isinstance(self.tc, OESDKExtTestContext):
+            install = (recipe or packages[0]) + "-native"
+            print("Trying to install %s..." % install)
+            try:
+                self._run('devtool sdk-install %s' % install)
+            except subprocess.CalledProcessError:
+                pass
+
+        return self.ensure_sdk_binary(binaries, packages)
 
     def ensure_target_package(self, *packages, multilib=False, recipe=None):
         """

