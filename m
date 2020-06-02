Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com [209.85.221.66])
 by mx.groups.io with SMTP id smtpd.web10.2837.1591123041285686602
 for <openembedded-core@lists.openembedded.org>;
 Tue, 02 Jun 2020 11:37:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=tKVAHvsF;
 spf=pass (domain: gmail.com, ip: 209.85.221.66, mailfrom: schnitzeltony@gmail.com)
Received: by mail-wr1-f66.google.com with SMTP id x6so4376994wrm.13
        for <openembedded-core@lists.openembedded.org>; Tue, 02 Jun 2020 11:37:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=y5209KujADE/3hBSVD9GNcgjZk7hgExnw7SJww3GRWE=;
        b=tKVAHvsFIap6G7nNXIAZf3TNAQ6tUpS8HqHkNdbk1Bm1uhHM7yJvKvP0OWM+Jtzate
         0UXU7/I40Cn2HDCLYiZTPaqbtXjeTRDQMWI2T/OPYiD8dy1lp2s7Xt1GT6Tw/fsWzSkz
         ejdNHaia+5ULKGxgahqq2d17vrmMG5rdkT/grBDU2dZZfvvekgNDa8y1uJJq2pRTs+M2
         PJHgtamU6jbqUGd6uTrycL1tjaxuyJ/z2Xv7gdaH0A+JkZtyz472yJHHnQ7XrZMHDDfP
         s6kkP33xt8tXsL+IAdBwcxdLjCLIy9TufNfa8cdLuSE+dGBlXdh8gNR7Np638ig7iU/H
         475Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=y5209KujADE/3hBSVD9GNcgjZk7hgExnw7SJww3GRWE=;
        b=GGWMwviqLGJe7XwOfbrZxA/+69ugQGYEuCR7zEOMoaq10I3V/E/ETdK7f2/0EF4vMW
         NQDvDmRLeAPSNFeOkKJsdwA912HF2w6PmVobR0nozbgB/b/9o1QA8QYcwiChekPFcIsn
         +ta268otQm8aOBGuPzS4hxaeu55lcpTNXgFTiqSyvBEHlfYHrKVpuh+vZMMu4nCeLjuc
         vIZcZ3sJwyprBTtSP9rovPE0kfl4MmFT6Po3tHpbsT7RgK6QenLcSQl5PBERZu8bbi+S
         Bu3NJvyvjyB/CAbvEbgVS1b5UaPfcsnPhKjTmEoJl5pop/5babvRNSVrN3Nls3dvdrXL
         xAVw==
X-Gm-Message-State: AOAM530AupiP1N2Ba6WG46dQkwfINUVSxccncF0+JPmUaW83gfL3fokL
	57aR1i2jpnmwBmLwkkV3NIqbsiubIUc=
X-Google-Smtp-Source: ABdhPJzhfF3yTyHhXCyNyaDb7N2MPa3qNCkRfG+1lk1H9fk2N5RzphGfNGr5IlV6Tahdk3SueAdaqw==
X-Received: by 2002:adf:f552:: with SMTP id j18mr26120033wrp.279.1591123039421;
        Tue, 02 Jun 2020 11:37:19 -0700 (PDT)
Return-Path: <schnitzeltony@gmail.com>
Received: from superandy.speedport.ip (p200300f07f06ad19b59162420908e7d4.dip0.t-ipconnect.de. [2003:f0:7f06:ad19:b591:6242:908:e7d4])
        by smtp.gmail.com with ESMTPSA id c65sm832961wme.8.2020.06.02.11.37.18
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jun 2020 11:37:18 -0700 (PDT)
From: =?UTF-8?B?QW5kcmVhcyBNw7xsbGVy?= <schnitzeltony@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] vte: Pack ${libexecdir}/vte-urlencode-cwd to vte-prompt
Date: Tue,  2 Jun 2020 20:37:10 +0200
Message-Id: <20200602183710.23327-1-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.21.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Have vte-prompt in my images. Since upgrade 0.60.2 all terminals complain with:

| bash: /usr/libexec/vte-urlencode-cwd: No such file or directory

Grepping sources shows that vte.csh and vte.sh are the only callers of
vte-urlencode-cwd. Both are installed by vte-prompt so move vte-urlencode-cwd
where it's used.

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 meta/recipes-support/vte/vte_0.60.2.bb | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-support/vte/vte_0.60.2.bb b/meta/recipes-support/vte/vte_0.60.2.bb
index 4a33f6e4d0..8c7054913f 100644
--- a/meta/recipes-support/vte/vte_0.60.2.bb
+++ b/meta/recipes-support/vte/vte_0.60.2.bb
@@ -52,6 +52,9 @@ CFLAGS += "-D_GNU_SOURCE"
 
 PACKAGES =+ "libvte ${PN}-prompt"
 FILES_libvte = "${libdir}/*.so.* ${libdir}/girepository-1.0/*"
-FILES_${PN}-prompt = "${sysconfdir}/profile.d"
+FILES_${PN}-prompt = " \
+    ${sysconfdir}/profile.d \
+    ${libexecdir}/vte-urlencode-cwd \
+"
 
 BBCLASSEXTEND = "native nativesdk"
-- 
2.21.3

