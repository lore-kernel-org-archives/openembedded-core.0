Return-Path: <armccurdy@gmail.com>
Received: from mail-pa0-f51.google.com (mail-pa0-f51.google.com
	[209.85.220.51])
	by mail.openembedded.org (Postfix) with ESMTP id 7277565CBD
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Jun 2015 06:07:23 +0000 (UTC)
Received: by pactm7 with SMTP id tm7so116765607pac.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Jun 2015 23:07:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=abQ3sBikIEShZNbthelv9jWa2tj47OKuyDPJAn/UkRU=;
	b=Nm/lxL24X3tWKy03cz66TuPah1HY3mDyz9QAsVaQL0o3swpAopxsw2Oq0ftbWD3gWb
	XJoVUF1ozmz6QqrGM6Adsx4Er3j4iID4/VlsoH6bfJwAk+9n3i9AdLoz+QLtMJ5idFgZ
	CVcKGq3tMyZVEUhPwKWiDZ20anZzq+7kNAzuaG+m1WvewXr2u3w+TDmIaUU4PzV1sLtn
	H5N+TGwojZe6iFATw+i3zTsHGsa1X8nm/+UE/CcFP+++p21GNSkcooBxlf8ivE9Fx33I
	c4XAHByPV9tDizVQzd4UxzCO5rzJyWThJVQ3cUsBRMkM4ev3RUDyOVV7neHq5x2YhqWE
	AUlw==
X-Received: by 10.69.27.39 with SMTP id jd7mr40193801pbd.49.1435644445045;
	Mon, 29 Jun 2015 23:07:25 -0700 (PDT)
Received: from e6520.cablelabs.com
	(50-204-102-64-static.hfc.comcastbusiness.net. [50.204.102.64])
	by mx.google.com with ESMTPSA id
	gp1sm44134875pbd.64.2015.06.29.23.07.23
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 29 Jun 2015 23:07:24 -0700 (PDT)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 29 Jun 2015 23:06:49 -0700
Message-Id: <1435644409-6631-1-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [fido][PATCH] gst-plugins-bad: fix CVE-2015-0797
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
X-List-Received-Date: Tue, 30 Jun 2015 06:07:24 -0000

From: Kang Kai <kai.kang@windriver.com>

Backport patch from debian to fix CVE-2015-0797.

https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=784220
https://sources.debian.net/data/main/g/gst-plugins-bad0.10/0.10.23-7.1+deb7u2/debian/patches/buffer-overflow-mp4.patch

Backported to oe-core fido from meta-oe/meta-multimedia:

http://git.openembedded.org/meta-openembedded/commit/?id=6cb3b63559bf33946f1c5d43626413d9a651e83f

Signed-off-by: Kai Kang <kai.kang@windriver.com>
Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 .../gst-plugins-bad/buffer-overflow-mp4.patch      | 36 ++++++++++++++++++++++
 .../gstreamer/gst-plugins-bad_0.10.23.bb           |  2 ++
 2 files changed, 38 insertions(+)
 create mode 100644 meta/recipes-multimedia/gstreamer/gst-plugins-bad/buffer-overflow-mp4.patch

diff --git a/meta/recipes-multimedia/gstreamer/gst-plugins-bad/buffer-overflow-mp4.patch b/meta/recipes-multimedia/gstreamer/gst-plugins-bad/buffer-overflow-mp4.patch
new file mode 100644
index 0000000..235acda
--- /dev/null
+++ b/meta/recipes-multimedia/gstreamer/gst-plugins-bad/buffer-overflow-mp4.patch
@@ -0,0 +1,36 @@
+Description: Fix buffer overflow in mp4 parsing
+Author: Ralph Giles <giles@mozilla.com>
+---
+Backport patch from debian to fix CVE-2015-0797.
+https://sources.debian.net/data/main/g/gst-plugins-bad0.10/0.10.23-7.1+deb7u2/debian/patches/buffer-overflow-mp4.patch
+
+Upstream-Status: Backport
+
+Signed-off-by: Kai Kang <kai.kang@windriver.com>
+---
+--- gst-plugins-bad0.10-0.10.23.orig/gst/videoparsers/gsth264parse.c
++++ gst-plugins-bad0.10-0.10.23/gst/videoparsers/gsth264parse.c
+@@ -384,6 +384,11 @@ gst_h264_parse_wrap_nal (GstH264Parse *
+ 
+   GST_DEBUG_OBJECT (h264parse, "nal length %d", size);
+ 
++  if (size > G_MAXUINT32 - nl) {
++    GST_ELEMENT_ERROR (h264parse, STREAM, FAILED, (NULL),
++        ("overflow in nal size"));
++    return NULL;
++  }
+   buf = gst_buffer_new_and_alloc (size + nl + 4);
+   if (format == GST_H264_PARSE_FORMAT_AVC) {
+     GST_WRITE_UINT32_BE (GST_BUFFER_DATA (buf), size << (32 - 8 * nl));
+@@ -452,6 +457,11 @@ gst_h264_parse_process_nal (GstH264Parse
+     GST_DEBUG_OBJECT (h264parse, "not processing nal size %u", nalu->size);
+     return;
+   }
++  if (G_UNLIKELY (nalu->size > 20 * 1024 * 1024)) {
++    GST_DEBUG_OBJECT (h264parse, "not processing nal size %u (too big)",
++        nalu->size);
++    return;
++  }
+ 
+   /* we have a peek as well */
+   nal_type = nalu->type;
diff --git a/meta/recipes-multimedia/gstreamer/gst-plugins-bad_0.10.23.bb b/meta/recipes-multimedia/gstreamer/gst-plugins-bad_0.10.23.bb
index 0f64871..4d94483 100644
--- a/meta/recipes-multimedia/gstreamer/gst-plugins-bad_0.10.23.bb
+++ b/meta/recipes-multimedia/gstreamer/gst-plugins-bad_0.10.23.bb
@@ -10,6 +10,8 @@ DEPENDS += "gst-plugins-base"
 
 PR = "r4"
 
+SRC_URI += "file://buffer-overflow-mp4.patch"
+
 inherit gettext gsettings
 
 EXTRA_OECONF += "--disable-experimental \
-- 
1.9.1


