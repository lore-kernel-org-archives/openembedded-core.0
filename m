Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8689CC761A6
	for <webhook@archiver.kernel.org>; Tue,  4 Apr 2023 15:15:42 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.web10.104470.1680621333132343398
 for <openembedded-core@lists.openembedded.org>;
 Tue, 04 Apr 2023 08:15:33 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20210112 header.b=ptSal5+k;
 spf=pass (domain: gmail.com, ip: 209.85.128.41, mailfrom: martin.jansa@gmail.com)
Received: by mail-wm1-f41.google.com with SMTP id o32so19245933wms.1
        for <openembedded-core@lists.openembedded.org>; Tue, 04 Apr 2023 08:15:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680621331; x=1683213331;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=b//CViMkK4Iab2wI+PjEd49slaTgyQWn08VqRp3FLnE=;
        b=ptSal5+kW1bUeYZeGU4JmelRuKqoL7mcTsC8KVGnHj1hFud0BSjIETpTAn1sGAaGdj
         ljeakWFyAjLKLeaLyz7qkc0ma5qyAyo0TVBJR8Laa86BSHTQhWWI1q2RRsDR1BrsKESb
         jB5IMpN9/S7XXj/mXhpXDjK9l7GqTmeMjKupLR+wMFX1eknZ3Xz4F3Dmlmz6Eyy0Inzm
         0eGwks4dMye480D8ALpl0SBjKVZ2fy2JI3jTHXmZO2EMTYILPR8kPVMJcvOt6/FUf7F6
         hZzadBZF3V/q6Hs39qkmvPT0/hfCOzVBQaN/bLMGkdb7AzamffrtBKzte8JjrmsoUp+7
         1AeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680621331; x=1683213331;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=b//CViMkK4Iab2wI+PjEd49slaTgyQWn08VqRp3FLnE=;
        b=0tgVYdY9ttESmuPs54e3UbhejOedWl+m8TFRHOMIztXTcKDa1kzbqH3fjf3zPdESnL
         Xl1r7VTwysQoQEVlCsUjs4Nwiv/iJGF09BsnmMf7v2hWiDOhX8P6KOGu1JjZGB3m5SY8
         Bw8dMxH1q3ojRvacor2X8Mt2dj16ZOnAk6LLn/8grrYp+9yN9np35PKI+Ouy2G24iPXx
         vhzfik95WKbN2fpUpI/kWAwBup7zZMdCE9IQokgRra6MYVIxpa5lFgaPbVqfIkpkVm4g
         910fUD6CoaghM1styIFFWho/IYE54evvAB1KL0zQPqNbp9lLYValvCmTS3pJglH5m8FA
         g96g==
X-Gm-Message-State: AAQBX9fhjAara0B63Q7A5bhJ6C3/MPNfBCjJ+EmnGbkLYS6Zw2jW00lb
	c7ZoZLr/JV+afmR00KuPxLgmocU8UG8=
X-Google-Smtp-Source: AKy350ZzPsWvJNVr99ML3hw5kIR6RKkQXPhcb912ZyUPjoBNKl5vOqbkxqW6TVb2LvIaGDE8bqcNkQ==
X-Received: by 2002:a1c:7408:0:b0:3ee:1acd:b039 with SMTP id p8-20020a1c7408000000b003ee1acdb039mr2411972wmc.34.1680621331466;
        Tue, 04 Apr 2023 08:15:31 -0700 (PDT)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id z15-20020adfec8f000000b002cf1c435afcsm12506571wrn.11.2023.04.04.08.15.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Apr 2023 08:15:31 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: steve@sakoman.com,
	Michael Halstead <mhalstead@linuxfoundation.org>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [kirkstone][PATCH 2/3] uninative: Upgrade to 3.8.1 to include libgcc
Date: Tue,  4 Apr 2023 17:15:19 +0200
Message-Id: <20230404151520.2078894-2-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230404151520.2078894-1-Martin.Jansa@gmail.com>
References: <20230404151520.2078894-1-Martin.Jansa@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 04 Apr 2023 15:15:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179697

From: Michael Halstead <mhalstead@linuxfoundation.org>

Including libgcc solves issues with libpthread.

Signed-off-by: Michael Halstead <mhalstead@linuxfoundation.org>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/conf/distro/include/yocto-uninative.inc | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta/conf/distro/include/yocto-uninative.inc b/meta/conf/distro/include/yocto-uninative.inc
index 7012db441b..51c0cdee43 100644
--- a/meta/conf/distro/include/yocto-uninative.inc
+++ b/meta/conf/distro/include/yocto-uninative.inc
@@ -7,9 +7,9 @@
 #
 
 UNINATIVE_MAXGLIBCVERSION = "2.36"
-UNINATIVE_VERSION = "3.7"
+UNINATIVE_VERSION = "3.8.1"
 
 UNINATIVE_URL ?= "http://downloads.yoctoproject.org/releases/uninative/${UNINATIVE_VERSION}/"
-UNINATIVE_CHECKSUM[aarch64] ?= "6a29bcae4b5b716d2d520e18800b33943b65f8a835eac1ff8793fc5ee65b4be6"
-UNINATIVE_CHECKSUM[i686] ?= "3f6d52e64996570c716108d49f8108baccf499a283bbefae438c7266b7a93305"
-UNINATIVE_CHECKSUM[x86_64] ?= "b110bf2e10fe420f5ca2f3ec55f048ee5f0a54c7e34856a3594e51eb2aea0570"
+UNINATIVE_CHECKSUM[aarch64] ?= "3f15d420049b21854bd7a8843da0f42f17064559492c8b752d7a6f998ff5ea65"
+UNINATIVE_CHECKSUM[i686] ?= "a6dcf316d738ade2e5e463bd3b33a270b4bfc25bba41770ad5cbdc3b0e24044c"
+UNINATIVE_CHECKSUM[x86_64] ?= "5fab9a5c97fc73a21134e5a81f74498cbaecda75d56aab971c934e0b803bcc00"
-- 
2.40.0


