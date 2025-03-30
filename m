Return-Path: <schonm@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE01CC28B20
	for <webhook@archiver.kernel.org>; Sun, 30 Mar 2025 19:41:45 +0000 (UTC)
Received: from mail-yb1-f180.google.com (mail-yb1-f180.google.com [209.85.219.180])
 by mx.groups.io with SMTP id smtpd.web11.36527.1743363699611118512
 for <openembedded-core@lists.openembedded.org>;
 Sun, 30 Mar 2025 12:41:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Sn8xFeuX;
 spf=pass (domain: gmail.com, ip: 209.85.219.180, mailfrom: schonm@gmail.com)
Received: by mail-yb1-f180.google.com with SMTP id 3f1490d57ef6-e461015fbd4so3027192276.2
        for <openembedded-core@lists.openembedded.org>; Sun, 30 Mar 2025 12:41:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743363698; x=1743968498; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=kns4bwXne1itOm6W2vRlG9VUR9MCI5cVbhJm1OgJawE=;
        b=Sn8xFeuXQHm2yzN9kRry3somiRiNq8k9Yal/Q/cOJAB3DMFxBwyxekba3UE2wjE2cK
         c45OHHrQdUJC9hThaN9O4R22FmV13WM/tUgr1eblXTPxrDTSWQkzT6BzYqMngDchpdO9
         aRR8senF+MLnxlFHl99wEeC1USBW2fOG9laGWIf9ykPNSse0qbemQh5WEZzzjRyGFQLt
         7IVtnNBK5FZahcmwLvl3co44aUkoPNGUA8GbsxEUlxEHPtHda3N080axsocoQJfvy5MU
         wGREfTBAJbnHXV3DQy3Dm+s3oRdLiqPhNtkcLQBQnFIONbz82bRkLgKU4o/GAi0LFOjY
         nAPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743363698; x=1743968498;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kns4bwXne1itOm6W2vRlG9VUR9MCI5cVbhJm1OgJawE=;
        b=bm15gX6a7jcK8TCQEluuHMH76wBT1uSj4xTC4vm5y9AvxNLd7AG2g+jBTXJVVHdGYF
         mSpIHbSbCjYBR97eJ078Mf4+YBqOb5MgDOe4iabWzShxrvLhsKFcCchNHnoEQWcv3cJ5
         h7eFtGwgFehfLRlpqvFmwio11roe+eIRezResTWnrE9ztEoIDfVbRIk4g1NJgWnKPdkC
         8UXqQg14jSesZSSO+f2hsTAdW2QoMzsOruxMcuJTD9/sRJs5DojHXy5ZjrMuNv0qpRGc
         qud4/R1c3zhseCCWfvYyehFAjnWXIJFlqboVo7Em6+Ikxz5TA+kBIic9+M8kfzHXKant
         w0aw==
X-Gm-Message-State: AOJu0YxrQfgAmiSv2nFdq9Z3bx6pI13353Q861DK8MuI3sBDTs09o6J6
	+0W/Ib2r4OQMyYNmaTvbElLOch4djt9P3HWGK7lpjo1enyYWhGYXjqs0foya
X-Gm-Gg: ASbGncuuJefXNFu56tLYoMJFlD+5VinpxkXMTPkbujDMp7B4GWfuZmHdQicWfW2Wl9e
	dVUJpeN2G5RPDrTyRQkK/RFvA18JwzCEjtl5umM5lEJqukUynDcIyQPsbikL5rMpE3XFI+Vaxt2
	cTZe9SWdne6neVAJXX2Peh4B34xJ5j7RGfKKYiHRNd72iRjjZhkeWdKMKB/ZwSjrobYuiQvobHu
	Lyj0IUBhU4VzJY452ncrGCfsM+DZ8+vzp2qvV7pqvPR8fFCITUp4eHX5KSuMd1QhpvstM0qMKA2
	Wrx7VxmGymOVR2N3yUN7GqGBE286SijYYU9FfUlowoqirXG0wQ==
X-Google-Smtp-Source: AGHT+IFOn2c0RJF1KjbovFq9bBPkDZyfFcGwDBQygagCM3Cp2FXTomkxERZUKaub3uBZCxOOkRNzpQ==
X-Received: by 2002:a05:690c:f89:b0:702:541d:35ca with SMTP id 00721157ae682-70257309920mr92824657b3.24.1743363698139;
        Sun, 30 Mar 2025 12:41:38 -0700 (PDT)
Received: from localhost.localdomain ([71.215.9.36])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-702557ec41bsm10639527b3.124.2025.03.30.12.41.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Mar 2025 12:41:37 -0700 (PDT)
From: Jason Schonberg <schonm@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Jason Schonberg <schonm@gmail.com>
Subject: [PATCH 1/2] perlcoss: upgrade 1.6 -> 1.6.1
Date: Sun, 30 Mar 2025 15:41:22 -0400
Message-ID: <20250330194123.1301304-1-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 30 Mar 2025 19:41:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213922

https://github.com/arsv/perl-cross/releases/tag/1.6.1

This provides support for Perl 5.40.1

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 .../perl-cross/{perlcross_1.6.bb => perlcross_1.6.1.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/perl-cross/{perlcross_1.6.bb => perlcross_1.6.1.bb} (92%)

diff --git a/meta/recipes-devtools/perl-cross/perlcross_1.6.bb b/meta/recipes-devtools/perl-cross/perlcross_1.6.1.bb
similarity index 92%
rename from meta/recipes-devtools/perl-cross/perlcross_1.6.bb
rename to meta/recipes-devtools/perl-cross/perlcross_1.6.1.bb
index 34d9236cab..21964a7336 100644
--- a/meta/recipes-devtools/perl-cross/perlcross_1.6.bb
+++ b/meta/recipes-devtools/perl-cross/perlcross_1.6.1.bb
@@ -18,7 +18,7 @@ SRC_URI = "${GITHUB_BASE_URI}/download/${PV}/perl-cross-${PV}.tar.gz;name=perl-c
            "
 GITHUB_BASE_URI = "https://github.com/arsv/perl-cross/releases/"
 
-SRC_URI[perl-cross.sha256sum] = "5abf198ee50ce9e69eb68fede68c87f65241caa744e4203e97490fa59b45ed69"
+SRC_URI[perl-cross.sha256sum] = "b5f4b4457bbd7be37adac8ee423beedbcdba8963a85f79770f5e701dabc5550f"
 
 S = "${WORKDIR}/perl-cross-${PV}"
 
-- 
2.43.0


