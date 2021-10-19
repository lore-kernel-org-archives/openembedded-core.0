Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53BF6C433F5
	for <webhook@archiver.kernel.org>; Tue, 19 Oct 2021 19:54:48 +0000 (UTC)
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com
 [209.85.216.54])
 by mx.groups.io with SMTP id smtpd.web11.15093.1634673287591764652
 for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Oct 2021 12:54:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=14idXsnx;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.54,
 mailfrom: steve@sakoman.com)
Received: by mail-pj1-f54.google.com with SMTP id
 ls18-20020a17090b351200b001a00250584aso712505pjb.4
        for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Oct 2021 12:54:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=biFfn/1LDGoni4qIfbglGy/Vt9ctkiQqLi2uGWXTWQg=;
        b=14idXsnxveAkdHUgwFi0YPJ53Q2qf/OJ7/43WQrlyqU9RD32LXgIF69Ik/VJOsLbQI
         ZhfNymI07okjTvHxOLyNhcJzalKrfqtGspBG/aNU3W+Q0lR8eq7OwXN73wNkUwilJAuL
         zL/wgEPLlXZe09eCrrHHnX1PtMcEhPBIQ+tTxM8kCJpsppeVt2GG5u67kmw1rrFgAulj
         R6Ro55DzxnhyPvpjZKS89J2olDihcYRHuRLZ/Tm6/AvC+KlbNG/5h1rAZJ0XIRrDwXQV
         2WrJAddrASfdvnqaqOK37xPV7OKXCp/72sI5QDE6K94gm0IX5Q74Bb6gwnrJnUx+fJDS
         g/UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=biFfn/1LDGoni4qIfbglGy/Vt9ctkiQqLi2uGWXTWQg=;
        b=XoDaaJa/6cmbJHd8rt4YY+Fospn7I8bm9L6Z67zzZhHzT8iqF8PdalxTgiCpgS0LJ9
         K078u76jFFiZuXEESb0hEw8kI1NXzkjoHV43mS0Pa/nyldqg1g02yQBhvaMuOxxRY380
         Z/SXF3fIpiDQhlJO/DuIooM1dG/gmR98B9EvDU/tiW5kV9T8rHzuxFA4B1txMmpAuVUV
         shrIvrTlBpjwz0v8zUtYII8cSv1nbqVSrERLSORxzy1sejF641B15Z+X5ewLmLOIZdHR
         RCCyX5CPIBB5wnjUc4+L3w9+W5/WepKCb6wcSVeqzbbSzbvMOAkRe3cEK2KbjNQBl1It
         j/Fw==
X-Gm-Message-State: AOAM531JNWVpdc6yHAKgKgUicgOe/K7aHq5XnfSZNjBrl+ewWuapSAqi
	U6VssPmIe/Vx0Iz5PSt99/zHZX2PdMxGZZPpZXo=
X-Google-Smtp-Source: 
 ABdhPJwTkfvpTAFqyPNausLM4slHFX4JfC+sGeK8ou5sopGIbiSt+L5oTg6JUkbNV7kREpbYWVnmbQ==
X-Received: by 2002:a17:90a:ee87:: with SMTP id
 i7mr2204191pjz.194.1634673286696;
        Tue, 19 Oct 2021 12:54:46 -0700 (PDT)
Received: from hexa.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com.
 [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id q14sm67104pfk.3.2021.10.19.12.54.45
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Oct 2021 12:54:46 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 16/38] libpsl: Add config knobs for runtime/builtin
 conversion choices
Date: Tue, 19 Oct 2021 09:53:27 -1000
Message-Id: 
 <c912cd493f02458d22c78791fc3175f613b8108e.1634665675.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1634665675.git.steve@sakoman.com>
References: <cover.1634665675.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 19 Oct 2021 19:54:48 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157221

From: Andrej Valek <andrej.valek@siemens.com>

Based on d22d87b9c4ac85ffb3506e2acaf2a8a627f55e8e, but kept idn2
as default.

Signed-off-by: Andrej Valek <andrej.valek@siemens.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-support/libpsl/libpsl_0.21.0.bb | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-support/libpsl/libpsl_0.21.0.bb b/meta/recipes-support/libpsl/libpsl_0.21.0.bb
index b2dda191ce..66e64f785c 100644
--- a/meta/recipes-support/libpsl/libpsl_0.21.0.bb
+++ b/meta/recipes-support/libpsl/libpsl_0.21.0.bb
@@ -19,11 +19,10 @@ SRC_URI[sha256sum] = "41bd1c75a375b85c337b59783f5deb93dbb443fb0a52d257f403df7bd6
 
 UPSTREAM_CHECK_URI = "https://github.com/rockdaboot/libpsl/releases"
 
-DEPENDS = "libidn2"
-
 inherit autotools gettext gtk-doc manpages pkgconfig lib_package
 
-PACKAGECONFIG ??= ""
+PACKAGECONFIG ?= "idn2"
 PACKAGECONFIG[manpages] = "--enable-man,--disable-man,libxslt-native"
-
+PACKAGECONFIG[icu] = "--enable-runtime=libicu --enable-builtin=libicu,,icu"
+PACKAGECONFIG[idn2] = "--enable-runtime=libidn2 --enable-builtin=libidn2,,libidn2 libunistring"
 BBCLASSEXTEND = "native nativesdk"
-- 
2.25.1


