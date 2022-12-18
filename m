Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79F7DC4332F
	for <webhook@archiver.kernel.org>; Sun, 18 Dec 2022 16:13:59 +0000 (UTC)
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
 by mx.groups.io with SMTP id smtpd.web10.32121.1671380032504987863
 for <openembedded-core@lists.openembedded.org>;
 Sun, 18 Dec 2022 08:13:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=z4UNhTDy;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.174, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f174.google.com with SMTP id a9so6858556pld.7
        for <openembedded-core@lists.openembedded.org>; Sun, 18 Dec 2022 08:13:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cq+YbvNerxAwNIdhgDRIMnynx5/ik04pD5s/JXQACfQ=;
        b=z4UNhTDyd73M55bAsTUv7+8VtGgKQUG7WXsVZw/hpvvyVBrFJsBQiDw9b5UhxXaZOB
         XMSlqijFvKYfh5JLKMFhmd9TvxU5IBUjTuOXL8T68wKWJyHLAmsThCgo0kD8iz+zTSBJ
         rIPrFaV/o605NbLVwtuM8TWRkMxYf8Y5XB47phmx8G+ANGXe60Qw9QIAo7xMUO1AgpCS
         1hhn/pV3I49okjvRnElZBIdoP4JwlG/5uID9/fa/mGI3+Y2LAmCzquSe0lL3uxBsRD2W
         wXRlyPoBQc5CPFegASRsNzePlol3aQ36L+3uHQxhUNPfbcdh1JdKHKtEZluHBzp2/6Z6
         XcgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cq+YbvNerxAwNIdhgDRIMnynx5/ik04pD5s/JXQACfQ=;
        b=y0zg5tba2MBH2et81vlMbzg6CKagRSznc2Jw3vbwufTiMJe3WTIzNYf3GaPpSG72+Y
         tHEoZyU+kBlY5duAF1u6ReJGY5nu0EBY5thL6uCHqa7SEexH396ivZCMfe33l7iVm1hI
         GO14I5Wb+9QpB9WX7tZiIfez1jVw+9RUWibdQNnmmUxCbN1jNervUhimwbmgkPiLznaA
         m6dgXmU4QgrQaUPd2DGp9F7WI8KF15TjPWVJoA0sN1+uvZ1BF19hder6RnsEnWPRWahL
         9KhyNFIvcRjgr6qy3g30skmfdGRKylWQWd6U0bNkdnEWv0Jtax11T+ng1CnB7RoDq55Y
         pq0w==
X-Gm-Message-State: ANoB5pkkBPMSJeV7vCWYtDH1/tRJQjouA4gAgku1PgBB7GwHABok8tYV
	9gDYSTeO9Fb1fCEYCcYdilxW1H0nm1Scl1dD40w=
X-Google-Smtp-Source: AA0mqf5lvjLyTbt8bGkw9kw1+3u17XjW98XapMZUfTTvishlZepenykn/IUEL7Q4FLyjUQ2R+WxLaw==
X-Received: by 2002:a05:6a20:6f06:b0:a2:bc99:ab98 with SMTP id gt6-20020a056a206f0600b000a2bc99ab98mr44349017pzb.28.1671380031524;
        Sun, 18 Dec 2022 08:13:51 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net. [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id c7-20020a170902d48700b001896522a23bsm5278763plg.39.2022.12.18.08.13.50
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Dec 2022 08:13:51 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 19/19] efibootmgr: update compilation with musl
Date: Sun, 18 Dec 2022 06:13:03 -1000
Message-Id: <ada5e64a97d5f269886772540e0bb0c324088b21.1671379841.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1671379841.git.steve@sakoman.com>
References: <cover.1671379841.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 18 Dec 2022 16:13:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174806

From: Marta Rybczynska <rybczynska@gmail.com>

Since the commit 005b6aba89eaf1b79fdd7565dd028fdd9bbfcc7d
(efivar: add musl libc compatibility) efibootmgr compiles with
musl too. Update the variable to take that into account.

Signed-off-by: Marta Rybczynska <marta.rybczynska@linaro.org>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-bsp/efibootmgr/efibootmgr_17.bb | 2 --
 1 file changed, 2 deletions(-)

diff --git a/meta/recipes-bsp/efibootmgr/efibootmgr_17.bb b/meta/recipes-bsp/efibootmgr/efibootmgr_17.bb
index 11d8b9061d..be6571b3fa 100644
--- a/meta/recipes-bsp/efibootmgr/efibootmgr_17.bb
+++ b/meta/recipes-bsp/efibootmgr/efibootmgr_17.bb
@@ -34,6 +34,4 @@ do_install () {
 }
 
 CLEANBROKEN = "1"
-# https://github.com/rhboot/efivar/issues/202
-COMPATIBLE_HOST:libc-musl = 'null'
 
-- 
2.25.1


