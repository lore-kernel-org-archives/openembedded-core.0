Received: from mail5.wrs.com (mail5.wrs.com [192.103.53.11])
 by mx.groups.io with SMTP id smtpd.web10.12655.1601349781929475675
 for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Sep 2020 20:23:02 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 192.103.53.11, mailfrom: qi.chen@windriver.com)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com [147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id 08T3MeiE015499
	(version=TLSv1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Mon, 28 Sep 2020 20:22:51 -0700
Received: from pek-lpg-core3.wrs.com (128.224.153.232) by
 ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
 14.3.487.0; Mon, 28 Sep 2020 20:22:18 -0700
From: "Chen Qi" <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [OE-core][PATCH 1/3] populate_sdk_ext.bbclass: add ESDK_MANIFEST_EXCLUDES
Date: Tue, 29 Sep 2020 11:22:14 +0800
Message-ID: <20200929032216.32161-1-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain

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
index d659b6940a..6f35b612c2 100644
--- a/meta/classes/populate_sdk_ext.bbclass
+++ b/meta/classes/populate_sdk_ext.bbclass
@@ -522,12 +522,18 @@ python copy_buildsystem () {
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
2.17.1

