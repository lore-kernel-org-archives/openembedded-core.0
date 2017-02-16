Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by mail.openembedded.org (Postfix) with ESMTP id 6FCD06010D
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Feb 2017 15:56:09 +0000 (UTC)
Received: from orsmga005.jf.intel.com ([10.7.209.41])
	by orsmga105.jf.intel.com with ESMTP; 16 Feb 2017 07:56:09 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.35,169,1484035200"; d="scan'208";a="65501160"
Received: from linux.intel.com ([10.54.29.200])
	by orsmga005.jf.intel.com with ESMTP; 16 Feb 2017 07:56:09 -0800
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.38])
	by linux.intel.com (Postfix) with ESMTP id EA1DA6A4080
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Feb 2017 07:56:08 -0800 (PST)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 16 Feb 2017 17:33:27 +0200
Message-Id: <cover.1487257345.git.ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH 00/10] #10619: wic refactoring (done)
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
X-List-Received-Date: Thu, 16 Feb 2017 15:56:10 -0000

Hi,

This patchset contains refactoring of wic plugin system. It hopefully
makes the code more understandable and easier to read and maintain.
It reduced plugin system API to only one call: get_plugins, speed up
the system by using lazy evaluation of plugin info, shortened the code
and moved it to one module.

This is a last patchset of wic refactoring series. Although there are still
some places in wic code that I'd like to optimize, I decided to stop here.
The code looks more maintainable for me now and even though I want to make it
much better I have other tasks to do and important bugs to fix.

Just in case anybody is interested in continuing to refactor wic code I can point
out to the areas that still require refactoring from my point of view:
- make use of ArgumentParser: bug #9636
- refactor engine.py and help.py
- replace plugin code that configures bootloaders with using configuration
  files (--configfile .wks option)
- refactor source plugins
- get rid of custom runner module in favor of using subprocess
- move the rest of code from utils/ subdirectory to lib/wic/utils.py

The following changes since commit e4e061bbdadce3f4fe420768bb132f6aac5fca56:

  wic: move WicError to lib/wic/__init__.py (2017-02-16 13:24:03 +0200)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib ed/wic/wip
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=ed/wic/wip

Ed Bartosh (10):
  wic: use PluginMgr directly
  wic: remove PluginMgr.get_source_plugins
  wic: reimplement PluginMgr.get_plugin_methods
  wic: reimplement PluginMgr.get_plugins
  wic: pluginbase: use python 3 metaclass syntax
  wic: throw exception if required API is not implemented
  wic: remove PluginMgr.get_plugin_methods
  wic: plugin: cache results in get_plugins
  wic: move PluginMgr class to pluginbase
  wic: pluginbase: use global dictionary

 scripts/lib/wic/engine.py                |   6 +-
 scripts/lib/wic/help.py                  |  11 +--
 scripts/lib/wic/partition.py             |  27 ++----
 scripts/lib/wic/plugin.py                | 151 -------------------------------
 scripts/lib/wic/pluginbase.py            |  59 ++++++++++--
 scripts/lib/wic/plugins/imager/direct.py |  13 +--
 6 files changed, 73 insertions(+), 194 deletions(-)
 delete mode 100644 scripts/lib/wic/plugin.py

-- 
Regards,
Ed


