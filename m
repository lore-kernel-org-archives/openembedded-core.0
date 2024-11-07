Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1EC98D5AE47
	for <webhook@archiver.kernel.org>; Thu,  7 Nov 2024 02:29:51 +0000 (UTC)
Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com [209.85.219.46])
 by mx.groups.io with SMTP id smtpd.web10.63359.1730946580985893108
 for <openembedded-core@lists.openembedded.org>;
 Wed, 06 Nov 2024 18:29:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Aauinriy;
 spf=pass (domain: gmail.com, ip: 209.85.219.46, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qv1-f46.google.com with SMTP id 6a1803df08f44-6cc2ea27a50so13821716d6.0
        for <openembedded-core@lists.openembedded.org>; Wed, 06 Nov 2024 18:29:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730946580; x=1731551380; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NtfSU93QOLF6Jz+5fF7JImUyXR4EH9cOYzJKV7Fywsw=;
        b=AauinriyaP7J+lzijleVLtmA7Xvstpf32oTPNTkEQJHXSsWXH2fTeblplNM4rvQdNd
         xMmS4bfaA1CzFTKFFxqNAUoYObHhjXhcCCZ2j2cC78C/vl0X6DP0iBxaDVUt7W6avp3C
         ki6Dk6jroOo/RpQ+1YylZCTNCkFjcPpjjwzzDX1dYJjWVWu1sbU6CXsvOKtq07nIHaRi
         hdCRkGxo2RZw3kA5WJs5kM8M1Q9my+AItt8DZ9DVqyyOQ5DCna5HO2fQKOAOtDJddDmN
         +bC7yVvnYB+GQYFJ8/yLKEcUhuu5zZ+17lbOfTnzaOOV4C47+PLGs5rgSNo+UBFKWp70
         6UVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730946580; x=1731551380;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NtfSU93QOLF6Jz+5fF7JImUyXR4EH9cOYzJKV7Fywsw=;
        b=bEH2zqbWLPhQgpfFRmIJp4mwLNpYRrPxq/PHNFZ3pecpXfqU/ocmVPJcSD2ora5Ct2
         L1UWx/RW81h7OxpCfK0mv/CNL8TgicN+7PxYt0CKKAONWG22xw0fs8gUq6a7nW/Y18MR
         3f8sj14FdFeb4SOFd28EjE1PswGA15VVJNB+Q5+ItJPtwbth9IYK5pFj87h0Qrr2BVMP
         xSzS1UzfXQgY/puCssXJICVSX4QNiin8zzpXV9s9nfaB5YavLyIun3CIQkEnrjWTExun
         fIWmem/nFzmzELTswk92Vwgb8NCQjbbYVQy/SUUgWEZ9WzWFlIRcuoeQAgJrWJr3BplO
         /pbQ==
X-Gm-Message-State: AOJu0Yze2cUaAgGjYPXBU9pXlikUt04pd8U6NhpZ7fo+QTTvUjViN4K2
	NSD5b7d9dPW2vRIfjBuXCooBLEUcVpFZ5FNbE4MJOycqXPXiHaMJmUv+DTVW
X-Google-Smtp-Source: AGHT+IG9/R9t2CQ+aqKYDm7bQWhIBTbCufqo1gAs0FgXZpiiCJo4ca3A2Jvu/Cy5qmyV3LXBRcN0AQ==
X-Received: by 2002:a05:6214:21ce:b0:6cb:440c:c44 with SMTP id 6a1803df08f44-6d393bf9ed9mr20327366d6.1.1730946580048;
        Wed, 06 Nov 2024 18:29:40 -0800 (PST)
Received: from bruce-XPS-8940.localdomain (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6d396631aeesm2124286d6.120.2024.11.06.18.29.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Nov 2024 18:29:38 -0800 (PST)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 12/12] kernel-devsrc: make tools/Build optional
Date: Wed,  6 Nov 2024 21:29:17 -0500
Message-Id: <bbb0ceda047500064402506812bfab6c4afa9b25.1730946087.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1730946087.git.bruce.ashfield@gmail.com>
References: <cover.1730946087.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 07 Nov 2024 02:29:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206816

From: Bruce Ashfield <bruce.ashfield@gmail.com>

kernel-devsrc fails to copy files for v6.12+ as the
following upstream commit has removed the file tools/build/Build:

   commit ea974028a049f2cea4bb6be963ee3e3844a03f6d
   Author: Brian Norris <briannorris@chromium.org>
   Date:   Mon Jul 15 13:32:43 2024 -0700

       tools build: Avoid circular .fixdep-in.o.cmd issues

We make the failed copy of this file non-fatal to support
all kernel versions.

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 meta/recipes-kernel/linux/kernel-devsrc.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-kernel/linux/kernel-devsrc.bb b/meta/recipes-kernel/linux/kernel-devsrc.bb
index 7724967151..1500aff2e2 100644
--- a/meta/recipes-kernel/linux/kernel-devsrc.bb
+++ b/meta/recipes-kernel/linux/kernel-devsrc.bb
@@ -156,7 +156,7 @@ do_install() {
             # these are a few files associated with objtool, since we'll need to
             # rebuild it
             cp -a --parents tools/build/Build.include $kerneldir/build/
-            cp -a --parents tools/build/Build $kerneldir/build/
+            cp -a --parents tools/build/Build $kerneldir/build/ 2>/dev/null || :
             cp -a --parents tools/build/fixdep.c $kerneldir/build/
             cp -a --parents tools/scripts/utilities.mak $kerneldir/build/
 
-- 
2.39.2


