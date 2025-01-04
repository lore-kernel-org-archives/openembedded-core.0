Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03D53E7719A
	for <webhook@archiver.kernel.org>; Sat,  4 Jan 2025 13:46:27 +0000 (UTC)
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
 by mx.groups.io with SMTP id smtpd.web11.18214.1735998385281670723
 for <openembedded-core@lists.openembedded.org>;
 Sat, 04 Jan 2025 05:46:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=x6WdFiBg;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.43, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-2ee76befe58so18589728a91.2
        for <openembedded-core@lists.openembedded.org>; Sat, 04 Jan 2025 05:46:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1735998384; x=1736603184; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wh1bdm4qwYKS9ZSLasP3TWTbskBLBCYgj0k19QoBf0I=;
        b=x6WdFiBgMRML8juJ3G8NM5U0AGKrWtrs1cM8bzZcEPy1g0rDmBmWx6/UmDNjjFVfVA
         bA2fIbSCezu6xO2f5/FKAgvd1voQ6OPB1j8KlQXfCC5k1et2Ui9/v05Chqxe8uernhC7
         0/bi3x8++r1O29L8842jp73OYwB+hbW6fOPzl3roybYL+UD2GOV0ANaCi/My1VF5Rj8y
         iXSSljv+3GyFk69vqpwlwKrRh4Psyg3Vdd6Kctvb8bwFe4QLsY0rZpebljeGvZNUiqYi
         fJ9itC7C+Qzg//G8F9I6f85VK0UolGqOU7cPHxvOwMWKfEJrMil9uh4ZNP0SepaxrBE6
         gqrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735998384; x=1736603184;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wh1bdm4qwYKS9ZSLasP3TWTbskBLBCYgj0k19QoBf0I=;
        b=HtQTvwjd2Sx/ix0oa09et1Ms/1CHK4llU0yIjEsnj/17RHj82EI7yRgRZ9dLgnHsh2
         7+bA8Abuu44oiVlr9dwl20hpFt0MduCkqVrQF1+2u8Bse36g0zUUJmcVLBquiWMdzLuK
         4VZRx7N86SGmZ5ptz8jkPaaqNkYcpUqU8Nt4jACWwNRVWLFD4ZtekJHA8PIfA/Wrzitu
         vA2OIjLpA+1a1aBIFZfRMEjMA2UwE4Cd1OtfuVR062Cbom2/atpxl8eljlS3qwzEB2aA
         wNCN3oqf9POMbzIeY4fb6hk5DFqSxXm7qv1GXL25452SLh5NxrChamD9LB1cM9I2hWvC
         UlxA==
X-Gm-Message-State: AOJu0YxXiSpyk+1egyu6UKQ4hqTcIkE0g8lLFmY9pgwzMLMtUZ1menZ0
	aVFI96wKch75xxuhaH1WFHEEzPjVtS6QqkHJ75o4+AtRn0K92eVYBkSE/xdhXuOFB1R70rcjDt8
	4
X-Gm-Gg: ASbGncurJu/UfqudqLEmAxRklzLcsoVsX2Z1nPwjx5bzSqyq0pI/kA0EMUrTb+0MIql
	MwyxOcVMEX64+kBaKlFWEt6VcTyVNDUKLZ8ckPsGX8ulwiK+I2lBFEYXHqHNeAojwoDdxNuUhQf
	GHVhhRU0IDIl0LquRfuYN2vnhcW4HQUffihqVfBUQ7BXchRRj11X5Iks9+uX2VhG/A2mtj5IWvB
	XqWgUB22q2jx26TtaE9SeXBk1vKsjjdimmcFeVsDYM2Jg==
X-Google-Smtp-Source: AGHT+IGf3bfwLNfIyO97HSpqWZCVA+rPjIWesXb5xwiTEOilbGpSp+fi4r/n0TzJ6sGA/cPIuCyRjw==
X-Received: by 2002:a17:90a:c2c7:b0:2ee:d193:f3d5 with SMTP id 98e67ed59e1d1-2f452debe41mr81948525a91.7.1735998384432;
        Sat, 04 Jan 2025 05:46:24 -0800 (PST)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2f447882b09sm33498230a91.41.2025.01.04.05.46.22
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Jan 2025 05:46:24 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][styhead 07/10] gstreamer1.0: upgrade 1.24.9 -> 1.24.10
Date: Sat,  4 Jan 2025 05:45:59 -0800
Message-ID: <07a0a380c8f934abcdaf10ee881b5177648ff67a.1735998221.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1735998221.git.steve@sakoman.com>
References: <cover.1735998221.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 04 Jan 2025 13:46:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209402

From: Wang Mingyu <wangmy@cn.fujitsu.com>

(From OE-Core rev: 42104c010fc6f9bdee84625604777974ad2b70a5)

Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../{gst-devtools_1.24.9.bb => gst-devtools_1.24.10.bb}         | 2 +-
 ...treamer1.0-libav_1.24.9.bb => gstreamer1.0-libav_1.24.10.bb} | 2 +-
 ...lugins-bad_1.24.9.bb => gstreamer1.0-plugins-bad_1.24.10.bb} | 2 +-
 ...gins-base_1.24.9.bb => gstreamer1.0-plugins-base_1.24.10.bb} | 2 +-
 ...gins-good_1.24.9.bb => gstreamer1.0-plugins-good_1.24.10.bb} | 2 +-
 ...gins-ugly_1.24.9.bb => gstreamer1.0-plugins-ugly_1.24.10.bb} | 2 +-
 ...eamer1.0-python_1.24.9.bb => gstreamer1.0-python_1.24.10.bb} | 2 +-
 ...tsp-server_1.24.9.bb => gstreamer1.0-rtsp-server_1.24.10.bb} | 2 +-
 ...treamer1.0-vaapi_1.24.9.bb => gstreamer1.0-vaapi_1.24.10.bb} | 2 +-
 .../{gstreamer1.0_1.24.9.bb => gstreamer1.0_1.24.10.bb}         | 2 +-
 10 files changed, 10 insertions(+), 10 deletions(-)
 rename meta/recipes-multimedia/gstreamer/{gst-devtools_1.24.9.bb => gst-devtools_1.24.10.bb} (95%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-libav_1.24.9.bb => gstreamer1.0-libav_1.24.10.bb} (91%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-bad_1.24.9.bb => gstreamer1.0-plugins-bad_1.24.10.bb} (98%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-base_1.24.9.bb => gstreamer1.0-plugins-base_1.24.10.bb} (98%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-good_1.24.9.bb => gstreamer1.0-plugins-good_1.24.10.bb} (97%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-ugly_1.24.9.bb => gstreamer1.0-plugins-ugly_1.24.10.bb} (94%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-python_1.24.9.bb => gstreamer1.0-python_1.24.10.bb} (91%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-rtsp-server_1.24.9.bb => gstreamer1.0-rtsp-server_1.24.10.bb} (90%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-vaapi_1.24.9.bb => gstreamer1.0-vaapi_1.24.10.bb} (96%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0_1.24.9.bb => gstreamer1.0_1.24.10.bb} (97%)

diff --git a/meta/recipes-multimedia/gstreamer/gst-devtools_1.24.9.bb b/meta/recipes-multimedia/gstreamer/gst-devtools_1.24.10.bb
similarity index 95%
rename from meta/recipes-multimedia/gstreamer/gst-devtools_1.24.9.bb
rename to meta/recipes-multimedia/gstreamer/gst-devtools_1.24.10.bb
index 63779b5aff..7e46634ed0 100644
--- a/meta/recipes-multimedia/gstreamer/gst-devtools_1.24.9.bb
+++ b/meta/recipes-multimedia/gstreamer/gst-devtools_1.24.10.bb
@@ -12,7 +12,7 @@ SRC_URI = "https://gstreamer.freedesktop.org/src/gst-devtools/gst-devtools-${PV}
            file://0001-connect-has-a-different-signature-on-musl.patch \
            "
 
-SRC_URI[sha256sum] = "cf1de1aafa6eb4fd0365932b251528e2340b88697541e021628c5f7259970fb8"
+SRC_URI[sha256sum] = "2983537148b0a8d52bad2a3f4c9dcca808fd5aa12fccee25acc4a4277f0780ec"
 
 DEPENDS = "json-glib glib-2.0 glib-2.0-native gstreamer1.0 gstreamer1.0-plugins-base"
 RRECOMMENDS:${PN} = "git"
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.24.9.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.24.10.bb
similarity index 91%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.24.9.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.24.10.bb
index a5cfc8632a..629e9516c3 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.24.9.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.24.10.bb
@@ -12,7 +12,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=69333daa044cb77e486cc36129f7a770 \
                     "
 
 SRC_URI = "https://gstreamer.freedesktop.org/src/gst-libav/gst-libav-${PV}.tar.xz"
-SRC_URI[sha256sum] = "32682e9ae508ee01f4fb134b3a520081e2ac007220997577624b1d16171d456c"
+SRC_URI[sha256sum] = "4cf2e2d8204e54ba8af9519a8b9b7ffa6e951a7087afa0dfe83c125d49bbb5fb"
 
 S = "${WORKDIR}/gst-libav-${PV}"
 
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.24.9.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.24.10.bb
similarity index 98%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.24.9.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.24.10.bb
index be2628d14a..789e1aef8e 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.24.9.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.24.10.bb
@@ -10,7 +10,7 @@ SRC_URI = "https://gstreamer.freedesktop.org/src/gst-plugins-bad/gst-plugins-bad
            file://0002-avoid-including-sys-poll.h-directly.patch \
            file://0004-opencv-resolve-missing-opencv-data-dir-in-yocto-buil.patch \
            "
-SRC_URI[sha256sum] = "36fcf7a9af0a753b43bb03b9835246f74d72f7124369e66a1e2dc7b04f5a5cab"
+SRC_URI[sha256sum] = "1707e3103950c9baed364a8af2ba0495d6b113fcd36e1062dda5f582b8f8904d"
 
 S = "${WORKDIR}/gst-plugins-bad-${PV}"
 
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.24.9.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.24.10.bb
similarity index 98%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.24.9.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.24.10.bb
index 996a06500e..452685d2ea 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.24.9.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.24.10.bb
@@ -11,7 +11,7 @@ SRC_URI = "https://gstreamer.freedesktop.org/src/gst-plugins-base/gst-plugins-ba
            file://0003-viv-fb-Make-sure-config.h-is-included.patch \
            file://0002-ssaparse-enhance-SSA-text-lines-parsing.patch \
            "
-SRC_URI[sha256sum] = "5bb3b946907d3ce04dd842b610c8111c2b0611351b25a1fa22af5efa897857cb"
+SRC_URI[sha256sum] = "ebd57b1be924c6e24f327dd55bab9d8fbaaebe5e1dc8fca784182ab2b12d23eb"
 
 S = "${WORKDIR}/gst-plugins-base-${PV}"
 
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.24.9.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.24.10.bb
similarity index 97%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.24.9.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.24.10.bb
index 95f03b1da2..653aa1cfc4 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.24.9.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.24.10.bb
@@ -6,7 +6,7 @@ BUGTRACKER = "https://gitlab.freedesktop.org/gstreamer/gst-plugins-good/-/issues
 
 SRC_URI = "https://gstreamer.freedesktop.org/src/gst-plugins-good/gst-plugins-good-${PV}.tar.xz"
 
-SRC_URI[sha256sum] = "897de50bff337e3ca2f86f1eaa28e0828d83024156162a50c4ea0af86e29799f"
+SRC_URI[sha256sum] = "fce748fa66d7a8ee1fb261489e59d01e3fa787623d6d5c35068416fe7cd0acb3"
 
 S = "${WORKDIR}/gst-plugins-good-${PV}"
 
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.24.9.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.24.10.bb
similarity index 94%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.24.9.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.24.10.bb
index 45abe68659..607dc71971 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.24.9.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.24.10.bb
@@ -15,7 +15,7 @@ SRC_URI = " \
             https://gstreamer.freedesktop.org/src/gst-plugins-ugly/gst-plugins-ugly-${PV}.tar.xz \
             "
 
-SRC_URI[sha256sum] = "4b6b30110f38cd05eb67422297142b75a55fe00003105f48b13603e6761cc3b6"
+SRC_URI[sha256sum] = "9df6fd85a7256241efbb25f84b337575e3b345266f5dab3849371e4694779f18"
 
 S = "${WORKDIR}/gst-plugins-ugly-${PV}"
 
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.24.9.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.24.10.bb
similarity index 91%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.24.9.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.24.10.bb
index 25c9179bfd..f682f093eb 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.24.9.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.24.10.bb
@@ -8,7 +8,7 @@ LICENSE = "LGPL-2.1-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=c34deae4e395ca07e725ab0076a5f740"
 
 SRC_URI = "https://gstreamer.freedesktop.org/src/${PNREAL}/${PNREAL}-${PV}.tar.xz"
-SRC_URI[sha256sum] = "80e61d587c34cbac79e46c927b71cf32c4bf9bb0868ce5aa4b7444bdad83f42e"
+SRC_URI[sha256sum] = "135bcf8b6f1468bc31e5660409fe8ed38109f01dec44743514aa2fa6b3863309"
 
 DEPENDS = "gstreamer1.0 gstreamer1.0-plugins-base python3-pygobject"
 RDEPENDS:${PN} += "gstreamer1.0 gstreamer1.0-plugins-base python3-pygobject"
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.24.9.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.24.10.bb
similarity index 90%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.24.9.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.24.10.bb
index 776e177b9f..a33c8c0027 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.24.9.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.24.10.bb
@@ -10,7 +10,7 @@ PNREAL = "gst-rtsp-server"
 
 SRC_URI = "https://gstreamer.freedesktop.org/src/${PNREAL}/${PNREAL}-${PV}.tar.xz"
 
-SRC_URI[sha256sum] = "299c9aafac3c91bbebe4cd481ed4e4ade8cb2b0677097bc4a8dcf6d4364c9804"
+SRC_URI[sha256sum] = "db21dfdd7bf2e718564d557378ada5358b411efe2a3e89e9f0f87a74537e2adc"
 
 S = "${WORKDIR}/${PNREAL}-${PV}"
 
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.24.9.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.24.10.bb
similarity index 96%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.24.9.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.24.10.bb
index 0cc62e345e..31b4aa27e3 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.24.9.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.24.10.bb
@@ -13,7 +13,7 @@ SRC_URI = "https://gstreamer.freedesktop.org/src/${REALPN}/${REALPN}-${PV}.tar.x
            file://0001-meson-Re-added-required-lines-accidentally-removed.patch \
            "
 
-SRC_URI[sha256sum] = "c2373e9b4d6655535d355207f60084b0fb3b28566fe9bb4ca1da714439da4ae1"
+SRC_URI[sha256sum] = "21593dbde5c6bcdcfe99195defbe3c3f4da01cb85f8ec10aae943887d39d8a4c"
 
 S = "${WORKDIR}/${REALPN}-${PV}"
 DEPENDS = "libva gstreamer1.0 gstreamer1.0-plugins-base gstreamer1.0-plugins-bad"
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.24.9.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.24.10.bb
similarity index 97%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0_1.24.9.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0_1.24.10.bb
index a756f9e3a2..326a2f26a9 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.24.9.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.24.10.bb
@@ -22,7 +22,7 @@ SRC_URI = "https://gstreamer.freedesktop.org/src/gstreamer/gstreamer-${PV}.tar.x
            file://0003-tests-use-a-dictionaries-for-environment.patch \
            file://0004-tests-add-helper-script-to-run-the-installed_tests.patch \
            "
-SRC_URI[sha256sum] = "ebf47b6beef508a00c8557d4c1f1713e5c7ef9ba70dac45deed80e182bcf260f"
+SRC_URI[sha256sum] = "9fc45b1a332e8f812f09e95c281cd75969f6d1682d062a815db0e7bc047518fd"
 
 PACKAGECONFIG ??= "${@bb.utils.contains('PTEST_ENABLED', '1', 'tests', '', d)} \
                    check \
-- 
2.43.0


