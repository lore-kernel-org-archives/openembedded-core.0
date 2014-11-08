Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id CE35C7169F
	for <openembedded-core@lists.openembedded.org>;
	Sat,  8 Nov 2014 09:04:47 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id sA894kfY004378
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Sat, 8 Nov 2014 01:04:46 -0800 (PST)
Received: from pek-hjia-d1.corp.ad.wrs.com (128.224.162.194) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.174.1; Sat, 8 Nov 2014 01:04:46 -0800
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>, <ross.burton@intel.com>,
	<mark.hatle@windriver.com>
Date: Sat, 8 Nov 2014 17:04:38 +0800
Message-ID: <ee8bc66aca0d15c6c835b8fbcb483579a33ab5fd.1415437328.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1415437328.git.hongxu.jia@windriver.com>
References: <cover.1415437328.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] compress_doc.bbclass: support update-alternatives
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
X-List-Received-Date: Sat, 08 Nov 2014 09:04:48 -0000
Content-Type: text/plain

While doc file make use of update-alternatives to fix confliction,
we should reconfigure update-alternatives for doc compression.

Such as util-linux-doc:
...
update-alternatives --install /usr/share/man/man1/last.1 last.1
  /usr/share/man/man1/last.1.util-linux 100
...
was updated by doc_compress to
...
update-alternatives --install /usr/share/man/man1/last.1.bz2 last.1.bz2
  /usr/share/man/man1/last.1.util-linux.bz2 100
...

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta/classes/compress_doc.bbclass | 46 ++++++++++++++++++++++++++++++++++++++-
 1 file changed, 45 insertions(+), 1 deletion(-)

diff --git a/meta/classes/compress_doc.bbclass b/meta/classes/compress_doc.bbclass
index 6a4e635..b84fef6 100644
--- a/meta/classes/compress_doc.bbclass
+++ b/meta/classes/compress_doc.bbclass
@@ -29,7 +29,7 @@ DOC_DECOMPRESS_CMD[gz] ?= 'gunzip -v'
 DOC_DECOMPRESS_CMD[bz2] ?= "bunzip2 -v"
 DOC_DECOMPRESS_CMD[xz] ?= "unxz -v"
 
-PACKAGE_PREPROCESS_FUNCS += "package_do_compress_doc"
+PACKAGE_PREPROCESS_FUNCS += "package_do_compress_doc compress_doc_updatealternatives"
 python package_do_compress_doc() {
     compress_mode = d.getVar('DOC_COMPRESS', True)
     compress_list = (d.getVar('DOC_COMPRESS_LIST', True) or '').split()
@@ -211,3 +211,47 @@ def decompress_doc(topdir, compress_mode, decompress_cmds):
 
     _process_hardlink(hardlink_dict, compress_mode, decompress_cmds, decompress)
 
+python compress_doc_updatealternatives () {
+    if not bb.data.inherits_class('update-alternatives', d):
+        return
+
+    mandir = d.getVar("mandir", True)
+    infodir = d.getVar("infodir", True)
+    compress_mode = d.getVar('DOC_COMPRESS', True)
+    for pkg in (d.getVar('PACKAGES', True) or "").split():
+        old_names = (d.getVar('ALTERNATIVE_%s' % pkg, True) or "").split()
+        new_names = []
+        for old_name in old_names:
+            old_link     = d.getVarFlag('ALTERNATIVE_LINK_NAME', old_name, True)
+            old_target   = d.getVarFlag('ALTERNATIVE_TARGET_%s' % pkg, old_name, True) or \
+                d.getVarFlag('ALTERNATIVE_TARGET', old_name, True) or \
+                d.getVar('ALTERNATIVE_TARGET_%s' % pkg, True) or \
+                d.getVar('ALTERNATIVE_TARGET', True) or \
+                old_link
+            # Sometimes old_target is specified as relative to the link name.
+            old_target   = os.path.join(os.path.dirname(old_link), old_target)
+
+            # The updatealternatives used for compress doc
+            if mandir in old_target or infodir in old_target:
+                new_name = old_name + '.' + compress_mode
+                new_link = old_link + '.' + compress_mode
+                new_target = old_target + '.' + compress_mode
+                d.delVarFlag('ALTERNATIVE_LINK_NAME', old_name)
+                d.setVarFlag('ALTERNATIVE_LINK_NAME', new_name, new_link)
+                if d.getVarFlag('ALTERNATIVE_TARGET_%s' % pkg, old_name, True):
+                    d.delVarFlag('ALTERNATIVE_TARGET_%s' % pkg, old_name)
+                    d.setVarFlag('ALTERNATIVE_TARGET_%s' % pkg, new_name, new_target)
+                elif d.getVarFlag('ALTERNATIVE_TARGET', old_name, True):
+                    d.delVarFlag('ALTERNATIVE_TARGET', old_name)
+                    d.setVarFlag('ALTERNATIVE_TARGET', new_name, new_target)
+                elif d.getVar('ALTERNATIVE_TARGET_%s' % pkg, True):
+                    d.setVar('ALTERNATIVE_TARGET_%s' % pkg, new_target)
+                elif d.getVar('ALTERNATIVE_TARGET', old_name, True):
+                    d.setVar('ALTERNATIVE_TARGET', new_target)
+
+                new_names.append(new_name)
+
+        if new_names:
+            d.setVar('ALTERNATIVE_%s' % pkg, ' '.join(new_names))
+}
+
-- 
1.9.1


