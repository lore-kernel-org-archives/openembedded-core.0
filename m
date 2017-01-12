Return-Path: <armccurdy@gmail.com>
Received: from mail-pf0-f196.google.com (mail-pf0-f196.google.com
	[209.85.192.196])
	by mail.openembedded.org (Postfix) with ESMTP id DC2FA6FEFA
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Jan 2017 23:52:39 +0000 (UTC)
Received: by mail-pf0-f196.google.com with SMTP id f144so5445253pfa.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Jan 2017 15:52:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=xP71MEI2z8r58xPo5XYodVVtZuuvUba/QLekLaRvd8Y=;
	b=VNhxQGClC3MkRgowBv+2JyuL8AtNjgle3b77u/hzAWrRdzy7CWCQfhdLuAYv9765HY
	ku19Cz6w3nYibOxzJPl4VT+8w8r7PvD2BFlUGvZzgLTZR+uhVDdXJjXyyg9Wxvi+iIJf
	V6d21xaR++jmV4hPDVvZ6nVrvkVLbrHq1uavkaUvXbme9xovNwtTZRse4Wf92LZb1jTS
	ulYucvlq6pVowvqQGIUAUes3rQCkxgTZdp4dA1BQ9GJchBq/r11ipfUiBLgV/iYZlC+8
	dter/qmd5xiH/IT8oWylBjZhiTu1CEFqOSQ09XOVH3C9SufJamg42c5c3bUekPSPWbOs
	ozDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=xP71MEI2z8r58xPo5XYodVVtZuuvUba/QLekLaRvd8Y=;
	b=K0zFjzb7fQSv7bDUIairC+34PFUqJoF++hXWql4ovdKrHmC+u60SwpUuvqMraxFKqc
	QKQ9R8QhrKOpUTrr2BrBcqO2ZUyiHA+7c2QiKBVuxa48k6hWfWThXZtyXrfc3b5vvf9g
	q7fMfTG9l91cCrC0j+MR4d0DNXAP2HbDBpXpLeTYQyCc3eWkDLqyIkVhEIguUrFF6uZV
	c0QWVP0cy6Mts3OveBys/j112N0bC3HqHBAwjN+aJtWtSDwWTNUZdzoXjpS4H7ukuQVT
	kMvQZXIanQzvmO0BoZdyZZFO6rs3BBjcdaCm8xVnwkn9aF0FXh6xWWLHME+J9F065pf7
	O3KA==
X-Gm-Message-State: AIkVDXKZUZTJgkhkHUTdOmo50V4VXdQgUq04Tzl9aQveRiO3H8SOgi7AZximZ7Pd5GuqZQ==
X-Received: by 10.84.225.20 with SMTP id t20mr25637523plj.154.1484265159577;
	Thu, 12 Jan 2017 15:52:39 -0800 (PST)
Received: from e6520.guest-wifi.scl.liberty.com ([4.16.80.121])
	by smtp.gmail.com with ESMTPSA id
	y6sm24310201pge.16.2017.01.12.15.52.38
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 12 Jan 2017 15:52:38 -0800 (PST)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 12 Jan 2017 15:52:32 -0800
Message-Id: <1484265152-5892-1-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH] gstreamer1.0-plugins-good: fix qtdemux_parse_svq3_stsd_data() memory leak
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
X-List-Received-Date: Thu, 12 Jan 2017 23:52:40 -0000

Backport from 1.11.1

  https://cgit.freedesktop.org/gstreamer/gst-plugins-good/commit/?id=29433495d697e4dcb3bc50ff0e0d866acb949890

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 ...e-seqh-after-calling-qtdemux_parse_svq3_s.patch | 33 ++++++++++++++++++++++
 .../gstreamer/gstreamer1.0-plugins-good_1.10.2.bb  |  1 +
 2 files changed, 34 insertions(+)
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/qtdemux-free-seqh-after-calling-qtdemux_parse_svq3_s.patch

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/qtdemux-free-seqh-after-calling-qtdemux_parse_svq3_s.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/qtdemux-free-seqh-after-calling-qtdemux_parse_svq3_s.patch
new file mode 100644
index 0000000..3428790
--- /dev/null
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/qtdemux-free-seqh-after-calling-qtdemux_parse_svq3_s.patch
@@ -0,0 +1,33 @@
+From 29433495d697e4dcb3bc50ff0e0d866acb949890 Mon Sep 17 00:00:00 2001
+From: Andre McCurdy <armccurdy@gmail.com>
+Date: Wed, 11 Jan 2017 17:53:32 -0800
+Subject: [PATCH] qtdemux: free seqh after calling
+ qtdemux_parse_svq3_stsd_data()
+
+The seqh buffer allocated in qtdemux_parse_svq3_stsd_data() needs to
+be freed by the caller after use.
+
+https://bugzilla.gnome.org/show_bug.cgi?id=777157
+
+Upstream-Status: Backport
+
+Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
+---
+ gst/isomp4/qtdemux.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/gst/isomp4/qtdemux.c b/gst/isomp4/qtdemux.c
+index e105809..7a431e0 100644
+--- a/gst/isomp4/qtdemux.c
++++ b/gst/isomp4/qtdemux.c
+@@ -10375,6 +10375,7 @@ qtdemux_parse_trak (GstQTDemux * qtdemux, GNode * trak)
+              * than its own fourcc */
+             gst_caps_set_simple (stream->caps, "seqh", GST_TYPE_BUFFER, seqh,
+                 NULL);
++            gst_buffer_unref (seqh);
+           }
+ 
+           GST_DEBUG_OBJECT (qtdemux, "found codec_data in stsd");
+-- 
+1.9.1
+
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.10.2.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.10.2.bb
index 18262d0..6c119e5 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.10.2.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.10.2.bb
@@ -10,6 +10,7 @@ SRC_URI = " \
     file://avoid-including-sys-poll.h-directly.patch \
     file://ensure-valid-sentinel-for-gst_structure_get.patch \
     file://0001-introspection.m4-prefix-pkgconfig-paths-with-PKG_CON.patch \
+    file://qtdemux-free-seqh-after-calling-qtdemux_parse_svq3_s.patch \
 "
 SRC_URI[md5sum] = "65c4ff9d406c3ea9383b4d38a6504349"
 SRC_URI[sha256sum] = "198f325bcce982dce1ebeb36929a5f430b8bf9528e0d519e18df0b29e1d23313"
-- 
1.9.1


