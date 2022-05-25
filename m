Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B50FBC433EF
	for <webhook@archiver.kernel.org>; Wed, 25 May 2022 14:30:06 +0000 (UTC)
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com
 [209.85.210.178])
 by mx.groups.io with SMTP id smtpd.web09.7394.1653489002211546535
 for <openembedded-core@lists.openembedded.org>;
 Wed, 25 May 2022 07:30:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=da+zehgI;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.178,
 mailfrom: steve@sakoman.com)
Received: by mail-pf1-f178.google.com with SMTP id f21so7026109pfa.3
        for <openembedded-core@lists.openembedded.org>;
 Wed, 25 May 2022 07:30:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Lc/2KZdlQyDBMKJ2NbbFZMiBWmrHYYCSJaYe1kHZfTU=;
        b=da+zehgIdPXvVkXa5bkkDwFvDWlhL3lD91/Hc4ASsIIH9N3UKyqeks4u2g+XhuG+vz
         tN5mfDTTHWxFbjMFN6J6y0O87LdnjPlDccGeqS9VuPuIfrr6yfQWDE2RNwx/cdPjC02s
         ilqEX0C59dcBrhLArCHz3W1zVldJFy40pZ/PENkqtqCZyn7zYkEE8eSSZtRsreuZJ2rM
         kpq50qtwmg1LfmJlEakFSMx2cgG2QNO+LPUv+jnPrJN6CPYuGwiAG6/8pHW5Ght1JNWX
         1nml+2xKPtWMAkfCwMaF/IzbXAqtR7QP/ZcvH/2GF5uCQ89NP6r8DYcHWL/b5wtTVBbh
         J+mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Lc/2KZdlQyDBMKJ2NbbFZMiBWmrHYYCSJaYe1kHZfTU=;
        b=ZW4N/JvQF0zaQjOcMP0PCd4NTVnGns5WeO/83fpmmLMQbM2nLeswGYr4c/HPxK/ob5
         Isk3+xffQ2jjQfU2P/AJqUWJ80a0bo5T07vESpJJivYimJMCtx3mbFa9nkmRxO3lhljj
         mXEzWQQN48hhl2aeD4eWpdYM7RmVC/SYzOqSGqWENruc7cOHRT5bTJ+8nSnW304bxOts
         nI+lqu/WhQCb2cRseezxQ6Q6a6ePjV0uHi5FaMxVD0YtdsgS+pHJd/zDTC6AdHFgfG/0
         YQCtxsc4KBdxPReZG8xgWYEhsA7uKnrsAG34hz9et5GEH+3FGu3+KfCT8Ws8hMQ2cWKn
         GIMg==
X-Gm-Message-State: AOAM530Qhihe6bhosKjs5/2pANnMyQo6UFRVADbGqasP3R0sjDy96ORY
	XU4wDMadTH+ZyBmFDGMUMdVuFlKFHH9992WM
X-Google-Smtp-Source: 
 ABdhPJxTQrEefWzopQNabQyryZPU8qRj3NZ4wmw69YHs2dFGVreo0iotBLmXUMUOVZCV6Ow7oP/FuQ==
X-Received: by 2002:a63:34f:0:b0:3fa:8782:557e with SMTP id
 76-20020a63034f000000b003fa8782557emr10142519pgd.424.1653489000360;
        Wed, 25 May 2022 07:30:00 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 a8-20020a656408000000b003db141a5f26sm8553837pgv.1.2022.05.25.07.29.58
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 May 2022 07:29:59 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 00/19] Patch review
Date: Wed, 25 May 2022 04:29:28 -1000
Message-Id: <cover.1653488418.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 25 May 2022 14:30:06 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166126

Please review this set of patches for kirkstone and have comments back by end
of day Friday.

Passed a-full on autobuilder:

https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/3703

The following changes since commit d3beac233558242ab6895e9ba8536a6df9df8eb3:

  selftest/imagefeatures/overlayfs: Always append to DISTRO_FEATURES (2022-05-22 11:40:26 -1000)

are available in the Git repository at:

  git://git.openembedded.org/openembedded-core-contrib stable/kirkstone-nut
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=stable/kirkstone-nut

Alexander Kanavin (15):
  gst-devtools: upgrade 1.20.1 -> 1.20.2
  gstreamer1.0-libav: upgrade 1.20.1 -> 1.20.2
  gstreamer1.0-omx: upgrade 1.20.1 -> 1.20.2
  gstreamer1.0-plugins-bad: upgrade 1.20.1 -> 1.20.2
  gstreamer1.0-plugins-base: upgrade 1.20.1 -> 1.20.2
  gstreamer1.0-plugins-good: upgrade 1.20.1 -> 1.20.2
  gstreamer1.0-plugins-ugly: upgrade 1.20.1 -> 1.20.2
  gstreamer1.0-python: upgrade 1.20.1 -> 1.20.2
  gstreamer1.0-rtsp-server: upgrade 1.20.1 -> 1.20.2
  gstreamer1.0: upgrade 1.20.1 -> 1.20.2
  gstreamer1.0-vaapi: upgrade 1.20.1 -> 1.20.2
  libcgroup: upgrade 2.0.1 -> 2.0.2
  mesa: upgrade 22.0.2 -> 22.0.3
  mobile-broadband-provider-info: upgrade 20220315 -> 20220511
  sqlite3: upgrade 3.38.3 -> 3.38.5

Hitendra Prajapati (1):
  pcre2: CVE-2022-1586 Out-of-bounds read

Peter Kjellerstedt (1):
  license_image.bbclass: Make QA errors fail the build

Ross Burton (1):
  oeqa/selftest/cve_check: add tests for recipe and image reports

Steve Sakoman (1):
  go: upgrade 1.17.8 -> 1.17.10

 meta/classes/license_image.bbclass            |  2 +
 meta/lib/oeqa/selftest/cases/cve_check.py     | 77 ++++++++++++++++++-
 .../mobile-broadband-provider-info_git.bb     |  4 +-
 ...{libcgroup_2.0.1.bb => libcgroup_2.0.2.bb} |  2 +-
 .../go/{go-1.17.8.inc => go-1.17.10.inc}      |  2 +-
 ..._1.17.8.bb => go-binary-native_1.17.10.bb} |  4 +-
 ...1.17.8.bb => go-cross-canadian_1.17.10.bb} |  0
 ...go-cross_1.17.8.bb => go-cross_1.17.10.bb} |  0
 ...sssdk_1.17.8.bb => go-crosssdk_1.17.10.bb} |  0
 ...-native_1.17.8.bb => go-native_1.17.10.bb} |  0
 ...untime_1.17.8.bb => go-runtime_1.17.10.bb} |  0
 .../go/{go_1.17.8.bb => go_1.17.10.bb}        |  0
 .../{mesa-gl_22.0.2.bb => mesa-gl_22.0.3.bb}  |  0
 meta/recipes-graphics/mesa/mesa.inc           |  2 +-
 .../mesa/{mesa_22.0.2.bb => mesa_22.0.3.bb}   |  0
 ...tools_1.20.1.bb => gst-devtools_1.20.2.bb} |  2 +-
 ...1.20.1.bb => gstreamer1.0-libav_1.20.2.bb} |  2 +-
 ...x_1.20.1.bb => gstreamer1.0-omx_1.20.2.bb} |  2 +-
 ....bb => gstreamer1.0-plugins-bad_1.20.2.bb} |  2 +-
 ...bb => gstreamer1.0-plugins-base_1.20.2.bb} |  2 +-
 ...bb => gstreamer1.0-plugins-good_1.20.2.bb} |  2 +-
 ...bb => gstreamer1.0-plugins-ugly_1.20.2.bb} |  2 +-
 ....20.1.bb => gstreamer1.0-python_1.20.2.bb} |  2 +-
 ....bb => gstreamer1.0-rtsp-server_1.20.2.bb} |  2 +-
 ...1.20.1.bb => gstreamer1.0-vaapi_1.20.2.bb} |  2 +-
 ...er1.0_1.20.1.bb => gstreamer1.0_1.20.2.bb} |  2 +-
 .../libpcre/libpcre2/CVE-2022-1586.patch      | 58 ++++++++++++++
 .../recipes-support/libpcre/libpcre2_10.39.bb |  5 +-
 .../{sqlite3_3.38.3.bb => sqlite3_3.38.5.bb}  |  2 +-
 29 files changed, 158 insertions(+), 22 deletions(-)
 rename meta/recipes-core/libcgroup/{libcgroup_2.0.1.bb => libcgroup_2.0.2.bb} (93%)
 rename meta/recipes-devtools/go/{go-1.17.8.inc => go-1.17.10.inc} (92%)
 rename meta/recipes-devtools/go/{go-binary-native_1.17.8.bb => go-binary-native_1.17.10.bb} (83%)
 rename meta/recipes-devtools/go/{go-cross-canadian_1.17.8.bb => go-cross-canadian_1.17.10.bb} (100%)
 rename meta/recipes-devtools/go/{go-cross_1.17.8.bb => go-cross_1.17.10.bb} (100%)
 rename meta/recipes-devtools/go/{go-crosssdk_1.17.8.bb => go-crosssdk_1.17.10.bb} (100%)
 rename meta/recipes-devtools/go/{go-native_1.17.8.bb => go-native_1.17.10.bb} (100%)
 rename meta/recipes-devtools/go/{go-runtime_1.17.8.bb => go-runtime_1.17.10.bb} (100%)
 rename meta/recipes-devtools/go/{go_1.17.8.bb => go_1.17.10.bb} (100%)
 rename meta/recipes-graphics/mesa/{mesa-gl_22.0.2.bb => mesa-gl_22.0.3.bb} (100%)
 rename meta/recipes-graphics/mesa/{mesa_22.0.2.bb => mesa_22.0.3.bb} (100%)
 rename meta/recipes-multimedia/gstreamer/{gst-devtools_1.20.1.bb => gst-devtools_1.20.2.bb} (95%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-libav_1.20.1.bb => gstreamer1.0-libav_1.20.2.bb} (91%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-omx_1.20.1.bb => gstreamer1.0-omx_1.20.2.bb} (95%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-bad_1.20.1.bb => gstreamer1.0-plugins-bad_1.20.2.bb} (98%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-base_1.20.1.bb => gstreamer1.0-plugins-base_1.20.2.bb} (97%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-good_1.20.1.bb => gstreamer1.0-plugins-good_1.20.2.bb} (97%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-ugly_1.20.1.bb => gstreamer1.0-plugins-ugly_1.20.2.bb} (94%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-python_1.20.1.bb => gstreamer1.0-python_1.20.2.bb} (91%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-rtsp-server_1.20.1.bb => gstreamer1.0-rtsp-server_1.20.2.bb} (90%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-vaapi_1.20.1.bb => gstreamer1.0-vaapi_1.20.2.bb} (95%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0_1.20.1.bb => gstreamer1.0_1.20.2.bb} (97%)
 create mode 100644 meta/recipes-support/libpcre/libpcre2/CVE-2022-1586.patch
 rename meta/recipes-support/sqlite/{sqlite3_3.38.3.bb => sqlite3_3.38.5.bb} (86%)

-- 
2.25.1


