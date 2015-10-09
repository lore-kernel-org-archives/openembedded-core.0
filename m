Return-Path: <jussi.kukkonen@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id DA4A373CBD
	for <openembedded-core@lists.openembedded.org>;
	Fri,  9 Oct 2015 12:21:41 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga101.jf.intel.com with ESMTP; 09 Oct 2015 05:21:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.17,657,1437462000"; d="scan'208";a="577285913"
Received: from theory.fi.intel.com ([10.237.72.196])
	by FMSMGA003.fm.intel.com with ESMTP; 09 Oct 2015 05:18:03 -0700
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  9 Oct 2015 15:20:36 +0300
Message-Id: <cover.1444392901.git.jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH 0/1] Solving the GTK+ libgl runtime dependency issue
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
X-List-Received-Date: Fri, 09 Oct 2015 12:21:43 -0000


Recap of the situation as I understand it:
* Gtk+3 works fine without any OpenGL, if GtkGLArea is not used
* When GtkGLArea is used, Gtk+ uses libepoxy which is supposed
  dlopen the correct libraries as they are needed
* Gtk+ can only handle desktop GL at the moment (GdkGLContext
  does not have a GLES profile), so epoxy ends up dlopening
  libGL.so.1

With this in mind I think the right solution is that applications that
use OpenGL in a GtkGLArea must depend on a gl implementation (currently
only libgl works).

I am sending a patch that makes gtk3-demo RDEPEND on libgl.


 - Jussi



The following changes since commit ceeb52a2544045fe8432e36307a321f6e934de49:

  linux-yocto: Update SRCREV for genericx86* BSPs (2015-10-07 00:36:47 +0100)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib jku/gtk-gl
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=jku/gtk-gl

Jussi Kukkonen (1):
  gtk+3: gtk3-demo needs libgl

 meta/recipes-gnome/gtk+/gtk+3.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

-- 
2.1.4


