Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BFC5EC48BE4
	for <webhook@archiver.kernel.org>; Fri, 19 Aug 2022 07:28:18 +0000 (UTC)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com
 [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.web10.470.1660894069618602835
 for <openembedded-core@lists.openembedded.org>;
 Fri, 19 Aug 2022 00:28:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=XB5HZm/6;
 spf=pass (domain: gmail.com, ip: 209.85.221.54,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f54.google.com with SMTP id e20so3686503wri.13
        for <openembedded-core@lists.openembedded.org>;
 Fri, 19 Aug 2022 00:28:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=TgWVL0PSgzCiHhAFRneMRk33q6tYtILgPXSt5kEBzRI=;
        b=XB5HZm/643dcQdsTzR+Viej/lTDvyNe/2FFMcBBzDWecpl/xBwCKLcDmYb6Kk5oW96
         3dfYWDAtMUrLJ2jymzN9243uB61HVYpXRnJJ0MLCnKkNeQl7SuIAaCop0rjjQVecZppV
         DpFLhmfCDD20NKZ1j+HG/XCPEeBaM/thino37qzgRs0tcEebOiYbxUdvr2AlKmIqO9SM
         dow94+snFw001jjRPKZmDCOLqdqGz6tLEH93zxbggsZR546vfUW6SigL9GWpnug1Oi3H
         J+zH0Ms0nBEpU1ClBPHVXtGNmgBO3+gCy55FJeNKTRTQTtd4bbW0tAlDqNdRK+C1Knrt
         1gbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=TgWVL0PSgzCiHhAFRneMRk33q6tYtILgPXSt5kEBzRI=;
        b=Pdj6LLjUwQfjQ1dB6RtzVJ+LKyffdZKOYiKhGYK1533bkNX814vkA8dxcMeBwevCn5
         Ep93NJF92oLApMavQPZP+C2EKkf3+UmST++XplsZMhK4pnSy592zCxvw4ouPQKO2dMaI
         rY6IttgTDw2sjbhj0qyYfzng/65tKy1zmvoL8O7AaAjRwXvrrZrQeY642BomsfVcDip2
         txmnQKnediKIDq4Vj3GdDCQhcYwu2qPKaxV2rQ5j6kqqP8ekWL28rNr3ltL2L1x57/kT
         ap5JBST59g5zcTyamFkRZpj/iCh2gXVlGC+ZNEjLOXZyF3wCwYYZwrRe6r98ysGFx4CJ
         72gw==
X-Gm-Message-State: ACgBeo3DheJ82GaU5CCoFhWZ+moLmKYI6boukt4nK0smNbzmHq3bZBbC
	EsGuzfDPcaZIkRz2+3LzMc/USiPmwIs=
X-Google-Smtp-Source: 
 AA6agR5tP9lZzOb7xVsE+IH6KWZ4hfe7eQEwq5vUjl/UugGlfh7VSC7aQIkDZVmWdQI4d1GSBlHk7w==
X-Received: by 2002:a5d:64aa:0:b0:21f:12ae:f8ef with SMTP id
 m10-20020a5d64aa000000b0021f12aef8efmr3490379wrp.452.1660894088450;
        Fri, 19 Aug 2022 00:28:08 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de.
 [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id
 ay15-20020a05600c1e0f00b003a604a29a34sm4650739wmb.35.2022.08.19.00.28.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Aug 2022 00:28:07 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 25/42] piglit: upgrade to latest revision
Date: Fri, 19 Aug 2022 09:27:10 +0200
Message-Id: <20220819072727.2236928-25-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220819072727.2236928-1-alex@linutronix.de>
References: <20220819072727.2236928-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 19 Aug 2022 07:28:18 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169596

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/recipes-graphics/piglit/piglit_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/piglit/piglit_git.bb b/meta/recipes-graphics/piglit/piglit_git.bb
index b1e948ea69..7c1bc89c22 100644
--- a/meta/recipes-graphics/piglit/piglit_git.bb
+++ b/meta/recipes-graphics/piglit/piglit_git.bb
@@ -14,7 +14,7 @@ SRC_URI = "git://gitlab.freedesktop.org/mesa/piglit.git;protocol=https;branch=ma
            "
 UPSTREAM_CHECK_COMMITS = "1"
 
-SRCREV = "b95782f470ca2915b0d9b9079f9cd6d81bae092c"
+SRCREV = "6403e90dc7da02d486906cddab8d02c2552a8d46"
 # (when PV goes above 1.0 remove the trailing r)
 PV = "1.0+gitr${SRCPV}"
 
-- 
2.30.2


