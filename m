Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42966C54E42
	for <webhook@archiver.kernel.org>; Thu, 22 Feb 2024 14:30:58 +0000 (UTC)
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
 by mx.groups.io with SMTP id smtpd.web11.13934.1708612251956878898
 for <openembedded-core@lists.openembedded.org>;
 Thu, 22 Feb 2024 06:30:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=KkV+t+hA;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.176, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-1d71cb97937so78892365ad.3
        for <openembedded-core@lists.openembedded.org>; Thu, 22 Feb 2024 06:30:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1708612251; x=1709217051; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jPSm3e5Z/qybpJwg3E3rYiactqtTGeDorZbIeK3FNtM=;
        b=KkV+t+hAfyPOqFkdAvBmnua69P4tmVQPQTgwFYi/Drdp2Mf7zVdAha+C6Qh8tOSnxe
         p0BF/FR9NZhRZehj0OHLrBpmSGt5yCz+FpBziCWvvBM7jUM8RSzUD4WvTIEAidbOb3eV
         4/Y0lF3okgNzkxHSt0H82Eojleg8Q5jw3flXRUmzqjFmCcPCaPHAXvohpqM9xxNl1AaE
         lUGg3meSrPPucJipxTE8s2cTIMSJKzitbPi/zZbmIgtpod8F+ZTN9ygp6PeHYCEFiL6J
         UCNUC86k3oR2019vy6SFq0Ar79GGx92GSwfP+alG2aemJVy7h6zaf5Eu9LMwHgnWcwZv
         i9bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708612251; x=1709217051;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jPSm3e5Z/qybpJwg3E3rYiactqtTGeDorZbIeK3FNtM=;
        b=fTAfdtuTERO7OLuKsq54pl8uyBZ/d15yMOmcwe+3yVgRcl9467uNdqGvXn+A+5H2os
         CnCvvZD3mxun2da92PgVxPu/xax5g2tnIaMXfcgvY6MESU3xiOHfJ7t/nU0CLEsnUSdt
         kLj6hfu+gjAe5jhndKZYHOGrCnf0RDShNWkiUb/x7FU3+XzRKthOkuIiRbncZ6A9DoLo
         mpVdZWk/bS6ejZMutwuKKSfetFKhw4aFxFcIl9cbBTNcLbkmt5eYAkSdufm160dNdLRp
         uPWIC59OJllxe5HvWtUXd89jlyA5DYaunlYuIVhyGPIza2coKpxWjZg/2z1gkqA2bHOk
         YBCg==
X-Gm-Message-State: AOJu0Ywarh3vHi73Dr3hzEdVw4LSd9SJJsO1LXbQVQh/qSqfC2h+w7qO
	wE7oIePFmKaiCz2gqfyzSheitfpxkwGAeindy4pgOgZzrhgxaY7ruZJvD/UzF0TQvLScdcvrQO8
	e8X8=
X-Google-Smtp-Source: AGHT+IEgLVyAJ/1JwvojubIso6KXToAswTSlXMwGmuz7uq1Z8dDHkj4Ydu/Gm6Sy8E0yWbYYDTZ4EQ==
X-Received: by 2002:a17:903:2c2:b0:1db:8368:463d with SMTP id s2-20020a17090302c200b001db8368463dmr15163239plk.21.1708612251300;
        Thu, 22 Feb 2024 06:30:51 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-234-108-41.hawaiiantel.net. [72.234.108.41])
        by smtp.gmail.com with ESMTPSA id k13-20020a170902f28d00b001dbcf653024sm9364558plc.293.2024.02.22.06.30.50
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Feb 2024 06:30:50 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 2/9] vim: upgrade v9.0.2130 -> v9.0.2190
Date: Thu, 22 Feb 2024 04:30:33 -1000
Message-Id: <15c0077162f6af1908b3767b12ac79f24090b59d.1708612053.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1708612053.git.steve@sakoman.com>
References: <cover.1708612053.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 22 Feb 2024 14:30:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196021

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
index e6735d5881..6d62bd67af 100644
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


