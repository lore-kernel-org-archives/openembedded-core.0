Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8DEEAC52D7F
	for <webhook@archiver.kernel.org>; Wed, 14 Aug 2024 19:59:23 +0000 (UTC)
Received: from mail-oi1-f181.google.com (mail-oi1-f181.google.com [209.85.167.181])
 by mx.groups.io with SMTP id smtpd.web10.107390.1723665561085515288
 for <openembedded-core@lists.openembedded.org>;
 Wed, 14 Aug 2024 12:59:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20230601.gappssmtp.com header.s=20230601 header.b=GEm+l7tM;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.167.181, mailfrom: jdmason@kudzu.us)
Received: by mail-oi1-f181.google.com with SMTP id 5614622812f47-3db1e21b0e4so133663b6e.2
        for <openembedded-core@lists.openembedded.org>; Wed, 14 Aug 2024 12:59:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20230601.gappssmtp.com; s=20230601; t=1723665560; x=1724270360; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=Tw7YT4x+/53twD3w5YQPxUBT7K/pyl3KGQ4lCRAqFic=;
        b=GEm+l7tMng8pkXTb3Lh3Ojj79DcTUX1SeN9C9fa5UQx0xK3IgHsmzqnf66jLw9utJu
         dPQHGfMdQCJ/rH6jAxmO4a89U9MhIAsbkP80DXAyF8IiBCvyuarm5sGRjKtiPCsQVp9f
         gXsLiAPq553f0cX5rX84+ZotVD/Lfki7MmfCgWo+XWQPT2iPXv+bZ1FbNG9nNl5JopR3
         r0qiR/6TZtY6ZCvdUXjWROnFo1P37vEa0Emxd/KTG5yEzzu3xu0xmjklGAHxCNZGGADE
         9vm3h1nz95xdkrQb8eeEtiwuMN91vu9uCNqxYZVit81D8DOFn1+8lKg88gEJsXS6dNGn
         Sdmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723665560; x=1724270360;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Tw7YT4x+/53twD3w5YQPxUBT7K/pyl3KGQ4lCRAqFic=;
        b=l7I5xQfC67Esa3ja2GVrIQ3kzFnOu6g2WYACExIP0/ROrwRG0LGeOlONE5dZfpEfaA
         aWjGgPbddQa+UXN8iTqUlmnZuM0sTQT+uFS3Yyq/Ob0iiP8LSSEkBw4Edriso9PSJ4n7
         ZiQJzcOptIP28YnZdZo4a79fR60dqybxGeC+BNXtyuRi6/VpIEdi/1t9zoO8by9uX08s
         7ZDQ42c0loH/qQp1PSCIuqZHTNOZXfErH39XKhj5LEeNCptG7Be/CoBWalurbjtbigju
         La6bgmkv5WutVBbJS6QyaAMMfUaNy3Z92sgPvDqXTka9AOt3QGdxayBSF/ugNW77YiDY
         TORA==
X-Gm-Message-State: AOJu0YzhDjjF/EvCh4rsIgiDsOZfxHOyZftqXXznsRA6t5U6rulnj8gm
	XCqesCLGMIk8cAn7+PQHhxtaimVt9QJYqhQo9lNW+fZ5FVcldayE7mz529jhXXW7nszkIXVx4JA
	=
X-Google-Smtp-Source: AGHT+IErPqnZ1yUDB2k2MUw2zpcvv8v9FNCOJCe68liHEvg4PKLfkM7/lLnjmDVn7dhe9zE5xU68/g==
X-Received: by 2002:a05:6808:2383:b0:3d5:6312:a017 with SMTP id 5614622812f47-3dd299236f4mr4365912b6e.29.1723665560051;
        Wed, 14 Aug 2024 12:59:20 -0700 (PDT)
Received: from localhost ([136.54.20.50])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4531c1a7d0esm45146381cf.8.2024.08.14.12.59.19
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Aug 2024 12:59:19 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/2] kernel.bbclass: remove unused CMDLINE_CONSOLE
Date: Wed, 14 Aug 2024 15:59:18 -0400
Message-Id: <20240814195919.1079481-1-jdmason@kudzu.us>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 14 Aug 2024 19:59:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203329

CMDLINE_CONSOLE appears to be a legacy variable that is unused anywhere,
and has not been modified the creation of the git tree.  Remove it and
make life simpler.

Signed-off-by: Jon Mason <jdmason@kudzu.us>
---
 meta/classes-recipe/kernel.bbclass | 2 --
 1 file changed, 2 deletions(-)

diff --git a/meta/classes-recipe/kernel.bbclass b/meta/classes-recipe/kernel.bbclass
index 4464155b7304..cdcc5e003202 100644
--- a/meta/classes-recipe/kernel.bbclass
+++ b/meta/classes-recipe/kernel.bbclass
@@ -227,8 +227,6 @@ KERNEL_DTBVENDORED ?= "0"
 #
 # configuration
 #
-export CMDLINE_CONSOLE = "console=${@d.getVar("KERNEL_CONSOLE") or "ttyS0"}"
-
 KERNEL_VERSION = "${@get_kernelversion_headers('${B}')}"
 
 # kernels are generally machine specific
-- 
2.39.2


