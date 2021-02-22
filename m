Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
 by mx.groups.io with SMTP id smtpd.web09.29490.1613957320383642115
 for <openembedded-core@lists.openembedded.org>;
 Sun, 21 Feb 2021 17:28:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=ffVanM8s;
 spf=pass (domain: gmail.com, ip: 209.85.214.176, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f176.google.com with SMTP id a24so6720134plm.11
        for <openembedded-core@lists.openembedded.org>; Sun, 21 Feb 2021 17:28:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=sKwMI7l6aVkZfmcPAhBuEMyq196llOGODHTM9JXgNi8=;
        b=ffVanM8sxvqHkT+IALoWfEFTXQ04xNVzW7mP+OMASq9YmDX/OEPJwKYUuAh6c4RTTz
         LfgFyCrf2klY3MiHMOVwUaTASw0fQVpddtMWZHOd8Pi2uqXLe1fTF18FCixnRonaFBux
         wktjiQXGG+uac4mQHl4siJCmE8UB8VRF3xYyD/eKb9o5y2t6WlhLxIbs23gBYb7eAu9O
         VIuuYajnUDm9X5yfBQPLPySNulkUhZpZeRdmin3XE+9kOCKRN21Bs4ERrrSxRR5AK8/5
         NYrLwQfEVh8y55+qsALictfCWYHS5KCiWTPzSYvmYIQ/y4cOtwGgRCpd+mncPZYnVVn8
         eGXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=sKwMI7l6aVkZfmcPAhBuEMyq196llOGODHTM9JXgNi8=;
        b=B5koSScGhmG4WO3fnZJIPFhW6sHySqUZGuXgDuubI0KMUJHw8EcVrKL3Bmsb6+/lxK
         WaJstyRMN+MSCHYWPMbIbA5yakCSFrDqgkCgOdT8VPWcJ4wxy4Gmmn+m8S1pnkl4Rzs8
         hyl+qxXya2gZFMsc8osY+9zlHDi099rhtgCF6fzXq7KVdN/sddMXPJw/aCv+v20KulLb
         AK9x78zfQkRs0js17kPJhBGPNWY5GJe2pGLqJV0T1Ll9tV3AKiRIuPAu8n/GWuhDzDLe
         xNIdach1HPLXHZpjQ0UL/Tyr4WrkQ1s6Ygbej3sgNxprTcHKJhYMO6KNsoTyhyIMOgZs
         MPSA==
X-Gm-Message-State: AOAM533DPD6q32kIlyfcbgh5Xk8StWJ6eIPFhOvN8xRkHIT3naAlNUEe
	lG/Pwm6gZs7yg1R0Ih0SRWCamgP7XUyHkw==
X-Google-Smtp-Source: ABdhPJw+ut6JqOcGIqNUK6DMiDAsO7ld/4cSH3GaAugN7UBQqAxUwS5yK3soTJvmiU7MhIMi7iyqAw==
X-Received: by 2002:a17:902:ced2:b029:e2:8db8:266f with SMTP id d18-20020a170902ced2b02900e28db8266fmr19894240plg.34.1613957319627;
        Sun, 21 Feb 2021 17:28:39 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::54b4])
        by smtp.gmail.com with ESMTPSA id i18sm1338439pfo.16.2021.02.21.17.28.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Feb 2021 17:28:39 -0800 (PST)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 1/2] tune-power9: Enable qemu-usermode
Date: Sun, 21 Feb 2021 17:28:35 -0800
Message-Id: <20210222012836.1521120-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.30.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

With latest qemu it works ok

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/conf/machine/include/tune-power9.inc | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/meta/conf/machine/include/tune-power9.inc b/meta/conf/machine/include/tune-power9.inc
index e33536c241..401b73744f 100644
--- a/meta/conf/machine/include/tune-power9.inc
+++ b/meta/conf/machine/include/tune-power9.inc
@@ -29,6 +29,3 @@ PACKAGE_EXTRA_ARCHS_tune-ppc64p9le = "${PACKAGE_EXTRA_ARCHS_tune-powerpc64le} pp
 
 # glibc configure options to get power9 specific library
 GLIBC_EXTRA_OECONF += "${@bb.utils.contains('TUNE_FEATURES', 'power9', '--with-cpu=power9', '', d)}"
-
-# QEMU usermode fails with invalid instruction error
-MACHINE_FEATURES_BACKFILL_CONSIDERED_append = "${@bb.utils.contains('TUNE_FEATURES', 'power9', ' qemu-usermode', '', d)}"
-- 
2.30.1

