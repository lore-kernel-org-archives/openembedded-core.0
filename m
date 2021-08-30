Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com [209.85.222.176])
 by mx.groups.io with SMTP id smtpd.web11.4393.1630363206936302181
 for <openembedded-core@lists.openembedded.org>;
 Mon, 30 Aug 2021 15:40:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=mh3GWlVm;
 spf=pass (domain: gmail.com, ip: 209.85.222.176, mailfrom: twoerner@gmail.com)
Received: by mail-qk1-f176.google.com with SMTP id t4so17501029qkb.9
        for <openembedded-core@lists.openembedded.org>; Mon, 30 Aug 2021 15:40:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=WtewOTbOl9pqfeisFBQ7kD6dy7COw08c2ye0W5zK84w=;
        b=mh3GWlVmw4Nd5HLxA+s35MhoEaTimmBOuoj4ZhKpScaQAk01P9m9lboY/hjFX/ViGX
         jERt1VQAw8dHrB7TOu3ai7EW3LvZEzSWI44Q3NwO5NEMOKsHXnvc12OEQ8OL+StivxGp
         m7ix8g1rLqfI9+IpMSykppoTNKF6fOM3EwLfrDq95bu/8ehS0RGvwhlK48FpDvA8c0O0
         WXd1lBFKRJPToiM7fgkFfQTJMr4Y0hu2XO531J/RG01SN1ARzKrjGyy5axJ5//xuFQ+T
         NgIEREWsyE6FP9itX1+gE8yclyF0vHlYOXkEYYaGdQf8ejQ3dYswu/eu2P+A3OgWyj2X
         v5Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=WtewOTbOl9pqfeisFBQ7kD6dy7COw08c2ye0W5zK84w=;
        b=HD/DB9pKjV0PiL4nL7uK5i1zE+70sNgPocwzrKvmCcoJl2XQTrJew2YS2GLEHZG56l
         i0d8Cp2uR1qNxHn/IIUGEhoJ47MgMcGhB1v+3PQUGZDzmtBdMzGR5UdvTchAPZkPjrdL
         nEXdjMf3M2wh6WBAMzfzcpVXN320jmo31j+jBHmgdkIEi5AoDOcYv03nz+0QjnOX1rWd
         T8u7rbAVrSon25vt2FxT/IK/ROVXFsEsA5P/KLuBbT005pPhkZ5LAUUl+zZw/Ou3P+Fc
         U2KXpAahdPDZpGSX8glghuwr3kpfMjMSOpP9NwzHBl0Py0JM1rsO33/VWAQXqqsEDw8v
         o3kw==
X-Gm-Message-State: AOAM531Li2WOvE9zCM9yiv1daoU6RnjtbTy3SJ/hiUXcUx7nXOlglND6
	5H69gaAUyPwH0IUcBaX56DIy/J7BOBQS0g==
X-Google-Smtp-Source: ABdhPJzQc8cWWTeBciatvdgLVn0VZnA+dSg9NLP1DR0rARD3Q/HUc0k6/oO+Hg4Egt356kDuEobBVA==
X-Received: by 2002:ae9:edd2:: with SMTP id c201mr25370919qkg.495.1630363205522;
        Mon, 30 Aug 2021 15:40:05 -0700 (PDT)
Return-Path: <twoerner@gmail.com>
Received: from localhost.localdomain (pppoe-209-91-167-254.vianet.ca. [209.91.167.254])
        by smtp.gmail.com with ESMTPSA id v145sm12693886qkb.132.2021.08.30.15.40.04
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Aug 2021 15:40:04 -0700 (PDT)
From: "Trevor Woerner" <twoerner@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] distro_features_check: expand with IMAGE_FEATURES
Date: Mon, 30 Aug 2021 18:40:00 -0400
Message-Id: <20210830224000.23696-1-twoerner@gmail.com>
X-Mailer: git-send-email 2.30.0.rc0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In addition to checking DISTRO_, MACHINE_, and COMBINED_ FEATURES for required
or conflicting features, extend this functionality in order to check
IMAGE_FEATURES in the same way.

Signed-off-by: Trevor Woerner <twoerner@gmail.com>
---
 meta/classes/features_check.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/features_check.bbclass b/meta/classes/features_check.bbclass
index b3c8047861..d4574a0eaa 100644
--- a/meta/classes/features_check.bbclass
+++ b/meta/classes/features_check.bbclass
@@ -18,7 +18,7 @@ python () {
 
     unused = True
 
-    for kind in ['DISTRO', 'MACHINE', 'COMBINED']:
+    for kind in ['DISTRO', 'MACHINE', 'COMBINED', 'IMAGE']:
         if d.getVar('ANY_OF_' + kind + '_FEATURES') is None and \
            d.overridedata.get('ANY_OF_' + kind + '_FEATURES') is None and \
            d.getVar('REQUIRED_' + kind + '_FEATURES') is None and \
-- 
2.30.0.rc0

