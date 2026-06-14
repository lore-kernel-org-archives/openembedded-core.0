Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32699CD98D6
	for <webhook@archiver.kernel.org>; Sun, 14 Jun 2026 08:03:40 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.105042.1781424218236437290
 for <openembedded-core@lists.openembedded.org>;
 Sun, 14 Jun 2026 01:03:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=NTMXuBgq;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.41, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-49222b6e871so8322155e9.3
        for <openembedded-core@lists.openembedded.org>; Sun, 14 Jun 2026 01:03:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1781424216; x=1782029016; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ls/Vw1jmtS0wSTFhpYzh0Afhi0uwIz3HjhpL5TeTzJc=;
        b=NTMXuBgqjkj0W1lDigHnDAjdXgrjiQ56NuU1SuSUSaM3rfGHE4QTeb7m1XLPFxTPJk
         f/hSxxDnBQ+blVYh9/MfmjUi77BGvzRsU7/7Zl49TV2RqLkYtUlEEm0/4EUnLsbb0b3w
         6I0M52j9THiLTx074MWpoPa8rwzDQ+s8IeMUc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781424216; x=1782029016;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ls/Vw1jmtS0wSTFhpYzh0Afhi0uwIz3HjhpL5TeTzJc=;
        b=ALhSWmGqPtc1BEIvNgdp5pdEqaylzYrdV4t3rL63TiBQWxN49izs3BLhKqxzFolusb
         wqgD37xipJicypzNh0F/OachiQa2XS9WOoJJFcM0/yk/wuyu2SmAz6RTyuwkvCd7pfKp
         Vf+kDhKrwxSGNCe+wwWMuPmGEMp+gYot4enOBq01QxB7FDk9cQ54CuJzgUGepMZEPzTG
         xUfGP3BVfjcoXFso2O9ftZchWzcsz1ssWD/tOiu/wPpJLGqNxxOP6uzXC3+NegRA9m66
         i/MfBHftv9mSrR/5X7Qcs56Usi0fhF4854yA2U/IT0M4HGub2TSdmXS68CwRwfehMMhA
         M5aA==
X-Gm-Message-State: AOJu0YxGiX/i/PDxOZKRea3Fas7GwAp/oCSWbRdHTW3f+BR9bqbMppPM
	uPhrViv82tPbgciud83zKSSoktBlIIh+AjRYObirpZ9PGjizXNgoBjXZcSaYx/ynqJfP0VKrsDp
	bWogK
X-Gm-Gg: Acq92OEf7aiLwsl0ffeGWM1anJc4QS02kqVQ7L10mlk8kldp8+8kSrMocXyjLN6UZlD
	N3wzCYmlR6MdLvQr/DioZUA8irIU8/8JbnE3k+vdmwdz9vD29iNfNnscmftFWMjaGVZGA8OPVOc
	ld+0Endlp1zDt8MKzoePrIcdLhOm9JRqV7bj7nI+n1gWAYwUJ6c4/PCbLmhsJQBoYvTsOQVuVab
	VqRDiC4I74DZBMfgc9rFFaT9OXqE+UkePL6Za8vFik9GGucsKk0+MDBZwFLaWpVcWlYdPyMtBdM
	NslFcCgio8eIP2d0urLQvfsw+rt1CCwWyN1L0jVOHim9V8pZD3DpJjNKAhp6hKXsYUKnb1JqUG4
	s7CUYm0BwDjAaB6td3htqUyvw2ilYL6XgPr98PRcQ6nxMGKdac8NgPY5Xx0yzlO/52+eiSi0Kzp
	SAnfgDiK/lE8ihh4QPxabcX79X+K2NgR6ab6IwmVi2CG99tIQWX7Cj
X-Received: by 2002:a05:600d:8486:10b0:490:5074:651e with SMTP id 5b1f17b1804b1-490ec507e9emr83824285e9.25.1781424216388;
        Sun, 14 Jun 2026 01:03:36 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:b23b:4f5a:d2e8:6789])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-492202edf89sm149999065e9.1.2026.06.14.01.03.34
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Jun 2026 01:03:34 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 17/56] libdrm: upgrade 2.4.133 -> 2.4.134
Date: Sun, 14 Jun 2026 09:02:28 +0100
Message-ID: <20260614080307.4017177-17-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260614080307.4017177-1-richard.purdie@linuxfoundation.org>
References: <20260614080307.4017177-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 14 Jun 2026 08:03:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238701

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../drm/{libdrm_2.4.133.bb => libdrm_2.4.134.bb}                | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/drm/{libdrm_2.4.133.bb => libdrm_2.4.134.bb} (97%)

diff --git a/meta/recipes-graphics/drm/libdrm_2.4.133.bb b/meta/recipes-graphics/drm/libdrm_2.4.134.bb
similarity index 97%
rename from meta/recipes-graphics/drm/libdrm_2.4.133.bb
rename to meta/recipes-graphics/drm/libdrm_2.4.134.bb
index afddb21e0a2..d344dc830fc 100644
--- a/meta/recipes-graphics/drm/libdrm_2.4.133.bb
+++ b/meta/recipes-graphics/drm/libdrm_2.4.134.bb
@@ -13,7 +13,7 @@ DEPENDS = "libpthread-stubs"
 SRC_URI = "http://dri.freedesktop.org/libdrm/${BP}.tar.xz \
           "
 
-SRC_URI[sha256sum] = "fc68f9d0ba2ea63c9432a299e14fea09fad7a8a66e8039fcd7802ca59f77b4f5"
+SRC_URI[sha256sum] = "ac5e74d157830eb8bee44c6a6bf3ad49774ef0dd2a72bdad74a8f20308b52a95"
 
 inherit meson pkgconfig manpages
 

