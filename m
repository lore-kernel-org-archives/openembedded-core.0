Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9F01CD13CF
	for <webhook@archiver.kernel.org>; Mon,  2 Sep 2024 09:41:47 +0000 (UTC)
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
 by mx.groups.io with SMTP id smtpd.web11.35076.1725270100780127164
 for <openembedded-core@lists.openembedded.org>;
 Mon, 02 Sep 2024 02:41:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=ey44ZCt2;
 spf=pass (domain: linaro.org, ip: 209.85.167.42, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-5353cd2fa28so5234225e87.3
        for <openembedded-core@lists.openembedded.org>; Mon, 02 Sep 2024 02:41:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1725270099; x=1725874899; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VQwoDxqIRIJi0AYIdOfcFLU5Nuzb3U1rfIVwCdovSas=;
        b=ey44ZCt2JxtRv328sdYpeWYlq9n6Qo9FgeMboZGkvmweW5ynPlTZDNDVMeitEF8rNU
         obNkzBTwvttG0thnOdOYKBh+s6S2x7EXUOB6z+Y+0KLEN57mdO13PvdZwWAVNMhXM9K+
         kefW1LmZichkbiefaX9+2tY6C5TG7RcUa06B37uz8YTZqr6aIWvguHn7TZpypaS9FjXK
         zLsa5y8EcbDJ6/FSPMasfPabXGl206bDhuID2B5MM3cCpph7lF0lvNMX2evadqraFauh
         aRdF49+HaFX3b7t+rSMGkJk5hjwTK6CQB07TDoJ1jx6+GvU4sMD94ZgPWa6uPhIkvoen
         yoxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725270099; x=1725874899;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VQwoDxqIRIJi0AYIdOfcFLU5Nuzb3U1rfIVwCdovSas=;
        b=gkof7nehvveu10xOycTITkLDJrPHgK7Pq8tCQNhnxV5gSl6NQII8vlH5cR3v9UXbJg
         jNTglymbXxlf8oSzVoTHUJRtyF+v8cS8AsoNKMvApyA1wNqhu28jAj6tiKU+CBdoOyNz
         2o+tjxYaaUkGTlE1fHW+TFZh9P1FWhg9iGxwxwrh1RGfLsGhqAxN8rFPJf+y0CoAh1O2
         SAEAAlvrUD5671YlXJFu079wSY5W24pdrukNDSnQg8XBAvjW4Gm4e5gZep+KXCG7Qk9T
         YJXuj9Jsx4248L79uZg0GthHrBJWrRBac5pIqrQLi4btjRIORUZc1BqE4GjuQmk220pS
         HL3A==
X-Gm-Message-State: AOJu0Yy7Y8OzQrMP+Z39M/sKmuS9Kz+JNd2qnmCNUtE9vfVlVfNlP99z
	m8E0MHmkKBlRRlGtiJJmREcH1i1NmbOMKavOk11Vy+PzWQKJs2QTuLNXxBYi9nsyudTgE5zLz1Q
	Uc00=
X-Google-Smtp-Source: AGHT+IFhQjnB5UAM+BIJl1YmxE11EV1mi9KT+dzWhleozXFhC+fippRmD74mz4IcRltaPD4ky/CIuw==
X-Received: by 2002:a05:6512:224a:b0:52b:de5b:1b30 with SMTP id 2adb3069b0e04-53546ba09afmr7475520e87.44.1725270098436;
        Mon, 02 Sep 2024 02:41:38 -0700 (PDT)
Received: from localhost.localdomain (87-100-245-199.bb.dnainternet.fi. [87.100.245.199])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5354084176bsm1528853e87.219.2024.09.02.02.41.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Sep 2024 02:41:37 -0700 (PDT)
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: openembedded-core@lists.openembedded.org
Cc: Erik Schilling <erik.schilling@linaro.org>,
	Mikko Rapeli <mikko.rapeli@linaro.org>
Subject: [PATCH 1/3] systemd-tools: add recipe
Date: Mon,  2 Sep 2024 12:41:15 +0300
Message-ID: <20240902094117.31156-2-mikko.rapeli@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240902094117.31156-1-mikko.rapeli@linaro.org>
References: <20240902094117.31156-1-mikko.rapeli@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 02 Sep 2024 09:41:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204065

From: Erik Schilling <erik.schilling@linaro.org>

Provides systemd-tools-native recipe for ukify.py tooling.
Avoids full systemd native build which is not needed.

Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
---
 .../systemd/systemd-tools_256.5.bb            | 41 +++++++++++++++++++
 1 file changed, 41 insertions(+)
 create mode 100644 meta/recipes-core/systemd/systemd-tools_256.5.bb

diff --git a/meta/recipes-core/systemd/systemd-tools_256.5.bb b/meta/recipes-core/systemd/systemd-tools_256.5.bb
new file mode 100644
index 0000000000..f2e419ffe0
--- /dev/null
+++ b/meta/recipes-core/systemd/systemd-tools_256.5.bb
@@ -0,0 +1,41 @@
+require systemd.inc
+FILESEXTRAPATHS =. "${FILE_DIRNAME}/systemd:"
+
+DEPENDS = " \
+    intltool-native \
+    libcap \
+    util-linux \
+    gperf-native \
+    python3-jinja2-native \
+    python3-pyelftools-native \
+    python3-pefile \
+"
+
+inherit meson pkgconfig gettext
+
+MESON_TARGET = "ukify"
+
+# Helper variables to clarify locations. This mirrors the logic in systemd's
+# build system.
+rootprefix ?= "${root_prefix}"
+rootlibdir ?= "${base_libdir}"
+rootlibexecdir = "${rootprefix}/lib"
+
+EXTRA_OEMESON += "-Dnobody-user=nobody \
+    -Dnobody-group=nogroup \
+    -Drootlibdir=${rootlibdir} \
+    -Drootprefix=${rootprefix} \
+    -Ddefault-locale=C \
+    -Dmode=release \
+    -Dsystem-alloc-uid-min=101 \
+    -Dsystem-uid-max=999 \
+    -Dsystem-alloc-gid-min=101 \
+    -Dsystem-gid-max=999 \
+"
+
+do_install() {
+    install -d ${D}${bindir}/
+    install -m 0755 ${S}/src/ukify/ukify.py ${D}${bindir}/ukify
+}
+
+BBCLASSEXTEND = "native"
-- 
2.34.1


