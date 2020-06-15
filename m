Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
 by mx.groups.io with SMTP id smtpd.web12.26539.1592249765708150838
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Jun 2020 12:36:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=OxacWuA+;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.178, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f178.google.com with SMTP id 10so8245524pfx.8
        for <openembedded-core@lists.openembedded.org>; Mon, 15 Jun 2020 12:36:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=aHa69ltPK/nFtT4XKHkjW4+6OoYfaeq+NTgLZ8TfECU=;
        b=OxacWuA+0Ajae0cfF92enPQAmjag4e70hJSiBqZO7UsYKe7WXspNs1FDaSboPsHtum
         vEzNfiOXqjY/uDh6oXXNQaGHm+Ynk60370PBPts+FIxSsPn4YSE2KQkW0SmwJcouUuC9
         oSbbA2hwk9s+/Q9FMTsJKPdzs7L60rhvZx/0ZAPqRwWCFmhaQ9gbwDpF6hO6ByC+2cbp
         cwAA2bAcpV19tZKz5NSk5UgzZFTPhl/tPjw//0axlciKAzaRFs5xs3ZI63p0Uo9zsFTE
         z1G54RoIB0g3aU2CapVPw8MS+voB5nGQmMzwqfn8Lv5b1H+9yS6Qucpap6TiEDKHJJ8C
         V0tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=aHa69ltPK/nFtT4XKHkjW4+6OoYfaeq+NTgLZ8TfECU=;
        b=iC2Sx4DBD06Bj/DhqmK7ipdZI9PzPqK67xqw42L+Ji2xbxA1Hn+l1zJB1tA+zCt8Nv
         1nG4YHnpAlqycfI5Zd1AsJo338uRfetJYWJRKWrENCuUVhk6kUMoofVogicSpvcY+E1y
         diLo2LFnXs4kMvgZGA1bIfWTkDi88FGBN02Ie2dyFZHyBx5gCMAM1kbQ1GpS2YZJutIa
         +1BfVS30Kcsbug9gbKWMId9TQXMI9bncABX9ZKuoywiRaSXKo+8mz05BRybiP7I0Uu7W
         c1MLI2/SMKqCe+JJbc80fHTDYMKrwZ9TzbM5LenR24yQovQ+TDoN0zpliptnyQxTpRkB
         LLLQ==
X-Gm-Message-State: AOAM530FCNRdoY64n+rJFgnniQiKeKNeCUhqnsqcL6u0Ej3F8bznX9yd
	1VSubYTP9Pwvwmp9JMU+KayIMc0spXE=
X-Google-Smtp-Source: ABdhPJxYLsMzR/BeRC017/6VTL23O5GVad1fha+mz9nnM5i4fxussMgDXfSGjIKbMEKm2T/dD4shsA==
X-Received: by 2002:aa7:9d02:: with SMTP id k2mr24767042pfp.288.1592249764595;
        Mon, 15 Jun 2020 12:36:04 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id u1sm12405492pgf.28.2020.06.15.12.36.03
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2020 12:36:04 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 02/21] ltp: Exclude the memcg_stress tests due to timeout problems
Date: Mon, 15 Jun 2020 09:35:21 -1000
Message-Id: <074adb507928310af5b38f82ba3f20d9f55f4433.1592249381.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1592249381.git.steve@sakoman.com>
References: <cover.1592249381.git.steve@sakoman.com>

From: Richard Purdie <richard.purdie@linuxfoundation.org>

This test runs for 900s, we often see tests killed after 300s without
output which makes the test results unreliable and inconsistent. The
easiest solution for now is to skip this long running test, patching
it out wth sed.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 0739a8901140c05d037517ffd89382f151ba627c)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-extended/ltp/ltp_20200120.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/recipes-extended/ltp/ltp_20200120.bb b/meta/recipes-extended/ltp/ltp_20200120.bb
index deac3917d7..b25da4030d 100644
--- a/meta/recipes-extended/ltp/ltp_20200120.bb
+++ b/meta/recipes-extended/ltp/ltp_20200120.bb
@@ -74,6 +74,10 @@ do_install(){
          -e 's@[^ ]*-fdebug-prefix-map=[^ "]*@@g' \
          -e 's@[^ ]*-fmacro-prefix-map=[^ "]*@@g' \
          -e 's@[^ ]*--sysroot=[^ "]*@@g' 
+
+    # The controllers memcg_stree test seems to cause us hangs and takes 900s
+    # (maybe we expect more regular output?), anyhow, skip it
+    sed -e '/^memcg_stress/d' -i ${D}${prefix}/runtest/controllers
 }
 
 RDEPENDS_${PN} = "\
-- 
2.17.1

