Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.web10.43293.1600697793862772102
 for <openembedded-core@lists.openembedded.org>;
 Mon, 21 Sep 2020 07:16:34 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@blade-group.com header.s=google header.b=VipyDZc1;
 spf=pass (domain: blade-group.com, ip: 209.85.128.50, mailfrom: yann.dirson@blade-group.com)
Received: by mail-wm1-f50.google.com with SMTP id l9so12902505wme.3
        for <openembedded-core@lists.openembedded.org>; Mon, 21 Sep 2020 07:16:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=blade-group.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=kRVW/LUInonD+bWISadisV86CjJnr4AKqxwj51SAu+w=;
        b=VipyDZc1hPRBYzL3HHf2f/3bYxcGeemvvGeuhIP0CHH9IZA5zlWCOOgC/jwlexVofJ
         becPyt+iWcHriHk5H3ulDqaR9U05XHuwvdBBS9bPTsE2a3llk9qjazxCtsOX5B7NQ49t
         Yqr+eRZKrgydls0bOTOVKgbYaaoa4f5gbe+BxQTQq9xH5CgAKmjfcIElenOamHOgAlv2
         gJ9xmmvPNEN5gmx/0nW9mOAS5Lfu8jOP7Tn8ya0mEfEcdBFzRkcCCs2m2bQoSNsjk0oB
         QeyjfMgf5PTC01olZ2T5grQD6ALScsErDoGzwyK9NqkedJ+5tCl1zgQevpBiCFblbjAr
         T9Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=kRVW/LUInonD+bWISadisV86CjJnr4AKqxwj51SAu+w=;
        b=eFCtsZiWl9J0/PAmzrgjS+YaJ6W7IfcGI7IKkdBTuSi3V9eqUJBN11/jCkZORwnt0C
         QhEJM6KhO+K5YQ5HSdEY1hgPFrD98caw1JFQEUJwemHxG4uzWvXrhkl7WRm2yAGJRTsM
         y6eo2cM0OKDGnaG5sh+sinTBJHSwYGGisfCxx8ntnhj59sG9Q0T6Tlu2che89Qq9lWBC
         Cq66iOc5DFSXzqebk5gfxxqbPiJ89lZq8PC1sjNRy5kdCr8LfdnwOxO8+WkdjFcPCasE
         N5PqoJIgTQl+qjngrUs8ndCLt+QMTHy3Us46c+EOwcPCNBmy4o+avRwois1XBGlgV0H+
         QpBg==
X-Gm-Message-State: AOAM5307OlkQKlYXSh0cyCMU0BGcCYS7NAQY9zaIS50RtxDOObBhCd3w
	s9qG3dYHtQgjWqTWfEwW+0Lpqt+VUFvICz+y
X-Google-Smtp-Source: ABdhPJznsgRepIyBCbDuMPCu4wv+Q5kjlc0nyaz/XMiBHJXmJtwrPArEeSTouS1VvTyhahkbI+ohSQ==
X-Received: by 2002:a05:600c:2182:: with SMTP id e2mr106955wme.102.1600697792030;
        Mon, 21 Sep 2020 07:16:32 -0700 (PDT)
Return-Path: <yann.dirson@blade-group.com>
Received: from blanquette.lan ([88.120.44.86])
        by smtp.gmail.com with ESMTPSA id f14sm22524804wrt.53.2020.09.21.07.16.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2020 07:16:31 -0700 (PDT)
From: "Yann Dirson" <yann.dirson@blade-group.com>
X-Google-Original-From: yann@blade-group.com
To: openembedded-core@lists.openembedded.org
Cc: Yann Dirson <yann@blade-group.com>
Subject: [PATCH 5/8] systemtap: split runtime material in its own package
Date: Mon, 21 Sep 2020 16:15:41 +0200
Message-Id: <20200921141544.3145189-6-yann@blade-group.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200921141544.3145189-1-yann@blade-group.com>
References: <20200921141544.3145189-1-yann@blade-group.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Yann Dirson <yann@blade-group.com>

Note the _class-target qualifier, here to prevent a funky dependency of
systemtap-native on systemtap-native-runtime-native.  This possibly hints
to something deeper ?
---
 meta/recipes-kernel/systemtap/systemtap_git.bb | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/meta/recipes-kernel/systemtap/systemtap_git.bb b/meta/recipes-kernel/systemtap/systemtap_git.bb
index 74bf7cb35c..8dad5b15f0 100644
--- a/meta/recipes-kernel/systemtap/systemtap_git.bb
+++ b/meta/recipes-kernel/systemtap/systemtap_git.bb
@@ -36,6 +36,15 @@ FILES_${PN}-exporter = "${sysconfdir}/stap-exporter/* \
 RDEPENDS_${PN}-exporter = "${PN} python3-core python3-netclient"
 SYSTEMD_SERVICE_${PN}-exporter = "stap-exporter.service"
 
+PACKAGES =+ "${PN}-runtime"
+FILES_${PN}-runtime = "\
+ ${bindir}/staprun \
+ ${bindir}/stap-merge \
+ ${bindir}/stapsh \
+ ${libexecdir}/${BPN}/stapio \
+"
+RDEPENDS_${PN}_class-target += "${PN}-runtime"
+
 PACKAGES =+ "${PN}-examples"
 FILES_${PN}-examples = "${datadir}/${BPN}/examples/"
 RDEPENDS_${PN}-examples += "${PN}"
-- 
2.28.0

