Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
 by mx.groups.io with SMTP id smtpd.web12.9786.1607360907957504042
 for <openembedded-core@lists.openembedded.org>;
 Mon, 07 Dec 2020 09:08:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=hFSTYtbh;
 spf=pass (domain: gmail.com, ip: 209.85.208.172, mailfrom: wickbergster@gmail.com)
Received: by mail-lj1-f172.google.com with SMTP id t22so15813586ljk.0
        for <openembedded-core@lists.openembedded.org>; Mon, 07 Dec 2020 09:08:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=h/i+erBNpYK/2G5B+iql8p0DL2yPcstXld5gTYux0zA=;
        b=hFSTYtbhyi91ZZLYnql3itpEe32N4s1GLcxZ1t9X0BdGLHbo2KSarsFe7FbaestDjZ
         9F3pm9Tcq3kuhfb3j1KBkJ+dqs31wwcVbLnvYLAtOtBAzJNl7QW6sE1OGURhNmTGvg+9
         TnbE0NRNRU2aCc7dwQV5OcRPrSnftfrC156ulEQY9Mq5m5lSA4eQ5+bfgVj05B6ARlWV
         7hXBVttUNJxP9e6b75yBGG0fW5SVHfH13VGZYiQV0cA+o1T5brkwj1wdqAzz+eSe1kPb
         SrTQM1+Apm83WbVoOot/wHcnBpjfxn3sbC/NC9EhahXuw+q1liTUbuqJ6yXgAQcFU95S
         Jc0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=h/i+erBNpYK/2G5B+iql8p0DL2yPcstXld5gTYux0zA=;
        b=jqbwOgF6AP9qtg6aEuixFE28aFASKKMVydzbj5Oq1w8fx1ns1u10JEZxO3Vk4HMOxb
         jJcTBIh0yLW0YvBfg7SXR+hXtWEdqomXi9+cacIhxporT674uOJggFLsFCg/ulivd319
         RXyV+AVpR4WEi80sOflOKxMwnMh98ZB0sImKSPg7spyoZCEwMrqjv3fMgLoc5HXWb+Nm
         UjEZYCNdJdvXAf1WARXB9b2ueAD5SKANHRP6f6itp9nwaQfmmP1UDbG2aPWR8jRfIzTV
         y4jU0yf4lxYZCUPCWb1HALfOIIwXlDNAcHVQMlZU26JUWUJ+gB9/eo8R49tm5hRVIPoe
         MSVA==
X-Gm-Message-State: AOAM530dzxcM0sYn8vMIWlmOS8G/h7/4Kq15jLwO9oeKr8h8YALhIx+k
	DpAAHg5QMChJ8EY252F1v051rglQrJ0=
X-Google-Smtp-Source: ABdhPJzcmNtkW6xPs1uMXqkEGCYb6RmB28DC32tnjx4Kj62A3UCWgLGX9R9nbHG8CWqA/Kun8AbCIA==
X-Received: by 2002:a2e:a374:: with SMTP id i20mr9154239ljn.101.1607360905574;
        Mon, 07 Dec 2020 09:08:25 -0800 (PST)
Return-Path: <wickbergster@gmail.com>
Received: from localhost.localdomain (dyn-13-cust157.netit.se. [85.89.70.157])
        by smtp.gmail.com with ESMTPSA id q7sm3067069ljp.77.2020.12.07.09.08.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Dec 2020 09:08:24 -0800 (PST)
From: "Alexander Vickberg" <wickbergster@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Vickberg <wickbergster@gmail.com>
Subject: [meta-oe][PATCH] libwebsockets: upgrade to 4.1.6
Date: Mon,  7 Dec 2020 18:06:59 +0100
Message-Id: <20201207170659.15580-1-wickbergster@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Event lib support is now built into dynamically loaded plugins so
package them separately and include them in RDEPENDS if enabled.

Building minimal-examples with generated SDK failed due to cmake
configuration had static enabled but not included into SDK. Solve
this by adding static as PACKAGECONFIG option and adding
${PN}-staticdev to RDEPENDS_${PN}-dev if enabled.

Remove CFLAGS_append with -Wno-error for fixing building with Os.
This looks like it's fixed in upstream.

Signed-off-by: Alexander Vickberg <wickbergster@gmail.com>
---
 ...ckets_4.0.20.bb => libwebsockets_4.1.6.bb} | 20 +++++++++++++------
 1 file changed, 14 insertions(+), 6 deletions(-)
 rename meta-oe/recipes-connectivity/libwebsockets/{libwebsockets_4.0.20.bb => libwebsockets_4.1.6.bb} (51%)

diff --git a/meta-oe/recipes-connectivity/libwebsockets/libwebsockets_4.0.20.bb b/meta-oe/recipes-connectivity/libwebsockets/libwebsockets_4.1.6.bb
similarity index 51%
rename from meta-oe/recipes-connectivity/libwebsockets/libwebsockets_4.0.20.bb
rename to meta-oe/recipes-connectivity/libwebsockets/libwebsockets_4.1.6.bb
index 5427daac4..e922d681f 100644
--- a/meta-oe/recipes-connectivity/libwebsockets/libwebsockets_4.0.20.bb
+++ b/meta-oe/recipes-connectivity/libwebsockets/libwebsockets_4.1.6.bb
@@ -6,8 +6,8 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=8c47b078124308a4e1354e8d59f606b7"
 DEPENDS = "zlib"
 
 S = "${WORKDIR}/git"
-SRCREV = "ec9e8ab892f2dc569ae09336c80c2796fd14a6ff"
-SRC_URI = "git://github.com/warmcat/libwebsockets.git;protocol=https;branch=v4.0-stable"
+SRCREV = "736f0739ed8c75db0e29c7678b5a9194e957c347"
+SRC_URI = "git://github.com/warmcat/libwebsockets.git;protocol=https;branch=v4.1-stable"
 
 UPSTREAM_CHECK_URI = "https://github.com/warmcat/${BPN}/releases"
 UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>\d+(\.\d+)+)"
@@ -18,18 +18,26 @@ PACKAGECONFIG ?= "libuv client server http2 ssl"
 PACKAGECONFIG[client] = "-DLWS_WITHOUT_CLIENT=OFF,-DLWS_WITHOUT_CLIENT=ON,"
 PACKAGECONFIG[http2] = "-DLWS_WITH_HTTP2=ON,-DLWS_WITH_HTTP2=OFF,"
 PACKAGECONFIG[ipv6] = "-DLWS_IPV6=ON,-DLWS_IPV6=OFF,"
+PACKAGECONFIG[libevent] = "-DLWS_WITH_LIBEVENT=ON,-DLWS_WITH_LIBEVENT=OFF,libevent"
 PACKAGECONFIG[libev] = "-DLWS_WITH_LIBEV=ON,-DLWS_WITH_LIBEV=OFF,libev"
 PACKAGECONFIG[libuv] = "-DLWS_WITH_LIBUV=ON,-DLWS_WITH_LIBUV=OFF,libuv"
 PACKAGECONFIG[server] = "-DLWS_WITHOUT_SERVER=OFF,-DLWS_WITHOUT_SERVER=ON,"
 PACKAGECONFIG[ssl] = "-DLWS_WITH_SSL=ON,-DLWS_WITH_SSL=OFF,openssl"
-PACKAGECONFIG[testapps] = "-DLWS_WITHOUT_TESTAPPS=OFF,-DLWS_WITHOUT_TESTAPPS=ON,"
+PACKAGECONFIG[static] = "-DLWS_WITH_STATIC=ON,-DLWS_WITH_STATIC=OFF -DLWS_LINK_TESTAPPS_DYNAMIC=ON,"
 
 EXTRA_OECMAKE += " \
     -DLIB_SUFFIX=${@d.getVar('baselib').replace('lib', '')} \
 "
 
-PACKAGES =+ "${PN}-testapps"
+PACKAGES =+ "${PN}-testapps ${PN}-evlib_event ${PN}-evlib_uv ${PN}-evlib_ev"
 
-FILES_${PN}-testapps += "${datadir}/libwebsockets-test-server/*"
+FILES_${PN}-testapps += "${datadir}/libwebsockets-test-server/* ${bindir}/libwebsockets-test-*"
+FILES_${PN}-evlib_event += "${libdir}/libwebsockets-evlib_event.so"
+FILES_${PN}-evlib_uv += "${libdir}/libwebsockets-evlib_uv.so"
+FILES_${PN}-evlib_ev += "${libdir}/libwebsockets-evlib_ev.so"
 
-CFLAGS_append = " -Wno-error"
+RDEPENDS_${PN} += " ${@bb.utils.contains('PACKAGECONFIG', 'libevent', '${PN}-evlib_event', '', d)}"
+RDEPENDS_${PN} += " ${@bb.utils.contains('PACKAGECONFIG', 'libuv', '${PN}-evlib_uv', '', d)}"
+RDEPENDS_${PN} += " ${@bb.utils.contains('PACKAGECONFIG', 'libev', '${PN}-evlib_ev', '', d)}"
+
+RDEPENDS_${PN}-dev += " ${@bb.utils.contains('PACKAGECONFIG', 'static', '${PN}-staticdev', '', d)}"
-- 
2.25.1

