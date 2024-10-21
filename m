Return-Path: <badganchipv@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01181D0E6FB
	for <webhook@archiver.kernel.org>; Mon, 21 Oct 2024 11:50:48 +0000 (UTC)
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
 by mx.groups.io with SMTP id smtpd.web10.44428.1729511440330696471
 for <openembedded-core@lists.openembedded.org>;
 Mon, 21 Oct 2024 04:50:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=GOBxDIO4;
 spf=pass (domain: gmail.com, ip: 209.85.210.178, mailfrom: badganchipv@gmail.com)
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-71e70c32cd7so3537674b3a.1
        for <openembedded-core@lists.openembedded.org>; Mon, 21 Oct 2024 04:50:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729511440; x=1730116240; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=b6qY2aa8CMrtJcNNC6gkVSPRf2hmZLSi2nS+neAGT68=;
        b=GOBxDIO4YBgjjVdx5IVznRo3FZicefkJ+AW12OblhBsveFsXXAdMKBpaVeX7cgahGo
         oH5agm0pB/DQDmIYEzex2zK8VeBY3KIr8qm+gSXBNU9USm35zPIUTeuykb36TeDwzG+g
         E6fQdsfKJMKC7fvyG6VNCat8lhK4Vr61ObryyYexTIEAV2/zaGHLaCzSBgfdUN5BzmeX
         2NCZFJcKN7RA7EeCmzplByLa+8JrMIeFZDRgjnt8ztANWI6sBuNqHkHo7120hfh3dFbD
         yaGHZuIZ+pkeW1ZDQUTyMaqX/Yupdp03zRtAzUI34gWrb/i0PPJTx3CN+sf3gp6RpU/2
         gF8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729511440; x=1730116240;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=b6qY2aa8CMrtJcNNC6gkVSPRf2hmZLSi2nS+neAGT68=;
        b=U6uEWstLRYV2/5aCQu7CW5akhepfTUg/gXs8aG1FFDOZFV0s3h0cX3MLpaQoLNHLjr
         cPxCKduMnsU78DEiM/Zr8FhiEBvFVEjVlcbM+VPkwTSKbEJxCpdyUGulSkfInYnOw9O3
         tuX2j7Gddzj9aULAlzEhGemWThdQIjMRmI9nevcPRO8W+DYckGaW99eyzJolixA5Z6PP
         d415QMTsv9jJe0xWcw4lyknUeoGpxE60GfXANY5eXOExj3brMcX4Z+Ppla14019W+++l
         G0FetneklA29fp+aJlTBqyXH+8JWwUkr+S6ovh4Eyp2t7/AQU2hY7S5KItIiCyzASJVi
         LbKA==
X-Gm-Message-State: AOJu0YxvjMKxM8eGs2UTISP672i5pH4vku3ZOPIgOR4wL6n6pZyXEk5J
	2rj2+fYXwg+LUeOSMi4dycU6OU8sRe/qKPEp8o2qH0R3R2BAc1scYp2D+yA4
X-Google-Smtp-Source: AGHT+IFMtZ4UpM9mHMBxnuC+Io+tStgICgHBJUx7JLIB6zEYzzzBo2ra8aRu7Ini1TtCrNCz7WByLg==
X-Received: by 2002:a05:6a00:140c:b0:71e:5150:61d6 with SMTP id d2e1a72fcca58-71ea31d290amr16586000b3a.21.1729511439601;
        Mon, 21 Oct 2024 04:50:39 -0700 (PDT)
Received: from LL-1378.kpit.com ([106.213.83.158])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71ec13d7400sm2666870b3a.122.2024.10.21.04.50.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Oct 2024 04:50:39 -0700 (PDT)
From: Pawan Badganchi <badganchipv@gmail.com>
X-Google-Original-From: Pawan Badganchi <Pawan.Badganchi@kpit.com>
To: openembedded-core@lists.openembedded.org,
	badganchipv@gmail.com
Cc: Aditya Tayade <Aditya.Tayade@kpit.com>
Subject: [OE-core][master][PATCH v2] e2fsprogs: removed 'sed -u' option
Date: Mon, 21 Oct 2024 17:20:26 +0530
Message-Id: <20241021115026.159503-1-Pawan.Badganchi@kpit.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 21 Oct 2024 11:50:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206115

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


