Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 684DCC2BA16
	for <webhook@archiver.kernel.org>; Thu, 13 Jun 2024 14:20:53 +0000 (UTC)
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
 by mx.groups.io with SMTP id smtpd.web10.9677.1718288446500960956
 for <openembedded-core@lists.openembedded.org>;
 Thu, 13 Jun 2024 07:20:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=22JUsJfl;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.178, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-1f65a3abd01so9940335ad.3
        for <openembedded-core@lists.openembedded.org>; Thu, 13 Jun 2024 07:20:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1718288446; x=1718893246; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qYBxI1mLPp1NB5ZcBioeN9K7ufnU2uGItuqpqkN+5Oo=;
        b=22JUsJfla8jGQf3g6T/UL1yt96MwHi+Fa3x48Psy9LFQW98ikwnMMkYhvToPyLuJLs
         A9R8asVvp0lDTKguqyc8PITwO6dOAyC+t1o+cZAWXwXwJVcgz1E+1imzfgLuKY60jkwG
         33OvuuxbBYNc4MnDIIFqwXIJqfFO23vLyFrFMByknfNhUL3PalcHwtmZ03IuTMkSXTQi
         MKljHsR1/ax1K1Di2u9vqWHlSPBR/RzrQZ5HZtCrqsUOvdfB77Fpai87fgWRzyq4tqbA
         /Iho0zYZINYu/BL+1fi/RP4sz02cw2WlIndmmA3zRBFBFAXs9vw6G6zdPNlXzCVtXi11
         OueQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718288446; x=1718893246;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qYBxI1mLPp1NB5ZcBioeN9K7ufnU2uGItuqpqkN+5Oo=;
        b=hq7QpZ/6+c4IdQD02kXTtsoPIQiXsSl/MRJc3xe05RVMqT7RRzHm6wFzBL/+dtJSnJ
         23x/2uSpZCoJm9N9nT14qHmkUpnlJzCuMPCPpQRJcg1ORvWB0AcAxtWnvanrsyaU65iB
         i+YhZRe3mX78XYvcxGOWa/Sib0LmuEGWdjxNX5aEJkitUiem9b9jKjkYAzQTdsw2RK4x
         05T6KI/rWhDwaq5mkTIMpny5VqLeahNF8341tMaJRx/SOPGQwcSEw6sFTkP7eNpbaRVV
         Bt89Qxtb9hT/zmp+ri83ExdH1ZJFcckwVzlt8pg5mU8BVI63+Ka3TcSRYp8u7i0c5bk2
         zmAw==
X-Gm-Message-State: AOJu0YwJmtr8/7ApjRP9biel3f+GyGvP/MTXNmZnlcHpV1oNY/raHADz
	pJQAk3TAQ3weLhqx5ZrTidk0YoHOvkOxouSqtspmDHRGPcmdaSyWnbHm6kji/PpxxgM+2VadO0V
	a
X-Google-Smtp-Source: AGHT+IEmsy+cVBruJexWDt1xdlv7XF5Z5vx1+M1ttBYPopGoxHAQx11uMs1XSautEEjcApqCyiRh2A==
X-Received: by 2002:a17:903:32cd:b0:1f6:9181:47ac with SMTP id d9443c01a7336-1f83b5686e8mr67847475ad.1.1718288445776;
        Thu, 13 Jun 2024 07:20:45 -0700 (PDT)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f855e5b0dfsm14414665ad.29.2024.06.13.07.20.44
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Jun 2024 07:20:45 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 04/29] mesa: upgrade 24.0.3 -> 24.0.5
Date: Thu, 13 Jun 2024 07:20:09 -0700
Message-Id: <98246b4de12d619f188bb38ecd0255ae1cb03ea7.1718288230.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1718288230.git.steve@sakoman.com>
References: <cover.1718288230.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 13 Jun 2024 14:20:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200607

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
 https://docs.mesa3d.org/relnotes/24.0.5.html

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 5933d099c339596f62e1237d4e738dbe9f386b10)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../mesa/{mesa-gl_24.0.3.bb => mesa-gl_24.0.5.bb}               | 0
 meta/recipes-graphics/mesa/mesa.inc                             | 2 +-
 meta/recipes-graphics/mesa/{mesa_24.0.3.bb => mesa_24.0.5.bb}   | 0
 3 files changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/mesa/{mesa-gl_24.0.3.bb => mesa-gl_24.0.5.bb} (100%)
 rename meta/recipes-graphics/mesa/{mesa_24.0.3.bb => mesa_24.0.5.bb} (100%)

diff --git a/meta/recipes-graphics/mesa/mesa-gl_24.0.3.bb b/meta/recipes-graphics/mesa/mesa-gl_24.0.5.bb
similarity index 100%
rename from meta/recipes-graphics/mesa/mesa-gl_24.0.3.bb
rename to meta/recipes-graphics/mesa/mesa-gl_24.0.5.bb
diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
index 1c9fa66c72..77e9c80fcb 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -22,7 +22,7 @@ SRC_URI = "https://mesa.freedesktop.org/archive/mesa-${PV}.tar.xz \
            file://0001-Revert-meson-do-not-pull-in-clc-for-clover.patch \
 "
 
-SRC_URI[sha256sum] = "77aec9a2a37b7d3596ea1640b3cc53d0b5d9b3b52abed89de07e3717e91bfdbe"
+SRC_URI[sha256sum] = "38cc245ca8faa3c69da6d2687f8906377001f63365348a62cc6f7fafb1e8c018"
 
 UPSTREAM_CHECK_GITTAGREGEX = "mesa-(?P<pver>\d+(\.\d+)+)"
 
diff --git a/meta/recipes-graphics/mesa/mesa_24.0.3.bb b/meta/recipes-graphics/mesa/mesa_24.0.5.bb
similarity index 100%
rename from meta/recipes-graphics/mesa/mesa_24.0.3.bb
rename to meta/recipes-graphics/mesa/mesa_24.0.5.bb
-- 
2.34.1


