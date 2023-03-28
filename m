Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 07410C761A6
	for <webhook@archiver.kernel.org>; Tue, 28 Mar 2023 23:48:22 +0000 (UTC)
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
 by mx.groups.io with SMTP id smtpd.web10.12187.1680047293978056009
 for <openembedded-core@lists.openembedded.org>;
 Tue, 28 Mar 2023 16:48:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=e7iNmXbF;
 spf=pass (domain: gmail.com, ip: 209.85.210.170, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f170.google.com with SMTP id y2so9142878pfw.9
        for <openembedded-core@lists.openembedded.org>; Tue, 28 Mar 2023 16:48:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680047293;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=H5RF+mCxvP9YS2mhGpaY7UQ0T6B3K/7cVQSiR64NyyE=;
        b=e7iNmXbF29tYKlC7xa632QHKJO+QMyLYeQXdtKqzPEnToEP+5mXQE2G7FDzYZKwNWZ
         oa9iqfPK9U0nIZzpF0qVZHykbBxFtVWQHAj6QGajcOEf1WBQiiirkiBBGpdXdsuIjHlV
         GUMoUfxwngo/r2zwhWMHS2vQfKi4aAItBTyNdVUq269rcmAuiRArLgOjTHFTZY/0pjmA
         xxXLdKV9TJR0gsoZO4XpdNwPJneEPXkVDkuOeh4H0e1PSAueBpCBTqGEOcpaxfvaPib1
         hqNflPYw4Sh9SomPDU+YAAyy1nf/veVhXk0IO8ZzCwNe6IFsuObsjn8TE9yiz4OL0dGB
         7CrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680047293;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=H5RF+mCxvP9YS2mhGpaY7UQ0T6B3K/7cVQSiR64NyyE=;
        b=EPPBrN5wsK+nVsPYN4r1Wz6SiAqyTRv6iKfzBuPR6z0Iv4AHRAE73MzGFrFyNy5prr
         G8/OZ/TsXyaKxWTkMXdauLmsEEgGtn7vyb+wrYAgJs4lLg7TJx5iHHfLSKKjEOnHjKLw
         KKGpqy1r93mzviA5CoyvI1xrpOOmandjLOpOd+5ACZpKYFcagYU5a2i/iIeJ7EiN2qGy
         kUC3PQZsPMvh0BkcIjXPwiOBjRBvkj9Bsr0nw9M+lBbi3l7jPhUOC9xItzMWifR5SGXb
         SZgfVg/LmvOoi2XQjROKxbzoWCk9c+IayHBAWo9FGfI/Az+2wcDlqsTpL3go2eWTuKVE
         MoPQ==
X-Gm-Message-State: AAQBX9e5F2qnSLjSCIRuu5OiyyE3Rz0cJgB8frhJCJu3PiFN9iawIqgp
	J+9vbg4P5R2/XbvT3qi3CcEz93sFocF/jw==
X-Google-Smtp-Source: AKy350bn/DLWa6LNo/WsDEZqfu2TLPpZW20pcAUsOZXA/FjcRLePREsn3B0F6dIz0DE2MHVUQcjcdA==
X-Received: by 2002:a62:2545:0:b0:628:f0:51d4 with SMTP id l66-20020a622545000000b0062800f051d4mr15659122pfl.11.1680047292974;
        Tue, 28 Mar 2023 16:48:12 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:d380::bed3])
        by smtp.gmail.com with ESMTPSA id m12-20020aa78a0c000000b0058bcb42dd1asm21668080pfa.111.2023.03.28.16.48.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Mar 2023 16:48:12 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 1/3] appstream-glib: Bring version from meta-gnome
Date: Tue, 28 Mar 2023 16:48:08 -0700
Message-Id: <20230328234810.2103043-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 28 Mar 2023 23:48:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179250

appstream-glib-native is needed by new epiphany

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../appstream-glib/appstream-glib_0.8.2.bb    | 39 +++++++++++++++++++
 1 file changed, 39 insertions(+)
 create mode 100644 meta/recipes-gnome/appstream-glib/appstream-glib_0.8.2.bb

diff --git a/meta/recipes-gnome/appstream-glib/appstream-glib_0.8.2.bb b/meta/recipes-gnome/appstream-glib/appstream-glib_0.8.2.bb
new file mode 100644
index 0000000000..efb85d77c5
--- /dev/null
+++ b/meta/recipes-gnome/appstream-glib/appstream-glib_0.8.2.bb
@@ -0,0 +1,39 @@
+SUMMARY = "Objects and helper methods to help reading and writing AppStream metadata"
+HOMEPAGE = "https://people.freedesktop.org/~hughsient/appstream-glib/index.htm"
+LICENSE = "LGPL-2.1-only"
+LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
+
+DEPENDS = " \
+    curl \
+    gperf-native \
+    glib-2.0 \
+    gtk+3 \
+    libyaml \
+    libarchive \
+    json-glib \
+    gdk-pixbuf \
+    freetype \
+    fontconfig \
+    libstemmer \
+"
+
+inherit meson gobject-introspection gettext bash-completion pkgconfig manpages
+
+SRC_URI = "https://people.freedesktop.org/~hughsient/${BPN}/releases/${BP}.tar.xz"
+SRC_URI[sha256sum] = "71256500add5048d6f08878904708b3d0c3875f402e0adcd358e91d47dcd8b96"
+
+EXTRA_OEMESON = " \
+    -Drpm=false \
+"
+
+PACKAGECONFIG ?= ""
+PACKAGECONFIG[manpages] = "-Dman=true,-Dman=false,docbook-xml-dtd4-native docbook-xsl-stylesheets-native libxslt-native"
+
+FILES:${PN} += "${libdir}/asb-plugins-5"
+
+FILES:${PN}-dev += " \
+    ${datadir}/installed-tests \
+    ${datadir}/gettext \
+"
+
+BBCLASSEXTEND = "native"
-- 
2.40.0


