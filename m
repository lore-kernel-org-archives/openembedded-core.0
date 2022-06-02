Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61895CCA473
	for <webhook@archiver.kernel.org>; Thu,  2 Jun 2022 02:31:27 +0000 (UTC)
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com
 [209.85.216.43])
 by mx.groups.io with SMTP id smtpd.web08.2149.1654137080707820637
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Jun 2022 19:31:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=GPf7wNO/;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.43,
 mailfrom: steve@sakoman.com)
Received: by mail-pj1-f43.google.com with SMTP id
 o6-20020a17090a0a0600b001e2c6566046so8085818pjo.0
        for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Jun 2022 19:31:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=+q/pOziGoNJDL9O2OpQrrUt59Lmf8xuQ962W23B364g=;
        b=GPf7wNO/SPrQiVMLTn9UpUZ85yysuSZL75QPImcufRXqLAcHPLINRI/loMEmmVeItJ
         kT6E/usdMAxFfrvQfEFXo6cYjI9lWlibqyozTc3KQ8zpfwVYLjYaz/jnnK6Ily9BHlqm
         aoUPAZLURZtGhW0aPNYdXLxixlrXCO5ib2EBauCTDuK6T7BS4zalljR44hewj8jpEsMh
         rhZ3HwoXJvHF2pgbIdSirEW9udJtUlCGUYBBy859dtdpZtRHQ3HCDYM1wE6RgLec6TZc
         gkIsrOuiz6u1vyqHg88REXeNa1ozLp4B3YKk0MjwKABCVZ1g7JmmLXjGfhq03sNFgN55
         fySw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=+q/pOziGoNJDL9O2OpQrrUt59Lmf8xuQ962W23B364g=;
        b=UkZrmUXYshQFZa9nGOagzAX3OpUv3Nc2FtYud4EXHVmpVCOY15CiT5vSKdCITQYvaJ
         bPtuH+k2JMHsPZ8Bh6AUnt4gtdI28s++RhUOSjORFb/JP0K6S3Ri0kSlcR0ncdr/QNsk
         MIOgjlciZw2NOPlVhWelQipyygM1QqCwGohtLUAGins8wAaYk/zfqtdGdsuM6yfddaRr
         fyaMjVlWUxsiEHI3hH1RVJVsKp7zzMTSeCqqW7gBoW2kNeXFFAKrDSfQhkymegOEz22o
         d1ocEiRrh4TxHpe7x/q5ozdv94TV4Z2UESi2UClIiv/WxTvcDRinwCzyUykb/wlhqloO
         0Oxw==
X-Gm-Message-State: AOAM530c1UPx0+sNz+c3ALFwEPFpaTGU38CPOlECdAGQZe0urpoowUtC
	pU5F7j34sKt5bqmkyhEr7axs2ClJrt6uQXkq
X-Google-Smtp-Source: 
 ABdhPJyWW5ul4WVzqn4vR3XMMRmmYwxNvjX7BRIc6MTKiO7pdcHkNw4rFuKO0PXcHpke05eKHpaJJg==
X-Received: by 2002:a17:903:244d:b0:166:3983:5569 with SMTP id
 l13-20020a170903244d00b0016639835569mr2492313pls.44.1654137079623;
        Wed, 01 Jun 2022 19:31:19 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 j23-20020a63ec17000000b003fc37053c82sm1990447pgh.12.2022.06.01.19.31.18
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jun 2022 19:31:18 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 02/11] ruby: Whitelist CVE-2021-28966 as this
 affects Windows OS only
Date: Wed,  1 Jun 2022 16:30:42 -1000
Message-Id: 
 <df6242b72b0477fb61c7dc18ad52a1f147ec7d07.1654136888.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1654136888.git.steve@sakoman.com>
References: <cover.1654136888.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 02 Jun 2022 02:31:27 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166450

From: Ranjitsinh Rathod <ranjitsinh.rathod@kpit.com>

As per below debian link, CVE-2021-28966 affects Windows only
Link: https://security-tracker.debian.org/tracker/CVE-2021-28966

Signed-off-by: Ranjitsinh Rathod <ranjitsinh.rathod@kpit.com>
Signed-off-by: Ranjitsinh Rathod <ranjitsinhrathod1991@gmail.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/ruby/ruby_2.7.6.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/recipes-devtools/ruby/ruby_2.7.6.bb b/meta/recipes-devtools/ruby/ruby_2.7.6.bb
index 658a17659a..3af321a83e 100644
--- a/meta/recipes-devtools/ruby/ruby_2.7.6.bb
+++ b/meta/recipes-devtools/ruby/ruby_2.7.6.bb
@@ -12,6 +12,10 @@ SRC_URI += " \
 SRC_URI[md5sum] = "f972fb0cce662966bec10d5c5f32d042"
 SRC_URI[sha256sum] = "e7203b0cc09442ed2c08936d483f8ac140ec1c72e37bb5c401646b7866cb5d10"
 
+# CVE-2021-28966 is Windows specific and not affects Linux OS
+# https://security-tracker.debian.org/tracker/CVE-2021-28966
+CVE_CHECK_WHITELIST += "CVE-2021-28966"
+
 PACKAGECONFIG ??= ""
 PACKAGECONFIG += "${@bb.utils.filter('DISTRO_FEATURES', 'ipv6', d)}"
 
-- 
2.25.1


