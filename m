Return-Path: <badganchipv@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 018B7D0E6FB
	for <webhook@archiver.kernel.org>; Mon, 21 Oct 2024 11:52:48 +0000 (UTC)
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
 by mx.groups.io with SMTP id smtpd.web10.44455.1729511563690552655
 for <openembedded-core@lists.openembedded.org>;
 Mon, 21 Oct 2024 04:52:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=h106t6ok;
 spf=pass (domain: gmail.com, ip: 209.85.214.176, mailfrom: badganchipv@gmail.com)
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-20cdbe608b3so35217185ad.1
        for <openembedded-core@lists.openembedded.org>; Mon, 21 Oct 2024 04:52:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729511563; x=1730116363; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=b6qY2aa8CMrtJcNNC6gkVSPRf2hmZLSi2nS+neAGT68=;
        b=h106t6okRwrhi258P4LS5Y/Yuy9wwyUXvUvGKrrgAcebRxGFV6ZANGty5U1FqRnR85
         NcLnZpXZPGc8rnLcviqZHQ2axCDtIbihKIbW6XAg3z6Sp1/kSjMb8LBKQ/E7Fjd7TLVl
         8FwmbwpvHUyknYj0Q/k48FhL8PxRbDhJ0v/EPENs1ase9r5xHOEfKA95O8dh2x9Ibo3L
         zRAEk6IheVbblrJzWzMYjmGwSjnGyTRHruJpa0jUZBTkeX+2gH72A+m45AP6mn7yNuQi
         LHtIx0sfhqhVglbSSaozYK7TcReIY4BteYvln/qj6Bx5GzzA27ewVHQ8cH47UQmkRDY/
         MK3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729511563; x=1730116363;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=b6qY2aa8CMrtJcNNC6gkVSPRf2hmZLSi2nS+neAGT68=;
        b=wbC+No1yw6p3IXOGSFayBFnKjNxKRZYPJpUUpnDQ313Wag9ugi4/1Uuc9NTAjyrQBa
         HZ6PTPbcen9mYDxzb0mXuAWtDj1sJc2t9B0Ykg3l53BlEsG8eZz6Ad8uIxtSi0G2q7Be
         3TZW77RyAveQheA6FkXxe+h3WAtp05l/J96thMKX16TtzeZpz/pjpsQmoJfHKYxbU87g
         IbAXjcGUP0IkGhvjSesOzEuIH1QQmmdIw5ul2RkZZnjFdW46ieiv8r/kO0zlx/WJnJTa
         7275BdxUbkFQcszcWNCg9dsC6DSMxMmK1lhnMt9OzlgkDAFJ6ErETdyPgXcl/AgIxwid
         YeHQ==
X-Gm-Message-State: AOJu0YyxsByQVY2IYg6VfqOIIw5g8vvuZmeyiuUjfdfurfCR2ZNdHM0X
	mX9E51+KmyeUKqsBL8jZV5AbPZTTanutyDBPrIaB3fWb8bQdt2gUcXp4Fr1g
X-Google-Smtp-Source: AGHT+IHSR4UGidkUXZYoyn24NqhTeqA2i6zLDL6Oi065RinDwDgXxtM69rA04ekAzp10ifjImpzmSA==
X-Received: by 2002:a17:902:e807:b0:206:8acc:8871 with SMTP id d9443c01a7336-20e5a8bdd7fmr149085235ad.31.1729511562839;
        Mon, 21 Oct 2024 04:52:42 -0700 (PDT)
Received: from LL-1378.kpit.com ([106.213.83.158])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20e7f0f6d10sm24178585ad.279.2024.10.21.04.52.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Oct 2024 04:52:42 -0700 (PDT)
From: Pawan Badganchi <badganchipv@gmail.com>
X-Google-Original-From: Pawan Badganchi <Pawan.Badganchi@kpit.com>
To: openembedded-core@lists.openembedded.org,
	badganchipv@gmail.com
Cc: Aditya Tayade <Aditya.Tayade@kpit.com>
Subject: [OE-core][scarthgap][PATCH v2] e2fsprogs: removed 'sed -u' option
Date: Mon, 21 Oct 2024 17:22:32 +0530
Message-Id: <20241021115232.159821-1-Pawan.Badganchi@kpit.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 21 Oct 2024 11:52:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206116

From: Aditya Tayade <Aditya.Tayade@kpit.com>

In embedded box, sed might be provided another providers like Busybox,
hence use generic options whenever possible.
/bin/sed -> /etc/alternatives/sed
/etc/alternatives/sed -> /bin/busybox.nosuid

Here used 'sed -u' option is not necessary, hence removed it.

Fixes below error:
sed: invalid option -- 'u'

Also added 'set -eux' option which halts execution of the script
on any failures.

Signed-off-by: Aditya Tayade <Aditya.Tayade@kpit.com>
Signed-off-by: Pawan Badganchi <Pawan.Badganchi@kpit.com>
---
 meta/recipes-devtools/e2fsprogs/e2fsprogs/run-ptest | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/e2fsprogs/e2fsprogs/run-ptest b/meta/recipes-devtools/e2fsprogs/e2fsprogs/run-ptest
index 279923db8e..1857a17189 100644
--- a/meta/recipes-devtools/e2fsprogs/e2fsprogs/run-ptest
+++ b/meta/recipes-devtools/e2fsprogs/e2fsprogs/run-ptest
@@ -1,7 +1,8 @@
 #!/bin/sh
 
+set -eux
 cd ./test
-SKIP_SLOW_TESTS=yes ./test_script | sed -u -e '/:[[:space:]]ok/s/^/PASS: /' -e '/:[[:space:]]failed/s/^/FAIL: /' -e '/:[[:space:]]skipped/s/^/SKIP: /'
+SKIP_SLOW_TESTS=yes ./test_script | sed -e '/:[[:space:]]ok/s/^/PASS: /' -e '/:[[:space:]]failed/s/^/FAIL: /' -e '/:[[:space:]]skipped/s/^/SKIP: /'
 rm -rf /var/volatile/tmp/*e2fsprogs*
 rm -f tmp-*
 rm -f *.tmp
-- 
2.25.1


