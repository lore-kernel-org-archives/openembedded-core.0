Return-Path: <sidali.teir@cysec.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D02D0E7717D
	for <webhook@archiver.kernel.org>; Mon,  9 Dec 2024 14:59:02 +0000 (UTC)
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
 by mx.groups.io with SMTP id smtpd.web10.103638.1733756334117253146
 for <openembedded-core@lists.openembedded.org>;
 Mon, 09 Dec 2024 06:58:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cysec.com header.s=google header.b=F5s66VjF;
 spf=pass (domain: cysec.com, ip: 209.85.218.50, mailfrom: sidali.teir@cysec.com)
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-aa66ead88b3so315597366b.0
        for <openembedded-core@lists.openembedded.org>; Mon, 09 Dec 2024 06:58:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cysec.com; s=google; t=1733756332; x=1734361132; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=HPvuJlLFvXXq+bxLGZN7PTnHIl0UrMxViUt5stCJu30=;
        b=F5s66VjFoAvVVBYxBJXJxuehWKu9TuFS+iPIOaVFD+pc90zMyCBr/8UJrArHEPJ7wp
         4fTMqGChd8GssSNVN/xnLUF5Tsm5r7euW7tA740iopaVDGckDS0NRKeKiLBocLkZx2if
         nIRnNSxktiA+EJU7cAZupaAhp0arwQ8gXSLzCPEqFeCQU+Nh87DBsqajPZvKgHTjWLpy
         08YFespFJIV7BfWl9SLUjR6ylOV1Ajf7Twy2SKqrIrlNvtjyN/Y8jJOspC1LbUawNjs3
         GJjEYtadGejJCwWjeB4B0qtb9IIlgIMakHgO9hS6ZRU5+Y3qA94gapMTH/Rvls3iIdfq
         wm6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733756332; x=1734361132;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HPvuJlLFvXXq+bxLGZN7PTnHIl0UrMxViUt5stCJu30=;
        b=dky7xwQWtrhlxOfFR18ywmOevL5xTh48r6Oh0fHNp3LL+ad7bQuSqorFmStUgk0TsY
         fsBw/DNTbH1lU47r916y6BoRDupYTsUClMzjaLAflFlntloOwQ0JzCBD60KpbiZ3dX9M
         VObbEHxN5T75rn7fsj+AYneKP3I2l3HcA8IItcfNoRUlUXJOFtzviuNsD6YEEVKRNc3r
         n4/UqzmB7PT5oyjxLdbYvX/ZT9XlB4LDg1Z8IdP1V+tgefO323B+yLpsMJ3szJrKpk15
         eS94FFf4o70CwjFRk74bygLNBlLscoXom8RvOnEljizOZyVq5yPzVLXbOSqse/a1+ZnO
         7muQ==
X-Gm-Message-State: AOJu0Yxaqt5iS/uLuo5CvCRxEZxBOI6iRfbB/3Nanvy076vRqZSkWCWR
	LNFXpl/LXQCKe4DAGU4IZwzQAwWvtCEFjSYMMSh1hgysjhMrqT6aHECoYheQBERdu6UO1xzHPt1
	d
X-Gm-Gg: ASbGncsey4vYEYSm3h+EV/zYjIJd7ccC9hjtzDVhzpa97Ue1XZBCYIrQxx/tq7zEAuK
	c/R5joao9F14RZPGHBZaXAReOBQRAMAfL7t5uXP5saDa9Wii3id6l7t+qyCPD5r0/xI7FfyGLSS
	1Dchwlov6Xzt0ZJo2MSM8RVqAgBMy0QztHQiiJ6o/FycjRpN2Ib++IH87tu1IGAaG95NaXPUMjW
	btrZ63A0idMl1AEb9MtjXv9JKy3RCctZ7gihMCCz7LBMxW9P9Uc7UHr1fcZGKPpoQ==
X-Google-Smtp-Source: AGHT+IHqF0p/UeLifHjDDEWD9kwYab1FDEHtSmiaxnFpeM1CzrmcxVPJqvrDng+PFAnHZYAlzDdYsA==
X-Received: by 2002:a17:907:1dc4:b0:aa6:6c08:dc71 with SMTP id a640c23a62f3a-aa69cd8131emr79326366b.23.1733756332074;
        Mon, 09 Dec 2024 06:58:52 -0800 (PST)
Received: from msi.taila1104.ts.net ([105.109.230.228])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa68880b344sm162660566b.184.2024.12.09.06.58.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Dec 2024 06:58:51 -0800 (PST)
From: Sid-Ali Teir <sidali.teir@cysec.com>
To: openembedded-core@lists.openembedded.org
Cc: Sid-Ali Teir <sidali.teir@cysec.com>
Subject: [styhead] shadow: use update-alternatives to handle su.1 and nologin.8
Date: Mon,  9 Dec 2024 15:58:37 +0100
Message-ID: <20241209145837.1196870-1-sidali.teir@cysec.com>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 09 Dec 2024 14:59:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208486

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


