Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B4BAC43219
	for <webhook@archiver.kernel.org>; Fri,  4 Nov 2022 03:01:47 +0000 (UTC)
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
 by mx.groups.io with SMTP id smtpd.web08.7203.1667530903347625408
 for <openembedded-core@lists.openembedded.org>;
 Thu, 03 Nov 2022 20:01:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=e9DE7sXr;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.45, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f45.google.com with SMTP id d13-20020a17090a3b0d00b00213519dfe4aso3550471pjc.2
        for <openembedded-core@lists.openembedded.org>; Thu, 03 Nov 2022 20:01:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dh7P+Kvs7DNNS+nsi7wNd6C96KTJW9bnqpNH2SKqyH0=;
        b=e9DE7sXrMdB3TAi6+v92sNGfx6PaxNCEqjX0kiU0IIFPodGh6yVd9efyz1anOhL+zO
         Vzqwqjqk3eS2jakuh1XNw8vYltAfExALvumdsr5P0BGF/F9Iywumq8FUk015ue1N1zFN
         NYjStHfsSjF0z1Pm6b1CGkW0Ts5+2anYV2gaz5SWD6sfEy6kM/nd4SGcg4OC+3zUL9uO
         1JLQWLs8J4FNpSb345eePuhggyFV9y8w77y3p7mo3YC/7ubdBqTvx64F4MiZyAoAx7qv
         Olhom1Od7yxww9Dk5jVeLaoDsboJKPEWvIJ2YO6Yx98cBStn/nChttxe4tV0TayFizUF
         OpOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dh7P+Kvs7DNNS+nsi7wNd6C96KTJW9bnqpNH2SKqyH0=;
        b=ypMKeoNUcckNWpUd6+Rt7sAl8ITle/C/vIYWUwsuJgkd4wMSv/o3tXynmghpFuin9U
         J4C90M0DiaQge591VPLZpL++49y1CATVZgzkQ9zX/gBE/BuCeyiK7t3D/M3Dpji2i5Pk
         SlLJjPVjWAfh1zXaEgSOR7w6YbXR2aGaWeJRi43B3x2/vso3bUqtJlYfqZt1Js1vxwCV
         pBsbjBG2PPtJEzuwb2bImNT16O2Ipi9M0+55jv1IbCz5Guxr/kf51NbTCzNsy+DjIa1C
         YQzIH2nfv20fZ3Ehc9HTk1/SUoTlWhL2mRcXw0f3U1hlWt6kGKua+fRxqbUhAC14oGwm
         5tvA==
X-Gm-Message-State: ACrzQf3dPL9aZROb8jaNjjHK50etkIG5F5HW1DvRVfoq7xvQ5OgxNfMo
	OJo4os6ByJk/bszu2VL8FFMFIaoBOgs5Uab9
X-Google-Smtp-Source: AMsMyM7wlLcJrf+9QPhV1wKhcARhzUyZt36aVem0GA3MqQ7pV1YoCCJ3jqHPLPV72XIruyoRv4gmww==
X-Received: by 2002:a17:90a:cb8b:b0:211:7744:d155 with SMTP id a11-20020a17090acb8b00b002117744d155mr50843867pju.187.1667530902448;
        Thu, 03 Nov 2022 20:01:42 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net. [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id r7-20020a17090a454700b0020b7de675a4sm667902pjm.41.2022.11.03.20.01.41
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Nov 2022 20:01:42 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 12/31] ifupdown: upgrade 0.8.37 -> 0.8.39
Date: Thu,  3 Nov 2022 17:00:47 -1000
Message-Id: <3dbfce9557e40c9a630337c9bf2ec129c02ed386.1667530733.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1667530733.git.steve@sakoman.com>
References: <cover.1667530733.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 04 Nov 2022 03:01:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172673

From: wangmy <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
(cherry picked from commit f0462e3336c7134aeeb2684692732c187971b330)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../ifupdown/{ifupdown_0.8.37.bb => ifupdown_0.8.39.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-core/ifupdown/{ifupdown_0.8.37.bb => ifupdown_0.8.39.bb} (97%)

diff --git a/meta/recipes-core/ifupdown/ifupdown_0.8.37.bb b/meta/recipes-core/ifupdown/ifupdown_0.8.39.bb
similarity index 97%
rename from meta/recipes-core/ifupdown/ifupdown_0.8.37.bb
rename to meta/recipes-core/ifupdown/ifupdown_0.8.39.bb
index 57d4152a39..7096bc94d7 100644
--- a/meta/recipes-core/ifupdown/ifupdown_0.8.37.bb
+++ b/meta/recipes-core/ifupdown/ifupdown_0.8.39.bb
@@ -16,7 +16,7 @@ SRC_URI = "git://salsa.debian.org/debian/ifupdown.git;protocol=https;branch=mast
            file://0001-ifupdown-skip-wrong-test-case.patch \
            ${@bb.utils.contains('DISTRO_FEATURES', 'ptest', 'file://tweak-ptest-script.patch', '', d)} \
            "
-SRCREV = "2b4138f36ce3ba37186aa01b502273e0c39ab518"
+SRCREV = "be91dd267b4a8db502a6bbf5758563f7048b8078"
 
 S = "${WORKDIR}/git"
 
-- 
2.25.1


