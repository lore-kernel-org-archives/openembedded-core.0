Received: from mga04.intel.com (mga04.intel.com [])
 by mx.groups.io with SMTP id smtpd.web10.32965.1585212831047026777
 for <openembedded-core@lists.openembedded.org>;
 Thu, 26 Mar 2020 01:53:52 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: intel.com, ip: <nil>, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: e7J+xxknw9zoiVTxbD4+fHk868FFVPPSowpRJ6cJgJ/YvLMHWBVSi5pp3gIm/br6ythRBXO2mQ
 v4wSesp2fRbA==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Mar 2020 01:53:53 -0700
IronPort-SDR: AHeKbA3kBnPt9bUYYyl78XQXGl6d7KY91s03xbVw5Iy7EmhdkzgsYqHoV8buyLKFH+ZRCToKbb
 zgwEEINGPprQ==
X-IronPort-AV: E=Sophos;i="5.72,307,1580803200"; 
   d="scan'208";a="420621842"
Received: from andromeda02.png.intel.com ([10.221.183.11])
  by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-SHA; 26 Mar 2020 01:53:51 -0700
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [zeus][PATCH 2/9] screen: fix CVE-2020-9366
Date: Thu, 26 Mar 2020 16:53:29 +0800
Message-Id: <6d79a4d7545bc78ac759e575f6d15d7b23fad638.1585211896.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1585211896.git.anuj.mittal@intel.com>
References: <cover.1585211896.git.anuj.mittal@intel.com>
MIME-Version: 1.0
In-Reply-To: <cover.1585211896.git.anuj.mittal@intel.com>
References: <cover.1585211896.git.anuj.mittal@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 .../screen/screen/CVE-2020-9366.patch              | 48 ++++++++++++++++++++++
 meta/recipes-extended/screen/screen_4.6.2.bb       |  1 +
 2 files changed, 49 insertions(+)
 create mode 100644 meta/recipes-extended/screen/screen/CVE-2020-9366.patch

diff --git a/meta/recipes-extended/screen/screen/CVE-2020-9366.patch b/meta/recipes-extended/screen/screen/CVE-2020-9366.patch
new file mode 100644
index 0000000..a52b9e6
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
index 21b476d..d00b849 100644
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
2.7.4

