Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D480CCA47A
	for <webhook@archiver.kernel.org>; Thu,  2 Jun 2022 02:31:27 +0000 (UTC)
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com
 [209.85.214.172])
 by mx.groups.io with SMTP id smtpd.web08.2148.1654137078412531584
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Jun 2022 19:31:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=NpUSDVIF;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.172,
 mailfrom: steve@sakoman.com)
Received: by mail-pl1-f172.google.com with SMTP id n18so3366353plg.5
        for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Jun 2022 19:31:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=ZIXJdjotCneRjS/RHkPrl2DCNSIz/+WZ0B8LnDUV2hE=;
        b=NpUSDVIFL0xqIX+rLL1fJdPb+8NMld9G5ka6flYBM3bcJr6+9W9PoH0t0pVZDLGbNu
         cfLqKEb7DKg6DpiajSdftRjQw2sPMij+Sv04J/0GHOs/PMA1oL6WrJh3z4VOsbYFuTKX
         tJjzrbDIj9t2UV5lLdHZwtk3rOKRK9inq4/LCoGJKVoccDDD2umvj3S91kJSpqNv1525
         kX9gzg5zIDdWJbAjTo9O2Ijg/lW7vuFt29aFk8x1bv2mr4WfTwD9bzIQSjeY/hCe5ikV
         rQIAdkIifHaPp8nlALrl8Wz5i80EFC9qLC6dH++3oOzrQLVhTrLBQ7J5FSeu89Y74P5h
         HuEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ZIXJdjotCneRjS/RHkPrl2DCNSIz/+WZ0B8LnDUV2hE=;
        b=iHQsGOQhCVVV8GW5k8aALKbU1xxtT8Kof6WPQdNit0XkvAXE32X0LT4ITe9/Sfu/PG
         vaGmodMv0LUFga1YdJI1ZFGjATachrdl+Mtc7mf8u7VSxxTNjoo89A297qjoBdW6Ayp0
         k/zMX8OLQKscwIkhgV/9zSfA1+T4f/pQngj4oQVKEJ8uZr7E8ogTquZouTmv2ANsjS7n
         ceTHb7zOKgGXSWRUnu1IXQSpnRp1uonZ70vpbMEhblyjnxweuQ8+PlytaXitOHLG5wjT
         C4nAFEhBH3M/9pz1NJ27kY/3peOYRw4m7LUyBXxt+8mhvp/We1qWHT1URG5QQNAF9sid
         F+4Q==
X-Gm-Message-State: AOAM533jsk7iNGhDiexHwFIRIftODNPMaG2OJYAohdl9aTQ6Fd3JhdEe
	vg6uvL9Jonz0PQ87rwbYZazCSE+BiahCM0vo
X-Google-Smtp-Source: 
 ABdhPJwHgSb4j49jh3P4lK9PfZxy+JxDqiZUJ0UIXnNo3Tmy6myxEYIhyBEy4/kSdAnEorbSk9ev1g==
X-Received: by 2002:a17:902:9043:b0:14f:aa08:8497 with SMTP id
 w3-20020a170902904300b0014faa088497mr2491595plz.109.1654137077365;
        Wed, 01 Jun 2022 19:31:17 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 j23-20020a63ec17000000b003fc37053c82sm1990447pgh.12.2022.06.01.19.31.16
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jun 2022 19:31:16 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 01/11] ruby: Upgrade ruby to 2.7.6 for security fix
Date: Wed,  1 Jun 2022 16:30:41 -1000
Message-Id: 
 <4514b1b8cacb92b1790b636b111c071190b2e4b2.1654136888.git.steve@sakoman.com>
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
 https://lists.openembedded.org/g/openembedded-core/message/166449

From: Ranjitsinh Rathod <ranjitsinh.rathod@kpit.com>

Upgrade ruby to 2.7.6
Link: https://www.ruby-lang.org/en/news/2022/04/12/ruby-2-7-6-released/
This includes CVE-2022-28739 security fix

Signed-off-by: Ranjitsinh Rathod <ranjitsinh.rathod@kpit.com>
Signed-off-by: Ranjitsinh Rathod <ranjitsinhrathod1991@gmail.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/ruby/{ruby_2.7.5.bb => ruby_2.7.6.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/ruby/{ruby_2.7.5.bb => ruby_2.7.6.bb} (95%)

diff --git a/meta/recipes-devtools/ruby/ruby_2.7.5.bb b/meta/recipes-devtools/ruby/ruby_2.7.6.bb
similarity index 95%
rename from meta/recipes-devtools/ruby/ruby_2.7.5.bb
rename to meta/recipes-devtools/ruby/ruby_2.7.6.bb
index 44a2527ee7..658a17659a 100644
--- a/meta/recipes-devtools/ruby/ruby_2.7.5.bb
+++ b/meta/recipes-devtools/ruby/ruby_2.7.6.bb
@@ -9,8 +9,8 @@ SRC_URI += " \
            file://0001-template-Makefile.in-do-not-write-host-cross-cc-item.patch \
            "
 
-SRC_URI[md5sum] = "ede247b56fb862f1f67f9471189b04d4"
-SRC_URI[sha256sum] = "2755b900a21235b443bb16dadd9032f784d4a88f143d852bc5d154f22b8781f1"
+SRC_URI[md5sum] = "f972fb0cce662966bec10d5c5f32d042"
+SRC_URI[sha256sum] = "e7203b0cc09442ed2c08936d483f8ac140ec1c72e37bb5c401646b7866cb5d10"
 
 PACKAGECONFIG ??= ""
 PACKAGECONFIG += "${@bb.utils.filter('DISTRO_FEATURES', 'ipv6', d)}"
-- 
2.25.1


