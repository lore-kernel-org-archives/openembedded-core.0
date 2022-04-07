Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9A67C47088
	for <webhook@archiver.kernel.org>; Thu,  7 Apr 2022 20:36:08 +0000 (UTC)
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com
 [209.85.218.41])
 by mx.groups.io with SMTP id smtpd.web12.1089.1649350856901430669
 for <openembedded-core@lists.openembedded.org>;
 Thu, 07 Apr 2022 10:00:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Q/548NK1;
 spf=pass (domain: gmail.com, ip: 209.85.218.41,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f41.google.com with SMTP id dr20so12091519ejc.6
        for <openembedded-core@lists.openembedded.org>;
 Thu, 07 Apr 2022 10:00:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=SWnGLYiWzH37ZgPafXZ9IrvWkJIaZbo09q7UQV3sBP4=;
        b=Q/548NK1fg/c1YUgqLQxSyM6+VnMu3XHeF+I3qFO6jQOgSGR4pTOFfZlfEFR104JHM
         l9OcU3kKXAml1oTD7ByYnFuqGvoURh8dY4cRN0MtgdD52mHOfiM0tNFFiQNxGxtE09l6
         j6jNxM0ykuFRKv37FcxqHcYbofplOw7cBjs+fAa1KWQ6oDqZeuwgKOo8TsoxsqKmSXRe
         oijf/To+xskAJXUsR1KdTEhUTsYLfOLRW3+KaEK3Pc7RP/+nzfDPF01k7iWIap1Chu+k
         GbzphWbu60IwChBP7Sj+ysrxz7BjvlUE5hn/gz3iLoUSG0ZVZ76BvTEYlffnsMBf2RB4
         LvQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=SWnGLYiWzH37ZgPafXZ9IrvWkJIaZbo09q7UQV3sBP4=;
        b=yFTujq6pPxKbCiOJJXv7Aru4PeAUPlwcJch0GbGyN39b+A4L5x+bR2+7Ke8lVtlts3
         zzxlGcy554uhJK7bipnBOo4JZvFfAgG1V5TQ2m/nK6qnlXuOaPVsCLSOh+/68ozWXHN8
         bEw81+N49k/uuvvTGWP55+0yniaP2OyEjLACO6UllISRomtCi7dakZy7x6EzjMuyG46n
         o3HcSaC210d4T1HVrKqCBE1bjGn92CdwPDfRRoIEsShmdHyNvBhmOrT9zwz8G0ynQ+Rz
         leCZgVhvJTHtPL9ka30AN42ZkxxBBu8E2szVeW/BqI8c+E6WGiWULhOk+UPyVgIN3Ueg
         c/rg==
X-Gm-Message-State: AOAM532afBP32F33+dIU/w9ZI81LecvWoSzjuwULxmeMVht0dsn83fRl
	q2m6ajqdIyAquTqN4uaBGtmOy7toaoQ=
X-Google-Smtp-Source: 
 ABdhPJzbyfeyiDFan31cfvTclCWjTvM1vSrFnTpsEl8XyQ5fs755d4rAdHXyI1c+rgu1rhnhy/cFlg==
X-Received: by 2002:a17:907:72cc:b0:6e0:2d3:bcba with SMTP id
 du12-20020a17090772cc00b006e002d3bcbamr14317570ejc.642.1649350855410;
        Thu, 07 Apr 2022 10:00:55 -0700 (PDT)
Received: from Zen2.lab.linutronix.de.
 (ip-109-090-143-203.um36.pools.vodafone-ip.de. [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 gt34-20020a1709072da200b006df6bb3db69sm7796879ejc.158.2022.04.07.10.00.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Apr 2022 10:00:54 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 14/17] gdk-pixbuf: upgrade 2.42.6 -> 2.42.8
Date: Thu,  7 Apr 2022 19:00:26 +0200
Message-Id: <20220407170029.3500874-14-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220407170029.3500874-1-alex@linutronix.de>
References: <20220407170029.3500874-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 07 Apr 2022 20:36:08 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164130

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../{gdk-pixbuf_2.42.6.bb => gdk-pixbuf_2.42.8.bb}        | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)
 rename meta/recipes-gnome/gdk-pixbuf/{gdk-pixbuf_2.42.6.bb => gdk-pixbuf_2.42.8.bb} (94%)

diff --git a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.6.bb b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.8.bb
similarity index 94%
rename from meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.6.bb
rename to meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.8.bb
index 55c16e4d66..fb6829a7d1 100644
--- a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.6.bb
+++ b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.8.bb
@@ -23,7 +23,7 @@ SRC_URI = "${GNOME_MIRROR}/${BPN}/${MAJ_VER}/${BPN}-${PV}.tar.xz \
            file://0001-Add-use_prebuilt_tools-option.patch \
            "
 
-SRC_URI[sha256sum] = "c4a6b75b7ed8f58ca48da830b9fa00ed96d668d3ab4b1f723dcf902f78bde77f"
+SRC_URI[sha256sum] = "84acea3acb2411b29134b32015a5b1aaa62844b19c4b1ef8b8971c6b0759f4c6"
 
 inherit meson pkgconfig gettext pixbufcache ptest-gnome upstream-version-is-even gobject-introspection gi-docgen lib_package
 
@@ -39,9 +39,9 @@ PACKAGECONFIG = "${GDK_PIXBUF_LOADERS} \
                  ${@bb.utils.contains('PTEST_ENABLED', '1', 'tests', '', d)}"
 PACKAGECONFIG:class-native = "${GDK_PIXBUF_LOADERS}"
 
-PACKAGECONFIG[png] = "-Dpng=true,-Dpng=false,libpng"
-PACKAGECONFIG[jpeg] = "-Djpeg=true,-Djpeg=false,jpeg"
-PACKAGECONFIG[tiff] = "-Dtiff=true,-Dtiff=false,tiff"
+PACKAGECONFIG[png] = "-Dpng=enabled,-Dpng=disabled,libpng"
+PACKAGECONFIG[jpeg] = "-Djpeg=enabled,-Djpeg=disabled,jpeg"
+PACKAGECONFIG[tiff] = "-Dtiff=enabled,-Dtiff=disabled,tiff"
 PACKAGECONFIG[tests] = "-Dinstalled_tests=true,-Dinstalled_tests=false"
 
 EXTRA_OEMESON:class-target = " \
-- 
2.30.2


