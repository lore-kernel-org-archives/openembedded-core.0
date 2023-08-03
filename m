Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EAD8FC001DF
	for <webhook@archiver.kernel.org>; Thu,  3 Aug 2023 01:01:44 +0000 (UTC)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.web10.4495.1691024502585086139
 for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Aug 2023 18:01:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=YOpebHtP;
 spf=pass (domain: gmail.com, ip: 209.85.221.43, mailfrom: martin.jansa@gmail.com)
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-3175d5ca8dbso335364f8f.2
        for <openembedded-core@lists.openembedded.org>; Wed, 02 Aug 2023 18:01:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691024501; x=1691629301;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=P9G0hokPBw/i6h7tK5x82lDjEjHw5r2dj0ezWpyg9ds=;
        b=YOpebHtPRsku2dnxYy2Qgys79h0ualwqVDjJhNV4onavETADLO8pgIiEaEPebLYEy/
         bwrVYET3fjdnj++V52VzysMN/iaa0YmxC1iWnYRCFXHf2xqP0Cc/ZKiMQw3KV1vHjZFv
         qa23LskwkOaTLhM3gfdTOVoWaQYOGwUwiTL0Bx4vvh9cYF6GHPidSj9ejui0Z/eorfTz
         0UB8NdvJHI4SSr3rgn0v5bSr9Bpv4Ghjy2ZX1EXZR9gvuDIJv+QwG5xpx/QxDD3SN+BD
         0aEtTG6NScd9DSSaxXL1aeMv8Dxq/+lfXLirhd4nMSmkzxjvwqvXOUVS0YJxRRHphHmF
         6H4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691024501; x=1691629301;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=P9G0hokPBw/i6h7tK5x82lDjEjHw5r2dj0ezWpyg9ds=;
        b=PYCftSaS7Us1DokR6kdrBixbKOLONzVHT0bnGZsmJ9x/Y4LM75NSBNRpVClKQKmPlW
         mPVsOT3i92xIMm05jf1Q8oEIQfZhk44Ho41ksX+xS27BllToZdNja0dkR//Gz5cibdty
         eUZzZCn3/0nq49otM70MWb3JMItoJJAgXehfXiAaTlwA7nyM6ZdMSHqvJw6h42wBdBhZ
         C7xErNFucWWwkla5GnljBHv6dmad8NO/LpBI6F3oOJmyEWoU22CyUQpstD50skTg6Msc
         hWkxMqhj/CUWsxloCgTLMWB4cFDawxWACbh8gP/fmq7ufdZkfdgBupMlwoCQ2KcSKxZb
         IPRg==
X-Gm-Message-State: ABy/qLaqFjGe3dx7Jqatpk4kQFt0YVjhW9mud8ZPY1LtUS5ehllg1g1d
	TEvrkV/B26x3W3k3f0hDq7mL5HSM3BU=
X-Google-Smtp-Source: APBJJlHv5xWC0fpndkHF125dfuCgxyq7mB9S6JM3+LmpxGgZ6Ewqint7oRiYtT8IMcCvO8IbbvXufg==
X-Received: by 2002:adf:f6c6:0:b0:317:5cfb:714c with SMTP id y6-20020adff6c6000000b003175cfb714cmr5566437wrp.25.1691024500504;
        Wed, 02 Aug 2023 18:01:40 -0700 (PDT)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id a10-20020a5d508a000000b0031773e3cf46sm20384286wrt.61.2023.08.02.18.01.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Aug 2023 18:01:40 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: steve@sakoman.com,
	Martin Jansa <Martin.Jansa@gmail.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [kirkstone][PATCH] npm.bbclass: avoid DeprecationWarning with new python
Date: Thu,  3 Aug 2023 03:01:30 +0200
Message-ID: <20230803010130.2280328-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 03 Aug 2023 01:01:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185446

meta/classes-recipe/npm.bbclass:85: DeprecationWarning: invalid escape sequence '\.'
  '--transform', 's,^\./,package/,',

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/npm.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/npm.bbclass b/meta/classes/npm.bbclass
index 8379c7b988..45e6b4fac7 100644
--- a/meta/classes/npm.bbclass
+++ b/meta/classes/npm.bbclass
@@ -82,7 +82,7 @@ def npm_pack(env, srcdir, workdir):
     subprocess.run(['tar', 'czf', tarball,
                     '--exclude', './node-modules',
                     '--exclude-vcs',
-                    '--transform', 's,^\./,package/,',
+                    '--transform', r's,^\./,package/,',
                     '--mtime', '1985-10-26T08:15:00.000Z',
                     '.'],
                    check = True, cwd = srcdir)
-- 
2.41.0


