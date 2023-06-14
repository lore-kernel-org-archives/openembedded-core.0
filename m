Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08A28EB64DD
	for <webhook@archiver.kernel.org>; Wed, 14 Jun 2023 09:29:44 +0000 (UTC)
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
 by mx.groups.io with SMTP id smtpd.web11.7480.1686734981046637673
 for <openembedded-core@lists.openembedded.org>;
 Wed, 14 Jun 2023 02:29:41 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=lcIMZLKd;
 spf=pass (domain: gmail.com, ip: 209.85.208.48, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-5147e40bbbbso9701087a12.3
        for <openembedded-core@lists.openembedded.org>; Wed, 14 Jun 2023 02:29:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686734979; x=1689326979;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=E3ZmMxWDDklvgvGCsQ4Td0gsm94q/zHVIv34W1ZAuLk=;
        b=lcIMZLKdn//QLTF3eeOT5eSL6YlpFSX1lwPTRho1WsP4Wg2SYJoGy13Wb8jJ0wi2kc
         FoWecDHN0eBBkxlwAiwN0v1+40Q4oOAFOyb9gbQHWx+M6+1M7mZeYIlk5lQO6PWz1eUi
         Po5BiuMIGwLGN5s1b/LeXieTBpcIyR/OM4k0W6rM75+S9ZvnNAUY0JFXVXmzAFW+zypo
         Fq0O+Ay51Um82OX6BctKh+sY6sus90vwZalmOQy419WZ9/hJCfO+YxizrPtjkjhyTs/8
         zJJ+dYvTYnnByRiAsjbxevUis5GnP2nrdRq2MficW+EHC6fCjOPntypSd3OcXkKOQxJG
         RpGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686734979; x=1689326979;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=E3ZmMxWDDklvgvGCsQ4Td0gsm94q/zHVIv34W1ZAuLk=;
        b=Yk89fWOBEcPMqqsHUDi5K02YWauW4Rvo71zN9GNnsXO8yybNSkSk+EvbEbU8R3e6S6
         QgBLpK8uUpl6Q3XF6d3QPgJTVKF34I2+UJmxP+VZYwZ9p/fGZRIUV/hdexJNcrNU5/fm
         wotwRRMvVvYgjvyHGiFwq/jTAx2ABW7UbJ3tKLL7AI8qDYABXTr0dd8xT3o+sL7aUgy9
         S5Se9LcFxQtFibVayQhj2iUJwXCnSJICFt1PMQIYJ6KwlkSp0hrEYWiNafFFzQralAeB
         vwdQxaQlBE0t9h+nirYV1o5Bpafw1CCjU8lVcrbTBD5TJF/+d7zizD0bp/c9mm9D+GwS
         HhhQ==
X-Gm-Message-State: AC+VfDycPaJ8N4RTCneK32+QSeEi2bgHhPIH35scG+DNWjpuJkhq6Zz4
	QGW1As6jpDWnagaoJA8+kHKEH/9H/sI=
X-Google-Smtp-Source: ACHHUZ77j8zQukQ59s6IL4rUTEsDUSdf36tWKdCcMvcAjvs/l4pUqWgMDHQoCv77M7TQ1aQUful3Fg==
X-Received: by 2002:a17:907:1c88:b0:96f:1629:3e9a with SMTP id nb8-20020a1709071c8800b0096f16293e9amr15682791ejc.34.1686734979481;
        Wed, 14 Jun 2023 02:29:39 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id k19-20020a170906129300b0097381fe7aaasm7747375ejb.180.2023.06.14.02.29.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jun 2023 02:29:39 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 22/55] kmscube: upgrade to latest revision
Date: Wed, 14 Jun 2023 11:28:45 +0200
Message-Id: <20230614092918.4065570-22-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230614092918.4065570-1-alex@linutronix.de>
References: <20230614092918.4065570-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 14 Jun 2023 09:29:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182767

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/recipes-graphics/kmscube/kmscube_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/kmscube/kmscube_git.bb b/meta/recipes-graphics/kmscube/kmscube_git.bb
index 67ac97b963d..ca76251d7ab 100644
--- a/meta/recipes-graphics/kmscube/kmscube_git.bb
+++ b/meta/recipes-graphics/kmscube/kmscube_git.bb
@@ -10,7 +10,7 @@ DEPENDS = "virtual/libgles3 virtual/libgles2 virtual/egl libdrm virtual/libgbm"
 
 LIC_FILES_CHKSUM = "file://kmscube.c;beginline=1;endline=23;md5=8b309d4ee67b7315ff7381270dd631fb"
 
-SRCREV = "345111481d654b38a72b5c3629151dc74f7a82bc"
+SRCREV = "cf4ec7f35521eb54d72ce0c92ce65b2249171cbd"
 SRC_URI = "git://gitlab.freedesktop.org/mesa/kmscube;branch=master;protocol=https"
 UPSTREAM_CHECK_COMMITS = "1"
 
-- 
2.30.2


