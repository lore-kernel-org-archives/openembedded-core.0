Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8559AC4167B
	for <webhook@archiver.kernel.org>; Sun, 18 Dec 2022 16:13:39 +0000 (UTC)
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
 by mx.groups.io with SMTP id smtpd.web10.32111.1671380016411414661
 for <openembedded-core@lists.openembedded.org>;
 Sun, 18 Dec 2022 08:13:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=hkTmqZQT;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.51, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f51.google.com with SMTP id n65-20020a17090a2cc700b0021bc5ef7a14so6849009pjd.0
        for <openembedded-core@lists.openembedded.org>; Sun, 18 Dec 2022 08:13:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TbD6nOFTQoVXAufS5UfOqLYnv+8HPDmaT5SQkKptQcc=;
        b=hkTmqZQTLs7GQ8tMwta2f06/TUybRitfO62GIbIo3omz0gZWXGEBpexLYyq4uYnhSo
         MSwXavISbzqqYrzUFyKf7SsrYpBNJ32NYJUhnsGyMg7CWPdoRnQ2c3Lj2yUGfubYhcyb
         2uqCyFszNm5wHjOrjfXfh/cFM6IzucUbZEpZbSPsmUdcUBbq9lOzngwM3S6Nl6A6wDgK
         AEk3YuClcfC5ehlrpVVibbMKGPeRStbenEYLwb7qWziKWy5zemIJZyHonNAIMA05AcNh
         zl9CwKkAr3xVIZFW61hZuHm1OG1fUo5YzMWI5UlL2JxqKD9kgVII0GdR1CHtJfHVB8Qk
         ZiEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TbD6nOFTQoVXAufS5UfOqLYnv+8HPDmaT5SQkKptQcc=;
        b=eSggL8/BpQnj/bVGC2OcSe3DJwW/kVHVFOPQYBZibdcpVjxAA11w7FVORePBnl7W1d
         vf8L1QfzXOOL2YjbrBQNfYWKMBU60PMDT/2xROy6SYicZqSt9hzJ/jnqIqFhVt1ISwbn
         qBbrEakMjsUXsTp4t4OR42i9PFQhKp48fSFffcFH/OVqqpIHzOv0a1yR4t7g11uQAGwd
         VsXUBMfKglBj7TKlL3bigFneMwo7jyoMUaUOxU/lkg0dn5JW3Djvo0C8yhnKI1WT+mKW
         WPAHUlMHSJNOKsJEvfbgNFNSB6BQxYQrjI7aYP45/xy26V601W2I+PpB3yQm3W0GRuaH
         03Jg==
X-Gm-Message-State: AFqh2koC0pfkcMw3iC8/Vh67BKDDkrSs9WEduVDQbGjAyJaV4yj+026p
	kTmpsdihvXSNWskemgTsTceJ5jjGlIY8Rm12UUs=
X-Google-Smtp-Source: AMrXdXvrEx1VLvhVhBvC8YRUoJHeNZmj2K4Z2NJWcbtz2aQhtu/hZaY274teZ4CJrXD8AaID6AYkVg==
X-Received: by 2002:a17:902:eb8f:b0:191:1545:a652 with SMTP id q15-20020a170902eb8f00b001911545a652mr4095669plg.31.1671380015382;
        Sun, 18 Dec 2022 08:13:35 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net. [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id c7-20020a170902d48700b001896522a23bsm5278763plg.39.2022.12.18.08.13.34
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Dec 2022 08:13:35 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 11/19] rm_work: adjust dependency to make do_rm_work_all depend on do_rm_work
Date: Sun, 18 Dec 2022 06:12:55 -1000
Message-Id: <2565fe40514ac17d0c97e847bb9ff0ab90410e53.1671379841.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1671379841.git.steve@sakoman.com>
References: <cover.1671379841.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 18 Dec 2022 16:13:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174798

From: Chen Qi <Qi.Chen@windriver.com>

For now, if we use rm_work and `bitbake core-image-minimal', some
recipes' WORKDIRs are not cleaned up, e.g., makedevs-native.

Adjust the dependency to make do_rm_work_all depend on do_rm_work
to solve this problem.

Below are the detailed explanation of why this would work.

Without this patch, the dependency chain is like:
[other deps] -> [do_rm_work] -+-> [do_build]
                              |
[do_rm_work_all] -------------+

With this patch, the depedency chain is like:
[other deps] -> [do_rm_work] -> [do_rm_work_all] -> [do_build]

Such dependency chain adjustment fixes the issue because do_rm_work_all
now depends on [other deps] and thus the [depends] of these [other deps].
Take core-image-minimal as an example. Before this adjustment,
do_rm_work_all does not have any relationship with do_rootfs, and we have
do_rootfs[depends] += "makedevs-native:do_populate_sysroot ..."
This essentially prevents 'recrdeptask' setting of do_rm_work_all extend
to makedevs-native. With this patch, the do_rm_work_all now depends
on do_rm_work which in turn depends on do_rootfs, and so do_rm_work_all's
recrdeptask could have effect on makedevs-native.

With this patch, all built recipes WORKDIR will be cleaned up with
a few expected exceptions such as kernel and qemu-helper-native.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
(cherry picked from commit b25cc45c9b39f79ba0a03c4556cb2e2431677b4e)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes/rm_work.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/rm_work.bbclass b/meta/classes/rm_work.bbclass
index c2b569903a..8979714e62 100644
--- a/meta/classes/rm_work.bbclass
+++ b/meta/classes/rm_work.bbclass
@@ -174,7 +174,7 @@ python inject_rm_work() {
         # other recipes and thus will typically run much later than completion of
         # work in the recipe itself.
         # In practice, addtask() here merely updates the dependencies.
-        bb.build.addtask('do_rm_work', 'do_build', ' '.join(deps), d)
+        bb.build.addtask('do_rm_work', 'do_rm_work_all do_build', ' '.join(deps), d)
 
     # Always update do_build_without_rm_work dependencies.
     bb.build.addtask('do_build_without_rm_work', '', ' '.join(deps), d)
-- 
2.25.1


