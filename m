Return-Path: <vanusuri@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CCD42C35FFA
	for <webhook@archiver.kernel.org>; Wed, 19 Mar 2025 11:25:40 +0000 (UTC)
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
 by mx.groups.io with SMTP id smtpd.web10.5324.1742383537725358786
 for <openembedded-core@lists.openembedded.org>;
 Wed, 19 Mar 2025 04:25:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=YErez/RA;
 spf=pass (domain: mvista.com, ip: 209.85.214.170, mailfrom: vanusuri@mvista.com)
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-22622ddcc35so18302135ad.2
        for <openembedded-core@lists.openembedded.org>; Wed, 19 Mar 2025 04:25:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1742383536; x=1742988336; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=YJPBerj64ErY+gtJAQB8fEefQSXcfA9DACYoVrxd2b4=;
        b=YErez/RAebDFbkYleUDD5vncZuhURI4vLshRL37RPTA+rww1zgQ1QaIQ2by/akpc+M
         raHmCkkNSXOsMh1xZ/NEaNBwn4qf/LAqfDW5Jh0rnKz6hXRCjnpkje4fVREhxIhcRCSG
         rbGRyWmYF/wQUBKUnx4T5c+jOXnVQfvC+q1FI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742383536; x=1742988336;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YJPBerj64ErY+gtJAQB8fEefQSXcfA9DACYoVrxd2b4=;
        b=RrVCjJYPWQaLihyjbGkQmwx8EITyGWh/rjIGvHqRThv8gtHeDGYqOO3pNLYhi0qgSm
         lvooKHxaGVBkZa2GiEYNB3dR5Gk9IdTFoOi/YOQK0NixOwClGPjQrurHa562BPtUB29X
         sFzhnWZ7q3PaxDDiX2V7ZCUAps7x8i+Mo535v2pBw6GwUfeLF0GyN+/GQvfP8RuHmCyv
         22I/d6ograrq/OCiQzcpFr9hlg0S0SmfCDtQ5TAXURQMuNXPyoU/QT/PVXX0mXTlpbZz
         owNi98hq7giRlDortB6Ebh05S2JR951SYTzINNRmAuZqzc9crciskeWNNZ2v4ngBZuSE
         Xl0g==
X-Gm-Message-State: AOJu0Ywbq4+E5upJ9QmPmCN7Ymbaqr0W0LBvbaJvjYIIf230bM4HRn8f
	KwGAiKGwZ1mQ6eXO8gmxZh/b08Wbiy5IYYWc70poHbSOoof67xo8dCh/Jd5Fij5TgVw08kpGFuw
	i0aI=
X-Gm-Gg: ASbGncugRYIF5Sll4NB/reTaS7L3BV5Cdk7Gbgv/YfIQVHp6d1regdfKbfbkMiH75wm
	rxgGFH1XW9iCHc2A92jwIrNKNRfpbjmGlAhZ43GPrO+nHFHDfLyJBsLqDmBx2Ox89eeEOpMbqj0
	0PfeS7nCi6AjReh9zt7feamzLjWhQsK3RVWKP6pR195npZWSId+JyJqLdokIja/LyXFCOXFte6m
	YOhiEu3rpG3wfJCTQ8GSKfHqGSfpqoOxYPxk3mbVnTluHcY0BshGs2KOIaBnROONxXeATuwicre
	Vb7Qsi6t96Efb4uFki6E8P93FhtfWVpFug1O/SrvufwcHG2zej8dJnk=
X-Google-Smtp-Source: AGHT+IFGEVboogAYOV7JUWDBLs39bkKtEfHUfQeHzwcr9Zfl5stH5pskiM7+KdE2JpUf5379xiUD9A==
X-Received: by 2002:a17:903:1a28:b0:220:e896:54e1 with SMTP id d9443c01a7336-22649a335efmr39027545ad.26.1742383536194;
        Wed, 19 Mar 2025 04:25:36 -0700 (PDT)
Received: from MVIN00020.mvista.com ([49.207.235.55])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-225c6bbca06sm110878135ad.161.2025.03.19.04.25.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Mar 2025 04:25:35 -0700 (PDT)
From: vanusuri@mvista.com
To: openembedded-core@lists.openembedded.org
Cc: Vijay Anusuri <vanusuri@mvista.com>
Subject: [OE-core][scarthgap][PATCH] libxslt: upgrade 1.1.39 -> 1.1.43
Date: Wed, 19 Mar 2025 16:55:25 +0530
Message-Id: <20250319112525.2410149-1-vanusuri@mvista.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 19 Mar 2025 11:25:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213324

From: Vijay Anusuri <vanusuri@mvista.com>

Include fixes for CVE-2024-24855 and CVE-2024-55549

Release Notes:
https://gitlab.gnome.org/GNOME/libxslt/-/releases/v1.1.43

Remove mem-debug option [1]

[1] https://gitlab.gnome.org/GNOME/libxslt/-/commit/c65a7c05f98ea4e9fae1247510b45db9dd3ec907

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
---
 .../libxslt/{libxslt_1.1.39.bb => libxslt_1.1.43.bb}          | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-support/libxslt/{libxslt_1.1.39.bb => libxslt_1.1.43.bb} (91%)

diff --git a/meta/recipes-support/libxslt/libxslt_1.1.39.bb b/meta/recipes-support/libxslt/libxslt_1.1.43.bb
similarity index 91%
rename from meta/recipes-support/libxslt/libxslt_1.1.39.bb
rename to meta/recipes-support/libxslt/libxslt_1.1.43.bb
index 2cc0c84bec..d251fa8122 100644
--- a/meta/recipes-support/libxslt/libxslt_1.1.39.bb
+++ b/meta/recipes-support/libxslt/libxslt_1.1.43.bb
@@ -15,7 +15,7 @@ DEPENDS = "libxml2"
 
 SRC_URI = "https://download.gnome.org/sources/libxslt/1.1/libxslt-${PV}.tar.xz"
 
-SRC_URI[sha256sum] = "2a20ad621148339b0759c4d4e96719362dee64c9a096dbba625ba053846349f0"
+SRC_URI[sha256sum] = "5a3d6b383ca5afc235b171118e90f5ff6aa27e9fea3303065231a6d403f0183a"
 
 UPSTREAM_CHECK_REGEX = "libxslt-(?P<pver>\d+(\.\d+)+)\.tar"
 
@@ -37,7 +37,7 @@ do_configure:prepend () {
 	touch ${S}/doc/xsltproc.1
 }
 
-EXTRA_OECONF = "--without-python --without-debug --without-mem-debug --without-crypto"
+EXTRA_OECONF = "--without-python --without-debug --without-crypto"
 # older versions of this recipe had ${PN}-utils
 RPROVIDES:${PN}-bin += "${PN}-utils"
 RCONFLICTS:${PN}-bin += "${PN}-utils"
-- 
2.25.1


