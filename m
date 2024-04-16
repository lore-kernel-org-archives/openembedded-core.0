Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6439CC04FFF
	for <webhook@archiver.kernel.org>; Tue, 16 Apr 2024 12:07:21 +0000 (UTC)
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
 by mx.groups.io with SMTP id smtpd.web11.18822.1713269238980082109
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Apr 2024 05:07:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=sSofOVVA;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.171, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-6ecf8ebff50so2860651b3a.1
        for <openembedded-core@lists.openembedded.org>; Tue, 16 Apr 2024 05:07:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1713269238; x=1713874038; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PCm3dpnyWiWC8VzeqmEGDcgoYFs///YTL5GEheKd004=;
        b=sSofOVVAwy003UYMCngnhYGh6oD/djuJaG5TWSmsTbDqquGJ4jimkPYAbN6RzdDF5S
         c/179Erxo2y62Rb1rYtwbaPrbPp/DGd7OEN+BuhEtJY4l8ZUMH3YSbVVbv1Oa/p5iPdy
         OvT9pN3brBjLoAiJda60RjfiWDbcDbfkqe3kJATyG4GOmfAecmv1Neuwrrse8N4kUGm6
         cNr2Ap19t/JWbZFfdyilQLGvShxhPKMzbgsdy7jrgFNbZr+zRLCflWiqnVqE1FxTbwNo
         myDzrbj3gkVuxPkctXtHpeLJobPqrP/Vpnb/M05eXg5EkkBxZ5Yq+ZsPWrcBI1V7j2IS
         fryg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713269238; x=1713874038;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PCm3dpnyWiWC8VzeqmEGDcgoYFs///YTL5GEheKd004=;
        b=U7zdMRtkJCMPYdoh2z3O2sZ+hhfiKRZ+bojKrVeTFvKvOrB1n4tKGujCG2UP25Eou0
         axGMLABR7jfTv7zi6kMeVA3Fvy2SymqdTtKtVzq23yfaE4uKIwxbz8GiF6rVIiyWxRqc
         t5b75u3SAsLSmZ5E5tSzfJd1y1tflvm4MJcwovhF1VR0iz6Wbl7l4akWFUbdK37rwUTe
         dm/WahuClxJuc3fBl6UXRxL5ou0g3GzQwUk3u/YlwLz9anKTDKOn1C3WqzceDOaxqSXL
         T0oOBn8n8sucH/BGkGhrsZBvIbHwljmjdrfwHAcMjngTnf2N6HNZBn098EEokfZ0xlgy
         PEsw==
X-Gm-Message-State: AOJu0Ywu2K7XEAdJxqn80pgvCBAuLjoiKwjoutwAG3oX6Uxbk5HQdep/
	xjZVcBk9b4EiXafJAB2WuWRtg3GJXqqctBLl/z1Ie9iHHIHrJUgbSEjleKJt9kesaDV8axvubn1
	9P7U=
X-Google-Smtp-Source: AGHT+IGzNQoi8GoKRKpFW0hZeRGlMCe/lSlIAwjMkCa9ZMHbuCxtrcxHmDILMvLLBZaus0pHcjRCZQ==
X-Received: by 2002:a05:6a20:2d13:b0:1a8:4266:f88b with SMTP id g19-20020a056a202d1300b001a84266f88bmr3042241pzl.28.1713269238241;
        Tue, 16 Apr 2024 05:07:18 -0700 (PDT)
Received: from xps13.. ([199.58.97.236])
        by smtp.gmail.com with ESMTPSA id j5-20020aa78d05000000b006edd9339917sm8746111pfe.58.2024.04.16.05.07.17
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Apr 2024 05:07:18 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 09/10] tcl: skip timing-dependent tests in run-ptest
Date: Tue, 16 Apr 2024 05:06:56 -0700
Message-Id: <161d336a6c57fddb36a0c4e8c2def84ce70128e3.1713268959.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1713268959.git.steve@sakoman.com>
References: <cover.1713268959.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 Apr 2024 12:07:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198446

From: Ross Burton <ross.burton@arm.com>

There are several tests in the test suite which are very dependent on
timing and fail on a loaded host system, so skip them.

[ YOCTO #14825 #14882 #15081 ]

Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
(cherry picked from commit 68beb4f4b5a0bea5d431decddf7656f18ac7a04a)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/tcltk/tcl/run-ptest | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/tcltk/tcl/run-ptest b/meta/recipes-devtools/tcltk/tcl/run-ptest
index 5b9127784e..51e1e4aa7b 100644
--- a/meta/recipes-devtools/tcltk/tcl/run-ptest
+++ b/meta/recipes-devtools/tcltk/tcl/run-ptest
@@ -3,7 +3,11 @@
 # clock.test needs a timezone to be set
 export TZ="Europe/London"
 export TCL_LIBRARY=library
-SKIPPED_TESTS=
+
+# Some tests are overly strict with timings and fail on loaded systems.
+# See bugs #14825 #14882 #15081.
+SKIPPED_TESTS='cmdMZ-6.6 exit-1.* socket-* socket_inet-*'
+
 for i in `ls tests/*.test | awk -F/ '{print $2}'`; do
     ./tcltest tests/all.tcl -file $i -skip "$SKIPPED_TESTS" >$i.log 2>&1
     grep -q -F -e "Files with failing tests:" -e "Test files exiting with errors:" $i.log
-- 
2.34.1


