Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 2497B65E00
	for <openembedded-core@lists.openembedded.org>;
	Wed,  9 Apr 2014 08:56:58 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s398uxVM013907
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 9 Apr 2014 01:56:59 -0700 (PDT)
Received: from pek-hjia-d1.corp.ad.wrs.com (128.224.162.194) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.169.1; Wed, 9 Apr 2014 01:56:58 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 9 Apr 2014 16:56:44 +0800
Message-ID: <68fec84f980edb28dba039fe788e2fd65fb2a2bb.1397025331.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <cover.1397025331.git.hongxu.jia@windriver.com>
References: <cover.1397025331.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
Cc: saul.wold@intel.com
Subject: [PATCH 1/1] libpam: fix 64-bit pam plugins not installed when add to 32-bit image
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
X-List-Received-Date: Wed, 09 Apr 2014 08:56:59 -0000
Content-Type: text/plain

While the BSP is configured as a 64-bit kernel and 32-bit userspace,
add a 64-bit version of libpam to the filesystem, there was a failure:
...
| Computing transaction...error: Can't install
pam-plugin-unix-1.1.6-r2@lib64_x86_64: no package provides libpam-lib64
|
| Saving cache...
...

While using 'lib64' as the multilib suffix of libpam RPROVIDES , the
RPROVIDES was overridden by map_depends_variable in classextend.py.
...
 $RPROVIDES_lib64-libpam [2 operations]
   set data_smart.py:429 [finalize]
     " libpam-${baselib}"
   set classextend.py:71 [map_depends_variable]4532
     "lib64-libpam"
 computed:
   "lib64-libpam"
RPROVIDES_lib64-libpam="lib64-libpam"
...

Rename the suffix could fix this issue.
[YOCTO #4532]

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta/recipes-extended/pam/libpam_1.1.6.bb | 26 ++++++++++++++++----------
 1 file changed, 16 insertions(+), 10 deletions(-)

diff --git a/meta/recipes-extended/pam/libpam_1.1.6.bb b/meta/recipes-extended/pam/libpam_1.1.6.bb
index 61aa0a1..7c0111f 100644
--- a/meta/recipes-extended/pam/libpam_1.1.6.bb
+++ b/meta/recipes-extended/pam/libpam_1.1.6.bb
@@ -62,12 +62,18 @@ FILES_${PN}-xtests = "${datadir}/Linux-PAM/xtests"
 
 PACKAGES_DYNAMIC += "^pam-plugin-.*"
 
-RPROVIDES_${PN} += "libpam-${baselib}"
-RPROVIDES_${PN}-runtime += "libpam-runtime-${baselib}"
+def get_multilib_bit(d):
+    baselib = d.getVar('baselib', True) or ''
+    return baselib.replace('lib', '')
 
-RDEPENDS_${PN}-runtime = "libpam-${baselib} pam-plugin-deny-${baselib} pam-plugin-permit-${baselib} pam-plugin-warn-${baselib} pam-plugin-unix-${baselib}"
-RDEPENDS_${PN}-xtests = "libpam-${baselib} pam-plugin-access-${baselib} pam-plugin-debug-${baselib} pam-plugin-cracklib-${baselib} pam-plugin-pwhistory-${baselib} pam-plugin-succeed-if-${baselib} pam-plugin-time-${baselib} coreutils"
-RRECOMMENDS_${PN} = "libpam-runtime-${baselib}"
+libpam_suffix = "suffix${@get_multilib_bit(d)}"
+
+RPROVIDES_${PN} += "libpam-${libpam_suffix}"
+RPROVIDES_${PN}-runtime += "libpam-runtime-${libpam_suffix}"
+
+RDEPENDS_${PN}-runtime = "libpam-${libpam_suffix} pam-plugin-deny-${libpam_suffix} pam-plugin-permit-${libpam_suffix} pam-plugin-warn-${libpam_suffix} pam-plugin-unix-${libpam_suffix}"
+RDEPENDS_${PN}-xtests = "libpam-${libpam_suffix} pam-plugin-access-${libpam_suffix} pam-plugin-debug-${libpam_suffix} pam-plugin-cracklib-${libpam_suffix} pam-plugin-pwhistory-${libpam_suffix} pam-plugin-succeed-if-${libpam_suffix} pam-plugin-time-${libpam_suffix} coreutils"
+RRECOMMENDS_${PN} = "libpam-runtime-${libpam_suffix}"
 
 python populate_packages_prepend () {
     def pam_plugin_append_file(pn, dir, file):
@@ -78,21 +84,21 @@ python populate_packages_prepend () {
         d.setVar('FILES_' + pn, nf)
 
     def pam_plugin_hook(file, pkg, pattern, format, basename):
-        baselib = d.getVar('baselib', True)
+        libpam_suffix = d.getVar('libpam_suffix', True)
         mlprefix = d.getVar('MLPREFIX', True) or ''
 
         rdeps = d.getVar('RDEPENDS_' + pkg, True)
         if rdeps:
-            rdeps = rdeps + " " + mlprefix + "libpam-" + baselib
+            rdeps = rdeps + " " + mlprefix + "libpam-" + libpam_suffix
         else:
-            rdeps = mlprefix + "libpam-" + baselib
+            rdeps = mlprefix + "libpam-" + libpam_suffix
         d.setVar('RDEPENDS_' + pkg, rdeps)
 
         provides = d.getVar('RPROVIDES_' + pkg, True)
         if provides:
-            provides = provides + " " + pkg + "-" + baselib
+            provides = provides + " " + pkg + "-" + libpam_suffix
         else:
-            provides = pkg + "-" + baselib
+            provides = pkg + "-" + libpam_suffix
         d.setVar('RPROVIDES_' + pkg, provides)
 
     dvar = bb.data.expand('${WORKDIR}/package', d, True)
-- 
1.8.1.2


