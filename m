Return-Path: <stondo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2773EC5DF83
	for <webhook@archiver.kernel.org>; Sat, 21 Feb 2026 04:24:43 +0000 (UTC)
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com [209.85.128.67])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.14406.1771647877768661935
 for <openembedded-core@lists.openembedded.org>;
 Fri, 20 Feb 2026 20:24:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=arwlPJrt;
 spf=pass (domain: gmail.com, ip: 209.85.128.67, mailfrom: stondo@gmail.com)
Received: by mail-wm1-f67.google.com with SMTP id 5b1f17b1804b1-4836f4cbe0bso20261525e9.3
        for <openembedded-core@lists.openembedded.org>; Fri, 20 Feb 2026 20:24:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771647876; x=1772252676; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Lz6h34f3zbYA0tqxxiJgZ/o1h7u5YTN3X2UXDRPvI6E=;
        b=arwlPJrtKzzP+zfLtL+vdM/yZJShC81DXD7uT6/QCT0pkTeNH8iWqHkaWRxzS2a6kV
         C1o77L8wQO4ZErSt1qNtNCKQdc0CeRRWOJkyvnkn7iTw5PAasX14jPo6OwMpMPJYY81N
         vC8Do3B0e99mziIiLuxNmUtZAJ81ZEG0pjbbcrSGVhTSKvGJacqHvKjQwT1QfQP79MB7
         TbkglZUJRDbqZrCYAAfnj5CM6G/N57E5iehbTf1ycNYor+Ul6wEahOq/OTNHSvNFZGZu
         IKBesjY028x/v4MUoKaqkI0GFKzytjeekIjOv4DtHPSpnzgBWdjbEqd6cWSp8F5FJv/1
         XDKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771647876; x=1772252676;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Lz6h34f3zbYA0tqxxiJgZ/o1h7u5YTN3X2UXDRPvI6E=;
        b=OPWOmN3J1pIcJbsPD68avv65+r0Jad00PIU0uJEgnun0Cn//M2uDGc8p+5HV5+Kebm
         YG4Lo0yWsLTF/DCAXJlj49L5JVAv8Kr33IKYicY6dWQo3rUtV3y44UtXCNJN58RZTdEZ
         CADX2SXyw+mXF+MvQmixjWehu36HjlhKi4ADzMLEsARaJoCyG+Pqf9A2LWYelqyMdTMs
         aYxzXhh/a0fOW0t6V8rArNCbFw+pjE+WJYkSLGwUidNXaDEXLvQjuFQlZ5Qyoth2pIXx
         BCOUpSt7eDU+ynfS4rkIhkpuDKqqD6g+XHpRIjZ0K7TpfjAQkM7IXm9t536XkXIhZ9bE
         vhLQ==
X-Gm-Message-State: AOJu0YyENwn0+qDu4u09HQnmFixuOftQr+CMwvE4eKkdrs5j/+KOmpHt
	iQT//ZEcHKkGP9ILfMwDDJNuABecywQaYABt85l63td4o9w2vRV6xDZ4nCf5UBHy
X-Gm-Gg: AZuq6aJippuQv8PxYP6Ix9YBZPnl6DuvTbGKQM06++YxdUbIv5G2pCUMuXY5rbRB6hw
	rce7YFWVtsZDBdSetIqbvvqhbmLxqf1dWyM85rYHC56mNKsqu0xFvGoFuTKqZzM96xho/k94+UM
	b45guTuD2LitEuh3z0P6Ft1aAJJnBJQdcUUMBQbJIfsGqTNN8TaCSZYqiTgdnYA5BULJoFIZ04A
	MJp97Z02uDmhRZ5McSwvvz1WjTeW/VdrbBbTRH7DZstd1loovbV/yg9pr0GFb3vpjB5A9BxR2C1
	GwwY2Tth74iMgwzKtcCTxOubwWrL/KW75dY/gEXqAqarQduSa7Xt8ABg8XP1NGaq7owZ1nJ2z6p
	PlJ6/LWWOCHyarS0eVXOFJMF3pIjZmxddQCOpdX+969FO4NI6iPzN2Y1As87GU22MU2Ql7EdF9p
	5kfd3k2e0t7rv0+r/WQwJYJvebV/i/zODXFXQ=
X-Received: by 2002:a05:600c:3e05:b0:483:78e1:784 with SMTP id 5b1f17b1804b1-483a95aaeb9mr26968545e9.4.1771647875764;
        Fri, 20 Feb 2026 20:24:35 -0800 (PST)
Received: from fedora ([81.6.40.67])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483a31ff4d7sm117340865e9.15.2026.02.20.20.24.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Feb 2026 20:24:34 -0800 (PST)
From: Stefano Tondo <stondo@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: stefano.tondo.ext@siemens.com,
	adrian.freihofer@siemens.com,
	Peter.Marko@siemens.com,
	jpewhacker@gmail.com,
	Ross.Burton@arm.com
Subject: [PATCH 11/14] spdx30: Add rootfs version and dependency scope classification
Date: Sat, 21 Feb 2026 05:24:15 +0100
Message-ID: <20260221042418.317535-12-stondo@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260221042418.317535-1-stondo@gmail.com>
References: <20260221042418.317535-1-stondo@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 21 Feb 2026 04:24:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231567

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


