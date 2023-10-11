Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 38487CD98CC
	for <webhook@archiver.kernel.org>; Wed, 11 Oct 2023 00:02:17 +0000 (UTC)
Received: from mail-oo1-f52.google.com (mail-oo1-f52.google.com [209.85.161.52])
 by mx.groups.io with SMTP id smtpd.web10.5126.1696982529166257752
 for <openembedded-core@lists.openembedded.org>;
 Tue, 10 Oct 2023 17:02:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=vaQIoqkD;
 spf=softfail (domain: sakoman.com, ip: 209.85.161.52, mailfrom: steve@sakoman.com)
Received: by mail-oo1-f52.google.com with SMTP id 006d021491bc7-57bab4e9e1aso3757932eaf.3
        for <openembedded-core@lists.openembedded.org>; Tue, 10 Oct 2023 17:02:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1696982528; x=1697587328; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aHwHuE4psNZIeB1/wIElhYaJ/V9neSBht5nTmRmFK58=;
        b=vaQIoqkD+YlYih3Ec3RAOhaNxNTYh4bUizLTgAL0D6TPjfHwR3XAddO0iXZQZ65YL/
         f4vWxaxg30b41XBCs+RVUpFRldUyxsoPo2nKEEnOId/ZF5OgcSdiZ9QGn0YRzZR5hKla
         oOpYvu2w4of4VN+2aAzYA5ORxiVqt/Zz3SbiYHkCMW1tYEDxbvZtDRoDRbRt5DocvCCH
         QphhXtA+ocjrEiWK1xmdeTjrbgERXUv5Id4GG7OTpeV5XkcmztnBE1CatEGVcyKD36Nb
         HyacL9WxQ0IAs96tvVtxz1P6IVuDR+eHZZenJ3gFmOp39l3tRFNl/RPuNh0arDCOGfeY
         MxBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696982528; x=1697587328;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aHwHuE4psNZIeB1/wIElhYaJ/V9neSBht5nTmRmFK58=;
        b=t7VjxUeOAu1iqoKZFSBLjPpTKlh98sQEdJza+rjloccehoQfZLUsq1hMiK/oy1vD+T
         V69mgujuduOmcLguX15aJV7fZUks2rUYdzj45OuMoh1ChVeQzqXI6PMazHB8Wi+cMFb1
         uMgaKvTIe0zAad9Gi+9KlZf4Ipzb54y7VjpbJxp2lN39xo5+DFu4PQN7bKGlkCTT/Db2
         s79T3YFGdY1zpW+KkAswi2kra5KY6C2VVpw7Jr2TE8JmhPfgzwIhWdG1WX2anboP8gez
         AHp2VtEyAred1c64/+D1BakCujXisj4PQkprNMtOiFfX211tyToDqPZAnZ8MtJ8aITQn
         DEQA==
X-Gm-Message-State: AOJu0YxFOnk+RJfJZBaBadZWBBLM6Qgp1sNHi9uKMFRpfMcbKu56XIBP
	FAZAUnptUs/pEuJO+PtkAq9YoV0wpUn8Rs65DSA=
X-Google-Smtp-Source: AGHT+IGYYDGIu3RTN8fWpGwY+RTJDOxs8xOJ4j82YUgneSUU/+Ohwi+8yCGj5jByRstvIOMtIo+wGQ==
X-Received: by 2002:a05:6358:9218:b0:142:fd2b:d30c with SMTP id d24-20020a056358921800b00142fd2bd30cmr22937485rwb.23.1696982526608;
        Tue, 10 Oct 2023 17:02:06 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id a9-20020a63bd09000000b005891f3af36asm10758222pgf.87.2023.10.10.17.02.05
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Oct 2023 17:02:06 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][mickledore 11/20] pango: explictly enable/disable libthai
Date: Tue, 10 Oct 2023 14:01:24 -1000
Message-Id: <dc939fbc70c124a515b882b3425d7810be0c6748.1696982312.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1696982312.git.steve@sakoman.com>
References: <cover.1696982312.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 11 Oct 2023 00:02:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188929

From: Ross Burton <ross.burton@arm.com>

Pango has had an explicit option since 1.46.2

Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 42755f135d2d015e564d783996fbb3ef860f2bf7)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-graphics/pango/pango_1.50.14.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/pango/pango_1.50.14.bb b/meta/recipes-graphics/pango/pango_1.50.14.bb
index ec7a913009..b254caca50 100644
--- a/meta/recipes-graphics/pango/pango_1.50.14.bb
+++ b/meta/recipes-graphics/pango/pango_1.50.14.bb
@@ -33,7 +33,7 @@ PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'x11', d)} \
 
 PACKAGECONFIG[x11] = ",,virtual/libx11 libxft"
 PACKAGECONFIG[tests] = "-Dinstall-tests=true, -Dinstall-tests=false"
-PACKAGECONFIG[thai] = ",,libthai"
+PACKAGECONFIG[thai] = "-Dlibthai=enabled,-Dlibthai=disabled,libthai"
 
 GIR_MESON_OPTION = 'introspection'
 
-- 
2.34.1


