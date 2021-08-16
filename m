Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.web11.21620.1629104607013247795
 for <openembedded-core@lists.openembedded.org>;
 Mon, 16 Aug 2021 02:03:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=BFX+VNQg;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.41, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f41.google.com with SMTP id k4so11086019wms.3
        for <openembedded-core@lists.openembedded.org>; Mon, 16 Aug 2021 02:03:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=zO4vFTY1rMYYM4+rvx/jE71gL6p6NeoPFVAYx/OoE3w=;
        b=BFX+VNQglUB35qJ1vxKq29Z+6PJYuLk1QPtKJSaDfF05VIWrdfRydYDTtUwfsXNNzO
         IK3lCZcp1xU+wl0eoAlJrA/vBzmb7YKFv/1XFRM7/p8Kmz5SgV1dT7Q5FU/SgNFzYsjv
         TLjFuQ4pfyX74Dx3kAoXlATVsynOKkYwX8M5U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=zO4vFTY1rMYYM4+rvx/jE71gL6p6NeoPFVAYx/OoE3w=;
        b=C9Nm6aKGvE+GJfcFlICBsFU5poZhSOC29d8E3gRqjKzSrXa8t1JW16QtxyccGiRKHy
         EnnlRDzoH3SoOIWQnLGBzN6IafhqZDq0gbhHpsWfatZXvf7gZ7JKBPqY+nV2almlmdyd
         D3bOcAHIvccnHa9IYOYa7cDIIQfCd57YO+2PtD8t0fPDMkRZW5QDmqfm9aNOIOlTwXyw
         CekUZXhTnWzIZgTVOSUm3o3jS1P5JNWSa7PBbWC3R7jOqEbPznE70t1ZpuAGjFPkl1Sy
         sNClGFKwB+CoHLU1qdjHN/pniObZXzUIFDamEdoChyYGzgc1GPpyTLAsuUp21KqYSc7E
         nARA==
X-Gm-Message-State: AOAM532Qs2TpbqC78f79E4lvuYpjFiyZn8xllayJhi7BgdcRhunVNgKo
	dL3CUO+mkDEvefPB1eoyar+Bd770D+9veg==
X-Google-Smtp-Source: ABdhPJzRAIRvlObXpCMgq8CwAoUGhWfddQf8rW8NPs68LIxQsPM+tQBjGs/yFeersXkQE1tqdhI4cg==
X-Received: by 2002:a1c:80c6:: with SMTP id b189mr5598883wmd.31.1629104605525;
        Mon, 16 Aug 2021 02:03:25 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.. ([148.252.128.117])
        by smtp.gmail.com with ESMTPSA id f2sm10899728wru.31.2021.08.16.02.03.25
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Aug 2021 02:03:25 -0700 (PDT)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v2 2/2] man-db: Add compression PACKAGECONFIG entries
Date: Mon, 16 Aug 2021 10:03:22 +0100
Message-Id: <20210816090322.3844125-2-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210816090322.3844125-1-richard.purdie@linuxfoundation.org>
References: <20210816090322.3844125-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add PACKAGECONFIG entries for various compression algorithms to ensure
builds are deterministic.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-extended/man-db/man-db_2.9.4.bb | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/meta/recipes-extended/man-db/man-db_2.9.4.bb b/meta/recipes-extended/man-db/man-db_2.9.4.bb
index c4cdbcc3b49..e0f2092f6a2 100644
--- a/meta/recipes-extended/man-db/man-db_2.9.4.bb
+++ b/meta/recipes-extended/man-db/man-db_2.9.4.bb
@@ -10,6 +10,10 @@ SRC_URI = "${SAVANNAH_NONGNU_MIRROR}/man-db/man-db-${PV}.tar.xz \
            file://man_db.conf-avoid-multilib-install-file-conflict.patch"
 SRC_URI[sha256sum] = "b66c99edfad16ad928c889f87cf76380263c1609323c280b3a9e6963fdb16756"
 
+# remove at next version upgrade or when output changes
+PR = "r1"
+HASHEQUIV_HASH_VERSION .= ".2"
+
 DEPENDS = "libpipeline gdbm groff-native base-passwd"
 RDEPENDS:${PN} += "base-passwd"
 PACKAGE_WRITE_DEPS += "base-passwd"
@@ -22,6 +26,13 @@ inherit gettext pkgconfig autotools systemd
 EXTRA_OECONF = "--with-pager=less --with-systemdsystemunitdir=${systemd_unitdir}/system"
 EXTRA_AUTORECONF += "-I ${S}/gl/m4"
 
+PACKAGECONFIG[bzip2] = "--with-bzip2,--without-bzip2,bzip2"
+PACKAGECONFIG[gzip] = "--with-gzip,--without-gzip,gzip"
+PACKAGECONFIG[lzip] = "--with-lzip,--without-lzip,lzip"
+PACKAGECONFIG[lzma] = "--with-lzma,--without-lzma,xz"
+PACKAGECONFIG[zstd] = "--with-zstd,--without-zstd,zstd"
+PACKAGECONFIG[xz] = "--with-xz,--without-xz,xz"
+
 do_install() {
 	autotools_do_install
 
-- 
2.30.2

