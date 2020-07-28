Received: from mga07.intel.com (mga07.intel.com [])
 by mx.groups.io with SMTP id smtpd.web12.8252.1595926408928178289
 for <openembedded-core@lists.openembedded.org>;
 Tue, 28 Jul 2020 01:53:33 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: intel.com, ip: <nil>, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: FBsotO/rffrFlEQKtKiJlkykiPb7qEly+GHYZtcVFg4yf7bNzgNxij37rbVOqL6GSxi8xXj2MW
 jeYCybyhAvpw==
X-IronPort-AV: E=McAfee;i="6000,8403,9695"; a="215699811"
X-IronPort-AV: E=Sophos;i="5.75,405,1589266800"; 
   d="scan'208";a="215699811"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jul 2020 01:53:32 -0700
IronPort-SDR: jQ/6Vcg7VB6OTmB65C9N2Irb/XjHLCgCjKawQBt7v6rJw6G2GgH57PsxOsP2BQVWqpUhEEHdw0
 Xg5wKXIXPCBQ==
X-IronPort-AV: E=Sophos;i="5.75,405,1589266800"; 
   d="scan'208";a="434245993"
Received: from unknown (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.255.137.161])
  by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jul 2020 01:53:31 -0700
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [zeus][PATCH 32/32] gstreamer1.0: fix builds with make 4.3
Date: Tue, 28 Jul 2020 16:51:33 +0800
Message-Id: <74e22d0d2b61d0014f408972725469bb7a024622.1595924916.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.25.4
In-Reply-To: <cover.1595924916.git.anuj.mittal@intel.com>
References: <cover.1595924916.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Depend on make-native instead of using host make to avoid errors like:

| controller-enumtypes.c:10:1: error: stray '\' in program
|    10 | \#include "gstinterpolationcontrolsource.h"
|       | ^
| controller-enumtypes.c:10:2: error: stray '#' in program
|    10 | \#include "gstinterpolationcontrolsource.h"
|       |  ^
| controller-enumtypes.c:10:11: error: expected '=', ',', ';', 'asm' or '__attribute__' before string constant
|    10 | \#include "gstinterpolationcontrolsource.h"
|       |           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| controller-enumtypes.c:11:1: error: stray '\' in program
|    11 | \#include "gstlfocontrolsource.h"
|       | ^
| controller-enumtypes.c:11:2: error: stray '#' in program
|    11 | \#include "gstlfocontrolsource.h"

This helps building on autobuilder where some workers have buildtools
with make 4.3 installed.

Building using meson works fine so later branches are not affected and
upstream has rejected patches to fix this:

https://gitlab.freedesktop.org/gstreamer/gstreamer/-/issues/515

Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins.inc      | 2 +-
 .../gstreamer/gstreamer1.0-rtsp-server_1.16.2.bb                | 2 +-
 meta/recipes-multimedia/gstreamer/gstreamer1.0_1.16.2.bb        | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins.inc b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins.inc
index bc24b05fec..92b473add6 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins.inc
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins.inc
@@ -3,7 +3,7 @@ HOMEPAGE = "http://gstreamer.freedesktop.org/"
 BUGTRACKER = "https://bugzilla.gnome.org/enter_bug.cgi?product=Gstreamer"
 SECTION = "multimedia"
 
-DEPENDS = "gstreamer1.0 glib-2.0-native"
+DEPENDS = "gstreamer1.0 glib-2.0-native make-native"
 
 SRC_URI_append = " file://gtk-doc-tweaks.patch"
 
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.16.2.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.16.2.bb
index 15ef5d1b28..b7470b0047 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.16.2.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.16.2.bb
@@ -4,7 +4,7 @@ SECTION = "multimedia"
 LICENSE = "LGPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6762ed442b3822387a51c92d928ead0d"
 
-DEPENDS = "gstreamer1.0 gstreamer1.0-plugins-base"
+DEPENDS = "gstreamer1.0 gstreamer1.0-plugins-base make-native"
 
 PNREAL = "gst-rtsp-server"
 
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.16.2.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.16.2.bb
index cf7c1bca12..96a6ade22b 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.16.2.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.16.2.bb
@@ -6,7 +6,7 @@ BUGTRACKER = "https://bugzilla.gnome.org/enter_bug.cgi?product=Gstreamer"
 SECTION = "multimedia"
 LICENSE = "LGPLv2+"
 
-DEPENDS = "glib-2.0 glib-2.0-native libcap libxml2 bison-native flex-native"
+DEPENDS = "glib-2.0 glib-2.0-native libcap libxml2 bison-native flex-native make-native"
 
 inherit autotools pkgconfig gettext upstream-version-is-even gobject-introspection gtk-doc ptest
 
-- 
2.25.4

