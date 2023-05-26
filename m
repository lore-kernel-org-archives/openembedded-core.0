Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41BC8C7EE2E
	for <webhook@archiver.kernel.org>; Fri, 26 May 2023 02:29:51 +0000 (UTC)
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
 by mx.groups.io with SMTP id smtpd.web11.109.1685068185974335007
 for <openembedded-core@lists.openembedded.org>;
 Thu, 25 May 2023 19:29:46 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=x+dGEIXH;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.172, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-51452556acdso137096a12.2
        for <openembedded-core@lists.openembedded.org>; Thu, 25 May 2023 19:29:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1685068185; x=1687660185;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PlyHX/BjcWM3D7/TqDPBOf3hm6k7bYn8SDfgdDgYKeg=;
        b=x+dGEIXHKdYq/UYLwHdSdvsGyvU9iR1H5U0ov9+yuN4r+ir7yYfzGWKHp2zkUZnw4c
         titt9LqnlW2nEjpBLxUd2DBRS7luD1pvwdiiACADabsIo2XkCnBU8gIG3fT//w4Mvans
         f8M/KT3hz+OundhJAMnt0g4guNVHu3lmWRFUloFEhAKO3gHon1Pa7yFd8ru6mMxjNBjb
         A4u8sY32heDSwWv8Cua40ctnAN9TSONZyQ+twp0iFY0oVQGmXzkYmXYGw88brXgwLCWt
         fTQ2ZxVIp3yCjx3CJ9r0dDZRt6jX7f9IOHw1xKNxaYpy5BoEm/P4DLdCAWxc5UL+hd1V
         H1OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685068185; x=1687660185;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PlyHX/BjcWM3D7/TqDPBOf3hm6k7bYn8SDfgdDgYKeg=;
        b=SFIe4yB22wP3Bgw9Tm/1SI7QL5el/4t/gXZfuQGbO/pRTk4o0ahDAKCZi/d4r5bA4I
         Q4P3XP1QnwK1UzG0MMXvRRL+HfHmkkeqYl3gwwxrO7hieETIS5ODCliBdBfqi3fy8mc9
         1q/u35wanRYEdOUS2dyL1no8Ouh5veuHKfeI9FO9hcCaSZDtFbR53bAesqlccGrfydPL
         3mmtuynPZ/fmDGL2h3KDOp2G1AXY/iXZPdnYuqk9aOEPBSW2IKL894HSWLJhcVZF/svI
         2FzZb29TtRUPXLkuD4yx2c595fTIbybSEF4vYU7P7heHNlgA1Eqo2CpCGKTozP4nAFwr
         5qwA==
X-Gm-Message-State: AC+VfDxpiNij8Nzl3+Ttwg3aba0TSfWxI2BCjhBuwuTK8qWpi9U6Upj6
	l8/LJiwPWE4zHwQ5G+VS84uzGudOoo/69uYNkMw=
X-Google-Smtp-Source: ACHHUZ55C/0A7nNWU4hL9JQq1bDDjHb0L9ZtKRTxqBjpDrr+TWffVFFCroVt/9SBHEk6m/Sg5AltVg==
X-Received: by 2002:a17:902:c94a:b0:1a2:8c7e:f310 with SMTP id i10-20020a170902c94a00b001a28c7ef310mr1069295pla.35.1685068185126;
        Thu, 25 May 2023 19:29:45 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id t13-20020a170902b20d00b0019ee045a2b3sm2023794plr.308.2023.05.25.19.29.44
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 May 2023 19:29:44 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 13/21] maintainers.inc: Move repo to unassigned
Date: Thu, 25 May 2023 16:29:01 -1000
Message-Id: <2309f14f37636f0c2da7471c982e373c4ef5e35c.1685068004.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1685068004.git.steve@sakoman.com>
References: <cover.1685068004.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 26 May 2023 02:29:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181745

From: Richard Purdie <richard.purdie@linuxfoundation.org>

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit a51a069bad78c578122ae1a5b500f715246d413d)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/conf/distro/include/maintainers.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
index 207d889acd..19bc29708c 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -700,7 +700,7 @@ RECIPE_MAINTAINER:pn-quilt-native = "Robert Yang <liezhi.yang@windriver.com>"
 RECIPE_MAINTAINER:pn-quota = "Anuj Mittal <anuj.mittal@intel.com>"
 RECIPE_MAINTAINER:pn-re2c = "Khem Raj <raj.khem@gmail.com>"
 RECIPE_MAINTAINER:pn-readline = "Hongxu Jia <hongxu.jia@windriver.com>"
-RECIPE_MAINTAINER:pn-repo = "Jasper Orschulko <Jasper.Orschulko@iris-sensing.com>"
+RECIPE_MAINTAINER:pn-repo = "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-resolvconf = "Chen Qi <Qi.Chen@windriver.com>"
 RECIPE_MAINTAINER:pn-rgb = "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-rpcbind = "Hongxu Jia <hongxu.jia@windriver.com>"
-- 
2.34.1


