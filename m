Return-Path: <jussi.kukkonen@intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 502A560767
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Mar 2016 08:58:34 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga103.fm.intel.com with ESMTP; 23 Mar 2016 01:58:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.24,381,1455004800"; d="scan'208";a="939797696"
Received: from theory.fi.intel.com ([10.237.72.196])
	by orsmga002.jf.intel.com with ESMTP; 23 Mar 2016 01:58:34 -0700
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 23 Mar 2016 10:58:26 +0200
Message-Id: <cover.1458723078.git.jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCHv2 0/3] Create GIO module cache on postinst/rm
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
X-List-Received-Date: Wed, 23 Mar 2016 08:58:36 -0000

Branch updated. Changes since v1:
* Fix whitespace issues
* Install gio-querymodules in $libexec (to placate debian renamer)
* Make binary name unique per multilib ("${mlprefix}gio-querymodules")
* Add a patch to fix odd file placemements in glib.inc

Please take a look at the multilib binary install: I couldn't find an
example of that so added the bit in do_install_append() -- maybe
there's a nicer way to do that?


Original cover letter:

GIO module cache is used by GIO at runtime to avoid opening all modules
just to find out which extension points they implement. The patch
uses gio-querymodules tool to regenerate the cache at postinst/postrm.

So nothing is really broken currently, this is a runtime optimization.

Cheers,
  Jussi


The following changes since commit 8037ba4d86a65ee296cfdcee736dfd614c568818:

  bitbake: bb/tests/fetch: Update cups url (2016-03-21 12:43:12 +0000)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib jku/gio-module-cache
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=jku/gio-module-cache

Jussi Kukkonen (3):
  glib-2.0: Install gio-querymodules in main package
  gio-module-cache: Add class for Gio modules
  glib-2.0: Fix packaging

 meta/classes/gio-module-cache.bbclass              | 37 ++++++++++++++++++++++
 ...stall-gio-querymodules-as-libexec_PROGRAM.patch | 31 ++++++++++++++++++
 meta/recipes-core/glib-2.0/glib-2.0_2.46.2.bb      |  1 +
 meta/recipes-core/glib-2.0/glib.inc                | 29 +++++++++++++----
 .../glib-networking/glib-networking_2.46.1.bb      |  2 +-
 meta/recipes-gnome/gnome/gconf_3.2.6.bb            |  2 +-
 .../postinst-intercepts/update_gio_module_cache    |  7 ++++
 7 files changed, 100 insertions(+), 9 deletions(-)
 create mode 100644 meta/classes/gio-module-cache.bbclass
 create mode 100644 meta/recipes-core/glib-2.0/glib-2.0/0001-Install-gio-querymodules-as-libexec_PROGRAM.patch
 create mode 100644 scripts/postinst-intercepts/update_gio_module_cache

-- 
2.1.4


