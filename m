Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E421C88CB2
	for <webhook@archiver.kernel.org>; Fri, 25 Aug 2023 02:48:02 +0000 (UTC)
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
 by mx.groups.io with SMTP id smtpd.web10.5604.1692931677660577552
 for <openembedded-core@lists.openembedded.org>;
 Thu, 24 Aug 2023 19:47:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=TvrSgY5Z;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.179, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-68bee12e842so385040b3a.3
        for <openembedded-core@lists.openembedded.org>; Thu, 24 Aug 2023 19:47:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1692931677; x=1693536477;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YzBfQpG7vxB3VBphec+LpVZouLLFTw1lSDcZIKHAys8=;
        b=TvrSgY5Z4WCQalyeweCCNdgR00hXcWBzsGCIHnxHi5ewIR6vN3URt3nIoMjyvORJGa
         n3Nt9sd5Pu9QSBjJgdo6GFLCt5NN5CVr4XRe4e4gzne+0H9oFvTonPhWsYErrx+surWN
         NpNJyLqE+NE5Uy6QV8vjuplDInACwHRglgzAZCtevjDrrcz8TrRvgo/90MeQHhMBPYZP
         sywR6QPWNKwkP7+y4OOXbhx8fdmD5tj8oiUY0oVoqHIRbWqvhoB7d7r63epKp7VnCS+q
         u6YxStap7Xa+S5H+7AtKNiPtwfPCl26TqEWuoQJp6bIOmLCGEz6j8ODBmalK7JELQ1JB
         HLPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692931677; x=1693536477;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YzBfQpG7vxB3VBphec+LpVZouLLFTw1lSDcZIKHAys8=;
        b=R7JiRqJjJLt7VF+e76b8XHt/nIWiUqPd0XMccBwYl8fPumUOS6DkP5HgR66cNF+j3R
         m9Wv2uc8OsPJtHO7eTO5gmEIpkUeJC0T6zjdFaSRfWY+uh0G4pt6JWZ0NXp4e4BBY9Ob
         VQRQnB74A78mHD1ZDPmICiKMcf61QyUw5ih9JgTY2nmtyWvf5A5DH+6uMWOYtZcIPsQ3
         UUwQk+vWYjV8WKCIpzNREnLJt/YOpbRuVvemv2HP3ZJEflZCiMMcqHwhwHPeVWR2w3dm
         V1+0vcbY0S2VbRZ6aLSCu5ynVwKjsTy22gq3bplUlTZT/ZKLQ/DYV8GRkR18seowcmGW
         tE/w==
X-Gm-Message-State: AOJu0Yx72wgl+7qxTOl+/jS5NLEkvALJX4jacf4jZyQo6yWxDdP2MvKf
	ciYnqzixRLDg5LQhALd/RZ/W3Vhli3UENqxfnPo=
X-Google-Smtp-Source: AGHT+IFD4zRVkOM5/fKX31itlusm6yuDsBVeCunDKuXHeCSuo1xqLqN+BwvAvnW0V3MdSW7IuTy5EA==
X-Received: by 2002:a05:6a00:2345:b0:68b:eae8:1daf with SMTP id j5-20020a056a00234500b0068beae81dafmr5347309pfj.12.1692931676706;
        Thu, 24 Aug 2023 19:47:56 -0700 (PDT)
Received: from hexa.lan (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id d3-20020aa78143000000b0068883728c16sm446803pfn.144.2023.08.24.19.47.55
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Aug 2023 19:47:56 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 06/14] linux-firmware: upgrade 20230515 -> 20230625
Date: Thu, 24 Aug 2023 16:47:30 -1000
Message-Id: <4b7a18a97008879ea37e29ba03808508334c8f3c.1692931546.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1692931546.git.steve@sakoman.com>
References: <cover.1692931546.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 25 Aug 2023 02:48:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186679

From: Trevor Gamblin <tgamblin@baylibre.com>

WHENCE checksum changed because of updated version lists and removal of
information for the RTL8188EU driver.

Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 986f8ca9d4c2c22d368f69e65b2ab76d661edca0)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 ...{linux-firmware_20230515.bb => linux-firmware_20230625.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-kernel/linux-firmware/{linux-firmware_20230515.bb => linux-firmware_20230625.bb} (99%)

diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_20230515.bb b/meta/recipes-kernel/linux-firmware/linux-firmware_20230625.bb
similarity index 99%
rename from meta/recipes-kernel/linux-firmware/linux-firmware_20230515.bb
rename to meta/recipes-kernel/linux-firmware/linux-firmware_20230625.bb
index 206de1bcd1..046272337e 100644
--- a/meta/recipes-kernel/linux-firmware/linux-firmware_20230515.bb
+++ b/meta/recipes-kernel/linux-firmware/linux-firmware_20230625.bb
@@ -134,7 +134,7 @@ LIC_FILES_CHKSUM = "file://LICENCE.Abilis;md5=b5ee3f410780e56711ad48eadc22b8bc \
                     "
 # WHENCE checksum is defined separately to ease overriding it if
 # class-devupstream is selected.
-WHENCE_CHKSUM  = "a0997fc7a9af4e46d96529d6ef13b58a"
+WHENCE_CHKSUM  = "57bf874056926f12aec2405d3fc390d9"
 
 # These are not common licenses, set NO_GENERIC_LICENSE for them
 # so that the license files will be copied from fetched source
@@ -212,7 +212,7 @@ SRC_URI:class-devupstream = "git://git.kernel.org/pub/scm/linux/kernel/git/firmw
 # Pin this to the 20220509 release, override this in local.conf
 SRCREV:class-devupstream ?= "b19cbdca78ab2adfd210c91be15a22568e8b8cae"
 
-SRC_URI[sha256sum] = "8b1acfa16f1ee94732a6acb50d9d6c835cf53af11068bd89ed207bbe04a1e951"
+SRC_URI[sha256sum] = "87597111c0d4b71b31e53cb85a92c386921b84c825a402db8c82e0e86015500d"
 
 inherit allarch
 
-- 
2.34.1


