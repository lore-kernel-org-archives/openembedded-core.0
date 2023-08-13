Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F25C4EB64DD
	for <webhook@archiver.kernel.org>; Sun, 13 Aug 2023 21:18:58 +0000 (UTC)
Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
 by mx.groups.io with SMTP id smtpd.web11.93765.1691961533193774004
 for <openembedded-core@lists.openembedded.org>;
 Sun, 13 Aug 2023 14:18:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=KHPiV0Fw;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.171, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-53fbf2c42bfso2827255a12.3
        for <openembedded-core@lists.openembedded.org>; Sun, 13 Aug 2023 14:18:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1691961532; x=1692566332;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9dNKEzIv8K35X2oHbhtt1tirDQGddFh7kL0PwSNic7w=;
        b=KHPiV0FwSgj0oLB74MO9pnRjEqkuQmsqbA8mPnqL3kyHWFKki8zogE37Ku5wqX3UtI
         2v9uRs81GWoWoL+WugqUyBq2/SxmSs9pri8rmGGsYCXRJsoRl8PS6NZFimEUWYpO4L7p
         D0ZppJoYUwY8MgmBpJ3Qo9r+mnP32ktOEdAkvxswULOoJtZLwA85wcio4yMp58DA6CPF
         mgPuM85XHl8/FHpLrjs3Nc93G61bhHQ/FxGwaWyVnNmBmqkItHkUE3uWpa/hTVPUCnP1
         hPWGniAkGqCqbLdIVL2IrFuPEHZQEg+RsZl4PBQv6U1bYglqy2gelW9hAaT6cpIWqbyq
         +/og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691961532; x=1692566332;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9dNKEzIv8K35X2oHbhtt1tirDQGddFh7kL0PwSNic7w=;
        b=Rn8NCRiQVNE0+gQHu1hCSWmOLlojCAj/CF9wfPmp/MStCdsZ5iUudy3QKeTCVTmZBU
         wzuDmEsokYNtIHYKfc4jvG36oERexuw9sxIlYj6BlZlh1e9RZeqk3uYZb7DXHPRwJ1Lu
         PJbanvUlNuVvs+nPaEt4grJTHeQSDld3KAb+mGUA7rutE2/w5YeF4eK7wM2Xb8o/4LXn
         MrBPg/oKcpWsP2Mw0kmEhNX+syPpK5MKmv3ilUHwwUvyAhWT3D+Ga0rluAdp9lBM6tr2
         b2f1xoHhs5nIYwCesimw35mCnfNpx6F1wAOYnhcHlVo+gR/Lw/kDNwx+0LvZorPJ0bUk
         netA==
X-Gm-Message-State: AOJu0YwQhPDdjD2iUFfUtYgdQJqH7BQksG+pV4e2+Ki3pDm64m+ccdg3
	YhxEqMTIylpt+9q47lorjfGoJMNa8Kt9BCAhu9I/AQ==
X-Google-Smtp-Source: AGHT+IHhkPY/gbKe5hvF58CK8aTaTKStWFeOrncFYLmVroZKNYUxWe7ILdCEtjmpAbUwhISjeOiQYw==
X-Received: by 2002:a17:902:f68d:b0:1bc:14f0:b76c with SMTP id l13-20020a170902f68d00b001bc14f0b76cmr9294093plg.65.1691961532228;
        Sun, 13 Aug 2023 14:18:52 -0700 (PDT)
Received: from hexa.lan (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id qa2-20020a17090b4fc200b00263dfe9b972sm8690578pjb.0.2023.08.13.14.18.51
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Aug 2023 14:18:51 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 02/22] python3: ignore CVE-2023-36632
Date: Sun, 13 Aug 2023 11:18:08 -1000
Message-Id: <b66a677b76c7f15eb5c426f8dc7ac42e1e2e3f40.1691961051.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1691961051.git.steve@sakoman.com>
References: <cover.1691961051.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 13 Aug 2023 21:18:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185893

From: Peter Marko <peter.marko@siemens.com>

This CVE shouldn't have been filed as the "exploit" is described in the
documentation as how the library behaves.

Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit c652f094d86c4efb7ff99accba63b8169493ab18)
Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/python/python3_3.8.17.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-devtools/python/python3_3.8.17.bb b/meta/recipes-devtools/python/python3_3.8.17.bb
index 8c00d65794..00c4ff497a 100644
--- a/meta/recipes-devtools/python/python3_3.8.17.bb
+++ b/meta/recipes-devtools/python/python3_3.8.17.bb
@@ -61,6 +61,8 @@ CVE_CHECK_WHITELIST += "CVE-2020-15523 CVE-2022-26488"
 # The mailcap module is insecure by design, so this can't be fixed in a meaningful way.
 # The module will be removed in the future and flaws documented.
 CVE_CHECK_WHITELIST += "CVE-2015-20107"
+# Not an issue, in fact expected behaviour
+CVE_CHECK_WHITELIST += "CVE-2023-36632"
 
 PYTHON_MAJMIN = "3.8"
 
-- 
2.34.1


