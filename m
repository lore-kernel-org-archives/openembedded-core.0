Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.web10.22492.1625671049741399598
 for <openembedded-core@lists.openembedded.org>;
 Wed, 07 Jul 2021 08:17:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=MusoslcO;
 spf=pass (domain: gmail.com, ip: 209.85.128.43, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f43.google.com with SMTP id b14-20020a1c1b0e0000b02901fc3a62af78so4519025wmb.3
        for <openembedded-core@lists.openembedded.org>; Wed, 07 Jul 2021 08:17:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=jmtVRMaPwxOpOWfKuGgAR9p1OeGNS2XZW9pQxGI+2uY=;
        b=MusoslcO5hqnJn0Q9v2dtg+8Kj/zfpiO6Apnk9A/khrnUQHI/qYpFXAwFr33xSdHqq
         wSLxMY+AEobuFGtOXpYoO+Od6Mgp50GKr3/HPig+npGU2xD14ea4nQ+vyerF2jDD/pPI
         svd0zjS2KMgbCF5Us1g3tPLfihkkdL/nVEByTb3j+tZvewr/nOWBPoVuyPY6xPEpU5Y1
         tC8/8lD+OHlI6HTXcuqWT6tfCWVRV9mQhy7D5iO3skWGN/uoCQIVuD/GyMb4GwHPV548
         122Hx+k1/X8nB86YK0rx33tLkr9Y7E7VTV8iEKEtNdvSVuFvZ+rzozywDXG4cmVszXfu
         UbsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=jmtVRMaPwxOpOWfKuGgAR9p1OeGNS2XZW9pQxGI+2uY=;
        b=RCp9xa8M2UROxGMPXHxCNE4zkTcmqYXtHGTdP5WegCjrFC/iwoEfjPU49Yg+5OE2Ip
         0uOrZIa/MnrBxXbzijWL3TLbqVUgN5Z2R/5k4aWY5U2uZPFzrwGKq4reqURsU58j+pdC
         Aoeqf/xw/4lr4eYdSVnAVBZzVpY9RLXyvJv6IIWmYd5/afmLylGmNB9Pj7+oc96n1Uf9
         RiWqNGufLIzoGzjcmDF/wlo7kZG2/thDsyXV5UK5HahWKdVg606V9m+cFt/xF6h+WAcF
         P70zg97MH7CsP0Is9C7IDMRI/ytL64xvQ3y+PvpHiFS+IzLucmKgqn9/QACTCCCYEBn2
         LlAg==
X-Gm-Message-State: AOAM531Db9AcaL1yFDIaP42wlNOXUo564gz1z/DE/il+hkLaPkJ/ZzUH
	y56fG2OQt6yCMlCq1F3HI+LJRunuq0Fdfw==
X-Google-Smtp-Source: ABdhPJz0hnbh7nz9xYUUN8+A1iVSk2/4fhekeAMIyiI7ZMz8r8lLwP24g+De8frRGZHUk4Gvwf5p+A==
X-Received: by 2002:a05:600c:35c1:: with SMTP id r1mr107613wmq.181.1625671048276;
        Wed, 07 Jul 2021 08:17:28 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from localhost.localdomain ([2a02:2454:2a0:cb00:eb83:2e01:3dda:5d46])
        by smtp.gmail.com with ESMTPSA id s17sm20272043wrt.58.2021.07.07.08.17.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Jul 2021 08:17:27 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 1/2] xserver-xorg: exclude development snapshots from upstream version checks
Date: Wed,  7 Jul 2021 17:17:21 +0200
Message-Id: <20210707151722.134952-1-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Standalone X is still winding down; there's no commitment or plan for a proper release.
https://lists.freedesktop.org/archives/xorg/2021-July/060726.html

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-graphics/xorg-xserver/xserver-xorg.inc | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc b/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc
index da025171db..e2fefd9db8 100644
--- a/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc
@@ -17,6 +17,8 @@ PE = "2"
 XORG_PN = "xorg-server"
 SRC_URI = "${XORG_MIRROR}/individual/xserver/${XORG_PN}-${PV}.tar.bz2"
 
+UPSTREAM_CHECK_REGEX = "xorg-server-(?P<pver>\d+(\.(?!99)\d+)+)\.tar"
+
 CVE_PRODUCT = "xorg-server"
 
 S = "${WORKDIR}/${XORG_PN}-${PV}"
-- 
2.31.1

