Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0BC35CD5BD1
	for <webhook@archiver.kernel.org>; Mon,  1 Jun 2026 07:55:51 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.23081.1780298540876369011
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Jun 2026 00:22:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kernel.org header.s=k20201202 header.b=a2+mDogh;
 spf=pass (domain: kernel.org, ip: 172.105.4.254, mailfrom: devnull+rouven.czerwinski.linaro.org@kernel.org)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 2449260098;
	Mon,  1 Jun 2026 07:13:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id CD44CC2BCB8;
	Mon,  1 Jun 2026 07:13:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1780297983;
	bh=RWkWDhJfF0Gvs0KKKtHRkLtensCBsWCYzfGoC5uH3Hw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=a2+mDoghaRcNAUQxsEJhE94goKPRExiF76nnqtyg2wM7/DIbeF2FnFMxDdxt3g41P
	 G1+ub4a1MS/6NFTfAheolrzSSrxNbp4WJjbKAgZRYQevT3uvHiriQ1b+Ns1cn3H+3R
	 6NJ6yGPM+Wh/azGp0bC09IPVGhN841cSezmh1I1Rne58GTOIe3BRSBzfj7KvPSP++I
	 zIiA6uVvv4Cu/NK5M21tlAoyGhptOiZhRBnmvZ97zl2w3AHBUBDxAaw2wEPB7d5llx
	 IgCOSMK8JbroxPruieZ7l/Sh8W6JApEsLdJ9civgOAbOIHcmSrxcprsTDieA7BgPWK
	 vDj2qLw5db7TA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8EA7CD6E60;
	Mon,  1 Jun 2026 07:13:03 +0000 (UTC)
From: Rouven Czerwinski via B4 Relay <devnull+rouven.czerwinski.linaro.org@kernel.org>
Date: Mon, 01 Jun 2026 09:13:04 +0200
Subject: [PATCH 3/6] package_manager: sdk: remove sdk_host_sysroot
MIME-Version: 1.0
Message-Id: <20260601-topic-packagemanager-cleanup-v1-3-926e4d5b724d@linaro.org>
References: <20260601-topic-packagemanager-cleanup-v1-0-926e4d5b724d@linaro.org>
In-Reply-To: <20260601-topic-packagemanager-cleanup-v1-0-926e4d5b724d@linaro.org>
To: openembedded-core@lists.openembedded.org
Cc: Rouven Czerwinski <rouven.czerwinski@linaro.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780297982; l=3969;
 i=rouven.czerwinski@linaro.org; s=20260126; h=from:subject:message-id;
 bh=QPDqigLoaS0SJH47aUvZjYlcPwkzr9v6RDgBPRMTUoo=;
 b=C9Ppwg5koe1ON2fk8hRRpEk5yfhyRyUFKArKvVDSz5uXi7v5Itjtpo96+W6uqpcbbTVcTv7dj
 Lifyjg34pCmC52v98A//Ezm4L139/6UH1YaBEsOHi2ve+gb0Zj7+FRS
X-Developer-Key: i=rouven.czerwinski@linaro.org; a=ed25519;
 pk=/5pmUK/XIAIIo8JA0axgfy1k8NRhRTQkxVwZYa1ga7U=
X-Endpoint-Received: by B4 Relay for rouven.czerwinski@linaro.org/20260126
 with auth_id=616
X-Original-From: Rouven Czerwinski <rouven.czerwinski@linaro.org>
Reply-To: rouven.czerwinski@linaro.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 01 Jun 2026 07:55:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237822

From: Rouven Czerwinski <rouven.czerwinski@linaro.org>

The instance variable sdk_host_sysroot was always set to sdk_output,
remove it and use sdk_output in its place.

No functional changes.

Signed-off-by: Rouven Czerwinski <rouven.czerwinski@linaro.org>
---
 meta/lib/oe/package_manager/deb/sdk.py | 2 +-
 meta/lib/oe/package_manager/ipk/sdk.py | 4 ++--
 meta/lib/oe/package_manager/rpm/sdk.py | 2 +-
 meta/lib/oe/sdk.py                     | 3 +--
 4 files changed, 5 insertions(+), 6 deletions(-)

diff --git a/meta/lib/oe/package_manager/deb/sdk.py b/meta/lib/oe/package_manager/deb/sdk.py
index 1169744674..690b10d2ba 100644
--- a/meta/lib/oe/package_manager/deb/sdk.py
+++ b/meta/lib/oe/package_manager/deb/sdk.py
@@ -35,7 +35,7 @@ class PkgSdk(Sdk):
                                 self.target_conf_dir,
                                 deb_repo_workdir=deb_repo_workdir)
 
-        self.host_pm = DpkgPM(d, self.sdk_host_sysroot,
+        self.host_pm = DpkgPM(d, self.sdk_output,
                               self.d.getVar("SDK_PACKAGE_ARCHS"),
                               self.d.getVar("DEB_SDK_ARCH"),
                               self.host_conf_dir,
diff --git a/meta/lib/oe/package_manager/ipk/sdk.py b/meta/lib/oe/package_manager/ipk/sdk.py
index c39a32fa24..8dc01661ef 100644
--- a/meta/lib/oe/package_manager/ipk/sdk.py
+++ b/meta/lib/oe/package_manager/ipk/sdk.py
@@ -38,7 +38,7 @@ class PkgSdk(Sdk):
                                 self.d.getVar("ALL_MULTILIB_PACKAGE_ARCHS"),
                                 ipk_repo_workdir=ipk_repo_workdir)
 
-        self.host_pm = OpkgPM(d, self.sdk_host_sysroot, self.host_conf,
+        self.host_pm = OpkgPM(d, self.sdk_output, self.host_conf,
                               self.d.getVar("SDK_PACKAGE_ARCHS"),
                                 ipk_repo_workdir=ipk_repo_workdir)
 
@@ -91,7 +91,7 @@ class PkgSdk(Sdk):
             self.host_pm.remove_lists()
 
         target_sysconfdir = os.path.join(self.sdk_target_sysroot, self.sysconfdir)
-        host_sysconfdir = os.path.join(self.sdk_host_sysroot, self.sysconfdir)
+        host_sysconfdir = os.path.join(self.sdk_output, self.sysconfdir)
 
         self.mkdirhier(target_sysconfdir)
         shutil.copy(self.target_conf, target_sysconfdir)
diff --git a/meta/lib/oe/package_manager/rpm/sdk.py b/meta/lib/oe/package_manager/rpm/sdk.py
index ea79fe050b..7f586955fc 100644
--- a/meta/lib/oe/package_manager/rpm/sdk.py
+++ b/meta/lib/oe/package_manager/rpm/sdk.py
@@ -32,7 +32,7 @@ class PkgSdk(Sdk):
                                )
 
         self.host_pm = RpmPM(d,
-                             self.sdk_host_sysroot,
+                             self.sdk_output,
                              self.d.getVar('SDK_VENDOR'),
                              'host',
                              "SDK_PACKAGE_ARCHS",
diff --git a/meta/lib/oe/sdk.py b/meta/lib/oe/sdk.py
index c2c5431c0d..ff535b5489 100644
--- a/meta/lib/oe/sdk.py
+++ b/meta/lib/oe/sdk.py
@@ -20,7 +20,6 @@ class Sdk(object, metaclass=ABCMeta):
         self.sysconfdir = self.d.getVar('sysconfdir').strip('/')
 
         self.sdk_target_sysroot = os.path.join(self.sdk_output, self.target_path)
-        self.sdk_host_sysroot = self.sdk_output
 
         if manifest_dir is None:
             self.manifest_dir = self.d.getVar("SDK_DIR")
@@ -97,7 +96,7 @@ class Sdk(object, metaclass=ABCMeta):
                            lang for lang in linguas.split()])
             # Generate a locale archive of them
             target_arch = self.d.getVar('SDK_ARCH')
-            rootfs = oe.path.join(self.sdk_host_sysroot, self.sdk_native_path)
+            rootfs = oe.path.join(self.sdk_output, self.sdk_native_path)
             localedir = oe.path.join(rootfs, self.d.getVar("libdir_nativesdk"), "locale")
             generate_locale_archive(self.d, rootfs, target_arch, localedir)
             # And now delete the binary locales

-- 
2.52.0



