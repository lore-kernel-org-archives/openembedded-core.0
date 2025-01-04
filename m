Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0755E7719B
	for <webhook@archiver.kernel.org>; Sat,  4 Jan 2025 13:42:26 +0000 (UTC)
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
 by mx.groups.io with SMTP id smtpd.web10.18136.1735998139876108481
 for <openembedded-core@lists.openembedded.org>;
 Sat, 04 Jan 2025 05:42:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=cU/M6EDG;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.174, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2165cb60719so186520965ad.0
        for <openembedded-core@lists.openembedded.org>; Sat, 04 Jan 2025 05:42:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1735998139; x=1736602939; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OggxUGiX/QoLvgGAZxn3ngkW0zTbTptp6vHo06wUxFM=;
        b=cU/M6EDGCd6LM7AQ9OwQXDv6iQKBN0TVfB5Xq9FdZ1lJWy05lETYwAVqOc+9gbNaRE
         +Cpg5i0d/Etfj+WgnmbTj/OCpqT7FOgmg8G7aMKcfuNzdVwUMSdEGTHF20ZW/0/Wl68Y
         LFFGebuZT07ZVOnPXlev9JKgFwj/7peYsfl9KTcjBihCtrjq8TjrkOcQv5LFuqxghyWo
         zN4NDjFDpAww4ZVWSi7pYHo+psYCBzI0vH+UAc5lzd+InfQW0rvUTgrDwUhRDVmhL5G6
         KIwvCaWRDG3PhtJwFXLyQFjciKusoklzsUlqkh865If6zzWqOl4qcDccLOB8Qhspwcio
         O4Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735998139; x=1736602939;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OggxUGiX/QoLvgGAZxn3ngkW0zTbTptp6vHo06wUxFM=;
        b=LmjBWO3juGLf03rSMuFMuKvjPcv0qadb0uQoUxxiJRhM9miI8vdEKdmSiLuGiEcjvP
         3IuOf9ggvoiSOVrVC3bzll7UDlqlOhp08T0QIn2LdMq3it4FER4ooOsSHuN5Hz77VBW0
         4W3Ah6wLnToyy4oESVg5SH6SmjYKZfhiK8L1nALLAPLw/XBq7oYFVW572kcZu+NdfzSL
         DmMYoMoDHKgmybxDFErLtktCbTt/rKl5FfQYoyrS1urSqUqv5AcblHo5YVs1RmILi+uP
         MXLM+wkbrgbtJRMal4CRPk+Yj8CqNYlNdpSYbcGJrmNrSZ1eNGjpN0eXlg7khsE66QIc
         u5Ig==
X-Gm-Message-State: AOJu0Yw4Pfu4e26px3KNrf9tCJ9RJNtvtQR/ECfc1l6c4Vbnuui/4WAV
	mNfTro5FmHVrdWaqRTYKAtuooJOabo4elKEHx+8lB7zrrtEA7ymZB38VkLjvaLv00qPdE252qA9
	x
X-Gm-Gg: ASbGnct3UwWxoJRYELctUiuypxut1uTYVxCH1acDq+56kgJwkWw82/RpGbsivUjwf/X
	8tf0biGJlgWW1Mx4zcD7e6Jj0/PK9ancNIac2H3lZwD+o4icpmLnA6kBcwkrCvt2cyHR/9S1P4G
	ibHwHU72i6OIzMx8nciA/bSMWOwlHhiX82LnuucUqWdcPn//zG36qUasTu0eAwsolFo9oM848h4
	UDdS7nVJ9Bf1gF+ybidEuHus/+Ruyg38vNgae++xfBkGA==
X-Google-Smtp-Source: AGHT+IEOj90fYoOUICmvQJ5UG0p8LvSLm+ZP6h/uMZYm+PevS5IlVy+YXnf1X99LvrHEReqPwSLJvg==
X-Received: by 2002:a05:6a00:4096:b0:729:c7b:9385 with SMTP id d2e1a72fcca58-72abdd7bdecmr77444729b3a.6.1735998139081;
        Sat, 04 Jan 2025 05:42:19 -0800 (PST)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72aad8faf93sm27966257b3a.153.2025.01.04.05.42.18
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Jan 2025 05:42:18 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 13/25] gstreamer1.0-plugins-good: patch CVE-2024-47774
Date: Sat,  4 Jan 2025 05:41:37 -0800
Message-ID: <cc560b159f6629bc018ce6d832551a81d4c3f8c8.1735997984.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1735997984.git.steve@sakoman.com>
References: <cover.1735997984.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 04 Jan 2025 13:42:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209382

From: Peter Marko <peter.marko@siemens.com>

Pick commit from:
* https://gitlab.freedesktop.org/gstreamer/gstreamer/-/merge_requests/8043

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 ...size-checks-and-avoid-overflows-when.patch | 46 +++++++++++++++++++
 .../gstreamer1.0-plugins-good_1.22.12.bb      |  1 +
 2 files changed, 47 insertions(+)
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0024-avisubtitle-Fix-size-checks-and-avoid-overflows-when.patch

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0024-avisubtitle-Fix-size-checks-and-avoid-overflows-when.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0024-avisubtitle-Fix-size-checks-and-avoid-overflows-when.patch
new file mode 100644
index 0000000000..33af003535
--- /dev/null
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0024-avisubtitle-Fix-size-checks-and-avoid-overflows-when.patch
@@ -0,0 +1,46 @@
+From 0870e87c7c02e28e22a09a7de0c5b1e5bed68c14 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Sebastian=20Dr=C3=B6ge?= <sebastian@centricular.com>
+Date: Fri, 4 Oct 2024 14:04:03 +0300
+Subject: [PATCH] avisubtitle: Fix size checks and avoid overflows when
+ checking sizes
+
+Thanks to Antonio Morales for finding and reporting the issue.
+
+Fixes GHSL-2024-262
+Fixes https://gitlab.freedesktop.org/gstreamer/gstreamer/-/issues/3890
+
+Part-of: <https://gitlab.freedesktop.org/gstreamer/gstreamer/-/merge_requests/8043>
+
+CVE: CVE-2024-47774
+Upstream-Status: Backport [https://gitlab.freedesktop.org/gstreamer/gstreamer/-/commit/0870e87c7c02e28e22a09a7de0c5b1e5bed68c14]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ gst/avi/gstavisubtitle.c | 5 +++--
+ 1 file changed, 3 insertions(+), 2 deletions(-)
+
+diff --git a/gst/avi/gstavisubtitle.c b/gst/avi/gstavisubtitle.c
+index efc5f04051..c816934da6 100644
+--- a/gst/avi/gstavisubtitle.c
++++ b/gst/avi/gstavisubtitle.c
+@@ -196,7 +196,7 @@ gst_avi_subtitle_parse_gab2_chunk (GstAviSubtitle * sub, GstBuffer * buf)
+   /* read 'name' of subtitle */
+   name_length = GST_READ_UINT32_LE (map.data + 5 + 2);
+   GST_LOG_OBJECT (sub, "length of name: %u", name_length);
+-  if (map.size <= 17 + name_length)
++  if (G_MAXUINT32 - 17 < name_length || map.size < 17 + name_length)
+     goto wrong_name_length;
+ 
+   name_utf8 =
+@@ -216,7 +216,8 @@ gst_avi_subtitle_parse_gab2_chunk (GstAviSubtitle * sub, GstBuffer * buf)
+   file_length = GST_READ_UINT32_LE (map.data + 13 + name_length);
+   GST_LOG_OBJECT (sub, "length srt/ssa file: %u", file_length);
+ 
+-  if (map.size < (17 + name_length + file_length))
++  if (G_MAXUINT32 - 17 - name_length < file_length
++      || map.size < 17 + name_length + file_length)
+     goto wrong_total_length;
+ 
+   /* store this, so we can send it again after a seek; note that we shouldn't
+-- 
+2.30.2
+
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.22.12.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.22.12.bb
index 7f8cd7c96c..247fda7f9c 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.22.12.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.22.12.bb
@@ -30,6 +30,7 @@ SRC_URI = "https://gstreamer.freedesktop.org/src/gst-plugins-good/gst-plugins-go
            file://0021-matroskademux-Put-a-copy-of-the-codec-data-into-the-.patch \
            file://0022-jpegdec-Directly-error-out-on-negotiation-failures.patch \
            file://0023-qtdemux-Avoid-integer-overflow-when-parsing-Theora-e.patch \
+           file://0024-avisubtitle-Fix-size-checks-and-avoid-overflows-when.patch \
           "
 
 SRC_URI[sha256sum] = "9c1913f981900bd8867182639b20907b28ed78ef7a222cfbf2d8ba9dab992fa7"
-- 
2.43.0


