Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04D1EC05027
	for <webhook@archiver.kernel.org>; Fri,  3 Feb 2023 16:52:11 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.web11.16140.1675443126700830611
 for <openembedded-core@lists.openembedded.org>;
 Fri, 03 Feb 2023 08:52:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=DS77rKyg;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.44, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f44.google.com with SMTP id m5-20020a05600c4f4500b003db03b2559eso4319810wmq.5
        for <openembedded-core@lists.openembedded.org>; Fri, 03 Feb 2023 08:52:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=ZaZC1z5i2hVrnLl33ilnwc5rjJ308OKM6ZcDQaMEuC8=;
        b=DS77rKygv3whz+hb7KwWHvhFJxvZahuwDXFkEPbXv21aQqBUdmYvGHQXJY/DuwMmPO
         AqKzzP1d1oewQwNDyzuWIJAlZmWc63CuMazLEq1Ep8SVbmiYClAn1DBrRTwvRiXUt/mP
         DsPDCk0Wb5uUscRsWYw1OwkP63D615kelZVT0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZaZC1z5i2hVrnLl33ilnwc5rjJ308OKM6ZcDQaMEuC8=;
        b=dBrdfGRqB6WSbFfhxQur7mTpYZvKyclvgZt2VsJsKw63KBAQvn1yLAk3VRBw8BgnUa
         fc6Jn65Cqe7nsp1EUa9dLv03LeYQqNEEqmraS0qV0XhDadJi3+mhNc1bSvF+iji0kzsi
         3UdLKQTyghdD3+KYcRrYmVu1rnP7uWscpTTe5TahSUJ9YaYmX6byXQXLh923twRCfksP
         Ywz8OPhuaaJIYWmOFB3srJ1ATbvWSblyJ7BtJT3Xaen9sqvZUa3w3Sk8AYSsZokZa+Ex
         hzWXv/1JyG3bYwl/c/OKARAl+05k0QppfLn2LPHYYfJ3+9y4C85Oze6nbwvwhv1U7ofV
         38lg==
X-Gm-Message-State: AO0yUKWTdOi3k/y8flm8mO6BSx0q2FJ6Hk2bzavBFgkQ9GsVesPOpsw0
	g3dUQWYmPp3xPEGZclBKlKkgOW9kzy/Rg6c8
X-Google-Smtp-Source: AK7set8cTS+3HRCa8q1xFEm/lXkVbL/k4oyOeUiOiJybuX71p65uLchG73iR9rvePsxgNqnPIo1hhw==
X-Received: by 2002:a05:600c:3545:b0:3df:ea9a:21c7 with SMTP id i5-20020a05600c354500b003dfea9a21c7mr2266532wmq.33.1675443124790;
        Fri, 03 Feb 2023 08:52:04 -0800 (PST)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:a52f:3f73:91fb:2c5a])
        by smtp.gmail.com with ESMTPSA id j10-20020a05600c1c0a00b003dd1c45a7b0sm3587139wms.23.2023.02.03.08.52.04
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Feb 2023 08:52:04 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] perf: Enable debug/source packaging
Date: Fri,  3 Feb 2023 16:52:03 +0000
Message-Id: <20230203165203.1145313-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 03 Feb 2023 16:52:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176733

This was disabled in 2014[1] due to an error message which as far
as I can tell, no longer occurs.

Having debug information and source files present will make debugging
reproducibility issues much easier so remove this line as it appears
no longer needed.

[1] OE-Core revision c1b5a262c0201faf2c6bf545d6acb32dfe383ba3

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-kernel/perf/perf.bb | 2 --
 1 file changed, 2 deletions(-)

diff --git a/meta/recipes-kernel/perf/perf.bb b/meta/recipes-kernel/perf/perf.bb
index 1dff39a17e4..e8a9c57a0aa 100644
--- a/meta/recipes-kernel/perf/perf.bb
+++ b/meta/recipes-kernel/perf/perf.bb
@@ -360,6 +360,4 @@ FILES:${PN}-python = " \
                        "
 FILES:${PN}-perl = "${libexecdir}/perf-core/scripts/perl"
 
-
-INHIBIT_PACKAGE_DEBUG_SPLIT="1"
 DEBUG_OPTIMIZATION:append = " -Wno-error=maybe-uninitialized"
-- 
2.37.2


