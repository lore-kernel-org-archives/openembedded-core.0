Return-Path: <tgamblin@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83D65C7115B
	for <webhook@archiver.kernel.org>; Tue, 17 Jun 2025 15:53:52 +0000 (UTC)
Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
 by mx.groups.io with SMTP id smtpd.web10.22820.1750175623640285086
 for <openembedded-core@lists.openembedded.org>;
 Tue, 17 Jun 2025 08:53:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20230601.gappssmtp.com header.s=20230601 header.b=WkZ/xF1g;
 spf=pass (domain: baylibre.com, ip: 209.85.160.180, mailfrom: tgamblin@baylibre.com)
Received: by mail-qt1-f180.google.com with SMTP id d75a77b69052e-4a43e277198so43802641cf.1
        for <openembedded-core@lists.openembedded.org>; Tue, 17 Jun 2025 08:53:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1750175622; x=1750780422; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=qRGmlpiQO7OsrXH5Zr1Ps3EjLH0Lr+DlbVUzKlE0RVE=;
        b=WkZ/xF1gXVwZy6T3GyqFNralcSXrHziR0J6xewpdMIJLjLokRMA9VD0djp0f50qkDB
         TYCGwcIemaW1kMPXtGVv+AZGWyyyydH0v/8vH63zEUN3q4pqUL9nOeumaMg/7/hq+8JO
         EKaIWnvvUvbJkuY0LBHO3aJjq64ECDF7cP6rH89qJII8XnXAovaWd2AfAZpYX4PhLsWZ
         HkTNR4T0i6BPrnV4wvmYtH9OxeZued6i6ks/aRaN2jHq1q0c+80BVu78Ncb/oJbi5tVE
         PQRpyhiRK9i5PjuMCC8pb8T48hKaas21LEdC/K43H7OG9tlKLpeKxyB1gzeu04G7ZoAq
         YUng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750175622; x=1750780422;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qRGmlpiQO7OsrXH5Zr1Ps3EjLH0Lr+DlbVUzKlE0RVE=;
        b=FtajOAfXryDDRKhKbE6KYHF7aCFaP2wkyS+l4Tt60sY0HGaxd/klVNn4S85mGVA8Cc
         qckS/8KPRZvO99CEkHysRZ6hDBcWzfIrPWK7Gh5OHOKkT07/egkuFHiCkMOOw8yLIIF2
         29o9uwhvpcrZP2GM7YFAUjpGtM4h6JJxbg3vwHm3QO4s8oW77gPStFfnVVg32Uku0LRr
         /5BdE6afa3ki2zTwxBHB9dWzoFnOIOgngKMgt8c6tRwKk04KlVWAfknIpNHV1GiRZYkQ
         52lIklNpfptRZL6e9OYKXH64Yr+Mj01c7mZPNkiqbBmwp5AQwI1FOLz3/9O5lsoKE8g2
         cPeQ==
X-Gm-Message-State: AOJu0YxpaXHsMNE8Bbl2xRHWD+c6IizN7Fa3JKAVLMl2hV9IP8nUPFTN
	Uh3JhjEfp52OoeR3E1uuxqBQB3fCECJMFJAieEtu1STEpUPmwamyeb2lcdl2yUo0TtsEVn6e7eB
	kjDWQngs=
X-Gm-Gg: ASbGncum5TequLXj8hhOptiNbHzby6LarNnSc47JY5KhSTk0a3sYtq+GzAJCVrenlMy
	QFk4KmSlsCg9Hp21xeBH+ryJXb2126eonlU2SkwA7zcQ9h6tHv/Yj3ilwY6mlTH+EB/lkik+Twa
	ANKUsr5M6GmIwaBtJjV/NuxHYoX/wn6M00ITt7eW71fD8SbG1tlxsN8I11Tt6b9cCNWHVQIWrTR
	B9cZqNwsinfTUyhdPPo5D7mcUr+gjq5MzXo2JXHQV9E69gJseCEzK8bGPq0VB6EHe7IaKfFv3c6
	mzkFODgso0RxaE6LeUXIjOYFh7C4L+NmorOfpxLfpeUIOdkyU0Le4MnH2ru8VscZ4SikmuXvbPZ
	RnTGeWwEnY+1MaPhDhhbCgA==
X-Google-Smtp-Source: AGHT+IFUiVJxV3NYhvZvPNTJJ/n2oRJZMr2M+J/S4RsJ+ci0thZTbZ0fKaVHCKdywwaTc9wnOkyONw==
X-Received: by 2002:a05:622a:38d:b0:4a7:2f49:37d6 with SMTP id d75a77b69052e-4a73c47e5f7mr240133401cf.5.1750175621989;
        Tue, 17 Jun 2025 08:53:41 -0700 (PDT)
Received: from localhost (d24-150-219-207.home.cgocable.net. [24.150.219.207])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4a72a2bfc2asm61893971cf.4.2025.06.17.08.53.41
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jun 2025 08:53:41 -0700 (PDT)
From: Trevor Gamblin <tgamblin@baylibre.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH 1/5] python3-colorama: add recipe
Date: Tue, 17 Jun 2025 11:53:35 -0400
Message-ID: <20250617155339.1305652-1-tgamblin@baylibre.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 17 Jun 2025 15:53:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218883

Add existing recipe from meta-python, since pytest lists it as a
dependency. This also puts it in maintainers.inc with myself as
maintainer.

Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
---
 meta/conf/distro/include/maintainers.inc           |  1 +
 .../python/python3-colorama_0.4.6.bb               | 14 ++++++++++++++
 2 files changed, 15 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3-colorama_0.4.6.bb

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
index b6cf4b7cfa..5d2ac05b27 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -623,6 +623,7 @@ RECIPE_MAINTAINER:pn-python3-beartype = "Marta Rybczynska <marta.rybczynska@ygre
 RECIPE_MAINTAINER:pn-python3-booleanpy = "zhengrq.fnst <zhengrq.fnst@fujitsu.com>"
 RECIPE_MAINTAINER:pn-python3-build = "Ross Burton <ross.burton@arm.com>"
 RECIPE_MAINTAINER:pn-python3-calver = "Trevor Gamblin <tgamblin@baylibre.com>"
+RECIPE_MAINTAINER:pn-python3-colorama = "Trevor Gamblin <tgamblin@baylibre.com>"
 RECIPE_MAINTAINER:pn-python3-certifi = "Tim Orling <tim.orling@konsulko.com>"
 RECIPE_MAINTAINER:pn-python3-cffi = "Tim Orling <tim.orling@konsulko.com>"
 RECIPE_MAINTAINER:pn-python3-chardet = "Tim Orling <tim.orling@konsulko.com>"
diff --git a/meta/recipes-devtools/python/python3-colorama_0.4.6.bb b/meta/recipes-devtools/python/python3-colorama_0.4.6.bb
new file mode 100644
index 0000000000..3871244031
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-colorama_0.4.6.bb
@@ -0,0 +1,14 @@
+SUMMARY = "Cross-platform colored terminal text."
+HOMEPAGE = "https://github.com/tartley/colorama"
+LICENSE = "BSD-3-Clause"
+LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=b4936429a56a652b84c5c01280dcaa26"
+
+inherit pypi python_setuptools_build_meta
+
+SRC_URI[sha256sum] = "08695f5cb7ed6e0531a20572697297273c47b8cae5a63ffc6d6ed5c201be6e44"
+
+DEPENDS += " \
+	python3-hatchling-native \
+"
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.49.0


