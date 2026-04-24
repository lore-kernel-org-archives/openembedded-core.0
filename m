Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0CCEFF8855
	for <webhook@archiver.kernel.org>; Fri, 24 Apr 2026 20:57:14 +0000 (UTC)
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com [209.85.128.68])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.32606.1777064228470973095
 for <openembedded-core@lists.openembedded.org>;
 Fri, 24 Apr 2026 13:57:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=yKp9nYJ6;
 spf=pass (domain: smile.fr, ip: 209.85.128.68, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f68.google.com with SMTP id 5b1f17b1804b1-488ff90d6c7so68179295e9.2
        for <openembedded-core@lists.openembedded.org>; Fri, 24 Apr 2026 13:57:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1777064227; x=1777669027; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MV6ULFDYbvbGwrNtaGcHJ2UyeTW77SfuMN/2MFcZcxY=;
        b=yKp9nYJ6pwl3w6tCZM1kUhkmI3TCzKbgUhGeSIUiSSYDcRy2mXulapJx3KDOIR007v
         hmqmiC6IncVZ5pAlgyLzpCcj/xpJBiQ+n+Tk8ZAv6wRO/P/3LqYVsVvjz9LqSEyYWh5p
         oU12KOnaMJqAl01BruulAqeBTsnW0VQeplDrs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777064227; x=1777669027;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=MV6ULFDYbvbGwrNtaGcHJ2UyeTW77SfuMN/2MFcZcxY=;
        b=RZ3lEVg9Zz4QLQOy2hdqZQvHAcKSmt5BzRySRQXTupU758r7TGhAFzIYxQ7/i3gvEi
         +9QOL+0sAncNhGKxnQSp70/CNW8tQdULljNaGCQxBYNmgRQy7yOTpput5KpKvwo8+Cbs
         qGx42Qh4LUfUAX6orqRjXs9FiTIGXzzn5Gg21khsMrCAP+Iz2LigwieVfs/6uQq95yqH
         gADqBdO3ryhl7MSVBzXyyqejsGjIiASOSFaeFJUChWVXRq+BYdJhm5ga7EfTT3KpLw1k
         sJ/Iuz8E1PXDhMbTyAXOWZX6MH2YoZrd0Wag6YGdfXUDtVYt+evqvTL81BB2jsahkLzB
         CpEA==
X-Gm-Message-State: AOJu0YyOoKivWD/WprHlG/VI/KgMn4KnlMXdJgOJ8Qt6C2GC/sUlVSUC
	Nopt4pA1/GmyM0RrryNmsacjx7NadvoICTRo8T4TfFhGVmzuzEkovTDK0WSvN6C6VCLAMDsRibO
	rJ3xE2BMVmPyq
X-Gm-Gg: AeBDiesk3KATttwQSUnVj91LotF2ETN8R4I3Sv+KEKP8acRBGLWgQ5ip2YjApwMwGoT
	glX3Rsca4H/YVWgiRiDyirxC8ko5LLI1Hv3fOg8q0ABRXpnTDCHB5K2cVjLEBYN4jcjLPkWYYUv
	UiBM6p7pVVjGHD1nnK7DoSFI8rTQbYjYiNVT8rKiwzOPzrFb7IxJh9akFIwZkXi0Y6kRzuUvwMo
	0IPU4PXIC9WWhJtSt2Wqi0sfKaUeM/lqPJknaWh98PQ1dyzYiYjTEbruvv1cfn0+3MT8KbHt7Nn
	VWXqjRT0HzMz9/B7G9GSYvQ48/Ng+5bIwhNRJ8MKtcbNTJpJTM2CU1eSufgf/e2zQwNUhX7jxEx
	irzhceuHDJcG+MPdRi3zLPUNxmnUJy/MRrUqcQp+TUE5FkC1FJfr9nufFjyzD2UvVgDZCP71gDl
	ScCqd8xF5KIozMVL2cvz/b8hfX1uTof1a8HcT1pE2uex9AnToXw3W0Ia8BHvwDV/o6VqbOyGssS
	LxB3KTV0vQMy7BW5RxrXUQrW0dWj2Gw3P4dIw==
X-Received: by 2002:a05:600c:8587:b0:485:3f30:6250 with SMTP id 5b1f17b1804b1-488fb7856b9mr363199905e9.20.1777064226657;
        Fri, 24 Apr 2026 13:57:06 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4891cca5743sm394841005e9.9.2026.04.24.13.57.06
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Apr 2026 13:57:06 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 51/66] yocto-uninative: Update to 5.1 for glibc 2.43
Date: Fri, 24 Apr 2026 22:55:50 +0200
Message-ID: <fd94d49fa9b053105ddc725d5e3024582395a373.1777064068.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1777064068.git.yoann.congal@smile.fr>
References: <cover.1777064068.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 24 Apr 2026 20:57:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235924

From: Michael Halstead <mhalstead@linuxfoundation.org>

Signed-off-by: Michael Halstead <mhalstead@linuxfoundation.org>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit c1fb515f2a88fa0a0e95529afc07a99db001af0e)
[YC: Remove duplicated line in commit message]
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/conf/distro/include/yocto-uninative.inc | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/meta/conf/distro/include/yocto-uninative.inc b/meta/conf/distro/include/yocto-uninative.inc
index e9dc6c86408..d97c96f631f 100644
--- a/meta/conf/distro/include/yocto-uninative.inc
+++ b/meta/conf/distro/include/yocto-uninative.inc
@@ -6,10 +6,10 @@
 # to the distro running on the build machine.
 #
 
-UNINATIVE_MAXGLIBCVERSION = "2.42"
-UNINATIVE_VERSION = "5.0"
+UNINATIVE_MAXGLIBCVERSION = "2.43"
+UNINATIVE_VERSION = "5.1"
 
 UNINATIVE_URL ?= "http://downloads.yoctoproject.org/releases/uninative/${UNINATIVE_VERSION}/"
-UNINATIVE_CHECKSUM[aarch64] ?= "a25f2174d0cefcb22af005e9bc72ac01ae83b011c5b6d6d5bf00dac979877f76"
-UNINATIVE_CHECKSUM[i686] ?= "959cc2539b692f9b9862825c7324a0fe4d061fca742f6c259f67f581c59af956"
-UNINATIVE_CHECKSUM[x86_64] ?= "96045e8b1e242c8a849426a8506c7043f354b39f2bc0035192780e8205e23e9d"
+UNINATIVE_CHECKSUM[aarch64] ?= "4166237a9dabd222dcb9627a9435dffd756764fabf76ed7ef2e93dc2964567ad"
+UNINATIVE_CHECKSUM[i686] ?= "761502cc9aef4d54d0c6fe9418beb9fdd2c6220da6f2b04128c89f47902ab9ae"
+UNINATIVE_CHECKSUM[x86_64] ?= "2b63a078c26535e0786e87f81ae69509df30f4dce40693004c527bd5e4ab2b85"

