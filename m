Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BFAABCF884C
	for <webhook@archiver.kernel.org>; Thu, 20 Nov 2025 12:19:55 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.32975.1763641190172953211
 for <openembedded-core@lists.openembedded.org>;
 Thu, 20 Nov 2025 04:19:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=VX2Ts9lS;
 spf=pass (domain: gmail.com, ip: 209.85.128.41, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-47774d3536dso6382035e9.0
        for <openembedded-core@lists.openembedded.org>; Thu, 20 Nov 2025 04:19:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763641188; x=1764245988; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=siQUiOrdDcN/tK0e0fBxVu/8U+p1owBQOFX3bdcOoFU=;
        b=VX2Ts9lS/Z9hVc2SFGBTqKXOBVJ/VHEvI8xB7K1xUYMdC4UWT46cqn5rZeRqMkb8CC
         M69q3IjAy1ycP/cGdYQghGfRINdRoyoTX8uTQ1JeKC6gIH/bxamja52Cht4verJ/zh5o
         eyH7ZmQs8l0F+e8chFB88VYF1rMK+uFUBNbyy8SC3aoYaNATERwYv2q8AzFRo2BieYcO
         31UiAQCA6NlfLHsx53kj32soFfeJDju9rz8Th0bwrwo6uV2G1q2R8VIjmjehgji+IOBe
         3tUNEyL1vdt0hF7RDa6NEY0Gnec8Lck/slGD7p39KDMvRYRSQKeQvUlkhfqw1tAwzfQk
         rZ1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763641188; x=1764245988;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=siQUiOrdDcN/tK0e0fBxVu/8U+p1owBQOFX3bdcOoFU=;
        b=g+U0W2Y9lhqZfuwSesfKo9CxOFYtLFuWsRuc6Mx3CJERpWNqC+tmrdUkjsTo6aXn8L
         VuZ3FrX/nRL+wvUHe0eyi9Dytig5kNqjzfcuE0dJrHf6THQjIoFRxpZsostNIXuPd5I7
         +oLIFhNp/sLEhT8LlylYXRIo3G7LKzpZw5kVAfeJmnL1GKdbt6dZQwfXD4c1/D26CKpl
         lgyEj6y0ldAk1OoSCw+4iWRGx7CCAC9RWl+yUmzdbVAdSLuGdmmtTAIkKF/UTHn11Oht
         Y88mGmuwrE1uGKObpVGSx4zuFfl+/hTk8/UmNaJ/MRVD5mVeSIoj89/DAI5BRjQT7jnK
         tsjQ==
X-Gm-Message-State: AOJu0YypLfkQuw6H7N4Kc57KgFwobgAmR8qWPhagj0uAR4BYBhUT6mtU
	DEugSQCt1N2skhgo913xTCirMrXpUmb/Z5Hj7ALsos8370bS1aQNFi45Onr/Qzp0
X-Gm-Gg: ASbGncvCKCBGop8yjr+7YrhUsdmO9t9y1AZF1NXitHSopIrwUDqCMRRCrgvvzdm9Qp+
	vaOSKjFMFJCA8tALhQplx9P9KW/eCfnZwM/z9qf45JXm01HqxAFNdS5wpe1rIl/MuUuLdyT//PW
	mgUSVePQaRjvPgdL6/hHYiznXNnNG25wyNctYYwe+ylvhbEeON9lLtUqCs9NR2IXkQNvyFCyOX7
	Jw9Ap+rL6w1aQUTBVQmvDN/MgLCZNH6wsP63gAW6t7TerTpw7ayB9hj8ffFshJdVe9NYk0Z7/bz
	pHc+Y5e5/VX0JUjDZsOijau0LXaZWQd75Y63v22nGlV2dS2GBB79stOO1yD6p3yR3t+qiYETKSw
	coGw/H9DRdzBNqjU0DH5xPmcs4Q28/JED7DuHrZGEWSoS2TIN+y8ObJHXdplJAbTn/SxvXONXzg
	TD4ZRhtETJGyv0uUPS1Dc=
X-Google-Smtp-Source: AGHT+IHbqaFf3rltDi6SXjiZfkUrI+hpVoW/FDEyoEbzDBLcW9nAzbl+ci2JosXKtp+pv/wO3AcrRA==
X-Received: by 2002:a05:600c:c4b7:b0:471:5c0:94fc with SMTP id 5b1f17b1804b1-477b9eb43c3mr24994065e9.6.1763641188271;
        Thu, 20 Nov 2025 04:19:48 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-477b0ffe377sm103812435e9.1.2025.11.20.04.19.47
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Nov 2025 04:19:47 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 0/2] -fcanon-file-prefix and cc-rs compiler flag mixing
Date: Thu, 20 Nov 2025 13:19:45 +0100
Message-ID: <20251120121947.3473848-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 20 Nov 2025 12:19:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226617

These two commits are very losely related to each other.

Patch 1 adds -fcanon-prefix-map to the compiler flags, when it is applicable 
(when gcc >=13 is used). This helps with finding the correct debug sources 
for the -src package. Without this flag some recipes miss some source 
files from this package, and sometimes they miss all files. (E.g. sqlite, audiofile, librsvg)

Patch 2 tries to work around a bug (or at least unexpected behavior) in the cc-rs 
crate. 

This patch tries to recognize if there are any flags passed to the compiler that shouldn't be there.

How these patches are related: normally the *-prefix-map flags are only passed to cross-compiled 
targets. However the cc crate passes this flag to the native builds also (due to flag 
merging), and in case the host compiler is too old to recognize this flag, than the build fails.

Though I was able to build rust with both of these patches for both native and class targets,
I wasn't able to configure qemu to run in my docker env, and due to this I was unable
to verify if the selftests pass in an OS where gcc is older than v13.

While not mentioned explicitly, but especially with the 2nd patch I'm testing the waters,
it is an RFC also.

---

Gyorgy Sarvari (2):
  bitbake.conf, gcc toolchain: add -fcanon-prefix-map to map-prefixes
  rust-common.bbclass: filter out incorrect compiler flags in wrapper

 meta/classes-recipe/rust-common.bbclass   | 24 +++++++++++++++++++++++
 meta/classes/toolchain/gcc-native.bbclass |  3 +++
 meta/classes/toolchain/gcc.bbclass        |  2 ++
 meta/conf/bitbake.conf                    |  2 +-
 4 files changed, 30 insertions(+), 1 deletion(-)


