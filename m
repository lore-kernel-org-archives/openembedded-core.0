Received: from mail-io1-f46.google.com (mail-io1-f46.google.com [209.85.166.46])
 by mx.groups.io with SMTP id smtpd.web12.9996.1614349653266959949
 for <openembedded-core@lists.openembedded.org>;
 Fri, 26 Feb 2021 06:27:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=weQ1CVfQ;
 spf=softfail (domain: sakoman.com, ip: 209.85.166.46, mailfrom: steve@sakoman.com)
Received: by mail-io1-f46.google.com with SMTP id u8so9748896ior.13
        for <openembedded-core@lists.openembedded.org>; Fri, 26 Feb 2021 06:27:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=OrEjhOcr5drBAWTLUZH1Sp3VjyOmaXYpESHgA4I1sD0=;
        b=weQ1CVfQAr6+JXYVxfzRR1OUINL+lyihjrpsgE3ddR0G6EBKjYdwOooZacF1EaKkWV
         KEksmXwOuutZVc+K0mZ5RKrlljl1koON8neCm1QU/xLuMlm03nHPDcOy3aQMBBuONaGp
         OxWQCcU5D9/Led6XNC0Pe4O7OKz8y0ublmN2LpolIe/OEsAvR6lcs+7UFP2lxT2iJjHC
         uagcm/oIcGQCpcJvR24WysVVwekcDlgvvnPbvvXees35kM5RcrHIiIybQaKPFwMCPZh2
         mgFflqJcbV11WLFR+xlPkXHnK9FL0SD11U2HndFLjLf5aRHeRakcu8yNhFpZsA/GE97K
         o/nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=OrEjhOcr5drBAWTLUZH1Sp3VjyOmaXYpESHgA4I1sD0=;
        b=TO4Qmj67axhWyHOTSXvPu+Fqm6ooVd2RruwLbwPKGYgy5BdOrKuhjxCCiXNHvDpiSW
         RTw5jT1ezJYNGsd5jQ6DBdCkqOP8tOIWHcnyPqkOgika1UsjatuWUuGxLXcAoRoaRQRG
         buhlnl/K+D+lDKTpTokW5/okd1GGnBicAnjy7wZG+oThrvl69CLZ/XATmCRZFrtfEp1V
         wOxG1dF//IbPzNMmowqkJzPMevRiFMH47S9N+K2tN1RL3Z+xMDqF5zBU2UOvAJGDmHmL
         tV8TpJnxret351+EcnWos6ZNjvgLHHLGkrNbV5bJMnDXMFzaffjGsF7Xevo8Otc3M186
         BVUw==
X-Gm-Message-State: AOAM5328BWN/oZUyPqbuZzIjcPvD+HEuAti13thMMebjrWmUw51oZiUy
	dXK+Kt25ZpJ6YYoTPNJKiUWa2c/Gy/KnvxuN
X-Google-Smtp-Source: ABdhPJwhh5mnqhBb2q+6oe+o0pzgLToiflE8cvPZ12OX1pnRCe8awIut00/XJrCswATZcQq7rFs4vQ==
X-Received: by 2002:a6b:d010:: with SMTP id x16mr3009301ioa.107.1614349652100;
        Fri, 26 Feb 2021 06:27:32 -0800 (PST)
Return-Path: <steve@sakoman.com>
Received: from hexa.router0800d9.com ([72.173.249.164])
        by smtp.gmail.com with ESMTPSA id i3sm5383377ioq.13.2021.02.26.06.27.29
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Feb 2021 06:27:31 -0800 (PST)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 30/40] npm.bbclass: avoid building target nodejs for native npm recipes
Date: Fri, 26 Feb 2021 04:24:13 -1000
Message-Id: <a967a3c011976cf0443b4513c838452d033aced3.1614348990.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1614348990.git.steve@sakoman.com>
References: <cover.1614348990.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Yoann Congal <yoann.congal@smile.fr>

The current recipe unconditionally RDEPENDS on nodejs (the target one).
When building on the "-native recipe" of "BBCLASSEXTEND native" recipe,
the target nodejs is unnecessarily built.

This patch fixes this by only RDEPENDS on nodejs when building for the target.

Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 92a9a86df9e3bcffb13d2f8b5dcbe7822170f734)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes/npm.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/npm.bbclass b/meta/classes/npm.bbclass
index f83c6e496e..bd01e247cd 100644
--- a/meta/classes/npm.bbclass
+++ b/meta/classes/npm.bbclass
@@ -20,7 +20,7 @@
 inherit python3native
 
 DEPENDS_prepend = "nodejs-native "
-RDEPENDS_${PN}_prepend = "nodejs "
+RDEPENDS_${PN}_append_class-target = " nodejs"
 
 NPM_INSTALL_DEV ?= "0"
 
-- 
2.25.1

