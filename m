Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF651FA3746
	for <webhook@archiver.kernel.org>; Thu, 27 Oct 2022 20:16:39 +0000 (UTC)
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
 by mx.groups.io with SMTP id smtpd.web08.2192.1666901787311117763
 for <openembedded-core@lists.openembedded.org>;
 Thu, 27 Oct 2022 13:16:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Gsaf40xy;
 spf=pass (domain: gmail.com, ip: 209.85.218.49, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f49.google.com with SMTP id sc25so7840959ejc.12
        for <openembedded-core@lists.openembedded.org>; Thu, 27 Oct 2022 13:16:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=s2TYuVPJRdAcqQiMqaUe5PV8ePTJFfacBJsKJsonTTs=;
        b=Gsaf40xygvvcrVBiUkmJ1JjvC8mv8NK+LieEXSCvJjTkcO2iss3x2bRei691hBQw0r
         pHtwUj5mrjvhP/12dT4eAt7515L+cPeh44ZLKzoWzZ6jmHCwG0Z0+9ESKv7Or4MgF6B4
         N9YDWQ7NO7CvIC2tB+tER0lCNahqse0bUpuC+3L3hPWF0D9TA5pfW2pqcOyfq6ZPRBIW
         keIf5oPrqpVIUUTfhhTo580llLZSgqQGz2yR4iE6WcJi2gDoOvnk9TGJGrLBN0W7YZT2
         fqQSDEJs+2Du6tTryIc6+ITgB7Bp0BE1AnuPkQpDIMtHGiKXZ61A68KFdalACnshDTaR
         e2Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=s2TYuVPJRdAcqQiMqaUe5PV8ePTJFfacBJsKJsonTTs=;
        b=WtGDkK2Nuppke2X5VK2mIuSv19I4ezOOyO28Sz9O7Io/UwMTzKD1ndMNegG46A4R/g
         dtVOsd2/Iw7g+FjL0563au6OYAeDEePcqBw7JbMA0sIazhhbdb97Bxd1PkOKDndp29Xb
         fOBb8sJfYOOggCmeSlycSbjJnOyfzYU3f3/gtfKOP4PCJ/blz/+7S822Lo6+heQg0LGQ
         SdxzWKLiH4zDGjK5VqV30L5Ig6CPAd/Rb73m6RV6bO7ICmLhPa7SBSLVU3Mh+9pvUUT4
         Bjwa2GgqdK9fCDvQ4WpZWaUpBTL06hcOCvNgV+0c8I9PjWkciCqEGEN0CuDt59ieAfTm
         K6NA==
X-Gm-Message-State: ACrzQf3FaEOj0uRLX7+FG5PA6wr9PrB+s7hVH8H2s/yWKZwxOMe1ym+t
	N0jBZ7WZDTfZcgxnVLW+Id25SlqmI4MZSQ==
X-Google-Smtp-Source: AMsMyM5v7v403veoSN5i7NLZ/KUOTjWDThFynzHfaapBTss7o5tDZoMkrLn6v4dy7naqzyg727eyhA==
X-Received: by 2002:a17:907:728b:b0:7a1:b545:b39b with SMTP id dt11-20020a170907728b00b007a1b545b39bmr25552472ejc.661.1666901796825;
        Thu, 27 Oct 2022 13:16:36 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id la19-20020a170907781300b0077b2b0563f4sm1267225ejc.173.2022.10.27.13.16.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Oct 2022 13:16:36 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 20/23] libsoup: upgrade 3.0.7 -> 3.2.0
Date: Thu, 27 Oct 2022 22:16:08 +0200
Message-Id: <20221027201611.3644334-20-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20221027201611.3644334-1-alex@linutronix.de>
References: <20221027201611.3644334-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 27 Oct 2022 20:16:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172222

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../libsoup/{libsoup_3.0.7.bb => libsoup_3.2.0.bb}        | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)
 rename meta/recipes-support/libsoup/{libsoup_3.0.7.bb => libsoup_3.2.0.bb} (87%)

diff --git a/meta/recipes-support/libsoup/libsoup_3.0.7.bb b/meta/recipes-support/libsoup/libsoup_3.2.0.bb
similarity index 87%
rename from meta/recipes-support/libsoup/libsoup_3.0.7.bb
rename to meta/recipes-support/libsoup/libsoup_3.2.0.bb
index 59cc4a1d0a..60fbea5504 100644
--- a/meta/recipes-support/libsoup/libsoup_3.0.7.bb
+++ b/meta/recipes-support/libsoup/libsoup_3.2.0.bb
@@ -12,14 +12,14 @@ DEPENDS = "glib-2.0 glib-2.0-native libxml2 sqlite3 libpsl nghttp2"
 SHRT_VER = "${@d.getVar('PV').split('.')[0]}.${@d.getVar('PV').split('.')[1]}"
 
 SRC_URI = "${GNOME_MIRROR}/libsoup/${SHRT_VER}/libsoup-${PV}.tar.xz"
-SRC_URI[sha256sum] = "ebdf90cf3599c11acbb6818a9d9e3fc9d2c68e56eb829b93962972683e1bf7c8"
+SRC_URI[sha256sum] = "2832370698ca8f9fbf174c345b73d89b60561103a626c2df70726b0707f79bd3"
 
 PROVIDES = "libsoup-3.0"
 CVE_PRODUCT = "libsoup"
 
 S = "${WORKDIR}/libsoup-${PV}"
 
-inherit meson gettext pkgconfig upstream-version-is-even gobject-introspection gtk-doc
+inherit meson gettext pkgconfig upstream-version-is-even gobject-introspection gi-docgen
 
 GIR_MESON_ENABLE_FLAG = 'enabled'
 GIR_MESON_DISABLE_FLAG = 'disabled'
@@ -30,7 +30,9 @@ PACKAGECONFIG[gssapi] = "-Dgssapi=enabled,-Dgssapi=disabled,krb5"
 
 EXTRA_OEMESON:append = " -Dvapi=disabled -Dtls_check=false"
 
-GTKDOC_MESON_OPTION = "gtk_doc"
+GIDOCGEN_MESON_OPTION = 'docs'
+GIDOCGEN_MESON_ENABLE_FLAG = 'enabled'
+GIDOCGEN_MESON_DISABLE_FLAG = 'disabled'
 
 # When built without gnome support, libsoup will contain only one shared lib
 # and will therefore become subject to renaming by debian.bbclass. Prevent
-- 
2.30.2


