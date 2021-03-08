Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
 by mx.groups.io with SMTP id smtpd.web11.1687.1615231831085703119
 for <openembedded-core@lists.openembedded.org>;
 Mon, 08 Mar 2021 11:30:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=EiMgVCqZ;
 spf=pass (domain: gmail.com, ip: 209.85.216.54, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f54.google.com with SMTP id j14-20020a17090a588eb02900cefe2daa2cso1652898pji.0
        for <openembedded-core@lists.openembedded.org>; Mon, 08 Mar 2021 11:30:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=x4W+XlPPk3QOmOroAf2nayA/vh/VLGhUS/1e+PxPP1E=;
        b=EiMgVCqZdsXHwUbKU8t5XMJiuxrDvSaH4UO+haeFq1Xn/dzhboMx52B+TJM3Ol3dyo
         3rjjwqP4Xw1O+uoUZRz/91rOMALjpyDl2mP63VPE5mwHMTOucZdbMmfudSts+01sTdlz
         /+O+RRc2TepoVeXVSmwspKGYefAUuu2VD3U6cFT7bx4OmAthDSO6WCK4t26exA+SYSK/
         41bbIt0jwMN48bpYV+e/aHRVazWwgSKtqDX7S1nLgnBD1AesNSfA9c79WrnfGNDA+hfh
         hBM+7Y/8C11KyWTEFnmusjyMA5DYSLK4IYJV0iRS3DROQXGNWwICdo6k/r3jVSamhXgI
         PIlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=x4W+XlPPk3QOmOroAf2nayA/vh/VLGhUS/1e+PxPP1E=;
        b=trTtCkiI0OEgbPA9TwUeCqiD274k4KGDCkc0Lq1kFjyHuyJg1DXux0RJK3U2vTCNbk
         acFT524BrvGnpZLhMsanlI7246obRQlvB6TFqFIapBQp5b8sD6tJL93gvr+IqZUO0bpI
         1t2iSBi+LR89+ShpKyovUjX65SHN8/+aD4vrrX6U4gy9RHPdIbW/KP4Ls1C7J433jE+V
         MXOF1YwZXkjv9skbTXmpxfRh8QmJCyhj9OCqXklGoDhAJCw93THGjCLY6S2JKdUmw/Gn
         fC/cgX0rqDh4vR24mp1xp2xr7mAb6MiBxjPrMSgcohMHl1qyi3rsgqTe5ZIZNWTt+CTG
         4egg==
X-Gm-Message-State: AOAM531AjcQkJ/sLzYlAF5ki9WT7NCFfk1o5qoqkUWatd3XVnlrs/l+6
	+UKnU7IIAd8+UuFdt5PZRq1pgWJYsDc3Fg==
X-Google-Smtp-Source: ABdhPJyoNMC3yMM6Vl2BgIAC7+bahKtC/KdPJA1dJ6HyrDSwUHGU8G4sMUP/TjzirLvkjnNHJbWS1g==
X-Received: by 2002:a17:902:82c7:b029:e4:74ad:9450 with SMTP id u7-20020a17090282c7b02900e474ad9450mr22678761plz.58.1615231830165;
        Mon, 08 Mar 2021 11:30:30 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::e641])
        by smtp.gmail.com with ESMTPSA id k8sm152141pjj.31.2021.03.08.11.30.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Mar 2021 11:30:29 -0800 (PST)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Frans Meulenbroeks <fransmeulenbroeks@yahoo.com>,
	Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] resolvconf: add missing dependencies to RDEPENDS
Date: Mon,  8 Mar 2021 11:30:28 -0800
Message-Id: <20210308193028.34418-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.30.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Frans Meulenbroeks <fransmeulenbroeks@yahoo.com>

resolvconf uses flock and readlink.
So explicitly added dependencies on util-linux (for flock) and coreutils
(for readlink).
Note that the options used with flock and readlink are not part of the
busybox implementations so full-fledged implementations are needed.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-connectivity/resolvconf/resolvconf_1.87.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-connectivity/resolvconf/resolvconf_1.87.bb b/meta/recipes-connectivity/resolvconf/resolvconf_1.87.bb
index 6df96b699c..6da8cd6023 100644
--- a/meta/recipes-connectivity/resolvconf/resolvconf_1.87.bb
+++ b/meta/recipes-connectivity/resolvconf/resolvconf_1.87.bb
@@ -9,7 +9,7 @@ LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=c93c0550bd3173f4504b2cbd8991e50b"
 AUTHOR = "Thomas Hood"
 HOMEPAGE = "http://packages.debian.org/resolvconf"
-RDEPENDS_${PN} = "bash"
+RDEPENDS_${PN} = "bash coreutils util-linux"
 
 SRC_URI = "git://salsa.debian.org/debian/resolvconf.git;protocol=https;branch=unstable \
            file://fix-path-for-busybox.patch \
-- 
2.30.1

