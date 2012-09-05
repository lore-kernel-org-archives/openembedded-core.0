Received: from mail-bk0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1T9Jwc-00087Z-IF
	for openembedded-core@lists.openembedded.org;
	Wed, 05 Sep 2012 20:03:18 +0200
Received: by bkcik5 with SMTP id ik5so465050bkc.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 05 Sep 2012 10:50:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:mime-version:content-type
	:content-transfer-encoding;
	bh=eQt3dIWfsrckiUG8qCSxMDeplKlBV1QPcid4P+5UQj4=;
	b=P5nEjMTxR3O5rSH6/fzVkiTMrs4Xd3Qxaj9dWHZUNcMiPOpeRjBnq8W/aqlBagtvHR
	2dx0emlIg8Z9640O2i14Z3pY2EC6ZwMdBOL4B1he8GjysO9/ZL68F09nvGj4JG8ONVw9
	/5YxFMTqOxC39oQ+vnm/+l7Vc1u8nUUrwLWXjUsmvAlM79UkhVxwDCdPhDkju7J9agMT
	ImVK8aSieD+J7uqqqSNzin/9EVkO0iZof12hGXPSGKNMxJQQQ6CwbRKkCdhYd2bnAuEC
	nSRKr+6jNNYohaGZPEGJTAjRwmXI11ddCeppzphRIeLg2hN3WenvSeGmH8IdWpVsXTp9
	6Jrw==
Received: by 10.204.156.68 with SMTP id v4mr9686869bkw.68.1346867455074;
	Wed, 05 Sep 2012 10:50:55 -0700 (PDT)
Received: from localhost.localdomain (ip-95-222-156-96.unitymediagroup.de.
	[95.222.156.96])
	by mx.google.com with ESMTPS id j9sm1827506bkv.0.2012.09.05.10.50.53
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 05 Sep 2012 10:50:54 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  5 Sep 2012 19:50:11 +0200
Message-Id: <1346867411-8227-1-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.6.5
MIME-Version: 1.0
Subject: [PATCH] gst-plugins-good: fix compile error with recent linux-libc-headers
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
X-List-Received-Date: Wed, 05 Sep 2012 18:03:18 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

With linux-libc-headers-3.5.0 (for tests) the error message was:

| gstv4l2bufferpool.c: In function 'gst_v4l2_buffer_new':
| gstv4l2bufferpool.c:184:3: error: 'struct v4l2_buffer' has no member named 'input'

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 ...ild-with-recent-kernels-the-v4l2_buffer-i.patch |   33 ++++++++++++++++++++
 .../gstreamer/gst-plugins-good_0.10.31.bb          |    4 ++-
 2 files changed, 36 insertions(+), 1 deletions(-)
 create mode 100644 meta/recipes-multimedia/gstreamer/gst-plugins-good-0.10.31/0001-v4l2-fix-build-with-recent-kernels-the-v4l2_buffer-i.patch

diff --git a/meta/recipes-multimedia/gstreamer/gst-plugins-good-0.10.31/0001-v4l2-fix-build-with-recent-kernels-the-v4l2_buffer-i.patch b/meta/recipes-multimedia/gstreamer/gst-plugins-good-0.10.31/0001-v4l2-fix-build-with-recent-kernels-the-v4l2_buffer-i.patch
new file mode 100644
index 0000000..6456d3c
--- /dev/null
+++ b/meta/recipes-multimedia/gstreamer/gst-plugins-good-0.10.31/0001-v4l2-fix-build-with-recent-kernels-the-v4l2_buffer-i.patch
@@ -0,0 +1,33 @@
+From 12d18fe4e98e7c232d59b56d529a0521f293fe6d Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
+Date: Wed, 5 Sep 2012 18:54:42 +0200
+Subject: [PATCH] v4l2: fix build with recent kernels, the v4l2_buffer input
+ field was removed
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Upstream-Status: Backport
+
+[1] http://cgit.freedesktop.org/gstreamer/gst-plugins-good/commit/?id=9f2aa8d47f835ea155aaf635f618c0fc1ca87012
+
+Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
+---
+ sys/v4l2/gstv4l2bufferpool.c |    1 -
+ 1 files changed, 0 insertions(+), 1 deletions(-)
+
+diff --git a/sys/v4l2/gstv4l2bufferpool.c b/sys/v4l2/gstv4l2bufferpool.c
+index b81c6a4..51cc0ce 100644
+--- a/sys/v4l2/gstv4l2bufferpool.c
++++ b/sys/v4l2/gstv4l2bufferpool.c
+@@ -181,7 +181,6 @@ gst_v4l2_buffer_new (GstV4l2BufferPool * pool, guint index, GstCaps * caps)
+     GST_LOG_OBJECT (pool->v4l2elem, "  MMAP offset:  %u",
+         ret->vbuffer.m.offset);
+   GST_LOG_OBJECT (pool->v4l2elem, "  length:    %u", ret->vbuffer.length);
+-  GST_LOG_OBJECT (pool->v4l2elem, "  input:     %u", ret->vbuffer.input);
+ 
+   data = (guint8 *) v4l2_mmap (0, ret->vbuffer.length,
+       PROT_READ | PROT_WRITE, MAP_SHARED, pool->video_fd,
+-- 
+1.7.6.5
+
diff --git a/meta/recipes-multimedia/gstreamer/gst-plugins-good_0.10.31.bb b/meta/recipes-multimedia/gstreamer/gst-plugins-good_0.10.31.bb
index ac63f94..abcd836 100644
--- a/meta/recipes-multimedia/gstreamer/gst-plugins-good_0.10.31.bb
+++ b/meta/recipes-multimedia/gstreamer/gst-plugins-good_0.10.31.bb
@@ -7,10 +7,12 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=a6f89e2100d9b6cdffcea4f398e37343 \
 
 DEPENDS += "gst-plugins-base gconf cairo jpeg libpng gtk+ zlib libid3tag flac \
 	    speex libsoup-2.4 pulseaudio"
-PR = "r2"
+PR = "r3"
 
 inherit gettext gconf
 
+SRC_URI += "file://0001-v4l2-fix-build-with-recent-kernels-the-v4l2_buffer-i.patch"
+
 EXTRA_OECONF += "--disable-aalib --disable-esd --disable-shout2 --disable-libcaca --disable-hal --without-check \
                  --disable-orc"
 
-- 
1.7.6.5



