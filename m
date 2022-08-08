Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0B14C2BB41
	for <webhook@archiver.kernel.org>; Mon,  8 Aug 2022 06:43:16 +0000 (UTC)
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com
 [209.85.218.42])
 by mx.groups.io with SMTP id smtpd.web11.22607.1659940974449487098
 for <openembedded-core@lists.openembedded.org>;
 Sun, 07 Aug 2022 23:43:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=LWD4lM3p;
 spf=pass (domain: gmail.com, ip: 209.85.218.42,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f42.google.com with SMTP id a7so14839395ejp.2
        for <openembedded-core@lists.openembedded.org>;
 Sun, 07 Aug 2022 23:43:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Dad4NE9jnBUZZggZqJYG4ZHgSHzHPdIBRrf5kyo0e8Q=;
        b=LWD4lM3p4/UFuTFBh9cJBydqdX9g1gx/7ZHszedHUOskxhCVP7lyMoUoxCSRHWuuUJ
         pfAMv0KPMCyrAxqVzrzjvGl9ypcvtD1JAVBO3Q4Vbo/dEJEwxaPmPv98yfJWkbID5jvF
         2JYnVBv2lN7JD9iFjYFGwEP2QGBrgBhPi0SdsU3CKl44A14n8khsXYaSz/GdYqcCORv/
         NiZMv0AQx8kdU8eea91D9f4kXISVARndK4nWLmpt5hG6g6Yzr1QyA3SIuehQmOjLblhQ
         S1/QirRw6LKoo4aNh1XT/HCF3nVWD9VPmL6YbgJemKr81MWD499fKKGJ42Cv75SSrMuh
         kuww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Dad4NE9jnBUZZggZqJYG4ZHgSHzHPdIBRrf5kyo0e8Q=;
        b=2XRG9SdBuiMQKF0CZ3ldDoOsPqhs/sqQERjYVaIPxxxCNLWyQ45IZ/VAyhuHdpWmkY
         rNxkHpa0CR788kvPkBAPM7CZw9/Dm98WY2ELOU7l+ytX/7MtOCBbdfHFnFCgO3s2W06L
         VgpyY2pGrQdzyxZljpFPyXVpZ4c0j9u24VVCnkgGBuoDQ27WLyzC4ZR3vtTXha93S4i2
         od/OQv/HWT9HL9EIClCH7LgxBbI4dQML/CC9CdQ3otTrZ2/fJ5OngfQTITXERAJNwR2n
         84sIHuZYoPujh4kkMojrWn2eQbe8MBnK+y8ZqSNJ0/RO/yJuG4ht9GmvUY95pDzg1t7e
         z/hg==
X-Gm-Message-State: ACgBeo1vpXNb2wDaoBWlPjA5ZegllwXuOZdpGrVOipFgi5WY8pgqXHgY
	l/B8a5pHgzroxKT/AIKSpk+sojNey2g=
X-Google-Smtp-Source: 
 AA6agR5XHOT6qTJPMUsFznNEx2N3Sl42MaZiqkixYmK//WhfXRQywrLVmZ1xD0NkfqTqbGEmU/EEVQ==
X-Received: by 2002:a17:907:2bf7:b0:730:996d:5e8d with SMTP id
 gv55-20020a1709072bf700b00730996d5e8dmr13017347ejc.382.1659940987641;
        Sun, 07 Aug 2022 23:43:07 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de.
 [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id
 q19-20020aa7da93000000b0043bd2a79311sm4153477eds.37.2022.08.07.23.43.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Aug 2022 23:43:06 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH v2 30/44] piglit: upgrade to latest revision
Date: Mon,  8 Aug 2022 08:42:23 +0200
Message-Id: <20220808064237.3975347-30-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220808064237.3975347-1-alex@linutronix.de>
References: <20220808064237.3975347-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 08 Aug 2022 06:43:16 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169054

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/recipes-graphics/piglit/piglit_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/piglit/piglit_git.bb b/meta/recipes-graphics/piglit/piglit_git.bb
index 932f2928a0..b1e948ea69 100644
--- a/meta/recipes-graphics/piglit/piglit_git.bb
+++ b/meta/recipes-graphics/piglit/piglit_git.bb
@@ -14,7 +14,7 @@ SRC_URI = "git://gitlab.freedesktop.org/mesa/piglit.git;protocol=https;branch=ma
            "
 UPSTREAM_CHECK_COMMITS = "1"
 
-SRCREV = "c107462e4e429fa1cf6daac39168674c1c0c9fd4"
+SRCREV = "b95782f470ca2915b0d9b9079f9cd6d81bae092c"
 # (when PV goes above 1.0 remove the trailing r)
 PV = "1.0+gitr${SRCPV}"
 
-- 
2.30.2


