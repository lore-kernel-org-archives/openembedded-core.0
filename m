Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6523BC83F26
	for <webhook@archiver.kernel.org>; Wed, 30 Jul 2025 21:08:44 +0000 (UTC)
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
 by mx.groups.io with SMTP id smtpd.web11.46613.1753909721831456952
 for <openembedded-core@lists.openembedded.org>;
 Wed, 30 Jul 2025 14:08:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=OD0/0CDU;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.174, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-76bc61152d8so240960b3a.2
        for <openembedded-core@lists.openembedded.org>; Wed, 30 Jul 2025 14:08:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1753909721; x=1754514521; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sbLpP0PVmz8a3yJaLvyEK6s6J7/VD8dv5XMCRJ2MeaY=;
        b=OD0/0CDUvsTi9pBviX6l7feCMh4tcUdnsi1doljgQC4xVDBmpg+LzP5lJMaYnEdskq
         jsAxNoxdXpAqcWrxMgoUsOMEVE8ucqEJnYyT9B3FyPPZzvRPYoTMatydaRN/Av3iX5IO
         5QDCJrHZ7eC8c1iQ/oSwKZCJXic6qel+KlyVEjhDWM9QKT6e0jzagdCdHhkH12YOi4AW
         7AIIZPJ3j/9tooQ5U1USCB/9NujsPP7woGudynUiPjJzwjSfVWx0NZjIg9lVvvm0ejY0
         zcYcQVD1UuYUN6UxnXnBwcimOifGrR0/ASwuj1Q0Nb3EcJe33qOEOXgDdScme0b/tHX4
         iwMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753909721; x=1754514521;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sbLpP0PVmz8a3yJaLvyEK6s6J7/VD8dv5XMCRJ2MeaY=;
        b=Cw9iPJyMnfMW51a9RyCNMj7nquJbjHrjM4bYEVBSz3Cmpeu6p//qH35WscIRKhhp80
         g74wqG1KAPvo2S+Z0t6FTX2qxKIr7Xqtgo38xpuneUyJQFMlLLB4knS3qr8n4ToXDEg5
         eVa5xeXHBiENHwvrcx9ZD0aGV28l36W5iL9ofqqSDjcEmodVhvGeB4eJxHSgtTcEFu9u
         DO4Rz2RHPFXUe/UYVvab3R4goec89TagYfevsvRyJ8b1bqyEEBxeFsdhe2vOItqzAwLp
         1ILi64NRlCZs1LRJZ4lS6efU70TuyDllMkIqDoxY1uMzZ1DHDul7Muo3f50C+A0FzMdY
         SF+Q==
X-Gm-Message-State: AOJu0Yyzvz8Gyen0bLXYeqasNak048QyX+odWU2W6CGnqOqB7e6uH+SM
	5E1H0iLG2Y5yFiueMTxqP/UqQC+WA0DZCGc4ExJyhNxlnBejUeKX8sRGXDElvuHEvYa9Y4JDJxR
	sEJ51
X-Gm-Gg: ASbGncsdfXKZ7mKuSPGwvzOKlgVXd6iQtkc3fhZjlCYTxUiAlcBnFdLphjOZK9PSBNR
	dMXSu/PG9Zc6xmTS34voHtPVDxxR1r6JvFA3+h9bUd57Nb20i5pwixDxflKO7wyk2YNG3JEjERE
	Nb3Uuoxm5UkyDFHMywErckk2Y4TKN6EYDRwozEFwtCeazXX3v7sF3+ZO4QdCFsPadDz0TSyKDVN
	NGocgzxXJHEjkQtEkjf7NIl5+1wYv6U5/GULC5jVTqadvqNBg43M42gIZVhHQk3AEP82bS+yoBm
	aPbbGmNqJEJkALo9kDgmXAf5VztQWEvYKS8tqVGwnkVlzBqiwXCAxAHfVI0LpquZR0ktYssFdRA
	AufClK4xVjJJKLnYpZv0sUeU=
X-Google-Smtp-Source: AGHT+IEcp0TAEiQDBdoJsf//4GT2GY97Faxm8/L+cQVAb2RnXwBPEqX9XDj7Ub37WHI1FrlI2w4OKA==
X-Received: by 2002:a05:6a20:729a:b0:21f:ed74:7068 with SMTP id adf61e73a8af0-23dc0e13068mr7237836637.23.1753909721022;
        Wed, 30 Jul 2025 14:08:41 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:58fd:da9:30d5:829a])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-769ee9ef1casm4929456b3a.3.2025.07.30.14.08.40
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Jul 2025 14:08:40 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][walnascar 6/8] git: upgrade 2.49.0 -> 2.49.1
Date: Wed, 30 Jul 2025 14:08:25 -0700
Message-ID: <e46903948f991eeec49567b585c7c31f3ece742a.1753909581.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1753909581.git.steve@sakoman.com>
References: <cover.1753909581.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 30 Jul 2025 21:08:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221156

From: Praveen Kumar <praveen.kumar@windriver.com>

Git v2.49.1 Release Notes
=========================
This release merges up the fixes that appear in v2.43.7, v2.44.4,
v2.45.4, v2.46.4, v2.47.3, and v2.48.2 to address the following CVEs:
CVE-2025-27613, CVE-2025-27614, CVE-2025-46334, CVE-2025-46835,
CVE-2025-48384, CVE-2025-48385, and CVE-2025-48386. See the release
notes for v2.43.7 for details.

It also contains some updates to various CI bits to work around and/or
to adjust to the deprecation of use of Ubuntu 20.04 GitHub Actions CI,
updates to to Fedora base image.

Signed-off-by: Praveen Kumar <praveen.kumar@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/git/{git_2.49.0.bb => git_2.49.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/git/{git_2.49.0.bb => git_2.49.1.bb} (98%)

diff --git a/meta/recipes-devtools/git/git_2.49.0.bb b/meta/recipes-devtools/git/git_2.49.1.bb
similarity index 98%
rename from meta/recipes-devtools/git/git_2.49.0.bb
rename to meta/recipes-devtools/git/git_2.49.1.bb
index 3538170d08..2b310ded7a 100644
--- a/meta/recipes-devtools/git/git_2.49.0.bb
+++ b/meta/recipes-devtools/git/git_2.49.1.bb
@@ -170,4 +170,4 @@ EXTRA_OECONF += "ac_cv_snprintf_returns_bogus=no \
                  "
 EXTRA_OEMAKE += "NO_GETTEXT=1"
 
-SRC_URI[tarball.sha256sum] = "f8047f572f665bebeb637fd5f14678f31b3ca5d2ff9a18f20bd925bd48f75d3c"
+SRC_URI[tarball.sha256sum] = "84a8383ffc77146133bc128a544450cf8ce5166cbea5056c98033d2f0c454794"
-- 
2.43.0


