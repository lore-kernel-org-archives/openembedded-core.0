Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A714BCAC5B0
	for <webhook@archiver.kernel.org>; Thu, 25 Sep 2025 10:53:48 +0000 (UTC)
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
 by mx.groups.io with SMTP id smtpd.web11.8715.1758797627369277255
 for <openembedded-core@lists.openembedded.org>;
 Thu, 25 Sep 2025 03:53:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=QNaCJzkO;
 spf=pass (domain: gmail.com, ip: 209.85.218.52, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-b07e3a77b72so325208666b.0
        for <openembedded-core@lists.openembedded.org>; Thu, 25 Sep 2025 03:53:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758797626; x=1759402426; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dySNZ3NitUhysc84RBEbbz2rwJp5NeGr7wYCVoORHtc=;
        b=QNaCJzkOZ6bnlGRp95IZGfPZm6RscfKf3mvusuFxhA2nr+VodW3V+WzocJaCOEVHEX
         aRoGFDvcf3EsGNPQ5q7n7u5TlEFTbGs/zw2ZR9PLAICRlgStyIYT1cVUwA+M5JUQ7+Je
         /cIN3foup/YFF3XbWGNOWexmmfMw9oP8DzoLz1t7Ii5VzQZZU3vj7ep3f1e/O1hLozfJ
         D5LxuiGJLKWKLCc+bJEpq0dxPCwA9Xwf4xwzYPmNUJFs/QkaSEs8utjad0xMPPCUSa3k
         +dpVqwGdZSALj+dtgILlSIWfkdOiynU9whbdH3LampNeq9rKO1nPYPV6IJRa+VxhrP2A
         AeMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758797626; x=1759402426;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dySNZ3NitUhysc84RBEbbz2rwJp5NeGr7wYCVoORHtc=;
        b=no7s34rBErf4/TkO7f4P34W/2vQZaLsTw/8UA2T1ofKBhJ4vBng8h/G4BCek6sbqfI
         kZD44fDgW6r0zw/j7Ah/vs+SkUlt42Pb0mJA8dXG9JwZo5awgw/QzeGbxX01J0TjhW05
         Q2E+QHpeWVBuuMeFCDvyorSKA45cVctg/E7u+SHNr8sK/dqr4ufgkh4NsI4o2+kuIdrQ
         MOTKd6lYjjnTWg5If/M74D5wVtsKRkgbcvOiDjMcy39aZPlg54jvAxy2PGwNJBvFk0Wh
         r6FG7/HrEAfjbytBEGSfooTEVnSPO3U8M1ABc7+zE0mT6iP0oxFhkNvL8WEBhiNh1AcJ
         9pcA==
X-Gm-Message-State: AOJu0YwjSEdMjR/uMbzuUqR5uDCoFIibGFsOGeAFz1bpLTdmikJm8gXc
	+k2rsv6QmeZNteFDgTfP3NF50nnPW6eCxxIbkQqRNBuQ06EnUzlBR8W8EXEmvA==
X-Gm-Gg: ASbGncsyXYHKF6UMAFudNsJVG3t40159+GlVIBa7x2fEOf3YIw7uqBjTrfJDDnipKsg
	FGn6gyAQvMCaRukGhKbXn4ihZuh5FZSy/r7adCVF+RjpzA9rFJM9WIWz8RD+1u/xaFlWzfaJ2nm
	Us+ATPEp4D0NboPcLs0ztdU/1HAOD0T98Lm8dJBlijREmaY0CB/ReZ7JlVJpaduOxgmdiT5TCso
	aANP4IpuPOr/abLay8RJjAaGPPWKRTsvPGVGMmXJDfw+6mD3SXJVrJI2Vbyty+28UabYohqFQAd
	sK6jxN+Uczuwpvq4d0FF/2JQt1aT6sGGNFVgkBWimCGsxqxPy6ujI5qiW+T8/GfFfgPwXKUtdi6
	DW4PTGaF6PlJBZP8fkvUY9yOsAboSJFXdyQoOwqLSjT7Vr4/bzyafRXDllBfQdEkxWKbjAubd/z
	hYg3dggJ1xvZUwOQlxNNRtUjakYmGwDPRbDoLXauYpe9d5MnFONeo4ssVmKw==
X-Google-Smtp-Source: AGHT+IHZr1FIBlHiFW/HotDivhRei/MId6yqgNTMhXQougbqnaHFKop7CEgY7FDKsYYUKHnpCdwZ7w==
X-Received: by 2002:a17:907:d707:b0:b07:dd5e:16be with SMTP id a640c23a62f3a-b35486dc502mr219693966b.4.1758797625439;
        Thu, 25 Sep 2025 03:53:45 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b3544fd0a9esm144917966b.84.2025.09.25.03.53.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Sep 2025 03:53:45 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 2/2] cwautomacros: delete the recipe
Date: Thu, 25 Sep 2025 12:53:40 +0200
Message-ID: <20250925105340.3021412-2-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250925105340.3021412-1-alex.kanavin@gmail.com>
References: <20250925105340.3021412-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 25 Sep 2025 10:53:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224013

From: Alexander Kanavin <alex@linutronix.de>

This is a long-obsolete set of custom autotools macros;
'which' was the last consumer in core or meta-oe.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/conf/distro/include/maintainers.inc      |  1 -
 .../cwautomacros/cwautomacros_20110201.bb     | 25 -------------------
 2 files changed, 26 deletions(-)
 delete mode 100644 meta/recipes-extended/cwautomacros/cwautomacros_20110201.bb

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
index 0988bf50a72..c6c1de6b5af 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -139,7 +139,6 @@ RECIPE_MAINTAINER:pn-cryptodev-tests = "Robert Yang <liezhi.yang@windriver.com>"
 RECIPE_MAINTAINER:pn-cups = "Chen Qi <Qi.Chen@windriver.com>"
 RECIPE_MAINTAINER:pn-curl = "Robert Joslyn <robert.joslyn@redrectangle.org>"
 RECIPE_MAINTAINER:pn-cve-update-nvd2-native = "Ross Burton <ross.burton@arm.com>"
-RECIPE_MAINTAINER:pn-cwautomacros = "Ross Burton <ross.burton@arm.com>"
 RECIPE_MAINTAINER:pn-db = "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-dbus = "Chen Qi <Qi.Chen@windriver.com>"
 RECIPE_MAINTAINER:pn-dbus-glib = "Chen Qi <Qi.Chen@windriver.com>"
diff --git a/meta/recipes-extended/cwautomacros/cwautomacros_20110201.bb b/meta/recipes-extended/cwautomacros/cwautomacros_20110201.bb
deleted file mode 100644
index 7efe5cc5922..00000000000
--- a/meta/recipes-extended/cwautomacros/cwautomacros_20110201.bb
+++ /dev/null
@@ -1,25 +0,0 @@
-SUMMARY = "Collection of autoconf m4 macros"
-SECTION = "base"
-HOMEPAGE = "http://sourceforge.net/projects/cwautomacros.berlios/"
-DESCRIPTION = "A collection of autoconf macros, plus an autogen.sh script that can be used with them."
-LICENSE = "GPL-2.0-only"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=eb723b61539feef013de476e68b5c50a"
-
-SOURCEFORGE_PROJECT = "${BPN}.berlios"
-SRC_URI = "${SOURCEFORGE_MIRROR}/${SOURCEFORGE_PROJECT}/${BP}.tar.bz2"
-SRC_URI[sha256sum] = "3115603b891f3a163c0bbb5fea2f3742113a183fa6745ee5e89e5f6d0e9f6121"
-
-inherit sourceforge-releases
-
-do_configure() {
-	:
-}
-
-do_install() {
-	oe_runmake LABEL=`date -d @${SOURCE_DATE_EPOCH} +%Y%m%d` CWAUTOMACROSPREFIX=${D}${prefix} install
-
-	# cleanup buildpaths in autogen.sh
-	sed -i -e 's,${D},,g' ${D}${prefix}/share/cwautomacros/scripts/autogen.sh
-}
-
-BBCLASSEXTEND = "native"
-- 
2.49.0


