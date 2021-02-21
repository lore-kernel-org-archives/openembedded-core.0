Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
 by mx.groups.io with SMTP id smtpd.web09.18090.1613894591234214139
 for <openembedded-core@lists.openembedded.org>;
 Sun, 21 Feb 2021 00:03:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=YMwaAwP7;
 spf=pass (domain: gmail.com, ip: 209.85.216.45, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f45.google.com with SMTP id l18so6772215pji.3
        for <openembedded-core@lists.openembedded.org>; Sun, 21 Feb 2021 00:03:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=QyRCs9Xy9zlRCTV9y83URabMe3WmW0YNZVLr6XP+U4c=;
        b=YMwaAwP7JMv8w7ui9Y3awqTtChjGB2nC+RqgmAzFCzpGjPPASv9NoT2izSAgyAXkjp
         0UPh3f1DinjaGNr2EFxu5oupnWldxGbo3ut4C/uw0Ng3gczNOB9FJqJCLTrbSXfBuWZb
         ZB6XvbPYaJERuqyoqa5K8ilCyQEosn5ewC5O6ZQAEPz4pUsxMi7YNMx1LtRLPXKXIf30
         lPI3HsKxNKymwxh8KojKa++6UzC0eNTRNRA4x6DEPwQRKlEvvoCQnxczn1PnR1OTf6jx
         +W8mMMbhLAgApV3d+zybpPkibqNDR/7aSoFtiHUv4xEUgR6p613yrQh+s+YMUx8Y2Qgg
         o6Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=QyRCs9Xy9zlRCTV9y83URabMe3WmW0YNZVLr6XP+U4c=;
        b=AvEH/Baf51lIYCnr7emvR6h1Fv2nfudAI7A5oYch4Z0MpMCxo+mO8B06ve+34NUIHF
         thIwRKwkfiFgr52EWyi/tVGhS/BXHfmgbA3OEWsu/L9FCeqgRRSkaaTXyuEeoUekH24q
         Eqho2YfKaIaaRUcXhKUciQp7RSDaOtk03hI4e8UavvPQYliYR69U1uPNP6Vu0qVmumZS
         h2PJ/pxmdULEI0ynE8hVU7wTs25jw+eWD34GIAQ8kj8zo0eRf0T1cMpVjcmcNhZiLNiV
         qjYPachdDklAnxJUntz6XOGPR0LRtGahi3wCbA7Nnoe0gs4P8OKE/7yNR++7lz0SWEuG
         fMzw==
X-Gm-Message-State: AOAM531mvoma2PAyiUdwD04pyegtm23ptImGcFuluwc1B34macrCVlJg
	RfP5rN6WHAMCXVJyqwUJlMbjhR5nHbkspA==
X-Google-Smtp-Source: ABdhPJzT/2XwiKJRcgBOMrV0hN5LY1+nZZFDCc8aJhGo6169u1+MH2rU1bl1lYy5NlZtd/+0E2+b1g==
X-Received: by 2002:a17:902:e80c:b029:de:a20b:7a9c with SMTP id u12-20020a170902e80cb02900dea20b7a9cmr17031625plg.12.1613894590506;
        Sun, 21 Feb 2021 00:03:10 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::54b4])
        by smtp.gmail.com with ESMTPSA id i7sm13743008pjs.1.2021.02.21.00.03.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Feb 2021 00:03:10 -0800 (PST)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] glibc: Build for power9 cpu when using powerpc64le tunes
Date: Sun, 21 Feb 2021 00:02:56 -0800
Message-Id: <20210221080256.1096854-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.30.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This makes sure that we can compile glibc for qemuppc64

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-core/glibc/glibc_2.33.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-core/glibc/glibc_2.33.bb b/meta/recipes-core/glibc/glibc_2.33.bb
index e0002e6046..79bde17f71 100644
--- a/meta/recipes-core/glibc/glibc_2.33.bb
+++ b/meta/recipes-core/glibc/glibc_2.33.bb
@@ -78,6 +78,7 @@ EXTRA_OECONF += "${@get_libc_fpu_setting(bb, d)}"
 
 EXTRA_OECONF_append_x86 = " --enable-cet"
 EXTRA_OECONF_append_x86-64 = " --enable-cet"
+EXTRA_OECONF_append_powerpc64le = " --with-cpu=power9"
 
 PACKAGECONFIG ??= "nscd"
 PACKAGECONFIG[nscd] = "--enable-nscd,--disable-nscd"
-- 
2.30.1

