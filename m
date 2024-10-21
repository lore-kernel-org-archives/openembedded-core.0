Return-Path: <badganchipv@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3067BD0E6D5
	for <webhook@archiver.kernel.org>; Mon, 21 Oct 2024 09:15:57 +0000 (UTC)
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
 by mx.groups.io with SMTP id smtpd.web11.41934.1729502152948610260
 for <openembedded-core@lists.openembedded.org>;
 Mon, 21 Oct 2024 02:15:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ZEMYi0wS;
 spf=pass (domain: gmail.com, ip: 209.85.210.181, mailfrom: badganchipv@gmail.com)
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-71ec1216156so919608b3a.2
        for <openembedded-core@lists.openembedded.org>; Mon, 21 Oct 2024 02:15:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729502152; x=1730106952; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=b6qY2aa8CMrtJcNNC6gkVSPRf2hmZLSi2nS+neAGT68=;
        b=ZEMYi0wSTZZeS3vKaDPbooGWrnyeeUO+ZLGbKTNf6+IeL4DtGIDXb8afInuO6Bt3b9
         e+0BCJlcD3F3WWKdFCJi6XCk1PLcaivkG9zvMilqhQf5/zPlQgBKVApZcifH05GIzM6g
         IavnqeDDc6zmLyDPtZF1Fg15UTRXZCti+M6hHZfUq5GedW4oN8wa9vPOpnh0QJ5mCEmK
         p7VZXF8cpJ8hEv7qcBLYbUO6BH8HruS37FWfKorsHUOnHPqlEuZiML6I4O7EiQwB4gXc
         BRo1aDnpK33PfYpvMcqZ4fyK6FQm33DR3rjM2rV0vQwVYXXzrTdnhN6FDyXKX4QEqKqB
         z8yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729502152; x=1730106952;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=b6qY2aa8CMrtJcNNC6gkVSPRf2hmZLSi2nS+neAGT68=;
        b=aeHuyLb0995934fmGM/ItuCdXAqE539yfKZcBqNEFQqVFnuiDS9hBbl7jcOpw07amL
         u6plKH3qVu5R/gu4Z0Tb3h7qZPzONbe+1DTf8HlQ5xUDqZU8WIUWaArL4F3IdzJfLV/e
         1fJ5kAtVcDYtvv5Z1S138wAj07FnAN+yt6r2tXOVW19/vSZ0E1S2NlWFpRH3Wch1T1r2
         oaWOLFdvf6Fi4gFw7OaYI566wvb+qDO9Rs2WInM/HoUGgnmsZSF4P3GcR2meD/t5Ch1h
         jA9KmmcHYmvYuVhvTNawmgB3FVihno7WOaIZvsbewMyz0xnqKzrYHjknbJG9mMULByE/
         Tpsg==
X-Gm-Message-State: AOJu0Yw6G8Ewi8cNU4cFs2W//+oQ7IO5V67thiowc7p2FMeJyeTh6R8O
	9WpNwXPvN1+eG6n1GCQ63iIL0ND0rCK+8tlTroO31KGzVj7mR2SxxZaOs31p
X-Google-Smtp-Source: AGHT+IElet7y8N2PRuVFP920+4NN4mAdrzJRKyVlJo7AIn811zgn8pndxKkUQpEoGMqo1ZhAb+h8WA==
X-Received: by 2002:a05:6a00:3e0f:b0:71e:4a1b:2204 with SMTP id d2e1a72fcca58-71ea331b398mr14121307b3a.25.1729502152135;
        Mon, 21 Oct 2024 02:15:52 -0700 (PDT)
Received: from LL-1378.kpit.com ([106.213.87.185])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7eaeabdb66esm2598209a12.82.2024.10.21.02.15.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Oct 2024 02:15:51 -0700 (PDT)
From: Pawan Badganchi <badganchipv@gmail.com>
X-Google-Original-From: Pawan Badganchi <Pawan.Badganchi@kpit.com>
To: openembedded-core@lists.openembedded.org,
	badganchipv@gmail.com
Cc: Aditya Tayade <Aditya.Tayade@kpit.com>
Subject: [OE-core][kirkstone][PATCH] run-ptest: removed 'sed -u' option
Date: Mon, 21 Oct 2024 14:45:35 +0530
Message-Id: <20241021091535.117383-1-Pawan.Badganchi@kpit.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 21 Oct 2024 09:15:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206101

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


