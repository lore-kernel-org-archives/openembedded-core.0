Return-Path: <stondo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8F84C61CE2
	for <webhook@archiver.kernel.org>; Sat, 21 Feb 2026 05:10:33 +0000 (UTC)
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com [209.85.221.66])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.14928.1771650631840737942
 for <openembedded-core@lists.openembedded.org>;
 Fri, 20 Feb 2026 21:10:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=fdwH4U04;
 spf=pass (domain: gmail.com, ip: 209.85.221.66, mailfrom: stondo@gmail.com)
Received: by mail-wr1-f66.google.com with SMTP id ffacd0b85a97d-435f177a8f7so2632323f8f.1
        for <openembedded-core@lists.openembedded.org>; Fri, 20 Feb 2026 21:10:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771650630; x=1772255430; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Lz6h34f3zbYA0tqxxiJgZ/o1h7u5YTN3X2UXDRPvI6E=;
        b=fdwH4U04mF9z+J9ole75BC1Yt/CycfZIXWmiRYzyUGaScKPHHOk96DLiS8BfoFmWXW
         Ipbuqmgp33KquvRDfmbsYiIxJtm1ezST4TBjWypsKV6mJZnIEswnCCp2i8DTrcSmRkhU
         7BK9gw/rfS1z1wtBlmkp586u2/d9XKocuGgH6L+NkK/1gwOnHyY5wUyZj5qIc3Pqpla4
         dXt/+6f7wTqvQ5F55HZoXp6FceN1n8mH74DwNzg/LhXTQg6qLMFKnNoMMwDogDn+y91s
         K69b9bVzWBtcDFSgH+Zyh91o/QffJfMQWAy1avX4a0+IpfmvbX38ilY2Yqe71t8btVq2
         k/tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771650630; x=1772255430;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Lz6h34f3zbYA0tqxxiJgZ/o1h7u5YTN3X2UXDRPvI6E=;
        b=F5Z36PTvZLO94MyWm/dHiHLXjnMjFKguzLbzRBQnUmRzUfuA4NUVunaBsz+vZtmX6P
         grij+IBka0LaN1WZwwrLe4phiSB1PDDBctfacbqyFqKHmArPn8cM6BGS7XhqHOPUQJS9
         FxQtunM/9nii0loli8VlxUeGhyTjwdFf1ZXLq23ufcP7SKWAcVeSItaBdxl5BcDEtKOR
         JvZmSlzIjqz91MGVwsTwfPOk3E6WbD8tOYHAqFc5zFe17yGrcpFQFV5BRTqcpk4fBsfk
         n2VcWZ3XbLiSuarf/lk7xJT93zQoT3wrjzIhxCMB+ooSqJUAtTvpWcZjTAodwO8UpsAz
         bvSA==
X-Gm-Message-State: AOJu0YzQeEoDXVojEUNrhN5TbQICrnEwzLMWzgR6kbmHvo5sVCXt6a2A
	m1kwwklE+JKhj0xjdP9kcqxDeVFVToLleGRx7VQ1rZrc2vLSJQqMEcSiQDGI5KgC
X-Gm-Gg: AZuq6aKC4ZcgUWcAr0k2X5GoMnKKU4dW4OiFpl6OJ55SLLHedHxuf+AlmbTgUjaQQSy
	GXgNlNMMf/Q46mX6SNlSaSo0SEK8e9W8NQUlKScVqHMu2aDlBmcNB5ke2uiVDvaiSq9OaY2ZenD
	8iY2E5dXCWE1Dxike8lEBb8W34vHMaH3kz7D20q56nWvWyvJy/kysoT/qJNi3jSnRGCxN+83PjC
	Cw7e1VRZDvHoQncvTZiXYBTeriwlAlySqLy3sYxJlvVkJqts3eizQDjY7HTSUkKP+1K3oUF+b4D
	vzdoZlGHHlmas7Zs38bS+zHXbymq061EK2LRTaolTSnRoKZlDuivJVA34qNFUAJ3Hwu7cxkP/LI
	CxD+WuZYrq/PSh+HAIHfalS2JrvfmuDiBIUa7m0IVHMeEJHIfb8//uljeUFqz0oQRWAOIjKgKb9
	gDS4JmrYnl6+312rpZ/xezDvhMAuRW6dqprKY=
X-Received: by 2002:a05:6000:4009:b0:439:4d46:606 with SMTP id ffacd0b85a97d-4396f178264mr3961667f8f.31.1771650629850;
        Fri, 20 Feb 2026 21:10:29 -0800 (PST)
Received: from fedora ([81.6.40.67])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43970bfa1bdsm2455901f8f.3.2026.02.20.21.10.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Feb 2026 21:10:28 -0800 (PST)
From: Stefano Tondo <stondo@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: stefano.tondo.ext@siemens.com,
	adrian.freihofer@siemens.com,
	Peter.Marko@siemens.com,
	jpewhacker@gmail.com,
	Ross.Burton@arm.com
Subject: [PATCH v2 11/18] spdx30: Add rootfs version and dependency scope classification
Date: Sat, 21 Feb 2026 06:09:59 +0100
Message-ID: <20260221051006.335141-12-stondo@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260221051006.335141-1-stondo@gmail.com>
References: <20260221051006.335141-1-stondo@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 21 Feb 2026 05:10:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231591

From: Stefano Tondo <stefano.tondo.ext@siemens.com>

- Add software_packageVersion to rootfs component using DISTRO_VERSION
  Fixes SBOM validation tools reporting missing version on root elements

- Add get_dependencies_by_scope() using Yocto's native DEPENDS/RDEPENDS
  mechanism to classify dependencies by lifecycle scope:
  - runtime: packages in RDEPENDS (from package manifest PKGDATA)
  - build: packages in DEPENDS but not in RDEPENDS
  - test: explicitly marked via SPDX_FORCE_TEST_SCOPE

  This universal approach works for all ecosystems (C/C++, Rust, Go,
  npm, Python, etc.) because Yocto's packaging system already separates
  build and runtime dependencies.

- Read runtime dependencies from package manifests to capture
  auto-detected shared library dependencies (e.g., libc6, libssl3)

- Fall back to recipe-level RDEPENDS if manifest unavailable

Signed-off-by: Stefano Tondo <stefano.tondo.ext@siemens.com>
---
 meta/lib/oe/spdx30_tasks.py | 79 ++++++++++++++++++++++++++++++++++++-
 1 file changed, 78 insertions(+), 1 deletion(-)

diff --git a/meta/lib/oe/spdx30_tasks.py b/meta/lib/oe/spdx30_tasks.py
index 12b8e68fbe..b028238304 100644
--- a/meta/lib/oe/spdx30_tasks.py
+++ b/meta/lib/oe/spdx30_tasks.py
@@ -1224,7 +1224,59 @@ def create_package_spdx(d):
             common_objset.doc.creationInfo
         )
 
+        def get_dependencies_by_scope(d, package):
+            """Classify dependencies by LifecycleScopeType using DEPENDS/RDEPENDS.
+
+            Reads runtime deps from package manifests (PKGDATA) to capture both
+            explicit RDEPENDS and auto-detected shared library dependencies.
+            Returns dict with 'runtime', 'build', and 'test' sets.
+            """
+            pn = d.getVar('PN')
+
+            all_build = set((d.getVar('DEPENDS') or '').split())
+
+            runtime = set()
+
+            try:
+                pkg_data = oe.packagedata.read_subpkgdata_dict(package, d)
+                rdepends_str = pkg_data.get('RDEPENDS', '')
+                rrecommends_str = pkg_data.get('RRECOMMENDS', '')
+
+                for dep in rdepends_str.split():
+                    if dep and not dep.startswith('(') and not dep.endswith(')'):
+                        runtime.add(dep)
+
+                for dep in rrecommends_str.split():
+                    if dep and not dep.startswith('(') and not dep.endswith(')'):
+                        runtime.add(dep)
+
+                bb.debug(2, f"Package {package}: runtime deps from manifest: {runtime}")
+            except Exception as e:
+                bb.warn(f"Could not read package manifest for {package}: {e}")
+                runtime.update((d.getVar('RDEPENDS:' + package) or '').split())
+                runtime.update((d.getVar('RRECOMMENDS:' + package) or '').split())
+
+            non_runtime = all_build - runtime
+
+            force_build = set((d.getVar('SPDX_FORCE_BUILD_SCOPE') or '').split())
+            force_test = set((d.getVar('SPDX_FORCE_TEST_SCOPE') or '').split())
+            force_runtime = set((d.getVar('SPDX_FORCE_RUNTIME_SCOPE') or '').split())
+
+            runtime = (runtime | force_runtime) - force_build - force_test
+            build = (non_runtime | force_build) - force_runtime - force_test
+            test = force_test
+
+            return {
+                'runtime': runtime,
+                'build': build,
+                'test': test
+            }
+
         runtime_spdx_deps = set()
+        build_spdx_deps = set()
+        test_spdx_deps = set()
+
+        deps_by_scope = get_dependencies_by_scope(d, package)
 
         deps = bb.utils.explode_dep_versions2(localdata.getVar("RDEPENDS") or "")
         seen_deps = set()
@@ -1256,7 +1308,15 @@ def create_package_spdx(d):
                 )
                 dep_package_cache[dep] = dep_spdx_package
 
-            runtime_spdx_deps.add(dep_spdx_package)
+            # Determine scope based on universal classification
+            if dep in deps_by_scope['runtime'] or dep_pkg in deps_by_scope['runtime']:
+                runtime_spdx_deps.add(dep_spdx_package)
+            elif dep in deps_by_scope['test'] or dep_pkg in deps_by_scope['test']:
+                test_spdx_deps.add(dep_spdx_package)
+            else:
+                # If it's in RDEPENDS but not classified as runtime or test,
+                # treat as runtime (this shouldn't happen normally)
+                runtime_spdx_deps.add(dep_spdx_package)
             seen_deps.add(dep)
 
         if runtime_spdx_deps:
@@ -1267,6 +1327,22 @@ def create_package_spdx(d):
                 [oe.sbom30.get_element_link_id(dep) for dep in runtime_spdx_deps],
             )
 
+        if build_spdx_deps:
+            pkg_objset.new_scoped_relationship(
+                [spdx_package],
+                oe.spdx30.RelationshipType.dependsOn,
+                oe.spdx30.LifecycleScopeType.build,
+                [oe.sbom30.get_element_link_id(dep) for dep in build_spdx_deps],
+            )
+
+        if test_spdx_deps:
+            pkg_objset.new_scoped_relationship(
+                [spdx_package],
+                oe.spdx30.RelationshipType.dependsOn,
+                oe.spdx30.LifecycleScopeType.test,
+                [oe.sbom30.get_element_link_id(dep) for dep in test_spdx_deps],
+            )
+
         oe.sbom30.write_recipe_jsonld_doc(d, pkg_objset, "packages", deploydir)
 
     oe.sbom30.write_recipe_jsonld_doc(d, common_objset, "common-package", deploydir)
@@ -1427,6 +1503,7 @@ def create_rootfs_spdx(d):
             _id=objset.new_spdxid("rootfs", image_basename),
             creationInfo=objset.doc.creationInfo,
             name=image_basename,
+            software_packageVersion=d.getVar("DISTRO_VERSION") or "1.0",
             software_primaryPurpose=oe.spdx30.software_SoftwarePurpose.archive,
         )
     )
-- 
2.53.0


