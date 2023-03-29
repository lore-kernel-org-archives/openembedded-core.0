Return-Path: <frederic.martinsons@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E10F5C77B61
	for <webhook@archiver.kernel.org>; Wed, 29 Mar 2023 15:30:56 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.web10.1033.1680103852377466388
 for <openembedded-core@lists.openembedded.org>;
 Wed, 29 Mar 2023 08:30:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=YJXBV3ry;
 spf=pass (domain: gmail.com, ip: 209.85.128.54, mailfrom: frederic.martinsons@gmail.com)
Received: by mail-wm1-f54.google.com with SMTP id n19so9206171wms.0
        for <openembedded-core@lists.openembedded.org>; Wed, 29 Mar 2023 08:30:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680103850;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ol8FfIAHbEw0jNdubbhfpGHjv/EAyiWShTkIPW2gNVQ=;
        b=YJXBV3ry/0beTf+oGH+6qsUJkizW2B6DINY7d3IrC+f5duBFucs2jJET6+iPDCZL5o
         /ceOds0+BqYzjy2UQXbn/JYsttHjWUWWdfCGvNbLLuf7HfnCcPz7aYdscnNygi2TSMJj
         Og3g9BASWd2aW6cTsNgouuiLDR7OVDH9Egs1fPFK4LIgzPKBZez6kBFnWzkYXIv6hqkH
         /3mLezTqySFdEGude0OtuoHI0cWtdcjVc5bKsW9yWH+kE5/nuUFsQ9yVgDSQqw4llp+K
         AXTg9I2jnE09L7IDzrHpIxtqotiC2Q/I1Df4ivD4qqjYsaB7W7eKmlM8QLxrx9crdgYP
         X/NQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680103850;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ol8FfIAHbEw0jNdubbhfpGHjv/EAyiWShTkIPW2gNVQ=;
        b=mTZKfx6QdaJV5hyIcrjfsj2Zt6MDRpiwnWFVBjfxA4YvJ5IPwt9e7gs/jOtEdOmlut
         JGpq+SDslknor+7n6kkAB9KAsengMnqX3j57gI3nV4HuZCkfkDCw8QH/vDjVAjfN7+Zz
         o5vkZQ+kO3GvO7PyogdCUxsJewB4juZACFnB9p44HSr5Xep2ZDkA8/K3M3a/BGTK8YTe
         5mZZvB3ZVYkKMy+7DQVDtO4DEuVu8VqnS/I4Nm66iSH3dVw64sdvjDZoygB718a0vPKF
         nyuK7ZXTjiVlq7LaNceWvkbdb8BduR2RjQvWiQx8Gk9BgVEZGOMrqiHKK3bFvDftdLv+
         ywXw==
X-Gm-Message-State: AAQBX9d9jcoQNj9EayU3c0heDdkJmXplMwfy/uhpL6SRaxDXXAs3cP3d
	XL6GCCrbhNt0q+u08um53WGKr0h66p0=
X-Google-Smtp-Source: AKy350Ze78Y2fHvQv6BWayeA7LWRxfYapq4IHErjucjHFZ8w2glCI9GFS8IZgjuyQPuACPQzdQQTvw==
X-Received: by 2002:a7b:cd93:0:b0:3ed:346d:4534 with SMTP id y19-20020a7bcd93000000b003ed346d4534mr2187805wmj.0.1680103850557;
        Wed, 29 Mar 2023 08:30:50 -0700 (PDT)
Received: from work-pc.core.sigfox.net ([2a01:e0a:8d5:c6c0:f236:1d99:4c31:5762])
        by smtp.gmail.com with ESMTPSA id a13-20020a05600c224d00b003edef091b17sm2607378wmm.37.2023.03.29.08.30.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Mar 2023 08:30:50 -0700 (PDT)
From: frederic.martinsons@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: alex.kiernan@gmail.com
Subject: [PATCH V4 3/5] devtool: add support for multiple git url inside a cargo based recipe
Date: Wed, 29 Mar 2023 17:30:32 +0200
Message-Id: <0e0921c5735b85c6020a3292aec05fcf7947bebd.1680103647.git.frederic.martinsons@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1680103647.git.frederic.martinsons@gmail.com>
References: <cover.1680103647.git.frederic.martinsons@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 29 Mar 2023 15:30:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179288

From: Frederic Martinsons <frederic.martinsons@gmail.com>

Without that, the possible git urls that are in SRC_URI of a recipe
are removed from SRC_URI during devtool process and so the
cargo_common_do_patch_paths in cargo_common.bbclass cannot
patch these packages to fetch them locally.

I use a generic type name because I foresee this change will
be useful for recipe that used a package manager (cargo but also
npm) see https://bugzilla.yoctoproject.org/show_bug.cgi?id=11015

Signed-off-by: Frederic Martinsons <frederic.martinsons@gmail.com>
---
 meta/classes/externalsrc.bbclass | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/meta/classes/externalsrc.bbclass b/meta/classes/externalsrc.bbclass
index 26c5803ee6..b00fdba8e9 100644
--- a/meta/classes/externalsrc.bbclass
+++ b/meta/classes/externalsrc.bbclass
@@ -68,9 +68,7 @@ python () {
         for url in fetch.urls:
             url_data = fetch.ud[url]
             parm = url_data.parm
-            if (url_data.type == 'file' or
-                    url_data.type == 'npmsw' or url_data.type == 'crate' or
-                    'type' in parm and parm['type'] == 'kmeta'):
+            if url_data.type in ['file', 'npmsw', 'crate'] or parm.get('type') in ['kmeta', 'git-dependency']:
                 local_srcuri.append(url)
 
         d.setVar('SRC_URI', ' '.join(local_srcuri))
-- 
2.34.1


