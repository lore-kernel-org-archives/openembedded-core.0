Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <tom.zanussi@intel.com>) id 1UPENI-0003MN-D7
	for openembedded-core@lists.openembedded.org;
	Mon, 08 Apr 2013 17:52:56 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 08 Apr 2013 08:33:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,432,1363158000"; d="scan'208";a="291784539"
Received: from unknown (HELO localhost) ([10.255.14.40])
	by orsmga001.jf.intel.com with ESMTP; 08 Apr 2013 08:35:32 -0700
From: tom.zanussi@linux.intel.com
To: openembedded-core@lists.openembedded.org
Date: Mon,  8 Apr 2013 10:35:31 -0500
Message-Id: <6c2bbc018bd4e14e203c1e33b8bea5a3b6bc3a65.1365432708.git.tom.zanussi@linux.intel.com>
X-Mailer: git-send-email 1.7.11.4
In-Reply-To: <cover.1365432708.git.tom.zanussi@linux.intel.com>
References: <cover.1365432708.git.tom.zanussi@linux.intel.com>
Cc: Tom Zanussi <tom.zanussi@linux.intel.com>
Subject: [PATCH 1/1] gst-ffmpeg: fix --disable-yasm
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 08 Apr 2013 15:52:56 -0000
X-List-Received-Date: Mon, 08 Apr 2013 15:52:56 -0000

From: Tom Zanussi <tom.zanussi@linux.intel.com>

The gst-ffmpeg build shows the following warning:

configure: WARNING: unrecognized options: --disable-yasm

which means that the following test in configure always fails and
--disable-yasm never gets passed to the embedded ffmpeg build:

'if test "x$disable_yasm" = "xyes"; then'
  embffmpeg_configure_args="$embffmpeg_configure_args --disable-yasm"

commit 4d309730 ['gst-ffmpeg: configure-fix patch used wrong test']
actually fixed the obviously backwards syntax by reversing the test -
prior to that, --disable-yasm would always unconditionally be passed
into the embedded ffmpeg config.

This fixes things so that the variable actually exists and makes the
test meaningful.

Signed-off-by: Tom Zanussi <tom.zanussi@linux.intel.com>
---
 .../gstreamer/gst-ffmpeg-0.10.13/configure-fix.patch                | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-multimedia/gstreamer/gst-ffmpeg-0.10.13/configure-fix.patch b/meta/recipes-multimedia/gstreamer/gst-ffmpeg-0.10.13/configure-fix.patch
index 2bb124b..9ef6f7c 100644
--- a/meta/recipes-multimedia/gstreamer/gst-ffmpeg-0.10.13/configure-fix.patch
+++ b/meta/recipes-multimedia/gstreamer/gst-ffmpeg-0.10.13/configure-fix.patch
@@ -7,11 +7,13 @@ Signed-off-by: Shane Wang <shane.wang@intel.com>
 diff -r f2f8f74c6e30 configure.ac
 --- a/configure.ac	Thu Dec 22 23:56:09 2011 +0800
 +++ b/configure.ac	Thu Dec 22 23:57:37 2011 +0800
-@@ -325,6 +325,10 @@
+@@ -325,6 +325,12 @@
          --enable-gpl"
    fi
  
-+  if test "x$disable_yasm" = "xyes"; then
++ AC_ARG_ENABLE(yasm,
++              [AC_HELP_STRING([--disable-yasm], [disable use of yasm assembler])])
++  if test "x$enable_yasm" = "xno"; then
 +    embffmpeg_configure_args="$embffmpeg_configure_args --disable-yasm"
 +  fi
 +
-- 
1.7.11.4



