Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
 by mx.groups.io with SMTP id smtpd.web10.1325.1620945530935307766
 for <openembedded-core@lists.openembedded.org>;
 Thu, 13 May 2021 15:38:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=oq9dW7Hn;
 spf=pass (domain: gmail.com, ip: 209.85.216.53, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f53.google.com with SMTP id g6-20020a17090adac6b029015d1a9a6f1aso312886pjx.1
        for <openembedded-core@lists.openembedded.org>; Thu, 13 May 2021 15:38:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=c8qkGYEPEHD7fGSajHdIi3f7ZjE8M9+3vthcE9vuzbM=;
        b=oq9dW7Hnboy9OgrJ6FcMNfnxOqOXlFGmio5upcTBPfwYEp6u5wMj4e0FUS8EWMQTDE
         Nbxn3Y87+N2RdhrLyQOc9k9B3nGbE2YjmJc+Q8ouXDP1+wyoPh1KJSaO/MW1y5dz9gX7
         rCLAWgSOgpGyaljtyEL6AsaimO/JWywBbBwPjeU108yiouWjD9f4XLOae4ihLclaD69y
         XJHxbaUurEN6xaa3eg2C0LPOadOK9wrmTCJzjybrCWGthUYVn4XNawWPg9S0UPKYGNtZ
         UWhOv2NbLukUm2jsJ4cvZF9wZvT5k+cSBsGZQEfCO8fswpOmevreGpuwTl/oYstgnU3A
         wjSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=c8qkGYEPEHD7fGSajHdIi3f7ZjE8M9+3vthcE9vuzbM=;
        b=I6waGRSgW00RgxjwoD8JeoIphO/rtNKGDPE0KZyvioIqFbWj86wnnG7IVhd13Ai12D
         AufMT4ibcZ7Arlvx/u2onWmScz/7wr4+5VyIGlmDRftuGVCbg39AOAN4qgoYUFNcaXow
         EBz4zxGJ3P/aVqCcBr0kl6iw9YSxJiOoloKh3uQsS21nbF0UqZs7KXmdZMN2FkdkDbhI
         dPy8ZJLLNS73gsHQGOdfIKYs8rrCog0UYgjgwSmTlMu0Ey6CpynvQmbw9Z101HybnzXQ
         hS7BZH7gdEqbzZBjFFMLZLbAK0NOL0z2RYcQZDKB8L9NWDmyuYAhgDHizwrs06czCI+B
         AH3g==
X-Gm-Message-State: AOAM533MnOx7C9UuS+W6xM385dwy+CmGkNhhLucCoy6n/647MchpxWxS
	Xt9lkqJWr0jbQTFEu2XM7N36rB2CxBv6/w==
X-Google-Smtp-Source: ABdhPJxB9DKVD/sHBTyuOWxitudZX9vaAdwvjqohzK4dLO1aZsRYlwYJPkHDnlxTumWBGD8GbJupOA==
X-Received: by 2002:a17:90a:3005:: with SMTP id g5mr2791562pjb.14.1620945530011;
        Thu, 13 May 2021 15:38:50 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::a7ac])
        by smtp.gmail.com with ESMTPSA id x133sm2898588pfc.19.2021.05.13.15.38.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 May 2021 15:38:49 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	Yann Dirson <yann@blade-group.com>
Subject: [PATCH 1/2] gst-examples,gstreamer1.0-libav: Add option to exclude from world build
Date: Thu, 13 May 2021 15:38:46 -0700
Message-Id: <20210513223847.1086544-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When LICENSE_FLAGS_WHITELIST does not have commercial in it then the
the dependencies like ffmpeg will become invisible and render these
packages unbuildable, therefore world build will report parse issues

its better to exclude them from world build in such cases

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Cc: Yann Dirson <yann@blade-group.com>
---
 meta/recipes-multimedia/gstreamer/gst-examples_1.18.4.bb       | 2 ++
 meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.18.4.bb | 3 +++
 2 files changed, 5 insertions(+)

diff --git a/meta/recipes-multimedia/gstreamer/gst-examples_1.18.4.bb b/meta/recipes-multimedia/gstreamer/gst-examples_1.18.4.bb
index 4670ab34db..196258e00f 100644
--- a/meta/recipes-multimedia/gstreamer/gst-examples_1.18.4.bb
+++ b/meta/recipes-multimedia/gstreamer/gst-examples_1.18.4.bb
@@ -33,3 +33,5 @@ RRECOMMENDS_${PN} = "gstreamer1.0-plugins-base-meta \
                       ${@bb.utils.contains("LICENSE_FLAGS_WHITELIST", "commercial", "gstreamer1.0-libav", "", d)} \
                      ${@bb.utils.contains("LICENSE_FLAGS_WHITELIST", "commercial", "gstreamer1.0-plugins-ugly-meta", "", d)}"
 RPROVIDES_${PN} += "gst-player gst-player-bin"
+
+EXCLUDE_FROM_WORLD = "${@bb.utils.contains("LICENSE_FLAGS_WHITELIST", "commercial", "0", "1", d)}"
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.18.4.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.18.4.bb
index 6a84f92f31..7c39e7da37 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.18.4.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.18.4.bb
@@ -6,6 +6,7 @@ SECTION = "multimedia"
 
 # ffmpeg has comercial license flags so add it as we need ffmpeg as a dependency
 LICENSE_FLAGS = "commercial"
+
 LICENSE = "LGPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6762ed442b3822387a51c92d928ead0d \
                     file://ext/libav/gstav.h;beginline=1;endline=18;md5=a752c35267d8276fd9ca3db6994fca9c \
@@ -22,3 +23,5 @@ inherit meson pkgconfig upstream-version-is-even
 
 FILES_${PN} += "${libdir}/gstreamer-1.0/*.so"
 FILES_${PN}-staticdev += "${libdir}/gstreamer-1.0/*.a"
+
+EXCLUDE_FROM_WORLD = "${@bb.utils.contains("LICENSE_FLAGS_WHITELIST", "commercial", "0", "1", d)}"
-- 
2.31.1

