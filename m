Return-Path: <arnout@mind.be>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0EFEC05027
	for <webhook@archiver.kernel.org>; Thu,  2 Feb 2023 12:49:45 +0000 (UTC)
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
 by mx.groups.io with SMTP id smtpd.web11.13526.1675342178407294629
 for <openembedded-core@lists.openembedded.org>;
 Thu, 02 Feb 2023 04:49:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mind.be header.s=google header.b=C1OoXuUK;
 spf=pass (domain: essensium.com, ip: 209.85.218.50, mailfrom: arnout.vandecappelle@essensium.com)
Received: by mail-ej1-f50.google.com with SMTP id me3so5612236ejb.7
        for <openembedded-core@lists.openembedded.org>; Thu, 02 Feb 2023 04:49:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mind.be; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=OZ4LOTBsF1twoLt4njkQdvpxK8ppZC7Zkwhr74CUi/s=;
        b=C1OoXuUKcoeb0fwfH9JCBUoVYbBWX+z/WdAXD7Gpia5DmOS7/I3dPUWzfmHUXZegV1
         HRisxbNVjqofc3pF6JVZefCR9uJVAxM9JoubqaTMJ1ifbzm6Rg+4WbTb4bC3SMRsU0j3
         wjBinysJSCDxNoyxAOoDNjDgjayOc+TptZySMQO75n9E7hQAjp6raUc5dgch6nzDXBG4
         0O6cJSZv1TjNbgIGm/osdEE7oysveaPaAuiCryqtyMEHNRe9zYo5bF2dcODG1qCW4GoX
         yp7BOehAisaF1aacyiriTK3Dwb7ZYICqHJfiU53t3yGRkQgscLfEGtxwkRlQBMP5K8Xi
         6WbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OZ4LOTBsF1twoLt4njkQdvpxK8ppZC7Zkwhr74CUi/s=;
        b=C6PQQDVEzaW52GFttMMWu+29uPxLZXNNEMKSyPt+fNNFW4rAoOKbaF0Xndg9RchnmX
         6Xg7L/JHA6F4YesQlagcUvVH/Dvf/GleWsvbCea4a7GP72oAs7Met7TE3tNP2Xb1/HcE
         mcntpSZ2Za2wdJ71ndj1ncYmkVUFLt9zjwlB1PFPROP4hT+du4HpWhkAZcCdhyZ2PhMO
         DQT4yRHKSlymqyhAd1VTBaXiHIj+nIyYw743NWNUNy8peItP0Zt9p78sqLTtCDYGBfoM
         wKHqqqM93iFDqqW8iaaplyntQhwuO1E2DulQm/Id4kMFT8Oz7OF4HbDVDVPGJ4NIr6uI
         PgTg==
X-Gm-Message-State: AO0yUKVbB/bcZSzD+TD6Cv3y3lWEMC+UzLdsyXh1i9O0dQtsC1Wrx2Mi
	uYaEO4D26QLb5q5epLyQZTGCIl1XIhJe7qK7
X-Google-Smtp-Source: AK7set8hA31G4GyhV28Xs49/l0c+Myng+jCguYQCZIcX0YJW8CDGQvbb2pV89oNA4eVOH+86tQGlLA==
X-Received: by 2002:a17:906:4b57:b0:878:54e3:e3e1 with SMTP id j23-20020a1709064b5700b0087854e3e3e1mr5380110ejv.73.1675342176336;
        Thu, 02 Feb 2023 04:49:36 -0800 (PST)
Received: from localhost.localdomain (ptr-9fplejqcmbwz6qb22hk.18120a2.ip6.access.telenet.be. [2a02:1811:3a7e:7b00:e7c3:8953:3ab9:2c18])
        by smtp.gmail.com with ESMTPSA id sd14-20020a170906ce2e00b0088ed7de4821sm1259209ejb.158.2023.02.02.04.49.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Feb 2023 04:49:35 -0800 (PST)
From: Arnout Vandecappelle <arnout@mind.be>
To: openembedded-core@lists.openembedded.org
Cc: Arnout Vandecappelle <arnout@mind.be>
Subject: [PATCH] python3-pytest: Remove dependency on python3-toml
Date: Thu,  2 Feb 2023 13:49:11 +0100
Message-Id: <20230202124911.3401913-1-arnout@mind.be>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 02 Feb 2023 12:49:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176695

Since version 7.2.0 [1], pytest uses the "batteries included" tomllib
module for parsing pyproject.toml configuration files [2]. It is
therefore no longer necessary to have python3-toml in RDEPENDS.

[1] https://docs.pytest.org/en/latest/changelog.html#pytest-7-2-0-2022-10-23
[2] https://github.com/pytest-dev/pytest/pull/9741

Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
This patch only applies to kirkstone and langdale branches. On master,
Python 3.11 is used which no longer needs tomli at all. On dunfell,
pytest is still on 5.3.5.
---
 meta/recipes-devtools/python/python3-pytest_7.2.0.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta/recipes-devtools/python/python3-pytest_7.2.0.bb b/meta/recipes-devtools/python/python3-pytest_7.2.0.bb
index 02fc55fdb0..c4d1c184cf 100644
--- a/meta/recipes-devtools/python/python3-pytest_7.2.0.bb
+++ b/meta/recipes-devtools/python/python3-pytest_7.2.0.bb
@@ -26,7 +26,6 @@ RDEPENDS:${PN}:class-target += " \
     ${PYTHON_PN}-py \
     ${PYTHON_PN}-setuptools \
     ${PYTHON_PN}-six \
-    ${PYTHON_PN}-toml \
     ${PYTHON_PN}-wcwidth \
 "
 
-- 
2.39.1


