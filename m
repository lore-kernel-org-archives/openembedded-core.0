Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4250EC46467
	for <webhook@archiver.kernel.org>; Sun, 27 Nov 2022 13:56:23 +0000 (UTC)
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
 by mx.groups.io with SMTP id smtpd.web11.92057.1669557380689681625
 for <openembedded-core@lists.openembedded.org>;
 Sun, 27 Nov 2022 05:56:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=Ve+9wI7h;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.172, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f172.google.com with SMTP id 140so8138385pfz.6
        for <openembedded-core@lists.openembedded.org>; Sun, 27 Nov 2022 05:56:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SKgyr1DQHcYgrsHP7ppQiaOeAFFTTX1/X1V+RLMrz2c=;
        b=Ve+9wI7h3q14Lo34Gq1HZVibQQNfscgnkmiWubXJoS3r1uXDvq4OdiCXBGbrHlHHAD
         79oUNOGm7cPt63EhLOHJby39r0fakuI6c/FjR6niEMRWninXQInya/keLTAuts2rBUmR
         qH68edLm77RuUU8ycCvRaUSgsOeERhxOQ4rd9/wNE8yQB1ouHuyQ4uXFDr9KzVMfy3eB
         uPgH5yqENnzooNLx9lEGUqSjdABNBAFW7dkt6Gj470XXw0099kl6F1RWPbDfNWDrz+uh
         EYiVKfev6KBfD3e9m9rzzj5+wOEK7jbPf5dUnlz2E1Rr9c+M7yuihArZ7mLt3BnJEpHF
         0I1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SKgyr1DQHcYgrsHP7ppQiaOeAFFTTX1/X1V+RLMrz2c=;
        b=U6shwndveTIJ9kBBFjHft0UCpXYjVPTMVWmVcxf2SZGsbloatTzz/45pPEDqswE6Df
         bA5kgVn/1vTLnALLL+7zDDzimFjn4o3BsiYrbnV36C1khC5sEDVaaLU2yMtPRO0WzBAn
         KQh+VRcCwUNFsvMN4fhNMaCgkDXXo+6OGo0PtuoUTaurA7s2oxNlHpw6DZN3fkvdqkW6
         ANo2pVzqIR0D2Ej+WdVzFKbftpIlhviAJDgofCCz4lxwSFYK+eezII1F96WGPC/Oz3M6
         s9tjKXY454osccbhqeRSqlbUzir6557kWKybWxMe+L+K53qYEvK0tTrl44YNOmmLyVB5
         /29w==
X-Gm-Message-State: ANoB5pkUVUqAffxxkAOtrhnxwQclENYPuMNf//5sMA8K3G8+fEwCN5SF
	ZG8zMP6U1tjLl2YqwvnHHv5v/r3tiG4tYPN7Z5s=
X-Google-Smtp-Source: AA0mqf4Wx9FqZwqdtOrRQgjxxt4oLMw6wkExeFoP8Nr/qTdqBx+c4Yooo89JDpoRcXpyxXaR0Sij1A==
X-Received: by 2002:a05:6a00:330e:b0:56c:d93a:ac5f with SMTP id cq14-20020a056a00330e00b0056cd93aac5fmr31309261pfb.48.1669557379743;
        Sun, 27 Nov 2022 05:56:19 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net. [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id c15-20020a170902d48f00b001868bf6a7b8sm6910544plg.146.2022.11.27.05.56.18
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Nov 2022 05:56:19 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 24/31] gnomebase.bbclass: return the whole version for tarball directory if it is a number
Date: Sun, 27 Nov 2022 03:55:10 -1000
Message-Id: <f3dfc90b8d4e7735eedfeab99d0ebe2ba6e970a0.1669557026.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1669557026.git.steve@sakoman.com>
References: <cover.1669557026.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 27 Nov 2022 13:56:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173869

From: Alexander Kanavin <alex.kanavin@gmail.com>

E.g. if version is '43' without any dots, existing code would return ''.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
(cherry picked from commit 38c15322bdbb2423973939e861b5ad1ffb5c8b7f)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes/gnomebase.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/gnomebase.bbclass b/meta/classes/gnomebase.bbclass
index 9a5bd9a232..99ac472080 100644
--- a/meta/classes/gnomebase.bbclass
+++ b/meta/classes/gnomebase.bbclass
@@ -1,5 +1,5 @@
 def gnome_verdir(v):
-    return ".".join(v.split(".")[:-1])
+    return ".".join(v.split(".")[:-1]) or v
 
 
 GNOME_COMPRESS_TYPE ?= "xz"
-- 
2.25.1


