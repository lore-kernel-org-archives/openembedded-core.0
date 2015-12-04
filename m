Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f43.google.com (mail-wm0-f43.google.com [74.125.82.43])
	by mail.openembedded.org (Postfix) with ESMTP id 15C5B60722
	for <openembedded-core@lists.openembedded.org>;
	Fri,  4 Dec 2015 14:42:48 +0000 (UTC)
Received: by wmww144 with SMTP id w144so64614976wmw.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 04 Dec 2015 06:42:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=D/PuMwDwuCOQa3breSWmPCngxcVig7rgoNWWjPDCZkc=;
	b=KF6PRN05Bw43Rs+C4aGtuZwxSEg9T5IdlRJ4hq7HApia7MhG82VyFbDYF+Ov1Lo7Lt
	VI9kCtALsMqzz92c06OD01Wo3BvGtu4fEkLNh03q6AO8jh5nqTywfX2xYJUYU3lmXchN
	LE+sXmRUbB8NKiMWFQIndxThNpDII479yUm/nELQF7d2X5f9QU7lcnOodl1AtWYEK7pe
	ElFzgkBzwPfFn7bGUOqELz0qhLkgIxTiWSNtSa0di71kzMn3azIFDWPSNfgbiaAHzXiq
	CD3Jv3jFXKG2J3U6lBpotyfdGV9+w0gpJZDsoM5OsqgFrS7Kjo+/c6RMXX4e+fihyXPN
	T6LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=D/PuMwDwuCOQa3breSWmPCngxcVig7rgoNWWjPDCZkc=;
	b=gnJQu57hPBHDrqePDDLwp8LWDY79xQAyIrCA99HhNqejWo3N95BtpGrBY1ZmWwkcJM
	9Ld/fbmWfBtzbQxIUCfOPZlBZ0lWjIaZb9yEucDdlAQdNjC8VOLFG7eQM5PqWoUYcJvq
	L2tPZPLw0BPB/6KZMW0GDS1eBtzGMm3zvwL/VYX8T8Rze+ipgZspY6D47IJdSTCbpSZT
	+lPL1e+JeDg4CH2AcWhKEjuR8CGAWVwcBZBaT77sAbYRbWEoZg+7Acadlz3u8vnjaCgf
	TJ4jB4zlofTQw8yQdytwMU2tU7+hNpyuXpnlgza+jZULnxgm6NqYNuPyXAW0bLk7OxQ3
	JM3g==
X-Gm-Message-State: ALoCoQkGBAigZI4tylPkGknli/SdDASVKa9jmecXRmgADaEKsI25u4ClOmK7Maxv06PIdHthlI6yQMTpXNmvSJL4WVWf+BEnDQ==
X-Received: by 10.28.7.138 with SMTP id 132mr5854310wmh.100.1449240168973;
	Fri, 04 Dec 2015 06:42:48 -0800 (PST)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	t133sm3758527wmf.24.2015.12.04.06.42.47
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 04 Dec 2015 06:42:47 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  4 Dec 2015 14:42:45 +0000
Message-Id: <1449240165-26118-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH] gstreamer: really fix the helper install race
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
X-List-Received-Date: Fri, 04 Dec 2015 14:42:49 -0000

My previous fix wasn't enough and just made the race rarer.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 .../gstreamer/gstreamer1.0/fix-install-hook.patch  | 50 ++++++++++++++++------
 1 file changed, 37 insertions(+), 13 deletions(-)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0/fix-install-hook.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0/fix-install-hook.patch
index 71bd9bc..4962457 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0/fix-install-hook.patch
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0/fix-install-hook.patch
@@ -1,24 +1,48 @@
-This needs to be a install-data-hook not an install-exec-hook as the helpers are
-installed into helperdir which is considered data (only path variables with
-"exec" in are considered executables).
+The hooks need to be split into install-data-hook and install-exec-hook as the
+hook fiddles with binaries that are installed by install-data and install-exec,
+otherwise there'll be occasional install failures due to the build racing.
 
-The explicit dependency on install-helpersPROGRAMS was an attempt at solving
-this, but this causes occasional races where install-helpersPROGRAMS can run
-twice in parallel (once via install-all, once via the hook's dependency).
-
-Upstream-Status: Backport [09aa20746a0fef97fb811c5503928c13a1f55eb5]
+Upstream-Status: Submitted (https://bugzilla.gnome.org/show_bug.cgi?id=758029)
 Signed-off-by: Ross Burton <ross.burton@intel.com>
 
 diff --git a/libs/gst/helpers/Makefile.am b/libs/gst/helpers/Makefile.am
-index 0ae9ab0..2530a34 100644
+index 0ae9ab0..0067779 100644
 --- a/libs/gst/helpers/Makefile.am
 +++ b/libs/gst/helpers/Makefile.am
-@@ -23,7 +23,7 @@ gst_ptp_helper_CFLAGS = $(GST_OBJ_CFLAGS) $(GIO_CFLAGS)
+@@ -23,17 +23,8 @@ gst_ptp_helper_CFLAGS = $(GST_OBJ_CFLAGS) $(GIO_CFLAGS)
  gst_ptp_helper_LDADD = $(GST_OBJ_LIBS) $(GIO_LIBS) $(CAP_LIBS)
  endif
  
 -install-exec-hook: install-helpersPROGRAMS
+-if HAVE_PTP
+-if HAVE_PTP_HELPER_SETUID
+-	- chown root $(DESTDIR)$(helpersdir)/gst-ptp-helper
+-	- chmod u+s $(DESTDIR)$(helpersdir)/gst-ptp-helper
+-endif
+-if HAVE_PTP_HELPER_CAPABILITIES
+-	- $(SETCAP) cap_net_bind_service,cap_net_admin+ep $(DESTDIR)$(helpersdir)/gst-ptp-helper
+-endif
+-endif
+ if ENABLE_BASH_COMPLETION
++install-exec-hook:
+ 	$(MKDIR_P) $(DESTDIR)$(BASH_HELPERS_DIR) && \
+ 	cd $(DESTDIR)$(bindir) && \
+ 	$(INSTALL) `echo "gst-completion-helper-" | sed '$(transform)'`@GST_API_VERSION@$(EXEEXT) \
+@@ -44,6 +35,17 @@ uninstall-hook:
+ 	rm -f $(DESTDIR)$(BASH_HELPERS_DIR)/gst-completion-helper-@GST_API_VERSION@$(EXEEXT)
+ endif
+ 
 +install-data-hook:
- if HAVE_PTP
- if HAVE_PTP_HELPER_SETUID
- 	- chown root $(DESTDIR)$(helpersdir)/gst-ptp-helper
++if HAVE_PTP
++if HAVE_PTP_HELPER_SETUID
++	- chown root $(DESTDIR)$(helpersdir)/gst-ptp-helper
++	- chmod u+s $(DESTDIR)$(helpersdir)/gst-ptp-helper
++endif
++if HAVE_PTP_HELPER_CAPABILITIES
++	- $(SETCAP) cap_net_bind_service,cap_net_admin+ep $(DESTDIR)$(helpersdir)/gst-ptp-helper
++endif
++endif
++
+ # clean out the old one to make sure everything is udpated correctly
+ # remove again after release
+ CLEANFILES = plugin-scanner
-- 
2.1.4


