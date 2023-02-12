Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C064C636D4
	for <webhook@archiver.kernel.org>; Sun, 12 Feb 2023 21:11:43 +0000 (UTC)
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
 by mx.groups.io with SMTP id smtpd.web11.6.1676236278486361097
 for <openembedded-core@lists.openembedded.org>;
 Sun, 12 Feb 2023 13:11:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=mYMeTSLQ;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.181, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f181.google.com with SMTP id e17so2772010plg.12
        for <openembedded-core@lists.openembedded.org>; Sun, 12 Feb 2023 13:11:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1v4v9wNUhxWDROS6FK96WBDXKWnfXKENog9s/gGsa7M=;
        b=mYMeTSLQilCFJInPopq8fbgHFIiPhzOU53YwzPRFCh5zhYaCDybMGGoM171ulCYzR8
         mSfS6p2MnZOd1XYusMs6Ix/C4ZXPZvZf+P4DmkZc3si/v2SnB5iM4YLZw4lH0wNNMFBT
         DvZyuhyVAHmf8S+QjIRiZ91QgF6OisFqd8Ewu14s/+TjCVZoJL0gkApJ45jj2x3ppXKP
         g3KX1t9Meq7pKBDVis+5VAq0hER9T3X6akq/QtPDIfDWRRZ9bw0oJvw5ci15BfrztaXv
         M/1MguCKCLg2ghLwilhiwnOR7kql/tFenda81boYzY0I7BeVoVZXcjdmxHO2NI64y1g3
         kKvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1v4v9wNUhxWDROS6FK96WBDXKWnfXKENog9s/gGsa7M=;
        b=EP3v8nTdV4zubaw20WhdWLh5xKwJgsLBTjOKHGChXLF4cH/gmAj+JHqEReJ8KB9GmB
         crFzX3N40RTDnD9gB83WR5IUMptk19ZI7k8QGICckWPv2zpk6I0bkm3F4+f929r7C8CI
         YnuNIFFLtHwfsKZoF4eUKyh9XGW1nPy8//XUiLOG/snyxsCD6KLhNr+aKon+16SBQbWv
         cpsWy+2tHUQuEVjEPlhUoL6D1Jl82nF3EgwvaAkl16xJr2tSi6ICGjwmXczDJB5VO8yX
         mUr97grWz6Xsy0oTYNLg0DJGe/uTm1JrOpeOdlO35/iDKP6JKkCesfdORkXt7zuPdy8l
         MZnA==
X-Gm-Message-State: AO0yUKXEH+pcueVDr0xOj1mDqenaWvn3wPMI2fw7B4CGqqALOiY+znYo
	L5CYB4kb+ij4J1SZJyl4A5IHABTye1a18UmYzx4=
X-Google-Smtp-Source: AK7set+D6drSj+l8iSwBCLraqyyDv3oXdRKH/Ii7THRrExeNlTedOr7R4NBzJcG48TK562gT283B8w==
X-Received: by 2002:a17:902:cf08:b0:194:a6e0:3ba with SMTP id i8-20020a170902cf0800b00194a6e003bamr11469839plg.54.1676236299626;
        Sun, 12 Feb 2023 13:11:39 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-4-112.hawaiiantel.net. [72.253.4.112])
        by smtp.gmail.com with ESMTPSA id d23-20020a170902b71700b001933b4b1a49sm5675482pls.183.2023.02.12.13.11.38
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Feb 2023 13:11:39 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 26/27] lsof: fix old override syntax
Date: Sun, 12 Feb 2023 11:10:42 -1000
Message-Id: <df20b7539b11140ac33eb2f45301b4db85d1ccae.1676236110.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1676236110.git.steve@sakoman.com>
References: <cover.1676236110.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 12 Feb 2023 21:11:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177069

From: Ulrich Ölmann <u.oelmann@pengutronix.de>

Signed-off-by: Ulrich Ölmann <u.oelmann@pengutronix.de>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 052f767f85eddab9b6e5d78268d2732f4a65d446)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-extended/lsof/lsof_4.94.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-extended/lsof/lsof_4.94.0.bb b/meta/recipes-extended/lsof/lsof_4.94.0.bb
index 62f42975af..d50959d73c 100644
--- a/meta/recipes-extended/lsof/lsof_4.94.0.bb
+++ b/meta/recipes-extended/lsof/lsof_4.94.0.bb
@@ -22,7 +22,7 @@ S = "${WORKDIR}/git"
 
 inherit update-alternatives
 
-ALTERNATIVE_${PN} = "lsof"
+ALTERNATIVE:${PN} = "lsof"
 ALTERNATIVE_LINK_NAME[lsof] = "${sbindir}/lsof"
 # Make our priority higher than busybox
 ALTERNATIVE_PRIORITY = "100"
-- 
2.34.1


