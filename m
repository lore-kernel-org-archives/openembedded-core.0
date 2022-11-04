Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A0722C43219
	for <webhook@archiver.kernel.org>; Fri,  4 Nov 2022 03:02:17 +0000 (UTC)
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
 by mx.groups.io with SMTP id smtpd.web12.7137.1667530932474349484
 for <openembedded-core@lists.openembedded.org>;
 Thu, 03 Nov 2022 20:02:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=GkqZ3aHD;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.181, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f181.google.com with SMTP id g129so3301216pgc.7
        for <openembedded-core@lists.openembedded.org>; Thu, 03 Nov 2022 20:02:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UzjnBIpXMH9mCcaD11XUV2ZBCzRgM0GYqdTxHBduhp4=;
        b=GkqZ3aHDmasqCxB6qhhnGLJc8Yg/xqx7mRqhytEsw8AfvQYN6noDhOrgBV10q6XD6h
         OAJKKVYddM/IK2Cn85bqsCBVp0u9Ae7ZLywKyUmbaB5jqaSOs0gPye5gYlbzejM6A1Et
         No14TFGaZygzoSezU+rLye9Cz9v0shQmaZ6RsdWsEYCvzt55fc55qJ5er/ye18JF3ln/
         0Ys/Mw/uKte2A8KALYQyaXam9OOALOKXpqqT6tsY791YDUiAlm4MWR+pvka1v7dIZRbX
         6i3u9mrTzZXU8q+Xm946q0ONKANiO0z+nDYA8NGAJ4x1ACuKLaRhMWkaFdAruboiwgUj
         tAhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UzjnBIpXMH9mCcaD11XUV2ZBCzRgM0GYqdTxHBduhp4=;
        b=sf9fL/b9KHdE0l8ntatgy/3Jdljd1GGiUu+Xt34gKfhKvhC9hEcSNX72HGOypkx3JN
         2trJ1sY8vMN5N7rsNzfsm1ddnKyeWplSL3NQ+1lLRL+/APp4CBOux8CNUPYsXVsBguq2
         pqvXelTl9E0i1MTRLV9Qb7IaWlDlmgHjW+PqD3Nt8SfGPQcjIdRwAP0dH/unERQKFC9u
         EeWQSOv7OsVRlxLvB2xxOdo/U2Thc3YhH3cz5dkDvVhgXWRs2M2jEKrLL473zFx4SRk5
         yvG1ZHehVb3qvXS/tpu6PuPq9dewyJ4fVlFeWVi//EXyVlyy7IIYRlAmiTMlJE13XkXW
         noDA==
X-Gm-Message-State: ACrzQf1kFSXM/6MASU7hJjdUDjqzcy1g8VL2qAlvIz9IM6SkdJP6n7SS
	e9bsZeSMPT4KdOXlx5AK5r0LeiDuejvpTQIj
X-Google-Smtp-Source: AMsMyM66vHbWnLm69u7C+Z/JfkWwQV0FDogIEshiWPGXCujZvRGixKbkyiXzzxAAoEBNBbE7JDh58g==
X-Received: by 2002:a62:d412:0:b0:56c:6f25:8b12 with SMTP id a18-20020a62d412000000b0056c6f258b12mr33254124pfh.60.1667530931576;
        Thu, 03 Nov 2022 20:02:11 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net. [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id r7-20020a17090a454700b0020b7de675a4sm667902pjm.41.2022.11.03.20.02.10
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Nov 2022 20:02:11 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 27/31] runqemu: Fix gl-es argument from causing other arguments to be ignored
Date: Thu,  3 Nov 2022 17:01:02 -1000
Message-Id: <5b6418afb2b9a227a42e533a5002bb9b6d27bfd2.1667530733.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1667530733.git.steve@sakoman.com>
References: <cover.1667530733.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 04 Nov 2022 03:02:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172688

From: Joshua Watt <JPEWhacker@gmail.com>

The code to parse arguments was inadvertently skipping all arguments in
the elif block after gl-es if it was specified on the command line.

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
(cherry picked from commit 718bb8d56f6a24c86e67830a7d13af54df2ebb4e)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
(cherry picked from commit dd1dcfada1fa46ecb8227c2852769b35026875d3)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 scripts/runqemu | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/runqemu b/scripts/runqemu
index 1d63281382..0cce8bb96a 100755
--- a/scripts/runqemu
+++ b/scripts/runqemu
@@ -499,7 +499,7 @@ class BaseConfig(object):
                 self.gtk = True
             elif arg == 'gl':
                 self.gl = True
-            elif 'gl-es' in sys.argv[1:]:
+            elif arg == 'gl-es':
                 self.gl_es = True
             elif arg == 'egl-headless':
                 self.egl_headless = True
-- 
2.25.1


