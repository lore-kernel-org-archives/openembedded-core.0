Return-Path: <jussi.kukkonen@intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 6271A601D4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Apr 2016 11:08:06 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga103.fm.intel.com with ESMTP; 11 Apr 2016 04:08:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.24,462,1455004800"; d="scan'208";a="952450161"
Received: from theory.fi.intel.com ([10.237.72.196])
	by orsmga002.jf.intel.com with ESMTP; 11 Apr 2016 04:08:04 -0700
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: openembedded-core@lists.openembedded.org,
	gary@mlbassoc.com
Date: Mon, 11 Apr 2016 14:07:52 +0300
Message-Id: <1460372872-7074-1-git-send-email-jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH] glib-2.0: Put glib-compile-schemas back in -utils
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
X-List-Received-Date: Mon, 11 Apr 2016 11:08:07 -0000

Commit cc97d576 moved a bunch of development tools to the -dev
package. glib-compile-schemas is actually used in postinst by
gsettings.bbclass so it needs to be available on target at package
install time: Move the tool back to glib-2.0-utils which
gsettings.bbclass depends on.

Fixes [YOCTO #9431].

Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
---

I also reviewed again the other tools that were moved in cc97d576:
this one seems like the only one that is needed at postinst.

Possibly glib-compile-schemas should be installed with the library
(like qio-querymodules now is) but I'd rather not do that at this
point in the release as it would mean other changes like moving
the binary install location.

This commit is also available in the git repository at:

  git://git.yoctoproject.org/poky-contrib jku/glib-compile-schemas


 meta/recipes-core/glib-2.0/glib.inc | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta/recipes-core/glib-2.0/glib.inc b/meta/recipes-core/glib-2.0/glib.inc
index 3a03191..e764fad 100644
--- a/meta/recipes-core/glib-2.0/glib.inc
+++ b/meta/recipes-core/glib-2.0/glib.inc
@@ -57,7 +57,6 @@ FILES_${PN}-dev += "${libdir}/glib-2.0/include \
                     ${bindir}/glib-genmarshal \
                     ${bindir}/glib-gettextize \
                     ${bindir}/glib-mkenums \
-                    ${bindir}/glib-compile-schemas \
                     ${bindir}/glib-compile-resources \
                     ${datadir}/glib-2.0/gettext/po/Makefile.in.in \
                     ${datadir}/glib-2.0/schemas/gschema.dtd"
-- 
2.1.4


