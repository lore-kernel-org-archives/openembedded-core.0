Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55243C4828D
	for <webhook@archiver.kernel.org>; Sat,  3 Feb 2024 19:15:13 +0000 (UTC)
Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
 by mx.groups.io with SMTP id smtpd.web10.23478.1706987704864392085
 for <openembedded-core@lists.openembedded.org>;
 Sat, 03 Feb 2024 11:15:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=k6uCueTO;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.170, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-5dbf050821fso2406458a12.2
        for <openembedded-core@lists.openembedded.org>; Sat, 03 Feb 2024 11:15:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1706987703; x=1707592503; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HVOVvy5d63L5XR1bAQZaG6ncY2gMUlkZFF0QoCPMsoI=;
        b=k6uCueTO4ZgCxGNSDZ8Uren/rmMan1CV8pqfjA6hNNUK2yTChvgwBOClkxkEUaG3qu
         57FgUkEGvt++Io5oulkfS3t4gceSry821X+Yii8fXMrOt60819cejWHgARL72zuf5Ddl
         nUoTO8QNUDZGmvt3bmDIHio0mTT+yE8Vpw/g3Yt6tkXb7q+3Q2UmbdB0/VgqAtHhz6Yr
         dmjv7gMGZvbkpnOIf7DT1u2uOzLb0aHdXFel8Fkp+PqO/odU9515bG7cFGkuuo4/dodx
         iUI7LEEtBQnLoAaZzLgzipRn6X1nWwxY33gu94Xg7bgiEZFvnE8ApWJg+xGnteEGR357
         XiIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706987703; x=1707592503;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HVOVvy5d63L5XR1bAQZaG6ncY2gMUlkZFF0QoCPMsoI=;
        b=SV/ICvpQTOvg+8/gz4L1yarWFwnzMGVjNGCzlBKSWGunOy7ftdQQdKTqsTEgk6Hnma
         cL21lRt23tygWntgAM5ZBFqrR86h4qU2ykHpvFGzXYtXIKgyME3/n+3fPya17vC+ygvu
         uTjpEA0MVCQ+dVP7LZJZbKhnT2XZwDqOTXCPQJMb8Opz5z0WwHPbY5ICC3Nu7ExrP4q+
         wRgnFwHOj6tXtHkgbLqDNoUVlVfXW4Mt3wOkeAybtkp2rXAGyC8aKsMHjkuqXZB0rsUO
         xAB+qy85UjeRuwzJuqagKcnwZIGSz7AG4S7K+EKoj7Ei1I5i677KN5APX1fZYM+jsczv
         mHaw==
X-Gm-Message-State: AOJu0YyJohIylhmPhpX/FTsvGKYTXPwJNfrwKYF1HskCpc5MMYrACmwx
	e0RYw2uYpTw1wmALe24GXSd9mwwe3bH5kEn3gCow0bI6UVPjDKbTTWoNm5LPEuwFw868LeSrY8k
	TrjM=
X-Google-Smtp-Source: AGHT+IHLa5XBLQJad+fDCWrlPALU6Jj9bHsuzclEHKCNX3xCAfimmOrtWhnVFzcdQiwTXd4ZGFT5pQ==
X-Received: by 2002:a05:6a21:9207:b0:19c:8cd8:305d with SMTP id tl7-20020a056a21920700b0019c8cd8305dmr6131963pzb.58.1706987703467;
        Sat, 03 Feb 2024 11:15:03 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-234-108-41.hawaiiantel.net. [72.234.108.41])
        by smtp.gmail.com with ESMTPSA id w63-20020a17090a6bc500b00296443780d7sm2376863pjj.47.2024.02.03.11.15.02
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Feb 2024 11:15:03 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][nanbield 08/15] glibc-y2038-tests: do not run tests using 32 bit time APIs
Date: Sat,  3 Feb 2024 09:14:35 -1000
Message-Id: <3d04849c741baeddd0677a18a468603b7112139d.1706987549.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1706987549.git.steve@sakoman.com>
References: <cover.1706987549.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 03 Feb 2024 19:15:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194852

From: Alexander Kanavin <alex.kanavin@gmail.com>

I'm not sure why this was included and enabled to begin with: the tests
predictably mass-fail if system time is set to after y2038.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit c9c7ebd6e447bce19803253afd881854f686b5f6)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-core/glibc/glibc/run-ptest | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/meta/recipes-core/glibc/glibc/run-ptest b/meta/recipes-core/glibc/glibc/run-ptest
index c394b49866..cb71c75682 100755
--- a/meta/recipes-core/glibc/glibc/run-ptest
+++ b/meta/recipes-core/glibc/glibc/run-ptest
@@ -22,12 +22,12 @@ tst_time64=$(ls -r ${PWD}/tests/glibc-ptest/*-time64)
 # related
 tst_time_tmp=$(sed -e "s/-time64$//" <<< ${tst_time64})
 
-# Run tests supporting only 32 bit time
-for i in ${tst_time_tmp}
-do
-	$i >/dev/null 2>&1
-	output
-done
+# Do not run tests supporting only 32 bit time
+#for i in ${tst_time_tmp}
+#do
+#	$i >/dev/null 2>&1
+#	output
+#done
 
 # Run tests supporting only 64 bit time
 for i in ${tst_time64}
-- 
2.34.1


