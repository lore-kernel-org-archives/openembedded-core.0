Return-Path: <adrian.freihofer@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74036C02183
	for <webhook@archiver.kernel.org>; Tue, 14 Jan 2025 22:17:24 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.web11.7331.1736893040999498192
 for <openembedded-core@lists.openembedded.org>;
 Tue, 14 Jan 2025 14:17:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=TFbTzyt9;
 spf=pass (domain: gmail.com, ip: 209.85.128.44, mailfrom: adrian.freihofer@gmail.com)
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-43635796b48so1475365e9.0
        for <openembedded-core@lists.openembedded.org>; Tue, 14 Jan 2025 14:17:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736893039; x=1737497839; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Gz+pW8R2ztjUlvz2wBBqvyImPYmGWc2Bn0nlrhPi9pw=;
        b=TFbTzyt9Euw6zRt7eIq4+0rsbbFBsLIOS1IDi8zozHkvqZvXI8xFyzV1z0BmmFPKH+
         a31swVMS4EtKHDJgRu+brDwvc0w3wVYF4Rr8/CF6t4SI+CGHSgXY1GQJhok+KLN4KMBZ
         1b6+7Eg/7xS2+mvavfabOAAZlx2Y39ulf1i0AEwraSP/SucO7syoFCTRTpB7Cy4Q3LbM
         oWKwGwnRRiepEQGHXUQXIyDzyJYgStJAzw9f9Oe4Bbgg3K7IHOuCjVKNqhUvvzO1gg+/
         JgCZYEFfk5FCMA3eBlKNm1kndYjEkzNVeoDBGvnhkbmVtHyPS/28rppw+O75O5I1JPLW
         xfJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736893039; x=1737497839;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Gz+pW8R2ztjUlvz2wBBqvyImPYmGWc2Bn0nlrhPi9pw=;
        b=Lw/OSVm5WR98PzdZno8COlz8ez/BaTpr7E6Da9MIk62b12UAVRmDWPoByQNLoUZhZm
         0nzHBmGZoTihYoNkk8xaMajPY/CJjEJjRh8Ujqg/wRM3zZ5D8UJIVno4na/dhMYw4VoS
         5wDHjdZ4WfW6sK3QETVD+fVZp+EFP6ae2ZfuFYpNJqw4RXkBhP0R57hWbuy67VFOjf7N
         dtmgROr5+UXzAElM4KkN75Pyxr/EvZCqa+BuBaeMNi3AM4itYXcZKfR6klNzBTmQNKIQ
         4IJ/dcfNZ1rethq6t1vnfmMpp5hnyyNxq3Pw5Za+KwMVhXA5e1l4l3uTSufdQoCePDaz
         jxmA==
X-Gm-Message-State: AOJu0Yz2sU+f+z3PPNMmgTosxmTv00WCU1goQGNGySH3PIjIYgnroWnq
	X4TRKclx6ztVH4fKRjsF2AtSbAK5baVTlya4dBv03dmwJOihVJfrhG/a/Q==
X-Gm-Gg: ASbGncvY6ArBmS6RhzEFWvdLD6AbjX9v7WtMbNR/N7d4PbFSqqD5oLKlUMTM8C2SZli
	XWflVxHYMW6NqKghgwPfmusjk3CVQmJ8ebwSbUThnoKL9+L6TNj4hkpvA9CKq7ODhqJ0RkhhmB3
	AfYnnxPncmVggYMmGXqAOdwAm6z5ooS9+PstCNUilhelEvEFLsN3IOCGnfK8ixB/hEcBZvKpmoV
	+/Y+0nQPoEb/BnX0/iTbv0I3Xj+eAbCGHOOW8jCjidP6mA702EskKs+bGZlmJOWmyD/GV7wmoOE
	v7Q=
X-Google-Smtp-Source: AGHT+IG6grF+uHMCOJ7dwR8UULKqOgVi9dozZUaRlia2iIMndtP2JBinoXdHezJjnIIIyFqSdnTChg==
X-Received: by 2002:a05:600c:1588:b0:436:747d:55c9 with SMTP id 5b1f17b1804b1-437c6af20d2mr4201755e9.5.1736893038693;
        Tue, 14 Jan 2025 14:17:18 -0800 (PST)
Received: from wsadrian16.fritz.box ([2a02:169:59a6:0:55c4:f628:91f3:4287])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a8e4c1b05sm15790513f8f.88.2025.01.14.14.17.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jan 2025 14:17:17 -0800 (PST)
From: Adrian Freihofer <adrian.freihofer@gmail.com>
X-Google-Original-From: Adrian Freihofer <adrian.freihofer@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [PATCH] rust: increase test timeout again
Date: Tue, 14 Jan 2025 23:17:01 +0100
Message-ID: <20250114221701.13257-1-adrian.freihofer@siemens.com>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 14 Jan 2025 22:17:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209812

Fixes [YOCTO #15625]

The first attempt to get around the timeout was to double it from 5000
to 10000, which doesn't seem to be enough. Let's try to fix this by
extending the timeout by a factor of 10.

Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
---
 .../oeqa-selftest-Increase-timeout-in-process-sigpipe-ru.patch  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/rust/files/oeqa-selftest-Increase-timeout-in-process-sigpipe-ru.patch b/meta/recipes-devtools/rust/files/oeqa-selftest-Increase-timeout-in-process-sigpipe-ru.patch
index b42dda8b345..bb27ca35ff8 100644
--- a/meta/recipes-devtools/rust/files/oeqa-selftest-Increase-timeout-in-process-sigpipe-ru.patch
+++ b/meta/recipes-devtools/rust/files/oeqa-selftest-Increase-timeout-in-process-sigpipe-ru.patch
@@ -25,7 +25,7 @@ index 11f363d62..c12d66016 100644
      // Just in case `yes` doesn't check for EPIPE...
      thread::spawn(|| {
 -        thread::sleep_ms(5000);
-+        thread::sleep_ms(10000);
++        thread::sleep_ms(50000);
          process::exit(1);
      });
      let output = process::Command::new("sh")
-- 
2.47.1


