Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF7BAF327A0
	for <webhook@archiver.kernel.org>; Tue, 21 Apr 2026 05:42:55 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.11373.1776750172338975648
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Apr 2026 22:42:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=JegkRBmy;
 spf=pass (domain: gmail.com, ip: 209.85.128.44, mailfrom: martin.jansa@gmail.com)
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4891e86fabeso21088165e9.1
        for <openembedded-core@lists.openembedded.org>; Mon, 20 Apr 2026 22:42:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776750171; x=1777354971; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6xYx6+4w7jX3M6Aoup4NUI8Mc3h5JJeX9em16Jcc7Fk=;
        b=JegkRBmyRQxmahXELHGY/Qybfwk2KOhFRdDSCuRhyspPWQKVvlAAh2KtulgJSxOb+V
         5f7SlOkNzueeJUy/7NNvHA8IAQ+QscHGrXPTBRV11oX4oHDT6dM7aEt72XOgQc4L3HEu
         gRcphqWLcyMWwTka0siPvvjji+XLSxUKKJYEIBuhrZecpF1vTVpdut5dzuTZgRmSfGrH
         Fp5H4JrkkKayxLPd+MlFkScryPhKMO+nelsz1RRswcEnaFRsXdvn1Aqia8sOEICqVJFR
         swhPpU8SqeG/xzJXYuvyPb/T5wA+TjT+BV8W29q3mjNdB2Lt1dIP87sgFGXi10sE2XAd
         cT6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776750171; x=1777354971;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=6xYx6+4w7jX3M6Aoup4NUI8Mc3h5JJeX9em16Jcc7Fk=;
        b=JTk0qOBtPfpTPlzIhh1CdWNZvhdLPDHG6J4E21KJ/2OfSd2G4VM0gIIom0rMSxQFdU
         uids+CmS4PJtkfROsXoE4oHAD9HKMgUZysEEocTpMWNoR06XZiy7i7NL3LHnZ1bwAXeb
         qKnVVih4vsRziS+GeX4t1QtwZikyW00DuSExbSSn0pHhNA64ZTwwwnEP9hFPb4Jh+C2R
         cq03MsktSBlTq2RxFJxsIh0DFI6CTI83hoFkeNQYp96BzN7sf9HRo50JEHDHI4gzgKNQ
         x0At07fS+tb0tR0EsevgbQlbeCoPJDiF6+y9O4q8hiWF1l7nx0eS0MCJPhRbAXDvQUti
         sqlQ==
X-Gm-Message-State: AOJu0YzHW8/PaaZWJcIPKHtg6R85elhZxGpOR82nc7o0eeSbyQm5kOoq
	JFFc/NydyAiC+jN0V28bhiSOPYQAk+V0J2G5jzDWYjxg1W1lN2MoJ6BChuqGCg==
X-Gm-Gg: AeBDiesL+xjgd3Sk2Ups4GX5ufHqxg9PVIOa8Y01YDfYXME1RmDMNPc5VFhpTFSRvd3
	p36ikp9+Y5tnZFWzr9b52vtpdEGfmVERgvuOOamM8AfcxiOzG+dkzDZf9wadxfBjxLG2Z4YOgEo
	Q/4Arv9Jjh8UQ8i4eKcsBCmTBdFqF40sq52MljI3h5i/wzR91LpPVxiRn6DJe4hYDQcYLNKndNU
	MoZpimWDmG2TOBlaGszvxmwDyxJWHS0kSBALl//c1NjuVpzZ7TMTTjBllBAvC6DXDoPyC58rAfS
	NGhK9aUDojOtUrZMiUQbGiLLqjsfvpxvCwMDLDHuinPKRerTN/KCKmLw7GE5bCc7QEeSQqRzfe+
	I2fS6rjmT9/m1tw+/K7jOb6BkYnOujeRpygPXdWkKUVN1Y+FVByuU5m1WETRF7SPt410YSHVMJ3
	GYK4qiukZ7PwtKHIq/X+CPCwdB8QZaQYhgybTx2gb0x0LWMHDi2gf3cGctgfnRTWwT0F6WVVmfs
	pxHWTqx88a4md3OaJac
X-Received: by 2002:a05:600c:c177:b0:488:a82f:bba9 with SMTP id 5b1f17b1804b1-488fb7804f3mr222312495e9.22.1776750170588;
        Mon, 20 Apr 2026 22:42:50 -0700 (PDT)
Received: from localhost ([109.238.218.228])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488fc1cfbf2sm354734705e9.15.2026.04.20.22.42.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Apr 2026 22:42:50 -0700 (PDT)
From: martin.jansa@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: Michael Halstead <mhalstead@linuxfoundation.org>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [scarthgap][PATCH 4/6] yocto-uninative: Update to 5.1 for glibc 2.43
Date: Tue, 21 Apr 2026 07:42:38 +0200
Message-ID: <20260421054240.3264-4-martin.jansa@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260421054240.3264-1-martin.jansa@gmail.com>
References: <20260421054240.3264-1-martin.jansa@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 21 Apr 2026 05:42:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235594

From: Michael Halstead <mhalstead@linuxfoundation.org>

yocto-uninative: Update to 5.1 for glibc 2.43

Signed-off-by: Michael Halstead <mhalstead@linuxfoundation.org>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/conf/distro/include/yocto-uninative.inc | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/meta/conf/distro/include/yocto-uninative.inc b/meta/conf/distro/include/yocto-uninative.inc
index e9dc6c8640..d97c96f631 100644
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

