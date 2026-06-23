Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45933CDB47C
	for <webhook@archiver.kernel.org>; Tue, 23 Jun 2026 22:27:03 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.33395.1782253619388884340
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Jun 2026 15:26:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=IgYPWc+z;
 spf=pass (domain: smile.fr, ip: 209.85.128.52, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-490b9318997so2025525e9.2
        for <openembedded-core@lists.openembedded.org>; Tue, 23 Jun 2026 15:26:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1782253617; x=1782858417; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FbE9Pd6luAnxk6H8jtLKUvoGLuG03WOVQBvo9b1KoRY=;
        b=IgYPWc+zoXTpWMeKF54rSrugQIF9NIdE6UgxMzJvIs5bTsj5gbKlFxhNKFr+qLwlYP
         8qicfIhx8jnsuSimUMQ2BS1DXtIX2Agq9pYI93+iVa7Qh+z718joFdVJ4hGnOfvUME4c
         z4voDLVZWuba5+pJ5d3iZw1DV+7GcQ5HsNrSU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782253617; x=1782858417;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=FbE9Pd6luAnxk6H8jtLKUvoGLuG03WOVQBvo9b1KoRY=;
        b=hLxzO+ufRsDNaZuY1qEg4PLVhJ1stoYQWZ00eUcAcFUNUVfjy7CJyxycbUK50IDyUn
         W8tTHXmk4Q2dRsREkGAX+nTF8P6UElSYXvGuZwcLcoxPIBggRmtufY47JFTnfAjhkQkI
         T4Qf5RE8CTLVUr68enwFfz75URwezh3qcoz5cO3mDr8EGl2/1buk6F/NiKVWxq5XYvhM
         n09Br5ARvb+7ZT/kez/hnzDBoYP9blpKqexRs+7zjA6lPrxb2B5InWhGTG/XPbaoc47N
         Af9T8rOcH5h7hPoLB/d+J0deLYRqZE+YEYv/cU4Etax5N/7N4TM9n2N1ojcbDmFJourT
         H0pQ==
X-Gm-Message-State: AOJu0Yy3k6BBS3YtsBcCIHXdSBcpvdo1cQAXMNEmEmKUBpOEz+IoMgDh
	7U6+KqVvDMzP3QsJVH9SDBwcO+lTjOib1UEI4icUYv1VFd9DElDrq1GIDWcQTtwMApAXsd9Vvwd
	PxLXd
X-Gm-Gg: AfdE7clKDVZp1CdQCAIa/3hkZdApJwykiZXcr67j3628UwEbBctzgWgWHuWfCrYF7Uk
	GSAsrRjA6FBUsGNIJWwNidkBdNEVmvs/n8TKgmAjRfCPuahf7GW0Cue1F6V0TLZTt7oq/p7feJK
	rpdhoPLiq9uGe95qYyIJ4fjXYztvu2/IPb7XK+HkqHXEvIFkKhuhi7thWei8Hqo9PKM9LJNw8re
	LCoQDwexfj6F7aZQYSuFJZR9Eiejcn053J56Mk8dWvBiygshi0/fNnAUJu56SvXBm03Zm+q+fPu
	RQX5UXjHvIEefj0iE9jsIcpkSr7Ojvy3+PrZZVr5d13Y73sy/qfZ3ReWHtOiT+5RNebyibJT2Il
	5sp29wx11iNIUWbjNUEipGs4Z2tret7f9lhLiznM7MUm37Hxmh5gPxnsfmMdwrYiuuwByOpFGqw
	fC349clbmoGggSCn7UqleSu+57s/Xt9TJIvl+GAtDf1oICNig6VjDPSoYSvC6xJCvqGolg4dz0W
	Sf4qfnyhOsyFs54
X-Received: by 2002:a05:600c:8506:b0:490:b724:5085 with SMTP id 5b1f17b1804b1-4926087f25amr6388525e9.33.1782253617591;
        Tue, 23 Jun 2026 15:26:57 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa0055dd0cae868d89dd.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:55dd:cae:868d:89dd])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4923fd21dbdsm370786745e9.6.2026.06.23.15.26.57
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jun 2026 15:26:57 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap v2 01/41] pseudo: Update to version 1.9.8
Date: Wed, 24 Jun 2026 00:26:00 +0200
Message-ID: <d716fe7e4f1dd2156be8773408611bb979a94d5d.1782252148.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1782252148.git.yoann.congal@smile.fr>
References: <cover.1782252148.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 23 Jun 2026 22:27:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239422

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
index 1ca1ebd6bf2..3d7dd62448f 100644
--- a/meta/recipes-devtools/pseudo/pseudo_git.bb
+++ b/meta/recipes-devtools/pseudo/pseudo_git.bb
@@ -12,9 +12,9 @@ SRC_URI:append:class-nativesdk = " \
     file://older-glibc-symbols.patch"
 SRC_URI[prebuilt.sha256sum] = "ed9f456856e9d86359f169f46a70ad7be4190d6040282b84c8d97b99072485aa"
 
-SRCREV = "5b7c4b59e7e198aab54b35ea194aeb6d99794f96"
+SRCREV = "823895ba708c63f6ae4dcbfc266210f26c02c698"
 S = "${WORKDIR}/git"
-PV = "1.9.7"
+PV = "1.9.8"
 
 # largefile and 64bit time_t support adds these macros via compiler flags globally
 # remove them for pseudo since pseudo intercepts some of the functions which will be

