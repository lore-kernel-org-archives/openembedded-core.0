Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22CFDC6FD18
	for <webhook@archiver.kernel.org>; Wed, 29 Mar 2023 00:26:02 +0000 (UTC)
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
 by mx.groups.io with SMTP id smtpd.web10.12913.1680049555430971931
 for <openembedded-core@lists.openembedded.org>;
 Tue, 28 Mar 2023 17:25:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=HeW9oGlG;
 spf=pass (domain: gmail.com, ip: 209.85.216.41, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f41.google.com with SMTP id j13so12511960pjd.1
        for <openembedded-core@lists.openembedded.org>; Tue, 28 Mar 2023 17:25:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680049554;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=yCLtHMJ/bwMDFsdK2JkYLS2V2SUHduhrLcljjDQcT58=;
        b=HeW9oGlGa0dvMyo0D1mQ13rDcoEn1/0cs4UxK3J1Rgn+RHhWaenOuNmtM/w+piX2Y0
         uevJCOWgowF1JgC6iAvfkKhpZf8drMWCjdqEN3B+fRAnHGC3UPvvFIaXHE9dlTpXa5sy
         Grm7vPIPvOGsXnizRy3YP4ywVSQChlvn/8McoHLzyfGPqgM2ACk6qxxHfN7sr5gb3Wky
         1C5b4XgOzFLS3egYTh647Y5xEV4xCHP+dgmEvLDmS7WMuemiEvVAUsu68azEYK4/d530
         ggWH0lPGILM1uwJ65NM0rSINm4tC/hwVrKF1MCOhL6D5b08RTzqLi2uDBdxFLbXx9XvO
         pbVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680049554;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yCLtHMJ/bwMDFsdK2JkYLS2V2SUHduhrLcljjDQcT58=;
        b=M/zwy9ea36CYPuoCRK1cNEUdwD68/Q7wJDDpc1IuDiWw0VLKZXcDMmlo2FGAZa4JEF
         1aCShNoOHuWrfr0qzO5J7PynQavfMWDfF92C3cvTXIz+y6gA7jfPdHvFZjvXYbPjogS2
         Jt5DixBVYp1POHCjFHLyWvJ7S3oUUv0C+MP9a5JQUgr+KHlHQ/K1Q7u+22wXasSqnTkG
         xQvBKjNAUS91JTdtuLm52WpibN19CzFsUEJCGlGgfNJvTwZVEXPNRJnpulmziZ5/H0Pz
         +AIag+fUvfjcdm1AgvWWOKAoMNNsc2LWz3cS1ik0n/poV7U5O5JITzJp3cU67jg/8ACj
         +vMA==
X-Gm-Message-State: AAQBX9drP9C4MkCnNWW8C5eVr9dR86kKAtXdQd4j9xsEyXvHm6BdRsIi
	QBxD1pPJLYGmCPTCQ+Iv9oFI3myTNyfSTg==
X-Google-Smtp-Source: AKy350Y8186gkaDs+lTOyxGBMrIESKK8RsxBqQqop+IxTmAdzXwJ1cv+WeKwH6thLo3ULxKbqza3Sw==
X-Received: by 2002:a05:6a20:4a09:b0:d9:167c:f612 with SMTP id fr9-20020a056a204a0900b000d9167cf612mr475399pzb.19.1680049554387;
        Tue, 28 Mar 2023 17:25:54 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:d380::bed3])
        by smtp.gmail.com with ESMTPSA id q20-20020a62e114000000b0058d92d6e4ddsm21646841pfh.5.2023.03.28.17.25.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Mar 2023 17:25:53 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH v3 1/3] appstream-glib: Bring version from meta-gnome
Date: Tue, 28 Mar 2023 17:25:50 -0700
Message-Id: <20230329002552.2260584-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 29 Mar 2023 00:26:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179254

appstream-glib-native is needed by new epiphany

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
v2: No change
v3: No change

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


