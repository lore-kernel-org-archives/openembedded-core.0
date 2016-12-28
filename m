Return-Path: <markus.lehtonen@linux.intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id 624DA719ED
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Dec 2016 13:02:45 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga104.fm.intel.com with ESMTP; 28 Dec 2016 05:02:47 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,422,1477983600"; d="scan'208";a="802981679"
Received: from marquiz.fi.intel.com ([10.237.72.155])
	by FMSMGA003.fm.intel.com with ESMTP; 28 Dec 2016 05:02:46 -0800
From: Markus Lehtonen <markus.lehtonen@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 28 Dec 2016 15:02:37 +0200
Message-Id: <1482930164-15721-2-git-send-email-markus.lehtonen@linux.intel.com>
X-Mailer: git-send-email 2.6.6
In-Reply-To: <1482930164-15721-1-git-send-email-markus.lehtonen@linux.intel.com>
References: <1482930164-15721-1-git-send-email-markus.lehtonen@linux.intel.com>
Subject: [PATCH 1/8] oeqa.utils.metadata: re-organise host distro information
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
X-List-Received-Date: Wed, 28 Dec 2016 13:02:45 -0000

Put all host distro data under one <host_distro> element. In addition
take the data directly from /etc/os-release instead of the "lsb API".
The /etc/os-release file is virtually ubiquitous, now, and using its
field names and values provides a more standardized and extensible
format.

[YOCTO #10590]

Signed-off-by: Markus Lehtonen <markus.lehtonen@linux.intel.com>
---
 meta/lib/oeqa/utils/metadata.py | 26 +++++++++++++++++++++-----
 1 file changed, 21 insertions(+), 5 deletions(-)

diff --git a/meta/lib/oeqa/utils/metadata.py b/meta/lib/oeqa/utils/metadata.py
index 5d8bf84..2316841 100644
--- a/meta/lib/oeqa/utils/metadata.py
+++ b/meta/lib/oeqa/utils/metadata.py
@@ -10,11 +10,22 @@ from collections.abc import MutableMapping
 from xml.dom.minidom import parseString
 from xml.etree.ElementTree import Element, tostring
 
-from oe.lsb import distro_identifier
 from oeqa.utils.commands import runCmd, get_bb_var, get_bb_vars
 
 metadata_vars = ['MACHINE', 'DISTRO', 'DISTRO_VERSION']
 
+def get_os_release():
+    """Get info from /etc/os-release as a dict"""
+    data = OrderedDict()
+    os_release_file = '/etc/os-release'
+    if not os.path.exists(os_release_file):
+        return None
+    with open(os_release_file) as fobj:
+        for line in fobj:
+            key, value = line.split('=', 1)
+            data[key.strip().lower()] = value.strip().strip('"')
+    return data
+
 def metadata_from_bb():
     """ Returns test's metadata as OrderedDict.
 
@@ -27,10 +38,15 @@ def metadata_from_bb():
     data_dict = get_bb_vars(metadata_vars)
     for var in metadata_vars:
         info_dict[var.lower()] = data_dict[var]
-    host_distro= distro_identifier()
-    host_distro, _, host_distro_release = host_distro.partition('-')
-    info_dict['host_distro'] = host_distro
-    info_dict['host_distro_release'] = host_distro_release
+
+    # Host distro information
+    os_release = get_os_release()
+    if os_release:
+        info_dict['host_distro'] = OrderedDict()
+        for key in ('id', 'version_id', 'pretty_name'):
+            if key in os_release:
+                info_dict['host_distro'][key] = os_release[key]
+
     info_dict['layers'] = get_layers(get_bb_var('BBLAYERS'))
     return info_dict
 
-- 
2.6.6


