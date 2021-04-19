Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
 by mx.groups.io with SMTP id smtpd.web09.9452.1618840816800264005
 for <openembedded-core@lists.openembedded.org>;
 Mon, 19 Apr 2021 07:00:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=ZF4kd1RA;
 spf=pass (domain: gmail.com, ip: 209.85.160.172, mailfrom: paulo.zaneti@gmail.com)
Received: by mail-qt1-f172.google.com with SMTP id d6so7817055qtx.13
        for <openembedded-core@lists.openembedded.org>; Mon, 19 Apr 2021 07:00:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=t+H/Rng31hSsc6+qSG3BWr6NF9ZI5VU0kT6vf56i27k=;
        b=ZF4kd1RAbIIx5r30esJL64ERmOyjkaOoTxHLoJ6OKQ/PRJ5RYmML5B1Yjev7U8j1QU
         50v5fyQO9y/gYGA3QGJugTBiaYuJg1QH0W7m2YpSgGx/7T2q3ufQbw+O/cSTXQS5cyXx
         9CgKzccUw4dMGaGRb5UJhaalsvliHSGCLk5g+aNts6w03rfaCFC/z9pQ+wTfBSae5Yo+
         57NrRJ1IJWr0+ttrX+Uka9HgLL/L0vJ6EWv6WQNGVAN0UxI/Zpssbu+BT7L13PzrRhOL
         3DSOtd9Gegh9T8KsEeVnVc1wvrCHaexUZWlVloarXLKu8Lbl24hJmUG1Fi8Mrl0kofTK
         9SAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=t+H/Rng31hSsc6+qSG3BWr6NF9ZI5VU0kT6vf56i27k=;
        b=UKgIwpBWTpO/z61IlpGZpsiDYLGOt7hO8viCh+3e4JV/o8BpE1vdLsm5HFr+AVPXvr
         a9IC5/162OKk/NPJ0nWEK9dbPDgziMh/0xwMW4qrb/lp748E/PB2L4VgW7wCazmiGd2m
         DynhY2kiUb0lFhrbSBV5dIBJcHOV5pH5aqiFEMIkfnR7hT+QOudsjHmK1Ir0LKo1rJja
         nKYAD8xTn6tDml6MecY7ZLlOmF2fAfcT7+LjpFCC7Xp33E95q2btKzSg9hk1gGNbdZ8c
         /yvA3JOFxeQwkDce+MMBTa217pSMAm7GbOBi5E+ASHyCcznXxNo6h62ODWkLyAC35/Bt
         hinA==
X-Gm-Message-State: AOAM530leTud9e0x99A/F+ueJ7hbTXjJ/6QsXwWoHDcMI7b1Be/2W3gQ
	Avvcp9qSZSMYSbgoxaE+YQRPGEntmHGxVHqH
X-Google-Smtp-Source: ABdhPJxIZohINL4k7SP5rYJ3wxJqseNtHrt1JM/BFsYgbcVU4O0GvV6nTqFxe1EAKdR5XRHxlcj48w==
X-Received: by 2002:a05:622a:1208:: with SMTP id y8mr12168839qtx.215.1618840815728;
        Mon, 19 Apr 2021 07:00:15 -0700 (PDT)
Return-Path: <paulo.zaneti@gmail.com>
Received: from localhost.localdomain ([2804:d55:6127:1900:309b:fce7:9959:4286])
        by smtp.gmail.com with ESMTPSA id o189sm9889589qkd.60.2021.04.19.07.00.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Apr 2021 07:00:15 -0700 (PDT)
From: "Paulo Cesar Zaneti" <paulo.zaneti@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: alex.kanavin@gmail.com,
	richard.purdie@linuxfoundation.org,
	Paulo Cesar Zaneti <paulo.zaneti@gmail.com>
Subject: [PATCH v2] perl: fix startperl configuration option for perl-native
Date: Mon, 19 Apr 2021 10:55:55 -0300
Message-Id: <20210419135554.1154646-1-paulo.zaneti@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Unlike vanilla Perl "Configure" script, perl-cross "configure" does not
derive "startperl" from "bin". It instead derives from "perlpath".

This patch aims to fix "startperl" configuration option for perl-native by
correctly setting "perlpath" on perl-cross "configure" script.

It also changes do_install_append_class-native task to comply with
cpan_do_install task.

Signed-off-by: Paulo Cesar Zaneti <paulo.zaneti@gmail.com>
---
 meta/recipes-devtools/perl/perl_5.32.1.bb | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/perl/perl_5.32.1.bb b/meta/recipes-devtools/perl/perl_5.32.1.bb
index b28040c7fb..73d66f6656 100644
--- a/meta/recipes-devtools/perl/perl_5.32.1.bb
+++ b/meta/recipes-devtools/perl/perl_5.32.1.bb
@@ -95,6 +95,7 @@ do_configure_class-nativesdk() {
 do_configure_class-native() {
     ./configure --prefix=${prefix} \
     -Dbin=${bindir}/perl-native \
+    -Dperlpath=${bindir}/perl-native/perl \
     -Duseshrplib \
     -Dsoname=libperl.so.5 \
     -Dvendorprefix=${prefix} \
@@ -171,8 +172,8 @@ do_install_append_class-native () {
     create_wrapper ${D}${bindir}/perl-native/perl PERL5LIB='$PERL5LIB:${STAGING_LIBDIR}/perl5/site_perl/${PV}:${STAGING_LIBDIR}/perl5/vendor_perl/${PV}:${STAGING_LIBDIR}/perl5/${PV}'
 
     # Use /usr/bin/env nativeperl for the perl script.
-    for f in `grep -Il '#! *${bindir}/perl' ${D}/${bindir}/*`; do
-            sed -i -e 's|${bindir}/perl|/usr/bin/env nativeperl|' $f
+    for f in `grep -Il '#! *${bindir}/perl-native.*/perl' ${D}/${bindir}/*`; do
+            sed -i -e 's|${bindir}/perl-native.*/perl|/usr/bin/env nativeperl|' $f
     done
 }
 
-- 
2.25.1

