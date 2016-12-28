Return-Path: <markus.lehtonen@linux.intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id 9831E71A03
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Dec 2016 13:02:46 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga104.fm.intel.com with ESMTP; 28 Dec 2016 05:02:48 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,422,1477983600"; d="scan'208";a="802981681"
Received: from marquiz.fi.intel.com ([10.237.72.155])
	by FMSMGA003.fm.intel.com with ESMTP; 28 Dec 2016 05:02:47 -0800
From: Markus Lehtonen <markus.lehtonen@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 28 Dec 2016 15:02:38 +0200
Message-Id: <1482930164-15721-3-git-send-email-markus.lehtonen@linux.intel.com>
X-Mailer: git-send-email 2.6.6
In-Reply-To: <1482930164-15721-1-git-send-email-markus.lehtonen@linux.intel.com>
References: <1482930164-15721-1-git-send-email-markus.lehtonen@linux.intel.com>
Subject: [PATCH 2/8] oeqa.utils.metadata: re-organise distro information
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
X-List-Received-Date: Wed, 28 Dec 2016 13:02:46 -0000

Use the same format, based on /etc/os-release, as for host distro
information.

[YOCTO #10590]

Signed-off-by: Markus Lehtonen <markus.lehtonen@linux.intel.com>
---
 meta/lib/oeqa/utils/metadata.py | 17 ++++++++++-------
 scripts/oe-selftest             |  4 ++--
 2 files changed, 12 insertions(+), 9 deletions(-)

diff --git a/meta/lib/oeqa/utils/metadata.py b/meta/lib/oeqa/utils/metadata.py
index 2316841..df6ed91 100644
--- a/meta/lib/oeqa/utils/metadata.py
+++ b/meta/lib/oeqa/utils/metadata.py
@@ -10,9 +10,7 @@ from collections.abc import MutableMapping
 from xml.dom.minidom import parseString
 from xml.etree.ElementTree import Element, tostring
 
-from oeqa.utils.commands import runCmd, get_bb_var, get_bb_vars
-
-metadata_vars = ['MACHINE', 'DISTRO', 'DISTRO_VERSION']
+from oeqa.utils.commands import runCmd, get_bb_vars
 
 def get_os_release():
     """Get info from /etc/os-release as a dict"""
@@ -35,9 +33,14 @@ def metadata_from_bb():
     info_dict = OrderedDict()
     hostname = runCmd('hostname')
     info_dict['hostname'] = hostname.output
-    data_dict = get_bb_vars(metadata_vars)
-    for var in metadata_vars:
-        info_dict[var.lower()] = data_dict[var]
+    data_dict = get_bb_vars()
+
+    info_dict['machine'] = data_dict['MACHINE']
+
+    # Distro information
+    info_dict['distro'] = {'id': data_dict['DISTRO'],
+                           'version_id': data_dict['DISTRO_VERSION'],
+                           'pretty_name': '%s %s' % (data_dict['DISTRO'], data_dict['DISTRO_VERSION'])}
 
     # Host distro information
     os_release = get_os_release()
@@ -47,7 +50,7 @@ def metadata_from_bb():
             if key in os_release:
                 info_dict['host_distro'][key] = os_release[key]
 
-    info_dict['layers'] = get_layers(get_bb_var('BBLAYERS'))
+    info_dict['layers'] = get_layers(data_dict['BBLAYERS'])
     return info_dict
 
 def metadata_from_data_store(d):
diff --git a/scripts/oe-selftest b/scripts/oe-selftest
index bfcea66..b4d911e 100755
--- a/scripts/oe-selftest
+++ b/scripts/oe-selftest
@@ -624,8 +624,8 @@ def main():
             for layer, values in metadata['layers'].items():
                 layer_info = '%s%-17s = %s:%s\n' % (layer_info, layer,
                               values['branch'], values['revision'])
-            msg = 'Selftest for build %s of %s %s for machine %s on %s\n\n%s' % (
-                   log_prefix[12:], metadata['distro'], metadata['distro_version'],
+            msg = 'Selftest for build %s of %s for machine %s on %s\n\n%s' % (
+                   log_prefix[12:], metadata['distro']['pretty_name'],
                    metadata['machine'], metadata['hostname'], layer_info)
 
             log.debug('Commiting results to local repository')
-- 
2.6.6


