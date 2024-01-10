Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7BAB6C4707C
	for <webhook@archiver.kernel.org>; Wed, 10 Jan 2024 12:10:08 +0000 (UTC)
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
 by mx.groups.io with SMTP id smtpd.web11.10134.1704888600645514434
 for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Jan 2024 04:10:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=HA0rcmav;
 spf=pass (domain: gmail.com, ip: 209.85.208.46, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-55642663ac4so4579412a12.1
        for <openembedded-core@lists.openembedded.org>; Wed, 10 Jan 2024 04:10:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704888599; x=1705493399; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=d/Vt+GWSovp37RVpc3Uqa2FwR8WulrKVBgfWA5eD4jI=;
        b=HA0rcmavfjgmjHd8qCY5NtJ5u+fb3FLcwohoVMW3Hlr64AvzbFcMjcPV47nlrcZCZl
         CrmQtdLvJSgwue3ow5EN1trHVvT1Tob+N00GajfIgVsViSuSNN7d+tDKcQOO/yKyuV9G
         +cKRPgb1DYRYl6eNWHdhvnMn5lLRih6oL/F+pZY9ofc55Trrw/1CsF8qE8E/LIFI5bBg
         eFcr97dbgjNlOIZs5hAhHF2Y9Tkvsz0pbHkdr8qdMkpec6HnqTriezjYDj5+BdLH078s
         APvLeF4Pu8Q44UiOZglzTXquf/3PveAzkfmauTdIRzeFSNgzmq3TTe3RkvnlK49i/Pg4
         NV9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704888599; x=1705493399;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=d/Vt+GWSovp37RVpc3Uqa2FwR8WulrKVBgfWA5eD4jI=;
        b=fhjA+GjrqYQgZUWveN4VbyuXYwW4TnbkpDKXrnTxgVis3Xlxkd81BeqyQGxmGyVONB
         SNSjWD9uoIvaSlZFoQ0KnkKhAx0uuGqk4eQTbtdYFGOAZPy6r0+R7GYdvS6U1fRcJD8u
         MIkikYOwoKnnJTjLbbYh3OCE+RoNZD9Pqwf8lTV2iGNhXsgT8cR3b9RaVMw6YtqqGT+3
         orHpPI5pqdXUSxMf/UcyUYCcdavtFfi1Nyx6RSbx+w4OZcJ2at8eF3z5tG/dsfPXtnTw
         x0SM3imAwxMS4HzuJAYDBvb2LkoH98SpkjHMiUYPq4RJ8gmZgrPH4ZRJ2SEat/VbEwQ6
         KFZQ==
X-Gm-Message-State: AOJu0Yz54k8M3HJuzhHWjQ0IDO+ibt8zxPdKqcbAqZwvQvWGwDUQ2yJe
	c5ovF739G6P2nrbH1bn6+mAWj8ZFXTo=
X-Google-Smtp-Source: AGHT+IHXSFgUACKmS/yuD5tbXVdqr2QU6VaYJ3YaiJv7b3z8z/5k1ERjvQIp6cRlOzt55zS/bntjFQ==
X-Received: by 2002:a50:cd10:0:b0:553:a5e5:78d8 with SMTP id z16-20020a50cd10000000b00553a5e578d8mr420191edi.26.1704888599077;
        Wed, 10 Jan 2024 04:09:59 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id ez11-20020a056402450b00b0055823c2ae17sm1248851edb.64.2024.01.10.04.09.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jan 2024 04:09:58 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 2/2] shadow: link executables statically for -native variant
Date: Wed, 10 Jan 2024 13:09:48 +0100
Message-Id: <20240110120948.4140846-2-alex@linutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240110120948.4140846-1-alex@linutronix.de>
References: <20240110120948.4140846-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 10 Jan 2024 12:10:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193498

shadow 4.14.x adds a number of libraries it dynamically links with
(md, bsd, attr). This causes troubles in setscene tasks where
shadow executables are used (such as useradd), as pulling in
the needed dynamic libraries needs unpleasant special-casing.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/conf/distro/include/no-static-libs.inc | 5 +++++
 meta/recipes-extended/shadow/shadow.inc     | 9 +++++++++
 2 files changed, 14 insertions(+)

diff --git a/meta/conf/distro/include/no-static-libs.inc b/meta/conf/distro/include/no-static-libs.inc
index 75359928a14..8898d53d756 100644
--- a/meta/conf/distro/include/no-static-libs.inc
+++ b/meta/conf/distro/include/no-static-libs.inc
@@ -21,6 +21,11 @@ DISABLE_STATIC:pn-libusb1-native = ""
 # needed by rust
 DISABLE_STATIC:pn-musl = ""
 
+# needed by shadow-native to build static executables, particularly useradd
+DISABLE_STATIC:pn-attr-native = ""
+DISABLE_STATIC:pn-libbsd-native = ""
+DISABLE_STATIC:pn-libmd-native = ""
+
 EXTRA_OECONF:append = "${DISABLE_STATIC}"
 
 EXTRA_OECMAKE:append:pn-libical = " -DSHARED_ONLY=True"
diff --git a/meta/recipes-extended/shadow/shadow.inc b/meta/recipes-extended/shadow/shadow.inc
index c024746d4ff..67346aa5cb1 100644
--- a/meta/recipes-extended/shadow/shadow.inc
+++ b/meta/recipes-extended/shadow/shadow.inc
@@ -47,6 +47,15 @@ EXTRA_OECONF += "--without-libcrack \
 
 CFLAGS:append:libc-musl = " -DLIBBSD_OVERLAY"
 
+# Force static linking of utilities so we can use from the sysroot/sstate for useradd
+# without worrying about the dependency libraries being available
+do_compile:prepend:class-native () {
+	sed -i -e 's#\(LIBS.*\)-lbsd#\1 ${STAGING_LIBDIR}/libbsd.a ${STAGING_LIBDIR}/libmd.a#g' \
+	       -e 's#\(LIBBSD.*\)-lbsd#\1 ${STAGING_LIBDIR}/libbsd.a ${STAGING_LIBDIR}/libmd.a#g' \
+	       -e 's#\(LIBATTR.*\)-lattr#\1 ${STAGING_LIBDIR}/libattr.a#g' \
+               ${B}/*/Makefile
+}
+
 NSCDOPT = ""
 NSCDOPT:class-native = "--without-nscd"
 NSCDOPT:class-nativesdk = "--without-nscd"
-- 
2.39.2


