Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C88EC30653
	for <webhook@archiver.kernel.org>; Thu,  4 Jul 2024 12:27:36 +0000 (UTC)
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
 by mx.groups.io with SMTP id smtpd.web10.8985.1720096050732077034
 for <openembedded-core@lists.openembedded.org>;
 Thu, 04 Jul 2024 05:27:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=p5DVRYDM;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.181, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-1fb3b7d0d3aso1904395ad.2
        for <openembedded-core@lists.openembedded.org>; Thu, 04 Jul 2024 05:27:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1720096050; x=1720700850; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HSNKiZrDffS37nRXJ6DPt38Up2PmLp6dSsA/8qMKB20=;
        b=p5DVRYDM7e57TTRfmc9r+E9CLVhsnQ/nbZty/Hr42+gVW2b+ckG3QTR1eWeXusfA0u
         Z35p9/FBpns44oNnQNLKn250qE7JYrKzUCYRsMjVr33WbrJlUKpIepFDxAKIzgln+/YN
         tcPuybUILG5p0fBfZI+72M4A55Nx9YgNQyr2CTGBvgkOk5TccQScX2JdpVaoW8yt5xKo
         DIsJehAXqNL8C6ghLb9s5KdNjH91tcXwsPCULpbwQCiZKgtid6sKAa3+mdmKLi3y7Omq
         r+4/9MHFfXlRoaZSCuFib3qzcfqIb+J9sER347k89b+nz3EbjeptqZepTJQ8YcYHotev
         Jqgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720096050; x=1720700850;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HSNKiZrDffS37nRXJ6DPt38Up2PmLp6dSsA/8qMKB20=;
        b=twp1aZd1aeYgtQ6umh6Q0a2Q8Gyg/I+C5gdxattahFNEtrC8RvFEJ8oU9RjWD/i2by
         JxlxyLwtfBdXJzdM09Nnft6DYsLtYJm7l/Vx3BGXyz3LKs2vkfNcBtIxWfgwU/mIO4Qb
         UuQTZBRrQPr9j+WXbNsRKS97/RjSTsuD4BoJ29dpzx7m4oT2qI/ZhHZS+7CmUGQYdjLR
         mqsM8IWhYyuC29f+1aL15lsAlb5Wh5pNvp10q35Fl/PHFiktikQ5Iif7zyNOBSexHZ53
         fS0P+POcF1aUGY1MiCVKm4o6Ma1WWMlmKmQ3B20tkFJN9odFcCwB+F4fYYU3B3/RdeS1
         aLhg==
X-Gm-Message-State: AOJu0Yyh5frw6TQD13TXra1/bwxz/hQKypvXw7votClmke5IOpyYhOXx
	KpPwg0w6krCQ2YusvfmZGGNQY3Km6bgc2XW19TcD7lU/hLtlWVO8qRWQl3Y5PKGxUv7BR592jet
	4
X-Google-Smtp-Source: AGHT+IFL800rlZOFAckgoUiwoIaRPpG8ewhfYxqenvvQeJYk4NkTKhAOg5wQeCaUkAExJA/F2O3WHg==
X-Received: by 2002:a17:903:1c8:b0:1fb:396c:7532 with SMTP id d9443c01a7336-1fb396c786cmr8571995ad.56.1720096049806;
        Thu, 04 Jul 2024 05:27:29 -0700 (PDT)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1fb1c79682csm29416075ad.8.2024.07.04.05.27.29
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jul 2024 05:27:29 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 06/21] gstreamer: upgrade 1.22.11 -> 1.22.12
Date: Thu,  4 Jul 2024 05:26:58 -0700
Message-Id: <a99d2e4bde8aaab9e97a42c3b08fdd8b544b5fb5.1720095886.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1720095886.git.steve@sakoman.com>
References: <cover.1720095886.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 04 Jul 2024 12:27:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201548

From: Archana Polampalli <archana.polampalli@windriver.com>

https://gstreamer.freedesktop.org/releases/1.22/#1.22.12

Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../{gst-devtools_1.22.11.bb => gst-devtools_1.22.12.bb}        | 2 +-
 ...reamer1.0-libav_1.22.11.bb => gstreamer1.0-libav_1.22.12.bb} | 2 +-
 ...{gstreamer1.0-omx_1.22.11.bb => gstreamer1.0-omx_1.22.12.bb} | 2 +-
 ...ugins-bad_1.22.11.bb => gstreamer1.0-plugins-bad_1.22.12.bb} | 2 +-
 ...ins-base_1.22.11.bb => gstreamer1.0-plugins-base_1.22.12.bb} | 2 +-
 ...ins-good_1.22.11.bb => gstreamer1.0-plugins-good_1.22.12.bb} | 2 +-
 ...ins-ugly_1.22.11.bb => gstreamer1.0-plugins-ugly_1.22.12.bb} | 2 +-
 ...amer1.0-python_1.22.11.bb => gstreamer1.0-python_1.22.12.bb} | 2 +-
 ...sp-server_1.22.11.bb => gstreamer1.0-rtsp-server_1.22.12.bb} | 2 +-
 ...reamer1.0-vaapi_1.22.11.bb => gstreamer1.0-vaapi_1.22.12.bb} | 2 +-
 .../{gstreamer1.0_1.22.11.bb => gstreamer1.0_1.22.12.bb}        | 2 +-
 11 files changed, 11 insertions(+), 11 deletions(-)
 rename meta/recipes-multimedia/gstreamer/{gst-devtools_1.22.11.bb => gst-devtools_1.22.12.bb} (95%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-libav_1.22.11.bb => gstreamer1.0-libav_1.22.12.bb} (91%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-omx_1.22.11.bb => gstreamer1.0-omx_1.22.12.bb} (95%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-bad_1.22.11.bb => gstreamer1.0-plugins-bad_1.22.12.bb} (98%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-base_1.22.11.bb => gstreamer1.0-plugins-base_1.22.12.bb} (98%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-good_1.22.11.bb => gstreamer1.0-plugins-good_1.22.12.bb} (97%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-ugly_1.22.11.bb => gstreamer1.0-plugins-ugly_1.22.12.bb} (94%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-python_1.22.11.bb => gstreamer1.0-python_1.22.12.bb} (91%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-rtsp-server_1.22.11.bb => gstreamer1.0-rtsp-server_1.22.12.bb} (90%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-vaapi_1.22.11.bb => gstreamer1.0-vaapi_1.22.12.bb} (95%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0_1.22.11.bb => gstreamer1.0_1.22.12.bb} (97%)

diff --git a/meta/recipes-multimedia/gstreamer/gst-devtools_1.22.11.bb b/meta/recipes-multimedia/gstreamer/gst-devtools_1.22.12.bb
similarity index 95%
rename from meta/recipes-multimedia/gstreamer/gst-devtools_1.22.11.bb
rename to meta/recipes-multimedia/gstreamer/gst-devtools_1.22.12.bb
index 2be406192f..c30341d1f0 100644
--- a/meta/recipes-multimedia/gstreamer/gst-devtools_1.22.11.bb
+++ b/meta/recipes-multimedia/gstreamer/gst-devtools_1.22.12.bb
@@ -12,7 +12,7 @@ SRC_URI = "https://gstreamer.freedesktop.org/src/gst-devtools/gst-devtools-${PV}
            file://0001-connect-has-a-different-signature-on-musl.patch \
            "
 
-SRC_URI[sha256sum] = "07766425ecb5bf857ab5ad3962321c55cd89f9386b720843f9df71c0a455eb9b"
+SRC_URI[sha256sum] = "015ff62789dab423edafe979b019c7de4c849a2b7e74912b20b74a70e5b68f72"
 
 DEPENDS = "json-glib glib-2.0 glib-2.0-native gstreamer1.0 gstreamer1.0-plugins-base"
 RRECOMMENDS:${PN} = "git"
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.22.11.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.22.12.bb
similarity index 91%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.22.11.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.22.12.bb
index f3287efa96..bd9ae2464e 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.22.11.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.22.12.bb
@@ -12,7 +12,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=69333daa044cb77e486cc36129f7a770 \
                     "
 
 SRC_URI = "https://gstreamer.freedesktop.org/src/gst-libav/gst-libav-${PV}.tar.xz"
-SRC_URI[sha256sum] = "6b13dcc9332ef27a7c1e7005c0196883874f91622f8aa6e52f218b05b15d2bf5"
+SRC_URI[sha256sum] = "3b60d4cac2fbcd085a93e9389ca23e0443bee1ca75574d31d4f12bb1bbecab48"
 
 S = "${WORKDIR}/gst-libav-${PV}"
 
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.22.11.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.22.12.bb
similarity index 95%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.22.11.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.22.12.bb
index 97348fb398..4db16ed10b 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.22.11.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.22.12.bb
@@ -10,7 +10,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c \
 
 SRC_URI = "https://gstreamer.freedesktop.org/src/gst-omx/gst-omx-${PV}.tar.xz"
 
-SRC_URI[sha256sum] = "18dfdf5f6b773d67e62a315c6cf6247da320b83603a5819493f53c69ed2eeef6"
+SRC_URI[sha256sum] = "6b0685b92ac735032d7987d1028afaeab0a98ab726e0c51e5b9bfc8f2da7c8b1"
 
 S = "${WORKDIR}/gst-omx-${PV}"
 
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.11.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.12.bb
similarity index 98%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.11.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.12.bb
index 523ee7a5ae..01c95ac85f 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.11.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.12.bb
@@ -10,7 +10,7 @@ SRC_URI = "https://gstreamer.freedesktop.org/src/gst-plugins-bad/gst-plugins-bad
            file://0002-avoid-including-sys-poll.h-directly.patch \
            file://0004-opencv-resolve-missing-opencv-data-dir-in-yocto-buil.patch \
            "
-SRC_URI[sha256sum] = "808d3b33fc4c71aeb2561c364a87c2e8a3e2343319a83244c8391be4b09499c8"
+SRC_URI[sha256sum] = "388b4c4412f42e36a38b17cc34119bc11879bd4d9fbd4ff6d03b2c7fc6b4d494"
 
 S = "${WORKDIR}/gst-plugins-bad-${PV}"
 
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.11.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.12.bb
similarity index 98%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.11.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.12.bb
index 7aa10eb646..5905c2d5b1 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.11.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.12.bb
@@ -11,7 +11,7 @@ SRC_URI = "https://gstreamer.freedesktop.org/src/gst-plugins-base/gst-plugins-ba
            file://0003-viv-fb-Make-sure-config.h-is-included.patch \
            file://0002-ssaparse-enhance-SSA-text-lines-parsing.patch \
            "
-SRC_URI[sha256sum] = "65eaf72296cc5edc985695a4d80affc931e64a79f4879d05615854f7a2cf5bd1"
+SRC_URI[sha256sum] = "73cfadc3a6ffe77ed974cfd6fb391c605e4531f48db21dd6b9f42b8cb69bd8c1"
 
 S = "${WORKDIR}/gst-plugins-base-${PV}"
 
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.22.11.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.22.12.bb
similarity index 97%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.22.11.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.22.12.bb
index 85143aa1b9..8099d70791 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.22.11.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.22.12.bb
@@ -8,7 +8,7 @@ SRC_URI = "https://gstreamer.freedesktop.org/src/gst-plugins-good/gst-plugins-go
            file://0001-qt-include-ext-qt-gstqtgl.h-instead-of-gst-gl-gstglf.patch \
            file://0001-v4l2-Define-ioctl_req_t-for-posix-linux-case.patch"
 
-SRC_URI[sha256sum] = "6ddd032381827d31820540735f0004b429436b0bdac19aaeab44fa22faad52e2"
+SRC_URI[sha256sum] = "9c1913f981900bd8867182639b20907b28ed78ef7a222cfbf2d8ba9dab992fa7"
 
 S = "${WORKDIR}/gst-plugins-good-${PV}"
 
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.22.11.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.22.12.bb
similarity index 94%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.22.11.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.22.12.bb
index 61f46fbf7e..714ee178d8 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.22.11.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.22.12.bb
@@ -15,7 +15,7 @@ SRC_URI = " \
             https://gstreamer.freedesktop.org/src/gst-plugins-ugly/gst-plugins-ugly-${PV}.tar.xz \
             "
 
-SRC_URI[sha256sum] = "7758b7decfd20c00cae5700822bcbbf03f98c723e33e17634db2e07ca1da60bf"
+SRC_URI[sha256sum] = "d59a1aaf8dd2cc416dc5b5c0b7aecd02b1811bf1229aa724e6c2a503d3799083"
 
 S = "${WORKDIR}/gst-plugins-ugly-${PV}"
 
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.22.11.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.22.12.bb
similarity index 91%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.22.11.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.22.12.bb
index 0fbb03f757..2eee5aee5e 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.22.11.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.22.12.bb
@@ -8,7 +8,7 @@ LICENSE = "LGPL-2.1-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=c34deae4e395ca07e725ab0076a5f740"
 
 SRC_URI = "https://gstreamer.freedesktop.org/src/${PNREAL}/${PNREAL}-${PV}.tar.xz"
-SRC_URI[sha256sum] = "f7a5450d93fd81bf46060dca7f4a048d095b6717961fec211731a11a994c99a7"
+SRC_URI[sha256sum] = "d98d3226efea20d5c440a28988a20319a953f7c594895df2bba4538633108e9f"
 
 DEPENDS = "gstreamer1.0 gstreamer1.0-plugins-base python3-pygobject"
 RDEPENDS:${PN} += "gstreamer1.0 gstreamer1.0-plugins-base python3-pygobject"
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.22.11.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.22.12.bb
similarity index 90%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.22.11.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.22.12.bb
index 554ed9ec8f..c89c22f334 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.22.11.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.22.12.bb
@@ -10,7 +10,7 @@ PNREAL = "gst-rtsp-server"
 
 SRC_URI = "https://gstreamer.freedesktop.org/src/${PNREAL}/${PNREAL}-${PV}.tar.xz"
 
-SRC_URI[sha256sum] = "ec49d474750a6ff6729c85b448abc607fb6840b21717ad7abc967e2adbf07a24"
+SRC_URI[sha256sum] = "bf6c7871e7cf3528e4ec87ddc2f2949691cd269f98e536482ae744c1405cf451"
 
 S = "${WORKDIR}/${PNREAL}-${PV}"
 
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.22.11.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.22.12.bb
similarity index 95%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.22.11.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.22.12.bb
index 87eb8484a1..ef75ed64b3 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.22.11.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.22.12.bb
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM = "file://COPYING.LIB;md5=4fbd65380cdd255951079008b364516c"
 
 SRC_URI = "https://gstreamer.freedesktop.org/src/${REALPN}/${REALPN}-${PV}.tar.xz"
 
-SRC_URI[sha256sum] = "6eae1360658302b9b512fa46b4d06f5b818dfce5f2f43d7d710ca8142719d8ad"
+SRC_URI[sha256sum] = "013ad729b2fe4fccda559bddc626bcb14230cfb90a2271049f8466bfec5d80df"
 
 S = "${WORKDIR}/${REALPN}-${PV}"
 DEPENDS = "libva gstreamer1.0 gstreamer1.0-plugins-base gstreamer1.0-plugins-bad"
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.11.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.12.bb
similarity index 97%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.11.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.12.bb
index 8965497d01..f4acb0977b 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.11.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.12.bb
@@ -22,7 +22,7 @@ SRC_URI = "https://gstreamer.freedesktop.org/src/gstreamer/gstreamer-${PV}.tar.x
            file://0003-tests-use-a-dictionaries-for-environment.patch \
            file://0004-tests-add-helper-script-to-run-the-installed_tests.patch \
            "
-SRC_URI[sha256sum] = "3d16259e9dab8b002c57ce208a09b350d8282f5b0197306c0cdba9a0d0799744"
+SRC_URI[sha256sum] = "ac352f3d02caa67f3b169daa9aa78b04dea0fc08a727de73cb28d89bd54c6f61"
 
 PACKAGECONFIG ??= "${@bb.utils.contains('PTEST_ENABLED', '1', 'tests', '', d)} \
                    check \
-- 
2.34.1


