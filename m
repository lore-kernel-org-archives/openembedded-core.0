Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A8B1C54E52
	for <webhook@archiver.kernel.org>; Sun, 25 Feb 2024 21:53:04 +0000 (UTC)
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
 by mx.groups.io with SMTP id smtpd.web10.7500.1708897976836156541
 for <openembedded-core@lists.openembedded.org>;
 Sun, 25 Feb 2024 13:52:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=WCnJZ7bl;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.48, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-299c11b250fso1784609a91.2
        for <openembedded-core@lists.openembedded.org>; Sun, 25 Feb 2024 13:52:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1708897976; x=1709502776; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XUvO7yqMuiBA/8o0UYyOwHDNyF5Z1AY3zHj6iBWF4Zk=;
        b=WCnJZ7blGRHo8CdthiI1MZBtD99hazxnNad70NOwKWXL9zJ+LHB6XPyeE0mgBR9w6z
         FDSX88GjXpnJY6G9wMzUeoPCh0zj35sXOCsD1tfNnjYuI/VKHP73nnZZsfqmTX70esty
         9rcRoaMzXsi7p04IzBuiNpclP9AjpKNHF2QJPQuRjFfexM4ZkOVRz/WDBVqq9JBqC/iU
         vXbPIdoUcehOjD9FfmkOyRpoUexc7qJOfhI1X0cyxynvDpmnPH6bIzFKFS3j8Xzsfrvc
         NxPsu2JRZuDLwX3GuyGMFHKpnRosPRA8GErgO0vFOOp1nO8873B07C7A5yuY7yLtaAJ0
         2+CA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708897976; x=1709502776;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XUvO7yqMuiBA/8o0UYyOwHDNyF5Z1AY3zHj6iBWF4Zk=;
        b=QGXViWiSuloKnQBp2jfobBZt/D25GQaBzGayo4fJB2/GYQlRFz24wGGIoxo8R/fhv8
         DSata3IUSJfBcNuwbUkQqoTDoGX+a0amaVqgwwAoeEXqy/8BZbdwu8yKK151M9WhIiQB
         s4lDtSgmfZZ0Hv3Hu6jdzKLe17ylalnvC3kU42sDc11CHC2Rk6ASf+yopAg8SqrQh9M0
         hN2cZJYIL81osHyqW/+f4U6V0dX3r+TgS8dhXp2l7hQ8Rg6sIIqLxL747CH+JteMLE1S
         94VFJi5wcsn+sG6NXQne3vmVehMmJEISKJBNibvi+GOK+3fe4Z2v2Z0E1hJ78kxoFVxO
         aW2g==
X-Gm-Message-State: AOJu0YynPkgEV+GsjzG+zRDOndZwg5CGluECqlOR9QGBmapUGUmvT5Ri
	IsdGLRxWiUUBDcqlet0Qj8IaWYP/g6+KlGyh0oT9r2Ea7gURAc9smIZLh8oKT2iLvg5Q4/Y7748
	NoCgUCQ==
X-Google-Smtp-Source: AGHT+IGgDD3VE/hkuk1rEhVy7oCLeNuy6PbjkieE2lHcQOFoOoyXopyhzHQjSO6lc3+UylH/M9+brw==
X-Received: by 2002:a17:90a:6448:b0:299:4a15:4a36 with SMTP id y8-20020a17090a644800b002994a154a36mr4238052pjm.35.1708897976204;
        Sun, 25 Feb 2024 13:52:56 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-234-108-41.hawaiiantel.net. [72.234.108.41])
        by smtp.gmail.com with ESMTPSA id a12-20020a17090acb8c00b0029a4089fbf0sm3082947pju.16.2024.02.25.13.52.55
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Feb 2024 13:52:55 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 03/22] vim: upgrade v9.0.2130 -> v9.0.2190
Date: Sun, 25 Feb 2024 11:52:22 -1000
Message-Id: <e7976311a79f05608bbac46a5699ef9206a2aaf5.1708897822.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1708897822.git.steve@sakoman.com>
References: <cover.1708897822.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 25 Feb 2024 21:53:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196155

From: Tim Orling <ticotimo@gmail.com>

This is the latest/last of the 9.0.z upgrades, since 9.1 is now
released.

CVE: CVE-2024-22667
(includes the patch for .2142 https://github.com/vim/vim/commit/b39b240c386a5a29241415541f1c99e2e6b8ce47)

Changes:
https://github.com/vim/vim/compare/v9.0.2130...v9.0.2190

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-support/vim/vim.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-support/vim/vim.inc b/meta/recipes-support/vim/vim.inc
index 6b440d8947..906aa53a16 100644
--- a/meta/recipes-support/vim/vim.inc
+++ b/meta/recipes-support/vim/vim.inc
@@ -19,8 +19,8 @@ SRC_URI = "git://github.com/vim/vim.git;branch=master;protocol=https \
            file://no-path-adjust.patch \
            "
 
-PV .= ".2130"
-SRCREV = "075ad7047457debfeef13442c01e74088b461092"
+PV .= ".2190"
+SRCREV = "6a950da86d7a6eb09d5ebeab17657986420d07ac"
 
 # Do not consider .z in x.y.z, as that is updated with every commit
 UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>\d+\.\d+)\.0"
-- 
2.34.1


