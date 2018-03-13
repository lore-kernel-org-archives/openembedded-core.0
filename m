Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id E836C78954
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Mar 2018 03:20:26 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id w2D3KSCq028960
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 Mar 2018 20:20:28 -0700 (PDT)
Received: from pek-lpg-core1.wrs.com (128.224.156.132) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.361.1; Mon, 12 Mar 2018 20:19:48 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 13 Mar 2018 11:24:45 +0800
Message-ID: <bdc9d426a1c9b482c44d288f30ddd11f28fac7f5.1520911259.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1520911259.git.liezhi.yang@windriver.com>
References: <cover.1520911259.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 3/8] staging.bbclass: print searched manifest when not found
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 13 Mar 2018 03:20:27 -0000
Content-Type: text/plain

The old warning was:
WARNING: lib32-wrlinux-image-glibc-small-1.0-r1 do_prepare_recipe_sysroot: Manifest /path/to/tmp/sstate-control/manifest-allarch-lib32-qemuwrapper-cross.populate_sysroot not found?

The message wasn't clear enough, it searched a few manifests, but only
reported the last one, which confused user.

Now the warning is:
WARNING: lib32-wrlinux-image-glibc-small-1.0-r1 do_rootfs: Manifest for lib32-qemuwrapper-cross not found, searched manifests:
/path/to/tmp/sstate-control/manifest-qemux86_64-lib32-qemuwrapper-cross.populate_sysroot
/path/to/tmp/sstate-control/manifest-core2-64-lib32-qemuwrapper-cross.populate_sysroot
/path/to/tmp/sstate-control/manifest-x86_64-lib32-qemuwrapper-cross.populate_sysroot
/path/to/tmp/sstate-control/manifest-allarch-lib32-qemuwrapper-cross.populate_sysroot

Whick makes debug easier.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/lib/oe/sstatesig.py | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/lib/oe/sstatesig.py b/meta/lib/oe/sstatesig.py
index b82e0f4..0c90ffe 100644
--- a/meta/lib/oe/sstatesig.py
+++ b/meta/lib/oe/sstatesig.py
@@ -394,11 +394,14 @@ def find_sstate_manifest(taskdata, taskdata2, taskname, d, multilibcache):
         pkgarchs.append('allarch')
         pkgarchs.append('${SDK_ARCH}_${SDK_ARCH}-${SDKPKGSUFFIX}')
 
+    searched_manifest = []
     for pkgarch in pkgarchs:
         manifest = d2.expand("${SSTATE_MANIFESTS}/manifest-%s-%s.%s" % (pkgarch, taskdata, taskname))
         if os.path.exists(manifest):
             return manifest, d2
+        searched_manifest.append(manifest)
     bb.warn("Manifest %s not found in %s (variant '%s')?" % (manifest, d2.expand(" ".join(pkgarchs)), variant))
+    bb.warn("Searched manifests:\n%s" % '\n'.join(searched_manifest))
     return None, d2
 
 
-- 
2.7.4


