Return-Path: <mariano.lopez@linux.intel.com>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by mail.openembedded.org (Postfix) with ESMTP id D792D71AFA
	for <openembedded-core@lists.openembedded.org>;
	Thu,  1 Dec 2016 15:37:34 +0000 (UTC)
Received: from orsmga004.jf.intel.com ([10.7.209.38])
	by orsmga105.jf.intel.com with ESMTP; 01 Dec 2016 07:37:36 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,282,1477983600"; d="scan'208";a="36222171"
Received: from unknown (HELO mlopezva-MOBL2.zpn.intel.com) ([10.219.25.91])
	by orsmga004.jf.intel.com with ESMTP; 01 Dec 2016 07:37:36 -0800
From: mariano.lopez@linux.intel.com
To: openembedded-core@lists.openembedded.org
Date: Thu,  1 Dec 2016 09:37:36 -0600
Message-Id: <fe5c6f63b0523cb18bb8a8ce4988895c82a063c4.1480525452.git.mariano.lopez@linux.intel.com>
X-Mailer: git-send-email 2.7.3
In-Reply-To: <cover.1480525452.git.mariano.lopez@linux.intel.com>
References: <cover.1480525452.git.mariano.lopez@linux.intel.com>
In-Reply-To: <cover.1480525452.git.mariano.lopez@linux.intel.com>
References: <cover.1480525452.git.mariano.lopez@linux.intel.com>
Subject: [PATCHv2 2/3] oeqa/utils/metadata.py: Add metadata library
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
X-List-Received-Date: Thu, 01 Dec 2016 15:37:35 -0000

From: Mariano Lopez <mariano.lopez@linux.intel.com>

Adds functions to get metadata from the host running the tests.

[YOCTO #9954]

Signed-off-by: Mariano Lopez <mariano.lopez@linux.intel.com>
---
 meta/lib/oeqa/utils/metadata.py | 83 +++++++++++++++++++++++++++++++++++++++++
 1 file changed, 83 insertions(+)
 create mode 100644 meta/lib/oeqa/utils/metadata.py

diff --git a/meta/lib/oeqa/utils/metadata.py b/meta/lib/oeqa/utils/metadata.py
new file mode 100644
index 0000000..ecbe763
--- /dev/null
+++ b/meta/lib/oeqa/utils/metadata.py
@@ -0,0 +1,83 @@
+# Copyright (C) 2016 Intel Corporation
+#
+# Released under the MIT license (see COPYING.MIT)
+#
+# Functions to get metadata from the testing host used
+# for analytics of test results.
+
+from git import Repo, InvalidGitRepositoryError, NoSuchPathError
+from collections import OrderedDict
+from collections.abc import MutableMapping
+from xml.dom.minidom import parseString
+from xml.etree.ElementTree import Element, tostring
+
+from oe.lsb import distro_identifier
+from oeqa.utils.commands import runCmd, get_bb_var, get_bb_vars
+
+metadata_vars = ['MACHINE', 'DISTRO', 'DISTRO_VERSION']
+
+def metadata_from_bb():
+    """ Returns test's metadata as OrderedDict.
+
+        Data will be gathered using bitbake -e thanks to get_bb_vars.
+    """
+
+    info_dict = OrderedDict()
+    hostname = runCmd('hostname')
+    info_dict['hostname'] = hostname.output
+    data_dict = get_bb_vars(metadata_vars)
+    for var in metadata_vars:
+        info_dict[var.lower()] = data_dict[var]
+    host_distro= distro_identifier()
+    host_distro, _, host_distro_release = host_distro.partition('-')
+    info_dict['host_distro'] = host_distro
+    info_dict['host_distro_release'] = host_distro_release
+    info_dict['layers'] = get_layers(get_bb_var('BBLAYERS'))
+    return info_dict
+
+def metadata_from_data_store(d):
+    """ Returns test's metadata as OrderedDict.
+
+        Data will be collected from the provided data store.
+    """
+    # TODO: Getting metadata from the data store would
+    # be useful when running within bitbake.
+    pass
+
+def get_layers(layers):
+    """ Returns layer name, branch, and revision as OrderedDict. """
+
+    layer_dict = OrderedDict()
+    for layer in layers.split():
+        layer_name = os.path.basename(layer)
+        layer_dict[layer_name] = OrderedDict()
+        try:
+            repo = Repo(layer, search_parent_directories=True)
+            revision, branch = repo.head.object.name_rev.split()
+            layer_dict[layer_name]['branch'] = branch
+            layer_dict[layer_name]['revision'] = revision
+        except (InvalidGitRepositoryError, NoSuchPathError):
+            layer_dict[layer_name]['branch'] = 'unknown'
+            layer_dict[layer_name]['revision'] = 'unknown'
+    return layer_dict
+
+def write_metadata_file(file_path, metadata):
+    """ Writes metadata to a XML file in directory. """
+
+    xml = dict_to_XML('metadata', metadata)
+    xml_doc = parseString(tostring(xml).decode('UTF-8'))
+    with open(file_path, 'w') as f:
+        f.write(xml_doc.toprettyxml())
+
+def dict_to_XML(tag, dictionary):
+    """ Return XML element converting dicts recursively. """
+
+    elem = Element(tag)
+    for key, val in dictionary.items():
+        if isinstance(val, MutableMapping):
+            child = (dict_to_XML(key, val))
+        else:
+            child = Element(key)
+            child.text = str(val)
+        elem.append(child)
+    return elem
-- 
2.7.3


