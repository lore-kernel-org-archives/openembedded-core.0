Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8FAD2C761A6
	for <webhook@archiver.kernel.org>; Tue,  4 Apr 2023 15:16:52 +0000 (UTC)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.web10.104516.1680621410809723995
 for <openembedded-core@lists.openembedded.org>;
 Tue, 04 Apr 2023 08:16:51 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20210112 header.b=gTuGy51f;
 spf=pass (domain: gmail.com, ip: 209.85.221.52, mailfrom: martin.jansa@gmail.com)
Received: by mail-wr1-f52.google.com with SMTP id l27so33216099wrb.2
        for <openembedded-core@lists.openembedded.org>; Tue, 04 Apr 2023 08:16:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680621409; x=1683213409;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Naw72JmMme/il79jbGaPIqyuwDObjrHHUlFvtwriUQY=;
        b=gTuGy51fccVLgqCExmnyH4h5JkcHFgTbCBL7dIkULNyQUEMklY1YlpTvpDVq2jS/JD
         LVinKsnSEDW14gJzgvcWZINjAxIvMI4WCOOBIhV5RtTJ0rDVbvzvzLLE4Kj11ZZNoopu
         O8aQZfj4Tu3N2vA52d3uT7mp0/o6Vxe8F3/Y5ROSGN/saQsIcYkS8gQ1jyT8eD2G1lo8
         pvx93QHPEzMJPb7k4f3S7ORvUfrSwdFPF2wOw0ibE4Q98D4Ifp/pUFk9LMbgzRtkDvyf
         tHaY3XA7yMwmBxe7H9c3CfhXlmh/D1Sz3W9rJXE2Koi/FCph2OLzdPn/rxa1XPYsItky
         +9yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680621409; x=1683213409;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Naw72JmMme/il79jbGaPIqyuwDObjrHHUlFvtwriUQY=;
        b=KYai0ojQK2azp7liu7Rip6+7hmtHA8NlnBnPcaQgV9EagpbfD6oxpZRVCxk0cHTLtz
         8HiAFMDUggdyrO4tpPur9DX993gevZLuEE5OjrnvzGbPJO6iJMD8Vh3mSXlmK9aeufNM
         pQg6jLfnIU272VJYSb6qjYNbGz9A1TX1WOyM5JZncwo4FU50DmMYhWBqJm+7hTwGDj8J
         l1lafCbhVbMJoghVHbU3sk+a/vqnNgnzh86taYVBqOvAZPnQL+zy0F9WXkMfZ1jW6sir
         j3k9IirpCQfCh/SzJLkmZTrwQdijInVbBTrRQv93VKA9e2e1tvohcvuIWeVBfcQ4sML4
         6Xhg==
X-Gm-Message-State: AAQBX9c9spTk1HbsX3Y+Xx72KV72ziG7R1KlvEIug3eLT1XsBgAiNdvq
	XPzpEn3ot0G8GPrXMo+6P9n12K5ScHo=
X-Google-Smtp-Source: AKy350ZS20H8+y38LdvTZ7h4Vs/pl0cNeujUd6WKKqG6A/jb8iD0qnV0S2OfZ5tgNlBYJ0NgM6P0MQ==
X-Received: by 2002:adf:f004:0:b0:2cf:f01f:ed89 with SMTP id j4-20020adff004000000b002cff01fed89mr2155596wro.24.1680621409223;
        Tue, 04 Apr 2023 08:16:49 -0700 (PDT)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id t16-20020adfdc10000000b002e5ff05765esm12018179wri.73.2023.04.04.08.16.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Apr 2023 08:16:48 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: steve@sakoman.com,
	Michael Halstead <mhalstead@linuxfoundation.org>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [langdale][PATCH] uninative: Upgrade to 3.9 to include glibc 2.37
Date: Tue,  4 Apr 2023 17:16:40 +0200
Message-Id: <20230404151640.2079056-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 04 Apr 2023 15:16:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179699

From: Michael Halstead <mhalstead@linuxfoundation.org>

Update uninative to work with the new glibc 2.37.

Signed-off-by: Michael Halstead <mhalstead@linuxfoundation.org>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/conf/distro/include/yocto-uninative.inc | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/meta/conf/distro/include/yocto-uninative.inc b/meta/conf/distro/include/yocto-uninative.inc
index 51c0cdee43..8a5cab5360 100644
--- a/meta/conf/distro/include/yocto-uninative.inc
+++ b/meta/conf/distro/include/yocto-uninative.inc
@@ -6,10 +6,10 @@
 # to the distro running on the build machine.
 #
 
-UNINATIVE_MAXGLIBCVERSION = "2.36"
-UNINATIVE_VERSION = "3.8.1"
+UNINATIVE_MAXGLIBCVERSION = "2.37"
+UNINATIVE_VERSION = "3.9"
 
 UNINATIVE_URL ?= "http://downloads.yoctoproject.org/releases/uninative/${UNINATIVE_VERSION}/"
-UNINATIVE_CHECKSUM[aarch64] ?= "3f15d420049b21854bd7a8843da0f42f17064559492c8b752d7a6f998ff5ea65"
-UNINATIVE_CHECKSUM[i686] ?= "a6dcf316d738ade2e5e463bd3b33a270b4bfc25bba41770ad5cbdc3b0e24044c"
-UNINATIVE_CHECKSUM[x86_64] ?= "5fab9a5c97fc73a21134e5a81f74498cbaecda75d56aab971c934e0b803bcc00"
+UNINATIVE_CHECKSUM[aarch64] ?= "de35708c95c34573af140da910132c3291ba4fd26ebf7b74b755ada432cdf07b"
+UNINATIVE_CHECKSUM[i686] ?= "adac07b08adb88eb26fc7fd87fee0cec9d5be167bf7c5ffd3a549a2a6699c29c"
+UNINATIVE_CHECKSUM[x86_64] ?= "3dd82c3fbdb59e87bf091c3eef555a05fae528eeda3083828f76cd4deaceca8b"
-- 
2.40.0


