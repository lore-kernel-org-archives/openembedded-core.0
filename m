Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EDB64C4167B
	for <webhook@archiver.kernel.org>; Sun,  1 Jan 2023 17:38:55 +0000 (UTC)
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
 by mx.groups.io with SMTP id smtpd.web10.16475.1672594733355858495
 for <openembedded-core@lists.openembedded.org>;
 Sun, 01 Jan 2023 09:38:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=hy18LWdz;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.47, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f47.google.com with SMTP id u4-20020a17090a518400b00223f7eba2c4so26290459pjh.5
        for <openembedded-core@lists.openembedded.org>; Sun, 01 Jan 2023 09:38:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8ttNAoYAS700k7JmS/iTpWtlsOAmxq9viQc6XGMA/AA=;
        b=hy18LWdzn/uIyAwDmSEHkoT0uzKM5Do+W9y99Sdpzpgnw4UGzbW17vAJWErUSp/uDm
         kOQdk7p1xcsUpOk1uzcBs4ymRtl4VJWbZ9oOJTXuGD18cUVr8B6tMBnFNprtsy3eYEDT
         aTEZncBttNHgZjmjPS78puokHqCFEC449btSQIz1GLnz7TDkTxUaLZ2oN4DVLjslb+vn
         2/ElOKqDEK8+qRDd1yX0kOX5gGURkNRPmulRynDB+XAzwWUItWsMUoZFU9G+09c1BXO5
         5b0NWYxr4RaFaAB/O5IEgeL+rT0rSXqu9kvhBJ+XusnRSfrVyXKATZXbCzL//MWR8QPE
         ATJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8ttNAoYAS700k7JmS/iTpWtlsOAmxq9viQc6XGMA/AA=;
        b=C/OPSBrK+jP7Uk180yKoxuIKuWaF4PAsRBfcC/RLJ1oNbFY6Aq/JkCsfZyjrFcwBIE
         xmL0SdUXJZGbSzEwVGgL+vxhUbIWcMeyJY2xLX6fJX3KeXzWse+PwRVrxx47UlCiSBnW
         XLFmOOCgIhhvJHpQGN5u4R+mlYL0rs2D5yzZumU17DIZZ/rwoz1HbirjgI2+9nyShD8Z
         DddioW0VzxewidEtuH1kya7/chPfQfupk2PoEEAbXBQ6OGHrNBx3oUFqA7pYgAT96O6j
         MGwfkjP0RzSNoiC5fmBuhTMHONwNb5xLg22PPEW92Dmf0KyhNuGdAvWZOQeLKjF7hB5N
         mlqA==
X-Gm-Message-State: AFqh2kr1uddZOHR9bnbpoZ/BtfNFkCBAIiUrZqnFsV/RPHqDu7gZOr7t
	/8pGY+TdIi0qcTSyLGaPGEFV3N7kPeM3ZIyxIjk=
X-Google-Smtp-Source: AMrXdXvaK8EDbYhiEWUKULtGmPeJnEa37rKdBGF7QpqbBjGaArXv5J3vj4m7DxLtFTPfHV9OOkRecA==
X-Received: by 2002:a05:6300:8181:b0:a5:6ed:669f with SMTP id bt1-20020a056300818100b000a506ed669fmr63832878pzc.2.1672594732394;
        Sun, 01 Jan 2023 09:38:52 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-5-74.hawaiiantel.net. [72.253.5.74])
        by smtp.gmail.com with ESMTPSA id v63-20020a626142000000b005828071bf7asm102299pfb.22.2023.01.01.09.38.51
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Jan 2023 09:38:51 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 28/29] valgrind: skip the boost_thread test on arm
Date: Sun,  1 Jan 2023 07:37:50 -1000
Message-Id: <5cb16e38e242eeb234c89b0ebc8e04226a732c09.1672594521.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1672594521.git.steve@sakoman.com>
References: <cover.1672594521.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 01 Jan 2023 17:38:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175216

From: Randy MacLeod <randy.macleod@windriver.com>

This test is failing on the arm workers only so skip there until the issue
can be worked on and resolved. The bug #14311 will remain open for tracking.

Signed-off-by: Randy MacLeod <Randy.MacLeod@windriver.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit d98deec9e4aed9e05343d2758f3a3892e2044616)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/valgrind/valgrind/remove-for-aarch64 | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-devtools/valgrind/valgrind/remove-for-aarch64 b/meta/recipes-devtools/valgrind/valgrind/remove-for-aarch64
index a9809e5d8c..4477f39132 100644
--- a/meta/recipes-devtools/valgrind/valgrind/remove-for-aarch64
+++ b/meta/recipes-devtools/valgrind/valgrind/remove-for-aarch64
@@ -1,3 +1,4 @@
+drd/tests/boost_thread
 gdbserver_tests/hgtls
 memcheck/tests/dw4
 memcheck/tests/leak_cpp_interior
-- 
2.25.1


