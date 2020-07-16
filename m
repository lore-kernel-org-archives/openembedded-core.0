Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com [209.85.221.66])
 by mx.groups.io with SMTP id smtpd.web12.13642.1594900590579777077
 for <openembedded-core@lists.openembedded.org>;
 Thu, 16 Jul 2020 04:56:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@burtonini-com.20150623.gappssmtp.com header.s=20150623 header.b=KxxXUrEO;
 spf=pass (domain: burtonini.com, ip: 209.85.221.66, mailfrom: ross@burtonini.com)
Received: by mail-wr1-f66.google.com with SMTP id z13so6772281wrw.5
        for <openembedded-core@lists.openembedded.org>; Thu, 16 Jul 2020 04:56:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=burtonini-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=kHDinU98t6DXv35PzKpkm/Q3g4LFmg9HAsIXoYCqVtc=;
        b=KxxXUrEOv1eJpEfXiqCnxAs9oHAAOwEma1DxiekAQeiu30EV09qBSH9bWDx0WCF+2p
         tMy1EE0hJUr+0zV3Io61LKai04p75Jw0h7/MSF9fLhpVDr63ljRpBq2/GG7KaVA1pZm9
         MFnwtjnG+/+pef1YZcIu2ZnFvWS5y38n3CoiAQusrqTGHM1YQVsy7IeaJ8tfBffHgUVB
         Ng1d9d1hcIzzioeqHlVrW6MW1gUiKcuhBiq+eIjyQuw9MdBKdfJ3fJrMRO6pLq/qN/C8
         SMucm0YeP4p5C4aXaLKN5HzOEowHLT3d/iD9y6cR55ob7fbUJYR7c7xEbA/sCbjTWHIk
         i5pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=kHDinU98t6DXv35PzKpkm/Q3g4LFmg9HAsIXoYCqVtc=;
        b=W6mZczSKiyUsdLqLQCL879mUkEBnDGjpdU26P+iW2iwI/qoPbvXjSEPRhmJniHLP91
         AP6J1OKFc+Q7pkPcfQHCmeMg+MvT42NOSRKZ5gLVnNklipcXqavMgTcB19vY9Epuz5Ow
         i7R+OnndNAzeGqFCnxiWyIUwrljyfn/4N1YKWBjWA5bdi//Cx1VtnJv6rygPFYq8opzD
         bCiabalXexZnCGqrPAceSoPKkTBuOrwbmZAn0XGpOWC/7hIhEOBkMRzhIn5AZJddzzCc
         C8Osp374Tl5Xl4OJHiwwjC3jTaoJie8Xiwp+VcoNF6TZ2EwVNLFq/RWuYbfOjzmYxVYi
         GN4A==
X-Gm-Message-State: AOAM531IN3Ymwm//0ZT0E558/4PZtsOjK7akPwxdWk9f/vtW/66GIgpx
	QeNPnBR97Sb7P8QYWn8M17skZrcOBp0=
X-Google-Smtp-Source: ABdhPJwkHkt64ezDFj1EEF5KX73MZaXo5E/Tf9T1e6UGIy2x3hP8+SbvERuAje/IIPuUqBnn3vmTNg==
X-Received: by 2002:a5d:6045:: with SMTP id j5mr4629217wrt.209.1594900588816;
        Thu, 16 Jul 2020 04:56:28 -0700 (PDT)
Return-Path: <ross@burtonini.com>
Received: from rossb-vm.manchester.arm.com ([213.86.15.71])
        by smtp.gmail.com with ESMTPSA id w7sm7914939wmc.32.2020.07.16.04.56.28
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jul 2020 04:56:28 -0700 (PDT)
From: "Ross Burton" <ross@burtonini.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/4] help2man: rewrite recipe
Date: Thu, 16 Jul 2020 12:55:44 +0100
Message-Id: <20200716115546.3724268-2-ross@burtonini.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200716115546.3724268-1-ross@burtonini.com>
References: <20200716115546.3724268-1-ross@burtonini.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Ross Burton <ross.burton@arm.com>

Instead of being explicitly native, use BBCLASSEXTEND.

No need to explicitly depend on autoconf-native automake-native, because
the autotools class does that.

Don't explicitly disable NLS, but use the gettext class.

As this recipe isn't needed in early build anymore there's no need to
avoid reconfiguring.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 ...2man-native_1.47.15.bb => help2man_1.47.15.bb} | 15 ++++++---------
 1 file changed, 6 insertions(+), 9 deletions(-)
 rename meta/recipes-devtools/help2man/{help2man-native_1.47.15.bb => help2man_1.47.15.bb} (66%)

diff --git a/meta/recipes-devtools/help2man/help2man-native_1.47.15.bb b/meta/recipes-devtools/help2man/help2man_1.47.15.bb
similarity index 66%
rename from meta/recipes-devtools/help2man/help2man-native_1.47.15.bb
rename to meta/recipes-devtools/help2man/help2man_1.47.15.bb
index 4f80a2bdb1..7a913507a3 100644
--- a/meta/recipes-devtools/help2man/help2man-native_1.47.15.bb
+++ b/meta/recipes-devtools/help2man/help2man_1.47.15.bb
@@ -2,22 +2,19 @@ SUMMARY = "Program for creating simple man pages"
 SECTION = "devel"
 LICENSE = "GPLv3"
 LIC_FILES_CHKSUM = "file://COPYING;md5=1ebbd3e34237af26da5dc08a4e440464"
-DEPENDS = "autoconf-native automake-native"
 
 SRC_URI = "${GNU_MIRROR}/${BPN}/${BPN}-${PV}.tar.xz"
 SRC_URI[sha256sum] = "c25a35b30eceb315361484b0ff1f81c924e8ee5c8881576f1ee762f001dbcd1c"
 
-inherit autotools native
+inherit autotools gettext
 
-EXTRA_OECONF = "--disable-nls"
-
-# We don't want to reconfigure things as it would require 'perlnative' to be
-# used.
-do_configure() {
-	oe_runconf
-}
+# This is a hand-maintained aclocal.m4 but our autotools class currently deletes
+# aclocal.m4.
+EXTRA_AUTORECONF += "--exclude=aclocal"
 
 do_install_append () {
 	# Make sure we use /usr/bin/env perl
 	sed -i -e "1s:#!.*:#! /usr/bin/env perl:" ${D}${bindir}/help2man
 }
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.26.2

