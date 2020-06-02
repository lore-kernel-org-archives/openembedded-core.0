Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com [209.85.221.66])
 by mx.groups.io with SMTP id smtpd.web11.10974.1591105409150533656
 for <openembedded-core@lists.openembedded.org>;
 Tue, 02 Jun 2020 06:43:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=ZCGrEsJ/;
 spf=pass (domain: gmail.com, ip: 209.85.221.66, mailfrom: rehsack@gmail.com)
Received: by mail-wr1-f66.google.com with SMTP id x13so3498698wrv.4
        for <openembedded-core@lists.openembedded.org>; Tue, 02 Jun 2020 06:43:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=MJDIGwR0KjsiLh6H57SVsPxMJdxIWFaakQKJd1I1w/U=;
        b=ZCGrEsJ/Z8QIPpJBrTKlSsmbIETXZbrSVL0yXNygiVWVicCM/ijMI72c3eIedCimwR
         +0VrEl4wy3omBjg90XlmL5Qxnvk8d2gIHmgYjKfpE4LUZiA5HsSb2befyzrDbgU5+lNj
         VDpejFmKdggVtiF25lJi9t+0jtf399hh2AdFCnHYvH25okhmB/iljwm61GRuL3nZ9MQi
         LwuozgUEYECckWuCbfABqOgj5+xByx9xldwoJq/1fHu9puR/vtIuw7zfpDtjSAtCYGpc
         9oG6vYiiL4+yYxC109EveK0T2trAMOGXjkKMfzNbIut+45i/y8h/e4MhplmBVGMzwaRs
         W7LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references;
        bh=MJDIGwR0KjsiLh6H57SVsPxMJdxIWFaakQKJd1I1w/U=;
        b=i/lEzKZaSr+e3RMCUT9lRTIfOvO+n4mzMeT2jCSyEOrjBUdtZSDNA/xnwXuu7e2wwS
         cauolNw+kqOS4xM4uHs7z2wghfM4uInPnKNaqm0/4NPCX5tFRhWrngy2quirvL1l/HsQ
         R9fCPYQMnDN4mPZp9vbqh4vxMXwc0GwVlex6ApwQ3m84ms+LgkfsAoL6fJZKd4oLTOS1
         SjbaXk15iTQXcBOmYpKxfV8e4PFru73eG/YWRtsTvyn358IT9tixejaqMUT7hr4tAEJU
         4/cIDwCfwFNJLOH3BTVDeQtNfLcaN/Y5KEP8odiwjwJ64LoanzsgPdL5GM+Gs+En0A1Z
         8sRg==
X-Gm-Message-State: AOAM530sMMaapX0PgMseWG7aq/Ao1OVISYrYCXf246dQLRLZJbnTf1/B
	9ZkIWYfyfQi4FFWkaLrRGxoNo4FoT44=
X-Google-Smtp-Source: ABdhPJylyWg3SOS2lSFHwv2r3Jgmddb2YJ0Ekn8rcivfk3JdLSgc5lKNnbiHq0JBtJl5pOeJoRBpcg==
X-Received: by 2002:adf:e751:: with SMTP id c17mr25164826wrn.134.1591105407384;
        Tue, 02 Jun 2020 06:43:27 -0700 (PDT)
Return-Path: <rehsack@gmail.com>
Received: from beaker.muppets.liwing.de (p4fe931fc.dip0.t-ipconnect.de. [79.233.49.252])
        by smtp.gmail.com with ESMTPSA id q1sm3505385wmc.12.2020.06.02.06.43.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jun 2020 06:43:26 -0700 (PDT)
Sender: Jens Rehsack <rehsack@gmail.com>
From: "Jens Rehsack" <rehsack@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Anuj Mittal <anuj.mittal@intel.com>,
	Otavio Salvador <otavio.salvador@gmail.com>,
	Jens Rehsack <sno@netbsd.org>
Subject: [OE-core][PATCH v4 2/2] init-system-helpers: avoid superfluous update-rc.d
Date: Tue,  2 Jun 2020 15:42:56 +0200
Message-Id: <20200602134256.8156-2-sno@netbsd.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200602134256.8156-1-sno@netbsd.org>
References: <20200602134256.8156-1-sno@netbsd.org>

Debians init-system-helpers bundle an own, perl written update-rc.d which
doesn't fulfill embedded/cross-build requirements as our own in
    meta/recipes-core/update-rc.d
does. To avoid unnecessary conflicts or questions, do not bundle it by
default. Whoever wants it is invited to have an .bbappend.

Signed-off-by: Jens Rehsack <sno@netbsd.org>
---
 .../recipes-core/initscripts/init-system-helpers_1.57.bb | 9 ++-------
 1 file changed, 2 insertions(+), 7 deletions(-)

diff --git a/meta/recipes-core/initscripts/init-system-helpers_1.57.bb b/meta/recipes-core/initscripts/init-system-helpers_1.57.bb
index d41bb94791..46f5bbf442 100644
--- a/meta/recipes-core/initscripts/init-system-helpers_1.57.bb
+++ b/meta/recipes-core/initscripts/init-system-helpers_1.57.bb
@@ -16,8 +16,6 @@ SECTION = "base"
 LICENSE = "BSD-3-Clause & GPLv2"
 LIC_FILES_CHKSUM = "file://debian/copyright;md5=ee2b1830fcfead84d07bc060ec43e072"
 
-DEPENDS = "perl"
-
 SRCREV = "760c625ec0e1ffebec2e391d891d389da0f65726"
 SRC_URI = "git://salsa.debian.org/debian/init-system-helpers.git"
 
@@ -30,17 +28,14 @@ do_install() {
 	install -d -m 0755 ${D}${sbindir}
 	install -m 0755 ${S}/script/invoke-rc.d ${D}${sbindir}
 	install -m 0755 ${S}/script/service ${D}${sbindir}
-	install -m 0755 ${S}/script/update-rc.d ${D}${sbindir}
 }
 
-PACKAGES += "${PN}-invoke-rc.d ${PN}-service ${PN}-update-rc.d"
+PACKAGES += "${PN}-invoke-rc.d ${PN}-service"
 
 FILES_${PN} = ""
 FILES_${PN}-invoke-rc.d = "${sbindir}/invoke-rc.d"
 FILES_${PN}-service = "${sbindir}/service"
-FILES_${PN}-update-rc.d = "${sbindir}/update-rc.d"
 
 ALLOW_EMPTY_${PN} = "1"
 
-RDEPENDS_${PN}-update-rc.d = "perl"
-RRECOMMENDS_${PN} += "${PN}-invoke-rc.d ${PN}-service ${PN}-update-rc.d"
+RRECOMMENDS_${PN} += "${PN}-invoke-rc.d ${PN}-service"
-- 
2.17.1

