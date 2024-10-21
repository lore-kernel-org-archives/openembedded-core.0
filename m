Return-Path: <badganchipv@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC03BD0E6F4
	for <webhook@archiver.kernel.org>; Mon, 21 Oct 2024 11:48:17 +0000 (UTC)
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
 by mx.groups.io with SMTP id smtpd.web11.43868.1729511297042721213
 for <openembedded-core@lists.openembedded.org>;
 Mon, 21 Oct 2024 04:48:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ZdNsXMkJ;
 spf=pass (domain: gmail.com, ip: 209.85.210.178, mailfrom: badganchipv@gmail.com)
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-71e70c32cd7so3535869b3a.1
        for <openembedded-core@lists.openembedded.org>; Mon, 21 Oct 2024 04:48:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729511296; x=1730116096; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=b6qY2aa8CMrtJcNNC6gkVSPRf2hmZLSi2nS+neAGT68=;
        b=ZdNsXMkJtT/N5ulSYo750F+lfhjzStUfmNw4R5TVS5bgzn7mlglrMUqrdZ328rNHO4
         jAMpN5KMvl16NOFC2mUHy29svZkxY4TaeGuA9jQ1MB/drTWvXqwvwJDnaKJ65fflpE+C
         3NWCnI4wbRN61s/zggVxJ3uL1h1ZKv9sej1Ti8HvT/nX2UwKcDminlix4Nv2u43GJ7Tr
         lDoVQw3/i8GoDsjUzC6QFkja6DO1zrOFbmEaTOZkwokhlPf951JyzDPgBPX/wspXnf3o
         y3U2+Xz40fnAyRVl9CguKA6gkyChjNRy9CJsQnMzhdqRQJDVRH7m2GcqX38ihKPQuD/n
         XPCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729511296; x=1730116096;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=b6qY2aa8CMrtJcNNC6gkVSPRf2hmZLSi2nS+neAGT68=;
        b=hoNWU8rxmpwUEnnDac43C4/iRCaDok66DrYVuk4QaVaU0d3BsPRVzr2KiEAzKPHUCC
         FKVIBgslnYMSyv1lh31rlP3gFhpDABnDAu1yCJEm8941CM4++qXOEILx/wFRO4EBDxYx
         bbylqVe/QDqlpl6E6vFZbF8SFdgRWovW2t/JxBG3nX/fmN5eLgwHOVmMQR7LzBTSvrwL
         aY8YXy6RVw0k8d3KXQ/db4yr4UKI2BenzwMX2VXrEYqXOzCuePPTe2VD3jLU7JkKaW+x
         eD509pvW2dCbXj7mO3HCgHhd8U3Pq6af9Kg8e0srSBKgnlBqkEShluDvhHTXD1onjnr9
         a7kQ==
X-Gm-Message-State: AOJu0YzPne3jMxDEzZoKvWCp3zfxP2OAhEDK2kaA2wUftY6SJaBYfcHc
	2eP+3wDQUXkiz+PYS7N4N1EaMgTCyNJkISBXPb9J5/3c9hr3ET105zH8pw==
X-Google-Smtp-Source: AGHT+IHRlkIxm9bDSfSmQb7skq09gkLe2w1Q6mr5xHtZF4O7Z/FkeLuO3Ae5tF/E1Kzz/9WhAP3VYA==
X-Received: by 2002:a05:6a21:114f:b0:1d6:5f3d:4ab7 with SMTP id adf61e73a8af0-1d92c503c07mr16480131637.22.1729511296175;
        Mon, 21 Oct 2024 04:48:16 -0700 (PDT)
Received: from LL-1378.kpit.com ([106.213.83.158])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e55d8da2b7sm4454859a91.1.2024.10.21.04.48.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Oct 2024 04:48:15 -0700 (PDT)
From: Pawan Badganchi <badganchipv@gmail.com>
X-Google-Original-From: Pawan Badganchi <Pawan.Badganchi@kpit.com>
To: openembedded-core@lists.openembedded.org,
	badganchipv@gmail.com
Cc: Aditya Tayade <Aditya.Tayade@kpit.com>
Subject: [OE-core][dunfell][PATCH v2] e2fsprogs: removed 'sed -u' option
Date: Mon, 21 Oct 2024 17:17:57 +0530
Message-Id: <20241021114757.158946-1-Pawan.Badganchi@kpit.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 21 Oct 2024 11:48:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206114

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


