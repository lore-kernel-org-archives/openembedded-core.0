Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 059B5C6FD18
	for <webhook@archiver.kernel.org>; Tue, 28 Mar 2023 23:48:22 +0000 (UTC)
Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
 by mx.groups.io with SMTP id smtpd.web11.12318.1680047294707601905
 for <openembedded-core@lists.openembedded.org>;
 Tue, 28 Mar 2023 16:48:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=jmGxzX+F;
 spf=pass (domain: gmail.com, ip: 209.85.215.178, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f178.google.com with SMTP id d10so8238254pgt.12
        for <openembedded-core@lists.openembedded.org>; Tue, 28 Mar 2023 16:48:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680047294;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Qj72cXPR4hkQ1mSHV8nhofxkT9dY5L2dysUNyQ/POLw=;
        b=jmGxzX+F6e64RGZyUAX9C9zDoDItD5UMseEoTYVba4gltI79GGGq77CPUYUPpXUcy0
         jHyw1ru2f8/FaQ8LHcgZQdbUDR/Dcm/2BvTu4aqCFW9P3bYSwFUMEsS0dKPwAbnJwd6w
         WrojT5jPSheKZqZNHs3g8XpckcMMUE0gM/Fizd4l+x8Nt51ScqvyYPmJnUBI7kZ0yYer
         7LRSFwEFImKL0w9S8enElgsJi/0vJKdIzgOrUSSw5LldDF61kaKulCPISGVc+kE30Cx6
         dL6gsa61xjawypaFc1HthLuYY6ugAp0+QLMYkpJc+QDUzTCiFci0/xH0vGN98hJKEuTV
         sYOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680047294;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Qj72cXPR4hkQ1mSHV8nhofxkT9dY5L2dysUNyQ/POLw=;
        b=59u1Y3t3aibBThjnCzJNyxQk+YGvmVvfh4ASN47GXfgBcZ5y0T/1bba+DP9pE6FEj/
         QV7O1mkNwZtKoBN5vwOKzEHr23Nv/66v74WRToXmY6lIgTE9/C1H3GsHqK2HU9PyhpZd
         UzBUJDpwDEyhiruZcDbzynl/5B6ZrSWyjSBkyQMRB9fg9ffyLQpDGDp0J54Tvly9Jrfn
         fSC8qVeiavrK+TLyU30hw3VCdWw0KAYD5rEn92O/I7fdLDhh/otw23rwqJdFV8S55k4y
         Bnzeo3DlLe4eYSa5GvRyYLLs+WK9hC5HVp6PzZff20LxpbipJzyMzRYHSY/tXJIGfaya
         WEqQ==
X-Gm-Message-State: AAQBX9dzrr0loytBXqv5uBdjIjab2O9MkUv1k4ErZ0zQktElkxk/ZyJu
	JVN/Vc+mtBcAB+Cr09Y72aOHMb3H3OKgSQ==
X-Google-Smtp-Source: AKy350Ze2i1ER1H6wK5nlxB3A/vNPff5cskRSmVkNvRWYXhshUbivWhMMpSSDd5zbNEGzJsqfvNyVw==
X-Received: by 2002:aa7:9485:0:b0:625:70a5:7817 with SMTP id z5-20020aa79485000000b0062570a57817mr15347619pfk.34.1680047293676;
        Tue, 28 Mar 2023 16:48:13 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:d380::bed3])
        by smtp.gmail.com with ESMTPSA id m12-20020aa78a0c000000b0058bcb42dd1asm21668080pfa.111.2023.03.28.16.48.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Mar 2023 16:48:13 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 2/3] libstemmer: Bring recipe from meta-oe
Date: Tue, 28 Mar 2023 16:48:09 -0700
Message-Id: <20230328234810.2103043-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230328234810.2103043-1-raj.khem@gmail.com>
References: <20230328234810.2103043-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 28 Mar 2023 23:48:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179251

Needed by appstream-glib

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../libstemmer/libstemmer_2.2.0.bb            | 37 +++++++++++++++++++
 1 file changed, 37 insertions(+)
 create mode 100644 meta/recipes-support/libstemmer/libstemmer_2.2.0.bb

diff --git a/meta/recipes-support/libstemmer/libstemmer_2.2.0.bb b/meta/recipes-support/libstemmer/libstemmer_2.2.0.bb
new file mode 100644
index 0000000000..be2935a385
--- /dev/null
+++ b/meta/recipes-support/libstemmer/libstemmer_2.2.0.bb
@@ -0,0 +1,37 @@
+SUMMARY = "Snowball compiler and stemming algorithms"
+HOMEPAGE = "https://snowballstem.org/"
+LICENSE = "BSD-3-Clause"
+LIC_FILES_CHKSUM = "file://COPYING;md5=19139aaf3c8c8fa1ca6edd59c072fb9f"
+
+DEPENDS:append:class-target = " ${BPN}-native"
+
+SRC_URI = "git://github.com/snowballstem/snowball.git;branch=master;protocol=https \
+           file://0001-Build-so-lib.patch \
+           "
+SRCREV = "48a67a2831005f49c48ec29a5837640e23e54e6b"
+S = "${WORKDIR}/git"
+
+LIBVER = "0.0.0"
+
+inherit lib_package
+
+do_compile:prepend:class-target() {
+    # use native tools
+    sed -i 's:./snowball :snowball :g' ${S}/GNUmakefile
+}
+
+do_install() {
+    install -d ${D}${bindir}
+    install -m 755 ${S}/snowball ${D}${bindir}
+    install -m 755 ${S}/stemwords ${D}${bindir}
+
+    install -d ${D}${libdir}
+    install -m 755 ${S}/libstemmer.so.${LIBVER} ${D}${libdir}/
+    ln -s libstemmer.so.${LIBVER} ${D}${libdir}/libstemmer.so.0
+    ln -s libstemmer.so.${LIBVER} ${D}${libdir}/libstemmer.so
+
+    install -d ${D}${includedir}
+    install -m 644 ${S}/include/*.h ${D}${includedir}
+}
+
+BBCLASSEXTEND = "native"
-- 
2.40.0


