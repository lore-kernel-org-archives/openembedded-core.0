Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 961FEEB64DA
	for <webhook@archiver.kernel.org>; Tue,  4 Jul 2023 15:29:59 +0000 (UTC)
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
 by mx.groups.io with SMTP id smtpd.web10.61473.1688484594493789186
 for <openembedded-core@lists.openembedded.org>;
 Tue, 04 Jul 2023 08:29:54 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=1rxwB+9f;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.169, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-1b7ef3e74edso28850285ad.0
        for <openembedded-core@lists.openembedded.org>; Tue, 04 Jul 2023 08:29:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1688484593; x=1691076593;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qtE7jsUZSs9D78CcVXdR2erAkRuyDRSBgWpiweAdIu4=;
        b=1rxwB+9fNEfgB5KUJ3pq1dHO8bbaXkYDhcQvYyNxOiAniiLCwKymiAMbIe7tAjr/Bs
         LpDgiZT/RSFhu/5FkdXBbrRm/5QgR9xPYUbdkywxd34w7TzURSOYJFfRXA8S/oCJrMGn
         8D+apUVP+wwoLroK2trgjQu0ByjqGWzS24Y8mG0DzJdMOchKtajxNsrnTmcKPC71MSgL
         iaABqUy6AOmxMMJ9V8UNJwo3uD57y0lrQZGbgezPPDsOHeOqergqumFsQ8OUqFX0FnYA
         ftc1xI3QhdqqdWq/CbyeAWOHHWsc/tuwE4mnimnr41j9RU+xwLa4AIKDtQiqc8lcVGOO
         jHbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688484593; x=1691076593;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qtE7jsUZSs9D78CcVXdR2erAkRuyDRSBgWpiweAdIu4=;
        b=iMKvsKtA4OCUMWPse+k+yc2w9Pw7vULxQs2Nt7mJaZm+wLA65DeWWTrf/dPsjWSzVV
         3zEGByMhI4aVkxqfYkV73wT+tBdMzhfMw3Sky+eBOjOs04PFAS8xyDl+XqUihYVVxx/9
         HlRQhZys/c7+nxruDsG0W9lSkWcG4YhEIiNJw8cjtk+0VXrhl5VGfUMyk+g2o/nn7GvF
         nijn2Opt7egcXA3/EmX14cvoNforUgecj6/79cThAMSI9jBD1+tdYzHRrykmFgJN9rZG
         7f7DkutcsKztHhmyjb8D4jGzn7qEwKQ4fSViAhqJBVK0FtqcnojGC+XPZSb+/QnRjVU9
         3l0g==
X-Gm-Message-State: ABy/qLZAVVQStWafT//hvjn9N6gUhgjzT0bNCCoMYX2gjzFDbWFPFxQD
	f1EesTyvG7lftQ2yAPBdrrvvwLTrpDS1LVrZZbwivA==
X-Google-Smtp-Source: APBJJlGH6vfaDtGShhiExUUr0j+K9paZwmawIfujTH44jijCsvNkrs0+YAn4yRbG25WiSGqE5rySHg==
X-Received: by 2002:a17:903:2446:b0:1b8:a684:f73f with SMTP id l6-20020a170903244600b001b8a684f73fmr1466138pls.68.1688484593578;
        Tue, 04 Jul 2023 08:29:53 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id y22-20020a1709029b9600b001ac40488620sm17332041plp.92.2023.07.04.08.29.52
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Jul 2023 08:29:53 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][mickledore 07/30] wget: upgrade 1.21.3 -> 1.21.4
Date: Tue,  4 Jul 2023 05:29:09 -1000
Message-Id: <4e7ec4bef86c79b4221a800ace700c58ce033de1.1688484463.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1688484463.git.steve@sakoman.com>
References: <cover.1688484463.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 04 Jul 2023 15:29:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183842

From: Alexander Kanavin <alex.kanavin@gmail.com>

Stable version release

Noteworthy changes in release 1.21.4 (2023-05-11)

** Document --retry-on-host-error in help text

** Increase read buffer size to 64k. This should speed up downloads on gigabit
and faster connections

** Update deprecated option '--html-extension' to '--adjust-extension' in
documentation

** Update gnulib compatibility layer.
   Fixes HSTS test failures on i686. (Thanks to Andreas Enge for ponting it out)

License-Update: copyright years

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 67ec2d5bab891cb92af9ca32304a4927daf51ed0)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-extended/wget/wget.inc                           | 2 +-
 meta/recipes-extended/wget/{wget_1.21.3.bb => wget_1.21.4.bb} | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-extended/wget/{wget_1.21.3.bb => wget_1.21.4.bb} (60%)

diff --git a/meta/recipes-extended/wget/wget.inc b/meta/recipes-extended/wget/wget.inc
index d31756dbc8..51926e7296 100644
--- a/meta/recipes-extended/wget/wget.inc
+++ b/meta/recipes-extended/wget/wget.inc
@@ -7,7 +7,7 @@ FTP sites"
 HOMEPAGE = "https://www.gnu.org/software/wget/"
 SECTION = "console/network"
 LICENSE = "GPL-3.0-only"
-LIC_FILES_CHKSUM = "file://COPYING;md5=c678957b0c8e964aa6c70fd77641a71e"
+LIC_FILES_CHKSUM = "file://COPYING;md5=6f65012d1daf98cb09b386cfb68df26b"
 
 inherit autotools gettext texinfo update-alternatives pkgconfig
 
diff --git a/meta/recipes-extended/wget/wget_1.21.3.bb b/meta/recipes-extended/wget/wget_1.21.4.bb
similarity index 60%
rename from meta/recipes-extended/wget/wget_1.21.3.bb
rename to meta/recipes-extended/wget/wget_1.21.4.bb
index f176a1546c..1d31b0116d 100644
--- a/meta/recipes-extended/wget/wget_1.21.3.bb
+++ b/meta/recipes-extended/wget/wget_1.21.4.bb
@@ -2,6 +2,6 @@ SRC_URI = "${GNU_MIRROR}/wget/wget-${PV}.tar.gz \
            file://0002-improve-reproducibility.patch \
           "
 
-SRC_URI[sha256sum] = "5726bb8bc5ca0f6dc7110f6416e4bb7019e2d2ff5bf93d1ca2ffcc6656f220e5"
+SRC_URI[sha256sum] = "81542f5cefb8faacc39bbbc6c82ded80e3e4a88505ae72ea51df27525bcde04c"
 
 require wget.inc
-- 
2.34.1


