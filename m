Return-Path: <liu.ming50@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 182D5C021A5
	for <webhook@archiver.kernel.org>; Wed, 12 Feb 2025 18:59:09 +0000 (UTC)
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
 by mx.groups.io with SMTP id smtpd.web10.24416.1739386740691405987
 for <openembedded-core@lists.openembedded.org>;
 Wed, 12 Feb 2025 10:59:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=M5b+3zJE;
 spf=pass (domain: gmail.com, ip: 209.85.167.43, mailfrom: liu.ming50@gmail.com)
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-54506b54268so4038689e87.3
        for <openembedded-core@lists.openembedded.org>; Wed, 12 Feb 2025 10:59:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739386738; x=1739991538; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=rPT3xcbhIutu+j4qrFrb8MfYFlNIb4V8M1Z8aDA8AVk=;
        b=M5b+3zJEbhzgf7qwX6rJl/c4ILpy52p2T8HSDI11YQxD+q6K2WPU35hWx683II/TS4
         NVgcoKgu3fPNujqPyh+OHg5IX7JXx61lFhWHBzdAgInV/AD2lVqFIvEzfB0asmz0MUsF
         GQpcMEIUBxqeYyroK6zRrB5cVg4Oa04IKnj3laqW41bFl9O2Het4KTfUA7amdMv2vFU3
         wCCXfuRpp94Ds9/rZsJuoUUjf5/3mvHgIFngJrB6uQDONvC5b8OQEiT2LYh+1SkvYlZm
         dUacMY8wOzT6baq3S9Tnf78vZr2O1FqBqG6LaXp0T9mim0M+xesL8Br+yhU4elRcoyH/
         fPyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739386738; x=1739991538;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rPT3xcbhIutu+j4qrFrb8MfYFlNIb4V8M1Z8aDA8AVk=;
        b=JkWeRPYdPwZYU8U6NnT2uHmzRTvrsAsFkHXS7sPArxVsEdrFtPguz0yoC5fQCtMk8D
         FDNJ5ynbeTiQKDn9TM0RAgs2cxDKsHS3bMhecuA6Ts3qCSF0oV/cda3fFXO1GJa75HsR
         Q+V3cOG2Tbf7A/J2f8tGk4SiSIbGtB49/U+5ABLPiExgu8awh5KzeDGEbbugqpURCzMV
         i2sbSsVpwv/pPtaGoDh3msRdrKXQ2L6QpVYkqZiw7fWcaX4q32B7kUURDKWfJl+JNgNS
         A7hOSUuXMY+DJ0ODz31WxMHA+ewS+nzjTn8n2bY682l+jnnzdcLmy++CaoyoovfNg0Nx
         J3ZA==
X-Gm-Message-State: AOJu0YyLWKc0Pn9XdnrIcj4PU0tN25J5/9VLywnzUKSo5WXAwS1ERNfZ
	XdrhLKWXkakoMxtTrVN1qn5DTe8mWvxQGd6GcXwUrV+x+7pOWTMaKcilcAuy
X-Gm-Gg: ASbGncuSW/idtpbk2K1+ZUgmV5CO3a+XLMyxmW8YHfk+k441ytV0nar8Y12Xjuzsu/d
	p5guurj5w+SqjB0mp1vNw3qfI0R6yzNohEOmHiEd77erxmo2soloLH8STrf9xoA6m61IYdf6GvC
	VrHdm60Yc5++Wmq62XRsVWzm0rsTiXlf+9MWvhZHw646tzVf4m0zfonaCKMBvB1pUgyNCnC0T7r
	QKBjHJC/Ej4z5rvQXeOgrBWBxl0uYeccNcGXHKKi5tzThmIUiwLKDp0JJDVlIJbuw4kzoDYN35c
	T9L8UfjObWnb/YyC5KN/71zzJ8oe1jvjQ27G71GG0hGUPK4DZBVKTQq90xUfW3Dd6QzcTxw4Eg=
	=
X-Google-Smtp-Source: AGHT+IG1vnJfjS/j5FirHhQhwR3P3EzYCoWHKuO4YB1sOvsp1vIwPunu2HjstfAoMTb5b6I94v6dRg==
X-Received: by 2002:a05:6512:3d1f:b0:545:1d96:d703 with SMTP id 2adb3069b0e04-5451ddd6689mr87522e87.33.1739386737977;
        Wed, 12 Feb 2025 10:58:57 -0800 (PST)
Received: from peterliu-Precision-5680.. (customer-212-100-112-191.stosn.net. [212.100.112.191])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-308f7503e3bsm7969681fa.104.2025.02.12.10.58.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Feb 2025 10:58:56 -0800 (PST)
From: Ming Liu <liu.ming50@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Ming Liu <liu.ming50@gmail.com>
Subject: [OE-core] [kirkstone] [PATCH 0/1] Backport: scritps/runqemu: Ensure we only have two serial ports
Date: Wed, 12 Feb 2025 19:58:51 +0100
Message-ID: <20250212185852.35486-1-liu.ming50@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 12 Feb 2025 18:59:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211271

We are blocking by a issue when trying to pass our own '-serial' to
qemu, back port the fix to kirkstone.

Richard Purdie (1):
  scritps/runqemu: Ensure we only have two serial ports

 scripts/runqemu | 17 +++++++++++++----
 1 file changed, 13 insertions(+), 4 deletions(-)

-- 
2.43.0


