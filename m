Received: from mail-lj1-f194.google.com (mail-lj1-f194.google.com [209.85.208.194])
 by mx.groups.io with SMTP id smtpd.web11.1209.1596529234465976956
 for <openembedded-core@lists.openembedded.org>;
 Tue, 04 Aug 2020 01:20:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=FZ+LVe7j;
 spf=pass (domain: gmail.com, ip: 209.85.208.194, mailfrom: jacob.kroon@gmail.com)
Received: by mail-lj1-f194.google.com with SMTP id s16so27353165ljc.8
        for <openembedded-core@lists.openembedded.org>; Tue, 04 Aug 2020 01:20:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=D6Hy607Z/Zbri+m0KY2HGCps0DWIjqSPOrWI+gLcanw=;
        b=FZ+LVe7jyD04y0juH2HlDF9i0MlTnHxaUoQwOIvnb0mr8MzRUSGT/ZBX4Vhc2oznHW
         bgC4bnrBO+SvCcnofpfW3hOfx1sNkx49b3QHz4vXT05Y/DA0mmri5lPwnECnu8cWcw7R
         OP0IqhBUKsvt6v/YxLJSUQEGXSzzSW6TAGeRBr2Y7tlLMvbK6VKfFcPHZhcbQ3gk9tIC
         5qXO4Zk9eTyj83WHmRClRGXksINjZl91Jv88NA/WA0e/eyqIbPmMC8OGsbEspcYOmX30
         y0ag4rTMll1Svkt76Hqb5FIF5kUqdwyOiLuMGVJuwcNVD0P0XXw6tLPfHhhX+YcDfb7v
         tycg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=D6Hy607Z/Zbri+m0KY2HGCps0DWIjqSPOrWI+gLcanw=;
        b=bvUWi5KrC583dfRaK/QwfsY2eOpXv8ozWsa/iv7VeLCntuBiRidRaJLy+/0gUp/UPR
         Mmj9HXhAgdjfM1BlqGVbL4At/JvS5C2Fip7Q5VkAEuXqzPifzCSuczDGRp2xbtAfyVwW
         ug1XcoBghPUA7Rwb0rYm7aiNjyO/5BTi+a0NORRPZL1yrV2bSLYgsmnRSOH1YBokJpXZ
         HWu8GPhm/CsinONpDt4phRa+p/rPU7E7jN/vSNT5wifL5U4jX0Qdbj+gCPPcKBlFSVU8
         iSZMSiwcFkiXkNeayMx11fVKaKLSisu+ypsn93VC00lMeDGx6AbMUnbwKoldmI0IHJDv
         m7Hg==
X-Gm-Message-State: AOAM533V18uvZz+jRiUTlgKRCbLE6kIEBa6/z7vvtoe1paaZNIG/5vvU
	nem3s1jtOtiGJ170dro5amc1dcpA
X-Google-Smtp-Source: ABdhPJwMGnZIlOb3Zi7coxXe/4Ps9wwP678S5Ycg4Xt++wYDOEpIEpJbTuU8sHwmuK9UrSwxvla6YA==
X-Received: by 2002:a2e:b16c:: with SMTP id a12mr9479196ljm.146.1596529231553;
        Tue, 04 Aug 2020 01:20:31 -0700 (PDT)
Return-Path: <jacob.kroon@gmail.com>
Received: from localhost.localdomain ([213.185.29.22])
        by smtp.gmail.com with ESMTPSA id h18sm5203500ljk.7.2020.08.04.01.20.30
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Aug 2020 01:20:30 -0700 (PDT)
From: "Jacob Kroon" <jacob.kroon@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] gcc10: Don't default back to -fcommon
Date: Tue,  4 Aug 2020 10:20:19 +0200
Message-Id: <20200804082019.76320-1-jacob.kroon@gmail.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

It has been almost 3 months since the upgrade to gcc 10. Switch back to
relying on gcc default configuration (-fno-common).

This reverts OE-Core commit 951e859b1e8297970278c539e989b8a6d06a9cb3.

Signed-off-by: Jacob Kroon <jacob.kroon@gmail.com>
---
 meta/recipes-devtools/gcc/gcc-configure-common.inc | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta/recipes-devtools/gcc/gcc-configure-common.inc b/meta/recipes-devtools/gcc/gcc-configure-common.inc
index 6cb40fcb74..a64c4caf00 100644
--- a/meta/recipes-devtools/gcc/gcc-configure-common.inc
+++ b/meta/recipes-devtools/gcc/gcc-configure-common.inc
@@ -34,7 +34,6 @@ EXTRA_OECONF = "\
     --program-prefix=${TARGET_PREFIX} \
     --without-local-prefix \
     --disable-install-libiberty \
-    --with-specs=%{!fno-common:%{!fcommon:-fcommon}} \
     ${EXTRA_OECONF_BASE} \
     ${EXTRA_OECONF_GCC_FLOAT} \
     ${EXTRA_OECONF_PATHS} \
