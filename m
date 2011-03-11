Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1Pxrz5-0006tD-66
	for openembedded-core@lists.openembedded.org;
	Fri, 11 Mar 2011 03:21:43 +0100
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 10 Mar 2011 18:20:05 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.62,300,1297065600"; d="scan'208";a="611595919"
Received: from unknown (HELO localhost) ([10.255.17.57])
	by orsmga002.jf.intel.com with ESMTP; 10 Mar 2011 18:20:01 -0800
Message-Id: <d0eec987d5e29ed61505d591a34c3a18a90d20b2.1299809859.git.sgw@linux.intel.com>
In-Reply-To: <cover.1299809859.git.sgw@linux.intel.com>
References: <cover.1299809859.git.sgw@linux.intel.com>
Old-Date: Wed, 9 Mar 2011 01:29:37 +0000
Date: Thu, 10 Mar 2011 18:19:59 -0800
To: poky@yoctoproject.org,openembedded-core@lists.openembedded.org
From: Saul Wold <sgw@linux.intel.com>
Cc: Bruce Ashfield <bruce.ashfield@windriver.com>,
	Paul Eggleton <paul.eggleton@linux.intel.com>
Subject: [PATCH 01/12] gst-plugins-good: remove dependency on hal
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 11 Mar 2011 02:21:43 -0000

From: Paul Eggleton <paul.eggleton@linux.intel.com>

On Tuesday 08 March 2011 18:55:44 Richard Purdie wrote:
> > Saul Wold (3):
> >   gst-plugins: Added hal to DEPENDS
> >   attr: Added ncurses to depends
> >   lsb-live image: add lsb-live and lsb-sdk-live image types
>
> Merged. I'd like to drop the hal dependency if someone can send me a
> patch which disables it and everything works.

Patch attached to do this (against oe-core) .

Cheers,
Paul

From d6f52ebf89e8413f8e24bbc9ab58a0d0e5c45c09 Mon Sep 17 00:00:00 2001
From: Paul Eggleton <paul.eggleton@linux.intel.com>
Date: Wed, 9 Mar 2011 01:21:25 +0000
Subject: [PATCH] gst-plugins-good: remove dependency on hal

Disable hal usage at configure time to avoid dependency on hal (which is
deprecated). Only affects "halelements" which is of no use without hal.

Fixes [YOCTO #810] and reverts changes from c6b0c5720fa.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 .../gstreamer/gst-plugins-good_0.10.26.bb          |    4 ++--
 meta/recipes-multimedia/gstreamer/gst-plugins.inc  |    2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-multimedia/gstreamer/gst-plugins-good_0.10.26.bb b/meta/recipes-multimedia/gstreamer/gst-plugins-good_0.10.26.bb
index 78b24fe..ac47ecf 100644
--- a/meta/recipes-multimedia/gstreamer/gst-plugins-good_0.10.26.bb
+++ b/meta/recipes-multimedia/gstreamer/gst-plugins-good_0.10.26.bb
@@ -7,11 +7,11 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=a6f89e2100d9b6cdffcea4f398e37343 \
 
 DEPENDS += "gst-plugins-base gconf cairo jpeg libpng gtk+ zlib libid3tag flac \
 	    speex"
-PR = "r0"
+PR = "r1"
 
 inherit gettext
 
-EXTRA_OECONF += "--disable-aalib --disable-esd --disable-shout2 --disable-libcaca --without-check"
+EXTRA_OECONF += "--disable-aalib --disable-esd --disable-shout2 --disable-libcaca --disable-hal --without-check"
 
 do_configure_prepend() {
 	# This m4 file contains nastiness which conflicts with libtool 2.2.2
diff --git a/meta/recipes-multimedia/gstreamer/gst-plugins.inc b/meta/recipes-multimedia/gstreamer/gst-plugins.inc
index d1abd36..4edca95 100644
--- a/meta/recipes-multimedia/gstreamer/gst-plugins.inc
+++ b/meta/recipes-multimedia/gstreamer/gst-plugins.inc
@@ -3,7 +3,7 @@ HOMEPAGE = "http://gstreamer.freedesktop.org/"
 BUGTRACKER = "https://bugzilla.gnome.org/enter_bug.cgi?product=Gstreamer"
 SECTION = "multimedia"
 PRIORITY = "optional"
-DEPENDS = "gstreamer hal"
+DEPENDS = "gstreamer"
 
 inherit autotools pkgconfig
 
-- 
1.7.1.1



