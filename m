Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2284E77197
	for <webhook@archiver.kernel.org>; Sat,  4 Jan 2025 13:42:06 +0000 (UTC)
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
 by mx.groups.io with SMTP id smtpd.web10.18126.1735998120665853459
 for <openembedded-core@lists.openembedded.org>;
 Sat, 04 Jan 2025 05:42:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=kn6XR9+n;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.182, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-21661be2c2dso167257055ad.1
        for <openembedded-core@lists.openembedded.org>; Sat, 04 Jan 2025 05:42:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1735998120; x=1736602920; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aABZnD8GNilOked5q3EX5LviUqd3MzghWUspskYE48U=;
        b=kn6XR9+nYOzG7l6HxmjXihMhoyr35sIsl8eYRruaTWJb0L0ocN/5Ti1utQyOpZ3ZnX
         Mj97Cw0s+7m62WEHa0QlAkLGHCNRFKrtEDe50BYcaOqcFLP0y7WO4qBZRORqGBUcCvMZ
         IHDdilnWlGmVMTuHl1TDG2Gz377YyAHpb6cLcs5QxI4bMdW+6E1rRwGQgq20hfAJgZpK
         MTXa1drokjkLB3KHMdVEyfBN1aNKkS6vZ1azobKBBp3bhq6vJoOdTCThWAL3EI/3fhBa
         gu/MWnvHNE7JBZJmkokUvluOm01nuTsWOGbQXucByqghP9qYOdx1AiviXvjy618tPkyq
         dnyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735998120; x=1736602920;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aABZnD8GNilOked5q3EX5LviUqd3MzghWUspskYE48U=;
        b=VtdZ2MK2X7EwQOeLxhMzTv9MpiddcDykPhQCXTTNhG7g/MNlnLOV2YX6S1dLIXtmps
         eBX+rTN7yFF/FI9GO6nSd0U/Rk9VV3ynErCMQrGUGSXVbtUwWrXWXVtRnzHPnqnto+yQ
         hz8J3aOtcedY9tQKlkZPqKeDnz2CLKS/VZZzTSegl0niJ7KViHMP9PgNRF2LqqKIqVPj
         F31QDEGvOw3cuh6imaBHwMpgSisRzpPTmGGh90JjVxNmzhQKcED/Sf2dZYXzrGNlcl96
         3eQfxKmZSVBCbr/MtmZPjplFBwLlHYNYYiYyfch2k+KQsZZLPsVtbtNKjw+HbgrKxqwu
         rJJQ==
X-Gm-Message-State: AOJu0YyCPVQdkxURmGBbYR8wds0gCjLgewi6+0aGZl6yt5cwKO6XJz7P
	mGSLp8Sic1BydYYYij4iPkBQFhtkKbF9BxyIt3YrYDWwmpOjlOxCz3TTf/XdqOnVqajRgTFlwGH
	a
X-Gm-Gg: ASbGncubupR41tH0AWS45805sbd3tOzCcWze16WbMti751Q2ISNfXBhAbdkISJOXvbF
	qZ0EPKk+UMoj0E79VZZDK+0loiO3X8uR37MFLfxDVue8sP4J8dC1B1rjyl5Qxlcc96ZpMvQTyv7
	jCez3d9yU4sTMLqmmt0wT7oHfStG1VJfn+H7B2EHCTpkPcI4DQBUCXb3AYaIgHY4lCSfUmeZkfY
	ylt2/aDblUIqDaI+UV7D+DcKmevnAxWt6m9rovlR4Skwg==
X-Google-Smtp-Source: AGHT+IEWA7jal31EID9xXeaMN//WgwnUL4jANMyK2tn3F8cvGs/6+PzJmN/o8Czc1wW2u2fG3ewlfg==
X-Received: by 2002:a05:6a20:12d5:b0:1e0:cf9a:87b1 with SMTP id adf61e73a8af0-1e5e04476f0mr74476529637.6.1735998119865;
        Sat, 04 Jan 2025 05:41:59 -0800 (PST)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72aad8faf93sm27966257b3a.153.2025.01.04.05.41.58
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Jan 2025 05:41:59 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 02/25] gstreamer1.0-plugins-base: patch CVE-2024-47538
Date: Sat,  4 Jan 2025 05:41:26 -0800
Message-ID: <e7dbf6d73a11e6e9ec16035711179f451044eb09.1735997984.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1735997984.git.steve@sakoman.com>
References: <cover.1735997984.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 04 Jan 2025 13:42:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209371

From: Peter Marko <peter.marko@siemens.com>

Pick commit from:
* https://gitlab.freedesktop.org/gstreamer/gstreamer/-/merge_requests/8035

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 ...at-most-64-channels-to-NONE-position.patch | 35 +++++++++++++++++++
 .../gstreamer1.0-plugins-base_1.22.12.bb      |  1 +
 2 files changed, 36 insertions(+)
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0004-vorbisdec-Set-at-most-64-channels-to-NONE-position.patch

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0004-vorbisdec-Set-at-most-64-channels-to-NONE-position.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0004-vorbisdec-Set-at-most-64-channels-to-NONE-position.patch
new file mode 100644
index 0000000000..2c44348a5d
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
index 5905c2d5b1..fbdd599eb9 100644
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
2.43.0


