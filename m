Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B224C433EF
	for <webhook@archiver.kernel.org>; Thu,  2 Dec 2021 22:05:27 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com
 [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.web09.3759.1638482725890708869
 for <openembedded-core@lists.openembedded.org>;
 Thu, 02 Dec 2021 14:05:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=nkCpUprJ;
 spf=pass (domain: gmail.com, ip: 209.85.128.49,
 mailfrom: quaresma.jose@gmail.com)
Received: by mail-wm1-f49.google.com with SMTP id i12so860637wmq.4
        for <openembedded-core@lists.openembedded.org>;
 Thu, 02 Dec 2021 14:05:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=K5Fn6Us2tfwPUL3gdxXX5jn+oFM6YE5YCgWtkfwv02k=;
        b=nkCpUprJait2vwW/dlP1jmX9yulrV05lA1GmDeDh2pYPevQVdv/wCRlQyFOpUHGLhm
         vQ2HX9GcOYgVNtgXjj4bY88XhXvJkMxn0gaSDg6z59jjP14zRS9XHJw9kUmZfod6vhRl
         HMo7au9gqsO2dDvQjBEJeDArCQiS0cunMm5jFdiegXCirMN5X8mi8BNvHJYxCaj+ODjt
         C3BY03QkWNZRChUA+bDJgQ4swBvlTdtpgq/TbuyR4qD7CNwywHHBKTvcQBhS51cQBHkh
         J1teuf2t/aDhsGv7FsAnEc78VrGlQV3IuG2D/xlGDJxHfe/yK28hlJjVos1we301Lbwr
         WgaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=K5Fn6Us2tfwPUL3gdxXX5jn+oFM6YE5YCgWtkfwv02k=;
        b=QDWhBFgJALN3XTKIun+GTskRD0tCDLZi+fvHofO0Xs9a/ks1BT9CYIAJivaZSqhnRS
         jtgRCJCZWSS/UfhIKgyXh6/Ykrlg9fmpSzBFW07hvD3zjMdUErW+gKMFtIz7mOXkX9yX
         QJ+es0hNToMHV9UxbYOYNTlqyFMLfhxJaf+bYP3hnUjXqA5K48rKlEANv1DcJwJz4v2Y
         x3i78S7Q7PIsNLDC/MaioP9xH47TRw/gIdDd0ptsCZwLML8AOu6RLKVFdfdt/MFkptKL
         yZ+XCR4F5j4XKgzuBcrF4YDGHEcgD4DmVkpfvlZ7IFGBnpXnLedRC33C83xPcZ6tJ7jX
         fRwQ==
X-Gm-Message-State: AOAM533Drjc4jOLQ11/ntrkLeZFANz33JYS6XOCdrkc+MygDQAGoaOAW
	T2+fWTS8YIomdUoo098lcAxhbi5/IKk=
X-Google-Smtp-Source: 
 ABdhPJxGVErlN8Tg/+zHYkJX/L29twV33Buf5AnW04ZwByohjMbizFtgXPf+ft9luPBId8Xa3aHwZA==
X-Received: by 2002:a7b:c2a1:: with SMTP id c1mr9507906wmk.112.1638482723927;
        Thu, 02 Dec 2021 14:05:23 -0800 (PST)
Received: from CTW-01195.lan (176.57.115.89.rev.vodafone.pt. [89.115.57.176])
        by smtp.gmail.com with ESMTPSA id
 a10sm3389764wmq.27.2021.12.02.14.05.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Dec 2021 14:05:23 -0800 (PST)
From: Jose Quaresma <quaresma.jose@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Jose Quaresma <quaresma.jose@gmail.com>
Subject: [PATCH 1/2] sstate: don't limit the thread pool size when checking
 mirrors
Date: Thu,  2 Dec 2021 22:05:16 +0000
Message-Id: <20211202220517.2106590-1-quaresma.jose@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 02 Dec 2021 22:05:27 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159106

This improves the time needed to check the mirrors,
reducing it from 50s to 8s when building the core-image-minimal
using the yocto upstream sstate and hashequivlance servers
on a machine with 8 cpu cores.

Tested with:

 SSTATE_MIRRORS = "file://.* http://sstate.yoctoproject.org/dev/PATH;downloadfilename=PATH"
 BB_HASHSERVE_UPSTREAM = "typhoon.yocto.io:8687"
 bitbake core-image-minimal

Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
---
 meta/classes/sstate.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/sstate.bbclass b/meta/classes/sstate.bbclass
index 0326d27c74..5e404d7cd8 100644
--- a/meta/classes/sstate.bbclass
+++ b/meta/classes/sstate.bbclass
@@ -1005,7 +1005,7 @@ def sstate_checkhashes(sq_data, d, siginfo=False, currentcount=0, summary=True,
             tasklist.append((tid, sstatefile))
 
         if tasklist:
-            nproc = min(int(d.getVar("BB_NUMBER_THREADS")), len(tasklist))
+            nproc = len(tasklist)
 
             progress = len(tasklist) >= 100
             if progress:
-- 
2.34.1


