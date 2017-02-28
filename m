Return-Path: <jussi.kukkonen@intel.com>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by mail.openembedded.org (Postfix) with ESMTP id B2D3A72F6E
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Feb 2017 09:26:53 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga105.jf.intel.com with ESMTP; 28 Feb 2017 01:26:54 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.35,218,1484035200"; d="scan'208";a="53860285"
Received: from linux.intel.com ([10.54.29.200])
	by orsmga002.jf.intel.com with ESMTP; 28 Feb 2017 01:26:54 -0800
Received: from theory.fi.intel.com (theory.fi.intel.com [10.237.72.53])
	by linux.intel.com (Postfix) with ESMTP id 8785E6A4080;
	Tue, 28 Feb 2017 01:26:52 -0800 (PST)
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 28 Feb 2017 11:26:47 +0200
Message-Id: <cover.1488272553.git.jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH v2 0/6] wayland, mesa upgrades + bonus vulkan
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
X-List-Received-Date: Tue, 28 Feb 2017 09:26:54 -0000

Several small changes since V1:
* vulkan: Added a file to LIC_FILES_CHECKSUM
* vulkan: Added upstream-status to patch
* vkcube: Fixed version to 0.1
* weston: Fixed the packaging bug I introduced (weston-xwayland
  package should only be created if the feature is on. Note that
  dropping PACKAGE_BEFORE_PN is fine: contents stay the same) 


Original V1 cover letter follows:

These patches are in one set because the vulkan bits need both new
weston and mesa, but please treat them as 3 groups for merge decision:

** Wayland, Weston upgrade:
Fairly standard upgrades. Weston now has a library package.

** Mesa upgrade:
This is a resend of an earlier patch: it is labeled a development
release (I expect 17.0.1 in about a week but no guarantees of course).
Only change since previous send is the xvmcsoftpipe removal.
We will be fine with mesa 13 as well (it's only 4 months old) but I'm
resending this as 17 seems good to me _and_ it enables the next 3
patches...

** Vulkan (3 last patches):
I'm not sure how much interest for vulkan in oe-core there is but now
that it's possible, here are my patches for that (obviously only the
mesa one really needs to be in oe-core). Some notes:
  - xf86-video-intel has dri3 disabled at runtime by default so
    vulkan won't run out of the box on X based images
  - Building the radeon driver needs llvm 3.9: I did not try to enable
  - vkcube build requires the intel driver at the moment. I believe this
    is fixable for someone familiar with vulkan

There's no vulkan distro feature yet so some assembly is required:
  # vulkan test settings for local.conf:
  PACKAGECONFIG_append_pn-mesa = "vulkan dri3"
  IMAGE_INSTALL_append = "vkcube vulkan-bin mesa-vulkan-drivers"
  XSERVER_remove = "xf86-video-intel" # only if using X
Now 'vkcube' and 'vulkaninfo' should provide entertainment.

Cheers,
  Jussi



The following changes since commit 3c83b56309ab419f8cda72c0711479f60f61439a:

  bitbake: fetch2/svn: change 'rsh' parameter to 'ssh' (2017-02-23 12:50:17 -0800)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib jku/vulkan
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=jku/vulkan

Jussi Kukkonen (6):
  wayland: Upgrade 1.12.0 -> 1.13.0
  weston: Upgrade 1.11.1 -> 2.0.0, separate libweston
  mesa: Upgrade 13.0.4 -> 17.0.0
  mesa: Enable vulkan driver for intel
  vulkan: Add recipe for Vulkan common loader
  vkcube: Add recipe for minimal vulkan demo

 .../mesa/{mesa-gl_13.0.4.bb => mesa-gl_17.0.0.bb}  |   0
 meta/recipes-graphics/mesa/mesa.inc                |  20 ++--
 .../mesa/{mesa_13.0.4.bb => mesa_17.0.0.bb}        |   7 +-
 .../vkcube/0001-Install-the-vkcube-binary.patch    |  38 +++++++
 meta/recipes-graphics/vulkan/vkcube_git.bb         |  18 ++++
 .../vulkan/demos-Don-t-build-tri-or-cube.patch     | 106 +++++++++++++++++++
 meta/recipes-graphics/vulkan/vulkan_1.0.39.1.bb    |  33 ++++++
 .../{wayland_1.12.0.bb => wayland_1.13.0.bb}       |   4 +-
 ...-configuration-option-for-no-input-device.patch | 112 ---------------------
 ...1-configure.ac-Fix-wayland-protocols-path.patch |   2 +-
 .../wayland/weston/0001-make-error-portable.patch  |  12 +--
 .../0001-shared-include-stdint.h-for-int32_t.patch |  23 -----
 ...ch-Provide-a-default-version-that-doesn-t.patch |  52 ++++++----
 .../wayland/{weston_1.11.1.bb => weston_2.0.0.bb}  |  21 ++--
 14 files changed, 256 insertions(+), 192 deletions(-)
 rename meta/recipes-graphics/mesa/{mesa-gl_13.0.4.bb => mesa-gl_17.0.0.bb} (100%)
 rename meta/recipes-graphics/mesa/{mesa_13.0.4.bb => mesa_17.0.0.bb} (74%)
 create mode 100644 meta/recipes-graphics/vulkan/vkcube/0001-Install-the-vkcube-binary.patch
 create mode 100644 meta/recipes-graphics/vulkan/vkcube_git.bb
 create mode 100644 meta/recipes-graphics/vulkan/vulkan/demos-Don-t-build-tri-or-cube.patch
 create mode 100644 meta/recipes-graphics/vulkan/vulkan_1.0.39.1.bb
 rename meta/recipes-graphics/wayland/{wayland_1.12.0.bb => wayland_1.13.0.bb} (92%)
 delete mode 100644 meta/recipes-graphics/wayland/weston/0001-Add-configuration-option-for-no-input-device.patch
 delete mode 100644 meta/recipes-graphics/wayland/weston/0001-shared-include-stdint.h-for-int32_t.patch
 rename meta/recipes-graphics/wayland/{weston_1.11.1.bb => weston_2.0.0.bb} (88%)

-- 
2.1.4


