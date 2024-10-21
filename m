Return-Path: <badganchipv@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A8D1D0E6D4
	for <webhook@archiver.kernel.org>; Mon, 21 Oct 2024 09:10:47 +0000 (UTC)
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
 by mx.groups.io with SMTP id smtpd.web11.41868.1729501837150751878
 for <openembedded-core@lists.openembedded.org>;
 Mon, 21 Oct 2024 02:10:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ePCh0e2z;
 spf=pass (domain: gmail.com, ip: 209.85.214.179, mailfrom: badganchipv@gmail.com)
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-20cb47387ceso36372445ad.1
        for <openembedded-core@lists.openembedded.org>; Mon, 21 Oct 2024 02:10:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729501836; x=1730106636; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=b6qY2aa8CMrtJcNNC6gkVSPRf2hmZLSi2nS+neAGT68=;
        b=ePCh0e2zEGgyIViQAJh6oy312t790e5s5EgzOAix+v4pSaDU5O6QVy1SND7Q4Qq4Oo
         pYOTHMWuUIWh7yKt0g5whc/XMNqct/qYnez4Dh4eAqrWL7Hj4IiDfOjCWCULSXdlds1J
         sPypV79BtPzA5cTnNbBTmgd0+Aonam6idhD2QXTed7jtz/tUElIIYhlyKTzFEWRUPEqR
         OXVPdeWrdbvEY79TW8rhymqrHr7w/tGQfZd7MLktze2zAK98F9WBSaTj8566Kfkl2ILL
         Kkch+ponUFlCAKiIb7GDz0g1m8uMwtOjotfWyRYG0U9MJwQ9HY7jBfzdCFNAXBf6KBAN
         pzMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729501836; x=1730106636;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=b6qY2aa8CMrtJcNNC6gkVSPRf2hmZLSi2nS+neAGT68=;
        b=Co8TaaLI/T90g/XIXMJ1yg6xWZ2Opj6ETzKkXQF5t+1kugbmggS8y0Pz7BRJkh6huf
         x0a3C867V8jsP3eq9G5ot2ZTuSm3Z68Gye3g9avLWrv7dmPPVPOj5w5wbCRIQlEWCvP0
         vrfxt6NrxnOwnktJNk7+89OOC3pwvqoZGmoyLJ6OJSLI2OXCOrBsp8puuujoV79uPX8X
         u8/x6diz4QNoMqvstxtba928v2rL0MN5eHkiB/cKRIWA/7PBVFXdul/uNzgf/U59CTGQ
         2/B/6ht4qNGJ/dM1oSmK08C7U5bfrBQTkmcPlT6gGUo6knhPKpGtyPPXnEBS+4wenP+T
         UjKg==
X-Gm-Message-State: AOJu0Yx5pRWk7j9ME3FZyxi6By3istRkcYSOXoWx95o73evxCduzGzh7
	g83QQy7APQnOG4w8KacL+E4fsgxXe//qFs5jrug4tQ6PEgBO5VYxDODuIw==
X-Google-Smtp-Source: AGHT+IHsAYIItgYSU1+MXG3KywLr9WTKcEHsfijYafBJ27FCrBxff+AFymJlTavkWWkppajYn3RfoQ==
X-Received: by 2002:a17:902:e74d:b0:20c:bb1c:d216 with SMTP id d9443c01a7336-20e5a773ebbmr165274845ad.21.1729501836175;
        Mon, 21 Oct 2024 02:10:36 -0700 (PDT)
Received: from LL-1378.kpit.com ([106.213.87.185])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20e7f0de4bdsm21453765ad.212.2024.10.21.02.10.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Oct 2024 02:10:35 -0700 (PDT)
From: Pawan Badganchi <badganchipv@gmail.com>
X-Google-Original-From: Pawan Badganchi <Pawan.Badganchi@kpit.com>
To: openembedded-core@lists.openembedded.org,
	badganchipv@gmail.com
Cc: Aditya Tayade <Aditya.Tayade@kpit.com>
Subject: [OE-core][master][PATCH] run-ptest: removed 'sed -u' option
Date: Mon, 21 Oct 2024 14:40:20 +0530
Message-Id: <20241021091020.114708-1-Pawan.Badganchi@kpit.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 21 Oct 2024 09:10:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206099

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


