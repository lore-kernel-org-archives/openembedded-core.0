Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A250E77188
	for <webhook@archiver.kernel.org>; Mon, 30 Dec 2024 17:28:23 +0000 (UTC)
Received: from mta-65-228.siemens.flowmailer.net (mta-65-228.siemens.flowmailer.net [185.136.65.228])
 by mx.groups.io with SMTP id smtpd.web10.66246.1735579697521802617
 for <openembedded-core@lists.openembedded.org>;
 Mon, 30 Dec 2024 09:28:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=F/0JWxlo;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.228, mailfrom: fm-256628-20241230172818902607db4e5579f8d7-jfr5xi@rts-flowmailer.siemens.com)
Received: by mta-65-228.siemens.flowmailer.net with ESMTPSA id 20241230172818902607db4e5579f8d7
        for <openembedded-core@lists.openembedded.org>;
        Mon, 30 Dec 2024 18:28:19 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=5eG4ymGiRj0vlrjmMbPW2mivJGcaHLGlR2tJ0p2Khx0=;
 b=F/0JWxloX2c+iit5tSwmxLTUOFa2bwwX/oy3VXY+o+MVVxsgD//1Vb0VxM6CVBBXcrL5LG
 kV7dGuq+1bDqJQ97f7fZ0lu81kBHnYDszPpv1c1eWYkv/UNN689n0GLQ7SXdT27wUL6vNZAL
 jI2fzESj8WHIASYDMFeAkfyaiHG+X5vfd0VyRHdj9bpDST6VunTmQgFZrtwAkF/cgdI6VtJp
 6X41sxIzEjUOjfBC5TfOw6Rdyj9Hz0l1ifo7jlTQwaADbLwBhe5lp3onHEWni/dx+iJJ0xnk
 7oM8WQUG4QpO1fmDq0DXZcFU3wGUSeZ3V/ijjcmmYXZMP+CQ86im7szg==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [OE-core][scarthgap][PATCH 02/16] gstreamer1.0-plugins-base: patch CVE-2024-47538
Date: Mon, 30 Dec 2024 18:27:09 +0100
Message-Id: <20241230172723.3644270-2-peter.marko@siemens.com>
In-Reply-To: <20241230172723.3644270-1-peter.marko@siemens.com>
References: <20241230172723.3644270-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 30 Dec 2024 17:28:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209166

From: Peter Marko <peter.marko@siemens.com>

Pick commit from:
* https://gitlab.freedesktop.org/gstreamer/gstreamer/-/merge_requests/8035

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 ...at-most-64-channels-to-NONE-position.patch | 35 +++++++++++++++++++
 .../gstreamer1.0-plugins-base_1.22.12.bb      |  1 +
 2 files changed, 36 insertions(+)
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0004-vorbisdec-Set-at-most-64-channels-to-NONE-position.patch

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0004-vorbisdec-Set-at-most-64-channels-to-NONE-position.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0004-vorbisdec-Set-at-most-64-channels-to-NONE-position.patch
new file mode 100644
index 00000000000..2c44348a5dd
--- /dev/null
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0004-vorbisdec-Set-at-most-64-channels-to-NONE-position.patch
@@ -0,0 +1,35 @@
+From 3eee4954d70accf94262299994eb21107a65dea8 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Sebastian=20Dr=C3=B6ge?= <sebastian@centricular.com>
+Date: Mon, 30 Sep 2024 21:35:07 +0300
+Subject: [PATCH] vorbisdec: Set at most 64 channels to NONE position
+
+Thanks to Antonio Morales for finding and reporting the issue.
+
+Fixes GHSL-2024-115
+Fixes https://gitlab.freedesktop.org/gstreamer/gstreamer/-/issues/3869
+
+Part-of: <https://gitlab.freedesktop.org/gstreamer/gstreamer/-/merge_requests/8035>
+
+CVE: CVE-2024-47538
+Upstream-Status: Backport [https://gitlab.freedesktop.org/gstreamer/gstreamer/-/commit/3eee4954d70accf94262299994eb21107a65dea8]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ ext/vorbis/gstvorbisdec.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/ext/vorbis/gstvorbisdec.c b/ext/vorbis/gstvorbisdec.c
+index 6a410ed858..1fc4fa883e 100644
+--- a/ext/vorbis/gstvorbisdec.c
++++ b/ext/vorbis/gstvorbisdec.c
+@@ -204,7 +204,7 @@ vorbis_handle_identification_packet (GstVorbisDec * vd)
+     }
+     default:{
+       GstAudioChannelPosition position[64];
+-      gint i, max_pos = MAX (vd->vi.channels, 64);
++      gint i, max_pos = MIN (vd->vi.channels, 64);
+ 
+       GST_ELEMENT_WARNING (vd, STREAM, DECODE,
+           (NULL), ("Using NONE channel layout for more than 8 channels"));
+-- 
+2.30.2
+
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.12.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.12.bb
index 5905c2d5b1a..fbdd599eb93 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.12.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.12.bb
@@ -10,6 +10,7 @@ SRC_URI = "https://gstreamer.freedesktop.org/src/gst-plugins-base/gst-plugins-ba
            file://0001-ENGR00312515-get-caps-from-src-pad-when-query-caps.patch \
            file://0003-viv-fb-Make-sure-config.h-is-included.patch \
            file://0002-ssaparse-enhance-SSA-text-lines-parsing.patch \
+           file://0004-vorbisdec-Set-at-most-64-channels-to-NONE-position.patch \
            "
 SRC_URI[sha256sum] = "73cfadc3a6ffe77ed974cfd6fb391c605e4531f48db21dd6b9f42b8cb69bd8c1"
 
-- 
2.30.2


