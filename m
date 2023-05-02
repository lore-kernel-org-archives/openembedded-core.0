Return-Path: <ernstp@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CCE76C7EE2A
	for <webhook@archiver.kernel.org>; Tue,  2 May 2023 17:35:05 +0000 (UTC)
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
 by mx.groups.io with SMTP id smtpd.web10.287.1683048902221013535
 for <openembedded-core@lists.openembedded.org>;
 Tue, 02 May 2023 10:35:02 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=XuDZ2eZ0;
 spf=pass (domain: gmail.com, ip: 209.85.208.173, mailfrom: ernstp@gmail.com)
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-2a8dc00ade2so40369121fa.0
        for <openembedded-core@lists.openembedded.org>; Tue, 02 May 2023 10:35:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683048900; x=1685640900;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c9qa96PH24ICXP0egFzhaAZEq5ySIu5wWdmy+CcWF48=;
        b=XuDZ2eZ0RLj+NJIp1C9ZUSy019ymq8EZZ02v0sVHM2eThC8kaCBxd720sgqXKDmPae
         +s/27Qp2NnMzoTKQmT5jJuknr9hn/dDPogS1uV8Wd3Fyw3fuukcCF68d+vPfnZoWlGRs
         Cnt4Dn0VY0kuKb6eV85x/n06kIln1MXe5nH7/GRMgVcpCayTAfvcWZnjzpDZiLruP5Js
         cwh5PQ4XwIIv17dfGXCEDTa5JJ97oIo3Mkv3l6tdBrquU8FcG+I+SKzbzgZC0yPtmCiz
         aGg8mDJMfP1I2sz2iklGCwXiJrXNBp97e/DEhzr5z3ILbQeU5rsyWM361tTJpYHouVH/
         XTDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683048900; x=1685640900;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=c9qa96PH24ICXP0egFzhaAZEq5ySIu5wWdmy+CcWF48=;
        b=gamjsOyDp28QbdKU0/ms7lasfuaIidJh2ESehqVyKH54lymo9rWEIEatXJmXmnref/
         zdtM3Iqt0TAcI5aYVuszJqGNP8Ti79qH2BBZwks3E8VP2tct+hc912EjN88d25GA2wem
         I3G5rFRugqjofUPSRUGPIs3ciXcksMPAEIYjxBvTFvAYB+3NFd6Pi4AAQLrofdUWXa4l
         76tmECWdjzAN6nDbqUCYCu7eCugpoCEIi1WPufAKzgm94R6/5wDRO5kL4VfE0k3TV3kt
         OYmCYTZcNudqVJjumR+lTI0PPd1KL9j113Q/IgEcZ3jlLLbJH8qHag5nwK2HYNwCPZF+
         WQpw==
X-Gm-Message-State: AC+VfDzB0sdKRPbVr6ht2q+6W/kYZJ85XPXWb4jStfTsuG4mF78617hb
	Pzf5VYjExxVXtNIyq8vVBRqEC9NhMPJKdg==
X-Google-Smtp-Source: ACHHUZ5w8qxe3ED94aAPAqFVGfbIrJX2rh39i/YPjS8WDGDE0U0dKDtGoxXa7TiRmhixC8aVeZh6Kg==
X-Received: by 2002:a19:ac06:0:b0:4ed:b061:18ee with SMTP id g6-20020a19ac06000000b004edb06118eemr197737lfc.22.1683048900333;
        Tue, 02 May 2023 10:35:00 -0700 (PDT)
Received: from localhost.localdomain (c83-254-134-100.bredband.tele2.se. [83.254.134.100])
        by smtp.gmail.com with ESMTPSA id m23-20020ac24297000000b004edc3bd7fa4sm5507879lfh.287.2023.05.02.10.34.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 May 2023 10:34:59 -0700 (PDT)
From: =?UTF-8?q?Ernst=20Sj=C3=B6strand?= <ernstp@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: =?UTF-8?q?Ernst=20Sj=C3=B6strand?= <ernstp@gmail.com>
Subject: [PATCH 3/6] python3-testtools: add fixtures to rdepends
Date: Tue,  2 May 2023 19:34:19 +0200
Message-Id: <20230502173422.1439794-3-ernstp@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230502173422.1439794-1-ernstp@gmail.com>
References: <20230502173422.1439794-1-ernstp@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 02 May 2023 17:35:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180758

Signed-off-by: Ernst Sjöstrand <ernstp@gmail.com>
---
 meta/recipes-devtools/python/python-testtools.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-devtools/python/python-testtools.inc b/meta/recipes-devtools/python/python-testtools.inc
index e004d0eb0b5..3321b040374 100644
--- a/meta/recipes-devtools/python/python-testtools.inc
+++ b/meta/recipes-devtools/python/python-testtools.inc
@@ -20,6 +20,7 @@ DEPENDS += " \
 RDEPENDS:${PN} += "\
     ${PYTHON_PN}-doctest \
     ${PYTHON_PN}-extras \
+    ${PYTHON_PN}-fixtures \
     ${PYTHON_PN}-pbr \
     ${PYTHON_PN}-six \
     "
-- 
2.39.2


