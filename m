Received: from mail-ot1-f47.google.com (mail-ot1-f47.google.com [209.85.210.47])
 by mx.groups.io with SMTP id smtpd.web11.2578.1615661537679247985
 for <openembedded-core@lists.openembedded.org>;
 Sat, 13 Mar 2021 10:52:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=CBF3fN5G;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.47, mailfrom: steve@sakoman.com)
Received: by mail-ot1-f47.google.com with SMTP id v24-20020a9d69d80000b02901b9aec33371so3142821oto.2
        for <openembedded-core@lists.openembedded.org>; Sat, 13 Mar 2021 10:52:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=FACWAws+qI3+65AUliKc4uJnK3vCKJD0tTOJnYuWATQ=;
        b=CBF3fN5GAnrl7IfoxkJct30I7/6eSAZJV+ZJ9pF1WUSWfeJDI3CV0C9Emt+jXo59zK
         k1Xho1v/xadlKHvzl0qkyRwsMvjg26tuLepo9Vo+dobRrW+cqkcY8DDmzMtV6gfX6Pur
         HB7r53OSxbJsSOt24Q/nLBbF0p2glI8oDXcXKWwtUTTEZSn3S8WwOnW6i8vL7CP8ccQU
         ESUNw+DFwa4Guh2SnD+49Vw3cDhD1/5h8EFsz9DJG1Ylj/BA5QqYkAOVDiYXIE+71JhH
         Cm8ITlWecQkT9kOs2Qb+K8PGcfDrX8jz9yQaf8QDQnRD/8E/y8QYwO51Da5/91LO3yAQ
         vdtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=FACWAws+qI3+65AUliKc4uJnK3vCKJD0tTOJnYuWATQ=;
        b=Bzo03sP3ni1aXU9r6m7tKizP5blbQOd0agAWmoJtRPtjMa8Alffpac+He5prCjS2b0
         3bmOjxj0zUXt7+WQ9kViP968JjMpcfinbSAtDGPKoydgRblxw6qPVYvdEwlraRKf2jtn
         HkoIHCozVcTuh6MIGXNRRu6+lOaCJ746aQ709x/Bn60ZnZL6g1a9qYcBqL1LC0/fVXFU
         fT5G1KuRMRS3tmI52/Xk6Zi6emkz08bbEGz7RFh4rpSGer5MRZKM1XuF5Rg+q+dlo+xz
         aCWwks10Nk8u5ll7yM6Ed2aBPahJPdUu82YafraV5QDBq1tqvt+wQkeAwI9GPnyKKUOc
         Pb0g==
X-Gm-Message-State: AOAM531G0EycDID5hceObqRqx+CzKAyfG6avLR4EaJqiaqO5l1lI0vz2
	rAmuPKD6WXRaN0e/jYjdgXDukKJQ4WQ2Onn3
X-Google-Smtp-Source: ABdhPJxhna4htPMuqgG1M6voiCkKb/XvUVFEU4lvGhcyMs2sDfqs2w/17LTOnmMpeY0LCIRBhBMsvQ==
X-Received: by 2002:a9d:2062:: with SMTP id n89mr7968517ota.297.1615661536468;
        Sat, 13 Mar 2021 10:52:16 -0800 (PST)
Return-Path: <steve@sakoman.com>
Received: from localhost.localdomain ([72.173.249.164])
        by smtp.gmail.com with ESMTPSA id d1sm3765385oth.13.2021.03.13.10.52.13
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Mar 2021 10:52:16 -0800 (PST)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 29/38] valgrind: Increase timeout duration 30 -> 90 s
Date: Sat, 13 Mar 2021 08:49:18 -1000
Message-Id: <ab87c49321a5511060fea6ebff2ffee847f014c0.1615661221.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1615661221.git.steve@sakoman.com>
References: <cover.1615661221.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Yi Fan Yu <yifan.yu@windriver.com>

Attempt to fix intermittent failure of `drd/tests/std_list`
Locally tested to take around 45 s on qemuarm64

[YOCTO #14228]

Signed-off-by: Yi Fan Yu <yifan.yu@windriver.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit aac00b1c8042e41cd6bb1aea8e3033a1c6dd2b05)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 ...Modify-vg_test-wrapper-to-support-PTEST-formats.patch | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/valgrind/valgrind/0005-Modify-vg_test-wrapper-to-support-PTEST-formats.patch b/meta/recipes-devtools/valgrind/valgrind/0005-Modify-vg_test-wrapper-to-support-PTEST-formats.patch
index 7985308e41..0c399ef52c 100644
--- a/meta/recipes-devtools/valgrind/valgrind/0005-Modify-vg_test-wrapper-to-support-PTEST-formats.patch
+++ b/meta/recipes-devtools/valgrind/valgrind/0005-Modify-vg_test-wrapper-to-support-PTEST-formats.patch
@@ -19,6 +19,11 @@ Upstream-Status: Pending
 Signed-off-by: Dave Lerner <dave.lerner@windriver.com>
 Signed-off-by: Tudor Florea <tudor.florea@enea.com>
 Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
+
+Increase time limit to 90 s.
+(double of the expected time of drd/tests/std_list on qemuarm64)
+
+Signed-off-by: Yi Fan Yu <yifan.yu@windriver.com>
 ---
  tests/vg_regtest.in | 75 +++++++++++++++++++++++++++++++++++++++--------------
  1 file changed, 55 insertions(+), 20 deletions(-)
@@ -66,7 +71,7 @@ index a441f42..cb05b52 100755
  # Since most of the program time is spent in system() calls, need this to
  # propagate a Ctrl-C enabling us to quit.
 -sub mysystem($) 
-+# Enforce 30 seconds limit for the test.
++# Enforce 90 seconds limit for the test.
 +# This resume execution of the remaining tests if valgrind hangs.
 +sub mysystem($)
  {
@@ -76,7 +81,7 @@ index a441f42..cb05b52 100755
 +    my $exit_code=0;
 +    eval {
 +        local $SIG{'ALRM'} = sub { die "timed out\n" };
-+        alarm(30);
++        alarm(90);
 +        $exit_code = system($_[0]);
 +        alarm (0);
 +        ($exit_code == 2) and die "SIGINT\n";   # 2 is SIGINT
-- 
2.25.1

