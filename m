Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35FB2C7EE2F
	for <webhook@archiver.kernel.org>; Fri,  3 Mar 2023 16:17:47 +0000 (UTC)
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
 by mx.groups.io with SMTP id smtpd.web10.27556.1677860266661907687
 for <openembedded-core@lists.openembedded.org>;
 Fri, 03 Mar 2023 08:17:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=1SP7+vza;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.52, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f52.google.com with SMTP id m20-20020a17090ab79400b00239d8e182efso6618367pjr.5
        for <openembedded-core@lists.openembedded.org>; Fri, 03 Mar 2023 08:17:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112; t=1677860266;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xyERdo5BnSGm8o2jGzq4Pg26IPo5bMm2yjiWid5Bte4=;
        b=1SP7+vzagl8NIoPukS5bEOz+H9SCpqgv5bCYbejfC5wGyeS01iZ7fitcrDQYqqFVkZ
         QTZ9WKfh3yYubnAVUijFdzAorRI9eeyQ6ZFnIgL9PGs7kDPnW/lEcEFA2JhTpn+xXlxZ
         NFBAzvPMYHlb46aFnh06Oh8ImX21W7qWQqRtzgi59HdQpLS2Ccl7FpFyxhYUvdKER5/8
         7cG1YvfjOC6mIaRsHQms1/WsnsuXTow7cM3qmgiFgf2KmWB480kVdFh4DOlB2oV9YlMu
         HiU+n/Btl86pqWOUmGpo9gD7xbU2rgj6iGlMt7ez+qZVtDTmTAeiKftFCSgKPjEN5Emq
         0BLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677860266;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xyERdo5BnSGm8o2jGzq4Pg26IPo5bMm2yjiWid5Bte4=;
        b=LgvSpDJKTa7YWzigltcjb/zqJbfbwsy3130rzCa/vTQdpTsJGu1C7zhrZv7CGqdkK6
         mwFMsfog+QPxngv2WQyXjkvTX6R4VgS/C8d5xfbIV65dd3jH5Aq9MKL+m5/5tKiEsFCh
         ToYylfgRO7lqWuR+8jN0NSsb8v4VA2gPIEpKG/vT+PL2jFrInMVmjKZFydnCC1FLnLri
         seJxCxqOwJPqPhXPCDffZg8Z/Ym4XwuyOwXHCpTXyorgEDXhwVQaMNQC9EPuVDDVi3TJ
         kCdR8JEo8Hgba1J2KIonYT7g7KNoVdY0/d/KmJVE4BzxCwTbi7RKWRI+JpvQf01n/hDV
         fqqg==
X-Gm-Message-State: AO0yUKUHDdOTYXYadP14dixhRSObQUfeptGFupRF8+D8iSXm7sEJeyRU
	IMJPB2rwSJHp2eiRUIg1BL8IHLcEN6U69J22iHU=
X-Google-Smtp-Source: AK7set9xjCartcsm0SI6TiV+KXHf3kArF4oMTrqhNlYgGqXUlWp5DooNE0ueHiFh+gaLNK/gtLH4Fw==
X-Received: by 2002:a17:903:1211:b0:19b:98ce:48e6 with SMTP id l17-20020a170903121100b0019b98ce48e6mr2947080plh.6.1677860265645;
        Fri, 03 Mar 2023 08:17:45 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-4-112.hawaiiantel.net. [72.253.4.112])
        by smtp.gmail.com with ESMTPSA id ko4-20020a17090307c400b00186b7443082sm1702474plb.195.2023.03.03.08.17.44
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Mar 2023 08:17:45 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 08/29] libjpeg-turbo: upgrade 2.1.5 -> 2.1.5.1
Date: Fri,  3 Mar 2023 06:17:06 -1000
Message-Id: <a8e22f52f2d1a9e282dd257cbca2110b30250adf.1677859897.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1677859897.git.steve@sakoman.com>
References: <cover.1677859897.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 03 Mar 2023 16:17:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177997

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
1. The SIMD dispatchers in libjpeg-turbo 2.1.4 and prior stored the list of
supported SIMD instruction sets in a global variable, which caused an innocuous
race condition whereby the variable could have been initialized multiple times
if 'jpeg_start_*compress()' was called simultaneously in multiple threads.
libjpeg-turbo 2.1.5 included an undocumented attempt to fix this race condition
by making the SIMD support variable thread-local.  However, that caused another
issue whereby, if 'jpeg_start_*compress()' was called in one thread and
'jpeg_read_*()' or 'jpeg_write_*()' was called in a second thread, the SIMD
support variable was never initialized in the second thread.  On x86 systems,
this led the second thread to incorrectly assume that AVX2 instructions were
always available, and when it attempted to use those instructions on older x86
CPUs that do not support them, an illegal instruction error occurred.  The SIMD
dispatchers now ensure that the SIMD support variable is initialized before
dispatching based on its value.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 009a1b0390d791d614b8d4a1407e7479c261f60d)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
(cherry picked from commit d57de2a7169de369105ed9bce19a43dad68f350a)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../jpeg/{libjpeg-turbo_2.1.5.bb => libjpeg-turbo_2.1.5.1.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/jpeg/{libjpeg-turbo_2.1.5.bb => libjpeg-turbo_2.1.5.1.bb} (97%)

diff --git a/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.5.bb b/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.5.1.bb
similarity index 97%
rename from meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.5.bb
rename to meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.5.1.bb
index 4d21ca1e1d..e086830c02 100644
--- a/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.5.bb
+++ b/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.5.1.bb
@@ -14,7 +14,7 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/${BPN}/${BPN}-${PV}.tar.gz \
            file://0001-libjpeg-turbo-fix-package_qa-error.patch \
            "
 
-SRC_URI[sha256sum] = "bc12bc9dce55300c6bf4342bc233bcc26bd38bf289eedf147360d731c668ddaf"
+SRC_URI[sha256sum] = "2fdc3feb6e9deb17adec9bafa3321419aa19f8f4e5dea7bf8486844ca22207bf"
 UPSTREAM_CHECK_URI = "http://sourceforge.net/projects/libjpeg-turbo/files/"
 UPSTREAM_CHECK_REGEX = "/libjpeg-turbo/files/(?P<pver>(\d+[\.\-_]*)+)/"
 
-- 
2.34.1


