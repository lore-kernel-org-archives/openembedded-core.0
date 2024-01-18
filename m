Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F26DC47DAF
	for <webhook@archiver.kernel.org>; Thu, 18 Jan 2024 10:24:34 +0000 (UTC)
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
 by mx.groups.io with SMTP id smtpd.web11.8363.1705573467573709068
 for <openembedded-core@lists.openembedded.org>;
 Thu, 18 Jan 2024 02:24:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=chARninS;
 spf=pass (domain: gmail.com, ip: 209.85.218.51, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-a26ed1e05c7so1443297766b.2
        for <openembedded-core@lists.openembedded.org>; Thu, 18 Jan 2024 02:24:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1705573466; x=1706178266; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=qEq38OW03pYnGbFz3lRD2NE8HYDOuFnic8FcDqbqk1g=;
        b=chARninSXctpPxjtlkvjJLc37A/QDzj3RtZZzUzIbfZB0u3HjVmI0zCihx3pNwP3yp
         dr3aNfcXTE8aBjOxQOsS1hts3RiY/XVs5bQGPvRBG9C475J7Uz48/+DGquqIlzk+x8K8
         mP5rhQS0/vqBBLCXfT4ZRQU8Z2rLZPJMS04vdv5rCKW3lPXEFQBgB5TdtUOB+T/NCAGK
         OzgnamOlm5XzKPgS1rBfnWeoKg9oj+YqR1zoDOoKnIL10fecxFo2VX6M6HFJN/LIdZ2T
         bFGZnB1x0saPH0tq4n60xTeQfW+LUXD6y2fw1snp9jIGM5f3udKKxKWY9Js2nPbKvySi
         ZESQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705573466; x=1706178266;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qEq38OW03pYnGbFz3lRD2NE8HYDOuFnic8FcDqbqk1g=;
        b=c3zJn7DaGoBho0KJS5icKE0gDQeyWEY6Z4PDiK5fxNFv6L0M0i1m2VP1HliYWmuOHk
         spHmQQ+rNDEuDp27ahwaOwUQYGuedvd+zmk4gYRmji+cWu3Du7DKwMJJeci5XswwqnDR
         zNrjcQF7fffltV+1u7eIwXPsmBWVmmGJ1/LZ4hcrepsKq4CI+rMXCTWA6vQfEsZUAsw9
         kba2u60y8vF4Tn94s8ZvaMigl7kQrDtkwx75xJDaAKVvPRCkkkgr9adBRn5Io4M9yBo9
         8oc4b1/R1n/BMYNNLZynD5Q7haE571hJuq1i4Ago4SczONy2lS8Zsv1qelTnUPoghpuf
         s5Hw==
X-Gm-Message-State: AOJu0YywFSr+X85+8Q5e79WSaluinegI20rtDVyThVsKtU8Oqw9KD63R
	zfT0r8F/Zb5FRi8b6AP994XCAax7lGTuIocCJQ04rjgwBM/mnI6UVPw3uHYv
X-Google-Smtp-Source: AGHT+IGwxaoVCXUcVJrNpT/a4XP2guozH0KhSstrHI9MLSy0QEuiTKPq5MsUmKHlGVTWkpEBZft5ug==
X-Received: by 2002:a17:906:69c7:b0:a26:c9e6:d5e0 with SMTP id g7-20020a17090669c700b00a26c9e6d5e0mr245437ejs.74.1705573465909;
        Thu, 18 Jan 2024 02:24:25 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id hw10-20020a170907a0ca00b00a2ea4f1b0cesm2461003ejc.2.2024.01.18.02.24.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jan 2024 02:24:25 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 1/4] oeqa/runtime/rpm: raise exception if test rpm file cannot be found
Date: Thu, 18 Jan 2024 11:24:06 +0100
Message-Id: <20240118102409.2680941-1-alex@linutronix.de>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 18 Jan 2024 10:24:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193969

The tests rely on that, and so the discovery shouldn't simply
fall through.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/lib/oeqa/runtime/cases/rpm.py | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/runtime/cases/rpm.py b/meta/lib/oeqa/runtime/cases/rpm.py
index a4ba4e67698..bd9050a81b2 100644
--- a/meta/lib/oeqa/runtime/cases/rpm.py
+++ b/meta/lib/oeqa/runtime/cases/rpm.py
@@ -88,9 +88,12 @@ class RpmInstallRemoveTest(OERuntimeTestCase):
         # and it will always be built for standard targets
         rpm_doc = 'base-passwd-doc-*.%s.rpm' % pkgarch
         if not os.path.exists(rpmdir):
-            return
+            raise Exception("Rpm directory {} does not exist".format(cls.tc.td['DEPLOY_DIR']))
         for f in fnmatch.filter(os.listdir(rpmdir), rpm_doc):
             cls.test_file = os.path.join(rpmdir, f)
+            break
+        else:
+            raise Exception("Couldn't find the test rpm file {} in {}".format(rpm_doc, rpmdir))
         cls.dst = '/tmp/base-passwd-doc.rpm'
 
     @OETestDepends(['rpm.RpmBasicTest.test_rpm_query'])
-- 
2.39.2


