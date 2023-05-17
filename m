Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05FA6C7EE2D
	for <webhook@archiver.kernel.org>; Wed, 17 May 2023 02:44:57 +0000 (UTC)
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
 by mx.groups.io with SMTP id smtpd.web11.40819.1684291489720972678
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 May 2023 19:44:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=0D35dpGc;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.172, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-52160f75920so98935a12.2
        for <openembedded-core@lists.openembedded.org>; Tue, 16 May 2023 19:44:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1684291489; x=1686883489;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1vFhBnYMxnIBCxY+342PrfnnuaGtOsNOYF0Bn2Ps59w=;
        b=0D35dpGc+BjvrCMrv1v95R3MyLag958nfaPbilAe0EvOFnXLTiOMBSEUnvI8FrpPXd
         TwUlBzkzIMnDSepQjdCLiNDpuf3Z3zRg6M5xPRV2dbA9JYHi5JLIlQQvI2w2dRIRf73T
         50TBtZpukgf3BxJ48y0r/t16KbSdGgDsjcYKs2tzNuRN5W7wWKrES1euCsVBVkZHWOtA
         9JZTsD5eZc1NDFJF+xwthT9DUYfwZYTdaMf9S2vjr/G95WZBcF1qav5IksnxXIc1LsKe
         vhnLB0HCqLdg0nkPOxJoQR0fAorOkkSyZVp4P3a9/w4wxHe9kRuz+TaWWcV439fYrIlr
         voPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684291489; x=1686883489;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1vFhBnYMxnIBCxY+342PrfnnuaGtOsNOYF0Bn2Ps59w=;
        b=HNXOBnqXM4Kvk+9ZDi4gMM4D4G+htxX4A4CJVbHSEM56glB9L579BC+vPJjsT1Mopx
         Nr/e71dCCLg5njld4wGh2ywHMwYICYZ/BZbVGSb3IJR7JXmBwk87Tfi/uzsYjUFGAPrY
         lIlyzb2ViN6B+TENK9XKQlLNtpi+zZT8Hc1vdAgfKNvhr9CycSVeNtASFL22TMMpNU90
         +wrThJgOU7zYc6yeQuX/FfcK08VWraPldm59BsGeW5eBMYRq5igzEwrY9VQnfhpWVLtq
         qKcfP84k/80Q9keyQhju92R6Zg4cSPWVA8QMyrq9vWxnKQ8WjHetsbpbJIpWbg/FWRe/
         2Y/Q==
X-Gm-Message-State: AC+VfDztyNWd4gDrZJK/o8wu+cOX2812vWUwnSL+lCwiLz9tKcwOHSw5
	aSf52AQzpJxvO6JiewdtS63KWuVkNpf2Qm9SSHU=
X-Google-Smtp-Source: ACHHUZ5OOH+N//VXlvJ5B1X+C/3hR+qe3yBybfM2XYtwOifQvDLyvmBwQN5ZCLHujSYVZMT+y7sRRQ==
X-Received: by 2002:a17:902:e845:b0:1ac:63ac:109d with SMTP id t5-20020a170902e84500b001ac63ac109dmr45653727plg.15.1684291488786;
        Tue, 16 May 2023 19:44:48 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id bj11-20020a170902850b00b001a2135e7eabsm16282767plb.16.2023.05.16.19.44.47
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 May 2023 19:44:48 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][mickledore 02/13] qemu: Whitelist CVE-2023-0664
Date: Tue, 16 May 2023 16:44:25 -1000
Message-Id: <5474b4d8c5df31abb69e1a5be01cd089405d1cce.1684291329.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1684291329.git.steve@sakoman.com>
References: <cover.1684291329.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 17 May 2023 02:44:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181431

From: Virendra Thakur <virendrak@kpit.com>

This CVE is related to Windows.

Link: https://nvd.nist.gov/vuln/detail/CVE-2023-0664

Signed-off-by: Virendra Thakur <virendrak@kpit.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit d5ce88c15183c2bf887543c8c31e9c31aaa56a1a)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/qemu/qemu.inc | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index 29bc34d743..4c9be91cb0 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -55,6 +55,11 @@ CVE_CHECK_IGNORE += "CVE-2007-0998"
 # https://bugzilla.redhat.com/show_bug.cgi?id=1609015#c11
 CVE_CHECK_IGNORE += "CVE-2018-18438"
 
+# As per https://nvd.nist.gov/vuln/detail/CVE-2023-0664
+# https://bugzilla.redhat.com/show_bug.cgi?id=2167423
+# this bug related to windows specific.
+CVE_CHECK_IGNORE += "CVE-2023-0664"
+
 COMPATIBLE_HOST:mipsarchn32 = "null"
 COMPATIBLE_HOST:mipsarchn64 = "null"
 COMPATIBLE_HOST:riscv32 = "null"
-- 
2.34.1


