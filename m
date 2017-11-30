Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 8E1A3784E2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Nov 2017 01:45:49 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id vAU1joJC031835
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Nov 2017 17:45:50 -0800
Received: from pek-lpg-core1.wrs.com (128.224.156.132) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.361.1; Wed, 29 Nov 2017 17:45:49 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 30 Nov 2017 09:45:14 +0800
Message-ID: <f8f2799d5b4c51969c904a7a09b75caae1020b31.1512006081.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1512006081.git.liezhi.yang@windriver.com>
References: <cover.1512006081.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 4/5] webkitgtk: fix compile error when len(TMPDIR) == 410
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
X-List-Received-Date: Thu, 30 Nov 2017 01:45:49 -0000
Content-Type: text/plain

One of the gcc command line was too long (longer than 160,000 characters) when
len(TMPDIR) == 410, so there was an "Argument list too long" error:
$ bitbake webkitgtk
i586-poky-linux-g++: error trying to exec [snip] execv: Argument list too long

The cmake doesn't support relative path, so we have to edit flags.make to fix
the problem:
- Replace -I${RECIPE_SYSROOT} with -I=
- Replace "-I${S}/path1/in/S -I ${S}/path2/in/S" with
  "-iprefix ${S} -iwithprefixbefore /path1/in/S -iwithprefixbefore /path2/in/S"

Now the length is less than 25,000.

[YOCTO #12362]

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/recipes-sato/webkit/webkitgtk_2.16.6.bb | 27 +++++++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/meta/recipes-sato/webkit/webkitgtk_2.16.6.bb b/meta/recipes-sato/webkit/webkitgtk_2.16.6.bb
index 0f126cb..3ff5425 100644
--- a/meta/recipes-sato/webkit/webkitgtk_2.16.6.bb
+++ b/meta/recipes-sato/webkit/webkitgtk_2.16.6.bb
@@ -117,3 +117,30 @@ ARM_INSTRUCTION_SET_armv7ve = "thumb"
 # Segmentation fault
 GI_DATA_ENABLED_armv7a = "False"
 GI_DATA_ENABLED_armv7ve = "False"
+
+do_configure[postfuncs] += 'shorter_flags_make'
+
+python shorter_flags_make() {
+    recipe_sysroot = d.getVar('RECIPE_SYSROOT')
+    for root, dirs, files in os.walk(d.getVar('B')):
+        for flags_make in files:
+            if flags_make == 'flags.make':
+                # To fix build error when len(TMPDIR) == 410:
+                # - Replace -I${RECIPE_SYSROOT} with -I=
+                # - Replace "-I${S}/path1/in/S -I ${S}/path2/in/S" with
+                #   "-iprefix ${S} -iwithprefixbefore /path1/in/S -iwithprefixbefore /path2/in/S"
+                flags_make = os.path.join(root, flags_make)
+                new_lines = []
+                with open(flags_make, 'r') as f:
+                    for line in f.readlines():
+                        if line.startswith('CXX_INCLUDES = ') or line.startswith('C_INCLUDES = '):
+                            line = line.replace('-I%s' % recipe_sysroot, '-I=')
+                            line = line.replace('CXX_INCLUDES =', 'CXX_INCLUDES = -iprefix %s/ ' % d.getVar('S'))
+                            line = line.replace('C_INCLUDES =', 'C_INCLUDES = -iprefix %s/ ' % d.getVar('S'))
+                            line = line.replace('-I%s' % d.getVar('S'), '-iwithprefixbefore ')
+                        new_lines.append(line)
+
+                with open(flags_make, 'w') as f:
+                        for line in new_lines:
+                            f.write(line)
+}
-- 
2.7.4


