Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0075EC3DA71
	for <webhook@archiver.kernel.org>; Thu, 15 Dec 2022 19:21:53 +0000 (UTC)
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
 by mx.groups.io with SMTP id smtpd.web11.143571.1671132088604680073
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Dec 2022 11:21:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=lvQj2IIr;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.52, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f52.google.com with SMTP id t11-20020a17090a024b00b0021932afece4so3715923pje.5
        for <openembedded-core@lists.openembedded.org>; Thu, 15 Dec 2022 11:21:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QMO3yIlwJOjEklpYqcrnXlxur5eI2rkELwy2YrMJ9PM=;
        b=lvQj2IIrd0ZuLkYVSKr3iQ0GkaaAtMCgZRIXCT8DLZIV32hsyugZpQyADEpTvFpONC
         OEoggGXiC7ZJdyKOfYpgIOIScuGnHPW569E08Li+jOuZIyZQEJ1hcfwCexWHWGY+ijhX
         GA3aF1bMfg8gL1YkB6uV+/0UoiPx3sNB+fkAJYNXt1vP+RSbLmU1YcYIx7t4myTI6Aja
         PF+iVOnvCt3Daz83OtigP4GnyP6MmQeVk0yoLm8+xyz6wBIoa4QJKIDQ4yRnexGMvE/l
         Wr+RmzfFDY5FqjJ+z4sylvIhRo8gsgeUuWqjOeMzl/g+YTwZuSEsHrKGtuYt2/B8VaDR
         maVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QMO3yIlwJOjEklpYqcrnXlxur5eI2rkELwy2YrMJ9PM=;
        b=mIuU86RoVaE77u+83OLmEQ6A14+hohLupOTusKdTwbWK6jUN2pSYAocahMOpcmUphK
         tn8vuLsfDbuLNAOq/M5zwPr0pE3Ipgtt8w+7h06Ism2+hAvOrRuRpoH7grkS62dofhiM
         2MAjXthmLHTEfOl9ZOGuq4KGVNhhxcTbinhthDMeika1jygUjFWcim1j9k+KCB/wClvb
         IP9TSltLo8HEHjL502K76DtOMT8jLx2iDvTiM598rV4pykaL0OFf5GPupytEIJFnoRz5
         Ahus//NXBEVAmk6863H4/AYjGEjKozETQ17AFhVe3ojlZ+r6OKYlqCQLwVnzvfKw32Jy
         pZBA==
X-Gm-Message-State: AFqh2kqEmNEc6cd0jqkLYM6yTzgwyanIHbyXJ52diWmuX64cML6sdvMN
	04jvO9ytrfJKsTayeTxJN/soKHKnBOTuTVa3CxM=
X-Google-Smtp-Source: AMrXdXvKbbEI65/UGkX50HNk/sxqPaRWmntKBKG8xsvx0ZKAgyfYUXzCRixPNdQjbZVkeEAPJ6pXQA==
X-Received: by 2002:a17:902:e2d1:b0:191:1b:68e0 with SMTP id l17-20020a170902e2d100b00191001b68e0mr325117plc.36.1671132109188;
        Thu, 15 Dec 2022 11:21:49 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net. [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id r19-20020a170902c61300b001869b988d93sm4167095plr.187.2022.12.15.11.21.48
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Dec 2022 11:21:48 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][langdale 28/30] combo-layer: dont use bb.utils.rename
Date: Thu, 15 Dec 2022 09:20:52 -1000
Message-Id: <3d453183a7c31c85eeded3f270670aa69ac1a391.1671122751.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1671122751.git.steve@sakoman.com>
References: <cover.1671122751.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 Dec 2022 19:21:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174620

From: Ross Burton <ross.burton@arm.com>

Bitbake may not be configured, and bb isn't imported anyway.

Instead just use os.rename(), and take the filename from the file object
instead of duplicating logic.

Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 528f4fb3683d048537604e4562ea758968060d62)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 scripts/combo-layer | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/combo-layer b/scripts/combo-layer
index c122f4b5e4..e467f390c1 100755
--- a/scripts/combo-layer
+++ b/scripts/combo-layer
@@ -507,7 +507,7 @@ def check_patch(patchfile):
     f.close()
     if of:
         of.close()
-        bb.utils.rename(patchfile + '.tmp', patchfile)
+        os.rename(of.name, patchfile)
 
 def drop_to_shell(workdir=None):
     if not sys.stdin.isatty():
-- 
2.25.1


