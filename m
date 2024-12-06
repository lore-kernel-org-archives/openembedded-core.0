Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CBE69E77173
	for <webhook@archiver.kernel.org>; Fri,  6 Dec 2024 12:46:30 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.web10.32168.1733469978067405107
 for <openembedded-core@lists.openembedded.org>;
 Thu, 05 Dec 2024 23:26:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cysec.com header.s=google header.b=oDvuyUay;
 spf=pass (domain: cysec.com, ip: 209.85.128.54, mailfrom: sidali.teir@cysec.com)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-434aafd68e9so12287805e9.0
        for <openembedded-core@lists.openembedded.org>; Thu, 05 Dec 2024 23:26:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cysec.com; s=google; t=1733469976; x=1734074776; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=HPvuJlLFvXXq+bxLGZN7PTnHIl0UrMxViUt5stCJu30=;
        b=oDvuyUay6TzLLs8hxmIcp3n/vJMgU+S2SFCesIjlyWByCLUPRCmkPDSdALU92vz1Ts
         Vp+PlanFjw3iLUPh+Bq2rFdveL6t9ogOMIAbxbMbZSBGvQ3O3LJ++abiIUBBfarCgKlv
         rlq7YOMKpbfseBYux5EX/3O/pDBCVAGXe/iyfidbrPwpwkNLqotNFcmjLd+nLMTVz8kV
         +53nSOp2bW5+Lj4TeYCFXcdBCHlMdZxd8e10cvXG4+6kJ73KEdGotgw1b0ZIsxT4l1xI
         QFJ8xDESmusu4y2z1QF/okG3g7EJ3JWmmMl4dJcarE2VxXVo4+lKiieKZjVvbtkMQKGs
         oWwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733469976; x=1734074776;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HPvuJlLFvXXq+bxLGZN7PTnHIl0UrMxViUt5stCJu30=;
        b=l7QMIvJNZ2ZIJZSX63SJ4/gUovnwgS/270RUihM57FcYoT+SP439Cqo6Hl3t4KvvrK
         vfoqdpqukVYAWCYQcIqFQdXQUqbxLbM6cJDwjh6T3qLEbkQ5XwZzSY+A/RbeNcCSUNvh
         2jnKAHGHbLYRjCtCysWpScREsIp3/VZ5651zFW6+TnP59QywUsA1u48jLsKZDoRtN+WC
         M6BGbCySRm5sQjBJyZZtyjZXZ3mNvxYSsJiqpKM0/bVnFkcZGFIr/hIbQF4vM4oGPv4k
         J3uNjhQEqsb6MKbuL85MTH3V6lljL5dnWqzMwOAh6c+noLNKIkqb6LcyXDM1dGhQXcsd
         0rCw==
X-Gm-Message-State: AOJu0Yy98li/tLUM+aPUmFciRejWc5BYz5groLEQd5K1NGX8Fd9bONAx
	M1fBVnH6drOCdrwmkBng2kaBtM7CuJJIWW0qDNW1UIrvscWdvsPju9qPBAjP7R7jjJ8PQWeEcdF
	d
X-Gm-Gg: ASbGncvVCk1cyFw2W+WfQZJmvfcEj+ikliFWTcyXM4Q/C4n6OL4igAqkEyRs2NheQgU
	hOsKJb/i8af7R9D9q3qaRCtXA89Q+q+RIfauYG4tB/KCXeCh9SezvPUqOlOpfVhyW2Tz/tVDUaC
	l7QsP950wQNmxkbwRyie/j17/rRa+RBc81b/3xUYAhp0zStvpCzIX5LLJz23hzeizLOXSxaDS1M
	kShgrF1TSxrwDG5EkLTeRzQwkrcD7iCLbGiFe+vKV4LUv30A8xkFdF+JCVv1DAx
X-Google-Smtp-Source: AGHT+IHlH72u/4l7ByIl2rsouNrlTK/uYDTDAq4WxDIXpTjDYVqdKH/a7qYHr7p3Gs/hi2cln+UNrQ==
X-Received: by 2002:a05:6000:71a:b0:385:fb40:e57b with SMTP id ffacd0b85a97d-3862b350dc6mr1170810f8f.15.1733469975828;
        Thu, 05 Dec 2024 23:26:15 -0800 (PST)
Received: from msi.taila1104.ts.net ([105.110.187.95])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3861f59cc26sm3841351f8f.38.2024.12.05.23.26.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Dec 2024 23:26:15 -0800 (PST)
From: "Sid-Ali" <sidali.teir@cysec.com>
To: openembedded-core@lists.openembedded.org
Cc: Sid-Ali Teir <sidali.teir@cysec.com>
Subject: [PATCH] shadow: use update-alternatives to handle su.1 and nologin.8
Date: Fri,  6 Dec 2024 08:26:10 +0100
Message-ID: <20241206072610.343089-1-sidali.teir@cysec.com>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 06 Dec 2024 12:46:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208421

This patch fixes the following error at do_rootfs:

  update-alternatives: Error: not linking
  /PATH/TO/rootfs/usr/share/man/man1/su.1
  to /usr/share/man/man1/su.1.util-linux since
  /PATH/TO/rootfs/usr/share/man/man1/su.1
  exists and is not a link

  update-alternatives: Error: not linking
  /PATH/TO/rootfs/usr/share/man/man8/nologin.8
  to /usr/share/man/man8/nologin.8.util-linux since
  /PATH/TO/rootfs/usr/share/man/man8/nologin.8
  exists and is not a link

The problem can be reproduced by adding the following lines to local.conf
and then building an image:

  EXTRA_IMAGE_FEATURES:append = " doc-pkgs"
  IMAGE_INSTALL:append = " shadow util-linux"

su.1 and nologin.8 are handled by update-alternatives in util-linux recipe, so
do it in shadow recipe too.

Signed-off-by: Sid-Ali Teir <sidali.teir@cysec.com>
---
 meta/recipes-extended/shadow/shadow.inc | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-extended/shadow/shadow.inc b/meta/recipes-extended/shadow/shadow.inc
index 171d6e27c3..6ba5a9c7f1 100644
--- a/meta/recipes-extended/shadow/shadow.inc
+++ b/meta/recipes-extended/shadow/shadow.inc
@@ -200,10 +200,12 @@ ALTERNATIVE_LINK_NAME[vipw] = "${base_sbindir}/vipw"
 ALTERNATIVE_LINK_NAME[vigr] = "${base_sbindir}/vigr"
 ALTERNATIVE_LINK_NAME[nologin] = "${base_sbindir}/nologin"
 
-ALTERNATIVE:${PN}-doc = "chfn.1 chsh.1 groups.1"
+ALTERNATIVE:${PN}-doc = "chfn.1 chsh.1 groups.1 su.1 nologin.8"
 ALTERNATIVE_LINK_NAME[chfn.1] = "${mandir}/man1/chfn.1"
 ALTERNATIVE_LINK_NAME[chsh.1] = "${mandir}/man1/chsh.1"
 ALTERNATIVE_LINK_NAME[groups.1] = "${mandir}/man1/groups.1"
+ALTERNATIVE_LINK_NAME[su.1] = "${mandir}/man1/su.1"
+ALTERNATIVE_LINK_NAME[nologin.8] = "${mandir}/man8/nologin.8"
 
 ALTERNATIVE:${PN}-base = "newgrp groups login su"
 ALTERNATIVE_LINK_NAME[login] = "${base_bindir}/login"
-- 
2.47.1


