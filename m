Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F1B6C3ABCC
	for <webhook@archiver.kernel.org>; Tue, 13 May 2025 12:47:22 +0000 (UTC)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.web11.75563.1747140431394484467
 for <openembedded-core@lists.openembedded.org>;
 Tue, 13 May 2025 05:47:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=VKhotmvn;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.47, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-3a1fb17a9beso2412405f8f.3
        for <openembedded-core@lists.openembedded.org>; Tue, 13 May 2025 05:47:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1747140428; x=1747745228; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=DOzotZIM9CsuQ7fj20D94KEz8Zzkj0ACObZEF9/LR1E=;
        b=VKhotmvnN/vdv7PHrKvw3uW7QfkGmkF55bGLrLGxg+hutv9nboIK1wOKPukjWFDs45
         ubJ+BF49LmJOa5foG5QLFckJ/I3TZx0T3BjFeeXSsnECLGxz/jjG2FWgGQWyaNLHTzyS
         jb9RiNFqryQgpdrDiPkZENG6YDlQ0EoA8LNQY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747140428; x=1747745228;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DOzotZIM9CsuQ7fj20D94KEz8Zzkj0ACObZEF9/LR1E=;
        b=sGWtkMDJiIRAyqUOvJeqRHIaDkjJ704bg9aeXsaJiXzzkLK+CQVmGC/N8yG3Q5ymZt
         A+Wmu/VZ9sSW7QHiePFA1+U4y4MFftyuX/67YvKqNPGhAZeQ/ofoRadINOSohV7u8iDp
         fh4NjsAnbxUnBzbUJYYVgOmUUQX1sP2kU3T37+cis9r0U//rzYp4E6ClB2jw5A7KKYi3
         CI5kKxJwuTIKODrYMyrhjGjzbEgLvei43VinIHT67F9xRhDsIe0NErk2YTsjoPZbIlng
         t5ADJ1k6ri2cfZdV2xOxBXNqTYHRBGJotqWYlO6oam+JrHlYDm2N4519AccfqDl0aqar
         ad7w==
X-Gm-Message-State: AOJu0Yx7pZi8BzNy9HeioPq0Ke1V5hNztGeiPlP3uGf0T+t8KMTzP9RS
	K0LsY9f+7KLH4lHI8hgludwvFJwZhZiBF1EPgGRTe/CcYyn2JuauFcvWHX8g1ZwxB+tWTj2TywD
	s
X-Gm-Gg: ASbGncswl2AEcflHo7ADy4B/p71Fj86CJ2wyGsDQFFVLgDFr8F1jzxJIzyT1ZLzfw7K
	cCT62lOlkgANGQi9eqmBzL6gvH39iEL/Mgce6s3NqAiJj3P7GSVa6Tny3/OLXuqvSChYKu73S3w
	u/TY9s8CJl01L6EZunGW3NW5CxDoJR4fdCS5h6408OqI3IUiU4c1X1RcEuml4gigufCr5GiAnXn
	kvfYWGEwLrGWYO6/zm8OCOi4ATK1KwTbSacvE2DIPfXlL0WZX4hAEuCHYkZ2y0vDTv+ltMpZVTt
	SAgfge/1Q27BTrW6lBFqi6jsvF9NucNcshZq1fqSXuIjn3paZ2l8OZ+h1dWrjo/TLChf6TD+0RN
	K6S0=
X-Google-Smtp-Source: AGHT+IG2FeBaVpkIV2eA5Qkpb+Y68ju83jmfrD6UPDN8EiXEissoERdTQe8zE3r5aeI+DXkmTxuaRw==
X-Received: by 2002:a5d:64ae:0:b0:3a0:b294:ccc8 with SMTP id ffacd0b85a97d-3a1f64b43d9mr12424359f8f.59.1747140428412;
        Tue, 13 May 2025 05:47:08 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:8d0:97f6:fa2f:73cd])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a1f58f2fe6sm16414942f8f.58.2025.05.13.05.47.07
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 May 2025 05:47:07 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/2] gst-examples: Update 1.18.6 -> 1.26.1
Date: Tue, 13 May 2025 13:47:05 +0100
Message-ID: <20250513124706.1312750-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 13 May 2025 12:47:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216420

Update to the version from the gstreamer monorepo, bringing it back
into line with the other gstreamer revisions.

Drop the libsoup-2.4 dependency which disables the webrtc code, we
weren't building that anyway as it needs libnice enabled in
gstreamer-plugins-bad.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 ...001-Make-player-examples-installable.patch | 26 +++++++++----------
 ...mples_1.18.6.bb => gst-examples_1.26.1.bb} |  8 +++---
 2 files changed, 17 insertions(+), 17 deletions(-)
 rename meta/recipes-multimedia/gstreamer/{gst-examples_1.18.6.bb => gst-examples_1.26.1.bb} (84%)

diff --git a/meta/recipes-multimedia/gstreamer/gst-examples/0001-Make-player-examples-installable.patch b/meta/recipes-multimedia/gstreamer/gst-examples/0001-Make-player-examples-installable.patch
index ab93c132446..828c87dc9a0 100644
--- a/meta/recipes-multimedia/gstreamer/gst-examples/0001-Make-player-examples-installable.patch
+++ b/meta/recipes-multimedia/gstreamer/gst-examples/0001-Make-player-examples-installable.patch
@@ -13,25 +13,25 @@ https://bugzilla.gnome.org/show_bug.cgi?id=777827
  playback/player/gtk/meson.build      | 1 +
  2 files changed, 2 insertions(+)
 
-diff --git a/playback/player/gst-play/meson.build b/playback/player/gst-play/meson.build
-index 8ec021d..977cc5c 100644
---- a/playback/player/gst-play/meson.build
-+++ b/playback/player/gst-play/meson.build
+Index: gst-examples/playback/player/gst-play/meson.build
+===================================================================
+--- gst-examples.orig/playback/player/gst-play/meson.build
++++ gst-examples/playback/player/gst-play/meson.build
 @@ -2,5 +2,6 @@ executable('gst-play',
      ['gst-play.c',
       'gst-play-kb.c',
       'gst-play-kb.h'],
 +    install: true,
-     dependencies : [gst_dep, gstplayer_dep, m_dep])
+     dependencies : [gst_dep, dependency('gstreamer-play-1.0'), m_dep])
  
-diff --git a/playback/player/gtk/meson.build b/playback/player/gtk/meson.build
-index f7a7419..6281130 100644
---- a/playback/player/gtk/meson.build
-+++ b/playback/player/gtk/meson.build
-@@ -13,5 +13,6 @@ if gtk_dep.found()
-         gtk_play_resources,
+Index: gst-examples/playback/player/gtk/meson.build
+===================================================================
+--- gst-examples.orig/playback/player/gtk/meson.build
++++ gst-examples/playback/player/gtk/meson.build
+@@ -20,5 +20,6 @@ if gtk_dep.found()
         'gtk-video-renderer.h',
         'gtk-video-renderer.c'],
-+    install: true,
-       dependencies : [glib_dep, gobject_dep, gmodule_dep, gst_dep, gsttag_dep, gstplayer_dep, gtk_dep, x11_dep])
+       c_args :  extra_c_args,
++      install: true,
+       dependencies : [gst_dep, gsttag_dep, gstplay_dep, gtk_dep, x11_dep])
  endif
diff --git a/meta/recipes-multimedia/gstreamer/gst-examples_1.18.6.bb b/meta/recipes-multimedia/gstreamer/gst-examples_1.26.1.bb
similarity index 84%
rename from meta/recipes-multimedia/gstreamer/gst-examples_1.18.6.bb
rename to meta/recipes-multimedia/gstreamer/gst-examples_1.26.1.bb
index 70b72fd7fb5..59c7a4ade19 100644
--- a/meta/recipes-multimedia/gstreamer/gst-examples_1.18.6.bb
+++ b/meta/recipes-multimedia/gstreamer/gst-examples_1.26.1.bb
@@ -5,16 +5,16 @@ BUGTRACKER = "https://gitlab.freedesktop.org/gstreamer/gst-examples/-/issues"
 LICENSE = "LGPL-2.0-or-later"
 LIC_FILES_CHKSUM = "file://playback/player/gtk/gtk-play.c;beginline=1;endline=20;md5=f8c72dae3d36823ec716a9ebcae593b9"
 
-DEPENDS = "glib-2.0 gstreamer1.0 gstreamer1.0-plugins-base gstreamer1.0-plugins-bad gtk+3 libsoup-2.4 json-glib glib-2.0-native"
+DEPENDS = "glib-2.0 gstreamer1.0 gstreamer1.0-plugins-base gstreamer1.0-plugins-bad gtk+3 json-glib glib-2.0-native"
 
-SRC_URI = "git://gitlab.freedesktop.org/gstreamer/gst-examples.git;protocol=https;branch=1.18 \
+SRC_URI = "git://gitlab.freedesktop.org/gstreamer/gstreamer.git;protocol=https;branch=1.26 \
            file://0001-Make-player-examples-installable.patch \
            file://gst-player.desktop \
            "
 
-SRCREV = "70e4fcf4fc8ae19641aa990de5f37d758cdfcea4"
+SRCREV = "7174e955ec066fb8d1fb683cc82713e0615826b6"
 
-S = "${WORKDIR}/git"
+S = "${WORKDIR}/git/subprojects/gst-examples"
 
 inherit meson pkgconfig features_check
 

