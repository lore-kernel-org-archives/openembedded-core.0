Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id CD9CC786A5
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Nov 2017 13:23:12 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id vAADNEKo001415
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Nov 2017 05:23:14 -0800 (PST)
Received: from pek-lpg-core1.wrs.com (128.224.156.132) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.361.1; Fri, 10 Nov 2017 05:23:13 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 10 Nov 2017 14:27:22 +0800
Message-ID: <5db1090b134f79ea5316fc19bb938c2fc646f5bf.1510275834.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1510275834.git.liezhi.yang@windriver.com>
References: <cover.1510275834.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 22/23] populate_sdk_ext.bbclass: disable for multilib image
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
X-List-Received-Date: Fri, 10 Nov 2017 13:23:13 -0000
Content-Type: text/plain

The following build doesn't work:
MACHINE ?= "qemux86-64"
require conf/multilib.conf
MULTILIBS = "multilib:lib32"
DEFAULTTUNE_virtclass-multilib-lib32 = "x86"

$ bitbake lib32-core-image-minimal -cpopulate_sdk_ext
[snip]
Exception: FileExistsError: [Errno 17] File exists: '/buildarea/lyang1/test_q64/tmp/sysroots-components/core2-64/openssl/sysroot-providers/openssl10' -> '/buildarea/lyang1/test_q64/tmp/work/qemux86_64-pokymllib32-linux/lib32-core-image-minimal/1.0-r0/lib32-recipe-sysroot/sysroot-providers/openssl10'
[snip]

The problem is populate_sdk_ext installs all multilib variants, and
extend_recipe_sysroot() handles foo-image depends lib32-foo-image, but doesn't
handle lib32-foo-image depends foo-image, we can use a lot of trick ways to make
it work:
1) Get foo-image's RECIPE_SYSROOT when build lib32-foo-image
2) Handle conflicts with foo-image.do_rootfs
3) Handle conflicts when "bitbake lib32-foo-image foo-image -cpopulate_sdk_ext"

And maybe other potential problems, this looks painful, fortunately, we don't
have to do that since "bitbake foo-image -cpopulate_sdk_ext" generate the same
eSDK as "bitbake lib32-foo-image -cpopulate_sdk_ext" in theory. So just disable
the build and print hint messages.

[YOCTO #12210]

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/classes/populate_sdk_ext.bbclass | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/meta/classes/populate_sdk_ext.bbclass b/meta/classes/populate_sdk_ext.bbclass
index 07c7e82..da0e292 100644
--- a/meta/classes/populate_sdk_ext.bbclass
+++ b/meta/classes/populate_sdk_ext.bbclass
@@ -701,6 +701,23 @@ python do_sdk_depends() {
 }
 addtask sdk_depends
 
+# "bitbake lib32-foo-image -csdk_depends" doesn't work, use
+# "bitbake foo-image -csdk_depends" to replace of it, they will generate
+# the same depends.
+do_sdk_depends[prefuncs] = 'disable_for_multilib_image'
+python disable_for_multilib_image() {
+    mlprefix = d.getVar("MLPREFIX")
+    if mlprefix:
+        pn = d.getVar('PN')
+        bpn = d.getVar('BPN')
+        bb.fatal("do_sdk_depends for %s doesn't work, use %s to replace of it, " \
+            "they will generate the same dependencies and eSDK.\n" \
+            "For example, the following 2 commands will generate the same eSDK:\n" \
+            "$ bitbake %s -cpopulate_sdk_ext\n" \
+            "$ bitbake %s -cpopulate_sdk_ext\n" % (pn, bpn, bpn, pn))
+}
+
+
 do_sdk_depends[dirs] = "${WORKDIR}"
 do_sdk_depends[depends] = "${@get_ext_sdk_depends(d)}"
 do_sdk_depends[recrdeptask] = "${@d.getVarFlag('do_populate_sdk', 'recrdeptask', False)}"
-- 
2.7.4


