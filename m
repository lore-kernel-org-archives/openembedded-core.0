Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4AFB8C35FFA
	for <webhook@archiver.kernel.org>; Wed, 19 Mar 2025 12:44:51 +0000 (UTC)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.web10.6981.1742388289560196915
 for <openembedded-core@lists.openembedded.org>;
 Wed, 19 Mar 2025 05:44:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=gmaq6ER5;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.47, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-39143200ddaso4308526f8f.1
        for <openembedded-core@lists.openembedded.org>; Wed, 19 Mar 2025 05:44:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1742388287; x=1742993087; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=aEB+K1GHNKvbl4SXwX8f82/TVH/h3U0re0mCH4HMoYA=;
        b=gmaq6ER5Gz1jSF6ac0RXIBuXaR6iWoN/9+3my3CY5lW1gV48WQX/DRx4VnV5GZjx3v
         DgZz7zpQsJcZMsYJlvRC0nsGuuHxGkLPcdWB849d1udaiazW8pJhPo7/bS7ZkdUux5ZB
         uPtnI+klZLV0VfBJeu3OC63PMrYJtnJYrjSSo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742388287; x=1742993087;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=aEB+K1GHNKvbl4SXwX8f82/TVH/h3U0re0mCH4HMoYA=;
        b=ubKP2qjU6kXyCXxEiuVYg2AjASZjv3rqZYfw0/EfHUnNyGIBmGuR/rXHR2jxzqVx0T
         3mlBjLT4C/V6LR5zDU4ef0HreR9/6UpCYtkJRhzxMi1BwDlEafcGJ55p38VUy3UZdc0G
         sOAaXxLB/HdboOGOHzP3axcgdR+TaFpK6T9FAF4MHidpCr3GT4PcAdAepBw52RHw3v7D
         RHHrKCJxRbVosuDdkgzjnzoFm+5yuIb77eERWo+l/i9wDPSQcxO2o/FLR9TDf/O9gB/a
         kODehPlererJUceLWebs6qgDhH7E74zjYhFY0XEzHNnXAnxRWvycGvTvEKHEGGs78r5p
         4S8A==
X-Gm-Message-State: AOJu0YxWnabCmjEJVX5274Q4ka1Bl9zDs+lHgppVwBUhcbr7Ma+MAj5L
	eqCiSbfBwBJkr2N8PP08Lzt/T5wNsjtLpDI6H6xR2N6yL4Hk7pL2ZfNoXKvL4MmXi6AXRK9iE8j
	U
X-Gm-Gg: ASbGnctijGfO5yKV86C1uCNd0iWohVTGY8uXA634RnLg1EW3FhyGRog4LLZSDdbr0eW
	3OY0Fm8TP1I/MLlZ/7ffYlAvpro6Y0FaNL8VKnRTQ9QbnNcd0l2kYGge3tlLFcP2Z/i5bDFfLys
	72RlOS1WJ23jt4AxL6GXsKd+ydbO8hOabwxhisdwP7Ry5MnLgKWZJO1ScoytMb8e6QRhyO+RXZ/
	nv/PtQOveK2Kz6XQ9lGd64suwpA6NoExmZerj6qT61qe+A84+Q2qBz8rTIkGL4B50NbS56RlIA1
	oaGjO9i5mmtaZhnOTd9RsobINt4nXW+Z4BH+W42Vo89yuEPHO1fZVHnOlgpLU9t/KYZwU1XW
X-Google-Smtp-Source: AGHT+IH4xp1C5cAv4Q04sVnA8iTsTSlVg/ZFAAcD0cj/bezfmOJ9ZIbIl3qR1Lfu0q43H/s0eAJgeA==
X-Received: by 2002:a05:6000:1f8d:b0:391:ab2:9e80 with SMTP id ffacd0b85a97d-399739c8693mr2034633f8f.24.1742388287565;
        Wed, 19 Mar 2025 05:44:47 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:dad:b471:9c34:4577])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-395cb40cd78sm20902669f8f.78.2025.03.19.05.44.46
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Mar 2025 05:44:46 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] psplash: Fix build with GCC 15
Date: Wed, 19 Mar 2025 12:44:45 +0000
Message-ID: <20250319124445.644213-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 19 Mar 2025 12:44:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213328

Pull in upstream changes for fix the build with gcc 15 and README tweaks.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-core/psplash/psplash_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/psplash/psplash_git.bb b/meta/recipes-core/psplash/psplash_git.bb
index 233c07a380c..712fff7bd0d 100644
--- a/meta/recipes-core/psplash/psplash_git.bb
+++ b/meta/recipes-core/psplash/psplash_git.bb
@@ -6,7 +6,7 @@ LICENSE = "GPL-2.0-or-later"
 LIC_FILES_CHKSUM = "file://psplash.h;beginline=1;endline=8;md5=8f232c1e95929eacab37f00900580224"
 DEPENDS = "gdk-pixbuf-native"
 
-SRCREV = "5a32cf6392c784a7ae1983a354cf07b024625cd2"
+SRCREV = "1f64c654129fdb6a1b75d8c16e3bcdd986468083"
 PV = "0.1+git"
 
 SRC_URI = "git://git.yoctoproject.org/${BPN};branch=master;protocol=https \

