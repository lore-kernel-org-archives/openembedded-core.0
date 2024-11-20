Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B240AD63959
	for <webhook@archiver.kernel.org>; Wed, 20 Nov 2024 13:58:14 +0000 (UTC)
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
 by mx.groups.io with SMTP id smtpd.web11.13880.1732111087109612876
 for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Nov 2024 05:58:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=Qm0YkVuP;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.170, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-20e576dbc42so58932925ad.0
        for <openembedded-core@lists.openembedded.org>; Wed, 20 Nov 2024 05:58:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1732111086; x=1732715886; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bpnrF7DbjPXCVwT9oERqCmWHPHl9zb5oOn80hkJTT2E=;
        b=Qm0YkVuPX4krkdNy59lBfVBWE98VqWx2TFrm688fitYkC82amE2N0kM0S9nomNMHep
         d7lGBVZKLrpWoVAu/BbeNV/MP5ZJ4HOJEHgU+Mq3HVwfvfN8hlCcsDlZGWyU3RWH6q4I
         iodd3PIx6Ux6BearzK148tK1l+5RFfuoemGfVkjUJEDQoFvUdrmFvTXb4zTSdGon6LZD
         fcFn1EYqGAMACeQkFZezyZZOrGKytGnEoyYwoLtJ0KQlFlKf3bEkPedkhNLI4vz/hzfi
         KxeAz7KhIwMCDvUjB0vYcnWKwoMjZJIYJyXMrSdYM/x9oJTBSWqCfhAA2fwppIzeTIdC
         3L7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732111086; x=1732715886;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bpnrF7DbjPXCVwT9oERqCmWHPHl9zb5oOn80hkJTT2E=;
        b=VxXeesqtGoeLbdX4V6U2zWwJQnwa0xRiZo4qVxhPVUW2xkoh3bPJCBTZyevwRnJjZt
         gtdKsHUWoO84l5w/9O+G/UUo5TQ//yIh7s1zwIuTBmuAffPUri4LYW99EXpRnuFoVTpJ
         FWFvdDQV4s/WUIdlp8z9NHBC97LOe9D3BnNsvMYKYK1ItbiN9QjgzSrpCVNYdW+ywnfh
         P05jBbGGNPf+7gGAaXCrWy9cVbsgI9zIHrJ6qdmt+k6MHjBZ9GkoDi19NtIGFSJql3wI
         hBscGXNW5j1nZ7Rd3xtQEYKy2Cmi+nayOxJWf6NXOGaL0wYmJGLTmuxYaNctJ7ZWzGBj
         DsBw==
X-Gm-Message-State: AOJu0Yx8Cj4cmHPytSNnIumZ7ffPi6vj+itRfEToSFRzB0AG0GpUa9NJ
	tU98Yl/NHkf9oNP4Zor4AqaSTXwdHcjtTKw78PLa0268+ZuTlhYVqMdJi5uRUfAfYieP72qq6JO
	I
X-Google-Smtp-Source: AGHT+IGCBh9kTITfrSe8H9YQP94EUb4HRMirUc5M6snSKncWaG8ogWjoHHcMvM+157FsdTbLbYdudA==
X-Received: by 2002:a17:902:da8d:b0:212:b2b:6f10 with SMTP id d9443c01a7336-2126ae5b86bmr37876495ad.8.1732111086363;
        Wed, 20 Nov 2024 05:58:06 -0800 (PST)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2127a4db5b3sm4658175ad.233.2024.11.20.05.58.04
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Nov 2024 05:58:06 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][styhead 31/31] e2fsprogs: removed 'sed -u' option
Date: Wed, 20 Nov 2024 05:57:03 -0800
Message-Id: <7f1b390aa83b6c22f5996cf2c952cbf9a460399e.1732110892.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1732110892.git.steve@sakoman.com>
References: <cover.1732110892.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 20 Nov 2024 13:58:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207455

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
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 07caee1829d2a61bc018fe0e37ecd482922179ee)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
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
2.34.1


