Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE9E8CCA47C
	for <webhook@archiver.kernel.org>; Sun, 19 Jun 2022 19:31:17 +0000 (UTC)
Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com
 [209.85.215.174])
 by mx.groups.io with SMTP id smtpd.web10.21954.1655667067667873709
 for <openembedded-core@lists.openembedded.org>;
 Sun, 19 Jun 2022 12:31:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=p8VVNBco;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.174,
 mailfrom: steve@sakoman.com)
Received: by mail-pg1-f174.google.com with SMTP id g186so8467911pgc.1
        for <openembedded-core@lists.openembedded.org>;
 Sun, 19 Jun 2022 12:31:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=qL0AT6VwrqBzR5m0szQyO876/kUa1i8Cqp5Xw7L4+Ig=;
        b=p8VVNBcoCocIfR+16aEsRN9aV6kq7KzVQcAxY7mX+e9Ue3CNJ9f8jVeN4FADeYfnXS
         u8tfcT93OFBDYJoDC5VRUR8r5irx90VWOu/TKbn3HmliyHb8YlXp6K1Z+sPcJSyDZXq8
         IgeKHSM2RV5fEKtoLphjLTOZgBJzcJvH8gPeuaiV/wpJuJPMxnouzj7nSi8b1bUdQuKP
         1MM4/wXDM5VweZ9uJmoNAPkQnR4ksdQexAE4DbuVAIHRFsz3bPffsb4SkbR15iyXiBVo
         Z8q/mbJ7+3tZZhOmFnQKABkWXXAR1EP/4aKsi78L2Hc0YltRUVT4amRgnSYzXQIcAoo6
         Uubg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=qL0AT6VwrqBzR5m0szQyO876/kUa1i8Cqp5Xw7L4+Ig=;
        b=Hhe3iUAFzYwCaj4KxT6UO2wjlbXObrBo0BfrhcU50/jXLKq9KSmey76FwMhNjQsJeI
         qGbOgfQ+afWEnIl0t8iN01Zr02nsDwkGNx4gn04dQQvhaw5sMPvaMYBU1gOZyUUvWEUz
         3zMjE0pwFHTOZDRfdpQh+l0JlPVRgeP1g+oIZh/uTadlC1fIZBKVeNv0XvZtKCJcgHdC
         WYL3jDR+cj0hCDdX0thGxEhaEMxgNxLrgP/izsNeYE+39BdclOC4gLCJi0pUN8RAbYKC
         PIkqw9cl7m7Z9a3Dd0RbI/KBQbuYq3HTOBr1C53aoijWWH9xrY6mwvt9DDcJzyawVZLG
         NWDw==
X-Gm-Message-State: AJIora8xRvFwmuF/L5X/gmd4gQwxtmO/ZxpFdxdJ2+0KixgWfWl+0UkF
	OG4OXAZ+hfPzRDBYbstAK7M0aiBGege5I3Jb
X-Google-Smtp-Source: 
 AGRyM1vh4QvK8rky0nd7s0BksGrL5Y7jBDfg1NyhIEN7iAyjrUGp3HnGsgXwPJW1XD4oUZCVW0TALg==
X-Received: by 2002:a62:7cc3:0:b0:525:20fc:275f with SMTP id
 x186-20020a627cc3000000b0052520fc275fmr2530212pfc.70.1655667066687;
        Sun, 19 Jun 2022 12:31:06 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 o2-20020a637e42000000b003fe4836abdasm7432886pgn.1.2022.06.19.12.31.05
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Jun 2022 12:31:06 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 02/15] uboot-sign: Fix potential index error
 issues
Date: Sun, 19 Jun 2022 09:30:37 -1000
Message-Id: 
 <ea280917fc16a61b50738ddd03a6f85305f82cb0.1655666951.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1655666951.git.steve@sakoman.com>
References: <cover.1655666951.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 19 Jun 2022 19:31:17 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167048

From: Richard Purdie <richard.purdie@linuxfoundation.org>

Someone reported that if some other shell function has left i or j set,
the concat_dtb_helper function could fail. Add a small tweak to avoid this.

[YOCTO #14815]

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit d219c97bdf5d30be89795fbf9b66ddc367bef384)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes/uboot-sign.bbclass | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/classes/uboot-sign.bbclass b/meta/classes/uboot-sign.bbclass
index 4ca8118eb2..31ffe1f472 100644
--- a/meta/classes/uboot-sign.bbclass
+++ b/meta/classes/uboot-sign.bbclass
@@ -134,6 +134,8 @@ concat_dtb_helper() {
 
 			if [ -n "${UBOOT_CONFIG}" ]
 			then
+				i=0
+				j=0
 				for config in ${UBOOT_MACHINE}; do
 					i=$(expr $i + 1);
 					for type in ${UBOOT_CONFIG}; do
-- 
2.25.1


