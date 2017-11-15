Return-Path: <Qi.Chen@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 31E037851E
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Nov 2017 06:37:38 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id vAF6be71001619
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Nov 2017 22:37:40 -0800
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.167) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.361.1; Tue, 14 Nov 2017 22:37:39 -0800
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 15 Nov 2017 14:38:31 +0800
Message-ID: <60531f0490ca7243878533d4150c0dee1e64fc5f.1510727871.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1510727871.git.Qi.Chen@windriver.com>
References: <cover.1510727871.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] populate_sdk_ext.bbclass: add ESDK_MANIFEST_EXCLUDES
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
X-List-Received-Date: Wed, 15 Nov 2017 06:37:39 -0000
Content-Type: text/plain

Add ESDK_MANIFEST_EXCLUDES to enable excluding items from sdk-conf-manifest.

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
index 3620995..9ced3fc 100644
--- a/meta/classes/populate_sdk_ext.bbclass
+++ b/meta/classes/populate_sdk_ext.bbclass
@@ -485,12 +485,18 @@ python copy_buildsystem () {
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
1.9.1


