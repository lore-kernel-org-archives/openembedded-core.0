Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C883CD13DA
	for <webhook@archiver.kernel.org>; Sun, 17 Sep 2023 09:39:16 +0000 (UTC)
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
 by mx.groups.io with SMTP id smtpd.web10.27139.1694943552097616220
 for <openembedded-core@lists.openembedded.org>;
 Sun, 17 Sep 2023 02:39:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=jo35y4vl;
 spf=pass (domain: gmail.com, ip: 209.85.208.48, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-52fe27898e9so4060907a12.0
        for <openembedded-core@lists.openembedded.org>; Sun, 17 Sep 2023 02:39:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1694943550; x=1695548350; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BauezyssRgbLiRO3M7e752WRXVQDW4vicrZyEFoBx/M=;
        b=jo35y4vlCWLeJiMAmOs5x8SNptkg9a0KYMyAkrfQUqbZ/xxkParQMGlLO5vhhb/j/3
         M2ehJeQHvqoyrlBL/wVyGdNTvhefG2cyl/HTg6521Uqj+4gfavOadDqwcKTlt0WXhz+o
         YV1sJ8KmqVqvCvzxHRZ+j7Zyo4Qy7qHwOM8KEvwanSxIpJjYzR+RQ2G9Xq2r0oiAHe5C
         oUdkPSEphUNMTdtOXZngnZVXj4TXmFo2qNZObTadTXg1XOB1Imqu/7FqJ+oVAcUzr1Sc
         ANARakMbDvAcvaENPmJ+PEZbShGOZF7xXFgOLP3dJtDnmsRH3haE3xGtXbxcDH3WbhE7
         eK0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694943550; x=1695548350;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BauezyssRgbLiRO3M7e752WRXVQDW4vicrZyEFoBx/M=;
        b=QiunPvM3H+mreJr4LNNoMUyzzQY2+0s8onD4dKBpGgKO2ep/5e57pDB5wtGmB46x0n
         MQzpobwvkjq5iz45BGa0bfnUb5sj+0/7cJvhS4+4RWLYIShjZbkApJs8idG5WMZNwx0A
         c1Qt2L6hNS0bVd1mFyoCgXeZSJ2WA2AW/DIQb4b3gssvF4fLAcQRNivVE0wpKTUMMj0Z
         49P4fYEzaUdOoBwtvnlYfBGPRWBLXOD+XXgCocSjXJDhItgCdAoQRA1mGjV4VvgXJPM5
         3hm6+PDwYWFpS2llH0mBSOCu9vThwcEcjfDmNONHwcszfXN3ML14GrhZ5oMR8/jQc82U
         Jt6A==
X-Gm-Message-State: AOJu0YxQGTLqKsX0MANvshsUIKox8OHjhCX9O6HE/nePXAci3m4PfFMw
	kBVqOaQFZmhAro48Ds4FUCCUW8YWLJg=
X-Google-Smtp-Source: AGHT+IHWy0yJwGstCDRpyUI5OWHdWh3GAQ8gkbs/zkrPwXxVWYCaM4DTnpZfIphCRCm4oRMkbJBvQg==
X-Received: by 2002:a17:906:73cb:b0:9a5:9038:b1e7 with SMTP id n11-20020a17090673cb00b009a59038b1e7mr5622113ejl.36.1694943550307;
        Sun, 17 Sep 2023 02:39:10 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id d8-20020a17090694c800b0099ce188be7fsm4779683ejy.3.2023.09.17.02.39.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Sep 2023 02:39:10 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 09/29] strace: remove from time64.inc exception list
Date: Sun, 17 Sep 2023 11:38:41 +0200
Message-Id: <20230917093901.428214-9-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230917093901.428214-1-alex@linutronix.de>
References: <20230917093901.428214-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 17 Sep 2023 09:39:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187782

The issues were resolved via

https://github.com/strace/strace/pull/263
https://github.com/strace/strace/pull/264
https://github.com/strace/strace/pull/265

and the fixes were released in strace 6.5.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/conf/distro/include/time64.inc | 2 --
 1 file changed, 2 deletions(-)

diff --git a/meta/conf/distro/include/time64.inc b/meta/conf/distro/include/time64.inc
index bc0c72226ba..83b0dfae6cb 100644
--- a/meta/conf/distro/include/time64.inc
+++ b/meta/conf/distro/include/time64.inc
@@ -32,8 +32,6 @@ GLIBC_64BIT_TIME_FLAGS:pn-pulseaudio = ""
 # Undefines _FILE_OFFSET_BITS on purpose in
 # libsanitizer/sanitizer_common/sanitizer_platform_limits_posix.cpp
 GLIBC_64BIT_TIME_FLAGS:pn-gcc-sanitizers = ""
-# https://github.com/strace/strace/issues/250
-GLIBC_64BIT_TIME_FLAGS:pn-strace = ""
 
 # Caused by the flags exceptions above
 INSANE_SKIP:append:pn-gcc-sanitizers = " 32bit-time"
-- 
2.30.2


