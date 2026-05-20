Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94A28CD5BA4
	for <webhook@archiver.kernel.org>; Wed, 20 May 2026 08:21:01 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7371.1779265255935690172
 for <openembedded-core@lists.openembedded.org>;
 Wed, 20 May 2026 01:20:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=2Zs4ZwyO;
 spf=pass (domain: smile.fr, ip: 209.85.221.44, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-44a74032ff8so3224711f8f.1
        for <openembedded-core@lists.openembedded.org>; Wed, 20 May 2026 01:20:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1779265254; x=1779870054; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZMV29VW6b84CdmPUx1dcS4TbXLj1HRyAz8Fz3ImjDBc=;
        b=2Zs4ZwyOuo1EtvigfElmis2kzr7oopckzBEXODATUrcjl7X8gEpM/aTIlP3RFHramL
         aOGAvrdETlU5loSAW2nVzzt9jAsBzYTQUwiq9pzAXlNyBy2oFWElE5JJgfjaJG+etsOW
         /XIuzw3Y/H2EFPgmiwg48/qRX+8Y6mmaHYprM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779265254; x=1779870054;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ZMV29VW6b84CdmPUx1dcS4TbXLj1HRyAz8Fz3ImjDBc=;
        b=k56NdYHMivt7aUGZ5Pdn3peurj1WRJQrZOdIGE7S6nPmKdfXzz44Grz2CW26bQGO6w
         lvgr846NG+HPvrEvJ9dubB6DbHeZAuj1YysJc2Ceu19nWnyziHixsqEga8+VGtQqn4yo
         2sJN84yDyKNuQuOHLKR2l3hOYV4KUcPGoB4PSPCeWR1lz4naYPZ2i4eU51+qnpVp9OSH
         Ajv5oHVPzULRLNN5orVv+dSJlWNPksvLNApJEhLVRrbAWRu4+wMGd880AQhbXKUwJ7XA
         aI1nS6ae7RdtAlhKH3La168IkiJ6SrxBI6MnSHfbPWqRtLNXdE4vqLoZBW3yvtxlOc/7
         RGWg==
X-Gm-Message-State: AOJu0Yzl51864wLqF57EJ/G9s+anmEWtN0yXE7ymHcZtPs0zdk+OteuR
	sCM+4e86UP2lPZDW3fpAeRid4dwcgNvVw2/D1Q41jWcfaJTTV9+T1YDiA6Tdspl1mIAv7zi07qJ
	R2hE2
X-Gm-Gg: Acq92OGzDaJGs+fyVo+Cjlw+fpVb+hbz4Q727bkNsNq0IZNVjlHEh6q8wtSNKsgjYq1
	l02ajtbg/I2Koxe/QdC649iL6frcJkuPGTn7y7xGvhA6EKJdOcAzB+Jm1TwCDTM8A7QAXUch525
	Ud2E5/9QU1D/PhtTasrxB0gr7/Y8Y3vrdiDsgLOiN2FhlwJV4xD9TZyhvTfj+0R+Ked5xBevwbG
	VesrFoVb2V5f5WUUaBBHuco6Yu0hfFbUAgNDQ9q2OrpjIYTkJWYb6OKTGptBkm3y+3r5VSkoQYn
	2kYQ+2uOmVHFdJQ50ZAoRrD5M0+AcxG6LOronNfYbgjflCPmwS2GvPjHC88eNUzpF/NU+FvnYW6
	GAw3kij4wOOv/zoWA5xrLrMms29bfPm0B+LM/a61vIrJc2WyDlMdbGTZI+uDY+CbiicMQAVADN+
	m9bGsoSZkFHOBMBoj66IOSSipqn+IhwoKxUZPOokL3aEXWmP1hWmQ+vAD++reXNd9LgkdOprc1U
	Jq7QDv9iM+1cSFyZTv27/fYxaYFecf5NFKZGzg=
X-Received: by 2002:a05:6000:2289:b0:43d:7c1b:b8c7 with SMTP id ffacd0b85a97d-45e5c5bebe2mr37132062f8f.21.1779265254352;
        Wed, 20 May 2026 01:20:54 -0700 (PDT)
Received: from localhost.localdomain (2a02-8440-250c-63aa-0256-2b9f-d16e-d784.rev.sfr.net. [2a02:8440:250c:63aa:256:2b9f:d16e:d784])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45d9ec39ff1sm56350642f8f.10.2026.05.20.01.20.53
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2026 01:20:54 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose v2 01/28] README: Add wrynose subject-prefix to git-send-email suggestion
Date: Wed, 20 May 2026 10:20:02 +0200
Message-ID: <ad63b162322507fa2cf48523c9c73519e03ddacf.1779264709.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1779264709.git.yoann.congal@smile.fr>
References: <cover.1779264709.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 20 May 2026 08:21:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237400

From: Yoann Congal <yoann.congal@smile.fr>

That might help new users send correct first stable patches.

Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 README.OE-Core.md | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/README.OE-Core.md b/README.OE-Core.md
index 4804e436322..15b0fbec976 100644
--- a/README.OE-Core.md
+++ b/README.OE-Core.md
@@ -26,7 +26,7 @@ As a quick guide, patches should be sent to openembedded-core@lists.openembedded
 The git command to do that would be:
 
 ```
-git send-email -M -1 --to openembedded-core@lists.openembedded.org
+git send-email -M -1 --to openembedded-core@lists.openembedded.org --subject-prefix='wrynose][PATCH'
 ```
 
 Mailing list:

