Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
 by mx.groups.io with SMTP id smtpd.web12.57669.1595862623096883250
 for <openembedded-core@lists.openembedded.org>;
 Mon, 27 Jul 2020 08:10:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=d7lEFUPq;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.181, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f181.google.com with SMTP id w2so9713446pgg.10
        for <openembedded-core@lists.openembedded.org>; Mon, 27 Jul 2020 08:10:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=wu5J69FWtmA5HSRtlsSpuEpc6mTNoJfjEYgJ7KHkugw=;
        b=d7lEFUPqB+o7vMTveCF7WIQPSlq19gOnlzAni8xv1KHSjNKb4YG+tV8aYugJ/6tw5X
         +PG1K5T+Gvvd6RFWHbsalvjmSUc4u4B1BECx0G2QpOLm93DwDRkWN24CcUckdDBhiypx
         UHQZFsslA+wGlryrQ9c8EGN/lhJST47ewC0XisRhto3N95alrwhYQVUbH3EyWtl0O9gg
         S+y/odSw0UNF8t23BVsjtFw4cAnXtx8EfDWQ1g62cbCcLaSIq3ZCLKmiaewL49YSdshp
         x2unUY2D3+mRf8O0PvY99KMKfMXv/i1FuUj1OlMs1wrTEcOgYMmSWOmDLV2GHLUCb+OZ
         tD7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=wu5J69FWtmA5HSRtlsSpuEpc6mTNoJfjEYgJ7KHkugw=;
        b=KWZSj1nwxx4dfc0lOSl+UGc9uEAHp3jmh341PT+sJAME4at2yc/V7lAvb9E1qfdo2c
         JQsBKYXKH+MRsUfM44AvEwO16BXbBVaHF7xqGkSAm+lQi+gYuvayX2jKPBdu+ZxVXOEY
         cMDYLql9CJQfcowlmlQtv/oe3X7px12OcydRNCwiOA/oQ7jByAzIV/YDFxJmG27JEgUc
         ppIOsbLjvcFBR3xGtbWi7GHBdbv4dPE+FGEx8FzCwobf2VHhuXFq44KNPAWGT428XqFg
         22Fx8mXTHB2msFiWQZt/kq7gXio7atdah7OF57eR1LYqT0NcV8Iu54VBUImq39HAlwwm
         CE1g==
X-Gm-Message-State: AOAM532lLW1wD+0AYuvIJXleEGmUfFwjitL85+hd2VfOlCGJUyGV2+fQ
	uNb9XAMUosrOlmdJmOoiLvTSpTAtclo=
X-Google-Smtp-Source: ABdhPJw2sIFaonzYtt2zhnf/Z0B771qN8GcoR6o7YE0HB8rgRmydhr5dEGYQIdShqqU7JpTMMHmBAw==
X-Received: by 2002:a63:f806:: with SMTP id n6mr19843503pgh.346.1595862622090;
        Mon, 27 Jul 2020 08:10:22 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id p127sm14929495pfb.17.2020.07.27.08.10.20
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2020 08:10:21 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 04/18] rpm: fix nativesdk's default var location
Date: Mon, 27 Jul 2020 05:09:43 -1000
Message-Id: <4e0d1bdc6e896c7dedccf615d6d0da9eb91d9b1d.1595862361.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1595862361.git.steve@sakoman.com>
References: <cover.1595862361.git.steve@sakoman.com>

From: Chen Qi <Qi.Chen@windriver.com>

For now, the nativesdk-rpm's %_var in /usr/lib/rpm/macros is
'/var'. This is causing error when running `rpm -qplv A.rpm'.

   error: cannot open Packages index using db5 - Permission denied (13)
   error: cannot open Packages database in /var/lib/rpm

The rpm in SDK should be using its own database. So we should remove
this configure option, letting the SDK's native sysroot prefix to be
there in %_var. In fact, '%_usr' in macros has already got the prefix.
After this change, we have in the macros file lines like below.

"""
%_usr                   /opt/windriver/wrlinux/20.29/sysroots/x86_64-wrlinuxsdk-linux/usr
%_usrsrc                %{_usr}/src
%_var                   /opt/windriver/wrlinux/20.29/sysroots/x86_64-wrlinuxsdk-linux/var
"""

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 13e17930062cb3f816516ba7dbeb70d6da7174dd)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/rpm/rpm_4.14.2.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/rpm/rpm_4.14.2.1.bb b/meta/recipes-devtools/rpm/rpm_4.14.2.1.bb
index 17255dc87a..4029217d08 100644
--- a/meta/recipes-devtools/rpm/rpm_4.14.2.1.bb
+++ b/meta/recipes-devtools/rpm/rpm_4.14.2.1.bb
@@ -70,7 +70,7 @@ EXTRA_OECONF_append_libc-musl = " --disable-nls"
 # Disable dbus for native, so that rpm doesn't attempt to inhibit shutdown via session dbus even when plugins support is enabled.
 # Also disable plugins by default for native.
 EXTRA_OECONF_append_class-native = " --sysconfdir=/etc --localstatedir=/var --disable-plugins"
-EXTRA_OECONF_append_class-nativesdk = " --sysconfdir=/etc --localstatedir=/var --disable-plugins"
+EXTRA_OECONF_append_class-nativesdk = " --sysconfdir=/etc --disable-plugins"
 
 BBCLASSEXTEND = "native nativesdk"
 
-- 
2.17.1

