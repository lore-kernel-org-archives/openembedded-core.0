Return-Path: <schonm@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8E16EC3ABD8
	for <webhook@archiver.kernel.org>; Sun, 18 May 2025 19:52:47 +0000 (UTC)
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com [209.85.128.176])
 by mx.groups.io with SMTP id smtpd.web11.36446.1747597956658685051
 for <openembedded-core@lists.openembedded.org>;
 Sun, 18 May 2025 12:52:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=AYPZIEvw;
 spf=pass (domain: gmail.com, ip: 209.85.128.176, mailfrom: schonm@gmail.com)
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-702628e34f2so32249487b3.0
        for <openembedded-core@lists.openembedded.org>; Sun, 18 May 2025 12:52:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747597955; x=1748202755; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=EcRLnqIj1+QTQpHTmS4YWqHuPj63MG4rlgfFxEhju6g=;
        b=AYPZIEvwZrbn9BtjKTjXdC1MNF66DsZZVnxF2wUJ0+rXVPnTYnfyCABBBQw7doiRpD
         S9e7AndlFpRIwrJiiHOF+8cQ++6EAPuQOgc2rl5YClL5WMkf3ZAXACOWfe6OKDBnV67i
         WDv5L0sghdXDa+yZcMhmtettCGIGNYGO4EupIAfVJN9Q4nYcEnWspm6e5qsl5nA0Yoxc
         C9JYhMrw5ikB5d2N7mk4Jzaz/Qffm0KHb8WPUo4jOhVlF+cb1MgTH+nye4WkvCCleKYZ
         g0KEDGKvDdRSI3MdbtZHFzSDojngqLaN8hfPHr2LM8gAD65SUWKRLIyKlZqblXfNK9gG
         opiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747597955; x=1748202755;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EcRLnqIj1+QTQpHTmS4YWqHuPj63MG4rlgfFxEhju6g=;
        b=a3kLlv7sqV7xlH2fa5H8Um1jVnhhfoiayzHBMwC7hw8hiIDzk+ipNC+3mun77yKxKq
         hI9Va4sBARCXYQ6NAimN77VN5Nzd3iQzL8p04URMIMtaGOzWJIJjzwhEpjN7ET9WBoZZ
         vt+59LLFPnjalLh6Er7Cahcbsa1bESycvltvr76t0tMmMJ6pCCpcxHyLy1rp2rkdAhfA
         JqalMgphdBwr3d5XKwF+F8AAiOR2bhIATbnxIc1mo9dpqiuYNs9edW2RhbEUkXrZPpD8
         F5+YaVjC/BKkWLm4HMhKiVyihlrRukqe1BfVVg5X8HkRBd3njNrAEi6fPkVRpVUVa7mO
         Mr3w==
X-Gm-Message-State: AOJu0Yyp2XTv63eg8bsrCMh3njyXMuY3bpGbQAXX7GF2CHrrTcqZky9g
	lZWnI7k3ZmbEUenaJuMnmdYzcS0Xs2EzQ3/t8IVZYWA4t7PiaA/+QnNKMEjUai8X
X-Gm-Gg: ASbGnctIFoLd5KObVn5IV3dGU70g/cq1llFBUoJgmTiqwC6L+CDC6b4fJ4ghggj1jLL
	f83YRlGnwPvBHRh+plpZ0zLPMGrOunslKnVveqc7F4uJnj1qPcnxorm6li9Wru4nFBTN39w8Cmv
	jA1WnwGGS+AAi9nMJAKrcH8+/gP+3lFO7hij+xQgOun88d6b9wtFbpvrI2AkHtrsBIohO+WlSVW
	UexfvFTg6Xa/FTYb2Y7aQ+Q0e0kfqJcMGqtyO+YAK7OixH2nJuLCxfwGzYSWtBwF2O1WicIp/2D
	DFiQRqVcGtEkSjv7QL25fmsC5CScWmnh46/PLTFSC24gMBBTTlP7uuHl
X-Google-Smtp-Source: AGHT+IEtKxnApqVCNfAZEKdPvu9Qi+JG1vz6nF4dzO4ovTUoDG38Fq10qTpC2CF2npfRt52QQVv1QQ==
X-Received: by 2002:a05:690c:9302:b0:703:b708:e15c with SMTP id 00721157ae682-70ca89f8d06mr113586787b3.13.1747597955097;
        Sun, 18 May 2025 12:52:35 -0700 (PDT)
Received: from localhost.localdomain ([71.215.9.36])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-70ca831c44asm14766187b3.35.2025.05.18.12.52.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 May 2025 12:52:34 -0700 (PDT)
From: Jason Schonberg <schonm@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Jason Schonberg <schonm@gmail.com>
Subject: [oe-core][walnascar][PATCH 1/2] perlcross: update 1.6 -> 1.6.2
Date: Sun, 18 May 2025 15:51:28 -0400
Message-ID: <20250518195129.448725-1-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 18 May 2025 19:52:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216782

This supports perl version 5.40.2.

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 .../perl-cross/{perlcross_1.6.bb => perlcross_1.6.2.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/perl-cross/{perlcross_1.6.bb => perlcross_1.6.2.bb} (92%)

diff --git a/meta/recipes-devtools/perl-cross/perlcross_1.6.bb b/meta/recipes-devtools/perl-cross/perlcross_1.6.2.bb
similarity index 92%
rename from meta/recipes-devtools/perl-cross/perlcross_1.6.bb
rename to meta/recipes-devtools/perl-cross/perlcross_1.6.2.bb
index 34d9236cab..42ba15a572 100644
--- a/meta/recipes-devtools/perl-cross/perlcross_1.6.bb
+++ b/meta/recipes-devtools/perl-cross/perlcross_1.6.2.bb
@@ -18,7 +18,7 @@ SRC_URI = "${GITHUB_BASE_URI}/download/${PV}/perl-cross-${PV}.tar.gz;name=perl-c
            "
 GITHUB_BASE_URI = "https://github.com/arsv/perl-cross/releases/"
 
-SRC_URI[perl-cross.sha256sum] = "5abf198ee50ce9e69eb68fede68c87f65241caa744e4203e97490fa59b45ed69"
+SRC_URI[perl-cross.sha256sum] = "131f7496152ee32067dbac2bc9b44b2f582fc778140e545701b3b2faee782f1d"
 
 S = "${WORKDIR}/perl-cross-${PV}"
 
-- 
2.43.0


