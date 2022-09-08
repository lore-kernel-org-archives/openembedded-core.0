Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F483C54EE9
	for <webhook@archiver.kernel.org>; Thu,  8 Sep 2022 21:09:28 +0000 (UTC)
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com
 [209.85.216.52])
 by mx.groups.io with SMTP id smtpd.web08.1687.1662671364589387297
 for <openembedded-core@lists.openembedded.org>;
 Thu, 08 Sep 2022 14:09:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=D3ggP94K;
 spf=pass (domain: gmail.com, ip: 209.85.216.52, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f52.google.com with SMTP id fv3so12877965pjb.0
        for <openembedded-core@lists.openembedded.org>;
 Thu, 08 Sep 2022 14:09:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date;
        bh=BnuAz/5GqkPsMMPbaLkp5J4KzYAuC2npRgKoDEleQpI=;
        b=D3ggP94KTmYvSuqB0QA4Qk/fT8Zu6qqjt7TX7NwBGf7s05mJRjzmqVTTX5ncP66NSX
         9UiLX73NV03pZ0pOUVHs46in6A17ppoq/g1PNI/fp/LEWpud7OoTl2hjKKljCPDg+MSX
         8fIzz4CeRGXR0oLOJu4aodEKE7uEqCTTnGHQqWTonz6WZWv+5W/BH/+kTMlFQjb3Tt7h
         da5JmmcMciDxEp9sKFN7qSAytDBcpE3ytP4V6R+lK4SlzcR8AXC6MFWTVqaUNV6acTVK
         3kVtiRb3QB420Dkl6mIfeSTlf/EQ3DKz8cELFwaY7DWmb82sU8XsHck5gcxwI9pkUAAo
         Ggjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date;
        bh=BnuAz/5GqkPsMMPbaLkp5J4KzYAuC2npRgKoDEleQpI=;
        b=aOot4jnGsXXSdGXS5IyyXBuXItaUS5pInBANJMgInd4XID4NSFQqvfg87nTPLGATQv
         J9rij3GFtYX8vVO/6vUqKKw5w9JNMMl6dIg76et53y+kGhcuFuzaH2J64S05HuXhEUWs
         tdMLrJ9f2y6Y+txZRPtklTpiMxv5MVPVUC18wKBlIwHPsMfnNzxHeM4e86s9pAFU9ZAn
         ZpjsMrVWJf/eF0mhwTqO3dqp75efOe7KbFAqVYbG5vnuHXbwalmcWY1U1uHQOCtiZPI5
         K+KJxbU/1lLEmMJa4GSlIrbGyP48lROiKHgjrRoSoQtfEBTs9Fb96pbx2xqmKiZe2NbW
         eHBA==
X-Gm-Message-State: ACgBeo13YKm4EYbM+Hv/x6K4m23zLbwEe0z8qehftcravI3uph0YiFWY
	7UC8Jx+44tEOMkbYm8E0Z84AvKiiMEg8zw==
X-Google-Smtp-Source: 
 AA6agR4Kf76mX9QylLAYORq6I1dF6I+PLu5szMzIZu4ykbARddRTPVmAzb4vYHPHlmssKNWUHImT3w==
X-Received: by 2002:a17:902:9b93:b0:171:53b4:56fe with SMTP id
 y19-20020a1709029b9300b0017153b456femr10385686plp.92.1662671363766;
        Thu, 08 Sep 2022 14:09:23 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::1761])
        by smtp.gmail.com with ESMTPSA id
 u189-20020a6279c6000000b0052d33bf14d6sm61088pfc.63.2022.09.08.14.09.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Sep 2022 14:09:23 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] gobject-introspection: Do not hardcode objdump name
Date: Thu,  8 Sep 2022 14:09:20 -0700
Message-Id: <20220908210920.1100783-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 08 Sep 2022 21:09:28 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170473

Use OBJDUMP variable in the script, this helps in using the lddwrapper
with recipes which maybe using different objdump tools e.g.l
llvm-objdump or vice-versa

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../gobject-introspection/gobject-introspection_1.72.0.bb       | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.72.0.bb b/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.72.0.bb
index 9a47e908b7..d935cbd905 100644
--- a/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.72.0.bb
+++ b/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.72.0.bb
@@ -103,7 +103,7 @@ EOF
         # for a different architecture
         cat > ${B}/g-ir-scanner-lddwrapper << EOF
 #!/bin/sh
-$OBJDUMP -p "\$@"
+\$OBJDUMP -p "\$@"
 EOF
         chmod +x ${B}/g-ir-scanner-lddwrapper
 
-- 
2.37.3


