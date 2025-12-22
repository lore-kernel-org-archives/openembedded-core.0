Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D714E69196
	for <webhook@archiver.kernel.org>; Mon, 22 Dec 2025 20:08:26 +0000 (UTC)
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.87801.1766434101294253554
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Dec 2025 12:08:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Uv8BpmI5;
 spf=pass (domain: gmail.com, ip: 209.85.208.53, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-640e9f5951aso8112113a12.1
        for <openembedded-core@lists.openembedded.org>; Mon, 22 Dec 2025 12:08:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766434100; x=1767038900; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zf3u13KjnUBP+tel5zp0nXrhoWcV+YPb7MjamTbOfFw=;
        b=Uv8BpmI5CLV5IotDaln84zzOMTVZ1QL+z8g45oOtVqHyNsVjeY+cu++E8GhM0mNgnq
         mEQhX85zHaiIHJBlzmoT0jJOGZ+lodorf25kyAU+2SNlGGTxMl/IxLHD9F4nSG6AfqUB
         cdnPsHPLrnes91g73eymeUUBwwoEK2BP2z0l2zXaztEGcDSDrNTgLIdKCk34p1J3SLOV
         LwatsTLbbmmP2q2ugk6TbknYKlIabHzLvQhFw9RaXVyT15ss7UvRJ6AhoaRoTIs4e2qD
         N4dasEfHb6IfMC6LANCqsq36Ith1RGbxcONjBK9JBI617U+ZIelTO6x/Plxa8ZZzcprZ
         zRaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766434100; x=1767038900;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=zf3u13KjnUBP+tel5zp0nXrhoWcV+YPb7MjamTbOfFw=;
        b=U5MEYEm2hQPcWlRigXABmB9mEB3w6dK0PIieFbvZwDeFpNM1t1oJ3eFs4kNkSn/3pk
         dPsH2Zb2gAA5/CqKgY9QEU2/spVkcda8JSSFwnpVh+LvwcjMzEiZslpVRRx0Gne0JlsV
         dYga9bS8g6D7+1/3/1ZKEhD3g9qbYbfqPSkv8quMV5MWJ44QgeB444QRcbzvoxMiS5/J
         PuwU0Aof5YVl3j3YZbeA+P0SVfkHSDgvyVajc8Wkr7b8TR2BL9WsuvxOHhy7vBRc1hKs
         RLbej+k4YenZWUOL2ucDluR5Q0L7oY9yG8SkZttxFWejrgx9Z95/Zga7hnGhIbZRh0ZS
         SKeA==
X-Gm-Message-State: AOJu0YwbV/lzUHGLA3iBVwTOKY10lzdm93mLlK4KQvVsy3TSmPTcRJsx
	EYrfqDrRalM/24LQaUe5JzrJb0m6jHwUVpA5NUumWzxVGlnJCVHJZ6aSXe18aQ==
X-Gm-Gg: AY/fxX4sBrm5W480tlwHxn7lW19ezs05TijC/cnGxx+j1a34egJh5nWy8g2Zkv5Os5D
	Sje8fu9PV07ozJAZHV60ddlEfWCKPPujKiHNF9NgdWPx/C0O8Ken0DzDrcO0u9ijNle2jnZx5FH
	4091iF09AeM6rJUqy0fy8wkuwpAxmgHn56jBZuUakYa3odpm9/Exlbg+fuIB6AUSaBoGCxk/cWX
	QYOp6i+xsmj5WgwBY4I9r87ZmUOEZMHLzUIAeqQSS6VMOKcV66rFm67KZ53p9O14paPWTUY6BCc
	C0uJgwlqV3Jv/TlalhTa4mYl7SckZTv4PPJqFbXiyJMEHoRqYtK8kozifOHjFFyc0IdHXO9Ryhm
	RPuOrfKyk9RZhT7KQEEovOVKmcOBDkgEbEk+ueohBNk4XAOUbkA0Kc3M9PdW9rGmcSwTlJdXCQJ
	id7IYs9BHUog9kKSen6V4tH9MGh2eNORIgzYb+fUa8jBz1BXM=
X-Google-Smtp-Source: AGHT+IGUM6CINeI4blvCZv+c+hYUvbk9CQ5wJ+iIexO2LnqfxSFSeFSTBlACr0gMMZgGnMMLZ8MIMA==
X-Received: by 2002:a17:907:7e9f:b0:b80:16:850b with SMTP id a640c23a62f3a-b803542da8cmr1654931666b.0.1766434099491;
        Mon, 22 Dec 2025 12:08:19 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8037f3e271sm1182344066b.60.2025.12.22.12.08.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Dec 2025 12:08:19 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 048/114] puzzles: upgrade to latest revision
Date: Mon, 22 Dec 2025 21:06:30 +0100
Message-ID: <20251222200739.2278706-48-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251222200739.2278706-1-alex.kanavin@gmail.com>
References: <20251222200739.2278706-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 22 Dec 2025 20:08:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228373

From: Alexander Kanavin <alex@linutronix.de>

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/recipes-sato/puzzles/puzzles_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-sato/puzzles/puzzles_git.bb b/meta/recipes-sato/puzzles/puzzles_git.bb
index 91b5740df3..9745c26502 100644
--- a/meta/recipes-sato/puzzles/puzzles_git.bb
+++ b/meta/recipes-sato/puzzles/puzzles_git.bb
@@ -10,7 +10,7 @@ REQUIRED_DISTRO_FEATURES = "x11"
 SRC_URI = "git://git.tartarus.org/simon/puzzles.git;branch=main;protocol=https"
 
 UPSTREAM_CHECK_COMMITS = "1"
-SRCREV = "a7c7826bce5cbb9b9c337c11b9b7f8b278e76fba"
+SRCREV = "ecb576fb2a0a47df6486919c1ebb945f7f252234"
 PE = "2"
 PV = "0.0+git"
 
-- 
2.47.3


