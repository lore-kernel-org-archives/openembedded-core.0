Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9345BEB64DC
	for <webhook@archiver.kernel.org>; Wed, 28 Jun 2023 02:30:44 +0000 (UTC)
Received: from mail-oi1-f172.google.com (mail-oi1-f172.google.com [209.85.167.172])
 by mx.groups.io with SMTP id smtpd.web11.7397.1687919436562784566
 for <openembedded-core@lists.openembedded.org>;
 Tue, 27 Jun 2023 19:30:36 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=CCAR5zmW;
 spf=softfail (domain: sakoman.com, ip: 209.85.167.172, mailfrom: steve@sakoman.com)
Received: by mail-oi1-f172.google.com with SMTP id 5614622812f47-39ecf031271so4660883b6e.1
        for <openembedded-core@lists.openembedded.org>; Tue, 27 Jun 2023 19:30:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1687919435; x=1690511435;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sRHD2rPv3UtSK22Cy55t4ZQ6N/kMzq97HV13Wy0BTvs=;
        b=CCAR5zmWv4n0CN7HCtB9rzl42b1yq7DUKjwJqpfAevF+UFl2lS+wr78GWyWDjJJBD8
         vDQuq+9KVWw3oMhFxMF07dLvSqZ7vMfBygSzE72OZPPB5PRtK3O7PShowvgRMaGBF6Oc
         V7fK0662h5S/r0xDSyg3Y+sGeYPMZHZI6Zy2j3F4wTX2joSS2IQffZ9ggNY/h3HmVXW/
         VtFdvrU85qnDBV0FLHt69/IaLCK7XLGUypAGKsfMMecF6WLFaivgjNi3XxBPxGRtAI7X
         t5X7C8J3c+sS8zC8keKpqdYN1gC291ty/EyXiuG1T42KjdU8hj5iXC6y2Kochv1ocWql
         X2Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687919435; x=1690511435;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sRHD2rPv3UtSK22Cy55t4ZQ6N/kMzq97HV13Wy0BTvs=;
        b=Aj1fUsKG9WhXy296+D0ZsqM7CGJdNiZQjlunHhvBij1tHHR4yLJSRuoOoiXaOQue8o
         FWaB+CH2/aRr/4FeS4EpdqryzHnfp7f4pMAZuX06TyI3SksiNypiW6T+gIzKt0lM2i0+
         grfqkPBJUu8dbQmG6YgqX09kuJS/FBhqGlLS5xkks0aW6gK3uTWTMaFObYtcIXBfMg+r
         wNOfHUSIf1CfXxtgsYsd5jtsAaNrK5VP/v/2as5TZ9FWw2AI8+PVSUvLsiskofHnS+YA
         HY79FbMrxpMFsAnwZ/z0Kz0hakRSo8pV0dEBzi/BxWwYJiyGSCNd2hs9WoEy9JITyv+P
         WxKA==
X-Gm-Message-State: AC+VfDxlkhlyH8YoPDKnRMLIXzsb6KsATVOKm7d2ymzFfe2Y5UIwr3KU
	u6q4DWpBI9QjuLQ1slcsX8fwepyzmFrVEpnHpzQ5Nw==
X-Google-Smtp-Source: ACHHUZ7JvQcTiGde4ng9ykTU3ron85aP+KAmt7vUHMSpgkjOwpH2A6QkyaGwPlKLBSg1btfQbJZ/Dw==
X-Received: by 2002:a05:6808:16a7:b0:3a0:4dc3:25ff with SMTP id bb39-20020a05680816a700b003a04dc325ffmr26576750oib.7.1687919435276;
        Tue, 27 Jun 2023 19:30:35 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id c18-20020a62e812000000b0063d2d9990ecsm1568666pfi.87.2023.06.27.19.30.34
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Jun 2023 19:30:34 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][mickledore 24/30] meta: lib: oe: npm_registry: Add more safe caracters
Date: Tue, 27 Jun 2023 16:29:40 -1000
Message-Id: <9d51a9f819a0ffdfd273635aa4e2062bf30a1db2.1687919241.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1687919241.git.steve@sakoman.com>
References: <cover.1687919241.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 28 Jun 2023 02:30:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183533

From: BELOUARGA Mohamed <m.belouarga@technologyandstrategy.com>

NPM registry cache should support caracaters like '(' and ')'
Explanation: NPM packages can contains these caracters like : @(._.)/execute

Signed-off-by: BELOUARGA Mohamed <m.belouarga@technologyandstrategy.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
(cherry picked from commit 6110d9e24e43e286781afd1b3634a4ad1a2050d0)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/lib/oe/npm_registry.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oe/npm_registry.py b/meta/lib/oe/npm_registry.py
index db581e280e..d97ced7cda 100644
--- a/meta/lib/oe/npm_registry.py
+++ b/meta/lib/oe/npm_registry.py
@@ -11,7 +11,7 @@ import subprocess
 _ALWAYS_SAFE = frozenset('ABCDEFGHIJKLMNOPQRSTUVWXYZ'
                          'abcdefghijklmnopqrstuvwxyz'
                          '0123456789'
-                         '_.-~')
+                         '_.-~()')
 
 MISSING_OK = object()
 
-- 
2.34.1


