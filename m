Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19084C433EF
	for <webhook@archiver.kernel.org>; Tue,  5 Jul 2022 19:55:21 +0000 (UTC)
Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com
 [209.85.160.171])
 by mx.groups.io with SMTP id smtpd.web12.88752.1657050913827235629
 for <openembedded-core@lists.openembedded.org>;
 Tue, 05 Jul 2022 12:55:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=XGf9lctd;
 spf=pass (domain: gmail.com, ip: 209.85.160.171,
 mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qt1-f171.google.com with SMTP id r2so15307734qta.0
        for <openembedded-core@lists.openembedded.org>;
 Tue, 05 Jul 2022 12:55:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=LaTI4Abh9EkFYXND3+cnLxi1TmEf8t2wdaw3yD73B7E=;
        b=XGf9lctd4yR9eTwWwgXAET/OioU2lLKzevPDbfQ9nEXOnxLQWMo1DMO/bAA35fy/Oh
         0+WFBwkWuow0ym+uq50wQSRohhRp1PwlJdORT7bRpI34caTw5KoPsGcxiAMEgGUgF2Ie
         pbpvTC8IyGZSHxi/S1EiV/7feJmWEYhT8y/bbf1WSsn8XE2VhR1jBpufFhgPEALis+s7
         XT73NerPB5LN0Jh+gpkVvqaTYhjqyQFgB3qy9HL6AQdf48dCT6HvGHiI5tHk7/9H/5bi
         9MnAn6hV4Fe29MoxJ1BzrFPt4+ZeRHUGFU/4cEMEii4w8tV6TP1I0QrotHQDRz6IcKE1
         YGVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=LaTI4Abh9EkFYXND3+cnLxi1TmEf8t2wdaw3yD73B7E=;
        b=rbgh4VIDON3MhTouwLzntoriVNUlVprihNkyOOb5WQab7JnO3CfeI2BmjDXxtn/6Ig
         Pyko1ZFgzl0tD9o8/vZ6gOymUtKmbxA3qS8zvw1oezqmYLkkyJvqG94xHZm/7LNmGvxG
         a3kknnfycNaa0wlHRFEBp/vqfc5TZB94s0CrEntVlb29mJKxTfrD+ljswMOZUeD3pgQY
         pCpiUBLGyzrF9L2jPtDTX0zXHSPev+OoVU0wlWkevsfaxRH0qd1RTnYHT7Dp5O2iCNIy
         NudCWiveXOZVec7njZmjLk2BUqqiKNJnxOJCruRU2jlyUCFjhKblgpo+mxqXcBOHqVQW
         Odpw==
X-Gm-Message-State: AJIora+LqC7IwH8x/lpY9vSPK6AWUP3VdJ1nexeeOiHj8/kRlGJiK01y
	hjU7Stzevzrt3VqvWxvARi8=
X-Google-Smtp-Source: 
 AGRyM1sRJozQocWN0YqHU22Yk+VxT6fPj1FZq9PmlepBZk+lb1kRANmhwbf31oPqmd1Z5Bp6l9cERA==
X-Received: by 2002:a05:6214:c66:b0:470:5251:cb4d with SMTP id
 t6-20020a0562140c6600b004705251cb4dmr33364270qvj.131.1657050912673;
        Tue, 05 Jul 2022 12:55:12 -0700 (PDT)
Received: from build.lan ([173.34.88.218])
        by smtp.gmail.com with ESMTPSA id
 l5-20020a05620a28c500b006b258b73eeesm11572779qkp.120.2022.07.05.12.55.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Jul 2022 12:55:11 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH] kernel-devsrc: fix reproducibility and buildpaths QA warning
Date: Tue,  5 Jul 2022 15:55:09 -0400
Message-Id: <20220705195509.23628-1-bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 05 Jul 2022 19:55:21 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167679

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
---
 meta/recipes-kernel/linux/kernel-devsrc.bb | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-kernel/linux/kernel-devsrc.bb b/meta/recipes-kernel/linux/kernel-devsrc.bb
index 76b8f8dad2..58cba9400a 100644
--- a/meta/recipes-kernel/linux/kernel-devsrc.bb
+++ b/meta/recipes-kernel/linux/kernel-devsrc.bb
@@ -142,8 +142,10 @@ do_install() {
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
2.19.1


