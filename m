Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2CC2CEE49A3
	for <webhook@archiver.kernel.org>; Wed, 23 Aug 2023 16:24:19 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.web11.1101.1692807853505150310
 for <openembedded-core@lists.openembedded.org>;
 Wed, 23 Aug 2023 09:24:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=YGASkLnB;
 spf=pass (domain: konsulko.com, ip: 209.85.128.45, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-3fef3c3277bso27845455e9.1
        for <openembedded-core@lists.openembedded.org>; Wed, 23 Aug 2023 09:24:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1692807851; x=1693412651;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fGKKYr4c3VbavXRsqCtPnzXBmTEkiP9sWh/TpOncROw=;
        b=YGASkLnBZjnvxIOuXczFZy7/51bOwfFQ7SsdX/1bKtiOUOV/O9YGjYN+EyHaNKmr6q
         kVO3S/047mX8g4wxJXy8XdX6agICCbt1ccnKtIxbV+PCktJ3Wrr0unRwWJrGIgoae+oL
         97x6AsZp5iOcE43xJkdYSTKclOyqS18ek/yBk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692807851; x=1693412651;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fGKKYr4c3VbavXRsqCtPnzXBmTEkiP9sWh/TpOncROw=;
        b=GCx1g1yhWlOGQheZv2v2sGFy1mMYezrGlrsdsu8OJsGF+seqp6D2CNUZ/tv3xZr997
         4owzgbU3tRXwyVNRpGdFGqVSXRsTXifo3u0T9X9rorRrGTdtBABJ9xCkoKEluXoT+dmi
         uYIZEapa80PcAXZoOJtYRqrRHF24BNbsS2riEIDahsqwR9KqAxV7bK6Z9Dvsgy7zz+A2
         xE6/+OxUh2eqDm96XOKwIVc5vmj08Rf2JVlYVSJFun3zkjKPT8eL6WyqwavS1TF7cdkK
         PZP40dmcQjwDb9V1AM9ejsDODchGPuDn2zGDG9TeEnP0Zxhb8LkZd+x81dm5D6dwnNaD
         0Cvw==
X-Gm-Message-State: AOJu0YzT6p95agxRKCPcqcwmNxl5velLDEm/7ICCycSBcIBYwsZp0OKt
	1AoJiLNKX44QPhhkCHpSjeQLE7agH/sXK6d0w6k=
X-Google-Smtp-Source: AGHT+IHZKw+gI4IZVnLP4SxvFBxVLqhSYpzHZfMH/vvPcPgbMWGZt+B49McS3Vi/AAF8VyCK3aavRA==
X-Received: by 2002:a7b:c84d:0:b0:3fe:e8b4:436f with SMTP id c13-20020a7bc84d000000b003fee8b4436fmr8832367wml.14.1692807851744;
        Wed, 23 Aug 2023 09:24:11 -0700 (PDT)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id o5-20020a1c7505000000b003fee8502999sm37521wmc.18.2023.08.23.09.24.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Aug 2023 09:24:11 -0700 (PDT)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-core@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [PATCH 2/2] neatvnc: add new recipe
Date: Wed, 23 Aug 2023 19:24:04 +0300
Message-Id: <20230823162404.457379-2-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230823162404.457379-1-leon.anavi@konsulko.com>
References: <20230823162404.457379-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 23 Aug 2023 16:24:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186621

Add a new recipe for neatvnc v0.6.0, a liberally licensed VNC
server library with a clean interface. It is required for building
Weston with VNC backend.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 meta/conf/distro/include/maintainers.inc     |  1 +
 meta/recipes-graphics/neatvnc/neatvnc_git.bb | 40 ++++++++++++++++++++
 2 files changed, 41 insertions(+)
 create mode 100644 meta/recipes-graphics/neatvnc/neatvnc_git.bb

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
index 11b47ffe84..f659e24a66 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -895,3 +895,4 @@ RECIPE_MAINTAINER:pn-zip = "Denys Dmytriyenko <denis@denix.org>"
 RECIPE_MAINTAINER:pn-zlib = "Denys Dmytriyenko <denis@denix.org>"
 RECIPE_MAINTAINER:pn-zstd = "Alexander Kanavin <alex.kanavin@gmail.com>"
 RECIPE_MAINTAINER:pn-aml = "Leon Anavi <leon.anavi@konsulko.com>"
+RECIPE_MAINTAINER:pn-neatvnc = "Leon Anavi <leon.anavi@konsulko.com>"
diff --git a/meta/recipes-graphics/neatvnc/neatvnc_git.bb b/meta/recipes-graphics/neatvnc/neatvnc_git.bb
new file mode 100644
index 0000000000..dc4678f082
--- /dev/null
+++ b/meta/recipes-graphics/neatvnc/neatvnc_git.bb
@@ -0,0 +1,40 @@
+SUMMARY = "A liberally licensed VNC server library"
+DESCRIPTION = "This is a liberally licensed VNC server library that's intended to be fast and neat."
+HOMEPAGE = "https://github.com/any1/neatvnc"
+LICENSE = "ISC"
+LIC_FILES_CHKSUM = "file://COPYING;md5=94fc374e7174f41e3afe0f027ee59ff7"
+
+SRC_URI = "git://github.com/any1/neatvnc;branch=master;protocol=https"
+
+SRCREV = "8b3dc1ae6099dcfa73aec3ae11df2fdc58540d14"
+
+PV = "0.6.0+git${SRCPV}"
+
+S = "${WORKDIR}/git"
+
+DEPENDS = "libdrm pixman aml zlib"
+
+PACKAGECONFIG ??= "tls"
+PACKAGECONFIG[tls] = "-Dtls=enabled,-Dtls=disabled,gnutls"
+PACKAGECONFIG[jpeg] = "-Djpeg=enabled,-Djpeg=disabled,libjpeg-turbo"
+PACKAGECONFIG[examples] = "-Dexamples=true,-Dexamples=false,libpng"
+PACKAGECONFIG[benchmarks] = "-Dbenchmarks=true,-Dbenchmarks=false,libpng"
+
+PACKAGE_BEFORE_PN += "${PN}-examples"
+ALLOW_EMPTY:${PN}-examples = "1"
+FILES:${PN}-examples = "${bindir}"
+
+NEATVNC_EXAMPLES = "draw png-server"
+
+inherit meson pkgconfig
+
+do_install:append () {
+	if ${@bb.utils.contains('PACKAGECONFIG', 'examples', 'true', 'false', d)}; then
+		install -d ${D}${bindir}
+		for bin in ${NEATVNC_EXAMPLES}; do
+			install -m 0755 ${B}/examples/$bin ${D}${bindir}
+		done
+	fi
+}
+
+BBCLASSEXTEND = "native"
-- 
2.39.2


