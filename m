Return-Path: <markus.lehtonen@linux.intel.com>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	by mail.openembedded.org (Postfix) with ESMTP id 4C3FC71D9D
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Jan 2017 13:12:58 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by orsmga104.jf.intel.com with ESMTP; 13 Jan 2017 05:12:59 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,221,1477983600"; d="scan'208";a="1112091358"
Received: from hessakys-mobl1.ger.corp.intel.com (HELO
	mqz-osx-suse64.fi.intel.com) ([10.252.14.44])
	by fmsmga002.fm.intel.com with ESMTP; 13 Jan 2017 05:12:58 -0800
From: Markus Lehtonen <markus.lehtonen@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 13 Jan 2017 15:12:45 +0200
Message-Id: <1484313166-29604-10-git-send-email-markus.lehtonen@linux.intel.com>
X-Mailer: git-send-email 2.6.6
In-Reply-To: <1484313166-29604-1-git-send-email-markus.lehtonen@linux.intel.com>
References: <1484313166-29604-1-git-send-email-markus.lehtonen@linux.intel.com>
Subject: [PATCH v2 09/10] oeqa.utils.metadata: allow storing any bitbake config variables
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
X-List-Received-Date: Fri, 13 Jan 2017 13:12:58 -0000

Make it possible to store any bitbake config variables in the metadata.
Config values will be stored under a new config element in the xml report:
    <config>
        <variable name="MACHINE">qemux86</variable>
    </config>

The value of MACHINE is moved there instead of having a dedicated
<machine> element.

[YOCTO #10590]

Signed-off-by: Markus Lehtonen <markus.lehtonen@linux.intel.com>
---
 meta/lib/oeqa/utils/metadata.py | 12 +++++++++---
 scripts/oe-selftest             |  4 ++--
 2 files changed, 11 insertions(+), 5 deletions(-)

diff --git a/meta/lib/oeqa/utils/metadata.py b/meta/lib/oeqa/utils/metadata.py
index a3c1b2b..08d8198 100644
--- a/meta/lib/oeqa/utils/metadata.py
+++ b/meta/lib/oeqa/utils/metadata.py
@@ -29,14 +29,13 @@ def metadata_from_bb():
 
         Data will be gathered using bitbake -e thanks to get_bb_vars.
     """
+    metadata_config_vars = ('MACHINE')
 
     info_dict = OrderedDict()
     hostname = runCmd('hostname')
     info_dict['hostname'] = hostname.output
     data_dict = get_bb_vars()
 
-    info_dict['machine'] = data_dict['MACHINE']
-
     # Distro information
     info_dict['distro'] = {'id': data_dict['DISTRO'],
                            'version_id': data_dict['DISTRO_VERSION'],
@@ -52,6 +51,10 @@ def metadata_from_bb():
 
     info_dict['layers'] = get_layers(data_dict['BBLAYERS'])
     info_dict['bitbake'] = git_rev_info(os.path.dirname(bb.__file__))
+
+    info_dict['config'] = OrderedDict()
+    for var in sorted(metadata_config_vars):
+        info_dict['config'][var] = data_dict[var]
     return info_dict
 
 def metadata_from_data_store(d):
@@ -106,7 +109,10 @@ def dict_to_XML(tag, dictionary, **kwargs):
         elif isinstance(val, MutableMapping):
             child = (dict_to_XML(key, val))
         else:
-            child = Element(key)
+            if tag == 'config':
+                child = Element('variable', name=key)
+            else:
+                child = Element(key)
             child.text = str(val)
         elem.append(child)
     return elem
diff --git a/scripts/oe-selftest b/scripts/oe-selftest
index be63d5e..e33ca85 100755
--- a/scripts/oe-selftest
+++ b/scripts/oe-selftest
@@ -604,7 +604,7 @@ def main():
             l_branches = {str(branch) for branch in repo.branches}
             branch = '%s/%s/%s' % (metadata['hostname'],
                                    metadata['layers']['meta'].get('branch', '(nogit)'),
-                                   metadata['machine'])
+                                   metadata['config']['MACHINE'])
 
             if branch in l_branches:
                 log.debug('Found branch in local repository, checking out')
@@ -634,7 +634,7 @@ def main():
                               values.get('branch', '(nogit)'), values.get('commit', '0'*40))
             msg = 'Selftest for build %s of %s for machine %s on %s\n\n%s' % (
                    log_prefix[12:], metadata['distro']['pretty_name'],
-                   metadata['machine'], metadata['hostname'], layer_info)
+                   metadata['config']['MACHINE'], metadata['hostname'], layer_info)
 
             log.debug('Commiting results to local repository')
             repo.index.commit(msg)
-- 
2.6.6


