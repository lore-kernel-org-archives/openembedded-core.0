Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39626C44501
	for <webhook@archiver.kernel.org>; Mon,  6 Jul 2026 17:17:12 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.155284.1783358229988788178
 for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Jul 2026 10:17:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=XH0PKBx/;
 spf=pass (domain: gmail.com, ip: 209.85.128.50, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-493bc8fda98so36378865e9.0
        for <openembedded-core@lists.openembedded.org>; Mon, 06 Jul 2026 10:17:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783358228; x=1783963028; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YxkG6D5u937lNGag/mb8N6RrbhKqZJCHuXycVEIqRhU=;
        b=XH0PKBx/gmrLIOlujCKw7+fPn4nZ3mXH+ZqOMHLFgrSOQku4MjzgLLvHGP1TJh2H90
         e1k2wlFAGSdz/9d6ciHrg3TbLxKyMwem1iRXdAQLdEXF2pAmAeY3Ms8tNp8bKxK1dtgK
         8PbkIBh5IRzMQTgmB89GzhLTza0XwSZEUNjNPdkeII7PXBF7LF+xv8dt7ZO+piDbXFtQ
         /zlawryrOK7rxD/Xxaj5O+CF474M3a0CXF+GYccH9WSiQdyAilJWoJ/DhZrNhcWyxwKB
         ccC9Dsm97BrtTe1RzdVfBFYbt6RBtmdAC85uaDLDvp38zZMLdphkEpBlgMkJGYP7HlJ/
         rqsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783358228; x=1783963028;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=YxkG6D5u937lNGag/mb8N6RrbhKqZJCHuXycVEIqRhU=;
        b=JJo8zcMV8hiYcZiRLNpjO4o52mrWHUSCFjbGqb/Sxe5vJS4RsYA/D3Pb7YTUhvOJc8
         v8ytsM/RhPOGO0G9djQElt27wv2ipVoSBaCBZ/oZMwiwyP+izl9Nr9BRm9utHgPmgFYt
         2ubVZzKm4c1GCpttvoagy0A2gA/xzYM+mUV5iiZTpqf8oQ5k5RYMpXps5EDiRj4yHdL1
         r8nPYGovQvHZuvbFCY9+Fh7I5bRR941nsak50lA+cjxBVSLz1RuQRRLGsZ7OFW6wGe5T
         LShRRC6K/sbvWzEYY+FeUQMR7PM3EDKsRm2KmIA3+BJgaQ6JiVfweqFb28r6caJewuJS
         RFFQ==
X-Gm-Message-State: AOJu0Yx6R7v7FvvIv3ompMuIXM0XacD1kqovmnNMoBJvsvBGCt0fgQHD
	HFvnloAQpjiXMPRTUntSNgF67UliZNow2eV5Oz2kkNnWZF43JLc/k86lN8DDfw==
X-Gm-Gg: AfdE7clCxplYC5W1GmoHVy3vxNjvakW2eavou5WhXGa3gsarHElcpyi11Y5a8Py0gGr
	/1smzWuxVjynw0Eq3b+wUKEinWvvk/5+m1LeYIOn4LxiBNP5agxz6Ck6MWoDPoE0eS4zFs2FJBv
	UDhhKs4lia4K/iSsrAfBn0i03TFgiLwDB2uS634Bwe2Rd5xmuOTC2+Eaq9AtMkZVBExi6rOacJU
	KnRD0CwsqIfwtr7gNb5kNTG9nIabsFyyVVM5VXfBP4WH0D6tYgEbs8s2omZIoRnMJL9UsgzPGco
	6ohv8xC4s+vJbhrdkTPgNmBtaxIkNgIcqf+cqQ+zhUH9yIkEJUNDEIYdDEsU8YFdZJgWEA1aqZZ
	BM2163imzjjauTxyWR/sQG5ebEyyAWrl3VWAxMANmAZ5PXyK3IAqHthO3EVMREuN7krCdzjYX82
	nI6fMinp3ITqBAhLsJlG+jKgdB5GQdgrNU1XVAuMkjCzGMMCgM
X-Received: by 2002:a7b:c00a:0:b0:493:bfbf:1da4 with SMTP id 5b1f17b1804b1-493df065f71mr12871665e9.22.1783358228127;
        Mon, 06 Jul 2026 10:17:08 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493c63ba971sm640541005e9.13.2026.07.06.10.17.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 10:17:07 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 04/45] appstream: upgrade 1.1.2 -> 1.1.3
Date: Mon,  6 Jul 2026 19:16:18 +0200
Message-ID: <20260706171701.70536-4-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260706171701.70536-1-alex.kanavin@gmail.com>
References: <20260706171701.70536-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 06 Jul 2026 17:17:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240290

From: Alexander Kanavin <alex@linutronix.de>

Disable manpages (and remove related dependencies), as upstream
has converted them to docbook 5, which oe-core does not provide.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../appstream/0001-remove-hardcoded-path.patch       |  4 ++--
 .../appstream/0002-Do-not-build-qt-tests.patch       |  5 +----
 ...GE_PREFIX_DIR-in-qt-cmake-AppStreamQtConfig.patch |  2 +-
 .../{appstream_1.1.2.bb => appstream_1.1.3.bb}       | 12 +++---------
 4 files changed, 7 insertions(+), 16 deletions(-)
 rename meta/recipes-support/appstream/{appstream_1.1.2.bb => appstream_1.1.3.bb} (85%)

diff --git a/meta/recipes-support/appstream/appstream/0001-remove-hardcoded-path.patch b/meta/recipes-support/appstream/appstream/0001-remove-hardcoded-path.patch
index 5f4ec29628..56a5479099 100644
--- a/meta/recipes-support/appstream/appstream/0001-remove-hardcoded-path.patch
+++ b/meta/recipes-support/appstream/appstream/0001-remove-hardcoded-path.patch
@@ -1,4 +1,4 @@
-From e713f4d6ce2ee198eabcc31bc734e84cdb20ea32 Mon Sep 17 00:00:00 2001
+From bf79c20cfee4a074ca752a1466dc96d0b9eb6175 Mon Sep 17 00:00:00 2001
 From: Markus Volk <f_l_k@t-online.de>
 Date: Mon, 12 Dec 2022 15:42:42 +0100
 Subject: [PATCH] remove hardcoded path
@@ -14,7 +14,7 @@ Upstream-Status: Inappropriate [oe-specific]
  1 file changed, 2 insertions(+), 2 deletions(-)
 
 diff --git a/meson.build b/meson.build
-index ee5b179..8a06e75 100644
+index 9af5f58..ad1483d 100644
 --- a/meson.build
 +++ b/meson.build
 @@ -194,10 +194,10 @@ endif
diff --git a/meta/recipes-support/appstream/appstream/0002-Do-not-build-qt-tests.patch b/meta/recipes-support/appstream/appstream/0002-Do-not-build-qt-tests.patch
index f6bbdd180a..3e666181eb 100644
--- a/meta/recipes-support/appstream/appstream/0002-Do-not-build-qt-tests.patch
+++ b/meta/recipes-support/appstream/appstream/0002-Do-not-build-qt-tests.patch
@@ -1,4 +1,4 @@
-From 5763a61ca9aff2e2383c1eeb1ef3f5e6cd07c539 Mon Sep 17 00:00:00 2001
+From 1a1619dce3c3fa54fa5f47f7ed89447e0805de43 Mon Sep 17 00:00:00 2001
 From: Marc Ferland <marc.ferland@sonatest.com>
 Date: Fri, 26 Jul 2024 15:41:00 -0400
 Subject: [PATCH] Do not build qt/tests
@@ -32,6 +32,3 @@ index 407a57a..840c838 100644
  )
 -
 -subdir('tests/')
--- 
-2.34.1
-
diff --git a/meta/recipes-support/appstream/appstream/0003-Fix-PACKAGE_PREFIX_DIR-in-qt-cmake-AppStreamQtConfig.patch b/meta/recipes-support/appstream/appstream/0003-Fix-PACKAGE_PREFIX_DIR-in-qt-cmake-AppStreamQtConfig.patch
index d1994e3c4c..8ba4de95c9 100644
--- a/meta/recipes-support/appstream/appstream/0003-Fix-PACKAGE_PREFIX_DIR-in-qt-cmake-AppStreamQtConfig.patch
+++ b/meta/recipes-support/appstream/appstream/0003-Fix-PACKAGE_PREFIX_DIR-in-qt-cmake-AppStreamQtConfig.patch
@@ -1,4 +1,4 @@
-From f19365d8b90cde7d2a385f8c85b74a2565ff25fa Mon Sep 17 00:00:00 2001
+From 4fdd29346b51eea577ee46c7166348dad19bbcb0 Mon Sep 17 00:00:00 2001
 From: Marc Ferland <marc.ferland@sonatest.com>
 Date: Mon, 29 Jul 2024 09:35:51 -0400
 Subject: [PATCH] Fix PACKAGE_PREFIX_DIR in qt/cmake/AppStreamQtConfig.cmake.in
diff --git a/meta/recipes-support/appstream/appstream_1.1.2.bb b/meta/recipes-support/appstream/appstream_1.1.3.bb
similarity index 85%
rename from meta/recipes-support/appstream/appstream_1.1.2.bb
rename to meta/recipes-support/appstream/appstream_1.1.3.bb
index c6ec0fff0a..06e4f7940a 100644
--- a/meta/recipes-support/appstream/appstream_1.1.2.bb
+++ b/meta/recipes-support/appstream/appstream_1.1.3.bb
@@ -5,18 +5,12 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=4bf661c1e3793e55c8d1051bc5e0ae21"
 
 DEPENDS = " \
     appstream-native \
-    curl-native \
     curl \
-    docbook-xml-dtd4-native \
     gperf-native \
-    glib-2.0 \
+    itstool-native \
     libfyaml \
     libxml2 \
     libxmlb \
-    libxslt-native \
-    itstool-native \
-    docbook-xsl-stylesheets-native \
-    python3-pygments-native \
 "
 
 inherit meson gobject-introspection gettext gi-docgen pkgconfig vala bash-completion
@@ -30,7 +24,7 @@ SRC_URI = " \
 	file://0002-Do-not-build-qt-tests.patch \
 	file://0003-Fix-PACKAGE_PREFIX_DIR-in-qt-cmake-AppStreamQtConfig.patch \
 "
-SRC_URI[sha256sum] = "46b4257100e25a6468ceed7b3ab82441f47b119da3398d30aea6d7b91174b586"
+SRC_URI[sha256sum] = "2624f967068427edc94f3979edae3571bb077063f5bc231f737776da527bf467"
 
 S = "${UNPACKDIR}/AppStream-${PV}"
 
@@ -44,7 +38,7 @@ PACKAGECONFIG[bash-completion] = "-Dbash-completion=true,-Dbash-completion=false
 
 FILES:${PN} += "${datadir}"
 
-EXTRA_OEMESON += "${@bb.utils.contains('GI_DATA_ENABLED', 'True', '-Dvapi=true', '-Dvapi=false', d)}"
+EXTRA_OEMESON += "${@bb.utils.contains('GI_DATA_ENABLED', 'True', '-Dvapi=true', '-Dvapi=false', d)} -Dman=false"
 
 BBCLASSEXTEND = "native"
 
-- 
2.47.3


