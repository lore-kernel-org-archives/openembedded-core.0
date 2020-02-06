Return-Path: <anuj.mittal@intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 999606061B
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Feb 2020 07:53:41 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
	by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	05 Feb 2020 23:53:42 -0800
X-IronPort-AV: E=Sophos;i="5.70,408,1574150400"; d="scan'208";a="378997581"
Received: from anmitta2-mobl1.gar.corp.intel.com ([10.221.21.206])
	by orsmga004-auth.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	05 Feb 2020 23:53:41 -0800
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  6 Feb 2020 15:53:34 +0800
Message-Id: <20200206075334.835418-1-anuj.mittal@intel.com>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
Subject: [PATCH] gstreamer1.0-plugins-good: change EXTRA_OECONF -> EXTRA_OEMESON
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
X-List-Received-Date: Thu, 06 Feb 2020 07:53:41 -0000
Content-Transfer-Encoding: 8bit

Use the correct variable so options actually get used.

qt5 support is currently automagically detected with meson and having an
explicit disabled doesn't do anything. Remove it so it can be handled
in qt layer with appropriate DEPENDS added.

Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 .../gstreamer/gstreamer1.0-plugins-good_1.16.1.bb          | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.16.1.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.16.1.bb
index a6eb9986dd..e78162172a 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.16.1.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.16.1.bb
@@ -50,12 +50,12 @@ PACKAGECONFIG[vpx]        = "-Dvpx=enabled,-Dvpx=disabled,libvpx"
 PACKAGECONFIG[wavpack]    = "-Dwavpack=enabled,-Dwavpack=disabled,wavpack"
 PACKAGECONFIG[x11]        = "${X11ENABLEOPTS},${X11DISABLEOPTS},${X11DEPENDS}"
 
-# qt5 support is disabled, because it is not present in OE core, and requires more work than
-# just adding a packageconfig (it requires access to moc, uic, rcc, and qmake paths).
+# qt5 support is disabled by default unless dependencies are present. Enabling it requires
+# more work than just adding a packageconfig (it requires access to moc, uic, rcc, and qmake paths).
 # This is better done in a separate qt5 layer (which then should add a "qt5" packageconfig
 # in a gstreamer1.0-plugins-good bbappend).
 
-EXTRA_OECONF += " \
+EXTRA_OEMESON += " \
     -Daalib=disabled \
     -Ddirectsound=disabled \
     -Ddv=disabled \
@@ -64,7 +64,6 @@ EXTRA_OECONF += " \
     -Doss4=disabled \
     -Dosxaudio=disabled \
     -Dosxvideo=disabled \
-    -Dqt=disabled \
     -Dshout2=disabled \
     -Dtwolame=disabled \
     -Dwaveform=disabled \
-- 
2.24.1


