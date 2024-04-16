Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79839C41513
	for <webhook@archiver.kernel.org>; Tue, 16 Apr 2024 12:07:21 +0000 (UTC)
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
 by mx.groups.io with SMTP id smtpd.web11.18823.1713269240404686125
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Apr 2024 05:07:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=RoS1D5Tn;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.178, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-6ecff9df447so4334139b3a.1
        for <openembedded-core@lists.openembedded.org>; Tue, 16 Apr 2024 05:07:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1713269240; x=1713874040; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=741ANwDec7YXTBr90YSnfxQLAgN9HQW0Kxcwhb+byDM=;
        b=RoS1D5TnKJPMt8bHjYM/MlXkYVF6PNvutly2WpjWdGawoUxE26raQg6p2ABIoJ1tX2
         gK8xCmiqpQGvoBGmC2zPOlWUqgbsvZ8vQ7QgLRSlUY8S/xsA/JdolPyeHqD9g5ib/hA5
         uVmVLj9fgw6XzLeR86X+Frs3NCYUhGjtmJ9ooGzBEYt/glvO+afXaLxV1EsJssZfbttn
         abDtuVv18o6gFiNzQ+i27GpIFRPupwHT1rtZBRPFeRwK6DrEynagldU0f/mmbxURo+ga
         RoYsUaUCaGzeyiTG74SXDEqoYBXO9cd3eBNvXo2TIcykUigttb7dbTrrQXIhB6xG0ADT
         7dwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713269240; x=1713874040;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=741ANwDec7YXTBr90YSnfxQLAgN9HQW0Kxcwhb+byDM=;
        b=dp2KcsKmmzKwUTHiISm8ikCRYlBgRmIna+qc5YDwj2asETwcVQ4p2vI9g59A/IRzFU
         /hdALa2cAHduTe/G4RiTTFFYwoF5Ex19wSPo1VoAScf65b+0Ouog93C2G+5OQ/sGCbw5
         OigZqkA1JawltT7lAwrcGI3VChUQ0CUhPCPvH6pc170T5oVTNIqQl+ZYQcNeE0wJZsNg
         9bJLCOwxTUEefczLZ5f2NB8Aq2ioQcyv9vU9RcCjKqhvWnyI+BAdqWp2o6UdbxNFMPdW
         dYs3TaL1k1y7WNWYxJizxzx8h98gA1teopIUlUXOGPYYUogYrju4NPYy+8vTmztQlLXJ
         O24g==
X-Gm-Message-State: AOJu0YwmPG0seMwxKIWRrqjDcOhJZLThxxXznKZjDvp4dtYRpyOGV6pm
	LAvXUxsmoCB40rZ+8Uq6vbcBD4FlWepXdT4nHIKmV9wQHf4kkGk1G+hyqF78sOJZPHT+t1IvASK
	tgRg=
X-Google-Smtp-Source: AGHT+IEicqST8DyIRL7YHCSufzsO+ND7cGH4JpSo/sv5kxlmzw5pBH4LtXxVrh6P/OOm3LzlEWpX+g==
X-Received: by 2002:a05:6a20:7f8b:b0:1a3:466d:d33 with SMTP id d11-20020a056a207f8b00b001a3466d0d33mr15734836pzj.9.1713269239655;
        Tue, 16 Apr 2024 05:07:19 -0700 (PDT)
Received: from xps13.. ([199.58.97.236])
        by smtp.gmail.com with ESMTPSA id j5-20020aa78d05000000b006edd9339917sm8746111pfe.58.2024.04.16.05.07.19
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Apr 2024 05:07:19 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 10/10] tcl: skip async and event tests in run-ptest
Date: Tue, 16 Apr 2024 05:06:57 -0700
Message-Id: <f94c74cee8b2650dd3211a49dc7e88bf60d2e6a7.1713268959.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1713268959.git.steve@sakoman.com>
References: <cover.1713268959.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 Apr 2024 12:07:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198447

From: Ross Burton <ross.burton@arm.com>

These test suites are full of timing-sensitive test cases, so skip
them too.

[ YOCTO #15321 ]

Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit dd06c3668dbe9ec1cf9a0a84d7a6bc9851f9c662)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/tcltk/tcl/run-ptest | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/tcltk/tcl/run-ptest b/meta/recipes-devtools/tcltk/tcl/run-ptest
index 51e1e4aa7b..87e025fce1 100644
--- a/meta/recipes-devtools/tcltk/tcl/run-ptest
+++ b/meta/recipes-devtools/tcltk/tcl/run-ptest
@@ -5,8 +5,8 @@ export TZ="Europe/London"
 export TCL_LIBRARY=library
 
 # Some tests are overly strict with timings and fail on loaded systems.
-# See bugs #14825 #14882 #15081.
-SKIPPED_TESTS='cmdMZ-6.6 exit-1.* socket-* socket_inet-*'
+# See bugs #14825 #14882 #15081 #15321.
+SKIPPED_TESTS='async-* cmdMZ-6.6 event-* exit-1.* socket-* socket_inet-*'
 
 for i in `ls tests/*.test | awk -F/ '{print $2}'`; do
     ./tcltest tests/all.tcl -file $i -skip "$SKIPPED_TESTS" >$i.log 2>&1
-- 
2.34.1


