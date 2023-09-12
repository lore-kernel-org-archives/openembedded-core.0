Return-Path: <tgamblin@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 565F9EE3F02
	for <webhook@archiver.kernel.org>; Tue, 12 Sep 2023 17:20:12 +0000 (UTC)
Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com [209.85.222.170])
 by mx.groups.io with SMTP id smtpd.web10.232.1694539204086012562
 for <openembedded-core@lists.openembedded.org>;
 Tue, 12 Sep 2023 10:20:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20230601.gappssmtp.com header.s=20230601 header.b=hIkg7qW2;
 spf=pass (domain: baylibre.com, ip: 209.85.222.170, mailfrom: tgamblin@baylibre.com)
Received: by mail-qk1-f170.google.com with SMTP id af79cd13be357-76f08e302a1so364107785a.1
        for <openembedded-core@lists.openembedded.org>; Tue, 12 Sep 2023 10:20:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1694539203; x=1695144003; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HXDK3+1p/0y3IgQuVhwyn3JjLouC3pQlfjW9afyJyZM=;
        b=hIkg7qW2xWspuQFof8l7a4L+fjyS8D1DixQA8CG9VY7GDtIEv7V6BmY/EImwRHUTtB
         GZA0tQXxsgdFMEajGpMZlG8Dy7am+dG0bLFoFDBIfnrRXOGKVasMQZdu6iP/EjCnSexK
         +rHVpWQ1E5s4Ya6RV2uJ2HZ4eXLfxP/HKvfLdVdW8yL9z2P24X4teMVTZKSDFLxdk7TR
         jAG1dCvpNZT2Q6F0r7DbwECPTrxBKakevFrCsKyxS2ZzfjKG4MYAth9ZEt1ErGFSilNh
         z1K3YCTI9MRkkueG4AhbNup6ubj9sy1Qod9LLSvT5BoqxLQZ1e0fad5TZx0a7a6kG8zX
         DnPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694539203; x=1695144003;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HXDK3+1p/0y3IgQuVhwyn3JjLouC3pQlfjW9afyJyZM=;
        b=bC/fBBUcdXmemxcpPW8SncBSJ0ZQSLICAP0nNubqnscc4KCSRPB1HXZHBJEGTFVFZP
         STEcDrkrFByc7EADLtEslDbL95UGShxyFm2Z/lFGppd0UGgMpG5jRavjt+4CbSYKXmce
         IYR+VkLYSizlEqDtp0nBxPaBUF/uM5+p2/7p3cYXv7fGSeYZfKo+MZpE6mfISORA/9XG
         zOzk1ohDTsy6O44VcQj1smYwBuY8Nt0brWcRpdZer/+wo8n8UMcb69AQFxrzyn5BD/wE
         ChtVw8Xaq3nbXOd/bBasriiX/F+mYkwCvrXHfqLugI28dj0U/ZoARSc+CtA84UPlLn0I
         4RHA==
X-Gm-Message-State: AOJu0YyEam59SjQpBTOVPoEw6+I7uJM8RqEVwCxofZO7aUrteR2+uQ1a
	dsuihb3/5fTs93svDaH03F885d+4fm68kryMP1hLag==
X-Google-Smtp-Source: AGHT+IFl91VQ6W0ussMpAiBnaGshgn0Pflv92z5kMlxo1aCXAQ9/Cw6Ag2LTh3Q4ObY0C3GOx4eKyg==
X-Received: by 2002:a05:620a:4494:b0:76d:f544:3426 with SMTP id x20-20020a05620a449400b0076df5443426mr105868qkp.28.1694539203126;
        Tue, 12 Sep 2023 10:20:03 -0700 (PDT)
Received: from megalith.cgocable.net ([2001:1970:5b1f:ab00:fc4e:ec42:7e5d:48dd])
        by smtp.gmail.com with ESMTPSA id n3-20020ae9c303000000b0076d25b11b62sm3356726qkg.38.2023.09.12.10.20.02
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Sep 2023 10:20:02 -0700 (PDT)
From: Trevor Gamblin <tgamblin@baylibre.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 4/4] patchtest: Add README.md for selftests
Date: Tue, 12 Sep 2023 13:19:58 -0400
Message-ID: <20230912171958.1575518-5-tgamblin@baylibre.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230912171958.1575518-1-tgamblin@baylibre.com>
References: <20230912171958.1575518-1-tgamblin@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 12 Sep 2023 17:20:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187538

Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
---
 meta/lib/patchtest/README.md | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)
 create mode 100644 meta/lib/patchtest/README.md

diff --git a/meta/lib/patchtest/README.md b/meta/lib/patchtest/README.md
new file mode 100644
index 0000000000..354702ee4f
--- /dev/null
+++ b/meta/lib/patchtest/README.md
@@ -0,0 +1,20 @@
+# patchtest selftests for openembedded-core
+
+This directory provides a test suite and selftest script for use with the
+patchtest repository: https://git.yoctoproject.org/patchtest/
+
+To setup for use:
+
+1. Clone https://git.openembedded.org/openembedded-core (this repo) and https://git.openembedded.org/bitbake/
+2. Clone https://git.yoctoproject.org/patchtest
+3. Install the necessary Python modules: in meta/lib/patchtest or the patchtest
+   repo, do `pip install -r requirements.txt`
+4. Add patchtest to PATH: `export PATH=/path/to/patchtest/repo:$PATH`
+5. Initialized the environment: `source oe-init-build-env`
+6. Add meta-selftest to bblayers.conf: `bitbake-layers add-layer
+   /path/to/meta-selftest/` (the selftests use this layer's recipes as test
+   targets)
+7. Finally, run the selftest script: `./meta/lib/patchtest/selftest/selftest`
+
+For more information on using patchtest, see the patchtest repo at
+https://git.yoctoproject.org/patchtest/.
-- 
2.41.0


