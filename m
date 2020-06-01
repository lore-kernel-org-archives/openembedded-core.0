Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
 by mx.groups.io with SMTP id smtpd.web11.37925.1591020715530994240
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Jun 2020 07:11:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=yDppmS4q;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.49, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f49.google.com with SMTP id fs4so5201898pjb.5
        for <openembedded-core@lists.openembedded.org>; Mon, 01 Jun 2020 07:11:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=v1k7U8FV0OuXj1c9HGPyWEpK+OuqzsS5IcmEtKB2ICM=;
        b=yDppmS4qR18Lrq4CFqSw+fM8wn7VAE8TCnXPZrs/mw1Wg61OG/LnF0ProYpE1VkF5p
         9ezYNvTaoeHGr3HgEjPNLlHLokmmL4zpSW4gGzGlyn5O5Zt1FIsGzzCs/dOlT1Gl1cDl
         RsZd+zf/u8crexuHwRAodOZk4g3fpMC7uq7066rwmIy+7RgIw2n+e7I0AOqEcq4eHdOA
         TT6bJg6/C0qtRkJYTruuaoFrPphenkDHajiX7iSEa+djZAbLya6E55zp0Xk5Uk2oS+5l
         uXY8tIunULS7dKd+ca2uX3ayoUwGG8ulCHYgl40oU5t81v0Ide8pXuV/KpZ2uHECvkAh
         J4Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=v1k7U8FV0OuXj1c9HGPyWEpK+OuqzsS5IcmEtKB2ICM=;
        b=CRWfsaJJp8DL34yV5QmIdUftmLV099aivo/FK57RRkxTXpWWO5ob1ran8gSociM5J7
         ioD8uB1AbzxwckkRTO+c8yvG2XQ7rFSKjKQoTke5rmosgwlV/hX7tzrZKPO7Ee06Y+In
         qy78l5HdJQlRxdpev28f2/BaCkgOyP1f4V8FknwIqL9SoBEm5DhcRTJJW/1x4gcwotNM
         P3M9M5F+v7yXideEGTguOwVg2QX7IuS70AZCxIQtr9YnG5ffgGQqbR0TPmH8obUSswuH
         dSHC7M16JtVbj0iihmbrYdQ50HCcOiYL2zE9XGS0Cw9Wa2VCxMpVsJq1a4jjT7YqCjns
         938Q==
X-Gm-Message-State: AOAM530uB2DJQqZyKfufy+3+CXHwQ4e5Sd8Od3IJg6HDGiFame8rL591
	nKdg/V2ntzGJnAJfV9ihlRZXe2YtBTs=
X-Google-Smtp-Source: ABdhPJypTe6wwIN19ZgszhBKs40EqCliPPHPTPxL4/67VnN/hq08dwMkLEbDoodBOZOzGHJiyQk/IQ==
X-Received: by 2002:a17:902:9a95:: with SMTP id w21mr21249752plp.259.1591020714471;
        Mon, 01 Jun 2020 07:11:54 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id u19sm5509859pfk.98.2020.06.01.07.11.53
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jun 2020 07:11:53 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 04/16] sanity.bbclass: Detect and fail if 'inherit' is used in conf file
Date: Mon,  1 Jun 2020 04:11:12 -1000
Message-Id: <bc6e27aeed5d536d2b764949c307f260f78b7810.1591020366.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1591020366.git.steve@sakoman.com>
References: <cover.1591020366.git.steve@sakoman.com>

From: Gregor Zatko <gzatko@gmail.com>

'inherit' directive may not be used in conf files as it's supposed
to be used for the inheritance of classes.
Correct form in conf file is INHERIT.

This commit adds:
- a sanity check to find whether the wrong case exists
- fail the build if so
- tell user about the difference in directives

[YOCTO #5426]

Signed-off-by: Gregor Zatko <gzatko@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 07bf9b460fe97dec86439302a83bbefa8bac9d70)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes/sanity.bbclass | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/meta/classes/sanity.bbclass b/meta/classes/sanity.bbclass
index 9e87101738..5ddde9cc9c 100644
--- a/meta/classes/sanity.bbclass
+++ b/meta/classes/sanity.bbclass
@@ -784,6 +784,12 @@ def check_sanity_everybuild(status, d):
     if "." in paths or "./" in paths or "" in paths:
         status.addresult("PATH contains '.', './' or '' (empty element), which will break the build, please remove this.\nParsed PATH is " + str(paths) + "\n")
 
+    # Check whether 'inherit' directive is found (used for a class to inherit)
+    # in conf file it's supposed to be uppercase INHERIT
+    inherit = d.getVar('inherit')
+    if inherit:
+        status.addresult("Please don't use inherit directive in your local.conf. The directive is supposed to be used in classes and recipes only to inherit of bbclasses. Here INHERIT should be used.\n")
+
     # Check that the DISTRO is valid, if set
     # need to take into account DISTRO renaming DISTRO
     distro = d.getVar('DISTRO')
-- 
2.17.1

