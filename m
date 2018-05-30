Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id EF79174E29
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 May 2018 08:56:45 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id w4U8ukBM024252
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 May 2018 01:56:46 -0700 (PDT)
Received: from pek-lpg-core1.wrs.com (128.224.156.132) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.361.1; Wed, 30 May 2018 01:56:46 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 30 May 2018 17:03:59 +0800
Message-ID: <a875b6333b97a7f44d9051f74f4666123dd56053.1527670923.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1527670923.git.liezhi.yang@windriver.com>
References: <cover.1527670923.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 12/16] populate_sdk_ext.bbclass: add ESDK_MANIFEST_EXCLUDES
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
X-List-Received-Date: Wed, 30 May 2018 08:56:46 -0000
Content-Type: text/plain

From: Chen Qi <Qi.Chen@windriver.com>

Add ESDK_MANIFEST_EXCLUDES to enable excluding items in sdk-conf-manifest.

By default, files under conf/ are all added to sdk-conf-manifest, as the
manifest file is set to 'conf/*'.

However, there are situations where some configuration files under conf/
directory are not intended to be added to sdk-conf-manifest, thus adding
ESDK_MANIFEST_EXCLUDES to enable users to do this.

This variable takes the form of glob matching.
e.g.
ESDK_MANIFEST_EXCLUDES = "conf/autogen*"
This would exclude all files under conf/ starting with 'autogen' from
sdk-conf-manifest.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/classes/populate_sdk_ext.bbclass | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/meta/classes/populate_sdk_ext.bbclass b/meta/classes/populate_sdk_ext.bbclass
index e1bba49..017c4b6 100644
--- a/meta/classes/populate_sdk_ext.bbclass
+++ b/meta/classes/populate_sdk_ext.bbclass
@@ -484,12 +484,18 @@ python copy_buildsystem () {
     # sdk_ext_postinst() below) thus the checksum we take here would always
     # be different.
     manifest_file_list = ['conf/*']
+    esdk_manifest_excludes = (d.getVar('ESDK_MANIFEST_EXCLUDES') or '').split()
+    esdk_manifest_excludes_list = []
+    for exclude_item in esdk_manifest_excludes:
+        esdk_manifest_excludes_list += glob.glob(os.path.join(baseoutpath, exclude_item))
     manifest_file = os.path.join(baseoutpath, 'conf', 'sdk-conf-manifest')
     with open(manifest_file, 'w') as f:
         for item in manifest_file_list:
             for fn in glob.glob(os.path.join(baseoutpath, item)):
                 if fn == manifest_file:
                     continue
+                if fn in esdk_manifest_excludes_list:
+                    continue
                 chksum = bb.utils.sha256_file(fn)
                 f.write('%s\t%s\n' % (chksum, os.path.relpath(fn, baseoutpath)))
 }
-- 
2.7.4


