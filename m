Return-Path: <vanusuri@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BCDAAC7EE30
	for <webhook@archiver.kernel.org>; Tue,  1 Jul 2025 10:33:12 +0000 (UTC)
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
 by mx.groups.io with SMTP id smtpd.web10.7289.1751365990053988098
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Jul 2025 03:33:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=SWLgk+PI;
 spf=pass (domain: mvista.com, ip: 209.85.214.181, mailfrom: vanusuri@mvista.com)
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-23649faf69fso26719415ad.0
        for <openembedded-core@lists.openembedded.org>; Tue, 01 Jul 2025 03:33:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1751365989; x=1751970789; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=v8e1ImdSQ28GZiJmb4jgPDDbYZuAAm4fWo0N0D4xXX8=;
        b=SWLgk+PIB2+R4bgyBNIc96lPbj3K2bcUfeWQwwnIkQgAYT35wFiUOhAoe6IGXDTXmW
         Fd5ixrAXDbiQUXlV7jrtrEXDiL2v8lxuyQW6sc/IAxXBwuyjlDLvLb14KLGbPDdEkeIe
         5AN5yvF4DqERL3MyLH6L9+zJZYaOSBkuRZbfw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751365989; x=1751970789;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=v8e1ImdSQ28GZiJmb4jgPDDbYZuAAm4fWo0N0D4xXX8=;
        b=tN656qFFBh9gCMbXH2RdEVIHu+Kdc15mhvIFgTzhn4s8PrOTiZKBToWc5utzsx72C1
         G2amcdMQUGsyLPuld+6VK5XhUXuw5f7mO0IoQjj+dLzLbW/LPfwRsvo8EnrRoGh77o6X
         rgn+O5bw42l3tDpDnnhr1aB2rcjPjhqOS85y7JFbJi4hyKFga1TOUnskMeiL0VK370f/
         zC8PUzHsePhJuybsLLicME3PM8Sk7POi4VnKrLnrHvi1uaZryKd+FgTnS7cQaXaLtOsg
         D53mlkKOmrW7wGkCNlkcFKzE9W6GM1gjH3bHFfVm/v1uNpmjJJpQi6YYjDN0Q05mIzI4
         UZxQ==
X-Gm-Message-State: AOJu0YwA1I5nF0Cgi5eV7+gdgs2pWDW0tuQBzldiCN5Z/pZz8TmEuCeM
	GJc1N4A8DZJHXj3nlqSQglMQhfEa/YvkyYdG38W+uiDRDWBULUtQFRz7ThdJddTDcd9eUBC6mjI
	ye8T1TOo=
X-Gm-Gg: ASbGncvLI4lh9f+FjIu1lnHBiA8fXRK1+/rZI7jzzMn6fcRAfvuRjHxpxSvCMIXuox6
	ez/tzhwhDhPP8npCHoGG4WBvChT3DhmMZRTZUN1u68J+gAktWbqJwudCCTZgEWiMSlhI6a/xKD6
	lRMPJiq6YzYmci8XK8fvnbKw3yc8MWSl3c38Y9SnRhIT8Cm3XxHBMkXNWUCeiE6Wt66p/rhVphP
	eNpnQ3bskHYM8V+1xOKUn8Ab3Mj68WBbnd4FsMj1JigXfrsq+DvANtFA7Yy/YmjzwTF6t7zCcSw
	DoyQmhl5xiO9jHOGQ8JFcI3eRvg8sDb6wGRO7seanwSZq73ld0RaZZEfYJprFRviwzUGd6K9eQ=
	=
X-Google-Smtp-Source: AGHT+IG7g23gLhBeB4xA99m3hbfJymy0oWGnfxQj0YvShlJ/IcDQHUvNJ7WJ11kM9C2NqUbPggflPA==
X-Received: by 2002:a17:903:1448:b0:235:880:cf8a with SMTP id d9443c01a7336-23ac43d31damr267446125ad.15.1751365989000;
        Tue, 01 Jul 2025 03:33:09 -0700 (PDT)
Received: from MVIN00020.mvista.com ([49.207.209.237])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23acb2f2239sm107369075ad.81.2025.07.01.03.33.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Jul 2025 03:33:08 -0700 (PDT)
From: vanusuri@mvista.com
To: openembedded-core@lists.openembedded.org
Cc: Vijay Anusuri <vanusuri@mvista.com>
Subject: [OE-core][master][walnascar][scarthgap][PATCH] xserver-xorg: upgrade 21.1.6 -> 21.1.18
Date: Tue,  1 Jul 2025 16:02:52 +0530
Message-Id: <20250701103252.6703-1-vanusuri@mvista.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 01 Jul 2025 10:33:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219563

From: Vijay Anusuri <vanusuri@mvista.com>

xorg-server 21.1.17
This release contains the fixes for the issues reported in today's security
advisory: https://lists.x.org/archives/xorg/2025-June/062055.html

   * CVE-2025-49175
   * CVE-2025-49176
   * CVE-2025-49177
   * CVE-2025-49178
   * CVE-2025-49179
   * CVE-2025-49180

Additionally, this release includes a fix for CVE-2022-49737 which was
issued after the fix was merged back in 2022 and several other various fixes.

Ref: https://lists.x.org/archives/xorg-announce/2025-June/003609.html

xorg-server 21.1.18
This release contains an additional fix for CVE-2025-49176 from June 17
security advisory: https://lists.x.org/archives/xorg/2025-June/062055.html

Ref: https://lists.x.org/archives/xorg-announce/2025-June/003612.html

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
---
 .../{xserver-xorg_21.1.16.bb => xserver-xorg_21.1.18.bb}        | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/xorg-xserver/{xserver-xorg_21.1.16.bb => xserver-xorg_21.1.18.bb} (92%)

diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.16.bb b/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.18.bb
similarity index 92%
rename from meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.16.bb
rename to meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.18.bb
index 38c81f2372..14c45be432 100644
--- a/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.16.bb
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.18.bb
@@ -3,7 +3,7 @@ require xserver-xorg.inc
 SRC_URI += "file://0001-xf86pciBus.c-use-Intel-ddx-only-for-pre-gen4-hardwar.patch \
            file://0001-Avoid-duplicate-definitions-of-IOPortBase.patch \
            "
-SRC_URI[sha256sum] = "b14a116d2d805debc5b5b2aac505a279e69b217dae2fae2dfcb62400471a9970"
+SRC_URI[sha256sum] = "c878d1930d87725d4a5bf498c24f4be8130d5b2646a9fd0f2994deff90116352"
 
 # These extensions are now integrated into the server, so declare the migration
 # path for in-place upgrades.
-- 
2.25.1


