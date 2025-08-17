Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3BDFCA0EED
	for <webhook@archiver.kernel.org>; Sun, 17 Aug 2025 20:51:32 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.web11.60605.1755463889865955999
 for <openembedded-core@lists.openembedded.org>;
 Sun, 17 Aug 2025 13:51:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=QBIex4eC;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.47, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-45a1b0cbbbaso23502075e9.3
        for <openembedded-core@lists.openembedded.org>; Sun, 17 Aug 2025 13:51:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1755463888; x=1756068688; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FQhk6JW+nw3bn0ySWv4RX+Girm6quJwNHaH/KtH2XMc=;
        b=QBIex4eCL0/xByhsWz5vWAIW5MEmf6oxRaUExZ2v6HDevAkWjCA4wB0nUCwj51EOHy
         otadBq6lxxYdkB1jqq464gpZMMzS+TdMI8koElQkBkrmZr119KsnmvOpUTvjBddJKxy4
         eB4wGBqS9askf35Ps9lKxRXqUPcTdf/f3NAWg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755463888; x=1756068688;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FQhk6JW+nw3bn0ySWv4RX+Girm6quJwNHaH/KtH2XMc=;
        b=MknST3IHwE/M5s3CnSzoR/0wJrdGCxfmDNK0+EevBYWUk0ZLavrFttLYOmQ71vJFoT
         OA4bPeQmc46b/KRyoqFE1tj1hEkAFZaaIwwuPRIEbjW82b1EEfEhTrxVjiyVCN8rUpot
         KKv7VC60N8Eo6682TaL+eyzRFbSBgCmXpkHS7qg8BDAX4VoF226qHQd02beQWkerx4iV
         9lJT9tUjveQzn76dIjg1ROrTPQotIk17pIlYvGuMLWM5v2CcWL2EZZcl6/xa0v3u1TPE
         87tnaaHWfyNhxkJh88F0AVVaodr9IVFGhjSkKLytnhsYgNJsq14iAtEJSdJdoVuiFsQQ
         tq7g==
X-Gm-Message-State: AOJu0Yze+ZC9gBatXqL8wxoGbNIXhD6OVWfgMG1NKACc8SaITzL1yVLv
	nMAGIVU31XIlzPDRKAuWtXpNh0hAhC66U+Kd08rpLIGfdqXFCMe+c7BiBkVZg013fQXCaBSf+5x
	QoBma
X-Gm-Gg: ASbGncsMkaCnhV7gt6Q5xvk5v5eKbiJZj+ckWLG6I2kOmcqlxKUViskSyVVmsd1mHmw
	XgYic/9gLQnu5D8fpCKS/jl7Qp+jK6sxfkkAUOv0mp4qBbVnnF9hEF4PHCHcI3lDxcZeBZiGsLN
	fK7xPc2ufuUlGHXSn+iIJ7Se6Mmoah6/i1NbCb6gaMH3xXddkxtoUESK+1Ujn2q5xwXBitbIggI
	JJbggyuSHlHY1U+EIMxKF5xDTR9hTn3Sf8PkIZz9K+zNzpVUJoeWkqTIkpbt/279GG/qgRUaYlo
	G83kBaglZ8Bf8qd4/0YEr6gjBJ0+Rs6+bBLQISz9r8b0RvZSh/urWJokP3huqV9sZKEkqD6veeF
	tvPiHrYJ/vIHwFT+rWwQlsSkkANlEpKtmEC9ILTsBitNSl7FbPM0oAuz4WnAX7Q==
X-Google-Smtp-Source: AGHT+IHU6MVxZTnty5rSLtiH5lK1S/CgNxDh6XN9Leqqz4ITcy539j1YKG6peuR26wQCC19fadL2jA==
X-Received: by 2002:a05:600c:35ce:b0:458:bc2c:b2ed with SMTP id 5b1f17b1804b1-45a217f9222mr61649775e9.7.1755463887851;
        Sun, 17 Aug 2025 13:51:27 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:128f:f0b2:1625:2f99])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45a1c6ce764sm143284475e9.10.2025.08.17.13.51.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Aug 2025 13:51:27 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Cc: Mingli Yu <mingli.yu@windriver.com>
Subject: [PATCH 2/5] babeltrace2: Enable python plugins
Date: Sun, 17 Aug 2025 21:51:16 +0100
Message-ID: <20250817205124.3384337-2-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250817205124.3384337-1-richard.purdie@linuxfoundation.org>
References: <20250817205124.3384337-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 17 Aug 2025 20:51:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222022

From: Mingli Yu <mingli.yu@windriver.com>

* The lttng-tools test fails as below as it needs bt2 module.
ERROR: ust/high-throughput/test_high_throughput_snapshot.py
===========================================================

Traceback (most recent call last):
  File "/usr/lib/lttng-tools/ptest/tests/regression/./ust/high-throughput/test_high_throughput_snapshot.py", line 26, in <module>
    import bt2
ModuleNotFoundError: No module named 'bt2'

Enable python plugins for babeltrace2 to provide the above support.

* Add swig-native to DEPENDS to fix the below configure error.
 | configure: error: SWIG 2.0.0 or newer is required to build the python bindings

* There are some ptest failed cases after enable python plugins and
track the failed ptest as https://bugs.lttng.org/issues/1430.

(From OE-Core rev: 94e41b38ccc47de50e89e159d75dacd8029e1b0f)

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-kernel/lttng/babeltrace2_2.1.1.bb | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-kernel/lttng/babeltrace2_2.1.1.bb b/meta/recipes-kernel/lttng/babeltrace2_2.1.1.bb
index 8bab7f677a6..88f589eafbc 100644
--- a/meta/recipes-kernel/lttng/babeltrace2_2.1.1.bb
+++ b/meta/recipes-kernel/lttng/babeltrace2_2.1.1.bb
@@ -5,7 +5,7 @@ BUGTRACKER = "https://bugs.lttng.org/projects/babeltrace"
 LICENSE = "MIT & GPL-2.0-only & LGPL-2.1-only & BSD-2-Clause & BSD-4-Clause & GPL-3.0-or-later & CC-BY-SA-4.0 & PSF-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=f6b015e4f388d6e78adb1b1f9a887d06"
 
-DEPENDS = "glib-2.0 util-linux popt bison-native flex-native virtual/libiconv"
+DEPENDS = "glib-2.0 util-linux popt bison-native flex-native virtual/libiconv swig-native"
 
 SRC_URI = "git://git.efficios.com/babeltrace.git;branch=stable-2.1;protocol=https;tag=v${PV} \
            file://run-ptest \
@@ -19,13 +19,13 @@ UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>2(\.\d+)+)$"
 
 inherit autotools pkgconfig ptest python3targetconfig
 
-EXTRA_OECONF = "--disable-debug-info --disable-Werror"
+EXTRA_OECONF = "--disable-debug-info --disable-Werror --enable-python-plugins --enable-python-bindings"
 
 PACKAGECONFIG ??= "manpages"
 PACKAGECONFIG[manpages] = ", --disable-man-pages, asciidoc-native xmlto-native"
 
 FILES:${PN}-staticdev += "${libdir}/babeltrace2/plugins/*.a"
-FILES:${PN} += "${libdir}/babeltrace2/plugins/*.so"
+FILES:${PN} += "${libdir}/babeltrace2/plugins/*.so ${PYTHON_SITEPACKAGES_DIR}/*"
 
 ASNEEDED = ""
 LDFLAGS += "${@bb.utils.contains('DISTRO_FEATURES', 'ld-is-lld ptest', '-fuse-ld=bfd ', '', d)}"

