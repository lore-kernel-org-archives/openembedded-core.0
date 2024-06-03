Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B99BC25B75
	for <webhook@archiver.kernel.org>; Mon,  3 Jun 2024 13:39:47 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.web11.83699.1717421983864556742
 for <openembedded-core@lists.openembedded.org>;
 Mon, 03 Jun 2024 06:39:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=YGms+jdp;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.43, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4213485697fso18689955e9.1
        for <openembedded-core@lists.openembedded.org>; Mon, 03 Jun 2024 06:39:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1717421982; x=1718026782; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BukjVa5S942BO7gW9rkUdPmn20VU3PpZweG7xxdHwwQ=;
        b=YGms+jdpg3mFuwi+Aig4QOgN7VcmzSQGn0DL9yJ4iMjsf37qNce8HOW282kkhq4wrM
         rRNAfIoAoRvCLHm7JDttd9SvJEAJ8hYQDOqbLVSoPEnY5GxhW78Kuw+9jwtnhabDwWsr
         ir9k6i+v2YJEenWfHBZ+R3UlzjxiFWHyJ8aVs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717421982; x=1718026782;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BukjVa5S942BO7gW9rkUdPmn20VU3PpZweG7xxdHwwQ=;
        b=NshUjWma0WKMTyGm4Ps9E1JkUYLYKadjpsASZjapt0JKlzX0nxD7n/Z7GuuOcbQ4bb
         aFK2acVnvOb2j7N+s8c4miRvVfgCwz3WZ5WRWfFnJdxzT5WUSErlmdvhDzCxHDINd17Z
         jmKUc+zMqCruUlvZ1u7tc6yv+C9CfN7sxYRyL9Wm4FWwuHBI/mRF5XdU5C4TtNbrQ3it
         oEaU2bbrgva5C1mB7u/oOivOolcvjxKMn2pi1SK5jl2IzcDN/zTU5pHYe/ZKpHmKw7wJ
         f48U/blD/VP+7kNDE3rNq6dbalRjog0bnzCUT/8PTxVWjV40vjbtMRiqcRXWGP7SEYib
         b0Fw==
X-Gm-Message-State: AOJu0Yw9EzFLeD8mBFtiNVpZYZkcRkmi40AT8Lhk0YwUe3DuZ59CnF5t
	kSEVBP2TD4uW0UJ1OVe++srKq8uBIf6sSBIBi2gJiOkGVEk+bgnKmEyrIsgsnNkvBNY9/U66+ZX
	Q
X-Google-Smtp-Source: AGHT+IGx/qmeWhZYq7ZI5w/mkcgTnias6CJB4VjH00ByFatipF9eW2Y51A1FlvqvCsHIOd2k0wX1Cw==
X-Received: by 2002:a05:600c:5113:b0:41b:f3b6:e5da with SMTP id 5b1f17b1804b1-4212e0c3fc1mr83797415e9.36.1717421982121;
        Mon, 03 Jun 2024 06:39:42 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:3a80:acf7:af1d:55dc])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4212b8a4cc0sm117581735e9.30.2024.06.03.06.39.41
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Jun 2024 06:39:41 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 4/4] libtool: Drop obsolete configure/compile prepends
Date: Mon,  3 Jun 2024 14:39:38 +0100
Message-Id: <20240603133938.3552266-4-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240603133938.3552266-1-richard.purdie@linuxfoundation.org>
References: <20240603133938.3552266-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 03 Jun 2024 13:39:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200252

The introduction of sstate and recipe specific sysroots made the configure
prepends obsolete and unneeded. The compile prepend has been there for over
a decade and is also likely obsolete. Remove the whole lot, we look into any
issues that arise.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-devtools/libtool/libtool-2.5.0.inc          | 7 -------
 meta/recipes-devtools/libtool/libtool-cross_2.5.0.bb     | 7 -------
 meta/recipes-devtools/libtool/libtool-native_2.5.0.bb    | 7 -------
 meta/recipes-devtools/libtool/nativesdk-libtool_2.5.0.bb | 7 -------
 4 files changed, 28 deletions(-)

diff --git a/meta/recipes-devtools/libtool/libtool-2.5.0.inc b/meta/recipes-devtools/libtool/libtool-2.5.0.inc
index a609de6369b..e0c9aae387a 100644
--- a/meta/recipes-devtools/libtool/libtool-2.5.0.inc
+++ b/meta/recipes-devtools/libtool/libtool-2.5.0.inc
@@ -24,13 +24,6 @@ SRC_URI = "https://alpha.gnu.org/gnu/libtool/libtool-${PV}.tar.gz \
 
 SRC_URI[sha256sum] = "d438c317455d85554ce2f998be48866fd40cfcbf834d60b3026f4fc0ed583d23"
 
-do_compile:prepend () {
-	# Sometimes this file doesn't get rebuilt, force the issue
-	rm -f ${S}/build-aux/ltmain.sh
-	make build-aux/ltmain.sh
-	./config.status
-}
-
 inherit autotools texinfo
 EXTRA_AUTORECONF = "--exclude=libtoolize"
 
diff --git a/meta/recipes-devtools/libtool/libtool-cross_2.5.0.bb b/meta/recipes-devtools/libtool/libtool-cross_2.5.0.bb
index 93f1dd7825d..18849cb8ef6 100644
--- a/meta/recipes-devtools/libtool/libtool-cross_2.5.0.bb
+++ b/meta/recipes-devtools/libtool/libtool-cross_2.5.0.bb
@@ -7,13 +7,6 @@ datadir = "${STAGING_DIR_TARGET}${target_datadir}"
 
 inherit nopackages
 
-do_configure:prepend () {
-	# Remove any existing libtool m4 since old stale versions would break
-	# any upgrade
-	rm -f ${STAGING_DATADIR}/aclocal/libtool.m4
-	rm -f ${STAGING_DATADIR}/aclocal/lt*.m4
-}
-
 #
 # ccache may or may not be INHERITED, we remove references to it so the sstate
 # artefact works on a machine where its not present. libtool-cross isn't used
diff --git a/meta/recipes-devtools/libtool/libtool-native_2.5.0.bb b/meta/recipes-devtools/libtool/libtool-native_2.5.0.bb
index 92f4b463032..be96b52dd66 100644
--- a/meta/recipes-devtools/libtool/libtool-native_2.5.0.bb
+++ b/meta/recipes-devtools/libtool/libtool-native_2.5.0.bb
@@ -4,13 +4,6 @@ DEPENDS = ""
 
 inherit native
 
-do_configure:prepend () {
-	# Remove any existing libtool m4 since old stale versions would break
-	# any upgrade
-	rm -f ${STAGING_DATADIR}/aclocal/libtool.m4
-	rm -f ${STAGING_DATADIR}/aclocal/lt*.m4
-}
-
 do_install () {
 	autotools_do_install
 	install -d ${D}${bindir}/
diff --git a/meta/recipes-devtools/libtool/nativesdk-libtool_2.5.0.bb b/meta/recipes-devtools/libtool/nativesdk-libtool_2.5.0.bb
index 86c55ded7b6..ddb60e717ca 100644
--- a/meta/recipes-devtools/libtool/nativesdk-libtool_2.5.0.bb
+++ b/meta/recipes-devtools/libtool/nativesdk-libtool_2.5.0.bb
@@ -9,13 +9,6 @@ inherit nativesdk
 S = "${WORKDIR}/libtool-${PV}"
 FILES:${PN} += "${datadir}/libtool/*"
 
-do_configure:prepend () {
-	# Remove any existing libtool m4 since old stale versions would break
-	# any upgrade
-	rm -f ${STAGING_DATADIR}/aclocal/libtool.m4
-	rm -f ${STAGING_DATADIR}/aclocal/lt*.m4
-}
-
 do_install () {
 	autotools_do_install
 	install -d ${D}${bindir}/

