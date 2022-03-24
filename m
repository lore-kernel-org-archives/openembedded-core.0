Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C39C8C433F5
	for <webhook@archiver.kernel.org>; Thu, 24 Mar 2022 13:44:18 +0000 (UTC)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com
 [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.web08.10911.1648129457438503028
 for <openembedded-core@lists.openembedded.org>;
 Thu, 24 Mar 2022 06:44:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=axE4R50+;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.48,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f48.google.com with SMTP id w4so6681569wrg.12
        for <openembedded-core@lists.openembedded.org>;
 Thu, 24 Mar 2022 06:44:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=2zF6PvrBm/HkoaWdlyvYZ43ywFlKmW04TscrsDFXimc=;
        b=axE4R50+eUt3sS7PPXjxDa5+Nx2m9g7kImnLbDtzOZ8KKkEi4XcvwCtYVGiL7o2ZT5
         fkoWeDtkmS2pVFIcDQhVrSxSe0xHn+kGIZsryvq8hXCVZlYe4UYEpIwXy9Q+dsaCNbnE
         UKLw7LhPjh6k5m00+gh/2kL+3AfFXPCDDOaw4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=2zF6PvrBm/HkoaWdlyvYZ43ywFlKmW04TscrsDFXimc=;
        b=3rJdkGrh+G8VG6Ccah3+DDQ8LuEOVeQNhlv26n18YBzufBQqenQU+ZI+10mNHTe3p0
         gOmV1tDkTvp0eMd8SQrP0UxDKgXVP0Ce2guCUPhjIPTMUQrpPqfzEj6s27Hs+opZ8EFs
         DYOcsJTVU5zXtDK4LKyEfGDkyGSaWwKvm8SlcGJgKZ6zurKvzj8OOE9cDkuCCxurz0W9
         EAzASs0+NVuFmmPgC9mUZ0It9DGQTkJhGoJq8pySoJz5ccvzMiBkqg+GpsYXj91H2BLs
         Mj7aewJ7FZb7nL8wY2wNlTQFUCD6MAWqcG46S2N47d6mTyiAmzA9gX38plsRz6PqPvso
         /Fkw==
X-Gm-Message-State: AOAM530nvY8jIkW6+I0YxtLcapoTix5buoSoZrDn/EzMUtfN/MhnoIS8
	h0jp+pW8qOXkFzXtKe28w1LU3baGyS25kLCE
X-Google-Smtp-Source: 
 ABdhPJxlWBZL5ibErCZRy1BmK3FH/kP8rwwi/nXd2SbrAlICSmuMIF2bjs4/KCsNrC/OBjJzPMjiIw==
X-Received: by 2002:adf:ebc3:0:b0:203:da35:a9c1 with SMTP id
 v3-20020adfebc3000000b00203da35a9c1mr4933675wrn.610.1648129455459;
        Thu, 24 Mar 2022 06:44:15 -0700 (PDT)
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:468a:3ed0:d59:9804])
        by smtp.gmail.com with ESMTPSA id
 j5-20020a05600c1c0500b0038ca4fdf7a5sm9300639wms.9.2022.03.24.06.44.14
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Mar 2022 06:44:14 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] perl: Add missing RDEPENDS
Date: Thu, 24 Mar 2022 13:44:14 +0000
Message-Id: <20220324134414.1319764-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 24 Mar 2022 13:44:18 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163611

This allows quilt-ptest to work in an otherwise bare image. Without
this there are broken modules.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-devtools/perl/files/perl-rdepends.txt | 4 ++++
 meta/recipes-devtools/perl/perl_5.34.1.bb          | 4 ++++
 2 files changed, 8 insertions(+)

diff --git a/meta/recipes-devtools/perl/files/perl-rdepends.txt b/meta/recipes-devtools/perl/files/perl-rdepends.txt
index 3415f32ab1f..74c24c3bb50 100644
--- a/meta/recipes-devtools/perl/files/perl-rdepends.txt
+++ b/meta/recipes-devtools/perl/files/perl-rdepends.txt
@@ -1,7 +1,11 @@
 
 # Some additional dependencies that the above doesn't manage to figure out
 RDEPENDS:perl-module-file-spec += "perl-module-file-spec-unix"
+RDEPENDS:perl-module-scalar-util += "perl-module-list-util"
+RDEPENDS:perl-module-file-temp += "perl-module-scalar-util"
+RDEPENDS:perl-module-file-temp += "perl-module-file-spec"
 RDEPENDS:perl-module-io-file += "perl-module-symbol"
+RDEPENDS:perl-module-io-file += "perl-module-carp"
 RDEPENDS:perl-module-math-bigint += "perl-module-math-bigint-calc"
 RDEPENDS:perl-module-test-builder += "perl-module-list-util"
 RDEPENDS:perl-module-test-builder += "perl-module-scalar-util"
diff --git a/meta/recipes-devtools/perl/perl_5.34.1.bb b/meta/recipes-devtools/perl/perl_5.34.1.bb
index 608a42189bc..0e9d0c032eb 100644
--- a/meta/recipes-devtools/perl/perl_5.34.1.bb
+++ b/meta/recipes-devtools/perl/perl_5.34.1.bb
@@ -355,7 +355,11 @@ do_create_rdepends_inc() {
 
 # Some additional dependencies that the above doesn't manage to figure out
 RDEPENDS:${PN}-module-file-spec += "${PN}-module-file-spec-unix"
+RDEPENDS:${PN}-module-scalar-util += "${PN}-module-list-util"
+RDEPENDS:${PN}-module-file-temp += "${PN}-module-scalar-util"
+RDEPENDS:${PN}-module-file-temp += "${PN}-module-file-spec"
 RDEPENDS:${PN}-module-io-file += "${PN}-module-symbol"
+RDEPENDS:${PN}-module-io-file += "${PN}-module-carp"
 RDEPENDS:${PN}-module-math-bigint += "${PN}-module-math-bigint-calc"
 RDEPENDS:${PN}-module-test-builder += "${PN}-module-list-util"
 RDEPENDS:${PN}-module-test-builder += "${PN}-module-scalar-util"
-- 
2.32.0


