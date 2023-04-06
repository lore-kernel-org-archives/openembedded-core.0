Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D8B0C77B6F
	for <webhook@archiver.kernel.org>; Thu,  6 Apr 2023 16:02:36 +0000 (UTC)
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
 by mx.groups.io with SMTP id smtpd.web11.162531.1680796946727881274
 for <openembedded-core@lists.openembedded.org>;
 Thu, 06 Apr 2023 09:02:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=0zhgnDMe;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.170, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f170.google.com with SMTP id y2so26072619pfw.9
        for <openembedded-core@lists.openembedded.org>; Thu, 06 Apr 2023 09:02:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112; t=1680796946; x=1683388946;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EqHsZdI+56VguszBP+3kQ0EH/f89RdfyP19rdBlNR64=;
        b=0zhgnDMe37UGgTTHIbzpGdOxWpPyrfmE0cIkINoeo6S0M1hb+gqAicLU6nwB4Cpr1O
         D6JPPHGbPsE72IoSht/qYim63bDAMwv0R0VX+MTRt2e7M4CCuu1yJ/Mn90jgoXcurUqI
         1jkAY5NFPWT1YDzSyLioHzyjY4ld2uAeDzduH1Tzwa2UENvOjpLrz4CxWw7LKbZyI3mo
         aCuudHQcPL/UysL73qICPkrI+pGBUtRfIcu67gFyel0jeXNInvOtRrzCj35RNLitDU/O
         gh1gIUuOy7SEVBnRNvkeqL02q4HgBMqKjyJHLJNqpuUmaw9G1jeQgK/m8i8XVq6TKhEa
         1Ipg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680796946; x=1683388946;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EqHsZdI+56VguszBP+3kQ0EH/f89RdfyP19rdBlNR64=;
        b=IS+6FWirFGZ69JTA4nPfPWcTDlsdS1Q4NU1zpNCpyzYreZ3pXTDzRpqJ2c5zKPkFCe
         8BMF7fuUsiXgL6lgbHbSYC6NPnzU8J+yNDcteXVushjm5NoJribfqSOTLtsqJuij7ZyI
         llhktlKgla/4DeLyvuAX9PRmzCZdQN1/e2dRqTlHGZlZ5owMyUlnaJIT8+z+NZM8fare
         Wvf6kflQ3XTPx+smQYxkvrLXcK/W6y5PLLTTDhIYE3K3OAjkbkLvd2mbvvAHaGHAmOUt
         wJ7NQYMQojsaqCtJ+x8LhjJ9q3egvLwrk2ae2A57y0IW9llQV8w0m86QcwW43veU6xsg
         sE6A==
X-Gm-Message-State: AAQBX9fiRVFNECQrTXD9rTOBoLE1FHIddfO1dQ44+GST+10pB+r6VZWa
	b8eYxXC2QGeFECppi4ow49iD1hBdMUNuFVRxlKQ=
X-Google-Smtp-Source: AKy350ZAnO5kDdqgtKHl3y8870Vm8o9aSSSiRYai1KoYSFX+9Z6U4XGo2Jq7fuSM1/nyDXlC9HyTcw==
X-Received: by 2002:a62:19c2:0:b0:624:9205:977d with SMTP id 185-20020a6219c2000000b006249205977dmr9470108pfz.27.1680796945724;
        Thu, 06 Apr 2023 09:02:25 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-4-112.hawaiiantel.net. [72.253.4.112])
        by smtp.gmail.com with ESMTPSA id b13-20020aa7870d000000b0062e26487e7esm1532588pfo.155.2023.04.06.09.02.24
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Apr 2023 09:02:25 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][langdale 04/26] uninative: Upgrade to 3.9 to include glibc 2.37
Date: Thu,  6 Apr 2023 06:01:31 -1000
Message-Id: <e8bcd269f42f7c8e7a67dd1c28f76cca682efab0.1680796770.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1680796770.git.steve@sakoman.com>
References: <cover.1680796770.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 06 Apr 2023 16:02:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179782

From: Michael Halstead <mhalstead@linuxfoundation.org>

Update uninative to work with the new glibc 2.37.

Signed-off-by: Michael Halstead <mhalstead@linuxfoundation.org>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/conf/distro/include/yocto-uninative.inc | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/meta/conf/distro/include/yocto-uninative.inc b/meta/conf/distro/include/yocto-uninative.inc
index 51c0cdee43..8a5cab5360 100644
--- a/meta/conf/distro/include/yocto-uninative.inc
+++ b/meta/conf/distro/include/yocto-uninative.inc
@@ -6,10 +6,10 @@
 # to the distro running on the build machine.
 #
 
-UNINATIVE_MAXGLIBCVERSION = "2.36"
-UNINATIVE_VERSION = "3.8.1"
+UNINATIVE_MAXGLIBCVERSION = "2.37"
+UNINATIVE_VERSION = "3.9"
 
 UNINATIVE_URL ?= "http://downloads.yoctoproject.org/releases/uninative/${UNINATIVE_VERSION}/"
-UNINATIVE_CHECKSUM[aarch64] ?= "3f15d420049b21854bd7a8843da0f42f17064559492c8b752d7a6f998ff5ea65"
-UNINATIVE_CHECKSUM[i686] ?= "a6dcf316d738ade2e5e463bd3b33a270b4bfc25bba41770ad5cbdc3b0e24044c"
-UNINATIVE_CHECKSUM[x86_64] ?= "5fab9a5c97fc73a21134e5a81f74498cbaecda75d56aab971c934e0b803bcc00"
+UNINATIVE_CHECKSUM[aarch64] ?= "de35708c95c34573af140da910132c3291ba4fd26ebf7b74b755ada432cdf07b"
+UNINATIVE_CHECKSUM[i686] ?= "adac07b08adb88eb26fc7fd87fee0cec9d5be167bf7c5ffd3a549a2a6699c29c"
+UNINATIVE_CHECKSUM[x86_64] ?= "3dd82c3fbdb59e87bf091c3eef555a05fae528eeda3083828f76cd4deaceca8b"
-- 
2.34.1


