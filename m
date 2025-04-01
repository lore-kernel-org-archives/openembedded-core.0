Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3DDABC36017
	for <webhook@archiver.kernel.org>; Tue,  1 Apr 2025 22:36:30 +0000 (UTC)
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
 by mx.groups.io with SMTP id smtpd.web10.72.1743546988704809713
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Apr 2025 15:36:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=bp8lyWQd;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.180, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-223fb0f619dso115337625ad.1
        for <openembedded-core@lists.openembedded.org>; Tue, 01 Apr 2025 15:36:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1743546988; x=1744151788; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lpS2iWpDZh+OS/y589bDG5hb+GxQH4aJmcAk7FM0IAo=;
        b=bp8lyWQdOsrhuZhrj9GBj6AzVZBNcCuF0KllvAhwFRhIx1p0fd/SnGnADfitGpsA6h
         9QYDhiBxXd+XMxtpo2qTO+Tqp5if77loPir/chNdp4R3nZVmLkiztnm4/kGRUO3IYu8O
         rOZ5WxRDV0cX7JOhOyG/QiMOPmkTR/z1hfFnFcL4JKL97KkSX2NaWmC1I6OOrJlXzDmG
         IkViE6a/OXYmprxPQYRcLYgf9qyBjXHCby8OiIjZ0UhLmod7Icwwiul7oiszbd1QbHiW
         lBVmQCgA6y5+9eleBI/a5JZAVMGyRxQG5CElSYUCsF9E2GK42GuXYHq1OQ0Um5TYRbu3
         9gPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743546988; x=1744151788;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lpS2iWpDZh+OS/y589bDG5hb+GxQH4aJmcAk7FM0IAo=;
        b=uObTkYNEd0nt07CQLx2ECMS//GFNN80Q+ew6I29LxLNBuBQeLkwYULRymUQuHCKZMk
         ihot+Jngl69JdsP639ERAPfkze4YWHfkXTD5NRXx8uBU46JHZFaMm+L6jffOXaRXJtEF
         QJz49mYY1l6JeLWxCOS2mYKO/cb4Mn6Kyb1A5eozwEFYUn4vE6Daky7u1FPLyLUvTD+H
         xd4fe9apu5kpDQUEFl13CUxueR6dPkWo4QSx59FP1kCh/BJChjdS40F71yMMjLmdJ+gh
         d9lty7AGyjMOeuwPnx6NEbRav3kxWZVXnTaUX0aLSxciRVyLSQ3Forb1eJ4VHYkMhPVU
         LAKA==
X-Gm-Message-State: AOJu0YxLunfHluz4g2yvygyQHQpBTJuhdxBGCiHyxdZILNL7/Qene4TY
	4V3tWdE9ifUZDY+xG6lCo4OZKPITnMPDDu5EQVus1sGX5N4BgO+L4VaNcVFxJKmO/Xg26nJIcDs
	C
X-Gm-Gg: ASbGncs/lq/UrOa5J/PYrhWGNH7LGLF0L6UJx080aZSmoLecaQxaD8514iOrJJ2bKAJ
	BoNllH4EBlEKofW5XKykkhtyDuausz6sZzBGC/G7TBp/OIvZy0kGy4jOgVbtOkvDwvIi3lSjnly
	dRf5JEhW8Zw+VSPeXpHCmi0t8mY0Th2sF4fJqadHzhbZQn2bTGzGlolGjL3au+yeDVdlDecK/FH
	7nmeqdCQmqRrLAlAL9RIO5PhNLBNO/p9zhmO+4DOXjFj1lWvxjAXTsNvT5FLh314yTNAgm1L4sp
	56Tnt+5flo9Zar7gGO725ydUP7Fh1v2wZN2B
X-Google-Smtp-Source: AGHT+IFQuZtKXDU7PGjdUMxEQYWzC+AkxrNrXKgsjOmPcl+iLVnKzxFWhqom45rMV+rin21Lsep2hw==
X-Received: by 2002:a05:6a21:8dca:b0:1f5:8a03:ea22 with SMTP id adf61e73a8af0-200d1560735mr6650585637.33.1743546987938;
        Tue, 01 Apr 2025 15:36:27 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:6021:5333:bc00:e45b])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73970e226a7sm9534241b3a.48.2025.04.01.15.36.27
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Apr 2025 15:36:27 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 3/8] perl: ignore CVE-2023-47038
Date: Tue,  1 Apr 2025 15:36:10 -0700
Message-ID: <46fd9acd6b0e418009f4cec747ae82af60acbc6b.1743546795.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1743546795.git.steve@sakoman.com>
References: <cover.1743546795.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 01 Apr 2025 22:36:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214155

From: Peter Marko <peter.marko@siemens.com>

Fix for this CVE was backported to 5.34.2 in
https://github.com/Perl/perl5/commit/12c313ce49b36160a7ca2e9b07ad5bd92ee4a010

This commit is listed in
https://security-tracker.debian.org/tracker/CVE-2023-47038

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/perl/perl_5.34.3.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-devtools/perl/perl_5.34.3.bb b/meta/recipes-devtools/perl/perl_5.34.3.bb
index 215990c8fa..ed3518b62d 100644
--- a/meta/recipes-devtools/perl/perl_5.34.3.bb
+++ b/meta/recipes-devtools/perl/perl_5.34.3.bb
@@ -50,6 +50,8 @@ export ENC2XS_NO_COMMENTS = "1"
 
 # Duplicate of CVE-2023-47038, which has already been patched as of perl_5.34.3
 CVE_CHECK_IGNORE:append = " CVE-2023-47100"
+# This is fixed in 5.34.2 via https://github.com/Perl/perl5/commit/12c313ce49b36160a7ca2e9b07ad5bd92ee4a010
+CVE_CHECK_IGNORE:append = " CVE-2023-47038"
 
 do_configure:prepend() {
     cp -rfp ${STAGING_DATADIR_NATIVE}/perl-cross/* ${S}
-- 
2.43.0


