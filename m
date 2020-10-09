Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com [209.85.128.67])
 by mx.groups.io with SMTP id smtpd.web12.8238.1602227757189413439
 for <openembedded-core@lists.openembedded.org>;
 Fri, 09 Oct 2020 00:15:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile-fr.20150623.gappssmtp.com header.s=20150623 header.b=mmV35g5F;
 spf=pass (domain: smile.fr, ip: 209.85.128.67, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f67.google.com with SMTP id d81so8747298wmc.1
        for <openembedded-core@lists.openembedded.org>; Fri, 09 Oct 2020 00:15:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile-fr.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=mzfNKkXnc9/ObcdEUES+m/ozYFBqHlpDBh3BpZs2GHQ=;
        b=mmV35g5FRKfLCqlB7/mKk2ut8VP4pCVgvgkYbGHUImaGdm/fSEd5AcFqtrnYBgb7Fa
         X9HGSCrB4ls6EEHMdvUzhn0GGuPN+AVPF6qy8Kuvgl7Ma46NORQRJtiYliZrxoJFkU2V
         S8QBhdXxlWrUFKEcRgXvBn/NqrlO6U6G0QBNKEV+q9Sz4O9rpqnABx1x7lqtEHXoX9xv
         mZ/xJHar7g904+bbxcRT49M8Ly8s/IL6UvmGPm1UWGC+liNfsk5MrNUP4hoIzfc3LsnQ
         Op7KiKB84Z/23vmDB95Pz90j0Ev/VqUiao+306BiwpO9QDsBz83UPNhmBF8HznprR2vq
         OFUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=mzfNKkXnc9/ObcdEUES+m/ozYFBqHlpDBh3BpZs2GHQ=;
        b=LDe1GM+qEwp1Rv8X5cHvMpqlPoaqjsA12n71dZqZHivlE9YNBguWOmx/rwvlXejEUJ
         QjzeDNUWZg/jHGMtRJu9wfqyAOBcr6VlQfacXe+u+LdQlNWyBbd0KlNAi3T4xW+zCEqv
         jDiklXmnFMIjWNEDRBUHCTtJOfTCqprgM8i+cCxWStmdnJB8s8jDgtUursib2275CmH9
         DYfznizUbbEv1M5YEHscqwlIn58ENsY9EG5VUBg7T7mRy0/7cpbucgTrB2xpd3iW5vLv
         penXlZA/+OOta04q5l0XweXu1ZMc4qlk/7FKp0Nl6D4+85IVhCCZ9e7gPEFR+vL0TzEy
         a7+g==
X-Gm-Message-State: AOAM533ltiqUZ/zky9g6sKw4H3nE22Viu9EJ/vdJtxoaxXw0DswEFPzr
	KM4PtKkomjpk3CS2486UK4QnN8M0dV2b2g==
X-Google-Smtp-Source: ABdhPJz6Of8jO/ZzKepRw+/f4999iiRN38/vUcE4btKXIXr8A9+J5FHeeVlr29sJRu60DIsX8uu4pQ==
X-Received: by 2002:a1c:3283:: with SMTP id y125mr12842994wmy.61.1602227755298;
        Fri, 09 Oct 2020 00:15:55 -0700 (PDT)
Return-Path: <yoann.congal@smile.fr>
Received: from P-ASN-KEVALD.idf.intranet (85-170-108-21.rev.numericable.fr. [85.170.108.21])
        by smtp.gmail.com with ESMTPSA id s19sm18507708wmc.0.2020.10.09.00.15.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2020 00:15:54 -0700 (PDT)
From: "Yoann Congal" <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Cc: Yoann Congal <yoann.congal@smile.fr>
Subject: [PATCH] bitbake-bblayers/create: Make the example recipe print its message
Date: Fri,  9 Oct 2020 09:15:45 +0200
Message-Id: <20201009071545.29875-1-yoann.congal@smile.fr>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The example recipe is setup to print a message using bb.plain() in the
"do_build" task but this task is "noexec" so the message never prints.
This might be confusing.

This moves the message printing into another "do_display_banner" task
and add it to the do_build "before" list.

Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/lib/bblayers/templates/example.bb | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/lib/bblayers/templates/example.bb b/meta/lib/bblayers/templates/example.bb
index c4b873d593..facaae35d2 100644
--- a/meta/lib/bblayers/templates/example.bb
+++ b/meta/lib/bblayers/templates/example.bb
@@ -2,10 +2,12 @@ SUMMARY = "bitbake-layers recipe"
 DESCRIPTION = "Recipe created by bitbake-layers"
 LICENSE = "MIT"
 
-python do_build() {
+python do_display_banner() {
     bb.plain("***********************************************");
     bb.plain("*                                             *");
     bb.plain("*  Example recipe created by bitbake-layers   *");
     bb.plain("*                                             *");
     bb.plain("***********************************************");
 }
+
+addtask display_banner before do_build
-- 
2.20.1

