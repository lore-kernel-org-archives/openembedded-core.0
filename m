Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B055BD5B14E
	for <webhook@archiver.kernel.org>; Sat, 13 Dec 2025 10:02:49 +0000 (UTC)
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2927.1765620160682156400
 for <openembedded-core@lists.openembedded.org>;
 Sat, 13 Dec 2025 02:02:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=IFIY84rE;
 spf=pass (domain: gmail.com, ip: 209.85.214.179, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-29808a9a96aso27499735ad.1
        for <openembedded-core@lists.openembedded.org>; Sat, 13 Dec 2025 02:02:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765620160; x=1766224960; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HTBAga1YLw8pxrefzHKXmJQwkOQh+mROx71/k7UTpHo=;
        b=IFIY84rEDk345SmUM42aBo4IbWloYeqRVXj9t4944oA1AaIJ5MWPLA0r3h4gOxnSb0
         HLDpzPQERGYfr75cxRSGdCfmV6gRW8tyoJypw5Ap4c/HRly5R58i6oxBG8ignX8Bakum
         z0rFbgMLZEXvVwiC0pbDWPAOcxfdYtzMSbVPvZObeLqkiuZ2c7Eli1qWDBXAHI9g6J50
         IE8zNMfteRpKt9SGZF1ihSSmQiNmglFlnGw/rJnYBz+gt3zwW7QCNCF2AwvJEv/SSdam
         mnmRx/6qA5qDp88WSMnn5lFkSOx7snqcLAVfeLxcCfd7hOzh+DNjvaj2Fh8plHMniuUQ
         HdBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765620160; x=1766224960;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=HTBAga1YLw8pxrefzHKXmJQwkOQh+mROx71/k7UTpHo=;
        b=OSjvKiXRBOOZT3hbTv9SrdkfunO6Qq6nNfow/3apE10b0FKcmLv4ZHwRAzLhPrWTXG
         U9e8lzHjyLmU1LY4U/GNvof6lMvvvs0SQzbA3WROsCKhnJ00dcdtl1tgOGGS6bySlJyJ
         kLb5Qflrm62I7mksQDtRgIb2/iU7Gumq81wlMKrt9Wtl6ItH3L2RCgchHzE8RpEABBdW
         vVZCmffZm3FhMX2X2hKBU2wJviRvPx2Y2cr1jb6+5cjvA8kRc4cv0CqQdyvAtIPgZm46
         aXGE4U1z/ns96uvqpbS/8/aYa2UCnaHxZXE5BbDm9LHFIUb7c1oQK3VAtJPeclSjdtQW
         hZBA==
X-Gm-Message-State: AOJu0Ywya0lyEU898AwIq5Uv4t1Go+HSVMgxqYaOP0cgBpmAfg5E3x+x
	H3qakc6FbAhOUjYA4FfPEuOQY1vlY2vy+4nquhavG2Bd+WTsKWCkoA0X62lpTdXk
X-Gm-Gg: AY/fxX4g1fvNwIm5KCN1Y9ux0bBoubnbFPHUHgAEi5gfuM3huxn1uJdtaOVg7QouGeb
	aPT6yuQQPplIKutum21/mAubXgFEwa9CRjlHXyY6JUx+3KEXZdF5wIYDoMNtqOQA7YXCLnG2UGY
	e/KUPhY2+1ZvSL3KQ2PbATO1pmeBauuSA2A0Ok5OQtzKpo4AOoujdimUZemNIl3Mn1KuBYBXAXc
	G16nVAYelLdJqf/83MrhYdBGuUNe2Sy3Qxv06Yy4F7oktADypQhq8ArzJibh4iQO6nJeDfvHXQJ
	OyJvPckOwaj8nTezAJfHQGrgLqJ2NgAV9QoqZa9Hl25d9nR/B5KYp5HitjKTO92Me2Oq285Gy4y
	PfNkNi/IJG2nDRtWspMoCnKN5uBfYrsQQCnQ9XjpjklZ0Xb7MUEE34f2Xq8YhYOIsh1Qnznv+qG
	uDc2lROknjDGO21x/wH9EnrXPx
X-Google-Smtp-Source: AGHT+IFQUcgD88lr9BroR8IMJ8DKFmPFLTdOFaLad3PyWXUbKFh1+qJVNumutWkxXIoUEALLo+5LcQ==
X-Received: by 2002:a17:903:17cc:b0:29f:178f:f363 with SMTP id d9443c01a7336-29f24151688mr42423625ad.32.1765620159874;
        Sat, 13 Dec 2025 02:02:39 -0800 (PST)
Received: from NVAPF55DW0D-IPD.. ([136.226.230.115])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a082b13b6bsm26173725ad.99.2025.12.13.02.02.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Dec 2025 02:02:39 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>,
	Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [OE-core][whinlatter][PATCH 64/67] libinput: upgrade 1.29.1 -> 1.29.2
Date: Sat, 13 Dec 2025 15:29:28 +0530
Message-ID: <20251213095931.2571498-64-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251213095931.2571498-1-ankur.tyagi85@gmail.com>
References: <20251213095931.2571498-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 13 Dec 2025 10:02:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227682

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Release Notes:
https://gitlab.freedesktop.org/libinput/libinput/-/releases/1.29.2

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 4cd78e63cbf4edaeac1fc9f46fb737e1356e3f1b)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../wayland/{libinput_1.29.1.bb => libinput_1.29.2.bb}          | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/wayland/{libinput_1.29.1.bb => libinput_1.29.2.bb} (97%)

diff --git a/meta/recipes-graphics/wayland/libinput_1.29.1.bb b/meta/recipes-graphics/wayland/libinput_1.29.2.bb
similarity index 97%
rename from meta/recipes-graphics/wayland/libinput_1.29.1.bb
rename to meta/recipes-graphics/wayland/libinput_1.29.2.bb
index 809c291e23..f771085388 100644
--- a/meta/recipes-graphics/wayland/libinput_1.29.1.bb
+++ b/meta/recipes-graphics/wayland/libinput_1.29.2.bb
@@ -15,7 +15,7 @@ DEPENDS = "libevdev udev mtdev"
 SRC_URI = "git://gitlab.freedesktop.org/libinput/libinput.git;protocol=https;branch=1.29-branch;tag=${PV} \
            file://run-ptest \
            "
-SRCREV = "dc2c1ad181be88e1487468f7ca6f9d320981f133"
+SRCREV = "917783150a5bab7d55eedc5714f1b49b192426ac"
 
 UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>\d+\.\d+\.(?!9\d+)\d+)"
 

