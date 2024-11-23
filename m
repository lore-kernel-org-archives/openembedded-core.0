Return-Path: <hiagofranco@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 085BBE6919E
	for <webhook@archiver.kernel.org>; Sat, 23 Nov 2024 19:38:25 +0000 (UTC)
Received: from mail-vk1-f173.google.com (mail-vk1-f173.google.com [209.85.221.173])
 by mx.groups.io with SMTP id smtpd.web10.53815.1732390704129399892
 for <openembedded-core@lists.openembedded.org>;
 Sat, 23 Nov 2024 11:38:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=OEeMhLKa;
 spf=pass (domain: gmail.com, ip: 209.85.221.173, mailfrom: hiagofranco@gmail.com)
Received: by mail-vk1-f173.google.com with SMTP id 71dfb90a1353d-514589ac56dso1212974e0c.0
        for <openembedded-core@lists.openembedded.org>; Sat, 23 Nov 2024 11:38:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732390702; x=1732995502; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cBkxH9ZspGHlXp0IABuuEkG0zagXQx+E//E/zmPVZsY=;
        b=OEeMhLKaHOdovGxePPSlstfDyLe2f9GSO8iJ8op0e5fhxRQtH/MuHgfY7OUP7UZVHG
         ims6wW+almwuMHgJqAgaWfh9SpD47qzkvSs44+s9fJ9KjJ7MiSVeu2Dw3FMQr4D6Vtpy
         moPELiG7ygeyhQeyDGRib5jFbq2zDwktAVeHTDYSaRLar7ZZ9UA+c/05Qa/a4OpgNXd/
         rSUhNy8c9jfexCSSUu6DMKiN6NYUbYdhRbGOSAoHwX/ZumlV359g44s6Uyv5U8OEPfox
         lkxCdhn31ZEK28WCWc/iBoOxzfrLaCWjwEJRfurKex6P38Y+Lea4S9cQZsU8zkdvovoT
         TQbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732390702; x=1732995502;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cBkxH9ZspGHlXp0IABuuEkG0zagXQx+E//E/zmPVZsY=;
        b=LtjxlrvvHqCBCFvY1aU0faBDdhPcFt/I97WkLA1KxqVVTzZXy4wf2YbfmTmKJmGLI5
         v2SoEhL4IMrUFBARWa8x65zrGFVX+uaQ10A3SORQbF2qp6MrV1FRjyg9zxZNS4omzrhR
         zfgwqu9jm2yfINqlSv7Bzptw6A52qHwY7OSdcCivAenUsYGO0kVKhWNsO8t4ZzCz6HB/
         2loc1rdr3L39FD6WuTvCSVKzFD0w7lga5MTjvA2HMQq9kBZHBET/wmf5j9odosQ3pF4G
         ecpjqjiDfN6E2FAJaFDeOeb927ytKFVQ++SBN4X7ol/NBDTZCdgNGCdCSJURXkQTKGTA
         w4zg==
X-Gm-Message-State: AOJu0Yz08uqwlZliDOy3DHRk9kaAb3JO19Rp5Rm4rtaqyc84PNDAWu5J
	HcuQbvP+wY1+/nr7xl7u2X7HYK9eABeVLvbr0LpQmMZ9ZVCwUs0NsLi8IA==
X-Gm-Gg: ASbGnctRiaWFk/h75E7oAiMfEhsoYv/rvgwlAij6Orp2qh4Qs9Xzml6+kzL9Ahjpmvc
	YhmuVCxhYt2XwzRScnpktU3Cky1grpTM6qLYvFnS3LMRZbd7Lj1+H57tht5NBLSGVe7J86RAR8K
	jdVYZvrqREzn79XaU0y4ZkXP6KKWnXveiwlFrASSsMXbdVNyqxR+0V52Ar9knaTq4o+N1Y78J//
	sWJ2xHTXuIwb84syFi9SV7vWZbwkeN6KiDMfBmGFambsnRoWuw=
X-Google-Smtp-Source: AGHT+IE3GfiMtMDZfY4rSjbR3sv7EBTQrYh94wPXn9wxq7nNZuhHTJE27xcRP3OJmoJvWcCjaeim2g==
X-Received: by 2002:a05:6122:1815:b0:50d:160e:de73 with SMTP id 71dfb90a1353d-515004caf21mr8246076e0c.6.1732390702604;
        Sat, 23 Nov 2024 11:38:22 -0800 (PST)
Received: from hiagof-nb.. ([146.70.98.177])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-514faf3a95fsm508162e0c.15.2024.11.23.11.38.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 23 Nov 2024 11:38:21 -0800 (PST)
From: Hiago De Franco <hiagofranco@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Denys Dmytriyenko <denis@denix.org>,
	Hiago De Franco <hiago.franco@toradex.com>
Subject: [PATCH v2 1/3] hwdata: add recipe from meta-openembedded
Date: Sat, 23 Nov 2024 16:35:27 -0300
Message-Id: <20241123193527.1435268-2-hiagofranco@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241123193527.1435268-1-hiagofranco@gmail.com>
References: <20241123193527.1435268-1-hiagofranco@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 23 Nov 2024 19:38:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207691

From: Hiago De Franco <hiago.franco@toradex.com>

Add hwdata recipe from meta-openembedded to openembedded-core.

libdisplay-info is now a requirement for Weston, since commit
a16598b038b2 ("backend-drm: make libdisplay-info mandatory"). However,
in order to build libdisplay-info, hwdata is required. Since Weston is
built inside openembedded-core, add hwdata in order to be able to
upgrade Weston, so oe-core has no dependency on meta-oe.

Signed-off-by: Hiago De Franco <hiago.franco@toradex.com>
---
 meta/conf/distro/include/maintainers.inc    |  1 +
 meta/recipes-support/hwdata/hwdata_0.389.bb | 30 +++++++++++++++++++++
 2 files changed, 31 insertions(+)
 create mode 100644 meta/recipes-support/hwdata/hwdata_0.389.bb

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
index d61b88f7de6c..04208ebbf22b 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -262,6 +262,7 @@ RECIPE_MAINTAINER:pn-harfbuzz = "Anuj Mittal <anuj.mittal@intel.com>"
 RECIPE_MAINTAINER:pn-hdparm = "Denys Dmytriyenko <denis@denix.org>"
 RECIPE_MAINTAINER:pn-help2man = "Hongxu Jia <hongxu.jia@windriver.com>"
 RECIPE_MAINTAINER:pn-hicolor-icon-theme = "Anuj Mittal <anuj.mittal@intel.com>"
+RECIPE_MAINTAINER:pn-hwdata = "Hiago De Franco <hiago.franco@toradex.com>"
 RECIPE_MAINTAINER:pn-hwlatdetect = "Alexander Kanavin <alex.kanavin@gmail.com>"
 RECIPE_MAINTAINER:pn-i2c-tools = "Anuj Mittal <anuj.mittal@intel.com>"
 RECIPE_MAINTAINER:pn-icecc-create-env = "Joshua Watt <JPEWhacker@gmail.com>"
diff --git a/meta/recipes-support/hwdata/hwdata_0.389.bb b/meta/recipes-support/hwdata/hwdata_0.389.bb
new file mode 100644
index 000000000000..8ab455cd2e99
--- /dev/null
+++ b/meta/recipes-support/hwdata/hwdata_0.389.bb
@@ -0,0 +1,30 @@
+SUMMARY = "Hardware identification and configuration data"
+DESCRIPTION = "hwdata contains various hardware identification and \
+configuration data, such as the pci.ids and usb.ids databases."
+HOMEPAGE = "https://github.com/vcrhonek/hwdata"
+SECTION = "System/Base"
+
+LICENSE = "GPL-2.0-or-later | XFree86-1.0"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=1556547711e8246992b999edd9445a57"
+
+SRC_URI = "git://github.com/vcrhonek/${BPN}.git;branch=master;protocol=https"
+SRCREV = "5313a12eb992a354c17fc895c1d69c8c42b09a06"
+
+S = "${WORKDIR}/git"
+
+inherit allarch
+
+do_configure() {
+    ${S}/configure --datadir=${datadir} --libdir=${libdir}
+}
+
+do_compile[noexec] = "1"
+
+do_install() {
+    oe_runmake install DESTDIR=${D}
+}
+
+FILES:${PN} = "${libdir}/* \
+               ${datadir}/* "
+
+BBCLASSEXTEND += "native"
-- 
2.39.5


