Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5DC0C61D96
	for <webhook@archiver.kernel.org>; Wed, 22 Nov 2023 06:31:35 +0000 (UTC)
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
 by mx.groups.io with SMTP id smtpd.web10.13774.1700634685659162110
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Nov 2023 22:31:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=UeyD1H7w;
 spf=pass (domain: gmail.com, ip: 209.85.210.172, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-6c398717726so5422586b3a.2
        for <openembedded-core@lists.openembedded.org>; Tue, 21 Nov 2023 22:31:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700634684; x=1701239484; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Un6wX4qLUR7rNzX6t+HCYSLe6XTla/6cmBIgnSrnX3o=;
        b=UeyD1H7wKRCXK/AhuPnnHCHhc+Uvt4V4XR1b4Fh/5M7v9LcnSBEtg1sl/yZ70LVIMc
         bnUVjw/tv8GiNwhT8y7s76JYRnDfH2iR3hITG8EvZQekIo/gbmhKUdOTDyVqbF7a0+8M
         EfqCae3Xyt0rplvrhia5Dz7m7vERP4NambUa0/oOmCj9kn51E9KOhFtZFsUesj2c0ENa
         jmVYjo7yfkpNmxxvakPfhB+ZOcsYqQensrHftzF5uJgK1TSJf/U/dS9sATM7XXAmHtuJ
         gA3e++1SdPE3QyyGcVpnyntBydbX6+mekhVPu4aCCd1UShL9G2x/sddU9bIXMom+Kais
         tRvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700634684; x=1701239484;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Un6wX4qLUR7rNzX6t+HCYSLe6XTla/6cmBIgnSrnX3o=;
        b=P31ZE7lQcmr11s7nBpfUsuYTlUZhUkqoIGqh6cxXOMmPkWb3v8Ct0r66PuKuHjUB2Q
         rXDFCBb5ihnSyvbeCRsNCPeVIVTYywI83NKZnpN88r/eUakOtmze9PEkKx/Dmaue6y8B
         Lq7oP7pMZRKkl55vIolTa+r4N5yVdekzQfpnlSAgfF931vZ5qsayES2bdZ2Af9f3+hLS
         R/HDohE9CfhGxHIMVGYtw9bZC9etzspu2TnqwhRQIqd50Vmrct/jdT7Z5mAQJk9wsrgk
         eUCuruItGNseDdPbUBL/iouSc772PeGbfEkEwkFRUtl5KqVMzh90LHaNgn1s5hwSwvgF
         bKrQ==
X-Gm-Message-State: AOJu0YxJZmgaUXmHetweclueOscw3wh8lWFe2mkQWd3MqHSrt9XsMRo5
	RuMalDIrhdNxMxtpNRXEV73uXWf++2i8ew==
X-Google-Smtp-Source: AGHT+IHfflZdjvpRFQccf7b0wL7s4c3EDngdsCUDH6tpWWvCvDFjz1ZuRu7BqVsxvN13iHI6CFOAaA==
X-Received: by 2002:a05:6a20:1610:b0:18b:38bb:c546 with SMTP id l16-20020a056a20161000b0018b38bbc546mr1292381pzj.50.1700634684368;
        Tue, 21 Nov 2023 22:31:24 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9100:2cb0::2c3f])
        by smtp.gmail.com with ESMTPSA id m12-20020a056a00080c00b006cb6fa32590sm6224874pfk.148.2023.11.21.22.31.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Nov 2023 22:31:23 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: [PATCH v9 2/3] vte: Upgrade to 0.74.1
Date: Tue, 21 Nov 2023 22:31:17 -0800
Message-ID: <20231122063119.3620722-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231122063119.3620722-1-raj.khem@gmail.com>
References: <20231122063119.3620722-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 Nov 2023 06:31:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191019

* Inherit systemd class
* Add packageconfig for fribidi support

(From OE-Core rev: 6c952b332cc07aa0babec8bc2839b3701f308d54)

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
---
v9: Rebased

 meta/recipes-support/vte/{vte_0.74.0.bb => vte_0.74.1.bb} | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)
 rename meta/recipes-support/vte/{vte_0.74.0.bb => vte_0.74.1.bb} (89%)

diff --git a/meta/recipes-support/vte/vte_0.74.0.bb b/meta/recipes-support/vte/vte_0.74.1.bb
similarity index 89%
rename from meta/recipes-support/vte/vte_0.74.0.bb
rename to meta/recipes-support/vte/vte_0.74.1.bb
index 21203adcf79..8a7054a13cd 100644
--- a/meta/recipes-support/vte/vte_0.74.0.bb
+++ b/meta/recipes-support/vte/vte_0.74.1.bb
@@ -16,10 +16,10 @@ DEPENDS = "glib-2.0 glib-2.0-native gtk+3 libpcre2 libxml2-native gperf-native i
 GIR_MESON_OPTION = 'gir'
 GIDOCGEN_MESON_OPTION = "docs"
 
-inherit gnomebase gi-docgen features_check upstream-version-is-even gobject-introspection vala
+inherit gnomebase gi-docgen features_check upstream-version-is-even gobject-introspection systemd vala
 
 SRC_URI += "file://0001-Add-W_EXITCODE-macro-for-non-glibc-systems.patch"
-SRC_URI[archive.sha256sum] = "9ae08f777952ba793221152d360550451580f42d3b570e3341ebb6841984c76b"
+SRC_URI[archive.sha256sum] = "2328c3f1c998350a18e0e513348e9fc581d57ea4e7b89aedf11e0e3c65042b4f"
 
 ANY_OF_DISTRO_FEATURES = "${GTK3DISTROFEATURES}"
 
@@ -31,6 +31,7 @@ PACKAGECONFIG ??= " \
 	${@bb.utils.filter('DISTRO_FEATURES', 'systemd', d)} \
 	${@bb.utils.contains('DISTRO_FEATURES', 'opengl', 'gtk4', '', d)} \
 "
+PACKAGECONFIG[fribidi] = "-Dfribidi=true,-Dfribidi=false,fribidi"
 PACKAGECONFIG[gtk4] = "-Dgtk4=true,-Dgtk4=false,gtk4"
 PACKAGECONFIG[gnutls] = "-Dgnutls=true,-Dgnutls=false,gnutls"
 PACKAGECONFIG[systemd] = "-D_systemd=true,-D_systemd=false,systemd"
-- 
2.43.0


