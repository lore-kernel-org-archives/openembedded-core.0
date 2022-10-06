Return-Path: <liu.ming50@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13814C433F5
	for <webhook@archiver.kernel.org>; Thu,  6 Oct 2022 11:27:28 +0000 (UTC)
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com
 [209.85.208.179])
 by mx.groups.io with SMTP id smtpd.web12.4651.1665055640128710504
 for <openembedded-core@lists.openembedded.org>;
 Thu, 06 Oct 2022 04:27:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=psqVD8DT;
 spf=pass (domain: gmail.com, ip: 209.85.208.179,
 mailfrom: liu.ming50@gmail.com)
Received: by mail-lj1-f179.google.com with SMTP id f9so1836253ljk.12
        for <openembedded-core@lists.openembedded.org>;
 Thu, 06 Oct 2022 04:27:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1J6jDNlkGj/2L06FvgBvuuYjjLSkqaqivDdpPdX5/GA=;
        b=psqVD8DThrPTg5OZs6Bm8cOHbBN5+6xxa10lmWxmcYfbyKa4AcR4cbW/Up1KV3Gt4M
         MedM+1dG+W4gHGS1Pa530XWWurDATjuYiIuuBZvJG+fcILyF3f/BmSsfClZFzatKXHNe
         WqWP9STxlvkO1CSK9XlprU22hCUpGvQhrn0257k5AI29YE7nXeV7lZ0aIMRdB4agKcmz
         E38wTugCY6YwoNPxxAebpRJ52Sl/J3gW8mGyAcNuaW3tK+EoC8kFocN9rAt9gtAOsaQu
         LaNmKxj37oZ9doAlhZ6LGOEhmQ7kPP0Rb83uT1p3T0UVpwii9+4IJbST0YrpXkqCa5c+
         aLlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1J6jDNlkGj/2L06FvgBvuuYjjLSkqaqivDdpPdX5/GA=;
        b=vSACsNikPGu9Mc63mb0yMY1J8Rh4ui4kq+Ha4vZ9OM7GYw+y0Hx/cSGcG1BEl+pifF
         slR/5oPMCY6S2egrNaPVfVCwRUwahPuOgOd1wj/GiaPderIDwKFU8FT2ZyNb7tVQEXnF
         itj1PgDuST0cO/tmrKXoYDG7yBLeYJASn5Ocqc9Z9x/BFpOY9r5peoX9kn/gHe2KoUb/
         6nIyWzehnUlFMYIhuQ2ByBSAsn8z+Mdp/HXRcdAqb0Ab2SXp7BeqFND8Zx1BIDhp+4Gm
         elSO/Oj8YgBH6TSzE2wUkpTGrXj+0tDDqYr9LODpv0a+EcFRpKIG4AoOm3g0acE4W2MX
         wH0w==
X-Gm-Message-State: ACrzQf1ylG3ZhRVmO4MyeBIsuTiGqCdWn3Lsb0UJzDBmTe+EPuHW0Kbx
	3YGwr27b8J8OjtWyVdrZ/jNKjRoBFhE=
X-Google-Smtp-Source: 
 AMsMyM74e8TQsA2JT4FPTsc7A3+F0HDS/SsFtJX9Cj2VjMwBsXvoJYd20ElwfvBvtJcmRB2N9WD+KA==
X-Received: by 2002:a2e:98ce:0:b0:26b:e763:27d1 with SMTP id
 s14-20020a2e98ce000000b0026be76327d1mr1502005ljj.306.1665055637776;
        Thu, 06 Oct 2022 04:27:17 -0700 (PDT)
Received: from peterliu-Precision-7530.emea.group.atlascopco.com
 ([2a00:801:74a:8a14:c53c:8bda:a430:fba8])
        by smtp.gmail.com with ESMTPSA id
 i8-20020a056512318800b0049ebc44994fsm2668056lfe.128.2022.10.06.04.27.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Oct 2022 04:27:17 -0700 (PDT)
From: liu.ming50@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: Ming Liu <liu.ming50@gmail.com>
Subject: [OE-core] [PATCH V4 1/2] bluez5: change configuration directory mode
Date: Thu,  6 Oct 2022 13:27:11 +0200
Message-Id: <20221006112712.23062-2-liu.ming50@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221006112712.23062-1-liu.ming50@gmail.com>
References: <20221006112712.23062-1-liu.ming50@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 06 Oct 2022 11:27:28 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/171494

From: Ming Liu <liu.ming50@gmail.com>

Change configuration directory mode from 0755 to 0555, this fixes a
following warning when bluetoothd starts:
| ConfigurationDirectory 'bluetooth' already exists but the mode is different.
| (File system: 755 ConfigurationDirectoryMode: 555)

Reference:
https://git.kernel.org/pub/scm/bluetooth/bluez.git/commit/?id=00cfb36e20e3c35db2150e7d0351ad7b8442e2d8

Signed-off-by: Ming Liu <liu.ming50@gmail.com>
---
 meta/recipes-connectivity/bluez5/bluez5.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-connectivity/bluez5/bluez5.inc b/meta/recipes-connectivity/bluez5/bluez5.inc
index 79d4645ca8..9f5c78b81e 100644
--- a/meta/recipes-connectivity/bluez5/bluez5.inc
+++ b/meta/recipes-connectivity/bluez5/bluez5.inc
@@ -82,7 +82,7 @@ do_install:append() {
 	install -d ${D}${INIT_D_DIR}
 	install -m 0755 ${WORKDIR}/init ${D}${INIT_D_DIR}/bluetooth
 
-	install -d ${D}${sysconfdir}/bluetooth/
+	install -m 0555 -d ${D}${sysconfdir}/bluetooth/
 	if [ -f ${S}/profiles/network/network.conf ]; then
 		install -m 0644 ${S}/profiles/network/network.conf ${D}/${sysconfdir}/bluetooth/
 	fi
-- 
2.25.1


