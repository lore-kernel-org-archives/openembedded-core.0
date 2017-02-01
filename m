Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	by mail.openembedded.org (Postfix) with ESMTP id D131D77272
	for <openembedded-core@lists.openembedded.org>;
	Wed,  1 Feb 2017 14:11:21 +0000 (UTC)
Received: from orsmga004.jf.intel.com ([10.7.209.38])
	by orsmga104.jf.intel.com with ESMTP; 01 Feb 2017 06:11:22 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,320,1477983600"; d="scan'208";a="54393977"
Received: from linux.intel.com ([10.54.29.200])
	by orsmga004.jf.intel.com with ESMTP; 01 Feb 2017 06:11:22 -0800
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.38])
	by linux.intel.com (Postfix) with ESMTP id 5072E6A4006
	for <openembedded-core@lists.openembedded.org>;
	Wed,  1 Feb 2017 06:10:23 -0800 (PST)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  1 Feb 2017 15:48:10 +0200
Message-Id: <e14d8c02fff4934a90936525b2a8d73adbc46c93.1485953483.git.ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1485953483.git.ed.bartosh@linux.intel.com>
References: <cover.1485953483.git.ed.bartosh@linux.intel.com>
Subject: [PATCH 03/18] wic: removed conf.py and empty config file.
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
X-List-Received-Date: Wed, 01 Feb 2017 14:11:22 -0000

Removed as they're not used anymore in wic code.

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
---
 scripts/lib/wic/conf.py         | 103 ----------------------------------------
 scripts/lib/wic/config/wic.conf |   6 ---
 2 files changed, 109 deletions(-)
 delete mode 100644 scripts/lib/wic/conf.py
 delete mode 100644 scripts/lib/wic/config/wic.conf

diff --git a/scripts/lib/wic/conf.py b/scripts/lib/wic/conf.py
deleted file mode 100644
index 070ec30..0000000
--- a/scripts/lib/wic/conf.py
+++ /dev/null
@@ -1,103 +0,0 @@
-#!/usr/bin/env python -tt
-#
-# Copyright (c) 2011 Intel, Inc.
-#
-# This program is free software; you can redistribute it and/or modify it
-# under the terms of the GNU General Public License as published by the Free
-# Software Foundation; version 2 of the License
-#
-# This program is distributed in the hope that it will be useful, but
-# WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY
-# or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License
-# for more details.
-#
-# You should have received a copy of the GNU General Public License along
-# with this program; if not, write to the Free Software Foundation, Inc., 59
-# Temple Place - Suite 330, Boston, MA 02111-1307, USA.
-
-import os
-
-from wic.ksparser import KickStart, KickStartError
-from wic import msger
-from wic.utils import misc
-
-
-def get_siteconf():
-    wic_path = os.path.dirname(__file__)
-    eos = wic_path.find('scripts') + len('scripts')
-    scripts_path = wic_path[:eos]
-
-    return scripts_path + "/lib/image/config/wic.conf"
-
-class ConfigMgr(object):
-    DEFAULTS = {
-        'common': {
-            "distro_name": "Default Distribution",
-            "plugin_dir": "/usr/lib/wic/plugins"}, # TODO use prefix also?
-        'create': {
-            "tmpdir": '/var/tmp/wic',
-            "outdir": './wic-output',
-            "release": None,
-            "logfile": None,
-            "name_prefix": None,
-            "name_suffix": None}
-        }
-
-    # make the manager class as singleton
-    _instance = None
-    def __new__(cls, *args, **kwargs):
-        if not cls._instance:
-            cls._instance = super(ConfigMgr, cls).__new__(cls, *args, **kwargs)
-
-        return cls._instance
-
-    def __init__(self, ksconf=None, siteconf=None):
-        # reset config options
-        self.reset()
-
-        if not siteconf:
-            siteconf = get_siteconf()
-
-        # initial options from siteconf
-        self._siteconf = siteconf
-
-        if ksconf:
-            self._ksconf = ksconf
-
-    def reset(self):
-        self.__ksconf = None
-        self.__siteconf = None
-        self.create = {}
-
-        # initialize the values with defaults
-        for sec, vals in self.DEFAULTS.items():
-            setattr(self, sec, vals)
-
-    def __set_ksconf(self, ksconf):
-        if not os.path.isfile(ksconf):
-            msger.error('Cannot find ks file: %s' % ksconf)
-
-        self.__ksconf = ksconf
-        self._parse_kickstart(ksconf)
-    def __get_ksconf(self):
-        return self.__ksconf
-    _ksconf = property(__get_ksconf, __set_ksconf)
-
-    def _parse_kickstart(self, ksconf=None):
-        if not ksconf:
-            return
-
-        try:
-            ksobj = KickStart(ksconf)
-        except KickStartError as err:
-            msger.error(str(err))
-
-        self.create['ks'] = ksobj
-        self.create['name'] = os.path.splitext(os.path.basename(ksconf))[0]
-
-        self.create['name'] = misc.build_name(ksconf,
-                                              self.create['release'],
-                                              self.create['name_prefix'],
-                                              self.create['name_suffix'])
-
-configmgr = ConfigMgr()
diff --git a/scripts/lib/wic/config/wic.conf b/scripts/lib/wic/config/wic.conf
deleted file mode 100644
index a51bcb5..0000000
--- a/scripts/lib/wic/config/wic.conf
+++ /dev/null
@@ -1,6 +0,0 @@
-[common]
-; general settings
-distro_name = OpenEmbedded
-
-[create]
-; settings for create subcommand
-- 
2.1.4


