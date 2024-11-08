Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66E6BD5C0E1
	for <webhook@archiver.kernel.org>; Fri,  8 Nov 2024 14:54:15 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.web10.14257.1731077648544238165
 for <openembedded-core@lists.openembedded.org>;
 Fri, 08 Nov 2024 06:54:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=W+F35yIc;
 spf=pass (domain: gmail.com, ip: 209.85.128.47, mailfrom: martin.jansa@gmail.com)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4315abed18aso19593425e9.2
        for <openembedded-core@lists.openembedded.org>; Fri, 08 Nov 2024 06:54:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731077647; x=1731682447; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0HVYRtJMr06beLMNC65Wv4PDB+m41YhTDJC7sIgK5aY=;
        b=W+F35yIcvtOqVOThUviA2ZHfAEFCDRfSd1l3/cn7+NiL+QkWNGcP9E8kzyQ+EbBG1T
         NNuhhyH3YQu6HoVgNEdi3aHaxUo40Lmw1b40MOk/dWyM87y1tJNzsVDYoa4FtE1Qs4jJ
         iL4DQK9n3nvadvhTVI4unD2/+DgWDsYDv+8aoa1pMSXvK34Wv+4pxl6EfhEp8EBt77wj
         ZURgEP4lV/4Nub9q3AQCQAeMjm+ZBJ79Q+8kx/aeLpNZHn/gaT4low+pax5G6WFntMCF
         BrY7EBhoxHaN6Y7XYrykXdnW1x0692Z1Sb8UYaFSzVtjzsOV5u/VK7UbKSL9fPQ7E7Nx
         mFYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731077647; x=1731682447;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0HVYRtJMr06beLMNC65Wv4PDB+m41YhTDJC7sIgK5aY=;
        b=Ec3KiNNyQYiIRU0VvrWRvhStIfLpOYRmqc/xvNCB8X1u51mMWBq8PFl/wS5a7Fwc1C
         wx00PLAXJNPIlxVNLuxS91Y9YMYmPIjPwwzBGlA0c5gXpK1WJ5hKr7QbQ9F1LKuIMO1F
         KV8mDwN9npP727K54nYUtOym54jRFL3OHStUPShRKOSvED3OxOokrPRl7qZki/QBgpAa
         7RoYHTjvZgY9JSfq/sAmMiZSIgPUoTCvKllDlcadRe2aqHI4wlE95AJNwvJCSViCc6A8
         ZmG7R0kNyQKsobq8BRY9YXCMSNKQ+ZlMNg3HWQHsZllRhUgMNhWrVv1sffity+rLSrPT
         4r/w==
X-Gm-Message-State: AOJu0YwMPP7DAKiAh6C45Bv3hBrOR1u5sp3yFPvaehuUkdqAq6U01yvd
	j7vFpvspyT/Feoc0IVO1mdvFLAeYYI98k3xnuVAUh4nasdTvfh3ssmjo0A==
X-Google-Smtp-Source: AGHT+IFLwHeeJFuMRHb7A5ghJNmT+30yUNijyFrtR6jKRsYsUqX8VChpqSRJN3nUFh8w6oBL0NXn+w==
X-Received: by 2002:a05:600c:1909:b0:431:4a5a:f09a with SMTP id 5b1f17b1804b1-432b7518cbemr24975595e9.24.1731077646754;
        Fri, 08 Nov 2024 06:54:06 -0800 (PST)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-432aa6b35c0sm113108535e9.16.2024.11.08.06.54.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Nov 2024 06:54:06 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: steve@sakoman.com,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>
Subject: [kirkstone][PATCH 03/12] pseudo: Switch back to the master branch
Date: Fri,  8 Nov 2024 15:53:27 +0100
Message-ID: <20241108145336.224466-3-martin.jansa@gmail.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241108145336.224466-1-martin.jansa@gmail.com>
References: <20241108145336.224466-1-martin.jansa@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 08 Nov 2024 14:54:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206877

From: Richard Purdie <richard.purdie@linuxfoundation.org>

OE is the main user of pseudo and we've had the changes in the oe-core branch
around long enough that we're going to run with them. Swicth back to directly
using the master branch.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
[Luca: re-add 'branch' parameter to fix "does not set any branch parameter" warning]
Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-devtools/pseudo/pseudo_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/pseudo/pseudo_git.bb b/meta/recipes-devtools/pseudo/pseudo_git.bb
index 00af809689..f40ad9f6f1 100644
--- a/meta/recipes-devtools/pseudo/pseudo_git.bb
+++ b/meta/recipes-devtools/pseudo/pseudo_git.bb
@@ -1,6 +1,6 @@
 require pseudo.inc
 
-SRC_URI = "git://git.yoctoproject.org/pseudo;branch=oe-core \
+SRC_URI = "git://git.yoctoproject.org/pseudo;branch=master \
            file://0001-configure-Prune-PIE-flags.patch \
            file://glibc238.patch \
            file://fallback-passwd \
-- 
2.47.0


