Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
 by mx.groups.io with SMTP id smtpd.web08.5356.1605279177183003945
 for <openembedded-core@lists.openembedded.org>;
 Fri, 13 Nov 2020 06:52:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=02DoepSc;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.170, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f170.google.com with SMTP id q10so7837801pfn.0
        for <openembedded-core@lists.openembedded.org>; Fri, 13 Nov 2020 06:52:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=1ht2Y1GvJOXifrh2O4RpC5Y4oXdrVlUVTgAKHEr7VgE=;
        b=02DoepScBuSf5vtjNmuzc7vDBSjgdA4nXMcEiUQL8O0ye3qbSCoSp30uLyuZb8fsox
         5gns/vNnRUQCA0aDikqqK+HWq7NcLrRhw40NYJOICNU0DXYDixpjHkR1oeENIWX6dUVK
         6w5qNgn0vT3yyYzOyBrbnG+wVhWL17/I3rNMKUsz1m2yyqDYjiKfX/uNu4mfYCBYKxPO
         p59Fww1YlofRVr1P60ngSsPvt2ZgNn3ZP62Eq9puLURYWW9FzikRKQNjHVbeBzgHNi6n
         KnF7xOV/2yJx942C3F6/qPNIWH54xBIzqStFVHZbNVCGcouQY4ZSCeY/DWzyN4j0liGc
         5TtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=1ht2Y1GvJOXifrh2O4RpC5Y4oXdrVlUVTgAKHEr7VgE=;
        b=Yqd3BfFUYANsNNg5yknjc7ECcXSsZmZ23m1qG3pwNzvrY5cKA0K2+4SOaqJ5Fuh/Zm
         2mBqiUoM6xK3nMDVaWv58HJHfQVrdND5fP5jcUka6ECFM+71yGrPYhc2Udn/dZ5drpIl
         3Vl5OiQItl85cVNlEStQw9M6rhlO9P8AhhyiyktashbiHwTSUhLeYi7mT9Fyg+ZZ+Ic+
         VKvFOtkzJ2KnYyFZF/cJlZHUPtzAUeqgcuQKzuF/vRnu2NIlVJbKkDTyXcAGWI+nJqMq
         A6XSJUDaMdt5K48GUXQkaYG9S02LFOoFUw1w1b181fgYV3U3dstoSJAeB7Kj1cRgnoli
         Zz/g==
X-Gm-Message-State: AOAM530BwuefvVgcszhPbsDH0RgPMPbEwpdlHgQ8Vn50U2CcsqS6jBUT
	OjoTCCw7Jr5yU0DZVrwRLRFC0nB8r0ggYpEk
X-Google-Smtp-Source: ABdhPJxht1++p+sdql8eJ7zepmARLExQ8IpUThOvsazcM1XOHCWjA9rUgaorCHq1yQPsxSFmF5LoLQ==
X-Received: by 2002:a17:90a:8903:: with SMTP id u3mr3295921pjn.204.1605279176286;
        Fri, 13 Nov 2020 06:52:56 -0800 (PST)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id r134sm10370694pfc.145.2020.11.13.06.52.55
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2020 06:52:55 -0800 (PST)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 08/18] clutter-gst-3.0: do not call out to host gstreamer plugin scanner
Date: Fri, 13 Nov 2020 04:52:12 -1000
Message-Id: <a88495acd867ba1268428cebe0d2d6c672d24b38.1605278902.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1605278902.git.steve@sakoman.com>
References: <cover.1605278902.git.steve@sakoman.com>

From: Alexander Kanavin <alex.kanavin@gmail.com>

This is host contamination and can also fail for all kinds of
reasons when running under usermode qemu.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit fb60d0920b660dffb346b2212dc6f8ba2a0b9fde)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-graphics/clutter/clutter-gst-3.0.inc | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-graphics/clutter/clutter-gst-3.0.inc b/meta/recipes-graphics/clutter/clutter-gst-3.0.inc
index fc3eade886..7d9db1f38c 100644
--- a/meta/recipes-graphics/clutter/clutter-gst-3.0.inc
+++ b/meta/recipes-graphics/clutter/clutter-gst-3.0.inc
@@ -6,6 +6,8 @@ inherit clutter features_check upstream-version-is-even gobject-introspection
 # depends on clutter-1.0 which depends on cogl-1.0
 REQUIRED_DISTRO_FEATURES ?= "opengl"
 
+export GST_PLUGIN_SCANNER_1_0="${S}/gst-plugin-scanner-dummy"
+
 SRC_URI += "file://0001-Install-example-binary-needed-for-core-image-clutter.patch"
 
 DEPENDS = "gstreamer1.0-plugins-base gstreamer1.0-plugins-bad clutter-1.0 libgudev"
-- 
2.17.1

