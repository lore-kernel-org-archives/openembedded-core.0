Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
 by mx.groups.io with SMTP id smtpd.web10.6334.1618822853414101810
 for <openembedded-core@lists.openembedded.org>;
 Mon, 19 Apr 2021 02:00:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=a9/JZE+W;
 spf=pass (domain: gmail.com, ip: 209.85.218.54, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f54.google.com with SMTP id n2so51668613ejy.7
        for <openembedded-core@lists.openembedded.org>; Mon, 19 Apr 2021 02:00:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=qJwyiOEDKgS/cO1Fsf4az5qSnUlTp2us+0Z0aX23zt4=;
        b=a9/JZE+WTloKL1xQlG16pmXzv7buZshGFQ9Af5wH3Kgd2lAwKYbI/ds27oAwxmk6nF
         wee288y3uZ94+ouu3Ru90Xn32g8lVAQy1pB205Rpu0MYw/jqQ5hk04ub8iB4T/VXKfcd
         qYq89hSfBtfLXG16tX2UibkSrV4zR1E3KSj6YD95Y35e5NtQ0oFaNQxs2FXrMRC658bb
         Sx0+V+/grarpwocaQUYc5cmFlpDhjLxtgRjcdh8/EokH0YzB7clfWSyWGMuW3HXspbe0
         mQr3XhBiHVlXjCpLtWzBPLHXo3RelkQOjER+v3l30Spez80bzklAFJTwN70b6902IAsr
         rFWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=qJwyiOEDKgS/cO1Fsf4az5qSnUlTp2us+0Z0aX23zt4=;
        b=kkT8pJ9lIbbnVEofR3DE5RUJcl6iEbWvW9V4fAeHUmzyN7h26WsNG+KnavWelHCorM
         257h/V/XlUw61gRExFLkwLw3/xccp8kiw2Y1t6EhDSefZMVZ7LKGZ1Yy349/eZmvHdcZ
         pzZAYD+u0XEVlFSA2z6VExiIVSOpgVF+FqFlNMQPkP0OL4tmJ+f/xYkiBNwh36h/rJdL
         WBV38ZBHsEjVJRqQsYHQpiORzd/VezBN+n0ls0mtPLGSFdF4EvAMi/+nLC21JkicYnSr
         6Iq+y5lS0Sp91ypWE8WKwRshzOUdm5+GFZC2WXDOSH7v54PpdNEJJUIqQIqdC4ALQnVX
         BYUA==
X-Gm-Message-State: AOAM5336CMpWW1dOlKkTvrIItQw093y9LAiZDlT0BIhc3vRzOTrChgS0
	x9/IuP24+5rlJjQxGUGcjp+Yq7lGePMSEg==
X-Google-Smtp-Source: ABdhPJzmHpdXdc8IdwMQRVX9WXZf7h0oVthdofokZakVTyJLthWg6YobB/qVG5rtl98ie+VAlFLF9g==
X-Received: by 2002:a17:906:9ac5:: with SMTP id ah5mr20473156ejc.360.1618822852032;
        Mon, 19 Apr 2021 02:00:52 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from localhost.localdomain ([2a02:2454:2a0:cb00:eb83:2e01:3dda:5d46])
        by smtp.gmail.com with ESMTPSA id dc24sm3596474ejb.123.2021.04.19.02.00.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Apr 2021 02:00:51 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 2/4] libmicrohttpd: add a recipe from meta-oe
Date: Mon, 19 Apr 2021 11:00:42 +0200
Message-Id: <20210419090044.582453-2-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210419090044.582453-1-alex.kanavin@gmail.com>
References: <20210419090044.582453-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This is required to enable debuginfod in elfutils.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../libmicrohttpd/libmicrohttpd_0.9.72.bb     | 31 +++++++++++++++++++
 1 file changed, 31 insertions(+)
 create mode 100644 meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.72.bb

diff --git a/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.72.bb b/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.72.bb
new file mode 100644
index 0000000000..66c48da3b7
--- /dev/null
+++ b/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.72.bb
@@ -0,0 +1,31 @@
+DESCRIPTION = "A small C library that is supposed to make it easy to run an HTTP server as part of another application"
+HOMEPAGE = "http://www.gnu.org/software/libmicrohttpd/"
+LICENSE = "LGPL-2.1+"
+LIC_FILES_CHKSUM = "file://COPYING;md5=57d09285feac8a64efa878e692b14f36"
+SECTION = "net"
+
+DEPENDS = "file"
+
+SRC_URI = "${GNU_MIRROR}/libmicrohttpd/${BPN}-${PV}.tar.gz"
+SRC_URI[md5sum] = "2a286193af88ab2ae3149748d4b46187"
+SRC_URI[sha256sum] = "0ae825f8e0d7f41201fd44a0df1cf454c1cb0bc50fe9d59c26552260264c2ff8"
+
+inherit autotools lib_package pkgconfig gettext
+
+CFLAGS += "-pthread -D_REENTRANT"
+
+EXTRA_OECONF += "--disable-static --with-gnutls=${STAGING_LIBDIR}/../"
+
+PACKAGECONFIG ?= "curl https"
+PACKAGECONFIG_append_class-target = "\
+        ${@bb.utils.filter('DISTRO_FEATURES', 'largefile', d)} \
+"
+PACKAGECONFIG[largefile] = "--enable-largefile,--disable-largefile,,"
+PACKAGECONFIG[curl] = "--enable-curl,--disable-curl,curl,"
+PACKAGECONFIG[https] = "--enable-https,--disable-https,libgcrypt gnutls,"
+
+do_compile_append() {
+    sed -i s:-L${STAGING_LIBDIR}::g libmicrohttpd.pc
+}
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.30.2

