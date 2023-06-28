Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E26D9C0015E
	for <webhook@archiver.kernel.org>; Wed, 28 Jun 2023 14:13:17 +0000 (UTC)
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
 by mx.groups.io with SMTP id smtpd.web10.17368.1687961596890561163
 for <openembedded-core@lists.openembedded.org>;
 Wed, 28 Jun 2023 07:13:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=gJ2eRdAs;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.175, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-1b7f2239bfdso36611495ad.1
        for <openembedded-core@lists.openembedded.org>; Wed, 28 Jun 2023 07:13:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1687961596; x=1690553596;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uGCBDOA896sHrJlJ8ZR1dGx0s8LXp6rHm6o9eel3Bhs=;
        b=gJ2eRdAsZYyuLc8+RyXygyE2wc815YfXb8yn+3NPFCfceDpI+wSye+5iTKKf/6wRPX
         BQNSoQiOtifgS8ASgqoaKbqKfda/g3yAUoARmPZR72Ux/Hizv/FcV4fQTvKulbEoSB8W
         bxZkfUDD76jgKoz0ySxhnuuXXkC8Mk580REst3S/YOLsOFRv1idwN30KMkG6X76E3O+r
         8uDIjqYFFGvxzLtY5IJN3JADl28ABCpTeq/RV5n57BtH8KD/eBrGs7awW1VKA9sHSqte
         Z7FjbPaeKgAfzkgPuRIvNYGvYh7AT+FCPKXo4JPGMF0NrdtjE2oSE6Y95lE2gNZjommD
         aZKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687961596; x=1690553596;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uGCBDOA896sHrJlJ8ZR1dGx0s8LXp6rHm6o9eel3Bhs=;
        b=L3c3G7A5hKQ6Kz86qQl/HMGdbomF2pHirk+3VhH7GbPQcTEue2XZtVcXz57qqT+MO+
         ZP7oeZjly6IE8MtL+DcOT8sFYuqjDD90PRBKCHdLyIPuEUXtKLV2vka53vNPNrpN06+S
         /pezAauPvd6bMUWGT1lvY+GMVQ92L/3uiUk+82tP3STqm9h7GQtmg8+C8kMR88IhjPkM
         iPgLM9b1ZNVb6oSq2bKMoTxk3IDz4Woi0Efb80+mFq6COvNDg74MD+0uY5/srnpk0G79
         tri1PPfmGOeoDUQcR6m9xD49lesqYRPRCZH2CfiWw7sEveOHPqCjZMZFTJfEIsooTHWl
         Bvbg==
X-Gm-Message-State: AC+VfDxmXm/tqfo7B1KEfeFRUUCY62+MnzvZH3w90X45q5QYTDnwNXSh
	vqGy9guCo2q9ItIEvm3Ljq1xbFHkuscHEFPgpfPjuA==
X-Google-Smtp-Source: ACHHUZ55YEA5QWwCfYoC64OfesRyyU/T3wa/uV7v+MYFgpwgbeN4XUpj7H4C2Ctust0cO2wuo/Rqpw==
X-Received: by 2002:a17:903:228c:b0:1b6:66f1:35b3 with SMTP id b12-20020a170903228c00b001b666f135b3mr15382805plh.50.1687961595931;
        Wed, 28 Jun 2023 07:13:15 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id b19-20020a170902d89300b001b3ce619e2esm7792092plz.179.2023.06.28.07.13.15
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Jun 2023 07:13:15 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 09/29] xdpyinfo: upgrade 1.3.3 -> 1.3.4
Date: Wed, 28 Jun 2023 04:12:34 -1000
Message-Id: <74fef3bca108017f8a1ce0e451b4b2172ae28fcf.1687961326.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1687961326.git.steve@sakoman.com>
References: <cover.1687961326.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 28 Jun 2023 14:13:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183564

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
=========
configure: Make xf86misc support disabled by default
Variable scope reduction
Remove unnecessary downcast of double to float
Call memset() instead of hand-coding our own equivalent

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
(cherry picked from commit d87785189336a69ae998f75394ceaebf63decb16)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../xorg-app/{xdpyinfo_1.3.3.bb => xdpyinfo_1.3.4.bb}           | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/xorg-app/{xdpyinfo_1.3.3.bb => xdpyinfo_1.3.4.bb} (88%)

diff --git a/meta/recipes-graphics/xorg-app/xdpyinfo_1.3.3.bb b/meta/recipes-graphics/xorg-app/xdpyinfo_1.3.4.bb
similarity index 88%
rename from meta/recipes-graphics/xorg-app/xdpyinfo_1.3.3.bb
rename to meta/recipes-graphics/xorg-app/xdpyinfo_1.3.4.bb
index e75a840b7d..aaa8aa8903 100644
--- a/meta/recipes-graphics/xorg-app/xdpyinfo_1.3.3.bb
+++ b/meta/recipes-graphics/xorg-app/xdpyinfo_1.3.4.bb
@@ -15,6 +15,6 @@ PE = "1"
 SRC_URI += "file://disable-xkb.patch"
 
 SRC_URI_EXT = "xz"
-SRC_URI[sha256sum] = "356d5fd62f3e98ee36d6becf1b32d4ab6112d618339fb4b592ccffbd9e0fc206"
+SRC_URI[sha256sum] = "a8ada581dbd7266440d7c3794fa89edf6b99b8857fc2e8c31042684f3af4822b"
 
 EXTRA_OECONF = "--disable-xkb"
-- 
2.34.1


