Return-Path: <corentin.guillevic@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 36A1EEB7EC9
	for <webhook@archiver.kernel.org>; Wed,  4 Mar 2026 10:44:04 +0000 (UTC)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.15040.1772621034952904851
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Mar 2026 02:43:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=h0EFhMdV;
 spf=pass (domain: smile.fr, ip: 209.85.221.46, mailfrom: corentin.guillevic@smile.fr)
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-439b790af67so1874230f8f.0
        for <openembedded-core@lists.openembedded.org>; Wed, 04 Mar 2026 02:43:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1772621033; x=1773225833; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HEx9wT6aKhFf/XOt5xGAQ0dFDlJsXHX32c3svX6JUTI=;
        b=h0EFhMdVzVmozqo9FnXBe0O+johrwNFaTI8fRHBYMNASKi/fJEkjuQ9kZPhFIEjIrw
         dSFx8dr+EhYghM4VIuruMSpYOsspC6VF8tEpN6+KeYBuWiU4YwOnDY3+Pzr+lrkCyOht
         IcHWFqdwHOcivUqqK5ypH4aDlndPRzsmuCPnI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772621033; x=1773225833;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=HEx9wT6aKhFf/XOt5xGAQ0dFDlJsXHX32c3svX6JUTI=;
        b=GbtjQJFycRt+MMVztddqcvpmgJCOBmeZtiJRD9srMs+x8pScCQKmIr66TYr/E4ahL5
         /hUAwnZw38qbtLKjjofPWFZhA5sWyoJSmDLXB96P8gw4czLsN9XVWi/nrpjNCHQyj2YU
         U2K7IsZCmoFYbrDTg7IrUF5bN0lYb6Gsv0sza2tluEvPRv/TyTxubSreVRRiOge9b+3r
         DlhWL2AQKGigThu50glO6O9yMi0yuBvXvw1yAmuBrp1QiQfsWPpJwXLFft/F4vtBES6J
         BCKrUO903vEXSHIivSJ94s+k6kLVK4qw+21D4Kog2SowSmq73wukng00GXyvFXQ2jDPV
         xHwQ==
X-Gm-Message-State: AOJu0YybKgkJPgoiNm3fD2oje9PtXrZbmqTMy7U7jd/3zZIDEUMl99ym
	YUKV9ZRlLCjqrhRMYS/aPaozfodDK7FKTVjDVNic90SrWQVIQBGEpLsp/gogHS2m3/78Q4GMsnz
	qVyLg6Mw=
X-Gm-Gg: ATEYQzxu226hLv0FU6tGGDHDeLFHYXyVmT5hSot3/e3jMiisUKrurjrGsbkve1L30A8
	zXaFgQWVSoXp/RAhfcAtQKYObVhCzHnQwHazExLTLdP/M4hzPJAF3GqysQERtv/WL2P5XUagosv
	Z5YVsJghd3rRhCO4XWbYGhzhwCk2Q4ffxDQZs2YGC2SfDjZgztbDHXN19AiDZzekC4aDwouoSoP
	BopPoguM+MfpHXfPek7bGvETg7nPbmRVLhZ4+Yw9iR7RsVQpUjZTpWCcB/sKQ2NLyv/4nCdQlM5
	HRVYMX1+ebLqDund1Uw6FWv/yB40+3G0w8jMiUIDxE2S3yE36lqhg5PUFiwRda/JoLVhnwWdLE7
	mVc/eKm/ySWdqr0Gdh8BvKvIydtlWJoHjymmwHUso9d9YbMZix/SNghUnLHicngVUFZMjcRjgKz
	AKxNpKkxKalnMoCI/3sJdGi7Ylp4qH3SD0fBXkQ8v5v9wGpg3JDfjPUh8OmKcYf/I1N1mTIaNkZ
	2bJLeY5ux5jkOdKvM5yonVFHW2DWyrrdjwEI0Ea7uw=
X-Received: by 2002:a05:6000:220e:b0:439:ac8b:4106 with SMTP id ffacd0b85a97d-439c8a8e07cmr2734016f8f.15.1772621033302;
        Wed, 04 Mar 2026 02:43:53 -0800 (PST)
Received: from heaven.idf.intranet (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439b34b6252sm25638168f8f.10.2026.03.04.02.43.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2026 02:43:52 -0800 (PST)
From: Corentin Guillevic <corentin.guillevic@smile.fr>
To: openembedded-core@lists.openembedded.org
Cc: Corentin Guillevic <corentin.guillevic@smile.fr>
Subject: [RFC PATCH 3/4] recipetool: create: use default AUTOREV only for SCM URI
Date: Wed,  4 Mar 2026 11:43:41 +0100
Message-ID: <20260304104342.869457-4-corentin.guillevic@smile.fr>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260304104342.869457-1-corentin.guillevic@smile.fr>
References: <20260304104342.869457-1-corentin.guillevic@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 04 Mar 2026 10:44:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232372

AUTOREV shoud only be used for SCM URIs (Git, SVN...). However, the
default revision is set to AUTOREV regardless of the URI scheme.

To fix this, set AUTOREV as the default value only if the source URI
supports SRCREV.

Signed-off-by: Corentin Guillevic <corentin.guillevic@smile.fr>
---
 scripts/lib/recipetool/create.py | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/scripts/lib/recipetool/create.py b/scripts/lib/recipetool/create.py
index ef0ba974a9..d785f042ee 100644
--- a/scripts/lib/recipetool/create.py
+++ b/scripts/lib/recipetool/create.py
@@ -419,7 +419,7 @@ def create_recipe(args):
     tempsrc = ''
     source = args.source
     srcsubdir = ''
-    srcrev = '${AUTOREV}'
+    srcrev = ''
     srcbranch = ''
     scheme = ''
     storeTagName = ''
@@ -470,6 +470,11 @@ def create_recipe(args):
             # so we need to extract to a subdirectory
             fetchuri += ';subdir=${BPN}'
         srcuri = fetchuri
+
+        # Define AUTOREV as default value only if the source URI supports SRCREV
+        if srcuri and srcuri.startswith(('gitsm://', 'git://', 'hg://', 'svn://')):
+            srcrev = '${AUTOREV}'
+
         rev_re = re.compile(';rev=([^;]+)')
         res = rev_re.search(srcuri)
         if res:
-- 
2.51.0


