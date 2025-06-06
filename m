Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34143C5AD49
	for <webhook@archiver.kernel.org>; Fri,  6 Jun 2025 08:59:59 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.web10.29316.1749200393355953796
 for <openembedded-core@lists.openembedded.org>;
 Fri, 06 Jun 2025 01:59:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=epqYhhHL;
 spf=pass (domain: gmail.com, ip: 209.85.128.50, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-450cf0120cdso17822065e9.2
        for <openembedded-core@lists.openembedded.org>; Fri, 06 Jun 2025 01:59:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749200391; x=1749805191; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=3iruUqlpD2EfXMUzDRR9DRMvfuORGVU+LPb72BaH6yo=;
        b=epqYhhHLPsqsDxDe03SZKT1FtZUdSEDpyhr3OAuaN4UYI2V5m5rRwNksBy8tjhEguz
         PC/ULMqv4gI8sf8lD/fXkc6q6zBpQm6QQBXFr5yWlIK9DJwKOH5Kbwwe/L0NXiWV4YKR
         YSZ2C1Wn/6oub5HBTEgwrmnnKZTeA2BAW9mrzQiw80RoJPW3Fa1NybygbMtsj9UknfY1
         orNHaLVgh9b3ouW7uMj9YkX0tq7oCMXp8ckH4Y0KylbWOIayXkVLo4LvvaPqJ4T1TrVG
         vsJ6gtZ82mtUv7jyKe8OuyLJyi8Vb88S/ch7SPyB09wB6HRK63La3otrcCHhhNsc/igG
         nmcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749200391; x=1749805191;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3iruUqlpD2EfXMUzDRR9DRMvfuORGVU+LPb72BaH6yo=;
        b=IpIbfPAB9sfutZ2tBVLQmdPpSK+J2Mu4aFF5T0vPxtVHBTgRxqaz011wPSkrir/5Wh
         KquhMhLv9QjK33Z3SPnHvcVmv9x4srM3puKjPUvs8YUbm9KQU+EnslF0L8Ejc3w3NnM1
         bbudd+du4NBSvlnQ8SVlAoxulXThw7HgocOId8QIVzpffzB006aH2FuL2mk7dii2ZiZZ
         iIr7Y9oMpRSsIWXkf3fMyZ1sMky1+9+FG6f1kF3FbHN+Kc4fXmIFBDyRemBJbBM2jZQs
         SUYDLeCaoGaS0OcLQ1nYVVhWdnRA3Ioc/QhZRyQbyaVAMb29wneg6gMfe/w4Z7yzIBaq
         9U2A==
X-Gm-Message-State: AOJu0Yy8NqSQKpvQffS96K6KyVO7p+IJKOS8dSfTEP1OWSsJ64oUOGYf
	H1/9ZatInAoLNxysOYnD38ICadkQ8titXfjWv5mdzB6yGfsoTecNM6OhyIxLEQ==
X-Gm-Gg: ASbGncuLN4UPaqgtMb/e0DE+955rF4/jx91LGo/HHuwvFnMEgaFxmXY6FGt+ZDE3y/o
	3+AK342YNCn7TnnR3LqMFaRaSZoZ0LRFqnr9UhWBnHoU1xzRKCRwtcNarm3STySOqI2WPvV+lgd
	5qDAeu7Kx0wrNzC8at6rHxc+klSpb6ABZhlC7YVsG7n5acJbLr2zdvXS+30hzUr+6iozrz1FkxA
	VTCSRopLU5sUrgq3XsBD7yVN02y6bhCGzLDSf6TmDleViSfcIfLfhnhaNr5OKh0ZSb2B/jRsvZe
	b5lRh7c48JtYV0hHf98lIEuTTHBiBvJG84ccrf9ADhHmrAGQersLfnDba4rYyVt1O2SLKuGBRkP
	fcy+MWiqNmPC3
X-Google-Smtp-Source: AGHT+IEbWXzlgii3icZmiY/IWHfrZg1bqHh2cQSuCAgfJw/sSJM3fUyz7cFUrg8InWF8Vp7p/FZxCw==
X-Received: by 2002:a05:600c:8b46:b0:450:c9e3:995c with SMTP id 5b1f17b1804b1-45201360ee1mr28604765e9.12.1749200391209;
        Fri, 06 Jun 2025 01:59:51 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45209bc6d3esm17158635e9.6.2025.06.06.01.59.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Jun 2025 01:59:50 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH] lib/oeqa/utils/sshcontrol: correct condition for ending the select() loop
Date: Fri,  6 Jun 2025 10:59:48 +0200
Message-Id: <20250606085948.421114-1-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 06 Jun 2025 08:59:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218122

From: Alexander Kanavin <alex@linutronix.de>

This was set backwards; per https://docs.python.org/3/library/subprocess.html#subprocess.Popen.returncode
a return code of None indicates the process is still running,
and so the code entered a busyloop that ended on timeout
5 minutes later, lengthening selftests significantly.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/lib/oeqa/utils/sshcontrol.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/utils/sshcontrol.py b/meta/lib/oeqa/utils/sshcontrol.py
index 6c5648779a5..88a61aff635 100644
--- a/meta/lib/oeqa/utils/sshcontrol.py
+++ b/meta/lib/oeqa/utils/sshcontrol.py
@@ -58,7 +58,7 @@ class SSHProcess(object):
                         data = os.read(self.process.stdout.fileno(), 1024)
                         if not data:
                             self.process.poll()
-                            if self.process.returncode is None:
+                            if self.process.returncode is not None:
                                 self.process.stdout.close()
                                 eof = True
                         else:
-- 
2.39.5


