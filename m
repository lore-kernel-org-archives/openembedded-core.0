Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B6B9C47077
	for <webhook@archiver.kernel.org>; Tue,  2 Jan 2024 14:50:18 +0000 (UTC)
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
 by mx.groups.io with SMTP id smtpd.web10.30325.1704207013270489408
 for <openembedded-core@lists.openembedded.org>;
 Tue, 02 Jan 2024 06:50:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=VQWoaeRU;
 spf=pass (domain: gmail.com, ip: 209.85.218.53, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-a27cc46d40bso227415066b.0
        for <openembedded-core@lists.openembedded.org>; Tue, 02 Jan 2024 06:50:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704207012; x=1704811812; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ugYYHkZCWjwB2cbJL+8SLfgUKFpnaO+8oayhcJQ4A0M=;
        b=VQWoaeRU7qNRwf4LdweXB2GyfeKiGn8ZW3IY/0d1ND1Gtb3Tb2iYPWuWSsIzbX+AM7
         nCLWlhOUmNrg1CNeMol8kz7//IYb1Qq/LBSwQcOBB9mKSMGc4rEdHcKjMdqIdUx5XvEb
         S1y8Cbbo28yuhGko4pfOqXrKcU+D1OsZCJ5GeHY4KysOs8UnJBMpJYEkOF/Wkt0HFJGH
         jnI1Y48IWQYQIybLnwuzM57Pv0BZ9251woYtbso4jltBNNcT0gRt0wViMp1Lys3cYt1Y
         jAgrXhI1fvYBTW/clqwN0E0wb9bWCAMbNzJWkFvwxns7kFAyyw2UBLxStUHeEX37ETwF
         2Uvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704207012; x=1704811812;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ugYYHkZCWjwB2cbJL+8SLfgUKFpnaO+8oayhcJQ4A0M=;
        b=k9btxhuuxUzA09rRGl8Ci+Ff+w5tVx6plr6gluBcTUZhd51JFTwGjRzS+HE97BWYJ6
         BWEOeas21oEMPaDrvDuEbEPkPxVvu3y+AZOed/G+0zRrJmBNX461rBX4B0DZs/DFjMkT
         2JmLIDrCwrOB7d2OEBHou3U8qW0KpG3FF8j92sLmyZ/baAQtkqrTUrjYYJIq9AdK5fmo
         fg1WLgZ5z7r6v+/xewBGZY6u5EiZXNygvf5jk1uwWG5VbysV0iVVik3LozEz8LGLRu3O
         jvKlq9zG6a7kMoAopo1mAt1djT0+N0UAd4/Hc2J+lUUDdmScwsmdevRMotEt9eI8PzLP
         7xYA==
X-Gm-Message-State: AOJu0Yz60ww3ehWX71Q/FzPm6I0GwOxrz8imyN8NEuI4AQHfAe7hrwES
	D4pRCsndiLk2Bt51mzw6rA4bhFRxDoA=
X-Google-Smtp-Source: AGHT+IEUaJ4esX8LMTpGAq8A/rf4dS28chjUsJhCR86OXmgvP+sNx9SJ2mzLA5/GBm2guvem46Wh2A==
X-Received: by 2002:a17:906:1747:b0:a25:491a:31ae with SMTP id d7-20020a170906174700b00a25491a31aemr5183967eje.8.1704207011479;
        Tue, 02 Jan 2024 06:50:11 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id r13-20020a170906704d00b00a27af2cf7c3sm3590395ejj.175.2024.01.02.06.50.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jan 2024 06:50:11 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH] lib/sstatesig/find_siginfo: raise an error instead of returning None when obtaining mtime
Date: Tue,  2 Jan 2024 15:50:00 +0100
Message-Id: <20240102145000.741634-1-alex@linutronix.de>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 02 Jan 2024 14:50:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193235

Suppressing the error and returning None can result in a delayed failure:
https://autobuilder.yoctoproject.org/typhoon/#/builders/86/builds/6254/steps/14/logs/stdio
https://autobuilder.yoctoproject.org/typhoon/#/builders/87/builds/6262/steps/14/logs/stdio

It is not clear why the os.stat() error occurs to begin with (it shouldn't), so rather than
adding further workarounds, let's get diagnostics at the source first, so we understand
what is going on.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/lib/oe/sstatesig.py | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/meta/lib/oe/sstatesig.py b/meta/lib/oe/sstatesig.py
index 0342bcdc87a..6f124e4f59b 100644
--- a/meta/lib/oe/sstatesig.py
+++ b/meta/lib/oe/sstatesig.py
@@ -357,10 +357,7 @@ def find_siginfo(pn, taskname, taskhashlist, d):
             return siginfo.rpartition('.')[2]
 
     def get_time(fullpath):
-        try:
-            return os.stat(fullpath).st_mtime
-        except OSError:
-            return None
+        return os.stat(fullpath).st_mtime
 
     # First search in stamps dir
     localdata = d.createCopy()
-- 
2.39.2


