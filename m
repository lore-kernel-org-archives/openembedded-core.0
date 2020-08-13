Received: from mail-io1-f66.google.com (mail-io1-f66.google.com [209.85.166.66])
 by mx.groups.io with SMTP id smtpd.web10.461.1597279031091195867
 for <openembedded-core@lists.openembedded.org>;
 Wed, 12 Aug 2020 17:37:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=tBzP40f/;
 spf=pass (domain: gmail.com, ip: 209.85.166.66, mailfrom: jpewhacker@gmail.com)
Received: by mail-io1-f66.google.com with SMTP id t15so5469429iob.3
        for <openembedded-core@lists.openembedded.org>; Wed, 12 Aug 2020 17:37:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=pqPO+2dZBpggtSUnQQtH02aJY350jTUct9BjtKenEvU=;
        b=tBzP40f/Y+lhltrofrpm8SJbk8StnRoRIwpvqqMJWB628BVYpm3t49LSW1a0CVq9SV
         1VrF3j9Ro/C9iRJOgFIXbYpE1O5RKHUumUinNt+oZAOaL0Mma9t9fPbI9Iwb8TOxonKi
         fL/ZC5h+IcnSO5J//xCIU+lWnlmgSYXnTiwntmHBDXzmuETd4vAcYNEbuVd9O9pq17JN
         y2flSKdRYktC3yX7H8BZIvaSVuBogkRNrrim1PU718kkcVc2AwygwWH1eXiqlu+USvQc
         UwPNHQL3j0CiTHZkacILS7Y14Yd5AjJsL/azmSqZ0DAOyFZXytEMdKh+R+5nTYtYmdAi
         bRvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=pqPO+2dZBpggtSUnQQtH02aJY350jTUct9BjtKenEvU=;
        b=d9pd8J8O5w/31nCs1iv+S3OHm2zJ1RycLdWLdkQhmITr47As3kDND8EEAtpcnIz5ua
         swtw1Mf1hA1vaXUYVqukBfwCJuzeQcUPbfQOJ0aSySzfAKd/HmEOZSL95nyGwV/s9PC8
         mP8UvdGbkShOBmndmhphKPsmnwydHSwIRM9S55yBSbl1zsTx6kfA2SLXo8XIKWEfL0on
         sdUW/vvhlw0SOJpM8g1pdbthMGqTV30+JAhT29LaZXutUuG/D76xIwm8aOyUesAxlNKj
         9av+j/ZqQ0rkXQeCtS6Ijcfnea7FodXIzhQ4QIYWCFe2omF1R9ja2fyxM2k28i4uDZL0
         h/Rw==
X-Gm-Message-State: AOAM530XnR+lQ/TcD6Tv8/hct6rG1JUaE6DyW+Mk9gOCN6cKH/qwySuL
	w9DJ1pAmoE5OIGF+a6FSAbNH7JF4
X-Google-Smtp-Source: ABdhPJzaPn8gfN69GvpAJeSiaSeP3c2JAHj9btnF7YSkw/Plft3XQOq28W5zyn+7TdUW+1tSR6LWHw==
X-Received: by 2002:a05:6602:2409:: with SMTP id s9mr2242838ioa.98.1597279030137;
        Wed, 12 Aug 2020 17:37:10 -0700 (PDT)
Return-Path: <jpewhacker@gmail.com>
Received: from localhost.localdomain ([2605:a601:ac3d:c100:408c:6846:c099:4d90])
        by smtp.gmail.com with ESMTPSA id w7sm1895096ilo.17.2020.08.12.17.37.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Aug 2020 17:37:09 -0700 (PDT)
From: "Joshua Watt" <JPEWhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: richard.purdie@linuxfoundation.org,
	Joshua Watt <JPEWhacker@gmail.com>
Subject: [OE-core][PATCH] perl: Add check for non-arch Storable.pm file
Date: Wed, 12 Aug 2020 19:37:03 -0500
Message-Id: <20200813003703.9702-1-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Under unknown conditions, Storable.pm will be placed in the base library
directory instead of under the arch specific one. This causes build
issues, see https://bugzilla.yoctoproject.org/show_bug.cgi?id=13946. To
try and catch this happening, add an explicit check for the bad file
existing and fail the build if it is found.

[YOCTO #13946]

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 meta/recipes-devtools/perl/perl_5.32.0.bb | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta/recipes-devtools/perl/perl_5.32.0.bb b/meta/recipes-devtools/perl/perl_5.32.0.bb
index c10ce12303..bba8263b90 100644
--- a/meta/recipes-devtools/perl/perl_5.32.0.bb
+++ b/meta/recipes-devtools/perl/perl_5.32.0.bb
@@ -139,6 +139,11 @@ do_install() {
     # Fix up shared library
     rm ${D}/${libdir}/perl5/${PV}/*/CORE/libperl.so
     ln -sf ../../../../libperl.so.${PERL_LIB_VER} $(echo ${D}/${libdir}/perl5/${PV}/*/CORE)/libperl.so
+
+    # Try to catch Bug #13946
+    if [ -e ${D}/${libdir}/perl5/${PV}/Storable.pm ]; then
+        bbfatal 'non-arch specific Storable.pm found! See https://bugzilla.yoctoproject.org/show_bug.cgi?id=13946'
+    fi
 }
 
 do_install_append_class-target() {
-- 
2.27.0

