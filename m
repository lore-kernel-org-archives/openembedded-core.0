Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B049C433F5
	for <webhook@archiver.kernel.org>; Thu, 13 Jan 2022 14:37:37 +0000 (UTC)
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com
 [209.85.210.170])
 by mx.groups.io with SMTP id smtpd.web09.9579.1642084656854434164
 for <openembedded-core@lists.openembedded.org>;
 Thu, 13 Jan 2022 06:37:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=pa+vjD85;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.170,
 mailfrom: steve@sakoman.com)
Received: by mail-pf1-f170.google.com with SMTP id i129so38384pfe.13
        for <openembedded-core@lists.openembedded.org>;
 Thu, 13 Jan 2022 06:37:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=BGiwPqTshkR5TFPXFhWfwTbXXgW1IJ0TdGrNYPbEWg8=;
        b=pa+vjD85Mvj2XSAowcbst6/YdRX3AlDHDK86i9MQVqKBfDzidtxxh7BVH0mthaFLN5
         vfLE4sbn80cyxaG1mpoNmbqHTnrAmtlxhc+eLcJH8VzYULrwJnsLjxEWaXunttfZ66Es
         8S6yt8NFYPJbR0GxaosfAOa3UYIaFuVt9ku+XJkUil2QYhoxQe1jHwzJkhOri6sK13zT
         hXBZb+MrF6swyOK5mGqY0OBtF3dh9yrkIklJ9FuR59XlK2vlW0NjOfBsmiYQkQh9B9EK
         k5giE7/Dd9GGbYCEd2nScgYdPIyk+S6+ySsB9KmJ2D/L3w7i/JkGi51kZoYLzgm4/lxg
         1IMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=BGiwPqTshkR5TFPXFhWfwTbXXgW1IJ0TdGrNYPbEWg8=;
        b=blbFZtOf80q1lXv/dQunkThD3MOZuneJO4M14WkZCg3GM59MN2pZsZ8enMNQJ6yi+u
         PSmDDDuWnO0i5mUlZIJLt9Y7ofvmfUBxR5U4spjr5hx3ivWD0lmLFZkbNfybaYvA1CqA
         RppLj6TMICLVbGJbGh53LuY9AqGLZpsns8JDW6/Hd/+9UVjfuj5PR25ZHxL+xNiD5Zn4
         DhQxa8VxQDBM7Xv3jN2cIHD/XdAYe8xW+qNJVIP6Hdol/7eaziYWhSmt8Lr52TW45G4e
         XYZ4cHmvuW/lPW2OxH5Ro/z3xyQkFwNdw7+MC2c0eJ3skaTGLlvGFYPxO1NVli9U97Ju
         CS3g==
X-Gm-Message-State: AOAM531XbokgoaicaqSUho0nKDi/56NTkYFmvttQW5e9lF8TfcUwsYFm
	RTcmzB628ipFxb/SH8D623ypE/FkzVUiBY88KcU=
X-Google-Smtp-Source: 
 ABdhPJyvnOavBHkvGiubV4/kzZYktKwDm1hMDVnsRRUxiEZiyFk/GPnSLQSk16jqycLWwwi5QCxy1Q==
X-Received: by 2002:aa7:81cf:0:b0:4c0:6242:c14e with SMTP id
 c15-20020aa781cf000000b004c06242c14emr4427811pfn.83.1642084655676;
        Thu, 13 Jan 2022 06:37:35 -0800 (PST)
Received: from hexa.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com.
 [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id
 g11sm2541544pgn.26.2022.01.13.06.37.34
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Jan 2022 06:37:35 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 01/11] valgrind: skip flakey ptest
 (gdbserver_tests/hginfo)
Date: Thu, 13 Jan 2022 04:37:05 -1000
Message-Id: 
 <ead8809ab3182cda04495915551cf3f9b4f5d1f6.1642083419.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1642083419.git.steve@sakoman.com>
References: <cover.1642083419.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 13 Jan 2022 14:37:37 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160512

This ptest was already disabled in master branch with: valgrind: skip
broken ptests for glibc 2.34

https://git.openembedded.org/openembedded-core/commit/?id=c177c7f9ef6f90ca49074f003accb8e9a1a645aa

Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/valgrind/valgrind/remove-for-aarch64 | 1 +
 meta/recipes-devtools/valgrind/valgrind/remove-for-all     | 1 +
 2 files changed, 2 insertions(+)

diff --git a/meta/recipes-devtools/valgrind/valgrind/remove-for-aarch64 b/meta/recipes-devtools/valgrind/valgrind/remove-for-aarch64
index 93bfd45a4e..afa6a94825 100644
--- a/meta/recipes-devtools/valgrind/valgrind/remove-for-aarch64
+++ b/meta/recipes-devtools/valgrind/valgrind/remove-for-aarch64
@@ -120,6 +120,7 @@ drd/tests/tc19_shadowmem
 drd/tests/tc21_pthonce
 drd/tests/tc22_exit_w_lock
 drd/tests/tc23_bogus_condwait
+gdbserver_tests/hginfo
 helgrind/tests/annotate_rwlock
 helgrind/tests/annotate_smart_pointer
 helgrind/tests/bar_bad
diff --git a/meta/recipes-devtools/valgrind/valgrind/remove-for-all b/meta/recipes-devtools/valgrind/valgrind/remove-for-all
index d6a85c4735..9b8db093df 100644
--- a/meta/recipes-devtools/valgrind/valgrind/remove-for-all
+++ b/meta/recipes-devtools/valgrind/valgrind/remove-for-all
@@ -1,2 +1,3 @@
 drd/tests/bar_bad
 drd/tests/bar_bad_xml
+gdbserver_tests/hginfo
-- 
2.25.1


