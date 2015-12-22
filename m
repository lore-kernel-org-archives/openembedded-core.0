Return-Path: <maxin.john@intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id AC5AE6FF80
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Dec 2015 12:21:40 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga103.fm.intel.com with ESMTP; 22 Dec 2015 04:21:40 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,464,1444719600"; d="scan'208";a="878996960"
Received: from linux.intel.com ([10.23.219.25])
	by fmsmga002.fm.intel.com with ESMTP; 22 Dec 2015 04:21:40 -0800
Received: from mbabyjoh-mobl.fi.intel.com (mbabyjoh-mobl.fi.intel.com
	[10.237.72.71])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by linux.intel.com (Postfix) with ESMTP id E7CDD6A4007
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Dec 2015 05:09:40 -0800 (PST)
From: "Maxin B. John" <maxin.john@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 22 Dec 2015 14:22:52 +0200
Message-Id: <1450786978-19993-2-git-send-email-maxin.john@intel.com>
X-Mailer: git-send-email 2.4.0
In-Reply-To: <1450786978-19993-1-git-send-email-maxin.john@intel.com>
References: <1450786978-19993-1-git-send-email-maxin.john@intel.com>
Subject: [PATCH 1/7] gstreamer1.0: upgrade to version 1.6.2
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
X-List-Received-Date: Tue, 22 Dec 2015 12:21:41 -0000

1.6.1 -> 1.6.2

Removed "fix-install-hook.patch" which was backported.

Signed-off-by: Maxin B. John <maxin.john@intel.com>
---
 .../gstreamer/gstreamer1.0/fix-install-hook.patch  | 48 ----------------------
 ...gstreamer1.0_1.6.1.bb => gstreamer1.0_1.6.2.bb} |  5 +--
 2 files changed, 2 insertions(+), 51 deletions(-)
 delete mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0/fix-install-hook.patch
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0_1.6.1.bb => gstreamer1.0_1.6.2.bb} (68%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0/fix-install-hook.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0/fix-install-hook.patch
deleted file mode 100644
index 9e38f66..0000000
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0/fix-install-hook.patch
+++ /dev/null
@@ -1,48 +0,0 @@
-The hooks need to be split into install-data-hook and install-exec-hook as the
-hook fiddles with binaries that are installed by install-data and install-exec,
-otherwise there'll be occasional install failures due to the build racing.
-
-Upstream-Status: Backport (0c6be6604aafa84b525088d1ef4a4486d907743c)
-Signed-off-by: Ross Burton <ross.burton@intel.com>
-
-diff --git a/libs/gst/helpers/Makefile.am b/libs/gst/helpers/Makefile.am
-index 0ae9ab0..0067779 100644
---- a/libs/gst/helpers/Makefile.am
-+++ b/libs/gst/helpers/Makefile.am
-@@ -23,17 +23,8 @@ gst_ptp_helper_CFLAGS = $(GST_OBJ_CFLAGS) $(GIO_CFLAGS)
- gst_ptp_helper_LDADD = $(GST_OBJ_LIBS) $(GIO_LIBS) $(CAP_LIBS)
- endif
- 
--install-exec-hook: install-helpersPROGRAMS
--if HAVE_PTP
--if HAVE_PTP_HELPER_SETUID
--	- chown root $(DESTDIR)$(helpersdir)/gst-ptp-helper
--	- chmod u+s $(DESTDIR)$(helpersdir)/gst-ptp-helper
--endif
--if HAVE_PTP_HELPER_CAPABILITIES
--	- $(SETCAP) cap_net_bind_service,cap_net_admin+ep $(DESTDIR)$(helpersdir)/gst-ptp-helper
--endif
--endif
- if ENABLE_BASH_COMPLETION
-+install-exec-hook:
- 	$(MKDIR_P) $(DESTDIR)$(BASH_HELPERS_DIR) && \
- 	cd $(DESTDIR)$(bindir) && \
- 	$(INSTALL) `echo "gst-completion-helper-" | sed '$(transform)'`@GST_API_VERSION@$(EXEEXT) \
-@@ -44,6 +35,17 @@ uninstall-hook:
- 	rm -f $(DESTDIR)$(BASH_HELPERS_DIR)/gst-completion-helper-@GST_API_VERSION@$(EXEEXT)
- endif
- 
-+install-data-hook:
-+if HAVE_PTP
-+if HAVE_PTP_HELPER_SETUID
-+	- chown root $(DESTDIR)$(helpersdir)/gst-ptp-helper
-+	- chmod u+s $(DESTDIR)$(helpersdir)/gst-ptp-helper
-+endif
-+if HAVE_PTP_HELPER_CAPABILITIES
-+	- $(SETCAP) cap_net_bind_service,cap_net_admin+ep $(DESTDIR)$(helpersdir)/gst-ptp-helper
-+endif
-+endif
-+
- # clean out the old one to make sure everything is udpated correctly
- # remove again after release
- CLEANFILES = plugin-scanner
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.6.1.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.6.2.bb
similarity index 68%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0_1.6.1.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0_1.6.2.bb
index 9618eaf..ba46c77 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.6.1.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.6.2.bb
@@ -6,10 +6,9 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=6762ed442b3822387a51c92d928ead0d \
 SRC_URI = " \
     http://gstreamer.freedesktop.org/src/gstreamer/gstreamer-${PV}.tar.xz \
     file://0001-Fix-crash-with-gst-inspect.patch \
-    file://fix-install-hook.patch \
 "
-SRC_URI[md5sum] = "e72e2dc2ee06bfc045bb6010c89de520"
-SRC_URI[sha256sum] = "973a3f213c8d41d6dd0e4e7e38fd6cccacd5ae1ac09e1179a8d5d869ef0a5c9c"
+SRC_URI[md5sum] = "5e610b5a94c209487310739b39b6c464"
+SRC_URI[sha256sum] = "5896716bd8e089dba452932a2eff2bb6f6c9d58ff64a96635d157f1ffaf8feb2"
 
 S = "${WORKDIR}/gstreamer-${PV}"
 
-- 
2.4.0


