Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 325FB78636
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Nov 2017 13:22:48 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id vAADMnbu018028
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Nov 2017 05:22:49 -0800 (PST)
Received: from pek-lpg-core1.wrs.com (128.224.156.132) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.361.1; Fri, 10 Nov 2017 05:22:49 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 10 Nov 2017 14:27:05 +0800
Message-ID: <e6783353c92871ff13b2bb7dd77d8ca35b5eae70.1510275834.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1510275834.git.liezhi.yang@windriver.com>
References: <cover.1510275834.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 05/23] staging.bbclass: fix for multilib
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
X-List-Received-Date: Fri, 10 Nov 2017 13:22:48 -0000
Content-Type: text/plain

Fixed:
MACHINE = "qemux86-64"
MULTILIBS = "multilib:lib32"
DEFAULTTUNE_virtclass-multilib-lib32 = "x86"

$ bitbake <image> -cpopulate_sdk_ext
[snip]
Exception: subprocess.CalledProcessError: Command 'sed -e [snip]'
[snip]

Subprocess output:
[snip]
sed: can't read /path/to/work/qemux86_64-wrs-linux/wrlinux-image-glibc-small/1.0-r1/recipe-sysroot/usr/lib/perl/5.24.1/ExtUtils/Liblist/Kid.pm: No such file or directory
[snip]

It was failed because "/usr/lib" is in qemux86_64-wrsmllib32-linux/, not in
qemux86_64-wrs-linux. The code has considered mutitlib, but seems not
completed, the multilib "variant" was not in fixme, so it wasn't handled
correctly, this patch fixes the problem.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/classes/staging.bbclass | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/meta/classes/staging.bbclass b/meta/classes/staging.bbclass
index 1b9e84d..412e269 100644
--- a/meta/classes/staging.bbclass
+++ b/meta/classes/staging.bbclass
@@ -480,6 +480,13 @@ python extend_recipe_sysroot() {
                     multilibs[variant] = get_multilib_datastore(variant, d)
                 d2 = multilibs[variant]
                 destsysroot = d2.getVar("RECIPE_SYSROOT")
+                if variant not in fixme:
+                    fixme[variant] = []
+            # Clear variant when variant == current_variant since we
+            # don't need handle it as multilib in this case, just handle
+            # it as normal is OK.
+            else:
+                variant = ''
 
         native = False
         if c.endswith("-native"):
@@ -508,6 +515,9 @@ python extend_recipe_sysroot() {
             if native:
                 fm = fixme['native']
                 targetdir = recipesysrootnative
+            elif variant:
+                fm = fixme[variant]
+                targetdir = destsysroot
             else:
                 fm = fixme['']
                 targetdir = destsysroot
-- 
2.7.4


