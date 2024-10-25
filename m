Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 974B3D149E7
	for <webhook@archiver.kernel.org>; Fri, 25 Oct 2024 18:30:02 +0000 (UTC)
Received: from mail-il1-f179.google.com (mail-il1-f179.google.com [209.85.166.179])
 by mx.groups.io with SMTP id smtpd.web11.2621.1729880993630017691
 for <openembedded-core@lists.openembedded.org>;
 Fri, 25 Oct 2024 11:29:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=ljPOKWuV;
 spf=softfail (domain: sakoman.com, ip: 209.85.166.179, mailfrom: steve@sakoman.com)
Received: by mail-il1-f179.google.com with SMTP id e9e14a558f8ab-3a3b7442db5so8875085ab.2
        for <openembedded-core@lists.openembedded.org>; Fri, 25 Oct 2024 11:29:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1729880993; x=1730485793; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9L8J+ceZT2H6hS2+D0U+Ztx1G/TI6nqpFSAvrWZPKrY=;
        b=ljPOKWuVFijjLgXkdmJpahaLHTi7F6ExOB5qj6FPpcKAaf4fjIOka6zJbgxaaJ5Qci
         QjLOMZg1Q4IvlU97yg+fK6CM0D+mPOjrwQSSD6g0oA/XwvAs1whmjOa5QfW6anLNdGyO
         s/SkKL8JXeKBkLYorIipWXgVchyFzlMD9Pejv9s5WVVXhZbrOfP3SWGcGrOYTWFI+H1t
         HXnvGcqlLIdWXt1loiXoPmLVro0G2BEim9M+h/lW4mTEhhb5vEqg2XV1Eynq9d8qu+8P
         3UfsbfubAJixenX7kiAnk1V7v8k2XzRwegnMLJ+vOtlF/3unOPggobq93gWSnidm9Ihl
         lqaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729880993; x=1730485793;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9L8J+ceZT2H6hS2+D0U+Ztx1G/TI6nqpFSAvrWZPKrY=;
        b=jfceIwcjIS74aR1vk7wvNkH2HlUj9cswR1Y8GXIyX2BET9FsO5iHVlHPBC2ElperES
         a6ZLBuUVE1vmJIKxOJHWoinHC75tb02EcwAPfHPRE5t3hRng8acGOil4xOzDVkM941x/
         B1//MOLub3BLR5O0wZ2tTeyy1fE6ydbITcrjd18gzzWh9tpFuJlPdTC+UxeqRzV6yNF5
         YCizQbn+/2farezZm+e+scYg+wDCQfVER5f6ClYDM/R7hReytgTMNzwQpRWqyoX7BTkk
         r9a4o248v0GeAc44FMqsP1fazooVo4spnynANeajysU/UVOAClC8ChmuISXTQqQ/B4I5
         TaIw==
X-Gm-Message-State: AOJu0Yze4Gf9Qd2dWhmuf6qvuqQFwVoPn5e9eoCxFMB3RpdmUZOteBDT
	xQsgmJ6uOgUd3qbleLdPqKUGTSh/f5Qz2WTz7JFm2WtkUHQlb7Mf40bdIqdJUyphH/E7v92UWsU
	b
X-Google-Smtp-Source: AGHT+IG8w2HKS/Uc39K7ftPQsB523wG6ummL0odc6KvXdRMjcLa0u3ijsJjvRfd9Jy1d5uFGGkTwyw==
X-Received: by 2002:a05:6e02:1d17:b0:3a4:e8f3:dccd with SMTP id e9e14a558f8ab-3a4ed2f4ae2mr1956955ab.18.1729880991309;
        Fri, 25 Oct 2024 11:29:51 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:7a51:eecd:55a5:9cd2])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7edc8a4780esm1394972a12.86.2024.10.25.11.29.50
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Oct 2024 11:29:51 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 08/11] liba52: fix do_fetch error
Date: Fri, 25 Oct 2024 11:29:27 -0700
Message-Id: <2a95bb8acf3f212ceb5347bade00a7bdbc525022.1729880682.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1729880682.git.steve@sakoman.com>
References: <cover.1729880682.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 25 Oct 2024 18:30:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206369

From: Jiaying Song <jiaying.song.cn@windriver.com>

Change the SRC_URI to the correct value due to the following error:

WARNING: liba52-0.7.4-r0.vr2401 do_fetch: Failed to fetch URL http://liba52.sourceforge.net/files/a52dec-0.7.4.tar.gz, attempting MIRRORS if available

Signed-off-by: Jiaying Song <jiaying.song.cn@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-multimedia/liba52/liba52_0.7.4.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-multimedia/liba52/liba52_0.7.4.bb b/meta/recipes-multimedia/liba52/liba52_0.7.4.bb
index 7a3b4a43c8..0aee0f022f 100644
--- a/meta/recipes-multimedia/liba52/liba52_0.7.4.bb
+++ b/meta/recipes-multimedia/liba52/liba52_0.7.4.bb
@@ -10,7 +10,7 @@ SECTION = "libs"
 
 inherit autotools
 
-SRC_URI = "http://liba52.sourceforge.net/files/a52dec-${PV}.tar.gz \
+SRC_URI = "https://downloads.yoctoproject.org/mirror/sources/a52dec-${PV}.tar.gz \
            file://buildcleanup.patch"
 
 SRC_URI[md5sum] = "caa9f5bc44232dc8aeea773fea56be80"
-- 
2.34.1


