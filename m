Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 110A0EB64DD
	for <webhook@archiver.kernel.org>; Tue, 18 Jul 2023 14:26:40 +0000 (UTC)
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
 by mx.groups.io with SMTP id smtpd.web10.9102.1689690393467748559
 for <openembedded-core@lists.openembedded.org>;
 Tue, 18 Jul 2023 07:26:33 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=Av1F8svI;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.179, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-666e3b15370so4192313b3a.0
        for <openembedded-core@lists.openembedded.org>; Tue, 18 Jul 2023 07:26:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1689690392; x=1692282392;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9V9t49kFK3EdrLcwG+P562ZS41hbFeUPviasuScz7s0=;
        b=Av1F8svIdrHA1KirPNkptPMSLVLUwHUk6UeToNT0YXjkjh8RDAFBG58hSv+/NM1W7g
         UbiPUBj1pbXS+k+ySACIYYK7k+hkBPF1ds/rYx5ccyzWVs9HA67wrS9BpwNJbQtZIKFQ
         NGFSE7KyJrM01oIucHeHSZnloEPVgoW6P/yVh7gQ2tImxK9BSYNzKPxujRYoBZngmX2v
         H6hyvx363k1XazqGSaOOQWJwSMeraZxEQCIuUAdrmpD23t8gzWWR2D4hqb6iOzOv54aM
         i3yMRm3C+mjFFiyUlhLVCBBpWSNo+/r85Z7SYt9G5p/zpx2HYHlVG0jsbPboAk3Rbuea
         JvdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689690392; x=1692282392;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9V9t49kFK3EdrLcwG+P562ZS41hbFeUPviasuScz7s0=;
        b=anOns0mWwMF5EypYOP3l6EA95pYWVofhIxcJAKqtdScmOtW7n4NAnjJXhNPL7G/dIf
         /lZkFE1kCA/DJ/9sRN/5OwTYEhVuk39LIMFTtwfB9tq0ko/M/nGnvqoWj0zB8RewdTpI
         2BcvccqDWYadToQ8IE8V5K6AgnbXM0iNNmkTHaKM+JZDZ/1mQ+N2e+H8EvwiuqBcp/CD
         0zdZ/fhwPV69b2N5awO5Binz4tOkW44eN2db0KrdKF146RHefQS18GQOY2TJsj7JYPsM
         gURufR97t1LXGm+tkEfNOwbVN9uCrqlHEBlraVl+XnMKsjKwi5mYhdlk6NP/2d0YwV8t
         tdSA==
X-Gm-Message-State: ABy/qLaA0y6abqcHMS96zHOb9GFoGo3igaFb3PAHFcDFNf/fjvFjlloB
	Ws/boQAla47Nxh5QYPSR6zkwWRGXOKeceSCkLwg=
X-Google-Smtp-Source: APBJJlGmQTvQIb8J/FaTTT5PQ+udFe5EZ+6+eo9DK0R+brZvdS+DJQY88EKS/RG+JqP3QRPRZDiSNw==
X-Received: by 2002:a05:6a00:ad1:b0:67d:22a6:2f54 with SMTP id c17-20020a056a000ad100b0067d22a62f54mr3164683pfl.31.1689690392516;
        Tue, 18 Jul 2023 07:26:32 -0700 (PDT)
Received: from hexa.lan (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id j24-20020aa78d18000000b006732786b5f1sm1581732pfe.213.2023.07.18.07.26.31
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Jul 2023 07:26:31 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 09/27] wget: upgrade 1.21.3 -> 1.21.4
Date: Tue, 18 Jul 2023 04:25:43 -1000
Message-Id: <024feac4827dc847ba83a64de82cef524156a9ea.1689689618.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1689689618.git.steve@sakoman.com>
References: <cover.1689689618.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 18 Jul 2023 14:26:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184513

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
(cherry picked from commit 4e7ec4bef86c79b4221a800ace700c58ce033de1)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-extended/wget/wget.inc                           | 2 +-
 meta/recipes-extended/wget/{wget_1.21.3.bb => wget_1.21.4.bb} | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-extended/wget/{wget_1.21.3.bb => wget_1.21.4.bb} (60%)

diff --git a/meta/recipes-extended/wget/wget.inc b/meta/recipes-extended/wget/wget.inc
index 58cb5ca73d..30abaff7b7 100644
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


