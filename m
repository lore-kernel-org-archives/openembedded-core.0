Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A873C47089
	for <webhook@archiver.kernel.org>; Sat, 26 Nov 2022 14:16:16 +0000 (UTC)
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
 by mx.groups.io with SMTP id smtpd.web11.70851.1669472168347975212
 for <openembedded-core@lists.openembedded.org>;
 Sat, 26 Nov 2022 06:16:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=jFvyBlG+;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.52, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f52.google.com with SMTP id o5-20020a17090a678500b00218cd5a21c9so6459893pjj.4
        for <openembedded-core@lists.openembedded.org>; Sat, 26 Nov 2022 06:16:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cw3tsdNDw0jVDnkjrmk8GLYHsDLZq6RwWc2yrsGAafQ=;
        b=jFvyBlG+82pRKrvAXUUDm2TyeXgzbzQQqlRxiwbmzLs2UEcyey7sqDUa7O8NFiWMKu
         PnYj8yrz9XtLG8TN9/k38pmNzbrLhHH3R+wVxSsOcFzdFrb5+gXzEiwOA9krHParctbg
         tTQJGxJee5ZV8vNfs3oUy5gtLr6NGQRhaxl0/wNMc+N9HyNDI7/aZWTRiyCJh/wM8tKD
         LiSKSdkem15IHYYLvnKCNbXjeCIx0E/dwD1DQss4FLrPUSuCeG078N0bmv8w2KPq203x
         nBzrC+uDquyPoEFKqyQlb24gLne3Dbb0QSDAMiD0blLSa6PudEsnGFCUOZC2caAdGMRY
         8xNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cw3tsdNDw0jVDnkjrmk8GLYHsDLZq6RwWc2yrsGAafQ=;
        b=P4RweJVLQk8rTZ2MYZqwMkeVy1u5CvrpPbSQiKLNvNcA0Pe4gs+Nf1FzV4G+EjKoC/
         F0rl98lqX2f/e9SGK4zy+duuFb7XgiKvHBm4hBmaN3n5HyMrvDCLVPOktCMtpgFZcwRP
         pMV6cueooRmXbhVMuabUzm5oAX+iFGgMwFchvrWxZPzXq5TTP2syB/7f+jXwsjQXL1Ir
         6C9vS8L5lDZgYouyAkdmAUic7WphhBAV45pki7lJiJQkX9nf6l7bokOIyG497YMeocf/
         /asyUGbBw3nDgB6oR57zt91IQCOTwV0NjUMVTyQiQrt+e8xepvAyRhJYvexqKSht6Mot
         bDAg==
X-Gm-Message-State: ANoB5pmNuRJFbJTH6R+rl26pjQ0VLhbXbd1VcINs8fyoa3PhdERlqqvZ
	la8BGs9mvLpF71yKcjHPdohaaOpyku2VoQTNioY=
X-Google-Smtp-Source: AA0mqf74AkmdAgs1MZyaDIQoYa4u07RssCCTwIOBdP31E/nkHqu/pjc1qL5egzjfWck4H3nHRtjMXQ==
X-Received: by 2002:a17:90b:1e0f:b0:213:c5ae:55ec with SMTP id pg15-20020a17090b1e0f00b00213c5ae55ecmr44502305pjb.182.1669472167362;
        Sat, 26 Nov 2022 06:16:07 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net. [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id im22-20020a170902bb1600b001895f7c8a71sm4649177plb.97.2022.11.26.06.16.06
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Nov 2022 06:16:06 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][langdale 30/37] gnomebase.bbclass: return the whole version for tarball directory if it is a number
Date: Sat, 26 Nov 2022 04:14:34 -1000
Message-Id: <71ba56c6d2703f9d4498e2cbff9c0aa70b964801.1669471990.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1669471990.git.steve@sakoman.com>
References: <cover.1669471990.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 26 Nov 2022 14:16:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173823

From: Alexander Kanavin <alex.kanavin@gmail.com>

E.g. if version is '43' without any dots, existing code would return ''.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
(cherry picked from commit 38c15322bdbb2423973939e861b5ad1ffb5c8b7f)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes-recipe/gnomebase.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes-recipe/gnomebase.bbclass b/meta/classes-recipe/gnomebase.bbclass
index 805daafa40..5e72f549a3 100644
--- a/meta/classes-recipe/gnomebase.bbclass
+++ b/meta/classes-recipe/gnomebase.bbclass
@@ -5,7 +5,7 @@
 #
 
 def gnome_verdir(v):
-    return ".".join(v.split(".")[:-1])
+    return ".".join(v.split(".")[:-1]) or v
 
 
 GNOME_COMPRESS_TYPE ?= "xz"
-- 
2.25.1


