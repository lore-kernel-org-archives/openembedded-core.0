Return-Path: <jussi.kukkonen@intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id D8432770E0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Oct 2015 13:23:10 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga103.fm.intel.com with ESMTP; 21 Oct 2015 06:22:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.17,712,1437462000"; d="scan'208";a="832128600"
Received: from theory.fi.intel.com ([10.237.72.196])
	by fmsmga002.fm.intel.com with ESMTP; 21 Oct 2015 06:22:34 -0700
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 21 Oct 2015 16:25:22 +0300
Message-Id: <cover.1445432850.git.jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH v2 0/1] Fix Gtk+3 initialization without GLX
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
X-List-Received-Date: Wed, 21 Oct 2015 13:23:11 -0000

Following patch should fix the issue of Gtk+3 applications exiting
when started in systems without libGL.so.1. The issue needs to be
solved with upstreams (epoxy, possibly Gtk) in future releases but
for 2.0 this should do it.

Applications that might use GtkGLArea (like gtk3-demo) do not need to
RDEPEND on libgl as gtk now does that when distro features allow: this
way they can be installed without libgl. Actually using GLArea still
results in exit if libgl is not present: in gtk3-demo this happens if
the glarea-demo is selected. 

Jussi


The following changes since commit 556c0ea92eb32ddb9c9a5e30a74b2ca24ac69c68:

  lib/oe/image.py: Fix dependency handling for compressed types (2015-10-14 18:08:37 +0300)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib jku/gtk-gl-again
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=jku/gtk-gl-again

Jussi Kukkonen (1):
  gtk+3: Do not try to initialize GL without libgl

 meta/recipes-gnome/gtk+/gtk+3.inc                  |  4 +-
 ...Do-not-try-to-initialize-GL-without-libGL.patch | 60 ++++++++++++++++++++++
 meta/recipes-gnome/gtk+/gtk+3_3.16.6.bb            |  1 +
 3 files changed, 64 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-gnome/gtk+/gtk+3/Do-not-try-to-initialize-GL-without-libGL.patch

-- 
2.1.4


