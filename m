Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D866C48BC3
	for <webhook@archiver.kernel.org>; Mon, 19 Feb 2024 17:30:56 +0000 (UTC)
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
 by mx.groups.io with SMTP id smtpd.web10.84.1708363853891553189
 for <openembedded-core@lists.openembedded.org>;
 Mon, 19 Feb 2024 09:30:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=YybZtaRz;
 spf=pass (domain: gmail.com, ip: 209.85.214.175, mailfrom: ticotimo@gmail.com)
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-1dc0d11d1b7so3673235ad.2
        for <openembedded-core@lists.openembedded.org>; Mon, 19 Feb 2024 09:30:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708363853; x=1708968653; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IIgcw033LgE3hR3Xvegb6+OLrEkfLBHe14B018F7DDA=;
        b=YybZtaRzEa288+EeaFH0q8RO9bSJEv6Uk6T7orCA96xcMbUPrJHlW76Ccxkp49bTXq
         HPT2DsJkP2TY4wNtBGYuhLLjYD8eyacqx5ZuqT0u+3boeJgkJSU45HWRjbm/vyTrRAlU
         coqpRBXlBu6FR9vaYYOU69jqeKR68BFsOZAb+8vPeSrG2lBLFo6aSODNHYRRCG9MApgE
         X316Lc1BSGj1hxMa2Z/9C8TZyMZMba5jjwnmAl3IwazB4YPFcDuMaAXq41U+P2tJ9K6o
         EpK5FlBbxhGajjYm9rP7DCcnnVFtNphq844FFgqIzl6gOX3AaHwSmHFUdYGsKKzbfTJT
         F3gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708363853; x=1708968653;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IIgcw033LgE3hR3Xvegb6+OLrEkfLBHe14B018F7DDA=;
        b=HpSM3cNXPBT61kiLGrrAJ8YSdjONflGljI5Ko1z5P29ev0HDHAVzwTrDnZUlvWXf29
         n2N7peDTUst5OjQfj3zHEjDuf4WlHRjbfARYCRy1cfSBJbwcDiDYGaQqzr9wwNV+7x/Z
         uIYr8quphcjCZAbkNflokQKLKCjIpBYoMd8c4/K5wUmDq8wktzavq8Mp23FOWr06eQBS
         9AkOSW/14nEbzhDF9pJroipyJ7qJ3cxHffNjnMoBu5qMy45fRY8aWR8Ad8m4/+JdhsZk
         3XAu/tByrqMcZ1n2t1hPViNO5p3+zXoBKsINbc9qLFj7j8ObtUu/h32n2Ee/E0Qy0Cfs
         MQZA==
X-Gm-Message-State: AOJu0Yy1uL5QTA2/D4hIIdFSbn0KJ5aHMZJcmCzNMK5gQiUVlHGKSkrf
	xIUhDLHjweZyKAu5O3cPIh5UzD2i75yfD4bT/sy8XJS0CuUwnbfkraHOfHEQ
X-Google-Smtp-Source: AGHT+IFU1OT/DG6BiqJtaaFZwHcaaDg9SL9ZUkqPSEsbFaTo1+SZ3MS8SskbQYZcLf+Gzac4I/WN9A==
X-Received: by 2002:a17:902:ec91:b0:1db:f6b0:92d with SMTP id x17-20020a170902ec9100b001dbf6b0092dmr3372958plg.6.1708363852784;
        Mon, 19 Feb 2024 09:30:52 -0800 (PST)
Received: from chiron.hsd1.or.comcast.net ([2601:1c0:ca01:19f0:7caf:da97:8daf:f655])
        by smtp.gmail.com with ESMTPSA id w3-20020a170903310300b001d965e737f2sm4630428plc.268.2024.02.19.09.30.52
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Feb 2024 09:30:52 -0800 (PST)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <tim.orling@konsulko.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/4] python3-meson-python: move from meta-python
Date: Mon, 19 Feb 2024 09:30:21 -0800
Message-Id: <02176646ae350c144db8b3728e04cefc54b579b1.1708363628.git.tim.orling@konsulko.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1708363628.git.tim.orling@konsulko.com>
References: <cover.1708363628.git.tim.orling@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 19 Feb 2024 17:30:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195892

meson-python is a Python build backend built on top of the Meson
build-system. It enables you to use Meson for your Python packages.

https://meson-python.readthedocs.io/en/latest/

It is used as the PEP-517 build-backend for python3-numpy and python3-scipy.

For other projects using the backend, see:
https://meson-python.readthedocs.io/en/latest/projects-using-meson-python.html

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
 meta/conf/distro/include/maintainers.inc      |  1 +
 .../python/python3-meson-python_0.15.0.bb     | 27 +++++++++++++++++++
 2 files changed, 28 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3-meson-python_0.15.0.bb

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
index f489fbe275f..1ab69175bb8 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -657,6 +657,7 @@ RECIPE_MAINTAINER:pn-python3-mako = "Trevor Gamblin <tgamblin@baylibre.com>"
 RECIPE_MAINTAINER:pn-python3-markdown = "Alexander Kanavin <alex.kanavin@gmail.com>"
 RECIPE_MAINTAINER:pn-python3-markupsafe = "Richard Purdie <richard.purdie@linuxfoundation.org>"
 RECIPE_MAINTAINER:pn-python3-maturin = "Tim Orling <tim.orling@konsulko.com>"
+RECIPE_MAINTAINER:pn-python3-meson-python = "Tim Orling <tim.orling@konsulko.com>"
 RECIPE_MAINTAINER:pn-python3-more-itertools = "Tim Orling <tim.orling@konsulko.com>"
 RECIPE_MAINTAINER:pn-python3-ndg-httpsclient = "Tim Orling <tim.orling@konsulko.com>"
 RECIPE_MAINTAINER:pn-python3-numpy = "Trevor Gamblin <tgamblin@baylibre.com>"
diff --git a/meta/recipes-devtools/python/python3-meson-python_0.15.0.bb b/meta/recipes-devtools/python/python3-meson-python_0.15.0.bb
new file mode 100644
index 00000000000..ad3cfe17d9e
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-meson-python_0.15.0.bb
@@ -0,0 +1,27 @@
+SUMMARY = "Meson Python build backend (PEP 517)"
+HOMEPAGE = "https://github.com/mesonbuild/meson-python"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=d580b27e67cc0892a5b005b0be114b60"
+
+DEPENDS = " \
+	meson-native \
+	ninja-native \
+	patchelf-native \
+	python3-pyproject-metadata-native \
+"
+
+PYPI_PACKAGE = "meson_python"
+
+inherit pypi python_mesonpy
+SRC_URI[sha256sum] = "fddb73eecd49e89c1c41c87937cd89c2d0b65a1c63ba28238681d4bd9484d26f"
+
+DEPENDS:remove:class-native = "python3-meson-python-native"
+
+RDEPENDS:${PN} = " \
+	meson \
+	ninja \
+	patchelf \
+	python3-pyproject-metadata \
+"
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.34.1


