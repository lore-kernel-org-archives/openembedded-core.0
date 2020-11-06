Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
 by mx.groups.io with SMTP id smtpd.web08.12317.1604673402222487768
 for <openembedded-core@lists.openembedded.org>;
 Fri, 06 Nov 2020 06:36:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=d0/Rmd1e;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.176, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f176.google.com with SMTP id r186so1095589pgr.0
        for <openembedded-core@lists.openembedded.org>; Fri, 06 Nov 2020 06:36:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=pZ3YVNBFr1ZhiTjAAIHhlWFCSroRqzNIMvEXL0vwKGk=;
        b=d0/Rmd1edYi437iELbMtwy6VPNivOcZRnXuputmztRnWcevex4bXjjFj/0F1vJoFuC
         SM9gvRTCEO5IhU75XftC42jOy5mnjn8Xs0gQlJspr4Di6DYd6BxBhfF0/HxDCPF1frOG
         1o//uzv3KnaH+R03fXWxv7rmGtjta+57aD9I4qmfLozXS8AKAbQaBFRM/sN4D548fmxP
         EuOGWH9b70j6A4TsXb4TJGSnswUTO6pmFNquduRx0lAbZ8E11V+HqwSfbttZ9g7xNEig
         LZB+LiosA81y+69gxdGxYPIRdD/GfQTTI9SsY84SfVNzMtS5kPyLBPxCLA/NLJzyEDt9
         jBig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=pZ3YVNBFr1ZhiTjAAIHhlWFCSroRqzNIMvEXL0vwKGk=;
        b=DOzCB8UxilU1iC9BApcieDw0cetRmqPXKwsUF1s/0f5jTdHRTWYm472Kl5j97EBGhj
         nGszKmXNH6BAOZnSaFAFL7MxUAb3J3AJ84Aub/kgpE60y9nZgTd5iNwWhoWJTakiAjig
         rg2GCmyrUZVwwtqFcMdmVYP4XWFFBYV2SagxcfWzc0a30Ajxi4Uj3wQw5tgueH6VQ9N1
         kQMR1Jeuw3RFAiPN0GKF6HbQ534roEHekADOviLl9mZqBeh55wMk94qSn5gQNBRdSVKp
         Ph0WDcFVka13PXLZy6/EdaSTVCaptfF28E+qb9NfKDqVWRw6oXznFP4H4pjOfm0GW366
         y2+w==
X-Gm-Message-State: AOAM532nwUpeJhNCt3aq4fFnT+UBncAwrcMOkOHhp5PlMiMc/Ot6MsFS
	g/b/BlAZjgeDWRHKIUF4Sy2EsxqSIFoDHK2V
X-Google-Smtp-Source: ABdhPJzVcsXir9FDC4CMhVwKxc9XtxPRho6QahKhJX5j0Bglr4ZKIgAY/dnajyQ4z2oBAWjG/WpJcg==
X-Received: by 2002:a17:90a:d18c:: with SMTP id fu12mr2762925pjb.7.1604673401233;
        Fri, 06 Nov 2020 06:36:41 -0800 (PST)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id jy19sm2765166pjb.9.2020.11.06.06.36.39
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2020 06:36:40 -0800 (PST)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 08/20] recipes-core/busybox: fixup licensing information
Date: Fri,  6 Nov 2020 04:35:23 -1000
Message-Id: <61959632cb1ba4f20e6ecf1077e4d95ac1df26c1.1604672839.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1604672838.git.steve@sakoman.com>
References: <cover.1604672838.git.steve@sakoman.com>

From: "Yann E. MORIN" <yann.morin.1998@free.fr>

Commit 7d32417b4d (busybox: Correct the name of the bzip2 license)
changes the licesne from 'bzip2' to 'bzip2-1.0.6' on the rationale
that the 'bzip2 license was renamed from "bzip2" to "bzip2-1.0.6"
[...] to match the official SPDX identifier.'

Though the above is true for the bzip2 and pbzip2 packages, the bzip2
code bundled in busybox is a copy from the bzip2 1.0.4 version, not the
1.0.6 version.

As such, using bzip2-1.0.6 is wrong.

Unfortunately, there is no official SPDX license identifier for this
bzip2 1.0.4 version, so we just mimick the existing ones (bzip2-1.0.5
and bzip2-1.0.6) by using bzip2-1.0.4.

Also, there is a license file attached to that, so we add it to the
list.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Alexandre BELLONI <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 6238ee3ecd385cbadd8e75eb8b22a96d9cb13639)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-core/busybox/busybox.inc | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-core/busybox/busybox.inc b/meta/recipes-core/busybox/busybox.inc
index 45aaa2b41c..e0522be729 100644
--- a/meta/recipes-core/busybox/busybox.inc
+++ b/meta/recipes-core/busybox/busybox.inc
@@ -5,10 +5,11 @@ BUGTRACKER = "https://bugs.busybox.net/"
 
 DEPENDS += "kern-tools-native virtual/crypt"
 
-# bzip2 applet in busybox is based on lightly-modified bzip2 source
+# bzip2 applet in busybox is based on lightly-modified bzip2-1.0.4 source
 # the GPL is version 2 only
-LICENSE = "GPLv2 & bzip2-1.0.6"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=de10de48642ab74318e893a61105afbb"
+LICENSE = "GPLv2 & bzip2-1.0.4"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=de10de48642ab74318e893a61105afbb \
+                    file://archival/libarchive/bz/LICENSE;md5=28e3301eae987e8cfe19988e98383dae"
 
 SECTION = "base"
 
-- 
2.17.1

