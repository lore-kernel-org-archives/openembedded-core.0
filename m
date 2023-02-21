Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86151C636D7
	for <webhook@archiver.kernel.org>; Tue, 21 Feb 2023 14:41:27 +0000 (UTC)
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
 by mx.groups.io with SMTP id smtpd.web10.43537.1676990486146524330
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Feb 2023 06:41:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=Ccq3FfdX;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.174, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f174.google.com with SMTP id a7so2794474pfx.10
        for <openembedded-core@lists.openembedded.org>; Tue, 21 Feb 2023 06:41:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Mtz/EKJy95JhMPhWHBabz8DeuLc/3AgIbS/4NY6KcMc=;
        b=Ccq3FfdXLyqc/Tiw73zYx6n1y4OtrLEPw+cB+nf42o4xmfbdjPYY9jRhR6X4tPqsS0
         eEdF2cAhFqNYHXb/f0XNu4tpCiPxQOmw1dooP1SmIZq56zN7cO7r/HmdyB0XY6ZqgAs0
         Ty8BCLif3no6ZDIn5398o8Qo77HX0RyRv4y7R6+bxXj6uAQBtuihjfQw/T+lJH5/MPmA
         T2Ew1C1HAJhIlHxpLlAJPGlkUZ8cgQ+gX19Nme9CocnWXH9ioA9qx2jgs7W5XNVtEAid
         pleaaOerCCjrF/+qgzyPBn6JcV6xvNkTyr3FtavpGZMZGIzpfhTD5g9021R8BfaLmFxR
         sWCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Mtz/EKJy95JhMPhWHBabz8DeuLc/3AgIbS/4NY6KcMc=;
        b=AE2ECDcsIQVQNrLQxNIVow064dPqdEOfe5WYG7+uetHup78pGGFb1OUVK/8lAl2cRc
         9+efK+tYIit0ScCx9kaW7/xWDoOCGf01hHollXyqIJuZ59GXZEbbKRdngEmHaohv+NWw
         tsQQNFnLbW8YPPFt4/JOCUmRgGLaA1bpukOLDkjxM3H8wz5FzatIqfFMCq1CZkVtktf8
         6Cg1rZGAKMj4XhQMeXkUc1J0+sSwETnAgCOuEUHc40oBeTtCrhYlVCOOySiMiTXufWbp
         1pVDP+iIhsV9Dpc4/MMOgd8j5KdOsDXx3VB8spjvAqUsgfvftFDj3OrjbCHf9jyBsYLv
         DZnw==
X-Gm-Message-State: AO0yUKWa9XUJq6OIk21jwfGAklQjXb83knDlNZRgI+NBJB2B8Qbnb9Xy
	5p2tr0EOQKGaKCD0EXlDaNmvhRrUn9yvplwZn40=
X-Google-Smtp-Source: AK7set9HTx8wIrfdXnYkhZjE2RMyXVAUlJ0ZseIosNL8Apg4AtuUvUjThUQpkyg/QcagRi9fAHtzQg==
X-Received: by 2002:a62:1946:0:b0:5a8:bd6e:90fb with SMTP id 67-20020a621946000000b005a8bd6e90fbmr4388436pfz.19.1676990485063;
        Tue, 21 Feb 2023 06:41:25 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-4-112.hawaiiantel.net. [72.253.4.112])
        by smtp.gmail.com with ESMTPSA id h5-20020a62b405000000b005ae8e94b0d5sm6151140pfn.107.2023.02.21.06.41.24
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Feb 2023 06:41:24 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 06/23] bind: upgrade 9.18.10 -> 9.18.11
Date: Tue, 21 Feb 2023 04:40:49 -1000
Message-Id: <e9e54549426ccfac2c8da4053754f648e42a6c4a.1676990336.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1676990336.git.steve@sakoman.com>
References: <cover.1676990336.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 21 Feb 2023 14:41:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177506

From: Alexander Kanavin <alex.kanavin@gmail.com>

Stable branch update

License-update: copyright years

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 63e8a8952c3d1b3b5c481be6bba52a3f4d65648e)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
(cherry picked from commit 54e2de8a589766c9a305c9bd0782afb5353fd109)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../0001-avoid-start-failure-with-bind-user.patch             | 0
 ...0001-named-lwresd-V-and-start-log-hide-build-options.patch | 0
 ...bind-ensure-searching-for-json-headers-searches-sysr.patch | 0
 .../bind/{bind-9.18.10 => bind-9.18.11}/bind9                 | 0
 .../bind/{bind-9.18.10 => bind-9.18.11}/conf.patch            | 0
 .../bind/{bind-9.18.10 => bind-9.18.11}/generate-rndc-key.sh  | 0
 .../init.d-add-support-for-read-only-rootfs.patch             | 0
 .../make-etc-initd-bind-stop-work.patch                       | 0
 .../bind/{bind-9.18.10 => bind-9.18.11}/named.service         | 0
 .../bind/{bind_9.18.10.bb => bind_9.18.11.bb}                 | 4 ++--
 10 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-connectivity/bind/{bind-9.18.10 => bind-9.18.11}/0001-avoid-start-failure-with-bind-user.patch (100%)
 rename meta/recipes-connectivity/bind/{bind-9.18.10 => bind-9.18.11}/0001-named-lwresd-V-and-start-log-hide-build-options.patch (100%)
 rename meta/recipes-connectivity/bind/{bind-9.18.10 => bind-9.18.11}/bind-ensure-searching-for-json-headers-searches-sysr.patch (100%)
 rename meta/recipes-connectivity/bind/{bind-9.18.10 => bind-9.18.11}/bind9 (100%)
 rename meta/recipes-connectivity/bind/{bind-9.18.10 => bind-9.18.11}/conf.patch (100%)
 rename meta/recipes-connectivity/bind/{bind-9.18.10 => bind-9.18.11}/generate-rndc-key.sh (100%)
 rename meta/recipes-connectivity/bind/{bind-9.18.10 => bind-9.18.11}/init.d-add-support-for-read-only-rootfs.patch (100%)
 rename meta/recipes-connectivity/bind/{bind-9.18.10 => bind-9.18.11}/make-etc-initd-bind-stop-work.patch (100%)
 rename meta/recipes-connectivity/bind/{bind-9.18.10 => bind-9.18.11}/named.service (100%)
 rename meta/recipes-connectivity/bind/{bind_9.18.10.bb => bind_9.18.11.bb} (96%)

diff --git a/meta/recipes-connectivity/bind/bind-9.18.10/0001-avoid-start-failure-with-bind-user.patch b/meta/recipes-connectivity/bind/bind-9.18.11/0001-avoid-start-failure-with-bind-user.patch
similarity index 100%
rename from meta/recipes-connectivity/bind/bind-9.18.10/0001-avoid-start-failure-with-bind-user.patch
rename to meta/recipes-connectivity/bind/bind-9.18.11/0001-avoid-start-failure-with-bind-user.patch
diff --git a/meta/recipes-connectivity/bind/bind-9.18.10/0001-named-lwresd-V-and-start-log-hide-build-options.patch b/meta/recipes-connectivity/bind/bind-9.18.11/0001-named-lwresd-V-and-start-log-hide-build-options.patch
similarity index 100%
rename from meta/recipes-connectivity/bind/bind-9.18.10/0001-named-lwresd-V-and-start-log-hide-build-options.patch
rename to meta/recipes-connectivity/bind/bind-9.18.11/0001-named-lwresd-V-and-start-log-hide-build-options.patch
diff --git a/meta/recipes-connectivity/bind/bind-9.18.10/bind-ensure-searching-for-json-headers-searches-sysr.patch b/meta/recipes-connectivity/bind/bind-9.18.11/bind-ensure-searching-for-json-headers-searches-sysr.patch
similarity index 100%
rename from meta/recipes-connectivity/bind/bind-9.18.10/bind-ensure-searching-for-json-headers-searches-sysr.patch
rename to meta/recipes-connectivity/bind/bind-9.18.11/bind-ensure-searching-for-json-headers-searches-sysr.patch
diff --git a/meta/recipes-connectivity/bind/bind-9.18.10/bind9 b/meta/recipes-connectivity/bind/bind-9.18.11/bind9
similarity index 100%
rename from meta/recipes-connectivity/bind/bind-9.18.10/bind9
rename to meta/recipes-connectivity/bind/bind-9.18.11/bind9
diff --git a/meta/recipes-connectivity/bind/bind-9.18.10/conf.patch b/meta/recipes-connectivity/bind/bind-9.18.11/conf.patch
similarity index 100%
rename from meta/recipes-connectivity/bind/bind-9.18.10/conf.patch
rename to meta/recipes-connectivity/bind/bind-9.18.11/conf.patch
diff --git a/meta/recipes-connectivity/bind/bind-9.18.10/generate-rndc-key.sh b/meta/recipes-connectivity/bind/bind-9.18.11/generate-rndc-key.sh
similarity index 100%
rename from meta/recipes-connectivity/bind/bind-9.18.10/generate-rndc-key.sh
rename to meta/recipes-connectivity/bind/bind-9.18.11/generate-rndc-key.sh
diff --git a/meta/recipes-connectivity/bind/bind-9.18.10/init.d-add-support-for-read-only-rootfs.patch b/meta/recipes-connectivity/bind/bind-9.18.11/init.d-add-support-for-read-only-rootfs.patch
similarity index 100%
rename from meta/recipes-connectivity/bind/bind-9.18.10/init.d-add-support-for-read-only-rootfs.patch
rename to meta/recipes-connectivity/bind/bind-9.18.11/init.d-add-support-for-read-only-rootfs.patch
diff --git a/meta/recipes-connectivity/bind/bind-9.18.10/make-etc-initd-bind-stop-work.patch b/meta/recipes-connectivity/bind/bind-9.18.11/make-etc-initd-bind-stop-work.patch
similarity index 100%
rename from meta/recipes-connectivity/bind/bind-9.18.10/make-etc-initd-bind-stop-work.patch
rename to meta/recipes-connectivity/bind/bind-9.18.11/make-etc-initd-bind-stop-work.patch
diff --git a/meta/recipes-connectivity/bind/bind-9.18.10/named.service b/meta/recipes-connectivity/bind/bind-9.18.11/named.service
similarity index 100%
rename from meta/recipes-connectivity/bind/bind-9.18.10/named.service
rename to meta/recipes-connectivity/bind/bind-9.18.11/named.service
diff --git a/meta/recipes-connectivity/bind/bind_9.18.10.bb b/meta/recipes-connectivity/bind/bind_9.18.11.bb
similarity index 96%
rename from meta/recipes-connectivity/bind/bind_9.18.10.bb
rename to meta/recipes-connectivity/bind/bind_9.18.11.bb
index 2432131f5c..0618129318 100644
--- a/meta/recipes-connectivity/bind/bind_9.18.10.bb
+++ b/meta/recipes-connectivity/bind/bind_9.18.11.bb
@@ -4,7 +4,7 @@ DESCRIPTION = "BIND 9 provides a full-featured Domain Name Server system"
 SECTION = "console/network"
 
 LICENSE = "MPL-2.0"
-LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=9a4a897f202c0710e07f2f2836bc2b62"
+LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=d8cf7bd9c4fd5471a588e7e66e672408"
 
 DEPENDS = "openssl libcap zlib libuv"
 
@@ -20,7 +20,7 @@ SRC_URI = "https://ftp.isc.org/isc/bind9/${PV}/${BPN}-${PV}.tar.xz \
            file://0001-avoid-start-failure-with-bind-user.patch \
            "
 
-SRC_URI[sha256sum] = "f415a92feb62568b50854a063cb231e257351f8672186d0ab031a49b3de2cac6"
+SRC_URI[sha256sum] = "8ff3352812230cbcbda42df87cad961f94163d3da457c5e4bef8057fd5df2158"
 
 UPSTREAM_CHECK_URI = "https://ftp.isc.org/isc/bind9/"
 # follow the ESV versions divisible by 2
-- 
2.34.1


