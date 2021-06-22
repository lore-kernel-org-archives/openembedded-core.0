Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
 by mx.groups.io with SMTP id smtpd.web10.1455.1624390050858670107
 for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Jun 2021 12:27:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=lujNm6q/;
 spf=pass (domain: gmail.com, ip: 209.85.208.48, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f48.google.com with SMTP id i5so308030eds.1
        for <openembedded-core@lists.openembedded.org>; Tue, 22 Jun 2021 12:27:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=rf02lVhntN81xEbM6JyiC5gnn/UdDhQUV9g36RTErao=;
        b=lujNm6q/DCJ4sdiewFLtoWrGelS+V2lXVjd3XwVWl3YNYT2j89VOgxWeCgWOYMr6BM
         ymBabjBnCLoioXxt63nGqzD2HF2V/b3auBAEOXizzcziiOY/XgsIQ3hLkhQWCLg8/Isa
         tFK6p1Gwzts/BOPUkSXfBNyjhE4aIZXQ+mHeUO9uS9fFDv8TW5zKMTTkwmYJ+l8KWQrH
         5ZzeTYuMSj+1ur7ngf1yQ3iv6NwaCDCv2rR3SqXYqK5qxPBhNdITt036aHzEXMgLQS8w
         Ydi81jrXfpbtSB41y/iZV727Tpft963hJPgKaQtSXFwUXLzSPZUZGonhoWXYgIBu5wN/
         EJbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=rf02lVhntN81xEbM6JyiC5gnn/UdDhQUV9g36RTErao=;
        b=mMgvyTF/b1xH2EFixP1VjhIousrvOqwv8jik13oyPdWrF1cHEnCblBBvSvtIAyJ1L8
         wIa69VaxyKM47rqzjkqZv/78w66DKTAooxka5a1G2r63neKBnwqz3Z9SXXMxZFVRm+3V
         yocMw0RubjR/jzEptlYIye/E5zYta+5k5f+Gv8wD5amX1NmrKpNN8prF5CwGrXJZ6QJI
         c2Dnj32pAariET+8NrY5sfpRqQLdc96mszA80ZeKFa4WCyjKPD1zyVFfyptcAK0dvFq7
         zGUXTjNKiuW/Gnx7gh3GEu5wNdIiOiEZfJdrgeO8WDBwR7vm7o/hBlclqgxDRQePZukw
         AMaA==
X-Gm-Message-State: AOAM5315+GbDWihY5s2sverHWBZTEcV5qSFfj9itIqAnbfVv8nK/rbVZ
	5iX1AeT6yyewAk/TsBJh207rXOMfbXWlVA==
X-Google-Smtp-Source: ABdhPJzr4n2KesRoWW21cymdsG0ICLN5INz5uq9d9Ulqk1SyuHzOPBnSJDclhs3Xy3HzD6+0as2/uA==
X-Received: by 2002:a05:6402:151:: with SMTP id s17mr7195919edu.233.1624390049012;
        Tue, 22 Jun 2021 12:27:29 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from localhost.localdomain ([2a02:2454:2a0:cb00:eb83:2e01:3dda:5d46])
        by smtp.gmail.com with ESMTPSA id e8sm5826806ejl.74.2021.06.22.12.27.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Jun 2021 12:27:28 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH] pypi: set SRC_URI with =, not with +=
Date: Tue, 22 Jun 2021 21:27:23 +0200
Message-Id: <20210622192723.2041345-1-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This did not cause problems in builds, but broke some devtool
workflows such as version upgrades or checking the latest version
from upstream. Tarballs should come first, not the patches.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/classes/pypi.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/pypi.bbclass b/meta/classes/pypi.bbclass
index 87b4c85fc0..899126e9e8 100644
--- a/meta/classes/pypi.bbclass
+++ b/meta/classes/pypi.bbclass
@@ -19,7 +19,7 @@ PYPI_SRC_URI ?= "${@pypi_src_uri(d)}"
 
 HOMEPAGE ?= "https://pypi.python.org/pypi/${PYPI_PACKAGE}/"
 SECTION = "devel/python"
-SRC_URI += "${PYPI_SRC_URI}"
+SRC_URI = "${PYPI_SRC_URI}"
 S = "${WORKDIR}/${PYPI_PACKAGE}-${PV}"
 
 UPSTREAM_CHECK_URI ?= "https://pypi.org/project/${PYPI_PACKAGE}/"
-- 
2.31.1

