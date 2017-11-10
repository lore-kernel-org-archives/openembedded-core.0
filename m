Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id E5DD078635
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Nov 2017 13:22:53 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id vAADMtNu012133
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Nov 2017 05:22:55 -0800
Received: from pek-lpg-core1.wrs.com (128.224.156.132) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.361.1; Fri, 10 Nov 2017 05:22:54 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 10 Nov 2017 14:27:09 +0800
Message-ID: <f098c01a598f8d4fc296fb408883040bd8bdc1d1.1510275834.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1510275834.git.liezhi.yang@windriver.com>
References: <cover.1510275834.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 09/23] staging.bbclass: print searched manifest when not found
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
X-List-Received-Date: Fri, 10 Nov 2017 13:22:54 -0000
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
 meta/classes/staging.bbclass | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/meta/classes/staging.bbclass b/meta/classes/staging.bbclass
index 455eb05..75bec84 100644
--- a/meta/classes/staging.bbclass
+++ b/meta/classes/staging.bbclass
@@ -504,6 +504,7 @@ python extend_recipe_sysroot() {
                 variant = ''
 
         native = False
+        searched_manifest = []
         if c.endswith("-native"):
             manifest = d2.expand("${SSTATE_MANIFESTS}/manifest-${BUILD_ARCH}-%s.populate_sysroot" % c)
             native = True
@@ -523,8 +524,11 @@ python extend_recipe_sysroot() {
                 manifest = d2.expand("${SSTATE_MANIFESTS}/manifest-%s-%s.populate_sysroot" % (pkgarch, c))
                 if os.path.exists(manifest):
                     break
+                searched_manifest.append(manifest)
         if not os.path.exists(manifest):
-            bb.warn("Manifest %s not found?" % manifest)
+            if not searched_manifest:
+                searched_manifest.append(manifest)
+            bb.warn("Manifest for %s not found, searched manifests:\n%s" % (c, '\n'.join(searched_manifest)))
         else:
             newmanifest = collections.OrderedDict()
             if native:
-- 
2.7.4


