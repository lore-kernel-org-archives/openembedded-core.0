Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1CD5BC0218C
	for <webhook@archiver.kernel.org>; Fri, 24 Jan 2025 17:39:35 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.web11.18402.1737740370110142367
 for <openembedded-core@lists.openembedded.org>;
 Fri, 24 Jan 2025 09:39:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=CyyqLUv+;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.49, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-438a39e659cso15482315e9.2
        for <openembedded-core@lists.openembedded.org>; Fri, 24 Jan 2025 09:39:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1737740368; x=1738345168; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=sLBuzlgQD2Dt5maJ2xBrOt56rMiHb9BuMn+8561yNZ4=;
        b=CyyqLUv+/1VOQT69E4QhfYAomNg/49CvfM70FIr/0UFRnZ+TCJdnR9oAvjAE4JHxaL
         sYQ0pG/OiiKMQWY+CKday1HLNwz+KwV95Tfnde8IrGveZY0X9h65fm5echHuccpyxitO
         o6uXq0FDgGK15wDgFvdZVLJX9mh7Lc8vMYZ2U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737740368; x=1738345168;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sLBuzlgQD2Dt5maJ2xBrOt56rMiHb9BuMn+8561yNZ4=;
        b=ncekSSCRWh5r/fiSUqULuZQG/XBu4JY2HBYyfwF9Qtz+9RamTlJQAEGfojL6v0ccnS
         H8Hjx/LC6wzODYy0ZTAiHCmfGnC7Nt7U28KYZ1+tSc4qkZLbGg9YfeJ8dqrNMH9bgMx2
         kMRKRXryegDuk2VMLobqz8I3XHhON5T3AiTeH+xxPFYHwc3wTA4lLcukbiprppc1iCIS
         Cp8sCWK3I5xLdlWyKuDRXBiISMzRwUf5b/84gu7onF7lf3g/NM5b0zdljYWNsame0Vhr
         PEURE5BxfQH7xQfGuJqLvZTtuPixy5mZL+myhb0gCWtqR4W409Qtsz0sv9u8AyXx6Qis
         eJyA==
X-Gm-Message-State: AOJu0YzhDahFlNTxsUS6glosC6gcuhM3Y415p2BHOwExkpr0geD1FGTF
	3damXOUJm+8IrValPlwj7rvnX04OZQxRCnUYa/FHPbuyCVNsoyy81S8E6pQ8l/xQoUmxb5WhNTQ
	1aMA=
X-Gm-Gg: ASbGncsy/WkQZ7V64SltXG/fx4/Q9CHhQAc9uygf1Orn1tCgMYHP9WLubpHGqeIqC/R
	88+EVTsujzg5mT0JekTtePawB/1PDtewXnLP6/w89VoIYsA+ypCwsg5sJZoPPpbDCykh6k0rF6i
	n+JBydDxOJBVPK0FELu061qDMFJVi5Whsd4W4R5E6OCBxefhFeZKq31/q9x/wCjVi96guwtcuIO
	FfWKc0tqJwdUO6XBiMOCBVh1+wJ8nmgi/yWhlKie44mRb6V7gV3WUgFFK/nYWjA5Pc9sDE7buCA
	nfjFdjFRC4h2RYwMaS6f/N4F5RtuzeWOrA==
X-Google-Smtp-Source: AGHT+IGRGCcSLAU94vuks8kR1uHoCN6peEShsqd8ZHHOHO9E01A1+AvjzbebyrpQk7Po1EpfW/+CCA==
X-Received: by 2002:a05:600c:524f:b0:436:1b7a:c0b4 with SMTP id 5b1f17b1804b1-438913bed33mr242178775e9.1.1737740367986;
        Fri, 24 Jan 2025 09:39:27 -0800 (PST)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:6369:e73e:59c4:8223])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-438bd5732edsm33123235e9.36.2025.01.24.09.39.27
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jan 2025 09:39:27 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/2] oeqa/sshcontrol: Handle empty reads
Date: Fri, 24 Jan 2025 17:39:25 +0000
Message-ID: <20250124173926.2369699-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 24 Jan 2025 17:39:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210243

Looking at some of the autobuilder failures, it seems that somehow empty
reads might be possible despite not being EOF. Tweak the code to be a little
more robust in handling this.

In theory this shouldn't be possible but python does handle signals a bit
differently (e.g. transparrently retrying syscalls for EINTR) so adding this
check and a bit of code safety at least rules out this problem.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/lib/oeqa/utils/sshcontrol.py | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta/lib/oeqa/utils/sshcontrol.py b/meta/lib/oeqa/utils/sshcontrol.py
index 36c2ecb3dba..6c5648779a5 100644
--- a/meta/lib/oeqa/utils/sshcontrol.py
+++ b/meta/lib/oeqa/utils/sshcontrol.py
@@ -57,8 +57,10 @@ class SSHProcess(object):
                     if select.select([self.process.stdout], [], [], 5)[0] != []:
                         data = os.read(self.process.stdout.fileno(), 1024)
                         if not data:
-                            self.process.stdout.close()
-                            eof = True
+                            self.process.poll()
+                            if self.process.returncode is None:
+                                self.process.stdout.close()
+                                eof = True
                         else:
                             data = data.decode("utf-8")
                             output += data

