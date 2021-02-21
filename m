Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
 by mx.groups.io with SMTP id smtpd.web10.24245.1613934479975074982
 for <openembedded-core@lists.openembedded.org>;
 Sun, 21 Feb 2021 11:08:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=C/pc3SRn;
 spf=pass (domain: gmail.com, ip: 209.85.214.172, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f172.google.com with SMTP id k22so6238707pll.6
        for <openembedded-core@lists.openembedded.org>; Sun, 21 Feb 2021 11:07:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=L5cyEuScJVvwRgHH2d5Il1kdFjU6zUEJdzBcNlcwuPk=;
        b=C/pc3SRnZp+VAlsoFCyWL86lHXD65JRKI3mHaGKdnUsBkcSAQaB0hjKp4VzVCANBsF
         lwTpk02S32YS2W0JgS9eT0xquPuTWSYPwvrznSUYWuLIxy3Z/dqJ2j7jOdor1XZ09dOV
         Vgh0gDqE107KDPmGGlywLEGp1waVYTlt+JzpoqD3oT0wci9CwkSJk4k27D8b2kYdRLBe
         vzOfcdrmO3b6IbMsTzzB1mFLBdXDd7WKc9DBz/XWrRR5+j9xY5p/vVJh/SE+Qor7KTf7
         HrDa5On5RTMRkog7J0xGrF+NNShwF452DRs1nwEOynDHnfFtPxNM62YgQj12g8Qi+I3d
         SU1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=L5cyEuScJVvwRgHH2d5Il1kdFjU6zUEJdzBcNlcwuPk=;
        b=CzdVGFgPdSj7exFcslliE1t7G0pMC1eY5Rk/ESJQMbKxYV+vSHjxyEX/2WUTvxR73N
         sRf8h2hKohO/IAzNqCFedjGbdmSUkxk8m3tuGXhYoHru+r1rXdLyBHMzoi4c0Z887KwC
         F21wuFKOpA1mYqWzlo9TfYpR9Rc2N5MWBh0tXzXGJrI6diOuG5x6wel/vmI5jPM2KaCa
         Z3rFBtF8hIjfaEKyaTipPJgsGNcreGTdAYtmrKw7B8JWm+RLorOKZ6kQR3s5MQ0ii22f
         CEz40yXuuhigfMwhpbFwA9ncY1e7+lrnTNhh2jRUk325En0HEP4xqg8R5IH7aLD8DLv9
         36yg==
X-Gm-Message-State: AOAM533qBO/d/hrZN2SUTK+QoFUs017zTH3KdUy4BZbOGRPess8868rj
	GGdg+QaT2R8Re+PhsaPQpmcLvh+N7eWvUQ==
X-Google-Smtp-Source: ABdhPJy2IS4KsynHD/zm9//aNjNuC9+4zz8gjUFQWCnnepGUtASl4KSU/pLmvjgySi9UsamYxAhdoQ==
X-Received: by 2002:a17:902:d2c9:b029:e1:8692:aa7c with SMTP id n9-20020a170902d2c9b02900e18692aa7cmr11308903plc.21.1613934479203;
        Sun, 21 Feb 2021 11:07:59 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::54b4])
        by smtp.gmail.com with ESMTPSA id 74sm16390918pfw.53.2021.02.21.11.07.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Feb 2021 11:07:58 -0800 (PST)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH v2] glibc: Build for power9 cpu when using powerpc64le tunes
Date: Sun, 21 Feb 2021 11:07:54 -0800
Message-Id: <20210221190754.2010193-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.30.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This makes sure that we can compile glibc for powerp9 based machines
irrespective of endianness or bitness

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
v2: Already had this in tune files so move the change there

 meta/conf/machine/include/tune-power9.inc | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/meta/conf/machine/include/tune-power9.inc b/meta/conf/machine/include/tune-power9.inc
index 81d6e8e9bf..e33536c241 100644
--- a/meta/conf/machine/include/tune-power9.inc
+++ b/meta/conf/machine/include/tune-power9.inc
@@ -28,8 +28,7 @@ TUNE_PKGARCH_tune-ppc64p9le = "ppc64p9le"
 PACKAGE_EXTRA_ARCHS_tune-ppc64p9le = "${PACKAGE_EXTRA_ARCHS_tune-powerpc64le} ppc64p9le"
 
 # glibc configure options to get power9 specific library
-GLIBC_EXTRA_OECONF_powerpc64 += "${@bb.utils.contains('TUNE_FEATURES', 'power9', '--with-cpu=power9', '', d)}"
-GLIBC_EXTRA_OECONF_powerpc += "${@bb.utils.contains('TUNE_FEATURES', 'power9', '--with-cpu=power9', '', d)}"
+GLIBC_EXTRA_OECONF += "${@bb.utils.contains('TUNE_FEATURES', 'power9', '--with-cpu=power9', '', d)}"
 
 # QEMU usermode fails with invalid instruction error
 MACHINE_FEATURES_BACKFILL_CONSIDERED_append = "${@bb.utils.contains('TUNE_FEATURES', 'power9', ' qemu-usermode', '', d)}"
-- 
2.30.1

