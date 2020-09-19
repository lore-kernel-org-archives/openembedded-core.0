Received: from mail-pj1-f65.google.com (mail-pj1-f65.google.com [209.85.216.65])
 by mx.groups.io with SMTP id smtpd.web12.1306.1600474577106452779
 for <openembedded-core@lists.openembedded.org>;
 Fri, 18 Sep 2020 17:16:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=LivbtdOk;
 spf=pass (domain: gmail.com, ip: 209.85.216.65, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f65.google.com with SMTP id md22so4873693pjb.0
        for <openembedded-core@lists.openembedded.org>; Fri, 18 Sep 2020 17:16:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=hju4ERAAS7mG5e475B5I/HrFYsM4Thll3eV5VerwV0Q=;
        b=LivbtdOka6oyVWH0ubtRyYANceX0ep+/MhQzG4sQq1tB3K0jFJf7S+eaBo82miftpT
         iz1Ld/JZtqR7MPwhFd2HWv59/7vm3Kx/i643fHTmoZQJx47abfW8Nl8PUJLgqj4Ik/h6
         NEmLaPJ4B60OY7748fman+5g4+R6wjfgt4rIU7vPm/SWPsvFxj7tiaabe7LI5zvsGKtm
         cRfWQ9FJGZmh5Z/l8lhLmYPUYGhCvRB7odVzHjvRnVA7FzK3Ot/FJ9pENFcylrdZH1wn
         71nOV845la6bvPAuw+gEn7vrgCceyuVWbLPgAa0VuDZ1LQ7Vliu6aRidpciVHhdo4H1t
         NnEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=hju4ERAAS7mG5e475B5I/HrFYsM4Thll3eV5VerwV0Q=;
        b=Rv+1RJGQDtV4NRLiAC4UqbjQDkmThZnUsl7XC1/3iVGoU8OQCeNF0oCkHUuO5lza47
         gFAZkBoeF39zfpXV3TI2kvv+lHXRfoWWBOrsv+JzsnfFChsarpCayuYRL7PXWadsYJO1
         dqE2pL/PzYENqJiEqIQ3Sg5Sb2otue0HBy2vS/gRQpuMRm/PQsQHfg2Y0EocjABxasXg
         PDyii4BeREcU6T1IuV1oRjQNsAxdCwoGX+fN+oDtqFAUYhjU9NfRAvC5YKAS+prfEy+w
         sQl1scf1RURfr5m1DKn2jRbxBAEwtDc4R80jVLLM/KHmYs1DFP1i2E+p/3FoMp0ogasJ
         8wUA==
X-Gm-Message-State: AOAM533z5Ask6K/TQAmMFhnk9vFmaNHCBFUTdtk4M4ugzYJYnHUugTsM
	l1hHdNarwFEPdSIbPWizXA3lnJu/X/s3Uw==
X-Google-Smtp-Source: ABdhPJyo6jioAOyk08qWolVRRL0hFT4V8qgC7If/M8sNS6biT/O6Lrjsj9bLWdJYCkmQWz6jaJyNkQ==
X-Received: by 2002:a17:902:ee0c:b029:d1:8c50:aa63 with SMTP id z12-20020a170902ee0cb02900d18c50aa63mr34945793plb.21.1600474576061;
        Fri, 18 Sep 2020 17:16:16 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::d92c])
        by smtp.gmail.com with ESMTPSA id i25sm4651521pgi.9.2020.09.18.17.16.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2020 17:16:15 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] systemd: Disable support for shadow group
Date: Fri, 18 Sep 2020 17:16:08 -0700
Message-Id: <20200919001608.1241434-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

enabling shadow drags sshd key generation service into boot path and
serial console launch over getty gets delayed until ssh key generation
is done, on slowers platforms eg. non-kvm qemu this can take minutes to
get ssh keys service to finish on first boot.

On qemumips
56.963s sshdgenkeys.service

Disabling shadow, pulls this out of boot chain, and ssh keys are still
generated but this time it will happen when ssh'ing first time into the
machine.

[YOCTO #13646]

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-core/systemd/systemd_246.2.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta/recipes-core/systemd/systemd_246.2.bb b/meta/recipes-core/systemd/systemd_246.2.bb
index af10e4212b..e3a7cd4971 100644
--- a/meta/recipes-core/systemd/systemd_246.2.bb
+++ b/meta/recipes-core/systemd/systemd_246.2.bb
@@ -66,7 +66,6 @@ PACKAGECONFIG ??= " \
     ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'xkbcommon', '', d)} \
     backlight \
     binfmt \
-    gshadow \
     hibernate \
     hostnamed \
     idn \
-- 
2.28.0

