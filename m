Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 521477864F
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Jul 2018 02:26:25 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id w6D2QQ2h010063
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Jul 2018 19:26:26 -0700 (PDT)
Received: from pek-lpg-core1.wrs.com (128.224.156.132) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.399.0; Thu, 12 Jul 2018 19:26:25 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 13 Jul 2018 10:36:24 +0800
Message-ID: <47efbcebc355a5c00a4e53d4a137b86b33278d0a.1531449293.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1531449293.git.liezhi.yang@windriver.com>
References: <cover.1531449293.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH V4 4/4] populate_sdk_ext.bbclass: add SDK_CONF_MANIFEST_EXCLUDE
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
X-List-Received-Date: Fri, 13 Jul 2018 02:26:25 -0000
Content-Type: text/plain

From: Chen Qi <Qi.Chen@windriver.com>

Add SDK_CONF_MANIFEST_EXCLUDE to enable excluding items in sdk-conf-manifest.

By default, files under conf/ are all added to sdk-conf-manifest, as the
manifest file is set to 'conf/*'.

However, there are situations where some configuration files under conf/
directory are not intended to be added to sdk-conf-manifest, thus adding
SDK_CONF_MANIFEST_EXCLUDE to enable users to do this.

This variable takes the form of glob matching.
e.g.
SDK_CONF_MANIFEST_EXCLUDE = "conf/autogen*"
This would exclude all files under conf/ starting with 'autogen' from
sdk-conf-manifest.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/classes/populate_sdk_ext.bbclass | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/meta/classes/populate_sdk_ext.bbclass b/meta/classes/populate_sdk_ext.bbclass
index 9c31d70..bbe6c59 100644
--- a/meta/classes/populate_sdk_ext.bbclass
+++ b/meta/classes/populate_sdk_ext.bbclass
@@ -479,12 +479,19 @@ python copy_buildsystem () {
     # sdk_ext_postinst() below) thus the checksum we take here would always
     # be different.
     manifest_file_list = ['conf/*']
+    esdk_manifest_excludes = (d.getVar('SDK_CONF_MANIFEST_EXCLUDE') or '').split()
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
+                    bb.note('Exclude %s since it is in SDK_CONF_MANIFEST_EXCLUDE' % fn)
+                    continue
                 chksum = bb.utils.sha256_file(fn)
                 f.write('%s\t%s\n' % (chksum, os.path.relpath(fn, baseoutpath)))
 }
-- 
2.7.4


