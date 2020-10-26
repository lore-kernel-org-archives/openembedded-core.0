Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com [209.85.221.67])
 by mx.groups.io with SMTP id smtpd.web08.10595.1603706708684130044
 for <openembedded-core@lists.openembedded.org>;
 Mon, 26 Oct 2020 03:05:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=FU6zGzxU;
 spf=pass (domain: gmail.com, ip: 209.85.221.67, mailfrom: luca.boccassi@gmail.com)
Received: by mail-wr1-f67.google.com with SMTP id y12so11668351wrp.6
        for <openembedded-core@lists.openembedded.org>; Mon, 26 Oct 2020 03:05:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=QaLt8VrT5074hvMGbeA4Vd9s/cnIRJ/vFbKuD4GpYiA=;
        b=FU6zGzxU3DbA/Gak9ROTfulCBRp1Iz76ILeCnE8JCAQdI0ezVLUENyYJKTsAXIzlZq
         QCtrJiLR2eVubwB1L8f3lA78G1cmrps48Gn1p9eyB/5GmvcNMj44mIfMSh2rdrmVF7lC
         c2zvezrQTgdBkq+NTG1qaVrz8z8giNfLXKSIIm7YVMMb/XhiCsnCDkICI0PzPRnrdhPT
         vfy7Cjnyd/jtrv+Ggbu3LguGUDifoZfs3Er3fcJ5uxYWQgWWNqHn+98kGYrEnXflIgCw
         L5bCpP2JUR68dM8cgM2ATnnx8WU5tC3EtFfDgsM8gIc9iJeFiDNI6iXuvi4PTq2oFarz
         kmAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=QaLt8VrT5074hvMGbeA4Vd9s/cnIRJ/vFbKuD4GpYiA=;
        b=MtMLya2roWA8ujkT1a+3+KzCrVvpRHUEsZERv6JwYL8Wnb7JY8fpXYRD+/0OBCUEg4
         l8GBJQ65rjdPOC1kxaPg1IOHUdhoEzNGd2pQLYXhhJA+vAJpVVqnOqvX8pkZKIBLLuJZ
         2nLKeFxvXLun62dh5/jADyEUYuZNT3B/qqJNYc6yCU0+EZjpzBQzfz0LJT0onzSGPDgo
         wnldUyQgNdLvMjs6VlZoSEBFppBA30T+2aHVRJrVnMTUlFmnw76eYWxbszYWGFFUgL8G
         k1KEqTMzf1e/d4ycPkAtfhySzxEwEh9wXTkuFDHiqBplfjPcR3Og1ANscpurrdHjcsu1
         /zSg==
X-Gm-Message-State: AOAM5325uZhTvlQxzV8o4e6p6OAVeMSo6dWD+mBCRSGMp7YlOBhV6oKV
	yKl5nwnhO5ATOpxqTwb/iF8qzB8WOXpEZuLO
X-Google-Smtp-Source: ABdhPJzi6W8Cc5qd0jkq3O8g4oM35uIpwbWUeO7F6g1DoGSKqYVJnIZ5gmTd8l3topb5htaO4f+2kg==
X-Received: by 2002:adf:f48c:: with SMTP id l12mr17811769wro.77.1603706706739;
        Mon, 26 Oct 2020 03:05:06 -0700 (PDT)
Return-Path: <luca.boccassi@gmail.com>
Received: from localhost ([88.98.246.218])
        by smtp.gmail.com with ESMTPSA id n5sm21786406wrm.2.2020.10.26.03.05.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2020 03:05:05 -0700 (PDT)
From: "Luca Bocassi" <luca.boccassi@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: richard.purdie@linuxfoundation.org
Subject: [PATCH v4] Add new recipe for squashfs-tools-ng
Date: Mon, 26 Oct 2020 10:05:03 +0000
Message-Id: <20201026100503.3200192-1-luca.boccassi@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201022113036.2938947-1-luca.boccassi@gmail.com>
References: <20201022113036.2938947-1-luca.boccassi@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Luca Boccassi <luca.boccassi@microsoft.com>

The main difference with squashfs-tools is the availability
of a shared library and a programmatic interface, rather
than just command-line tools.

Signed-off-by: Luca Boccassi <luca.boccassi@microsoft.com>
---
v2: added MIT, Zlib and BSD-2-Clause to LICENSE
v3: fixed CPL-3.0+ tag, removed GPL2 from checksum (not used), changed
    recipe to be versioned, use bb.utils.filter in PACKAGE_CONFIG
v4: disable zstd support by default, dependency not available in oe-core

 .../squashfs-tools-ng_1.0.2.bb                | 34 +++++++++++++++++++
 1 file changed, 34 insertions(+)
 create mode 100644 meta/recipes-devtools/squashfs-tools-ng/squashfs-tools-ng_1.0.2.bb

diff --git a/meta/recipes-devtools/squashfs-tools-ng/squashfs-tools-ng_1.0.2.bb b/meta/recipes-devtools/squashfs-tools-ng/squashfs-tools-ng_1.0.2.bb
new file mode 100644
index 0000000000..948a030810
--- /dev/null
+++ b/meta/recipes-devtools/squashfs-tools-ng/squashfs-tools-ng_1.0.2.bb
@@ -0,0 +1,34 @@
+SUMMARY = "New set of tools for working with SquashFS images"
+SECTION = "base"
+LICENSE = "GPL-3.0+ & LGPL-3.0+ & MIT & BSD-2-Clause & Zlib"
+LIC_FILES_CHKSUM = "file://COPYING.md;md5=c0de2c0aca56349dab98e97992316f7e \
+                    file://licenses/GPLv3.txt;md5=1ebbd3e34237af26da5dc08a4e440464 \
+                    file://licenses/hash_table.txt;md5=874823605326caeaabaa95bfbd0f9fb0 \
+                    file://licenses/LGPLv3.txt;md5=3000208d539ec061b899bce1d9ce9404 \
+                    file://licenses/LZ4.txt;md5=ebc2ea4814a64de7708f1571904b32cc \
+                    file://licenses/xxhash.txt;md5=f042a9be092bd6d7fe6f217d8d00f4ca \
+                    file://licenses/xz.txt;md5=1c389b9610ccfdb25f7abaea6a0bb5a4 \
+                    file://licenses/zlib.txt;md5=ae27c72096606131f760e5f59cf98b06 \
+                    file://licenses/zstd.txt;md5=8df8137b630239cbdd4c0674124cb0c8"
+
+SRCREV = "b96f0fc154feef531be76034bf6e38925636146f"
+SRC_URI = "git://github.com/AgentD/squashfs-tools-ng.git;protocol=https"
+
+S = "${WORKDIR}/git"
+
+inherit autotools pkgconfig
+
+PACKAGECONFIG ??= "gzip xz lzo lz4 ${@bb.utils.filter('DISTRO_FEATURES', 'selinux', d)}"
+PACKAGECONFIG[gzip] = "--with-gzip,--without-gzip,zlib"
+PACKAGECONFIG[xz] = "--with-xz,--without-xz,xz"
+PACKAGECONFIG[lzo] = "--with-lzo,--without-lzo,lzo"
+PACKAGECONFIG[lz4] = "--with-lz4,--without-lz4,lz4"
+PACKAGECONFIG[zstd] = "--with-zstd,--without-zstd,zstd"
+PACKAGECONFIG[selinux] = "--with-selinux,--without-selinux,libselinux"
+
+PACKAGES =+ "libsquashfs"
+FILES_libsquashfs = "${libdir}/libsquashfs*${SOLIBS}"
+
+BBCLASSEXTEND = "native nativesdk"
+
+CVE_PRODUCT = "squashfs"
-- 
2.20.1

