Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54819CAC5AC
	for <webhook@archiver.kernel.org>; Mon, 22 Sep 2025 11:39:39 +0000 (UTC)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.web11.50044.1758541170094134522
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Sep 2025 04:39:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=GPYcL/3Y;
 spf=pass (domain: gmail.com, ip: 209.85.221.41, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-3f42b54d1b9so1576782f8f.0
        for <openembedded-core@lists.openembedded.org>; Mon, 22 Sep 2025 04:39:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758541168; x=1759145968; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wM18QRLWKoeKvPLmZoQTU82R+q1N2oGNR+BhlIXyEk0=;
        b=GPYcL/3YJQQ6Ofr4T4C70ftSPuMrRmPFbsi3GcYFGbFXP7bZ34RGAbiNUBeOXFGuIb
         trl/4H8sAZKGMv2owbBnJ04A7Lxyr3If/xNPmLj3QBNWPIUEkiA/SUIR9HIXw7EJpKJt
         60aoBsnsZDhhRrzNa4ALXsbZ2Y3UBca25hYndltetba5XDdFMu7dh2Ey+nbMX7lFPAEO
         6m4guqMtss7crzvoyCwwZsPGWiYB6Bc6rFa9XTbaDvtfbjMNKxNMQFxX1gsF03bLd2R1
         dSZNySUjjnJ77UPHEXxJgcqMkBZWclw3aRA3GBa/fCRKojDei/9LtpSCMxv7os5vIcnZ
         0V8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758541168; x=1759145968;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wM18QRLWKoeKvPLmZoQTU82R+q1N2oGNR+BhlIXyEk0=;
        b=WkqJUFvRAw+yHvegFtVVBEL8kCEIe6BB5zlE9D8vYQlylvbVhO/43HpT0xxWJP6HVT
         ZD2e6SeCRcyMBYEFACum7WDhD2PInsCK0tQEO2c4bK/Zkn8hAHGa02P1HYHrG3tA22HK
         bDpAFocExTS9cX2uwNTjCNdsNbPhOZZBY8hRzrvmnN0IEA5TKWighej3c7o2OsgVSIZX
         +ctJ9kMSY3CnnjrZYY3B/o7nfQ8SxfN6FtDDy0ipapAhOFq8rRg5zKBTvSEE8oebykEe
         mNXqN0J2i3PDm94H16Yak9FlstkKcqUhhGBgc70O8XoqF7oRv+I9d58OVN+S6bOdo36e
         6nlA==
X-Gm-Message-State: AOJu0YyP0waKg27b6d80jetghGzvtgYg4O1i0WTX6WV7apLtgOf6xiJV
	UX0TGEUmonfKxCl5ECFV5kadgmVEd+XZN7TakRIiQbUw9WiGcBqEXYZHdwRcxw==
X-Gm-Gg: ASbGncvlKKkKZ0hiJVegBuJ2wYI/6KPxES/0lXebpafTrJ8fON6E2yPOC8QdIrW3XqX
	H1dr5FXLmal7r3YBeF1TSl6PXa4LCFZTUy70h2Hz8soawSYigRMIeuBpJr+O5dl51fVFOmZR1Qk
	Lj7qctYnL2ZZt1klZqOxw0shfd9FKg313o+vXwW5gEKdu9aK4QdHnN7CcgU3VDT44xmfa9FdXVo
	75kKX9T2azkRuwzhrdvYcJdkrDFARzcFiNNK0tCJcrpGntLoIe5zO3JlRdwkno6H/YTrRzFyhcu
	+aeNZQWJLEP6QqGm/b/YcRYq6dMlcyXiA45qaIFjDQW7nfQJHmHkmcGQM7ROsgoJ4dKddkTuCMr
	1S3bxPnj/YmPWADcIqea6iefnLAx4TPZPX+MWj5CrWweUhBH2mzU8SHY4Oi8b3HkAKtSvmTCgXz
	HtaXZneP4gWDnZVE2RJrxn9pRAosIfbezscb0GR5ZPeEuBSBcsOlWTPsWzPA==
X-Google-Smtp-Source: AGHT+IEsNcyjMyoIJ6p1OCPxzPouY8QySZIPYqe2JXe2DTSyNVfKmnKO1FhKPRdVN+JxMaaKcUKqQQ==
X-Received: by 2002:a05:6000:410d:b0:3f5:d7c0:8e20 with SMTP id ffacd0b85a97d-3f5d7c0d9f5mr4096410f8f.59.1758541168334;
        Mon, 22 Sep 2025 04:39:28 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-46d1c97a87csm44400205e9.20.2025.09.22.04.39.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Sep 2025 04:39:28 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 2/2] cwautomacros: delete the recipe
Date: Mon, 22 Sep 2025 13:39:20 +0200
Message-Id: <20250922113920.2693840-2-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250922113920.2693840-1-alex.kanavin@gmail.com>
References: <20250922113920.2693840-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 22 Sep 2025 11:39:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223819

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
index e80959749e1..00c5eadc824 100644
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


