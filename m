Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3C3ECD8C85
	for <webhook@archiver.kernel.org>; Fri,  5 Jun 2026 22:19:23 +0000 (UTC)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6068.1780697957975490722
 for <openembedded-core@lists.openembedded.org>;
 Fri, 05 Jun 2026 15:19:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=ESabvvOK;
 spf=pass (domain: smile.fr, ip: 209.85.221.43, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-45ef29c5561so1303563f8f.0
        for <openembedded-core@lists.openembedded.org>; Fri, 05 Jun 2026 15:19:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1780697956; x=1781302756; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cleBijgVerO+eoOoE92hyDVItaWG2GRYMgOohlqB5/0=;
        b=ESabvvOKuICI4lxx7hckqNPo3yqV07MH2k+ErqwYqjRB8vLRx04u6POTHyJUQTgsvX
         Y7U9tLIzGjySKYgmVoCHpFwjxLCcm+nTcYAiZOLKBUSHS9tiSeZXpjxYAT+w3MH5oSN6
         uBDxDMshvLlSG5uXLhu1h95PQRcgiAEzymbmo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780697956; x=1781302756;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=cleBijgVerO+eoOoE92hyDVItaWG2GRYMgOohlqB5/0=;
        b=GbL/BZc6qQh7TJsu0jJXF3r79w0uSacNlQDGi/JlvD4KUZG5pBhCKTKo0E7upKWXJv
         Suigmki5fsR6saApRqGpJB62rplsklagLzGUJ9kT63Np2IPUpiRVn7aoSl30JIAulCEn
         wl3p09SuK8UsfluRhw/0J2ErQX586c8OrAxzvs2+YOSyXeyK14tdZdepSblFA1y3jnKu
         t3JLMiVE9f2RT8ez2dI3QPgxyIE7ku9zPa56roHJgVYkWCCAJ6BuDCnXASmXgmhPYhyu
         e66lgZ0YglTKiVwxngw2hksO16CuCY27DHcYqUC3vH7RYiI4LOmR/50bMDb8nXWzDYhX
         /gvA==
X-Gm-Message-State: AOJu0YwkaXlMz4ZF6K+QBQPLiEDy2ID7EWZr28TOcIajZiyGcoWg1mfI
	ZU0oc/UUbDTuhvXP5eEPPzPtxvqegU1Nno9PsfKA/pONmbiINKJp5vXlmnSanxQyckj30S+dfux
	tT1SN
X-Gm-Gg: Acq92OEGg0quXZZNSY8ldzpCIcHMYyzrFsaYXlWHDFvG7oUwTM379u4qNeWVhSyciYl
	ousCrgOTEkx4o97TyUO9OqChatF+sV6APmmG5I62o5KoKw9BhSL44o2VQYREPhE1M1aO+CuzhTi
	vIF/WNyx1XY2c9ekXxRdZhw935mawTlrn5LRY3izM2D6TpM/hMH3rzEaMgkyWApwcHP7HM1hQEs
	GJOCv/mdbhbvFAlfLos0Zeihp9b7gHGf6Gd9aP/S/Lx2jwO67uJMXdbiagHLzAQzWQ2Vhy13SE/
	Th+pjvyoP5sZsMcqo14nIyBqWcgxYHiHGhF4z6GU2LOSWarn7VsK3hO7aqrEFw8NdTRGCSlls+X
	t6yoUaU+H+aihYH22IT2HyB8bXLlPylGue3vtU4w7GWErKsLWq7H6QD0EGZuWE/nyK2S+vWYHB6
	Hcy8foRNzp9/m7WBF8Jj0kvk3PIb0rsZdX+8qSoOVqTOBiubm6cotnUQ1d4dwsK9MhpFSzD592C
	TzbcaphQq2JVvy26MroVqkNPXfuGHPW/m01wds=
X-Received: by 2002:adf:d02f:0:b0:460:f36:79b0 with SMTP id ffacd0b85a97d-460304fda0amr6850126f8f.19.1780697956349;
        Fri, 05 Jun 2026 15:19:16 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00b3e1ccc1be2b2798.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:b3e1:ccc1:be2b:2798])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f351ac0sm49148571f8f.27.2026.06.05.15.19.15
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Jun 2026 15:19:15 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 1/1] pseudo: Update to version 1.9.8
Date: Sat,  6 Jun 2026 00:19:10 +0200
Message-ID: <39d4d267906f8e18d44e1ba5da84acc4a5a85b61.1780697739.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1780697739.git.yoann.congal@smile.fr>
References: <cover.1780697739.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 05 Jun 2026 22:19:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238186

From: Mark Hatle <mark.hatle@kernel.crashing.org>

Changelog:
    Makefile.in: Bump to 1.9.8
    pseudo_client.h: Fix typo in the comment
    client: permissions drop setuid and setgid
    tests: Add setuid permission check
    pseudo_client.h: Add +s to PSEUDO_DB_MODE for mkdir
    tests: Add test that returned stat is correct
    pseudo_client.h: Make it clear both macros must be updated together
    Makefile.in: Add pseudo_client.h as a dependency

Signed-off-by: Mark Hatle <mark.hatle@kernel.crashing.org>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit fa302de94c7da77a49ca0701580467ebaa8eda18)
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/recipes-devtools/pseudo/pseudo_git.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/pseudo/pseudo_git.bb b/meta/recipes-devtools/pseudo/pseudo_git.bb
index 22bb938cd1d..45407b532d2 100644
--- a/meta/recipes-devtools/pseudo/pseudo_git.bb
+++ b/meta/recipes-devtools/pseudo/pseudo_git.bb
@@ -12,8 +12,8 @@ SRC_URI:append:class-nativesdk = " \
     file://older-glibc-symbols.patch"
 SRC_URI[prebuilt.sha256sum] = "ed9f456856e9d86359f169f46a70ad7be4190d6040282b84c8d97b99072485aa"
 
-SRCREV = "5b7c4b59e7e198aab54b35ea194aeb6d99794f96"
-PV = "1.9.7"
+SRCREV = "823895ba708c63f6ae4dcbfc266210f26c02c698"
+PV = "1.9.8"
 
 # largefile and 64bit time_t support adds these macros via compiler flags globally
 # remove them for pseudo since pseudo intercepts some of the functions which will be

