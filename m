Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75781CAC58D
	for <webhook@archiver.kernel.org>; Thu, 11 Sep 2025 08:51:48 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.web10.41409.1757580703156331172
 for <openembedded-core@lists.openembedded.org>;
 Thu, 11 Sep 2025 01:51:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=RZyQWEVh;
 spf=pass (domain: gmail.com, ip: 209.85.128.41, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-45cb6180b60so3124585e9.0
        for <openembedded-core@lists.openembedded.org>; Thu, 11 Sep 2025 01:51:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757580701; x=1758185501; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Qt8d9JzSZWzKB6zR6glJt+WsGA83T7DRl7jL1Ajfjd4=;
        b=RZyQWEVhb6Pwto3IaiJKaMiZHaIdVnDlrJCChMjnrX+mhuPLmduqpqZAf9MB3arg1N
         yXqOmW1trF0GAY3cuLdV7MP5czTv3yRuvdNhxeuQE+gk2JDzZLzAe1aLZWwSvpmbCLyK
         Wn4SYUYI+JJZyhMQmpvuSnjT0dJ7QRolSukVSwAFbiqEu9PJk5BJa0RgkpD7R2vuOY2b
         GS/tdfvzEQ1FPsxhs1DbsZ1L/ih/M0ZIafpUZC7la0KFhd89Pa6rns/QLFu5Fb18B9zZ
         KqdNvVdLJIeT0F6OOZuaBaOCQxjOmBFppBcWcIVEv/yA+x0mzgcoTvnCKO7xfZTj3Fq9
         DeIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757580701; x=1758185501;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Qt8d9JzSZWzKB6zR6glJt+WsGA83T7DRl7jL1Ajfjd4=;
        b=ttN2T0CuVlfIVoo9SRQLNvQHzG/qlE5KSer0C3VtG2uZCEFCReS/vYV+yEHuHQrRvz
         X5hj2+M7ei0flZd/0GiSVEswtxgNItSemi/ISrmgGKEnvrbGvDZRvkxHQKvkoWuhXmOp
         iEclTSi+bVMfXayPg7/mXfJ1uupb7eSD0H7FoialeN6y1F10IYVTvaT1V6zwuEeGUN/1
         0jxhfUOJpzQ0dckuk7gZ2EveneZevfzR7fBf8QxdfWiFd6J7/oSYBrOscOzKKqvPceZj
         ya61C0u2vv0FjE4uPLLHRlpF6jOWGp+rpJtG2fxQl3euTi4w6+LvKc9DbjmHioBXg0XN
         4sQQ==
X-Gm-Message-State: AOJu0YyCtDy2xOLP7NgBmLyWUQh6ExOScg31UMoMrJPjmWnSXPRi5s+7
	hD8uty6+O7BWsyzTW2VAfp55vxhwHLHqtQo7H8np4nxcQaGw6AP9FKj6QJFekA==
X-Gm-Gg: ASbGncuyzlqvEo08OtZcC4lvPOPw0aXsdpVsUx2tCRk4ZNyslkMw6neppBX5yEVSsqj
	HZvD/Js/DbfjzF5UIrhxlOW+DT9AolnBbZ8+xVDtpEqjo35G/ioWq/jrI4daIR1qf0GrlYxqRcI
	yaBNs9RRHKl+Nx2/NZm+P0MaDx+2CRfx/NUuXgrd943TeXgZUJ+xopBDH0aBf1SBpI/qeRGjFd+
	hMYXDfSnvVfrpEprVXmVoPbNUMtr8W61VeSw4TpWnPa8QM1Jz/GHEO8fdCOvzNCEWMKeIpB5Lrk
	uQmm96O7rXqpyYLbhupUS8RnwVF+zU486PPQTqmZMymUqohYJr4kzJ199dR6fW8FVke6oUS3iEA
	oV3jzfB1ksxcoxXbscPOoT7C/MTgLQhyUm0pM1ELBVFavCI0MbZs5cHpA9KApR1YeKepKI0SdHr
	ffDg06R/zI61k3KwDr0qY6q4Id9YNiLqfNKxJeJffcXxAisEwr9zpxZR5qBg==
X-Google-Smtp-Source: AGHT+IFkAxNBGluTRcJuFHgdlZK4dIws4XlybwxnyUbrBgcSchEH2UqztL4tOkJUVKVt2daqFkeJ4A==
X-Received: by 2002:a05:600c:34cb:b0:45d:e0cf:41c9 with SMTP id 5b1f17b1804b1-45de0cf447fmr154058885e9.22.1757580701408;
        Thu, 11 Sep 2025 01:51:41 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45e017b2f4esm19382005e9.17.2025.09.11.01.51.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Sep 2025 01:51:41 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 11/16] cwautomacros: delete the recipe
Date: Thu, 11 Sep 2025 10:51:18 +0200
Message-Id: <20250911085123.1551425-11-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250911085123.1551425-1-alex.kanavin@gmail.com>
References: <20250911085123.1551425-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 11 Sep 2025 08:51:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223258

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
index 239f1f80836..b3b1a0b4f5b 100644
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
2.39.5


