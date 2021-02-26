Received: from mail-il1-f170.google.com (mail-il1-f170.google.com [209.85.166.170])
 by mx.groups.io with SMTP id smtpd.web08.9867.1614349658258808658
 for <openembedded-core@lists.openembedded.org>;
 Fri, 26 Feb 2021 06:27:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=NOsF54x5;
 spf=softfail (domain: sakoman.com, ip: 209.85.166.170, mailfrom: steve@sakoman.com)
Received: by mail-il1-f170.google.com with SMTP id f10so7590902ilq.5
        for <openembedded-core@lists.openembedded.org>; Fri, 26 Feb 2021 06:27:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=8U6wwGF3XFnnfI8YZzY3ejJOq3UNx1MJpgB8sijTJfc=;
        b=NOsF54x57xFr5PAhb93eflQxRagh+cXiCH+0IXiWSSZIgVk/qP0JGo2GURUHBUFW/Q
         ivrTrDuxGfLcxyE9G0EKyiT5nl6LlRkYbOoo0Qfc3W/ejAOgf+SXTO4Ea3KAbtiIqKOD
         +k16lK3v9C2shQ+rre6oo/CebwL6mBMoAxium0DYrpfz5WGlht2R2mCT2txZY51SIUtQ
         kMcplvf51x9js+NKPjyN07QWBUgcSlXF/zFsbYHhWSYy21b1oyonUOHObkOp44TIDAiw
         hDOMC8OAJsycnZztbDi5x7MEmSjn2oMU9yrTuBrG3q0IVOUMF2/q+bqqGPdkXbG32BxL
         0B4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=8U6wwGF3XFnnfI8YZzY3ejJOq3UNx1MJpgB8sijTJfc=;
        b=PXTUy6LshnDBAjc2r4ZhgPhV5zF4iU+kJyEXNIO3+KzbHx87vm76YGY5uQZX5bygjE
         jTrJWkxXwk23G3ipF9/Ck31nAm1UfYUNax8cmIbHyxscwBXUHrqyGvOYpW6VUXoz0emV
         lG5g+75U1k+xJd3VSCQCjUH29LcXpHvnS4YuwYmsI+8h/rf/6/sBiMcYTxJFR9ZlQVEt
         jXOdWaovkgXnyEeITB9HWAck16UDNvZnoC9GZi2JDK8LipMSqdmnUzHSfDWo6GBWkt31
         zUaov662tgUKLQFim/pl/QgLEQSWYt0buyaDkNN0p35l0NoX7M0xEduoj83S+J+xWbGf
         7G5A==
X-Gm-Message-State: AOAM5330G1P1TLOLm8WlnqK+8Ao0sCn7JPNI0uOUCxBjqCtfwGw8LElT
	MxdgafvQ306IwhiCjaBb2Bm7JCqD9+pPMvIx
X-Google-Smtp-Source: ABdhPJyPWzsPbN15W65re7prMLve6Ez5SF5tnCCgyzE0gXHZwTj1Ptl7ayGI9vXJPxWZbPdKUjWpIQ==
X-Received: by 2002:a92:dc01:: with SMTP id t1mr2628123iln.192.1614349657102;
        Fri, 26 Feb 2021 06:27:37 -0800 (PST)
Return-Path: <steve@sakoman.com>
Received: from hexa.router0800d9.com ([72.173.249.164])
        by smtp.gmail.com with ESMTPSA id i3sm5383377ioq.13.2021.02.26.06.27.33
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Feb 2021 06:27:36 -0800 (PST)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 31/40] libomxil: Fix up commercial license flag
Date: Fri, 26 Feb 2021 04:24:14 -1000
Message-Id: <1beb49f79da2ee3612ff334fd41b6e9526033354.1614348990.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1614348990.git.steve@sakoman.com>
References: <cover.1614348990.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Joshua Watt <JPEWhacker@gmail.com>

The commercial license flag on libomxil is set because it may include
the Adaptive Multi-Rate audio codec (AMR) using FFmepg, which is patent
encumbered.

It turns out this component is disabled by default in the recipe; add a
PACKAGECONFIG to enable it and trigger the "commercial" LICENSE_FLAGS on
it. This make the default build configuration clean unless a user
specifically asks for AMR support, and prevents them from marking the
recipe with the "commerical" flag unnecessarily which could hide
potential problems later on.

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 5f61e20002c2af93e2d6810574e23606925526ee)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-multimedia/libomxil/libomxil_0.9.3.bb | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-multimedia/libomxil/libomxil_0.9.3.bb b/meta/recipes-multimedia/libomxil/libomxil_0.9.3.bb
index 271c2a30a3..8f3b76a920 100644
--- a/meta/recipes-multimedia/libomxil/libomxil_0.9.3.bb
+++ b/meta/recipes-multimedia/libomxil/libomxil_0.9.3.bb
@@ -4,7 +4,7 @@ DESCRIPTION = "Bellagio is an opensource implementation of the Khronos OpenMAX \
 HOMEPAGE = "http://omxil.sourceforge.net/"
 
 LICENSE = "LGPLv2.1+"
-LICENSE_FLAGS = "commercial"
+LICENSE_FLAGS = "${@bb.utils.contains('PACKAGECONFIG', 'amr', 'commercial', '', d)}"
 LIC_FILES_CHKSUM = "file://COPYING;md5=ae6f0f4dbc7ac193b50f323a6ae191cb \
                     file://src/omxcore.h;beginline=1;endline=27;md5=806b1e5566c06486fe8e42b461e03a90"
 
@@ -26,6 +26,10 @@ EXTRA_OECONF += "--disable-doc --disable-Werror"
 
 PROVIDES += "virtual/libomxil"
 
+PACKAGECONFIG ??= ""
+
+PACKAGECONFIG[amr] = "--enable-amr,,"
+
 #
 # The .so files under ${libdir}/bellagio are not intended to be versioned and symlinked.
 # Make sure they get packaged in the main package.
-- 
2.25.1

