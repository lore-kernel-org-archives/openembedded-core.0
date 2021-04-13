Received: from mail-yb1-f202.google.com (mail-yb1-f202.google.com [209.85.219.202])
 by mx.groups.io with SMTP id smtpd.web11.6705.1618305884017039376
 for <openembedded-core@lists.openembedded.org>;
 Tue, 13 Apr 2021 02:24:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@google.com header.s=20161025 header.b=hLGBRUW7;
 spf=pass (domain: flex--krellan.bounces.google.com, ip: 209.85.219.202, mailfrom: 3w2n1yackaaimtgnncpiqqing.eqo@flex--krellan.bounces.google.com)
Received: by mail-yb1-f202.google.com with SMTP id g7so15570246ybm.13
        for <openembedded-core@lists.openembedded.org>; Tue, 13 Apr 2021 02:24:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:message-id:mime-version:subject:from:to:cc;
        bh=7tV4uIQ9PR0Lzdn2WR7CkcYnw3POYtHpYDx1Cnm2F6w=;
        b=hLGBRUW7X1iudjc0OHSIzCQuHOyyTQ/lPngblpKJzqvwq5KrKBGagAH46xxsKRKgOf
         F7MA/7yJYLTPIFQlaWM+GBn27IjKoeSRON5ZkMt29w8rwwJVg0HyPhLEBERJYarR123h
         FEGraf9gDmCKie4v94qX126zSYhtzZSV/Vv0md/wqsKJsSoTIBx3M2fOAuWDAnpoNWoi
         YHEp7475Im0v6GnbNTNLbmWzjmJu5byyuJ5lvV697EQ/I6TkaPvdttjOFY2v8ofjI2h0
         5hP7cRpyIR2izjBcZPsKRI5Bbjm5yV56dIyJeD4STIhHwebR5mY3ukYczl3ZmEST5CHS
         xabg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
        bh=7tV4uIQ9PR0Lzdn2WR7CkcYnw3POYtHpYDx1Cnm2F6w=;
        b=ljV/bUYrQBV+MPzoAAMB3hvi9nMGqC+VfOAC/Q8uP1Fp1wo1ijw8n09wzVNSvOrHyI
         ggjBC/WSBrfqnL3HJxrTCRy0gJ38TvW10fPrZbYGNm6DJjibuLdExhlpibYigyar2gYg
         eBDoEKDFp0qRCFUzWFIH0JN9HFMD2PWyiKnWOStkl0bHqDoP8QN4rmd+cz3tDpzw9ak6
         lpk2V1fIkCWHRZvlIbC8hkQSpoqhr6wv9j+JSJI/MKuodwB3mTX0Z66DWgfkAWII3lfA
         G56Qjrx8HMOolVhC726+iTwwC1r9tdLxUm1Ef8PgeVomvkoT9AMH4ZZRVE14S9VEE2lW
         b+Zg==
X-Gm-Message-State: AOAM531VK6sLAcrICKpq0G20KskZBhbWhwpEEpoTUYEUrP1GBtSD+585
	/1+nsE5k4OHwyvOaUkYQOpgOA52TmPJA/NZnTCRNif1PlryMo7VcLEV2xuKI/n3Nuc2VsJqE0m2
	StVTsCRVKymi1xtDVmLQpvZ1StD7Q5Gt36FC15iHOi3r09q/rXyXNtB9tFuB5gSwQm82mx3gJFn
	wGaU5n702JP2cQ
X-Google-Smtp-Source: ABdhPJzIeQayyhu6zZumPQ/O5/Z0BmCXtKIXLrhWlebclH1nQtqoF8AmmpV0BMa/W27kGBy8+5TMJuYX2Ped
X-Received: from multiball.svl.corp.google.com ([2620:15c:2c5:3:847c:b0ec:1386:15ca])
 (user=krellan job=sendgmr) by 2002:a05:6902:721:: with SMTP id
 l1mr37868915ybt.474.1618305883020; Tue, 13 Apr 2021 02:24:43 -0700 (PDT)
Date: Tue, 13 Apr 2021 02:24:32 -0700
Message-Id: <20210413092432.3688149-1-krellan@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.31.1.295.g9ea45b61b8-goog
Subject: [PATCH] libxcb: Add inherit python3native
From: krellan@google.com
To: openembedded-core@lists.openembedded.org
Cc: Josh Lehan <krellan@google.com>
Content-Type: text/plain; charset="UTF-8"

During compilation, the local Python environment leaks into
the Bitbake build. Adding "inherit python3native" fixes this.

Signed-off-by: Josh Lehan <krellan@google.com>
---
 meta/recipes-graphics/xorg-lib/libxcb_1.14.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-graphics/xorg-lib/libxcb_1.14.bb b/meta/recipes-graphics/xorg-lib/libxcb_1.14.bb
index f0a223a19c..40c7b1cc3c 100644
--- a/meta/recipes-graphics/xorg-lib/libxcb_1.14.bb
+++ b/meta/recipes-graphics/xorg-lib/libxcb_1.14.bb
@@ -24,6 +24,7 @@ PACKAGES_DYNAMIC = "^${PN}-.*"
 FILES_${PN} = "${libdir}/libxcb.so.*"
 
 inherit autotools pkgconfig features_check
+inherit python3native
 
 # The libxau and others requires x11 in DISTRO_FEATURES
 REQUIRED_DISTRO_FEATURES = "x11"
-- 
2.31.1.295.g9ea45b61b8-goog

