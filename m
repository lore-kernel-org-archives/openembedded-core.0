Return-Path: <anuj.mittal@intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 1498C618F7
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Mar 2020 01:56:26 +0000 (UTC)
IronPort-SDR: jAYv9b+XxsmWfPwzpKIq840bmrsQoOEW9Ms1RJTmUiuMT6eRxJp2xP1710tyS2SzOBNJl+kCMX
	LGl81ms+NbiA==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
	by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
	19 Mar 2020 18:56:27 -0700
IronPort-SDR: oOUkEuryJOBQ6MDcs9RbmFMPXaggd5EbFhR44naGOvYKsouECRAeJu+45NeWqccLJOHKkbtIQK
	7MzNy3levTKw==
X-IronPort-AV: E=Sophos;i="5.72,282,1580803200"; d="scan'208";a="392001803"
Received: from anmitta2-mobl1.gar.corp.intel.com ([10.249.77.159])
	by orsmga004-auth.jf.intel.com with
	ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Mar 2020 18:56:26 -0700
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 20 Mar 2020 09:56:20 +0800
Message-Id: <20200320015620.125128-2-anuj.mittal@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200320015620.125128-1-anuj.mittal@intel.com>
References: <20200320015620.125128-1-anuj.mittal@intel.com>
MIME-Version: 1.0
Subject: [zeus][PATCH 2/2] screen: fix CVE-2020-9366
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
X-List-Received-Date: Fri, 20 Mar 2020 01:56:26 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 .../screen/screen/CVE-2020-9366.patch         | 48 +++++++++++++++++++
 meta/recipes-extended/screen/screen_4.6.2.bb  |  1 +
 2 files changed, 49 insertions(+)
 create mode 100644 meta/recipes-extended/screen/screen/CVE-2020-9366.patch

diff --git a/meta/recipes-extended/screen/screen/CVE-2020-9366.patch b/meta/recipes-extended/screen/screen/CVE-2020-9366.patch
new file mode 100644
index 0000000000..a52b9e6e68
--- /dev/null
+++ b/meta/recipes-extended/screen/screen/CVE-2020-9366.patch
@@ -0,0 +1,48 @@
+From 8ce90c1d3d5bece150479d8bc9303fd9d9f45e03 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?= <amade@asmblr.net>
+Date: Thu, 30 Jan 2020 17:56:27 +0100
+Subject: [PATCH] Fix out of bounds access when setting w_xtermosc after OSC 49
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+From: =?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?= <amade@asmblr.net>
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+echo -e "\e]49\e;                                    \n\ec"
+crashes screen.
+
+This happens because 49 is divided by 10 and used as table index
+resulting in access to w_xtermosc[4], which is out of bounds with table
+itself being size 4. Increase size of table by 1 to 5, which is enough
+for all current uses.
+
+As this overwrites memory based on user input it is potential security
+issue.
+
+Reported-by: pippin@gimp.org
+Signed-off-by: Amadeusz Sławiński <amade@asmblr.net>
+
+Upstream-Status: Backport [https://git.savannah.gnu.org/cgit/screen.git/commit/?h=v.4.8.0&id=68386dfb1fa33471372a8cd2e74686758a2f527b]
+CVE: CVE-2020-9366
+Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
+
+---
+ window.h | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/window.h b/window.h
+index bd10dcd..a8afa19 100644
+--- a/window.h
++++ b/window.h
+@@ -237,7 +237,7 @@ struct win
+   char	 w_vbwait;
+   char	 w_norefresh;		/* dont redisplay when switching to that win */
+ #ifdef RXVT_OSC
+-  char	 w_xtermosc[4][MAXSTR];	/* special xterm/rxvt escapes */
++  char	 w_xtermosc[5][MAXSTR];	/* special xterm/rxvt escapes */
+ #endif
+   int    w_mouse;		/* mouse mode 0,9,1000 */
+ #ifdef HAVE_BRAILLE
diff --git a/meta/recipes-extended/screen/screen_4.6.2.bb b/meta/recipes-extended/screen/screen_4.6.2.bb
index 21b476ddb0..d00b849021 100644
--- a/meta/recipes-extended/screen/screen_4.6.2.bb
+++ b/meta/recipes-extended/screen/screen_4.6.2.bb
@@ -25,6 +25,7 @@ SRC_URI = "${GNU_MIRROR}/screen/screen-${PV}.tar.gz \
            file://0001-fix-for-multijob-build.patch \
            file://0001-configure.ac-fix-configure-failed-while-build-dir-ha.patch \
            file://0001-Remove-more-compatibility-stuff.patch \
+           file://CVE-2020-9366.patch \
           "
 
 SRC_URI[md5sum] = "a0f529d3333b128dfaa324d978ba73a8"
-- 
2.25.1


