Received: from mga07.intel.com ([143.182.124.22] helo=azsmga101.ch.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1T105M-0001rn-3k
	for openembedded-core@lists.openembedded.org;
	Mon, 13 Aug 2012 21:13:56 +0200
Received: from mail-wg0-f44.google.com ([74.125.82.44])
	by mga03.intel.com with ESMTP/TLS/RC4-SHA; 13 Aug 2012 12:02:00 -0700
Received: by wgbdr13 with SMTP id dr13so2497233wgb.13
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Aug 2012 12:01:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references:x-gm-message-state;
	bh=0VnTw512Itz0reqq3aCBkllX1PZQl3+63gxi+WPiUyM=;
	b=KqdYYyId+UFTuShGsn7rGc5Fp9mgpoPO56bGorsL/yEi4z1jXj/1G2sHPoJ8F/YJGO
	D73MspE1TODOXiODhVo19Xhqkgzdlh08auVXdZD/HAT8/ur1VCk81TYyfR971RC/HMz0
	qRKciTy1PjpsbJYHAJJG8aef7VaDBi6XHkjSXKVwYByr/7oveHuxWF1ZJC7IzEKjT9Yj
	8fDetLZT8bq/xRwi0nVdT7cmJF0lV9l2Fmr68ii6eenXBZTrxtPYhRvHDpLOvd3JSR2y
	n/2kA9e3bpl2ixNZsR3nZ/MlykCC5waxXI5reXpYpb+aVw2f3KApv5oT/boK/mPwX+ry
	5agQ==
Received: by 10.216.242.204 with SMTP id i54mr6357951wer.94.1344884518376;
	Mon, 13 Aug 2012 12:01:58 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPS id l5sm26044104wix.5.2012.08.13.12.01.57
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 13 Aug 2012 12:01:57 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 13 Aug 2012 20:01:23 +0100
Message-Id: <d3e664ba768f4485f8d7984a86c571cf43815497.1344884443.git.ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10
In-Reply-To: <cover.1344884443.git.ross.burton@intel.com>
References: <cover.1344884443.git.ross.burton@intel.com>
In-Reply-To: <cover.1344884443.git.ross.burton@intel.com>
References: <cover.1344884443.git.ross.burton@intel.com>
X-Gm-Message-State: ALoCoQnybizEg/goXW2WPtUvg4kOaSaPRj1vwH8H0M0/oGl+5NJdcg6fKnOdFiCGa5BPP41wt+aR
Subject: [PATCH 2/2] libowl-av: patches merged upstream, bump srcrev
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
X-List-Received-Date: Mon, 13 Aug 2012 19:13:56 -0000


Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 .../libowl-av/gst_change_state.patch               |   42 --------------------
 .../owl-video-widget/libowl-av/make-382.patch      |   13 ------
 .../recipes-sato/owl-video-widget/libowl-av_git.bb |    8 ++--
 3 files changed, 3 insertions(+), 60 deletions(-)
 delete mode 100644 meta/recipes-sato/owl-video-widget/libowl-av/gst_change_state.patch
 delete mode 100644 meta/recipes-sato/owl-video-widget/libowl-av/make-382.patch

diff --git a/meta/recipes-sato/owl-video-widget/libowl-av/gst_change_state.patch b/meta/recipes-sato/owl-video-widget/libowl-av/gst_change_state.patch
deleted file mode 100644
index 5bc279a..0000000
--- a/meta/recipes-sato/owl-video-widget/libowl-av/gst_change_state.patch
+++ /dev/null
@@ -1,42 +0,0 @@
-Fix music player crash if adding unknown type files.
-
-Using bus message to call function flush_head/feed_head in main thread
-to protect private data operation.
-
-A better fix may be to listen to bus message "CODEC_NOT_FOUND" and
-"MISSING_PLUGIN" directly to avoid hooking into "unknown-type" signal.
-We will revisit it in next period.
-
-Signed-off-by: Dongxiao Xu <dongxiao.xu@intel.com>
-
-Upstream-Status: Pending
-
-diff -ruN libowl-av-orig/libowl-av/owl-tag-reader.c libowl-av/libowl-av/owl-tag-reader.c
---- libowl-av-orig/libowl-av/owl-tag-reader.c	2010-10-12 14:30:26.000000000 +0800
-+++ libowl-av/libowl-av/owl-tag-reader.c	2010-10-12 14:32:39.000000000 +0800
-@@ -300,13 +300,23 @@
-                            GstCaps      *caps,
-                            OwlTagReader *tag_reader)
- {
-+        GstMessage *message;
-+        GstBus *bus;
-+
-         tag_reader->priv->current_error =
-                 g_error_new (OWL_TAG_READER_ERROR,
-                              OWL_TAG_READER_ERROR_UNKNOWN_TYPE,
-                              "Unknown type");
- 
--        flush_head (tag_reader);
--        feed_head (tag_reader);
-+        /**
-+         * Post a message to the bus, as we are in another thread here.
-+         **/
-+        message = gst_message_new_error(GST_OBJECT (decodebin),
-+                                        tag_reader->priv->current_error, NULL);
-+
-+        bus = gst_pipeline_get_bus (GST_PIPELINE (tag_reader->priv->pipeline));
-+        gst_bus_post (bus, message);
-+        gst_object_unref (GST_OBJECT (bus));
- }
- 
- /**
diff --git a/meta/recipes-sato/owl-video-widget/libowl-av/make-382.patch b/meta/recipes-sato/owl-video-widget/libowl-av/make-382.patch
deleted file mode 100644
index a8be781..0000000
--- a/meta/recipes-sato/owl-video-widget/libowl-av/make-382.patch
+++ /dev/null
@@ -1,13 +0,0 @@
-Upstream-Status: Inappropriate [configuration]
-
-Index: libowl-av/Makefile.am
-===================================================================
---- libowl-av.orig/Makefile.am
-+++ libowl-av/Makefile.am
-@@ -14,5 +14,5 @@ EXTRA_DIST = libowl-av.pc.in libowl-av.v
- MAINTAINERCLEANFILES = aclocal.m4 compile config.guess config.sub configure depcomp intltool-extract intltool-merge intltool-update install-sh ltmain.sh Makefile.in missing
- 
- snapshot:
--        $(MAKE) dist distdir=$(PACKAGE)-snap`date +"%Y%m%d"`
-+	$(MAKE) dist distdir=$(PACKAGE)-snap`date +"%Y%m%d"`
- 
diff --git a/meta/recipes-sato/owl-video-widget/libowl-av_git.bb b/meta/recipes-sato/owl-video-widget/libowl-av_git.bb
index 4413d38..62a4a7d 100644
--- a/meta/recipes-sato/owl-video-widget/libowl-av_git.bb
+++ b/meta/recipes-sato/owl-video-widget/libowl-av_git.bb
@@ -12,14 +12,12 @@ DEPENDS = "gtk+ gstreamer gst-plugins-base"
 RDEPENDS_${PN} = "gst-meta-base"
 RRECOMMENDS_${PN} = "gst-meta-audio gst-meta-video"
 
-SRCREV = "1379fd230a32509e94971961183f1031f469737a"
+SRCREV = "03030c41ea578cfa74a2ffceb875675b248318ae"
 PV = "0.1+git${SRCPV}"
-PR = "r2"
+PR = "r3"
 
 
-SRC_URI = "git://git.yoctoproject.org/${BPN};protocol=git \
-           file://gst_change_state.patch \
-	   file://make-382.patch"
+SRC_URI = "git://git.yoctoproject.org/${BPN};protocol=git"
 
 S = "${WORKDIR}/git"
 
-- 
1.7.10



