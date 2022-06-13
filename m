Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46464C43334
	for <webhook@archiver.kernel.org>; Mon, 13 Jun 2022 14:22:57 +0000 (UTC)
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com
 [209.85.214.174])
 by mx.groups.io with SMTP id smtpd.web11.6491.1655130173886407128
 for <openembedded-core@lists.openembedded.org>;
 Mon, 13 Jun 2022 07:22:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=R93jUdbZ;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.174,
 mailfrom: steve@sakoman.com)
Received: by mail-pl1-f174.google.com with SMTP id f8so5213570plo.9
        for <openembedded-core@lists.openembedded.org>;
 Mon, 13 Jun 2022 07:22:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=hL8lBPLazBQEr7JWDDeHaEKZVabxZpuZ/EFaDglr1TA=;
        b=R93jUdbZN2Uzd1zitsEE+2ITLHkJJc2v4ndnfBYwjDOyfN+dqJzDm4Fc52h6mruVel
         ux3X35NkiYKWGQsscGcfqEFzmt/bLu5h6O025vjp7HJDKsZHNayRiPLrBFxffE6XozsG
         vdsnllswjwYxn93yH0sD+F/yv4QOuWW602tZzQRF73gKccx2OntyItYvW/BkePy6TsVi
         C0v5dINxXKZqIkJ+/5gG7tcGtnS9WP5aNiywOfC5OxNPW8T+ovtYr3qpICWsOLOv6qKQ
         zYoi8zG/juC3TeB9RDyTsCs4kxf8ZXiEWN2ycsxECY6aYX5K2PcWkYEBrK3g4PMW743C
         hayw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=hL8lBPLazBQEr7JWDDeHaEKZVabxZpuZ/EFaDglr1TA=;
        b=aWePw19EBHUmPjbTfJby3VFPyeC/bm2Xyp9D3oeAtroGXLYzSHUzuYSB8tDkbX2UH7
         zTPj1XAGB95M9yXj6Pu95GaRQV+Ug89ZiSyTs3Duz0TMA9nMqBt3NQX/9362bWO5zJOQ
         y3n6L0L1wnJFYN1AJE8TYjHnorqVHywxC1+i80Mp/MTaY30EA5h2GBQfSC0XgFf/bfmG
         xBASUZ9P9j3qQjGHyFocwvWo1hFwYybZmAJqZuN112th95xGMDhxq01dLMtUtgowRJ9I
         16M97JgTacfWtbRX2Ku/KeefmZSTQUfoiTdLg2o/e9sT8xafsx/L/s3tssIXESrLDA7z
         hCJg==
X-Gm-Message-State: AJIora/+sPUYwXT0c+PBJV6K093KjkWjBq9sy1yPPB1vchykPDjQTZFH
	Z41trGeuj5ZWquw7N9mafzYt+KwR0we4BrT5
X-Google-Smtp-Source: 
 AGRyM1snduntNcXrrTGXW+nWz8jjmES43Zzw2MTRIXuOlMhg9GZEd5ozhIWDjUnuUDgKqw74w4vdfw==
X-Received: by 2002:a17:903:c3:b0:163:bfde:eec3 with SMTP id
 x3-20020a17090300c300b00163bfdeeec3mr65325plc.152.1655130172866;
        Mon, 13 Jun 2022 07:22:52 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 iz19-20020a170902ef9300b001636c0b98a7sm5159401plb.226.2022.06.13.07.22.51
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jun 2022 07:22:52 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 19/20] buildhistory.bbclass: fix shell syntax
 when using dash
Date: Mon, 13 Jun 2022 04:21:51 -1000
Message-Id: 
 <9478e53995cbb25744b5ffd45e38f0abd53adba0.1655129917.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1655129917.git.steve@sakoman.com>
References: <cover.1655129917.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 13 Jun 2022 14:22:57 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166863

From: Martin Jansa <Martin.Jansa@gmail.com>

* fix:
  run.buildhistory_get_image_installed.791888: 198: [: unexpected operator

  introduced in:
  commit 82e6172c1df378dff4e503aa878501c08937b5bb
  Author: Andres Beltran <abeltran@linux.microsoft.com>
  Date:   Tue Oct 5 00:34:15 2021 +0000

    buildhistory: Fix package output files for SDKs

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 9852bedcb9eb8306a3f82f805ec4f76abbbbdd0f)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes/buildhistory.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/buildhistory.bbclass b/meta/classes/buildhistory.bbclass
index 8db79a4829..4345ffc693 100644
--- a/meta/classes/buildhistory.bbclass
+++ b/meta/classes/buildhistory.bbclass
@@ -508,7 +508,7 @@ buildhistory_get_installed() {
 
 	# Set correct pkgdatadir
 	pkgdatadir=${PKGDATA_DIR}
-	if [ "$2" == "sdk" ] && [ "$3" == "host" ]; then
+	if [ "$2" = "sdk" ] && [ "$3" = "host" ] ; then
 		pkgdatadir="${PKGDATA_DIR_SDK}"
 	fi
 
-- 
2.25.1


