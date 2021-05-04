Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.web12.6993.1620140175429727637
 for <openembedded-core@lists.openembedded.org>;
 Tue, 04 May 2021 07:56:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=YKs6rR9I;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.47, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f47.google.com with SMTP id m9so9787767wrx.3
        for <openembedded-core@lists.openembedded.org>; Tue, 04 May 2021 07:56:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=I0xr50tSfBP/tK0ukVgRSyUmw8W+YN8YNZ2mcQiCRFY=;
        b=YKs6rR9IX/8VdbprPtrUxrjI01UimzZe2BgV7dKQ1Pyz3Lc5OaT+gwisdwiAzMWLPg
         28RlCQ3uhik1HA+ccy7ed0XK2DPTKEYicLXheJVvx4vPLF+4TYg+N+ELuVIYgV8KR/ZF
         yaGtQqv7lUPwUBSn+Gl3glgbCKmlOpRihvLTQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=I0xr50tSfBP/tK0ukVgRSyUmw8W+YN8YNZ2mcQiCRFY=;
        b=ZeMrf9c3CzslZaaFG2vkwqUPO1dUMOBjfT6u5aBUUa11u2qFqHggAgCqSebWSXAQoA
         Q7poeoFI9wHX8jF3F7N92zFp80WAYdvI6sCAPT4kAhXDobyFSC/511zTvzFVuAoj7Zer
         Fe6VA1Qm6o02IIc0TcxAN/qzctWzKGEhNGsOm6TO937oRmRuL8rT2fI4qsq8PipvJIZ2
         VSxdzwWKGH7P3fS01SvvR+k770bZ0vQ9HUpEaE4HQEZFtQr+6XWDzIfpm/z5pK7DUEho
         zvjoygDURMO9/BrQ1a3JrZdQ0f7SiOyL02IbCdc0ynIXzSg20BpTMhENXb8cPhN+YzcE
         0ERA==
X-Gm-Message-State: AOAM532exmTgJ3W2vghiLpi579sYt98mG37qesZVQDKqAj+TnuZPwo9o
	5Y/4LEoYjbdchTk+Gi4MjOayn6Uz2R0Q/A==
X-Google-Smtp-Source: ABdhPJzTi6zHW9myT1sWxqJDbRNfgNbBcu3fpXq9rHurKpRUbNJJ6gBGjghbzMS2wtfNfQX1XZTOtw==
X-Received: by 2002:a05:6000:136b:: with SMTP id q11mr32266936wrz.350.1620140173536;
        Tue, 04 May 2021 07:56:13 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:bb9:ef1f:254c:99f5])
        by smtp.gmail.com with ESMTPSA id q12sm1870961wmj.7.2021.05.04.07.56.13
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 May 2021 07:56:13 -0700 (PDT)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] Revert "perl: fix startperl configuration option for perl-native"
Date: Tue,  4 May 2021 15:56:12 +0100
Message-Id: <20210504145612.1930840-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This reverts commit f2d1523b19cb066a4a06609f036822fe4a8b43f0.

We've reports of a number of failures from this, it causes pod2man to
reference full paths to perl rather than nativeperl from the environment.
I've also seen this issue locally now. Revert until we can find a solution
which works for everyone.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-devtools/perl/perl_5.32.1.bb | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-devtools/perl/perl_5.32.1.bb b/meta/recipes-devtools/perl/perl_5.32.1.bb
index 73d66f66568..b28040c7fb0 100644
--- a/meta/recipes-devtools/perl/perl_5.32.1.bb
+++ b/meta/recipes-devtools/perl/perl_5.32.1.bb
@@ -95,7 +95,6 @@ do_configure_class-nativesdk() {
 do_configure_class-native() {
     ./configure --prefix=${prefix} \
     -Dbin=${bindir}/perl-native \
-    -Dperlpath=${bindir}/perl-native/perl \
     -Duseshrplib \
     -Dsoname=libperl.so.5 \
     -Dvendorprefix=${prefix} \
@@ -172,8 +171,8 @@ do_install_append_class-native () {
     create_wrapper ${D}${bindir}/perl-native/perl PERL5LIB='$PERL5LIB:${STAGING_LIBDIR}/perl5/site_perl/${PV}:${STAGING_LIBDIR}/perl5/vendor_perl/${PV}:${STAGING_LIBDIR}/perl5/${PV}'
 
     # Use /usr/bin/env nativeperl for the perl script.
-    for f in `grep -Il '#! *${bindir}/perl-native.*/perl' ${D}/${bindir}/*`; do
-            sed -i -e 's|${bindir}/perl-native.*/perl|/usr/bin/env nativeperl|' $f
+    for f in `grep -Il '#! *${bindir}/perl' ${D}/${bindir}/*`; do
+            sed -i -e 's|${bindir}/perl|/usr/bin/env nativeperl|' $f
     done
 }
 
-- 
2.30.2

