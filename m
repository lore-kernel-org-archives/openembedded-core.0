Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C84DC4332F
	for <webhook@archiver.kernel.org>; Sat, 17 Dec 2022 08:50:40 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.web10.3930.1671267032187035904
 for <openembedded-core@lists.openembedded.org>;
 Sat, 17 Dec 2022 00:50:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=ZdtbkpUH;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.48, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f48.google.com with SMTP id ay14-20020a05600c1e0e00b003cf6ab34b61so5570132wmb.2
        for <openembedded-core@lists.openembedded.org>; Sat, 17 Dec 2022 00:50:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=zktFjnG7+WoyaIvN6+IGU8d10+LVVq8+e4EukmJOHpg=;
        b=ZdtbkpUH9SdMXLBHEjAocBRSFXBE17rgCV17RvuDfKQ+JWSkElyRiJ1tYldweCPs5K
         fo6u0XlZa3K2ebAY9LDAkIxX0Jp2nEXrGM9Z4W7xd/KOcR/tUqkrCth3lpDFid2hA16l
         xgr7QWAmxq5R0S1QZJaBziMuZ7kSluGEeKJ/8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zktFjnG7+WoyaIvN6+IGU8d10+LVVq8+e4EukmJOHpg=;
        b=1D3Cq9+AGB3jTcaFxjkoMHIa/m4CXPMsNgUtoyHqFZvm2EL1GBi8WZIs+QaJj4xEDG
         3vn2R89EcREvNMpmJTRgOeFOp5wnZ6zCbnW7OlkU304+gEjuP3RMRCm+6RFon63shfvy
         LyhU6Cad0ul1dqJ2TV2fH0WXUdn1nfPeFI50LDwhj/ObsicUpGjYzVXsXrVKdBB3K6X2
         3r9kkTnoHFV+RZlyfotZVeoySv4KbUu98rHs5tdK1Gw7N1EnI9J0N05tmdAlvOh6XoKv
         BskBOfyiirBMsEaQPJ2BE2GKc4hKRw3n09Z0PoAjFUy3ICIJzQwDvL5s6PyT/G2zecyg
         F1BQ==
X-Gm-Message-State: ANoB5pnnwWGug12QKWTlj2egi+2dAQD0POx3axa48on8eKw8PgMcFZI3
	w+2nh6yoBLZ4coYe8NTd396/6nW2isckG/4D
X-Google-Smtp-Source: AA0mqf6wXw9ay5p7N/2fZR/Q0cZlAFQt4PEfJByOq9j9PA/ur6J8JISOWO7hnHZZMdtDxdCgyWzJvg==
X-Received: by 2002:a05:600c:34ca:b0:3cf:7624:5f98 with SMTP id d10-20020a05600c34ca00b003cf76245f98mr13183180wmq.18.1671267030319;
        Sat, 17 Dec 2022 00:50:30 -0800 (PST)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:17b:a3fe:f7a:35a6])
        by smtp.gmail.com with ESMTPSA id k62-20020a1ca141000000b003cf894dbc4fsm5133580wme.25.2022.12.17.00.50.29
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Dec 2022 00:50:30 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] bitbake.conf: Add module function vardepsexclude entries
Date: Sat, 17 Dec 2022 08:50:29 +0000
Message-Id: <20221217085029.242294-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 17 Dec 2022 08:50:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174768

Now that bitbake can look into python module code variable and function
dependencies, there are a few extra basic variables we need to exclude.
This is done per function since it keeps the main exclusion list cleaner
and is also slightly faster.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/conf/bitbake.conf | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index c9a4e328f1e..bfa28d3bc9b 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -968,3 +968,8 @@ MULTILIB_VARIANTS ??= ""
 # what it would be anyway if the signature generator (e.g. OEEquivHash) doesn't
 # support unihashes.
 BB_UNIHASH ?= "${BB_TASKHASH}"
+
+oe.sstatesig.find_sstate_manifest[vardepsexclude] = "BBEXTENDCURR BBEXTENDVARIANT OVERRIDES PACKAGE_EXTRA_ARCHS"
+oe.utils.get_multilib_datastore[vardepsexclude] = "DEFAULTTUNE_MULTILIB_ORIGINAL OVERRIDES"
+oe.path.format_display[vardepsexclude] = "TOPDIR"
+oe.utils.multiprocess_launch[vardepsexclude] = "BB_NUMBER_THREADS"
-- 
2.37.2


