Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D738C433EF
	for <webhook@archiver.kernel.org>; Mon, 18 Jul 2022 00:32:08 +0000 (UTC)
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com
 [209.85.216.41])
 by mx.groups.io with SMTP id smtpd.web12.21880.1658104323044016070
 for <openembedded-core@lists.openembedded.org>;
 Sun, 17 Jul 2022 17:32:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=ljl6s1Vh;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.41,
 mailfrom: steve@sakoman.com)
Received: by mail-pj1-f41.google.com with SMTP id
 q5-20020a17090a304500b001efcc885cc4so11114913pjl.4
        for <openembedded-core@lists.openembedded.org>;
 Sun, 17 Jul 2022 17:32:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=4dhPJDOJV/VDKDc0zjAO3ADTjmgmQzZIZR6lTDX1OHE=;
        b=ljl6s1VhhesX4SJsEHxr2AXRusp0NgGQyOe7OUySjUSxem+t7foB2xt0sLf1/KaViv
         KWli1U0IMMtX0VazW6mcPC+wCGqRehyZkymzSFVk36vfLZKQyT8qlfqnyP6OSnTFhOAC
         5KbO/zWEnYsNbTChKGIfyhqldfAF3UeLyZf4auqoUX15J6AK2Ya5fNCX3xnOVI3VkZO7
         i36Eon4yFq88Kr8j3tFVUVgo8j/pK5abFyPRdy9lg57jgp6xLz0pomqowudqrHIrhRgR
         vnnPMXpz8HaeET0OUf+YZZZBBkNBf68/Ijg4UJ8whvyw8Ja3eVRpxB844PbbYu0lRUQI
         H8gQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=4dhPJDOJV/VDKDc0zjAO3ADTjmgmQzZIZR6lTDX1OHE=;
        b=eDXAGSFtaZ9DuU4y4ycB3dG5Qkl2HMjMHJfh5z6DzyOfFWAxPVC6oCu+A7PQs/w9gI
         moDKOx7qacfjJPGbQBWQOHQOuhJa4AU3M4GD1EYuSIYHrHw+b/KPMBXBbE1J2WKWlmNF
         JcktECt+QvnPOQom6/aROVdqWN4jB09Dq5eh5I3Qd/bKLYMSv1SrncXAUgtJ1I7EWFbc
         wL3wQ00mhgbg1B3YMzDZioNjcZJGnlCLQ1gMVl5/rPiNMdiYfdghOJrKWQJ+zJol+TUm
         5uGwm/j79c9wsUixUAcA2YPF5dnpE4Az/KlnFncwe0z8FqW9sI+S/6o6C8CvkjkozyDa
         E16w==
X-Gm-Message-State: AJIora8qzT5mkruajcswUigZ+hwuonM4nb1kuBrcr11iRvlXM8bV4T++
	Ky8iUHFsulGGDUaAt41XXGXUZMEw8biKSu6x
X-Google-Smtp-Source: 
 AGRyM1sMkIDC/VJrEUyDMIM2ZhGRHd0n12gOzDclxQiBPK/cvmEvqNt+rH6yG6Tbx7OhHEaXP13vzA==
X-Received: by 2002:a17:90b:3e83:b0:1f0:4233:b222 with SMTP id
 rj3-20020a17090b3e8300b001f04233b222mr35490609pjb.218.1658104322006;
        Sun, 17 Jul 2022 17:32:02 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 s30-20020a17090a2f2100b001ef831a2015sm9958183pjd.22.2022.07.17.17.32.00
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Jul 2022 17:32:00 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 19/23] kernel-devsrc: fix reproducibility and
 buildpaths QA warning
Date: Sun, 17 Jul 2022 14:30:20 -1000
Message-Id: 
 <ff5b50458a7018c157df9b5f039d80434b0e6e24.1658093505.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1658093505.git.steve@sakoman.com>
References: <cover.1658093505.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 18 Jul 2022 00:32:08 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168184

From: Bruce Ashfield <bruce.ashfield@gmail.com>

We've been removing .vdso-offsets.h.cmd for quite some time, as it
is not required to regenerate scripts or to satisfy the prepare
target in the kernel source.

That being said, there is a secondary location that this file may
be found, and since we aren't detecting or removing it, we end up
with embedded build paths, which cause both reproducibility and
buildpaths QA warnings.

We can test for both files, and force remove them if present, and
we'll fix this new location of the file and not risk breaking
any old kernels.

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit e0a9433685397b716920fa9ad5d5a7be95c496f7)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-kernel/linux/kernel-devsrc.bb | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-kernel/linux/kernel-devsrc.bb b/meta/recipes-kernel/linux/kernel-devsrc.bb
index 9654488a54..ee5d8d9ab0 100644
--- a/meta/recipes-kernel/linux/kernel-devsrc.bb
+++ b/meta/recipes-kernel/linux/kernel-devsrc.bb
@@ -128,8 +128,10 @@ do_install() {
 	# breaks workflows.
 	cp -a --parents include/generated/autoconf.h $kerneldir/build 2>/dev/null || :
 
-	if [ -e $kerneldir/include/generated/.vdso-offsets.h.cmd ]; then
-	    rm $kerneldir/include/generated/.vdso-offsets.h.cmd
+	if [ -e $kerneldir/include/generated/.vdso-offsets.h.cmd ] ||
+	     [ -e $kerneldir/build/include/generated/.vdso-offsets.h.cmd ]; then
+	    rm -f $kerneldir/include/generated/.vdso-offsets.h.cmd
+	    rm -f $kerneldir/build/include/generated/.vdso-offsets.h.cmd
 	fi
     )
 
-- 
2.25.1


