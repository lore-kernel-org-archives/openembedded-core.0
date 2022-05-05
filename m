Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A420BC4332F
	for <webhook@archiver.kernel.org>; Thu,  5 May 2022 05:06:23 +0000 (UTC)
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com
 [209.85.208.46])
 by mx.groups.io with SMTP id smtpd.web11.7354.1651727173156552302
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 May 2022 22:06:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=dulyGwXy;
 spf=pass (domain: gmail.com, ip: 209.85.208.46,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f46.google.com with SMTP id k27so3904511edk.4
        for <openembedded-core@lists.openembedded.org>;
 Wed, 04 May 2022 22:06:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=EepeDbwZGW5nVEL4FvOLCAChTkr/fLWTOpLudax9+8w=;
        b=dulyGwXy4m/b71GKiL0HOAyiJ2fycXKtbUwE91OZda4ws7TsSOKe+p5l5m+0PflWGU
         yDd3FgpWL+JnmaaIP93YO4qhCCYtpxdo0+8z/Lig4Awm9irwcCz+nSQXdKWAuXl8hhm/
         n9EboTQfvUf3UBUjGSH7zmnng6i6gnT+6FeWHry7UdKIRgqHcSiOYtUQV0NH/HGZXDXr
         CQ7aFDE2+hKSD16figQE71Nq7PBDe4sOe91xT7pr/JkEZeaorn3uoZlFKQtBZUhj6mG3
         T1Mu+IzZOlRZF2YS8/360mM52WMmRvBL1KlNu30PRYQUcSsDzhu0298nd2gc1iiAXWS0
         uWhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=EepeDbwZGW5nVEL4FvOLCAChTkr/fLWTOpLudax9+8w=;
        b=I33KhZAxr/9184PN4HTxpb0fRkaQlqS02FO+IwJ5wbD2Ky9vUmiRHod4xFxjhzE9Dx
         BrWqdfq50Ok+rqnz6FBnZUn7hwDF7H0iKSv12ppDLLrtYvb+jq8AIi2/vrw2OKlypfmj
         Y6JF5zQrOmhiY0cKUeEXR3Bq3V8S4aPkSECeaH6fUTjLkVxkxEBKSQZYjhEAoJc9dEPU
         vVzdXWtEep528PkgOse1zI6hottPiXaeRRfGi7rTrkCM3BxlCzMDs5GZoOruZxf3nTlV
         tGpArTxyF37CiNoobBHsPEQR3lTrIbAXbGHO/xEYQ/anXr1P+NHH2K77r140x65YWOfb
         xGhA==
X-Gm-Message-State: AOAM533iIxu3a0Om90YaO2E/eQ135N4Sqlmw8nqGUfXvw9Jj6UaHr9eK
	bpPjWTyaUrWipDxGPE8NKJmUxB9oXtY=
X-Google-Smtp-Source: 
 ABdhPJxehFtKl9JJ7gjR/s13lPeM0bXdCqlAOClfy9Ik2iyc1V2wJ6iMDASvfZ6J8nHcAKZqBxsqBw==
X-Received: by 2002:a05:6402:5255:b0:427:de81:6af with SMTP id
 t21-20020a056402525500b00427de8106afmr14233157edd.269.1651727171782;
        Wed, 04 May 2022 22:06:11 -0700 (PDT)
Received: from Zen2.lab.linutronix.de.
 (ip-109-090-143-203.um36.pools.vodafone-ip.de. [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 gg19-20020a170906899300b006f3ef214dfbsm313386ejc.97.2022.05.04.22.06.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 May 2022 22:06:11 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 31/61] neard: upgrade 0.16 -> 0.18
Date: Thu,  5 May 2022 07:05:14 +0200
Message-Id: <20220505050544.651895-31-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220505050544.651895-1-alex@linutronix.de>
References: <20220505050544.651895-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 05 May 2022 05:06:23 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165260

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../recipes-connectivity/neard/{neard_0.16.bb => neard_0.18.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-connectivity/neard/{neard_0.16.bb => neard_0.18.bb} (97%)

diff --git a/meta/recipes-connectivity/neard/neard_0.16.bb b/meta/recipes-connectivity/neard/neard_0.18.bb
similarity index 97%
rename from meta/recipes-connectivity/neard/neard_0.16.bb
rename to meta/recipes-connectivity/neard/neard_0.18.bb
index bc9ce07d79..23e999acc4 100644
--- a/meta/recipes-connectivity/neard/neard_0.16.bb
+++ b/meta/recipes-connectivity/neard/neard_0.18.bb
@@ -15,7 +15,7 @@ SRC_URI = "git://git.kernel.org/pub/scm/network/nfc/neard.git;protocol=git;branc
            file://0001-Add-header-dependency-to-nciattach.o.patch \
           "
 
-SRCREV = "949795024f7625420e93e288c56e194cb9a3e74a"
+SRCREV = "c781008d3786e03173f0a0f5dfcc0545c787d7fc"
 
 S = "${WORKDIR}/git"
 
-- 
2.30.2


