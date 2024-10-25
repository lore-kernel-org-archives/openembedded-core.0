Return-Path: <sreejith.ravi087@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13436D149C2
	for <webhook@archiver.kernel.org>; Fri, 25 Oct 2024 16:16:39 +0000 (UTC)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.web11.15907.1729872994182028603
 for <openembedded-core@lists.openembedded.org>;
 Fri, 25 Oct 2024 09:16:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=YcdoKDB6;
 spf=pass (domain: gmail.com, ip: 209.85.221.42, mailfrom: sreejith.ravi087@gmail.com)
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-37d5100d0b1so205955f8f.3
        for <openembedded-core@lists.openembedded.org>; Fri, 25 Oct 2024 09:16:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729872992; x=1730477792; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=KGwPh/DDc1C7a63NT3cQa25tlEVLArY8xSRu68PYBcU=;
        b=YcdoKDB6a6NDE+OIsSkbqt8ScO/k2h1ZCzKseYumIzq62W3PnYqL7EzKZ57DHx4n+X
         GbZ4KyJdzCaNJKoP3LYXXtV3QjylvxNE3rsqC/hVGy2sxg/rKblVkOmcS2skMZpjNoR6
         5EQFLKJZdX/cWPbQ3saTmlM9m+6urx6fpANw+XsGlWDQZtdYA5og/E1BLqiP+L9HhHbK
         tQbsmitGr0vznA0PYFiycBUf0InEuxrR3+mr/uDamM8wHu/m6g8EY+2PW2MVTLzyXjqY
         EHT6PmY1Wi/ofbURdhLb+Iq8BBX5zduRuRIcBZpX7m6qNtIbGMuj34WdMZEXEJ3Nq5wS
         srZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729872992; x=1730477792;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KGwPh/DDc1C7a63NT3cQa25tlEVLArY8xSRu68PYBcU=;
        b=qZ16r7ELl73MMSzBn3sMP3UIeA3X+lzNUnmCul9KUPpf1C6WnzJK3m48mNsTJleWaz
         MMyG9YHMp4FqCWpY4AMaUv85HVdxGgoWmEy3NrfHAiGNeOZq2XcoCzm08XjyMAIAgOb/
         dRtVHL9t0SFSrn8DRmuZ5eLwpPLRUY8FrtgwITbavKKqLHkg+nKdz73hRF8tpueZz6bP
         eXWOIZlQlteadeMrscEECSjQxLWDQokGQzSao7jKLGCvkFHTsZURuLncct5brScaV8nv
         TYQ9hkIzsSs27pntX38sCNLZjasUTK/DkXMRudpTnXCeAfB9XsOI4Sahp/3B7oiCEumg
         e8ZQ==
X-Gm-Message-State: AOJu0YyD57oY1K2axHg8qB87ON0ZZA4fZYEQk/TOdus8Qe5eg0eVcYfA
	EFv6pTDPibJ7RPlJG3VJ5E3Jwh4/Vm+8fkDR/6cCgsvM9RbMoLTJwZdluw==
X-Google-Smtp-Source: AGHT+IHmNfWzwoSP6uVvgNca9NkGuC5qJoTGY0x94pe0kiPfKq4ow5LuDqAY39ratUdKqXV9RgiTKA==
X-Received: by 2002:a05:6000:186c:b0:374:bde8:3b46 with SMTP id ffacd0b85a97d-3805b348d90mr918445f8f.2.1729872991744;
        Fri, 25 Oct 2024 09:16:31 -0700 (PDT)
Received: from hbox.local (178.72-31-62.static.virginmediabusiness.co.uk. [62.31.72.178])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38058b3bde6sm1905115f8f.40.2024.10.25.09.16.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Oct 2024 09:16:30 -0700 (PDT)
From: Sreejith Ravi <sreejith.ravi087@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Sreejith Ravi <sreejith.ravi087@gmail.com>
Subject: [PATCH] package_manager : Add configuration option to select filterbydependencies
Date: Fri, 25 Oct 2024 17:16:27 +0100
Message-ID: <20241025161627.3352-1-sreejith.ravi087@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 25 Oct 2024 16:16:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206354

Currently, filterbydependencies is always set with True, which results in
the creation of `oe-rootfs-repo`. If filterbydependencies is not set,
it creates `oe-rootfs-repo` as a symlink to the "DEPLOY_DIR_<IPK/RPM/DEB>"
directory. With this patch, users can configure this behavior according
to their use cases using the variable `DISABLE_FILTER_BY_DEPENDENCY`.

Signed-off-by: Sreejith Ravi <sreejith.ravi087@gmail.com>
---
 meta/conf/bitbake.conf                    | 3 +++
 meta/lib/oe/package_manager/__init__.py   | 1 +
 meta/lib/oe/package_manager/deb/rootfs.py | 4 +++-
 meta/lib/oe/package_manager/ipk/rootfs.py | 7 +++++--
 meta/lib/oe/package_manager/rpm/rootfs.py | 4 +++-
 5 files changed, 15 insertions(+), 4 deletions(-)

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index eda505c861..1b3ef40782 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -992,3 +992,6 @@ oe.path.format_display[vardepsexclude] = "TOPDIR"
 oe.utils.get_bb_number_threads[vardepsexclude] = "BB_NUMBER_THREADS"
 oe.packagedata.emit_pkgdata[vardepsexclude] = "BB_NUMBER_THREADS"
 oe.packagedata.read_subpkgdata_extended[vardepsexclude] = "BB_NUMBER_THREADS"
+
+# To configure the filterbydependencies feature for rootfs generation to set the feeds.
+DISABLE_FILTER_BY_DEPENDENCY ?= "0"
diff --git a/meta/lib/oe/package_manager/__init__.py b/meta/lib/oe/package_manager/__init__.py
index 2100a97c12..806bebfae4 100644
--- a/meta/lib/oe/package_manager/__init__.py
+++ b/meta/lib/oe/package_manager/__init__.py
@@ -467,6 +467,7 @@ def create_packages_dir(d, subrepo_dir, deploydir, taskname, filterbydependencie
 
     # Detect bitbake -b usage
     nodeps = d.getVar("BB_LIMITEDDEPS") or False
+    bb.note("filterbydependencies %s" %filterbydependencies)
     if nodeps or not filterbydependencies:
         for arch in d.getVar("ALL_MULTILIB_PACKAGE_ARCHS").split() + d.getVar("ALL_MULTILIB_PACKAGE_ARCHS").replace("-", "_").split():
             target = os.path.join(deploydir + "/" + arch)
diff --git a/meta/lib/oe/package_manager/deb/rootfs.py b/meta/lib/oe/package_manager/deb/rootfs.py
index 1e25b64ed9..04fd55c485 100644
--- a/meta/lib/oe/package_manager/deb/rootfs.py
+++ b/meta/lib/oe/package_manager/deb/rootfs.py
@@ -134,9 +134,11 @@ class PkgRootfs(DpkgOpkgRootfs):
         bb.utils.remove(self.image_rootfs, True)
         bb.utils.remove(self.d.getVar('MULTILIB_TEMP_ROOTFS'), True)
         self.manifest = PkgManifest(d, manifest_dir)
+        filter_deps = False if d.getVar("DISABLE_FILTER_BY_DEPENDENCY") == "1" else True
         self.pm = DpkgPM(d, d.getVar('IMAGE_ROOTFS'),
                          d.getVar('PACKAGE_ARCHS'),
-                         d.getVar('DPKG_ARCH'))
+                         d.getVar('DPKG_ARCH'),
+                         filterbydependencies=filter_deps)
 
 
     def _create(self):
diff --git a/meta/lib/oe/package_manager/ipk/rootfs.py b/meta/lib/oe/package_manager/ipk/rootfs.py
index ba93eb62ea..52d0785ef9 100644
--- a/meta/lib/oe/package_manager/ipk/rootfs.py
+++ b/meta/lib/oe/package_manager/ipk/rootfs.py
@@ -131,6 +131,7 @@ class PkgRootfs(DpkgOpkgRootfs):
         self.manifest = PkgManifest(d, manifest_dir)
         self.opkg_conf = self.d.getVar("IPKGCONF_TARGET")
         self.pkg_archs = self.d.getVar("ALL_MULTILIB_PACKAGE_ARCHS")
+        filter_deps = False if d.getVar("DISABLE_FILTER_BY_DEPENDENCY") == "1" else True
 
         self.inc_opkg_image_gen = self.d.getVar('INC_IPK_IMAGE_GEN') or ""
         if self._remove_old_rootfs():
@@ -138,12 +139,14 @@ class PkgRootfs(DpkgOpkgRootfs):
             self.pm = OpkgPM(d,
                              self.image_rootfs,
                              self.opkg_conf,
-                             self.pkg_archs)
+                             self.pkg_archs,
+                             filterbydependencies=filter_deps)
         else:
             self.pm = OpkgPM(d,
                              self.image_rootfs,
                              self.opkg_conf,
-                             self.pkg_archs)
+                             self.pkg_archs,
+                             filterbydependencies=filter_deps)
             self.pm.recover_packaging_data()
 
         bb.utils.remove(self.d.getVar('MULTILIB_TEMP_ROOTFS'), True)
diff --git a/meta/lib/oe/package_manager/rpm/rootfs.py b/meta/lib/oe/package_manager/rpm/rootfs.py
index 3ba5396320..361a77ca7f 100644
--- a/meta/lib/oe/package_manager/rpm/rootfs.py
+++ b/meta/lib/oe/package_manager/rpm/rootfs.py
@@ -16,12 +16,14 @@ class PkgRootfs(Rootfs):
         self.log_check_regex = r'(unpacking of archive failed|Cannot find package'\
                                r'|exit 1|ERROR: |Error: |Error |ERROR '\
                                r'|Failed |Failed: |Failed$|Failed\(\d+\):)'
+        filter_deps = False if d.getVar("DISABLE_FILTER_BY_DEPENDENCY") == "1" else True
 
         self.manifest = PkgManifest(d, manifest_dir)
 
         self.pm = RpmPM(d,
                         d.getVar('IMAGE_ROOTFS'),
-                        self.d.getVar('TARGET_VENDOR')
+                        self.d.getVar('TARGET_VENDOR'),
+                        filterbydependencies=filter_deps
                         )
 
         self.inc_rpm_image_gen = self.d.getVar('INC_RPM_IMAGE_GEN')
-- 
2.43.0


